unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, RzBorder, Vcl.Grids, SPComm, Inifiles, RzLabel, Data.DB, UnitVar,
  Data.Win.ADODB, HCNetSDK, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, superobject, DateUtils, math, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Touch.Keyboard, Vcl.ToolWin, frxClass, RzCmboBx;

type
  TFrmMain = class(TForm)
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    RzLEDDisplay1: TRzLEDDisplay;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    EtBoxTare11: TEdit;
    Label12: TLabel;
    Label10: TLabel;
    EtBoxTare12: TEdit;
    Label15: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    BitBtn1: TBitBtn;
    Label16: TLabel;
    Edit10: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    EdtSamplePieceCount1: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    EdtSamplePieceTotalWeight1: TEdit;
    Label22: TLabel;
    GroupBox4: TGroupBox;
    RzLEDDisplay2: TRzLEDDisplay;
    TmrWeightMscomm1: TTimer;
    Timer1: TTimer;
    LbScale1MscommFailure: TRzLabel;
    LbScale2MscommFailure: TRzLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Timer2: TTimer;
    Button2: TButton;
    Label35: TLabel;
    Edit9: TEdit;
    IdHTTP1: TIdHTTP;
    ScaleComm1: TComm;
    GroupBox5: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label47: TLabel;
    GrdWeightingLst: TStringGrid;
    Edt_exec_qrcode: TEdit;
    EdtSampWeight: TEdit;
    EdtSampCount: TEdit;
    Panel7: TPanel;
    Edt_out_resourced_name: TEdit;
    Edtworkpiece: TEdit;
    EdtGross: TEdit;
    EdtTotalTare: TEdit;
    EdtTotaolNet: TEdit;
    EdtWeightNote: TEdit;
    GroupBox9: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    BitBtn3: TBitBtn;
    EdtSamplePieceCount2: TEdit;
    EdtSamplePieceTotalWeight2: TEdit;
    GroupBox10: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox12: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn7: TBitBtn;
    Button5: TButton;
    BtnWeightAgain: TButton;
    EdtRecordWeight1: TEdit;
    Label42: TLabel;
    Label54: TLabel;
    Label43: TLabel;
    EdtWeightCount: TComboBox;
    GroupBox11: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn8: TBitBtn;
    EdtRecordWeight2: TEdit;
    GroupBox14: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    EtBoxTare21: TEdit;
    EtBoxTare22: TEdit;
    TouchKeyboard1: TTouchKeyboard;
    Label41: TLabel;
    GroupBox15: TGroupBox;
    Label36: TLabel;
    ToolBar1: TToolBar;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    GroupBox13: TGroupBox;
    Label9: TLabel;
    Label13: TLabel;
    EdtBox12Number: TEdit;
    EdtBox11Number: TEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label37: TLabel;
    Edit2: TEdit;
    Label46: TLabel;
    Edit3: TEdit;
    Label48: TLabel;
    Edit6: TEdit;
    Label49: TLabel;
    Edit7: TEdit;
    BtnBox: TButton;
    exec_artlist: TRzComboBox;
    Label53: TLabel;
    Label55: TLabel;
    Et_workbox_num11: TEdit;
    Label57: TLabel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Et_workbox_num12: TEdit;
    Label56: TLabel;
    Et_workbox_num21: TEdit;
    Label58: TLabel;
    Et_workbox_num22: TEdit;
    Label59: TLabel;
    ADOQuery2: TADOQuery;
    Panel1: TPanel;
    Label60: TLabel;
    Edit8: TEdit;
    Label61: TLabel;
    TouchKeyboard2: TTouchKeyboard;
    GrdUndoneGodownEntry: TStringGrid;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label32: TLabel;
    Edit1: TEdit;
    ComboBox4: TComboBox;
    ComboBox3: TComboBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn5: TBitBtn;
    ComboBox5: TComboBox;
    Panel2: TPanel;
    Label62: TLabel;
    Edit11: TEdit;
    Label63: TLabel;
    TouchKeyboard3: TTouchKeyboard;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    ScaleComm2: TComm;
    TmrWeightMscomm2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ScaleComm1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Timer1Timer(Sender: TObject);
    procedure TmrWeightMscomm1Timer(Sender: TObject);
    function CameraInitialization() : Boolean;

    function CameraLogin_V30( CameraLogInfo : RdCameraLoginInfo;
      var CameraLoginInfo_V30 : RdCameraLoginInfo_V30; struPlayInfo : NET_DVR_CLIENTINFO ) : Boolean;
    Function CameraLogin_v40( CameraLogInfo : RdCameraLoginInfo;
      var struDeviceInfo : NET_DVR_DEVICEINFO_V30; var CameraLoginInfo_V30 : RdCameraLoginInfo_V30;
      var struPlayInfo_v40 : rd_struPlayInfo_v40 ) : Boolean;

    Function CameraLogin(var UserId : Dword;
                         CameraLogInfo : RdCameraLoginInfo;
                         var struDeviceInfo : NET_DVR_DEVICEINFO_V30;
                         var struPlayInfo : NET_DVR_CLIENTINFO;
                         var Pnl_Play_Wnd : TPanel;
                         var lRealHandle: Longint;
                         var pUser: Pointer
                         ) : Boolean;
    Function CaturePicture_V30(CaturePicture_V30_Info : RdCaturePicture_V30_Info;
      Var CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo ) : Boolean;
    procedure Button2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Edt_exec_qrcodeKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_exec_qrcodeClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure GrdUndoneGodownEntryDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtSamplePieceCount1KeyPress(Sender: TObject; var Key: Char);
    procedure EtBoxTare11Click(Sender: TObject);
    procedure EtBoxTare12Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RadioButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RadioButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnWeightAgainClick(Sender: TObject);
    procedure EdtWeightCountChange(Sender: TObject);
    procedure EdtWeightCountKeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure RadioButton2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RadioButton4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EtBoxTare21Click(Sender: TObject);
    procedure EtBoxTare22Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure EtBoxTare11KeyPress(Sender: TObject; var Key: Char);
    procedure EtBoxTare12KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSamplePieceCount1Click(Sender: TObject);
    procedure EdtSamplePieceCount2Click(Sender: TObject);
    procedure EtBoxTare21KeyPress(Sender: TObject; var Key: Char);
    procedure EtBoxTare22KeyPress(Sender: TObject; var Key: Char);
    procedure exec_artlistChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BtnBoxClick(Sender: TObject);
    procedure EdtBox11NumberClick(Sender: TObject);
    procedure EdtBox11NumberKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBox12NumberClick(Sender: TObject);
    procedure EdtBox12NumberKeyPress(Sender: TObject; var Key: Char);
    procedure Et_workbox_num11Click(Sender: TObject);
    procedure Et_workbox_num11KeyPress(Sender: TObject; var Key: Char);
    procedure Et_workbox_num22Click(Sender: TObject);
    procedure Et_workbox_num22KeyPress(Sender: TObject; var Key: Char);
    procedure Et_workbox_num12Click(Sender: TObject);
    procedure Et_workbox_num12KeyPress(Sender: TObject; var Key: Char);
    procedure Et_workbox_num21Click(Sender: TObject);
    procedure Et_workbox_num21KeyPress(Sender: TObject; var Key: Char);
    procedure Edt_exec_qrcodeDblClick(Sender: TObject);
    procedure EdtSamplePieceTotalWeight1DblClick(Sender: TObject);
    procedure EdtSamplePieceTotalWeight1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRecordWeight1DblClick(Sender: TObject);
    procedure EdtRecordWeight1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSamplePieceTotalWeight2DblClick(Sender: TObject);
    procedure EdtSamplePieceTotalWeight2KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtRecordWeight2DblClick(Sender: TObject);
    procedure EdtRecordWeight2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure ScaleComm2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure TmrWeightMscomm2Timer(Sender: TObject);
  private
    { Private declarations }
    function AddNewWeightNote(UpdateValue : RdWeightNote;var Bill_no : String) : Boolean;
    function InsertNewWeightNote(UpdateValue : RdWeightNote; var WeightingNote : RdWeightNote) : Boolean;
    function GetWeightNote( Var UpdateValue : RdWeightNote; bill_no : string ) : Boolean;
    procedure QueryWeightNoteDisp(var WeightingNote : RdWeightNote);
    function UpdateWeightNote(WeightingNote : RdWeightNote) : Boolean;
    procedure DisplayWeightNote( WeightingNote : RdWeightNote );
    function UpdateWeightingNoteToDb(WeightingNote : RdWeightNote) : Boolean;
    function insertTwoWeightDetails(var WeightData1: WeightData;
      var WeightData2 : WeightData; WeightNote : RdWeightNote) : Boolean;
    function insertOneWeightDetails(WeightData1: WeightData; WeightNote : RdWeightNote) : Boolean;
    procedure DispWeightDetails(WeightId : Integer; WeightBatch : Integer);
    procedure DispWeightBatchInfo(WeightingNoteId : Integer; BatchCount : Integer);

    function Get_exec_qrcode(exec_qrcode : String; print_code : String; var UpdateValue : RdWeightNote) : Boolean;
    function searchBoxNumberExist(BoxNumberStr : String; WeightId : Integer; WeightBatch : Integer) : Boolean;

    function RecordExsit(exec_qrcode : String; print_code : integer) : Boolean;
    procedure AuditNumber(ScalNumber : integer; BoxNumber : Integer);

    procedure CalculateBoxNumberForWeighted();    //���¼����ִ�мƻ��µ��ѳ������
  public
    { Public declarations }
    procedure getexec_artlist(exec_qrcode : string; var UpdateValue : RdWeightNote) ;
    function httpUploadWeightNote(WeightNoteId : integer; WeightBatch : integer) : Boolean;
    function httpUploadWeightNoteUpdate(WeightNoteId : integer; WeightBatch : integer) : Boolean;
    procedure Dsplay_getexec_artlist(exec_qrcode : String; artlist : string);
    procedure HttpGetSysConfig(RequestStr : string);
    procedure WeightManageHandle(WeightingNote : RdWeightNote;Gross : Double;
      weight_from : integer; weightNumber : integer);
    procedure ClearExecQrcodeInfo();
  end;

var
  FrmMain: TFrmMain;


//  Weight2 : THuier_JSC_QHD_30;
implementation

uses UnitLogin, UntUnUpLoadData, UnitMesData, UnitAbout;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
const
  PlayWdn : array[1..6] of string = ('Panel1','Panel2','Panel3','Panel4','Panel5','Panel6');
var
  SetFile : TInifile;
  WeightMscommPort : String;
  DbDirtoryStr : String;

  CameraInit : Boolean;
  CameraLogInfo : RdCameraLoginInfo;
  //CameraLoginInfo_V30 : RdCameraLoginInfo_V30;
  struPlayInfo : NET_DVR_CLIENTINFO;

  i : integer;
begin
  GrdWeightingLst.Cells[0 , 0] := '';
  //GrdWeightingLst.Cells[1 , 0] := '��Э����';
  //GrdWeightingLst.cells[2 , 0] := '�ӹ�������';
  //GrdWeightingLst.Cells[3 , 0] := '���ش���';
  //GrdWeightingLst.Cells[4 , 0] := '��������(kg)';
  //GrdWeightingLst.Cells[5 , 0] := '1#��Ƥ��(kg)';
  //GrdWeightingLst.Cells[6 , 0] := '2#��Ƥ��(kg)';
  //GrdWeightingLst.Cells[7 , 0] := '3#��Ƥ��(kg)';
  //GrdWeightingLst.Cells[8 , 0] := '4#��Ƥ��(kg)';
  //GrdWeightingLst.Cells[9 , 0] := '��������(kg)';
  //GrdWeightingLst.Cells[10, 0] := '';
  //GrdWeightingLst.ColWidths[1] := 0;
  //GrdWeightingLst.ColWidths[2] := 0;
 // GrdWeightingLst.ColWidths[10] := 0;
  //GrdWeightingLst.RowCount := 2;
  //GrdWeightingLst.Rows[1].Clear;
  GrdWeightingLst.Cells[1 , 0] := '���';
  GrdWeightingLst.Cells[2 , 0] := '1#��Ƥ��';
  GrdWeightingLst.Cells[3 , 0] := '2#��Ƥ��';
  GrdWeightingLst.Cells[4 , 0] := '���������1';
  GrdWeightingLst.Cells[5 , 0] := '���������2';
  GrdWeightingLst.Cells[6 , 0] := '��ë��';
  GrdWeightingLst.Cells[7 , 0] := '�侻��';
  GrdWeightingLst.Cells[8 , 0] := '������';
  GrdWeightingLst.Cells[11, 0] := '�������';
  GrdWeightingLst.ColWidths[9] := 0;
  GrdWeightingLst.ColWidths[10] := 0;
  GrdWeightingLst.RowCount := 2;
  GrdWeightingLst.Rows[1].Clear;

  GrdUndoneGodownEntry.Cells[0, 0] := '���';
//  GrdUndoneGodownEntry.Cells[1, 0] := '���ص���';
//  GrdUndoneGodownEntry.Cells[2, 0] := 'ִ�мƻ���';
//  GrdUndoneGodownEntry.Cells[3, 0] := '��Э����';
//  GrdUndoneGodownEntry.Cells[4, 0] := '�ӹ�������';
//  GrdUndoneGodownEntry.Cells[5, 0] := '����ë��(kg)';
//  GrdUndoneGodownEntry.Cells[6, 0] := '����Ƥ��(kg)';
//  GrdUndoneGodownEntry.Cells[7, 0] := '��������(kg)';
//  GrdUndoneGodownEntry.Cells[8, 0] := '��������(��)';
//  GrdUndoneGodownEntry.Cells[9, 0] := '';
//  GrdUndoneGodownEntry.ColWidths[8] := 0;
//  GrdUndoneGodownEntry.ColWidths[9] := 0;
  GrdUndoneGodownEntry.cells[1,  0] := 'DB.ID';
  GrdUndoneGodownEntry.cells[2,  0] := '���ص���' ;
  GrdUndoneGodownEntry.cells[3,  0] := 'ִ�мƻ�����';
  GrdUndoneGodownEntry.cells[4,  0] := '��Э��������';
  GrdUndoneGodownEntry.cells[5,  0] := '��������';
  GrdUndoneGodownEntry.cells[6,  0] := '����������������' ;
  GrdUndoneGodownEntry.cells[7,  0] := '�������ع�������' ;
  GrdUndoneGodownEntry.cells[8,  0] := '������������'   ;
  GrdUndoneGodownEntry.cells[9,  0] := '����������������';
  GrdUndoneGodownEntry.cells[10, 0] := '����ë��' ;
  GrdUndoneGodownEntry.cells[11, 0] := '����Ƥ��' ;
  GrdUndoneGodownEntry.cells[12, 0] := '��Ʒ����' ;
  GrdUndoneGodownEntry.ColWidths[1] := 0;

  GrdUndoneGodownEntry.RowCount := 2;
  GrdUndoneGodownEntry.Rows[1].Clear;

  ApplicationPath := ExtractFilePath(Application.ExeName);

  {�������ݿ�}
  DbDirtoryStr := ExtractFilePath(Application.ExeName) + '\Data\DB.mdb';

  if not fileexists (DbDirtoryStr)then
  begin
    ShowMessage('���ݿ��ļ������ڻ����ݿ�������ȷ');
    application.Terminate;
    exit;
  end;

  try
    ADOConnection1.Connected := False;
    ADOConnection1.ConnectionString :=
                  'Provider=Microsoft.Jet.OLEDB.4.0;'+
                  //'Provider=Microsoft.ACE.OLEDB.12.0;' +
                  'Data Source='+ DbDirtoryStr + ';' +
                  'Persist Security Info=False;' +
                  'Jet OLEDB:Database Password=TSC2016' ;
    ADOConnection1.Connected := True;
  except
    showmessage('�������ݿ�ʧ��!');
  end;

  ADOQuery1.Connection := ADOConnection1;
  ADOQuery2.Connection := ADOConnection1;

  SetFile:=TInifile.Create(ExtractFilePath(Application.ExeName) + 'sys.ini');

  WeightMscommPort := SetFile.ReadString('Communication', 'WeightMscommPort1', 'COM1');
  ScaleComm1.CommName := WeightMscommPort;
  if ScaleComm1.Connected then
  begin
    showmessage('�˿�1�Ѿ���');
    ScaleMscommPort1Open := False;
  end
  else
  begin
    ScaleComm1.BaudRate := 9600;
    ScaleComm1.ByteSize := _7;
    ScaleComm1.Parity   := Odd;
    ScaleComm1.StopBits := _1;
    try
      ScaleComm1.StartComm ;
      ScaleMscommPort1Open := True;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        ScaleMscommPort1Open := False;
      end
    end;
  end;
  TmrWeightMscomm1.Enabled := True;

  WeightMscommPort := SetFile.ReadString('Communication', 'WeightMscommPort2', 'COM2');
  StatusBar1.Panels[5].Text := WeightMscommPort;
  //Huier_JSC_QHD_30
//  weight2 := THuier_JSC_QHD_30.Create;
//  weight2.setcommname(WeightMscommPort, 9600, _1,Odd,30, _7);

//  ScaleComm2.CommName := WeightMscommPort;
//  if ScaleComm2.Connected then
//  begin
//    showmessage('�����Ѵ�');
//    ScaleMscommPort2Open := False;
//    LbScale2MscommFailure.Visible := True;
//  end
//  else
//  begin
//    ScaleComm2.BaudRate := 1200;
//    ScaleComm2.ByteSize := _8;
//    ScaleComm2.Parity   := None;
//    ScaleComm2.StopBits := _1;
//    try
//      ScaleComm2.StartComm ;
//      ScaleMscommPort2Open := True;
//    except on e:Exception do
//      begin
//        ShowMessage(e.Message);
//        ScaleMscommPort2Open := False;
//        LbScale2MscommFailure.Visible := True;
//      end
//    end;
//  end;
//  WeightComm2State := WeightComm2StateIsIdle;    //����ͨѶ�˿�״̬ �� ����
//  ScaleMscommRecvBufwt2 := 1;
//  ScaleMscommRecvBufRd2 := 1;
//  WeightMscommFailure := 0;
//  TmrWeightMscomm2.Enabled := True;
  ScaleComm2.CommName := WeightMscommPort;
  if ScaleComm2.Connected then
  begin
    showmessage('�˿�2�Ѿ���');
    ScaleMscommPort2Open := False;
  end
  else
  begin
    ScaleComm2.BaudRate := 9600;
    ScaleComm2.ByteSize := _7;
    ScaleComm2.Parity   := Odd;
    ScaleComm2.StopBits := _1;
    try
      ScaleComm2.StartComm ;
      ScaleMscommPort2Open := True;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        ScaleMscommPort2Open := False;
      end
    end;
  end;
  TmrWeightMscomm2.Enabled := True;

  Gv_domain := SetFile.ReadString('Server', 'Gv_domain', 'http://192.168.1.253/');
  SavePicturePath := SetFile.ReadString('FtpServer', 'SavePicturePath', '') ;
  PictureExistPath := SetFile.ReadString('FtpServer', 'FtpFilePath','');

  //�û���¼
  if not FrmLoginCrt then
  begin
    FrmLogin := TFrmLogin.Create(Nil);
    FrmLoginCrt := True;
    if (FrmLogin.ShowModal <> mrOK) then
    begin
      Application.Terminate;
      exit;
    end;
  end;//}

  HttpGetSysConfig('out_sourced_weight');
  if InputSampleWeightEnable then
  begin
    EdtSamplePieceTotalWeight1.ReadOnly := False;
  end
  else
  begin
    EdtSamplePieceTotalWeight1.ReadOnly := True;
  end;

  if InputWeightEnable then
  begin
    EdtRecordWeight1.ReadOnly := False;
    EdtRecordWeight2.ReadOnly := False;
  end
  else
  begin
    EdtRecordWeight1.ReadOnly := true;
    EdtRecordWeight2.ReadOnly := True;
  end;
{  CameraInit := CameraInitialization();
  if CameraInit then
  begin
//    for i := 1 to 3 do
//    begin
//
//      CameraLogInfo.CameraIPAddress := SetFile.ReadString('Camera', 'Camera' + inttostr(i) + 'IP', '');
//      CameraLogInfo.CameraPort := SetFile.ReadInteger('Camera', 'Camera' + inttostr(i) + 'Port', 0);
//      CameraLogInfo.CameraUserName := SetFile.ReadString('Camera', 'Camera' + inttostr(i) + 'UserName', '');
//      CameraLogInfo.CameraPassword := SetFile.ReadString('Camera', 'Camera' + inttostr(i) + 'Password', '');

//      CameraLoginInfo_V30[i].CameraID := i;

//      struPlayInfo.lChannel := 1;    //ͨ����
//      struPlayInfo.lLinkMode := 0; //���λΪ1��ʾ������������λֵ��0-TCP��ʽ��1-UDP��ʽ��2-�ಥ��ʽ
//      struPlayInfo.sMultiCastIP := NIL; //�ಥ���ַ
//      struPlayInfo.hPlayWnd := TPanel(FindComponent(PlayWdn[i])).Handle; //Ԥ������
//      //struPlayInfo.hPlayWnd := 0;//������ֻȡ��

//      if not CameraLogin_V30(CameraLogInfo, CameraLoginInfo_V30[i], struPlayInfo) then
//      begin
//        Showmessage('1#�����Ԥ��ʧ��');
//      end;
//    end;
    for i := 1 to 4 do
    begin
      CameraLogInfo.CameraIPAddress := SetFile.ReadString('Camera', 'Camera' + inttostr(i) + 'IP', '');
      CameraLogInfo.CameraPort := SetFile.ReadInteger('Camera', 'Camera' + inttostr(i) + 'Port', 0);
      CameraLogInfo.CameraUserName := SetFile.ReadString('Camera', 'Camera' + inttostr(i) + 'UserName', '');
      CameraLogInfo.CameraPassword := SetFile.ReadString('Camera', 'Camera' + inttostr(i) + 'Password', '');
      CameraLoginInfo_V30[i].CameraID := i;
      struPlayInfo_v40[i].struPlayInfo_v40.hPlayWnd := TPanel(FindComponent(PlayWdn[i])).Handle; //��ҪSDK����ʱ�����Ϊ��Чֵ����ȡ��������ʱ����Ϊ��
      StatusBar1.Panels[5+i*2].Text := CameraLogInfo.CameraIPAddress;

      struPlayInfo_v40[i].struPlayInfo_v40.lChannel     := 1;       //Ԥ��ͨ����
      struPlayInfo_v40[i].struPlayInfo_v40.dwStreamType := 0;       //0-��������1-��������2-����3��3-����4���Դ�����
      struPlayInfo_v40[i].struPlayInfo_v40.dwLinkMode   := 0;       //0- TCP��ʽ��1- UDP��ʽ��2- �ಥ��ʽ��3- RTP��ʽ��4-RTP/RTSP��5-RSTP/HTTP
      struPlayInfo_v40[i].struPlayInfo_v40.bBlocked     := true;       //0- ������ȡ����1- ����ȡ��
      if not CameraLogin_v40(CameraLogInfo, struDeviceInfo[i], CameraLoginInfo_V30[i], struPlayInfo_v40[i]) then
      begin
        Showmessage(inttostr(i) + '������ͷע��Ԥ��ʧ��!');
      end ;
    end;
  end;}

  SetFile.Free;

  StatusBar1.Panels[1].Text := LoginNm;
  StatusBar1.Panels[3].Text := ScaleComm1.CommName;

  WeightingNote.bill_no := '';
  WeightingNote.exec_qrcode := '';

  RadioButton1.Checked := True;
  RadioButton2.Checked := True;

  BitBtn9.Caption := 'Mes' + chr($0D) + chr($0A) + '����';
  BitBtn6.Caption := '����' + chr($0D) + chr($0A) + '����';
  BitBtn11.Caption := '����' + chr($0D) + chr($0A) + 'ϵͳ';

  WeightDetailList := TStringList.Create;
  Timer1.Enabled := True;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  Edt_exec_qrcode.SetFocus;
  
end;

procedure TFrmMain.BitBtn11Click(Sender: TObject);
begin
  if not FrmAboutCrt then
  begin
    FrmAbout := TFrmAbout.Create(Self);
    FrmAboutCrt := True;
  end;
  FrmAbout.ShowModal;
end;

procedure TFrmMain.BitBtn12Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BitBtn13Click(Sender: TObject);
begin
  Panel1.Visible := False;
end;

