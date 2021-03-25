program Comcomu;

uses
  Vcl.Forms,
  FMain in 'FMain.pas' {Main},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('TabletDark');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
