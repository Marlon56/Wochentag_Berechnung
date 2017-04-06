unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Berechne: TBitBtn;
    Bneu: TBitBtn;
    Bschliesen: TBitBtn;
    ETag: TEdit;
    Emonat: TEdit;
    Ejahr: TEdit;
    Lfehlermeldung: TLabel;
    LTag: TLabel;
    Lwochentag: TLabel;
    Lpunkt2: TLabel;
    Lpunkt1: TLabel;
    Ldatum: TLabel;
    Lueberschrift: TLabel;
    procedure BerechneClick(Sender: TObject);
    procedure BneuClick(Sender: TObject);
    procedure BschliesenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure test (x,y,z:string;var x1,y2,z2:integer; var ok:boolean);
begin
   ok:=true ;
    try
      x1:=strtoint(x);
      y2:=strtoint(y);
      z2:=strtoint(z);
    except
      ok:=false;
    end;
   end;

function wochentage (t,m,j:integer):integer;
var h,k:integer;
  begin
    if
      m <= 2 then
       begin
        h:=m+12;
        k:=j-1;
       end
   else
    begin
      h:=m;
      k:=j;
    end;

   result:=(t+2*h+(3*h+3)div 5+ k+ k div 4-k div 100 +k div 400+1) mod 7;
  end;

procedure TForm1.BerechneClick(Sender: TObject);
var h, k, t, m, j, wochentag:integer; var ok:boolean;
begin
   test(ETag.text, Emonat.text, Ejahr.text, t, m, j, ok);

   if ok=false then
    begin
      Lfehlermeldung.caption:='Bitte reele Zahlen angeben';
    end
   else
    begin
     case wochentage (t,m,j) of
       1: LTag.caption:='Montag';
       2: LTag.caption:='Dienstag';
       3: LTag.caption:='Mittwoch';
       4: LTag.caption:='Donnerstag';
       5: LTag.caption:='Freitag';
       6: LTag.caption:='Samstag';
       0: LTag.caption:='Sonntag';
     end;
   end;



end;

procedure TForm1.BneuClick(Sender: TObject);
begin
   ETag.Caption:='';
   Emonat.caption:='';
   Ejahr.Caption:='';
   LTag.caption:='';
   Lfehlermeldung.caption:='';
end;

procedure TForm1.BschliesenClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

