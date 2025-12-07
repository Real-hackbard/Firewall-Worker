unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ComObj, ActiveX, Vcl.StdCtrls, Firewall, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.Samples.Spin, ShellApi;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Label10: TLabel;
    Edit3: TEdit;
    Label11: TLabel;
    SpinEdit1: TSpinEdit;
    Label12: TLabel;
    Edit4: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    OpenDialog1: TOpenDialog;
    Button5: TButton;
    Button6: TButton;
    Edit5: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit6: TEdit;
    Label17: TLabel;
    Button9: TButton;
    Button8: TButton;
    Button7: TButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ComboBox3: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    CheckBox1: TCheckBox;
    Label26: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  num : integer = 0;
  abort : boolean;

implementation

{$R *.dfm}
{$R 'admin.res'}
(* A firewall in a LAN (Local Area Network) is a security barrier that
   monitors and controls data traffic between your internal network and
   external networks (such as the Internet/WAN) by deciding, based on
   predefined rules, which data packets are allowed to pass and which are
   blocked to prevent unauthorized access and malware.*)
Procedure AddLANRule;
Const
 NET_FW_IP_PROTOCOL_TCP = 6;
 NET_FW_ACTION_ALLOW = 1;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Interfacetypes := Form1.ComboBox3.Text;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* A firewall interface is a network connection (physical like Ethernet
   or logical like VLAN/Tunnel) on a firewall device that directs traffic,
   assigned to a security Zone (WAN, LAN, DMZ) with an IP Address, enabling
   traffic filtering based on rules, and can have specific
   modes (Layer 3, Virtual Wire, Tap) and management access
   profiles for security.*)
Procedure AddPerInterfaceRule;
Const
 NET_FW_IP_PROTOCOL_TCP = 6;
 NET_FW_IP_PROTOCOL_UDP = 17;
 NET_FW_ACTION_ALLOW = 1;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Interfacetypes := Form1.ComboBox3.Text;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Interfaces := VarArrayOf(['Local Area Connection']);
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* Firewalls filter network traffic (data packets) using rules based on
   IP addresses, ports, and protocols (like TCP, UDP, ICMP) to allow or
   block communication between trusted and untrusted networks.*)
Procedure AddProtocolRule;
Const
 NET_FW_ACTION_ALLOW = 1;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Protocol := Form1.SpinEdit1.Value;
  NewRule.Enabled := True;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* Firewall edge traversal refers to techniques allowing
   traffic (often tunneled IPv6 or specific protocols like VoIP) to pass
   through Network Address Translators (NATs) and firewalls, using methods
   like Teredo (IPv6-in-IPv4) or "UDP bubbles" to maintain state, crucial
   for remote access (DirectAccess) and P2P, but requires specific firewall
   rule settings (e.g., Windows Firewall's
   NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP) to enable it, balancing
   connectivity with security risks.*)
Procedure AddRuleEdgeTraversal;
Const
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_TCP = 6;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Applicationname := Form1.Edit3.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;
  NewRule.EdgeTraversal := True;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* A service firewall rule is a network security instruction that
   controls traffic for specific applications or services (like HTTP, DNS, SSH)
   by defining criteria like ports, protocols (TCP/UDP), source/destination
   IPs, allowing or denying connections, and often linking to an executable
   program, crucial for securing networks by limiting attack
   surfaces and enforcing policies.*)
Procedure AddServiceRule;
Const
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_TCP = 6;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Applicationname := Form1.Edit3.Text;
  NewRule.ServiceName := Form1.Edit6.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit6.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* An ICMP (Internet Control Message Protocol) firewall rule allows or
   blocks network messages like PING (Echo Request/Reply) for diagnostics,
   typically configured in advanced firewall settings by creating a custom
   inbound rule for ICMPv4/v6, specifying "Echo Request" for type, and
   setting source/destination IPs, often by enabling pre-configured rules
   like "File and Printer Sharing (Echo Request)" in Windows to permit
   connectivity checks while blocking other ICMP types for security.*)
