unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CPortCtl, StrUtils,
  CPort, IniFiles, scStyledForm, scStyleManager;

type
  TMain = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    mmRxChar: TMemo;
    Label2: TLabel;
    Combo1: TComComboBox;
    Combo2: TComComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Combo3: TComComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Combo4: TComComboBox;
    Combo5: TComComboBox;
    Combo6: TComComboBox;
    Label7: TLabel;
    Panel3: TPanel;
    edtTxChar: TEdit;
    btnDoor: TButton;
    btnTrans: TButton;
    btnSend: TButton;
    btnLED: TButton;
    btnIndicator: TButton;
    btnSensor: TButton;
    lblDesc: TLabel;
    btnClear: TButton;
    btnOpen: TButton;
    btnClose: TButton;
    ComPort: TComPort;
    btnRxCharStatus: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnDoorClick(Sender: TObject);
    procedure btnLEDClick(Sender: TObject);
    procedure btnIndicatorClick(Sender: TObject);
    procedure btnSensorClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure btnSendClick(Sender: TObject);
    procedure Combo1Change(Sender: TObject);
    procedure btnRxCharStatusClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnTransClick(Sender: TObject);
  private
    procedure ClearComponents;
    function HexToString(H: String): String;
    function StringToHex(S: String): string;
    procedure LoadConfig;
    procedure SaveConfig;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

  gsPort, gsBaudRate, gsDataBits, gsStopBits, gsParity : string;
  StrBuffer : TStringList;

implementation

{$R *.dfm}

procedure TMain.btnClearClick(Sender: TObject);
begin
  StrBuffer.Clear;
  mmRxChar.Lines.Clear;
end;

procedure TMain.btnCloseClick(Sender: TObject);
begin
  if ComPort.Connected then
  begin
    ComPort.Close;
    btnOpen.Enabled := True;
    btnClose.Enabled := False;
  end;
end;

procedure TMain.btnDoorClick(Sender: TObject);
begin
  btnDoor.Tag := btnDoor.Tag + 1;
  if btnDoor.Tag > 4 then btnDoor.Tag := 0;  

  case btnDoor.Tag of
    0:
      begin
        btnDoor.Caption := 'Door';
        lblDesc.Caption := '';
        edtTxChar.Clear;
      end;
    1:
      begin
        btnDoor.Caption := 'Open A';
        lblDesc.Caption := 'Open A direction : STX  C  D  A  ETX' + sLineBreak + '                02   43 44 41 03';
        edtTxChar.Text := '02 43 44 41 03';
      end;
    2:
      begin
        btnDoor.Caption := 'Close';
        lblDesc.Caption := 'Close the door : STX  C  D  C  ETX' + sLineBreak + '                02   43 44 43 03';
        edtTxChar.Text := '02 43 44 43 03';
      end;
    3:
      begin
        btnDoor.Caption := 'Open B';
        lblDesc.Caption := 'Open B direction : STX  C  D  B  ETX' + sLineBreak + '                02   43 44 42 03';
        edtTxChar.Text := '02 43 44 42 03';
      end;
    4:
      begin
        btnDoor.Caption := 'Close';
        lblDesc.Caption := 'Close the door : STX  C  D  C  ETX' + sLineBreak + '                02   43 44 41 03';
        edtTxChar.Text := '02 43 44 43 03';
      end;
  end;
end;

procedure TMain.btnIndicatorClick(Sender: TObject);
begin
  btnIndicator.Tag := btnIndicator.Tag + 1;
  if btnIndicator.Tag > 4 then btnIndicator.Tag := 0;

  case btnIndicator.Tag of
    0:
      begin
        btnIndicator.Caption := 'Indicator';
        lblDesc.Caption := '';
        edtTxChar.Clear;
      end;
    1:
      begin
        btnIndicator.Caption := 'Indicator G On';
        lblDesc.Caption := 'Indicator : STX  C  G  O  ETX' + sLineBreak + '            02   43 47 4F 03';
        edtTxChar.Text := '02 43 47 4F 03';
      end;
    2:
      begin
        btnIndicator.Caption := 'Indicator G Off';
        lblDesc.Caption := 'Indicator : STX  C  G  F  ETX' + sLineBreak + '            02   43 47 46 03';
        edtTxChar.Text := '02 43 47 46 03';
      end;
    3:
      begin
        btnIndicator.Caption := 'Indicator R On';
        lblDesc.Caption := 'Indicator : STX  C  R  O  ETX' + sLineBreak + '            02   43 52 4F 03';
        edtTxChar.Text := '02 43 31 4F 03';
      end;
    4:
      begin
        btnIndicator.Caption := 'Indicator R Off';
        lblDesc.Caption := 'Indicator : STX  C  R  F  ETX' + sLineBreak + '            02   43 52 46 03';
        edtTxChar.Text := '02 43 31 46 03';
      end;
  end;
