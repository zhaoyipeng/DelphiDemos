unit FMain;

{                     32-bit iPad 3                 64-bit iPad 3
                "Normal"  "Fast"  "SIMD"     "Normal"  "Fast"  "SIMD"
  1080 x 1920      13.97   26.66   30.00        15.81   28.91   30.00
  +Display         10.96   17.68   26.53        12.30   18.67   27.00
  1936 x 2592       6.03   11.81   24.11         6.73   12.37   24.02
  +Display          4.76    7.61   12.97         5.24    8.18   14.02

                      Android TF300
                "Normal"  "Fast"  "SIMD"
  480 x 640         5.40   15.44   16.70
  +Display          5.23   15.10   16.66
  960 x 1280        1.61    3.87   13.69
  +Display          1.72    3.85    9.00
}

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  System.Diagnostics,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.ExtCtrls,
  FMX.Controls.Presentation,
  FMX.Media,
  FMX.ImgList,
  FMX.Layouts,
  FMX.Objects;

type
  TFormMain = class(TForm)
    ToolBar: TToolBar;
    PopupBoxSetting: TPopupBox;
    ButtonSwitchCamera: TButton;
    ImageList: TImageList;
    LayoutSetting: TLayout;
    CheckBoxDisplay: TCheckBox;
    StatusBar: TStatusBar;
    LabelFPS: TLabel;
    PaintBox: TPaintBox;
    LabelSetting: TLabel;
    CameraComponent: TCameraComponent;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject; Canvas: TCanvas);
    procedure ButtonSwitchCameraClick(Sender: TObject);
    procedure PopupBoxSettingChange(Sender: TObject);
    procedure CheckBoxDisplayChange(Sender: TObject);
    procedure CameraComponentSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
  private
    { Private declarations }
    FCaptureSettings: TArray<TVideoCaptureSetting>;
    FBitmap: TBitmap;
    FStopwatch: TStopwatch;
    FFrameCount: Integer;
    FUpdating: Boolean;
    procedure UpdateCaptureSettings;
    procedure ResetCapture;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.Windows.fmx MSWINDOWS}
{$R *.NmXhdpiPh.fmx ANDROID}

uses
  System.Generics.Collections,
  System.Generics.Defaults;

procedure TFormMain.ButtonSwitchCameraClick(Sender: TObject);
begin
  if (CameraComponent.Kind = TCameraKind.FrontCamera) then
    CameraComponent.Kind := TCameraKind.BackCamera
  else
    CameraComponent.Kind := TCameraKind.FrontCamera;

  UpdateCaptureSettings;
  ResetCapture;
end;

procedure TFormMain.CameraComponentSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
var
  Sec:  Double;
begin
  CameraComponent.SampleBufferToBitmap(FBitmap, True);

  if (CheckBoxDisplay.IsChecked) then
    PaintBox.Repaint;

  Sec := FStopwatch.Elapsed.TotalSeconds;

  { Ignore the first 3 seconds to get up to speed }
  if (Sec > 3) then
  begin
    Sec := Sec - 3;
    Inc(FFrameCount);
    LabelFPS.Text := Format('%.2f fps (%d x %d)', [FFrameCount / Sec, FBitmap.Width, FBitmap.Height]);
  end;
end;

procedure TFormMain.CheckBoxDisplayChange(Sender: TObject);
begin
  ResetCapture;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ToolBar.Height := ToolBar.DefaultSize.Height;
  CheckBoxDisplay.Height := CheckBoxDisplay.DefaultSize.Height * 2;
  PopupBoxSetting.Height := PopupBoxSetting.DefaultSize.Height;

  FBitmap := TBitmap.Create;
  CameraComponent.Quality := TVideoCaptureQuality.CaptureSettings;
  UpdateCaptureSettings;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FBitmap.Free;
end;

procedure TFormMain.PaintBoxPaint(Sender: TObject; Canvas: TCanvas);
var
  SR, DR, PR: TRectF;
