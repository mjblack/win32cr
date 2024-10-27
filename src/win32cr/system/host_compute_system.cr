require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::HostComputeSystem
  alias HCS_OPERATION = LibC::IntPtrT
  alias HCS_SYSTEM = LibC::IntPtrT
  alias HCS_PROCESS = LibC::IntPtrT
  alias HCS_OPERATION_COMPLETION = Proc(Win32cr::System::HostComputeSystem::HCS_OPERATION, Void*, Void)*

  alias HCS_EVENT_CALLBACK = Proc(Win32cr::System::HostComputeSystem::HCS_EVENT*, Void*, Void)*

  alias HCS_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Void)*


  enum HCS_OPERATION_TYPE
    HcsOperationTypeNone = -1_i32
    HcsOperationTypeEnumerate = 0_i32
    HcsOperationTypeCreate = 1_i32
    HcsOperationTypeStart = 2_i32
    HcsOperationTypeShutdown = 3_i32
    HcsOperationTypePause = 4_i32
    HcsOperationTypeResume = 5_i32
    HcsOperationTypeSave = 6_i32
    HcsOperationTypeTerminate = 7_i32
    HcsOperationTypeModify = 8_i32
    HcsOperationTypeGetProperties = 9_i32
    HcsOperationTypeCreateProcess = 10_i32
    HcsOperationTypeSignalProcess = 11_i32
    HcsOperationTypeGetProcessInfo = 12_i32
    HcsOperationTypeGetProcessProperties = 13_i32
    HcsOperationTypeModifyProcess = 14_i32
    HcsOperationTypeCrash = 15_i32
  end
  enum HCS_EVENT_TYPE
    HcsEventInvalid = 0_i32
    HcsEventSystemExited = 1_i32
    HcsEventSystemCrashInitiated = 2_i32
    HcsEventSystemCrashReport = 3_i32
    HcsEventSystemRdpEnhancedModeStateChanged = 4_i32
    HcsEventSystemSiloJobCreated = 5_i32
    HcsEventSystemGuestConnectionClosed = 6_i32
    HcsEventProcessExited = 65536_i32
    HcsEventOperationCallback = 16777216_i32
    HcsEventServiceDisconnect = 33554432_i32
  end
  @[Flags]
  enum HCS_EVENT_OPTIONS : UInt32
    HcsEventOptionNone = 0_u32
    HcsEventOptionEnableOperationCallbacks = 1_u32
  end
  enum HCS_NOTIFICATION_FLAGS
    HcsNotificationFlagSuccess = 0_i32
    HcsNotificationFlagFailure = -2147483648_i32
  end
  enum HCS_NOTIFICATIONS
    HcsNotificationInvalid = 0_i32
    HcsNotificationSystemExited = 1_i32
    HcsNotificationSystemCreateCompleted = 2_i32
    HcsNotificationSystemStartCompleted = 3_i32
    HcsNotificationSystemPauseCompleted = 4_i32
    HcsNotificationSystemResumeCompleted = 5_i32
    HcsNotificationSystemCrashReport = 6_i32
    HcsNotificationSystemSiloJobCreated = 7_i32
    HcsNotificationSystemSaveCompleted = 8_i32
    HcsNotificationSystemRdpEnhancedModeStateChanged = 9_i32
    HcsNotificationSystemShutdownFailed = 10_i32
    HcsNotificationSystemShutdownCompleted = 10_i32
    HcsNotificationSystemGetPropertiesCompleted = 11_i32
    HcsNotificationSystemModifyCompleted = 12_i32
    HcsNotificationSystemCrashInitiated = 13_i32
    HcsNotificationSystemGuestConnectionClosed = 14_i32
    HcsNotificationSystemOperationCompletion = 15_i32
    HcsNotificationSystemPassThru = 16_i32
    HcsNotificationProcessExited = 65536_i32
    HcsNotificationServiceDisconnect = 16777216_i32
    HcsNotificationFlagsReserved = -268435456_i32
  end
  enum HCS_CREATE_OPTIONS
    HcsCreateOptions_1 = 65536_i32
  end

  @[Extern]
  record HCS_EVENT,
    type__ : Win32cr::System::HostComputeSystem::HCS_EVENT_TYPE,
    event_data : Win32cr::Foundation::PWSTR,
    operation : Win32cr::System::HostComputeSystem::HCS_OPERATION

  @[Extern]
  record HCS_PROCESS_INFORMATION,
    process_id : UInt32,
    reserved : UInt32,
    std_input : Win32cr::Foundation::HANDLE,
    std_output : Win32cr::Foundation::HANDLE,
    std_error : Win32cr::Foundation::HANDLE

  @[Extern]
  record HCS_CREATE_OPTIONS_1,
    version : Win32cr::System::HostComputeSystem::HCS_CREATE_OPTIONS,
    user_token : Win32cr::Foundation::HANDLE,
    security_descriptor : Win32cr::Security::SECURITY_DESCRIPTOR*,
    callback_options : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS,
    callback_context : Void*,
    callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK

  @[Link("computecore")]
  @[Link("computestorage")]
  lib C
    fun HcsEnumerateComputeSystems(query : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    fun HcsEnumerateComputeSystemsInNamespace(idNamespace : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    fun HcsCreateOperation(context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_OPERATION_COMPLETION) : Win32cr::System::HostComputeSystem::HCS_OPERATION

    fun HcsCloseOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Void

    fun HcsGetOperationContext(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Void*

    fun HcsSetOperationContext(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, context : Void*) : Win32cr::Foundation::HRESULT

    fun HcsGetComputeSystemFromOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_SYSTEM

    fun HcsGetProcessFromOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_PROCESS

    fun HcsGetOperationType(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_OPERATION_TYPE

    fun HcsGetOperationId(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : UInt64

    fun HcsGetOperationResult(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsGetOperationResultAndProcessInfo(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, processInformation : Win32cr::System::HostComputeSystem::HCS_PROCESS_INFORMATION*, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsGetProcessorCompatibilityFromSavedState(runtime_file_name : Win32cr::Foundation::PWSTR, processor_features_string : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsWaitForOperationResult(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, timeoutMs : UInt32, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsWaitForOperationResultAndProcessInfo(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, timeoutMs : UInt32, processInformation : Win32cr::System::HostComputeSystem::HCS_PROCESS_INFORMATION*, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsSetOperationCallback(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_OPERATION_COMPLETION) : Win32cr::Foundation::HRESULT

    fun HcsCancelOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    fun HcsCreateComputeSystem(id : Win32cr::Foundation::PWSTR, configuration : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, securityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    fun HcsCreateComputeSystemInNamespace(idNamespace : Win32cr::Foundation::PWSTR, id : Win32cr::Foundation::PWSTR, configuration : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::System::HostComputeSystem::HCS_CREATE_OPTIONS*, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    fun HcsOpenComputeSystem(id : Win32cr::Foundation::PWSTR, requestedAccess : UInt32, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    fun HcsOpenComputeSystemInNamespace(idNamespace : Win32cr::Foundation::PWSTR, id : Win32cr::Foundation::PWSTR, requestedAccess : UInt32, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    fun HcsCloseComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM) : Void

    fun HcsStartComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsShutDownComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsTerminateComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsCrashComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsPauseComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsResumeComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsSaveComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsGetComputeSystemProperties(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, propertyQuery : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsModifyComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, configuration : Win32cr::Foundation::PWSTR, identity : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun HcsWaitForComputeSystemExit(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, timeoutMs : UInt32, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsSetComputeSystemCallback(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, callbackOptions : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK) : Win32cr::Foundation::HRESULT

    fun HcsCreateProcess(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, processParameters : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, securityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, process : Win32cr::System::HostComputeSystem::HCS_PROCESS*) : Win32cr::Foundation::HRESULT

    fun HcsOpenProcess(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, processId : UInt32, requestedAccess : UInt32, process : Win32cr::System::HostComputeSystem::HCS_PROCESS*) : Win32cr::Foundation::HRESULT

    fun HcsCloseProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS) : Void

    fun HcsTerminateProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsSignalProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsGetProcessInfo(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    fun HcsGetProcessProperties(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, propertyQuery : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsModifyProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, settings : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsSetProcessCallback(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, callbackOptions : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK) : Win32cr::Foundation::HRESULT

    fun HcsWaitForProcessExit(computeSystem : Win32cr::System::HostComputeSystem::HCS_PROCESS, timeoutMs : UInt32, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsGetServiceProperties(propertyQuery : Win32cr::Foundation::PWSTR, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsModifyServiceSettings(settings : Win32cr::Foundation::PWSTR, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsSubmitWerReport(settings : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsCreateEmptyGuestStateFile(guestStateFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsCreateEmptyRuntimeStateFile(runtimeStateFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsGrantVmAccess(vmId : Win32cr::Foundation::PWSTR, filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsRevokeVmAccess(vmId : Win32cr::Foundation::PWSTR, filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsGrantVmGroupAccess(filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsRevokeVmGroupAccess(filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsImportLayer(layerPath : Win32cr::Foundation::PWSTR, sourceFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsExportLayer(layerPath : Win32cr::Foundation::PWSTR, exportFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsExportLegacyWritableLayer(writableLayerMountPath : Win32cr::Foundation::PWSTR, writableLayerFolderPath : Win32cr::Foundation::PWSTR, exportFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsDestroyLayer(layerPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsSetupBaseOSLayer(layerPath : Win32cr::Foundation::PWSTR, vhdHandle : Win32cr::Foundation::HANDLE, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsInitializeWritableLayer(writableLayerPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsInitializeLegacyWritableLayer(writableLayerMountPath : Win32cr::Foundation::PWSTR, writableLayerFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsAttachLayerStorageFilter(layerPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsDetachLayerStorageFilter(layerPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun HcsFormatWritableLayerVhd(vhdHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun HcsGetLayerVhdMountPath(vhdHandle : Win32cr::Foundation::HANDLE, mountPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun HcsSetupBaseOSVolume(layerPath : Win32cr::Foundation::PWSTR, volumePath : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end