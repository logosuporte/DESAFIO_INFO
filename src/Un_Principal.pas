unit Un_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Controller.BuscaCEP.interfaces, Model.ClienteInterface, Model.Cliente,
  Controller.CriarXML, Vcl.Imaging.jpeg, Vcl.Menus, Model.Email;

type

  TForm_Principal = class(TForm)
    MainMenu1: TMainMenu;
    PnlPrincipal: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnIncluir: TButton;
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
    BtnSalvar: TButton;
    EditCPF: TMaskEdit;
    EditTelefone: TMaskEdit;
    EditCEP: TMaskEdit;
    CadastrodeCliente1: TMenuItem;
    Clientes1: TMenuItem;
    Image1: TImage;
    Button1: TButton;
    Panel1: TPanel;
    procedure BtnIncluirClick(Sender: TObject);
    procedure EditCEPExit(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure LimparEdits;
    procedure EnviarEmailCliente;
    { Private declarations }
  public
    { Public declarations }
    // procedure para deixar o codigo mais limpo
    // responsavel por gerar o xml local
    procedure GravaXMLLocal(pCliente:TCliente);
    procedure  escondeMostraPanel;
  end;

var
  Form_Principal: TForm_Principal;

implementation

uses
  Model.CEP;

{$R *.dfm}

procedure TForm_Principal.BtnIncluirClick(Sender: TObject);
begin
  LimparEdits;
end;

procedure TForm_Principal.BtnSalvarClick(Sender: TObject);
var Cliente:iCliente ;
begin
  // estancia o objeto e pega os dados dos Edits
  Cliente := TCliente.New;
  Cliente.Nome(EditNome.Text)
    .Identidade(EditIdentidade.Text)
    .CPF(EditCPF.Text)
    .Telefone(EditTelefone.Text)
    .Email(EditEmail.Text)
    .Endereco
      .Logradouro(EditLogradouro.Text)
      .Cep(EditCep.Text)
      .Numero(StrtoInt(EditNumero.Text))
      .Complemento(EditComplemento.Text)
      .Bairro(EditBairro.Text)
      .Cidade(EditCidade.Text)
      .Estado(EditUF.Text)
      .Pais(EditPais.Text)
      .&End
    .&End;

  // pega os dados do objeto e gera um cxm na pasta local
  GravaXMLLocal(Cliente as Tcliente);
  // enviar e-mail para o cliente com o xml anexo
  EnviarEmailCliente;
end;

procedure TForm_Principal.Button1Click(Sender: TObject);
begin
  escondeMostraPanel;
end;

procedure TForm_Principal.Clientes1Click(Sender: TObject);
begin
  escondeMostraPanel;
  LimparEdits;
end;

procedure TForm_Principal.EditCEPExit(Sender: TObject);
var endereco,EnderecoValido:iCEP; //RecEndereco;
begin
  endereco            := tCEP.New();
  EnderecoValido      := tCEP.New();
  // busca o cep pelo consumo da API do via Cep, utilizando JSON;
  EnderecoValido      := endereco.BuscaCEP(EditCEP.Text);
  EditLogradouro.Text := EnderecoValido.Logradouro;
  EditBairro.Text     := EnderecoValido.Bairro;
  EditCidade.Text     := EnderecoValido.Cidade;
  EditUF.Text         := EnderecoValido.UF;
  EditPais.Text       := EnderecoValido.Pais;
end;

procedure TForm_Principal.escondeMostraPanel;
begin
  PnlPrincipal.Visible := not PnlPrincipal.Visible;
  Image1.Visible       := not PnlPrincipal.Visible;
end;

procedure TForm_Principal.EnviarEmailCliente;
var
  CorpoEmail: TMemo;
  Email: TEMail;
begin
  CorpoEmail := TMemo.Create(Self);
  CorpoEmail.Parent := Form_Principal;
  CorpoEmail.Name := 'Corpo E-mail';
  CorpoEmail.Hide;
  CorpoEmail.Lines.Text := 'Cadastro de Cliente';
  Email := TEMail.Create;
  Email.EnviarEmail('Cadastro de Cliente', 'logo_suporte@hotmail.com', ExtractFilePath(ParamStr(0)) + 'Cliente.xml', CorpoEmail.Lines);
  FreeandNil(Email);
  CorpoEmail.Free;
end;

procedure TForm_Principal.LimparEdits;
begin
  if Assigned(EditNome) then
    EditNome.SetFocus;
  EditNome.Clear;
  EditIdentidade.Clear;
  EditCPF.Clear;
  EditTelefone.Clear;
  EditEmail.Clear;
  EditCEP.Clear;
  EditNumero.Clear;
  EditComplemento.Clear;
  EditLogradouro.Clear;
  EditBairro.Clear;
  EditCidade.Clear;
  EditPais.Clear;
  EditUF.Clear;
end;

procedure TForm_Principal.GravaXMLLocal(pCliente:TCliente);
var XML :TControllerXML;
begin
  // instacia o Objeto para pegar o metodo de criar xml
  XML := TControllerXML.Create;
  XML.CriarXMLcliente(pCliente,Self);
  XML.Free;
end;

end.
