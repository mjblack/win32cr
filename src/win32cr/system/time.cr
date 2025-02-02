require "./../foundation.cr"

module Win32cr::System::Time
  extend self
  Wszw32timeregkeytimeproviders = "System\\CurrentControlSet\\Services\\W32Time\\TimeProviders"
  Wszw32timeregkeypolicytimeproviders = "Software\\Policies\\Microsoft\\W32Time\\TimeProviders"
  Wszw32timeregvalueenabled = "Enabled"
  Wszw32timeregvaluedllname = "DllName"
  Wszw32timeregvalueinputprovider = "InputProvider"
  Wszw32timeregvaluemetadataprovider = "MetaDataProvider"
  TSF_Hardware = 1_u32
  TSF_Authenticated = 2_u32
  TSF_IPv6 = 4_u32
  TSF_SignatureAuthenticated = 8_u32


  @[Extern]
  struct TIME_ZONE_INFORMATION
    property bias : Int32
    property standard_name : UInt16[32]
    property standard_date : Win32cr::Foundation::SYSTEMTIME
    property standard_bias : Int32
    property daylight_name : UInt16[32]
    property daylight_date : Win32cr::Foundation::SYSTEMTIME
    property daylight_bias : Int32
    def initialize(@bias : Int32, @standard_name : UInt16[32], @standard_date : Win32cr::Foundation::SYSTEMTIME, @standard_bias : Int32, @daylight_name : UInt16[32], @daylight_date : Win32cr::Foundation::SYSTEMTIME, @daylight_bias : Int32)
    end
  end

  @[Extern]
  struct DYNAMIC_TIME_ZONE_INFORMATION
    property bias : Int32
    property standard_name : UInt16[32]
    property standard_date : Win32cr::Foundation::SYSTEMTIME
    property standard_bias : Int32
    property daylight_name : UInt16[32]
    property daylight_date : Win32cr::Foundation::SYSTEMTIME
    property daylight_bias : Int32
    property time_zone_key_name : UInt16[128]
    property dynamic_daylight_time_disabled : Win32cr::Foundation::BOOLEAN
    def initialize(@bias : Int32, @standard_name : UInt16[32], @standard_date : Win32cr::Foundation::SYSTEMTIME, @standard_bias : Int32, @daylight_name : UInt16[32], @daylight_date : Win32cr::Foundation::SYSTEMTIME, @daylight_bias : Int32, @time_zone_key_name : UInt16[128], @dynamic_daylight_time_disabled : Win32cr::Foundation::BOOLEAN)
    end
  end

  def systemTimeToTzSpecificLocalTime(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL
    C.SystemTimeToTzSpecificLocalTime(lpTimeZoneInformation, lpUniversalTime, lpLocalTime)
  end

  def tzSpecificLocalTimeToSystemTime(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL
    C.TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation, lpLocalTime, lpUniversalTime)
  end

  def fileTimeToSystemTime(lpFileTime : Win32cr::Foundation::FILETIME*, lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL
    C.FileTimeToSystemTime(lpFileTime, lpSystemTime)
  end

  def systemTimeToFileTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*, lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL
    C.SystemTimeToFileTime(lpSystemTime, lpFileTime)
  end

  #def getTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : UInt32
    #C.GetTimeZoneInformation(lpTimeZoneInformation)
  #end

  #def setTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL
    #C.SetTimeZoneInformation(lpTimeZoneInformation)
  #end

  def setDynamicTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL
    C.SetDynamicTimeZoneInformation(lpTimeZoneInformation)
  end

  #def getDynamicTimeZoneInformation(pTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32
    #C.GetDynamicTimeZoneInformation(pTimeZoneInformation)
  #end

  def getTimeZoneInformationForYear(wYear : UInt16, pdtzi : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, ptzi : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL
    C.GetTimeZoneInformationForYear(wYear, pdtzi, ptzi)
  end

  def enumDynamicTimeZoneInformation(dwIndex : UInt32, lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32
    C.EnumDynamicTimeZoneInformation(dwIndex, lpTimeZoneInformation)
  end

  def getDynamicTimeZoneInformationEffectiveYears(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, first_year : UInt32*, last_year : UInt32*) : UInt32
    C.GetDynamicTimeZoneInformationEffectiveYears(lpTimeZoneInformation, first_year, last_year)
  end

  def systemTimeToTzSpecificLocalTimeEx(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL
    C.SystemTimeToTzSpecificLocalTimeEx(lpTimeZoneInformation, lpUniversalTime, lpLocalTime)
  end

  def tzSpecificLocalTimeToSystemTimeEx(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL
    C.TzSpecificLocalTimeToSystemTimeEx(lpTimeZoneInformation, lpLocalTime, lpUniversalTime)
  end

  def localFileTimeToLocalSystemTime(timeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, localFileTime : Win32cr::Foundation::FILETIME*, localSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL
    C.LocalFileTimeToLocalSystemTime(timeZoneInformation, localFileTime, localSystemTime)
  end

  def localSystemTimeToLocalFileTime(timeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, localSystemTime : Win32cr::Foundation::SYSTEMTIME*, localFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL
    C.LocalSystemTimeToLocalFileTime(timeZoneInformation, localSystemTime, localFileTime)
  end

  @[Link("kernel32")]
  @[Link("advapi32")]
  lib C
    # :nodoc:
    fun SystemTimeToTzSpecificLocalTime(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FileTimeToSystemTime(lpFileTime : Win32cr::Foundation::FILETIME*, lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SystemTimeToFileTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*, lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDynamicTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetDynamicTimeZoneInformation(pTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32

    # :nodoc:
    fun GetTimeZoneInformationForYear(wYear : UInt16, pdtzi : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, ptzi : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumDynamicTimeZoneInformation(dwIndex : UInt32, lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32

    # :nodoc:
    fun GetDynamicTimeZoneInformationEffectiveYears(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, first_year : UInt32*, last_year : UInt32*) : UInt32

    # :nodoc:
    fun SystemTimeToTzSpecificLocalTimeEx(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TzSpecificLocalTimeToSystemTimeEx(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LocalFileTimeToLocalSystemTime(timeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, localFileTime : Win32cr::Foundation::FILETIME*, localSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LocalSystemTimeToLocalFileTime(timeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, localSystemTime : Win32cr::Foundation::SYSTEMTIME*, localFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

  end
end