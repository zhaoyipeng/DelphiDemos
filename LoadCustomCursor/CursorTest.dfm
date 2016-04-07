object LoadCursorTestForm: TLoadCursorTestForm
  Left = 0
  Top = 0
  Caption = 'Load Custom Cursor Test'
  ClientHeight = 452
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rzpnl1: TRzPanel
    Left = 70
    Top = 75
    Width = 404
    Height = 305
    TabOrder = 0
    OnMouseMove = rzpnl1MouseMove
    OnPaint = rzpnl1Paint
  end
end