procedure TFrmMain.BitBtn14Click(Sender: TObject);
begin
  Panel2.Visible := False;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
  SampPieceCount : Integer;
  SampPieceWeight : Double;
  UnitWorkpieceWeight : Double;
  CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo;
  GoOn : Boolean;
  Str : String ;
begin
  //Scale1Value := 1.501;

  //if WeightingNote.bill_no = '' then
  if ScaleMscommSucess1 > 0 then
  begin
    if WeightingNote.Id <= 0 then
    begin
      showmessage('���ص���Ϊ��');
      exit;
    end;

    if WeightingNote.unit_samp_weight > 0.001 then
    begin
      //if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ������Ƿ����²��������ݣ��滻��������','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
      if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ��������Ƿ�Ѹôβ���׷�ӵ�����ƽ��ֵ��','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
      begin
        Goon := True;
      end
      else
      begin
        GoOn := False;
      end;
    end
    else
    begin
      GoOn := True;
    end;

    if not Goon then
    begin
      exit;
    end;

    try
      SampPieceCount := strtoint(EdtSamplePieceCount1.Text);
    except
      showmessage('����Ĳ�����������');
      exit;
    end;

    SampPieceWeight := Scale1Value;

    if SampPieceCount<=0 then
    begin
      showmessage('��Ч�Ĳ������ظ���');
      exit;
    end;
    if SampPieceWeight < 0.001 then
    begin
      showmessage('��Ч�Ĳ�����������');
      exit;
    end;

    //UnitWorkpieceWeight := roundto(SampPieceWeight/SampPieceCount, -3);
    {--�ĳɲ��������ۼӣ����������ۼӣ����������������ۼ������ۼ�������ƽ��ֵ
    WeightingNote.samp_piece_weight := SampPieceWeight;
    WeightingNote.samp_piecce_count := SampPieceCount;
    WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;}
    //--------------�޸�----------------------------------------------------
    WeightingNote.samp_piece_weight := WeightingNote.samp_piece_weight + SampPieceWeight;
    WeightingNote.samp_piecce_count := WeightingNote.samp_piecce_count + SampPieceCount;
    UnitWorkpieceWeight := roundto(WeightingNote.samp_piece_weight/WeightingNote.samp_piecce_count, -3);
    WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;

    //str := '��������������' + inttostr(SampPieceCount) + chr($0D) + Chr($0A);
    //str := str + '�������س�ֵ��' + Format('%.3f', [SampPieceWeight]) + chr($0D) + Chr($0A);
    //str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
    str := '��������������' + inttostr(weightingNote.samp_piecce_count) + chr($0D) + Chr($0A);
    str := str + '�������س�ֵ��' + Format('%.3f', [WeightingNote.samp_piece_weight]) + chr($0D) + Chr($0A);
    str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
    if MessageBox(FrmMain.Handle, pchar(str) , 'ȷ������', MB_ICONINFORMATION+MB_OkCancel)=idok then
    begin
      {����}
      {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
      CaturePicture_V30_Info.PictureId := 2;
      CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
      if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
      begin
        WeightingNote.samp_picture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
        GoOn := True;
      end
      else
      begin
        GoOn := False;
      end;}
      WeightingNote.samp_picture := '';
      {�ϴ���Ƭ}
      //if GoOn then

      {���³��ص�}
      if GoOn then
      begin

        WeightingNote.sample_weight_from:= 0;
        if UpdateWeightingNoteToDb(WeightingNote) then
        begin
            DisplayWeightNote(WeightingNote);
            CalculateBoxNumberForWeighted();    //���¼����ִ�мƻ��µ��ѳ������
        end;

      end;
    end;
  end
  else
  begin
    if InputSampleWeightEnable then
    begin
      if WeightingNote.Id <= 0 then
      begin
        showmessage('���ص���Ϊ��');
        exit;
      end;

      if WeightingNote.unit_samp_weight > 0.001 then
      begin
        //if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ������Ƿ����²��������ݣ��滻��������','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
        if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ��������Ƿ�Ѹôβ���׷�ӵ�����ƽ��ֵ��','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
        begin
          Goon := True;
        end
        else
        begin
          GoOn := False;
        end;
      end
      else
      begin
        GoOn := True;
      end;

      if not Goon then
      begin
        exit;
      end;

      try
        SampPieceCount := strtoint(EdtSamplePieceCount1.Text);
      except
        showmessage('����Ĳ�����������');
        exit;
      end;

      try
        SampPieceWeight := strtofloat(EdtSamplePieceTotalWeight1.Text);
      except
        SampPieceWeight := 0.000;
      end;
      if SampPieceWeight < 0.001 then
      begin
        showmessage('���ֶ�������Ʒ����');
        exit;
      end;

      if SampPieceCount<=0 then
      begin
        showmessage('��Ч�Ĳ������ظ���');
        exit;
      end;

      //UnitWorkpieceWeight := roundto(SampPieceWeight/SampPieceCount, -3);
      {--�ĳɲ��������ۼӣ����������ۼӣ����������������ۼ������ۼ�������ƽ��ֵ
      WeightingNote.samp_piece_weight := SampPieceWeight;
      WeightingNote.samp_piecce_count := SampPieceCount;
      WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;}
      //--------------�޸�----------------------------------------------------
      WeightingNote.samp_piece_weight := WeightingNote.samp_piece_weight + SampPieceWeight;
      WeightingNote.samp_piecce_count := WeightingNote.samp_piecce_count + SampPieceCount;
      UnitWorkpieceWeight := roundto(WeightingNote.samp_piece_weight/WeightingNote.samp_piecce_count, -3);
      WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;

      //str := '��������������' + inttostr(SampPieceCount) + chr($0D) + Chr($0A);
      //str := str + '�������س�ֵ��' + Format('%.3f', [SampPieceWeight]) + chr($0D) + Chr($0A);
      //str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
      str := '��������������' + inttostr(WeightingNote.samp_piecce_count) + chr($0D) + Chr($0A);
      str := str + '�������س�ֵ��' + Format('%.3f', [WeightingNote.samp_piece_weight]) + chr($0D) + Chr($0A);
      str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
      if MessageBox(FrmMain.Handle, pchar(str) , 'ȷ������', MB_ICONINFORMATION+MB_OkCancel)=idok then
      begin
        {����}
        {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
        CaturePicture_V30_Info.PictureId := 2;
        CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
        if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
        begin
          WeightingNote.samp_picture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
          GoOn := True;
        end
        else
        begin
          GoOn := False;
        end;}

        WeightingNote.samp_picture := '';
        {�ϴ���Ƭ}
        //if GoOn then

        {���³��ص�}
        if GoOn then
        begin
          WeightingNote.sample_weight_from:= 1;
          if UpdateWeightingNoteToDb(WeightingNote) then
          begin
            DisplayWeightNote(WeightingNote);
            CalculateBoxNumberForWeighted();    //���¼����ִ�мƻ��µ��ѳ������
          end;
        end;
      end;
    end
    else
    begin
      Showmessage('��ƽ̨ͨѶʧ�ܣ�����ϵά����Ա');
    end;
  end;
end;

procedure TFrmMain.CalculateBoxNumberForWeighted();    //���¼����ִ�мƻ��µ��ѳ������
var
  i : integer;
  NumberSum,
  Number : integer;
  Gross : Double;
begin
  NumberSum := 0;
  if WeightDetailList.Count >= 1 then
  begin
    ADOConnection1.BeginTrans;
    try
      for i := 0 to WeightDetailList.Count-1 do
      begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select weightnet from t_out_sourced_weight_detail where id=:id';
        ADOQuery1.Parameters.ParamByName('id').Value := WeightDetailList.Strings[i];
        ADOQuery1.Open;
        if ADOQuery1.Eof then
        begin
          Showmessage('��ȡ����Ϊ' + WeightDetailList.Strings[i] + 'ë������ʧ�ܣ�����ʧ��');
        end
        else
        begin
          Gross := ADOQuery1.FieldByName('weightnet').AsFloat;
          Number := Trunc(Roundto(Gross / WeightingNote.unit_samp_weight, -0));
          ADOQuery1.Close;
          ADOQuery1.SQL.Clear;
          ADOQuery1.SQL.Text := 'update t_out_sourced_weight_detail set workpiecenumber=:workpiecenumber,unit_samp_weight=:unit_samp_weight where id=:id';
          ADOQuery1.Parameters.ParamByName('workpiecenumber').Value := Number;
          ADOQuery1.Parameters.ParamByName('unit_samp_weight').Value := WeightingNote.unit_samp_weight;
          ADOQuery1.Parameters.ParamByName('id').Value := WeightDetailList.Strings[i];
          ADOQuery1.ExecSQL;
          NumberSum := NumberSum + Number;
        end;
      end;
      ADOQuery1.Close;
      ADOQuery1.SQL.Text := 'update t_weight_count set workpiecetotalnum=:workpiecetotalnum '
                          + ' where weightid=:weightid and Batch=:Batch';
      ADOQuery1.Parameters.ParamByName('workpiecetotalnum').Value := NumberSum;
      ADOQuery1.Parameters.ParamByName('weightid').Value := WeightingNote.Id;
      ADOQuery1.Parameters.ParamByName('Batch').Value    := WeightingNote.BatchCount;
      ADOQuery1.ExecSQL;

      ADOConnection1.CommitTrans;
    except
      ADOConnection1.RollbackTrans;
    end;

    GrdWeightingLst.RowCount := 2;
    GrdWeightingLst.Rows[1].Clear;
    DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount ) ;

  end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
    Gross : Double;
    Box1Tare,
    Box2Tare : double;
begin
  try
    Box1Tare := strToFloat(EtBoxTare11.Text);
    Box1Tare := Roundto(Box1Tare, -3);
  except
    showmessage('��Ч������1Ƥ��');
    exit;
  end;

  try
    Box2Tare := strToFloat(EtBoxTare12.Text);
    Box2Tare := Roundto(Box2Tare, -3);
  except
    showmessage('��Ч������2Ƥ��');
    exit;
  end;
  WeightingNote.Box1Tare := Box1Tare;
  WeightingNote.Box2Tare := Box2Tare;

  if ScaleMscommSucess1 > 0 then
  begin
    Gross := Scale1Value;
    WeightingNote.RecordWeightGross := RecordWeight1;
    WeightManageHandle(WeightingNote, Gross, 0, 1);
    EtBoxTare11.Text := '0';
    EtBoxTare12.text := '0';
  end
  else
  begin
    if InputWeightEnable then
    begin
      Panel1.Left := 166;
      Panel1.Top  := 395;
      Panel1.Visible := True;
      Edit8.SetFocus;
    end
    else
    begin
      Showmessage('��ƽ̨ͨѶʧ�ܣ�����ϵά����Ա');
    end;
  end;
end;

procedure TFrmMain.WeightManageHandle(WeightingNote : RdWeightNote; Gross : Double;
  weight_from : integer; weightNumber : integer );
var
  WeightBoxCount : Integer;
  Box1Tare,
  Box2Tare,
  Box3Tare : Double;
  HintStr : String;
  //Weight : Double;
  WeightNet : Double;
  RandomData1,
  RandomData2 : integer ;
  Box1Net, Box2Net, BoxNet : double;
  Box1Gross, Box2Gross, BoxGross : double;
  WeightData1,
  WeightData2 : WeightData;
  WorkpieceNumber1, WorkpieceNumber2, WorkpieceNumber : integer;
  CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo;
  WeightPicture : String;
  Row : integer;
begin
  if WeightingNote.Id <= 0 then
  begin
    Showmessage('���ص���Ϊ��');
    exit;
  end;

  if WeightingNote.unit_samp_weight < 0.001 then
  begin
    Showmessage('�ó��ص���δ���������Ȳ���');
    exit;
  end;

  WeightBoxCount := 0;

//  try
//    Box1Tare := strToFloat(EtBoxTare11.Text);
//    Box1Tare := Roundto(Box1Tare, -3);
//  except
//    showmessage('��Ч������1Ƥ��');
//    exit;
//  end;
  if WeightingNote.Box1Tare > 0.001  then
  begin
    WeightBoxCount := WeightBoxCount +1;
  end;
//
//  try
//    Box2Tare := strToFloat(EtBoxTare12.Text);
//    Box2Tare := Roundto(Box2Tare, -3);
//  except
//    showmessage('��Ч������2Ƥ��');
//    exit;
//  end;
  if WeightingNote.Box2Tare > 0.001  then
  begin
    WeightBoxCount := WeightBoxCount +1;
  end;

  if RadioButton1.Checked then
  begin
    if WeightingNote.RecordWeightGross < 0.1 then
    begin
      Showmessage('���ȵ����������������ť');
      exit;
    end;

    Box1Gross := Gross;

    Box2Gross := WeightingNote.RecordWeightGross -Box1Gross;
    //WeightNet := Box1Gross - Box1Tare - Box2Tare;
    Box1Net := Box1Gross - WeightingNote.Box1Tare;
    Box2Net := Box2Gross - WeightingNote.Box2Tare;
    WorkpieceNumber1 := Trunc(roundto(Box1Net / WeightingNote.unit_samp_weight, -0));
    WorkpieceNumber2 := Trunc(roundto(Box2Net / WeightingNote.unit_samp_weight, -0));

    HintStr := '����ģʽ�����䵥�ƣ�' + chr($0D) + chr($0A);
    HintStr := HintStr + '��ʼ������' + Format('%.3f', [WeightingNote.RecordWeightGross]) + chr($0D) + chr($0A);
    HintStr := HintStr + '(1#)��������ë�أ�' + format('%.3f', [Box1Gross]);
    HintStr := HintStr + ' ,Ƥ�أ�' + Format('%.3f', [WeightingNote.Box1Tare]) ;
    HintStr := HintStr + ' ,���أ�' + Format('%.3f', [Box1Net]) ;
    HintStr := HintStr + ' ,��������' + Format('%.0d', [WorkpieceNumber1])+ chr($0D) + Chr($0A);

    HintStr := HintStr + '(2#)��������ë�أ�' + format('%.3f', [Box2Gross]);
    HintStr := HintStr + ' ,Ƥ�أ�' + Format('%.3f', [WeightingNote.Box2Tare]);
    HintStr := HintStr + ' ,���أ�' + Format('%.3f', [Box2Net]) ;
    HintStr := HintStr + ' ,��������' + Format('%.0d', [WorkpieceNumber2])+ chr($0D) + Chr($0A);
    if messagebox(FrmMain.Handle, pchar(HintStr), 'ѯ����Ϣ', MB_ICONINFORMATION+MB_OkCancel)=idok then
    begin
        Randomize();
        if EdtBox11Number.Text <> '' then
        begin
          if searchBoxNumberExist(EdtBox11Number.Text, WeightingNote.Id, WeightingNote.BatchCount) then
          begin
            Showmessage('"' + EdtBox11Number.Text + '"������Ѿ����أ������ظ�����');
            exit;
          end;
        end
        else
        begin
          repeat
            RandomData1 := RandomRange(1000,9999);
            EdtBox11Number.Text := inttostr(RandomData1);
          until not SearchBoxNumberExist(EdtBox11Number.Text, WeightingNote.Id, WeightingNote.BatchCount);
        end;

        if EdtBox12Number.Text <> '' then
        begin
          if searchBoxNumberExist(EdtBox12Number.Text, WeightingNote.Id, WeightingNote.BatchCount) then
          begin
            Showmessage('"' + EdtBox12Number.Text + '"������Ѿ����أ������ظ�����');
            exit;
          end;
        end
        else
        begin
          repeat
            RandomData2 := RandomRange(1000,9999);
            EdtBox12Number.Text := inttostr(RandomData2);
          until not SearchBoxNumberExist(EdtBox12Number.Text, WeightingNote.Id, WeightingNote.BatchCount);
        end;

        {����}
        {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[1].UserID;
        CaturePicture_V30_Info.PictureId := 2;
        CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[1].lRealHandle;
        if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
        begin
          WeightPicture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
        end
        else
        begin
          Showmessage('����ͼƬʧ��');
          exit;
        end; }
        WeightPicture := '';

        try
          WeightData1.print_code := strtoint(EdtBox11Number.Text);
        except
          WeightData1.print_code := 0;
        end;
        WeightData1.Box1TareWeight := WeightingNote.Box1Tare;
        WeightData1.Box2TareWeight := 0;
        WeightData1.Box3TareWeight := 0;
        WeightData1.weightgross1   := Box1Gross;
        WeightData1.weightgross2   := 0;
        WeightData1.weightGross    := Box1Gross;
        WeightData1.weightnet      := Box1Net;
        WeightData1.workpiecenumber:= WorkpieceNumber1;    //��������
        WeightData1.workbox_num    := WorkpieceNumber1;    //�������
        WeightData1.weight_picture := RecordWeightPicture;
        WeightData1.modeman        := loginNm;
        WeightData1.modedate       := (DateTimeToUnix(Now)-8*60*60);
        WeightData1.weight_from    := weight_from;    //����������Դ��0���Զ���ȡ��ֵ��1���ֶ�����
        WeightData1.unit_samp_weight:= WeightingNote.unit_samp_weight;     //�������ص�����������
        WeightData1.sample_weight_from := WeightingNote.sample_weight_from ;    //����������Դ 0���Զ���ȡ��ֵ 1���ֶ�����
        if weightnumber =1 then
            Et_workbox_num11.Text := inttostr(WeightData1.workbox_num)
        else
            Et_workbox_num21.text := inttostr(WeightData1.workbox_num);
        try
          WeightData2.print_code := strtoint(EdtBox12Number.Text);
        except
          WeightData2.print_code := 0;
        end;
        WeightData2.Box1TareWeight := WeightingNote.Box2Tare;
        WeightData2.Box2TareWeight := 0;
        WeightData2.Box3TareWeight := 0;
        WeightData2.weightgross1   := WeightingNote.RecordWeightGross;
        WeightData2.weightgross2   := Box1Gross;
        WeightData2.weightGross    := Box2Gross;
        WeightData2.weightnet      := Box2Net;
        WeightData2.workpiecenumber:= WorkpieceNumber2;     //��������
        WeightData2.workbox_num    := WorkpieceNumber2;     //�������
        WeightData2.weight_picture := WeightPicture;
        WeightData2.modeman        := loginNm;
        WeightData2.modedate       := (DateTimeToUnix(Now)-8*60*60);
        WeightData2.weight_from    := weight_from;    //����������Դ��0���Զ���ȡ��ֵ��1���ֶ�����
        WeightData2.unit_samp_weight:= WeightingNote.unit_samp_weight;     //�������ص�����������
        WeightData2.sample_weight_from := WeightingNote.sample_weight_from ;    //����������Դ 0���Զ���ȡ��ֵ 1���ֶ�����
        if weightnumber =1 then
            Et_workbox_num12.Text := inttostr(WeightData2.workbox_num)
        else
            Et_workbox_num22.Text := inttostr(WeightData2.workbox_num);

        if insertTwoWeightDetails(WeightData1,WeightData2,WeightingNote) then
        begin
          DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount);

          DispWeightBatchInfo(WeightingNote.Id, WeightingNote.BatchCount);
          EtBoxTare11.Text := '0';
          EtBoxTare12.text := '0';
        end;
        WeightingNote.RecordWeightGross := 0;
      end;
    end
    else
    begin
      BoxGross := Gross;
      BoxNet   := BoxGross - WeightingNote.Box1Tare - WeightingNote.Box2Tare;
      WorkpieceNumber := trunc(roundto(BoxNet / WeightingNote.unit_samp_weight, -0)) ;

      HintStr := '����ģʽ���������أ�' + chr($0D) + chr($0A);
      HintStr := HintStr + 'ë�أ�' + format('%.3f', [BoxGross]);
      HintStr := HintStr + ' ,1#��Ƥ�أ�' + Format('%.3f', [WeightingNote.Box1Tare]) + ' ,2#��Ƥ��'
        +  Format('%.3f', [WeightingNote.Box2Tare])+ chr($0D) + Chr($0A);
      HintStr := HintStr + ' ���أ�' + Format('%.3f', [BoxNet]) ;
      HintStr := HintStr + ' ,��������' + Format('%.0d', [WorkpieceNumber])+ chr($0D) + Chr($0A);
      if messagebox(FrmMain.Handle, pchar(HintStr), 'ѯ����Ϣ', MB_ICONINFORMATION+MB_OkCancel)=idok then
      begin
        if EdtBox11Number.Text <> '' then
        begin
          if searchBoxNumberExist(EdtBox11Number.Text, WeightingNote.Id, WeightingNote.BatchCount) then
          begin
            Showmessage('"' + EdtBox11Number.Text + '"������Ѿ����أ������ظ�����');
            exit;
          end;
        end
        else
        begin
          EdtBox12Number.Text := '';
          Randomize();
          repeat
            RandomData1 := RandomRange(1000,9999);
            EdtBox11Number.Text := inttostr(RandomData1);
          until not searchBoxNumberExist(EdtBox11Number.Text, WeightingNote.Id, WeightingNote.BatchCount);
        end;

        try
          WeightData1.print_code := strToint(EdtBox11Number.Text);
        except
          WeightData1.print_code := 0;
        end;

        if WeightMode=0 then
        begin
          ADOQuery1.Close;
          ADOQuery1.SQL.Clear;
          ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:weightid and weightbatchs=:Batch and print_code=:print_code';
          ADOQuery1.Parameters.ParamByName('weightid').Value := WeightingNote.Id;
          ADOQuery1.Parameters.ParamByName('Batch').Value    := WeightingNote.BatchCount;
          ADOQuery1.Parameters.ParamByName('print_code').Value:= WeightData1.print_code;
          ADOQuery1.Open;
          if not ADOQuery1.Eof then
          begin
            Showmessage('������Ѵ���');
            exit;
          end;
        end
        else
        begin
          try
            ADOConnection1.BeginTrans;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'delete * from t_out_sourced_weight_detail where WeightNoteID=:weightid and weightbatchs=:Batch and print_code=:print_code';
            ADOQuery1.Parameters.ParamByName('weightid').Value := WeightingNote.Id;
            ADOQuery1.Parameters.ParamByName('Batch').Value    := WeightingNote.BatchCount;
            ADOQuery1.Parameters.ParamByName('print_code').Value:= WeightData1.print_code;
            ADOQuery1.ExecSQL;
            ADOConnection1.CommitTrans;
            WeightMode := 0;
          except
            ADOConnection1.RollbackTrans;
          end;
        end;

        WeightData1.Box1Tare := 0;
        WeightData1.Box2Tare := 0;
        WeightData1.Box3Tare := 0;
        WeightData1.Box1TareWeight := WeightingNote.Box1Tare;
        WeightData1.Box2TareWeight := WeightingNote.Box2Tare;
        //WeightData1.Box3TareWeight := Box3Tare;
        WeightData1.weightgross1   := BoxGross;
        WeightData1.weightgross2   := 0;
        WeightData1.weightGross    := BoxGross;
        WeightData1.weightnet      := BoxNet;
        WeightData1.workpiecenumber:= WorkpieceNumber;      //��������
        WeightData1.workbox_num    := WorkpieceNumber;      //�������
        WeightData1.unit_samp_weight:= WeightingNote.unit_samp_weight;     //�������ص�����������
        WeightData1.sample_weight_from := WeightingNote.sample_weight_from ;    //����������Դ 0���Զ���ȡ��ֵ 1���ֶ�����
        WeightData1.weight_from := weight_from;    //����������Դ��0���Զ���ȡ��ֵ��1���ֶ�����.
        if weightnumber=1 then
            Et_workbox_num11.Text      := inttostr(WeightData1.workbox_num)
        else
            Et_workbox_num21.Text      := inttostr(WeightData1.workbox_num);

        {����}
        {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[1].UserID;
        CaturePicture_V30_Info.PictureId := 1;
        CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[1].lRealHandle;
        if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
        begin
          WeightPicture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
        end
        else
        begin
          Showmessage('����ͼƬʧ��');
          exit;
        end;}
        WeightPicture := '';

        WeightData1.weight_picture := WeightPicture;
        WeightData1.modeman        := LoginNm;
        WeightData1.modedate       := (DateTimeToUnix(Now)-8*60*60);
        if insertOneWeightDetails(WeightData1, WeightingNote) then
        begin
          {ADOQuery1.Close;
          ADOQuery1.SQL.Clear;
          ADOQuery1.SQL.Text := 'select * from t_weight_count where weightid=:weightid and Batch=:Batch';
          ADOQuery1.Parameters.ParamByName('weightid').Value := WeightingNote.Id;
          ADOQuery1.Parameters.ParamByName('Batch').Value    := WeightingNote.BatchCount;
          ADOQuery1.Open;
          if not ADOQuery1.Eof then
          begin
            EdtGross.Text     := Format('%.3f', [ ADOQuery1.FieldByName('weightgross').AsFloat ]);
            EdtTotalTare.Text := Format( '%.3f', [ADOQuery1.FieldByName('weighttare').AsFloat]);
            EdtTotaolNet.Text := format('%.3f', [ADOQuery1.FieldByName('weightnet').AsFloat]);
            EdtSampCount.Text := inttostr( ADOQuery1.FieldByName('workpiecetotalnum').AsInteger);
          end
          else
          begin
            Showmessage('���ݸ���ʧ��');
          end;}
          DispWeightBatchInfo(WeightingNote.Id, WeightingNote.BatchCount);

          DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount);

          if weightnumber=1 then
              Et_workbox_num11.Text := inttostr(WeightData1.workbox_num)
          else
              Et_workbox_num21.Text := inttostr(WeightData1.workbox_num);

          Et_workbox_num12.Text := '';

        end;
      end;
    end;

    Box1Print_code := EdtBox11Number.Text;
    Box2Print_code := EdtBox12Number.Text;

    EdtRecordWeight1.Text := '0.0';
    EdtBox12Number.Text := '';
    EdtBox11Number.Text := '';
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
var
  SampPieceCount : Integer;
  SampPieceWeight : Double;
  UnitWorkpieceWeight : Double;
  CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo;
  GoOn : Boolean;
  Str : String ;
