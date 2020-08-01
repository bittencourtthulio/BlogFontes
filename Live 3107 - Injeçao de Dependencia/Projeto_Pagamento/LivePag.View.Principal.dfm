object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 29
  object Label1: TLabel
    Left = 70
    Top = 224
    Width = 69
    Height = 29
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 70
    Top = 64
    Width = 217
    Height = 37
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 64
    Top = 104
    Width = 89
    Height = 57
    Caption = 'Cartao'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 206
    Top = 107
    Width = 115
    Height = 54
    Caption = 'Crediario'
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 304
    Top = 66
    Width = 97
    Height = 17
    Caption = 'Juros'
    TabOrder = 3
  end
end
