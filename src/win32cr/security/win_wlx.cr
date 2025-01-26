require "./../foundation.cr"
require "./../security.cr"
require "./../system/stations_and_desktops.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::Security::WinWlx
  alias PWLX_USE_CTRL_ALT_DEL = Proc(Win32cr::Foundation::HANDLE, Void)

  alias PWLX_SET_CONTEXT_POINTER = Proc(Win32cr::Foundation::HANDLE, Void*, Void)

  alias PWLX_SAS_NOTIFY = Proc(Win32cr::Foundation::HANDLE, UInt32, Void)

  alias PWLX_SET_TIMEOUT = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::BOOL)

  alias PWLX_ASSIGN_SHELL_PROTECTION = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Int32)

  alias PWLX_MESSAGE_BOX = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HWND, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, Int32)

  alias PWLX_DIALOG_BOX = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HWND, Win32cr::UI::WindowsAndMessaging::DLGPROC, Int32)

  alias PWLX_DIALOG_BOX_INDIRECT = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::UI::WindowsAndMessaging::DLGTEMPLATE*, Win32cr::Foundation::HWND, Win32cr::UI::WindowsAndMessaging::DLGPROC, Int32)

  alias PWLX_DIALOG_BOX_PARAM = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HWND, Win32cr::UI::WindowsAndMessaging::DLGPROC, Win32cr::Foundation::LPARAM, Int32)

  alias PWLX_DIALOG_BOX_INDIRECT_PARAM = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::UI::WindowsAndMessaging::DLGTEMPLATE*, Win32cr::Foundation::HWND, Win32cr::UI::WindowsAndMessaging::DLGPROC, Win32cr::Foundation::LPARAM, Int32)

  alias PWLX_SWITCH_DESKTOP_TO_USER = Proc(Win32cr::Foundation::HANDLE, Int32)

  alias PWLX_SWITCH_DESKTOP_TO_WINLOGON = Proc(Win32cr::Foundation::HANDLE, Int32)

  alias PWLX_CHANGE_PASSWORD_NOTIFY = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::WinWlx::WLX_MPR_NOTIFY_INFO*, UInt32, Int32)

  alias PWLX_GET_SOURCE_DESKTOP = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::WinWlx::WLX_DESKTOP**, Win32cr::Foundation::BOOL)

  alias PWLX_SET_RETURN_DESKTOP = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::WinWlx::WLX_DESKTOP*, Win32cr::Foundation::BOOL)

  alias PWLX_CREATE_USER_DESKTOP = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Security::WinWlx::WLX_DESKTOP**, Win32cr::Foundation::BOOL)

  alias PWLX_CHANGE_PASSWORD_NOTIFY_EX = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::WinWlx::WLX_MPR_NOTIFY_INFO*, UInt32, Win32cr::Foundation::PWSTR, Void*, Int32)

  alias PWLX_CLOSE_USER_DESKTOP = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::WinWlx::WLX_DESKTOP*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)

  alias PWLX_SET_OPTION = Proc(Win32cr::Foundation::HANDLE, UInt32, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::BOOL)

  alias PWLX_GET_OPTION = Proc(Win32cr::Foundation::HANDLE, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::BOOL)

  alias PWLX_WIN31_MIGRATE = Proc(Win32cr::Foundation::HANDLE, Void)

  alias PWLX_QUERY_CLIENT_CREDENTIALS = Proc(Win32cr::Security::WinWlx::WLX_CLIENT_CREDENTIALS_INFO_V1_0*, Win32cr::Foundation::BOOL)

  alias PWLX_QUERY_IC_CREDENTIALS = Proc(Win32cr::Security::WinWlx::WLX_CLIENT_CREDENTIALS_INFO_V1_0*, Win32cr::Foundation::BOOL)

  alias PWLX_QUERY_TS_LOGON_CREDENTIALS = Proc(Win32cr::Security::WinWlx::WLX_CLIENT_CREDENTIALS_INFO_V2_0*, Win32cr::Foundation::BOOL)

  alias PWLX_DISCONNECT = Proc(Win32cr::Foundation::BOOL)

  alias PWLX_QUERY_TERMINAL_SERVICES_DATA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::WinWlx::WLX_TERMINAL_SERVICES_DATA*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32)

  alias PWLX_QUERY_CONSOLESWITCH_CREDENTIALS = Proc(Win32cr::Security::WinWlx::WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0*, UInt32)

  alias PFNMSGECALLBACK = Proc(Win32cr::Foundation::BOOL, Win32cr::Foundation::PWSTR, UInt32)

  WLX_VERSION_1_0 = 65536_u32
  WLX_VERSION_1_1 = 65537_u32
  WLX_VERSION_1_2 = 65538_u32
  WLX_VERSION_1_3 = 65539_u32
  WLX_VERSION_1_4 = 65540_u32
  WLX_CURRENT_VERSION = 65540_u32
  WLX_SAS_TYPE_TIMEOUT = 0_u32
  WLX_SAS_TYPE_CTRL_ALT_DEL = 1_u32
  WLX_SAS_TYPE_SCRNSVR_TIMEOUT = 2_u32
  WLX_SAS_TYPE_SCRNSVR_ACTIVITY = 3_u32
  WLX_SAS_TYPE_USER_LOGOFF = 4_u32
  WLX_SAS_TYPE_SC_INSERT = 5_u32
  WLX_SAS_TYPE_SC_REMOVE = 6_u32
  WLX_SAS_TYPE_AUTHENTICATED = 7_u32
  WLX_SAS_TYPE_SC_FIRST_READER_ARRIVED = 8_u32
  WLX_SAS_TYPE_SC_LAST_READER_REMOVED = 9_u32
  WLX_SAS_TYPE_SWITCHUSER = 10_u32
  WLX_SAS_TYPE_MAX_MSFT_VALUE = 127_u32
  WLX_LOGON_OPT_NO_PROFILE = 1_u32
  WLX_PROFILE_TYPE_V1_0 = 1_u32
  WLX_PROFILE_TYPE_V2_0 = 2_u32
  WLX_SAS_ACTION_LOGON = 1_u32
  WLX_SAS_ACTION_NONE = 2_u32
  WLX_SAS_ACTION_LOCK_WKSTA = 3_u32
  WLX_SAS_ACTION_LOGOFF = 4_u32
  WLX_SAS_ACTION_PWD_CHANGED = 6_u32
  WLX_SAS_ACTION_TASKLIST = 7_u32
  WLX_SAS_ACTION_UNLOCK_WKSTA = 8_u32
  WLX_SAS_ACTION_FORCE_LOGOFF = 9_u32
  WLX_SAS_ACTION_SHUTDOWN_SLEEP = 12_u32
  WLX_SAS_ACTION_SHUTDOWN_SLEEP2 = 13_u32
  WLX_SAS_ACTION_SHUTDOWN_HIBERNATE = 14_u32
  WLX_SAS_ACTION_RECONNECTED = 15_u32
  WLX_SAS_ACTION_DELAYED_FORCE_LOGOFF = 16_u32
  WLX_SAS_ACTION_SWITCH_CONSOLE = 17_u32
  WLX_WM_SAS = 1625_u32
  WLX_DLG_SAS = 101_u32
  WLX_DLG_INPUT_TIMEOUT = 102_u32
  WLX_DLG_SCREEN_SAVER_TIMEOUT = 103_u32
  WLX_DLG_USER_LOGOFF = 104_u32
  WLX_DIRECTORY_LENGTH = 256_u32
  WLX_CREDENTIAL_TYPE_V1_0 = 1_u32
  WLX_CREDENTIAL_TYPE_V2_0 = 2_u32
  WLX_CONSOLESWITCHCREDENTIAL_TYPE_V1_0 = 1_u32
  STATUSMSG_OPTION_NOANIMATION = 1_u32
  STATUSMSG_OPTION_SETFOREGROUND = 2_u32
  WLX_DESKTOP_NAME = 1_u32
  WLX_DESKTOP_HANDLE = 2_u32
  WLX_CREATE_INSTANCE_ONLY = 1_u32
  WLX_CREATE_USER = 2_u32
  WLX_OPTION_USE_CTRL_ALT_DEL = 1_u32
  WLX_OPTION_CONTEXT_POINTER = 2_u32
  WLX_OPTION_USE_SMART_CARD = 3_u32
  WLX_OPTION_FORCE_LOGOFF_TIME = 4_u32
  WLX_OPTION_IGNORE_AUTO_LOGON = 8_u32
  WLX_OPTION_NO_SWITCH_ON_SAS = 9_u32
  WLX_OPTION_SMART_CARD_PRESENT = 65537_u32
  WLX_OPTION_SMART_CARD_INFO = 65538_u32
  WLX_OPTION_DISPATCH_TABLE_SIZE = 65539_u32

  enum WLX_SHUTDOWN_TYPE : UInt32
    WLX_SAS_ACTION_SHUTDOWN = 5_u32
    WLX_SAS_ACTION_SHUTDOWN_REBOOT = 11_u32
    WLX_SAS_ACTION_SHUTDOWN_POWER_OFF = 10_u32
  end

  @[Extern]
  struct WLX_SC_NOTIFICATION_INFO
    property pszCard : Win32cr::Foundation::PWSTR
    property pszReader : Win32cr::Foundation::PWSTR
    property pszContainer : Win32cr::Foundation::PWSTR
    property pszCryptoProvider : Win32cr::Foundation::PWSTR
    def initialize(@pszCard : Win32cr::Foundation::PWSTR, @pszReader : Win32cr::Foundation::PWSTR, @pszContainer : Win32cr::Foundation::PWSTR, @pszCryptoProvider : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WLX_PROFILE_V1_0
    property dwType : UInt32
    property pszProfile : Win32cr::Foundation::PWSTR
    def initialize(@dwType : UInt32, @pszProfile : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WLX_PROFILE_V2_0
    property dwType : UInt32
    property pszProfile : Win32cr::Foundation::PWSTR
    property pszPolicy : Win32cr::Foundation::PWSTR
    property pszNetworkDefaultUserProfile : Win32cr::Foundation::PWSTR
    property pszServerName : Win32cr::Foundation::PWSTR
    property pszEnvironment : Win32cr::Foundation::PWSTR
    def initialize(@dwType : UInt32, @pszProfile : Win32cr::Foundation::PWSTR, @pszPolicy : Win32cr::Foundation::PWSTR, @pszNetworkDefaultUserProfile : Win32cr::Foundation::PWSTR, @pszServerName : Win32cr::Foundation::PWSTR, @pszEnvironment : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WLX_MPR_NOTIFY_INFO
    property pszUserName : Win32cr::Foundation::PWSTR
    property pszDomain : Win32cr::Foundation::PWSTR
    property pszPassword : Win32cr::Foundation::PWSTR
    property pszOldPassword : Win32cr::Foundation::PWSTR
    def initialize(@pszUserName : Win32cr::Foundation::PWSTR, @pszDomain : Win32cr::Foundation::PWSTR, @pszPassword : Win32cr::Foundation::PWSTR, @pszOldPassword : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WLX_TERMINAL_SERVICES_DATA
    property profile_path : UInt16[257]
    property home_dir : UInt16[257]
    property home_dir_drive : UInt16[4]
    def initialize(@profile_path : UInt16[257], @home_dir : UInt16[257], @home_dir_drive : UInt16[4])
    end
  end

  @[Extern]
  struct WLX_CLIENT_CREDENTIALS_INFO_V1_0
    property dwType : UInt32
    property pszUserName : Win32cr::Foundation::PWSTR
    property pszDomain : Win32cr::Foundation::PWSTR
    property pszPassword : Win32cr::Foundation::PWSTR
    property fPromptForPassword : Win32cr::Foundation::BOOL
    def initialize(@dwType : UInt32, @pszUserName : Win32cr::Foundation::PWSTR, @pszDomain : Win32cr::Foundation::PWSTR, @pszPassword : Win32cr::Foundation::PWSTR, @fPromptForPassword : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WLX_CLIENT_CREDENTIALS_INFO_V2_0
    property dwType : UInt32
    property pszUserName : Win32cr::Foundation::PWSTR
    property pszDomain : Win32cr::Foundation::PWSTR
    property pszPassword : Win32cr::Foundation::PWSTR
    property fPromptForPassword : Win32cr::Foundation::BOOL
    property fDisconnectOnLogonFailure : Win32cr::Foundation::BOOL
    def initialize(@dwType : UInt32, @pszUserName : Win32cr::Foundation::PWSTR, @pszDomain : Win32cr::Foundation::PWSTR, @pszPassword : Win32cr::Foundation::PWSTR, @fPromptForPassword : Win32cr::Foundation::BOOL, @fDisconnectOnLogonFailure : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0
    property dwType : UInt32
    property user_token : Win32cr::Foundation::HANDLE
    property logon_id : Win32cr::Foundation::LUID
    property quotas : Win32cr::Security::QUOTA_LIMITS
    property user_name : Win32cr::Foundation::PWSTR
    property domain : Win32cr::Foundation::PWSTR
    property logon_time : Win32cr::Foundation::LARGE_INTEGER
    property smart_card_logon : Win32cr::Foundation::BOOL
    property profile_length : UInt32
    property message_type : UInt32
    property logon_count : UInt16
    property bad_password_count : UInt16
    property profile_logon_time : Win32cr::Foundation::LARGE_INTEGER
    property logoff_time : Win32cr::Foundation::LARGE_INTEGER
    property kick_off_time : Win32cr::Foundation::LARGE_INTEGER
    property password_last_set : Win32cr::Foundation::LARGE_INTEGER
    property password_can_change : Win32cr::Foundation::LARGE_INTEGER
    property password_must_change : Win32cr::Foundation::LARGE_INTEGER
    property logon_script : Win32cr::Foundation::PWSTR
    property home_directory : Win32cr::Foundation::PWSTR
    property full_name : Win32cr::Foundation::PWSTR
    property profile_path : Win32cr::Foundation::PWSTR
    property home_directory_drive : Win32cr::Foundation::PWSTR
    property logon_server : Win32cr::Foundation::PWSTR
    property user_flags : UInt32
    property private_data_len : UInt32
    property private_data : UInt8*
    def initialize(@dwType : UInt32, @user_token : Win32cr::Foundation::HANDLE, @logon_id : Win32cr::Foundation::LUID, @quotas : Win32cr::Security::QUOTA_LIMITS, @user_name : Win32cr::Foundation::PWSTR, @domain : Win32cr::Foundation::PWSTR, @logon_time : Win32cr::Foundation::LARGE_INTEGER, @smart_card_logon : Win32cr::Foundation::BOOL, @profile_length : UInt32, @message_type : UInt32, @logon_count : UInt16, @bad_password_count : UInt16, @profile_logon_time : Win32cr::Foundation::LARGE_INTEGER, @logoff_time : Win32cr::Foundation::LARGE_INTEGER, @kick_off_time : Win32cr::Foundation::LARGE_INTEGER, @password_last_set : Win32cr::Foundation::LARGE_INTEGER, @password_can_change : Win32cr::Foundation::LARGE_INTEGER, @password_must_change : Win32cr::Foundation::LARGE_INTEGER, @logon_script : Win32cr::Foundation::PWSTR, @home_directory : Win32cr::Foundation::PWSTR, @full_name : Win32cr::Foundation::PWSTR, @profile_path : Win32cr::Foundation::PWSTR, @home_directory_drive : Win32cr::Foundation::PWSTR, @logon_server : Win32cr::Foundation::PWSTR, @user_flags : UInt32, @private_data_len : UInt32, @private_data : UInt8*)
    end
  end

  @[Extern]
  struct WLX_DESKTOP
    property size : UInt32
    property flags : UInt32
    property hDesktop : Win32cr::System::StationsAndDesktops::HDESK
    property pszDesktopName : Win32cr::Foundation::PWSTR
    def initialize(@size : UInt32, @flags : UInt32, @hDesktop : Win32cr::System::StationsAndDesktops::HDESK, @pszDesktopName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WLX_DISPATCH_VERSION_1_0
    property wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL
    property wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER
    property wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY
    property wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT
    property wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION
    property wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX
    property wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX
    property wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM
    property wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT
    property wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM
    property wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER
    property wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON
    property wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY
    def initialize(@wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL, @wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER, @wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY, @wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT, @wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION, @wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX, @wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX, @wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM, @wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT, @wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM, @wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER, @wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON, @wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY)
    end
  end

  @[Extern]
  struct WLX_DISPATCH_VERSION_1_1
    property wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL
    property wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER
    property wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY
    property wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT
    property wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION
    property wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX
    property wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX
    property wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM
    property wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT
    property wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM
    property wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER
    property wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON
    property wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY
    property wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP
    property wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP
    property wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP
    property wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX
    def initialize(@wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL, @wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER, @wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY, @wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT, @wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION, @wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX, @wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX, @wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM, @wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT, @wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM, @wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER, @wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON, @wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY, @wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP, @wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP, @wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP, @wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX)
    end
  end

  @[Extern]
  struct WLX_DISPATCH_VERSION_1_2
    property wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL
    property wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER
    property wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY
    property wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT
    property wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION
    property wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX
    property wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX
    property wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM
    property wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT
    property wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM
    property wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER
    property wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON
    property wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY
    property wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP
    property wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP
    property wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP
    property wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX
    property wlx_close_user_desktop : Win32cr::Security::WinWlx::PWLX_CLOSE_USER_DESKTOP
    def initialize(@wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL, @wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER, @wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY, @wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT, @wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION, @wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX, @wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX, @wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM, @wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT, @wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM, @wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER, @wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON, @wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY, @wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP, @wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP, @wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP, @wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX, @wlx_close_user_desktop : Win32cr::Security::WinWlx::PWLX_CLOSE_USER_DESKTOP)
    end
  end

  @[Extern]
  struct WLX_DISPATCH_VERSION_1_3
    property wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL
    property wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER
    property wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY
    property wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT
    property wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION
    property wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX
    property wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX
    property wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM
    property wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT
    property wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM
    property wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER
    property wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON
    property wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY
    property wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP
    property wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP
    property wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP
    property wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX
    property wlx_close_user_desktop : Win32cr::Security::WinWlx::PWLX_CLOSE_USER_DESKTOP
    property wlx_set_option : Win32cr::Security::WinWlx::PWLX_SET_OPTION
    property wlx_get_option : Win32cr::Security::WinWlx::PWLX_GET_OPTION
    property wlx_win31_migrate : Win32cr::Security::WinWlx::PWLX_WIN31_MIGRATE
    property wlx_query_client_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_CLIENT_CREDENTIALS
    property wlx_query_inet_connector_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_IC_CREDENTIALS
    property wlx_disconnect : Win32cr::Security::WinWlx::PWLX_DISCONNECT
    property wlx_query_terminal_services_data : Win32cr::Security::WinWlx::PWLX_QUERY_TERMINAL_SERVICES_DATA
    def initialize(@wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL, @wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER, @wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY, @wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT, @wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION, @wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX, @wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX, @wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM, @wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT, @wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM, @wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER, @wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON, @wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY, @wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP, @wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP, @wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP, @wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX, @wlx_close_user_desktop : Win32cr::Security::WinWlx::PWLX_CLOSE_USER_DESKTOP, @wlx_set_option : Win32cr::Security::WinWlx::PWLX_SET_OPTION, @wlx_get_option : Win32cr::Security::WinWlx::PWLX_GET_OPTION, @wlx_win31_migrate : Win32cr::Security::WinWlx::PWLX_WIN31_MIGRATE, @wlx_query_client_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_CLIENT_CREDENTIALS, @wlx_query_inet_connector_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_IC_CREDENTIALS, @wlx_disconnect : Win32cr::Security::WinWlx::PWLX_DISCONNECT, @wlx_query_terminal_services_data : Win32cr::Security::WinWlx::PWLX_QUERY_TERMINAL_SERVICES_DATA)
    end
  end

  @[Extern]
  struct WLX_DISPATCH_VERSION_1_4
    property wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL
    property wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER
    property wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY
    property wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT
    property wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION
    property wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX
    property wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX
    property wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM
    property wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT
    property wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM
    property wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER
    property wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON
    property wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY
    property wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP
    property wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP
    property wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP
    property wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX
    property wlx_close_user_desktop : Win32cr::Security::WinWlx::PWLX_CLOSE_USER_DESKTOP
    property wlx_set_option : Win32cr::Security::WinWlx::PWLX_SET_OPTION
    property wlx_get_option : Win32cr::Security::WinWlx::PWLX_GET_OPTION
    property wlx_win31_migrate : Win32cr::Security::WinWlx::PWLX_WIN31_MIGRATE
    property wlx_query_client_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_CLIENT_CREDENTIALS
    property wlx_query_inet_connector_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_IC_CREDENTIALS
    property wlx_disconnect : Win32cr::Security::WinWlx::PWLX_DISCONNECT
    property wlx_query_terminal_services_data : Win32cr::Security::WinWlx::PWLX_QUERY_TERMINAL_SERVICES_DATA
    property wlx_query_console_switch_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_CONSOLESWITCH_CREDENTIALS
    property wlx_query_ts_logon_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_TS_LOGON_CREDENTIALS
    def initialize(@wlx_use_ctrl_alt_del : Win32cr::Security::WinWlx::PWLX_USE_CTRL_ALT_DEL, @wlx_set_context_pointer : Win32cr::Security::WinWlx::PWLX_SET_CONTEXT_POINTER, @wlx_sas_notify : Win32cr::Security::WinWlx::PWLX_SAS_NOTIFY, @wlx_set_timeout : Win32cr::Security::WinWlx::PWLX_SET_TIMEOUT, @wlx_assign_shell_protection : Win32cr::Security::WinWlx::PWLX_ASSIGN_SHELL_PROTECTION, @wlx_message_box : Win32cr::Security::WinWlx::PWLX_MESSAGE_BOX, @wlx_dialog_box : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX, @wlx_dialog_box_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_PARAM, @wlx_dialog_box_indirect : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT, @wlx_dialog_box_indirect_param : Win32cr::Security::WinWlx::PWLX_DIALOG_BOX_INDIRECT_PARAM, @wlx_switch_desktop_to_user : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_USER, @wlx_switch_desktop_to_winlogon : Win32cr::Security::WinWlx::PWLX_SWITCH_DESKTOP_TO_WINLOGON, @wlx_change_password_notify : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY, @wlx_get_source_desktop : Win32cr::Security::WinWlx::PWLX_GET_SOURCE_DESKTOP, @wlx_set_return_desktop : Win32cr::Security::WinWlx::PWLX_SET_RETURN_DESKTOP, @wlx_create_user_desktop : Win32cr::Security::WinWlx::PWLX_CREATE_USER_DESKTOP, @wlx_change_password_notify_ex : Win32cr::Security::WinWlx::PWLX_CHANGE_PASSWORD_NOTIFY_EX, @wlx_close_user_desktop : Win32cr::Security::WinWlx::PWLX_CLOSE_USER_DESKTOP, @wlx_set_option : Win32cr::Security::WinWlx::PWLX_SET_OPTION, @wlx_get_option : Win32cr::Security::WinWlx::PWLX_GET_OPTION, @wlx_win31_migrate : Win32cr::Security::WinWlx::PWLX_WIN31_MIGRATE, @wlx_query_client_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_CLIENT_CREDENTIALS, @wlx_query_inet_connector_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_IC_CREDENTIALS, @wlx_disconnect : Win32cr::Security::WinWlx::PWLX_DISCONNECT, @wlx_query_terminal_services_data : Win32cr::Security::WinWlx::PWLX_QUERY_TERMINAL_SERVICES_DATA, @wlx_query_console_switch_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_CONSOLESWITCH_CREDENTIALS, @wlx_query_ts_logon_credentials : Win32cr::Security::WinWlx::PWLX_QUERY_TS_LOGON_CREDENTIALS)
    end
  end

  @[Extern]
  struct WLX_NOTIFICATION_INFO
    property size : UInt32
    property flags : UInt32
    property user_name : Win32cr::Foundation::PWSTR
    property domain : Win32cr::Foundation::PWSTR
    property window_station : Win32cr::Foundation::PWSTR
    property hToken : Win32cr::Foundation::HANDLE
    property hDesktop : Win32cr::System::StationsAndDesktops::HDESK
    property pStatusCallback : Win32cr::Security::WinWlx::PFNMSGECALLBACK
    def initialize(@size : UInt32, @flags : UInt32, @user_name : Win32cr::Foundation::PWSTR, @domain : Win32cr::Foundation::PWSTR, @window_station : Win32cr::Foundation::PWSTR, @hToken : Win32cr::Foundation::HANDLE, @hDesktop : Win32cr::System::StationsAndDesktops::HDESK, @pStatusCallback : Win32cr::Security::WinWlx::PFNMSGECALLBACK)
    end
  end

end