Procedure AddICMPRule;
Const
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_ICMPv4 = 1;
 NET_FW_IP_PROTOCOL_ICMPv6 = 58;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_ICMPv4;
  NewRule.IcmpTypesAndCodes := '1:1';
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

Procedure AddApplicationRule;
Const
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_TCP = 6;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Applicationname := Form1.Edit3.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* An inbound rule is a firewall or security policy that controls traffic
   coming into a computer, network, or cloud service from the outside,
   defining what (protocols, ports, programs) is allowed in and from
   where (IP addresses, sources) to protect against unauthorized access.
   These rules are crucial for network security, managing access for web
   servers, SSH, databases, and other services, contrasting with outbound
   rules that manage outgoing data.*)

Procedure AddInboundRule;
Const
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_TCP = 6;
 NET_FW_RULE_DIR_IN = 1;
var
 CurrentProfiles : OleVariant;
 fwPolicy1       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy1   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy1.Rules;
  CurrentProfiles := fwPolicy1.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Applicationname := Form1.Edit3.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Direction := NET_FW_RULE_DIR_IN;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* An outbound rule is a network security setting that controls traffic
   leaving a device or network, defining what applications, ports, and
   destinations are allowed to send data out to the internet or other systems,
   primarily to prevent malware, data leaks, and unauthorized communication,
   contrasting with inbound rules that manage incoming connections. These
   rules specify protocols (TCP/UDP), ports, and remote IP addresses/domains,
   offering fine-grained control over services like web browsing,
   app updates, and email.*)
Procedure AddOutboundRule;
Const
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_TCP = 6;
 NET_FW_RULE_DIR_OUT = 2;
var
 CurrentProfiles : OleVariant;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 NewRule         : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  //Create a Rule Object.
  NewRule := CreateOleObject('HNetCfg.FWRule');

  NewRule.Name := Form1.Edit5.Text;
  NewRule.Description := Form1.Edit2.Text;
  NewRule.Applicationname := Form1.Edit3.Text;
  NewRule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts := Form1.SpinEdit1.Value;
  NewRule.Direction := NET_FW_RULE_DIR_OUT;
  NewRule.Enabled := True;
  NewRule.Grouping := Form1.Edit4.Text;
  NewRule.Profiles := CurrentProfiles;
  NewRule.Action := NET_FW_ACTION_ALLOW;

  //Add a new rule
  RulesObject.Add(NewRule);
end;

(* To remove a Windows Firewall rule in Delphi, use the COM
   interface HNetCfg.FwPolicy2 and its Rules.Remove(RuleName) method,
   passing the exact name of the rule you want gone, or use ShellExecute
   to run the netsh advfirewall firewall delete rule
   name="YourRuleName" command for a simpler, command-line approach.
   The COM method offers programmatic control, while netsh
   is quick for scripting.*)
procedure RemoveExceptFromFirewall(const RuleName: String);
const
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC  = 4;
var
  Profile: Integer;
  Policy1, Policy2: OleVariant;

  RObject: OleVariant;
begin
  case Form1.ComboBox1.ItemIndex of
  0 : // inbound rule
      begin
        Profile := NET_FW_PROFILE2_PRIVATE OR NET_FW_PROFILE2_PUBLIC;
        Policy2 := CreateOleObject('HNetCfg.FwPolicy2');
        RObject := Policy2.Rules;
        RObject.Remove(RuleName);
        Form1.StatusBar1.Panels[3].Text := Form1.Edit1.Text + ' inbound Rule deleted';
      end;

  1 : // outbound rule
      begin
        Profile := NET_FW_PROFILE2_PRIVATE OR NET_FW_PROFILE2_PUBLIC;
        Policy1 := CreateOleObject('HNetCfg.FwPolicy2');
        RObject := Policy1.Rules;
        RObject.Remove(RuleName);
        Form1.StatusBar1.Panels[3].Text := Form1.Edit1.Text + ' outbound Rule deleted';
      end;

  2 : // both mode
      begin
        Profile := NET_FW_PROFILE2_PRIVATE OR NET_FW_PROFILE2_PUBLIC;
        Policy2 := CreateOleObject('HNetCfg.FwPolicy2');
        RObject := Policy2.Rules;
        RObject.Remove(RuleName);
        Profile := NET_FW_PROFILE2_PRIVATE OR NET_FW_PROFILE2_PUBLIC;
        Policy1 := CreateOleObject('HNetCfg.FwPolicy2');
        RObject := Policy1.Rules;
        RObject.Remove(RuleName);
        Form1.StatusBar1.Panels[3].Text := Form1.Edit1.Text + ' in-&outbound Rule deleted';
      end;
  end;
