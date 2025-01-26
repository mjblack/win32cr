require "./../../foundation.cr"

module Win32cr::System::Performance::HardwareCounterProfiling

  enum HARDWARE_COUNTER_TYPE
    PMCCounter = 0_i32
    MaxHardwareCounterType = 1_i32
  end

  @[Extern]
  struct HARDWARE_COUNTER_DATA
    property type__ : Win32cr::System::Performance::HardwareCounterProfiling::HARDWARE_COUNTER_TYPE
    property reserved : UInt32
    property value : UInt64
    def initialize(@type__ : Win32cr::System::Performance::HardwareCounterProfiling::HARDWARE_COUNTER_TYPE, @reserved : UInt32, @value : UInt64)
    end
  end

  @[Extern]
  struct PERFORMANCE_DATA
    property size : UInt16
    property version : UInt8
    property hw_counters_count : UInt8
    property context_switch_count : UInt32
    property wait_reason_bit_map : UInt64
    property cycle_time : UInt64
    property retry_count : UInt32
    property reserved : UInt32
    property hw_counters : Win32cr::System::Performance::HardwareCounterProfiling::HARDWARE_COUNTER_DATA[16]
    def initialize(@size : UInt16, @version : UInt8, @hw_counters_count : UInt8, @context_switch_count : UInt32, @wait_reason_bit_map : UInt64, @cycle_time : UInt64, @retry_count : UInt32, @reserved : UInt32, @hw_counters : Win32cr::System::Performance::HardwareCounterProfiling::HARDWARE_COUNTER_DATA[16])
    end
  end

  @[Link("kernel32")]
  lib C
    fun EnableThreadProfiling(thread_handle : Win32cr::Foundation::HANDLE, flags : UInt32, hardware_counters : UInt64, performance_data_handle : Win32cr::Foundation::HANDLE*) : UInt32

    fun DisableThreadProfiling(performance_data_handle : Win32cr::Foundation::HANDLE) : UInt32

    fun QueryThreadProfiling(thread_handle : Win32cr::Foundation::HANDLE, enabled : Win32cr::Foundation::BOOLEAN*) : UInt32

    fun ReadThreadProfilingData(performance_data_handle : Win32cr::Foundation::HANDLE, flags : UInt32, performance_data : Win32cr::System::Performance::HardwareCounterProfiling::PERFORMANCE_DATA*) : UInt32

  end
end