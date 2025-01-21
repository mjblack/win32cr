require "./../foundation.cr"

module Win32cr::System::Time
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
  record TIME_ZONE_INFORMATION,
    bias : Int32,
    standard_name : UInt16[32],
    standard_date : Win32cr::Foundation::SYSTEMTIME,
    standard_bias : Int32,
    daylight_name : UInt16[32],
    daylight_date : Win32cr::Foundation::SYSTEMTIME,
    daylight_bias : Int32

  @[Extern]
  record DYNAMIC_TIME_ZONE_INFORMATION,
    bias : Int32,
    standard_name : UInt16[32],
    standard_date : Win32cr::Foundation::SYSTEMTIME,
    standard_bias : Int32,
    daylight_name : UInt16[32],
    daylight_date : Win32cr::Foundation::SYSTEMTIME,
    daylight_bias : Int32,
    time_zone_key_name : UInt16[128],
    dynamic_daylight_time_disabled : Win32cr::Foundation::BOOLEAN

  @[Link("kernel32")]
  @[Link("advapi32")]
  lib C
    fun SystemTimeToTzSpecificLocalTime(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun FileTimeToSystemTime(lpFileTime : Win32cr::Foundation::FILETIME*, lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun SystemTimeToFileTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*, lpFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : UInt32

    # Commented out due to being part of LibC
    #fun SetTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL

    fun SetDynamicTimeZoneInformation(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetDynamicTimeZoneInformation(pTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32

    fun GetTimeZoneInformationForYear(wYear : UInt16, pdtzi : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, ptzi : Win32cr::System::Time::TIME_ZONE_INFORMATION*) : Win32cr::Foundation::BOOL

    fun EnumDynamicTimeZoneInformation(dwIndex : UInt32, lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32

    fun GetDynamicTimeZoneInformationEffectiveYears(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, first_year : UInt32*, last_year : UInt32*) : UInt32

    fun SystemTimeToTzSpecificLocalTimeEx(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun TzSpecificLocalTimeToSystemTimeEx(lpTimeZoneInformation : Win32cr::System::Time::DYNAMIC_TIME_ZONE_INFORMATION*, lpLocalTime : Win32cr::Foundation::SYSTEMTIME*, lpUniversalTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun LocalFileTimeToLocalSystemTime(timeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, localFileTime : Win32cr::Foundation::FILETIME*, localSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun LocalSystemTimeToLocalFileTime(timeZoneInformation : Win32cr::System::Time::TIME_ZONE_INFORMATION*, localSystemTime : Win32cr::Foundation::SYSTEMTIME*, localFileTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

  end
end