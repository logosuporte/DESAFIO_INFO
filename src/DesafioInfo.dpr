program DesafioInfo;

uses
  Vcl.Forms,
  Un_Principal in 'Un_Principal.pas' {Form_Principal},
  Model.Cliente in '..\Model\Model.Cliente.pas',
  Model.Email in '..\Model\Model.Email.pas',
  Model.ClienteInterface in '..\Model\Model.ClienteInterface.pas',
  Model.Endereco in '..\Model\Model.Endereco.pas',
  Model.Validacoes in '..\Model\Model.Validacoes.pas',
  Model.CEP in '..\Model\Model.CEP.pas',
  Model.CriarXML in '..\Model\Model.CriarXML.pas',
  Controller.BuscaCEP in '..\Controller\Controller.BuscaCEP.pas',
  Controller.BuscaCEP.interfaces in '..\Controller\Controller.BuscaCEP.interfaces.pas',
  Controller.CriarXML.interfaces in '..\Controller\Controller.CriarXML.interfaces.pas',
  Controller.CriarXML in '..\Controller\Controller.CriarXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
