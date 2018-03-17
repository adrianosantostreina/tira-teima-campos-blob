object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 651
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Ler'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Foto'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 216
    Top = 16
    Width = 153
    Height = 25
    Caption = 'ApplyUpdates'
    TabOrder = 2
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 88
    Width = 481
    Height = 273
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 55
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBImage1: TDBImage
    Left = 503
    Top = 88
    Width = 282
    Height = 273
    DataField = 'FOTO'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 432
    Width = 489
    Height = 165
    DataSource = DataSource2
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 8
    Top = 603
    Width = 240
    Height = 25
    TabOrder = 7
  end
  object DBImage2: TDBImage
    Left = 504
    Top = 432
    Width = 249
    Height = 196
    DataField = 'FOTO'
    DataSource = DataSource2
    TabOrder = 8
  end
  object Button4: TButton
    Left = 8
    Top = 401
    Width = 217
    Height = 25
    Caption = 'Inserir dados por ArrayDML'
    TabOrder = 9
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 280
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 10
    OnClick = Button5Click
  end
  object DataSource1: TDataSource
    DataSet = memUsuarios
    Left = 152
    Top = 192
  end
  object memUsuarios: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 120
    object memUsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object memUsuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object memUsuariosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 680
    Top = 24
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 336
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = qryUsuarios
    Left = 192
    Top = 528
  end
  object qryUsuarios: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 152
    Top = 456
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
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 448
    Top = 328
  end
  object fdConn: TFDConnection
    Params.Strings = (
      'Database=C:\Lives\Tira-Teima\Campo Blob\Database\TDevRocks.s3db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 152
    Top = 392
  end
end