end;

procedure TMain.btnLEDClick(Sender: TObject);
begin
  btnLED.Tag := btnLED.Tag + 1;
  if btnLED.Tag > 4 then btnLED.Tag := 0;

  case btnLED.Tag of
    0:
      begin
        btnLED.Caption := 'LED';
        lblDesc.Caption := '';
        edtTxChar.Clear;
      end;
    1:
      begin
        btnLED.Caption := 'LED 1 Red';
        lblDesc.Caption := 'LED : STX  C  1  R  ETX' + sLineBreak + '      02   43 31 52 03';
        edtTxChar.Text := '02 43 31 52 03';
      end;
    2:
      begin
        btnLED.Caption := 'LED 1 Green';
        lblDesc.Caption := 'LED : STX  C  1  G  ETX' + sLineBreak + '      02   43 31 47 03';
        edtTxChar.Text := '02 43 31 47 03';
      end;
    3:
      begin
        btnLED.Caption := 'LED 1 Blue';
        lblDesc.Caption := 'LED : STX  C  1  B  ETX' + sLineBreak + '      02   43 31 42 03';
        edtTxChar.Text := '02 43 31 42 03';
      end;
    4:
      begin
        btnLED.Caption := 'LED 1 Off';
        lblDesc.Caption := 'LED : STX  C  1  F  ETX' + sLineBreak + '      02   43 31 46 03';
        edtTxChar.Text := '02 43 31 46 03';
      end;
  end;
end;

procedure TMain.btnSendClick(Sender: TObject);
var
  Str: String;
begin
  Str := HexToString(StringReplace(edtTxChar.Text, ' ', '', [rfReplaceAll]));
  ComPort.WriteStr(Str);
end;

procedure TMain.btnSensorClick(Sender: TObject);
begin
  btnSensor.Caption := 'Sensor';
  lblDesc.Caption := 'Sensor : STX R S S ETX';
  edtTxChar.Text := '02 52 53 53 03';
end;

procedure TMain.btnTransClick(Sender: TObject);
begin
  if btnTrans.Tag = 0 then
  begin
    btnTrans.Tag := 1;
    btnTrans.Caption := 'HEX';
  end
  else
  begin
    btnTrans.Tag := 0;
    btnTrans.Caption := 'ASCII';
  end;
end;

procedure TMain.btnOpenClick(Sender: TObject);
begin
  SaveConfig;

  if not ComPort.Connected then
  begin
    ComPort.Port := Combo1.Text;
    ComPort.BaudRate := StrToBaudRate(Combo2.Text);
    ComPort.DataBits := StrToDataBits(Combo3.Text);
    ComPort.StopBits := StrToStopBits(Combo4.Text);
    ComPort.Parity.Bits := StrToParity(Combo5.Text);

    ComPort.Open;
    btnOpen.Enabled := False;
    btnClose.Enabled := True;
  end;
end;

procedure TMain.btnRxCharStatusClick(Sender: TObject);
begin
  if btnRxCharStatus.Tag = 0 then
  begin
    btnRxCharStatus.Tag := 1;
    btnRxCharStatus.Caption := 'HEX';
  end
  else
  begin
    btnRxCharStatus.Tag := 0;
    btnRxCharStatus.Caption := 'ASCII';
  end;
end;

procedure TMain.ClearComponents;
var
  i, j: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].ClassType = TEdit then
    begin
      TEdit(Components[i]).Text := '';
    end
    else if Components[i].ClassType = TMemo then
    begin
      if Pos('mm', TMemo(Components[i]).Name) > 0 then;
        TMemo(Components[i]).Lines.Clear;
    end
    else if Components[i].ClassType = TLabel then
    begin
      if Pos('lbl', TLabel(Components[i]).Name) > 0 then
        TLabel(Components[i]).Caption := '';
    end
    else if Components[i].ClassType = TButton then
    begin
      if Pos('btn', TButton(Components[i]).Name) > 0 then
        TButton(Components[i]).Enabled := True;
    end;
  end;