begin
  if ScaleMscommSucess2 > 0 then
  begin
    if WeightingNote.Id <= 0 then
    begin
      showmessage('���ص���Ϊ��');
      exit;
    end;

    if WeightingNote.unit_samp_weight > 0.001 then
    begin
      //if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ������Ƿ����²��������ݣ��滻��������','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
      if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ��������Ƿ�Ѹôβ���׷�ӵ�����ƽ��ֵ��','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
      begin
        Goon := True;
      end
      else
      begin
        GoOn := False;
      end;
    end
    else
    begin
      GoOn := True;
    end;

    if not Goon then
    begin
      exit;
    end;

    try
      SampPieceCount := strtoint(EdtSamplePieceCount2.Text);
    except
      showmessage('����Ĳ�����������');
      exit;
    end;

    //SampPieceWeight := Weight2.value;
    SampPieceWeight := Scale2Value;

    if SampPieceCount<=0 then
    begin
      showmessage('��Ч�Ĳ������ظ���');
      exit;
    end;
    if SampPieceWeight < 0.001 then
    begin
      showmessage('��Ч�Ĳ�����������');
      exit;
    end;
    //------ʵ�� �����ۼƣ������ۼƣ���Ʒ�����ۼƣ�ƽ��ֵ�ۼƣ��������---------
    //UnitWorkpieceWeight := roundto(SampPieceWeight/SampPieceCount, -3);
    //WeightingNote.samp_piece_weight := SampPieceWeight;
    //WeightingNote.samp_piecce_count := SampPieceCount;
    //WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;
    //----------------------��Ϊ------------------------------------------------
    WeightingNote.samp_piece_weight := WeightingNote.samp_piece_weight + SampPieceWeight;
    WeightingNote.samp_piecce_count := WeightingNote.samp_piecce_count + SampPieceCount;
    UnitWorkpieceWeight := roundto(WeightingNote.samp_piece_weight/WeightingNote.samp_piecce_count, -3);
    WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;
    //--------------------��ʾ��Ϣ��Ҳ------------------------------------------
    //str := '��������������' + inttostr(SampPieceCount) + chr($0D) + Chr($0A);
    //str := str + '�������س�ֵ��' + Format('%.3f', [SampPieceWeight]) + chr($0D) + Chr($0A);
    //str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
    //--------------------------��Ϊ--------------------------------------------
    str := '��������������' + inttostr(WeightingNote.samp_piecce_count) + chr($0D) + Chr($0A);
    str := str + '�������س�ֵ��' + Format('%.3f', [WeightingNote.samp_piece_weight]) + chr($0D) + Chr($0A);
    str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
    //--------------------------------------------------------------------------
    if MessageBox(FrmMain.Handle, pchar(str) , 'ȷ������', MB_ICONINFORMATION+MB_OkCancel)=idok then
    begin
      {����}
      {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
      CaturePicture_V30_Info.PictureId := 2;
      CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
      if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
      begin
        WeightingNote.samp_picture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
        GoOn := True;
      end
      else
      begin
        GoOn := False;
      end;}
      WeightingNote.samp_picture := '';
      {�ϴ���Ƭ}
      //if GoOn then
      {���³��ص�}
      if GoOn then
      begin
        WeightingNote.sample_weight_from:= 0;
        //if UpdateWeightNote(WeightingNote ) then
        begin
          if UpdateWeightingNoteToDb(WeightingNote) then
          begin
            DisplayWeightNote(WeightingNote);
            CalculateBoxNumberForWeighted();    //���¼����ִ�мƻ��µ��ѳ������
          end;
        end;
      end;
    end;
  end
  else
  begin
    if InputSampleWeightEnable then
    begin
      if WeightingNote.Id <= 0 then
      begin
        showmessage('���ص���Ϊ��');
        exit;
      end;
      if WeightingNote.unit_samp_weight > 0.001 then
      begin
        //if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ������Ƿ����²��������ݣ��滻��������','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
        if messagebox(FrmMain.Handle,'�ó��ص��Ѳɹ��������Ƿ�Ѹôβ���׷�ӵ�����ƽ��ֵ��','����', MB_ICONINFORMATION+MB_OkCancel)=idok then
        begin
          Goon := True;
        end
        else
        begin
          GoOn := False;
        end;
      end
      else
      begin
        GoOn := True;
      end;

      if not Goon then
      begin
        exit;
      end;

      try
        SampPieceCount := strtoint(EdtSamplePieceCount2.Text);
      except
        showmessage('����Ĳ�����������');
        exit;
      end;

      try
        SampPieceWeight := strtofloat(EdtSamplePieceTotalWeight2.Text);
      except
        SampPieceWeight := 0.000;
      end;

      if SampPieceWeight < 0.001 then
      begin
        showmessage('���ֶ�������Ʒ����');
        exit;
      end;

      if SampPieceCount<=0 then
      begin
        showmessage('��Ч�Ĳ������ظ���');
        exit;
      end;

      //UnitWorkpieceWeight := roundto(SampPieceWeight/SampPieceCount, -3);
      //------ʵ�� �����ۼƣ������ۼƣ���Ʒ�����ۼƣ�ƽ��ֵ�ۼƣ��������-------
      //WeightingNote.samp_piece_weight := SampPieceWeight;
      //WeightingNote.samp_piecce_count := SampPieceCount;
      //WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;
      //----------------------��Ϊ------------------------------------------------
      WeightingNote.samp_piece_weight := WeightingNote.samp_piece_weight + SampPieceWeight;
      WeightingNote.samp_piecce_count := WeightingNote.samp_piecce_count + SampPieceCount;
      UnitWorkpieceWeight := roundto(WeightingNote.samp_piece_weight/WeightingNote.samp_piecce_count, -3);
      WeightingNote.unit_samp_weight  := UnitWorkpieceWeight;
      //--------------------��ʾ��Ϣ��Ҳ------------------------------------------
      //str := '��������������' + inttostr(SampPieceCount) + chr($0D) + Chr($0A);
      //str := str + '�������س�ֵ��' + Format('%.3f', [SampPieceWeight]) + chr($0D) + Chr($0A);
      //str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
      //--------------------------��Ϊ--------------------------------------------
      str := '��������������' + inttostr(WeightingNote.samp_piecce_count) + chr($0D) + Chr($0A);
      str := str + '�������س�ֵ��' + Format('%.3f', [WeightingNote.samp_piece_weight]) + chr($0D) + Chr($0A);
      str := str + '������������������ƽ������' + Format('%.3f', [UnitWorkpieceWeight]);
      //--------------------------------------------------------------------------
      if MessageBox(FrmMain.Handle, pchar(str) , 'ȷ������', MB_ICONINFORMATION+MB_OkCancel)=idok then
      begin
        {����}
        {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
        CaturePicture_V30_Info.PictureId := 2;
        CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
        if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
        begin
          WeightingNote.samp_picture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
          GoOn := True;
        end
        else
        begin
          GoOn := False;
        end;}
        WeightingNote.samp_picture := '';
        {�ϴ���Ƭ}
        //if GoOn then
        {���³��ص�}
        if GoOn then
        begin
          WeightingNote.sample_weight_from:= 1;
          if UpdateWeightingNoteToDb(WeightingNote) then
          begin
            DisplayWeightNote(WeightingNote);
            CalculateBoxNumberForWeighted();    //���¼����ִ�мƻ��µ��ѳ������
          end;
        end;
      end;
    end
    else
    begin
      Showmessage('��ƽ̨ͨѶʧ�ܣ�����ϵά����Ա');
    end;
  end;
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
var
    Gross : Double;
    Box1Tare,
    Box2Tare : Double;
begin
  try
    Box1Tare := strToFloat(EtBoxTare21.Text);
    Box1Tare := Roundto(Box1Tare, -3);
  except
    showmessage('��Ч������1Ƥ��');
    exit;
  end;

  try
    Box2Tare := strToFloat(EtBoxTare22.Text);
    Box2Tare := Roundto(Box2Tare, -3);
  except
    showmessage('��Ч������2Ƥ��');
    exit;
  end;
  WeightingNote.Box1Tare := Box1Tare;
  WeightingNote.Box2Tare := Box2Tare;
//  if WeightMscommFailure < 3 then
//  if Weight2.CommFailureCount < 3 then
  if ScaleMscommSucess2 > 0 then
  begin
    //Gross := Weight2.value;
    Gross := Scale2Value;
    WeightingNote.RecordWeightGross := RecordWeight2;
    WeightManageHandle(WeightingNote, Gross, 0, 2);
    EtBoxTare21.Text := '0';
    EtBoxTare22.text := '0';
  end
  else
  begin
    if InputWeightEnable then
    begin
      Panel2.Left := 491;
      Panel2.Top  := 328;
      Panel2.Visible := True;
      Edit11.SetFocus;
    end
    else
    begin
      Showmessage('��ƽ̨ͨѶʧ�ܣ�����ϵά����Ա');
    end;
  end;
end;

procedure TFrmMain.BitBtn6Click(Sender: TObject);
begin
  if not FrmUnUpLoadDataCrt then
  begin
    FrmUnUpLoadData := TFrmUnUpLoadData.Create(Self);
    FrmUnUpLoadDataCrt := True;
  end;
  FrmUnUpLoadData.ShowModal;
end;

procedure TFrmMain.BitBtn7Click(Sender: TObject);
var
  TempRecordWeightGross : Double;
  HintStr : String;
  CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo;
begin
  if ScaleMscommSucess1 > 0 then
  begin
    if RadioButton1.Checked then
    begin
      TempRecordWeightGross := Scale1Value;

      HintStr := '��Ҫ��' + floattostr(TempRecordWeightGross) + '��Ϊ��ʼ������';

      if messagebox(FrmMain.Handle, Pchar(HintStr), 'ѯ����Ϣ', MB_ICONINFORMATION+MB_OkCancel)=idOk then
      begin
        //WeightingNote.RecordWeightGross := TempRecordWeightGross;
        RecordWeight1 := TempRecordWeightGross;
      end;

      WeightSetCount := 2;

      {����}
      {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
      CaturePicture_V30_Info.PictureId := 2;
      CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
      if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
      begin
        RecordWeightPicture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
      end
      else
      begin
        Showmessage('����ͼƬʧ��');
      end;}
      RecordWeightPicture := '';
      EdtRecordWeight1.Text := floattostr( RecordWeight1 );
    end
    else
    begin
      WeightSetCount := 0;
      Showmessage('��ѡ����ǡ��������ء�ģʽ���ð�ť��Ч');
    end;
  end
  else
  begin
    if InputWeightEnable then
    begin
      if RadioButton1.Checked then
      begin
        try
          TempRecordWeightGross := strtofloat(EdtRecordWeight1.Text);
        except
          TempRecordWeightGross := 0.000;
        end;
        if TempRecordWeightGross < 0.001 then
        begin
          Showmessage('��������ȷ�ļ�������');
          exit;
        end;

        HintStr := '��Ҫ��' + floattostr(TempRecordWeightGross) + '��Ϊ��ʼ������';
        if messagebox(FrmMain.Handle, Pchar(HintStr), 'ѯ����Ϣ', MB_ICONINFORMATION+MB_OkCancel)=idOk then
        begin
          //WeightingNote.RecordWeightGross := TempRecordWeightGross;
          RecordWeight1 := TempRecordWeightGross;
        end;

        WeightSetCount := 2;

        {����}
        {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
        CaturePicture_V30_Info.PictureId := 2;
        CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
        if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
        begin
          RecordWeightPicture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
        end
        else
        begin
          Showmessage('����ͼƬʧ��');
        end;}
        RecordWeightPicture := '';
        EdtRecordWeight1.Text := floattostr( RecordWeight1 );
      end
      else
      begin
        WeightSetCount := 0;
        Showmessage('��ѡ����ǡ��������ء�ģʽ���ð�ť��Ч');
      end;
    end
    else
    begin
      Showmessage('��ƽ̨ͨѶʧ�ܣ�����ϵά����Ա');
    end;
  end;
end;

procedure TFrmMain.BitBtn8Click(Sender: TObject);
var
  TempRecordWeightGross : Double;
  HintStr : String;
  CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo;
begin
  //Scale2Value := 1005.5;
  //if WeightMscommFailure < 3 then
  //if Weight2.CommFailureCount < 3 then
  if ScaleMscommSucess2 > 0 then
  begin
    if RadioButton1.Checked then
    begin
      //TempRecordWeightGross := Weight2.value;
      TempRecordWeightGross := Scale2Value;

      HintStr := '��Ҫ��' + floattostr(TempRecordWeightGross) + '��Ϊ��ʼ������';

      if messagebox(FrmMain.Handle, Pchar(HintStr), 'ѯ����Ϣ', MB_ICONINFORMATION+MB_OkCancel)=idOk then
      begin
        //WeightingNote.RecordWeightGross2 := TempRecordWeightGross;
        RecordWeight2 := TempRecordWeightGross;
      end;

      WeightSetCount := 2;

      {����}
      {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[3].UserID;
      CaturePicture_V30_Info.PictureId := 3;
      CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[3].lRealHandle;
      if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
      begin
        RecordWeightPicture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
      end
      else
      begin
        Showmessage('����ͼƬʧ��');
      end;}
      RecordWeightPicture := '';
      EdtRecordWeight2.Text := format('%.3f',[RecordWeight2]);
    end
    else
    begin
      WeightSetCount := 0;
      Showmessage('��ѡ����ǡ��������ء�ģʽ���ð�ť��Ч');
    end;
  end
  else
  begin
    if InputWeightEnable then
    begin
      if RadioButton1.Checked then
      begin
        try
          TempRecordWeightGross := strtofloat(EdtRecordWeight2.Text);
        except
          TempRecordWeightGross := 0.000;
        end;
        if TempRecordWeightGross < 0.001 then
        begin
          Showmessage('��������ȷ�ļ�������');
          exit;
        end;

        HintStr := '��Ҫ��' + floattostr(TempRecordWeightGross) + '��Ϊ��ʼ������';

        if messagebox(FrmMain.Handle, Pchar(HintStr), 'ѯ����Ϣ', MB_ICONINFORMATION+MB_OkCancel)=idOk then
        begin
          //WeightingNote.RecordWeightGross2 := TempRecordWeightGross;
          RecordWeight2 := TempRecordWeightGross;
        end;

        WeightSetCount := 2;

        {����}
        {CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[3].UserID;
        CaturePicture_V30_Info.PictureId := 3;
        CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[3].lRealHandle;
        if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
        begin
          RecordWeightPicture := PictureExistPath + CaturePicture_V30_OutInfo.PictureFileName;
        end
        else
        begin
          Showmessage('����ͼƬʧ��');
        end;}
        RecordWeightPicture := '';
        EdtRecordWeight2.Text := format('%.3f',[RecordWeight2]);
      end
      else
      begin
        WeightSetCount := 0;
        Showmessage('��ѡ����ǡ��������ء�ģʽ���ð�ť��Ч');
      end;
    end
    else
    begin
      Showmessage('��ƽ̨ͨѶʧ�ܣ�����ϵά����Ա');
    end;
  end;

end;

procedure TFrmMain.BitBtn9Click(Sender: TObject);
begin
  if not FrmMesDataCrt then
  begin
    FrmMesData := TFrmMesData.Create(Nil);
    FrmMesDataCrt := True;
  end;
  FrmMesData.ShowModal;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
  CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo;
begin
  CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[1].UserID;
  CaturePicture_V30_Info.PictureId := 1;
  CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[1].lRealHandle;
  if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
  begin
    Showmessage('����' + CaturePicture_V30_OutInfo.PictureFileName + '�ɹ�');
  end;

  CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[2].UserID;
  CaturePicture_V30_Info.PictureId := 2;
  CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[2].lRealHandle;
  if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
  begin
    Showmessage('����' + CaturePicture_V30_OutInfo.PictureFileName + '�ɹ�');
  end;

  CaturePicture_V30_Info.UserID :=CameraLoginInfo_V30[3].UserID;
  CaturePicture_V30_Info.PictureId := 3;
  CaturePicture_V30_Info.lRealHandle := CameraLoginInfo_V30[3].lRealHandle;
  if CaturePicture_V30(CaturePicture_V30_Info, CaturePicture_V30_OutInfo ) then
  begin
    Showmessage('����' + CaturePicture_V30_OutInfo.PictureFileName + '�ɹ�');
  end;
end;

procedure TFrmMain.Button5Click(Sender: TObject);
begin
  if messagebox(FrmMain.Handle, '��ȷ��Ҫ���ó��ص����ش����ύ�����ķ�������', 'ѯ��', MB_ICONINFORMATION+MB_OkCancel)=idok then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight where id=:WeightNoteId';
    ADOQuery1.Parameters.ParamByName('WeightNoteId').Value := WeightingNote.Id;
    ADOQuery1.Open;
    if ADOQuery1.Eof then
    begin
      Showmessage('��Ч�ļ�¼');
      exit;
    end
    else
    begin
      if ADOQuery1.FieldByName('httpResult').AsInteger <> 0 then
      begin
        if MessageBox(FrmMain.Handle, '������¼���ϴ�����ȷ��Ҫ���¸ü�¼��','ѯ����Ϣ',MB_ICONINFORMATION+MB_OkCancel)=idok then
        begin
          //���¼�¼
          httpUploadWeightNoteUpdate(WeightingNote.Id, WeightingNote.BatchCount);
        end
        else
        begin
          ;
        end;
      end
      else
      begin
        httpUploadWeightNote(WeightingNote.Id, WeightingNote.BatchCount);
      end;
    end;
  end;
end;

procedure TFrmMain.BtnBoxClick(Sender: TObject);
var
  SelRow : Integer;
  HintStr : String;
begin
  SelRow := GrdWeightingLst.Row;
  if (SelRow>=1) and (SelRow < GrdWeightingLst.RowCount-1) then
  begin
    HintStr := '��ȷ��Ҫ���³������Ϊ:' + GrdWeightingLst.Cells[1, SelRow];
    if messagebox(FrmMain.Handle, pchar(HintStr),'ѯ����Ϣ',MB_ICONINFORMATION+MB_OkCancel)=idok then
    begin
      EdtBox11Number.Text := GrdWeightingLst.Cells[1, SelRow];
      //BitBtn2.Visible := False;
      WeightMode := 1;
      RadioButton3.Checked := True;
      RadioButton4.Checked := True;
    end;

  end;

end;

procedure TFrmMain.BtnWeightAgainClick(Sender: TObject);
begin
  if messagebox(FrmMain.Handle, '��ȷ��Ҫ������γ��أ����³�����', 'ѯ��', MB_ICONINFORMATION+MB_OkCancel)=idok then
  begin
    //WeightingNote.BatchCount := WeightingNote.BatchCount +1;

    try
      ADOConnection1.BeginTrans;

      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Text := 'update t_out_sourced_weight set BatchCount=BatchCount +1 where id=:Id';
      //ADOQuery1.Parameters.ParamByName('BatchCount').Value := WeightingNote.BatchCount;
      ADOQuery1.Parameters.ParamByName('Id'        ).Value := WeightingNote.Id;
      ADOQuery1.ExecSQL;

      ADOQuery1.Close;
      ADOQuery1.SQL.clear;
      ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight where id=:Id';
      ADOQuery1.Parameters.ParamByName('Id'        ).Value := WeightingNote.Id;
      ADOQuery1.open;
      if not ADOQuery1.Eof then
      begin
        WeightingNote.BatchCount := ADOQuery1.FieldByName('BatchCount').AsInteger;
      end
      else
      begin
        showmessage('��ȡ���ش���ʧ�ܣ����³���ʧ��');
        exit;
      end;

      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Text := 'insert into t_weight_count ('
                          + 'weightid'
                          + ',Batch'
                          + ',weightgross'
                          + ',weighttare'
                          + ',weightnet_plus'
                          + ',workpiecetotalnum'
                          + ',httpResult'
                          + ') values ('
                          + inttostr(WeightingNote.Id)
                          + ',' + inttostr(WeightingNote.BatchCount)
                          + ', 0'
                          + ', 0'
                          + ', 0'
                          + ', 0'
                          + ', 0'
                          +')';
      ADOQuery1.ExecSQL;



      ADOConnection1.CommitTrans;
      GrdWeightingLst.RowCount := 2;
      GrdWeightingLst.Rows[1].Clear;

      EdtWeightCount.text := inttostr(WeightingNote.BatchCount);
      EdtWeightCount.Items.Add(inttostr(WeightingNote.BatchCount));
      EdtGross.Text     := '0';
      EdtTotalTare.Text := '0';
      EdtTotaolNet.Text := '0';
      EdtSampCount.Text := '0';
    except
      ADOConnection1.RollbackTrans;
    end;
  end;
end;

function TFrmMain.CameraInitialization() : Boolean;
var
  InitSDK : Boolean;
  iLastErr : Dword;
  str : String;
begin
  InitSDK := NET_DVR_Init( );

  if not InitSDK then
  begin
    iLastErr := NET_DVR_GetLastError();
    str := 'NET_DVR_Init failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
    showmessage(str);
    Result := False;
    exit;
  end
  else
  begin
    Result := True;
  end;
end;

Function TFrmMain.CameraLogin_V30(
  CameraLogInfo : RdCameraLoginInfo;
  var CameraLoginInfo_V30 : RdCameraLoginInfo_V30;
  struPlayInfo : NET_DVR_CLIENTINFO
  ) : Boolean;
var
  PdeviceIP : PAnsiChar;
  devicePort : word;
  PuserName : PAnsiChar;
  PpassWord : PAnsiChar;

  iLastErr : integer;
  str : String;

  struDeviceInfo : NET_DVR_DEVICEINFO_V30;

begin
  //��¼�豸 Login the device
  PdeviceIP := PansiChar(PAnsiChar(AnsiString(CameraLogInfo.CameraIPAddress)));
  devicePort := CameraLogInfo.CameraPort;
  PuserName := Pansichar(PAnsiChar(AnsiString(CameraLogInfo.CameraUserName)));
  PpassWord := PansiChar(PAnsiChar(AnsiString(CameraLogInfo.CameraPassword)));

  CameraLoginInfo_V30.UserID := NET_DVR_Login_V30( PdeviceIP,
                                                   devicePort,
                                                   PuserName,
                                                   PpassWord,
                                                   @struDeviceInfo);
  if CameraLoginInfo_V30.UserID <0 then
  begin
    iLastErr := NET_DVR_GetLastError();
    str := 'Cramer' + inttostr(CameraLoginInfo_V30.CameraID) +' NET_DVR_Login_V30 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
    MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
    result := False;
    exit;
  end
  else
  begin

  end;

  if CameraLoginInfo_V30.UserID >= 0 then
  begin

  //  //��ʼԤ��
    CameraLoginInfo_V30.lRealHandle := NET_DVR_RealPlay_V30( CameraLoginInfo_V30.UserID,
                                         @struPlayInfo,
                                         nil,
                                         CameraLoginInfo_V30.pUser,
                                         TRUE);
  //  //���ûص��������ڻص��������
  //  //lRealHandle := NET_DVR_RealPlay_V30(lUserID, @struPlayInfo, @testRealDataCallBack_V30,  pUser, TRUE);
  //
    if CameraLoginInfo_V30.lRealHandle>=0 then
    begin
        Result := True;
    end
    else
    begin
      iLastErr := NET_DVR_GetLastError();
      str := 'Cramer' + inttostr(CameraLoginInfo_V30.CameraId) + ' NET_DVR_RealPlay_V40 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
      showmessage(str);
      Result := False;
    end;
  end;
