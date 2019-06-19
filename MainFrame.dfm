object FormExemploREP: TFormExemploREP
  Left = 0
  Top = 0
  AlphaBlendValue = 200
  BorderStyle = bsSingle
  Caption = 'Exemplo REP'
  ClientHeight = 344
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelIP: TLabel
    Left = 8
    Top = 8
    Width = 73
    Height = 13
    Caption = 'Endere'#231'o de IP'
  end
  object LabelStatusMostrarUsuarios: TLabel
    Left = 127
    Top = 62
    Width = 3
    Height = 13
  end
  object LabelPorta: TLabel
    Left = 135
    Top = 8
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object ButtonConectar: TButton
    Left = 387
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = ButtonConectarClick
  end
  object ButtonMostrarUsuariosPSafeArray: TButton
    Left = 8
    Top = 57
    Width = 217
    Height = 25
    Caption = 'Mostrar usuarios (byte[] / PSafeArray)'
    Enabled = False
    TabOrder = 1
    OnClick = ButtonMostrarUsuariosPSafeArrayClick
  end
  object EditIP: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '192.168.121.200'
  end
  object ButtonDesconectar: TButton
    Left = 387
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    Enabled = False
    TabOrder = 3
    OnClick = ButtonDesconectarClick
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 119
    Width = 454
    Height = 195
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 4
  end
  object ButtonMostrarUsuariosBase64: TButton
    Left = 8
    Top = 88
    Width = 217
    Height = 25
    Caption = 'Mostrar usuarios (Base64)'
    Enabled = False
    TabOrder = 5
    OnClick = ButtonMostrarUsuariosBase64Click
  end
  object EditPort: TEdit
    Left = 135
    Top = 27
    Width = 58
    Height = 21
    TabOrder = 6
    Text = '443'
  end
  object StatusBarMainFrame: TStatusBar
    Left = 0
    Top = 325
    Width = 470
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Desconectado'
    ExplicitLeft = 128
    ExplicitTop = 312
    ExplicitWidth = 0
  end
end
