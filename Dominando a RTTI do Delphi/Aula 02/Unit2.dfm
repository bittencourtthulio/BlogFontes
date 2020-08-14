object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 323
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 16
    Top = 13
    Width = 352
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 16
    Top = 271
    Width = 352
    Height = 25
    Caption = 'Executar M'#233'todo'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 40
    Width = 161
    Height = 225
    ItemHeight = 13
    Items.Strings = (
      'Mensagem'
      'ValorNulo'
      'CFOP'
      'ST'
      'NCM')
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 183
    Top = 40
    Width = 185
    Height = 225
    TabOrder = 3
  end
end
