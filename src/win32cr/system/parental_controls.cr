require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::ParentalControls
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

  enum WPCFLAG_OVERRIDE
    WPCFLAG_APPLICATION = 1_i32
  end
  enum WPCFLAG_RESTRICTION
    WPCFLAG_NO_RESTRICTION = 0_i32
    WPCFLAG_LOGGING_REQUIRED = 1_i32
    WPCFLAG_WEB_FILTERED = 2_i32
    WPCFLAG_HOURS_RESTRICTED = 4_i32
    WPCFLAG_GAMES_BLOCKED = 8_i32
    WPCFLAG_APPS_RESTRICTED = 16_i32
    WPCFLAG_TIME_ALLOWANCE_RESTRICTED = 32_i32
    WPCFLAG_GAMES_RESTRICTED = 64_i32
  end
  enum WPCFLAG_WEB_SETTING
    WPCFLAG_WEB_SETTING_NOTBLOCKED = 0_i32
    WPCFLAG_WEB_SETTING_DOWNLOADSBLOCKED = 1_i32
  end
  enum WPCFLAG_VISIBILITY
    WPCFLAG_WPC_VISIBLE = 0_i32
    WPCFLAG_WPC_HIDDEN = 1_i32
  end
  enum WPCFLAG_ISBLOCKED
    WPCFLAG_ISBLOCKED_NOTBLOCKED = 0_i32
    WPCFLAG_ISBLOCKED_IMBLOCKED = 1_i32
    WPCFLAG_ISBLOCKED_EMAILBLOCKED = 2_i32
    WPCFLAG_ISBLOCKED_MEDIAPLAYBACKBLOCKED = 4_i32
    WPCFLAG_ISBLOCKED_WEBBLOCKED = 8_i32
    WPCFLAG_ISBLOCKED_GAMESBLOCKED = 16_i32
    WPCFLAG_ISBLOCKED_CONTACTBLOCKED = 32_i32
    WPCFLAG_ISBLOCKED_FEATUREBLOCKED = 64_i32
    WPCFLAG_ISBLOCKED_DOWNLOADBLOCKED = 128_i32
    WPCFLAG_ISBLOCKED_RATINGBLOCKED = 256_i32
    WPCFLAG_ISBLOCKED_DESCRIPTORBLOCKED = 512_i32
    WPCFLAG_ISBLOCKED_EXPLICITBLOCK = 1024_i32
    WPCFLAG_ISBLOCKED_BADPASS = 2048_i32
    WPCFLAG_ISBLOCKED_MAXHOURS = 4096_i32
    WPCFLAG_ISBLOCKED_SPECHOURS = 8192_i32
    WPCFLAG_ISBLOCKED_SETTINGSCHANGEBLOCKED = 16384_i32
    WPCFLAG_ISBLOCKED_ATTACHMENTBLOCKED = 32768_i32
    WPCFLAG_ISBLOCKED_SENDERBLOCKED = 65536_i32
    WPCFLAG_ISBLOCKED_RECEIVERBLOCKED = 131072_i32
    WPCFLAG_ISBLOCKED_NOTEXPLICITLYALLOWED = 262144_i32
    WPCFLAG_ISBLOCKED_NOTINLIST = 524288_i32
    WPCFLAG_ISBLOCKED_CATEGORYBLOCKED = 1048576_i32
    WPCFLAG_ISBLOCKED_CATEGORYNOTINLIST = 2097152_i32
    WPCFLAG_ISBLOCKED_NOTKIDS = 4194304_i32
    WPCFLAG_ISBLOCKED_UNRATED = 8388608_i32
    WPCFLAG_ISBLOCKED_NOACCESS = 16777216_i32
    WPCFLAG_ISBLOCKED_INTERNALERROR = -1_i32
  end
  enum WPCFLAG_LOGOFF_TYPE
    WPCFLAG_LOGOFF_TYPE_LOGOUT = 0_i32
    WPCFLAG_LOGOFF_TYPE_RESTART = 1_i32
    WPCFLAG_LOGOFF_TYPE_SHUTDOWN = 2_i32
    WPCFLAG_LOGOFF_TYPE_FUS = 4_i32
    WPCFLAG_LOGOFF_TYPE_FORCEDFUS = 8_i32
  end
  enum WPCFLAG_IM_LEAVE
    WPCFLAG_IM_LEAVE_NORMAL = 0_i32
    WPCFLAG_IM_LEAVE_FORCED = 1_i32
    WPCFLAG_IM_LEAVE_CONVERSATION_END = 2_i32
  end
  enum WPC_ARGS_SETTINGSCHANGEEVENT
    WPC_ARGS_SETTINGSCHANGEEVENT_CLASS = 0_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_SETTING = 1_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_OWNER = 2_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_OLDVAL = 3_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_NEWVAL = 4_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_REASON = 5_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_OPTIONAL = 6_i32
    WPC_ARGS_SETTINGSCHANGEEVENT_CARGS = 7_i32
  end
  enum WPC_ARGS_SAFERAPPBLOCKED
    WPC_ARGS_SAFERAPPBLOCKED_TIMESTAMP = 0_i32
    WPC_ARGS_SAFERAPPBLOCKED_USERID = 1_i32
    WPC_ARGS_SAFERAPPBLOCKED_PATH = 2_i32
    WPC_ARGS_SAFERAPPBLOCKED_RULEID = 3_i32
    WPC_ARGS_SAFERAPPBLOCKED_CARGS = 4_i32
  end
  enum WPC_ARGS_EMAILRECEIEVEDEVENT
    WPC_ARGS_EMAILRECEIEVEDEVENT_SENDER = 0_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_APPNAME = 1_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_APPVERSION = 2_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_SUBJECT = 3_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_REASON = 4_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPCOUNT = 5_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPIENT = 6_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHCOUNT = 7_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHMENTNAME = 8_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_RECEIVEDTIME = 9_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_EMAILACCOUNT = 10_i32
    WPC_ARGS_EMAILRECEIEVEDEVENT_CARGS = 11_i32
  end
  enum WPC_ARGS_EMAILSENTEVENT
    WPC_ARGS_EMAILSENTEVENT_SENDER = 0_i32
    WPC_ARGS_EMAILSENTEVENT_APPNAME = 1_i32
    WPC_ARGS_EMAILSENTEVENT_APPVERSION = 2_i32
    WPC_ARGS_EMAILSENTEVENT_SUBJECT = 3_i32
    WPC_ARGS_EMAILSENTEVENT_REASON = 4_i32
    WPC_ARGS_EMAILSENTEVENT_RECIPCOUNT = 5_i32
    WPC_ARGS_EMAILSENTEVENT_RECIPIENT = 6_i32
    WPC_ARGS_EMAILSENTEVENT_ATTACHCOUNT = 7_i32
    WPC_ARGS_EMAILSENTEVENT_ATTACHMENTNAME = 8_i32
    WPC_ARGS_EMAILSENTEVENT_EMAILACCOUNT = 9_i32
    WPC_ARGS_EMAILSENTEVENT_CARGS = 10_i32
  end
  enum WPC_ARGS_EMAILCONTACTEVENT
    WPC_ARGS_EMAILCONTACTEVENT_APPNAME = 0_i32
    WPC_ARGS_EMAILCONTACTEVENT_APPVERSION = 1_i32
    WPC_ARGS_EMAILCONTACTEVENT_OLDNAME = 2_i32
    WPC_ARGS_EMAILCONTACTEVENT_OLDID = 3_i32
    WPC_ARGS_EMAILCONTACTEVENT_NEWNAME = 4_i32
    WPC_ARGS_EMAILCONTACTEVENT_NEWID = 5_i32
    WPC_ARGS_EMAILCONTACTEVENT_REASON = 6_i32
    WPC_ARGS_EMAILCONTACTEVENT_EMAILACCOUNT = 7_i32
    WPC_ARGS_EMAILCONTACTEVENT_CARGS = 8_i32
  end
  enum WPC_MEDIA_TYPE
    WPC_MEDIA_TYPE_OTHER = 0_i32
    WPC_MEDIA_TYPE_DVD = 1_i32
    WPC_MEDIA_TYPE_RECORDED_TV = 2_i32
    WPC_MEDIA_TYPE_AUDIO_FILE = 3_i32
    WPC_MEDIA_TYPE_CD_AUDIO = 4_i32
    WPC_MEDIA_TYPE_VIDEO_FILE = 5_i32
    WPC_MEDIA_TYPE_PICTURE_FILE = 6_i32
    WPC_MEDIA_TYPE_MAX = 7_i32
  end
  enum WPC_MEDIA_EXPLICIT
    WPC_MEDIA_EXPLICIT_FALSE = 0_i32
    WPC_MEDIA_EXPLICIT_TRUE = 1_i32
    WPC_MEDIA_EXPLICIT_UNKNOWN = 2_i32
  end
  enum WPC_ARGS_MEDIAPLAYBACKEVENT
    WPC_ARGS_MEDIAPLAYBACKEVENT_APPNAME = 0_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_APPVERSION = 1_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_MEDIATYPE = 2_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_PATH = 3_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_TITLE = 4_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_PML = 5_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_ALBUM = 6_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_EXPLICIT = 7_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_REASON = 8_i32
    WPC_ARGS_MEDIAPLAYBACKEVENT_CARGS = 9_i32
  end
  enum WPC_ARGS_MEDIADOWNLOADEVENT
    WPC_ARGS_MEDIADOWNLOADEVENT_APPNAME = 0_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_APPVERSION = 1_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_MEDIATYPE = 2_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_PATH = 3_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_TITLE = 4_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_PML = 5_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_ALBUM = 6_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_EXPLICIT = 7_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_REASON = 8_i32
    WPC_ARGS_MEDIADOWNLOADEVENT_CARGS = 9_i32
  end
  enum WPC_ARGS_CONVERSATIONINITEVENT
    WPC_ARGS_CONVERSATIONINITEVENT_APPNAME = 0_i32
    WPC_ARGS_CONVERSATIONINITEVENT_APPVERSION = 1_i32
    WPC_ARGS_CONVERSATIONINITEVENT_ACCOUNTNAME = 2_i32
    WPC_ARGS_CONVERSATIONINITEVENT_CONVID = 3_i32
    WPC_ARGS_CONVERSATIONINITEVENT_REQUESTINGIP = 4_i32
    WPC_ARGS_CONVERSATIONINITEVENT_SENDER = 5_i32
    WPC_ARGS_CONVERSATIONINITEVENT_REASON = 6_i32
    WPC_ARGS_CONVERSATIONINITEVENT_RECIPCOUNT = 7_i32
    WPC_ARGS_CONVERSATIONINITEVENT_RECIPIENT = 8_i32
    WPC_ARGS_CONVERSATIONINITEVENT_CARGS = 9_i32
  end
  enum WPC_ARGS_CONVERSATIONJOINEVENT
    WPC_ARGS_CONVERSATIONJOINEVENT_APPNAME = 0_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_APPVERSION = 1_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_ACCOUNTNAME = 2_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_CONVID = 3_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_JOININGIP = 4_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_JOININGUSER = 5_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_REASON = 6_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_MEMBERCOUNT = 7_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_MEMBER = 8_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_SENDER = 9_i32
    WPC_ARGS_CONVERSATIONJOINEVENT_CARGS = 10_i32
  end
  enum WPC_ARGS_CONVERSATIONLEAVEEVENT
    WPC_ARGS_CONVERSATIONLEAVEEVENT_APPNAME = 0_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_APPVERSION = 1_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_ACCOUNTNAME = 2_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_CONVID = 3_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGIP = 4_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGUSER = 5_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_REASON = 6_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBERCOUNT = 7_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBER = 8_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_FLAGS = 9_i32
    WPC_ARGS_CONVERSATIONLEAVEEVENT_CARGS = 10_i32
  end
  enum WPCFLAG_IM_FEATURE
    WPCFLAG_IM_FEATURE_NONE = 0_i32
    WPCFLAG_IM_FEATURE_VIDEO = 1_i32
    WPCFLAG_IM_FEATURE_AUDIO = 2_i32
    WPCFLAG_IM_FEATURE_GAME = 4_i32
    WPCFLAG_IM_FEATURE_SMS = 8_i32
    WPCFLAG_IM_FEATURE_FILESWAP = 16_i32
    WPCFLAG_IM_FEATURE_URLSWAP = 32_i32
    WPCFLAG_IM_FEATURE_SENDING = -2147483648_i32
    WPCFLAG_IM_FEATURE_ALL = -1_i32
  end
  enum WPC_ARGS_IMFEATUREEVENT
    WPC_ARGS_IMFEATUREEVENT_APPNAME = 0_i32
    WPC_ARGS_IMFEATUREEVENT_APPVERSION = 1_i32
    WPC_ARGS_IMFEATUREEVENT_ACCOUNTNAME = 2_i32
    WPC_ARGS_IMFEATUREEVENT_CONVID = 3_i32
    WPC_ARGS_IMFEATUREEVENT_MEDIATYPE = 4_i32
    WPC_ARGS_IMFEATUREEVENT_REASON = 5_i32
    WPC_ARGS_IMFEATUREEVENT_RECIPCOUNT = 6_i32
    WPC_ARGS_IMFEATUREEVENT_RECIPIENT = 7_i32
    WPC_ARGS_IMFEATUREEVENT_SENDER = 8_i32
    WPC_ARGS_IMFEATUREEVENT_SENDERIP = 9_i32
    WPC_ARGS_IMFEATUREEVENT_DATA = 10_i32
    WPC_ARGS_IMFEATUREEVENT_CARGS = 11_i32
  end
  enum WPC_ARGS_IMCONTACTEVENT
    WPC_ARGS_IMCONTACTEVENT_APPNAME = 0_i32
    WPC_ARGS_IMCONTACTEVENT_APPVERSION = 1_i32
    WPC_ARGS_IMCONTACTEVENT_ACCOUNTNAME = 2_i32
    WPC_ARGS_IMCONTACTEVENT_OLDNAME = 3_i32
    WPC_ARGS_IMCONTACTEVENT_OLDID = 4_i32
    WPC_ARGS_IMCONTACTEVENT_NEWNAME = 5_i32
    WPC_ARGS_IMCONTACTEVENT_NEWID = 6_i32
    WPC_ARGS_IMCONTACTEVENT_REASON = 7_i32
    WPC_ARGS_IMCONTACTEVENT_CARGS = 8_i32
  end
  enum WPC_ARGS_GAMESTARTEVENT
    WPC_ARGS_GAMESTARTEVENT_APPID = 0_i32
    WPC_ARGS_GAMESTARTEVENT_INSTANCEID = 1_i32
    WPC_ARGS_GAMESTARTEVENT_APPVERSION = 2_i32
    WPC_ARGS_GAMESTARTEVENT_PATH = 3_i32
    WPC_ARGS_GAMESTARTEVENT_RATING = 4_i32
    WPC_ARGS_GAMESTARTEVENT_RATINGSYSTEM = 5_i32
    WPC_ARGS_GAMESTARTEVENT_REASON = 6_i32
    WPC_ARGS_GAMESTARTEVENT_DESCCOUNT = 7_i32
    WPC_ARGS_GAMESTARTEVENT_DESCRIPTOR = 8_i32
    WPC_ARGS_GAMESTARTEVENT_PID = 9_i32
    WPC_ARGS_GAMESTARTEVENT_CARGS = 10_i32
  end
  enum WPC_ARGS_FILEDOWNLOADEVENT
    WPC_ARGS_FILEDOWNLOADEVENT_URL = 0_i32
    WPC_ARGS_FILEDOWNLOADEVENT_APPNAME = 1_i32
    WPC_ARGS_FILEDOWNLOADEVENT_VERSION = 2_i32
    WPC_ARGS_FILEDOWNLOADEVENT_BLOCKED = 3_i32
    WPC_ARGS_FILEDOWNLOADEVENT_PATH = 4_i32
    WPC_ARGS_FILEDOWNLOADEVENT_CARGS = 5_i32
  end
  enum WPC_ARGS_URLVISITEVENT
    WPC_ARGS_URLVISITEVENT_URL = 0_i32
    WPC_ARGS_URLVISITEVENT_APPNAME = 1_i32
    WPC_ARGS_URLVISITEVENT_VERSION = 2_i32
    WPC_ARGS_URLVISITEVENT_REASON = 3_i32
    WPC_ARGS_URLVISITEVENT_RATINGSYSTEMID = 4_i32
    WPC_ARGS_URLVISITEVENT_CATCOUNT = 5_i32
    WPC_ARGS_URLVISITEVENT_CATEGORY = 6_i32
    WPC_ARGS_URLVISITEVENT_CARGS = 7_i32
  end
  enum WPC_ARGS_WEBSITEVISITEVENT
    WPC_ARGS_WEBSITEVISITEVENT_URL = 0_i32
    WPC_ARGS_WEBSITEVISITEVENT_DECISION = 1_i32
    WPC_ARGS_WEBSITEVISITEVENT_CATEGORIES = 2_i32
    WPC_ARGS_WEBSITEVISITEVENT_BLOCKEDCATEGORIES = 3_i32
    WPC_ARGS_WEBSITEVISITEVENT_SERIALIZEDAPPLICATION = 4_i32
    WPC_ARGS_WEBSITEVISITEVENT_TITLE = 5_i32
    WPC_ARGS_WEBSITEVISITEVENT_CONTENTTYPE = 6_i32
    WPC_ARGS_WEBSITEVISITEVENT_REFERRER = 7_i32
    WPC_ARGS_WEBSITEVISITEVENT_TELEMETRY = 8_i32
    WPC_ARGS_WEBSITEVISITEVENT_CARGS = 9_i32
  end
  enum WPC_ARGS_APPLICATIONEVENT
    WPC_ARGS_APPLICATIONEVENT_SERIALIZEDAPPLICATION = 0_i32
    WPC_ARGS_APPLICATIONEVENT_DECISION = 1_i32
    WPC_ARGS_APPLICATIONEVENT_PROCESSID = 2_i32
    WPC_ARGS_APPLICATIONEVENT_CREATIONTIME = 3_i32
    WPC_ARGS_APPLICATIONEVENT_TIMEUSED = 4_i32
    WPC_ARGS_APPLICATIONEVENT_CARGS = 5_i32
  end
  enum WPC_ARGS_COMPUTERUSAGEEVENT
    WPC_ARGS_COMPUTERUSAGEEVENT_ID = 0_i32
    WPC_ARGS_COMPUTERUSAGEEVENT_TIMEUSED = 1_i32
    WPC_ARGS_COMPUTERUSAGEEVENT_CARGS = 2_i32
  end
  enum WPC_ARGS_CONTENTUSAGEEVENT
    WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERID = 0_i32
    WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERTITLE = 1_i32
    WPC_ARGS_CONTENTUSAGEEVENT_ID = 2_i32
    WPC_ARGS_CONTENTUSAGEEVENT_TITLE = 3_i32
    WPC_ARGS_CONTENTUSAGEEVENT_CATEGORY = 4_i32
    WPC_ARGS_CONTENTUSAGEEVENT_RATINGS = 5_i32
    WPC_ARGS_CONTENTUSAGEEVENT_DECISION = 6_i32
    WPC_ARGS_CONTENTUSAGEEVENT_CARGS = 7_i32
  end
  enum WPC_ARGS_CUSTOMEVENT
    WPC_ARGS_CUSTOMEVENT_PUBLISHER = 0_i32
    WPC_ARGS_CUSTOMEVENT_APPNAME = 1_i32
    WPC_ARGS_CUSTOMEVENT_APPVERSION = 2_i32
    WPC_ARGS_CUSTOMEVENT_EVENT = 3_i32
    WPC_ARGS_CUSTOMEVENT_VALUE1 = 4_i32
    WPC_ARGS_CUSTOMEVENT_VALUE2 = 5_i32
    WPC_ARGS_CUSTOMEVENT_VALUE3 = 6_i32
    WPC_ARGS_CUSTOMEVENT_BLOCKED = 7_i32
    WPC_ARGS_CUSTOMEVENT_REASON = 8_i32
    WPC_ARGS_CUSTOMEVENT_CARGS = 9_i32
  end
  enum WPC_ARGS_WEBOVERRIDEEVENT
    WPC_ARGS_WEBOVERRIDEEVENT_USERID = 0_i32
    WPC_ARGS_WEBOVERRIDEEVENT_URL = 1_i32
    WPC_ARGS_WEBOVERRIDEEVENT_REASON = 2_i32
    WPC_ARGS_WEBOVERRIDEEVENT_CARGS = 3_i32
  end
  enum WPC_ARGS_APPOVERRIDEEVENT
    WPC_ARGS_APPOVERRIDEEVENT_USERID = 0_i32
    WPC_ARGS_APPOVERRIDEEVENT_PATH = 1_i32
    WPC_ARGS_APPOVERRIDEEVENT_REASON = 2_i32
    WPC_ARGS_APPOVERRIDEEVENT_CARGS = 3_i32
  end
  enum WPC_SETTINGS
    WPC_SETTINGS_WPC_EXTENSION_PATH = 0_i32
    WPC_SETTINGS_WPC_EXTENSION_SILO = 1_i32
    WPC_SETTINGS_WPC_EXTENSION_IMAGE_PATH = 2_i32
    WPC_SETTINGS_WPC_EXTENSION_DISABLEDIMAGE_PATH = 3_i32
    WPC_SETTINGS_WPC_EXTENSION_NAME = 4_i32
    WPC_SETTINGS_WPC_EXTENSION_SUB_TITLE = 5_i32
    WPC_SETTINGS_SYSTEM_CURRENT_RATING_SYSTEM = 6_i32
    WPC_SETTINGS_SYSTEM_LAST_LOG_VIEW = 7_i32
    WPC_SETTINGS_SYSTEM_LOG_VIEW_REMINDER_INTERVAL = 8_i32
    WPC_SETTINGS_SYSTEM_HTTP_EXEMPTION_LIST = 9_i32
    WPC_SETTINGS_SYSTEM_URL_EXEMPTION_LIST = 10_i32
    WPC_SETTINGS_SYSTEM_FILTER_ID = 11_i32
    WPC_SETTINGS_SYSTEM_FILTER_NAME = 12_i32
    WPC_SETTINGS_SYSTEM_LOCALE = 13_i32
    WPC_SETTINGS_ALLOW_BLOCK = 14_i32
    WPC_SETTINGS_GAME_BLOCKED = 15_i32
    WPC_SETTINGS_GAME_ALLOW_UNRATED = 16_i32
    WPC_SETTINGS_GAME_MAX_ALLOWED = 17_i32
    WPC_SETTINGS_GAME_DENIED_DESCRIPTORS = 18_i32
    WPC_SETTINGS_USER_WPC_ENABLED = 19_i32
    WPC_SETTINGS_USER_LOGGING_REQUIRED = 20_i32
    WPC_SETTINGS_USER_HOURLY_RESTRICTIONS = 21_i32
    WPC_SETTINGS_USER_OVERRRIDE_REQUESTS = 22_i32
    WPC_SETTINGS_USER_LOGON_HOURS = 23_i32
    WPC_SETTINGS_USER_APP_RESTRICTIONS = 24_i32
    WPC_SETTINGS_WEB_FILTER_ON = 25_i32
    WPC_SETTINGS_WEB_DOWNLOAD_BLOCKED = 26_i32
    WPC_SETTINGS_WEB_FILTER_LEVEL = 27_i32
    WPC_SETTINGS_WEB_BLOCKED_CATEGORY_LIST = 28_i32
    WPC_SETTINGS_WEB_BLOCK_UNRATED = 29_i32
    WPC_SETTINGS_WPC_ENABLED = 30_i32
    WPC_SETTINGS_WPC_LOGGING_REQUIRED = 31_i32
    WPC_SETTINGS_RATING_SYSTEM_PATH = 32_i32
    WPC_SETTINGS_WPC_PROVIDER_CURRENT = 33_i32
    WPC_SETTINGS_USER_TIME_ALLOWANCE = 34_i32
    WPC_SETTINGS_USER_TIME_ALLOWANCE_RESTRICTIONS = 35_i32
    WPC_SETTINGS_GAME_RESTRICTED = 36_i32
    WPC_SETTING_COUNT = 37_i32
  end

  @[Extern]
  record IWPCProviderStateVtbl,
    query_interface : Proc(IWPCProviderState*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWPCProviderState*, UInt32),
    release : Proc(IWPCProviderState*, UInt32),
    enable : Proc(IWPCProviderState*, Win32cr::Foundation::HRESULT),
    disable : Proc(IWPCProviderState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWPCProviderState, lpVtbl : IWPCProviderStateVtbl* do
    GUID = LibC::GUID.new(0x50b6a267_u32, 0xc4bd_u16, 0x450b_u16, StaticArray[0xad_u8, 0xb5_u8, 0x75_u8, 0x90_u8, 0x73_u8, 0x83_u8, 0x7c_u8, 0x9e_u8])
    def query_interface(this : IWPCProviderState*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWPCProviderState*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWPCProviderState*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable(this : IWPCProviderState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def disable(this : IWPCProviderState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this)
    end

  end

  @[Extern]
  record IWPCProviderConfigVtbl,
    query_interface : Proc(IWPCProviderConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWPCProviderConfig*, UInt32),
    release : Proc(IWPCProviderConfig*, UInt32),
    get_user_summary : Proc(IWPCProviderConfig*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    configure : Proc(IWPCProviderConfig*, Win32cr::Foundation::HWND, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    request_override : Proc(IWPCProviderConfig*, Win32cr::Foundation::HWND, Win32cr::Foundation::BSTR, Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWPCProviderConfig, lpVtbl : IWPCProviderConfigVtbl* do
    GUID = LibC::GUID.new(0xbef54196_u32, 0x2d02_u16, 0x4a26_u16, StaticArray[0xb6_u8, 0xe5_u8, 0xd6_u8, 0x5a_u8, 0xf2_u8, 0x95_u8, 0xd0_u8, 0xf1_u8])
    def query_interface(this : IWPCProviderConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWPCProviderConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWPCProviderConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_user_summary(this : IWPCProviderConfig*, bstrSID : Win32cr::Foundation::BSTR, pbstrUserSummary : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_summary.call(this, bstrSID, pbstrUserSummary)
    end
    def configure(this : IWPCProviderConfig*, hWnd : Win32cr::Foundation::HWND, bstrSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure.call(this, hWnd, bstrSID)
    end
    def request_override(this : IWPCProviderConfig*, hWnd : Win32cr::Foundation::HWND, bstrPath : Win32cr::Foundation::BSTR, dwFlags : Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_override.call(this, hWnd, bstrPath, dwFlags)
    end

  end

  @[Extern]
  record IWPCSettingsVtbl,
    query_interface : Proc(IWPCSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWPCSettings*, UInt32),
    release : Proc(IWPCSettings*, UInt32),
    is_logging_required : Proc(IWPCSettings*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_last_settings_change_time : Proc(IWPCSettings*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_restrictions : Proc(IWPCSettings*, Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWPCSettings, lpVtbl : IWPCSettingsVtbl* do
    GUID = LibC::GUID.new(0x8fdf6ca1_u32, 0x189_u16, 0x47e4_u16, StaticArray[0xb6_u8, 0x70_u8, 0x1a_u8, 0x8a_u8, 0x46_u8, 0x36_u8, 0xe3_u8, 0x40_u8])
    def query_interface(this : IWPCSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWPCSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWPCSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_logging_required(this : IWPCSettings*, pfRequired : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_logging_required.call(this, pfRequired)
    end
    def get_last_settings_change_time(this : IWPCSettings*, pTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_settings_change_time.call(this, pTime)
    end
    def get_restrictions(this : IWPCSettings*, pdwRestrictions : Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrictions.call(this, pdwRestrictions)
    end

  end

  @[Extern]
  record IWPCGamesSettingsVtbl,
    query_interface : Proc(IWPCGamesSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWPCGamesSettings*, UInt32),
    release : Proc(IWPCGamesSettings*, UInt32),
    is_logging_required : Proc(IWPCGamesSettings*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_last_settings_change_time : Proc(IWPCGamesSettings*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_restrictions : Proc(IWPCGamesSettings*, Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION*, Win32cr::Foundation::HRESULT),
    is_blocked : Proc(IWPCGamesSettings*, LibC::GUID, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWPCGamesSettings, lpVtbl : IWPCGamesSettingsVtbl* do
    GUID = LibC::GUID.new(0x95e87780_u32, 0xe158_u16, 0x489e_u16, StaticArray[0xb4_u8, 0x52_u8, 0xbb_u8, 0xb8_u8, 0x50_u8, 0x79_u8, 0x7_u8, 0x15_u8])
    def query_interface(this : IWPCGamesSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWPCGamesSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWPCGamesSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_logging_required(this : IWPCGamesSettings*, pfRequired : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_logging_required.call(this, pfRequired)
    end
    def get_last_settings_change_time(this : IWPCGamesSettings*, pTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_settings_change_time.call(this, pTime)
    end
    def get_restrictions(this : IWPCGamesSettings*, pdwRestrictions : Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrictions.call(this, pdwRestrictions)
    end
    def is_blocked(this : IWPCGamesSettings*, guidAppID : LibC::GUID, pdwReasons : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_blocked.call(this, guidAppID, pdwReasons)
    end

  end

  @[Extern]
  record IWPCWebSettingsVtbl,
    query_interface : Proc(IWPCWebSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWPCWebSettings*, UInt32),
    release : Proc(IWPCWebSettings*, UInt32),
    is_logging_required : Proc(IWPCWebSettings*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_last_settings_change_time : Proc(IWPCWebSettings*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_restrictions : Proc(IWPCWebSettings*, Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION*, Win32cr::Foundation::HRESULT),
    get_settings : Proc(IWPCWebSettings*, Win32cr::System::ParentalControls::WPCFLAG_WEB_SETTING*, Win32cr::Foundation::HRESULT),
    request_url_override : Proc(IWPCWebSettings*, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWPCWebSettings, lpVtbl : IWPCWebSettingsVtbl* do
    GUID = LibC::GUID.new(0xffccbdb8_u32, 0x992_u16, 0x4c30_u16, StaticArray[0xb0_u8, 0xf1_u8, 0x1c_u8, 0xbb_u8, 0x9_u8, 0xc2_u8, 0x40_u8, 0xaa_u8])
    def query_interface(this : IWPCWebSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWPCWebSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWPCWebSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_logging_required(this : IWPCWebSettings*, pfRequired : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_logging_required.call(this, pfRequired)
    end
    def get_last_settings_change_time(this : IWPCWebSettings*, pTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_settings_change_time.call(this, pTime)
    end
    def get_restrictions(this : IWPCWebSettings*, pdwRestrictions : Win32cr::System::ParentalControls::WPCFLAG_RESTRICTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrictions.call(this, pdwRestrictions)
    end
    def get_settings(this : IWPCWebSettings*, pdwSettings : Win32cr::System::ParentalControls::WPCFLAG_WEB_SETTING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_settings.call(this, pdwSettings)
    end
    def request_url_override(this : IWPCWebSettings*, hWnd : Win32cr::Foundation::HWND, pcszURL : Win32cr::Foundation::PWSTR, cURLs : UInt32, ppcszSubURLs : Win32cr::Foundation::PWSTR*, pfChanged : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_url_override.call(this, hWnd, pcszURL, cURLs, ppcszSubURLs, pfChanged)
    end

  end

  @[Extern]
  record IWindowsParentalControlsCoreVtbl,
    query_interface : Proc(IWindowsParentalControlsCore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsParentalControlsCore*, UInt32),
    release : Proc(IWindowsParentalControlsCore*, UInt32),
    get_visibility : Proc(IWindowsParentalControlsCore*, Win32cr::System::ParentalControls::WPCFLAG_VISIBILITY*, Win32cr::Foundation::HRESULT),
    get_user_settings : Proc(IWindowsParentalControlsCore*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_web_settings : Proc(IWindowsParentalControlsCore*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_web_filter_info : Proc(IWindowsParentalControlsCore*, LibC::GUID*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsParentalControlsCore, lpVtbl : IWindowsParentalControlsCoreVtbl* do
    GUID = LibC::GUID.new(0x4ff40a0f_u32, 0x3f3b_u16, 0x4d7c_u16, StaticArray[0xa4_u8, 0x1b_u8, 0x4f_u8, 0x39_u8, 0xd7_u8, 0xb4_u8, 0x4d_u8, 0x5_u8])
    def query_interface(this : IWindowsParentalControlsCore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsParentalControlsCore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsParentalControlsCore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_visibility(this : IWindowsParentalControlsCore*, peVisibility : Win32cr::System::ParentalControls::WPCFLAG_VISIBILITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visibility.call(this, peVisibility)
    end
    def get_user_settings(this : IWindowsParentalControlsCore*, pcszSID : Win32cr::Foundation::PWSTR, ppSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_settings.call(this, pcszSID, ppSettings)
    end
    def get_web_settings(this : IWindowsParentalControlsCore*, pcszSID : Win32cr::Foundation::PWSTR, ppSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_web_settings.call(this, pcszSID, ppSettings)
    end
    def get_web_filter_info(this : IWindowsParentalControlsCore*, pguidID : LibC::GUID*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_web_filter_info.call(this, pguidID, ppszName)
    end

  end

  @[Extern]
  record IWindowsParentalControlsVtbl,
    query_interface : Proc(IWindowsParentalControls*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsParentalControls*, UInt32),
    release : Proc(IWindowsParentalControls*, UInt32),
    get_visibility : Proc(IWindowsParentalControls*, Win32cr::System::ParentalControls::WPCFLAG_VISIBILITY*, Win32cr::Foundation::HRESULT),
    get_user_settings : Proc(IWindowsParentalControls*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_web_settings : Proc(IWindowsParentalControls*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_web_filter_info : Proc(IWindowsParentalControls*, LibC::GUID*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_games_settings : Proc(IWindowsParentalControls*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsParentalControls, lpVtbl : IWindowsParentalControlsVtbl* do
    GUID = LibC::GUID.new(0x28b4d88b_u32, 0xe072_u16, 0x49e6_u16, StaticArray[0x80_u8, 0x4d_u8, 0x26_u8, 0xed_u8, 0xbe_u8, 0x21_u8, 0xa7_u8, 0xb9_u8])
    def query_interface(this : IWindowsParentalControls*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsParentalControls*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsParentalControls*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_visibility(this : IWindowsParentalControls*, peVisibility : Win32cr::System::ParentalControls::WPCFLAG_VISIBILITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visibility.call(this, peVisibility)
    end
    def get_user_settings(this : IWindowsParentalControls*, pcszSID : Win32cr::Foundation::PWSTR, ppSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_settings.call(this, pcszSID, ppSettings)
    end
    def get_web_settings(this : IWindowsParentalControls*, pcszSID : Win32cr::Foundation::PWSTR, ppSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_web_settings.call(this, pcszSID, ppSettings)
    end
    def get_web_filter_info(this : IWindowsParentalControls*, pguidID : LibC::GUID*, ppszName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_web_filter_info.call(this, pguidID, ppszName)
    end
    def get_games_settings(this : IWindowsParentalControls*, pcszSID : Win32cr::Foundation::PWSTR, ppSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_games_settings.call(this, pcszSID, ppSettings)
    end

  end

  @[Extern]
  record IWPCProviderSupportVtbl,
    query_interface : Proc(IWPCProviderSupport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWPCProviderSupport*, UInt32),
    release : Proc(IWPCProviderSupport*, UInt32),
    get_current : Proc(IWPCProviderSupport*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWPCProviderSupport, lpVtbl : IWPCProviderSupportVtbl* do
    GUID = LibC::GUID.new(0x41eba572_u32, 0x23ed_u16, 0x4779_u16, StaticArray[0xbe_u8, 0xc1_u8, 0x8d_u8, 0xf9_u8, 0x62_u8, 0x6_u8, 0xc4_u8, 0x4c_u8])
    def query_interface(this : IWPCProviderSupport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWPCProviderSupport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWPCProviderSupport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current(this : IWPCProviderSupport*, pguidProvider : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, pguidProvider)
    end

  end

end