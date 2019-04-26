unit MainFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, vcl.Graphics, vcl.Forms, vcl.Dialogs, RepCid_TLB, Vcl.Controls, Vcl.StdCtrls, Winapi.ActiveX, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit;

type
  TFormExemploREP = class(TForm)
    ButtonConectar: TButton;
    LabelConectar: TLabel;
    ButtonMostrarUsuariosPSafeArray: TButton;
    LabelStatus: TLabel;
    LabelIP: TLabel;
    EditIP: TEdit;
    ButtonDesconectar: TButton;
    LabelStatusMostrarUsuarios: TLabel;
    StringGrid1: TStringGrid;
    ButtonMostrarUsuariosBase64: TButton;
    procedure ButtonConectarClick(Sender: TObject);
    procedure ButtonDesconectarClick(Sender: TObject);
    procedure ButtonMostrarUsuariosPSafeArrayClick(Sender: TObject);
    procedure ConectarREP;
    procedure DesconectarREP;
    procedure REPConectado;
    procedure REPDesconectado;
    procedure ButtonMostrarUsuariosBase64Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExemploREP: TFormExemploREP;
  rep: RepCid_;
implementation

{$R *.dfm}

procedure TFormExemploREP.ButtonConectarClick(Sender: TObject);
begin
  ConectarREP;
end;

procedure TFormExemploREP.ButtonDesconectarClick(Sender: TObject);
begin
  DesconectarREP;
end;

procedure TFormExemploREP.ButtonMostrarUsuariosBase64Click(Sender: TObject);
var
  QuantidadeUsuarios: Integer;
  UsuariosCarregados: Boolean;
  index: Integer;
  pis: Int64;
  nome: WideString;
  matricula: Int64;
  codigo: Integer;
  senha: WideString;
  barras: WideString;
  rfid: Int64;
  privilegios: Integer;
  templates: PSafeArray;
  indexDigital: Integer;
  indexTemplates: Integer;
  quantidadeTemplates: integer;
  template: WideString;

begin
  LabelStatusMostrarUsuarios.Caption := 'Carregando...';

  if rep.CarregarUsuarios(true, QuantidadeUsuarios) then
  begin
    LabelStatusMostrarUsuarios.Caption := 'Qtde: ' + QuantidadeUsuarios.ToString;

    StringGrid1.RowCount := QuantidadeUsuarios;
    StringGrid1.ColCount := 8;

    StringGrid1.Cells[0, 0] := 'ID';
    StringGrid1.Cells[1, 0] := 'Nome';
    StringGrid1.Cells[2, 0] := 'PIS';
    StringGrid1.Cells[3, 0] := 'Digital 1';
    StringGrid1.Cells[4, 0] := 'Digital 2';
    StringGrid1.Cells[5, 0] := 'Digital 3';
    StringGrid1.Cells[6, 0] := 'Digital 4';
    StringGrid1.Cells[7, 0] := 'Digital 5';

    for index := 1 to QuantidadeUsuarios do
    begin
      rep.iDClass_LerUsuario(pis, nome, matricula, codigo, senha, barras, rfid, privilegios, templates);
      StringGrid1.Cells[0, index] := index.ToString;
      StringGrid1.Cells[1, index] := nome;
      StringGrid1.Cells[2, index] := pis.ToString;

      rep.CarregarTemplatesUsuario(pis, quantidadeTemplates);

      indexDigital := 3;

      for indexTemplates := 0 to quantidadeTemplates do
      begin

        if rep.LerTemplateStr(template) then
        begin
          StringGrid1.Cells[indexDigital, index] := '1';
        end
        else
        begin
          StringGrid1.Cells[indexDigital, index] := '0';
        end;

        indexDigital :=  indexDigital + 1;
      end;
    end;
  end;

end;

procedure TFormExemploREP.ButtonMostrarUsuariosPSafeArrayClick(Sender: TObject);
var
  QuantidadeUsuarios: Integer;
  index: Integer;
  pis: Int64;
  nome: WideString;
  matricula: Int64;
  codigo: Integer;
  senha: WideString;
  barras: WideString;
  rfid: Int64;
  privilegios: Integer;
  templates: PSafeArray;
  indexDigital: Integer;
  indexTemplates: Integer;
  quantidadeTemplates: integer;

begin
  LabelStatusMostrarUsuarios.Caption := 'Carregando...';

  if rep.CarregarUsuarios(true, QuantidadeUsuarios) then
  begin
    LabelStatusMostrarUsuarios.Caption := 'Qtde: ' + QuantidadeUsuarios.ToString;

    StringGrid1.RowCount := QuantidadeUsuarios;
    StringGrid1.ColCount := 8;

    StringGrid1.Cells[0, 0] := 'ID';
    StringGrid1.Cells[1, 0] := 'Nome';
    StringGrid1.Cells[2, 0] := 'PIS';
    StringGrid1.Cells[3, 0] := 'Digital 1';
    StringGrid1.Cells[4, 0] := 'Digital 2';
    StringGrid1.Cells[5, 0] := 'Digital 3';
    StringGrid1.Cells[6, 0] := 'Digital 4';
    StringGrid1.Cells[7, 0] := 'Digital 5';

    for index := 1 to QuantidadeUsuarios do
    begin
      rep.iDClass_LerUsuario(pis, nome, matricula, codigo, senha, barras, rfid, privilegios, templates);
      StringGrid1.Cells[0, index] := index.ToString;
      StringGrid1.Cells[1, index] := nome;
      StringGrid1.Cells[2, index] := pis.ToString;

      rep.CarregarTemplatesUsuario(pis, quantidadeTemplates);

      indexDigital := 3;

      for indexTemplates := 0 to quantidadeTemplates do
      begin
        if rep.LerTemplate(templates) then
        begin
          StringGrid1.Cells[indexDigital, index] := '1';
        end
        else
        begin
          StringGrid1.Cells[indexDigital, index] := '0';
        end;

        indexDigital :=  indexDigital + 1;
      end;
    end;
  end
  else
  begin
    LabelStatusMostrarUsuarios.Caption := 'Não foi possivel carregar';
  end;
end;

procedure TFormExemploREP.ConectarREP;
var
  IPAddress: String;
  StatusConexao: Integer;

begin
  LabelStatus.Caption := 'Conectando...';
  IPAddress := EditIP.Text;

  if rep = nil then
  begin
    rep := CoRepCid_.Create;
  end;

  StatusConexao := rep.Conectar(WideString(IPAddress), Integer(443), Cardinal(0));

  if StatusConexao = 1 then
  begin
    LabelStatus.Caption := 'Conectado a ' + IPAddress + ':443';
    REPConectado;
  end
  else
  begin
    LabelStatus.Caption := 'Não foi possível conectar';
    REPDesconectado;
  end;
end;

procedure TFormExemploREP.DesconectarREP;
begin
  rep.Desconectar;
  LabelStatus.Caption := 'Desconectado';
  REPDesconectado;
end;

procedure TFormExemploREP.REPConectado;
begin
  EditIP.Enabled := false;
  ButtonConectar.Enabled := false;
  ButtonDesconectar.Enabled := true;
  ButtonMostrarUsuariosPSafeArray.Enabled := true;
  ButtonMostrarUsuariosBase64.Enabled := true;
end;

procedure TFormExemploREP.REPDesconectado;
begin
  EditIP.Enabled := true;
  ButtonConectar.Enabled := true;
  ButtonDesconectar.Enabled := false;
  ButtonMostrarUsuariosPSafeArray.Enabled := false;
  ButtonMostrarUsuariosBase64.Enabled := false;
end;

end.
