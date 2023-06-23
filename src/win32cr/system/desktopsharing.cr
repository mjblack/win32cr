require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  DISPID_RDPSRAPI_METHOD_OPEN = 100_u32
  DISPID_RDPSRAPI_METHOD_CLOSE = 101_u32
  DISPID_RDPSRAPI_METHOD_SETSHAREDRECT = 102_u32
  DISPID_RDPSRAPI_METHOD_GETSHAREDRECT = 103_u32
  DISPID_RDPSRAPI_METHOD_VIEWERCONNECT = 104_u32
  DISPID_RDPSRAPI_METHOD_VIEWERDISCONNECT = 105_u32
  DISPID_RDPSRAPI_METHOD_TERMINATE_CONNECTION = 106_u32
  DISPID_RDPSRAPI_METHOD_CREATE_INVITATION = 107_u32
  DISPID_RDPSRAPI_METHOD_REQUEST_CONTROL = 108_u32
  DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_CREATE = 109_u32
  DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_SEND_DATA = 110_u32
  DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_SET_ACCESS = 111_u32
  DISPID_RDPSRAPI_METHOD_PAUSE = 112_u32
  DISPID_RDPSRAPI_METHOD_RESUME = 113_u32
  DISPID_RDPSRAPI_METHOD_SHOW_WINDOW = 114_u32
  DISPID_RDPSRAPI_METHOD_REQUEST_COLOR_DEPTH_CHANGE = 115_u32
  DISPID_RDPSRAPI_METHOD_STARTREVCONNECTLISTENER = 116_u32
  DISPID_RDPSRAPI_METHOD_CONNECTTOCLIENT = 117_u32
  DISPID_RDPSRAPI_METHOD_SET_RENDERING_SURFACE = 118_u32
  DISPID_RDPSRAPI_METHOD_SEND_MOUSE_BUTTON_EVENT = 119_u32
  DISPID_RDPSRAPI_METHOD_SEND_MOUSE_MOVE_EVENT = 120_u32
  DISPID_RDPSRAPI_METHOD_SEND_MOUSE_WHEEL_EVENT = 121_u32
  DISPID_RDPSRAPI_METHOD_SEND_KEYBOARD_EVENT = 122_u32
  DISPID_RDPSRAPI_METHOD_SEND_SYNC_EVENT = 123_u32
  DISPID_RDPSRAPI_METHOD_BEGIN_TOUCH_FRAME = 124_u32
  DISPID_RDPSRAPI_METHOD_ADD_TOUCH_INPUT = 125_u32
  DISPID_RDPSRAPI_METHOD_END_TOUCH_FRAME = 126_u32
  DISPID_RDPSRAPI_METHOD_CONNECTUSINGTRANSPORTSTREAM = 127_u32
  DISPID_RDPSRAPI_METHOD_SENDCONTROLLEVELCHANGERESPONSE = 148_u32
  DISPID_RDPSRAPI_METHOD_GETFRAMEBUFFERBITS = 149_u32
  DISPID_RDPSRAPI_PROP_DISPIDVALUE = 200_u32
  DISPID_RDPSRAPI_PROP_ID = 201_u32
  DISPID_RDPSRAPI_PROP_SESSION_PROPERTIES = 202_u32
  DISPID_RDPSRAPI_PROP_ATTENDEES = 203_u32
  DISPID_RDPSRAPI_PROP_INVITATIONS = 204_u32
  DISPID_RDPSRAPI_PROP_INVITATION = 205_u32
  DISPID_RDPSRAPI_PROP_CHANNELMANAGER = 206_u32
  DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETNAME = 207_u32
  DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETFLAGS = 208_u32
  DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETPRIORITY = 209_u32
  DISPID_RDPSRAPI_PROP_WINDOWID = 210_u32
  DISPID_RDPSRAPI_PROP_APPLICATION = 211_u32
  DISPID_RDPSRAPI_PROP_WINDOWSHARED = 212_u32
  DISPID_RDPSRAPI_PROP_WINDOWNAME = 213_u32
  DISPID_RDPSRAPI_PROP_APPNAME = 214_u32
  DISPID_RDPSRAPI_PROP_APPLICATION_FILTER = 215_u32
  DISPID_RDPSRAPI_PROP_WINDOW_LIST = 216_u32
  DISPID_RDPSRAPI_PROP_APPLICATION_LIST = 217_u32
  DISPID_RDPSRAPI_PROP_APPFILTER_ENABLED = 218_u32
  DISPID_RDPSRAPI_PROP_APPFILTERENABLED = 219_u32
  DISPID_RDPSRAPI_PROP_SHARED = 220_u32
  DISPID_RDPSRAPI_PROP_INVITATIONITEM = 221_u32
  DISPID_RDPSRAPI_PROP_DBG_CLX_CMDLINE = 222_u32
  DISPID_RDPSRAPI_PROP_APPFLAGS = 223_u32
  DISPID_RDPSRAPI_PROP_WNDFLAGS = 224_u32
  DISPID_RDPSRAPI_PROP_PROTOCOL_TYPE = 225_u32
  DISPID_RDPSRAPI_PROP_LOCAL_PORT = 226_u32
  DISPID_RDPSRAPI_PROP_LOCAL_IP = 227_u32
  DISPID_RDPSRAPI_PROP_PEER_PORT = 228_u32
  DISPID_RDPSRAPI_PROP_PEER_IP = 229_u32
  DISPID_RDPSRAPI_PROP_ATTENDEE_FLAGS = 230_u32
  DISPID_RDPSRAPI_PROP_CONINFO = 231_u32
  DISPID_RDPSRAPI_PROP_CONNECTION_STRING = 232_u32
  DISPID_RDPSRAPI_PROP_GROUP_NAME = 233_u32
  DISPID_RDPSRAPI_PROP_PASSWORD = 234_u32
  DISPID_RDPSRAPI_PROP_ATTENDEELIMIT = 235_u32
  DISPID_RDPSRAPI_PROP_REVOKED = 236_u32
  DISPID_RDPSRAPI_PROP_DISCONNECTED_STRING = 237_u32
  DISPID_RDPSRAPI_PROP_USESMARTSIZING = 238_u32
  DISPID_RDPSRAPI_PROP_SESSION_COLORDEPTH = 239_u32
  DISPID_RDPSRAPI_PROP_REASON = 240_u32
  DISPID_RDPSRAPI_PROP_CODE = 241_u32
  DISPID_RDPSRAPI_PROP_CTRL_LEVEL = 242_u32
  DISPID_RDPSRAPI_PROP_REMOTENAME = 243_u32
  DISPID_RDPSRAPI_PROP_COUNT = 244_u32
  DISPID_RDPSRAPI_PROP_FRAMEBUFFER_HEIGHT = 251_u32
  DISPID_RDPSRAPI_PROP_FRAMEBUFFER_WIDTH = 252_u32
  DISPID_RDPSRAPI_PROP_FRAMEBUFFER_BPP = 253_u32
  DISPID_RDPSRAPI_PROP_FRAMEBUFFER = 254_u32
  DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_CONNECTED = 301_u32
  DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_DISCONNECTED = 302_u32
  DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_UPDATE = 303_u32
  DISPID_RDPSRAPI_EVENT_ON_ERROR = 304_u32
  DISPID_RDPSRAPI_EVENT_ON_VIEWER_CONNECTED = 305_u32
  DISPID_RDPSRAPI_EVENT_ON_VIEWER_DISCONNECTED = 306_u32
  DISPID_RDPSRAPI_EVENT_ON_VIEWER_AUTHENTICATED = 307_u32
  DISPID_RDPSRAPI_EVENT_ON_VIEWER_CONNECTFAILED = 308_u32
  DISPID_RDPSRAPI_EVENT_ON_CTRLLEVEL_CHANGE_REQUEST = 309_u32
  DISPID_RDPSRAPI_EVENT_ON_GRAPHICS_STREAM_PAUSED = 310_u32
  DISPID_RDPSRAPI_EVENT_ON_GRAPHICS_STREAM_RESUMED = 311_u32
  DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_JOIN = 312_u32
  DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_LEAVE = 313_u32
  DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_DATARECEIVED = 314_u32
  DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_SENDCOMPLETED = 315_u32
  DISPID_RDPSRAPI_EVENT_ON_APPLICATION_OPEN = 316_u32
  DISPID_RDPSRAPI_EVENT_ON_APPLICATION_CLOSE = 317_u32
  DISPID_RDPSRAPI_EVENT_ON_APPLICATION_UPDATE = 318_u32
  DISPID_RDPSRAPI_EVENT_ON_WINDOW_OPEN = 319_u32
  DISPID_RDPSRAPI_EVENT_ON_WINDOW_CLOSE = 320_u32
  DISPID_RDPSRAPI_EVENT_ON_WINDOW_UPDATE = 321_u32
  DISPID_RDPSRAPI_EVENT_ON_APPFILTER_UPDATE = 322_u32
  DISPID_RDPSRAPI_EVENT_ON_SHARED_RECT_CHANGED = 323_u32
  DISPID_RDPSRAPI_EVENT_ON_FOCUSRELEASED = 324_u32
  DISPID_RDPSRAPI_EVENT_ON_SHARED_DESKTOP_SETTINGS_CHANGED = 325_u32
  DISPID_RDPSRAPI_EVENT_ON_CTRLLEVEL_CHANGE_RESPONSE = 338_u32
  DISPID_RDPAPI_EVENT_ON_BOUNDING_RECT_CHANGED = 340_u32
  DISPID_RDPSRAPI_METHOD_STREAM_ALLOCBUFFER = 421_u32
  DISPID_RDPSRAPI_METHOD_STREAM_FREEBUFFER = 422_u32
  DISPID_RDPSRAPI_METHOD_STREAMSENDDATA = 423_u32
  DISPID_RDPSRAPI_METHOD_STREAMREADDATA = 424_u32
  DISPID_RDPSRAPI_METHOD_STREAMOPEN = 425_u32
  DISPID_RDPSRAPI_METHOD_STREAMCLOSE = 426_u32
  DISPID_RDPSRAPI_PROP_STREAMBUFFER_STORAGE = 555_u32
  DISPID_RDPSRAPI_PROP_STREAMBUFFER_PAYLOADSIZE = 558_u32
  DISPID_RDPSRAPI_PROP_STREAMBUFFER_PAYLOADOFFSET = 559_u32
  DISPID_RDPSRAPI_PROP_STREAMBUFFER_CONTEXT = 560_u32
  DISPID_RDPSRAPI_PROP_STREAMBUFFER_FLAGS = 561_u32
  DISPID_RDPSRAPI_PROP_STREAMBUFFER_STORESIZE = 562_u32
  DISPID_RDPSRAPI_EVENT_ON_STREAM_SENDCOMPLETED = 632_u32
  DISPID_RDPSRAPI_EVENT_ON_STREAM_DATARECEIVED = 633_u32
  DISPID_RDPSRAPI_EVENT_ON_STREAM_CLOSED = 634_u32
  DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_BUTTON_RECEIVED = 700_u32
  DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_MOVE_RECEIVED = 701_u32
  DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_WHEEL_RECEIVED = 702_u32
  CLSID_RDPViewer = LibC::GUID.new(0x32be5ed2_u32, 0x5c86_u16, 0x480f_u16, StaticArray[0xa9_u8, 0x14_u8, 0xf_u8, 0xf8_u8, 0x88_u8, 0x5a_u8, 0x1b_u8, 0x3f_u8])
  CLSID_RDPSRAPISessionProperties = LibC::GUID.new(0xdd7594ff_u32, 0xea2a_u16, 0x4c06_u16, StaticArray[0x8f_u8, 0xdf_u8, 0x13_u8, 0x2d_u8, 0xe4_u8, 0x8b_u8, 0x65_u8, 0x10_u8])
  CLSID_RDPSRAPIInvitationManager = LibC::GUID.new(0x53d9c9db_u32, 0x75ab_u16, 0x4271_u16, StaticArray[0x94_u8, 0x8a_u8, 0x4c_u8, 0x4e_u8, 0xb3_u8, 0x6a_u8, 0x8f_u8, 0x2b_u8])
  CLSID_RDPSRAPIInvitation = LibC::GUID.new(0x49174dc6_u32, 0x731_u16, 0x4b5e_u16, StaticArray[0x8e_u8, 0xe1_u8, 0x83_u8, 0xa6_u8, 0x3d_u8, 0x38_u8, 0x68_u8, 0xfa_u8])
  CLSID_RDPSRAPIAttendeeManager = LibC::GUID.new(0xd7b13a01_u32, 0xf7d4_u16, 0x42a6_u16, StaticArray[0x85_u8, 0x95_u8, 0x12_u8, 0xfc_u8, 0x8c_u8, 0x24_u8, 0xe8_u8, 0x51_u8])
  CLSID_RDPSRAPIAttendee = LibC::GUID.new(0x74f93bb5_u32, 0x755f_u16, 0x488e_u16, StaticArray[0x8a_u8, 0x29_u8, 0x23_u8, 0x90_u8, 0x10_u8, 0x8a_u8, 0xef_u8, 0x55_u8])
  CLSID_RDPSRAPIAttendeeDisconnectInfo = LibC::GUID.new(0xb47d7250_u32, 0x5bdb_u16, 0x405d_u16, StaticArray[0xb4_u8, 0x87_u8, 0xca_u8, 0xad_u8, 0x9c_u8, 0x56_u8, 0xf4_u8, 0xf8_u8])
  CLSID_RDPSRAPIApplicationFilter = LibC::GUID.new(0xe35ace89_u32, 0xc7e8_u16, 0x427e_u16, StaticArray[0xa4_u8, 0xf9_u8, 0xb9_u8, 0xda_u8, 0x7_u8, 0x28_u8, 0x26_u8, 0xbd_u8])
  CLSID_RDPSRAPIApplicationList = LibC::GUID.new(0x9e31c815_u32, 0x7433_u16, 0x4876_u16, StaticArray[0x97_u8, 0xfb_u8, 0xed_u8, 0x59_u8, 0xfe_u8, 0x2b_u8, 0xaa_u8, 0x22_u8])
  CLSID_RDPSRAPIApplication = LibC::GUID.new(0xc116a484_u32, 0x4b25_u16, 0x4b9f_u16, StaticArray[0x8a_u8, 0x54_u8, 0xb9_u8, 0x34_u8, 0xb0_u8, 0x6e_u8, 0x57_u8, 0xfa_u8])
  CLSID_RDPSRAPIWindowList = LibC::GUID.new(0x9c21e2b8_u32, 0x5dd4_u16, 0x42cc_u16, StaticArray[0x81_u8, 0xba_u8, 0x1c_u8, 0x9_u8, 0x98_u8, 0x52_u8, 0xe6_u8, 0xfa_u8])
  CLSID_RDPSRAPIWindow = LibC::GUID.new(0x3cf46db_u32, 0xce45_u16, 0x4d36_u16, StaticArray[0x86_u8, 0xed_u8, 0xed_u8, 0x28_u8, 0xb7_u8, 0x43_u8, 0x98_u8, 0xbf_u8])
  CLSID_RDPSRAPITcpConnectionInfo = LibC::GUID.new(0xbe49db3f_u32, 0xebb6_u16, 0x4278_u16, StaticArray[0x8c_u8, 0xe0_u8, 0xd5_u8, 0x45_u8, 0x58_u8, 0x33_u8, 0xea_u8, 0xee_u8])
  CLSID_RDPSession = LibC::GUID.new(0x9b78f0e6_u32, 0x3e05_u16, 0x4a5b_u16, StaticArray[0xb2_u8, 0xe8_u8, 0xe7_u8, 0x43_u8, 0xa8_u8, 0x95_u8, 0x6b_u8, 0x65_u8])
  CLSID_RDPSRAPIFrameBuffer = LibC::GUID.new(0xa4f66bcc_u32, 0x538e_u16, 0x4101_u16, StaticArray[0x95_u8, 0x1d_u8, 0x30_u8, 0x84_u8, 0x7a_u8, 0xdb_u8, 0x51_u8, 0x1_u8])
  CLSID_RDPTransportStreamBuffer = LibC::GUID.new(0x8d4a1c69_u32, 0xf17f_u16, 0x4549_u16, StaticArray[0xa6_u8, 0x99_u8, 0x76_u8, 0x1c_u8, 0x6e_u8, 0x6b_u8, 0x5c_u8, 0xa_u8])
  CLSID_RDPTransportStreamEvents = LibC::GUID.new(0x31e3ab20_u32, 0x5350_u16, 0x483f_u16, StaticArray[0x9d_u8, 0xc6_u8, 0x67_u8, 0x48_u8, 0x66_u8, 0x5e_u8, 0xfd_u8, 0xeb_u8])


  enum CTRL_LEVEL : Int32
    CTRL_LEVEL_MIN = 0
    CTRL_LEVEL_INVALID = 0
    CTRL_LEVEL_NONE = 1
    CTRL_LEVEL_VIEW = 2
    CTRL_LEVEL_INTERACTIVE = 3
    CTRL_LEVEL_REQCTRL_VIEW = 4
    CTRL_LEVEL_REQCTRL_INTERACTIVE = 5
    CTRL_LEVEL_MAX = 5
  end

  enum ATTENDEE_DISCONNECT_REASON : Int32
    ATTENDEE_DISCONNECT_REASON_MIN = 0
    ATTENDEE_DISCONNECT_REASON_APP = 0
    ATTENDEE_DISCONNECT_REASON_ERR = 1
    ATTENDEE_DISCONNECT_REASON_CLI = 2
    ATTENDEE_DISCONNECT_REASON_MAX = 2
  end

  enum CHANNEL_PRIORITY : Int32
    CHANNEL_PRIORITY_LO = 0
    CHANNEL_PRIORITY_MED = 1
    CHANNEL_PRIORITY_HI = 2
  end

  enum CHANNEL_FLAGS : Int32
    CHANNEL_FLAGS_LEGACY = 1
    CHANNEL_FLAGS_UNCOMPRESSED = 2
    CHANNEL_FLAGS_DYNAMIC = 4
  end

  enum CHANNEL_ACCESS_ENUM : Int32
    CHANNEL_ACCESS_ENUM_NONE = 0
    CHANNEL_ACCESS_ENUM_SENDRECEIVE = 1
  end

  enum RDPENCOMAPI_ATTENDEE_FLAGS : Int32
    ATTENDEE_FLAGS_LOCAL = 1
  end

  enum RDPSRAPI_WND_FLAGS : Int32
    WND_FLAG_PRIVILEGED = 1
  end

  enum RDPSRAPI_APP_FLAGS : Int32
    APP_FLAG_PRIVILEGED = 1
  end

  enum RDPSRAPI_MOUSE_BUTTON_TYPE : Int32
    RDPSRAPI_MOUSE_BUTTON_BUTTON1 = 0
    RDPSRAPI_MOUSE_BUTTON_BUTTON2 = 1
    RDPSRAPI_MOUSE_BUTTON_BUTTON3 = 2
    RDPSRAPI_MOUSE_BUTTON_XBUTTON1 = 3
    RDPSRAPI_MOUSE_BUTTON_XBUTTON2 = 4
    RDPSRAPI_MOUSE_BUTTON_XBUTTON3 = 5
  end

  enum RDPSRAPI_KBD_CODE_TYPE : Int32
    RDPSRAPI_KBD_CODE_SCANCODE = 0
    RDPSRAPI_KBD_CODE_UNICODE = 1
  end

  enum RDPSRAPI_KBD_SYNC_FLAG : Int32
    RDPSRAPI_KBD_SYNC_FLAG_SCROLL_LOCK = 1
    RDPSRAPI_KBD_SYNC_FLAG_NUM_LOCK = 2
    RDPSRAPI_KBD_SYNC_FLAG_CAPS_LOCK = 4
    RDPSRAPI_KBD_SYNC_FLAG_KANA_LOCK = 8
  end

  enum MIDL___MIDL_itf_rdpencomapi_0000_0027_0001 : Int32
    CONST_MAX_CHANNEL_MESSAGE_SIZE = 1024
    CONST_MAX_CHANNEL_NAME_LEN = 8
    CONST_MAX_LEGACY_CHANNEL_MESSAGE_SIZE = 409600
    CONST_ATTENDEE_ID_EVERYONE = -1
    CONST_ATTENDEE_ID_HOST = 0
    CONST_CONN_INTERVAL = 50
    CONST_ATTENDEE_ID_DEFAULT = -1
  end

  struct ReferenceRemainingTypes__
    __ctrl_level__ : CTRL_LEVEL
    __attendee_disconnect_reason__ : ATTENDEE_DISCONNECT_REASON
    __channel_priority__ : CHANNEL_PRIORITY
    __channel_flags__ : CHANNEL_FLAGS
    __channel_access_enum__ : CHANNEL_ACCESS_ENUM
    __rdpencomapi_attendee_flags__ : RDPENCOMAPI_ATTENDEE_FLAGS
    __rdpsrapi_wnd_flags__ : RDPSRAPI_WND_FLAGS
    __rdpsrapi_app_flags__ : RDPSRAPI_APP_FLAGS
  end


  struct IRDPSRAPIDebugVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    put_clx_cmd_line : UInt64
    get_clx_cmd_line : UInt64
  end

  IRDPSRAPIDebug_GUID = "aa1e42b5-496d-4ca4-a690-348dcb2ec4ad"
  IID_IRDPSRAPIDebug = LibC::GUID.new(0xaa1e42b5_u32, 0x496d_u16, 0x4ca4_u16, StaticArray[0xa6_u8, 0x90_u8, 0x34_u8, 0x8d_u8, 0xcb_u8, 0x2e_u8, 0xc4_u8, 0xad_u8])
  struct IRDPSRAPIDebug
    lpVtbl : IRDPSRAPIDebugVTbl*
  end

  struct IRDPSRAPIPerfCounterLoggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    log_value : UInt64
  end

  IRDPSRAPIPerfCounterLogger_GUID = "071c2533-0fa4-4e8f-ae83-9c10b4305ab5"
  IID_IRDPSRAPIPerfCounterLogger = LibC::GUID.new(0x71c2533_u32, 0xfa4_u16, 0x4e8f_u16, StaticArray[0xae_u8, 0x83_u8, 0x9c_u8, 0x10_u8, 0xb4_u8, 0x30_u8, 0x5a_u8, 0xb5_u8])
  struct IRDPSRAPIPerfCounterLogger
    lpVtbl : IRDPSRAPIPerfCounterLoggerVTbl*
  end

  struct IRDPSRAPIPerfCounterLoggingManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_logger : UInt64
  end

  IRDPSRAPIPerfCounterLoggingManager_GUID = "9a512c86-ac6e-4a8e-b1a4-fcef363f6e64"
  IID_IRDPSRAPIPerfCounterLoggingManager = LibC::GUID.new(0x9a512c86_u32, 0xac6e_u16, 0x4a8e_u16, StaticArray[0xb1_u8, 0xa4_u8, 0xfc_u8, 0xef_u8, 0x36_u8, 0x3f_u8, 0x6e_u8, 0x64_u8])
  struct IRDPSRAPIPerfCounterLoggingManager
    lpVtbl : IRDPSRAPIPerfCounterLoggingManagerVTbl*
  end

  struct IRDPSRAPIAudioStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    start : UInt64
    stop : UInt64
    get_buffer : UInt64
    free_buffer : UInt64
  end

  IRDPSRAPIAudioStream_GUID = "e3e30ef9-89c6-4541-ba3b-19336ac6d31c"
  IID_IRDPSRAPIAudioStream = LibC::GUID.new(0xe3e30ef9_u32, 0x89c6_u16, 0x4541_u16, StaticArray[0xba_u8, 0x3b_u8, 0x19_u8, 0x33_u8, 0x6a_u8, 0xc6_u8, 0xd3_u8, 0x1c_u8])
  struct IRDPSRAPIAudioStream
    lpVtbl : IRDPSRAPIAudioStreamVTbl*
  end

  struct IRDPSRAPIClipboardUseEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_paste_from_clipboard : UInt64
  end

  IRDPSRAPIClipboardUseEvents_GUID = "d559f59a-7a27-4138-8763-247ce5f659a8"
  IID_IRDPSRAPIClipboardUseEvents = LibC::GUID.new(0xd559f59a_u32, 0x7a27_u16, 0x4138_u16, StaticArray[0x87_u8, 0x63_u8, 0x24_u8, 0x7c_u8, 0xe5_u8, 0xf6_u8, 0x59_u8, 0xa8_u8])
  struct IRDPSRAPIClipboardUseEvents
    lpVtbl : IRDPSRAPIClipboardUseEventsVTbl*
  end

  struct IRDPSRAPIWindowVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_application : UInt64
    get_shared : UInt64
    put_shared : UInt64
    get_name : UInt64
    show : UInt64
    get_flags : UInt64
  end

  IRDPSRAPIWindow_GUID = "beafe0f9-c77b-4933-ba9f-a24cddcc27cf"
  IID_IRDPSRAPIWindow = LibC::GUID.new(0xbeafe0f9_u32, 0xc77b_u16, 0x4933_u16, StaticArray[0xba_u8, 0x9f_u8, 0xa2_u8, 0x4c_u8, 0xdd_u8, 0xcc_u8, 0x27_u8, 0xcf_u8])
  struct IRDPSRAPIWindow
    lpVtbl : IRDPSRAPIWindowVTbl*
  end

  struct IRDPSRAPIWindowListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
  end

  IRDPSRAPIWindowList_GUID = "8a05ce44-715a-4116-a189-a118f30a07bd"
  IID_IRDPSRAPIWindowList = LibC::GUID.new(0x8a05ce44_u32, 0x715a_u16, 0x4116_u16, StaticArray[0xa1_u8, 0x89_u8, 0xa1_u8, 0x18_u8, 0xf3_u8, 0xa_u8, 0x7_u8, 0xbd_u8])
  struct IRDPSRAPIWindowList
    lpVtbl : IRDPSRAPIWindowListVTbl*
  end

  struct IRDPSRAPIApplicationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_windows : UInt64
    get_id : UInt64
    get_shared : UInt64
    put_shared : UInt64
    get_name : UInt64
    get_flags : UInt64
  end

  IRDPSRAPIApplication_GUID = "41e7a09d-eb7a-436e-935d-780ca2628324"
  IID_IRDPSRAPIApplication = LibC::GUID.new(0x41e7a09d_u32, 0xeb7a_u16, 0x436e_u16, StaticArray[0x93_u8, 0x5d_u8, 0x78_u8, 0xc_u8, 0xa2_u8, 0x62_u8, 0x83_u8, 0x24_u8])
  struct IRDPSRAPIApplication
    lpVtbl : IRDPSRAPIApplicationVTbl*
  end

  struct IRDPSRAPIApplicationListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
  end

  IRDPSRAPIApplicationList_GUID = "d4b4aeb3-22dc-4837-b3b6-42ea2517849a"
  IID_IRDPSRAPIApplicationList = LibC::GUID.new(0xd4b4aeb3_u32, 0x22dc_u16, 0x4837_u16, StaticArray[0xb3_u8, 0xb6_u8, 0x42_u8, 0xea_u8, 0x25_u8, 0x17_u8, 0x84_u8, 0x9a_u8])
  struct IRDPSRAPIApplicationList
    lpVtbl : IRDPSRAPIApplicationListVTbl*
  end

  struct IRDPSRAPIApplicationFilterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_applications : UInt64
    get_windows : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
  end

  IRDPSRAPIApplicationFilter_GUID = "d20f10ca-6637-4f06-b1d5-277ea7e5160d"
  IID_IRDPSRAPIApplicationFilter = LibC::GUID.new(0xd20f10ca_u32, 0x6637_u16, 0x4f06_u16, StaticArray[0xb1_u8, 0xd5_u8, 0x27_u8, 0x7e_u8, 0xa7_u8, 0xe5_u8, 0x16_u8, 0xd_u8])
  struct IRDPSRAPIApplicationFilter
    lpVtbl : IRDPSRAPIApplicationFilterVTbl*
  end

  struct IRDPSRAPISessionPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_property : UInt64
    put_property : UInt64
  end

  IRDPSRAPISessionProperties_GUID = "339b24f2-9bc0-4f16-9aac-f165433d13d4"
  IID_IRDPSRAPISessionProperties = LibC::GUID.new(0x339b24f2_u32, 0x9bc0_u16, 0x4f16_u16, StaticArray[0x9a_u8, 0xac_u8, 0xf1_u8, 0x65_u8, 0x43_u8, 0x3d_u8, 0x13_u8, 0xd4_u8])
  struct IRDPSRAPISessionProperties
    lpVtbl : IRDPSRAPISessionPropertiesVTbl*
  end

  struct IRDPSRAPIInvitationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_connection_string : UInt64
    get_group_name : UInt64
    get_password : UInt64
    get_attendee_limit : UInt64
    put_attendee_limit : UInt64
    get_revoked : UInt64
    put_revoked : UInt64
  end

  IRDPSRAPIInvitation_GUID = "4fac1d43-fc51-45bb-b1b4-2b53aa562fa3"
  IID_IRDPSRAPIInvitation = LibC::GUID.new(0x4fac1d43_u32, 0xfc51_u16, 0x45bb_u16, StaticArray[0xb1_u8, 0xb4_u8, 0x2b_u8, 0x53_u8, 0xaa_u8, 0x56_u8, 0x2f_u8, 0xa3_u8])
  struct IRDPSRAPIInvitation
    lpVtbl : IRDPSRAPIInvitationVTbl*
  end

  struct IRDPSRAPIInvitationManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    create_invitation : UInt64
  end

  IRDPSRAPIInvitationManager_GUID = "4722b049-92c3-4c2d-8a65-f7348f644dcf"
  IID_IRDPSRAPIInvitationManager = LibC::GUID.new(0x4722b049_u32, 0x92c3_u16, 0x4c2d_u16, StaticArray[0x8a_u8, 0x65_u8, 0xf7_u8, 0x34_u8, 0x8f_u8, 0x64_u8, 0x4d_u8, 0xcf_u8])
  struct IRDPSRAPIInvitationManager
    lpVtbl : IRDPSRAPIInvitationManagerVTbl*
  end

  struct IRDPSRAPITcpConnectionInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_protocol : UInt64
    get_local_port : UInt64
    get_local_ip : UInt64
    get_peer_port : UInt64
    get_peer_ip : UInt64
  end

  IRDPSRAPITcpConnectionInfo_GUID = "f74049a4-3d06-4028-8193-0a8c29bc2452"
  IID_IRDPSRAPITcpConnectionInfo = LibC::GUID.new(0xf74049a4_u32, 0x3d06_u16, 0x4028_u16, StaticArray[0x81_u8, 0x93_u8, 0xa_u8, 0x8c_u8, 0x29_u8, 0xbc_u8, 0x24_u8, 0x52_u8])
  struct IRDPSRAPITcpConnectionInfo
    lpVtbl : IRDPSRAPITcpConnectionInfoVTbl*
  end

  struct IRDPSRAPIAttendeeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_remote_name : UInt64
    get_control_level : UInt64
    put_control_level : UInt64
    get_invitation : UInt64
    terminate_connection : UInt64
    get_flags : UInt64
    get_connectivity_info : UInt64
  end

  IRDPSRAPIAttendee_GUID = "ec0671b3-1b78-4b80-a464-9132247543e3"
  IID_IRDPSRAPIAttendee = LibC::GUID.new(0xec0671b3_u32, 0x1b78_u16, 0x4b80_u16, StaticArray[0xa4_u8, 0x64_u8, 0x91_u8, 0x32_u8, 0x24_u8, 0x75_u8, 0x43_u8, 0xe3_u8])
  struct IRDPSRAPIAttendee
    lpVtbl : IRDPSRAPIAttendeeVTbl*
  end

  struct IRDPSRAPIAttendeeManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
  end

  IRDPSRAPIAttendeeManager_GUID = "ba3a37e8-33da-4749-8da0-07fa34da7944"
  IID_IRDPSRAPIAttendeeManager = LibC::GUID.new(0xba3a37e8_u32, 0x33da_u16, 0x4749_u16, StaticArray[0x8d_u8, 0xa0_u8, 0x7_u8, 0xfa_u8, 0x34_u8, 0xda_u8, 0x79_u8, 0x44_u8])
  struct IRDPSRAPIAttendeeManager
    lpVtbl : IRDPSRAPIAttendeeManagerVTbl*
  end

  struct IRDPSRAPIAttendeeDisconnectInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_attendee : UInt64
    get_reason : UInt64
    get_code : UInt64
  end

  IRDPSRAPIAttendeeDisconnectInfo_GUID = "c187689f-447c-44a1-9c14-fffbb3b7ec17"
  IID_IRDPSRAPIAttendeeDisconnectInfo = LibC::GUID.new(0xc187689f_u32, 0x447c_u16, 0x44a1_u16, StaticArray[0x9c_u8, 0x14_u8, 0xff_u8, 0xfb_u8, 0xb3_u8, 0xb7_u8, 0xec_u8, 0x17_u8])
  struct IRDPSRAPIAttendeeDisconnectInfo
    lpVtbl : IRDPSRAPIAttendeeDisconnectInfoVTbl*
  end

  struct IRDPSRAPIVirtualChannelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    send_data : UInt64
    set_access : UInt64
    get_name : UInt64
    get_flags : UInt64
    get_priority : UInt64
  end

  IRDPSRAPIVirtualChannel_GUID = "05e12f95-28b3-4c9a-8780-d0248574a1e0"
  IID_IRDPSRAPIVirtualChannel = LibC::GUID.new(0x5e12f95_u32, 0x28b3_u16, 0x4c9a_u16, StaticArray[0x87_u8, 0x80_u8, 0xd0_u8, 0x24_u8, 0x85_u8, 0x74_u8, 0xa1_u8, 0xe0_u8])
  struct IRDPSRAPIVirtualChannel
    lpVtbl : IRDPSRAPIVirtualChannelVTbl*
  end

  struct IRDPSRAPIVirtualChannelManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    create_virtual_channel : UInt64
  end

  IRDPSRAPIVirtualChannelManager_GUID = "0d11c661-5d0d-4ee4-89df-2166ae1fdfed"
  IID_IRDPSRAPIVirtualChannelManager = LibC::GUID.new(0xd11c661_u32, 0x5d0d_u16, 0x4ee4_u16, StaticArray[0x89_u8, 0xdf_u8, 0x21_u8, 0x66_u8, 0xae_u8, 0x1f_u8, 0xdf_u8, 0xed_u8])
  struct IRDPSRAPIVirtualChannelManager
    lpVtbl : IRDPSRAPIVirtualChannelManagerVTbl*
  end

  struct IRDPSRAPIViewerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    connect : UInt64
    disconnect : UInt64
    get_attendees : UInt64
    get_invitations : UInt64
    get_application_filter : UInt64
    get_virtual_channel_manager : UInt64
    put_smart_sizing : UInt64
    get_smart_sizing : UInt64
    request_control : UInt64
    put_disconnected_text : UInt64
    get_disconnected_text : UInt64
    request_color_depth_change : UInt64
    get_properties : UInt64
    start_reverse_connect_listener : UInt64
  end

  IRDPSRAPIViewer_GUID = "c6bfcd38-8ce9-404d-8ae8-f31d00c65cb5"
  IID_IRDPSRAPIViewer = LibC::GUID.new(0xc6bfcd38_u32, 0x8ce9_u16, 0x404d_u16, StaticArray[0x8a_u8, 0xe8_u8, 0xf3_u8, 0x1d_u8, 0x0_u8, 0xc6_u8, 0x5c_u8, 0xb5_u8])
  struct IRDPSRAPIViewer
    lpVtbl : IRDPSRAPIViewerVTbl*
  end

  struct IRDPViewerInputSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    send_mouse_button_event : UInt64
    send_mouse_move_event : UInt64
    send_mouse_wheel_event : UInt64
    send_keyboard_event : UInt64
    send_sync_event : UInt64
    begin_touch_frame : UInt64
    add_touch_input : UInt64
    end_touch_frame : UInt64
  end

  IRDPViewerInputSink_GUID = "bb590853-a6c5-4a7b-8dd4-76b69eea12d5"
  IID_IRDPViewerInputSink = LibC::GUID.new(0xbb590853_u32, 0xa6c5_u16, 0x4a7b_u16, StaticArray[0x8d_u8, 0xd4_u8, 0x76_u8, 0xb6_u8, 0x9e_u8, 0xea_u8, 0x12_u8, 0xd5_u8])
  struct IRDPViewerInputSink
    lpVtbl : IRDPViewerInputSinkVTbl*
  end

  struct IRDPSRAPIFrameBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_width : UInt64
    get_height : UInt64
    get_bpp : UInt64
    get_frame_buffer_bits : UInt64
  end

  IRDPSRAPIFrameBuffer_GUID = "3d67e7d2-b27b-448e-81b3-c6110ed8b4be"
  IID_IRDPSRAPIFrameBuffer = LibC::GUID.new(0x3d67e7d2_u32, 0xb27b_u16, 0x448e_u16, StaticArray[0x81_u8, 0xb3_u8, 0xc6_u8, 0x11_u8, 0xe_u8, 0xd8_u8, 0xb4_u8, 0xbe_u8])
  struct IRDPSRAPIFrameBuffer
    lpVtbl : IRDPSRAPIFrameBufferVTbl*
  end

  struct IRDPSRAPITransportStreamBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_storage : UInt64
    get_storage_size : UInt64
    get_payload_size : UInt64
    put_payload_size : UInt64
    get_payload_offset : UInt64
    put_payload_offset : UInt64
    get_flags : UInt64
    put_flags : UInt64
    get_context : UInt64
    put_context : UInt64
  end

  IRDPSRAPITransportStreamBuffer_GUID = "81c80290-5085-44b0-b460-f865c39cb4a9"
  IID_IRDPSRAPITransportStreamBuffer = LibC::GUID.new(0x81c80290_u32, 0x5085_u16, 0x44b0_u16, StaticArray[0xb4_u8, 0x60_u8, 0xf8_u8, 0x65_u8, 0xc3_u8, 0x9c_u8, 0xb4_u8, 0xa9_u8])
  struct IRDPSRAPITransportStreamBuffer
    lpVtbl : IRDPSRAPITransportStreamBufferVTbl*
  end

  struct IRDPSRAPITransportStreamEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_write_completed : UInt64
    on_read_completed : UInt64
    on_stream_closed : UInt64
  end

  IRDPSRAPITransportStreamEvents_GUID = "ea81c254-f5af-4e40-982e-3e63bb595276"
  IID_IRDPSRAPITransportStreamEvents = LibC::GUID.new(0xea81c254_u32, 0xf5af_u16, 0x4e40_u16, StaticArray[0x98_u8, 0x2e_u8, 0x3e_u8, 0x63_u8, 0xbb_u8, 0x59_u8, 0x52_u8, 0x76_u8])
  struct IRDPSRAPITransportStreamEvents
    lpVtbl : IRDPSRAPITransportStreamEventsVTbl*
  end

  struct IRDPSRAPITransportStreamVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    alloc_buffer : UInt64
    free_buffer : UInt64
    write_buffer : UInt64
    read_buffer : UInt64
    open : UInt64
    close : UInt64
  end

  IRDPSRAPITransportStream_GUID = "36cfa065-43bb-4ef7-aed7-9b88a5053036"
  IID_IRDPSRAPITransportStream = LibC::GUID.new(0x36cfa065_u32, 0x43bb_u16, 0x4ef7_u16, StaticArray[0xae_u8, 0xd7_u8, 0x9b_u8, 0x88_u8, 0xa5_u8, 0x5_u8, 0x30_u8, 0x36_u8])
  struct IRDPSRAPITransportStream
    lpVtbl : IRDPSRAPITransportStreamVTbl*
  end

  struct IRDPSRAPISharingSessionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    open : UInt64
    close : UInt64
    put_color_depth : UInt64
    get_color_depth : UInt64
    get_properties : UInt64
    get_attendees : UInt64
    get_invitations : UInt64
    get_application_filter : UInt64
    get_virtual_channel_manager : UInt64
    pause : UInt64
    resume : UInt64
    connect_to_client : UInt64
    set_desktop_shared_rect : UInt64
    get_desktop_shared_rect : UInt64
  end

  IRDPSRAPISharingSession_GUID = "eeb20886-e470-4cf6-842b-2739c0ec5cfb"
  IID_IRDPSRAPISharingSession = LibC::GUID.new(0xeeb20886_u32, 0xe470_u16, 0x4cf6_u16, StaticArray[0x84_u8, 0x2b_u8, 0x27_u8, 0x39_u8, 0xc0_u8, 0xec_u8, 0x5c_u8, 0xfb_u8])
  struct IRDPSRAPISharingSession
    lpVtbl : IRDPSRAPISharingSessionVTbl*
  end

  struct IRDPSRAPISharingSession2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    open : UInt64
    close : UInt64
    put_color_depth : UInt64
    get_color_depth : UInt64
    get_properties : UInt64
    get_attendees : UInt64
    get_invitations : UInt64
    get_application_filter : UInt64
    get_virtual_channel_manager : UInt64
    pause : UInt64
    resume : UInt64
    connect_to_client : UInt64
    set_desktop_shared_rect : UInt64
    get_desktop_shared_rect : UInt64
    connect_using_transport_stream : UInt64
    get_frame_buffer : UInt64
    send_control_level_change_response : UInt64
  end

  IRDPSRAPISharingSession2_GUID = "fee4ee57-e3e8-4205-8fb0-8fd1d0675c21"
  IID_IRDPSRAPISharingSession2 = LibC::GUID.new(0xfee4ee57_u32, 0xe3e8_u16, 0x4205_u16, StaticArray[0x8f_u8, 0xb0_u8, 0x8f_u8, 0xd1_u8, 0xd0_u8, 0x67_u8, 0x5c_u8, 0x21_u8])
  struct IRDPSRAPISharingSession2
    lpVtbl : IRDPSRAPISharingSession2VTbl*
  end

  struct IIRDPSessionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IIRDPSessionEvents_GUID = "98a97042-6698-40e9-8efd-b3200990004b"
  IID_IIRDPSessionEvents = LibC::GUID.new(0x98a97042_u32, 0x6698_u16, 0x40e9_u16, StaticArray[0x8e_u8, 0xfd_u8, 0xb3_u8, 0x20_u8, 0x9_u8, 0x90_u8, 0x0_u8, 0x4b_u8])
  struct IIRDPSessionEvents
    lpVtbl : IIRDPSessionEventsVTbl*
  end

