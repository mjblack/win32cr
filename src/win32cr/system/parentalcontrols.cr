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
  ARRAY_SEP_CHAR = 9_u32
  WPCCHANNEL = 16_u32
  WPC_SETTINGS_LOCATE = 20_u32
  WPC_SETTINGS_MODIFY = 21_u32
  WPC_APP_LAUNCH = 22_u32
  WPC_SYSTEM = 23_u32
  WPC_WEB = 24_u32
  WPCPROV_TASK_SettingChange = 1_u32
  WPCPROV_TASK_GameStart = 2_u32
  WPCPROV_TASK_UrlVisit = 3_u32
  WPCPROV_TASK_EmailReceived = 4_u32
  WPCPROV_TASK_EmailSent = 5_u32
  WPCPROV_TASK_MediaPlayback = 6_u32
  WPCPROV_TASK_IMInvitation = 7_u32
  WPCPROV_TASK_IMJoin = 8_u32
  WPCPROV_TASK_IMLeave = 9_u32
  WPCPROV_TASK_FileDownload = 10_u32
  WPCPROV_TASK_IMFeature = 11_u32
  WPCPROV_TASK_Custom = 13_u32
  WPCPROV_TASK_EmailContact = 14_u32
  WPCPROV_TASK_IMContact = 15_u32
  WPCPROV_TASK_AppBlocked = 16_u32
  WPCPROV_TASK_AppOverride = 17_u32
  WPCPROV_TASK_WebOverride = 18_u32
  WPCPROV_TASK_WebsiteVisit = 19_u32
  WPCPROV_TASK_Application = 20_u32
  WPCPROV_TASK_ComputerUsage = 21_u32
  WPCPROV_TASK_ContentUsage = 22_u32
  WPCPROV_KEYWORD_WPC = 16_u32
  WPCPROV_KEYWORD_ThirdParty = 32_u32
  WPCEVENT_SYS_SETTINGCHANGE_value = 1_u32
  WPCEVENT_GAME_START_value = 2_u32
  WPCEVENT_WEB_URLVISIT_value = 3_u32
  WPCEVENT_EMAIL_RECEIVED_value = 4_u32
  WPCEVENT_EMAIL_SENT_value = 5_u32
  WPCEVENT_MEDIA_PLAYBACK_value = 6_u32
  WPCEVENT_IM_INVITATION_value = 7_u32
  WPCEVENT_IM_JOIN_value = 8_u32
  WPCEVENT_IM_LEAVE_value = 9_u32
  WPCEVENT_WEB_FILEDOWNLOAD_value = 10_u32
  WPCEVENT_IM_FEATURE_value = 11_u32
  WPCEVENT_CUSTOM_value = 13_u32
  WPCEVENT_EMAIL_CONTACT_value = 14_u32
  WPCEVENT_IM_CONTACT_value = 15_u32
  WPCEVENT_SYSTEM_APPBLOCKED_value = 16_u32
  WPCEVENT_APPOVERRIDE_value = 17_u32
  WPCEVENT_WEBOVERRIDE_value = 18_u32
  WPCEVENT_WEB_WEBSITEVISIT_value = 19_u32
  WPCEVENT_APPLICATION_value = 20_u32
  WPCEVENT_COMPUTERUSAGE_value = 21_u32
  WPCEVENT_CONTENTUSAGE_value = 22_u32
  MSG_Keyword_WPC = 268435461_i32
  MSG_Keyword_ThirdParty = 268435462_i32
  MSG_Opcode_Locate = 805306388_i32
  MSG_Opcode_Modify = 805306389_i32
  MSG_Opcode_Launch = 805306390_i32
  MSG_Opcode_System = 805306391_i32
  MSG_Opcode_Web = 805306392_i32
  MSG_Task_SettingChange = 1879048193_i32
  MSG_Task_GameStart = 1879048194_i32
  MSG_Task_UrlVisit = 1879048195_i32
  MSG_Task_EmailReceived = 1879048196_i32
  MSG_Task_EmailSent = 1879048197_i32
  MSG_Task_MediaPlayback = 1879048198_i32
  MSG_Task_IMInvitation = 1879048199_i32
  MSG_Task_IMJoin = 1879048200_i32
  MSG_Task_IMLeave = 1879048201_i32
  MSG_Task_FileDownload = 1879048202_i32
  MSG_Task_IMFeature = 1879048203_i32
  MSG_Task_Custom = 1879048205_i32
  MSG_Task_EmailContact = 1879048206_i32
  MSG_Task_IMContact = 1879048207_i32
  MSG_Task_AppBlocked = 1879048208_i32
  MSG_Task_AppOverride = 1879048209_i32
  MSG_Task_WebOverride = 1879048210_i32
  MSG_Task_WebsiteVisit = 1879048211_i32
  MSG_Task_Application = 1879048212_i32
  MSG_Task_ComputerUsage = 1879048213_i32
  MSG_Task_ContentUsage = 1879048214_i32
  MSG_Publisher_Name = -1879048191_i32
  MSG_Event_SettingChange = -1342177279_i32
  MSG_Event_GameStart = -1342177278_i32
  MSG_Event_UrlVisit = -1342177277_i32
  MSG_Event_EmailReceived = -1342177276_i32
  MSG_Event_EmailSent = -1342177275_i32
  MSG_Event_MediaPlayback = -1342177274_i32
  MSG_Event_IMInvitation = -1342177273_i32
  MSG_Event_IMJoin = -1342177272_i32
  MSG_Event_IMLeave = -1342177271_i32
  MSG_Event_FileDownload = -1342177270_i32
  MSG_Event_IMFeature = -1342177269_i32
  MSG_Event_Custom = -1342177267_i32
  MSG_Event_EmailContact = -1342177266_i32
  MSG_Event_IMContact = -1342177265_i32
  MSG_Event_AppBlocked = -1342177264_i32
  MSG_Event_AppOverride = -1342177263_i32
  MSG_Event_WebOverride = -1342177262_i32
  MSG_Event_WebsiteVisit = -1342177261_i32
  MSG_Event_Application = -1342177260_i32
  MSG_Event_ComputerUsage = -1342177259_i32
  MSG_Event_ContentUsage = -1342177258_i32
  FACILITY_WPC = 2457_u32
  WPCPROV = "01090065-b467-4503-9b28-533766761087"
  CLSID_WpcSettingsProvider = LibC::GUID.new(0x355dffaa_u32, 0x3b9f_u16, 0x435c_u16, StaticArray[0xb4_u8, 0x28_u8, 0x5d_u8, 0x44_u8, 0x29_u8, 0xb_u8, 0xc5_u8, 0xf2_u8])
  CLSID_WpcProviderSupport = LibC::GUID.new(0xbb18c7a0_u32, 0x2186_u16, 0x4be0_u16, StaticArray[0x97_u8, 0xd8_u8, 0x4_u8, 0x84_u8, 0x7b_u8, 0x62_u8, 0x8e_u8, 0x2_u8])
  CLSID_WindowsParentalControls = LibC::GUID.new(0xe77cc89b_u32, 0x7401_u16, 0x4c04_u16, StaticArray[0x8c_u8, 0xed_u8, 0x14_u8, 0x9d_u8, 0xb3_u8, 0x5a_u8, 0xdd_u8, 0x4_u8])


  enum WPCFLAG_OVERRIDE : Int32
    WPCFLAG_APPLICATION = 1
  end

  enum WPCFLAG_RESTRICTION : Int32
    WPCFLAG_NO_RESTRICTION = 0
    WPCFLAG_LOGGING_REQUIRED = 1
    WPCFLAG_WEB_FILTERED = 2
    WPCFLAG_HOURS_RESTRICTED = 4
    WPCFLAG_GAMES_BLOCKED = 8
    WPCFLAG_APPS_RESTRICTED = 16
    WPCFLAG_TIME_ALLOWANCE_RESTRICTED = 32
    WPCFLAG_GAMES_RESTRICTED = 64
  end

  enum WPCFLAG_WEB_SETTING : Int32
    WPCFLAG_WEB_SETTING_NOTBLOCKED = 0
    WPCFLAG_WEB_SETTING_DOWNLOADSBLOCKED = 1
  end

  enum WPCFLAG_VISIBILITY : Int32
    WPCFLAG_WPC_VISIBLE = 0
    WPCFLAG_WPC_HIDDEN = 1
  end

  enum WPCFLAG_ISBLOCKED : Int32
    WPCFLAG_ISBLOCKED_NOTBLOCKED = 0
    WPCFLAG_ISBLOCKED_IMBLOCKED = 1
    WPCFLAG_ISBLOCKED_EMAILBLOCKED = 2
    WPCFLAG_ISBLOCKED_MEDIAPLAYBACKBLOCKED = 4
    WPCFLAG_ISBLOCKED_WEBBLOCKED = 8
    WPCFLAG_ISBLOCKED_GAMESBLOCKED = 16
    WPCFLAG_ISBLOCKED_CONTACTBLOCKED = 32
    WPCFLAG_ISBLOCKED_FEATUREBLOCKED = 64
    WPCFLAG_ISBLOCKED_DOWNLOADBLOCKED = 128
    WPCFLAG_ISBLOCKED_RATINGBLOCKED = 256
    WPCFLAG_ISBLOCKED_DESCRIPTORBLOCKED = 512
    WPCFLAG_ISBLOCKED_EXPLICITBLOCK = 1024
    WPCFLAG_ISBLOCKED_BADPASS = 2048
    WPCFLAG_ISBLOCKED_MAXHOURS = 4096
    WPCFLAG_ISBLOCKED_SPECHOURS = 8192
    WPCFLAG_ISBLOCKED_SETTINGSCHANGEBLOCKED = 16384
    WPCFLAG_ISBLOCKED_ATTACHMENTBLOCKED = 32768
    WPCFLAG_ISBLOCKED_SENDERBLOCKED = 65536
    WPCFLAG_ISBLOCKED_RECEIVERBLOCKED = 131072
    WPCFLAG_ISBLOCKED_NOTEXPLICITLYALLOWED = 262144
    WPCFLAG_ISBLOCKED_NOTINLIST = 524288
    WPCFLAG_ISBLOCKED_CATEGORYBLOCKED = 1048576
    WPCFLAG_ISBLOCKED_CATEGORYNOTINLIST = 2097152
    WPCFLAG_ISBLOCKED_NOTKIDS = 4194304
    WPCFLAG_ISBLOCKED_UNRATED = 8388608
    WPCFLAG_ISBLOCKED_NOACCESS = 16777216
    WPCFLAG_ISBLOCKED_INTERNALERROR = -1
  end

  enum WPCFLAG_LOGOFF_TYPE : Int32
    WPCFLAG_LOGOFF_TYPE_LOGOUT = 0
    WPCFLAG_LOGOFF_TYPE_RESTART = 1
    WPCFLAG_LOGOFF_TYPE_SHUTDOWN = 2
    WPCFLAG_LOGOFF_TYPE_FUS = 4
    WPCFLAG_LOGOFF_TYPE_FORCEDFUS = 8
  end

  enum WPCFLAG_IM_LEAVE : Int32
    WPCFLAG_IM_LEAVE_NORMAL = 0
    WPCFLAG_IM_LEAVE_FORCED = 1
    WPCFLAG_IM_LEAVE_CONVERSATION_END = 2
  end

  enum WPC_ARGS_SETTINGSCHANGEEVENT : Int32
    WPC_ARGS_SETTINGSCHANGEEVENT_CLASS = 0
    WPC_ARGS_SETTINGSCHANGEEVENT_SETTING = 1
    WPC_ARGS_SETTINGSCHANGEEVENT_OWNER = 2
    WPC_ARGS_SETTINGSCHANGEEVENT_OLDVAL = 3
    WPC_ARGS_SETTINGSCHANGEEVENT_NEWVAL = 4
    WPC_ARGS_SETTINGSCHANGEEVENT_REASON = 5
    WPC_ARGS_SETTINGSCHANGEEVENT_OPTIONAL = 6
    WPC_ARGS_SETTINGSCHANGEEVENT_CARGS = 7
  end

  enum WPC_ARGS_SAFERAPPBLOCKED : Int32
    WPC_ARGS_SAFERAPPBLOCKED_TIMESTAMP = 0
    WPC_ARGS_SAFERAPPBLOCKED_USERID = 1
    WPC_ARGS_SAFERAPPBLOCKED_PATH = 2
    WPC_ARGS_SAFERAPPBLOCKED_RULEID = 3
    WPC_ARGS_SAFERAPPBLOCKED_CARGS = 4
  end

  enum WPC_ARGS_EMAILRECEIEVEDEVENT : Int32
    WPC_ARGS_EMAILRECEIEVEDEVENT_SENDER = 0
    WPC_ARGS_EMAILRECEIEVEDEVENT_APPNAME = 1
    WPC_ARGS_EMAILRECEIEVEDEVENT_APPVERSION = 2
    WPC_ARGS_EMAILRECEIEVEDEVENT_SUBJECT = 3
    WPC_ARGS_EMAILRECEIEVEDEVENT_REASON = 4
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPCOUNT = 5
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPIENT = 6
    WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHCOUNT = 7
    WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHMENTNAME = 8
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECEIVEDTIME = 9
    WPC_ARGS_EMAILRECEIEVEDEVENT_EMAILACCOUNT = 10
    WPC_ARGS_EMAILRECEIEVEDEVENT_CARGS = 11
  end

  enum WPC_ARGS_EMAILSENTEVENT : Int32
    WPC_ARGS_EMAILSENTEVENT_SENDER = 0
    WPC_ARGS_EMAILSENTEVENT_APPNAME = 1
    WPC_ARGS_EMAILSENTEVENT_APPVERSION = 2
    WPC_ARGS_EMAILSENTEVENT_SUBJECT = 3
    WPC_ARGS_EMAILSENTEVENT_REASON = 4
    WPC_ARGS_EMAILSENTEVENT_RECIPCOUNT = 5
    WPC_ARGS_EMAILSENTEVENT_RECIPIENT = 6
    WPC_ARGS_EMAILSENTEVENT_ATTACHCOUNT = 7
    WPC_ARGS_EMAILSENTEVENT_ATTACHMENTNAME = 8
    WPC_ARGS_EMAILSENTEVENT_EMAILACCOUNT = 9
    WPC_ARGS_EMAILSENTEVENT_CARGS = 10
  end

  enum WPC_ARGS_EMAILCONTACTEVENT : Int32
    WPC_ARGS_EMAILCONTACTEVENT_APPNAME = 0
    WPC_ARGS_EMAILCONTACTEVENT_APPVERSION = 1
    WPC_ARGS_EMAILCONTACTEVENT_OLDNAME = 2
    WPC_ARGS_EMAILCONTACTEVENT_OLDID = 3
    WPC_ARGS_EMAILCONTACTEVENT_NEWNAME = 4
    WPC_ARGS_EMAILCONTACTEVENT_NEWID = 5
    WPC_ARGS_EMAILCONTACTEVENT_REASON = 6
    WPC_ARGS_EMAILCONTACTEVENT_EMAILACCOUNT = 7
    WPC_ARGS_EMAILCONTACTEVENT_CARGS = 8
  end

  enum WPC_MEDIA_TYPE : Int32
    WPC_MEDIA_TYPE_OTHER = 0
    WPC_MEDIA_TYPE_DVD = 1
    WPC_MEDIA_TYPE_RECORDED_TV = 2
    WPC_MEDIA_TYPE_AUDIO_FILE = 3
    WPC_MEDIA_TYPE_CD_AUDIO = 4
    WPC_MEDIA_TYPE_VIDEO_FILE = 5
    WPC_MEDIA_TYPE_PICTURE_FILE = 6
    WPC_MEDIA_TYPE_MAX = 7
  end

  enum WPC_MEDIA_EXPLICIT : Int32
    WPC_MEDIA_EXPLICIT_FALSE = 0
    WPC_MEDIA_EXPLICIT_TRUE = 1
    WPC_MEDIA_EXPLICIT_UNKNOWN = 2
  end

  enum WPC_ARGS_MEDIAPLAYBACKEVENT : Int32
    WPC_ARGS_MEDIAPLAYBACKEVENT_APPNAME = 0
    WPC_ARGS_MEDIAPLAYBACKEVENT_APPVERSION = 1
    WPC_ARGS_MEDIAPLAYBACKEVENT_MEDIATYPE = 2
    WPC_ARGS_MEDIAPLAYBACKEVENT_PATH = 3
    WPC_ARGS_MEDIAPLAYBACKEVENT_TITLE = 4
    WPC_ARGS_MEDIAPLAYBACKEVENT_PML = 5
    WPC_ARGS_MEDIAPLAYBACKEVENT_ALBUM = 6
    WPC_ARGS_MEDIAPLAYBACKEVENT_EXPLICIT = 7
    WPC_ARGS_MEDIAPLAYBACKEVENT_REASON = 8
    WPC_ARGS_MEDIAPLAYBACKEVENT_CARGS = 9
  end

  enum WPC_ARGS_MEDIADOWNLOADEVENT : Int32
    WPC_ARGS_MEDIADOWNLOADEVENT_APPNAME = 0
    WPC_ARGS_MEDIADOWNLOADEVENT_APPVERSION = 1
    WPC_ARGS_MEDIADOWNLOADEVENT_MEDIATYPE = 2
    WPC_ARGS_MEDIADOWNLOADEVENT_PATH = 3
    WPC_ARGS_MEDIADOWNLOADEVENT_TITLE = 4
    WPC_ARGS_MEDIADOWNLOADEVENT_PML = 5
    WPC_ARGS_MEDIADOWNLOADEVENT_ALBUM = 6
    WPC_ARGS_MEDIADOWNLOADEVENT_EXPLICIT = 7
    WPC_ARGS_MEDIADOWNLOADEVENT_REASON = 8
    WPC_ARGS_MEDIADOWNLOADEVENT_CARGS = 9
  end

  enum WPC_ARGS_CONVERSATIONINITEVENT : Int32
    WPC_ARGS_CONVERSATIONINITEVENT_APPNAME = 0
    WPC_ARGS_CONVERSATIONINITEVENT_APPVERSION = 1
    WPC_ARGS_CONVERSATIONINITEVENT_ACCOUNTNAME = 2
    WPC_ARGS_CONVERSATIONINITEVENT_CONVID = 3
    WPC_ARGS_CONVERSATIONINITEVENT_REQUESTINGIP = 4
    WPC_ARGS_CONVERSATIONINITEVENT_SENDER = 5
    WPC_ARGS_CONVERSATIONINITEVENT_REASON = 6
    WPC_ARGS_CONVERSATIONINITEVENT_RECIPCOUNT = 7
    WPC_ARGS_CONVERSATIONINITEVENT_RECIPIENT = 8
    WPC_ARGS_CONVERSATIONINITEVENT_CARGS = 9
  end

  enum WPC_ARGS_CONVERSATIONJOINEVENT : Int32
    WPC_ARGS_CONVERSATIONJOINEVENT_APPNAME = 0
    WPC_ARGS_CONVERSATIONJOINEVENT_APPVERSION = 1
    WPC_ARGS_CONVERSATIONJOINEVENT_ACCOUNTNAME = 2
    WPC_ARGS_CONVERSATIONJOINEVENT_CONVID = 3
    WPC_ARGS_CONVERSATIONJOINEVENT_JOININGIP = 4
    WPC_ARGS_CONVERSATIONJOINEVENT_JOININGUSER = 5
    WPC_ARGS_CONVERSATIONJOINEVENT_REASON = 6
    WPC_ARGS_CONVERSATIONJOINEVENT_MEMBERCOUNT = 7
    WPC_ARGS_CONVERSATIONJOINEVENT_MEMBER = 8
    WPC_ARGS_CONVERSATIONJOINEVENT_SENDER = 9
    WPC_ARGS_CONVERSATIONJOINEVENT_CARGS = 10
  end

  enum WPC_ARGS_CONVERSATIONLEAVEEVENT : Int32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_APPNAME = 0
    WPC_ARGS_CONVERSATIONLEAVEEVENT_APPVERSION = 1
    WPC_ARGS_CONVERSATIONLEAVEEVENT_ACCOUNTNAME = 2
    WPC_ARGS_CONVERSATIONLEAVEEVENT_CONVID = 3
    WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGIP = 4
    WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGUSER = 5
    WPC_ARGS_CONVERSATIONLEAVEEVENT_REASON = 6
    WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBERCOUNT = 7
    WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBER = 8
    WPC_ARGS_CONVERSATIONLEAVEEVENT_FLAGS = 9
    WPC_ARGS_CONVERSATIONLEAVEEVENT_CARGS = 10
  end

  enum WPCFLAG_IM_FEATURE : Int32
    WPCFLAG_IM_FEATURE_NONE = 0
    WPCFLAG_IM_FEATURE_VIDEO = 1
    WPCFLAG_IM_FEATURE_AUDIO = 2
    WPCFLAG_IM_FEATURE_GAME = 4
    WPCFLAG_IM_FEATURE_SMS = 8
    WPCFLAG_IM_FEATURE_FILESWAP = 16
    WPCFLAG_IM_FEATURE_URLSWAP = 32
    WPCFLAG_IM_FEATURE_SENDING = -2147483648
    WPCFLAG_IM_FEATURE_ALL = -1
  end

  enum WPC_ARGS_IMFEATUREEVENT : Int32
    WPC_ARGS_IMFEATUREEVENT_APPNAME = 0
    WPC_ARGS_IMFEATUREEVENT_APPVERSION = 1
    WPC_ARGS_IMFEATUREEVENT_ACCOUNTNAME = 2
    WPC_ARGS_IMFEATUREEVENT_CONVID = 3
    WPC_ARGS_IMFEATUREEVENT_MEDIATYPE = 4
    WPC_ARGS_IMFEATUREEVENT_REASON = 5
    WPC_ARGS_IMFEATUREEVENT_RECIPCOUNT = 6
    WPC_ARGS_IMFEATUREEVENT_RECIPIENT = 7
    WPC_ARGS_IMFEATUREEVENT_SENDER = 8
    WPC_ARGS_IMFEATUREEVENT_SENDERIP = 9
    WPC_ARGS_IMFEATUREEVENT_DATA = 10
    WPC_ARGS_IMFEATUREEVENT_CARGS = 11
  end

  enum WPC_ARGS_IMCONTACTEVENT : Int32
    WPC_ARGS_IMCONTACTEVENT_APPNAME = 0
    WPC_ARGS_IMCONTACTEVENT_APPVERSION = 1
    WPC_ARGS_IMCONTACTEVENT_ACCOUNTNAME = 2
    WPC_ARGS_IMCONTACTEVENT_OLDNAME = 3
    WPC_ARGS_IMCONTACTEVENT_OLDID = 4
    WPC_ARGS_IMCONTACTEVENT_NEWNAME = 5
    WPC_ARGS_IMCONTACTEVENT_NEWID = 6
    WPC_ARGS_IMCONTACTEVENT_REASON = 7
    WPC_ARGS_IMCONTACTEVENT_CARGS = 8
  end

  enum WPC_ARGS_GAMESTARTEVENT : Int32
    WPC_ARGS_GAMESTARTEVENT_APPID = 0
    WPC_ARGS_GAMESTARTEVENT_INSTANCEID = 1
    WPC_ARGS_GAMESTARTEVENT_APPVERSION = 2
    WPC_ARGS_GAMESTARTEVENT_PATH = 3
    WPC_ARGS_GAMESTARTEVENT_RATING = 4
    WPC_ARGS_GAMESTARTEVENT_RATINGSYSTEM = 5
    WPC_ARGS_GAMESTARTEVENT_REASON = 6
    WPC_ARGS_GAMESTARTEVENT_DESCCOUNT = 7
    WPC_ARGS_GAMESTARTEVENT_DESCRIPTOR = 8
    WPC_ARGS_GAMESTARTEVENT_PID = 9
    WPC_ARGS_GAMESTARTEVENT_CARGS = 10
  end

  enum WPC_ARGS_FILEDOWNLOADEVENT : Int32
    WPC_ARGS_FILEDOWNLOADEVENT_URL = 0
    WPC_ARGS_FILEDOWNLOADEVENT_APPNAME = 1
    WPC_ARGS_FILEDOWNLOADEVENT_VERSION = 2
    WPC_ARGS_FILEDOWNLOADEVENT_BLOCKED = 3
    WPC_ARGS_FILEDOWNLOADEVENT_PATH = 4
    WPC_ARGS_FILEDOWNLOADEVENT_CARGS = 5
  end

  enum WPC_ARGS_URLVISITEVENT : Int32
    WPC_ARGS_URLVISITEVENT_URL = 0
    WPC_ARGS_URLVISITEVENT_APPNAME = 1
    WPC_ARGS_URLVISITEVENT_VERSION = 2
    WPC_ARGS_URLVISITEVENT_REASON = 3
    WPC_ARGS_URLVISITEVENT_RATINGSYSTEMID = 4
    WPC_ARGS_URLVISITEVENT_CATCOUNT = 5
    WPC_ARGS_URLVISITEVENT_CATEGORY = 6
    WPC_ARGS_URLVISITEVENT_CARGS = 7
  end

  enum WPC_ARGS_WEBSITEVISITEVENT : Int32
    WPC_ARGS_WEBSITEVISITEVENT_URL = 0
    WPC_ARGS_WEBSITEVISITEVENT_DECISION = 1
    WPC_ARGS_WEBSITEVISITEVENT_CATEGORIES = 2
    WPC_ARGS_WEBSITEVISITEVENT_BLOCKEDCATEGORIES = 3
    WPC_ARGS_WEBSITEVISITEVENT_SERIALIZEDAPPLICATION = 4
    WPC_ARGS_WEBSITEVISITEVENT_TITLE = 5
    WPC_ARGS_WEBSITEVISITEVENT_CONTENTTYPE = 6
    WPC_ARGS_WEBSITEVISITEVENT_REFERRER = 7
    WPC_ARGS_WEBSITEVISITEVENT_TELEMETRY = 8
    WPC_ARGS_WEBSITEVISITEVENT_CARGS = 9
  end

  enum WPC_ARGS_APPLICATIONEVENT : Int32
    WPC_ARGS_APPLICATIONEVENT_SERIALIZEDAPPLICATION = 0
    WPC_ARGS_APPLICATIONEVENT_DECISION = 1
    WPC_ARGS_APPLICATIONEVENT_PROCESSID = 2
    WPC_ARGS_APPLICATIONEVENT_CREATIONTIME = 3
    WPC_ARGS_APPLICATIONEVENT_TIMEUSED = 4
    WPC_ARGS_APPLICATIONEVENT_CARGS = 5
  end

  enum WPC_ARGS_COMPUTERUSAGEEVENT : Int32
    WPC_ARGS_COMPUTERUSAGEEVENT_ID = 0
    WPC_ARGS_COMPUTERUSAGEEVENT_TIMEUSED = 1
    WPC_ARGS_COMPUTERUSAGEEVENT_CARGS = 2
  end

  enum WPC_ARGS_CONTENTUSAGEEVENT : Int32
    WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERID = 0
    WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERTITLE = 1
    WPC_ARGS_CONTENTUSAGEEVENT_ID = 2
    WPC_ARGS_CONTENTUSAGEEVENT_TITLE = 3
    WPC_ARGS_CONTENTUSAGEEVENT_CATEGORY = 4
    WPC_ARGS_CONTENTUSAGEEVENT_RATINGS = 5
    WPC_ARGS_CONTENTUSAGEEVENT_DECISION = 6
    WPC_ARGS_CONTENTUSAGEEVENT_CARGS = 7
  end

  enum WPC_ARGS_CUSTOMEVENT : Int32
    WPC_ARGS_CUSTOMEVENT_PUBLISHER = 0
    WPC_ARGS_CUSTOMEVENT_APPNAME = 1
    WPC_ARGS_CUSTOMEVENT_APPVERSION = 2
    WPC_ARGS_CUSTOMEVENT_EVENT = 3
    WPC_ARGS_CUSTOMEVENT_VALUE1 = 4
    WPC_ARGS_CUSTOMEVENT_VALUE2 = 5
    WPC_ARGS_CUSTOMEVENT_VALUE3 = 6
    WPC_ARGS_CUSTOMEVENT_BLOCKED = 7
    WPC_ARGS_CUSTOMEVENT_REASON = 8
    WPC_ARGS_CUSTOMEVENT_CARGS = 9
  end

  enum WPC_ARGS_WEBOVERRIDEEVENT : Int32
    WPC_ARGS_WEBOVERRIDEEVENT_USERID = 0
    WPC_ARGS_WEBOVERRIDEEVENT_URL = 1
    WPC_ARGS_WEBOVERRIDEEVENT_REASON = 2
    WPC_ARGS_WEBOVERRIDEEVENT_CARGS = 3
  end

  enum WPC_ARGS_APPOVERRIDEEVENT : Int32
    WPC_ARGS_APPOVERRIDEEVENT_USERID = 0
    WPC_ARGS_APPOVERRIDEEVENT_PATH = 1
    WPC_ARGS_APPOVERRIDEEVENT_REASON = 2
    WPC_ARGS_APPOVERRIDEEVENT_CARGS = 3
  end

  enum WPC_SETTINGS : Int32
    WPC_SETTINGS_WPC_EXTENSION_PATH = 0
    WPC_SETTINGS_WPC_EXTENSION_SILO = 1
    WPC_SETTINGS_WPC_EXTENSION_IMAGE_PATH = 2
    WPC_SETTINGS_WPC_EXTENSION_DISABLEDIMAGE_PATH = 3
    WPC_SETTINGS_WPC_EXTENSION_NAME = 4
    WPC_SETTINGS_WPC_EXTENSION_SUB_TITLE = 5
    WPC_SETTINGS_SYSTEM_CURRENT_RATING_SYSTEM = 6
    WPC_SETTINGS_SYSTEM_LAST_LOG_VIEW = 7
    WPC_SETTINGS_SYSTEM_LOG_VIEW_REMINDER_INTERVAL = 8
    WPC_SETTINGS_SYSTEM_HTTP_EXEMPTION_LIST = 9
    WPC_SETTINGS_SYSTEM_URL_EXEMPTION_LIST = 10
    WPC_SETTINGS_SYSTEM_FILTER_ID = 11
    WPC_SETTINGS_SYSTEM_FILTER_NAME = 12
    WPC_SETTINGS_SYSTEM_LOCALE = 13
    WPC_SETTINGS_ALLOW_BLOCK = 14
    WPC_SETTINGS_GAME_BLOCKED = 15
    WPC_SETTINGS_GAME_ALLOW_UNRATED = 16
    WPC_SETTINGS_GAME_MAX_ALLOWED = 17
    WPC_SETTINGS_GAME_DENIED_DESCRIPTORS = 18
    WPC_SETTINGS_USER_WPC_ENABLED = 19
    WPC_SETTINGS_USER_LOGGING_REQUIRED = 20
    WPC_SETTINGS_USER_HOURLY_RESTRICTIONS = 21
    WPC_SETTINGS_USER_OVERRRIDE_REQUESTS = 22
    WPC_SETTINGS_USER_LOGON_HOURS = 23
    WPC_SETTINGS_USER_APP_RESTRICTIONS = 24
    WPC_SETTINGS_WEB_FILTER_ON = 25
    WPC_SETTINGS_WEB_DOWNLOAD_BLOCKED = 26
    WPC_SETTINGS_WEB_FILTER_LEVEL = 27
    WPC_SETTINGS_WEB_BLOCKED_CATEGORY_LIST = 28
    WPC_SETTINGS_WEB_BLOCK_UNRATED = 29
    WPC_SETTINGS_WPC_ENABLED = 30
    WPC_SETTINGS_WPC_LOGGING_REQUIRED = 31
    WPC_SETTINGS_RATING_SYSTEM_PATH = 32
    WPC_SETTINGS_WPC_PROVIDER_CURRENT = 33
    WPC_SETTINGS_USER_TIME_ALLOWANCE = 34
    WPC_SETTINGS_USER_TIME_ALLOWANCE_RESTRICTIONS = 35
    WPC_SETTINGS_GAME_RESTRICTED = 36
    WPC_SETTING_COUNT = 37
  end


  struct IWPCProviderStateVTbl
    query_interface : Proc(IWPCProviderState*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWPCProviderState*, UInt32)
    release : Proc(IWPCProviderState*, UInt32)
    enable : Proc(IWPCProviderState*, HRESULT)
    disable : Proc(IWPCProviderState*, HRESULT)
  end

  IWPCProviderState_GUID = "50b6a267-c4bd-450b-adb5-759073837c9e"
  IID_IWPCProviderState = LibC::GUID.new(0x50b6a267_u32, 0xc4bd_u16, 0x450b_u16, StaticArray[0xad_u8, 0xb5_u8, 0x75_u8, 0x90_u8, 0x73_u8, 0x83_u8, 0x7c_u8, 0x9e_u8])
  struct IWPCProviderState
    lpVtbl : IWPCProviderStateVTbl*
  end

  struct IWPCProviderConfigVTbl
    query_interface : Proc(IWPCProviderConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWPCProviderConfig*, UInt32)
    release : Proc(IWPCProviderConfig*, UInt32)
    get_user_summary : Proc(IWPCProviderConfig*, UInt8*, UInt8**, HRESULT)
    configure : Proc(IWPCProviderConfig*, LibC::HANDLE, UInt8*, HRESULT)
    request_override : Proc(IWPCProviderConfig*, LibC::HANDLE, UInt8*, WPCFLAG_RESTRICTION, HRESULT)
  end

  IWPCProviderConfig_GUID = "bef54196-2d02-4a26-b6e5-d65af295d0f1"
  IID_IWPCProviderConfig = LibC::GUID.new(0xbef54196_u32, 0x2d02_u16, 0x4a26_u16, StaticArray[0xb6_u8, 0xe5_u8, 0xd6_u8, 0x5a_u8, 0xf2_u8, 0x95_u8, 0xd0_u8, 0xf1_u8])
  struct IWPCProviderConfig
    lpVtbl : IWPCProviderConfigVTbl*
  end

  struct IWPCSettingsVTbl
    query_interface : Proc(IWPCSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWPCSettings*, UInt32)
    release : Proc(IWPCSettings*, UInt32)
    is_logging_required : Proc(IWPCSettings*, LibC::BOOL*, HRESULT)
    get_last_settings_change_time : Proc(IWPCSettings*, SYSTEMTIME*, HRESULT)
    get_restrictions : Proc(IWPCSettings*, WPCFLAG_RESTRICTION*, HRESULT)
  end

  IWPCSettings_GUID = "8fdf6ca1-0189-47e4-b670-1a8a4636e340"
  IID_IWPCSettings = LibC::GUID.new(0x8fdf6ca1_u32, 0x189_u16, 0x47e4_u16, StaticArray[0xb6_u8, 0x70_u8, 0x1a_u8, 0x8a_u8, 0x46_u8, 0x36_u8, 0xe3_u8, 0x40_u8])
  struct IWPCSettings
    lpVtbl : IWPCSettingsVTbl*
  end

  struct IWPCGamesSettingsVTbl
    query_interface : Proc(IWPCGamesSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWPCGamesSettings*, UInt32)
    release : Proc(IWPCGamesSettings*, UInt32)
    is_logging_required : Proc(IWPCGamesSettings*, LibC::BOOL*, HRESULT)
    get_last_settings_change_time : Proc(IWPCGamesSettings*, SYSTEMTIME*, HRESULT)
    get_restrictions : Proc(IWPCGamesSettings*, WPCFLAG_RESTRICTION*, HRESULT)
    is_blocked : Proc(IWPCGamesSettings*, Guid, UInt32*, HRESULT)
  end

  IWPCGamesSettings_GUID = "95e87780-e158-489e-b452-bbb850790715"
  IID_IWPCGamesSettings = LibC::GUID.new(0x95e87780_u32, 0xe158_u16, 0x489e_u16, StaticArray[0xb4_u8, 0x52_u8, 0xbb_u8, 0xb8_u8, 0x50_u8, 0x79_u8, 0x7_u8, 0x15_u8])
  struct IWPCGamesSettings
    lpVtbl : IWPCGamesSettingsVTbl*
  end

  struct IWPCWebSettingsVTbl
    query_interface : Proc(IWPCWebSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWPCWebSettings*, UInt32)
    release : Proc(IWPCWebSettings*, UInt32)
    is_logging_required : Proc(IWPCWebSettings*, LibC::BOOL*, HRESULT)
    get_last_settings_change_time : Proc(IWPCWebSettings*, SYSTEMTIME*, HRESULT)
    get_restrictions : Proc(IWPCWebSettings*, WPCFLAG_RESTRICTION*, HRESULT)
    get_settings : Proc(IWPCWebSettings*, WPCFLAG_WEB_SETTING*, HRESULT)
    request_url_override : Proc(IWPCWebSettings*, LibC::HANDLE, LibC::LPWSTR, UInt32, LibC::LPWSTR*, LibC::BOOL*, HRESULT)
  end

  IWPCWebSettings_GUID = "ffccbdb8-0992-4c30-b0f1-1cbb09c240aa"
  IID_IWPCWebSettings = LibC::GUID.new(0xffccbdb8_u32, 0x992_u16, 0x4c30_u16, StaticArray[0xb0_u8, 0xf1_u8, 0x1c_u8, 0xbb_u8, 0x9_u8, 0xc2_u8, 0x40_u8, 0xaa_u8])
  struct IWPCWebSettings
    lpVtbl : IWPCWebSettingsVTbl*
  end

  struct IWindowsParentalControlsCoreVTbl
    query_interface : Proc(IWindowsParentalControlsCore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsParentalControlsCore*, UInt32)
    release : Proc(IWindowsParentalControlsCore*, UInt32)
    get_visibility : Proc(IWindowsParentalControlsCore*, WPCFLAG_VISIBILITY*, HRESULT)
    get_user_settings : Proc(IWindowsParentalControlsCore*, LibC::LPWSTR, IWPCSettings*, HRESULT)
    get_web_settings : Proc(IWindowsParentalControlsCore*, LibC::LPWSTR, IWPCWebSettings*, HRESULT)
    get_web_filter_info : Proc(IWindowsParentalControlsCore*, Guid*, LibC::LPWSTR*, HRESULT)
  end

  IWindowsParentalControlsCore_GUID = "4ff40a0f-3f3b-4d7c-a41b-4f39d7b44d05"
  IID_IWindowsParentalControlsCore = LibC::GUID.new(0x4ff40a0f_u32, 0x3f3b_u16, 0x4d7c_u16, StaticArray[0xa4_u8, 0x1b_u8, 0x4f_u8, 0x39_u8, 0xd7_u8, 0xb4_u8, 0x4d_u8, 0x5_u8])
  struct IWindowsParentalControlsCore
    lpVtbl : IWindowsParentalControlsCoreVTbl*
  end

  struct IWindowsParentalControlsVTbl
    query_interface : Proc(IWindowsParentalControls*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsParentalControls*, UInt32)
    release : Proc(IWindowsParentalControls*, UInt32)
    get_visibility : Proc(IWindowsParentalControls*, WPCFLAG_VISIBILITY*, HRESULT)
    get_user_settings : Proc(IWindowsParentalControls*, LibC::LPWSTR, IWPCSettings*, HRESULT)
    get_web_settings : Proc(IWindowsParentalControls*, LibC::LPWSTR, IWPCWebSettings*, HRESULT)
    get_web_filter_info : Proc(IWindowsParentalControls*, Guid*, LibC::LPWSTR*, HRESULT)
    get_games_settings : Proc(IWindowsParentalControls*, LibC::LPWSTR, IWPCGamesSettings*, HRESULT)
  end

  IWindowsParentalControls_GUID = "28b4d88b-e072-49e6-804d-26edbe21a7b9"
  IID_IWindowsParentalControls = LibC::GUID.new(0x28b4d88b_u32, 0xe072_u16, 0x49e6_u16, StaticArray[0x80_u8, 0x4d_u8, 0x26_u8, 0xed_u8, 0xbe_u8, 0x21_u8, 0xa7_u8, 0xb9_u8])
  struct IWindowsParentalControls
    lpVtbl : IWindowsParentalControlsVTbl*
  end

  struct IWPCProviderSupportVTbl
    query_interface : Proc(IWPCProviderSupport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWPCProviderSupport*, UInt32)
    release : Proc(IWPCProviderSupport*, UInt32)
    get_current : Proc(IWPCProviderSupport*, Guid*, HRESULT)
  end

  IWPCProviderSupport_GUID = "41eba572-23ed-4779-bec1-8df96206c44c"
  IID_IWPCProviderSupport = LibC::GUID.new(0x41eba572_u32, 0x23ed_u16, 0x4779_u16, StaticArray[0xbe_u8, 0xc1_u8, 0x8d_u8, 0xf9_u8, 0x62_u8, 0x6_u8, 0xc4_u8, 0x4c_u8])
  struct IWPCProviderSupport
    lpVtbl : IWPCProviderSupportVTbl*
  end