end;

Function TFrmMain.CaturePicture_V30(CaturePicture_V30_Info : RdCaturePicture_V30_Info;
  Var CaturePicture_V30_OutInfo : RdCaturePicture_V30_OutInfo ) : Boolean;
var
  FileName : String;
  sPicFileName : PansiChar;
  iLastErr : Dword;
  str : String;
  Re : Boolean;
begin
    if CaturePicture_V30_Info.UserId >=0 then
    begin
      FileName := FormatDateTime('yyyymmddhhnnss', now);
      FileName := fileName + '_'+ inttostr(CaturePicture_V30_Info.PictureId)+'.jpg';
      sPicFileName := PAnsichar(AnsiString(SavePicturePath) + AnsiString(FileName)) ;

      //SavePicturePash1 := '' ;
      //strJpeg.wPicSize := 4;
      //strJpeg.wPicQuality :=0;

      Re := NET_DVR_SetCapturePictureMode( 1 );
      if Re then
      begin
            //Showmessage('Camera1 Sucess');
            //SavePicturePash1 := FileName  ;
        Re := NET_DVR_CapturePicture(CaturePicture_V30_Info.lRealHandle, sPicFileName);
        if Re then
        begin
          //Showmessage('Camera1 Sucess');
          //SavePicturePash1 := FileName1  ;
          Panel7.Visible := True;
          WaitTime := 0;
          Timer2.Enabled := True;
          while (not fileexists(PictureExistPath + FileName) )do
          begin
            if WaitTime >= 10 then
            begin
              Showmessage(FileName + 'ͼƬ�洢ʧ��!');
              Timer2.Enabled := False;
              Result := False;
              Panel7.Visible := False;
              exit;
            end;
            Application.ProcessMessages;
            Panel7.Caption := Inttostr( WaitTime );
          end;
          Timer2.Enabled := False;
          Panel7.Visible := False;
          CaturePicture_V30_OutInfo.PictureFileName := FileName;
          Result := True;
        end
        else
        begin
          Showmessage('Camera1 Failure');
          iLastErr := NET_DVR_GetLastError();
          str := 'Cramer1 NET_DVR_CaptureJPEGPicture failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
          showmessage(str);
          Result := False;
        end;
      end
      else
      begin
        Showmessage('Camera1 Failure');
        iLastErr := NET_DVR_GetLastError();
        str := 'Cramer1 NET_DVR_SetCapturePictureMode failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
        showmessage(str);
        Result := False;
      end;


    end;

end;

procedure TFrmMain.Edit11KeyPress(Sender: TObject; var Key: Char);
var
  InputGross : Double;
begin
  if key=#13 then
  begin
    try
      InputGross := strtofloat(Edit11.Text);
    except
      showmessage('��������ȷ������');
      exit;
    end;
    Panel2.Visible := False;
    WeightingNote.RecordWeightGross := RecordWeight2;
    WeightManageHandle(WeightingNote, InputGross, 1, 2);
    EtBoxTare21.Text := '0';
    EtBoxTare22.text := '0';
  end;
end;

procedure TFrmMain.Edit8KeyPress(Sender: TObject; var Key: Char);
var
  InputGross : Double;
begin
  if key=#13 then
  begin
    try
      InputGross := strtofloat(Edit8.Text);
    except
      showmessage('��������ȷ������');
      exit;
    end;
    Panel1.Visible := False;
    WeightingNote.RecordWeightGross := RecordWeight1;
    WeightManageHandle(WeightingNote, InputGross, 1, 1);
    EtBoxTare11.Text := '0';
    EtBoxTare12.text := '0';
  end;
end;

procedure TFrmMain.EdtBox11NumberClick(Sender: TObject);
begin
  TouchKeyboard1.Left := 175;
  TouchKeyboard1.Top  := 158;
  TouchKeyboard1.Visible := True;
end;

procedure TFrmMain.EdtBox11NumberKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := False;
  end;
end;

procedure TFrmMain.EdtBox12NumberClick(Sender: TObject);
begin
  TouchKeyboard1.Left := 553;
  TouchKeyboard1.Top  := 162;
  TouchKeyboard1.Visible := True;
end;

procedure TFrmMain.EdtBox12NumberKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := False;
  end;
end;

procedure TFrmMain.EdtRecordWeight1DblClick(Sender: TObject);
begin
  if InputWeightEnable then
  begin
    TouchKeyboard1.Layout := 'NumPad';
    TouchKeyboard1.Left   := 381;
    TouchKeyboard1.Top    := 334;
    TouchKeyboard1.Width  := 360;
    TouchKeyboard1.Height := 323;
    TouchKeyboard1.Visible:= true;
  end;
end;

procedure TFrmMain.EdtRecordWeight1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := false;
  end;
end;

procedure TFrmMain.EdtRecordWeight2DblClick(Sender: TObject);
begin
  if InputWeightEnable then
  begin
    TouchKeyboard1.Layout := 'NumPad';
    TouchKeyboard1.Left   := 439;
    TouchKeyboard1.Top    := 367;
    TouchKeyboard1.Width  := 360;
    TouchKeyboard1.Height := 323;
    TouchKeyboard1.Visible:= true;
  end;
end;

procedure TFrmMain.EdtRecordWeight2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    TouchKeyboard1.Visible:= false;
  end;
end;

procedure TFrmMain.EdtSamplePieceCount1Click(Sender: TObject);
begin
  EdtSamplePieceCount1.SelectAll;
  TouchKeyboard1.Visible := True;
  TouchKeyboard1.Left    := 191;
  TouchKeyboard1.Top     := 352;
end;

procedure TFrmMain.EdtSamplePieceCount1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8, #13]) then key := #0;
  if Key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    GroupBox8.SetFocus;
  end;
end;

procedure TFrmMain.EdtSamplePieceCount2Click(Sender: TObject);
begin
  TouchKeyboard1.Left := 219;
  TouchKeyboard1.Top  := 300;
  TouchKeyboard1.Visible := True;
  EdtSamplePieceCount2.SelectAll;
end;

procedure TFrmMain.EdtSamplePieceTotalWeight1DblClick(Sender: TObject);
begin
  if InputSampleWeightEnable then
  begin
    TouchKeyboard1.Layout := 'NumPad';
    TouchKeyboard1.Left   := 389;
    TouchKeyboard1.Top    := 358;
    TouchKeyboard1.Width  := 360;
    TouchKeyboard1.Height := 323;
    TouchKeyboard1.Visible:= true;
  end;
end;

procedure TFrmMain.EdtSamplePieceTotalWeight1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    TouchKeyboard1.Visible:= false;
  end;
end;

procedure TFrmMain.EdtSamplePieceTotalWeight2DblClick(Sender: TObject);
begin
  if InputSampleWeightEnable then
  begin
    TouchKeyboard1.Layout := 'NumPad';
    TouchKeyboard1.Left   := 398;
    TouchKeyboard1.Top    := 372;
    TouchKeyboard1.Width  := 360;
    TouchKeyboard1.Height := 323;
    TouchKeyboard1.Visible := true;
  end;
end;

procedure TFrmMain.EdtSamplePieceTotalWeight2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := false;
  end;
end;

procedure TFrmMain.EdtWeightCountChange(Sender: TObject);
var
  WeightCount : Integer;
  Row : Integer;
begin
  try
    WeightCount := StrToInt(EdtWeightCount.Text);
  except
    Showmessage('����ȷѡ����ش���');
    WeightCount := 0;
    exit;
  end;

  if WeightCount >0 then
  begin
    WeightingNote.BatchCount := WeightCount;

    GrdWeightingLst.RowCount := 2;
    GrdWeightingLst.Rows[1].Clear;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:WeightNoteID and weightbatchs=:weightbatchs';
    ADOQuery1.SQL.Text := ADOQuery1.SQL.Text + ' order by Id';
    ADOQuery1.Parameters.ParamByName( 'WeightNoteID').Value := WeightingNote.Id;
    ADOQuery1.Parameters.ParamByName( 'weightbatchs').Value := WeightingNote.BatchCount;
    ADOQuery1.Open;
    ADOQuery1.First;
    if not ADOQuery1.Eof then
    begin
      GrdWeightingLst.RowCount := ADOQuery1.RecordCount + 2;
      Row := 1;
      while not ADOQuery1.Eof do
      begin
        GrdWeightingLst.Rows[row].Clear;
        GrdWeightingLst.Cells[1, Row] := ADOQuery1.FieldByName('print_code').AsString;
        GrdWeightingLst.Cells[2, Row] := format('%.3f',[ADOQuery1.FieldByName('Box1TareWeight').AsFloat]);
        GrdWeightingLst.Cells[3, Row] := format('%.3f',[ADOQuery1.FieldByName('Box2TareWeight').AsFloat]);
        GrdWeightingLst.Cells[4, Row] := format('%.3f',[ADOQuery1.FieldByName('weightgross1').AsFloat]);
        GrdWeightingLst.Cells[5, Row] := format('%.3f',[ADOQuery1.FieldByName('weightgross2').AsFloat]);
        GrdWeightingLst.Cells[6, Row] := format('%.3f',[ADOQuery1.FieldByName('weightGross').AsFloat]);
        GrdWeightingLst.Cells[7, Row] := format('%.3f',[ADOQuery1.FieldByName('weightnet').AsFloat]);
        GrdWeightingLst.Cells[8, Row] := inttostr(ADOQuery1.FieldByName('workpiecenumber').AsInteger );
        GrdWeightingLst.Cells[11, Row] := inttostr(ADOQuery1.FieldByName('workbox_num').AsInteger );
        ADOQuery1.Next;
        Row := Row +1;
      end;
      GrdWeightingLst.Rows[Row].Clear;
    end;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select * from t_weight_count where weightid=:weightid and Batch=:Batch';
    ADOQuery1.Parameters.ParamByName('weightid').Value := WeightingNote.Id;
    ADOQuery1.Parameters.ParamByName('Batch'   ).Value := WeightingNote.BatchCount;
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
      EdtGross.Text     := Format('%.3f', [ ADOQuery1.FieldByName('weightgross').AsFloat ]);
      EdtTotalTare.Text := Format( '%.3f', [ADOQuery1.FieldByName('weighttare').AsFloat]);
      EdtTotaolNet.Text := format('%.3f', [ADOQuery1.FieldByName('weightnet_plus').AsFloat]);
      EdtSampCount.Text := inttostr( ADOQuery1.FieldByName('workpiecetotalnum').AsInteger);
    end;
  end;
end;

procedure TFrmMain.EdtWeightCountKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#8] then Key := #0;
end;

procedure TFrmMain.Edt_exec_qrcodeClick(Sender: TObject);
begin
  Edt_exec_qrcode.text := '';
end;

procedure TFrmMain.Edt_exec_qrcodeDblClick(Sender: TObject);
begin
  TouchKeyboard1.Layout := 'NumPad';
  TouchKeyboard1.Left   := 324;
  TouchKeyboard1.Top    := 80;
  TouchKeyboard1.Width  := 360;
  TouchKeyboard1.Height := 323;
  TouchKeyboard1.Visible:= true;
end;

procedure TFrmMain.Edt_exec_qrcodeKeyPress(Sender: TObject; var Key: Char);
var
  exec_qrcode : String;
  UpdateValue : RdWeightNote;
  Bill_no : String;
  workpiece : string;
  i : Integer;
  tempcharArray : Array of Char;
  signalCount,
  signalPosition : integer;
  resu : Boolean;
  Row : Integer;
  BillNoExist : Boolean;
  RecordId : Integer;
  RandomData1 : Integer;
  SaomiaoBoxNumber,
  Saomiao_exec_qrcode : String;
begin

  if key = #13 then
  begin
    TouchKeyboard1.Visible := False;
    exec_qrcode := trim(Edt_exec_qrcode.Text);

    setlength(tempcharArray, length(exec_qrcode));
    for i := 1 to length(exec_qrcode) do
    begin
      tempcharArray[i-1] := exec_qrcode[i];
    end;

    resu := False;
    signalCount := 0;
    for i:=Low(tempcharArray) to High(tempcharArray) do
    begin
      if tempcharArray[i] in ['/'] then
      begin
        signalCount := signalCount +1;
        signalPosition := i;
      end;
      if not (tempcharArray[i] in ['0'..'9','/']) then
        resu := True;
    end;

    if resu or ( signalCount >1 ) then
    begin
      ClearExecQrcodeInfo();
      showmessage('��Ч��ִ�мƻ��ź����');
      exit;
    end;

    if (signalCount >0) then
    begin
      SaomiaoBoxNumber    := copy(exec_qrcode,signalPosition +2,length(exec_qrcode)-signalPosition -1);
      Saomiao_exec_qrcode := copy(exec_qrcode,0,signalPosition );
    end
    else
    begin
      SaomiaoBoxNumber    := '';
      Saomiao_exec_qrcode := exec_qrcode ;
     end;

    if Saomiao_exec_qrcode <> '' then
    begin
      exec_qrcode := Saomiao_exec_qrcode;
      Edt_exec_qrcode.text := exec_qrcode;
    end
    else
    begin
      ClearExecQrcodeInfo();
      showmessage('��Ч��ִ�б��');
      exit;
    end;

    if WeightingNote.Id <= 0 then    //��һ��ɨ��
    begin
      EdtBox11Number.Text := '';
      EdtBox12Number.Text := '';
    end;

    if WeightingNote.exec_qrcode <> Saomiao_exec_qrcode then
    begin
      if WeightingNote.Id > 0 then
      begin
        if messagebox(FrmMain.Handle, '��ɨ���ִ�к���һ���µ�ִ�кţ�����ǰɨ�����Ϣ����', '��ʾ��Ϣ', MB_OK) = idOk then
        begin
          WeightMode:=0;
        end;
      end;

        //��ȡ��ִ�мƻ��ŵĹ���
      getexec_artlist(exec_qrcode, UpdateValue);
        //Get http://tymes.hd:8080/api/getexec_artlist/15227193961792

      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
        //ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight where exec_qrcode=' + '''' + Saomiao_exec_qrcode + ''''
        //                    + ' and bill_no=' + ''''' and httpResult=0';  //
      ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight where exec_qrcode=' + '''' + Saomiao_exec_qrcode + ''''
                            + ' and httpResult=0';
                            //+ ' and bill_no=' + ''''' and httpResult=0';  //
      ADOQuery1.Open;
      if ADOQuery1.Eof then
      begin //}
        {���µ�ִ�мƻ���}
        EdtBox11Number.Text := '';
        EdtBox12Number.Text := '';
        EdtBox11Number.Text := SaomiaoBoxNumber;

        UpdateValue.exec_qrcode := exec_qrcode;

        //if post_exec_qrcode(UpdateValue.exec_qrcode, UpdateValue. UpdateValue) then
        //begin
          UpdateValue.modeman  := LoginNm;
          UpdateValue.modedate := DateTimeToUnix(Now()) -8*60*60;
        //end
        //else
        //begin
        //  showmessage('��ȡִ�мƻ���Ϣʧ�ܣ�������ɨ���ȡ');
        //  exit;
        //end;

        if InsertNewWeightNote( UpdateValue, WeightingNote ) then
        begin
          QueryWeightNoteDisp(WeightingNote);
          GrdWeightingLst.RowCount := 2;
          GrdWeightingLst.Rows[1].Clear;
        end
        else
        begin
          Showmessage('���ӱ������ݿ�ʧ��');
        end;

        WeightingNote.samp_piece_weight := 0;    //������������
        WeightingNote.samp_piecce_count := 0;    //������������
        WeightingNote.unit_samp_weight  := 0;    //����������������

        WeightDetailList.Clear;             //������ϸ��¼�б�
      end
      else
      begin  //}
        {�����µ�ִ�мƻ���}
        EdtBox11Number.Text := '';
        EdtBox12Number.Text := '';
        EdtBox11Number.Text := SaomiaoBoxNumber;

        RecordId := ADOQuery1.FieldByName('ID').AsInteger;
        if RecordId > 0 then
        begin
          if ADOQuery1.FieldByName('httpResult').AsInteger >0 then
          begin
            if messagebox(FrmMain.Handle, '��ִ�е����Ѵ��ڣ������ϴ���MES���������ٳ��أ��������ύ�ó��ص�', '��Ҫ��ʾ',MB_OK) = idOK then
            begin
              ;
            end;
          end;
          WeightingNote.Id := ADOQuery1.FieldByName('id').AsInteger;
          WeightingNote.bill_no := ADOQuery1.FieldByName('bill_no').AsString;
          WeightingNote.exec_qrcode := ADOQuery1.FieldByName('exec_qrcode').AsString;
          WeightingNote.out_sourced_name := ADOQuery1.FieldByName('out_sourced_name').AsString;
          WeightingNote.workpiece := ADOQuery1.FieldByName('workpiece').AsString;
          WeightingNote.Unit_samp_set_weight := ADOQuery1.FieldByName('Unit_samp_set_weight').AsFloat;
          WeightingNote.samp_piecce_count := ADOQuery1.FieldByName('samp_piecce_count').AsInteger;    //������������
          WeightingNote.samp_piece_weight := ADOQuery1.FieldByName('samp_piece_weight').AsFloat;      //������������
          WeightingNote.unit_samp_weight  := ADOQuery1.FieldByName('unit_samp_weight').AsFloat;       //����������������
          WeightingNote.sample_weight_from:= ADOQuery1.FieldByName('sample_weight_from').AsInteger;
          WeightingNote.samp_picture      := ADOQuery1.FieldByName('samp_picture').AsString;
          WeightingNote.BatchCount        := ADOQuery1.FieldByName('BatchCount').AsInteger;
          WeightingNote.httpResult        := ADOQuery1.FieldByName('httpResult').AsInteger;
          WeightingNote.modeman           := ADOQuery1.FieldByName('modeman').AsString;
          WeightingNote.modedate          := ADOQuery1.FieldByName('modedate').AsInteger;
          for i:=low(exec_art_array) to high(exec_art_array) do
          begin
            if ADOQuery1.FieldByName('exec_det_id').AsInteger = exec_art_array[i].id then
            begin
              exec_artlist.Text := exec_art_array[i].work_name;
              break;
            end;
          end;
          WeightingNote.RecordWeightGross := 0.0;
          ADOQuery2.Close;
          ADOQuery2.SQL.Clear;
          ADOQuery2.SQL.Text := 'select * from t_weight_count where weightid=:ADOQuery2 and Batch=:Batch';
          ADOQuery2.Parameters.ParamByName('ADOQuery2').Value := WeightingNote.Id;
          ADOQuery2.Parameters.ParamByName('Batch').Value     := WeightingNote.BatchCount;
          ADOQuery2.Open;
          if not ADOQuery2.Eof then
          begin
            WeightingNote.weightgross       := ADOQuery2.FieldByName('weightgross').AsFloat;
            WeightingNote.weighttare        := ADOQuery2.FieldByName('weighttare').AsFloat;
            WeightingNote.weightnet         := ADOQuery2.FieldByName('weightnet_plus').AsFloat;
            WeightingNote.workpiececount    := ADOQuery2.FieldByName('workpiecetotalnum').asinteger;
          end
          else
          begin
          //  showmessage('���ش�����ϸ����ʧ��');
          //  exit;
          end;
          DisplayWeightNote( WeightingNote );

          GrdWeightingLst.RowCount := 2;
          GrdWeightingLst.Rows[1].Clear;
          ADOQuery2.Close;
          ADOQuery2.SQL.Clear;
          ADOQuery2.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:WeightNoteID and weightbatchs=:weightboxcount';
          ADOQuery1.SQL.Text := ADOQuery1.SQL.Text + ' order by Id';
          ADOQuery2.Parameters.ParamByName('WeightNoteID').Value   := WeightingNote.Id;
          ADOQuery2.Parameters.ParamByName('weightboxcount').Value := WeightingNote.BatchCount;
          ADOQuery2.Open;
          WeightDetailList.Clear;
          if not ADOQuery2.Eof then
          begin
            GrdWeightingLst.RowCount := ADOQuery2.RecordCount +2;
            Row := 1;
            ADOQuery2.First;
            while not ADOQuery2.Eof do
            begin
              GrdWeightingLst.Rows[row].Clear;
              GrdWeightingLst.Cells[1, Row] := ADOQuery2.FieldByName('print_code').AsString;
              GrdWeightingLst.Cells[2, Row] := format('%.3f',[ADOQuery2.FieldByName('Box1TareWeight').AsFloat]);
              GrdWeightingLst.Cells[3, Row] := format('%.3f',[ADOQuery2.FieldByName('Box2TareWeight').AsFloat]);
              GrdWeightingLst.Cells[4, Row] := format('%.3f',[ADOQuery2.FieldByName('weightgross1').AsFloat]);
              GrdWeightingLst.Cells[5, Row] := format('%.3f',[ADOQuery2.FieldByName('weightgross2').AsFloat]);
              GrdWeightingLst.Cells[6, Row] := format('%.3f',[ADOQuery2.FieldByName('weightGross').AsFloat]);
              GrdWeightingLst.Cells[7, Row] := format('%.3f',[ADOQuery2.FieldByName('weightnet').AsFloat]);
              GrdWeightingLst.Cells[8, Row] := inttostr(ADOQuery2.FieldByName('workpiecenumber').AsInteger );
              GrdWeightingLst.Cells[11, Row] := inttostr(ADOQuery2.FieldByName('workbox_num').AsInteger );
              WeightDetailList.Add(ADOQuery2.FieldByName('id').AsString);
              ADOQuery2.Next;
              Row := Row +1;
            end;
            GrdWeightingLst.Rows[row].Clear;
          end
          else
          begin
            //showmessage()
          end;
        end
        else
        begin
          showmessage('��Ч�ĳ��ص���!');
        end;
      end;//}
    end
    else
    begin
      if SaomiaoBoxNumber <> '' then
      begin
        if (SaomiaoBoxNumber=EdtBox11Number.Text) or (SaomiaoBoxNumber=EdtBox12Number.Text) then
        begin
          showmessage('����������б��У��ô�ɨ����Ч');
          exit;
        end;
        if EdtBox11Number.Text = '' then
        begin
          EdtBox11Number.Text := SaomiaoBoxNumber;
        end
        else if EdtBox12Number.Text = '' then
        begin
          EdtBox12Number.Text := SaomiaoBoxNumber;
        end
        else
        begin
          showmessage('�Ѿ�������������,����ɨ����Ч');
        end;
      end;

      if WeightMode=0 then
      begin
        //��ȡ��ִ�мƻ��ŵĹ���
        getexec_artlist(exec_qrcode, UpdateValue);

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select * from t_out_sourced_weight where exec_qrcode=' + '''' + Saomiao_exec_qrcode + ''''
                          + ' and httpResult=0';
        ADOQuery1.Open;
        if ADOQuery1.Eof then
        begin
          {��ִ�мƻ������ύ}
          UpdateValue.exec_qrcode := Saomiao_exec_qrcode;

          //if Post_exec_qrcode(UpdateValue.exec_qrcode, UpdateValue) then
          //begin
          //  UpdateValue.modeman  := LoginNm;
          //  UpdateValue.modedate := DateTimeToUnix(Now()) -8*60*60;
          //end
          //else
          //begin
          //  showmessage('��ȡִ�мƻ���Ϣʧ�ܣ�������ɨ���ȡ');
          //  exit;
          //end;

          if InsertNewWeightNote( UpdateValue, WeightingNote ) then
          begin
            QueryWeightNoteDisp(WeightingNote);
            GrdWeightingLst.RowCount := 2;
            GrdWeightingLst.Rows[1].Clear;
          end
          else
          begin
            Showmessage('���ӱ������ݿ�ʧ��');
          end;

          WeightingNote.samp_piecce_count := 0;    //������������
          WeightingNote.samp_piece_weight := 0;    //������������
          WeightingNote.unit_samp_weight  := 0;    //����������������

          WeightDetailList.Clear;
        end
        else
        begin
          {��ִ�мƻ�����δ�ϴ�}
          RecordId := ADOQuery1.FieldByName('ID').AsInteger;
          if RecordId > 0 then
          begin
            WeightingNote.Id := ADOQuery1.FieldByName('id').AsInteger;
            WeightingNote.bill_no := ADOQuery1.FieldByName('bill_no').AsString;
            WeightingNote.exec_qrcode := ADOQuery1.FieldByName('exec_qrcode').AsString;
            WeightingNote.out_sourced_name := ADOQuery1.FieldByName('out_sourced_name').AsString;
            WeightingNote.workpiece := ADOQuery1.FieldByName('workpiece').AsString;
            WeightingNote.Unit_samp_set_weight := ADOQuery1.FieldByName('Unit_samp_set_weight').AsFloat;
            WeightingNote.samp_piecce_count := ADOQuery1.FieldByName('samp_piecce_count').AsInteger;    //������������
            WeightingNote.samp_piece_weight := ADOQuery1.FieldByName('samp_piece_weight').AsFloat;      //������������
            WeightingNote.unit_samp_weight  := ADOQuery1.FieldByName('unit_samp_weight').AsFloat;       //����������������
            WeightingNote.unit_samp_weight  := ADOQuery1.FieldByName('sample_weight_from').AsInteger;//������Դ
            WeightingNote.samp_picture      := ADOQuery1.FieldByName('samp_picture').AsString;
            WeightingNote.BatchCount        := ADOQuery1.FieldByName('BatchCount').AsInteger;
            WeightingNote.httpResult        := ADOQuery1.FieldByName('httpResult').AsInteger;
            WeightingNote.modeman           := ADOQuery1.FieldByName('modeman').AsString;
            WeightingNote.modedate          := ADOQuery1.FieldByName('modedate').AsInteger;
            for i:=low(exec_art_array) to high(exec_art_array) do
            begin
              if ADOQuery1.FieldByName('exec_det_id').AsInteger = exec_art_array[i].id then
              begin
                exec_artlist.Text := exec_art_array[i].work_name;
                break;
              end;
            end;
            WeightingNote.RecordWeightGross := 0.0;
            ADOQuery2.Close;
            ADOQuery2.SQL.Clear;
            ADOQuery2.SQL.Text := 'select * from t_weight_count where weightid=:ADOQuery2 and Batch=:Batch';
            ADOQuery2.Parameters.ParamByName('ADOQuery2').Value := WeightingNote.Id;
            ADOQuery2.Parameters.ParamByName('Batch').Value     := WeightingNote.BatchCount;
            ADOQuery2.Open;
            if not ADOQuery2.Eof then
            begin
              WeightingNote.weightgross       := ADOQuery2.FieldByName('weightgross').AsFloat;
              WeightingNote.weighttare        := ADOQuery2.FieldByName('weighttare').AsFloat;
              WeightingNote.weightnet         := ADOQuery2.FieldByName('weightnet_plus').AsFloat;
              WeightingNote.workpiececount    := ADOQuery2.FieldByName('workpiecetotalnum').asinteger;
            end
            else
            begin
            //  showmessage('���ش�����ϸ����ʧ��');
            //  exit;
            end;
            DisplayWeightNote( WeightingNote );

            GrdWeightingLst.RowCount := 2;
            GrdWeightingLst.Rows[1].Clear;
            ADOQuery2.Close;
            ADOQuery2.SQL.Clear;
            ADOQuery2.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:WeightNoteID and weightbatchs=:weightboxcount';
            ADOQuery1.SQL.Text := ADOQuery1.SQL.Text + ' order by Id';
            ADOQuery2.Parameters.ParamByName('WeightNoteID').Value   := WeightingNote.Id;
            ADOQuery2.Parameters.ParamByName('weightboxcount').Value := WeightingNote.BatchCount;
            ADOQuery2.Open;
            WeightDetailList.Clear;
            if not ADOQuery2.Eof then
            begin
              GrdWeightingLst.RowCount := ADOQuery2.RecordCount +2;
              Row := 1;
              ADOQuery2.First;
              while not ADOQuery2.Eof do
              begin
                GrdWeightingLst.Rows[row].Clear;
                GrdWeightingLst.Cells[1, Row] := ADOQuery2.FieldByName('print_code').AsString;
                GrdWeightingLst.Cells[2, Row] := format('%.3f',[ADOQuery2.FieldByName('Box1TareWeight').AsFloat]);
                GrdWeightingLst.Cells[3, Row] := format('%.3f',[ADOQuery2.FieldByName('Box2TareWeight').AsFloat]);
                GrdWeightingLst.Cells[4, Row] := format('%.3f',[ADOQuery2.FieldByName('weightgross1').AsFloat]);
                GrdWeightingLst.Cells[5, Row] := format('%.3f',[ADOQuery2.FieldByName('weightgross2').AsFloat]);
                GrdWeightingLst.Cells[6, Row] := format('%.3f',[ADOQuery2.FieldByName('weightGross').AsFloat]);
                GrdWeightingLst.Cells[7, Row] := format('%.3f',[ADOQuery2.FieldByName('weightnet').AsFloat]);
                GrdWeightingLst.Cells[8, Row] := inttostr(ADOQuery2.FieldByName('workpiecenumber').AsInteger );
                GrdWeightingLst.Cells[11, Row] := inttostr(ADOQuery2.FieldByName('workbox_num').AsInteger );
                WeightDetailList.Add(ADOQuery2.FieldByName('id').AsString);
                ADOQuery2.Next;
                Row := Row +1;
              end;
              GrdWeightingLst.Rows[row].Clear;
            end;
          end;
        end;
      end
      else if WeightMode=10 then
      begin
        //showmessage('OK');
      end
      else
      begin
        Showmessage('��Ч�ĳ��ط�ʽ');
      end;
    end;
    Edt_exec_qrcode.SetFocus;
    Edt_exec_qrcode.SelectAll;

    if (Edt_exec_qrcode.Text <> '') and (EdtBox11Number.Text <> '') then
    begin
      if RecordExsit( WeightingNote.exec_qrcode, strtoint(EdtBox11Number.Text) ) then
      begin
        Showmessage('��ִͬ�мƻ��ź�������ڼ�¼�д��ڣ������ѡ�����³���');
        Edt_exec_qrcode.Text := '';
        EdtBox11Number.Text  := '';
        EdtBox12Number.Text  := '';
      end;
    end;
    if (Edt_exec_qrcode.Text <> '') and (EdtBox12Number.Text <> '') then
    begin
      if RecordExsit( WeightingNote.exec_qrcode, strtoint(EdtBox12Number.Text) ) then
      begin
        Showmessage('��ִͬ�мƻ��ź�������ڼ�¼�д��ڣ������ѡ�����³���');
        Edt_exec_qrcode.Text := '';
        EdtBox11Number.Text  := '';
        EdtBox12Number.Text  := '';
      end;
    end;

    Et_workbox_num11.Text := '0';
    Et_workbox_num12.Text := '0';
    Et_workbox_num21.Text := '0';
    Et_workbox_num22.Text := '0';
    box1Print_code := '';
    box2Print_code := '';
  end;
