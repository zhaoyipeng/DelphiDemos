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
  object pnlCanvas: TPaintBox
    Left = 70
    Top = 75
    Width = 404
    Height = 305
    OnMouseMove = pnlCanvasMouseMove
    OnPaint = pnlCanvasPaint
  end
end
