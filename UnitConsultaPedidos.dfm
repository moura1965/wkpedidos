object FormConsultaPedidos: TFormConsultaPedidos
  Left = 0
  Top = 0
  Caption = 'Consulta Geral de Pedidos'
  ClientHeight = 465
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 41
    Align = alTop
    Caption = 'LIsta de Pedidos Gerados'
    TabOrder = 0
    object BtnCancelar: TBitBtn
      Left = 593
      Top = 10
      Width = 147
      Height = 25
      Caption = 'Cancelar  Pedido'
      TabOrder = 0
      OnClick = BtnCancelarClick
    end
    object EditNUmeropedido: TEdit
      Left = 17
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'EditNUmeropedido'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 791
    Height = 424
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 789
      Height = 200
      Align = alTop
      Caption = 'Panel3'
      TabOrder = 0
      object DBGridPedidos: TDBGrid
        Left = 16
        Top = 7
        Width = 789
        Height = 193
        DataSource = DmPrincipal.DataSourcePedidos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'numeropedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataemissao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valortotal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigocliente'
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 207
      Width = 789
      Height = 216
      Align = alBottom
      Caption = 'Panel4'
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 787
        Height = 214
        Align = alClient
        DataSource = DmPrincipal.DSspedidosprodutos
        TabOrder = 0
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
            FieldName = 'descricao'
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_unitario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total'
            Visible = True
          end>
      end
    end
  end
end
