unit HCNetSDK;

interface
uses
{$IFDEF WIN32}
  Windows;
{$ELSE}
  Wintypes, WinProcs;
{$ENDIF}

{///宏定义 }
Const
  NET_DVR_DEV_ADDRESS_MAX_LEN = 129;
Const
  NET_DVR_LOGIN_USERNAME_MAX_LEN = 64;
Const
  NET_DVR_LOGIN_PASSWD_MAX_LEN = 64;
Const
  SERIALNO_LEN = 48;
Const
  STREAM_ID_LEN = 32;

  {//*******************************接口参数结构(begin)*********************************/ }
//NET_DVR_Login_V40 参数结构
type
  NET_DVR_DEVICEINFO_V30 = Record
    sSerialNumber : array[0..SERIALNO_LEN-1] of BYTE;
    byAlarmInPortNum : BYTE     ;
    byAlarmOutPortNum : BYTE     ;
    byDiskNum : BYTE     ;
    byDVRType : BYTE     ;
    byChanNum : BYTE     ;
    byStartChan : BYTE     ;
    byAudioChanNum : BYTE     ;
    byIPChanNum : BYTE     ;
    byZeroChanNum : BYTE     ;
    byMainProto : BYTE     ;
    bySubProto : BYTE     ;
    bySupport : BYTE     ;
    bySupport1 : BYTE     ;
    bySupport2 : BYTE     ;
    wDevType : WORD     ;
    bySupport3 : BYTE     ;
    byMultiStreamProto : BYTE     ;
    byStartDChan : BYTE     ;
    byStartDTalkChan : BYTE     ;
    byHighDChanNum : BYTE     ;
    bySupport4 : BYTE     ;
    byLanguageType : BYTE     ;
    byVoiceInChanNum : BYTE     ;
    byStartVoiceInChanNo : BYTE     ;
    byRes3 : array[0..1] of BYTE     ;
    byMirrorChanNum : BYTE     ;
    wStartMirrorChanNo : WORD     ;
    byRes2 : array[0..1] of BYTE     ;
   End;
  LPNET_DVR_DEVICEINFO_V30 = ^NET_DVR_DEVICEINFO_V30;

type TfLoginResultCallBack = procedure(lUserID : LONG; dwResult : DWORD; lpDeviceInfo : LPNET_DVR_DEVICEINFO_V30; pUser : Pointer) ;stdcall;

type
  NET_DVR_USER_LOGIN_INFO = Record
    //sDeviceAddress : array[0..NET_DVR_DEV_ADDRESS_MAX_LEN-1] of char;
    sDeviceAddress : array of char;
    byRes1 : BYTE ;
    wPort  : WORD ;
    //sUserName : array[0..NET_DVR_LOGIN_USERNAME_MAX_LEN-1] of char;
    //sPassword : array[0..NET_DVR_LOGIN_PASSWD_MAX_LEN-1] of char;
    sUserName : array of char;
    sPassword : array of char;
    cbLoginResult : TfLoginResultCallBack ;
    pUser : Pointer;
    bUseAsynLogin : BOOL;
    byRes2 : array[0..127] of BYTE ;
  End;
  LPNET_DVR_USER_LOGIN_INFO = ^NET_DVR_USER_LOGIN_INFO;

type
  NET_DVR_DEVICEINFO_V40 = record
    struDeviceV30 : LPNET_DVR_DEVICEINFO_V30;
    bySupportLock : BYTE;
    byRetryLoginTime : BYTE;
    byPasswordLevel : BYTE;
    byRes1 : BYTE;
    dwSurplusLockTime : DWORD ;
    byCharEncodeType : BYTE;
    byRes2 : array[0..254] of BYTE;
  end;

  LPNET_DVR_DEVICEINFO_V40 = ^NET_DVR_DEVICEINFO_V40;

  {///软解码预览参数 }
type
  NET_DVR_CLIENTINFO = record
    lChannel: LongInt;
    lLinkMode: LongInt;
    hPlayWnd: HWND;
    sMultiCastIP: PChar;
  end {NET_DVR_CLIENTINFO};
  LPNET_DVR_CLIENTINFO = ^NET_DVR_CLIENTINFO;

  type
  NET_DVR_PREVIEWINFO = Record
    lChannel : LONG;
    dwStreamType : DWORD;
    dwLinkMode : DWORD ;
    hPlayWnd : HWND ;
    bBlocked : BOOL;
    bPassbackRecord : BOOL;
    byPreviewMode : BYTE;
    byStreamID : array[0..STREAM_ID_LEN-1] of BYTE ;
    byProtoType : BYTE;
    byRes1 : BYTE;
    byVideoCodingType : BYTE;
    dwDisplayBufNum : DWORD;
    byRes : array[0..215] of BYTE;
  End;
  LPNET_DVR_PREVIEWINFO = ^NET_DVR_PREVIEWINFO;

{+//*******************************接口参数结构(end)*********************************/ }

{+//*******************************SDK接口函数声明*********************************/ }
  type LPByte = ^Byte;

  function NET_DVR_Init() : BOOLean; stdcall;external 'HCNetSDK.dll' ;
  function NET_DVR_GetLastError() : DWORD; stdcall;external 'HCNetSDK.dll' ;

  //type TfRealDataCallBack_V30 = procedure(lRealHandle: Longint; dwDataType: Longword; pBuffer: LPByte; dwBufSize: Longword; pUser:Pointer);stdcall;
  //type TfLoginResultCallBack = procedure(lUserID : LONG; dwResult : DWORD; lpDeviceInfo : LPNET_DVR_DEVICEINFO_V30; pUser : Pointer) ;stdcall;

  function NET_DVR_Login_V30(sDVRIP: PAnsiChar;
                           wDVRPort: Word;
                           sUserName: PAnsiChar;
                           sPassword: PAnsiChar;
                           lpDeviceInfo: LPNET_DVR_DEVICEINFO_V30):  Longint ;stdcall;external 'HCNetSDK.dll' ;

  function NET_DVR_Login_V40(pLoginInfo : LPNET_DVR_USER_LOGIN_INFO ; lpDeviceInfo : LPNET_DVR_DEVICEINFO_V40) : LONG; stdcall;external 'HCNetSDK.dll' ;

  //function  NET_DVR_RealPlay_V30 ( lUserID: Longint; lpClientInfo: LPNET_DVR_CLIENTINFO; fRealDataCallBack_V30: TfRealDataCallBack_V30; pUser: Pointer; bBlocked: Boolean): Longint;stdcall; external 'HCNetSDK.dll';
  type TfRealDataCallBack_V30 = procedure(lRealHandle: Longint; dwDataType: Longword; pBuffer: LPByte; dwBufSize: Longword; pUser:Pointer);stdcall;
  function  NET_DVR_RealPlay_V30 ( lUserID: Longint; lpClientInfo: LPNET_DVR_CLIENTINFO; fRealDataCallBack_V30: TfRealDataCallBack_V30; pUser: Pointer; bBlocked: Boolean): Longint;stdcall; external 'HCNetSDK.dll';

  type REALDATACALLBACK=procedure(lRealHandle : LONG; dwDataType : DWORD; pBuffer : LPByte; dwBufSize : DWORD; pUser : Pointer);stdcall;
  function NET_DVR_RealPlay_V40( lUserID : LONG; lpPreviewInfo : LPNET_DVR_PREVIEWINFO; fRealDataCallBack_V30 : REALDATACALLBACK; pUser : Pointer) : LOngint;stdcall; external 'HCNetSDK.dll';

  function NET_DVR_SetCapturePictureMode( dwCaptureMode : DWORD) : BOOL;stdcall;external 'HCNetSDK.dll' ;
  function NET_DVR_CapturePicture(lRealHandle: LongInt;
                                sPicFileName: PAnsiChar):  BOOL ;stdcall;external 'HCNetSDK.dll'

implementation

end.
