unit Model.CriarXML;

interface
uses Model.ClienteInterface,XMLDoc, XMLIntf,Vcl.Forms;
  type
    TXML = class
    private
    public
      constructor  Create;
      destructor Destroy; override;
      procedure CriarXMLcliente(Cliente:iCliente;Owner:TForm);
  end;

implementation

{ TXML }

constructor TXML.Create;
begin

end;
destructor TXML.Destroy;
begin

  inherited;
end;
procedure TXML.CriarXMLcliente(Cliente: iCliente;Owner:TForm);
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  I: Integer;
begin
  XMLDocument := TXMLDocument.Create(Owner);
  try
    XMLDocument.Active := True;
    NodeTabela := XMLDocument.AddChild('Clientes');

    NodeRegistro := NodeTabela.AddChild('Registro');
    NodeRegistro.ChildValues['Nome']       := Cliente.Nome;
    NodeRegistro.ChildValues['Identidade'] := Cliente.Identidade;
    NodeRegistro.ChildValues['CPF']        := Cliente.CPF;
    NodeRegistro.ChildValues['Telefone']   := Cliente.Telefone;
    NodeRegistro.ChildValues['Email']      := Cliente.Email;

    NodeEndereco := NodeRegistro.AddChild('Endereco');
    NodeEndereco.ChildValues['Cep']         := Cliente.Endereco.Cep;
    NodeEndereco.ChildValues['Logradouro']  := Cliente.Endereco.Logradouro;
    NodeEndereco.ChildValues['Numero']      := Cliente.Endereco.Numero;
    NodeEndereco.ChildValues['Complemento'] := Cliente.Endereco.Complemento;
    NodeEndereco.ChildValues['Bairro']      := Cliente.Endereco.Bairro;
    NodeEndereco.ChildValues['Cidade']      := Cliente.Endereco.Cidade;
    NodeEndereco.ChildValues['Estado']      := Cliente.Endereco.Estado;
    NodeEndereco.ChildValues['Pais']        := Cliente.Endereco.Pais;

    XMLDocument.SaveToFile('Cliente.xml');
  finally
    XMLDocument.Free;
  end;
end;

end.