end
struct LibWin32::IWPCProviderState
  def query_interface(this : IWPCProviderState*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWPCProviderState*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWPCProviderState*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable(this : IWPCProviderState*) : HRESULT
    @lpVtbl.value.enable.call(this)
  end
  def disable(this : IWPCProviderState*) : HRESULT
    @lpVtbl.value.disable.call(this)
  end
end
struct LibWin32::IWPCProviderConfig
  def query_interface(this : IWPCProviderConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWPCProviderConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWPCProviderConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_user_summary(this : IWPCProviderConfig*, bstrsid : UInt8*, pbstrusersummary : UInt8**) : HRESULT
    @lpVtbl.value.get_user_summary.call(this, bstrsid, pbstrusersummary)
  end
  def configure(this : IWPCProviderConfig*, hwnd : LibC::HANDLE, bstrsid : UInt8*) : HRESULT
    @lpVtbl.value.configure.call(this, hwnd, bstrsid)
  end
  def request_override(this : IWPCProviderConfig*, hwnd : LibC::HANDLE, bstrpath : UInt8*, dwflags : WPCFLAG_RESTRICTION) : HRESULT
    @lpVtbl.value.request_override.call(this, hwnd, bstrpath, dwflags)
  end
end
struct LibWin32::IWPCSettings
  def query_interface(this : IWPCSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWPCSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWPCSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_logging_required(this : IWPCSettings*, pfrequired : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_logging_required.call(this, pfrequired)
  end
  def get_last_settings_change_time(this : IWPCSettings*, ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_last_settings_change_time.call(this, ptime)
  end
  def get_restrictions(this : IWPCSettings*, pdwrestrictions : WPCFLAG_RESTRICTION*) : HRESULT
    @lpVtbl.value.get_restrictions.call(this, pdwrestrictions)
  end
end
struct LibWin32::IWPCGamesSettings
  def query_interface(this : IWPCGamesSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWPCGamesSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWPCGamesSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_logging_required(this : IWPCGamesSettings*, pfrequired : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_logging_required.call(this, pfrequired)
  end
  def get_last_settings_change_time(this : IWPCGamesSettings*, ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_last_settings_change_time.call(this, ptime)
  end
  def get_restrictions(this : IWPCGamesSettings*, pdwrestrictions : WPCFLAG_RESTRICTION*) : HRESULT
    @lpVtbl.value.get_restrictions.call(this, pdwrestrictions)
  end
  def is_blocked(this : IWPCGamesSettings*, guidappid : Guid, pdwreasons : UInt32*) : HRESULT
    @lpVtbl.value.is_blocked.call(this, guidappid, pdwreasons)
  end
end
struct LibWin32::IWPCWebSettings
  def query_interface(this : IWPCWebSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWPCWebSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWPCWebSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_logging_required(this : IWPCWebSettings*, pfrequired : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_logging_required.call(this, pfrequired)
  end
  def get_last_settings_change_time(this : IWPCWebSettings*, ptime : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_last_settings_change_time.call(this, ptime)
  end
  def get_restrictions(this : IWPCWebSettings*, pdwrestrictions : WPCFLAG_RESTRICTION*) : HRESULT
    @lpVtbl.value.get_restrictions.call(this, pdwrestrictions)
  end
  def get_settings(this : IWPCWebSettings*, pdwsettings : WPCFLAG_WEB_SETTING*) : HRESULT
    @lpVtbl.value.get_settings.call(this, pdwsettings)
  end
  def request_url_override(this : IWPCWebSettings*, hwnd : LibC::HANDLE, pcszurl : LibC::LPWSTR, curls : UInt32, ppcszsuburls : LibC::LPWSTR*, pfchanged : LibC::BOOL*) : HRESULT
    @lpVtbl.value.request_url_override.call(this, hwnd, pcszurl, curls, ppcszsuburls, pfchanged)
  end
end
struct LibWin32::IWindowsParentalControlsCore
  def query_interface(this : IWindowsParentalControlsCore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsParentalControlsCore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsParentalControlsCore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_visibility(this : IWindowsParentalControlsCore*, pevisibility : WPCFLAG_VISIBILITY*) : HRESULT
    @lpVtbl.value.get_visibility.call(this, pevisibility)
  end
  def get_user_settings(this : IWindowsParentalControlsCore*, pcszsid : LibC::LPWSTR, ppsettings : IWPCSettings*) : HRESULT
    @lpVtbl.value.get_user_settings.call(this, pcszsid, ppsettings)
  end
  def get_web_settings(this : IWindowsParentalControlsCore*, pcszsid : LibC::LPWSTR, ppsettings : IWPCWebSettings*) : HRESULT
    @lpVtbl.value.get_web_settings.call(this, pcszsid, ppsettings)
  end
  def get_web_filter_info(this : IWindowsParentalControlsCore*, pguidid : Guid*, ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_web_filter_info.call(this, pguidid, ppszname)
  end
end
struct LibWin32::IWindowsParentalControls
  def query_interface(this : IWindowsParentalControls*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsParentalControls*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsParentalControls*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_visibility(this : IWindowsParentalControls*, pevisibility : WPCFLAG_VISIBILITY*) : HRESULT
    @lpVtbl.value.get_visibility.call(this, pevisibility)
  end
  def get_user_settings(this : IWindowsParentalControls*, pcszsid : LibC::LPWSTR, ppsettings : IWPCSettings*) : HRESULT
    @lpVtbl.value.get_user_settings.call(this, pcszsid, ppsettings)
  end
  def get_web_settings(this : IWindowsParentalControls*, pcszsid : LibC::LPWSTR, ppsettings : IWPCWebSettings*) : HRESULT
    @lpVtbl.value.get_web_settings.call(this, pcszsid, ppsettings)
  end
  def get_web_filter_info(this : IWindowsParentalControls*, pguidid : Guid*, ppszname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_web_filter_info.call(this, pguidid, ppszname)
  end
  def get_games_settings(this : IWindowsParentalControls*, pcszsid : LibC::LPWSTR, ppsettings : IWPCGamesSettings*) : HRESULT
    @lpVtbl.value.get_games_settings.call(this, pcszsid, ppsettings)
  end
end
struct LibWin32::IWPCProviderSupport
  def query_interface(this : IWPCProviderSupport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWPCProviderSupport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWPCProviderSupport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current(this : IWPCProviderSupport*, pguidprovider : Guid*) : HRESULT
    @lpVtbl.value.get_current.call(this, pguidprovider)
  end
end
