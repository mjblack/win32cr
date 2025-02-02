require "./../foundation.cr"

module Win32cr::Storage::OperationRecorder
  extend self

  @[Flags]
  enum OPERATION_START_FLAGS : UInt32
    OPERATION_START_TRACE_CURRENT_THREAD = 1_u32
  end
  @[Flags]
  enum OPERATION_END_PARAMETERS_FLAGS : UInt32
    OPERATION_END_DISCARD = 1_u32
  end

  @[Extern]
  struct OPERATION_START_PARAMETERS
    property version : UInt32
    property operation_id : UInt32
    property flags : Win32cr::Storage::OperationRecorder::OPERATION_START_FLAGS
    def initialize(@version : UInt32, @operation_id : UInt32, @flags : Win32cr::Storage::OperationRecorder::OPERATION_START_FLAGS)
    end
  end

  @[Extern]
  struct OPERATION_END_PARAMETERS
    property version : UInt32
    property operation_id : UInt32
    property flags : Win32cr::Storage::OperationRecorder::OPERATION_END_PARAMETERS_FLAGS
    def initialize(@version : UInt32, @operation_id : UInt32, @flags : Win32cr::Storage::OperationRecorder::OPERATION_END_PARAMETERS_FLAGS)
    end
  end

  def operationStart(operation_start_params : Win32cr::Storage::OperationRecorder::OPERATION_START_PARAMETERS*) : Win32cr::Foundation::BOOL
    C.OperationStart(operation_start_params)
  end

  def operationEnd(operation_end_params : Win32cr::Storage::OperationRecorder::OPERATION_END_PARAMETERS*) : Win32cr::Foundation::BOOL
    C.OperationEnd(operation_end_params)
  end

  @[Link("advapi32")]
  lib C
    # :nodoc:
    fun OperationStart(operation_start_params : Win32cr::Storage::OperationRecorder::OPERATION_START_PARAMETERS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OperationEnd(operation_end_params : Win32cr::Storage::OperationRecorder::OPERATION_END_PARAMETERS*) : Win32cr::Foundation::BOOL

  end
end