end;

function IsFirewallEnabled: Boolean;
var
  FWMgr: OleVariant;
  FWPolicy: OleVariant;
  FWProfile: OleVariant;
begin
  // Default to false
  Result := False;
  // For older systems
  FWMgr := CreateOleObject('HNetCfg.FwMgr');
  // create policy
  FWPolicy := FWMgr.LocalPolicy;
  // open profile
  FWProfile := FWPolicy.CurrentProfile;
  // send firewall status
  Result := FWProfile.FirewallEnabled;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 CurrentProfiles : Integer;
 fwPolicy2       : OleVariant;
 RulesObject     : OleVariant;
 rule            : OleVariant;
 oEnum           : IEnumvariant;
 iValue          : LongWord;

 Const
 NET_FW_IP_PROTOCOL_TCP = 6;
 NET_FW_ACTION_ALLOW = 1;
 NET_FW_IP_PROTOCOL_UDP = 6;
begin
  Screen.Cursor := crHourGlass;
  Memo1.Clear;
  num := 0;
  abort := false;
  Button9.Enabled := true;
  Button1.Enabled := false;
  StatusBar1.Panels[3].Text := 'scanning all firewall rules, please wait..';
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject := fwPolicy2.Rules;
  CurrentProfiles := fwPolicy2.CurrentProfileTypes;

  oEnum         := IUnknown(Rulesobject._NewEnum) as IEnumVariant;
  while oEnum.Next(1, rule, iValue) = 0 do
  begin
    if (rule.Profiles And CurrentProfiles)<>0 then
    begin
        if CheckBox1.Checked = true then
        begin
         Memo1.Lines.Add(rule.Name);
         StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
         Application.ProcessMessages;
        end else begin

          num := num + 1;
          Memo1.Lines.Add('');
          Memo1.Lines.Add(IntToStr(Num) + '.');
          Memo1.Lines.Add(' Rule Name         : ' + rule.Name);
          Memo1.Lines.Add(' ----------------------------------------------');
          Memo1.Lines.Add(' Description       : ' + rule.Description);
          Memo1.Lines.Add(' Application Name  : ' + rule.ApplicationName);
          Memo1.Lines.Add(' Service Name      : ' + rule.ServiceName);

          if (rule.Protocol = NET_FW_IP_PROTOCOL_TCP) or (rule.Protocol = NET_FW_IP_PROTOCOL_UDP) then
          begin
            Memo1.Lines.Add(' Local Ports       : ' + rule.LocalPorts);
            Memo1.Lines.Add(' Remote Ports      : ' + rule.RemotePorts);
            Memo1.Lines.Add(' LocalAddresses    : ' + rule.LocalAddresses);
            Memo1.Lines.Add(' RemoteAddresses   : ' + rule.RemoteAddresses);
          end;
          StatusBar1.Panels[1].Text := IntToStr(Num);
          Application.ProcessMessages;

        end;

      if abort = true then Exit;

      end;
  end;
  Screen.Cursor := crDefault;
  Button1.Enabled := true;
  Button9.Enabled := false;
  StatusBar1.Panels[3].Text := 'Scan finish';
  Application.ProcessMessages;
end;

// disable firewall complete
Procedure SetFirewallOff;
Const
  NET_FW_PROFILE2_DOMAIN  = 1;
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC  = 4;
var
 fwPolicy2       : OleVariant;
