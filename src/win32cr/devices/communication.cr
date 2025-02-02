require "./../foundation.cr"
require "./../system/io.cr"

module Win32cr::Devices::Communication
  extend self
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

  @[Flags]
  enum MODEM_STATUS_FLAGS : UInt32
    MS_CTS_ON = 16_u32
    MS_DSR_ON = 32_u32
    MS_RING_ON = 64_u32
    MS_RLSD_ON = 128_u32
  end
  @[Flags]
  enum CLEAR_COMM_ERROR_FLAGS : UInt32
    CE_BREAK = 16_u32
    CE_FRAME = 8_u32
    CE_OVERRUN = 2_u32
    CE_RXOVER = 1_u32
    CE_RXPARITY = 4_u32
  end
  @[Flags]
  enum PURGE_COMM_FLAGS : UInt32
    PURGE_RXABORT = 2_u32
    PURGE_RXCLEAR = 8_u32
    PURGE_TXABORT = 1_u32
    PURGE_TXCLEAR = 4_u32
  end
  @[Flags]
  enum COMM_EVENT_MASK : UInt32
    EV_BREAK = 64_u32
    EV_CTS = 8_u32
    EV_DSR = 16_u32
    EV_ERR = 128_u32
    EV_EVENT1 = 2048_u32
    EV_EVENT2 = 4096_u32
    EV_PERR = 512_u32
    EV_RING = 256_u32
    EV_RLSD = 32_u32
    EV_RX80FULL = 1024_u32
    EV_RXCHAR = 1_u32
    EV_RXFLAG = 2_u32
    EV_TXEMPTY = 4_u32
  end
  enum ESCAPE_COMM_FUNCTION : UInt32
    CLRBREAK = 9_u32
    CLRDTR = 6_u32
    CLRRTS = 4_u32
    SETBREAK = 8_u32
    SETDTR = 5_u32
    SETRTS = 3_u32
    SETXOFF = 1_u32
    SETXON = 2_u32
  end
  @[Flags]
  enum MODEMDEVCAPS_DIAL_OPTIONS : UInt32
    DIALOPTION_BILLING = 64_u32
    DIALOPTION_DIALTONE = 256_u32
    DIALOPTION_QUIET = 128_u32
  end
  enum MODEMSETTINGS_SPEAKER_MODE : UInt32
    MDMSPKR_CALLSETUP = 8_u32
    MDMSPKR_DIAL = 2_u32
    MDMSPKR_OFF = 1_u32
    MDMSPKR_ON = 4_u32
  end
  @[Flags]
  enum COMMPROP_STOP_PARITY : UInt16
    STOPBITS_10 = 1_u16
    STOPBITS_15 = 2_u16
    STOPBITS_20 = 4_u16
    PARITY_NONE = 256_u16
    PARITY_ODD = 512_u16
    PARITY_EVEN = 1024_u16
    PARITY_MARK = 2048_u16
    PARITY_SPACE = 4096_u16
  end
  enum MODEM_SPEAKER_VOLUME : UInt32
    MDMVOL_HIGH = 2_u32
    MDMVOL_LOW = 0_u32
    MDMVOL_MEDIUM = 1_u32
  end
  @[Flags]
  enum MODEMDEVCAPS_SPEAKER_VOLUME : UInt32
    MDMVOLFLAG_HIGH = 4_u32
    MDMVOLFLAG_LOW = 1_u32
    MDMVOLFLAG_MEDIUM = 2_u32
  end
  @[Flags]
  enum MODEMDEVCAPS_SPEAKER_MODE : UInt32
    MDMSPKRFLAG_CALLSETUP = 8_u32
    MDMSPKRFLAG_DIAL = 2_u32
    MDMSPKRFLAG_OFF = 1_u32
    MDMSPKRFLAG_ON = 4_u32
  end
  enum DCB_STOP_BITS : UInt8
    ONESTOPBIT = 0_u8
    ONE5STOPBITS = 1_u8
    TWOSTOPBITS = 2_u8
  end
  enum DCB_PARITY : UInt8
    EVENPARITY = 2_u8
    MARKPARITY = 3_u8
    NOPARITY = 0_u8
    ODDPARITY = 1_u8
    SPACEPARITY = 4_u8
  end

  @[Extern]
  struct MODEMDEVCAPS
    property dwActualSize : UInt32
    property dwRequiredSize : UInt32
    property dwDevSpecificOffset : UInt32
    property dwDevSpecificSize : UInt32
    property dwModemProviderVersion : UInt32
    property dwModemManufacturerOffset : UInt32
    property dwModemManufacturerSize : UInt32
    property dwModemModelOffset : UInt32
    property dwModemModelSize : UInt32
    property dwModemVersionOffset : UInt32
    property dwModemVersionSize : UInt32
    property dwDialOptions : Win32cr::Devices::Communication::MODEMDEVCAPS_DIAL_OPTIONS
    property dwCallSetupFailTimer : UInt32
    property dwInactivityTimeout : UInt32
    property dwSpeakerVolume : Win32cr::Devices::Communication::MODEMDEVCAPS_SPEAKER_VOLUME
    property dwSpeakerMode : Win32cr::Devices::Communication::MODEMDEVCAPS_SPEAKER_MODE
    property dwModemOptions : UInt32
    property dwMaxDTERate : UInt32
    property dwMaxDCERate : UInt32
    property abVariablePortion : UInt8*
    def initialize(@dwActualSize : UInt32, @dwRequiredSize : UInt32, @dwDevSpecificOffset : UInt32, @dwDevSpecificSize : UInt32, @dwModemProviderVersion : UInt32, @dwModemManufacturerOffset : UInt32, @dwModemManufacturerSize : UInt32, @dwModemModelOffset : UInt32, @dwModemModelSize : UInt32, @dwModemVersionOffset : UInt32, @dwModemVersionSize : UInt32, @dwDialOptions : Win32cr::Devices::Communication::MODEMDEVCAPS_DIAL_OPTIONS, @dwCallSetupFailTimer : UInt32, @dwInactivityTimeout : UInt32, @dwSpeakerVolume : Win32cr::Devices::Communication::MODEMDEVCAPS_SPEAKER_VOLUME, @dwSpeakerMode : Win32cr::Devices::Communication::MODEMDEVCAPS_SPEAKER_MODE, @dwModemOptions : UInt32, @dwMaxDTERate : UInt32, @dwMaxDCERate : UInt32, @abVariablePortion : UInt8*)
    end
  end

  @[Extern]
  struct MODEMSETTINGS
    property dwActualSize : UInt32
    property dwRequiredSize : UInt32
    property dwDevSpecificOffset : UInt32
    property dwDevSpecificSize : UInt32
    property dwCallSetupFailTimer : UInt32
    property dwInactivityTimeout : UInt32
    property dwSpeakerVolume : Win32cr::Devices::Communication::MODEM_SPEAKER_VOLUME
    property dwSpeakerMode : Win32cr::Devices::Communication::MODEMSETTINGS_SPEAKER_MODE
    property dwPreferredModemOptions : UInt32
    property dwNegotiatedModemOptions : UInt32
    property dwNegotiatedDCERate : UInt32
    property abVariablePortion : UInt8*
    def initialize(@dwActualSize : UInt32, @dwRequiredSize : UInt32, @dwDevSpecificOffset : UInt32, @dwDevSpecificSize : UInt32, @dwCallSetupFailTimer : UInt32, @dwInactivityTimeout : UInt32, @dwSpeakerVolume : Win32cr::Devices::Communication::MODEM_SPEAKER_VOLUME, @dwSpeakerMode : Win32cr::Devices::Communication::MODEMSETTINGS_SPEAKER_MODE, @dwPreferredModemOptions : UInt32, @dwNegotiatedModemOptions : UInt32, @dwNegotiatedDCERate : UInt32, @abVariablePortion : UInt8*)
    end
  end

  @[Extern]
  struct COMMPROP
    property wPacketLength : UInt16
    property wPacketVersion : UInt16
    property dwServiceMask : UInt32
    property dwReserved1 : UInt32
    property dwMaxTxQueue : UInt32
    property dwMaxRxQueue : UInt32
    property dwMaxBaud : UInt32
    property dwProvSubType : UInt32
    property dwProvCapabilities : UInt32
    property dwSettableParams : UInt32
    property dwSettableBaud : UInt32
    property wSettableData : UInt16
    property wSettableStopParity : Win32cr::Devices::Communication::COMMPROP_STOP_PARITY
    property dwCurrentTxQueue : UInt32
    property dwCurrentRxQueue : UInt32
    property dwProvSpec1 : UInt32
    property dwProvSpec2 : UInt32
    property wcProvChar : UInt16*
    def initialize(@wPacketLength : UInt16, @wPacketVersion : UInt16, @dwServiceMask : UInt32, @dwReserved1 : UInt32, @dwMaxTxQueue : UInt32, @dwMaxRxQueue : UInt32, @dwMaxBaud : UInt32, @dwProvSubType : UInt32, @dwProvCapabilities : UInt32, @dwSettableParams : UInt32, @dwSettableBaud : UInt32, @wSettableData : UInt16, @wSettableStopParity : Win32cr::Devices::Communication::COMMPROP_STOP_PARITY, @dwCurrentTxQueue : UInt32, @dwCurrentRxQueue : UInt32, @dwProvSpec1 : UInt32, @dwProvSpec2 : UInt32, @wcProvChar : UInt16*)
    end
  end

  @[Extern]
  struct COMSTAT
    property _bitfield : UInt32
    property cbInQue : UInt32
    property cbOutQue : UInt32
    def initialize(@_bitfield : UInt32, @cbInQue : UInt32, @cbOutQue : UInt32)
    end
  end

  @[Extern]
  struct DCB
    property dc_blength : UInt32
    property baud_rate : UInt32
    property _bitfield : UInt32
    property wReserved : UInt16
    property xon_lim : UInt16
    property xoff_lim : UInt16
    property byte_size : UInt8
    property parity : Win32cr::Devices::Communication::DCB_PARITY
    property stop_bits : Win32cr::Devices::Communication::DCB_STOP_BITS
    property xon_char : Win32cr::Foundation::CHAR
    property xoff_char : Win32cr::Foundation::CHAR
    property error_char : Win32cr::Foundation::CHAR
    property eof_char : Win32cr::Foundation::CHAR
    property evt_char : Win32cr::Foundation::CHAR
    property wReserved1 : UInt16
    def initialize(@dc_blength : UInt32, @baud_rate : UInt32, @_bitfield : UInt32, @wReserved : UInt16, @xon_lim : UInt16, @xoff_lim : UInt16, @byte_size : UInt8, @parity : Win32cr::Devices::Communication::DCB_PARITY, @stop_bits : Win32cr::Devices::Communication::DCB_STOP_BITS, @xon_char : Win32cr::Foundation::CHAR, @xoff_char : Win32cr::Foundation::CHAR, @error_char : Win32cr::Foundation::CHAR, @eof_char : Win32cr::Foundation::CHAR, @evt_char : Win32cr::Foundation::CHAR, @wReserved1 : UInt16)
    end
  end

  @[Extern]
  struct COMMTIMEOUTS
    property read_interval_timeout : UInt32
    property read_total_timeout_multiplier : UInt32
    property read_total_timeout_constant : UInt32
    property write_total_timeout_multiplier : UInt32
    property write_total_timeout_constant : UInt32
    def initialize(@read_interval_timeout : UInt32, @read_total_timeout_multiplier : UInt32, @read_total_timeout_constant : UInt32, @write_total_timeout_multiplier : UInt32, @write_total_timeout_constant : UInt32)
    end
  end

  @[Extern]
  struct COMMCONFIG
    property dwSize : UInt32
    property wVersion : UInt16
    property wReserved : UInt16
    property dcb : Win32cr::Devices::Communication::DCB
    property dwProviderSubType : UInt32
    property dwProviderOffset : UInt32
    property dwProviderSize : UInt32
    property wcProviderData : UInt16*
    def initialize(@dwSize : UInt32, @wVersion : UInt16, @wReserved : UInt16, @dcb : Win32cr::Devices::Communication::DCB, @dwProviderSubType : UInt32, @dwProviderOffset : UInt32, @dwProviderSize : UInt32, @wcProviderData : UInt16*)
    end
  end

  def clearCommBreak(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.ClearCommBreak(hFile)
  end

  def clearCommError(hFile : Win32cr::Foundation::HANDLE, lpErrors : Win32cr::Devices::Communication::CLEAR_COMM_ERROR_FLAGS*, lpStat : Win32cr::Devices::Communication::COMSTAT*) : Win32cr::Foundation::BOOL
    C.ClearCommError(hFile, lpErrors, lpStat)
  end

  def setupComm(hFile : Win32cr::Foundation::HANDLE, dwInQueue : UInt32, dwOutQueue : UInt32) : Win32cr::Foundation::BOOL
    C.SetupComm(hFile, dwInQueue, dwOutQueue)
  end

  def escapeCommFunction(hFile : Win32cr::Foundation::HANDLE, dwFunc : Win32cr::Devices::Communication::ESCAPE_COMM_FUNCTION) : Win32cr::Foundation::BOOL
    C.EscapeCommFunction(hFile, dwFunc)
  end

  def getCommConfig(hCommDev : Win32cr::Foundation::HANDLE, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetCommConfig(hCommDev, lpCC, lpdwSize)
  end

  def getCommMask(hFile : Win32cr::Foundation::HANDLE, lpEvtMask : Win32cr::Devices::Communication::COMM_EVENT_MASK*) : Win32cr::Foundation::BOOL
    C.GetCommMask(hFile, lpEvtMask)
  end

  def getCommProperties(hFile : Win32cr::Foundation::HANDLE, lpCommProp : Win32cr::Devices::Communication::COMMPROP*) : Win32cr::Foundation::BOOL
    C.GetCommProperties(hFile, lpCommProp)
  end

  def getCommModemStatus(hFile : Win32cr::Foundation::HANDLE, lpModemStat : Win32cr::Devices::Communication::MODEM_STATUS_FLAGS*) : Win32cr::Foundation::BOOL
    C.GetCommModemStatus(hFile, lpModemStat)
  end

  def getCommState(hFile : Win32cr::Foundation::HANDLE, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL
    C.GetCommState(hFile, lpDCB)
  end

  def getCommTimeouts(hFile : Win32cr::Foundation::HANDLE, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL
    C.GetCommTimeouts(hFile, lpCommTimeouts)
  end

  def purgeComm(hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::Devices::Communication::PURGE_COMM_FLAGS) : Win32cr::Foundation::BOOL
    C.PurgeComm(hFile, dwFlags)
  end

  def setCommBreak(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetCommBreak(hFile)
  end

  def setCommConfig(hCommDev : Win32cr::Foundation::HANDLE, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, dwSize : UInt32) : Win32cr::Foundation::BOOL
    C.SetCommConfig(hCommDev, lpCC, dwSize)
  end

  def setCommMask(hFile : Win32cr::Foundation::HANDLE, dwEvtMask : Win32cr::Devices::Communication::COMM_EVENT_MASK) : Win32cr::Foundation::BOOL
    C.SetCommMask(hFile, dwEvtMask)
  end

  def setCommState(hFile : Win32cr::Foundation::HANDLE, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL
    C.SetCommState(hFile, lpDCB)
  end

  def setCommTimeouts(hFile : Win32cr::Foundation::HANDLE, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL
    C.SetCommTimeouts(hFile, lpCommTimeouts)
  end

  def transmitCommChar(hFile : Win32cr::Foundation::HANDLE, cChar : Win32cr::Foundation::CHAR) : Win32cr::Foundation::BOOL
    C.TransmitCommChar(hFile, cChar)
  end

  def waitCommEvent(hFile : Win32cr::Foundation::HANDLE, lpEvtMask : Win32cr::Devices::Communication::COMM_EVENT_MASK*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    C.WaitCommEvent(hFile, lpEvtMask, lpOverlapped)
  end

  def openCommPort(uPortNumber : UInt32, dwDesiredAccess : UInt32, dwFlagsAndAttributes : UInt32) : Win32cr::Foundation::HANDLE
    C.OpenCommPort(uPortNumber, dwDesiredAccess, dwFlagsAndAttributes)
  end

  def getCommPorts(lpPortNumbers : UInt32*, uPortNumbersCount : UInt32, puPortNumbersFound : UInt32*) : UInt32
    C.GetCommPorts(lpPortNumbers, uPortNumbersCount, puPortNumbersFound)
  end

  def buildCommDCBA(lpDef : Win32cr::Foundation::PSTR, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL
    C.BuildCommDCBA(lpDef, lpDCB)
  end

  def buildCommDCBW(lpDef : Win32cr::Foundation::PWSTR, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL
    C.BuildCommDCBW(lpDef, lpDCB)
  end

  def buildCommDCBAndTimeoutsA(lpDef : Win32cr::Foundation::PSTR, lpDCB : Win32cr::Devices::Communication::DCB*, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL
    C.BuildCommDCBAndTimeoutsA(lpDef, lpDCB, lpCommTimeouts)
  end

  def buildCommDCBAndTimeoutsW(lpDef : Win32cr::Foundation::PWSTR, lpDCB : Win32cr::Devices::Communication::DCB*, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL
    C.BuildCommDCBAndTimeoutsW(lpDef, lpDCB, lpCommTimeouts)
  end

  def commConfigDialogA(lpszName : Win32cr::Foundation::PSTR, hWnd : Win32cr::Foundation::HWND, lpCC : Win32cr::Devices::Communication::COMMCONFIG*) : Win32cr::Foundation::BOOL
    C.CommConfigDialogA(lpszName, hWnd, lpCC)
  end

  def commConfigDialogW(lpszName : Win32cr::Foundation::PWSTR, hWnd : Win32cr::Foundation::HWND, lpCC : Win32cr::Devices::Communication::COMMCONFIG*) : Win32cr::Foundation::BOOL
    C.CommConfigDialogW(lpszName, hWnd, lpCC)
  end

  def getDefaultCommConfigA(lpszName : Win32cr::Foundation::PSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetDefaultCommConfigA(lpszName, lpCC, lpdwSize)
  end

  def getDefaultCommConfigW(lpszName : Win32cr::Foundation::PWSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.GetDefaultCommConfigW(lpszName, lpCC, lpdwSize)
  end

  def setDefaultCommConfigA(lpszName : Win32cr::Foundation::PSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, dwSize : UInt32) : Win32cr::Foundation::BOOL
    C.SetDefaultCommConfigA(lpszName, lpCC, dwSize)
  end

  def setDefaultCommConfigW(lpszName : Win32cr::Foundation::PWSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, dwSize : UInt32) : Win32cr::Foundation::BOOL
    C.SetDefaultCommConfigW(lpszName, lpCC, dwSize)
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun ClearCommBreak(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ClearCommError(hFile : Win32cr::Foundation::HANDLE, lpErrors : Win32cr::Devices::Communication::CLEAR_COMM_ERROR_FLAGS*, lpStat : Win32cr::Devices::Communication::COMSTAT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetupComm(hFile : Win32cr::Foundation::HANDLE, dwInQueue : UInt32, dwOutQueue : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EscapeCommFunction(hFile : Win32cr::Foundation::HANDLE, dwFunc : Win32cr::Devices::Communication::ESCAPE_COMM_FUNCTION) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommConfig(hCommDev : Win32cr::Foundation::HANDLE, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommMask(hFile : Win32cr::Foundation::HANDLE, lpEvtMask : Win32cr::Devices::Communication::COMM_EVENT_MASK*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommProperties(hFile : Win32cr::Foundation::HANDLE, lpCommProp : Win32cr::Devices::Communication::COMMPROP*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommModemStatus(hFile : Win32cr::Foundation::HANDLE, lpModemStat : Win32cr::Devices::Communication::MODEM_STATUS_FLAGS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommState(hFile : Win32cr::Foundation::HANDLE, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommTimeouts(hFile : Win32cr::Foundation::HANDLE, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PurgeComm(hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::Devices::Communication::PURGE_COMM_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCommBreak(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCommConfig(hCommDev : Win32cr::Foundation::HANDLE, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, dwSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCommMask(hFile : Win32cr::Foundation::HANDLE, dwEvtMask : Win32cr::Devices::Communication::COMM_EVENT_MASK) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCommState(hFile : Win32cr::Foundation::HANDLE, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCommTimeouts(hFile : Win32cr::Foundation::HANDLE, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TransmitCommChar(hFile : Win32cr::Foundation::HANDLE, cChar : Win32cr::Foundation::CHAR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WaitCommEvent(hFile : Win32cr::Foundation::HANDLE, lpEvtMask : Win32cr::Devices::Communication::COMM_EVENT_MASK*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenCommPort(uPortNumber : UInt32, dwDesiredAccess : UInt32, dwFlagsAndAttributes : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetCommPorts(lpPortNumbers : UInt32*, uPortNumbersCount : UInt32, puPortNumbersFound : UInt32*) : UInt32

    # :nodoc:
    fun BuildCommDCBA(lpDef : Win32cr::Foundation::PSTR, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BuildCommDCBW(lpDef : Win32cr::Foundation::PWSTR, lpDCB : Win32cr::Devices::Communication::DCB*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BuildCommDCBAndTimeoutsA(lpDef : Win32cr::Foundation::PSTR, lpDCB : Win32cr::Devices::Communication::DCB*, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BuildCommDCBAndTimeoutsW(lpDef : Win32cr::Foundation::PWSTR, lpDCB : Win32cr::Devices::Communication::DCB*, lpCommTimeouts : Win32cr::Devices::Communication::COMMTIMEOUTS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CommConfigDialogA(lpszName : Win32cr::Foundation::PSTR, hWnd : Win32cr::Foundation::HWND, lpCC : Win32cr::Devices::Communication::COMMCONFIG*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CommConfigDialogW(lpszName : Win32cr::Foundation::PWSTR, hWnd : Win32cr::Foundation::HWND, lpCC : Win32cr::Devices::Communication::COMMCONFIG*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDefaultCommConfigA(lpszName : Win32cr::Foundation::PSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDefaultCommConfigW(lpszName : Win32cr::Foundation::PWSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDefaultCommConfigA(lpszName : Win32cr::Foundation::PSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, dwSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDefaultCommConfigW(lpszName : Win32cr::Foundation::PWSTR, lpCC : Win32cr::Devices::Communication::COMMCONFIG*, dwSize : UInt32) : Win32cr::Foundation::BOOL

  end
end