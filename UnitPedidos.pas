unit UnitPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,UnitDM,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,UnitClasspedidosprodutos;

type
  TFormPedidos = class(TForm)
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
    Label5: TLabel;
    EditValor: TEdit;
    Label6: TLabel;
    BtnInsereviatransacaoo: TBitBtn;
    BtnGravarcomClasssse: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BtnAdicionarProdutoClick(Sender: TObject);
    procedure DBLCBxClientesCloseUp(Sender: TObject);
    procedure DBLCBxProdutosCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnFinalizarPedidoClick(Sender: TObject);
    procedure DBGridpedidoprodutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnInsereviatransacaooClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure BuscarPedido();
    function ApagarItem(iditem: Integer): Boolean;
    function UpdateItem(iditem, qtde: integer;
      valor_unitario: Currency): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPedidos: TFormPedidos;

implementation

{$R *.dfm}

uses UnitConsultaPedidos;

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

procedure TFormPedidos.BtnInsereviatransacaooClick(Sender: TObject);
var
   wcodigoproduto : integer;
   cPedidosprodutos : Tpedidosprodutos;

begin


  cPedidosprodutos:= Tpedidosprodutos.Create;
  cPedidosprodutos.codigoproduto:=StrToInt(DbeditCodigoproduto.Text);
  cPedidosprodutos.numeropedido:=StrToInt(lblPedido.Text);
  cPedidosprodutos.qtde:=StrToInt(EditQtde.Text);
  cPedidosprodutos.valor_unitario:=StrToCurr(EditValor.Text);
  cPedidosprodutos.GravarPedidosproduto(StrToInt(lblPedido.Text));

 //  wcodigoproduto:=StrToInt(DbeditCodigoproduto.Text);

   BuscarPedido();
   DBGridpedidoprodutos.Refresh;
   ShowMessage('Produto Adicionado ao Pedido!! Nr -> '+lblPedido.text);


end;

procedure TFormPedidos.BitBtn1Click(Sender: TObject);
  var Valores : Tarray<string>;
       pnumeropedido : integer;
begin
SetLength(valores,1);
      if  InputQuery('Pedido a ser consultado',[ 'Informe o Numero do Pedido'], Valores) then
        begin
          pnumeropedido:=strtoint(Valores[0]);
          FormConsultaPedidos.EditNUmeropedido.Text:=inttostr(pnumeropedido);
          DmPrincipal.SQLQueryPedidos.Close;
          DmPrincipal.SQLQueryPedidos.Params.ParamByName('pnumeropedido').Value:=pnumeropedido;
          DmPrincipal.ClientDataSetPedidos.Active:=False;
          DmPrincipal.SQLQueryPedidos.open;
          DmPrincipal.ClientDataSetPedidos.Active:=TRUE;
          //DmPrincipal.DBGridPedidos.Refresh;


            DmPrincipal.SQLQrypedidosprodutos.Close;
            DmPrincipal.SQLQrypedidosprodutos.SQL.CLEAR;
            DmPrincipal.SQLQrypedidosprodutos.SQL.Add('SELECT *,qtde*precovenda as total FROM pedidosprodutos as pe,produtos as pr where pe.codigoproduto=pr.codigoproduto  and numeropedido=:pnumeropedido');
            DmPrincipal.SQLQrypedidosprodutos.Params.ParamByName('pnumeropedido').AsInteger:=pnumeropedido;
            DmPrincipal.SQLQrypedidosprodutos.Open;
            DmPrincipal.ClientDataSetpedidosprodutos.Active:=False;
            DmPrincipal.ClientDataSetpedidosprodutos.Active:=True;
           // DmPrincipal.SQLQueryPedidos.Filter:=DmPrincipal.SQLQrypedidosprodutos.FieldByName('numeropedido').Value;
           // DmPrincipal.SQLQueryPedidos.Filtered:=true;


          // pvalor_unitario:=StrToFloat(Valores[1]);
          // UpdateItem(iditem,pqtde,pvalor_unitario);
        end;


 FormConsultaPedidos.Show;
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

procedure TFormPedidos.DBGridpedidoprodutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var iditem : integer;
  var Valores : Tarray<string>;
  var pqtde : integer;
  var  pvalor_unitario: Currency;

begin
    SetLength(Valores,2);
    iditem:=DmPrincipal.DSspedidosprodutos.DataSet.FieldByName('iditem').Value;
    if key = 13 then begin
      if  InputQuery('Dados do Produto',[ 'Informe a Qtde','Infome o Valor Unit�rio'], Valores) then
        begin
           pqtde:=strtoint(Valores[0]);
           pvalor_unitario:=StrToFloat(Valores[1]);
           UpdateItem(iditem,pqtde,pvalor_unitario);
        end;


    end;




    if key = 46 then begin
          if messagebox(0,'Voc� confirma excluir o Item  ?','Pergunta',mb_yesno+mb_iconquestion)=6 then
            begin
              ApagarItem(iditem);
            end
    end;
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

Function TFormPedidos.ApagarItem(iditem :Integer) : Boolean;
begin
//DELIMITER //

//CREATE PROCEDURE GetOfficeByCountry(
//	IN countryName VARCHAR(255)
//)
//BEGIN
//	SELECT *
// 	FROM offices
//	WHERE country = countryName;
//END //

//DELIMITER ;

   DmPrincipal.SQLStoProcApagarItem.Params.ParamByName('piditem').Value:=iditem;
   DmPrincipal.SQLStoProcApagarItem.ExecProc;
   showmessage('Item do pedido excluido com Sucesso !'+inttostr(iditem));
   BuscarPedido();

end;

Function TFormPedidos.UpdateItem(iditem :Integer; qtde : integer; valor_unitario : Currency) : Boolean;
begin

   DmPrincipal.SQLStoProcUpdateItem.Params.ParamByName('piditem').Value:=iditem;
   DmPrincipal.SQLStoProcUpdateItem.Params.ParamByName('pqtde').Value:=qtde;
   DmPrincipal.SQLStoProcUpdateItem.Params.ParamByName('pvalor_unitario').Value:=valor_unitario;
   DmPrincipal.SQLStoProcUpdateItem.ExecProc;
   showmessage('Item do pedido Alterado com Sucesso !'+inttostr(iditem));
   BuscarPedido();

end;


end.