end
struct LibWin32::IRDPSRAPIDebug
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def put_clx_cmd_line(clxcmdline : UInt8*) : HRESULT
    @lpVtbl.value.put_clx_cmd_line.unsafe_as(Proc(UInt8*, HRESULT)).call(clxcmdline)
  end
  def get_clx_cmd_line(pclxcmdline : UInt8**) : HRESULT
    @lpVtbl.value.get_clx_cmd_line.unsafe_as(Proc(UInt8**, HRESULT)).call(pclxcmdline)
  end
end
struct LibWin32::IRDPSRAPIPerfCounterLogger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def log_value(lvalue : Int64) : HRESULT
    @lpVtbl.value.log_value.unsafe_as(Proc(Int64, HRESULT)).call(lvalue)
  end
end
struct LibWin32::IRDPSRAPIPerfCounterLoggingManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_logger(bstrcountername : UInt8*, pplogger : IRDPSRAPIPerfCounterLogger*) : HRESULT
    @lpVtbl.value.create_logger.unsafe_as(Proc(UInt8*, IRDPSRAPIPerfCounterLogger*, HRESULT)).call(bstrcountername, pplogger)
  end
end
struct LibWin32::IRDPSRAPIAudioStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(pnperiodinhundrednsintervals : Int64*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(Int64*, HRESULT)).call(pnperiodinhundrednsintervals)
  end
  def start : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(HRESULT)).call
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def get_buffer(ppbdata : UInt8**, pcbdata : UInt32*, ptimestamp : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, UInt32*, UInt64*, HRESULT)).call(ppbdata, pcbdata, ptimestamp)
  end
  def free_buffer : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRDPSRAPIClipboardUseEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_paste_from_clipboard(clipboardformat : UInt32, pattendee : IDispatch, pretval : Int16*) : HRESULT
    @lpVtbl.value.on_paste_from_clipboard.unsafe_as(Proc(UInt32, IDispatch, Int16*, HRESULT)).call(clipboardformat, pattendee, pretval)
  end
