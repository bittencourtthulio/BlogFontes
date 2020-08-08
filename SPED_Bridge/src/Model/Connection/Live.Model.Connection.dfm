object DataConnection: TDataConnection
  OldCreateOrder = False
  Height = 577
  Width = 906
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:/Projetos/Componentes/SimpleProject/SimpleProjectVCL.' +
        'git/trunk/Database/SimpleProject.db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 168
  end
  object QueryVenda: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM VENDAS')
    Left = 136
    Top = 248
    object QueryVendaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QueryVendaCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'COO'
    end
    object QueryVendaSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
    end
    object QueryVendaACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
    end
    object QueryVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
    end
    object QueryVendaTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
    end
  end
  object QueryVendaItens: TFDQuery
    Active = True
    IndexFieldNames = 'VENDAID'
    MasterSource = DataSource1
    MasterFields = 'ID'
    DetailFields = 'VENDAID'
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM VENDAITENS WHERE VENDAID = :ID')
    Left = 264
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 1
      end>
    object QueryVendaItensID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QueryVendaItensVENDAID: TIntegerField
      FieldName = 'VENDAID'
      Origin = 'VENDAID'
    end
    object QueryVendaItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 255
    end
    object QueryVendaItensVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Precision = 18
    end
    object QueryVendaItensQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
    end
    object QueryVendaItensSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
    end
    object QueryVendaItensACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
    end
    object QueryVendaItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
    end
    object QueryVendaItensTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 304
    Top = 144
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 480
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = QueryVendaItens
    Left = 264
    Top = 320
  end
  object DataSource1: TDataSource
    DataSet = QueryVenda
    Left = 136
    Top = 320
  end
end
