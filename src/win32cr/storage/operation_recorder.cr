require "./../foundation.cr"

module Win32cr::Storage::OperationRecorder

  @[Flags]
  enum OPERATION_START_FLAGS : UInt32
    OPERATION_START_TRACE_CURRENT_THREAD = 1_u32
  end
  @[Flags]
  enum OPERATION_END_PARAMETERS_FLAGS : UInt32
    OPERATION_END_DISCARD = 1_u32
  end

  @[Extern]
  record OPERATION_START_PARAMETERS,
    version : UInt32,
    operation_id : UInt32,
    flags : Win32cr::Storage::OperationRecorder::OPERATION_START_FLAGS

  @[Extern]
  record OPERATION_END_PARAMETERS,
    version : UInt32,
    operation_id : UInt32,
    flags : Win32cr::Storage::OperationRecorder::OPERATION_END_PARAMETERS_FLAGS

  @[Link("advapi32")]
  lib C
    fun OperationStart(operation_start_params : Win32cr::Storage::OperationRecorder::OPERATION_START_PARAMETERS*) : Win32cr::Foundation::BOOL

    fun OperationEnd(operation_end_params : Win32cr::Storage::OperationRecorder::OPERATION_END_PARAMETERS*) : Win32cr::Foundation::BOOL

  end
end