end
struct LibWin32::IRDPSRAPIWindow
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_application(papplication : IRDPSRAPIApplication*) : HRESULT
    @lpVtbl.value.get_application.unsafe_as(Proc(IRDPSRAPIApplication*, HRESULT)).call(papplication)
  end
  def get_shared(pretval : Int16*) : HRESULT
    @lpVtbl.value.get_shared.unsafe_as(Proc(Int16*, HRESULT)).call(pretval)
  end
  def put_shared(newval : Int16) : HRESULT
    @lpVtbl.value.put_shared.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_name(pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pretval)
  end
  def show : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(HRESULT)).call
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::IRDPSRAPIWindowList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_item(item : Int32, pwindow : IRDPSRAPIWindow*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IRDPSRAPIWindow*, HRESULT)).call(item, pwindow)
  end
end
struct LibWin32::IRDPSRAPIApplication
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_windows(pwindowlist : IRDPSRAPIWindowList*) : HRESULT
    @lpVtbl.value.get_windows.unsafe_as(Proc(IRDPSRAPIWindowList*, HRESULT)).call(pwindowlist)
  end
  def get_id(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_shared(pretval : Int16*) : HRESULT
    @lpVtbl.value.get_shared.unsafe_as(Proc(Int16*, HRESULT)).call(pretval)
  end
  def put_shared(newval : Int16) : HRESULT
    @lpVtbl.value.put_shared.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
  def get_name(pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pretval)
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::IRDPSRAPIApplicationList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_item(item : Int32, papplication : IRDPSRAPIApplication*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IRDPSRAPIApplication*, HRESULT)).call(item, papplication)
  end
