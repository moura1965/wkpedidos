object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Pedidos WK  V 1.0'
  ClientHeight = 520
  ClientWidth = 953
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
  object pnStatus: TPanel
    Left = 0
    Top = 479
    Width = 953
    Height = 41
    Align = alBottom
    Caption = 'pnStatus'
    TabOrder = 0
  end
  object PnMenu: TPanel
    Left = 0
    Top = 0
    Width = 953
    Height = 41
    Align = alTop
    Caption = 'Lan'#231'amento de Pedidos'
    Color = clCream
    ParentBackground = False
    TabOrder = 1
    object BtnConfig: TBitBtn
      Left = 112
      Top = 11
      Width = 121
      Height = 25
      Caption = 'Configurar DB'
      TabOrder = 0
      OnClick = BtnConfigClick
    end
    object MemoConfig: TMemo
      Left = 632
      Top = 0
      Width = 137
      Height = 86
      Lines.Strings = (
        '')
      TabOrder = 1
      Visible = False
    end
  end
  object BtnPedidos: TBitBtn
    Left = 8
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Pedidos'
    Default = True
    TabOrder = 2
    OnClick = BtnPedidosClick
  end
  object pnGeral: TPanel
    Left = 0
    Top = 41
    Width = 953
    Height = 438
    Align = alClient
    TabOrder = 3
    object pnGrid: TPanel
      Left = 1
      Top = 184
      Width = 951
      Height = 253
      Align = alBottom
      TabOrder = 0
      object DbgItens: TDBGrid
        Left = 0
        Top = 1
        Width = 950
        Height = 251
        Align = alRight
        DataSource = DmPrincipal.DSProdutos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 768
      Height = 183
      Align = alLeft
      DataSource = DmPrincipal.DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
