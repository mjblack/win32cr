require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
lib LibWin32
  TSF_Hardware = 1_u32
  TSF_Authenticated = 2_u32
  TSF_IPv6 = 4_u32
  TSF_SignatureAuthenticated = 8_u32

  struct TIME_ZONE_INFORMATION
    bias : Int32
    standard_name : Char[32]*
    standard_date : SYSTEMTIME
    standard_bias : Int32
    daylight_name : Char[32]*
    daylight_date : SYSTEMTIME
    daylight_bias : Int32
  end
  struct DYNAMIC_TIME_ZONE_INFORMATION
    bias : Int32
    standard_name : Char[32]*
    standard_date : SYSTEMTIME
    standard_bias : Int32
    daylight_name : Char[32]*
    daylight_date : SYSTEMTIME
    daylight_bias : Int32
    time_zone_key_name : Char[128]*
    dynamic_daylight_time_disabled : BOOLEAN
  end


  # Params # lptimezoneinformation : TIME_ZONE_INFORMATION* [In],lpuniversaltime : SYSTEMTIME* [In],lplocaltime : SYSTEMTIME* [In]
  fun SystemTimeToTzSpecificLocalTime(lptimezoneinformation : TIME_ZONE_INFORMATION*, lpuniversaltime : SYSTEMTIME*, lplocaltime : SYSTEMTIME*) : LibC::BOOL

  # Params # lptimezoneinformation : TIME_ZONE_INFORMATION* [In],lplocaltime : SYSTEMTIME* [In],lpuniversaltime : SYSTEMTIME* [In]
  fun TzSpecificLocalTimeToSystemTime(lptimezoneinformation : TIME_ZONE_INFORMATION*, lplocaltime : SYSTEMTIME*, lpuniversaltime : SYSTEMTIME*) : LibC::BOOL

  # Params # lpfiletime : FILETIME* [In],lpsystemtime : SYSTEMTIME* [In]
  fun FileTimeToSystemTime(lpfiletime : FILETIME*, lpsystemtime : SYSTEMTIME*) : LibC::BOOL

  # Params # lpsystemtime : SYSTEMTIME* [In],lpfiletime : FILETIME* [In]
  fun SystemTimeToFileTime(lpsystemtime : SYSTEMTIME*, lpfiletime : FILETIME*) : LibC::BOOL

  # Params # lptimezoneinformation : TIME_ZONE_INFORMATION* [In]
  # Commented out because function is part of Lib C
  #fun GetTimeZoneInformation(lptimezoneinformation : TIME_ZONE_INFORMATION*) : UInt32

  # Params # lptimezoneinformation : TIME_ZONE_INFORMATION* [In]
  # Commented out because function is part of Lib C
  #fun SetTimeZoneInformation(lptimezoneinformation : TIME_ZONE_INFORMATION*) : LibC::BOOL

  # Params # lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION* [In]
  fun SetDynamicTimeZoneInformation(lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION*) : LibC::BOOL

  # Params # ptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION* [In]
  fun GetDynamicTimeZoneInformation(ptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32

  # Params # wyear : UInt16 [In],pdtzi : DYNAMIC_TIME_ZONE_INFORMATION* [In],ptzi : TIME_ZONE_INFORMATION* [In]
  fun GetTimeZoneInformationForYear(wyear : UInt16, pdtzi : DYNAMIC_TIME_ZONE_INFORMATION*, ptzi : TIME_ZONE_INFORMATION*) : LibC::BOOL

  # Params # dwindex : UInt32 [In],lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION* [In]
  fun EnumDynamicTimeZoneInformation(dwindex : UInt32, lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION*) : UInt32

  # Params # lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION* [In],firstyear : UInt32* [In],lastyear : UInt32* [In]
  fun GetDynamicTimeZoneInformationEffectiveYears(lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION*, firstyear : UInt32*, lastyear : UInt32*) : UInt32

  # Params # lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION* [In],lpuniversaltime : SYSTEMTIME* [In],lplocaltime : SYSTEMTIME* [In]
  fun SystemTimeToTzSpecificLocalTimeEx(lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION*, lpuniversaltime : SYSTEMTIME*, lplocaltime : SYSTEMTIME*) : LibC::BOOL

  # Params # lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION* [In],lplocaltime : SYSTEMTIME* [In],lpuniversaltime : SYSTEMTIME* [In]
  fun TzSpecificLocalTimeToSystemTimeEx(lptimezoneinformation : DYNAMIC_TIME_ZONE_INFORMATION*, lplocaltime : SYSTEMTIME*, lpuniversaltime : SYSTEMTIME*) : LibC::BOOL

  # Params # timezoneinformation : TIME_ZONE_INFORMATION* [In],localfiletime : FILETIME* [In],localsystemtime : SYSTEMTIME* [In]
  fun LocalFileTimeToLocalSystemTime(timezoneinformation : TIME_ZONE_INFORMATION*, localfiletime : FILETIME*, localsystemtime : SYSTEMTIME*) : LibC::BOOL

  # Params # timezoneinformation : TIME_ZONE_INFORMATION* [In],localsystemtime : SYSTEMTIME* [In],localfiletime : FILETIME* [In]
  fun LocalSystemTimeToLocalFileTime(timezoneinformation : TIME_ZONE_INFORMATION*, localsystemtime : SYSTEMTIME*, localfiletime : FILETIME*) : LibC::BOOL
end
