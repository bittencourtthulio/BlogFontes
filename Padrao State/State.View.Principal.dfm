object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
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
  object Button1: TButton
    Left = 64
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Vendido'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Inativo'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 64
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Vender'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 168
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 280
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Desconto'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 384
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Devolver'
    TabOrder = 6
    OnClick = Button7Click
  end
end
