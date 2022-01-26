unit Controller.CriarXML.interfaces;

interface

uses Model.ClienteInterface,Vcl.Forms;
  type
    IControllerXML = interface
      procedure CriarXMLcliente(Cliente:iCliente;Owner:TForm);
    end;

implementation

end.
