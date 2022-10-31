unit UnitClasspedidosprodutos;
interface
uses REST.Json.Types,UnitDM,System.SysUtils;

type Tpedidosprodutos = class
  private
    [JSONNameAttribute('iditem')]
    Fiditem: integer;
    [JSONNameAttribute('numeropedido')]
    Fnumeropedido: integer;
    [JSONNameAttribute('codigoproduto')]
    Fcodigoproduto: integer;
    [JSONNameAttribute('qtde')]
    Fqtde: integer;
    [JSONNameAttribute('valor_unitario')]
    Fvalor_unitario: Currency;

    Constructor Create;    // declaração do metodo construtor

    Destructor  Destroy; Override; // declaração do metodo destrutor



    procedure Setiditem(const Value: integer);
    procedure Setnumeropedido(const Value: integer);
    procedure Setcodigoproduto(const Value: integer);
    procedure Setqtde(const Value: integer);
    procedure Setvalor_unitario(const Value: Currency);
    function saberTotalpedido(Numeropedido: Integer): Integer;
//    function GravarPedidosproduto(Numeropedido: Integer): Integer;

  public
    property iditem: integer read Fiditem write Setiditem;
    property numeropedido: integer read Fnumeropedido write Setnumeropedido;
    property codigoproduto: integer read Fcodigoproduto write Setcodigoproduto;
    property qtde: integer read Fqtde write Setqtde;
    property valor_unitario: currency read Fvalor_unitario write Setvalor_unitario;

//    function saberTotalpedido(Numeropedido: Integer): Integer;
    function GravarPedidosproduto(Numeropedido: Integer): Integer;
end;

implementation

{ Tpedidosprodutos }




constructor Tpedidosprodutos.Create;

begin

// metodo contrutor

end;

destructor Tpedidosprodutos.Destroy;

begin

// metodo destrutor

inherited;

end;


procedure Tpedidosprodutos.Setiditem(const Value: integer);
begin
  Fiditem := Value;
end;

procedure Tpedidosprodutos.Setnumeropedido(const Value: integer);
begin
  Fnumeropedido := Value;
end;

procedure Tpedidosprodutos.Setcodigoproduto(const Value: integer);
begin
  Fcodigoproduto := Value;
end;

procedure Tpedidosprodutos.Setqtde(const Value: integer);
begin
  Fqtde := Value;
end;


procedure Tpedidosprodutos.Setvalor_unitario(const Value: currency);
begin
  Fvalor_unitario := Value;
end;



function Tpedidosprodutos.saberTotalpedido(Numeropedido: Integer): Integer;

begin

Result := Fiditem + Numeropedido;

end;

function Tpedidosprodutos.GravarPedidosproduto(Numeropedido: Integer): Integer;

begin
   DmPrincipal.SQLStoProcInsererepedidosprodutos.Params.ParamByName('pnumeropedido').AsInteger:=Fnumeropedido;
   DmPrincipal.SQLStoProcInsererepedidosprodutos.Params.ParamByName('pcodigoproduto').AsInteger:=Fcodigoproduto;
   DmPrincipal.SQLStoProcInsererepedidosprodutos.Params.ParamByName('pqtde').AsInteger:=Fqtde;
   DmPrincipal.SQLStoProcInsererepedidosprodutos.Params.ParamByName('pvalor_unitario').AsCurrency:=Fvalor_unitario;
   DmPrincipal.SQLStoProcInsererepedidosprodutos.ExecProc;
   Result := Fnumeropedido;

end;


end.