end;

procedure TFrmMain.ClearExecQrcodeInfo();
begin
  WeightingNote.Id := 0;
  EdtWeightNote.Text := '';
  Edt_out_resourced_name.Text := '';
  Edtworkpiece.Text := '';
  EdtSampWeight.Text := '';
  EdtSampCount.Text := '';
  EdtWeightCount.Text := '';
  EdtGross.Text := '';
  EdtTotalTare.Text := '';
  EdtTotaolNet.Text := '';
  EdtBox11Number.Text := '';
  EdtBox12Number.Text := '';
end;

procedure TFrmMain.EtBoxTare11Click(Sender: TObject);
begin
  EtBoxTare11.SelectAll;
  TouchKeyboard1.Visible := True;
  TouchKeyboard1.Top  := 310;
  TouchKeyboard1.Left := 192;
end;

procedure TFrmMain.EtBoxTare11KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    GroupBox6.SetFocus;
  end;
end;

procedure TFrmMain.EtBoxTare12Click(Sender: TObject);
begin
  EtBoxTare12.SelectAll;
  TouchKeyboard1.Visible := True;
  TouchKeyboard1.Top  := 320;
  TouchKeyboard1.Left := 401;
end;

procedure TFrmMain.EtBoxTare12KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    TouchKeyboard1.Visible := false;
    GroupBox6.SetFocus;
  end;
end;

procedure TFrmMain.EtBoxTare21Click(Sender: TObject);
begin
  TouchKeyboard1.Left    := 219;
  TouchKeyboard1.Top     := 290;
  TouchKeyboard1.Visible := true;
  EtBoxTare21.SelectAll;
end;

procedure TFrmMain.EtBoxTare21KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    GroupBox14.SetFocus;
  end;
end;

procedure TFrmMain.EtBoxTare22Click(Sender: TObject);
begin
  TouchKeyboard1.Left    := 367;
  TouchKeyboard1.Top     := 290;
  TouchKeyboard1.Visible := true;
  EtBoxTare22.SelectAll;
end;

procedure TFrmMain.EtBoxTare22KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    GroupBox14.SetFocus;
  end;
end;

procedure TFrmMain.Et_workbox_num11Click(Sender: TObject);
begin
  TouchKeyboard1.Top := 282;
  TouchKeyboard1.Left := 288;
  TouchKeyboard1.Visible := true;
end;

procedure TFrmMain.Et_workbox_num11KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    AuditNumber(1,1);
    DispWeightBatchInfo(WeightingNote.Id, WeightingNote.BatchCount);
    DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount);
  end;
end;

procedure TFrmMain.Et_workbox_num12Click(Sender: TObject);
begin
  TouchKeyboard1.Top := 92;
  TouchKeyboard1.Left := 639;
  TouchKeyboard1.Visible := True;
end;

procedure TFrmMain.Et_workbox_num12KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    AuditNumber(1,2);
    DispWeightBatchInfo(WeightingNote.Id, WeightingNote.BatchCount);
    DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount);
  end;
end;

procedure TFrmMain.Et_workbox_num21Click(Sender: TObject);
begin
  TouchKeyboard1.Top := 300;
  TouchKeyboard1.Left := 423;
  TouchKeyboard1.Visible := True;
end;

procedure TFrmMain.Et_workbox_num21KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    AuditNumber(2,1);
    DispWeightBatchInfo(WeightingNote.Id, WeightingNote.BatchCount);
    DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount);
  end;
end;

procedure TFrmMain.Et_workbox_num22Click(Sender: TObject);
begin
  TouchKeyboard1.Top := 282;
  TouchKeyboard1.Left := 639;
  TouchKeyboard1.Visible := True;
end;

procedure TFrmMain.Et_workbox_num22KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    TouchKeyboard1.Visible := False;
    AuditNumber(2,2);
    DispWeightBatchInfo(WeightingNote.Id, WeightingNote.BatchCount);
    DispWeightDetails(WeightingNote.Id, WeightingNote.BatchCount);
  end;
end;

procedure TFrmMain.exec_artlistChange(Sender: TObject);
var
  i : integer;
  ExResult : Boolean;
begin
  if (exec_artlist.Text <> '') and (WeightingNote.Id >0) then
  begin
    for i := Low(exec_art_array) to High(exec_art_array) do
    begin
      if exec_art_array[i].work_name = exec_artlist.Text then
      begin
        ExResult := True;
        break;
      end;
    end;
    if EXResult then
    begin
      try
        ADOConnection1.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'update t_out_sourced_weight set exec_det_id=:Newexec_det_id,exec_det=:Newexec_det where id=:NewId';
        ADOQuery1.Parameters.ParamByName('Newexec_det_id').Value := exec_art_array[i].id;
        ADOQuery1.Parameters.ParamByName('Newexec_det').Value := exec_artlist.Text;
        ADOQuery1.Parameters.ParamByName('NewId').Value          := WeightingNote.Id;
        ADOQuery1.ExecSQL;
        ADOConnection1.CommitTrans;
      except
        ADOConnection1.RollbackTrans;
        Showmessage('���¹���ʧ��');
      end;
    end
    else
    begin
      Showmessage('��ѡ��Ĺ�����Ч');
    end;
  end;
end;

function TFrmMain.InsertNewWeightNote(UpdateValue : RdWeightNote; var WeightingNote : RdWeightNote) : Boolean;
var
  Qry,
  Qry1 : TADOQuery;
