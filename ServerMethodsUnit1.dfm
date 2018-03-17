object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 404
  Width = 625
  object fdConn: TFDConnection
    Params.Strings = (
      'Database=TDEVROCKS'
      'User_Name=sa'
      'Password=s32]4]381a'
      'Server=192.168.1.90'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object qryUsuarios: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 88
    Top = 144
    object qryUsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryUsuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object qryUsuariosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 480
    Top = 48
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 480
    Top = 120
  end
end
