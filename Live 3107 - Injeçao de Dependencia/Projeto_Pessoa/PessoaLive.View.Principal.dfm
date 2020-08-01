object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 361
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 29
  object Memo1: TMemo
    Left = 32
    Top = 136
    Width = 609
    Height = 153
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 120
    Top = 96
    Width = 81
    Height = 34
    Caption = 'Fisica'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 248
    Top = 84
    Width = 105
    Height = 30
    Caption = 'Juridica'
    TabOrder = 2
    OnClick = Button2Click
  end
end
