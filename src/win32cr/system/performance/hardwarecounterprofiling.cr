require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  enum HARDWARE_COUNTER_TYPE : Int32
    PMCCounter = 0
    MaxHardwareCounterType = 1
  end

  struct HARDWARE_COUNTER_DATA
    type : HARDWARE_COUNTER_TYPE
    reserved : UInt32
    value : UInt64
  end
  struct PERFORMANCE_DATA
    size : UInt16
    version : UInt8
    hw_counters_count : UInt8
    context_switch_count : UInt32
    wait_reason_bit_map : UInt64
    cycle_time : UInt64
    retry_count : UInt32
    reserved : UInt32
    hw_counters : HARDWARE_COUNTER_DATA[16]*
  end


  # Params # threadhandle : LibC::HANDLE [In],flags : UInt32 [In],hardwarecounters : UInt64 [In],performancedatahandle : LibC::HANDLE* [In]
  fun EnableThreadProfiling(threadhandle : LibC::HANDLE, flags : UInt32, hardwarecounters : UInt64, performancedatahandle : LibC::HANDLE*) : UInt32

  # Params # performancedatahandle : LibC::HANDLE [In]
  fun DisableThreadProfiling(performancedatahandle : LibC::HANDLE) : UInt32

  # Params # threadhandle : LibC::HANDLE [In],enabled : BOOLEAN* [In]
  fun QueryThreadProfiling(threadhandle : LibC::HANDLE, enabled : BOOLEAN*) : UInt32

  # Params # performancedatahandle : LibC::HANDLE [In],flags : UInt32 [In],performancedata : PERFORMANCE_DATA* [In]
  fun ReadThreadProfilingData(performancedatahandle : LibC::HANDLE, flags : UInt32, performancedata : PERFORMANCE_DATA*) : UInt32
end