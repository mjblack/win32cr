require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::DesktopSharing
  extend self
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

  enum CTRL_LEVEL
    CTRL_LEVEL_MIN = 0_i32
    CTRL_LEVEL_INVALID = 0_i32
    CTRL_LEVEL_NONE = 1_i32
    CTRL_LEVEL_VIEW = 2_i32
    CTRL_LEVEL_INTERACTIVE = 3_i32
    CTRL_LEVEL_REQCTRL_VIEW = 4_i32
    CTRL_LEVEL_REQCTRL_INTERACTIVE = 5_i32
    CTRL_LEVEL_MAX = 5_i32
  end
  enum ATTENDEE_DISCONNECT_REASON
    ATTENDEE_DISCONNECT_REASON_MIN = 0_i32
    ATTENDEE_DISCONNECT_REASON_APP = 0_i32
    ATTENDEE_DISCONNECT_REASON_ERR = 1_i32
    ATTENDEE_DISCONNECT_REASON_CLI = 2_i32
    ATTENDEE_DISCONNECT_REASON_MAX = 2_i32
  end
  enum CHANNEL_PRIORITY
    CHANNEL_PRIORITY_LO = 0_i32
    CHANNEL_PRIORITY_MED = 1_i32
    CHANNEL_PRIORITY_HI = 2_i32
  end
  enum CHANNEL_FLAGS
    CHANNEL_FLAGS_LEGACY = 1_i32
    CHANNEL_FLAGS_UNCOMPRESSED = 2_i32
    CHANNEL_FLAGS_DYNAMIC = 4_i32
  end
  enum CHANNEL_ACCESS_ENUM
    CHANNEL_ACCESS_ENUM_NONE = 0_i32
    CHANNEL_ACCESS_ENUM_SENDRECEIVE = 1_i32
  end
  enum RDPENCOMAPI_ATTENDEE_FLAGS
    ATTENDEE_FLAGS_LOCAL = 1_i32
  end
  enum RDPSRAPI_WND_FLAGS
    WND_FLAG_PRIVILEGED = 1_i32
  end
  enum RDPSRAPI_APP_FLAGS
    APP_FLAG_PRIVILEGED = 1_i32
  end
  enum RDPSRAPI_MOUSE_BUTTON_TYPE
    RDPSRAPI_MOUSE_BUTTON_BUTTON1 = 0_i32
    RDPSRAPI_MOUSE_BUTTON_BUTTON2 = 1_i32
    RDPSRAPI_MOUSE_BUTTON_BUTTON3 = 2_i32
    RDPSRAPI_MOUSE_BUTTON_XBUTTON1 = 3_i32
    RDPSRAPI_MOUSE_BUTTON_XBUTTON2 = 4_i32
    RDPSRAPI_MOUSE_BUTTON_XBUTTON3 = 5_i32
  end
  enum RDPSRAPI_KBD_CODE_TYPE
    RDPSRAPI_KBD_CODE_SCANCODE = 0_i32
    RDPSRAPI_KBD_CODE_UNICODE = 1_i32
  end
  enum RDPSRAPI_KBD_SYNC_FLAG
    RDPSRAPI_KBD_SYNC_FLAG_SCROLL_LOCK = 1_i32
    RDPSRAPI_KBD_SYNC_FLAG_NUM_LOCK = 2_i32
    RDPSRAPI_KBD_SYNC_FLAG_CAPS_LOCK = 4_i32
    RDPSRAPI_KBD_SYNC_FLAG_KANA_LOCK = 8_i32
  end
  enum RDPENCOMAPI_CONSTANTS
    CONST_MAX_CHANNEL_MESSAGE_SIZE = 1024_i32
    CONST_MAX_CHANNEL_NAME_LEN = 8_i32
    CONST_MAX_LEGACY_CHANNEL_MESSAGE_SIZE = 409600_i32
    CONST_ATTENDEE_ID_EVERYONE = -1_i32
    CONST_ATTENDEE_ID_HOST = 0_i32
    CONST_CONN_INTERVAL = 50_i32
    CONST_ATTENDEE_ID_DEFAULT = -1_i32
  end

  @[Extern]
  struct ReferenceRemainingTypes____
    property __ctrl_level__ : Win32cr::System::DesktopSharing::CTRL_LEVEL
    property __attendee_disconnect_reason__ : Win32cr::System::DesktopSharing::ATTENDEE_DISCONNECT_REASON
    property __channel_priority__ : Win32cr::System::DesktopSharing::CHANNEL_PRIORITY
    property __channel_flags__ : Win32cr::System::DesktopSharing::CHANNEL_FLAGS
    property __channel_access_enum__ : Win32cr::System::DesktopSharing::CHANNEL_ACCESS_ENUM
    property __rdpencomapi_attendee_flags__ : Win32cr::System::DesktopSharing::RDPENCOMAPI_ATTENDEE_FLAGS
    property __rdpsrapi_wnd_flags__ : Win32cr::System::DesktopSharing::RDPSRAPI_WND_FLAGS
    property __rdpsrapi_app_flags__ : Win32cr::System::DesktopSharing::RDPSRAPI_APP_FLAGS
    def initialize(@__ctrl_level__ : Win32cr::System::DesktopSharing::CTRL_LEVEL, @__attendee_disconnect_reason__ : Win32cr::System::DesktopSharing::ATTENDEE_DISCONNECT_REASON, @__channel_priority__ : Win32cr::System::DesktopSharing::CHANNEL_PRIORITY, @__channel_flags__ : Win32cr::System::DesktopSharing::CHANNEL_FLAGS, @__channel_access_enum__ : Win32cr::System::DesktopSharing::CHANNEL_ACCESS_ENUM, @__rdpencomapi_attendee_flags__ : Win32cr::System::DesktopSharing::RDPENCOMAPI_ATTENDEE_FLAGS, @__rdpsrapi_wnd_flags__ : Win32cr::System::DesktopSharing::RDPSRAPI_WND_FLAGS, @__rdpsrapi_app_flags__ : Win32cr::System::DesktopSharing::RDPSRAPI_APP_FLAGS)
    end
  end

  @[Extern]
  record IRDPSRAPIDebugVtbl,
    query_interface : Proc(IRDPSRAPIDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIDebug*, UInt32),
    release : Proc(IRDPSRAPIDebug*, UInt32),
    put_CLXCmdLine : Proc(IRDPSRAPIDebug*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CLXCmdLine : Proc(IRDPSRAPIDebug*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIDebug, lpVtbl : IRDPSRAPIDebugVtbl* do
    GUID = LibC::GUID.new(0xaa1e42b5_u32, 0x496d_u16, 0x4ca4_u16, StaticArray[0xa6_u8, 0x90_u8, 0x34_u8, 0x8d_u8, 0xcb_u8, 0x2e_u8, 0xc4_u8, 0xad_u8])
    def query_interface(this : IRDPSRAPIDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def put_CLXCmdLine(this : IRDPSRAPIDebug*, clx_cmd_line : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CLXCmdLine.call(this, clx_cmd_line)
    end
    def get_CLXCmdLine(this : IRDPSRAPIDebug*, pCLXCmdLine : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CLXCmdLine.call(this, pCLXCmdLine)
    end

  end

  @[Extern]
  record IRDPSRAPIPerfCounterLoggerVtbl,
    query_interface : Proc(IRDPSRAPIPerfCounterLogger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIPerfCounterLogger*, UInt32),
    release : Proc(IRDPSRAPIPerfCounterLogger*, UInt32),
    log_value : Proc(IRDPSRAPIPerfCounterLogger*, Int64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIPerfCounterLogger, lpVtbl : IRDPSRAPIPerfCounterLoggerVtbl* do
    GUID = LibC::GUID.new(0x71c2533_u32, 0xfa4_u16, 0x4e8f_u16, StaticArray[0xae_u8, 0x83_u8, 0x9c_u8, 0x10_u8, 0xb4_u8, 0x30_u8, 0x5a_u8, 0xb5_u8])
    def query_interface(this : IRDPSRAPIPerfCounterLogger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIPerfCounterLogger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIPerfCounterLogger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def log_value(this : IRDPSRAPIPerfCounterLogger*, lValue : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.log_value.call(this, lValue)
    end

  end

  @[Extern]
  record IRDPSRAPIPerfCounterLoggingManagerVtbl,
    query_interface : Proc(IRDPSRAPIPerfCounterLoggingManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIPerfCounterLoggingManager*, UInt32),
    release : Proc(IRDPSRAPIPerfCounterLoggingManager*, UInt32),
    create_logger : Proc(IRDPSRAPIPerfCounterLoggingManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIPerfCounterLoggingManager, lpVtbl : IRDPSRAPIPerfCounterLoggingManagerVtbl* do
    GUID = LibC::GUID.new(0x9a512c86_u32, 0xac6e_u16, 0x4a8e_u16, StaticArray[0xb1_u8, 0xa4_u8, 0xfc_u8, 0xef_u8, 0x36_u8, 0x3f_u8, 0x6e_u8, 0x64_u8])
    def query_interface(this : IRDPSRAPIPerfCounterLoggingManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIPerfCounterLoggingManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIPerfCounterLoggingManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_logger(this : IRDPSRAPIPerfCounterLoggingManager*, bstrCounterName : Win32cr::Foundation::BSTR, ppLogger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_logger.call(this, bstrCounterName, ppLogger)
    end

  end

  @[Extern]
  record IRDPSRAPIAudioStreamVtbl,
    query_interface : Proc(IRDPSRAPIAudioStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIAudioStream*, UInt32),
    release : Proc(IRDPSRAPIAudioStream*, UInt32),
    initialize__ : Proc(IRDPSRAPIAudioStream*, Int64*, Win32cr::Foundation::HRESULT),
    start : Proc(IRDPSRAPIAudioStream*, Win32cr::Foundation::HRESULT),
    stop : Proc(IRDPSRAPIAudioStream*, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(IRDPSRAPIAudioStream*, UInt8**, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IRDPSRAPIAudioStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIAudioStream, lpVtbl : IRDPSRAPIAudioStreamVtbl* do
    GUID = LibC::GUID.new(0xe3e30ef9_u32, 0x89c6_u16, 0x4541_u16, StaticArray[0xba_u8, 0x3b_u8, 0x19_u8, 0x33_u8, 0x6a_u8, 0xc6_u8, 0xd3_u8, 0x1c_u8])
    def query_interface(this : IRDPSRAPIAudioStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIAudioStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIAudioStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IRDPSRAPIAudioStream*, pnPeriodInHundredNsIntervals : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pnPeriodInHundredNsIntervals)
    end
    def start(this : IRDPSRAPIAudioStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this)
    end
    def stop(this : IRDPSRAPIAudioStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def get_buffer(this : IRDPSRAPIAudioStream*, ppbData : UInt8**, pcbData : UInt32*, pTimestamp : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, ppbData, pcbData, pTimestamp)
    end
    def free_buffer(this : IRDPSRAPIAudioStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this)
    end

  end

  @[Extern]
  record IRDPSRAPIClipboardUseEventsVtbl,
    query_interface : Proc(IRDPSRAPIClipboardUseEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIClipboardUseEvents*, UInt32),
    release : Proc(IRDPSRAPIClipboardUseEvents*, UInt32),
    on_paste_from_clipboard : Proc(IRDPSRAPIClipboardUseEvents*, UInt32, Void*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIClipboardUseEvents, lpVtbl : IRDPSRAPIClipboardUseEventsVtbl* do
    GUID = LibC::GUID.new(0xd559f59a_u32, 0x7a27_u16, 0x4138_u16, StaticArray[0x87_u8, 0x63_u8, 0x24_u8, 0x7c_u8, 0xe5_u8, 0xf6_u8, 0x59_u8, 0xa8_u8])
    def query_interface(this : IRDPSRAPIClipboardUseEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIClipboardUseEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIClipboardUseEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_paste_from_clipboard(this : IRDPSRAPIClipboardUseEvents*, clipboardFormat : UInt32, pAttendee : Void*, pRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_paste_from_clipboard.call(this, clipboardFormat, pAttendee, pRetVal)
    end

  end

  @[Extern]
  record IRDPSRAPIWindowVtbl,
    query_interface : Proc(IRDPSRAPIWindow*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIWindow*, UInt32),
    release : Proc(IRDPSRAPIWindow*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIWindow*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIWindow*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIWindow*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIWindow*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IRDPSRAPIWindow*, Int32*, Win32cr::Foundation::HRESULT),
    get_Application : Proc(IRDPSRAPIWindow*, Void**, Win32cr::Foundation::HRESULT),
    get_Shared : Proc(IRDPSRAPIWindow*, Int16*, Win32cr::Foundation::HRESULT),
    put_Shared : Proc(IRDPSRAPIWindow*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRDPSRAPIWindow*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    show : Proc(IRDPSRAPIWindow*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(IRDPSRAPIWindow*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIWindow, lpVtbl : IRDPSRAPIWindowVtbl* do
    GUID = LibC::GUID.new(0xbeafe0f9_u32, 0xc77b_u16, 0x4933_u16, StaticArray[0xba_u8, 0x9f_u8, 0xa2_u8, 0x4c_u8, 0xdd_u8, 0xcc_u8, 0x27_u8, 0xcf_u8])
    def query_interface(this : IRDPSRAPIWindow*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIWindow*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIWindow*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIWindow*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIWindow*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIWindow*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIWindow*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IRDPSRAPIWindow*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pRetVal)
    end
    def get_Application(this : IRDPSRAPIWindow*, pApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Application.call(this, pApplication)
    end
    def get_Shared(this : IRDPSRAPIWindow*, pRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Shared.call(this, pRetVal)
    end
    def put_Shared(this : IRDPSRAPIWindow*, new_val : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Shared.call(this, new_val)
    end
    def get_Name(this : IRDPSRAPIWindow*, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pRetVal)
    end
    def show(this : IRDPSRAPIWindow*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this)
    end
    def get_Flags(this : IRDPSRAPIWindow*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, pdwFlags)
    end

  end

  @[Extern]
  record IRDPSRAPIWindowListVtbl,
    query_interface : Proc(IRDPSRAPIWindowList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIWindowList*, UInt32),
    release : Proc(IRDPSRAPIWindowList*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIWindowList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIWindowList*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIWindowList*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIWindowList*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRDPSRAPIWindowList*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRDPSRAPIWindowList*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIWindowList, lpVtbl : IRDPSRAPIWindowListVtbl* do
    GUID = LibC::GUID.new(0x8a05ce44_u32, 0x715a_u16, 0x4116_u16, StaticArray[0xa1_u8, 0x89_u8, 0xa1_u8, 0x18_u8, 0xf3_u8, 0xa_u8, 0x7_u8, 0xbd_u8])
    def query_interface(this : IRDPSRAPIWindowList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIWindowList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIWindowList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIWindowList*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIWindowList*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIWindowList*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIWindowList*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IRDPSRAPIWindowList*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : IRDPSRAPIWindowList*, item : Int32, pWindow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, item, pWindow)
    end

  end

  @[Extern]
  record IRDPSRAPIApplicationVtbl,
    query_interface : Proc(IRDPSRAPIApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIApplication*, UInt32),
    release : Proc(IRDPSRAPIApplication*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIApplication*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIApplication*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIApplication*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIApplication*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Windows : Proc(IRDPSRAPIApplication*, Void**, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IRDPSRAPIApplication*, Int32*, Win32cr::Foundation::HRESULT),
    get_Shared : Proc(IRDPSRAPIApplication*, Int16*, Win32cr::Foundation::HRESULT),
    put_Shared : Proc(IRDPSRAPIApplication*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRDPSRAPIApplication*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(IRDPSRAPIApplication*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIApplication, lpVtbl : IRDPSRAPIApplicationVtbl* do
    GUID = LibC::GUID.new(0x41e7a09d_u32, 0xeb7a_u16, 0x436e_u16, StaticArray[0x93_u8, 0x5d_u8, 0x78_u8, 0xc_u8, 0xa2_u8, 0x62_u8, 0x83_u8, 0x24_u8])
    def query_interface(this : IRDPSRAPIApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIApplication*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIApplication*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIApplication*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIApplication*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Windows(this : IRDPSRAPIApplication*, pWindowList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Windows.call(this, pWindowList)
    end
    def get_Id(this : IRDPSRAPIApplication*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pRetVal)
    end
    def get_Shared(this : IRDPSRAPIApplication*, pRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Shared.call(this, pRetVal)
    end
    def put_Shared(this : IRDPSRAPIApplication*, new_val : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Shared.call(this, new_val)
    end
    def get_Name(this : IRDPSRAPIApplication*, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pRetVal)
    end
    def get_Flags(this : IRDPSRAPIApplication*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, pdwFlags)
    end

  end

  @[Extern]
  record IRDPSRAPIApplicationListVtbl,
    query_interface : Proc(IRDPSRAPIApplicationList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIApplicationList*, UInt32),
    release : Proc(IRDPSRAPIApplicationList*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIApplicationList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIApplicationList*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIApplicationList*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIApplicationList*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRDPSRAPIApplicationList*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRDPSRAPIApplicationList*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIApplicationList, lpVtbl : IRDPSRAPIApplicationListVtbl* do
    GUID = LibC::GUID.new(0xd4b4aeb3_u32, 0x22dc_u16, 0x4837_u16, StaticArray[0xb3_u8, 0xb6_u8, 0x42_u8, 0xea_u8, 0x25_u8, 0x17_u8, 0x84_u8, 0x9a_u8])
    def query_interface(this : IRDPSRAPIApplicationList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIApplicationList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIApplicationList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIApplicationList*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIApplicationList*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIApplicationList*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIApplicationList*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IRDPSRAPIApplicationList*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : IRDPSRAPIApplicationList*, item : Int32, pApplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, item, pApplication)
    end

  end

  @[Extern]
  record IRDPSRAPIApplicationFilterVtbl,
    query_interface : Proc(IRDPSRAPIApplicationFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIApplicationFilter*, UInt32),
    release : Proc(IRDPSRAPIApplicationFilter*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIApplicationFilter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIApplicationFilter*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIApplicationFilter*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIApplicationFilter*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Applications : Proc(IRDPSRAPIApplicationFilter*, Void**, Win32cr::Foundation::HRESULT),
    get_Windows : Proc(IRDPSRAPIApplicationFilter*, Void**, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IRDPSRAPIApplicationFilter*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IRDPSRAPIApplicationFilter*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIApplicationFilter, lpVtbl : IRDPSRAPIApplicationFilterVtbl* do
    GUID = LibC::GUID.new(0xd20f10ca_u32, 0x6637_u16, 0x4f06_u16, StaticArray[0xb1_u8, 0xd5_u8, 0x27_u8, 0x7e_u8, 0xa7_u8, 0xe5_u8, 0x16_u8, 0xd_u8])
    def query_interface(this : IRDPSRAPIApplicationFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIApplicationFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIApplicationFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIApplicationFilter*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIApplicationFilter*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIApplicationFilter*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIApplicationFilter*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Applications(this : IRDPSRAPIApplicationFilter*, pApplications : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Applications.call(this, pApplications)
    end
    def get_Windows(this : IRDPSRAPIApplicationFilter*, pWindows : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Windows.call(this, pWindows)
    end
    def get_Enabled(this : IRDPSRAPIApplicationFilter*, pRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pRetVal)
    end
    def put_Enabled(this : IRDPSRAPIApplicationFilter*, new_val : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, new_val)
    end

  end

  @[Extern]
  record IRDPSRAPISessionPropertiesVtbl,
    query_interface : Proc(IRDPSRAPISessionProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPISessionProperties*, UInt32),
    release : Proc(IRDPSRAPISessionProperties*, UInt32),
    get_type_info_count : Proc(IRDPSRAPISessionProperties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPISessionProperties*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPISessionProperties*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPISessionProperties*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Property : Proc(IRDPSRAPISessionProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Property : Proc(IRDPSRAPISessionProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPISessionProperties, lpVtbl : IRDPSRAPISessionPropertiesVtbl* do
    GUID = LibC::GUID.new(0x339b24f2_u32, 0x9bc0_u16, 0x4f16_u16, StaticArray[0x9a_u8, 0xac_u8, 0xf1_u8, 0x65_u8, 0x43_u8, 0x3d_u8, 0x13_u8, 0xd4_u8])
    def query_interface(this : IRDPSRAPISessionProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPISessionProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPISessionProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPISessionProperties*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPISessionProperties*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPISessionProperties*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPISessionProperties*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Property(this : IRDPSRAPISessionProperties*, property_name : Win32cr::Foundation::BSTR, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Property.call(this, property_name, pVal)
    end
    def put_Property(this : IRDPSRAPISessionProperties*, property_name : Win32cr::Foundation::BSTR, newVal : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Property.call(this, property_name, newVal)
    end

  end

  @[Extern]
  record IRDPSRAPIInvitationVtbl,
    query_interface : Proc(IRDPSRAPIInvitation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIInvitation*, UInt32),
    release : Proc(IRDPSRAPIInvitation*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIInvitation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIInvitation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIInvitation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIInvitation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ConnectionString : Proc(IRDPSRAPIInvitation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GroupName : Proc(IRDPSRAPIInvitation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Password : Proc(IRDPSRAPIInvitation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AttendeeLimit : Proc(IRDPSRAPIInvitation*, Int32*, Win32cr::Foundation::HRESULT),
    put_AttendeeLimit : Proc(IRDPSRAPIInvitation*, Int32, Win32cr::Foundation::HRESULT),
    get_Revoked : Proc(IRDPSRAPIInvitation*, Int16*, Win32cr::Foundation::HRESULT),
    put_Revoked : Proc(IRDPSRAPIInvitation*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIInvitation, lpVtbl : IRDPSRAPIInvitationVtbl* do
    GUID = LibC::GUID.new(0x4fac1d43_u32, 0xfc51_u16, 0x45bb_u16, StaticArray[0xb1_u8, 0xb4_u8, 0x2b_u8, 0x53_u8, 0xaa_u8, 0x56_u8, 0x2f_u8, 0xa3_u8])
    def query_interface(this : IRDPSRAPIInvitation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIInvitation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIInvitation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIInvitation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIInvitation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIInvitation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIInvitation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ConnectionString(this : IRDPSRAPIInvitation*, pbstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionString.call(this, pbstrVal)
    end
    def get_GroupName(this : IRDPSRAPIInvitation*, pbstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupName.call(this, pbstrVal)
    end
    def get_Password(this : IRDPSRAPIInvitation*, pbstrVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Password.call(this, pbstrVal)
    end
    def get_AttendeeLimit(this : IRDPSRAPIInvitation*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttendeeLimit.call(this, pRetVal)
    end
    def put_AttendeeLimit(this : IRDPSRAPIInvitation*, new_val : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttendeeLimit.call(this, new_val)
    end
    def get_Revoked(this : IRDPSRAPIInvitation*, pRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Revoked.call(this, pRetVal)
    end
    def put_Revoked(this : IRDPSRAPIInvitation*, new_val : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Revoked.call(this, new_val)
    end

  end

  @[Extern]
  record IRDPSRAPIInvitationManagerVtbl,
    query_interface : Proc(IRDPSRAPIInvitationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIInvitationManager*, UInt32),
    release : Proc(IRDPSRAPIInvitationManager*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIInvitationManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIInvitationManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIInvitationManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIInvitationManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRDPSRAPIInvitationManager*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRDPSRAPIInvitationManager*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IRDPSRAPIInvitationManager*, Int32*, Win32cr::Foundation::HRESULT),
    create_invitation : Proc(IRDPSRAPIInvitationManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIInvitationManager, lpVtbl : IRDPSRAPIInvitationManagerVtbl* do
    GUID = LibC::GUID.new(0x4722b049_u32, 0x92c3_u16, 0x4c2d_u16, StaticArray[0x8a_u8, 0x65_u8, 0xf7_u8, 0x34_u8, 0x8f_u8, 0x64_u8, 0x4d_u8, 0xcf_u8])
    def query_interface(this : IRDPSRAPIInvitationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIInvitationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIInvitationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIInvitationManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIInvitationManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIInvitationManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIInvitationManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IRDPSRAPIInvitationManager*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : IRDPSRAPIInvitationManager*, item : Win32cr::System::Com::VARIANT, ppInvitation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, item, ppInvitation)
    end
    def get_Count(this : IRDPSRAPIInvitationManager*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pRetVal)
    end
    def create_invitation(this : IRDPSRAPIInvitationManager*, bstrAuthString : Win32cr::Foundation::BSTR, bstrGroupName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, attendee_limit : Int32, ppInvitation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_invitation.call(this, bstrAuthString, bstrGroupName, bstrPassword, attendee_limit, ppInvitation)
    end

  end

  @[Extern]
  record IRDPSRAPITcpConnectionInfoVtbl,
    query_interface : Proc(IRDPSRAPITcpConnectionInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPITcpConnectionInfo*, UInt32),
    release : Proc(IRDPSRAPITcpConnectionInfo*, UInt32),
    get_type_info_count : Proc(IRDPSRAPITcpConnectionInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPITcpConnectionInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPITcpConnectionInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPITcpConnectionInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Protocol : Proc(IRDPSRAPITcpConnectionInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_LocalPort : Proc(IRDPSRAPITcpConnectionInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_LocalIP : Proc(IRDPSRAPITcpConnectionInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PeerPort : Proc(IRDPSRAPITcpConnectionInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_PeerIP : Proc(IRDPSRAPITcpConnectionInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPITcpConnectionInfo, lpVtbl : IRDPSRAPITcpConnectionInfoVtbl* do
    GUID = LibC::GUID.new(0xf74049a4_u32, 0x3d06_u16, 0x4028_u16, StaticArray[0x81_u8, 0x93_u8, 0xa_u8, 0x8c_u8, 0x29_u8, 0xbc_u8, 0x24_u8, 0x52_u8])
    def query_interface(this : IRDPSRAPITcpConnectionInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPITcpConnectionInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPITcpConnectionInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPITcpConnectionInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPITcpConnectionInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPITcpConnectionInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPITcpConnectionInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Protocol(this : IRDPSRAPITcpConnectionInfo*, plProtocol : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Protocol.call(this, plProtocol)
    end
    def get_LocalPort(this : IRDPSRAPITcpConnectionInfo*, plPort : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalPort.call(this, plPort)
    end
    def get_LocalIP(this : IRDPSRAPITcpConnectionInfo*, pbsrLocalIP : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LocalIP.call(this, pbsrLocalIP)
    end
    def get_PeerPort(this : IRDPSRAPITcpConnectionInfo*, plPort : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PeerPort.call(this, plPort)
    end
    def get_PeerIP(this : IRDPSRAPITcpConnectionInfo*, pbstrIP : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PeerIP.call(this, pbstrIP)
    end

  end

  @[Extern]
  record IRDPSRAPIAttendeeVtbl,
    query_interface : Proc(IRDPSRAPIAttendee*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIAttendee*, UInt32),
    release : Proc(IRDPSRAPIAttendee*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIAttendee*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIAttendee*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIAttendee*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIAttendee*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IRDPSRAPIAttendee*, Int32*, Win32cr::Foundation::HRESULT),
    get_RemoteName : Proc(IRDPSRAPIAttendee*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ControlLevel : Proc(IRDPSRAPIAttendee*, Win32cr::System::DesktopSharing::CTRL_LEVEL*, Win32cr::Foundation::HRESULT),
    put_ControlLevel : Proc(IRDPSRAPIAttendee*, Win32cr::System::DesktopSharing::CTRL_LEVEL, Win32cr::Foundation::HRESULT),
    get_Invitation : Proc(IRDPSRAPIAttendee*, Void**, Win32cr::Foundation::HRESULT),
    terminate_connection : Proc(IRDPSRAPIAttendee*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(IRDPSRAPIAttendee*, Int32*, Win32cr::Foundation::HRESULT),
    get_ConnectivityInfo : Proc(IRDPSRAPIAttendee*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIAttendee, lpVtbl : IRDPSRAPIAttendeeVtbl* do
    GUID = LibC::GUID.new(0xec0671b3_u32, 0x1b78_u16, 0x4b80_u16, StaticArray[0xa4_u8, 0x64_u8, 0x91_u8, 0x32_u8, 0x24_u8, 0x75_u8, 0x43_u8, 0xe3_u8])
    def query_interface(this : IRDPSRAPIAttendee*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIAttendee*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIAttendee*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIAttendee*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIAttendee*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIAttendee*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIAttendee*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IRDPSRAPIAttendee*, pId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def get_RemoteName(this : IRDPSRAPIAttendee*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteName.call(this, pVal)
    end
    def get_ControlLevel(this : IRDPSRAPIAttendee*, pVal : Win32cr::System::DesktopSharing::CTRL_LEVEL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlLevel.call(this, pVal)
    end
    def put_ControlLevel(this : IRDPSRAPIAttendee*, pNewVal : Win32cr::System::DesktopSharing::CTRL_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ControlLevel.call(this, pNewVal)
    end
    def get_Invitation(this : IRDPSRAPIAttendee*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Invitation.call(this, ppVal)
    end
    def terminate_connection(this : IRDPSRAPIAttendee*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate_connection.call(this)
    end
    def get_Flags(this : IRDPSRAPIAttendee*, plFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, plFlags)
    end
    def get_ConnectivityInfo(this : IRDPSRAPIAttendee*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectivityInfo.call(this, ppVal)
    end

  end

  @[Extern]
  record IRDPSRAPIAttendeeManagerVtbl,
    query_interface : Proc(IRDPSRAPIAttendeeManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIAttendeeManager*, UInt32),
    release : Proc(IRDPSRAPIAttendeeManager*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIAttendeeManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIAttendeeManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIAttendeeManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIAttendeeManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRDPSRAPIAttendeeManager*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRDPSRAPIAttendeeManager*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIAttendeeManager, lpVtbl : IRDPSRAPIAttendeeManagerVtbl* do
    GUID = LibC::GUID.new(0xba3a37e8_u32, 0x33da_u16, 0x4749_u16, StaticArray[0x8d_u8, 0xa0_u8, 0x7_u8, 0xfa_u8, 0x34_u8, 0xda_u8, 0x79_u8, 0x44_u8])
    def query_interface(this : IRDPSRAPIAttendeeManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIAttendeeManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIAttendeeManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIAttendeeManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIAttendeeManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIAttendeeManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIAttendeeManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IRDPSRAPIAttendeeManager*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : IRDPSRAPIAttendeeManager*, id : Int32, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, id, ppItem)
    end

  end

  @[Extern]
  record IRDPSRAPIAttendeeDisconnectInfoVtbl,
    query_interface : Proc(IRDPSRAPIAttendeeDisconnectInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIAttendeeDisconnectInfo*, UInt32),
    release : Proc(IRDPSRAPIAttendeeDisconnectInfo*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIAttendeeDisconnectInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIAttendeeDisconnectInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIAttendeeDisconnectInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIAttendeeDisconnectInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Attendee : Proc(IRDPSRAPIAttendeeDisconnectInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_Reason : Proc(IRDPSRAPIAttendeeDisconnectInfo*, Win32cr::System::DesktopSharing::ATTENDEE_DISCONNECT_REASON*, Win32cr::Foundation::HRESULT),
    get_Code : Proc(IRDPSRAPIAttendeeDisconnectInfo*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIAttendeeDisconnectInfo, lpVtbl : IRDPSRAPIAttendeeDisconnectInfoVtbl* do
    GUID = LibC::GUID.new(0xc187689f_u32, 0x447c_u16, 0x44a1_u16, StaticArray[0x9c_u8, 0x14_u8, 0xff_u8, 0xfb_u8, 0xb3_u8, 0xb7_u8, 0xec_u8, 0x17_u8])
    def query_interface(this : IRDPSRAPIAttendeeDisconnectInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIAttendeeDisconnectInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIAttendeeDisconnectInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIAttendeeDisconnectInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIAttendeeDisconnectInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIAttendeeDisconnectInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIAttendeeDisconnectInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Attendee(this : IRDPSRAPIAttendeeDisconnectInfo*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attendee.call(this, retval)
    end
    def get_Reason(this : IRDPSRAPIAttendeeDisconnectInfo*, pReason : Win32cr::System::DesktopSharing::ATTENDEE_DISCONNECT_REASON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Reason.call(this, pReason)
    end
    def get_Code(this : IRDPSRAPIAttendeeDisconnectInfo*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Code.call(this, pVal)
    end

  end

  @[Extern]
  record IRDPSRAPIVirtualChannelVtbl,
    query_interface : Proc(IRDPSRAPIVirtualChannel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIVirtualChannel*, UInt32),
    release : Proc(IRDPSRAPIVirtualChannel*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIVirtualChannel*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIVirtualChannel*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIVirtualChannel*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIVirtualChannel*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    send_data : Proc(IRDPSRAPIVirtualChannel*, Win32cr::Foundation::BSTR, Int32, UInt32, Win32cr::Foundation::HRESULT),
    set_access : Proc(IRDPSRAPIVirtualChannel*, Int32, Win32cr::System::DesktopSharing::CHANNEL_ACCESS_ENUM, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRDPSRAPIVirtualChannel*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(IRDPSRAPIVirtualChannel*, Int32*, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IRDPSRAPIVirtualChannel*, Win32cr::System::DesktopSharing::CHANNEL_PRIORITY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIVirtualChannel, lpVtbl : IRDPSRAPIVirtualChannelVtbl* do
    GUID = LibC::GUID.new(0x5e12f95_u32, 0x28b3_u16, 0x4c9a_u16, StaticArray[0x87_u8, 0x80_u8, 0xd0_u8, 0x24_u8, 0x85_u8, 0x74_u8, 0xa1_u8, 0xe0_u8])
    def query_interface(this : IRDPSRAPIVirtualChannel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIVirtualChannel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIVirtualChannel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIVirtualChannel*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIVirtualChannel*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIVirtualChannel*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIVirtualChannel*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def send_data(this : IRDPSRAPIVirtualChannel*, bstrData : Win32cr::Foundation::BSTR, lAttendeeId : Int32, channel_send_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_data.call(this, bstrData, lAttendeeId, channel_send_flags)
    end
    def set_access(this : IRDPSRAPIVirtualChannel*, lAttendeeId : Int32, access_type : Win32cr::System::DesktopSharing::CHANNEL_ACCESS_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_access.call(this, lAttendeeId, access_type)
    end
    def get_Name(this : IRDPSRAPIVirtualChannel*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_Flags(this : IRDPSRAPIVirtualChannel*, plFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, plFlags)
    end
    def get_Priority(this : IRDPSRAPIVirtualChannel*, pPriority : Win32cr::System::DesktopSharing::CHANNEL_PRIORITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end

  end

  @[Extern]
  record IRDPSRAPIVirtualChannelManagerVtbl,
    query_interface : Proc(IRDPSRAPIVirtualChannelManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIVirtualChannelManager*, UInt32),
    release : Proc(IRDPSRAPIVirtualChannelManager*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIVirtualChannelManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIVirtualChannelManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIVirtualChannelManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIVirtualChannelManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRDPSRAPIVirtualChannelManager*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRDPSRAPIVirtualChannelManager*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_virtual_channel : Proc(IRDPSRAPIVirtualChannelManager*, Win32cr::Foundation::BSTR, Win32cr::System::DesktopSharing::CHANNEL_PRIORITY, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIVirtualChannelManager, lpVtbl : IRDPSRAPIVirtualChannelManagerVtbl* do
    GUID = LibC::GUID.new(0xd11c661_u32, 0x5d0d_u16, 0x4ee4_u16, StaticArray[0x89_u8, 0xdf_u8, 0x21_u8, 0x66_u8, 0xae_u8, 0x1f_u8, 0xdf_u8, 0xed_u8])
    def query_interface(this : IRDPSRAPIVirtualChannelManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIVirtualChannelManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIVirtualChannelManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIVirtualChannelManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIVirtualChannelManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIVirtualChannelManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIVirtualChannelManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IRDPSRAPIVirtualChannelManager*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Item(this : IRDPSRAPIVirtualChannelManager*, item : Win32cr::System::Com::VARIANT, pChannel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, item, pChannel)
    end
    def create_virtual_channel(this : IRDPSRAPIVirtualChannelManager*, bstrChannelName : Win32cr::Foundation::BSTR, priority : Win32cr::System::DesktopSharing::CHANNEL_PRIORITY, channel_flags : UInt32, ppChannel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_channel.call(this, bstrChannelName, priority, channel_flags, ppChannel)
    end

  end

  @[Extern]
  record IRDPSRAPIViewerVtbl,
    query_interface : Proc(IRDPSRAPIViewer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIViewer*, UInt32),
    release : Proc(IRDPSRAPIViewer*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIViewer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIViewer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIViewer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIViewer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    connect : Proc(IRDPSRAPIViewer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IRDPSRAPIViewer*, Win32cr::Foundation::HRESULT),
    get_Attendees : Proc(IRDPSRAPIViewer*, Void**, Win32cr::Foundation::HRESULT),
    get_Invitations : Proc(IRDPSRAPIViewer*, Void**, Win32cr::Foundation::HRESULT),
    get_ApplicationFilter : Proc(IRDPSRAPIViewer*, Void**, Win32cr::Foundation::HRESULT),
    get_VirtualChannelManager : Proc(IRDPSRAPIViewer*, Void**, Win32cr::Foundation::HRESULT),
    put_SmartSizing : Proc(IRDPSRAPIViewer*, Int16, Win32cr::Foundation::HRESULT),
    get_SmartSizing : Proc(IRDPSRAPIViewer*, Int16*, Win32cr::Foundation::HRESULT),
    request_control : Proc(IRDPSRAPIViewer*, Win32cr::System::DesktopSharing::CTRL_LEVEL, Win32cr::Foundation::HRESULT),
    put_DisconnectedText : Proc(IRDPSRAPIViewer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DisconnectedText : Proc(IRDPSRAPIViewer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    request_color_depth_change : Proc(IRDPSRAPIViewer*, Int32, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IRDPSRAPIViewer*, Void**, Win32cr::Foundation::HRESULT),
    start_reverse_connect_listener : Proc(IRDPSRAPIViewer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIViewer, lpVtbl : IRDPSRAPIViewerVtbl* do
    GUID = LibC::GUID.new(0xc6bfcd38_u32, 0x8ce9_u16, 0x404d_u16, StaticArray[0x8a_u8, 0xe8_u8, 0xf3_u8, 0x1d_u8, 0x0_u8, 0xc6_u8, 0x5c_u8, 0xb5_u8])
    def query_interface(this : IRDPSRAPIViewer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIViewer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIViewer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIViewer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIViewer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIViewer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIViewer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def connect(this : IRDPSRAPIViewer*, bstrConnectionString : Win32cr::Foundation::BSTR, bstrName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, bstrConnectionString, bstrName, bstrPassword)
    end
    def disconnect(this : IRDPSRAPIViewer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def get_Attendees(this : IRDPSRAPIViewer*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attendees.call(this, ppVal)
    end
    def get_Invitations(this : IRDPSRAPIViewer*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Invitations.call(this, ppVal)
    end
    def get_ApplicationFilter(this : IRDPSRAPIViewer*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationFilter.call(this, ppVal)
    end
    def get_VirtualChannelManager(this : IRDPSRAPIViewer*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VirtualChannelManager.call(this, ppVal)
    end
    def put_SmartSizing(this : IRDPSRAPIViewer*, vbSmartSizing : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SmartSizing.call(this, vbSmartSizing)
    end
    def get_SmartSizing(this : IRDPSRAPIViewer*, pvbSmartSizing : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SmartSizing.call(this, pvbSmartSizing)
    end
    def request_control(this : IRDPSRAPIViewer*, ctrl_level : Win32cr::System::DesktopSharing::CTRL_LEVEL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_control.call(this, ctrl_level)
    end
    def put_DisconnectedText(this : IRDPSRAPIViewer*, bstrDisconnectedText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisconnectedText.call(this, bstrDisconnectedText)
    end
    def get_DisconnectedText(this : IRDPSRAPIViewer*, pbstrDisconnectedText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisconnectedText.call(this, pbstrDisconnectedText)
    end
    def request_color_depth_change(this : IRDPSRAPIViewer*, bpp : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_color_depth_change.call(this, bpp)
    end
    def get_Properties(this : IRDPSRAPIViewer*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppVal)
    end
    def start_reverse_connect_listener(this : IRDPSRAPIViewer*, bstrConnectionString : Win32cr::Foundation::BSTR, bstrUserName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, pbstrReverseConnectString : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_reverse_connect_listener.call(this, bstrConnectionString, bstrUserName, bstrPassword, pbstrReverseConnectString)
    end

  end

  @[Extern]
  record IRDPViewerInputSinkVtbl,
    query_interface : Proc(IRDPViewerInputSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPViewerInputSink*, UInt32),
    release : Proc(IRDPViewerInputSink*, UInt32),
    send_mouse_button_event : Proc(IRDPViewerInputSink*, Win32cr::System::DesktopSharing::RDPSRAPI_MOUSE_BUTTON_TYPE, Int16, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    send_mouse_move_event : Proc(IRDPViewerInputSink*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    send_mouse_wheel_event : Proc(IRDPViewerInputSink*, UInt16, Win32cr::Foundation::HRESULT),
    send_keyboard_event : Proc(IRDPViewerInputSink*, Win32cr::System::DesktopSharing::RDPSRAPI_KBD_CODE_TYPE, UInt16, Int16, Int16, Int16, Win32cr::Foundation::HRESULT),
    send_sync_event : Proc(IRDPViewerInputSink*, UInt32, Win32cr::Foundation::HRESULT),
    begin_touch_frame : Proc(IRDPViewerInputSink*, Win32cr::Foundation::HRESULT),
    add_touch_input : Proc(IRDPViewerInputSink*, UInt32, UInt32, Int32, Int32, Win32cr::Foundation::HRESULT),
    end_touch_frame : Proc(IRDPViewerInputSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPViewerInputSink, lpVtbl : IRDPViewerInputSinkVtbl* do
    GUID = LibC::GUID.new(0xbb590853_u32, 0xa6c5_u16, 0x4a7b_u16, StaticArray[0x8d_u8, 0xd4_u8, 0x76_u8, 0xb6_u8, 0x9e_u8, 0xea_u8, 0x12_u8, 0xd5_u8])
    def query_interface(this : IRDPViewerInputSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPViewerInputSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPViewerInputSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def send_mouse_button_event(this : IRDPViewerInputSink*, buttonType : Win32cr::System::DesktopSharing::RDPSRAPI_MOUSE_BUTTON_TYPE, vbButtonDown : Int16, xPos : UInt32, yPos : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_mouse_button_event.call(this, buttonType, vbButtonDown, xPos, yPos)
    end
    def send_mouse_move_event(this : IRDPViewerInputSink*, xPos : UInt32, yPos : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_mouse_move_event.call(this, xPos, yPos)
    end
    def send_mouse_wheel_event(this : IRDPViewerInputSink*, wheelRotation : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_mouse_wheel_event.call(this, wheelRotation)
    end
    def send_keyboard_event(this : IRDPViewerInputSink*, codeType : Win32cr::System::DesktopSharing::RDPSRAPI_KBD_CODE_TYPE, keycode : UInt16, vbKeyUp : Int16, vbRepeat : Int16, vbExtended : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_keyboard_event.call(this, codeType, keycode, vbKeyUp, vbRepeat, vbExtended)
    end
    def send_sync_event(this : IRDPViewerInputSink*, syncFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_sync_event.call(this, syncFlags)
    end
    def begin_touch_frame(this : IRDPViewerInputSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_touch_frame.call(this)
    end
    def add_touch_input(this : IRDPViewerInputSink*, contactId : UInt32, event : UInt32, x : Int32, y : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_touch_input.call(this, contactId, event, x, y)
    end
    def end_touch_frame(this : IRDPViewerInputSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_touch_frame.call(this)
    end

  end

  @[Extern]
  record IRDPSRAPIFrameBufferVtbl,
    query_interface : Proc(IRDPSRAPIFrameBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPIFrameBuffer*, UInt32),
    release : Proc(IRDPSRAPIFrameBuffer*, UInt32),
    get_type_info_count : Proc(IRDPSRAPIFrameBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPIFrameBuffer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPIFrameBuffer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPIFrameBuffer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Width : Proc(IRDPSRAPIFrameBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_Height : Proc(IRDPSRAPIFrameBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_Bpp : Proc(IRDPSRAPIFrameBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_frame_buffer_bits : Proc(IRDPSRAPIFrameBuffer*, Int32, Int32, Int32, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPIFrameBuffer, lpVtbl : IRDPSRAPIFrameBufferVtbl* do
    GUID = LibC::GUID.new(0x3d67e7d2_u32, 0xb27b_u16, 0x448e_u16, StaticArray[0x81_u8, 0xb3_u8, 0xc6_u8, 0x11_u8, 0xe_u8, 0xd8_u8, 0xb4_u8, 0xbe_u8])
    def query_interface(this : IRDPSRAPIFrameBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPIFrameBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPIFrameBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPIFrameBuffer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPIFrameBuffer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPIFrameBuffer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPIFrameBuffer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Width(this : IRDPSRAPIFrameBuffer*, plWidth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, plWidth)
    end
    def get_Height(this : IRDPSRAPIFrameBuffer*, plHeight : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Height.call(this, plHeight)
    end
    def get_Bpp(this : IRDPSRAPIFrameBuffer*, plBpp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bpp.call(this, plBpp)
    end
    def get_frame_buffer_bits(this : IRDPSRAPIFrameBuffer*, x : Int32, y : Int32, width : Int32, heigth : Int32, ppBits : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_buffer_bits.call(this, x, y, width, heigth, ppBits)
    end

  end

  @[Extern]
  record IRDPSRAPITransportStreamBufferVtbl,
    query_interface : Proc(IRDPSRAPITransportStreamBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPITransportStreamBuffer*, UInt32),
    release : Proc(IRDPSRAPITransportStreamBuffer*, UInt32),
    get_Storage : Proc(IRDPSRAPITransportStreamBuffer*, UInt8**, Win32cr::Foundation::HRESULT),
    get_StorageSize : Proc(IRDPSRAPITransportStreamBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    get_PayloadSize : Proc(IRDPSRAPITransportStreamBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    put_PayloadSize : Proc(IRDPSRAPITransportStreamBuffer*, Int32, Win32cr::Foundation::HRESULT),
    get_PayloadOffset : Proc(IRDPSRAPITransportStreamBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    put_PayloadOffset : Proc(IRDPSRAPITransportStreamBuffer*, Int32, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(IRDPSRAPITransportStreamBuffer*, Int32*, Win32cr::Foundation::HRESULT),
    put_Flags : Proc(IRDPSRAPITransportStreamBuffer*, Int32, Win32cr::Foundation::HRESULT),
    get_Context : Proc(IRDPSRAPITransportStreamBuffer*, Void**, Win32cr::Foundation::HRESULT),
    put_Context : Proc(IRDPSRAPITransportStreamBuffer*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPITransportStreamBuffer, lpVtbl : IRDPSRAPITransportStreamBufferVtbl* do
    GUID = LibC::GUID.new(0x81c80290_u32, 0x5085_u16, 0x44b0_u16, StaticArray[0xb4_u8, 0x60_u8, 0xf8_u8, 0x65_u8, 0xc3_u8, 0x9c_u8, 0xb4_u8, 0xa9_u8])
    def query_interface(this : IRDPSRAPITransportStreamBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPITransportStreamBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPITransportStreamBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Storage(this : IRDPSRAPITransportStreamBuffer*, ppbStorage : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Storage.call(this, ppbStorage)
    end
    def get_StorageSize(this : IRDPSRAPITransportStreamBuffer*, plMaxStore : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StorageSize.call(this, plMaxStore)
    end
    def get_PayloadSize(this : IRDPSRAPITransportStreamBuffer*, plRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PayloadSize.call(this, plRetVal)
    end
    def put_PayloadSize(this : IRDPSRAPITransportStreamBuffer*, lVal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PayloadSize.call(this, lVal)
    end
    def get_PayloadOffset(this : IRDPSRAPITransportStreamBuffer*, plRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PayloadOffset.call(this, plRetVal)
    end
    def put_PayloadOffset(this : IRDPSRAPITransportStreamBuffer*, lRetVal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PayloadOffset.call(this, lRetVal)
    end
    def get_Flags(this : IRDPSRAPITransportStreamBuffer*, plFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, plFlags)
    end
    def put_Flags(this : IRDPSRAPITransportStreamBuffer*, lFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Flags.call(this, lFlags)
    end
    def get_Context(this : IRDPSRAPITransportStreamBuffer*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Context.call(this, ppContext)
    end
    def put_Context(this : IRDPSRAPITransportStreamBuffer*, pContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Context.call(this, pContext)
    end

  end

  @[Extern]
  record IRDPSRAPITransportStreamEventsVtbl,
    query_interface : Proc(IRDPSRAPITransportStreamEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPITransportStreamEvents*, UInt32),
    release : Proc(IRDPSRAPITransportStreamEvents*, UInt32),
    on_write_completed : Proc(IRDPSRAPITransportStreamEvents*, Void*, Void),
    on_read_completed : Proc(IRDPSRAPITransportStreamEvents*, Void*, Void),
    on_stream_closed : Proc(IRDPSRAPITransportStreamEvents*, Win32cr::Foundation::HRESULT, Void)


  @[Extern]
  record IRDPSRAPITransportStreamEvents, lpVtbl : IRDPSRAPITransportStreamEventsVtbl* do
    GUID = LibC::GUID.new(0xea81c254_u32, 0xf5af_u16, 0x4e40_u16, StaticArray[0x98_u8, 0x2e_u8, 0x3e_u8, 0x63_u8, 0xbb_u8, 0x59_u8, 0x52_u8, 0x76_u8])
    def query_interface(this : IRDPSRAPITransportStreamEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPITransportStreamEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPITransportStreamEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_write_completed(this : IRDPSRAPITransportStreamEvents*, pBuffer : Void*) : Void
      @lpVtbl.try &.value.on_write_completed.call(this, pBuffer)
    end
    def on_read_completed(this : IRDPSRAPITransportStreamEvents*, pBuffer : Void*) : Void
      @lpVtbl.try &.value.on_read_completed.call(this, pBuffer)
    end
    def on_stream_closed(this : IRDPSRAPITransportStreamEvents*, hrReason : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.on_stream_closed.call(this, hrReason)
    end

  end

  @[Extern]
  record IRDPSRAPITransportStreamVtbl,
    query_interface : Proc(IRDPSRAPITransportStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPITransportStream*, UInt32),
    release : Proc(IRDPSRAPITransportStream*, UInt32),
    alloc_buffer : Proc(IRDPSRAPITransportStream*, Int32, Void**, Win32cr::Foundation::HRESULT),
    free_buffer : Proc(IRDPSRAPITransportStream*, Void*, Win32cr::Foundation::HRESULT),
    write_buffer : Proc(IRDPSRAPITransportStream*, Void*, Win32cr::Foundation::HRESULT),
    read_buffer : Proc(IRDPSRAPITransportStream*, Void*, Win32cr::Foundation::HRESULT),
    open : Proc(IRDPSRAPITransportStream*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IRDPSRAPITransportStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPITransportStream, lpVtbl : IRDPSRAPITransportStreamVtbl* do
    GUID = LibC::GUID.new(0x36cfa065_u32, 0x43bb_u16, 0x4ef7_u16, StaticArray[0xae_u8, 0xd7_u8, 0x9b_u8, 0x88_u8, 0xa5_u8, 0x5_u8, 0x30_u8, 0x36_u8])
    def query_interface(this : IRDPSRAPITransportStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPITransportStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPITransportStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alloc_buffer(this : IRDPSRAPITransportStream*, maxPayload : Int32, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alloc_buffer.call(this, maxPayload, ppBuffer)
    end
    def free_buffer(this : IRDPSRAPITransportStream*, pBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_buffer.call(this, pBuffer)
    end
    def write_buffer(this : IRDPSRAPITransportStream*, pBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_buffer.call(this, pBuffer)
    end
    def read_buffer(this : IRDPSRAPITransportStream*, pBuffer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_buffer.call(this, pBuffer)
    end
    def open(this : IRDPSRAPITransportStream*, pCallbacks : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pCallbacks)
    end
    def close(this : IRDPSRAPITransportStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IRDPSRAPISharingSessionVtbl,
    query_interface : Proc(IRDPSRAPISharingSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPISharingSession*, UInt32),
    release : Proc(IRDPSRAPISharingSession*, UInt32),
    get_type_info_count : Proc(IRDPSRAPISharingSession*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPISharingSession*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPISharingSession*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPISharingSession*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    open : Proc(IRDPSRAPISharingSession*, Win32cr::Foundation::HRESULT),
    close : Proc(IRDPSRAPISharingSession*, Win32cr::Foundation::HRESULT),
    put_ColorDepth : Proc(IRDPSRAPISharingSession*, Int32, Win32cr::Foundation::HRESULT),
    get_ColorDepth : Proc(IRDPSRAPISharingSession*, Int32*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IRDPSRAPISharingSession*, Void**, Win32cr::Foundation::HRESULT),
    get_Attendees : Proc(IRDPSRAPISharingSession*, Void**, Win32cr::Foundation::HRESULT),
    get_Invitations : Proc(IRDPSRAPISharingSession*, Void**, Win32cr::Foundation::HRESULT),
    get_ApplicationFilter : Proc(IRDPSRAPISharingSession*, Void**, Win32cr::Foundation::HRESULT),
    get_VirtualChannelManager : Proc(IRDPSRAPISharingSession*, Void**, Win32cr::Foundation::HRESULT),
    pause : Proc(IRDPSRAPISharingSession*, Win32cr::Foundation::HRESULT),
    resume : Proc(IRDPSRAPISharingSession*, Win32cr::Foundation::HRESULT),
    connect_to_client : Proc(IRDPSRAPISharingSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_desktop_shared_rect : Proc(IRDPSRAPISharingSession*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_desktop_shared_rect : Proc(IRDPSRAPISharingSession*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPISharingSession, lpVtbl : IRDPSRAPISharingSessionVtbl* do
    GUID = LibC::GUID.new(0xeeb20886_u32, 0xe470_u16, 0x4cf6_u16, StaticArray[0x84_u8, 0x2b_u8, 0x27_u8, 0x39_u8, 0xc0_u8, 0xec_u8, 0x5c_u8, 0xfb_u8])
    def query_interface(this : IRDPSRAPISharingSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPISharingSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPISharingSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPISharingSession*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPISharingSession*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPISharingSession*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPISharingSession*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def open(this : IRDPSRAPISharingSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this)
    end
    def close(this : IRDPSRAPISharingSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def put_ColorDepth(this : IRDPSRAPISharingSession*, colorDepth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ColorDepth.call(this, colorDepth)
    end
    def get_ColorDepth(this : IRDPSRAPISharingSession*, pColorDepth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ColorDepth.call(this, pColorDepth)
    end
    def get_Properties(this : IRDPSRAPISharingSession*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppVal)
    end
    def get_Attendees(this : IRDPSRAPISharingSession*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attendees.call(this, ppVal)
    end
    def get_Invitations(this : IRDPSRAPISharingSession*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Invitations.call(this, ppVal)
    end
    def get_ApplicationFilter(this : IRDPSRAPISharingSession*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationFilter.call(this, ppVal)
    end
    def get_VirtualChannelManager(this : IRDPSRAPISharingSession*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VirtualChannelManager.call(this, ppVal)
    end
    def pause(this : IRDPSRAPISharingSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IRDPSRAPISharingSession*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def connect_to_client(this : IRDPSRAPISharingSession*, bstrConnectionString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_to_client.call(this, bstrConnectionString)
    end
    def set_desktop_shared_rect(this : IRDPSRAPISharingSession*, left : Int32, top : Int32, right : Int32, bottom : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_desktop_shared_rect.call(this, left, top, right, bottom)
    end
    def get_desktop_shared_rect(this : IRDPSRAPISharingSession*, pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desktop_shared_rect.call(this, pleft, ptop, pright, pbottom)
    end

  end

  @[Extern]
  record IRDPSRAPISharingSession2Vtbl,
    query_interface : Proc(IRDPSRAPISharingSession2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSRAPISharingSession2*, UInt32),
    release : Proc(IRDPSRAPISharingSession2*, UInt32),
    get_type_info_count : Proc(IRDPSRAPISharingSession2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSRAPISharingSession2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSRAPISharingSession2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSRAPISharingSession2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    open : Proc(IRDPSRAPISharingSession2*, Win32cr::Foundation::HRESULT),
    close : Proc(IRDPSRAPISharingSession2*, Win32cr::Foundation::HRESULT),
    put_ColorDepth : Proc(IRDPSRAPISharingSession2*, Int32, Win32cr::Foundation::HRESULT),
    get_ColorDepth : Proc(IRDPSRAPISharingSession2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IRDPSRAPISharingSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_Attendees : Proc(IRDPSRAPISharingSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_Invitations : Proc(IRDPSRAPISharingSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_ApplicationFilter : Proc(IRDPSRAPISharingSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_VirtualChannelManager : Proc(IRDPSRAPISharingSession2*, Void**, Win32cr::Foundation::HRESULT),
    pause : Proc(IRDPSRAPISharingSession2*, Win32cr::Foundation::HRESULT),
    resume : Proc(IRDPSRAPISharingSession2*, Win32cr::Foundation::HRESULT),
    connect_to_client : Proc(IRDPSRAPISharingSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_desktop_shared_rect : Proc(IRDPSRAPISharingSession2*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    get_desktop_shared_rect : Proc(IRDPSRAPISharingSession2*, Int32*, Int32*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    connect_using_transport_stream : Proc(IRDPSRAPISharingSession2*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FrameBuffer : Proc(IRDPSRAPISharingSession2*, Void**, Win32cr::Foundation::HRESULT),
    send_control_level_change_response : Proc(IRDPSRAPISharingSession2*, Void*, Win32cr::System::DesktopSharing::CTRL_LEVEL, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSRAPISharingSession2, lpVtbl : IRDPSRAPISharingSession2Vtbl* do
    GUID = LibC::GUID.new(0xfee4ee57_u32, 0xe3e8_u16, 0x4205_u16, StaticArray[0x8f_u8, 0xb0_u8, 0x8f_u8, 0xd1_u8, 0xd0_u8, 0x67_u8, 0x5c_u8, 0x21_u8])
    def query_interface(this : IRDPSRAPISharingSession2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSRAPISharingSession2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSRAPISharingSession2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSRAPISharingSession2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSRAPISharingSession2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSRAPISharingSession2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSRAPISharingSession2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def open(this : IRDPSRAPISharingSession2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this)
    end
    def close(this : IRDPSRAPISharingSession2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def put_ColorDepth(this : IRDPSRAPISharingSession2*, colorDepth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ColorDepth.call(this, colorDepth)
    end
    def get_ColorDepth(this : IRDPSRAPISharingSession2*, pColorDepth : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ColorDepth.call(this, pColorDepth)
    end
    def get_Properties(this : IRDPSRAPISharingSession2*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppVal)
    end
    def get_Attendees(this : IRDPSRAPISharingSession2*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attendees.call(this, ppVal)
    end
    def get_Invitations(this : IRDPSRAPISharingSession2*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Invitations.call(this, ppVal)
    end
    def get_ApplicationFilter(this : IRDPSRAPISharingSession2*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ApplicationFilter.call(this, ppVal)
    end
    def get_VirtualChannelManager(this : IRDPSRAPISharingSession2*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VirtualChannelManager.call(this, ppVal)
    end
    def pause(this : IRDPSRAPISharingSession2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IRDPSRAPISharingSession2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def connect_to_client(this : IRDPSRAPISharingSession2*, bstrConnectionString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_to_client.call(this, bstrConnectionString)
    end
    def set_desktop_shared_rect(this : IRDPSRAPISharingSession2*, left : Int32, top : Int32, right : Int32, bottom : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_desktop_shared_rect.call(this, left, top, right, bottom)
    end
    def get_desktop_shared_rect(this : IRDPSRAPISharingSession2*, pleft : Int32*, ptop : Int32*, pright : Int32*, pbottom : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desktop_shared_rect.call(this, pleft, ptop, pright, pbottom)
    end
    def connect_using_transport_stream(this : IRDPSRAPISharingSession2*, pStream : Void*, bstrGroup : Win32cr::Foundation::BSTR, bstrAuthenticatedAttendeeName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect_using_transport_stream.call(this, pStream, bstrGroup, bstrAuthenticatedAttendeeName)
    end
    def get_FrameBuffer(this : IRDPSRAPISharingSession2*, ppVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FrameBuffer.call(this, ppVal)
    end
    def send_control_level_change_response(this : IRDPSRAPISharingSession2*, pAttendee : Void*, requested_level : Win32cr::System::DesktopSharing::CTRL_LEVEL, reason_code : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_control_level_change_response.call(this, pAttendee, requested_level, reason_code)
    end

  end

  @[Extern]
  record IRDPSessionEvents_Vtbl,
    query_interface : Proc(IRDPSessionEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRDPSessionEvents_*, UInt32),
    release : Proc(IRDPSessionEvents_*, UInt32),
    get_type_info_count : Proc(IRDPSessionEvents_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRDPSessionEvents_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRDPSessionEvents_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRDPSessionEvents_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRDPSessionEvents_, lpVtbl : IRDPSessionEvents_Vtbl* do
    GUID = LibC::GUID.new(0x98a97042_u32, 0x6698_u16, 0x40e9_u16, StaticArray[0x8e_u8, 0xfd_u8, 0xb3_u8, 0x20_u8, 0x9_u8, 0x90_u8, 0x0_u8, 0x4b_u8])
    def query_interface(this : IRDPSessionEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRDPSessionEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRDPSessionEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRDPSessionEvents_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRDPSessionEvents_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRDPSessionEvents_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRDPSessionEvents_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

end