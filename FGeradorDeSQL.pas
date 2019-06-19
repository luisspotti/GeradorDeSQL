unit FGeradorDeSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmGeradorDeSql = class(TForm)
    memColunas: TMemo;
    memTabelas: TMemo;
    memCondicoes: TMemo;
    btnGerarSql: TButton;
    memSQL: TMemo;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSQL: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGerarSqlClick(Sender: TObject);
  private
    fListaColunas: TStringList;
    fListaTabelas: TStringList;
    fListaCondicoes: TStringList;

    procedure ValidarMemosPreenchidos;
  public
    procedure LimparListas;
    procedure AdicionarColuna(psColuna: String);
    procedure AdicionarTabela(psTabela: String);
    procedure AdicionarCondicao(psCondicao: String);
    function GerarSQL: String;
  end;

var
  frmGeradorDeSql: TfrmGeradorDeSql;

implementation

uses
  UConstantes;

{$R *.dfm}

procedure TfrmGeradorDeSql.AdicionarColuna(psColuna: String);
begin
  fListaColunas.Add(psColuna);
end;

procedure TfrmGeradorDeSql.AdicionarCondicao(psCondicao: String);
begin
  fListaCondicoes.Add(psCondicao);
end;

procedure TfrmGeradorDeSql.AdicionarTabela(psTabela: String);
begin
  fListaTabelas.Add(psTabela);
end;

procedure TfrmGeradorDeSql.btnGerarSqlClick(Sender: TObject);
var
  lsAux: String;
begin
  memSQL.Clear;

  ValidarMemosPreenchidos;

  LimparListas;

  for lsAux in memColunas.Lines do
    AdicionarColuna(lsAux);

  for lsAux in memTabelas.Lines do
    AdicionarTabela(lsAux);

  for lsAux in memCondicoes.Lines do
    AdicionarCondicao(lsAux);

  memSQL.Lines.Text := GerarSQL;
end;

procedure TfrmGeradorDeSql.FormCreate(Sender: TObject);
begin
  fListaColunas := TStringList.Create;
  fListaTabelas := TStringList.Create;
  fListaCondicoes := TStringList.Create;
end;

procedure TfrmGeradorDeSql.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fListaColunas);
  FreeAndNil(fListaTabelas);
  FreeAndNil(fListaCondicoes);
end;

function TfrmGeradorDeSql.GerarSQL: String;
var
  lsAux: String;
begin
  result := constSELECTClause;

  for lsAux in fListaColunas do
    result := result + ' ' + lsAux + ',';
  Delete(result, result.Length, 1);
  result := result + constCRLF + constFROMClause;

  for lsAux in fListaTabelas do
    result := result + ' ' + lsAux + ',';
  Delete(result, result.Length, 1);
  result := result + constCRLF + constWHEREClause;

  for lsAux in fListaCondicoes do
    result := result + ' ' + lsAux + ' ' + constANDClause;
  Delete(result, result.Length-2, 3);
end;

procedure TfrmGeradorDeSql.LimparListas;
begin
  fListaColunas.Clear;
  fListaTabelas.Clear;
  fListaCondicoes.Clear;
end;

procedure TfrmGeradorDeSql.ValidarMemosPreenchidos;
begin
  if memColunas.Lines.Text.IsEmpty or memTabelas.Lines.Text.IsEmpty or memCondicoes.Lines.Text.IsEmpty then
    raise Exception.Create('Atenção! Preencha todos as informações para gerar o SQL.');
end;

end.
