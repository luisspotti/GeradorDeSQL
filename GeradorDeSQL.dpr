program GeradorDeSQL;

uses
  Vcl.Forms,
  FGeradorDeSQL in 'FGeradorDeSQL.pas' {frmGeradorDeSql},
  UConstantes in 'UConstantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGeradorDeSql, frmGeradorDeSql);
  Application.Run;
end.
