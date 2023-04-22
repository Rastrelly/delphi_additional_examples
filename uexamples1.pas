unit uexamples1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math,
  Windows;

type

  { TForm1 }

  ENilInteger = Class(Exception);

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  arr:array of integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,l:integer;
begin
  l:=random(91)+10;
  setlength(arr,l);
  for i:=0 to l-1 do arr[i]:=random(202)-100;
end;

procedure TForm1.Button2Click(Sender: TObject);
var array_element:integer;
begin
  Memo1.Clear;
  for array_element in arr do
  begin
    Memo1.Lines.Add(inttostr(array_element));
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var vr:integer;
    a:real;
    arr:array of integer;
    tf:textfile;
    strvar:string;
begin
  vr:=random(3);
  try
    if (vr=0) then
    begin
      a:=sqrt(-1);
      if IsNan(a) then
        raise ENilInteger.Create('Nil Integer');
    end;

    if (vr=1) then
    begin
      arr[22]:=8;
    end;

    if vr=2 then
    begin
      AssignFile(tf,'somefilethatisnotreal.fls');
      Reset(tf);
      ReadLn(tf,strvar);
      CloseFile(tf);
    end;

  except
    on E:ENilInteger do ShowMessage('Our Exception: '+E.Message);
    on E:Exception do ShowMessage('System Exception: '+E.Message);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ShellExecute(Handle,'open',pchar(OpenDialog1.FileName),nil,nil,1);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;

end.

