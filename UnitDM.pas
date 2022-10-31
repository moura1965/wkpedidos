unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXMySQL,
  Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient;

type
  TDmPrincipal = class(TDataModule)
    DbPedidos: TSQLConnection;
    SQLQRyProdutos: TSQLQuery;
    DSProdutos: TDataSource;
    SQLQRyProdutoscodigoproduto: TIntegerField;
    SQLQRyProdutosdescricao: TStringField;
    SQLQRyProdutosprecovenda: TFMTBCDField;
    ProviderProdutos: TDataSetProvider;
    ClientDataSetProdutos: TClientDataSet;
    ClientDataSetProdutoscodigoproduto: TIntegerField;
    ClientDataSetProdutosdescricao: TStringField;
    ClientDataSetProdutosprecovenda: TFMTBCDField;
    SQLQuery2: TSQLQuery;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    SQLQuery2codigo: TIntegerField;
    SQLQuery2nome: TStringField;
    SQLQuery2cidade: TStringField;
    SQLQuery2uf: TStringField;
    ClientDataSet2codigo: TIntegerField;
    ClientDataSet2nome: TStringField;
    ClientDataSet2cidade: TStringField;
    ClientDataSet2uf: TStringField;
    SQLQrypedidosprodutos: TSQLQuery;
    DSspedidosprodutos: TDataSource;
    Providerpedidosprodutos: TDataSetProvider;
    ClientDataSetpedidosprodutos: TClientDataSet;
    SQLQrypedidosprodutosiditem: TIntegerField;
    SQLQrypedidosprodutosnumeropedido: TIntegerField;
    SQLQrypedidosprodutoscodigoproduto: TIntegerField;
    SQLQrypedidosprodutosqtde: TIntegerField;
    ClientDataSetpedidosprodutosiditem: TIntegerField;
    ClientDataSetpedidosprodutosnumeropedido: TIntegerField;
    ClientDataSetpedidosprodutoscodigoproduto: TIntegerField;
    ClientDataSetpedidosprodutosqtde: TIntegerField;
    SQLQryGenerica: TSQLQuery;
    SQLQrypedidosprodutoscodigoproduto_1: TIntegerField;
    SQLQrypedidosprodutosdescricao: TStringField;
    SQLQrypedidosprodutosprecovenda: TFMTBCDField;
    ClientDataSetpedidosprodutoscodigoproduto_1: TIntegerField;
    ClientDataSetpedidosprodutosdescricao: TStringField;
    ClientDataSetpedidosprodutosprecovenda: TFMTBCDField;
    SQLQrypedidosprodutostotal: TFMTBCDField;
    ClientDataSetpedidosprodutostotal: TFMTBCDField;
    SQLStoProcApagarItem: TSQLStoredProc;
    SQLStoProcUpdateItem: TSQLStoredProc;
    SQLStoProcInsererepedidosprodutos: TSQLStoredProc;
    SQLQueryPedidos: TSQLQuery;
    DataSourcePedidos: TDataSource;
    DataSetProviderPedidos: TDataSetProvider;
    ClientDataSetPedidos: TClientDataSet;
    SQLQueryPedidosnumeropedido: TIntegerField;
    SQLQueryPedidosdataemissao: TSQLTimeStampField;
    SQLQueryPedidoscodigocliente: TIntegerField;
    SQLQueryPedidosvalortotal: TFMTBCDField;
    SQLQueryPedidoscodigo: TIntegerField;
    SQLQueryPedidosnome: TStringField;
    SQLQueryPedidoscidade: TStringField;
    SQLQueryPedidosuf: TStringField;
    ClientDataSetPedidosnumeropedido: TIntegerField;
    ClientDataSetPedidosdataemissao: TSQLTimeStampField;
    ClientDataSetPedidosvalortotal: TFMTBCDField;
    ClientDataSetPedidoscodigo: TIntegerField;
    ClientDataSetPedidosnome: TStringField;
    ClientDataSetPedidoscidade: TStringField;
    ClientDataSetPedidosuf: TStringField;
    ClientDataSetPedidoscodigocliente: TIntegerField;
    SQLQuery1: TSQLQuery;
    IntegerField1: TIntegerField;
    SQLTimeStampField1: TSQLTimeStampField;
    FMTBCDField1: TFMTBCDField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    IntegerField4: TIntegerField;
    SQLTimeStampField2: TSQLTimeStampField;
    FMTBCDField2: TFMTBCDField;
    IntegerField5: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField6: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DbPedidosBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitPrincipal;

{$R *.dfm}

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin

   //SQLQryClientes.Sql.Clear;
   //SQLQryClientes.Sql.Add(' Select * from clientes');
   //SQLQryClientes.Open;
   //ClientDataSetClientes.Active:=True;

   SQLQryProdutos.Close;
   SQLQryProdutos.Sql.Clear;
   SQLQryProdutos.Sql.Add(' Select * from produtos order by descricao asc');
   SQLQryProdutos.Open;
   ClientDataSetProdutos.Active:=True;

end;

procedure TDmPrincipal.DbPedidosBeforeConnect(Sender: TObject);
begin
  if fileexists('DBConfig.txt') then
  begin
     FormPrincipal.MemoConfig.Lines.LoadFromFile('DBConfig.txt');
     DbPedidos.Params.Values['HostName']:=FormPrincipal.MemoConfig.Lines[0];
     DbPedidos.Params.Values['DataBase']:=FormPrincipal.MemoConfig.Lines[1];
     DbPedidos.Params.Values['User_Name']:=FormPrincipal.MemoConfig.Lines[2];
     if FormPrincipal.MemoConfig.Lines[3] <> '.' then
        DbPedidos.Params.Values['Password']:=FormPrincipal.MemoConfig.Lines[3];

  end;


end;

end.
