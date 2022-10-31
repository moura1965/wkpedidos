unit UnitConsultaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls,unitDM, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormConsultaPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridPedidos: TDBGrid;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BtnCancelar: TBitBtn;
    EditNUmeropedido: TEdit;
    procedure BtnCancelarClick(Sender: TObject);

  private
    function ApagarPedido(iditem: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaPedidos: TFormConsultaPedidos;

implementation

{$R *.dfm}



procedure TFormConsultaPedidos.BtnCancelarClick(Sender: TObject);
var pnumeropedido : integer;

begin
 pnumeropedido:=strtoint(EditNUmeropedido.Text);
 if messagebox(0,'Você confirma Cancelar o Pedido ?','Pergunta',mb_yesno+mb_iconquestion)=6 then
            begin
              ApagarPedido(pnumeropedido);
            end
end;

Function TFormConsultaPedidos.ApagarPedido(iditem :Integer) : Boolean;
begin
   // excluido pedido da tabela pedidos
   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;
   DmPrincipal.SQLQryGenerica.SQL.ADD('Delete from pedidos where numeropedido=:pnumeropedido');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pnumeropedido').AsInteger:=iditem;
   DmPrincipal.SQLQryGenerica.ExecSQL;
   // excluindo itens do pedido

   DmPrincipal.SQLQryGenerica.CLOSE;
   DmPrincipal.SQLQryGenerica.SQL.CLEAR;
   DmPrincipal.SQLQryGenerica.SQL.ADD('Delete from pedidosprodutos where numeropedido=:pnumeropedido');
   DmPrincipal.SQLQryGenerica.Params.ParamByName('pnumeropedido').AsInteger:=iditem;
   DmPrincipal.SQLQryGenerica.ExecSQL;




   //DmPrincipal.SQLStoProcApagarItem.Params.ParamByName('piditem').Value:=iditem;
   //DmPrincipal.SQLStoProcApagarItem.ExecProc;
   showmessage('Pedido Cancelado com Sucesso !'+inttostr(iditem));
  // BuscarPedido();

end;












end.
