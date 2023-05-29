require "../foundation.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-comm-l1-1-1.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-comm-l1-1-2.dll")]
lib LibWin32
  MDM_COMPRESSION = 1_u32
  MDM_ERROR_CONTROL = 2_u32
  MDM_FORCED_EC = 4_u32
  MDM_CELLULAR = 8_u32
  MDM_FLOWCONTROL_HARD = 16_u32
  MDM_FLOWCONTROL_SOFT = 32_u32
  MDM_CCITT_OVERRIDE = 64_u32
  MDM_SPEED_ADJUST = 128_u32
  MDM_TONE_DIAL = 256_u32
  MDM_BLIND_DIAL = 512_u32
  MDM_V23_OVERRIDE = 1024_u32
  MDM_DIAGNOSTICS = 2048_u32
  MDM_MASK_BEARERMODE = 61440_u32
  MDM_SHIFT_BEARERMODE = 12_u32
  MDM_MASK_PROTOCOLID = 983040_u32
  MDM_SHIFT_PROTOCOLID = 16_u32
  MDM_MASK_PROTOCOLDATA = 267386880_u32
  MDM_SHIFT_PROTOCOLDATA = 20_u32
  MDM_SHIFT_PROTOCOLINFO = 16_u32
  MDM_SHIFT_EXTENDEDINFO = 12_u32
  MDM_BEARERMODE_ANALOG = 0_u32
  MDM_BEARERMODE_ISDN = 1_u32
  MDM_BEARERMODE_GSM = 2_u32
  MDM_PROTOCOLID_DEFAULT = 0_u32
  MDM_PROTOCOLID_HDLCPPP = 1_u32
  MDM_PROTOCOLID_V128 = 2_u32
  MDM_PROTOCOLID_X75 = 3_u32
  MDM_PROTOCOLID_V110 = 4_u32
  MDM_PROTOCOLID_V120 = 5_u32
  MDM_PROTOCOLID_AUTO = 6_u32
  MDM_PROTOCOLID_ANALOG = 7_u32
  MDM_PROTOCOLID_GPRS = 8_u32
  MDM_PROTOCOLID_PIAFS = 9_u32
  MDM_SHIFT_HDLCPPP_SPEED = 0_u32
  MDM_MASK_HDLCPPP_SPEED = 7_u32
  MDM_HDLCPPP_SPEED_DEFAULT = 0_u32
  MDM_HDLCPPP_SPEED_64K = 1_u32
  MDM_HDLCPPP_SPEED_56K = 2_u32
  MDM_SHIFT_HDLCPPP_AUTH = 3_u32
  MDM_HDLCPPP_AUTH_DEFAULT = 0_u32
  MDM_HDLCPPP_AUTH_NONE = 1_u32
  MDM_HDLCPPP_AUTH_PAP = 2_u32
  MDM_HDLCPPP_AUTH_CHAP = 3_u32
  MDM_HDLCPPP_AUTH_MSCHAP = 4_u32
  MDM_SHIFT_HDLCPPP_ML = 6_u32
  MDM_HDLCPPP_ML_DEFAULT = 0_u32
  MDM_HDLCPPP_ML_NONE = 1_u32
  MDM_HDLCPPP_ML_2 = 2_u32
  MDM_SHIFT_V120_SPEED = 0_u32
  MDM_MASK_V120_SPEED = 7_u32
  MDM_V120_SPEED_DEFAULT = 0_u32
  MDM_V120_SPEED_64K = 1_u32
  MDM_V120_SPEED_56K = 2_u32
  MDM_SHIFT_V120_ML = 6_u32
  MDM_V120_ML_DEFAULT = 0_u32
  MDM_V120_ML_NONE = 1_u32
  MDM_V120_ML_2 = 2_u32
  MDM_SHIFT_X75_DATA = 0_u32
  MDM_MASK_X75_DATA = 7_u32
  MDM_X75_DATA_DEFAULT = 0_u32
  MDM_X75_DATA_64K = 1_u32
  MDM_X75_DATA_128K = 2_u32
  MDM_X75_DATA_T_70 = 3_u32
  MDM_X75_DATA_BTX = 4_u32
  MDM_SHIFT_V110_SPEED = 0_u32
  MDM_MASK_V110_SPEED = 15_u32
  MDM_V110_SPEED_DEFAULT = 0_u32
  MDM_V110_SPEED_1DOT2K = 1_u32
  MDM_V110_SPEED_2DOT4K = 2_u32
  MDM_V110_SPEED_4DOT8K = 3_u32
  MDM_V110_SPEED_9DOT6K = 4_u32
  MDM_V110_SPEED_12DOT0K = 5_u32
  MDM_V110_SPEED_14DOT4K = 6_u32
  MDM_V110_SPEED_19DOT2K = 7_u32
  MDM_V110_SPEED_28DOT8K = 8_u32
  MDM_V110_SPEED_38DOT4K = 9_u32
  MDM_V110_SPEED_57DOT6K = 10_u32
  MDM_SHIFT_AUTO_SPEED = 0_u32
  MDM_MASK_AUTO_SPEED = 7_u32
  MDM_AUTO_SPEED_DEFAULT = 0_u32
  MDM_SHIFT_AUTO_ML = 6_u32
  MDM_AUTO_ML_DEFAULT = 0_u32
  MDM_AUTO_ML_NONE = 1_u32
  MDM_AUTO_ML_2 = 2_u32
  MDM_ANALOG_RLP_ON = 0_u32
  MDM_ANALOG_RLP_OFF = 1_u32
  MDM_ANALOG_V34 = 2_u32
  MDM_PIAFS_INCOMING = 0_u32
  MDM_PIAFS_OUTGOING = 1_u32
  SID_3GPP_SUPSVCMODEL = "d7d08e07-d767-4478-b14a-eecc87ea12f7"
  MAXLENGTH_NAI = 72_u32
  MAXLENGTH_UICCDATASTORE = 10_u32


  enum MODEM_STATUS_FLAGS : UInt32
    MS_CTS_ON = 16
    MS_DSR_ON = 32
    MS_RING_ON = 64
    MS_RLSD_ON = 128
  end

  enum CLEAR_COMM_ERROR_FLAGS : UInt32
    CE_BREAK = 16
    CE_FRAME = 8
    CE_OVERRUN = 2
    CE_RXOVER = 1
    CE_RXPARITY = 4
  end

  enum PURGE_COMM_FLAGS : UInt32
    PURGE_RXABORT = 2
    PURGE_RXCLEAR = 8
    PURGE_TXABORT = 1
    PURGE_TXCLEAR = 4
  end

  enum COMM_EVENT_MASK : UInt32
    EV_BREAK = 64
    EV_CTS = 8
    EV_DSR = 16
    EV_ERR = 128
    EV_EVENT1 = 2048
    EV_EVENT2 = 4096
    EV_PERR = 512
    EV_RING = 256
    EV_RLSD = 32
    EV_RX80FULL = 1024
    EV_RXCHAR = 1
    EV_RXFLAG = 2
    EV_TXEMPTY = 4
  end

  enum ESCAPE_COMM_FUNCTION : UInt32
    CLRBREAK = 9
    CLRDTR = 6
    CLRRTS = 4
    SETBREAK = 8
    SETDTR = 5
    SETRTS = 3
    SETXOFF = 1
    SETXON = 2
  end

  enum MODEMDEVCAPS_DIAL_OPTIONS : UInt32
    DIALOPTION_BILLING = 64
    DIALOPTION_DIALTONE = 256
    DIALOPTION_QUIET = 128
  end

  enum MODEMSETTINGS_SPEAKER_MODE : UInt32
    MDMSPKR_CALLSETUP = 8
    MDMSPKR_DIAL = 2
    MDMSPKR_OFF = 1
    MDMSPKR_ON = 4
  end

  enum COMMPROP_STOP_PARITY : UInt16
    STOPBITS_10 = 1
    STOPBITS_15 = 2
    STOPBITS_20 = 4
    PARITY_NONE = 256
    PARITY_ODD = 512
    PARITY_EVEN = 1024
    PARITY_MARK = 2048
    PARITY_SPACE = 4096
  end

  enum MODEM_SPEAKER_VOLUME : UInt32
    MDMVOL_HIGH = 2
    MDMVOL_LOW = 0
    MDMVOL_MEDIUM = 1
  end

  enum MODEMDEVCAPS_SPEAKER_VOLUME : UInt32
    MDMVOLFLAG_HIGH = 4
    MDMVOLFLAG_LOW = 1
    MDMVOLFLAG_MEDIUM = 2
  end

  enum MODEMDEVCAPS_SPEAKER_MODE : UInt32
    MDMSPKRFLAG_CALLSETUP = 8
    MDMSPKRFLAG_DIAL = 2
    MDMSPKRFLAG_OFF = 1
    MDMSPKRFLAG_ON = 4
  end

  struct MODEMDEVCAPS
    dw_actual_size : UInt32
    dw_required_size : UInt32
    dw_dev_specific_offset : UInt32
    dw_dev_specific_size : UInt32
    dw_modem_provider_version : UInt32
    dw_modem_manufacturer_offset : UInt32
    dw_modem_manufacturer_size : UInt32
    dw_modem_model_offset : UInt32
    dw_modem_model_size : UInt32
    dw_modem_version_offset : UInt32
    dw_modem_version_size : UInt32
    dw_dial_options : MODEMDEVCAPS_DIAL_OPTIONS
    dw_call_setup_fail_timer : UInt32
    dw_inactivity_timeout : UInt32
    dw_speaker_volume : MODEMDEVCAPS_SPEAKER_VOLUME
    dw_speaker_mode : MODEMDEVCAPS_SPEAKER_MODE
    dw_modem_options : UInt32
    dw_max_dte_rate : UInt32
    dw_max_dce_rate : UInt32
    ab_variable_portion : UInt8[0]*
  end
  struct MODEMSETTINGS
    dw_actual_size : UInt32
    dw_required_size : UInt32
    dw_dev_specific_offset : UInt32
    dw_dev_specific_size : UInt32
    dw_call_setup_fail_timer : UInt32
    dw_inactivity_timeout : UInt32
    dw_speaker_volume : MODEM_SPEAKER_VOLUME
    dw_speaker_mode : MODEMSETTINGS_SPEAKER_MODE
    dw_preferred_modem_options : UInt32
    dw_negotiated_modem_options : UInt32
    dw_negotiated_dce_rate : UInt32
    ab_variable_portion : UInt8[0]*
  end
  struct COMMPROP
    w_packet_length : UInt16
    w_packet_version : UInt16
    dw_service_mask : UInt32
    dw_reserved1 : UInt32
    dw_max_tx_queue : UInt32
    dw_max_rx_queue : UInt32
    dw_max_baud : UInt32
    dw_prov_sub_type : UInt32
    dw_prov_capabilities : UInt32
    dw_settable_params : UInt32
    dw_settable_baud : UInt32
    w_settable_data : UInt16
    w_settable_stop_parity : COMMPROP_STOP_PARITY
    dw_current_tx_queue : UInt32
    dw_current_rx_queue : UInt32
    dw_prov_spec1 : UInt32
    dw_prov_spec2 : UInt32
    wc_prov_char : Char[0]*
  end
  struct COMSTAT
    _bitfield : UInt32
    cb_in_que : UInt32
    cb_out_que : UInt32
  end
  struct DCB
    dc_blength : UInt32
    baud_rate : UInt32
    _bitfield : UInt32
    w_reserved : UInt16
    xon_lim : UInt16
    xoff_lim : UInt16
    byte_size : UInt8
    parity : UInt8
    stop_bits : UInt8
    xon_char : CHAR
    xoff_char : CHAR
    error_char : CHAR
    eof_char : CHAR
    evt_char : CHAR
    w_reserved1 : UInt16
  end
  struct COMMTIMEOUTS
    read_interval_timeout : UInt32
    read_total_timeout_multiplier : UInt32
    read_total_timeout_constant : UInt32
    write_total_timeout_multiplier : UInt32
    write_total_timeout_constant : UInt32
  end
  struct COMMCONFIG
    dw_size : UInt32
    w_version : UInt16
    w_reserved : UInt16
    dcb : DCB
    dw_provider_sub_type : UInt32
    dw_provider_offset : UInt32
    dw_provider_size : UInt32
    wc_provider_data : Char[0]*
  end


  # Params # hfile : LibC::HANDLE [In]
  fun ClearCommBreak(hfile : LibC::HANDLE) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lperrors : CLEAR_COMM_ERROR_FLAGS* [In],lpstat : COMSTAT* [In]
  fun ClearCommError(hfile : LibC::HANDLE, lperrors : CLEAR_COMM_ERROR_FLAGS*, lpstat : COMSTAT*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],dwinqueue : UInt32 [In],dwoutqueue : UInt32 [In]
  fun SetupComm(hfile : LibC::HANDLE, dwinqueue : UInt32, dwoutqueue : UInt32) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],dwfunc : ESCAPE_COMM_FUNCTION [In]
  fun EscapeCommFunction(hfile : LibC::HANDLE, dwfunc : ESCAPE_COMM_FUNCTION) : LibC::BOOL

  # Params # hcommdev : LibC::HANDLE [In],lpcc : COMMCONFIG* [In],lpdwsize : UInt32* [In]
  fun GetCommConfig(hcommdev : LibC::HANDLE, lpcc : COMMCONFIG*, lpdwsize : UInt32*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpevtmask : COMM_EVENT_MASK* [In]
  fun GetCommMask(hfile : LibC::HANDLE, lpevtmask : COMM_EVENT_MASK*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpcommprop : COMMPROP* [In]
  fun GetCommProperties(hfile : LibC::HANDLE, lpcommprop : COMMPROP*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpmodemstat : MODEM_STATUS_FLAGS* [In]
  fun GetCommModemStatus(hfile : LibC::HANDLE, lpmodemstat : MODEM_STATUS_FLAGS*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpdcb : DCB* [In]
  fun GetCommState(hfile : LibC::HANDLE, lpdcb : DCB*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpcommtimeouts : COMMTIMEOUTS* [In]
  fun GetCommTimeouts(hfile : LibC::HANDLE, lpcommtimeouts : COMMTIMEOUTS*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],dwflags : PURGE_COMM_FLAGS [In]
  fun PurgeComm(hfile : LibC::HANDLE, dwflags : PURGE_COMM_FLAGS) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In]
  fun SetCommBreak(hfile : LibC::HANDLE) : LibC::BOOL

  # Params # hcommdev : LibC::HANDLE [In],lpcc : COMMCONFIG* [In],dwsize : UInt32 [In]
  fun SetCommConfig(hcommdev : LibC::HANDLE, lpcc : COMMCONFIG*, dwsize : UInt32) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],dwevtmask : COMM_EVENT_MASK [In]
  fun SetCommMask(hfile : LibC::HANDLE, dwevtmask : COMM_EVENT_MASK) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpdcb : DCB* [In]
  fun SetCommState(hfile : LibC::HANDLE, lpdcb : DCB*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpcommtimeouts : COMMTIMEOUTS* [In]
  fun SetCommTimeouts(hfile : LibC::HANDLE, lpcommtimeouts : COMMTIMEOUTS*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],cchar : CHAR [In]
  fun TransmitCommChar(hfile : LibC::HANDLE, cchar : CHAR) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpevtmask : COMM_EVENT_MASK* [In],lpoverlapped : OVERLAPPED* [In]
  fun WaitCommEvent(hfile : LibC::HANDLE, lpevtmask : COMM_EVENT_MASK*, lpoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # uportnumber : UInt32 [In],dwdesiredaccess : UInt32 [In],dwflagsandattributes : UInt32 [In]
  fun OpenCommPort(uportnumber : UInt32, dwdesiredaccess : UInt32, dwflagsandattributes : UInt32) : LibC::HANDLE

  # Params # lpportnumbers : UInt32* [In],uportnumberscount : UInt32 [In],puportnumbersfound : UInt32* [In]
  fun GetCommPorts(lpportnumbers : UInt32*, uportnumberscount : UInt32, puportnumbersfound : UInt32*) : UInt32

  # Params # lpdef : PSTR [In],lpdcb : DCB* [In]
  fun BuildCommDCBA(lpdef : PSTR, lpdcb : DCB*) : LibC::BOOL

  # Params # lpdef : LibC::LPWSTR [In],lpdcb : DCB* [In]
  fun BuildCommDCBW(lpdef : LibC::LPWSTR, lpdcb : DCB*) : LibC::BOOL

  # Params # lpdef : PSTR [In],lpdcb : DCB* [In],lpcommtimeouts : COMMTIMEOUTS* [In]
  fun BuildCommDCBAndTimeoutsA(lpdef : PSTR, lpdcb : DCB*, lpcommtimeouts : COMMTIMEOUTS*) : LibC::BOOL

  # Params # lpdef : LibC::LPWSTR [In],lpdcb : DCB* [In],lpcommtimeouts : COMMTIMEOUTS* [In]
  fun BuildCommDCBAndTimeoutsW(lpdef : LibC::LPWSTR, lpdcb : DCB*, lpcommtimeouts : COMMTIMEOUTS*) : LibC::BOOL

  # Params # lpszname : PSTR [In],hwnd : LibC::HANDLE [In],lpcc : COMMCONFIG* [In]
  fun CommConfigDialogA(lpszname : PSTR, hwnd : LibC::HANDLE, lpcc : COMMCONFIG*) : LibC::BOOL

  # Params # lpszname : LibC::LPWSTR [In],hwnd : LibC::HANDLE [In],lpcc : COMMCONFIG* [In]
  fun CommConfigDialogW(lpszname : LibC::LPWSTR, hwnd : LibC::HANDLE, lpcc : COMMCONFIG*) : LibC::BOOL

  # Params # lpszname : PSTR [In],lpcc : COMMCONFIG* [In],lpdwsize : UInt32* [In]
  fun GetDefaultCommConfigA(lpszname : PSTR, lpcc : COMMCONFIG*, lpdwsize : UInt32*) : LibC::BOOL

  # Params # lpszname : LibC::LPWSTR [In],lpcc : COMMCONFIG* [In],lpdwsize : UInt32* [In]
  fun GetDefaultCommConfigW(lpszname : LibC::LPWSTR, lpcc : COMMCONFIG*, lpdwsize : UInt32*) : LibC::BOOL

  # Params # lpszname : PSTR [In],lpcc : COMMCONFIG* [In],dwsize : UInt32 [In]
  fun SetDefaultCommConfigA(lpszname : PSTR, lpcc : COMMCONFIG*, dwsize : UInt32) : LibC::BOOL

  # Params # lpszname : LibC::LPWSTR [In],lpcc : COMMCONFIG* [In],dwsize : UInt32 [In]
  fun SetDefaultCommConfigW(lpszname : LibC::LPWSTR, lpcc : COMMCONFIG*, dwsize : UInt32) : LibC::BOOL
end
