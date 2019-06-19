object frmGeradorDeSql: TfrmGeradorDeSql
  Left = 0
  Top = 0
  Caption = 'Gerador de SQL'
  ClientHeight = 319
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel
    Left = 8
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Colunas:'
  end
  object lblTabelas: TLabel
    Left = 207
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Tabelas:'
  end
  object lblCondicoes: TLabel
    Left = 410
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Condi'#231#245'es:'
  end
  object lblSQL: TLabel
    Left = 8
    Top = 173
    Width = 26
    Height = 13
    Caption = 'SQL: '
  end
  object memColunas: TMemo
    Left = 8
    Top = 35
    Width = 185
    Height = 89
    TabOrder = 0
  end
  object memTabelas: TMemo
    Left = 207
    Top = 35
    Width = 185
    Height = 89
    TabOrder = 1
  end
  object memCondicoes: TMemo
    Left = 410
    Top = 35
    Width = 185
    Height = 89
    TabOrder = 2
  end
  object btnGerarSql: TButton
    Left = 240
    Top = 144
    Width = 105
    Height = 25
    Caption = 'Gerar SQL'
    TabOrder = 3
    OnClick = btnGerarSqlClick
  end
  object memSQL: TMemo
    Left = 8
    Top = 192
    Width = 587
    Height = 119
    ReadOnly = True
    TabOrder = 4
  end
end
