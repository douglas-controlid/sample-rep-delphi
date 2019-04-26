program ExemploREP;

uses
  Forms,
  MainFrame in 'MainFrame.pas' {FormExemploREP},
  RepCid_TLB in 'RepCid_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormExemploREP, FormExemploREP);
  Application.Run;
end.
