object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 246
  ClientWidth = 475
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
  object Memo1: TMemo
    Left = 8
    Top = 47
    Width = 457
    Height = 185
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 233
    Height = 25
    Caption = 'Pessoa Fisica'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 247
    Top = 16
    Width = 218
    Height = 25
    Caption = 'Pessoa Juridica'
    TabOrder = 2
    OnClick = Button2Click
  end
end
