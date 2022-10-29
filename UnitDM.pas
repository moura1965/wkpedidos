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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin
   DbPedidos.Connected:=True;
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

end.
