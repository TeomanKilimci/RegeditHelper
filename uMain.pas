unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uRegeditHelper;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TRegeditHelper.GetInstance.OpenKey := 'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION';
  label2.Caption := ExtractFileName(ParamStr(0)) + ' ' + IntToStr(TRegeditHelper.GetInstance.Load(ExtractFileName(ParamStr(0)), 99999))
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if TRegeditHelper.GetInstance.Load('warning', False) then
    ShowMessage('warning')
  else
    ShowMessage('no warning');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TRegeditHelper.GetInstance.Save('warning', CheckBox1.Checked);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //HKEY_CURRENT_USER
  TRegeditHelper.GetInstance.OpenKey := 'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION';
  TRegeditHelper.GetInstance.Save(ExtractFileName(ParamStr(0)), SpinEdit1.Value);

  //Read
  label2.Caption := ExtractFileName(ParamStr(0)) + ' ' + IntToStr(TRegeditHelper.GetInstance.Load(ExtractFileName(ParamStr(0)), 0))
end;

end.

