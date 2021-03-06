unit Model.CEP;

interface
uses System.JSON, XMLDoc, XMLIntf, System.SysUtils,
IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Controller.BuscaCEP.interfaces;
type
 TCEP = Class(TInterfacedObject,iCEP)
 private
    FLogradouro :String;
    FBairro     :String;
    FCidade     :String;
    FUF         :String;
    FPais       :String;
 public
   constructor Create;
   destructor Destroy; override;
   class function New :iCEP;

   function BuscaCEP(Value:String):iCEP;
   function Logradouro(Value:String): iCEP; overload;
   function Logradouro: String; overload;
   function Bairro(Value:String): iCEP; overload;
   function Bairro: String; overload;
   function Cidade(Value:String): iCEP; overload;
   function Cidade: String; overload;
   function UF(Value:String): iCEP; overload;
   function UF: String; overload;
   function Pais(Value:String): iCEP; overload;
   function Pais: String; overload;
 End;

implementation

{ TCEP }

function TCEP.Bairro: String;
begin
  Result := FBairro;
end;

function TCEP.Bairro(Value: String): iCEP;
begin
  Result := Self;
  FBairro := Value;
end;

function TCEP.BuscaCEP(Value: String): iCEP;
var
  lodados,st, erro :String;
  JSonValue : TJSonValue;
  Endereco:iCEP;
  idhttp1:TIdHTTP;
begin
  if (Length(Value) <> 8) then
    raise Exception.Create('CEP inv?lido');

  idhttp1 := TIdHTTP.Create();

  lodados := StringReplace(idhttp1.URL.URLDecode(idhttp1.Get('http://viacep.com.br/ws/'+Value+'/json/')),'&',#13#10,[rfreplaceAll]);
  st := lodados;
  JsonValue := TJSonObject.ParseJSONValue(st);
  erro := EmptyStr;
  try
    erro := JsonValue.GetValue<string>('erro');
  except
    erro := EmptyStr;
  end;

  if erro <> EmptyStr then
    raise Exception.Create('CEP n?o encontrado');

  Endereco := TCEP.New;
  Endereco.Logradouro(JsonValue.GetValue<string>('logradouro'));
  Endereco.Bairro(JsonValue.GetValue<string>('bairro'));
  Endereco.Cidade(JsonValue.GetValue<string>('localidade'));
  Endereco.UF(JsonValue.GetValue<string>('uf'));
  Endereco.Pais('Brasil');

  JsonValue.Free;
  idhttp1.Free;
  Result := Endereco;
end;

function TCEP.Cidade: String;
begin
  Result := FCidade;
end;

function TCEP.Cidade(Value: String): iCEP;
begin
  Result := Self;
  FCidade := Value;
end;

constructor TCEP.Create;
begin

end;

destructor TCEP.Destroy;
begin

  inherited;
end;

function TCEP.Logradouro(Value: String): iCEP;
begin
  Result := Self;
  FLogradouro := Value;
end;

function TCEP.Logradouro: String;
begin
  Result := FLogradouro;
end;

class function TCEP.New: iCEP;
begin
  Result := Self.Create;
end;

function TCEP.Pais: String;
begin
  Result := FPais;
end;

function TCEP.Pais(Value: String): iCEP;
begin
  Result := Self;
  FPais  := Value;
end;

function TCEP.UF: String;
begin
  Result := FUF;
end;

function TCEP.UF(Value: String): iCEP;
begin
  Result := Self;
  FUF    := Value;
end;

end.
