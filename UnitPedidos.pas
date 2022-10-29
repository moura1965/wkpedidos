unit UnitPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,UnitDM,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFormPedidos = class(TForm)
    LabeledEdit1: TLabeledEdit;
    DBLCBxProdutos: TDBLookupComboBox;
    Label1: TLabel;
    DBLCBxClientes: TDBLookupComboBox;
    BtnAdicionarProduto: TBitBtn;
    BtnFinalizarPedido: TBitBtn;
    Label2: TLabel;
    EditQtde: TEdit;
    lblPedido: TLabeledEdit;
    DBGridpedidoprodutos: TDBGrid;
    Label3: TLabel;
    DbeditCodigoproduto: TDBEdit;
    Label4: TLabel;
    MeTotal: TMaskEdit;
    DBEditCodigocliente: TDBEdit;
    procedure BtnAdicionarProdutoClick(Sender: TObject);
    procedure DBLCBxClientesCloseUp(Sender: TObject);
    procedure DBLCBxProdutosCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnFinalizarPedidoClick(Sender: TObject);
  private
    procedure BuscarPedido();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPedidos: TFormPedidos;

implementation

{$R *.dfm}

procedure TFormPedidos.BtnFinalizarPedidoClick(Sender: TObject);

 var
   wcodigocliente : integer;
   TotalGeral   : currency;
   NumeroPedido : integer;
begin
   wcodigocliente:= StrToInt(DBEditCodigocliente.Text);
   NumeroPedido :=strtoint(lblPedido.Text);
   //BUSCAR TOTAL DO PEDIDO

   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;
   DmPrincipal.SQLQryGenerica.SQL.Add('SELECT sum(qtde*precovenda) as totalgeral FROM pedidosprodutos as pe,produtos as pr where pe.codigoproduto=pr.codigoproduto  and numeropedido=:pnumeropedido');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pnumeropedido').AsInteger:=NumeroPedido;
   DmPrincipal.SQLQryGenerica.Open;
   TotalGeral:=DmPrincipal.SQLQryGenerica.FieldByName('totalgeral').AsCurrency;
  // MeTotal.Text:= FormatFloat('R$ #,,,,0.00',TotalGeral);


   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;

   DmPrincipal.SQLQryGenerica.SQL.ADD('INSERT INTO pedidos(numeropedido, dataemissao, codigocliente, valortotal) VALUES(:pnumeropedido, :pdataemissao, :pcodigocliente, :pvalortotal)');
//   DmPrincipal.SQLQryGenerica.SQL.ADD('INSERT INTO pedidosprodutos(numeropedido, codigoproduto, qtde) VALUES(:pnumeropedido, :pcodigoproduto, :pqtde)');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pnumeropedido').AsInteger:=StrToInt(lblPedido.Text);
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pdataemissao').AsDateTime:=Now();//StrToDateTime(FormatDateTime('yyyy-mm-dd hh:MM:ss', Now));//StrToDateTime('2022-10-28 00:00:00');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pcodigocliente').AsInteger:=wcodigocliente;
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pvalortotal').AsCurrency:=TotalGeral;
   DmPrincipal.SQLQryGenerica.ExecSQL;
   ShowMessage('Pedido Concluido !! Nr -> '+lblPedido.text);
   BuscarPedido();
   DBGridpedidoprodutos.Refresh;



   Close;
end;

procedure TFormPedidos.BtnAdicionarProdutoClick(Sender: TObject);
var
   wcodigoproduto : integer;
begin
   wcodigoproduto:= StrToInt(DbeditCodigoproduto.Text);
   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;
   DmPrincipal.SQLQryGenerica.SQL.ADD('INSERT INTO pedidosprodutos(numeropedido, codigoproduto, qtde) VALUES(:pnumeropedido, :pcodigoproduto, :pqtde)');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pnumeropedido').AsInteger:=StrToInt(lblPedido.Text);
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pcodigoproduto').AsInteger:=wcodigoproduto;
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pqtde').AsInteger:=StrToInt(EditQtde.Text);
   DmPrincipal.SQLQryGenerica.ExecSQL;
   BuscarPedido();
   DBGridpedidoprodutos.Refresh;
   ShowMessage('Produto Adicionado ao Pedido!! Nr -> '+lblPedido.text);


end;

procedure TFormPedidos.DBLCBxProdutosCloseUp(Sender: TObject);
begin
   EditQtde.SetFocus;
end;

procedure TFormPedidos.DBLCBxClientesCloseUp(Sender: TObject);
begin
    DBLCBxProdutos.SetFocus;
end;

procedure TFormPedidos.FormCreate(Sender: TObject);
var
   NumeroPedido : integer;
begin

 BuscarPedido();

end;

procedure TFormPedidos.BuscarPedido();
var
   NumeroPedido : integer;
   TotalGeral   : currency;
begin

   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;
   DmPrincipal.SQLQryGenerica.SQL.ADD('SHOW TABLE STATUS LIKE '+QuotedStr('pedidos'));
   DmPrincipal.SQLQryGenerica.Open;
   NumeroPedido:=DmPrincipal.SQLQryGenerica.FieldByName('Auto_increment').Value;
   lblPedido.Text:=IntToStr(NumeroPedido);

   DmPrincipal.SQLQrypedidosprodutos.Close;
   DmPrincipal.SQLQrypedidosprodutos.SQL.CLEAR;
//   DmPrincipal.SQLQrypedidosprodutos.SQL.Add(' Select * from pedidosprodutos where numeropedido=:pnumeropedido');
  DmPrincipal.SQLQrypedidosprodutos.SQL.Add('SELECT *,qtde*precovenda as total FROM pedidosprodutos as pe,produtos as pr where pe.codigoproduto=pr.codigoproduto  and numeropedido=:pnumeropedido');
  DmPrincipal.SQLQrypedidosprodutos.Params.ParamByName('pnumeropedido').AsInteger:=NumeroPedido;
   DmPrincipal.SQLQrypedidosprodutos.Open;


   DmPrincipal.ClientDataSetpedidosprodutos.Active:=False;
   DmPrincipal.ClientDataSetpedidosprodutos.Active:=True;

   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;
   DmPrincipal.SQLQryGenerica.SQL.Add('SELECT sum(qtde*precovenda) as totalgeral FROM pedidosprodutos as pe,produtos as pr where pe.codigoproduto=pr.codigoproduto  and numeropedido=:pnumeropedido');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pnumeropedido').AsInteger:=NumeroPedido;
   DmPrincipal.SQLQryGenerica.Open;
   TotalGeral:=DmPrincipal.SQLQryGenerica.FieldByName('totalgeral').AsCurrency;
   MeTotal.Text:= FormatFloat('R$ #,,,,0.00',TotalGeral);



end;


end.
