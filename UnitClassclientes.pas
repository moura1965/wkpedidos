unit UnitClassclientes;

interface

 uses REST.Json.Types;

type clientes = class
  private
    [JSONNameAttribute('codigo')]
    Fcodigo: integer;
    [JSONNameAttribute('nome')]
    Fnome: string;
    [JSONNameAttribute('cidade')]
    Fcidade: string;
    [JSONNameAttribute('uf')]
    Fuf: String;
    procedure Setcodigo(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setcidade(const Value: string);
    procedure Setuf(const Value: String);
  public
    property codigo: integer read Fcodigo write Setcodigo;
    property nome: string read Fnome write Setnome;
    property cidade: string read Fcidade write Setcidade;
    property uf: String read Fuf write Setuf;
end;

implementation

{ clientes }

procedure clientes.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure clientes.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure clientes.Setcidade(const Value: string);
begin
  Fcidade := Value;
end;

procedure clientes.Setuf(const Value: String);
begin
  Fuf := Value;
end;



end.
