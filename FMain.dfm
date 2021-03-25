object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 365
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 249
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 389
      Top = 0
      Width = 233
      Height = 249
      Align = alRight
      Caption = '[ Comport Setting ]'
      TabOrder = 0
      DesignSize = (
        233
        249)
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 22
        Height = 15
        Caption = 'Port'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 51
        Height = 15
        Caption = 'Baud rate'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 96
        Width = 48
        Height = 15
        Caption = 'Data bits'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 128
        Width = 48
        Height = 15
        Caption = 'Stop bits'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 160
        Width = 30
        Height = 15
        Caption = 'Parity'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 192
        Width = 67
        Height = 15
        Caption = 'Flow control'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
      end
      object Combo1: TComComboBox
        Left = 99
        Top = 24
        Width = 129
        Height = 29
        ComProperty = cpPort
        Text = ''
        Style = csDropDownList
        ItemIndex = -1
        TabOrder = 0
        OnChange = Combo1Change
      end
      object Combo2: TComComboBox
        Left = 99
        Top = 56
        Width = 129
        Height = 29
        ComProperty = cpBaudRate
        Text = 'Custom'
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
      end
      object Combo3: TComComboBox
        Left = 99
        Top = 88
        Width = 129
        Height = 29
        ComProperty = cpDataBits
        Text = '8'
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 2
      end
      object Combo4: TComComboBox
        Left = 99
        Top = 120
        Width = 129
        Height = 29
        ComProperty = cpStopBits
        Text = '1'
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
      end
      object Combo5: TComComboBox
        Left = 99
        Top = 152
        Width = 129
        Height = 29
        ComProperty = cpParity
        Text = 'None'
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
      end
      object Combo6: TComComboBox
        Left = 99
        Top = 184
        Width = 129
        Height = 29
        ComProperty = cpFlowControl
        Text = 'None'
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 5
      end
      object btnOpen: TButton
        Left = 11
        Top = 219
        Width = 103
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Open'
        TabOrder = 6
        OnClick = btnOpenClick
      end
      object btnClose: TButton
        Left = 121
        Top = 219
        Width = 103
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Close'
        TabOrder = 7
        OnClick = btnCloseClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 389
      Height = 249
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      ShowCaption = False
      TabOrder = 1
      DesignSize = (
        389
        249)
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 389
        Height = 21
        Align = alTop
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = '[ Received Data ]'
        ParentBiDiMode = False
        ExplicitWidth = 128
      end
      object mmRxChar: TMemo
        Left = 0
        Top = 21
        Width = 389
        Height = 228
        Align = alClient
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Lines.Strings = (
          'mmRxChar')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object btnRxCharStatus: TButton
        Left = 320
        Top = 1
        Width = 62
        Height = 20
        Anchors = [akTop, akRight]
        Caption = 'ASCII'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnRxCharStatusClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 249
    Width = 622
    Height = 116
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      622
      116)
    object lblDesc: TLabel
      Left = 408
      Top = 6
      Width = 209
      Height = 58
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object edtTxChar: TEdit
      Left = 8
      Top = 70
      Width = 437
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edtTxChar'
    end
    object btnDoor: TButton
      Left = 85
      Top = 6
      Width = 75
      Height = 58
      Caption = 'Door'
      TabOrder = 1
      OnClick = btnDoorClick
    end
    object btnTrans: TButton
      Left = 461
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'ASCII'
      TabOrder = 2
      OnClick = btnTransClick
    end
    object btnSend: TButton
      Left = 542
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Send'
      TabOrder = 3
      OnClick = btnSendClick
    end
    object btnLED: TButton
      Left = 166
      Top = 6
      Width = 75
      Height = 58
      Caption = 'LED'
      TabOrder = 4
      OnClick = btnLEDClick
    end
    object btnIndicator: TButton
      Left = 247
      Top = 6
      Width = 75
      Height = 58
      Caption = 'Indicator'
      TabOrder = 5
      OnClick = btnIndicatorClick
    end
    object btnSensor: TButton
      Left = 328
      Top = 6
      Width = 75
      Height = 58
      Caption = 'Sensor'
      TabOrder = 6
      OnClick = btnSensorClick
    end
    object btnClear: TButton
      Left = 4
      Top = 6
      Width = 75
      Height = 58
      Caption = 'Clear'
      TabOrder = 7
      OnClick = btnClearClick
    end
  end
  object ComPort: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComPortRxChar
    Left = 576
    Top = 265
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 528
    Top = 265
  end
end
