unit Un_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  uCEFWinControl, uCEFLinkedWinControlBase, uCEFChromiumWindow,
  uCEFChromiumCore, uCEFChromium, uCEFViewComponent, uCEFBrowserViewComponent,
  uCEFLinkedWindowParent,System.JSON, Modell.Cliente,XMLDoc, XMLIntf;

type
  TEndereco = record
    Logradouro :String;
    Bairro     :String;
    Cidade     :String;
    UF         :String;
    Pais       :String;
  end;

  TForm_Principal = class(TForm)
    Button1: TButton;
    Bevel1: TBevel;
    EditNome: TLabeledEdit;
    EditIdentidade: TLabeledEdit;
    EditEmail: TLabeledEdit;
    EditLogradouro: TLabeledEdit;
    EditNumero: TLabeledEdit;
    EditComplemento: TLabeledEdit;
    EditBairro: TLabeledEdit;
    EditCidade: TLabeledEdit;
    EditUF: TLabeledEdit;
    EditPais: TLabeledEdit;
    ComboboxEndereco: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    EditCPF: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditTelefone: TMaskEdit;
    Label4: TLabel;
    EditCEP: TMaskEdit;
    IdHTTP1: TIdHTTP;
    procedure Button1Click(Sender: TObject);
    procedure EditCEPExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   function CarregarCEP(pcep:String):TEndereco;
   procedure CriarXMLcliente(Cliente:TClientes);
  end;

var
  Form_Principal: TForm_Principal;

implementation

{$R *.dfm}

uses Modell.Email;



procedure TForm_Principal.Button1Click(Sender: TObject);
begin
  EditNome.SetFocus;
end;

procedure TForm_Principal.Button2Click(Sender: TObject);
var Cliente:TClientes ;
    Email:TEMail;
    Bory:TStrings;
begin
  Cliente := TClientes.Create;
  with Cliente do
  begin
    Nome        := EditNome.Text;
    Identidade  := EditIdentidade.Text;
    CPF         := EditCPF.Text;
    Telefone    := EditTelefone.Text;
    Email       := EditEmail.Text;
    Endereco    := ComboboxEndereco.Text;
    Cep         := EditCep.Text;
    Logradouro  := EditLogradouro.Text;
    Numero      := StrtoInt(EditNumero.Text);
    Complemento := EditComplemento.Text;
    Bairro      := EditBairro.Text;
    Cidade      := EditCidade.Text;
    Estado      := EditUF.Text;
    Pais        := EditPais.Text;
  end;

  CriarXMLcliente(Cliente);


  Bory := TStrings.Create;
  Bory.Add('Cadastro de Cliente');

  Email := TEMail.Create;
  Email.EnviarEmail('Cadastro de Cliente','logo_suporte@hotmail.com',ExtractFilePath(ParamStr(0)) +'Cliente.xml',Bory);
  FreeandNil(Email);
end;

function TForm_Principal.CarregarCEP(pcep: String):TEndereco;
var
  lodados:String;
  JSonValue : TJSonValue;
  st : string;
  erro :string;

  Endereco:TEndereco;
begin
 if (Length(pcep) <> 8) then
   raise Exception.Create('CEP inv�lido');

  lodados := StringReplace(idhttp1.URL.URLDecode(idhttp1.Get('http://viacep.com.br/ws/'+pcep+'/json/')),'&',#13#10,[rfreplaceAll]);
  st := lodados;
  JsonValue := TJSonObject.ParseJSONValue(st);
  erro := EmptyStr;
  try
    erro := JsonValue.GetValue<string>('erro');
  except
    erro := EmptyStr;;
  end;

  if erro <> EmptyStr then
    raise Exception.Create('CEP n�o encontrado');

  Endereco.Logradouro := JsonValue.GetValue<string>('logradouro');
  Endereco.Bairro     := JsonValue.GetValue<string>('bairro');
  Endereco.Cidade     := JsonValue.GetValue<string>('localidade');
  Endereco.UF         := JsonValue.GetValue<string>('uf');
  Endereco.Pais       := 'Brasil';

  JsonValue.Free;
  Result := Endereco;
end;

procedure TForm_Principal.CriarXMLcliente(Cliente:TClientes);
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  I: Integer;
begin
 XMLDocument := TXMLDocument.Create(Self);
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
    NodeEndereco.ChildValues['Cep']         := Cliente.Cep;
    NodeEndereco.ChildValues['Logradouro']  := Cliente.Logradouro;
    NodeEndereco.ChildValues['Numero']      := Cliente.Numero;
    NodeEndereco.ChildValues['Complemento'] := Cliente.Complemento;
    NodeEndereco.ChildValues['Bairro']      := Cliente.Bairro;
    NodeEndereco.ChildValues['Cidade']      := Cliente.Cidade;
    NodeEndereco.ChildValues['Estado']      := Cliente.Estado;
    NodeEndereco.ChildValues['Pais']        := Cliente.Pais;

    XMLDocument.SaveToFile('Cliente.xml');
  finally
    XMLDocument.Free;
  end;
  end;

procedure TForm_Principal.EditCEPExit(Sender: TObject);
var endereco:TEndereco;
begin
  endereco := CarregarCEP(EditCEP.Text);
  EditLogradouro.Text := endereco.Logradouro;
  EditBairro.Text     := endereco.Bairro;
  EditCidade.Text     := endereco.Cidade;
  EditUF.Text         := endereco.UF;
  EditPais.Text       := endereco.Pais;
end;

end.