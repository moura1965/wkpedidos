unit UnitClasspedidosprodutos;
interface
uses REST.Json.Types;

type pedidosprodutos = class
  private
    [JSONNameAttribute('iditem')]
    Fiditem: integer;
    [JSONNameAttribute('numeropedido')]
    Fnumeropedido: integer;
    [JSONNameAttribute('codigoproduto')]
    Fcodigoproduto: integer;
    [JSONNameAttribute('qtde')]
    Fqtde: integer;
    procedure Setiditem(const Value: integer);
    procedure Setnumeropedido(const Value: integer);
    procedure Setcodigoproduto(const Value: integer);
    procedure Setqtde(const Value: integer);
  public
    property iditem: integer read Fiditem write Setiditem;
    property numeropedido: integer read Fnumeropedido write Setnumeropedido;
    property codigoproduto: integer read Fcodigoproduto write Setcodigoproduto;
    property qtde: integer read Fqtde write Setqtde;
end;

implementation

{ pedidosprodutos }

procedure pedidosprodutos.Setiditem(const Value: integer);
begin
  Fiditem := Value;
end;

procedure pedidosprodutos.Setnumeropedido(const Value: integer);
begin
  Fnumeropedido := Value;
end;

procedure pedidosprodutos.Setcodigoproduto(const Value: integer);
begin
  Fcodigoproduto := Value;
end;

procedure pedidosprodutos.Setqtde(const Value: integer);
begin
  Fqtde := Value;
end;


end.
