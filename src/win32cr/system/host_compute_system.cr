require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::HostComputeSystem
  extend self
  alias HCS_OPERATION = LibC::IntPtrT
  alias HCS_SYSTEM = LibC::IntPtrT
  alias HCS_PROCESS = LibC::IntPtrT
  alias HCS_OPERATION_COMPLETION = Proc(Win32cr::System::HostComputeSystem::HCS_OPERATION, Void*, Void)

  alias HCS_EVENT_CALLBACK = Proc(Win32cr::System::HostComputeSystem::HCS_EVENT*, Void*, Void)

  alias HCS_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, Void)


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
  struct HCS_EVENT
    property type__ : Win32cr::System::HostComputeSystem::HCS_EVENT_TYPE
    property event_data : Win32cr::Foundation::PWSTR
    property operation : Win32cr::System::HostComputeSystem::HCS_OPERATION
    def initialize(@type__ : Win32cr::System::HostComputeSystem::HCS_EVENT_TYPE, @event_data : Win32cr::Foundation::PWSTR, @operation : Win32cr::System::HostComputeSystem::HCS_OPERATION)
    end
  end

  @[Extern]
  struct HCS_PROCESS_INFORMATION
    property process_id : UInt32
    property reserved : UInt32
    property std_input : Win32cr::Foundation::HANDLE
    property std_output : Win32cr::Foundation::HANDLE
    property std_error : Win32cr::Foundation::HANDLE
    def initialize(@process_id : UInt32, @reserved : UInt32, @std_input : Win32cr::Foundation::HANDLE, @std_output : Win32cr::Foundation::HANDLE, @std_error : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct HCS_CREATE_OPTIONS_1
    property version : Win32cr::System::HostComputeSystem::HCS_CREATE_OPTIONS
    property user_token : Win32cr::Foundation::HANDLE
    property security_descriptor : Win32cr::Security::SECURITY_DESCRIPTOR*
    property callback_options : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS
    property callback_context : Void*
    property callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK
    def initialize(@version : Win32cr::System::HostComputeSystem::HCS_CREATE_OPTIONS, @user_token : Win32cr::Foundation::HANDLE, @security_descriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, @callback_options : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, @callback_context : Void*, @callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK)
    end
  end

  def hcsEnumerateComputeSystems(query : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT
    C.HcsEnumerateComputeSystems(query, operation)
  end

  def hcsEnumerateComputeSystemsInNamespace(idNamespace : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT
    C.HcsEnumerateComputeSystemsInNamespace(idNamespace, query, operation)
  end

  def hcsCreateOperation(context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_OPERATION_COMPLETION) : Win32cr::System::HostComputeSystem::HCS_OPERATION
    C.HcsCreateOperation(context, callback)
  end

  def hcsCloseOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Void
    C.HcsCloseOperation(operation)
  end

  def hcsGetOperationContext(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Void*
    C.HcsGetOperationContext(operation)
  end

  def hcsSetOperationContext(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, context : Void*) : Win32cr::Foundation::HRESULT
    C.HcsSetOperationContext(operation, context)
  end

  def hcsGetComputeSystemFromOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_SYSTEM
    C.HcsGetComputeSystemFromOperation(operation)
  end

  def hcsGetProcessFromOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_PROCESS
    C.HcsGetProcessFromOperation(operation)
  end

  def hcsGetOperationType(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_OPERATION_TYPE
    C.HcsGetOperationType(operation)
  end

  def hcsGetOperationId(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : UInt64
    C.HcsGetOperationId(operation)
  end

  def hcsGetOperationResult(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsGetOperationResult(operation, resultDocument)
  end

  def hcsGetOperationResultAndProcessInfo(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, processInformation : Win32cr::System::HostComputeSystem::HCS_PROCESS_INFORMATION*, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsGetOperationResultAndProcessInfo(operation, processInformation, resultDocument)
  end

  def hcsGetProcessorCompatibilityFromSavedState(runtime_file_name : Win32cr::Foundation::PWSTR, processor_features_string : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsGetProcessorCompatibilityFromSavedState(runtime_file_name, processor_features_string)
  end

  def hcsWaitForOperationResult(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, timeoutMs : UInt32, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsWaitForOperationResult(operation, timeoutMs, resultDocument)
  end

  def hcsWaitForOperationResultAndProcessInfo(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, timeoutMs : UInt32, processInformation : Win32cr::System::HostComputeSystem::HCS_PROCESS_INFORMATION*, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsWaitForOperationResultAndProcessInfo(operation, timeoutMs, processInformation, resultDocument)
  end

  def hcsSetOperationCallback(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_OPERATION_COMPLETION) : Win32cr::Foundation::HRESULT
    C.HcsSetOperationCallback(operation, context, callback)
  end

  def hcsCancelOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT
    C.HcsCancelOperation(operation)
  end

  def hcsCreateComputeSystem(id : Win32cr::Foundation::PWSTR, configuration : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, securityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT
    C.HcsCreateComputeSystem(id, configuration, operation, securityDescriptor, computeSystem)
  end

  def hcsCreateComputeSystemInNamespace(idNamespace : Win32cr::Foundation::PWSTR, id : Win32cr::Foundation::PWSTR, configuration : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::System::HostComputeSystem::HCS_CREATE_OPTIONS*, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT
    C.HcsCreateComputeSystemInNamespace(idNamespace, id, configuration, operation, options, computeSystem)
  end

  def hcsOpenComputeSystem(id : Win32cr::Foundation::PWSTR, requestedAccess : UInt32, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT
    C.HcsOpenComputeSystem(id, requestedAccess, computeSystem)
  end

  def hcsOpenComputeSystemInNamespace(idNamespace : Win32cr::Foundation::PWSTR, id : Win32cr::Foundation::PWSTR, requestedAccess : UInt32, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT
    C.HcsOpenComputeSystemInNamespace(idNamespace, id, requestedAccess, computeSystem)
  end

  def hcsCloseComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM) : Void
    C.HcsCloseComputeSystem(computeSystem)
  end

  def hcsStartComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsStartComputeSystem(computeSystem, operation, options)
  end

  def hcsShutDownComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsShutDownComputeSystem(computeSystem, operation, options)
  end

  def hcsTerminateComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsTerminateComputeSystem(computeSystem, operation, options)
  end

  def hcsCrashComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsCrashComputeSystem(computeSystem, operation, options)
  end

  def hcsPauseComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsPauseComputeSystem(computeSystem, operation, options)
  end

  def hcsResumeComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsResumeComputeSystem(computeSystem, operation, options)
  end

  def hcsSaveComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsSaveComputeSystem(computeSystem, operation, options)
  end

  def hcsGetComputeSystemProperties(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, propertyQuery : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsGetComputeSystemProperties(computeSystem, operation, propertyQuery)
  end

  def hcsModifyComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, configuration : Win32cr::Foundation::PWSTR, identity : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.HcsModifyComputeSystem(computeSystem, operation, configuration, identity)
  end

  def hcsWaitForComputeSystemExit(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, timeoutMs : UInt32, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsWaitForComputeSystemExit(computeSystem, timeoutMs, result)
  end

  def hcsSetComputeSystemCallback(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, callbackOptions : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK) : Win32cr::Foundation::HRESULT
    C.HcsSetComputeSystemCallback(computeSystem, callbackOptions, context, callback)
  end

  def hcsCreateProcess(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, processParameters : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, securityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, process : Win32cr::System::HostComputeSystem::HCS_PROCESS*) : Win32cr::Foundation::HRESULT
    C.HcsCreateProcess(computeSystem, processParameters, operation, securityDescriptor, process)
  end

  def hcsOpenProcess(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, processId : UInt32, requestedAccess : UInt32, process : Win32cr::System::HostComputeSystem::HCS_PROCESS*) : Win32cr::Foundation::HRESULT
    C.HcsOpenProcess(computeSystem, processId, requestedAccess, process)
  end

  def hcsCloseProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS) : Void
    C.HcsCloseProcess(process)
  end

  def hcsTerminateProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsTerminateProcess(process, operation, options)
  end

  def hcsSignalProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsSignalProcess(process, operation, options)
  end

  def hcsGetProcessInfo(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT
    C.HcsGetProcessInfo(process, operation)
  end

  def hcsGetProcessProperties(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, propertyQuery : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsGetProcessProperties(process, operation, propertyQuery)
  end

  def hcsModifyProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, settings : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsModifyProcess(process, operation, settings)
  end

  def hcsSetProcessCallback(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, callbackOptions : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK) : Win32cr::Foundation::HRESULT
    C.HcsSetProcessCallback(process, callbackOptions, context, callback)
  end

  def hcsWaitForProcessExit(computeSystem : Win32cr::System::HostComputeSystem::HCS_PROCESS, timeoutMs : UInt32, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsWaitForProcessExit(computeSystem, timeoutMs, result)
  end

  def hcsGetServiceProperties(propertyQuery : Win32cr::Foundation::PWSTR, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsGetServiceProperties(propertyQuery, result)
  end

  def hcsModifyServiceSettings(settings : Win32cr::Foundation::PWSTR, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsModifyServiceSettings(settings, result)
  end

  def hcsSubmitWerReport(settings : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsSubmitWerReport(settings)
  end

  def hcsCreateEmptyGuestStateFile(guestStateFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsCreateEmptyGuestStateFile(guestStateFilePath)
  end

  def hcsCreateEmptyRuntimeStateFile(runtimeStateFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsCreateEmptyRuntimeStateFile(runtimeStateFilePath)
  end

  def hcsGrantVmAccess(vmId : Win32cr::Foundation::PWSTR, filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsGrantVmAccess(vmId, filePath)
  end

  def hcsRevokeVmAccess(vmId : Win32cr::Foundation::PWSTR, filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsRevokeVmAccess(vmId, filePath)
  end

  def hcsGrantVmGroupAccess(filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsGrantVmGroupAccess(filePath)
  end

  def hcsRevokeVmGroupAccess(filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsRevokeVmGroupAccess(filePath)
  end

  def hcsImportLayer(layerPath : Win32cr::Foundation::PWSTR, sourceFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsImportLayer(layerPath, sourceFolderPath, layerData)
  end

  def hcsExportLayer(layerPath : Win32cr::Foundation::PWSTR, exportFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsExportLayer(layerPath, exportFolderPath, layerData, options)
  end

  def hcsExportLegacyWritableLayer(writableLayerMountPath : Win32cr::Foundation::PWSTR, writableLayerFolderPath : Win32cr::Foundation::PWSTR, exportFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsExportLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, exportFolderPath, layerData)
  end

  def hcsDestroyLayer(layerPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsDestroyLayer(layerPath)
  end

  def hcsSetupBaseOSLayer(layerPath : Win32cr::Foundation::PWSTR, vhdHandle : Win32cr::Foundation::HANDLE, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsSetupBaseOSLayer(layerPath, vhdHandle, options)
  end

  def hcsInitializeWritableLayer(writableLayerPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsInitializeWritableLayer(writableLayerPath, layerData, options)
  end

  def hcsInitializeLegacyWritableLayer(writableLayerMountPath : Win32cr::Foundation::PWSTR, writableLayerFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsInitializeLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, layerData, options)
  end

  def hcsAttachLayerStorageFilter(layerPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsAttachLayerStorageFilter(layerPath, layerData)
  end

  def hcsDetachLayerStorageFilter(layerPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsDetachLayerStorageFilter(layerPath)
  end

  def hcsFormatWritableLayerVhd(vhdHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.HcsFormatWritableLayerVhd(vhdHandle)
  end

  def hcsGetLayerVhdMountPath(vhdHandle : Win32cr::Foundation::HANDLE, mountPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.HcsGetLayerVhdMountPath(vhdHandle, mountPath)
  end

  def hcsSetupBaseOSVolume(layerPath : Win32cr::Foundation::PWSTR, volumePath : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.HcsSetupBaseOSVolume(layerPath, volumePath, options)
  end

  @[Link("computecore")]
  @[Link("computestorage")]
  lib C
    # :nodoc:
    fun HcsEnumerateComputeSystems(query : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsEnumerateComputeSystemsInNamespace(idNamespace : Win32cr::Foundation::PWSTR, query : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCreateOperation(context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_OPERATION_COMPLETION) : Win32cr::System::HostComputeSystem::HCS_OPERATION

    # :nodoc:
    fun HcsCloseOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Void

    # :nodoc:
    fun HcsGetOperationContext(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Void*

    # :nodoc:
    fun HcsSetOperationContext(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetComputeSystemFromOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_SYSTEM

    # :nodoc:
    fun HcsGetProcessFromOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_PROCESS

    # :nodoc:
    fun HcsGetOperationType(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::System::HostComputeSystem::HCS_OPERATION_TYPE

    # :nodoc:
    fun HcsGetOperationId(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : UInt64

    # :nodoc:
    fun HcsGetOperationResult(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetOperationResultAndProcessInfo(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, processInformation : Win32cr::System::HostComputeSystem::HCS_PROCESS_INFORMATION*, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetProcessorCompatibilityFromSavedState(runtime_file_name : Win32cr::Foundation::PWSTR, processor_features_string : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsWaitForOperationResult(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, timeoutMs : UInt32, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsWaitForOperationResultAndProcessInfo(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, timeoutMs : UInt32, processInformation : Win32cr::System::HostComputeSystem::HCS_PROCESS_INFORMATION*, resultDocument : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSetOperationCallback(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_OPERATION_COMPLETION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCancelOperation(operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCreateComputeSystem(id : Win32cr::Foundation::PWSTR, configuration : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, securityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCreateComputeSystemInNamespace(idNamespace : Win32cr::Foundation::PWSTR, id : Win32cr::Foundation::PWSTR, configuration : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::System::HostComputeSystem::HCS_CREATE_OPTIONS*, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsOpenComputeSystem(id : Win32cr::Foundation::PWSTR, requestedAccess : UInt32, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsOpenComputeSystemInNamespace(idNamespace : Win32cr::Foundation::PWSTR, id : Win32cr::Foundation::PWSTR, requestedAccess : UInt32, computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCloseComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM) : Void

    # :nodoc:
    fun HcsStartComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsShutDownComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsTerminateComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCrashComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsPauseComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsResumeComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSaveComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetComputeSystemProperties(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, propertyQuery : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsModifyComputeSystem(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, configuration : Win32cr::Foundation::PWSTR, identity : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsWaitForComputeSystemExit(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, timeoutMs : UInt32, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSetComputeSystemCallback(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, callbackOptions : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCreateProcess(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, processParameters : Win32cr::Foundation::PWSTR, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, securityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*, process : Win32cr::System::HostComputeSystem::HCS_PROCESS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsOpenProcess(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, processId : UInt32, requestedAccess : UInt32, process : Win32cr::System::HostComputeSystem::HCS_PROCESS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCloseProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS) : Void

    # :nodoc:
    fun HcsTerminateProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSignalProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetProcessInfo(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetProcessProperties(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, propertyQuery : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsModifyProcess(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, operation : Win32cr::System::HostComputeSystem::HCS_OPERATION, settings : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSetProcessCallback(process : Win32cr::System::HostComputeSystem::HCS_PROCESS, callbackOptions : Win32cr::System::HostComputeSystem::HCS_EVENT_OPTIONS, context : Void*, callback : Win32cr::System::HostComputeSystem::HCS_EVENT_CALLBACK) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsWaitForProcessExit(computeSystem : Win32cr::System::HostComputeSystem::HCS_PROCESS, timeoutMs : UInt32, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetServiceProperties(propertyQuery : Win32cr::Foundation::PWSTR, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsModifyServiceSettings(settings : Win32cr::Foundation::PWSTR, result : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSubmitWerReport(settings : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCreateEmptyGuestStateFile(guestStateFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsCreateEmptyRuntimeStateFile(runtimeStateFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGrantVmAccess(vmId : Win32cr::Foundation::PWSTR, filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsRevokeVmAccess(vmId : Win32cr::Foundation::PWSTR, filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGrantVmGroupAccess(filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsRevokeVmGroupAccess(filePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsImportLayer(layerPath : Win32cr::Foundation::PWSTR, sourceFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsExportLayer(layerPath : Win32cr::Foundation::PWSTR, exportFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsExportLegacyWritableLayer(writableLayerMountPath : Win32cr::Foundation::PWSTR, writableLayerFolderPath : Win32cr::Foundation::PWSTR, exportFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsDestroyLayer(layerPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSetupBaseOSLayer(layerPath : Win32cr::Foundation::PWSTR, vhdHandle : Win32cr::Foundation::HANDLE, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsInitializeWritableLayer(writableLayerPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsInitializeLegacyWritableLayer(writableLayerMountPath : Win32cr::Foundation::PWSTR, writableLayerFolderPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsAttachLayerStorageFilter(layerPath : Win32cr::Foundation::PWSTR, layerData : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsDetachLayerStorageFilter(layerPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsFormatWritableLayerVhd(vhdHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsGetLayerVhdMountPath(vhdHandle : Win32cr::Foundation::HANDLE, mountPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HcsSetupBaseOSVolume(layerPath : Win32cr::Foundation::PWSTR, volumePath : Win32cr::Foundation::PWSTR, options : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end