end
struct LibWin32::IRDPSRAPIApplicationFilter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_applications(papplications : IRDPSRAPIApplicationList*) : HRESULT
    @lpVtbl.value.get_applications.unsafe_as(Proc(IRDPSRAPIApplicationList*, HRESULT)).call(papplications)
  end
  def get_windows(pwindows : IRDPSRAPIWindowList*) : HRESULT
    @lpVtbl.value.get_windows.unsafe_as(Proc(IRDPSRAPIWindowList*, HRESULT)).call(pwindows)
  end
  def get_enabled(pretval : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pretval)
  end
  def put_enabled(newval : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
end
struct LibWin32::IRDPSRAPISessionProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_property(propertyname : UInt8*, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(propertyname, pval)
  end
  def put_property(propertyname : UInt8*, newval : VARIANT) : HRESULT
    @lpVtbl.value.put_property.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(propertyname, newval)
  end
end
struct LibWin32::IRDPSRAPIInvitation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_connection_string(pbstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_connection_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrval)
  end
  def get_group_name(pbstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_group_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrval)
  end
  def get_password(pbstrval : UInt8**) : HRESULT
    @lpVtbl.value.get_password.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrval)
  end
  def get_attendee_limit(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_attendee_limit.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def put_attendee_limit(newval : Int32) : HRESULT
    @lpVtbl.value.put_attendee_limit.unsafe_as(Proc(Int32, HRESULT)).call(newval)
  end
  def get_revoked(pretval : Int16*) : HRESULT
    @lpVtbl.value.get_revoked.unsafe_as(Proc(Int16*, HRESULT)).call(pretval)
  end
  def put_revoked(newval : Int16) : HRESULT
    @lpVtbl.value.put_revoked.unsafe_as(Proc(Int16, HRESULT)).call(newval)
  end
end
struct LibWin32::IRDPSRAPIInvitationManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_item(item : VARIANT, ppinvitation : IRDPSRAPIInvitation*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IRDPSRAPIInvitation*, HRESULT)).call(item, ppinvitation)
  end
  def get_count(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def create_invitation(bstrauthstring : UInt8*, bstrgroupname : UInt8*, bstrpassword : UInt8*, attendeelimit : Int32, ppinvitation : IRDPSRAPIInvitation*) : HRESULT
    @lpVtbl.value.create_invitation.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int32, IRDPSRAPIInvitation*, HRESULT)).call(bstrauthstring, bstrgroupname, bstrpassword, attendeelimit, ppinvitation)
  end
