object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 656
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 785
    Height = 233
    DataSource = DataConnection.DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 561
    Top = 255
    Width = 240
    Height = 25
    DataSource = DataConnection.DataSource1
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 288
    Width = 785
    Height = 177
    DataSource = DataConnection.DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator2: TDBNavigator
    Left = 561
    Top = 471
    Width = 240
    Height = 25
    DataSource = DataConnection.DataSource2
    TabOrder = 3
  end
  object Button1: TButton
    Left = 16
    Top = 488
    Width = 153
    Height = 25
    Caption = 'Gerar SPED'
    TabOrder = 4
    OnClick = Button1Click
  end
end
