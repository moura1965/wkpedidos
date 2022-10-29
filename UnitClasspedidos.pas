unit UnitClasspedidos;

interface


uses REST.Json.Types;

type pedidos = class
  private
    [JSONNameAttribute('numeropedido')]
    Fnumeropedido: Integer;
    [JSONNameAttribute('dataemissao')]
    Fdataemissao: TDateTime;
    [JSONNameAttribute('codigocliente')]
    Fcodigocliente: Integer;
    [JSONNameAttribute('valortotal')]
    Fvalortotal: Double;
    procedure Setnumeropedido(const Value: Integer);
    procedure Setdataemissao(const Value: TDateTime);
    procedure Setcodigocliente(const Value: Integer);
    procedure Setvalortotal(const Value: Double);
  public
    property numeropedido: Integer read Fnumeropedido write Setnumeropedido;
    property dataemissao: TDateTime read Fdataemissao write Setdataemissao;
    property codigocliente: Integer read Fcodigocliente write Setcodigocliente;
    property valortotal: Double read Fvalortotal write Setvalortotal;
end;

implementation

{ pedidos }

procedure pedidos.Setnumeropedido(const Value: Integer);
begin
  Fnumeropedido := Value;
end;

procedure pedidos.Setdataemissao(const Value: TDateTime);
begin
  Fdataemissao := Value;
end;

procedure pedidos.Setcodigocliente(const Value: Integer);
begin
  Fcodigocliente := Value;
end;

procedure pedidos.Setvalortotal(const Value: Double);
begin
  Fvalortotal := Value;
end;



end.