begin
  // Create the FwPolicy2 object.
  fwPolicy2   := CreateOleObject('HNetCfg.FwPolicy2');

  if Form1.StringGrid1.Cells[1, 0] = 'ENABLED' then
  begin
    fwPolicy2.FirewallEnabled[NET_FW_PROFILE2_DOMAIN]:= false;
    fwPolicy2.FirewallEnabled[NET_FW_PROFILE2_PRIVATE]:= false;
    fwPolicy2.FirewallEnabled[NET_FW_PROFILE2_PUBLIC]:= false;
  end else begin
    fwPolicy2.FirewallEnabled[NET_FW_PROFILE2_DOMAIN]:= true;
    fwPolicy2.FirewallEnabled[NET_FW_PROFILE2_PRIVATE]:= true;
    fwPolicy2.FirewallEnabled[NET_FW_PROFILE2_PUBLIC]:= true;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  objFirewall,
  objPolicy,
  objICMPSettings,
  objService,
  colServices : OleVariant;

  IEnum : IEnumVariant;
  Count, Count1, Count2:LongWord;
  a : integer;

  CurrentProfileType : string;
  FirewallEnabled : Boolean;
  ExceptionsNotAllowed : Boolean;
  NotificationsDisabled : Boolean;
  UnicastResponsestoMulticastBroadcastDisabled:Boolean;
begin
  a := 14;

  if StringGrid1.Cells[1, 0] = 'ENABLED' then
  begin
  Beep();
    if MessageBox(Handle,'ATTENTION !'+#13+
                  'This disable the Windows Defender Firewall complete, are you sure? : ','Confirm',
                        MB_YESNO) = IDYES then
      BEGIN
        try
          Screen.Cursor := crHourGlass;
          SetFirewallOff;
          Sleep(100);
          MessageDlg('Windows Defender Firewall is deaktivated!',mtWarning, [mbOK], 0);
          StatusBar1.Panels[5].Text := 'inactive, not recommended';
        except
          on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
        end;
      END;
    StatusBar1.SetFocus;
  end;

  if StringGrid1.Cells[1, 0] = 'DISABLED' then
  begin
    try
      Screen.Cursor := crHourGlass;
      SetFirewallOff;
      Sleep(100);
      Beep();
      MessageDlg('Windows Defender Firewall is aktivated!',mtWarning, [mbOK], 0);
      StatusBar1.Panels[5].Text := 'active';
    except
      on E:EOleException do begin
        ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));

        end;
    end;
  end;

  objFirewall := CreateOLEObject('HNetCfg.FwMgr');
  objPolicy := objFirewall.LocalPolicy.CurrentProfile;
  objICMPSettings := objPolicy.ICMPSettings;
  colServices := objPolicy.Services;
  CurrentProfileType :=FW_PROFILE[Integer(objFirewall.CurrentProfileType)];
  FirewallEnabled  :=(Integer(objPolicy.FirewallEnabled)=VRAI);
  ExceptionsNotAllowed :=(Integer(objPolicy.ExceptionsNotAllowed)=VRAI);
  NotificationsDisabled :=(Integer(objPolicy.NotificationsDisabled)=VRAI);
  UnicastResponsestoMulticastBroadcastDisabled:=(Integer(objPolicy.UnicastResponsestoMulticastBroadcastDisabled)=VRAI);

  StringGrid1.Cells[1, 0] := FW_BOOL[StrToInt(BoolToStr(FirewallEnabled))];
  StringGrid1.Cells[1, 1] := CurrentProfileType;
  StringGrid1.Cells[1, 2] := FW_BOOL[StrToInt(BoolToStr(ExceptionsNotAllowed))];
  StringGrid1.Cells[1, 3] := FW_BOOL[StrToInt(BoolToStr(NotificationsDisabled))];
  StringGrid1.Cells[1, 4] := FW_BOOL[StrToInt(BoolToStr(UnicastResponsestoMulticastBroadcastDisabled))];

  StringGrid1.Cells[1, 5] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundEchoRequest))];
  StringGrid1.Cells[1, 6] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundMaskRequest))];
  StringGrid1.Cells[1, 7] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundRouterRequest))];
  StringGrid1.Cells[1, 8] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundTimestampRequest))];
  StringGrid1.Cells[1, 9] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundDestinationUnreachable))];
  StringGrid1.Cells[1, 10] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundPacketTooBig))];
  StringGrid1.Cells[1, 11] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundParameterProblem))];
  StringGrid1.Cells[1, 12] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundSourceQuench))];
  StringGrid1.Cells[1, 13] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundTimeExceeded))];
  StringGrid1.Cells[1, 14] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowRedirect))];

  IEnum := IUnKnown(colServices._NewEnum) as IEnumVariant;
  While IEnum.Next(1, objService,Count1)=S_OK do
  begin
    a := a + 1;
    StringGrid1.Cells[0, a] := objService.Name + ':';
    StringGrid1.Cells[1, a] := FW_BOOL[StrToInt(BoolToStr(objService.Enabled))];

    StringGrid1.Cells[0, 18] := 'IP Version:';
    StringGrid1.Cells[1, 18] := FW_IP_VERSION[integer(objService.IPVersion)];

    StringGrid1.Cells[0, 19] := 'Scope:';
    StringGrid1.Cells[1, 19] := FW_BOOL[StrToInt(BoolToStr(objService.Scope))];

    StringGrid1.Cells[0, 20] := 'Remote Addresses:';
    StringGrid1.Cells[1, 20] := FW_BOOL[StrToInt(BoolToStr(objService.Customized))];
  end;

  if StringGrid1.Cells[1, 0] = 'ENABLED' then
  begin
    Button2.Caption := 'Disable Firewall';
  end else begin
    Button2.Caption := 'Enable Firewall';
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i, iLen, iPos: Integer;
  s: String;
