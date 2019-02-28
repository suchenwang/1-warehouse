unit UnitVar;

interface

uses Windows, HCNetSDK, System.Classes ;

var
  FrmLoginCrt : Boolean;
  FrmUnUpLoadDataCrt : Boolean;
  FrmMesDataCrt      : Boolean;
  FrmAboutCrt        : Boolean;
var
  ApplicationPath : String;

var
  ScaleMscommPort1Open,
  ScaleMscommPort2Open : Boolean;

  ScaleMscommSucess1 : Integer;
  ScaleMscommRecvBuf1 : array[1..1024] of byte;
  ScaleMscommRecvBufwt1,
  ScaleMscommRecvBufRd1 : integer;

  Scale1Value : Double;
  Scale1ValueOld : Double;

  Scale2Value : Double;
  Scale2ValueOld : Double;

  WeightComm2State : Integer;    //����ͨѶ�˿�״̬
Const
  WeightComm2StateIsIdle = 0;    //����ͨѶ�˿�״̬ �� ����
  WeightComm2StateIsSend = 1;    //����ͨѶ�˿�״̬ �� ����
  WeightComm2StateIsReci = 2;    //����ͨѶ�˿�״̬ �� ����

var
  ScaleMscommSucess2 : Integer;
  ScaleMscommRecvBuf2 : array[1..1024] of byte;

  ScaleMscommRecvBufwt2,
  ScaleMscommRecvBufRd2 : integer;
//var
//  WeightMscommTmr2 : Integer;
//var
//  WeightMscommFailure : Integer;

var
  Gv_domain : String;
var
  LoginNm : String;

type
  RdCameraLoginInfo = Record
    CameraIPAddress : string;
    CameraPort : Integer;
    CameraUserName : String;
    CameraPassword : String;
  End;

var
  struDeviceInfo1 : NET_DVR_DEVICEINFO_V30;
  struDeviceInfo2 : NET_DVR_DEVICEINFO_V30;
  m_lUserID : Dword;
  m_2UserID : Dword;
  struPlayInfo1 : NET_DVR_CLIENTINFO;
  struPlayInfo2 : NET_DVR_CLIENTINFO;
  lRealHandle1: Longint;
  lRealHandle2 : Longint;
  pUser1: Pointer;

type
  RdCameraLoginInfo_V30 = Record
    CameraID : Integer;
    UserID : Dword;
    pUser : Pointer;
    lRealHandle : LongInt;
  End;
var
  CameraLoginInfo_V30 : Array[1..6] of RdCameraLoginInfo_V30;
  struDeviceInfo : array[1..6] of NET_DVR_DEVICEINFO_V30;

var
  SavePicturePath,
  PictureExistPath : String;

type
  RdCaturePicture_V30_Info = record
    PictureId : Integer;
    UserId : Dword;
    lRealHandle : LongInt;
  end;

  RdCaturePicture_V30_OutInfo = record
    PictureFileName : String;
  end;

type
  rd_struPlayInfo_v40=record
    lRealHandle : longint;
    struPlayInfo_v40 : NET_DVR_PREVIEWINFO;
  end;
var
  struPlayInfo_v40 : array[1..6] of rd_struPlayInfo_v40;

var
  WaitTime : LongInt;

type
  RdWeightNote=Record
    Id : longInt;
    bill_no : string;   //'���ص���',
    exec_qrcode : string;    // 'ִ�мƻ�����',
    out_sourced_name : string;   //��Э��������
    workpiece : string ;     // '��������',
    Unit_samp_set_weight : double; //'����������������',
    samp_piecce_count : integer;   //'�������ع�������',
    samp_piece_weight : double;    //������������',
    unit_samp_weight : double;     //����������������',
    samp_picture : string;         //����ͼƬ�洢·��
    weightgross : double;          //����ë�أ��ۼ�',
    weighttare  : double;          //����Ƥ�� �ۼ�
    weightnet   : double;          //��Ʒ���أ��ۼ�'
    workpiececount : integer;      //��������
    exec_det_id : integer;         //����ID
    exec_det    : string;          //����
    httpResult  : Integer;
    modeman     : string;
    modedate    : integer;
    //;
    RecordWeightGross : Double;
    RecordWeightGross2 : Double;
    BatchCount : Integer;
    print_code : integer;         //���
    sample_weight_from : integer;
    Box1Tare   : Double;
    Box2Tare   : Double;
  End;

var
  WeightingNote : RdWeightNote;

var
  WeightSetCount : Integer;
  RecordWeightPicture : String;

type
  WeightData = record
    DBID : integer;
    print_code : Integer;
    Box1Tare       : double;
    Box2Tare       : double;
    Box3Tare       : double;
    Box1TareWeight : double;
    Box2TareWeight : double;
    Box3TareWeight : double;
    weightgross1   : double;
    weightgross2   : double;
    weightGross    : double;
    weightnet      : double;
    workpiecenumber: integer;
    workbox_num    : integer;
    weight_picture : string;
    modeman        : string;
    modedate       : integer;
    BoxCount       : Integer;
    weight_from    : integer;    //����������Դ��0���Զ���ȡ��ֵ��1���ֶ�����
    unit_samp_weight:Double;     //�������ص�����������
    sample_weight_from : integer;    //����������Դ 0���Զ���ȡ��ֵ 1���ֶ�����
  end;

type
  exec_art_rd = Record
    id : integer;
    exec_qrcode : string;
    art_id : integer;
    work_order : integer;
    work_name : String;
  End;
var
  exec_art_array : array of exec_art_rd;
var
  WeightMode : integer;
var
  box1Print_code ,
  box2Print_code : string;

var
  InputSampleWeightEnable : Boolean;
  InputWeightEnable       : Boolean;

var
  RecordWeight1,
  RecordWeight2 : Double;

var
  WeightDetailList: TStringList;

implementation



end.