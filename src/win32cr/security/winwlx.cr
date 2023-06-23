require "../foundation.cr"
require "../security.cr"
require "../system/stationsanddesktops.cr"
require "../ui/windowsandmessaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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

  alias PWLX_USE_CTRL_ALT_DEL = Proc(LibC::HANDLE, Void)
  alias PWLX_SET_CONTEXT_POINTER = Proc(LibC::HANDLE, Void*, Void)
  alias PWLX_SAS_NOTIFY = Proc(LibC::HANDLE, UInt32, Void)
  alias PWLX_SET_TIMEOUT = Proc(LibC::HANDLE, UInt32, LibC::BOOL)
  alias PWLX_ASSIGN_SHELL_PROTECTION = Proc(LibC::HANDLE, LibC::HANDLE, LibC::HANDLE, LibC::HANDLE, Int32)
  alias PWLX_MESSAGE_BOX = Proc(LibC::HANDLE, LibC::HANDLE, LibC::LPWSTR, LibC::LPWSTR, UInt32, Int32)
  alias PWLX_DIALOG_BOX = Proc(LibC::HANDLE, LibC::HANDLE, LibC::LPWSTR, LibC::HANDLE, DLGPROC, Int32)
  alias PWLX_DIALOG_BOX_INDIRECT = Proc(LibC::HANDLE, LibC::HANDLE, DLGTEMPLATE*, LibC::HANDLE, DLGPROC, Int32)
  alias PWLX_DIALOG_BOX_PARAM = Proc(LibC::HANDLE, LibC::HANDLE, LibC::LPWSTR, LibC::HANDLE, DLGPROC, LPARAM, Int32)
  alias PWLX_DIALOG_BOX_INDIRECT_PARAM = Proc(LibC::HANDLE, LibC::HANDLE, DLGTEMPLATE*, LibC::HANDLE, DLGPROC, LPARAM, Int32)
  alias PWLX_SWITCH_DESKTOP_TO_USER = Proc(LibC::HANDLE, Int32)
  alias PWLX_SWITCH_DESKTOP_TO_WINLOGON = Proc(LibC::HANDLE, Int32)
  alias PWLX_CHANGE_PASSWORD_NOTIFY = Proc(LibC::HANDLE, WLX_MPR_NOTIFY_INFO*, UInt32, Int32)
  alias PWLX_GET_SOURCE_DESKTOP = Proc(LibC::HANDLE, WLX_DESKTOP**, LibC::BOOL)
  alias PWLX_SET_RETURN_DESKTOP = Proc(LibC::HANDLE, WLX_DESKTOP*, LibC::BOOL)
  alias PWLX_CREATE_USER_DESKTOP = Proc(LibC::HANDLE, LibC::HANDLE, UInt32, LibC::LPWSTR, WLX_DESKTOP**, LibC::BOOL)
  alias PWLX_CHANGE_PASSWORD_NOTIFY_EX = Proc(LibC::HANDLE, WLX_MPR_NOTIFY_INFO*, UInt32, LibC::LPWSTR, Void*, Int32)
  alias PWLX_CLOSE_USER_DESKTOP = Proc(LibC::HANDLE, WLX_DESKTOP*, LibC::HANDLE, LibC::BOOL)
  alias PWLX_SET_OPTION = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LibC::UINT_PTR*, LibC::BOOL)
  alias PWLX_GET_OPTION = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR*, LibC::BOOL)
  alias PWLX_WIN31_MIGRATE = Proc(LibC::HANDLE, Void)
  alias PWLX_QUERY_CLIENT_CREDENTIALS = Proc(WLX_CLIENT_CREDENTIALS_INFO_V1_0*, LibC::BOOL)
  alias PWLX_QUERY_IC_CREDENTIALS = Proc(WLX_CLIENT_CREDENTIALS_INFO_V1_0*, LibC::BOOL)
  alias PWLX_QUERY_TS_LOGON_CREDENTIALS = Proc(WLX_CLIENT_CREDENTIALS_INFO_V2_0*, LibC::BOOL)
  alias PWLX_DISCONNECT = Proc(LibC::BOOL)
  alias PWLX_QUERY_TERMINAL_SERVICES_DATA = Proc(LibC::HANDLE, WLX_TERMINAL_SERVICES_DATA*, LibC::LPWSTR, LibC::LPWSTR, UInt32)
  alias PWLX_QUERY_CONSOLESWITCH_CREDENTIALS = Proc(WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0*, UInt32)
  alias PFNMSGECALLBACK = Proc(LibC::BOOL, LibC::LPWSTR, UInt32)


  enum WLX_SHUTDOWN_TYPE : UInt32
    WLX_SAS_ACTION_SHUTDOWN = 5
    WLX_SAS_ACTION_SHUTDOWN_REBOOT = 11
    WLX_SAS_ACTION_SHUTDOWN_POWER_OFF = 10
  end

  struct WLX_SC_NOTIFICATION_INFO
    psz_card : LibC::LPWSTR
    psz_reader : LibC::LPWSTR
    psz_container : LibC::LPWSTR
    psz_crypto_provider : LibC::LPWSTR
  end
  struct WLX_PROFILE_V1_0
    dw_type : UInt32
    psz_profile : LibC::LPWSTR
  end
  struct WLX_PROFILE_V2_0
    dw_type : UInt32
    psz_profile : LibC::LPWSTR
    psz_policy : LibC::LPWSTR
    psz_network_default_user_profile : LibC::LPWSTR
    psz_server_name : LibC::LPWSTR
    psz_environment : LibC::LPWSTR
  end
  struct WLX_MPR_NOTIFY_INFO
    psz_user_name : LibC::LPWSTR
    psz_domain : LibC::LPWSTR
    psz_password : LibC::LPWSTR
    psz_old_password : LibC::LPWSTR
  end
  struct WLX_TERMINAL_SERVICES_DATA
    profile_path : Char[257]*
    home_dir : Char[257]*
    home_dir_drive : Char[4]*
  end
  struct WLX_CLIENT_CREDENTIALS_INFO_V1_0
    dw_type : UInt32
    psz_user_name : LibC::LPWSTR
    psz_domain : LibC::LPWSTR
    psz_password : LibC::LPWSTR
    f_prompt_for_password : LibC::BOOL
  end
  struct WLX_CLIENT_CREDENTIALS_INFO_V2_0
    dw_type : UInt32
    psz_user_name : LibC::LPWSTR
    psz_domain : LibC::LPWSTR
    psz_password : LibC::LPWSTR
    f_prompt_for_password : LibC::BOOL
    f_disconnect_on_logon_failure : LibC::BOOL
  end
  struct WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0
    dw_type : UInt32
    user_token : LibC::HANDLE
    logon_id : LUID
    quotas : QUOTA_LIMITS
    user_name : LibC::LPWSTR
    domain : LibC::LPWSTR
    logon_time : LARGE_INTEGER
    smart_card_logon : LibC::BOOL
    profile_length : UInt32
    message_type : UInt32
    logon_count : UInt16
    bad_password_count : UInt16
    profile_logon_time : LARGE_INTEGER
    logoff_time : LARGE_INTEGER
    kick_off_time : LARGE_INTEGER
    password_last_set : LARGE_INTEGER
    password_can_change : LARGE_INTEGER
    password_must_change : LARGE_INTEGER
    logon_script : LibC::LPWSTR
    home_directory : LibC::LPWSTR
    full_name : LibC::LPWSTR
    profile_path : LibC::LPWSTR
    home_directory_drive : LibC::LPWSTR
    logon_server : LibC::LPWSTR
    user_flags : UInt32
    private_data_len : UInt32
    private_data : UInt8*
  end
  struct WLX_DESKTOP
    size : UInt32
    flags : UInt32
    h_desktop : HDESK
    psz_desktop_name : LibC::LPWSTR
  end
  struct WLX_DISPATCH_VERSION_1_0
    wlx_use_ctrl_alt_del : PWLX_USE_CTRL_ALT_DEL
    wlx_set_context_pointer : PWLX_SET_CONTEXT_POINTER
    wlx_sas_notify : PWLX_SAS_NOTIFY
    wlx_set_timeout : PWLX_SET_TIMEOUT
    wlx_assign_shell_protection : PWLX_ASSIGN_SHELL_PROTECTION
    wlx_message_box : PWLX_MESSAGE_BOX
    wlx_dialog_box : PWLX_DIALOG_BOX
    wlx_dialog_box_param : PWLX_DIALOG_BOX_PARAM
    wlx_dialog_box_indirect : PWLX_DIALOG_BOX_INDIRECT
    wlx_dialog_box_indirect_param : PWLX_DIALOG_BOX_INDIRECT_PARAM
    wlx_switch_desktop_to_user : PWLX_SWITCH_DESKTOP_TO_USER
    wlx_switch_desktop_to_winlogon : PWLX_SWITCH_DESKTOP_TO_WINLOGON
    wlx_change_password_notify : PWLX_CHANGE_PASSWORD_NOTIFY
  end
  struct WLX_DISPATCH_VERSION_1_1
    wlx_use_ctrl_alt_del : PWLX_USE_CTRL_ALT_DEL
    wlx_set_context_pointer : PWLX_SET_CONTEXT_POINTER
    wlx_sas_notify : PWLX_SAS_NOTIFY
    wlx_set_timeout : PWLX_SET_TIMEOUT
    wlx_assign_shell_protection : PWLX_ASSIGN_SHELL_PROTECTION
    wlx_message_box : PWLX_MESSAGE_BOX
    wlx_dialog_box : PWLX_DIALOG_BOX
    wlx_dialog_box_param : PWLX_DIALOG_BOX_PARAM
    wlx_dialog_box_indirect : PWLX_DIALOG_BOX_INDIRECT
    wlx_dialog_box_indirect_param : PWLX_DIALOG_BOX_INDIRECT_PARAM
    wlx_switch_desktop_to_user : PWLX_SWITCH_DESKTOP_TO_USER
    wlx_switch_desktop_to_winlogon : PWLX_SWITCH_DESKTOP_TO_WINLOGON
    wlx_change_password_notify : PWLX_CHANGE_PASSWORD_NOTIFY
    wlx_get_source_desktop : PWLX_GET_SOURCE_DESKTOP
    wlx_set_return_desktop : PWLX_SET_RETURN_DESKTOP
    wlx_create_user_desktop : PWLX_CREATE_USER_DESKTOP
    wlx_change_password_notify_ex : PWLX_CHANGE_PASSWORD_NOTIFY_EX
  end
  struct WLX_DISPATCH_VERSION_1_2
    wlx_use_ctrl_alt_del : PWLX_USE_CTRL_ALT_DEL
    wlx_set_context_pointer : PWLX_SET_CONTEXT_POINTER
    wlx_sas_notify : PWLX_SAS_NOTIFY
    wlx_set_timeout : PWLX_SET_TIMEOUT
    wlx_assign_shell_protection : PWLX_ASSIGN_SHELL_PROTECTION
    wlx_message_box : PWLX_MESSAGE_BOX
    wlx_dialog_box : PWLX_DIALOG_BOX
    wlx_dialog_box_param : PWLX_DIALOG_BOX_PARAM
    wlx_dialog_box_indirect : PWLX_DIALOG_BOX_INDIRECT
    wlx_dialog_box_indirect_param : PWLX_DIALOG_BOX_INDIRECT_PARAM
    wlx_switch_desktop_to_user : PWLX_SWITCH_DESKTOP_TO_USER
    wlx_switch_desktop_to_winlogon : PWLX_SWITCH_DESKTOP_TO_WINLOGON
    wlx_change_password_notify : PWLX_CHANGE_PASSWORD_NOTIFY
    wlx_get_source_desktop : PWLX_GET_SOURCE_DESKTOP
    wlx_set_return_desktop : PWLX_SET_RETURN_DESKTOP
    wlx_create_user_desktop : PWLX_CREATE_USER_DESKTOP
    wlx_change_password_notify_ex : PWLX_CHANGE_PASSWORD_NOTIFY_EX
    wlx_close_user_desktop : PWLX_CLOSE_USER_DESKTOP
  end
  struct WLX_DISPATCH_VERSION_1_3
    wlx_use_ctrl_alt_del : PWLX_USE_CTRL_ALT_DEL
    wlx_set_context_pointer : PWLX_SET_CONTEXT_POINTER
    wlx_sas_notify : PWLX_SAS_NOTIFY
    wlx_set_timeout : PWLX_SET_TIMEOUT
    wlx_assign_shell_protection : PWLX_ASSIGN_SHELL_PROTECTION
    wlx_message_box : PWLX_MESSAGE_BOX
    wlx_dialog_box : PWLX_DIALOG_BOX
    wlx_dialog_box_param : PWLX_DIALOG_BOX_PARAM
    wlx_dialog_box_indirect : PWLX_DIALOG_BOX_INDIRECT
    wlx_dialog_box_indirect_param : PWLX_DIALOG_BOX_INDIRECT_PARAM
    wlx_switch_desktop_to_user : PWLX_SWITCH_DESKTOP_TO_USER
    wlx_switch_desktop_to_winlogon : PWLX_SWITCH_DESKTOP_TO_WINLOGON
    wlx_change_password_notify : PWLX_CHANGE_PASSWORD_NOTIFY
    wlx_get_source_desktop : PWLX_GET_SOURCE_DESKTOP
    wlx_set_return_desktop : PWLX_SET_RETURN_DESKTOP
    wlx_create_user_desktop : PWLX_CREATE_USER_DESKTOP
    wlx_change_password_notify_ex : PWLX_CHANGE_PASSWORD_NOTIFY_EX
    wlx_close_user_desktop : PWLX_CLOSE_USER_DESKTOP
    wlx_set_option : PWLX_SET_OPTION
    wlx_get_option : PWLX_GET_OPTION
    wlx_win31_migrate : PWLX_WIN31_MIGRATE
    wlx_query_client_credentials : PWLX_QUERY_CLIENT_CREDENTIALS
    wlx_query_inet_connector_credentials : PWLX_QUERY_IC_CREDENTIALS
    wlx_disconnect : PWLX_DISCONNECT
    wlx_query_terminal_services_data : PWLX_QUERY_TERMINAL_SERVICES_DATA
  end
  struct WLX_DISPATCH_VERSION_1_4
    wlx_use_ctrl_alt_del : PWLX_USE_CTRL_ALT_DEL
    wlx_set_context_pointer : PWLX_SET_CONTEXT_POINTER
    wlx_sas_notify : PWLX_SAS_NOTIFY
    wlx_set_timeout : PWLX_SET_TIMEOUT
    wlx_assign_shell_protection : PWLX_ASSIGN_SHELL_PROTECTION
    wlx_message_box : PWLX_MESSAGE_BOX
    wlx_dialog_box : PWLX_DIALOG_BOX
    wlx_dialog_box_param : PWLX_DIALOG_BOX_PARAM
    wlx_dialog_box_indirect : PWLX_DIALOG_BOX_INDIRECT
    wlx_dialog_box_indirect_param : PWLX_DIALOG_BOX_INDIRECT_PARAM
    wlx_switch_desktop_to_user : PWLX_SWITCH_DESKTOP_TO_USER
    wlx_switch_desktop_to_winlogon : PWLX_SWITCH_DESKTOP_TO_WINLOGON
    wlx_change_password_notify : PWLX_CHANGE_PASSWORD_NOTIFY
    wlx_get_source_desktop : PWLX_GET_SOURCE_DESKTOP
    wlx_set_return_desktop : PWLX_SET_RETURN_DESKTOP
    wlx_create_user_desktop : PWLX_CREATE_USER_DESKTOP
    wlx_change_password_notify_ex : PWLX_CHANGE_PASSWORD_NOTIFY_EX
    wlx_close_user_desktop : PWLX_CLOSE_USER_DESKTOP
    wlx_set_option : PWLX_SET_OPTION
    wlx_get_option : PWLX_GET_OPTION
    wlx_win31_migrate : PWLX_WIN31_MIGRATE
    wlx_query_client_credentials : PWLX_QUERY_CLIENT_CREDENTIALS
    wlx_query_inet_connector_credentials : PWLX_QUERY_IC_CREDENTIALS
    wlx_disconnect : PWLX_DISCONNECT
    wlx_query_terminal_services_data : PWLX_QUERY_TERMINAL_SERVICES_DATA
    wlx_query_console_switch_credentials : PWLX_QUERY_CONSOLESWITCH_CREDENTIALS
    wlx_query_ts_logon_credentials : PWLX_QUERY_TS_LOGON_CREDENTIALS
  end
  struct WLX_NOTIFICATION_INFO
    size : UInt32
    flags : UInt32
    user_name : LibC::LPWSTR
    domain : LibC::LPWSTR
    window_station : LibC::LPWSTR
    h_token : LibC::HANDLE
    h_desktop : HDESK
    p_status_callback : PFNMSGECALLBACK
  end

end
