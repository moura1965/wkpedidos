object DmPrincipal: TDmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 432
  Width = 822
  object DbPedidos: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=wkpedidos'
      'User_Name=root'
      'Password='
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    BeforeConnect = DbPedidosBeforeConnect
    Connected = True
    Left = 40
    Top = 56
  end
  object SQLQRyProdutos: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from produtos order by descricao')
    SQLConnection = DbPedidos
    Left = 120
    Top = 56
    object SQLQRyProdutoscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      Required = True
    end
    object SQLQRyProdutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object SQLQRyProdutosprecovenda: TFMTBCDField
      FieldName = 'precovenda'
      Required = True
      Precision = 17
      Size = 2
    end
  end
  object DSProdutos: TDataSource
    DataSet = ClientDataSetProdutos
    Left = 120
    Top = 120
  end
  object ProviderProdutos: TDataSetProvider
    DataSet = SQLQRyProdutos
    Left = 120
    Top = 176
  end
  object ClientDataSetProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'ProviderProdutos'
    Left = 120
    Top = 232
    object ClientDataSetProdutoscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      Required = True
    end
    object ClientDataSetProdutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object ClientDataSetProdutosprecovenda: TFMTBCDField
      FieldName = 'precovenda'
      Required = True
      Precision = 17
      Size = 2
    end
  end
  object SQLQuery2: TSQLQuery
    GetMetadata = True
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from clientes order by nome')
    SQLConnection = DbPedidos
    Left = 208
    Top = 64
    object SQLQuery2codigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object SQLQuery2nome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQuery2cidade: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object SQLQuery2uf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 208
    Top = 120
  end
  object ClientDataSet2: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 224
    Top = 240
    object ClientDataSet2codigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object ClientDataSet2nome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object ClientDataSet2cidade: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object ClientDataSet2uf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery2
    Left = 224
    Top = 192
  end
  object SQLQrypedidosprodutos: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT *,qtde*precovenda as total FROM pedidosprodutos as pe,pro' +
        'dutos as pr where pe.codigoproduto=pr.codigoproduto and numerope' +
        'dido = 1')
    SQLConnection = DbPedidos
    Left = 312
    Top = 64
    object SQLQrypedidosprodutosiditem: TIntegerField
      FieldName = 'iditem'
      Required = True
    end
    object SQLQrypedidosprodutosnumeropedido: TIntegerField
      FieldName = 'numeropedido'
      Required = True
    end
    object SQLQrypedidosprodutoscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      Required = True
    end
    object SQLQrypedidosprodutosqtde: TIntegerField
      FieldName = 'qtde'
      Required = True
    end
    object SQLQrypedidosprodutoscodigoproduto_1: TIntegerField
      FieldName = 'codigoproduto_1'
      Required = True
    end
    object SQLQrypedidosprodutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object SQLQrypedidosprodutosprecovenda: TFMTBCDField
      FieldName = 'precovenda'
      Required = True
      Precision = 17
      Size = 2
    end
    object SQLQrypedidosprodutostotal: TFMTBCDField
      FieldName = 'total'
      Required = True
      Precision = 27
      Size = 2
    end
  end
  object DSspedidosprodutos: TDataSource
    DataSet = ClientDataSetpedidosprodutos
    Left = 312
    Top = 128
  end
  object Providerpedidosprodutos: TDataSetProvider
    DataSet = SQLQrypedidosprodutos
    Left = 312
    Top = 184
  end
  object ClientDataSetpedidosprodutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'Providerpedidosprodutos'
    Left = 320
    Top = 240
    object ClientDataSetpedidosprodutosiditem: TIntegerField
      FieldName = 'iditem'
      Required = True
    end
    object ClientDataSetpedidosprodutosnumeropedido: TIntegerField
      FieldName = 'numeropedido'
      Required = True
    end
    object ClientDataSetpedidosprodutoscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      Required = True
    end
    object ClientDataSetpedidosprodutosqtde: TIntegerField
      FieldName = 'qtde'
      Required = True
    end
    object ClientDataSetpedidosprodutoscodigoproduto_1: TIntegerField
      FieldName = 'codigoproduto_1'
      Required = True
    end
    object ClientDataSetpedidosprodutosdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object ClientDataSetpedidosprodutosprecovenda: TFMTBCDField
      FieldName = 'precovenda'
      Required = True
      Precision = 17
      Size = 2
    end
    object ClientDataSetpedidosprodutostotal: TFMTBCDField
      FieldName = 'total'
      Required = True
      Precision = 27
      Size = 2
    end
  end
  object SQLQryGenerica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DbPedidos
    Left = 80
    Top = 312
  end
  object SQLStoProcApagarItem: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'piditem'
        ParamType = ptInput
      end>
    SQLConnection = DbPedidos
    StoredProcName = 'ApagarItem'
    Left = 168
    Top = 312
  end
  object SQLStoProcUpdateItem: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'pqtde'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        Name = 'pvalor_unitario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'piditem'
        ParamType = ptInput
      end>
    SQLConnection = DbPedidos
    StoredProcName = 'updatepedidosprodutos'
    Left = 240
    Top = 312
  end
  object SQLStoProcInsererepedidosprodutos: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'pcodigoproduto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'pnumeropedido'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'pqtde'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        Name = 'pvalor_unitario'
        ParamType = ptInput
      end>
    SQLConnection = DbPedidos
    StoredProcName = 'spInserePedidosprodutos'
    Left = 344
    Top = 320
  end
  object SQLQueryPedidos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pnumeropedido'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT *  FROM pedidos as pe,clientes as cl where pe.codigoclien' +
        'te=cl.codigo AND numeropedido=:pnumeropedido')
    SQLConnection = DbPedidos
    Left = 472
    Top = 72
    object SQLQueryPedidosnumeropedido: TIntegerField
      FieldName = 'numeropedido'
      Required = True
    end
    object SQLQueryPedidosdataemissao: TSQLTimeStampField
      FieldName = 'dataemissao'
      Required = True
    end
    object SQLQueryPedidosvalortotal: TFMTBCDField
      FieldName = 'valortotal'
      Required = True
      Precision = 17
      Size = 2
    end
    object SQLQueryPedidoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object SQLQueryPedidosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object SQLQueryPedidoscidade: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object SQLQueryPedidosuf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object SQLQueryPedidoscodigocliente: TIntegerField
      FieldName = 'codigocliente'
      Required = True
    end
  end
  object DataSourcePedidos: TDataSource
    DataSet = ClientDataSetPedidos
    Left = 472
    Top = 136
  end
  object DataSetProviderPedidos: TDataSetProvider
    DataSet = SQLQueryPedidos
    Left = 472
    Top = 192
  end
  object ClientDataSetPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderPedidos'
    Left = 480
    Top = 248
    object ClientDataSetPedidosnumeropedido: TIntegerField
      FieldName = 'numeropedido'
      Required = True
    end
    object ClientDataSetPedidosdataemissao: TSQLTimeStampField
      FieldName = 'dataemissao'
      Required = True
    end
    object ClientDataSetPedidosvalortotal: TFMTBCDField
      FieldName = 'valortotal'
      Required = True
      Precision = 17
      Size = 2
    end
    object ClientDataSetPedidoscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object ClientDataSetPedidosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object ClientDataSetPedidoscidade: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object ClientDataSetPedidosuf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object ClientDataSetPedidoscodigocliente: TIntegerField
      FieldName = 'codigocliente'
      Required = True
    end
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT *  FROM pedidos as pe,clientes as cl where pe.codigoclien' +
        'te=cl.codigo')
    SQLConnection = DbPedidos
    Left = 624
    Top = 80
    object IntegerField1: TIntegerField
      FieldName = 'numeropedido'
      Required = True
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'dataemissao'
      Required = True
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'valortotal'
      Required = True
      Precision = 17
      Size = 2
    end
    object IntegerField2: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object IntegerField3: TIntegerField
      FieldName = 'codigocliente'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 624
    Top = 144
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 624
    Top = 200
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderPedidos'
    Left = 632
    Top = 256
    object IntegerField4: TIntegerField
      FieldName = 'numeropedido'
      Required = True
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'dataemissao'
      Required = True
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'valortotal'
      Required = True
      Precision = 17
      Size = 2
    end
    object IntegerField5: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object IntegerField6: TIntegerField
      FieldName = 'codigocliente'
      Required = True
    end
  end
end
