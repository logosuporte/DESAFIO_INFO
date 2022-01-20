program DesafioInfo;

uses
  Vcl.Forms,
  Un_Principal in 'Un_Principal.pas' {Form_Principal},
  Modell.Cliente in '..\Modell\Modell.Cliente.pas',
  Modell.Email in '..\Modell\Modell.Email.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
