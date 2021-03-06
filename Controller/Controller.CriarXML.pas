unit Controller.CriarXML;

interface

uses Controller.CriarXML.interfaces, Model.ClienteInterface, Vcl.Forms,
  Model.CriarXML;
  type
    TControllerXML = class(TInterfacedObject,iControllerXML)
      procedure CriarXMLcliente(Cliente:iCliente;Owner:TForm);
    end;
implementation

{ TControllerXML }

procedure TControllerXML.CriarXMLcliente(Cliente: iCliente; Owner: TForm);
var XML:TXML;
begin
  XML := TXML.Create;
  XML.CriarXMLcliente(Cliente,Owner);
end;

end.
