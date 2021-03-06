unit Controller.BuscaCEP;

interface

uses
  Controller.BuscaCEP.interfaces, Model.CEP;
type
  TBuscaCEP = class
  private
  public
    function BuscaCEP(Value:String):iCEP;
 end;

implementation

{ TBuscaCEP }

function TBuscaCEP.BuscaCEP(Value: String): iCEP;
var cep : TCEP;
begin
  cep    := TCEP.Create;
  Result := cep.BuscaCEP(Value);
  cep.Free;
end;

end.