begin
  Qry := TADOQuery.Create(Nil);
  Qry1 := TADOQuery.Create(Nil);
  qry.Connection := FrmMain.ADOConnection1;
  Qry1.Connection := FrmMain.ADOConnection1;

  try
    FrmMain.ADOConnection1.BeginTrans;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'insert into t_out_sourced_weight (bill_no'
                  + ', exec_qrcode'
                  + ', out_sourced_name'
                  + ', workpiece'
                  + ', BatchCount'
                  + ', Unit_samp_set_weight'
                  + ', samp_piecce_count'
                  + ', samp_piece_weight'
                  + ', unit_samp_weight'
                  + ', weightgross'
                  + ', weighttare'
                  + ', weightnet_plus'
                  + ', httpResult'
                  + ', modeman'
                  + ', modedate'
                  + ', sample_weight_from'
                  + ') values ('
                  + '''' + UpdateValue.bill_no + ''''
                  + ', ''' + UpdateValue.exec_qrcode + ''''
                  + ', ''' + UpdateValue.out_sourced_name + ''''
                  + ', ''' + UpdateValue.workpiece + ''''
                  + ', 1'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ', ''' + UpdateValue.modeman + ''''
                  + ',' + inttostr( UpdateValue.modedate )
                  + ', 0'
                  + ')';
    Qry.ExecSQL;
    qry.close;
    qry.sql.text := 'SELECT @@IDENTITY as ID_NEW from t_out_sourced_weight';
    qry.open;
    if not qry.eof then
    begin
      WeightingNote.Id := Qry.FieldbyName('ID_NEW').asinteger;
    end;

    Qry1.Close;
    Qry1.SQL.Clear;
    Qry1.SQL.Text := 'insert into t_weight_count ('
                   + 'weightid'
                   + ', Batch'
                   + ', weightgross'
                   + ', weighttare'
                   + ', weightnet_plus'
                   + ', workpiecetotalnum'
                   + ', httpResult'
                   +') values ('
                   + inttostr(WeightingNote.Id)
                   + ', 1'
                   + ', 0'
                   + ', 0'
                   + ', 0'
                   + ', 0'
                   + ', 0'
                   +')';
    Qry1.ExecSQL;
    WeightingNote.BatchCount := 1;
    FrmMain.ADOConnection1.CommitTrans;
    result := True;
  except
    FrmMain.ADOConnection1.RollbackTrans;
    Result := False;
  end;
  Qry.Free;
end;

procedure TFrmMain.QueryWeightNoteDisp(var WeightingNote : RdWeightNote);
var
  Qry : TADOQuery;
begin
  Qry := TADOQuery.Create(nil);
  Qry.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight where id=' + inttostr(WeightingNote.Id);
  Qry.open;
  if not qry.Eof then
  begin
    WeightingNote.bill_no := Qry.FieldByName('bill_no').AsString;
    WeightingNote.exec_qrcode := Qry.FieldByName('exec_qrcode').AsString;    // 'ִ�мƻ�����',
    WeightingNote.out_sourced_name := Qry.FieldByName('out_sourced_name').AsString;   //��Э��������
    WeightingNote.workpiece := Qry.FieldByName('workpiece').AsString ;     // '��������',
    WeightingNote.Unit_samp_set_weight := Qry.FieldByName('Unit_samp_set_weight').AsFloat;; //'����������������',
    WeightingNote.samp_piecce_count := Qry.FieldByName('samp_piecce_count').AsInteger;   //'�������ع�������',
    WeightingNote.samp_piece_weight := Qry.FieldByName('samp_piece_weight').AsFloat;    //������������',
    WeightingNote.unit_samp_weight := Qry.FieldByName('unit_samp_weight').AsFloat;     //����������������',
    WeightingNote.unit_samp_weight := Qry.FieldByName('sample_weight_from').AsInteger;        //������Դ
    WeightingNote.weightgross := Qry.FieldByName('weightgross').AsFloat;          //����ë�أ��ۼ�',
    WeightingNote.weighttare  := Qry.FieldByName('weighttare').AsFloat;          //����Ƥ�� �ۼ�
    WeightingNote.weightnet   := Qry.FieldByName('weightnet_plus').AsFloat;          //��Ʒ���أ��ۼ�',
    //WeightingNote.modeman     :;
    //WeightingNote.modedate    :;

    {EdtWeightNote.Text := WeightingNote.bill_no;
    Edt_out_resourced_name.Text := WeightingNote.out_sourced_name;
    Edtworkpiece.Text := WeightingNote.workpiece;
    EdtSampWeight.Text := format('%.3f',[WeightingNote.Unit_samp_set_weight]);
    EdtSampCount.Text := inttostr(WeightingNote.samp_piecce_count);
    EdtGross.Text := format('%.3f', [WeightingNote.weightgross]);
    EdtTotalTare.Text := format('%.3f',[WeightingNote.weighttare]);
    EdtTotaolNet.Text := format('%.3f',[WeightingNote.weightnet]);}

    DisplayWeightNote( WeightingNote );
  end
  else
  begin
    showmessage('�����ӵļ�¼������');
  end;
  Qry.Free;
end;

procedure TFrmMain.RadioButton1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BitBtn7.Visible := True;
  BitBtn8.Visible := True;
  //EdtBox12Number.Visible := true;
  //Label13.Visible        := true;
  RadioButton2.Checked   := True;
  RadioButton4.Checked   := False;
end;

procedure TFrmMain.RadioButton2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BitBtn7.Visible := True;
  BitBtn8.Visible := True;
  //EdtBox12Number.Visible := true;
  //Label13.Visible        := true;
  RadioButton1.Checked   := True;
  RadioButton3.Checked   := False;
end;

procedure TFrmMain.RadioButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BitBtn7.Visible := False;
  BitBtn8.Visible := False;
  //EdtBox12Number.Visible := false;
  //Label13.Visible        := false;
  RadioButton2.Checked   := False;
  RadioButton4.Checked   := True;
end;

procedure TFrmMain.RadioButton4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BitBtn7.Visible := False;
  BitBtn8.Visible := False;
  //EdtBox12Number.Visible := false;
  //Label13.Visible        := false;
  RadioButton1.Checked   := False;
  RadioButton3.Checked   := True;
end;

Function TFrmMain.CameraLogin_v40(CameraLogInfo : RdCameraLoginInfo;
  var struDeviceInfo : NET_DVR_DEVICEINFO_V30; var CameraLoginInfo_V30 : RdCameraLoginInfo_V30;
  var struPlayInfo_v40 : rd_struPlayInfo_v40) : Boolean;
var
  PdeviceIP : PAnsiChar;
  devicePort : word;
  PuserName : PAnsiChar;
  PpassWord : PAnsiChar;

  iLastErr : integer;
  str : String;
begin
  //��¼�豸 Login the device
  PdeviceIP := PansiChar(PAnsiChar(AnsiString(CameraLogInfo.CameraIPAddress)));
  devicePort := CameraLogInfo.CameraPort;
  PuserName := Pansichar(PAnsiChar(AnsiString(CameraLogInfo.CameraUserName)));
  PpassWord := PansiChar(PAnsiChar(AnsiString(CameraLogInfo.CameraPassword)));

  CameraLoginInfo_V30.UserID := NET_DVR_Login_V30(PdeviceIP, devicePort, PuserName, PpassWord, @struDeviceInfo);
  if CameraLoginInfo_V30.UserID<0 then
  begin
    iLastErr := NET_DVR_GetLastError();
    str := 'Cramer'+ inttostr(CameraLoginInfo_V30.CameraID) + 'NET_DVR_Login_V30 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
    MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
    Result := False;
  end
  else
  begin
    struPlayInfo_v40.lRealHandle := NET_DVR_RealPlay_V40(CameraLoginInfo_V30.UserID, @struPlayInfo_v40.struPlayInfo_v40, Nil, Nil);
    if (struPlayInfo_v40.lRealHandle < 0) then
    begin
      iLastErr := NET_DVR_GetLastError();
      str := 'Cramer' + inttostr(CameraLoginInfo_V30.CameraID) + 'NET_DVR_RealPlay_V40 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
      MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
      Result := False;
    end
    else
    begin
      Result := True;
    end;
  end;
end;



Function TFrmMain.CameraLogin(var UserId : Dword;
  CameraLogInfo : RdCameraLoginInfo;
  var struDeviceInfo : NET_DVR_DEVICEINFO_V30;
  var struPlayInfo : NET_DVR_CLIENTINFO;
  var Pnl_Play_Wnd : TPanel;
  var lRealHandle : Longint;
  var pUser: Pointer
  ) : Boolean;
var
  PdeviceIP : PAnsiChar;
  devicePort : word;
  PuserName : PAnsiChar;
  PpassWord : PAnsiChar;

  iLastErr : integer;
  str : String;

  i : integer;

  //lRealPlayHandle : Long;
  //struPlayInfo1 : NET_DVR_PREVIEWINFO;
  //struPlayInfo : NET_DVR_CLIENTINFO;
begin
  //��¼�豸 Login the device
  PdeviceIP := PansiChar(PAnsiChar(AnsiString(CameraLogInfo.CameraIPAddress)));
  devicePort := CameraLogInfo.CameraPort;
  PuserName := Pansichar(PAnsiChar(AnsiString(CameraLogInfo.CameraUserName)));
  PpassWord := PansiChar(PAnsiChar(AnsiString(CameraLogInfo.CameraPassword)));

  UserID := NET_DVR_Login_V30(PdeviceIP, devicePort, PuserName, PpassWord, @struDeviceInfo);
  if UserID<0 then
  begin
    iLastErr := NET_DVR_GetLastError();
    str := 'Cramer1 NET_DVR_Login_V30 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
    MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
  end
  else
  begin

  end;

  if UserID >= 0 then
  begin
    struPlayInfo.lChannel := 1;    //ͨ����
    struPlayInfo.lLinkMode := 0; //���λΪ1��ʾ������������λֵ��0-TCP��ʽ��1-UDP��ʽ��2-�ಥ��ʽ
    struPlayInfo.sMultiCastIP := NIL; //�ಥ���ַ
    struPlayInfo.hPlayWnd := Pnl_Play_Wnd.Handle; //Ԥ������
    //struPlayInfo.hPlayWnd := 0;//������ֻȡ��
  //
  //  //��ʼԤ��
    lRealHandle := NET_DVR_RealPlay_V30(UserID, @struPlayInfo, nil, pUser, TRUE);
  //  //���ûص��������ڻص��������
  //  //lRealHandle := NET_DVR_RealPlay_V30(lUserID, @struPlayInfo, @testRealDataCallBack_V30,  pUser, TRUE);
  //
    if lRealHandle>=0 then
    begin

    end
    else
    begin
      iLastErr := NET_DVR_GetLastError();
      str := 'Cramer1 NET_DVR_RealPlay_V40 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
      showmessage(str);
    end;
  end;

  //struPlayInfo1.hPlayWnd := Pnl_Play_Wnd.Handle;         //��ҪSDK����ʱ�����Ϊ��Чֵ����ȡ��������ʱ����Ϊ��
  //struPlayInfo1.lChannel     := 1;       //Ԥ��ͨ����
  //struPlayInfo1.dwStreamType := 0;       //0-��������1-��������2-����3��3-����4���Դ�����
  //struPlayInfo1.dwLinkMode   := 0;       //0- TCP��ʽ��1- UDP��ʽ��2- �ಥ��ʽ��3- RTP��ʽ��4-RTP/RTSP��5-RSTP/HTTP
  //struPlayInfo1.bBlocked     := true;       //0- ������ȡ����1- ����ȡ��

   //lRealHandle := NET_DVR_RealPlay_V40(UserID, @struPlayInfo1, nil, nil);
  //if (lRealHandle < 0) then
  //begin
  //    //printf("NET_DVR_RealPlay_V40 error\n");
	//    //NET_DVR_Logout(lUserID);
  //    //NET_DVR_Cleanup();
  //  iLastErr := NET_DVR_GetLastError();
  //  str := 'Cramer1 NET_DVR_Login_V30 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
  //  MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
  //end;

  //function NET_DVR_RealPlay_V40( lUserID : LONG; lpPreviewInfo : LPNET_DVR_PREVIEWINFO; fRealDataCallBack_V30 : REALDATACALLBACK; pUser : Pointer) : LOngint



  //MessageBox(FrmMain.Handle,'MessageBox',Pchar(inttostr(UserID)),MB_OK);
  //showmessage(inttostr(UserID));
  GroupBox5.Caption := inttostr( UserID );
  //LoginInfo.sDeviceAddress := char(CameraLogInfo.CameraIPAddress);
  //CopyMemory(@LoginInfo.sDeviceAddress[0],PAnsiChar(CameraLogInfo.CameraIPAddress),Length(CameraLogInfo.CameraIPAddress)*2);
  //LoginInfo.wPort := devicePort;
  //LoginInfo.sUserName := PuserName;
  //LoginInfo.sPassword := PpassWord;
  //CopyMemory(@LoginInfo.sUserName[0],PChar(CameraLogInfo.CameraUserName), Length(CameraLogInfo.CameraUserName) *2 );
  //CopyMemory(@LoginInfo.sPassword[0],PChar(CameraLogInfo.CameraPassword), Length(CameraLogInfo.CameraPassword) *2);
  //LoginInfo.bUseAsynLogin := true;
  //m_lUserID := NET_DVR_Login_V40( @LoginInfo, @DeviceInfo );
  //if m_lUserID<0 then
  //begin
  //  iLastErr := NET_DVR_GetLastError();
  //  str := 'Cramer1 NET_DVR_Login_V30 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
  //  MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
  //end
  //else
  //begin

  //end;

  //      //showmessage(inttostr(struDeviceInfo1.byChanNum));
  //  end;



  //  if InitSDK then
  //  begin
  //      Camera2IPAddress := SetFile.ReadString('Camera', 'Camera2IP', '');
  //      Camera2Port := SetFile.ReadInteger('Camera', 'Camera2Port', 0);
  //      Camera2UserName := SetFile.ReadString('Camera', 'Camera2UserName', '');
  //      Camera2Password := SetFile.ReadString('Camera', 'Camera2Password', '');

  //      //��¼�豸
  //      device2IP := PAnsiChar(AnsiString(Camera2IPAddress));
  //      device2Port := Camera2Port;
  //      userName2 := PAnsiChar(AnsiString(Camera2UserName));
  //      passWord2 := PAnsiChar(AnsiString(Camera2Password));
  //      m_2UserID := NET_DVR_Login_V30(device2IP, device2Port, userName2, passWord2, @struDeviceInfo2);
  //      if m_2UserID<0 then
  //      begin
  //          iLastErr := NET_DVR_GetLastError();
  //          str := 'Cramer2 NET_DVR_Login_V30 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
  //          MessageBox(0, Pchar(str), '��ʾ��ʾ', MB_OK );
  //      end
  //      else
  //      begin
  //
  //      end;
  //      //showmessage(inttostr(struDeviceInfo2.byChanNum));
  //  end;

  //  if m_2UserID >= 0 then
  //  begin
  //      struPlayInfo2.lChannel := 1;    //ͨ����
  //      struPlayInfo2.lLinkMode := 0; //���λΪ1��ʾ������������λֵ��0-TCP��ʽ��1-UDP��ʽ��2-�ಥ��ʽ
  //      struPlayInfo2.sMultiCastIP := NIL; //�ಥ���ַ
  //      struPlayInfo2.hPlayWnd := Pnl_Play_Wnd2.Handle; //Ԥ������
  //      //struPlayInfo.hPlayWnd := 0;//������ֻȡ��
  //
  //      //��ʼԤ��
  //      lRealHandle2 := NET_DVR_RealPlay_V30(m_2UserID, @struPlayInfo2, nil, pUser2, TRUE);
  //      //���ûص��������ڻص��������
  //      //lRealHandle := NET_DVR_RealPlay_V30(lUserID, @struPlayInfo, @testRealDataCallBack_V30,  pUser, TRUE);
  //
  //      if lRealHandle2>=0 then
  //      begin
  //
  //      end
  //      else
  //      begin
  //          iLastErr := NET_DVR_GetLastError();
  //          str := 'Cramer2 NET_DVR_RealPlay_V40 failed, error code= ' + inttostr(iLastErr); //��¼ʧ�ܣ���������
  //          showmessage(str);
  //      end;
  //  end;

end;

procedure TFrmMain.ScaleComm1ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
var
  rbuf : array[1..1024] of byte;
  i, k, h : Integer;
  viewstring : String;
  SumCheck,
  SumCheckH,
  SuCheckL : Byte;
  TempWeight : double;

  Head : Boolean;
begin

  move(buffer^,pchar(@rbuf)^,bufferlength);

  for i := 1 to bufferlength do
  begin
    if ScaleMscommRecvBufwt1 >= 1020 then
      ScaleMscommRecvBufwt1 := 1;

    ScaleMscommRecvBuf1[ScaleMscommRecvBufwt1] := rbuf[i];
    ScaleMscommRecvBufwt1 := ScaleMscommRecvBufwt1 +1;
  end;

  if ScaleMscommRecvBufwt1 > 2 then
  for i := 1 to ScaleMscommRecvBufwt1 do
  begin
    Head := False;
    if ( ( (ScaleMscommRecvBuf1[i-1]=ord('S')) and (ScaleMscommRecvBuf1[i]=ord('T')) )
      or ( ( ScaleMscommRecvBuf1[i-1]=ord('U') ) and ( ScaleMscommRecvBuf1[i]=ord('S') ) ))
      and
        ( ( ( ScaleMscommRecvBuf1[i+2]=ord('N') ) and ( ScaleMscommRecvBuf1[i+3]=ord('T') ) )
      or (( ScaleMscommRecvBuf1[i+2]=ord('G') ) and ( ScaleMscommRecvBuf1[i+3]=ord('S') )) )
       then
    begin
      h := 1;
      for k := i-1 to ScaleMscommRecvBufwt1 do
      begin
        ScaleMscommRecvBuf1[h] := ScaleMscommRecvBuf1[k] ;
        h := h +1;
      end;
      ScaleMscommRecvBufwt1 := h;
      Head := True;
      break;
    end;
  end;

  if Head then
  begin
    if ScaleMscommRecvBufwt1>=18 then
    begin
      if ( ScaleMscommRecvBuf1[15]=ord('k') ) and (ScaleMscommRecvBuf1[16]=ord('g')) and (ScaleMscommRecvBuf1[17]=$0D) and (ScaleMscommRecvBuf1[18]=$0A) then
      begin
        for K := 8 to 14 do
        begin
          viewstring :=viewstring + chr(ScaleMscommRecvBuf1[k]) ;
        end;
        viewstring := Trim(viewstring);
        if viewstring<> '' then
        begin
            try
              TempWeight := strTofloat( viewstring );
              Scale1Value := TempWeight;
              if ScaleMscommRecvBuf1[7]=ord('-') then
              Scale1Value := -Scale1Value;
              if ScaleMscommSucess1 <= 4 then
                ScaleMscommSucess1 := ScaleMscommSucess1 +1;
            except
              ;
            end;
        end;

        //h := 1;
        //for k := 19 to ScaleMscommRecvBufwt1 do
        //begin
        //  ScaleMscommRecvBuf1[h] := ScaleMscommRecvBuf1[k] ;
        //  h := h +1;
        //end;
        //ScaleMscommRecvBufwt1 := h;
        ScaleMscommRecvBufwt1 := 1;
      end;
    end;
  end;
end;

procedure TFrmMain.ScaleComm2ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
var
  rbuf : array[1..1024] of byte;
  i, k, h : Integer;
  viewstring : String;
  SumCheck,
  SumCheckH,
  SuCheckL : Byte;
  TempWeight : double;
  Head : Boolean;
begin
  move(buffer^,pchar(@rbuf)^,bufferlength);

  for i := 1 to bufferlength do
  begin
    if ScaleMscommRecvBufwt2 >= 1020 then
      ScaleMscommRecvBufwt2 := 1;

    ScaleMscommRecvBuf2[ScaleMscommRecvBufwt2] := rbuf[i];
    ScaleMscommRecvBufwt2 := ScaleMscommRecvBufwt2 +1;
  end;

  if ScaleMscommRecvBufwt2 > 2 then
  for i := 1 to ScaleMscommRecvBufwt2 do
  begin
    Head := False;
    if ( ( (ScaleMscommRecvBuf2[i-1]=ord('S')) and (ScaleMscommRecvBuf2[i]=ord('T')) )
      or ( ( ScaleMscommRecvBuf2[i-1]=ord('U') ) and ( ScaleMscommRecvBuf2[i]=ord('S') ) ))
      and
        ( ( ( ScaleMscommRecvBuf2[i+2]=ord('N') ) and ( ScaleMscommRecvBuf2[i+3]=ord('T') ) )
      or (( ScaleMscommRecvBuf2[i+2]=ord('G') ) and ( ScaleMscommRecvBuf2[i+3]=ord('S') )) )
       then
    begin
      h := 1;
      for k := i-1 to ScaleMscommRecvBufwt2 do
      begin
        ScaleMscommRecvBuf2[h] := ScaleMscommRecvBuf2[k] ;
        h := h +1;
      end;
      ScaleMscommRecvBufwt2 := h;
      Head := True;
      break;
    end;
  end;

  if Head then
  begin
    if ScaleMscommRecvBufwt2>=18 then
    begin
      if ( ScaleMscommRecvBuf2[15]=ord('k') ) and (ScaleMscommRecvBuf2[16]=ord('g')) and (ScaleMscommRecvBuf2[17]=$0D) and (ScaleMscommRecvBuf2[18]=$0A) then
      begin
        for K := 8 to 14 do
        begin
          viewstring :=viewstring + chr(ScaleMscommRecvBuf2[k]) ;
        end;
        viewstring := Trim(viewstring);
        if viewstring<> '' then
        begin
            try
              TempWeight := strTofloat( viewstring );
              Scale2Value := TempWeight;
              if ScaleMscommRecvBuf2[7]=ord('-') then
              Scale2Value := -Scale2Value;
              if ScaleMscommSucess2 <= 4 then
                ScaleMscommSucess2 := ScaleMscommSucess2 +1;
            except
              ;
            end;
        end;

        //h := 1;
        //for k := 19 to ScaleMscommRecvBufwt2 do
        //begin
        //  ScaleMscommRecvBuf2[h] := ScaleMscommRecvBuf2[k] ;
        //  h := h +1;
        //end;
        //ScaleMscommRecvBufwt2 := h;
        ScaleMscommRecvBufwt2 := 1;
      end;
    end;
  end;
end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
  RzLEDDisplay1.Caption := FloatToStr(Scale1Value);
  if ScaleMscommSucess1 <= 0 then
  begin
    LbScale1MscommFailure.Visible := True;
  end
  else
  begin
    LbScale1MscommFailure.Visible := False;
  end;
  if (Scale1ValueOld > 0.0001) and (Scale1Value < 0.0001) then
  begin
    EtBoxTare11.Text := '0';
    EtBoxTare12.Text := '0';
  end;
  Scale1ValueOld := Scale1Value;

//  RzLEDDisplay2.Caption := FloatToStr(Scale2Value);
//  if WeightMscommFailure >= 3 then
//    LbScale2MscommFailure.Visible := True
//  else
//    LbScale2MscommFailure.Visible := False;
//
//  if (Scale2ValueOld > 0.0001) and (Scale2Value < 0.0001) then
//  begin
//    EtBoxTare21.Text := '0';
//    EtBoxTare22.Text := '0';
//  end;
//  Scale2ValueOld := Scale2Value;
//  RzLEDDisplay2.Caption := FloatToStr(Weight2.value);
//  if Weight2.CommFailureCount >= 3 then
//    LbScale2MscommFailure.Visible := True
//  else
//    LbScale2MscommFailure.Visible := False;
//  if (Scale2ValueOld > 0.0001) and (Weight2.value < 0.0001) then
//  begin
//    EtBoxTare21.Text := '0';
//    EtBoxTare22.Text := '0';
//  end;
//  Scale2ValueOld := Weight2.value;
  RzLEDDisplay2.Caption := FloatToStr(Scale2Value);
  if ScaleMscommSucess2 <= 0 then
    LbScale2MscommFailure.Visible := True
  else
    LbScale2MscommFailure.Visible := False;
  if (Scale2ValueOld > 0.0001) and (Scale2Value < 0.0001) then
  begin
    EtBoxTare21.Text := '0';
    EtBoxTare22.Text := '0';
  end;
  Scale2ValueOld := Scale2Value

end;

procedure TFrmMain.Timer2Timer(Sender: TObject);
begin
  WaitTime := WaitTime +1;
end;

procedure TFrmMain.TmrWeightMscomm1Timer(Sender: TObject);
begin
  if ScaleMscommSucess1 >= 0 then ScaleMscommSucess1 := ScaleMscommSucess1 -1;
end;

procedure TFrmMain.TmrWeightMscomm2Timer(Sender: TObject);
begin
  if ScaleMscommSucess2 >= 0 then ScaleMscommSucess2 := ScaleMscommSucess2 -1;
end;

function TFrmMain.AddNewWeightNote(UpdateValue : RdWeightNote; var Bill_no : String) : Boolean;
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;
begin
  jsonstr := '{';
  jsonstr := jsonstr + '"dboperation":"insert"';
  jsonstr := jsonstr + ',' + '"bill_no":'+ '""';    //���ص���
  jsonstr := jsonstr + ',' + '"exec_qrcode":' + '"' + UpdateValue.exec_qrcode + '"';    //ִ�мƻ�����
  jsonstr := jsonstr + ',' + '"workpiece":""';               //��������
  jsonstr := jsonstr + ',' + '"Unit_samp_set_weight":""';    //����������������
  jsonstr := jsonstr + ',' + '"samp_piecce_count":""';       //�������ع�������
  jsonstr := jsonstr + ',' + '"samp_piece_weight":""';       //������������
  jsonstr := jsonstr + ',' + '"unit_samp_weight":""';        //����������������
  jsonstr := jsonstr + ',' + '"weightgross":""';             //����ë�أ��ۼ�
  jsonstr := jsonstr + ',' + '"weighttare":""';              //������Ƥ�أ��ۼ�
  jsonstr := jsonstr + ',' + '"weightnet":""';               //��Ʒ���أ��ۼ�
  jsonstr := jsonstr + ',' + '"modeman":"' + UpdateValue.modeman + '"';                 //
  jsonstr := jsonstr + ',' + '"modedate":"' + inttostr(UpdateValue.modedate) + '"';     //
  jsonstr := jsonstr + '}';

  //memo1.Lines.Add(jsonstr) ;

  try
    Request:=TStringStream.create(' ',65001);

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    Request := TStringStream.create(jsonstr,65001);
    Response := IdHTTP1.Post(Gv_domain + 'api/post_truckweight_data', Request);
    vRet := SO(utf8decode(Response));
    if Uppercase(vRet['success'].AsString) = 'TRUE' then
    begin
      Result := true;
      Bill_No := vRet['billno'].AsString;
    end
    else
    begin
      result := false;
      showmessage('���ݸ�ʽ���ԣ�');
    end;
  except
    result := False;
    showmessage('�ϴ�Mesʧ��');
  end;
end;

function TFrmMain.GetWeightNote( Var UpdateValue : RdWeightNote;
  bill_no : string ) : Boolean;
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;
  Qry : TADOQuery;
begin
{  jsonstr := '{';
  jsonstr := jsonstr + '"dboperation":"select"';
  jsonstr := jsonstr + ',' + '"bill_no":"'+ bill_no + '"';    //���ص���}
//  jsonstr := jsonstr + ',' + '"exec_qrcode":' + '"' + UpdateValue.exec_qrcode + '"';    //ִ�мƻ�����
//  jsonstr := jsonstr + ',' + '"workpiece":""';               //��������
//  jsonstr := jsonstr + ',' + '"Unit_samp_set_weight":""';    //����������������
//  jsonstr := jsonstr + ',' + '"samp_piecce_count":""';       //�������ع�������
//  jsonstr := jsonstr + ',' + '"samp_piece_weight":""';       //������������
//  jsonstr := jsonstr + ',' + '"unit_samp_weight":""';        //����������������
//  jsonstr := jsonstr + ',' + '"weightgross":""';             //����ë�أ��ۼ�
//  jsonstr := jsonstr + ',' + '"weighttare":""';              //������Ƥ�أ��ۼ�
//  jsonstr := jsonstr + ',' + '"weightnet":""';               //��Ʒ���أ��ۼ�
//  jsonstr := jsonstr + ',' + '"modeman":"' + UpdateValue.modeman + '"';                 //
//  jsonstr := jsonstr + ',' + '"modedate":"' + inttostr(UpdateValue.modedate) + '"';     //}
//  jsonstr := jsonstr + '}';

{  memo1.Lines.Add(jsonstr) ;

  try
    Request:=TStringStream.create(' ',65001);

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;

    Request := TStringStream.create(jsonstr,65001);
    Response := IdHTTP1.Post(Gv_domain + 'api/post_truckweight_data', Request);
    vRet := SO(utf8decode(Response));
    if Uppercase(vRet['success'].AsString) = 'TRUE' then
    begin
      Result := true;
      Bill_No := vRet['billno'].AsString;
}
      {��ȡ���ص���Ϣ}
{    end
    else
    begin
      result := false;
      showmessage('���ݴ������');
    end;
  except
    result := False;
    showmessage('��ȡ���ص���Ϣʧ�ܣ�');
  end;}

  Qry := TADOQuery.Create(nil);
  Qry.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight where bill_no=' + '''' + bill_no + '''';
  Qry.Open;
  if not Qry.Eof then
  begin
    UpdateValue.Id := Qry.FieldByName('id').AsInteger;
    UpdateValue.bill_no := Qry.FieldByName('bill_no').AsString;         //'���ص���',
    UpdateValue.exec_qrcode := Qry.FieldByName('exec_qrcode').AsString; // 'ִ�мƻ�����',
    UpdateValue.out_sourced_name := Qry.FieldByName('out_sourced_name').AsString;   //��Э��������
    UpdateValue.workpiece := Qry.FieldByName('workpiece').AsString ;     // '��������',
    UpdateValue.Unit_samp_set_weight := Qry.FieldByName('Unit_samp_set_weight').AsFloat; //'����������������',
    UpdateValue.samp_piecce_count := Qry.FieldByName('samp_piecce_count').AsInteger;   //'�������ع�������',
    UpdateValue.samp_piece_weight := Qry.FieldByName('samp_piece_weight').AsFloat;    //������������',
    UpdateValue.unit_samp_weight := Qry.FieldByName('unit_samp_weight').AsFloat;     //����������������',
    UpdateValue.weightgross := Qry.FieldByName('weightgross').AsFloat;          //����ë�أ��ۼ�',
    UpdateValue. weighttare  := Qry.FieldByName('weighttare').AsFloat;          //����Ƥ�� �ۼ�
    UpdateValue.weightnet   := Qry.FieldByName('weightnet_plus').AsFloat;          //��Ʒ���أ��ۼ�',

    Result := True;
  end
  else
  begin
    showmessage('��Ч�ĳ��ص���');
    Result := False;
  end;

  Qry.Free;

end;

procedure TFrmMain.GrdUndoneGodownEntryDblClick(Sender: TObject);
var
  Row : Integer;
begin
  Row := GrdUndoneGodownEntry.Row;
  if (GrdUndoneGodownEntry.RowCount >2) and (Row >=1) then
  begin
    WeightingNote.Id                   := StrToInt(GrdUndoneGodownEntry.Cells[1, Row]);
    WeightingNote.bill_no              := GrdUndoneGodownEntry.Cells[2, Row];   //'���ص���',
    WeightingNote.exec_qrcode          := GrdUndoneGodownEntry.Cells[3, Row];    // 'ִ�мƻ�����',
    WeightingNote.out_sourced_name     := GrdUndoneGodownEntry.Cells[4, Row];   //��Э��������
    WeightingNote.workpiece            := GrdUndoneGodownEntry.Cells[5, Row];     // '��������',
    WeightingNote.Unit_samp_set_weight := strtofloat(GrdUndoneGodownEntry.Cells[6, Row]); //'����������������',
    WeightingNote.samp_piecce_count    := strtoint(GrdUndoneGodownEntry.Cells[7, Row]);   //'�������ع�������',
    WeightingNote.samp_piece_weight    := strtofloat(GrdUndoneGodownEntry.Cells[8, Row]);    //������������',
    WeightingNote.unit_samp_weight     := strtofloat(GrdUndoneGodownEntry.Cells[9, Row]);     //����������������',
    //������Դ
    WeightingNote.samp_picture         := GrdUndoneGodownEntry.Cells[13, Row];         //����ͼƬ�洢·��
    WeightingNote.weightgross          := strtofloat(GrdUndoneGodownEntry.Cells[10, Row]);              //����ë�أ��ۼ�',
    WeightingNote.weighttare           := strtofloat(GrdUndoneGodownEntry.Cells[11, Row]);          //����Ƥ�� �ۼ�
    WeightingNote.weightnet            := strtofloat(GrdUndoneGodownEntry.Cells[12, Row]);          //��Ʒ���أ��ۼ�',
    //WeightingNote.modeman              := ;
    //WeightingNote.modedate             := ;

    Edt_exec_qrcode.Text := WeightingNote.exec_qrcode;
    DisplayWeightNote( WeightingNote );
  end;
end;

function TFrmMain.UpdateWeightNote(WeightingNote : RdWeightNote) : Boolean;
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;//}
begin
  jsonstr := '{';
  jsonstr := jsonstr + '"dboperation":"update"';
  jsonstr := jsonstr + ',' + '"bill_no":'+ '"' + WeightingNote.bill_no + '"';    //���ص���
  jsonstr := jsonstr + ',' + '"exec_qrcode":"' + WeightingNote.exec_qrcode + '"';    //ִ�мƻ�����
  jsonstr := jsonstr + ',' + '"workpiece":"' + WeightingNote.workpiece + '"';               //��������
  jsonstr := jsonstr + ',' + '"Unit_samp_set_weight":"' + Format('%.3f',[WeightingNote.Unit_samp_set_weight]) + '"';    //����������������
  jsonstr := jsonstr + ',' + '"samp_piecce_count":"' + inttostr(WeightingNote.samp_piecce_count) + '"';       //�������ع�������
  jsonstr := jsonstr + ',' + '"samp_piece_weight":"' + Format('%.3f',[WeightingNote.samp_piece_weight]) + '"';       //������������
  jsonstr := jsonstr + ',' + '"unit_samp_weight":"' + Format('%.3f',[WeightingNote.unit_samp_weight]) + '"';        //����������������
  jsonstr := jsonstr + ',' + '"samp_picture":"' + WeightingNote.samp_picture + '"';
  jsonstr := jsonstr + ',' + '"weightgross":"' + Format('%.3f',[WeightingNote.weightgross]) + '"';             //����ë�أ��ۼ�
  jsonstr := jsonstr + ',' + '"weighttare":"' + Format('%.3f',[WeightingNote.weighttare]) + '"';              //������Ƥ�أ��ۼ�
  jsonstr := jsonstr + ',' + '"weightnet":"' + Format('%.3f',[WeightingNote.weightnet]) + '"';               //��Ʒ���أ��ۼ�
  jsonstr := jsonstr + ',' + '"modeman":"' + WeightingNote.modeman + '"';                 //
  jsonstr := jsonstr + ',' + '"modedate":"' + inttostr(WeightingNote.modedate) + '"';     // }
  jsonstr := jsonstr + '}';

//  memo1.Lines.Add(jsonstr) ;

  try
    Request:=TStringStream.create(' ',65001);

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    Request := TStringStream.create(jsonstr,65001);
    //Response := IdHTTP1.Post(Gv_domain + 'api/post_truckweight_data', Request);
    //vRet := SO(utf8decode(Response));
    //if Uppercase(vRet['success'].AsString) = 'TRUE' then
    //begin
    //  Result := true;
    //  Bill_No := vRet['billno'].AsString;
    //end
    //else
    //begin
    //  result := false;
    //  showmessage('���ݸ�ʽ���ԣ�');
    //end;
  except
  //  result := False;
  //  showmessage('�ϴ�Mesʧ��');
  end;
end;

procedure TFrmMain.DisplayWeightNote( WeightingNote : RdWeightNote );
var
  i : integer;
begin
  EdtWeightNote.Text          := WeightingNote.bill_no;      //'���ص���',
  Edt_out_resourced_name.Text := WeightingNote.out_sourced_name;     //��Э��������
  Edtworkpiece.Text           := WeightingNote.workpiece;          // '��������',
  EdtSampWeight.Text          := format('%.3f', [WeightingNote.samp_piece_weight]);         //������������'
  EdtSampCount.Text           := inttostr(WeightingNote.samp_piecce_count);         //'�������ع�������
  //EdtBoxCount.Text            :=
  EdtWeightCount.Text         := inttostr(WeightingNote.BatchCount);
  EdtGross.Text               := format('%.3f', [WeightingNote.weightgross]);          //����ë�أ��ۼ�'
  EdtTotalTare.Text           := format('%.3f', [WeightingNote.weighttare]);          //����Ƥ�� �ۼ�
  EdtTotaolNet.Text           := format('%.3f', [WeightingNote.weightnet]);          //��Ʒ���أ��ۼ�

  EdtSamplePieceCount1.Text   := IntToStr(WeightingNote.samp_piecce_count);
  EdtSamplePieceTotalWeight1.Text
                              := Format('%.3f', [WeightingNote.samp_piece_weight]);
  EdtSamplePieceCount2.Text   := IntToStr(WeightingNote.samp_piecce_count);
  EdtSamplePieceTotalWeight2.Text
                              := Format('%.3f', [WeightingNote.samp_piece_weight]);
  EdtSampCount.Text           := inttostr(WeightingNote.workpiececount);
  EdtWeightCount.text         := inttostr(WeightingNote.BatchCount);
  EdtWeightCount.Items.Clear;
  for i :=1  to WeightingNote.BatchCount do
  begin
    EdtWeightCount.Items.Add(inttostr(i));
  end;

end;

function TFrmMain.UpdateWeightingNoteToDb(WeightingNote : RdWeightNote) : Boolean;
var
  Qry : TADOQuery;
  i : integer;
begin
  Qry := TADOQuery.Create(Nil);
  Qry.Connection := ADOConnection1;

  try
    ADOConnection1.BeginTrans;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'update t_out_sourced_weight set samp_piecce_count=' + inttostr(WeightingNote.samp_piecce_count)
                + ', samp_piece_weight=' + format('%.3f',[WeightingNote.samp_piece_weight])
                + ', unit_samp_weight='  + format('%.3f',[WeightingNote.unit_samp_weight])
                + ', samp_picture=' + '''' + WeightingNote.samp_picture + ''''
                + ', sample_weight_from=' + inttostr(WeightingNote.sample_weight_from)
                + ' where id=' + inttostr(WeightingNote.Id) ;
    Qry.ExecSQL;
    ADOConnection1.CommitTrans;

    for i := 1 to GrdUndoneGodownEntry.RowCount -2 do
    begin
      if GrdUndoneGodownEntry.Cells[1,i] = inttostr(WeightingNote.Id) then
      begin
        break;
      end;
    end;
    if i<=GrdUndoneGodownEntry.RowCount -2 then
    begin
      GrdUndoneGodownEntry.Cells[7,i] := inttostr(WeightingNote.samp_piecce_count);
      GrdUndoneGodownEntry.Cells[8,i] := format('%.3f', [WeightingNote.samp_piece_weight]);
      GrdUndoneGodownEntry.Cells[8,i] := format('%.3f', [WeightingNote.unit_samp_weight]);
    end;
    Result := True;
  except
    ADOConnection1.RollbackTrans;
    Result := False;
  end;

  Qry.Free;
end;

function TFrmMain.insertTwoWeightDetails(var WeightData1: WeightData;
  var WeightData2 : WeightData;WeightNote : RdWeightNote) : Boolean;
var
  Qry1 ,
  Qry2 ,
  Qry3 : TADOQuery;

begin
  Qry1 := TADOQuery.Create(nil);
  Qry2 := TADOQuery.Create(nil);
  Qry3 := TADOQuery.Create(nil);
  Qry1.Connection := FrmMain.ADOConnection1;
  Qry2.Connection := FrmMain.ADOConnection1;
  Qry3.Connection := FrmMain.ADOConnection1;

  try
    FrmMain.ADOConnection1.BeginTrans;
    Qry1.Close;
    Qry1.Sql.Clear;
    Qry1.SQL.Text := 'insert into t_out_sourced_weight_detail ('
                  + 'WeightNoteId'
                  + ',bill_no'
                  + ', exec_qrcode'
                  + ', print_code'
                  + ', weightbatchs'
                  + ', weightboxcount'
                  + ', Box1TareSet'
                  + ', Box2TareSet'
                  + ', Box3TareSet'
                  + ', Box1TareWeight'
                  + ', Box2TareWeight'
                  + ', Box3TareWeight'
                  + ', weightgross1'
                  + ', weightgross2'
                  + ', weightGross'
                  + ', weightnet'
                  + ', workpiecenumber'
                  + ', workbox_num'
                  + ', weight_picture'
                  + ', modeman'
                  + ', modedate'
                  + ', usestate'
                  + ', httpResult'
                  + ', state'
                  + ', weight_from'
                  + ', unit_samp_weight'
                  + ', sample_weight_from'
                  + ') values ('
                  + inttostr(WeightNote.Id)
                  + ',' + '''' + WeightNote.bill_no + ''''
                  + ',' + '''' + WeightNote.exec_qrcode + ''''
                  + ',' + '''' + inttostr(WeightData1.print_code) + ''''
                  + ',' + inttostr(WeightNote.BatchCount)
                  + ', 2'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ',' + Format('%.3f', [WeightData1.Box1TareWeight])
                  + ',' + Format('%.3f', [WeightData1.Box2TareWeight])
                  + ',' + Format('%.3f', [WeightData1.Box3TareWeight])
                  + ',' + Format('%.3f', [WeightData1.weightgross1])
                  + ',' + Format('%.3f', [WeightData1.weightgross2])
                  + ',' + Format('%.3f', [WeightData1.weightgross])
                  + ',' + Format('%.3f', [WeightData1.weightnet])
                  + ',' + inttostr(WeightData1.workpiecenumber)
                  + ',' + inttostr(WeightData1.workbox_num)
                  + ', ''' + WeightData1.weight_picture + ''''
                  + ', ''' + WeightData1.modeman + ''''
                  + ', ''' + inttostr(WeightData1.modedate) + ''''
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ',' + inttostr(WeightData1.weight_from)
                  + ',' + Format('%.3f', [WeightData1.unit_samp_weight])
                  + ',' + inttostr(WeightData1.sample_weight_from)
                  + ')';
    Qry1.ExecSQL;

    Qry1.Close;
    Qry1.SQL.Clear;
    Qry1.SQL.Text := 'select @@IDENTITY as new_id from t_out_sourced_weight_detail';
    Qry1.Open;
    if not Qry1.Eof then
    begin
      WeightData1.DBID := Qry1.FieldByName('new_id').AsInteger;
    end
    else
    begin
      showmessage('���Ӽ�¼ʧ��');
    end;

    Qry2.Close;
    Qry2.Sql.Clear;
    Qry2.SQL.Text := 'insert into t_out_sourced_weight_detail ('
                  + 'WeightNoteId'
                  + ',bill_no'
                  + ', exec_qrcode'
                  + ', print_code'
                  + ', weightbatchs'
                  + ', weightboxcount'
                  + ', Box1TareSet'
                  + ', Box2TareSet'
                  + ', Box3TareSet'
                  + ', Box1TareWeight'
                  + ', Box2TareWeight'
                  + ', Box3TareWeight'
                  + ', weightgross1'
                  + ', weightgross2'
                  + ', weightGross'
                  + ', weightnet'
                  + ', workpiecenumber'
                  + ', workbox_num'
                  + ', weight_picture'
                  + ', modeman'
                  + ', modedate'
                  + ', usestate'
                  + ', httpResult'
                  + ', state'
                  + ', weight_from'
                  + ', unit_samp_weight'
                  + ', sample_weight_from'
                  + ') values ('
                  + inttostr(WeightNote.Id)
                  + ',' + '''' + WeightNote.bill_no + ''''
                  + ',' + '''' + WeightNote.exec_qrcode + ''''
                  + ',' + '''' + inttostr(WeightData2.print_code) + ''''
                  + ',' + inttostr(WeightNote.BatchCount)
                  + ', 2'
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ',' + Format('%.3f', [WeightData2.Box1TareWeight])
                  + ',' + Format('%.3f', [WeightData2.Box2TareWeight])
                  + ',' + Format('%.3f', [WeightData2.Box3TareWeight])
                  + ',' + Format('%.3f', [WeightData2.weightgross1])
                  + ',' + Format('%.3f', [WeightData2.weightgross2])
                  + ',' + Format('%.3f', [WeightData2.weightgross])
                  + ',' + Format('%.3f', [WeightData2.weightnet])
                  + ',' + inttostr(WeightData2.workpiecenumber)
                  + ',' + inttostr(WeightData2.workbox_num)
                  + ', ''' + WeightData2.weight_picture + ''''
                  + ', ''' + WeightData2.modeman + ''''
                  + ', ''' + inttostr(WeightData2.modedate) + ''''
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ',' + inttostr(WeightData1.weight_from)
                  + ',' + Format('%.3f', [WeightData1.unit_samp_weight])
                  + ',' + inttostr(WeightData1.sample_weight_from)
                  + ')';
    Qry2.ExecSQL;

    Qry2.Close;
    Qry2.SQL.Clear;
    Qry2.SQL.Text := 'select @@IDENTITY as new_id from t_out_sourced_weight_detail';
    Qry2.Open;
    if not Qry2.Eof then
    begin
      WeightData2.DBID := Qry2.FieldByName('new_id').AsInteger;
    end
    else
    begin
      showmessage('���Ӽ�¼ʧ��');
    end;

    qry3.Close;
    Qry3.SQL.Clear;
    Qry3.SQL.Text := 'update t_weight_count set '
                   + 'weightgross=weightgross+:NewGross'
                   + ',weighttare=weighttare +:NewTare'
                   + ',weightnet_plus=weightnet_plus +:NewWeightNet'
                   + ',workpiecetotalnum=workpiecetotalnum +:NewNum'
                   + ' where weightid=:weightid and Batch=:Batch';
    Qry3.Parameters.ParamByName('NewGross').Value := (WeightData2.weightgross1 - WeightData2.weightgross2)
                                                   + (WeightData1.weightgross1 - WeightData1.weightgross2);
    Qry3.Parameters.ParamByName('NewTare').Value      := WeightData1.Box1TareWeight + WeightData2.Box1TareWeight;
    Qry3.Parameters.ParamByName('NewWeightNet').Value := WeightData1.weightnet + WeightData2.weightnet;
    Qry3.Parameters.ParamByName('NewNum').Value       := WeightData1.workpiecenumber + WeightData2.workpiecenumber;
    Qry3.Parameters.ParamByName('weightid').Value := WeightNote.Id;
    Qry3.Parameters.ParamByName('Batch').Value    := WeightNote.BatchCount;
    Qry3.ExecSQL;

    FrmMain.ADOConnection1.CommitTrans;
    WeightDetailList.Add(inttostr(WeightData1.DBID));
    WeightDetailList.Add(inttostr(WeightData2.DBID));
    Result := True;
  except
    FrmMain.ADOConnection1.RollbackTrans;
    Result := False;
  end;

  Qry1.Free;
end;

function TFrmMain.insertOneWeightDetails(WeightData1: WeightData; WeightNote : RdWeightNote) : Boolean;
var
  Qry, Qry2 : TADOQuery;
begin
  Qry := TADOQuery.Create(nil);
  Qry.Connection := ADOConnection1;
  Qry2 := TADOQuery.Create(nil);
  Qry2.Connection := ADOConnection1;

  Try
    ADOConnection1.BeginTrans;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'insert into t_out_sourced_weight_detail ('
                  + 'WeightNoteId'
                  + ',bill_no'
                  + ', exec_qrcode'
                  + ', print_code'
                  + ', weightbatchs'
                  + ', weightboxcount'
                  + ', Box1TareSet'
                  + ', Box2TareSet'
                  + ', Box3TareSet'
                  + ', Box1TareWeight'
                  + ', Box2TareWeight'
                  + ', Box3TareWeight'
                  + ', weightgross1'
                  + ', weightgross2'
                  + ', weightGross'
                  + ', weightnet'
                  + ', workpiecenumber'
                  + ', workbox_num'
                  + ', weight_picture'
                  + ', weight_from'
                  + ', unit_samp_weight'
                  + ', sample_weight_from'
                  + ', modeman'
                  + ', modedate'
                  + ', usestate'
                  + ', httpResult'
                  + ', state'
                  + ') values ('
                  + inttostr(WeightNote.Id)
                  + ',' + '''' + WeightNote.bill_no + ''''
                  + ',' + '''' + WeightNote.exec_qrcode + ''''
                  + ',' + '''' + inttostr(WeightData1.print_code) + ''''
                  + ',' + inttostr(WeightNote.BatchCount)
                  + ',' + inttostr(WeightData1.BoxCount)
                  + ',' + Format('%.3f', [WeightData1.Box1Tare])
                  + ',' + Format('%.3f', [WeightData1.Box2Tare])
                  + ',' + Format('%.3f', [WeightData1.Box3Tare])
                  + ',' + Format('%.3f', [WeightData1.Box1TareWeight])
                  + ',' + Format('%.3f', [WeightData1.Box2TareWeight])
                  + ',' + Format('%.3f', [WeightData1.Box3TareWeight])
                  + ',' + Format('%.3f', [WeightData1.weightgross1])
                  + ',' + Format('%.3f', [WeightData1.weightgross2])
                  + ',' + Format('%.3f', [WeightData1.weightgross])
                  + ',' + Format('%.3f', [WeightData1.weightnet])
                  + ',' + inttostr(WeightData1.workpiecenumber)
                  + ',' + inttostr(WeightData1.workbox_num)
                  + ', ''' + WeightData1.weight_picture + ''''
                  + ',' + inttostr(WeightData1.weight_from)
                  + ',' + Format('%.3f', [WeightData1.unit_samp_weight])
                  + ',' + inttostr(WeightData1.sample_weight_from)
                  + ', ''' + WeightData1.modeman + ''''
                  + ', ''' + inttostr(WeightData1.modedate) + ''''
                  + ', 0'
                  + ', 0'
                  + ', 0'
                  + ')';
    Qry.ExecSQL;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select @@IDENTITY as new_id from t_out_sourced_weight_detail';
    Qry.Open;
    if not Qry.Eof then
    begin
      WeightData1.DBID := Qry.FieldByName('new_id').AsInteger;
    end
    else
    begin
      showmessage('���Ӽ�¼ʧ��');
    end;

    qry2.Close;
    Qry2.SQL.Clear;
    Qry2.SQL.Text := 'update t_weight_count set '
                   + 'weightgross=weightgross+:NewGross'
                   + ',weighttare=weighttare +:NewTare'
                   + ',weightnet_plus=weightnet_plus +:NewWeightNet'
                   + ',workpiecetotalnum=workpiecetotalnum +:NewNum'
                   + ' where weightid=:weightid and Batch=:Batch';
    Qry2.Parameters.ParamByName('NewGross').Value := (WeightData1.weightgross1 - WeightData1.weightgross2);
    Qry2.Parameters.ParamByName('NewTare').Value      := WeightData1.Box1TareWeight + WeightData1.Box2TareWeight;
    Qry2.Parameters.ParamByName('NewWeightNet').Value := WeightData1.weightnet ;
    Qry2.Parameters.ParamByName('NewNum').Value       := WeightData1.workpiecenumber ;
    Qry2.Parameters.ParamByName('weightid').Value := WeightNote.Id;
    Qry2.Parameters.ParamByName('Batch').Value    := WeightNote.BatchCount;
    Qry2.ExecSQL;

    ADOConnection1.CommitTrans;
    WeightDetailList.Add(inttostr(WeightData1.DBID));
    Result := True;
  except
    ADOConnection1.RollbackTrans;
    Result := False;
  End;

  Qry.Free;
  Qry2.Free;
end;

procedure TFrmMain.DispWeightDetails(WeightId : Integer; WeightBatch : Integer);
var
  Qry : TADOQuery;
  Row : Integer;
begin
  Qry := TADOQuery.Create(Nil);
  Qry.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:ID and weightbatchs=:weightbatchs';
  Qry.SQL.Text := Qry.SQL.Text + ' order by Id';
  Qry.Parameters.ParamByName( 'ID'          ).Value := WeightId;
  Qry.Parameters.ParamByName( 'weightbatchs').Value := WeightBatch;
  Qry.Open;
  Qry.First;
  if not Qry.Eof then
  begin
    GrdWeightingLst.RowCount := Qry.RecordCount + 2;
    Row := 1;
    while not Qry.Eof do
    begin
      GrdWeightingLst.Rows[row].Clear;
      GrdWeightingLst.Cells[1, Row] := Qry.FieldByName('print_code').AsString;
      GrdWeightingLst.Cells[2, Row] := format('%.3f',[Qry.FieldByName('Box1TareWeight').AsFloat]);
      GrdWeightingLst.Cells[3, Row] := format('%.3f',[Qry.FieldByName('Box2TareWeight').AsFloat]);
      GrdWeightingLst.Cells[4, Row] := format('%.3f',[Qry.FieldByName('weightgross1').AsFloat]);
      GrdWeightingLst.Cells[5, Row] := format('%.3f',[Qry.FieldByName('weightgross2').AsFloat]);
      GrdWeightingLst.Cells[6, Row] := format('%.3f',[Qry.FieldByName('weightGross').AsFloat]);
      GrdWeightingLst.Cells[7, Row] := format('%.3f',[Qry.FieldByName('weightnet').AsFloat]);
      GrdWeightingLst.Cells[8, Row] := inttostr(Qry.FieldByName('workpiecenumber').AsInteger );
      GrdWeightingLst.Cells[11, Row] := inttostr(Qry.FieldByName('workbox_num').AsInteger );
      Qry.Next;
      Row := Row +1;
    end;
    GrdWeightingLst.Rows[Row].Clear;
  end;

  Qry.Free;
end;

procedure TFrmMain.DispWeightBatchInfo(WeightingNoteId : Integer; BatchCount : Integer);
var
  Qry : TADOQuery;
begin
  Qry := TADOQuery.Create(Nil);
  Qry.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_weight_count where weightid=:weightid and Batch=:Batch';
  Qry.Parameters.ParamByName('weightid').Value := WeightingNote.Id;
  Qry.Parameters.ParamByName('Batch').Value    := WeightingNote.BatchCount;
  Qry.Open;
  if not Qry.Eof then
  begin
    EdtGross.Text     := Format('%.3f', [ Qry.FieldByName('weightgross').AsFloat ]);
    EdtTotalTare.Text := Format( '%.3f', [Qry.FieldByName('weighttare').AsFloat]);
    EdtTotaolNet.Text := format('%.3f', [Qry.FieldByName('weightnet_plus').AsFloat]);
    EdtSampCount.Text := inttostr( Qry.FieldByName('workpiecetotalnum').AsInteger);
  end
  else
  begin
    Showmessage('���ݸ���ʧ��');
  end;

  Qry.Free;
end;

function TFrmMain.httpUploadWeightNote(WeightNoteId : integer; WeightBatch : integer) : Boolean;
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;
  Qry,Qry1,Qry2 : TADOQuery;
  i : integer;
  Bill_No : String;
  out_sourced_name : AnsiString;
begin
  Qry  := TADOQuery.create(nil);
  Qry1 := TADOQuery.create(nil);
  Qry2 := TADOQuery.create(nil);
  Qry.Connection := ADOConnection1;
  Qry1.Connection := ADOConnection1;
  Qry2.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight where id=:WeightNoteId';
  Qry.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
  Qry.Open;
  if Qry.Eof then
  begin
    Showmessage('���ص���Ϣ�����ڣ��ϴ�ʧ��');
    exit;
  end
  else
  begin
    if Qry.FieldByName('exec_det').AsString='' then
    begin
      //Showmessage('��ѡ����');
      if messagebox(FrmMain.Handle,'��⹤��Ϊ�գ������Ƿ�����ύ','����', MB_ICONINFORMATION+MB_OkCancel)<>idok then
      begin
        exit;
      end;
    end;
  end;



  Qry1.Close;
  Qry1.SQL.Clear;
  Qry1.SQL.Text := 'select * from t_weight_count where weightid=:WeightNoteId and Batch=:WeightBatch';
  Qry1.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
  Qry1.Parameters.ParamByName('WeightBatch' ).Value := WeightBatch;
  Qry1.Open;
  if Qry1.Eof then
  begin
    Showmessage('���ش�����Ϣ�����ڣ��ϴ�ʧ��');
    exit;
  end;

  Qry2.Close;
  Qry2.SQL.Clear;
  Qry2.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:WeightNoteId and weightbatchs=:WeightBatch order by Id';
  Qry2.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
  Qry2.Parameters.ParamByName('WeightBatch' ).Value := WeightBatch;
  Qry2.Open;
  if Qry2.Eof then
  begin
    Showmessage('������ϸ�����ڣ��ϴ�ʧ��');
    exit;
  end;

  jsonstr := '{';
  jsonstr := jsonstr + '"bill_no":""';                                                     //���ص���
  jsonstr := jsonstr + ',"exec_qrcode":"' + Qry.FieldByName('exec_qrcode').AsString + '"'; //ִ�мƻ�����
  out_sourced_name := ansistring( Qry.FieldByName('out_sourced_name').AsString );
  jsonstr := jsonstr + ',"out_sourced_name":"' + out_sourced_name + '"';
  //jsonstr := jsonstr + ',"out_sourced_name":"' + Qry.FieldByName('out_sourced_name').AsString + '"';  //��Э��������
    {TruckNum := string(HTTPEncode (WriteData.TruckNumber)) ;
    TruckNum := ansistring(WriteData.TruckNumber);
    HttpStr := httpStr + ',' + '"TruckNumber":' + '"' + TruckNum + '"';;TruckNum := string(HTTPEncode (WriteData.TruckNumber)) ; }

  jsonstr := jsonstr + ',"workpiece":"' + Qry.FieldByName('workpiece').AsString + '"';                //��������
  jsonstr := jsonstr + ',"Unit_samp_set_weight":"' + Floattostr(Roundto(Qry.FieldByName('Unit_samp_set_weight').AsFloat, -3)) + '"';   //����������������
  jsonstr := jsonstr + ',"samp_piece_count":"' + inttostr(Qry.FieldByName('samp_piecce_count').AsInteger) + '"';    //�������ع�������
  jsonstr := jsonstr + ',"samp_piece_weight":"' + Floattostr(roundto(Qry.FieldByName('samp_piece_weight').AsFloat, -3)) + '"';    //������������
  jsonstr := jsonstr + ',"unit_samp_weight":"' + FloatToStr(RoundTo(Qry.FieldByName('unit_samp_weight').AsFloat, -3)) + '"';               //����������������
  jsonstr := jsonstr + ',"samp_picture":"' + '"';//Qry.FieldByName('samp_picture').AsString + '"';                   //����ͼƬ�洢·��
  jsonstr := jsonstr + ',"weightgross":"'  + FloatToStr(RoundTo(Qry1.FieldByName('weightgross').AsFloat, -3)) + '"';    //����ë�أ��ۼ�
  jsonstr := jsonstr + ',"weighttare":"'   + FloatToStr(RoundTo(Qry1.FieldByName('weighttare').AsFloat, -3)) + '"';    //������Ƥ�أ��ۼ�
  jsonstr := jsonstr + ',"weightnet_plus":"'    + FloatToStr(RoundTo(Qry1.FieldByName('weightnet_plus').AsFloat, -3)) + '"';   //��Ʒ���أ��ۼ�
  jsonstr := jsonstr + ',"exec_det_id":"' + inttostr(Qry.FieldByName('exec_det_id').AsInteger) + '"';    //����
  jsonstr := jsonstr + ',"workpiecenum":"' + inttostr(Qry1.FieldByName('workpiecetotalnum').AsInteger) + '"';
  jsonstr := jsonstr + ',"modeman":"'      + Qry.FieldByName('modeman').AsString + '"';
  jsonstr := jsonstr + ',"modedate":"'     + IntToStr(Qry.FieldByName('modedate').AsInteger) + '"';
  jsonstr := jsonstr + ',"pstate":""' ;
  jsonstr := jsonstr + ',"detail":[';

  Qry1.First;
  while not Qry2.Eof do
  begin
    i:=i+1;
    jsonstr := jsonstr + '{';
    jsonstr := jsonstr + '"bill_no": ""';
    jsonstr := jsonstr + ',"exec_qrcode":"' + Qry2.FieldByName('exec_qrcode').AsString + '"';
    jsonstr := jsonstr + ',"print_code":"'  + Qry2.FieldByName('print_code' ).AsString + '"';
    jsonstr := jsonstr + ',"weightbatchs":"' + Inttostr(Qry2.FieldByName('weightbatchs').AsInteger) + '"';
    jsonstr := jsonstr + ',"weightboxcount":"' + Inttostr(Qry2.FieldByName('weightboxcount').AsInteger) + '"';
    jsonstr := jsonstr + ',"Box1TareSet":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box1TareSet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box2TareSet":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box2TareSet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box3TareSet":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box3TareSet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box1TareWeight":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box1TareWeight').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box2TareWeight":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box2TareWeight').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box3TareWeight":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box3TareWeight').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightgross1":"' + FloatToStr(RoundTo(Qry2.FieldByName('weightgross1').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightgross2":"' + FloatToStr(RoundTo(Qry2.FieldByName('weightgross2').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightGross":"'  + FloatToStr(RoundTo(Qry2.FieldByName('weightGross').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightnet":"'    + FloatToStr(RoundTo(Qry2.FieldByName('weightnet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"workpiecenumber":"' + inttostr(Qry2.FieldByName('workpiecenumber').AsInteger) + '"';
    jsonstr := jsonstr + ',"workbox_num":"' + inttostr(Qry2.FieldByName('workbox_num').AsInteger) + '"';
    jsonstr := jsonstr + ',"weight_picture":"' + '"';// Qry2.FieldByName('weight_picture').AsString + '"';
    jsonstr := jsonstr + ',"sample_weight_from":"' + inttostr(Qry2.FieldByName('sample_weight_from').AsInteger) + '"';
    jsonstr := jsonstr + ',"unit_samp_weight":"' + floattostr(Qry2.FieldByName('unit_samp_weight').AsFloat) + '"';
    jsonstr := jsonstr + ',"weight_from":"' + inttostr(Qry2.FieldByName('weight_from').AsInteger) + '"';
    jsonstr := jsonstr + ',"modeman":"'  + Qry2.FieldByName('modeman').AsString + '"';
    jsonstr := jsonstr + ',"modedate":"' + inttostr(Qry2.FieldByName('modedate').AsInteger) + '"';
    jsonstr := jsonstr + ',"usestate":"0"';

    jsonstr := jsonstr + '}';
    Qry2.Next;
    if i<Qry2.RecordCount then
      jsonstr := jsonstr + ',';
  end;

  jsonstr := jsonstr + ']';
  jsonstr := jsonstr + '}';

//  memo1.Lines.Add(jsonstr) ;

  try
    Request:=TStringStream.create(' ',65001);

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    Request := TStringStream.create(jsonstr,65001);
    Response := IdHTTP1.Post(Gv_domain + 'api/outsourcedweight_insert', Request);

    vRet := SO(utf8decode(Response));
    //showmessage(vRet.AsString);
    if Uppercase(vRet['success'].AsString) = 'TRUE' then
    begin
      Result := true;
      Bill_No := vRet['bill_no'].AsString;
      try
        ADOConnection1.BeginTrans;
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Text := 'update t_out_sourced_weight_detail set httpResult=:Result, bill_no=:bill_no where WeightNoteID=:WeightNoteID and weightbatchs=:weightbatchs';
        Qry.Parameters.ParamByName('bill_no'     ).Value := Bill_No;
        Qry.Parameters.ParamByName('Result'      ).Value := '1';
        Qry.Parameters.ParamByName('WeightNoteID').Value := WeightNoteId;
        Qry.Parameters.ParamByName('weightbatchs').Value := WeightBatch;
        Qry.ExecSQL;

        Qry1.Close;
        Qry1.SQL.Clear;
        Qry1.SQL.Text := 'update t_weight_count set httpResult=:Result where weightid=:WeightNoteID and Batch=:weightbatchs';
        Qry1.Parameters.ParamByName('Result'      ).Value := '1';
        Qry1.Parameters.ParamByName('WeightNoteID').Value := WeightNoteId;
        Qry1.Parameters.ParamByName('weightbatchs').Value := WeightBatch;
        Qry1.ExecSQL;

        Qry2.Close;
        Qry2.SQL.Clear;
        Qry2.SQL.Text := 'update t_out_sourced_weight set httpResult=:Result, bill_no=:bill_no where id=:WeightNoteID';
        Qry2.Parameters.ParamByName('bill_no'      ).Value := Bill_No;
        Qry2.Parameters.ParamByName('Result'      ).Value := '1';
        Qry2.Parameters.ParamByName('WeightNoteID').Value := WeightNoteId;
        Qry2.ExecSQL;
        ADOConnection1.CommitTrans;

        Showmessage('�ϴ��ɹ�');
      except
        ADOConnection1.RollbackTrans;
        Showmessage('�����ϴ���־ʧ��');
      end;
    end
    else
    begin
      result := false;
      showmessage('���ݸ�ʽ���ԣ�');
    end;
  except
    result := False;
    showmessage('�ϴ�Mesʧ�ܣ�Զ�̷���������Ӧ');
  end;

  Qry.Free;
  Qry1.Free;
  Qry2.Free;
end;

function TFrmMain.httpUploadWeightNoteUpdate(WeightNoteId : integer; WeightBatch : integer) : Boolean;
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;
  Qry,Qry1,Qry2 : TADOQuery;
  i : integer;
  Bill_No : String;
  out_sourced_name : AnsiString;
begin
  Qry  := TADOQuery.create(nil);
  Qry1 := TADOQuery.create(nil);
  Qry2 := TADOQuery.create(nil);
  Qry.Connection := ADOConnection1;
  Qry1.Connection := ADOConnection1;
  Qry2.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight where id=:WeightNoteId';
  Qry.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
  Qry.Open;
  if Qry.Eof then
  begin
    Showmessage('���ص���Ϣ�����ڣ��ϴ�ʧ��');
    exit;
  end
  else
  begin
    if Qry.FieldByName('exec_det').AsString='' then
    begin
      //Showmessage('��ѡ����');
      if messagebox(FrmMain.Handle,'��⹤��Ϊ�գ������Ƿ�����ύ','����', MB_ICONINFORMATION+MB_OkCancel)<>idok then
      begin
        exit;
      end;
    end;
  end;

  Qry1.Close;
  Qry1.SQL.Clear;
  Qry1.SQL.Text := 'select * from t_weight_count where weightid=:WeightNoteId and Batch=:WeightBatch';
  Qry1.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
  Qry1.Parameters.ParamByName('WeightBatch' ).Value := WeightBatch;
  Qry1.Open;
  if Qry1.Eof then
  begin
    Showmessage('���ش�����Ϣ�����ڣ��ϴ�ʧ��');
    exit;
  end;

  Qry2.Close;
  Qry2.SQL.Clear;
  Qry2.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteID=:WeightNoteId and weightbatchs=:WeightBatch order by Id';
  Qry2.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
  Qry2.Parameters.ParamByName('WeightBatch' ).Value := WeightBatch;
  Qry2.Open;
  if Qry2.Eof then
  begin
    Showmessage('������ϸ�����ڣ��ϴ�ʧ��');
    exit;
  end;

  jsonstr := '{';
  jsonstr := jsonstr + '"bill_no":"' + Qry.FieldByName('bill_no').AsString + '"';                                                     //���ص���
  jsonstr := jsonstr + ',"exec_qrcode":"' + Qry.FieldByName('exec_qrcode').AsString + '"'; //ִ�мƻ�����
  out_sourced_name := ansistring( Qry.FieldByName('out_sourced_name').AsString );
  jsonstr := jsonstr + ',"out_sourced_name":"' + out_sourced_name + '"';
  //jsonstr := jsonstr + ',"out_sourced_name":"' + Qry.FieldByName('out_sourced_name').AsString + '"';  //��Э��������
    {TruckNum := string(HTTPEncode (WriteData.TruckNumber)) ;
    TruckNum := ansistring(WriteData.TruckNumber);
    HttpStr := httpStr + ',' + '"TruckNumber":' + '"' + TruckNum + '"';;TruckNum := string(HTTPEncode (WriteData.TruckNumber)) ; }

  jsonstr := jsonstr + ',"workpiece":"' + Qry.FieldByName('workpiece').AsString + '"';                //��������
  jsonstr := jsonstr + ',"Unit_samp_set_weight":"' + Floattostr(Roundto(Qry.FieldByName('Unit_samp_set_weight').AsFloat, -3)) + '"';   //����������������
  jsonstr := jsonstr + ',"samp_piece_count":"' + inttostr(Qry.FieldByName('samp_piecce_count').AsInteger) + '"';    //�������ع�������
  jsonstr := jsonstr + ',"samp_piece_weight":"' + Floattostr(roundto(Qry.FieldByName('samp_piece_weight').AsFloat, -3)) + '"';    //������������
  jsonstr := jsonstr + ',"unit_samp_weight":"' + FloatToStr(RoundTo(Qry.FieldByName('unit_samp_weight').AsFloat, -3)) + '"';               //����������������
  jsonstr := jsonstr + ',"samp_picture":"' + '"';//Qry.FieldByName('samp_picture').AsString + '"';                   //����ͼƬ�洢·��
  jsonstr := jsonstr + ',"weightgross":"'  + FloatToStr(RoundTo(Qry1.FieldByName('weightgross').AsFloat, -3)) + '"';    //����ë�أ��ۼ�
  jsonstr := jsonstr + ',"weighttare":"'   + FloatToStr(RoundTo(Qry1.FieldByName('weighttare').AsFloat, -3)) + '"';    //������Ƥ�أ��ۼ�
  jsonstr := jsonstr + ',"weightnet_plus":"'    + FloatToStr(RoundTo(Qry1.FieldByName('weightnet_plus').AsFloat, -3)) + '"';   //��Ʒ���أ��ۼ�
  jsonstr := jsonstr + ',"exec_det_id":"' + inttostr(Qry.FieldByName('exec_det_id').AsInteger) + '"';    //����
  jsonstr := jsonstr + ',"workpiecenum":"' + inttostr(Qry1.FieldByName('workpiecetotalnum').AsInteger) + '"';
  jsonstr := jsonstr + ',"modeman":"'      + Qry.FieldByName('modeman').AsString + '"';
  jsonstr := jsonstr + ',"modedate":"'     + IntToStr(Qry.FieldByName('modedate').AsInteger) + '"';
  jsonstr := jsonstr + ',"pstate":""' ;
  jsonstr := jsonstr + ',"detail":[';

  Qry1.First;
  while not Qry2.Eof do
  begin
    i:=i+1;
    jsonstr := jsonstr + '{';
    jsonstr := jsonstr + '"bill_no": "'+ Qry2.FieldByName('bill_no').AsString+'"';
    jsonstr := jsonstr + ',"exec_qrcode":"' + Qry2.FieldByName('exec_qrcode').AsString + '"';
    jsonstr := jsonstr + ',"print_code":"'  + Qry2.FieldByName('print_code' ).AsString + '"';
    jsonstr := jsonstr + ',"weightbatchs":"' + Inttostr(Qry2.FieldByName('weightbatchs').AsInteger) + '"';
    jsonstr := jsonstr + ',"weightboxcount":"' + Inttostr(Qry2.FieldByName('weightboxcount').AsInteger) + '"';
    jsonstr := jsonstr + ',"Box1TareSet":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box1TareSet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box2TareSet":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box2TareSet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box3TareSet":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box3TareSet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box1TareWeight":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box1TareWeight').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box2TareWeight":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box2TareWeight').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"Box3TareWeight":"' + FloatToStr(RoundTo(Qry2.FieldByName('Box3TareWeight').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightgross1":"' + FloatToStr(RoundTo(Qry2.FieldByName('weightgross1').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightgross2":"' + FloatToStr(RoundTo(Qry2.FieldByName('weightgross2').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightGross":"'  + FloatToStr(RoundTo(Qry2.FieldByName('weightGross').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"weightnet":"'    + FloatToStr(RoundTo(Qry2.FieldByName('weightnet').AsFloat, -3)) + '"';
    jsonstr := jsonstr + ',"workpiecenumber":"' + inttostr(Qry2.FieldByName('workpiecenumber').AsInteger) + '"';
    jsonstr := jsonstr + ',"workbox_num":"' + inttostr(Qry2.FieldByName('workbox_num').AsInteger) + '"';
    jsonstr := jsonstr + ',"sample_weight_from":"' + inttostr(Qry2.FieldByName('sample_weight_from').AsInteger) + '"';
    jsonstr := jsonstr + ',"unit_samp_weight":"' + floattostr(Qry2.FieldByName('unit_samp_weight').AsFloat) + '"';
    jsonstr := jsonstr + ',"weight_from":"' + inttostr(Qry2.FieldByName('weight_from').AsInteger) + '"';
    jsonstr := jsonstr + ',"weight_picture":"' + '"';// Qry2.FieldByName('weight_picture').AsString + '"';
    jsonstr := jsonstr + ',"modeman":"'  + Qry2.FieldByName('modeman').AsString + '"';
    jsonstr := jsonstr + ',"modedate":"' + inttostr(Qry2.FieldByName('modedate').AsInteger) + '"';
    jsonstr := jsonstr + ',"usestate":"0"';

    jsonstr := jsonstr + '}';
    Qry2.Next;
    if i<Qry2.RecordCount then
      jsonstr := jsonstr + ',';
  end;

  jsonstr := jsonstr + ']';
  jsonstr := jsonstr + '}';

//  memo1.Lines.Add(jsonstr) ;

  try
    Request:=TStringStream.create(' ',65001);

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    Request := TStringStream.create(jsonstr,65001);
    Response := IdHTTP1.Post(Gv_domain + 'api/outsourcedweight_update', Request);

    vRet := SO(utf8decode(Response));
    //showmessage(vRet.AsString);
    if Uppercase(vRet['success'].AsString) = 'TRUE' then
    begin
      Result := true;
      try
        ADOConnection1.BeginTrans;
        Qry2.Close;
        Qry2.SQL.Clear;
        Qry2.SQL.Text := 'update t_out_sourced_weight_detail set httpResult=1 where WeightNoteID=:WeightNoteId and weightbatchs=:WeightBatch';
        Qry2.Parameters.ParamByName('WeightNoteId').Value := WeightNoteId;
        Qry2.Parameters.ParamByName('WeightBatch' ).Value := WeightBatch;
        Qry2.ExecSQL;
        ADOConnection1.CommitTrans;
        Showmessage('�ϴ��ɹ�');
      except
        ADOConnection1.RollbackTrans;
      end;
    end
    else
    begin
      result := false;
      showmessage('���ݸ�ʽ���ԣ�');
    end;
  except
    result := False;
    showmessage('�ϴ�Mesʧ��');
  end;

  Qry.Free;
  Qry1.Free;
  Qry2.Free;
end;

function TFrmMain.Get_exec_qrcode(exec_qrcode : String; print_code : String; var UpdateValue : RdWeightNote) : Boolean;
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;
  Qry,Qry1,Qry2 : TADOQuery;
  i : integer;
  aSupperArray : TsuperArray;
begin
  jsonstr := '{"exec_qrcode":' + exec_qrcode + '}';

  //Memo1.Lines.Add(jsonstr) ;

  try
    Request:=TStringStream.create(' ',65001);

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    Request := TStringStream.create(jsonstr,65001);
    Response := IdHTTP1.get(Gv_domain + 'api/post_exec_qrcode/' + exec_qrcode + '/' + print_code );
    vRet := SO(utf8decode(Response));
//    if vRet <> nil then
//    begin
//      UpdateValue.workpiece        := vRet['pname']asstring;
//      UpdateValue.out_sourced_name := aSupperArray[i]['cust_name'].AsString;;
//    end
//    else
//    begin
//      result := false;
//      showmessage('���ݸ�ʽ���ԣ�');
//    end;
  except
    result := False;
    showmessage('��ȡִ�е�����Ϣʧ��');
  end;
    //Showmessage(vRet.AsString);
//    aSupperArray := vRet.AsArray;
//    if vRet<>nil then
//    begin
//      if aSupperArray.Length >=0 then
//      begin
//        UpdateValue.out_sourced_name := aSupperArray[i]['cust_name'].AsString;
//        UpdateValue.workpiece        := aSupperArray[i]['pname'].AsString;
//        //showmessage(UpdateValue.out_sourced_name);
//        //showmessage(UpdateValue.workpiece       );
//        Result := true;
//      end
//      else
//      begin
//        result := false;
//        showmessage('���ݸ�ʽ���ԣ�');
//      end;
//    end;
//  except
//    result := False;
//    showmessage('��ȡִ�е�����Ϣʧ��');
//  end;

end;

function TFrmMain.searchBoxNumberExist(BoxNumberStr : String;
   WeightId : Integer; WeightBatch : Integer) : Boolean;
var
  Qry : TADOQuery;
begin
  Qry := TADOQuery.Create(Nil);
  Qry.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight_detail where WeightNoteId=:WeightId and weightbatchs=:weightbatchs and print_code=:BoxNumber';
  Qry.Parameters.ParamByName('WeightId').Value     := WeightId;
  Qry.Parameters.ParamByName('weightbatchs').Value := WeightBatch;
  Qry.Parameters.ParamByName('BoxNumber').Value    := BoxNumberStr;
  Qry.Open;
  if Qry.Eof then
    Result := False
  else
    Result := True;

  Qry.Free;
end;

procedure TFrmMain.getexec_artlist(exec_qrcode : string; var UpdateValue : RdWeightNote ) ;
var
    ResponseStr : String;
    vJson,
    aJson : IsuperObject;
    aSupperArray,
    planarray : TsuperArray;
    i : integer;
begin
  exec_artlist.Items.Clear;
  exec_artlist.Text := '';
  setlength(exec_art_array, 0);

  try

    IdHTTP1.HandleRedirects := true;
    // ������post ���json��ʽ
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    ResponseStr := IdHTTP1.Get(Gv_domain + 'api/getexec_artlist/'+exec_qrcode);
    vJson := So(utf8decode(ResponseStr));

    if vJson['detail']<> nil  then
    begin
      UpdateValue.workpiece := vJson['pname'].AsString;
      UpdateValue.out_sourced_name := vJson['cust_name'].AsString;

      aSupperArray := vJson['detail'].AsArray;
      setlength(exec_art_array, aSupperArray.Length);
      for i:=0 to  aSupperArray.Length-1 do
      begin
        exec_artlist.Items.add(aSupperArray[i]['work_name'].AsString);
        try
          exec_art_array[i].id :=StrtoInt(aSupperArray[i]['id'].AsString);
        except
          exec_art_array[i].id :=StrtoInt('-1');
        end;
        exec_art_array[i].exec_qrcode :=aSupperArray[i]['exec_qrcode'].AsString;
        try
          exec_art_array[i].art_id := StrtoInt(aSupperArray[i]['art_id'].AsString);
        except
          exec_art_array[i].art_id := StrtoInt('-1');
        end;
        try
          exec_art_array[i].work_order := strToint(aSupperArray[i]['work_order'].AsString);
        except
          exec_art_array[i].work_order := strToint('-1');
        end;
        exec_art_array[i].work_name := aSupperArray[i]['work_name'].AsString;
      end;
    end;
  except
    Showmessage('��ȡ������Ϣʧ��');
  end;

  //setlength(exec_art_array, strtoint(exec_artlist.Text));

  //showmessage(inttostr(Low(exec_art_array)) + '-' + inttostr(high(exec_art_array)));
  //for vItem in vJson['detail'] do
  //begin
  //  exec_artlist.Items.add(vItem['work_name'].AsString);
  //  //showMessage(vItem['sex'].AsString);
  //end;
end;

function TFrmMain.RecordExsit(exec_qrcode : String; print_code : integer) : Boolean;
var
  Qry : TADOQuery;
begin
  Qry := TADOQuery.Create(nil);
  Qry.Connection := ADOConnection1;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text := 'select * from t_out_sourced_weight_detail where exec_qrcode=:exec_qrcode and print_code=:print_code';
  Qry.Parameters.ParamByName('exec_qrcode').Value := exec_qrcode;
  Qry.Parameters.ParamByName('print_code' ).Value := print_code;
  Qry.Open;
  if Qry.Eof then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;

  Qry.Free;
end;

procedure TFrmMain.Dsplay_getexec_artlist(exec_qrcode : String; artlist : string);
var
  i : integer;
  UpdateValue : RdWeightNote;
begin
  FrmMain.getexec_artlist(WeightingNote.exec_qrcode, UpdateValue );
  i:= exec_artlist.IndexOf(artlist);
  if (i>=0) and (i<exec_artlist.Items.Count) then
    exec_artlist.ItemIndex := i;
end;

procedure TFrmMain.AuditNumber(ScalNumber : integer; BoxNumber : Integer);
var
  DbID : integer;
  TmpAuditNumber : integer;
begin
  if ScalNumber = 1 then
  begin
    if (BoxNumber=1) then
    begin
      if (Edt_exec_qrcode.text='') or (box1Print_code='') then
      begin
        showmessage('��Ч��ִ�мƻ��Ż����');
        exit;
      end;
    end
    else if (BoxNumber=2) then
    begin
      if (Edt_exec_qrcode.text='') or (box2Print_code='') then
      begin
        showmessage('��Ч��ִ�мƻ��Ż����');
        exit;
      end;
    end
    else
    begin
      Showmessage('��Ч�����');
      exit;
    end;
  end
  else if ScalNumber = 2 then
  begin
    if (BoxNumber=1) then
    begin
      if (Edt_exec_qrcode.text='') or (box1Print_code='') then
      begin
        showmessage('��Ч��ִ�мƻ��Ż����');
        exit;
      end;
    end
    else if (BoxNumber=2) then
    begin
      if (Edt_exec_qrcode.text='') or (box2Print_code='') then
      begin
        showmessage('��Ч��ִ�мƻ��Ż����');
        exit;
      end;
    end
    else
    begin
      Showmessage('��Ч�����');
      exit;
    end;
  end
  else
  begin
    Showmessage('��Ч�ĳƺ�');
    exit;
  end;

  try
    if ScalNumber=1 then
    begin
      if BoxNumber=1 then
        TmpAuditNumber := strtoint(Et_workbox_num11.Text)
      else if BoxNumber=2 then
        TmpAuditNumber := strtoint(Et_workbox_num12.Text)
      else
        showmessage('��Ч�����');
    end
    else if ScalNumber=2 then
    begin
      if BoxNumber=1 then
        TmpAuditNumber := strtoint(Et_workbox_num21.Text)
      else if BoxNumber=2 then
        TmpAuditNumber := strtoint(Et_workbox_num22.Text)
      else
        showmessage('��Ч�����');
    end
    else
      showmessage('��Ч�ĳƺ�');
  except
     showmessage('��������ȷ���������');
  end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'select id from t_out_sourced_weight_detail where exec_qrcode=:exec_qrcode and print_code=:print_code';
  ADOQuery1.Parameters.ParamByName('exec_qrcode').Value := Edt_exec_qrcode.text;
  if BoxNumber = 1 then
    ADOQuery1.Parameters.ParamByName('print_code' ).Value := box1Print_code
  else if BoxNumber = 2 then
    ADOQuery1.Parameters.ParamByName('print_code' ).Value := box2Print_code
  else
    showmessage('��Ч�����');
  ADOQuery1.Open;
  if not ADOQuery1.Eof then
  begin
    try
      ADOConnection1.BeginTrans;
      DbID := ADOQuery1.FieldByName('id').AsInteger;
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Text := 'update t_out_sourced_weight_detail set workbox_num=:workbox_num where id=:Id';
      ADOQuery1.Parameters.ParamByName('workbox_num').Value := TmpAuditNumber;
      ADOQuery1.Parameters.ParamByName('Id'         ).Value := DbID;
      ADOQuery1.ExecSQL;
      ADOConnection1.CommitTrans;
    except
      ADOconnection1.RollbackTrans;
      Showmessage('����д�����ݿ�ʧ��');
    end;
  end
  else
  begin
    Showmessage('δ�ҵ�ƥ������ݼ�¼');
  end;
end;

procedure TFrmMain.HttpGetSysConfig(RequestStr : string);
var
  jsonstr : string;
  Request : TStringStream;
  Response : String;
  vRet: ISuperObject;
  Qry,Qry1,Qry2 : TADOQuery;
  i : integer;
  aSupperArray : TsuperArray;
begin
  try
    // ������post ���json��ʽ
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.Request.Accept := 'text/javascript';
    IdHTTP1.Request.ContentType := 'application/json';
    IdHTTP1.Request.ContentEncoding := 'utf-8';
    IdHTTP1.Request.CharSet := 'utf-8';
    IdHTTP1.HandleRedirects := true;
    IdHTTP1.ReadTimeout := 50000;

    Response := IdHTTP1.get(Gv_domain + 'api/get_sys_config/' + RequestStr );
    vRet := SO(utf8decode(Response));
    aSupperArray := vRet.AsArray;
    if aSupperArray.Length >=1 then
    begin
      if aSupperArray[0]['para1_name'].asinteger=0 then
        InputSampleWeightEnable := false
      else
        InputSampleWeightEnable := true;
      if aSupperArray[0]['para2_name'].asinteger=0 then
        InputWeightEnable       := false
      else
        InputWeightEnable       := true;
    end;
  except
    //result := False;
    showmessage('��ȡϵͳ������Ϣʧ��');
  end;

end;

end.