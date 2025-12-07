object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Firewall Worker'
  ClientHeight = 659
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 202
      Height = 39
      Caption = 'Firewall Worker'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 224
      Top = 28
      Width = 258
      Height = 15
      Caption = 'for LAN, Service, ICMP && Applications and more.'
    end
    object Label26: TLabel
      Left = 224
      Top = 14
      Width = 192
      Height = 15
      Caption = 'Work easy with In-/ Outbound Rules'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 602
    Width = 767
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Scan Rules'
      TabOrder = 0
      TabStop = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 653
      Top = 6
      Width = 105
      Height = 25
      Caption = 'disable'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = Button2Click
    end
    object Button9: TButton
      Left = 127
      Top = 7
      Width = 75
      Height = 25
      Caption = 'abort'
      Enabled = False
      TabOrder = 2
      TabStop = False
      OnClick = Button9Click
    end
    object Button8: TButton
      Left = 540
      Top = 6
      Width = 105
      Height = 25
      Hint = 'Open Windows Firewall Settings'
      Caption = 'Firewall Settings'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = Button8Click
    end
    object Button7: TButton
      Left = 426
      Top = 6
      Width = 105
      Height = 25
      Hint = 'Open Windows Firewall Rule Settings'
      Caption = 'Rules'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      TabStop = False
      OnClick = Button7Click
    end
    object CheckBox1: TCheckBox
      Left = 224
      Top = 10
      Width = 140
      Height = 17
      TabStop = False
      Caption = 'Scan only Rule Names'
      TabOrder = 5
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 767
    Height = 545
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 427
      Top = 0
      Width = 5
      Height = 545
      Align = alRight
      ExplicitLeft = 9
      ExplicitTop = 2
      ExplicitHeight = 387
    end
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 427
      Height = 545
      TabStop = False
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 432
      Top = 0
      Width = 335
      Height = 545
      Align = alRight
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 335
        Height = 545
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        TabStop = False
        object TabSheet1: TTabSheet
          Caption = 'Firewall'
          object StringGrid1: TStringGrid
            Left = 0
            Top = 0
            Width = 327
            Height = 515
            Align = alClient
            ColCount = 2
            DrawingStyle = gdsGradient
            RowCount = 21
            GradientStartColor = clSilver
            GridLineWidth = 0
            ScrollBars = ssNone
            TabOrder = 0
            RowHeights = (
              24
              24
              24
              24
              24
              23
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24)
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Remove Rule'
          ImageIndex = 1
          object Label3: TLabel
            Left = 16
            Top = 404
            Width = 29
            Height = 15
            Caption = 'Rule :'
          end
          object Label1: TLabel
            Left = 16
            Top = 215
            Width = 64
            Height = 15
            Caption = 'Rule Name :'
          end
          object Label5: TLabel
            Left = 16
            Top = 32
            Width = 255
            Height = 15
            Caption = 'Type the rule name into the box and click delete.'
          end
          object Label6: TLabel
            Left = 16
            Top = 53
            Width = 225
            Height = 15
            Caption = 'Or scan the firewall'#39's rule list and copy the '
          end
          object Label7: TLabel
            Left = 16
            Top = 324
            Width = 204
            Height = 15
            Caption = 'Choose the outbound or inbound rule.'
          end
          object Label8: TLabel
            Left = 16
            Top = 345
            Width = 136
            Height = 15
            Caption = 'Both work independently.'
          end
          object Label9: TLabel
            Left = 16
            Top = 366
            Width = 178
            Height = 15
            Caption = 'Or remove both at the same time.'
          end
          object Label18: TLabel
            Left = 16
            Top = 74
            Width = 58
            Height = 15
            Caption = 'Rule Name'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 80
            Top = 74
            Width = 126
            Height = 15
            Caption = 'into the box to delete it.'
          end
          object Label20: TLabel
            Left = 16
            Top = 104
            Width = 166
            Height = 15
            Caption = 'Select In- / Outbound function,'
          end
          object Label21: TLabel
            Left = 16
            Top = 125
            Width = 201
            Height = 15
            Caption = 'but you can also delete both together.'
          end
          object ComboBox1: TComboBox
            Left = 51
            Top = 401
            Width = 155
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            TabStop = False
            Text = 'Inbound'
            Items.Strings = (
              'Inbound'
              'Outbound'
              'Both')
          end
          object Edit1: TEdit
            Left = 16
            Top = 236
            Width = 297
            Height = 21
            TabStop = False
            TabOrder = 1
          end
          object Button3: TButton
            Left = 230
            Top = 191
            Width = 75
            Height = 25
            Caption = 'Search'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            TabStop = False
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 230
            Top = 400
            Width = 75
            Height = 25
            Caption = 'Delete'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            TabStop = False
            OnClick = Button4Click
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Create Rule'
          ImageIndex = 2
          object Label4: TLabel
            Left = 58
            Top = 124
            Width = 29
            Height = 15
            Caption = 'Rule :'
          end
          object Label10: TLabel
            Left = 21
            Top = 194
            Width = 66
            Height = 15
            Caption = 'Description :'
          end
          object Label11: TLabel
            Left = 35
            Top = 227
            Width = 52
            Height = 15
            Caption = 'Program :'
          end
          object Label12: TLabel
            Left = 59
            Top = 259
            Width = 28
            Height = 15
            Caption = 'Port :'
          end
          object Label13: TLabel
            Left = 48
            Top = 293
            Width = 39
            Height = 15
            Caption = 'Group :'
          end
          object Label14: TLabel
            Left = 16
            Top = 32
            Width = 186
            Height = 15
            Caption = 'Select a rule mode, fill in the boxes,'
          end
          object Label15: TLabel
            Left = 49
            Top = 159
            Width = 38
            Height = 15
            Caption = 'Name :'
          end
          object Label16: TLabel
            Left = 44
            Top = 327
            Width = 43
            Height = 15
            Caption = 'Service :'
            Enabled = False
          end
          object Label22: TLabel
            Left = 3
            Top = 360
            Width = 84
            Height = 15
            Caption = 'Interface Types :'
            Enabled = False
          end
          object Label23: TLabel
            Left = 16
            Top = 394
            Width = 258
            Height = 15
            Caption = 'Standard Ethernet ports assigned IP addresses for'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 16
            Top = 415
            Width = 169
            Height = 15
            Caption = 'routing traffic (e.g., WAN, LAN).'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label25: TLabel
            Left = 16
            Top = 53
            Width = 252
            Height = 15
            Caption = 'and click "Create" to add the rule to the firewall.'
          end
          object Edit2: TEdit
            Left = 93
            Top = 192
            Width = 213
            Height = 21
            TabStop = False
            TabOrder = 0
            Text = 'allow network traffic TCP'
          end
          object ComboBox2: TComboBox
            Left = 93
            Top = 121
            Width = 213
            Height = 23
            Style = csDropDownList
            DropDownCount = 9
            ItemIndex = 0
            TabOrder = 1
            TabStop = False
            Text = 'Outbound'
            OnChange = ComboBox2Change
            Items.Strings = (
              'Outbound'
              'Inbound'
              'Application'
              'ICMP'
              'Service'
              'EdgeTraversal'
              'Protocol'
              'Interface'
              'LAN')
          end
          object Edit3: TEdit
            Left = 93
            Top = 225
            Width = 182
            Height = 21
            TabStop = False
            ReadOnly = True
            TabOrder = 2
          end
          object SpinEdit1: TSpinEdit
            Left = 93
            Top = 256
            Width = 77
            Height = 24
            TabStop = False
            Ctl3D = True
            MaxLength = 5
            MaxValue = 65535
            MinValue = 1
            ParentCtl3D = False
            TabOrder = 3
            Value = 4000
          end
          object Edit4: TEdit
            Left = 93
            Top = 291
            Width = 188
            Height = 21
            TabStop = False
            TabOrder = 4
          end
          object Button5: TButton
            Left = 281
            Top = 225
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 5
            TabStop = False
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 224
            Top = 464
            Width = 75
            Height = 25
            Caption = 'Create'
            TabOrder = 6
            TabStop = False
            OnClick = Button6Click
          end
          object Edit5: TEdit
            Left = 93
            Top = 157
            Width = 121
            Height = 21
            TabStop = False
            TabOrder = 7
          end
          object Edit6: TEdit
            Left = 93
            Top = 325
            Width = 121
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 8
          end
          object ComboBox3: TComboBox
            Left = 93
            Top = 357
            Width = 213
            Height = 23
            DropDownCount = 10
            Enabled = False
            ItemIndex = 0
            TabOrder = 9
            TabStop = False
            Text = 'Physical/Layer 3 Interfaces'
            OnChange = ComboBox3Change
            Items.Strings = (
              'Physical/Layer 3 Interfaces'
              'Virtual Wire (VWire)'
              'TAP (Test Access Point)'
              'Layer 2 Interfaces'
              'VLAN Interfaces/Sub-interfaces'
              'Aggregate Ethernet (LAG)'
              'Tunnel Interfaces'
              'Loopback'
              'HA (High Availability)'
              'Software/Hardware Switches')
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 640
    Width = 767
    Height = 19
    Panels = <
      item
        Text = 'Count :'
        Width = 50
      end
      item
        Text = '0'
        Width = 50
      end
      item
        Text = 'Rules :'
        Width = 50
      end
      item
        Width = 380
      end
      item
        Text = 'Firewall :'
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Executable (*.EXE; *.COM)|*.exe; *.com;'
    Left = 72
    Top = 97
  end
end
