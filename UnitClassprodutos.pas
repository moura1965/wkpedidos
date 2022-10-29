unit UnitClassprodutos;

interface

uses REST.Json.Types;

type produtos = class
  private
    [JSONNameAttribute('codigoproduto')]
    Fcodigoproduto: integer;
    [JSONNameAttribute('descricao')]
    Fdescricao: string;
    [JSONNameAttribute('precovenda')]
    Fprecovenda: double;
    procedure Setcodigoproduto(const Value: integer);
    procedure Setdescricao(const Value: string);
    procedure Setprecovenda(const Value: double);
  public
    property codigoproduto: integer read Fcodigoproduto write Setcodigoproduto;
    property descricao: string read Fdescricao write Setdescricao;
    property precovenda: double read Fprecovenda write Setprecovenda;
end;

implementation

{ produtos }

procedure produtos.Setcodigoproduto(const Value: integer);
begin
  Fcodigoproduto := Value;
end;

procedure produtos.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure produtos.Setprecovenda(const Value: double);
begin
  Fprecovenda := Value;
end;


end.