end
struct LibWin32::IRDPSRAPITcpConnectionInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_protocol(plprotocol : Int32*) : HRESULT
    @lpVtbl.value.get_protocol.unsafe_as(Proc(Int32*, HRESULT)).call(plprotocol)
  end
  def get_local_port(plport : Int32*) : HRESULT
    @lpVtbl.value.get_local_port.unsafe_as(Proc(Int32*, HRESULT)).call(plport)
  end
  def get_local_ip(pbsrlocalip : UInt8**) : HRESULT
    @lpVtbl.value.get_local_ip.unsafe_as(Proc(UInt8**, HRESULT)).call(pbsrlocalip)
  end
  def get_peer_port(plport : Int32*) : HRESULT
    @lpVtbl.value.get_peer_port.unsafe_as(Proc(Int32*, HRESULT)).call(plport)
  end
  def get_peer_ip(pbstrip : UInt8**) : HRESULT
    @lpVtbl.value.get_peer_ip.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrip)
  end
end
struct LibWin32::IRDPSRAPIAttendee
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : Int32*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Int32*, HRESULT)).call(pid)
  end
  def get_remote_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_control_level(pval : CTRL_LEVEL*) : HRESULT
    @lpVtbl.value.get_control_level.unsafe_as(Proc(CTRL_LEVEL*, HRESULT)).call(pval)
  end
  def put_control_level(pnewval : CTRL_LEVEL) : HRESULT
    @lpVtbl.value.put_control_level.unsafe_as(Proc(CTRL_LEVEL, HRESULT)).call(pnewval)
  end
  def get_invitation(ppval : IRDPSRAPIInvitation*) : HRESULT
    @lpVtbl.value.get_invitation.unsafe_as(Proc(IRDPSRAPIInvitation*, HRESULT)).call(ppval)
  end
  def terminate_connection : HRESULT
    @lpVtbl.value.terminate_connection.unsafe_as(Proc(HRESULT)).call
  end
  def get_flags(plflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Int32*, HRESULT)).call(plflags)
  end
  def get_connectivity_info(ppval : IUnknown*) : HRESULT
    @lpVtbl.value.get_connectivity_info.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppval)
  end
