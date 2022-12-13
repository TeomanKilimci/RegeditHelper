object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 145
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 581
    Height = 13
    Caption = 
      'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\MAIN\Feat' +
      'ureControl\FEATURE_BROWSER_EMULATION'
  end
  object Label2: TLabel
    Left = 32
    Top = 91
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 175
    Top = 12
    Width = 75
    Height = 25
    Caption = 'reg.Read'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 79
    Top = 12
    Width = 75
    Height = 25
    Caption = 'reg.Write'
    TabOrder = 1
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 16
    Width = 65
    Height = 17
    Caption = 'warning'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 256
    Top = 91
    Width = 75
    Height = 25
    Caption = 'change'
    TabOrder = 3
    OnClick = Button3Click
  end
  object SpinEdit1: TSpinEdit
    Left = 192
    Top = 91
    Width = 58
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
end
