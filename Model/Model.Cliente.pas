unit Model.Cliente;

interface
uses Model.ClienteInterface,
     System.RegularExpressions,
     System.SysUtils, Model.Endereco;

type
  TCliente = Class(TInterfacedObject,iCliente)
  private
    FEmail:String;
    FCPF:String;
    FIdentidade:String;
    FNome:String;
    FTelefone:String;
    FEndereco :iEndereco<icliente>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New :iCliente;
    function Email(Value:String): iCliente; overload;
    function Email: String; overload;
    function CPF(Value:String): iCliente; overload;
    function CPF:String overload;
    function Identidade(Value:String): iCliente; overload;
    function Identidade: String; overload;
    function Nome(Value:String): iCliente; overload;
    function Nome: string;overload;
    function Telefone(Value:String): iCliente; overload;
    function Telefone: String; overload;
    function Endereco :iEndereco<icliente>;
    function &end: iCliente;
  end;

implementation
{ TCliente }

uses Model.Validacoes;

function TCliente.&end: iCliente;
begin
  result := self;
end;

function TCliente.CPF: String;
begin
  Result := FCPF;
end;

function TCliente.CPF(Value: String): iCliente;
var ValidaCPF : TValidacoes;
begin
  try
    ValidaCPF := TValidacoes.Create;
    if not ValidaCPF.ValidaCPF(Value) then
      raise Exception.Create('Cpf Invalido!');
     Result := Self;
     FCPF   := Value;
  finally
    ValidaCPF.Free;
  end;

end;

constructor TCliente.Create;
begin
  FEndereco := TEndereco<icliente>.New(Self);
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

function TCliente.Email: String;
begin
  Result := FEmail;
end;

function TCliente.Email(Value: String): iCliente;
  function ValidarEMail(aStr: string): Boolean;
  begin
    aStr := Trim(UpperCase(aStr));
    if Pos('@', aStr) > 1 then
    begin
      Delete(aStr, 1, pos('@', aStr));
      Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
    end
  else
    Result := False;
  end;
begin
  if ValidarEMail(Value)  then
  begin
    Result := Self;
    FEmail := Value;
  end else
    raise Exception.Create('E-mail Invalido');
end;

function TCliente.Endereco: iEndereco<icliente>;
begin
  Result :=  fEndereco;
end;

function TCliente.Identidade(Value: String): iCliente;
begin
  if Length(Value) <> 7  then
     raise Exception.Create('N?mero da identidade Invalido');
  Result      := Self;
  FIdentidade := Value;
end;

function TCliente.Identidade: String;
begin
  Result := FIdentidade;
end;

class function TCliente.New: iCliente;
begin
  Result := Self.Create;
end;

function TCliente.Nome: string;
begin
  Result := FNome;
end;

function TCliente.Nome(Value: String): iCliente;
begin
  if Value = EmptyStr then
     raise Exception.Create('Nome n?o pode ser vazio!');
  Result := Self;
  FNome  := Value;
end;

function TCliente.Telefone(Value: String): iCliente;
begin
  if (Length(Value) <> 11) then
     raise Exception.Create('N?mero do Telefone inv?lido!');

  Result   := Self;
  FTelefone := Value;
end;

function TCliente.Telefone: String;
begin
  Result := FTelefone;
end;

end.