end
struct LibWin32::IRDPSRAPIAttendeeManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_item(id : Int32, ppitem : IRDPSRAPIAttendee*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IRDPSRAPIAttendee*, HRESULT)).call(id, ppitem)
  end
end
struct LibWin32::IRDPSRAPIAttendeeDisconnectInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_attendee(retval : IRDPSRAPIAttendee*) : HRESULT
    @lpVtbl.value.get_attendee.unsafe_as(Proc(IRDPSRAPIAttendee*, HRESULT)).call(retval)
  end
  def get_reason(preason : ATTENDEE_DISCONNECT_REASON*) : HRESULT
    @lpVtbl.value.get_reason.unsafe_as(Proc(ATTENDEE_DISCONNECT_REASON*, HRESULT)).call(preason)
  end
  def get_code(pval : Int32*) : HRESULT
    @lpVtbl.value.get_code.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
end
struct LibWin32::IRDPSRAPIVirtualChannel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def send_data(bstrdata : UInt8*, lattendeeid : Int32, channelsendflags : UInt32) : HRESULT
    @lpVtbl.value.send_data.unsafe_as(Proc(UInt8*, Int32, UInt32, HRESULT)).call(bstrdata, lattendeeid, channelsendflags)
  end
  def set_access(lattendeeid : Int32, accesstype : CHANNEL_ACCESS_ENUM) : HRESULT
    @lpVtbl.value.set_access.unsafe_as(Proc(Int32, CHANNEL_ACCESS_ENUM, HRESULT)).call(lattendeeid, accesstype)
  end
  def get_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_flags(plflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Int32*, HRESULT)).call(plflags)
  end
  def get_priority(ppriority : CHANNEL_PRIORITY*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(CHANNEL_PRIORITY*, HRESULT)).call(ppriority)
  end
