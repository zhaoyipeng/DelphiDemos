unit RecorderDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media;

const
  AUDIO_FILENAME = 'test.mp3'; // 录音保存的文件名

type
  TRecorderdDemoForm = class(TForm)
    ActionList1: TActionList;
    acStartRecording: TAction;
    acStopRecording: TAction;
    acPlay: TAction;
    acStop: TAction;
    MediaPlayer1: TMediaPlayer;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure acStopExecute(Sender: TObject);
    procedure acStartRecordingExecute(Sender: TObject);
    procedure acPlayExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FMicrophone: TAudioCaptureDevice;
    function HasMicrophone: Boolean;
    function IsMicrophoneRecording: Boolean;
  end;

var
  RecorderdDemoForm: TRecorderdDemoForm;

implementation

uses
  System.IOUtils; // 需要引入

{$R *.fmx}


// 得到不同平台的录音文件保存路径
function GetAudioFileName(const AFileName: string): string;
begin
{$IFDEF ANDROID}
  Result := TPath.GetTempPath + '/' + AFileName;
{$ELSE}
{$IFDEF IOS}
  Result := TPath.GetHomePath + '/Documents/' + AFileName;
{$ELSE}
  Result := AFileName;
{$ENDIF}
{$ENDIF}
end;

procedure TRecorderdDemoForm.acPlayExecute(Sender: TObject);
begin
  if IsMicrophoneRecording then // 如果在录音，则先停止录音
    acStopRecording.Execute;
  // 以下播放录音文件 AUDIO_FILENAME
  MediaPlayer1.FileName := GetAudioFileName(AUDIO_FILENAME);
  MediaPlayer1.Play;
end;

procedure TRecorderdDemoForm.acStartRecordingExecute(Sender: TObject);
begin
  acStop.Execute; // 选择停止录音
  if HasMicrophone then
  begin
    // 准备将录音保存到文件 'test.mp3'
    FMicrophone.FileName := GetAudioFileName(AUDIO_FILENAME);
    try
      FMicrophone.StartCapture; // 开始录音
    except
      ShowMessage('该设备不支持录音操作。');
    end;
  end
  else
    ShowMessage('没有麦克风设备。');
end;

procedure TRecorderdDemoForm.acStopExecute(Sender: TObject);
begin
  MediaPlayer1.Stop;
end;

procedure TRecorderdDemoForm.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  // 判断图片的可见性
  case (HasMicrophone and
    (FMicrophone.State = TCaptureDeviceState.Capturing)) of
    True:
      Label2.Text := '录音';
    False:
      Label2.Text := '停止录音';
  end;
  // 判断 4 个按钮的是否可按下
  acStartRecording.Enabled := not IsMicrophoneRecording and HasMicrophone;
  acStopRecording.Enabled := IsMicrophoneRecording;
  acStop.Enabled := Assigned(MediaPlayer1.Media) and (MediaPlayer1.State =
    TMediaState.Playing);
  acPlay.Enabled := FileExists(GetAudioFileName(AUDIO_FILENAME)) and
    (MediaPlayer1.State <> TMediaState.Playing);
end;

procedure TRecorderdDemoForm.Button1Click(Sender: TObject);
begin
  acStop.Execute; // 选择停止录音
  if HasMicrophone then
  begin
    // 准备将录音保存到文件 'test.mp3'
    FMicrophone.FileName := GetAudioFileName(AUDIO_FILENAME);
    try
      FMicrophone.StartCapture; // 开始录音
    except
      ShowMessage('该设备不支持录音操作。');
    end;
  end
  else
    ShowMessage('没有麦克风设备。');
end;

procedure TRecorderdDemoForm.Button5Click(Sender: TObject);
begin
  if IsMicrophoneRecording then // 如果正在录音
    try
      FMicrophone.StopCapture; { 停止录音 }
    except
      ShowMessage('该设备不支持停止录音操作。');
    end;
end;

// 判断是否有麦克风
procedure TRecorderdDemoForm.FormCreate(Sender: TObject);
begin
  // 初始化录音设备
  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
end;

function TRecorderdDemoForm.HasMicrophone: Boolean;
begin
  Result := Assigned(FMicrophone);
end;

// 判断是否在录音
function TRecorderdDemoForm.IsMicrophoneRecording: Boolean;
begin
  Result := HasMicrophone and
    (FMicrophone.State = TCaptureDeviceState.Capturing);
end;

end.
