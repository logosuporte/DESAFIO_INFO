unit Model.Endereco;

interface
  uses Model.ClienteInterface, Model.Validacoes,System.SysUtils;
type
  TEndereco <T: IInterface> = class(TInterfacedObject,iEndereco<T>)
  private
    [weak]
    FParent:t;

    FLogradouro: String;
    FBairro: String;
    FCep: String;
    FNumero: integer;
    FComplemento: String;
    FCidade: String;
    FPais: String;
    FEstado: String;

    public
    constructor Create(Parent:T);
    destructor Destroy; override;

    class function New(Parent:T): iEndereco<T>;
    function Logradouro(Value:String): iEndereco<T>; overload;
    function Logradouro: String; overload;

    function Bairro(Value:String): iEndereco<T>; overload;
    function Bairro: String; overload;

    function Cep(Value:String): iEndereco<T>; overload;
    function Cep: String; overload;

    function Numero(Value:integer): iEndereco<T>; overload;
    function Numero: integer; overload;

    function Complemento(Value:String): iEndereco<T>; overload;
    function Complemento: String; overload;

    function Cidade(Value:String): iEndereco<T>; overload;
    function Cidade: String; overload;

    function Pais(Value:String): iEndereco<T>; overload;
    function Pais: String; overload;

    function Estado(Value:String): iEndereco<T>; overload;
    function Estado: String; overload;

    function &End:T;
  end;


implementation



{ TEndereco<T> }

function TEndereco<T>.Bairro: String;
begin
  Result := FBairro;
end;

function TEndereco<T>.Bairro(Value: String): iEndereco<T>;
begin
  Result  := Self;
  FBairro := Value;
end;

function TEndereco<T>.Cep: String;
begin
  Result := FCep;
end;

function TEndereco<T>.Cep(Value: String): iEndereco<T>;
var Validacao:TValidacoes;
begin
  if Length(Validacao.GetStrNumber(Value)) <> 8 then
    raise Exception.Create('N?mero de CEP inv?lido');
  Result := Self;
  FCep   := Value;
end;

function TEndereco<T>.Cidade: String;
begin
  Result := FCidade;
end;

function TEndereco<T>.Cidade(Value: String): iEndereco<T>;
begin
  Result  := Self;
  FCidade := Value;
end;

function TEndereco<T>.Complemento: String;
begin
  Result := FComplemento;
end;

constructor TEndereco<T>.Create(Parent: T);
begin
  FParent := Parent
end;

destructor TEndereco<T>.Destroy;
begin

  inherited;
end;

function TEndereco<T>.Complemento(Value: String): iEndereco<T>;
begin
  Result       := Self;
  FComplemento := Value;
end;

function TEndereco<T>.&End: T;
begin
    Result := FParent;
end;

function TEndereco<T>.Estado(Value: String): iEndereco<T>;
begin
  Result  := Self;
  FEstado := Value;
end;

function TEndereco<T>.Estado: String;
begin
  Result := FEstado;
end;

function TEndereco<T>.Logradouro: String;
begin
  Result := FLogradouro;
end;

function TEndereco<T>.Logradouro(Value: String): iEndereco<T>;
begin
  Result      := Self;
  FLogradouro := Value;
end;

function TEndereco<T>.Numero(Value: integer): iEndereco<T>;
begin
  Result  := Self;
  FNumero := Value;
end;

class function TEndereco<T>.New(Parent: T): iEndereco<T>;
begin
  Result := Self.Create(Parent);
end;

function TEndereco<T>.Numero: integer;
begin
  Result := FNumero;
end;

function TEndereco<T>.Pais: String;
begin
  Result := FPais;
end;

function TEndereco<T>.Pais(Value: String): iEndereco<T>;
begin
  Result := Self;
  FPais  := Value;
end;

end.
