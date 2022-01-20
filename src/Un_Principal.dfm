object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 436
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 55
    Width = 417
    Height = 370
  end
  object Label1: TLabel
    Left = 24
    Top = 193
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 151
    Top = 104
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel
    Left = 272
    Top = 104
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label4: TLabel
    Left = 160
    Top = 193
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 177
    Height = 25
    Caption = 'Incluir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditNome: TLabeledEdit
    Left = 24
    Top = 80
    Width = 384
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 1
    Text = 'FRANCISCO CARLOS PEREIRA DA SILVA'
  end
  object EditIdentidade: TLabeledEdit
    Left = 24
    Top = 123
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Identidade'
    TabOrder = 2
    Text = '4034000'
  end
  object EditEmail: TLabeledEdit
    Left = 24
    Top = 166
    Width = 384
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'E-mail'
    TabOrder = 5
    Text = 'logo_suporte@hotmail.com'
  end
  object EditLogradouro: TLabeledEdit
    Left = 24
    Top = 297
    Width = 384
    Height = 21
    Color = 12369084
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Lagradouro'
    ReadOnly = True
    TabOrder = 10
  end
  object EditNumero: TLabeledEdit
    Left = 287
    Top = 210
    Width = 121
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero'
    TabOrder = 8
    Text = '188'
  end
  object EditComplemento: TLabeledEdit
    Left = 24
    Top = 253
    Width = 384
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Complemento'
    TabOrder = 9
    Text = 'rua da padaria'
  end
  object EditBairro: TLabeledEdit
    Left = 24
    Top = 340
    Width = 217
    Height = 21
    Color = 12369084
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro'
    ReadOnly = True
    TabOrder = 11
  end
  object EditCidade: TLabeledEdit
    Left = 264
    Top = 341
    Width = 144
    Height = 21
    Color = 12369084
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    ReadOnly = True
    TabOrder = 12
  end
  object EditUF: TLabeledEdit
    Left = 24
    Top = 384
    Width = 217
    Height = 21
    Color = 12369084
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Estado'
    ReadOnly = True
    TabOrder = 13
  end
  object EditPais: TLabeledEdit
    Left = 264
    Top = 384
    Width = 144
    Height = 21
    Color = 12369084
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Pais'
    ReadOnly = True
    TabOrder = 14
  end
  object ComboboxEndereco: TComboBox
    Left = 24
    Top = 210
    Width = 130
    Height = 21
    ItemIndex = 0
    TabOrder = 6
    Text = 'Residencial'
    Items.Strings = (
      'Residencial'
      'Comercial')
  end
  object Button2: TButton
    Left = 248
    Top = 24
    Width = 177
    Height = 25
    Caption = 'Salvar - Enviar'
    TabOrder = 15
    OnClick = Button2Click
  end
  object EditCPF: TMaskEdit
    Left = 151
    Top = 123
    Width = 117
    Height = 21
    EditMask = '000.000.000-00;0;_'
    MaxLength = 14
    TabOrder = 3
    Text = '78217399655'
  end
  object EditTelefone: TMaskEdit
    Left = 275
    Top = 123
    Width = 131
    Height = 21
    EditMask = '!\(99\)00000-0000;1;_'
    MaxLength = 14
    TabOrder = 4
    Text = '(  )     -    '
  end
  object EditCEP: TMaskEdit
    Left = 160
    Top = 210
    Width = 111
    Height = 21
    EditMask = '00000\-999;0;_'
    MaxLength = 9
    TabOrder = 7
    Text = ''
    OnExit = EditCEPExit
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 656
    Top = 16
  end
end