begin
  if Edit1.Text = '' then begin
    Beep;
    MessageDlg('I Need a "Rule Name" to search in Firewall',
                mtInformation, [mbOK], 0);
    Exit;
  end;

  if Memo1.Text = '' then begin
    Beep;
    MessageDlg('Scan Firewall Rules befor search "Rule name"',
                mtInformation, [mbOK], 0);
    Exit;
  end;

  iLen := 0;
  s := Edit1.Text;
  for i := 0 to Memo1.Lines.Count-1 do
  begin
    iPos := Pos(s, Memo1.Lines[i]);
    if (iPos <> 0) then
    begin
      Memo1.SelStart := iLen + iPos -1;
      Memo1.SelLength := Length(s);
      Memo1.SetFocus;
      StatusBar1.Panels[3].Text := Edit1.Text + ' Rule found';
      Break;
    end
    else
      Inc(iLen, Length(Memo1.Lines[i]) + 2);
      StatusBar1.Panels[3].Text := Edit1.Text + ' Rule not found';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

  if Edit1.Text = '' then begin
    Beep;
    MessageDlg('I Need a "Rule Name" to Delete Rule from Firewall',
                mtInformation, [mbOK], 0);
    Exit;
  end;

  if MessageBox(Handle,'ATTENTION !'+#13+
                  'This will delete Rule, are you sure? : ','Confirm',
                        MB_YESNO) = IDYES then
  BEGIN
    try
      CoInitialize(nil);
      try
        RemoveExceptFromFirewall(Edit1.Text);
        Screen.Cursor := crHourGlass;
        Sleep(1000);
        MessageDlg('Delete Rule "' + Edit1.Text + '" from Firewall done',
                    mtInformation,[mbOK],0);
        Screen.Cursor := crDefault;
        StatusBar1.Panels[3].Text := 'Delete Rule "' + Edit1.Text + '" from Firewall done';
        StatusBar1.SetFocus;
      finally
        CoUninitialize;
      end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
  END;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then Edit3.Text := OpenDialog1.FileName;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if Edit5.Text = '' then begin
    Beep;
    MessageDlg('I Need a "Rule Name" to create Rule to Firewall',
                mtInformation, [mbOK], 0);
    Exit;
  end;

  // select program
  if (ComboBox2.ItemIndex = 0) or (ComboBox2.ItemIndex = 1) or
     (ComboBox2.ItemIndex = 2) or (ComboBox2.ItemIndex = 4) or
     (ComboBox2.ItemIndex = 5) or (ComboBox2.ItemIndex = 7) then
     begin
      if not FileExists(Edit3.Text) then
      begin
        Beep;
        ShowMessage('Select a program you would like to enter.');
        Exit;
      end;
     end;

  Screen.Cursor := crHourGlass;

  // create outbound rule
  if (ComboBox2.ItemIndex = 0) then
  begin
    try
      CoInitialize(nil);
      try
        AddOutboundRule;
        Sleep(1000);
      finally
        CoUninitialize;
      end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create inbound Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create inbound rule
  if (ComboBox2.ItemIndex = 1) then
  begin
    try
      CoInitialize(nil);
      try
        AddInboundRule;
        Sleep(1000);
      finally
        CoUninitialize;
      end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create outbound Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create application rule
  if (ComboBox2.ItemIndex = 2) then
  begin
    try
      CoInitialize(nil);
      try
        AddApplicationRule;
        Sleep(1000);
      finally
        CoUninitialize;
      end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create application Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create ICMP rule
  if (ComboBox2.ItemIndex = 3) then
  begin
    try
      CoInitialize(nil);
    try
      AddICMPRule;
      Sleep(1000);
    finally
      CoUninitialize;
    end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create ICMP Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create service rule
  if (ComboBox2.ItemIndex = 4) then
  begin
    try
      CoInitialize(nil);
    try
      AddServiceRule;
      Sleep(1000);
    finally
      CoUninitialize;
    end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create Service Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create edgetrversal rule
  if (ComboBox2.ItemIndex = 5) then
  begin
    try
      CoInitialize(nil);
    try
      AddRuleEdgeTraversal;
      Sleep(1000);
    finally
      CoUninitialize;
    end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create EdgeTraversal Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create protocol rule
  if (ComboBox2.ItemIndex = 6) then
  begin
    try
      CoInitialize(nil);
    try
      AddProtocolRule;
      Sleep(1000);
    finally
      CoUninitialize;
    end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create Protocol Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create interface rule
  if (ComboBox2.ItemIndex = 7) then
  begin
    try
      CoInitialize(nil);
    try
      AddPerInterfaceRule;
      Sleep(1000);
    finally
      CoUninitialize;
    end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create Interface Rule "' + Edit5.Text + '" to Firewall done';
  end;

  // create lan rule
  if (ComboBox2.ItemIndex = 8) then
  begin
    try
      CoInitialize(nil);
    try
      AddLANRule;
      Sleep(1000);
    finally
      CoUninitialize;
    end;
    except
      on E:EOleException do
          ShowMessage(Format('EOleException %s %x', [E.Message,E.ErrorCode]));
    end;
    StatusBar1.Panels[3].Text := 'Create LAN Rule "' + Edit5.Text + '" to Firewall done';
  end;

  Screen.Cursor := crDefault;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'wf.msc', '', nil, SW_SHOW);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'control.exe', ' /name Microsoft.WindowsFirewall',
              nil, SW_SHOWNORMAL);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  abort := true;
  Button9.Enabled := false;
  Button1.Enabled := true;
  Screen.Cursor := crDefault;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
    0 : begin
          Label10.Enabled := true;
          Label11.Enabled := true;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := true;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := true;
          Button5.Enabled := true;
        end;
    1 : begin
          Label10.Enabled := true;
          Label11.Enabled := true;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := true;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := true;
          Button5.Enabled := true;
        end;
    2 : begin
          Label10.Enabled := true;
          Label11.Enabled := true;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := true;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := true;
          Button5.Enabled := true;
        end;
    3 : begin
          Label10.Enabled := true;
          Label11.Enabled := false;
          Label12.Enabled := false;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := false;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := false;
          Button5.Enabled := false;
        end;
    4 : begin
          Label10.Enabled := true;
          Label11.Enabled := true;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := true;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := true;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := true;
          SpinEdit1.Enabled := true;
          Button5.Enabled := true;
        end;
    5 : begin
          Label10.Enabled := true;
          Label11.Enabled := true;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := true;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := true;
          Button5.Enabled := true;
        end;
    6 : begin
          Label10.Enabled := true;
          Label11.Enabled := false;
          Label12.Enabled := false;
          Label13.Enabled := false;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := false;
          Label23.Enabled := false;
          Label24.Enabled := false;
          ComboBox3.Enabled := false;
          Edit2.Enabled := true;
          Edit3.Enabled := false;
          Edit4.Enabled := false;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := false;
          Button5.Enabled := false;
        end;
    7 : begin
          Label10.Enabled := true;
          Label11.Enabled := false;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := true;
          Label23.Enabled := true;
          Label24.Enabled := true;
          ComboBox3.Enabled := true;
          Edit2.Enabled := true;
          Edit3.Enabled := false;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := true;
          Button5.Enabled := false;
        end;
    8 : begin
          Label10.Enabled := true;
          Label11.Enabled := false;
          Label12.Enabled := true;
          Label13.Enabled := true;
          Label15.Enabled := true;
          Label16.Enabled := false;
          Label22.Enabled := true;
          Label23.Enabled := true;
          Label24.Enabled := true;
          ComboBox3.Enabled := true;
          Edit2.Enabled := true;
          Edit3.Enabled := false;
          Edit4.Enabled := true;
          Edit5.Enabled := true;
          Edit6.Enabled := false;
          SpinEdit1.Enabled := true;
          Button5.Enabled := false;
        end;




  end;


  StatusBar1.SetFocus;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
  case ComboBox3.ItemIndex of
  0 : begin
        Label23.Caption := 'Standard Ethernet ports assigned IP addresses for';
        Label24.Caption := 'routing traffic (e.g., WAN, LAN).';
      end;
  1 : begin
        Label23.Caption := 'Acts like a simple cable for inline inspection without IP,';
        Label24.Caption := 'preventing direct communication between networks.';
      end;
  2 : begin
        Label23.Caption := 'A passive, out-of-band interface that mirrors traffic for';
        Label24.Caption := 'inspection without impacting network flow.';
      end;
  3 : begin
        Label23.Caption := 'Operates at Layer 2 (Ethernet), bridging traffic like';
        Label24.Caption := 'a switch, often used for transparent deployments.';
      end;
  4 : begin
        Label23.Caption := 'Logically segments a single physical port into';
        Label24.Caption := 'multiple virtual networks (802.1Q).';
      end;
  5 : begin
        Label23.Caption := 'Combines multiple physical links into one logical link';
        Label24.Caption := 'for increased bandwidth and redundancy.';
      end;
  6 : begin
        Label23.Caption := 'Used for VPNs (IPsec, GRE) to create secure, encrypted';
        Label24.Caption := 'connections between sites or for remote users.';
      end;
  7 : begin
        Label23.Caption := 'Virtual interface thats always "up," used for management';
        Label24.Caption := 'routing protocols (OSPF), and internal stability.';
      end;
  8 : begin
        Label23.Caption := 'Dedicated interfaces for cluster communication between';
        Label24.Caption := 'primary and secondary firewalls.';
      end;
  9 : begin
        Label23.Caption := 'Virtual switches (CPU-based) or hardware-accelerated';
        Label24.Caption := 'switches for managing internal traffic and VLANs.';
      end;
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  objFirewall,
  objPolicy,
  objICMPSettings,
  objService,
  colServices : OleVariant;

  IEnum : IEnumVariant;
  Count, Count1, Count2:LongWord;

  a : integer;

  CurrentProfileType : string;
  FirewallEnabled : Boolean;
  ExceptionsNotAllowed : Boolean;
  NotificationsDisabled : Boolean;
  UnicastResponsestoMulticastBroadcastDisabled:Boolean;
