object Form31: TForm31
  Left = 0
  Top = 0
  Caption = 'Gif2Png Demo'
  ClientHeight = 161
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 67
    Width = 28
    Height = 13
    Caption = 'Width'
  end
  object Label2: TLabel
    Left = 248
    Top = 67
    Width = 31
    Height = 13
    Caption = 'Height'
  end
  object Button1: TButton
    Left = 512
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtFilename: TEdit
    Left = 24
    Top = 26
    Width = 465
    Height = 21
    TabOrder = 1
    Text = '..\..\Test.gif'
  end
  object edtWidth: TEdit
    Left = 72
    Top = 64
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edtHeight: TEdit
    Left = 312
    Top = 64
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
end