end
struct LibWin32::IRDPSRAPIVirtualChannelManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_item(item : VARIANT, pchannel : IRDPSRAPIVirtualChannel*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IRDPSRAPIVirtualChannel*, HRESULT)).call(item, pchannel)
  end
  def create_virtual_channel(bstrchannelname : UInt8*, priority : CHANNEL_PRIORITY, channelflags : UInt32, ppchannel : IRDPSRAPIVirtualChannel*) : HRESULT
    @lpVtbl.value.create_virtual_channel.unsafe_as(Proc(UInt8*, CHANNEL_PRIORITY, UInt32, IRDPSRAPIVirtualChannel*, HRESULT)).call(bstrchannelname, priority, channelflags, ppchannel)
  end
end
struct LibWin32::IRDPSRAPIViewer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connect(bstrconnectionstring : UInt8*, bstrname : UInt8*, bstrpassword : UInt8*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrconnectionstring, bstrname, bstrpassword)
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def get_attendees(ppval : IRDPSRAPIAttendeeManager*) : HRESULT
    @lpVtbl.value.get_attendees.unsafe_as(Proc(IRDPSRAPIAttendeeManager*, HRESULT)).call(ppval)
  end
  def get_invitations(ppval : IRDPSRAPIInvitationManager*) : HRESULT
    @lpVtbl.value.get_invitations.unsafe_as(Proc(IRDPSRAPIInvitationManager*, HRESULT)).call(ppval)
  end
  def get_application_filter(ppval : IRDPSRAPIApplicationFilter*) : HRESULT
    @lpVtbl.value.get_application_filter.unsafe_as(Proc(IRDPSRAPIApplicationFilter*, HRESULT)).call(ppval)
  end
  def get_virtual_channel_manager(ppval : IRDPSRAPIVirtualChannelManager*) : HRESULT
    @lpVtbl.value.get_virtual_channel_manager.unsafe_as(Proc(IRDPSRAPIVirtualChannelManager*, HRESULT)).call(ppval)
  end
  def put_smart_sizing(vbsmartsizing : Int16) : HRESULT
    @lpVtbl.value.put_smart_sizing.unsafe_as(Proc(Int16, HRESULT)).call(vbsmartsizing)
  end
  def get_smart_sizing(pvbsmartsizing : Int16*) : HRESULT
    @lpVtbl.value.get_smart_sizing.unsafe_as(Proc(Int16*, HRESULT)).call(pvbsmartsizing)
  end
  def request_control(ctrllevel : CTRL_LEVEL) : HRESULT
    @lpVtbl.value.request_control.unsafe_as(Proc(CTRL_LEVEL, HRESULT)).call(ctrllevel)
  end
  def put_disconnected_text(bstrdisconnectedtext : UInt8*) : HRESULT
    @lpVtbl.value.put_disconnected_text.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdisconnectedtext)
  end
  def get_disconnected_text(pbstrdisconnectedtext : UInt8**) : HRESULT
    @lpVtbl.value.get_disconnected_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdisconnectedtext)
  end
  def request_color_depth_change(bpp : Int32) : HRESULT
    @lpVtbl.value.request_color_depth_change.unsafe_as(Proc(Int32, HRESULT)).call(bpp)
  end
  def get_properties(ppval : IRDPSRAPISessionProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IRDPSRAPISessionProperties*, HRESULT)).call(ppval)
  end
  def start_reverse_connect_listener(bstrconnectionstring : UInt8*, bstrusername : UInt8*, bstrpassword : UInt8*, pbstrreverseconnectstring : UInt8**) : HRESULT
    @lpVtbl.value.start_reverse_connect_listener.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8**, HRESULT)).call(bstrconnectionstring, bstrusername, bstrpassword, pbstrreverseconnectstring)
  end