begin
  if (CheckBoxDisplay.IsChecked) then
  begin
    PR := RectF(0, 0, PaintBox.Width, PaintBox.Height);
    Canvas.Fill.Kind := TBrushKind.Solid;
    Canvas.Fill.Color := TAlphaColors.Black;
    Canvas.FillRect(PR, 0, 0, [], 1);

    if (FBitmap.Width > 0) then
    begin
      SR := RectF(0, 0, FBitmap.Width, FBitmap.Height);
      DR := SR;
      if (DR.Width < PaintBox.Width) and (DR.Height < PaintBox.Height) then
        RectCenter(DR, PR)
      else
        DR := DR.FitInto(PR);
      Canvas.DrawBitmap(FBitmap, SR, DR, 1);
    end;
  end;
end;

procedure TFormMain.PopupBoxSettingChange(Sender: TObject);
var
  Setting: TVideoCaptureSetting;
begin
  if (FUpdating) then
    Exit;

  if (PopupBoxSetting.ItemIndex < 0) or (PopupBoxSetting.ItemIndex >= Length(FCaptureSettings)) then
    Exit;

  Setting := FCaptureSettings[PopupBoxSetting.ItemIndex];

  CameraComponent.Active := False;
  CameraComponent.CaptureSetting := Setting;
  CameraComponent.Active := True;

  ResetCapture;
end;

procedure TFormMain.ResetCapture;
begin
  LabelFPS.Text := 'Starting capture...';
  FFrameCount := 0;
  FStopwatch := TStopwatch.StartNew;
end;

procedure TFormMain.UpdateCaptureSettings;
var
  Setting, MaxSetting: TVideoCaptureSetting;
  UsefulSettings: TDictionary<TSize, TVideoCaptureSetting>;
  Size: TSize;
  I: Integer;
begin
  { GetAvailableCaptureSettings can return A LOT of settings. For each supported
    resolution, it can return a large number of settings with different frame
    rates. We only care about the highest framerate supported by each
    resolution. We use a dictionary to keep track of this. }
  UsefulSettings := TDictionary<TSize, TVideoCaptureSetting>.Create;
  try
    for Setting in CameraComponent.GetDefaultCanvasCaptureSettings do
    begin
      Size := TSize.Create(Setting.Width, Setting.Height);
      if (UsefulSettings.TryGetValue(Size, MaxSetting)) then
      begin
        { Dictionary contains requested resolution. Update its framerate to the
          maximum supported one. }
        if (Setting.FrameRate > MaxSetting.FrameRate) then
          UsefulSettings.AddOrSetValue(Size, Setting);
      end
      else
        UsefulSettings.Add(Size, Setting);
    end;

    { Now we can get a list of settings, with only one per resolution. We sort it
      maually by resolution. }
    FCaptureSettings := UsefulSettings.Values.ToArray;
    TArray.Sort<TVideoCaptureSetting>(FCaptureSettings,
      TComparer<TVideoCaptureSetting>.Construct(
        function (const Left, Right: TVideoCaptureSetting): Integer
        var
          Difference: Integer;
        begin
          Difference := (Left.Width * Left.Height) - (Right.Width * Right.Height);
          if (Difference < 0) then
            Result := 1
          else if (Difference > 0) then
            Result := -1
          else
            Result := 0;
        end));
  finally
    UsefulSettings.Free;
  end;

  { Populate popup box with settings }
  FUpdating := True;
  try
    PopupBoxSetting.BeginUpdate;
    try
      PopupBoxSetting.Items.Clear;
      for I := 0 to Length(FCaptureSettings) - 1 do
      begin
        Setting := FCaptureSettings[I];
        PopupBoxSetting.Items.Add(Format('%d x %d', [Setting.Width, Setting.Height]));
      end;
    finally
      PopupBoxSetting.EndUpdate;
    end;
    PopupBoxSetting.ItemIndex := -1;
  finally
    FUpdating := False;
  end;
end;

end.