begin
  a := 14;

  StringGrid1.DefaultColWidth := 240;
  StringGrid1.ColWidths[1] := 100;

  StringGrid1.Cells[0, 0] := 'Firewall Status:';
  StringGrid1.Cells[0, 1] := 'Current profile type:';
  StringGrid1.Cells[0, 2] := 'Exceptions not allowed:';
  StringGrid1.Cells[0, 3] := 'Notifications:';
  StringGrid1.Cells[0, 4] := 'Unicast Responses to Multicast Broadcast:';
  StringGrid1.Cells[0, 5] := 'Inbound echo request:';
  StringGrid1.Cells[0, 6] := 'Inbound mask request:';
  StringGrid1.Cells[0, 7] := 'Inbound router request:';
  StringGrid1.Cells[0, 8] := 'Inbound timestamp request:';
  StringGrid1.Cells[0, 9] := 'Outbound destination unreachable:';
  StringGrid1.Cells[0, 10] := 'Outbound packet too big:';
  StringGrid1.Cells[0, 11] := 'Outbound parameter problem:';
  StringGrid1.Cells[0, 12] := 'Outbound source quench:';
  StringGrid1.Cells[0, 13] := 'Outbound time exceeded:';
  StringGrid1.Cells[0, 14] := 'Redirect:';

  objFirewall := CreateOLEObject('HNetCfg.FwMgr');
  objPolicy := objFirewall.LocalPolicy.CurrentProfile;
  objICMPSettings := objPolicy.ICMPSettings;
  colServices := objPolicy.Services;
  CurrentProfileType :=FW_PROFILE[Integer(objFirewall.CurrentProfileType)];
  FirewallEnabled  :=(Integer(objPolicy.FirewallEnabled)=VRAI);
  ExceptionsNotAllowed :=(Integer(objPolicy.ExceptionsNotAllowed)=VRAI);
  NotificationsDisabled :=(Integer(objPolicy.NotificationsDisabled)=VRAI);
  UnicastResponsestoMulticastBroadcastDisabled:=(Integer(objPolicy.UnicastResponsestoMulticastBroadcastDisabled)=VRAI);

  StringGrid1.Cells[1, 0] := FW_BOOL[StrToInt(BoolToStr(FirewallEnabled))];
  StringGrid1.Cells[1, 1] := CurrentProfileType;
  StringGrid1.Cells[1, 2] := FW_BOOL[StrToInt(BoolToStr(ExceptionsNotAllowed))];
  StringGrid1.Cells[1, 3] := FW_BOOL[StrToInt(BoolToStr(NotificationsDisabled))];
  StringGrid1.Cells[1, 4] := FW_BOOL[StrToInt(BoolToStr(UnicastResponsestoMulticastBroadcastDisabled))];

  StringGrid1.Cells[1, 5] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundEchoRequest))];
  StringGrid1.Cells[1, 6] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundMaskRequest))];
  StringGrid1.Cells[1, 7] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundRouterRequest))];
  StringGrid1.Cells[1, 8] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowInboundTimestampRequest))];
  StringGrid1.Cells[1, 9] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundDestinationUnreachable))];
  StringGrid1.Cells[1, 10] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundPacketTooBig))];
  StringGrid1.Cells[1, 11] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundParameterProblem))];
  StringGrid1.Cells[1, 12] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundSourceQuench))];
  StringGrid1.Cells[1, 13] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowOutboundTimeExceeded))];
  StringGrid1.Cells[1, 14] := FW_BOOL[StrToInt(BoolToStr(objICMPSettings.AllowRedirect))];

  IEnum := IUnKnown(colServices._NewEnum) as IEnumVariant;
  While IEnum.Next(1, objService,Count1)=S_OK do
  begin
    a := a + 1;
    StringGrid1.Cells[0, a] := objService.Name + ':';
    StringGrid1.Cells[1, a] := FW_BOOL[StrToInt(BoolToStr(objService.Enabled))];

    StringGrid1.Cells[0, 18] := 'IP Version:';
    StringGrid1.Cells[1, 18] := FW_IP_VERSION[integer(objService.IPVersion)];

    StringGrid1.Cells[0, 19] := 'Scope:';
    StringGrid1.Cells[1, 19] := FW_BOOL[StrToInt(BoolToStr(objService.Scope))];

    StringGrid1.Cells[0, 20] := 'Remote Addresses:';
    StringGrid1.Cells[1, 20] := FW_BOOL[StrToInt(BoolToStr(objService.Customized))];
  end;

  if StringGrid1.Cells[1, 0] = 'ENABLED' then
  begin
    Button2.Caption := 'Disable Firewall';
    StatusBar1.Panels[5].Text := 'active';
  end else begin
    Button2.Caption := 'Enable Firewall';
    StatusBar1.Panels[5].Text := 'inactive, not recommended';
  end;
end;

end.