end
struct LibWin32::IRDPViewerInputSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def send_mouse_button_event(buttontype : RDPSRAPI_MOUSE_BUTTON_TYPE, vbbuttondown : Int16, xpos : UInt32, ypos : UInt32) : HRESULT
    @lpVtbl.value.send_mouse_button_event.unsafe_as(Proc(RDPSRAPI_MOUSE_BUTTON_TYPE, Int16, UInt32, UInt32, HRESULT)).call(buttontype, vbbuttondown, xpos, ypos)
  end
  def send_mouse_move_event(xpos : UInt32, ypos : UInt32) : HRESULT
    @lpVtbl.value.send_mouse_move_event.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(xpos, ypos)
  end
  def send_mouse_wheel_event(wheelrotation : UInt16) : HRESULT
    @lpVtbl.value.send_mouse_wheel_event.unsafe_as(Proc(UInt16, HRESULT)).call(wheelrotation)
  end
  def send_keyboard_event(codetype : RDPSRAPI_KBD_CODE_TYPE, keycode : UInt16, vbkeyup : Int16, vbrepeat : Int16, vbextended : Int16) : HRESULT
    @lpVtbl.value.send_keyboard_event.unsafe_as(Proc(RDPSRAPI_KBD_CODE_TYPE, UInt16, Int16, Int16, Int16, HRESULT)).call(codetype, keycode, vbkeyup, vbrepeat, vbextended)
  end
  def send_sync_event(syncflags : UInt32) : HRESULT
    @lpVtbl.value.send_sync_event.unsafe_as(Proc(UInt32, HRESULT)).call(syncflags)
  end
  def begin_touch_frame : HRESULT
    @lpVtbl.value.begin_touch_frame.unsafe_as(Proc(HRESULT)).call
  end
  def add_touch_input(contactid : UInt32, event : UInt32, x : Int32, y : Int32) : HRESULT
    @lpVtbl.value.add_touch_input.unsafe_as(Proc(UInt32, UInt32, Int32, Int32, HRESULT)).call(contactid, event, x, y)
  end
  def end_touch_frame : HRESULT
    @lpVtbl.value.end_touch_frame.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRDPSRAPIFrameBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_width(plwidth : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(plwidth)
  end
  def get_height(plheight : Int32*) : HRESULT
    @lpVtbl.value.get_height.unsafe_as(Proc(Int32*, HRESULT)).call(plheight)
  end
  def get_bpp(plbpp : Int32*) : HRESULT
    @lpVtbl.value.get_bpp.unsafe_as(Proc(Int32*, HRESULT)).call(plbpp)
  end
  def get_frame_buffer_bits(x : Int32, y : Int32, width : Int32, heigth : Int32, ppbits : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_frame_buffer_bits.unsafe_as(Proc(Int32, Int32, Int32, Int32, SAFEARRAY**, HRESULT)).call(x, y, width, heigth, ppbits)
  end
end
struct LibWin32::IRDPSRAPITransportStreamBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_storage(ppbstorage : UInt8**) : HRESULT
    @lpVtbl.value.get_storage.unsafe_as(Proc(UInt8**, HRESULT)).call(ppbstorage)
  end
  def get_storage_size(plmaxstore : Int32*) : HRESULT
    @lpVtbl.value.get_storage_size.unsafe_as(Proc(Int32*, HRESULT)).call(plmaxstore)
  end
  def get_payload_size(plretval : Int32*) : HRESULT
    @lpVtbl.value.get_payload_size.unsafe_as(Proc(Int32*, HRESULT)).call(plretval)
  end
  def put_payload_size(lval : Int32) : HRESULT
    @lpVtbl.value.put_payload_size.unsafe_as(Proc(Int32, HRESULT)).call(lval)
  end
  def get_payload_offset(plretval : Int32*) : HRESULT
    @lpVtbl.value.get_payload_offset.unsafe_as(Proc(Int32*, HRESULT)).call(plretval)
  end
  def put_payload_offset(lretval : Int32) : HRESULT
    @lpVtbl.value.put_payload_offset.unsafe_as(Proc(Int32, HRESULT)).call(lretval)
  end
  def get_flags(plflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(Int32*, HRESULT)).call(plflags)
  end
  def put_flags(lflags : Int32) : HRESULT
    @lpVtbl.value.put_flags.unsafe_as(Proc(Int32, HRESULT)).call(lflags)
  end
  def get_context(ppcontext : IUnknown*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppcontext)
  end
  def put_context(pcontext : IUnknown) : HRESULT
    @lpVtbl.value.put_context.unsafe_as(Proc(IUnknown, HRESULT)).call(pcontext)
  end
end
struct LibWin32::IRDPSRAPITransportStreamEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_write_completed(pbuffer : IRDPSRAPITransportStreamBuffer) : Void
    @lpVtbl.value.on_write_completed.unsafe_as(Proc(IRDPSRAPITransportStreamBuffer, Void)).call(pbuffer)
  end
  def on_read_completed(pbuffer : IRDPSRAPITransportStreamBuffer) : Void
    @lpVtbl.value.on_read_completed.unsafe_as(Proc(IRDPSRAPITransportStreamBuffer, Void)).call(pbuffer)
  end
  def on_stream_closed(hrreason : HRESULT) : Void
    @lpVtbl.value.on_stream_closed.unsafe_as(Proc(HRESULT, Void)).call(hrreason)
  end
end
struct LibWin32::IRDPSRAPITransportStream
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def alloc_buffer(maxpayload : Int32, ppbuffer : IRDPSRAPITransportStreamBuffer*) : HRESULT
    @lpVtbl.value.alloc_buffer.unsafe_as(Proc(Int32, IRDPSRAPITransportStreamBuffer*, HRESULT)).call(maxpayload, ppbuffer)
  end
  def free_buffer(pbuffer : IRDPSRAPITransportStreamBuffer) : HRESULT
    @lpVtbl.value.free_buffer.unsafe_as(Proc(IRDPSRAPITransportStreamBuffer, HRESULT)).call(pbuffer)
  end
  def write_buffer(pbuffer : IRDPSRAPITransportStreamBuffer) : HRESULT
    @lpVtbl.value.write_buffer.unsafe_as(Proc(IRDPSRAPITransportStreamBuffer, HRESULT)).call(pbuffer)
  end
  def read_buffer(pbuffer : IRDPSRAPITransportStreamBuffer) : HRESULT
    @lpVtbl.value.read_buffer.unsafe_as(Proc(IRDPSRAPITransportStreamBuffer, HRESULT)).call(pbuffer)
  end
  def open(pcallbacks : IRDPSRAPITransportStreamEvents) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(IRDPSRAPITransportStreamEvents, HRESULT)).call(pcallbacks)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRDPSRAPISharingSession
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def open : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(HRESULT)).call
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def put_color_depth(colordepth : Int32) : HRESULT
    @lpVtbl.value.put_color_depth.unsafe_as(Proc(Int32, HRESULT)).call(colordepth)
  end
  def get_color_depth(pcolordepth : Int32*) : HRESULT
    @lpVtbl.value.get_color_depth.unsafe_as(Proc(Int32*, HRESULT)).call(pcolordepth)
  end
  def get_properties(ppval : IRDPSRAPISessionProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IRDPSRAPISessionProperties*, HRESULT)).call(ppval)
  end
  def get_attendees(ppval : IRDPSRAPIAttendeeManager*) : HRESULT
    @lpVtbl.value.get_attendees.unsafe_as(Proc(IRDPSRAPIAttendeeManager*, HRESULT)).call(ppval)
  end
  def get_invitations(ppval : IRDPSRAPIInvitationManager*) : HRESULT
    @lpVtbl.value.get_invitations.unsafe_as(Proc(IRDPSRAPIInvitationManager*, HRESULT)).call(ppval)
  end
  def get_application_filter(ppval : IRDPSRAPIApplicationFilter*) : HRESULT
    @lpVtbl.value.get_application_filter.unsafe_as(Proc(IRDPSRAPIApplicationFilter*, HRESULT)).call(ppval)
  end
  def get_virtual_channel_manager(ppval : IRDPSRAPIVirtualChannelManager*) : HRESULT
    @lpVtbl.value.get_virtual_channel_manager.unsafe_as(Proc(IRDPSRAPIVirtualChannelManager*, HRESULT)).call(ppval)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def connect_to_client(bstrconnectionstring : UInt8*) : HRESULT
    @lpVtbl.value.connect_to_client.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrconnectionstring)
  end
  def set_desktop_shared_rect(left : Int32, top : Int32, right : Int32, bottom : Int32) : HRESULT
    @lpVtbl.value.set_desktop_shared_rect.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(left, top, right, bottom)
  end
  def get_desktop_shared_rect(pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*) : HRESULT
    @lpVtbl.value.get_desktop_shared_rect.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, HRESULT)).call(pleft, ptop, pright, pbottom)
  end
end
struct LibWin32::IRDPSRAPISharingSession2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def open : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(HRESULT)).call
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def put_color_depth(colordepth : Int32) : HRESULT
    @lpVtbl.value.put_color_depth.unsafe_as(Proc(Int32, HRESULT)).call(colordepth)
  end
  def get_color_depth(pcolordepth : Int32*) : HRESULT
    @lpVtbl.value.get_color_depth.unsafe_as(Proc(Int32*, HRESULT)).call(pcolordepth)
  end
  def get_properties(ppval : IRDPSRAPISessionProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IRDPSRAPISessionProperties*, HRESULT)).call(ppval)
  end
  def get_attendees(ppval : IRDPSRAPIAttendeeManager*) : HRESULT
    @lpVtbl.value.get_attendees.unsafe_as(Proc(IRDPSRAPIAttendeeManager*, HRESULT)).call(ppval)
  end
  def get_invitations(ppval : IRDPSRAPIInvitationManager*) : HRESULT
    @lpVtbl.value.get_invitations.unsafe_as(Proc(IRDPSRAPIInvitationManager*, HRESULT)).call(ppval)
  end
  def get_application_filter(ppval : IRDPSRAPIApplicationFilter*) : HRESULT
    @lpVtbl.value.get_application_filter.unsafe_as(Proc(IRDPSRAPIApplicationFilter*, HRESULT)).call(ppval)
  end
  def get_virtual_channel_manager(ppval : IRDPSRAPIVirtualChannelManager*) : HRESULT
    @lpVtbl.value.get_virtual_channel_manager.unsafe_as(Proc(IRDPSRAPIVirtualChannelManager*, HRESULT)).call(ppval)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def connect_to_client(bstrconnectionstring : UInt8*) : HRESULT
    @lpVtbl.value.connect_to_client.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrconnectionstring)
  end
  def set_desktop_shared_rect(left : Int32, top : Int32, right : Int32, bottom : Int32) : HRESULT
    @lpVtbl.value.set_desktop_shared_rect.unsafe_as(Proc(Int32, Int32, Int32, Int32, HRESULT)).call(left, top, right, bottom)
  end
  def get_desktop_shared_rect(pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*) : HRESULT
    @lpVtbl.value.get_desktop_shared_rect.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, HRESULT)).call(pleft, ptop, pright, pbottom)
  end
  def connect_using_transport_stream(pstream : IRDPSRAPITransportStream, bstrgroup : UInt8*, bstrauthenticatedattendeename : UInt8*) : HRESULT
    @lpVtbl.value.connect_using_transport_stream.unsafe_as(Proc(IRDPSRAPITransportStream, UInt8*, UInt8*, HRESULT)).call(pstream, bstrgroup, bstrauthenticatedattendeename)
  end
  def get_frame_buffer(ppval : IRDPSRAPIFrameBuffer*) : HRESULT
    @lpVtbl.value.get_frame_buffer.unsafe_as(Proc(IRDPSRAPIFrameBuffer*, HRESULT)).call(ppval)
  end
  def send_control_level_change_response(pattendee : IRDPSRAPIAttendee, requestedlevel : CTRL_LEVEL, reasoncode : Int32) : HRESULT
    @lpVtbl.value.send_control_level_change_response.unsafe_as(Proc(IRDPSRAPIAttendee, CTRL_LEVEL, Int32, HRESULT)).call(pattendee, requestedlevel, reasoncode)
  end
end
struct LibWin32::IIRDPSessionEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
