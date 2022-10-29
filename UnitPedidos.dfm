object FormPedidos: TFormPedidos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pedidos'
  ClientHeight = 505
  ClientWidth = 819
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
    Left = 80
    Top = 64
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label2: TLabel
    Left = 82
    Top = 160
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label3: TLabel
    Left = 80
    Top = 110
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label4: TLabel
    Left = 489
    Top = 207
    Width = 163
    Height = 19
    Caption = 'Valor Total do Pediddo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DbeditCodigoproduto: TDBEdit
    Left = 472
    Top = 129
    Width = 121
    Height = 21
    DataField = 'codigoproduto'
    DataSource = DmPrincipal.DSProdutos
    Enabled = False
    TabOrder = 8
  end
  object LabeledEdit1: TLabeledEdit
    Left = 272
    Top = 37
    Width = 129
    Height = 21
    EditLabel.Width = 84
    EditLabel.Height = 13
    EditLabel.Caption = 'Codigo do Cliente'
    TabOrder = 0
  end
  object DBLCBxProdutos: TDBLookupComboBox
    Left = 80
    Top = 129
    Width = 377
    Height = 21
    KeyField = 'codigoproduto'
    ListField = 'descricao'
    ListFieldIndex = 1
    ListSource = DmPrincipal.DSProdutos
    TabOrder = 1
    OnCloseUp = DBLCBxProdutosCloseUp
  end
  object DBLCBxClientes: TDBLookupComboBox
    Left = 80
    Top = 83
    Width = 377
    Height = 21
    KeyField = 'codigo'
    ListField = 'nome'
    ListFieldIndex = 1
    ListSource = DmPrincipal.DataSource2
    TabOrder = 2
    OnCloseUp = DBLCBxClientesCloseUp
  end
  object BtnAdicionarProduto: TBitBtn
    Left = 80
    Top = 203
    Width = 121
    Height = 25
    Caption = '&Adicionar Produto'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BtnAdicionarProdutoClick
  end
  object BtnFinalizarPedido: TBitBtn
    Left = 207
    Top = 203
    Width = 145
    Height = 25
    Caption = '&Finalizar Pedido'
    Kind = bkIgnore
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BtnFinalizarPedidoClick
  end
  object EditQtde: TEdit
    Left = 80
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object lblPedido: TLabeledEdit
    Left = 82
    Top = 37
    Width = 129
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Pedido Numero'
    Enabled = False
    TabOrder = 6
    Text = '999'
  end
  object DBGridpedidoprodutos: TDBGrid
    Left = 82
    Top = 264
    Width = 729
    Height = 209
    DataSource = DmPrincipal.DSspedidosprodutos
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'iditem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numeropedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigoproduto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigoproduto_1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'precovenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Width = 76
        Visible = True
      end>
  end
  object MeTotal: TMaskEdit
    Left = 664
    Top = 205
    Width = 121
    Height = 27
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Text = ''
  end
  object DBEditCodigocliente: TDBEdit
    Left = 472
    Top = 83
    Width = 121
    Height = 21
    DataField = 'codigo'
    DataSource = DmPrincipal.DataSource2
    Enabled = False
    TabOrder = 10
  end
end