end;

procedure TMain.Combo1Change(Sender: TObject);
begin
  gsPort := Combo1.Text;
  LoadConfig;
end;

procedure TMain.ComPortRxChar(Sender: TObject; Count: Integer);
var
  Str : string;
  TmpStr, TmpStr2 : string;
  i : Integer;
begin
  ComPort.ReadStr(Str, Count);
  StrBuffer.Add(Str);
//
//  if btnRxCharStatus.Tag = 1 then
//  begin
//    for i := 0 to Str.Length div 2 do
//    begin
//      if Copy(StringToHex(Str),i,2) = '03' then
//        TmpStr2 := sLineBreak
//      else
//        TmpStr2 := ' ';
//
//      TmpStr := TmpStr + Copy(StringToHex(Str),i,2) + TmpStr2;
//    end;
//    mmRxChar.Text := mmRxChar.Text + TmpStr;
//  end
//  else
//  begin
//    if Str.Contains(#3) then Str := Str + sLineBreak;
//
//    mmRxChar.Text := mmRxChar.Text + Str;
//  end;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  StrBuffer := TStringList.Create;

  ClearComponents;
end;

function TMain.StringToHex(S: String): string;
var I: Integer;
begin
  Result:= '';
  for I := 1 to length (S) do
    Result:= Result+IntToHex(ord(S[i]),2);
end;

procedure TMain.Timer1Timer(Sender: TObject);
var
  i : Integer;
  BufferStr, TmpStr, TmpStr2 : string;
begin
  if Trim(StrBuffer.Text) = '' then Exit;

  BufferStr := BufferStr + StrBuffer[0];
  StrBuffer.Delete(0);

  if btnRxCharStatus.Tag = 1 then
  begin
    for i := 1 to BufferStr.Length do
    begin
      if Copy(StringToHex(BufferStr),i*2-1,2) = '03' then
        TmpStr2 := sLineBreak
      else
        TmpStr2 := ' ';

      TmpStr := TmpStr + Copy(StringToHex(BufferStr),i*2-1,2) + TmpStr2;
    end;
    mmRxChar.Text := mmRxChar.Text + TmpStr;
  end
  else
  begin
    if BufferStr.Contains(#3) then BufferStr := BufferStr + sLineBreak;

    mmRxChar.Text := mmRxChar.Text + BufferStr;
  end;

  SendMessage(mmRxChar.Handle, EM_LINESCROLL, 0,mmRxChar.Lines.Count);
end;

function TMain.HexToString(H: String): String;
var I: Integer;
begin
  Result:= '';
  for I := 1 to length (H) div 2 do
    Result:= Result+Char(StrToInt('$'+Copy(H,(I-1)*2+1,2)));
end;

procedure TMain.LoadConfig;
var
  ini : TIniFile;
  filepath : string;
begin
  filepath := ChangeFileExt(Application.ExeName, '.ini');
  ini := TIniFile.Create(filepath);

  try
    gsPort := ini.ReadString(IfThen(Combo1.Text = '', 'COM', Combo1.Text), 'PORT', 'COM');
    gsBaudRate := ini.ReadString(gsPort, 'BAUDRATE', '9600');
    gsDataBits := ini.ReadString(gsPort, 'DATABITS', '8');
    gsStopBits := ini.ReadString(gsPort, 'STOPBITS', '1');
    gsParity := ini.ReadString(gsPort, 'PARITY', 'NONE');

    Combo1.Text := gsPort;
    Combo2.Text := gsBaudRate;
    Combo3.Text := gsDataBits;
    Combo4.Text := gsStopBits;
    Combo5.Text := gsParity;
  finally
    FreeAndNil(ini);
  end;
end;

procedure TMain.SaveConfig;
var
  ini : TIniFile;
  filepath : string;
begin
  filepath := ChangeFileExt(Application.ExeName, '.ini');
  ini := TIniFile.Create(filepath);

  try
    ini.WriteString(gsPort, 'PORT', Combo1.Text);
    ini.WriteString(gsPort, 'BAUDRATE', Combo2.Text);
    ini.WriteString(gsPort, 'DATABITS', Combo3.Text);
    ini.WriteString(gsPort, 'STOPBITS', Combo4.Text);
    ini.WriteString(gsPort, 'PARITY', Combo5.Text);
  finally
    FreeAndNil(ini);
  end;
end;

end.
