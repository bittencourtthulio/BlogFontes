object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 325
  ClientWidth = 495
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
    Top = 97
    Width = 457
    Height = 177
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtID: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtID'
  end
  object edtName: TEdit
    Left = 16
    Top = 43
    Width = 457
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object edtPhone: TEdit
    Left = 16
    Top = 70
    Width = 225
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object edtOccupation: TEdit
    Left = 256
    Top = 70
    Width = 217
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 368
    Top = 280
    Width = 105
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 136
    Top = 200
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:/Projetos/Componentes/SimpleProject/SimpleProjectVCL.' +
        'git/trunk/Database/SimpleProject.db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 208
    Top = 200
  end
end
