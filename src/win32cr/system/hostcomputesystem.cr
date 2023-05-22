require "../foundation.cr"
require "../security.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:computecore.dll")]
@[Link(ldflags: "/DELAYLOAD:computestorage.dll")]
lib LibWin32
  alias HCS_OPERATION = LibC::IntPtrT
  alias HCS_SYSTEM = LibC::IntPtrT
  alias HCS_PROCESS = LibC::IntPtrT

  alias HCS_OPERATION_COMPLETION = Proc(HCS_OPERATION, Void*, Void)
  alias HCS_EVENT_CALLBACK = Proc(HCS_EVENT*, Void*, Void)
  alias HCS_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, HRESULT, LibC::LPWSTR, Void)


  enum HCS_OPERATION_TYPE : Int32
    HcsOperationTypeNone = -1
    HcsOperationTypeEnumerate = 0
    HcsOperationTypeCreate = 1
    HcsOperationTypeStart = 2
    HcsOperationTypeShutdown = 3
    HcsOperationTypePause = 4
    HcsOperationTypeResume = 5
    HcsOperationTypeSave = 6
    HcsOperationTypeTerminate = 7
    HcsOperationTypeModify = 8
    HcsOperationTypeGetProperties = 9
    HcsOperationTypeCreateProcess = 10
    HcsOperationTypeSignalProcess = 11
    HcsOperationTypeGetProcessInfo = 12
    HcsOperationTypeGetProcessProperties = 13
    HcsOperationTypeModifyProcess = 14
    HcsOperationTypeCrash = 15
  end

  enum HCS_EVENT_TYPE : Int32
    HcsEventInvalid = 0
    HcsEventSystemExited = 1
    HcsEventSystemCrashInitiated = 2
    HcsEventSystemCrashReport = 3
    HcsEventSystemRdpEnhancedModeStateChanged = 4
    HcsEventSystemSiloJobCreated = 5
    HcsEventSystemGuestConnectionClosed = 6
    HcsEventProcessExited = 65536
    HcsEventOperationCallback = 16777216
    HcsEventServiceDisconnect = 33554432
  end

  enum HCS_EVENT_OPTIONS : UInt32
    HcsEventOptionNone = 0
    HcsEventOptionEnableOperationCallbacks = 1
  end

  enum HCS_NOTIFICATION_FLAGS : Int32
    HcsNotificationFlagSuccess = 0
    HcsNotificationFlagFailure = -2147483648
  end

  enum HCS_NOTIFICATIONS : Int32
    HcsNotificationInvalid = 0
    HcsNotificationSystemExited = 1
    HcsNotificationSystemCreateCompleted = 2
    HcsNotificationSystemStartCompleted = 3
    HcsNotificationSystemPauseCompleted = 4
    HcsNotificationSystemResumeCompleted = 5
    HcsNotificationSystemCrashReport = 6
    HcsNotificationSystemSiloJobCreated = 7
    HcsNotificationSystemSaveCompleted = 8
    HcsNotificationSystemRdpEnhancedModeStateChanged = 9
    HcsNotificationSystemShutdownFailed = 10
    HcsNotificationSystemShutdownCompleted = 10
    HcsNotificationSystemGetPropertiesCompleted = 11
    HcsNotificationSystemModifyCompleted = 12
    HcsNotificationSystemCrashInitiated = 13
    HcsNotificationSystemGuestConnectionClosed = 14
    HcsNotificationSystemOperationCompletion = 15
    HcsNotificationSystemPassThru = 16
    HcsNotificationProcessExited = 65536
    HcsNotificationServiceDisconnect = 16777216
    HcsNotificationFlagsReserved = -268435456
  end

  enum HCS_CREATE_OPTIONS : Int32
    HcsCreateOptions_1 = 65536
  end

  struct HCS_EVENT
    type : HCS_EVENT_TYPE
    event_data : LibC::LPWSTR
    operation : HCS_OPERATION
  end
  struct HCS_PROCESS_INFORMATION
    process_id : UInt32
    reserved : UInt32
    std_input : LibC::HANDLE
    std_output : LibC::HANDLE
    std_error : LibC::HANDLE
  end
  struct HCS_CREATE_OPTIONS_1
    version : HCS_CREATE_OPTIONS
    user_token : LibC::HANDLE
    security_descriptor : SECURITY_DESCRIPTOR*
    callback_options : HCS_EVENT_OPTIONS
    callback_context : Void*
    callback : HCS_EVENT_CALLBACK
  end


  # Params # query : LibC::LPWSTR [In],operation : HCS_OPERATION [In]
  fun HcsEnumerateComputeSystems(query : LibC::LPWSTR, operation : HCS_OPERATION) : HRESULT

  # Params # idnamespace : LibC::LPWSTR [In],query : LibC::LPWSTR [In],operation : HCS_OPERATION [In]
  fun HcsEnumerateComputeSystemsInNamespace(idnamespace : LibC::LPWSTR, query : LibC::LPWSTR, operation : HCS_OPERATION) : HRESULT

  # Params # context : Void* [In],callback : HCS_OPERATION_COMPLETION [In]
  fun HcsCreateOperation(context : Void*, callback : HCS_OPERATION_COMPLETION) : HCS_OPERATION

  # Params # operation : HCS_OPERATION [In]
  fun HcsCloseOperation(operation : HCS_OPERATION)

  # Params # operation : HCS_OPERATION [In]
  fun HcsGetOperationContext(operation : HCS_OPERATION) : Void*

  # Params # operation : HCS_OPERATION [In],context : Void* [In]
  fun HcsSetOperationContext(operation : HCS_OPERATION, context : Void*) : HRESULT

  # Params # operation : HCS_OPERATION [In]
  fun HcsGetComputeSystemFromOperation(operation : HCS_OPERATION) : HCS_SYSTEM

  # Params # operation : HCS_OPERATION [In]
  fun HcsGetProcessFromOperation(operation : HCS_OPERATION) : HCS_PROCESS

  # Params # operation : HCS_OPERATION [In]
  fun HcsGetOperationType(operation : HCS_OPERATION) : HCS_OPERATION_TYPE

  # Params # operation : HCS_OPERATION [In]
  fun HcsGetOperationId(operation : HCS_OPERATION) : UInt64

  # Params # operation : HCS_OPERATION [In],resultdocument : LibC::LPWSTR* [In]
  fun HcsGetOperationResult(operation : HCS_OPERATION, resultdocument : LibC::LPWSTR*) : HRESULT

  # Params # operation : HCS_OPERATION [In],processinformation : HCS_PROCESS_INFORMATION* [In],resultdocument : LibC::LPWSTR* [In]
  fun HcsGetOperationResultAndProcessInfo(operation : HCS_OPERATION, processinformation : HCS_PROCESS_INFORMATION*, resultdocument : LibC::LPWSTR*) : HRESULT

  # Params # runtimefilename : LibC::LPWSTR [In],processorfeaturesstring : LibC::LPWSTR* [In]
  fun HcsGetProcessorCompatibilityFromSavedState(runtimefilename : LibC::LPWSTR, processorfeaturesstring : LibC::LPWSTR*) : HRESULT

  # Params # operation : HCS_OPERATION [In],timeoutms : UInt32 [In],resultdocument : LibC::LPWSTR* [In]
  fun HcsWaitForOperationResult(operation : HCS_OPERATION, timeoutms : UInt32, resultdocument : LibC::LPWSTR*) : HRESULT

  # Params # operation : HCS_OPERATION [In],timeoutms : UInt32 [In],processinformation : HCS_PROCESS_INFORMATION* [In],resultdocument : LibC::LPWSTR* [In]
  fun HcsWaitForOperationResultAndProcessInfo(operation : HCS_OPERATION, timeoutms : UInt32, processinformation : HCS_PROCESS_INFORMATION*, resultdocument : LibC::LPWSTR*) : HRESULT

  # Params # operation : HCS_OPERATION [In],context : Void* [In],callback : HCS_OPERATION_COMPLETION [In]
  fun HcsSetOperationCallback(operation : HCS_OPERATION, context : Void*, callback : HCS_OPERATION_COMPLETION) : HRESULT

  # Params # operation : HCS_OPERATION [In]
  fun HcsCancelOperation(operation : HCS_OPERATION) : HRESULT

  # Params # id : LibC::LPWSTR [In],configuration : LibC::LPWSTR [In],operation : HCS_OPERATION [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],computesystem : HCS_SYSTEM* [In]
  fun HcsCreateComputeSystem(id : LibC::LPWSTR, configuration : LibC::LPWSTR, operation : HCS_OPERATION, securitydescriptor : SECURITY_DESCRIPTOR*, computesystem : HCS_SYSTEM*) : HRESULT

  # Params # idnamespace : LibC::LPWSTR [In],id : LibC::LPWSTR [In],configuration : LibC::LPWSTR [In],operation : HCS_OPERATION [In],options : HCS_CREATE_OPTIONS* [In],computesystem : HCS_SYSTEM* [In]
  fun HcsCreateComputeSystemInNamespace(idnamespace : LibC::LPWSTR, id : LibC::LPWSTR, configuration : LibC::LPWSTR, operation : HCS_OPERATION, options : HCS_CREATE_OPTIONS*, computesystem : HCS_SYSTEM*) : HRESULT

  # Params # id : LibC::LPWSTR [In],requestedaccess : UInt32 [In],computesystem : HCS_SYSTEM* [In]
  fun HcsOpenComputeSystem(id : LibC::LPWSTR, requestedaccess : UInt32, computesystem : HCS_SYSTEM*) : HRESULT

  # Params # idnamespace : LibC::LPWSTR [In],id : LibC::LPWSTR [In],requestedaccess : UInt32 [In],computesystem : HCS_SYSTEM* [In]
  fun HcsOpenComputeSystemInNamespace(idnamespace : LibC::LPWSTR, id : LibC::LPWSTR, requestedaccess : UInt32, computesystem : HCS_SYSTEM*) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In]
  fun HcsCloseComputeSystem(computesystem : HCS_SYSTEM)

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsStartComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsShutDownComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsTerminateComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsCrashComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsPauseComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsResumeComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsSaveComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],propertyquery : LibC::LPWSTR [In]
  fun HcsGetComputeSystemProperties(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, propertyquery : LibC::LPWSTR) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],operation : HCS_OPERATION [In],configuration : LibC::LPWSTR [In],identity : LibC::HANDLE [In]
  fun HcsModifyComputeSystem(computesystem : HCS_SYSTEM, operation : HCS_OPERATION, configuration : LibC::LPWSTR, identity : LibC::HANDLE) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],timeoutms : UInt32 [In],result : LibC::LPWSTR* [In]
  fun HcsWaitForComputeSystemExit(computesystem : HCS_SYSTEM, timeoutms : UInt32, result : LibC::LPWSTR*) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],callbackoptions : HCS_EVENT_OPTIONS [In],context : Void* [In],callback : HCS_EVENT_CALLBACK [In]
  fun HcsSetComputeSystemCallback(computesystem : HCS_SYSTEM, callbackoptions : HCS_EVENT_OPTIONS, context : Void*, callback : HCS_EVENT_CALLBACK) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],processparameters : LibC::LPWSTR [In],operation : HCS_OPERATION [In],securitydescriptor : SECURITY_DESCRIPTOR* [In],process : HCS_PROCESS* [In]
  fun HcsCreateProcess(computesystem : HCS_SYSTEM, processparameters : LibC::LPWSTR, operation : HCS_OPERATION, securitydescriptor : SECURITY_DESCRIPTOR*, process : HCS_PROCESS*) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],processid : UInt32 [In],requestedaccess : UInt32 [In],process : HCS_PROCESS* [In]
  fun HcsOpenProcess(computesystem : HCS_SYSTEM, processid : UInt32, requestedaccess : UInt32, process : HCS_PROCESS*) : HRESULT

  # Params # process : HCS_PROCESS [In]
  fun HcsCloseProcess(process : HCS_PROCESS)

  # Params # process : HCS_PROCESS [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsTerminateProcess(process : HCS_PROCESS, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # process : HCS_PROCESS [In],operation : HCS_OPERATION [In],options : LibC::LPWSTR [In]
  fun HcsSignalProcess(process : HCS_PROCESS, operation : HCS_OPERATION, options : LibC::LPWSTR) : HRESULT

  # Params # process : HCS_PROCESS [In],operation : HCS_OPERATION [In]
  fun HcsGetProcessInfo(process : HCS_PROCESS, operation : HCS_OPERATION) : HRESULT

  # Params # process : HCS_PROCESS [In],operation : HCS_OPERATION [In],propertyquery : LibC::LPWSTR [In]
  fun HcsGetProcessProperties(process : HCS_PROCESS, operation : HCS_OPERATION, propertyquery : LibC::LPWSTR) : HRESULT

  # Params # process : HCS_PROCESS [In],operation : HCS_OPERATION [In],settings : LibC::LPWSTR [In]
  fun HcsModifyProcess(process : HCS_PROCESS, operation : HCS_OPERATION, settings : LibC::LPWSTR) : HRESULT

  # Params # process : HCS_PROCESS [In],callbackoptions : HCS_EVENT_OPTIONS [In],context : Void* [In],callback : HCS_EVENT_CALLBACK [In]
  fun HcsSetProcessCallback(process : HCS_PROCESS, callbackoptions : HCS_EVENT_OPTIONS, context : Void*, callback : HCS_EVENT_CALLBACK) : HRESULT

  # Params # computesystem : HCS_PROCESS [In],timeoutms : UInt32 [In],result : LibC::LPWSTR* [In]
  fun HcsWaitForProcessExit(computesystem : HCS_PROCESS, timeoutms : UInt32, result : LibC::LPWSTR*) : HRESULT

  # Params # propertyquery : LibC::LPWSTR [In],result : LibC::LPWSTR* [In]
  fun HcsGetServiceProperties(propertyquery : LibC::LPWSTR, result : LibC::LPWSTR*) : HRESULT

  # Params # settings : LibC::LPWSTR [In],result : LibC::LPWSTR* [In]
  fun HcsModifyServiceSettings(settings : LibC::LPWSTR, result : LibC::LPWSTR*) : HRESULT

  # Params # settings : LibC::LPWSTR [In]
  fun HcsSubmitWerReport(settings : LibC::LPWSTR) : HRESULT

  # Params # gueststatefilepath : LibC::LPWSTR [In]
  fun HcsCreateEmptyGuestStateFile(gueststatefilepath : LibC::LPWSTR) : HRESULT

  # Params # runtimestatefilepath : LibC::LPWSTR [In]
  fun HcsCreateEmptyRuntimeStateFile(runtimestatefilepath : LibC::LPWSTR) : HRESULT

  # Params # vmid : LibC::LPWSTR [In],filepath : LibC::LPWSTR [In]
  fun HcsGrantVmAccess(vmid : LibC::LPWSTR, filepath : LibC::LPWSTR) : HRESULT

  # Params # vmid : LibC::LPWSTR [In],filepath : LibC::LPWSTR [In]
  fun HcsRevokeVmAccess(vmid : LibC::LPWSTR, filepath : LibC::LPWSTR) : HRESULT

  # Params # filepath : LibC::LPWSTR [In]
  fun HcsGrantVmGroupAccess(filepath : LibC::LPWSTR) : HRESULT

  # Params # filepath : LibC::LPWSTR [In]
  fun HcsRevokeVmGroupAccess(filepath : LibC::LPWSTR) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In],sourcefolderpath : LibC::LPWSTR [In],layerdata : LibC::LPWSTR [In]
  fun HcsImportLayer(layerpath : LibC::LPWSTR, sourcefolderpath : LibC::LPWSTR, layerdata : LibC::LPWSTR) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In],exportfolderpath : LibC::LPWSTR [In],layerdata : LibC::LPWSTR [In],options : LibC::LPWSTR [In]
  fun HcsExportLayer(layerpath : LibC::LPWSTR, exportfolderpath : LibC::LPWSTR, layerdata : LibC::LPWSTR, options : LibC::LPWSTR) : HRESULT

  # Params # writablelayermountpath : LibC::LPWSTR [In],writablelayerfolderpath : LibC::LPWSTR [In],exportfolderpath : LibC::LPWSTR [In],layerdata : LibC::LPWSTR [In]
  fun HcsExportLegacyWritableLayer(writablelayermountpath : LibC::LPWSTR, writablelayerfolderpath : LibC::LPWSTR, exportfolderpath : LibC::LPWSTR, layerdata : LibC::LPWSTR) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In]
  fun HcsDestroyLayer(layerpath : LibC::LPWSTR) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In],vhdhandle : LibC::HANDLE [In],options : LibC::LPWSTR [In]
  fun HcsSetupBaseOSLayer(layerpath : LibC::LPWSTR, vhdhandle : LibC::HANDLE, options : LibC::LPWSTR) : HRESULT

  # Params # writablelayerpath : LibC::LPWSTR [In],layerdata : LibC::LPWSTR [In],options : LibC::LPWSTR [In]
  fun HcsInitializeWritableLayer(writablelayerpath : LibC::LPWSTR, layerdata : LibC::LPWSTR, options : LibC::LPWSTR) : HRESULT

  # Params # writablelayermountpath : LibC::LPWSTR [In],writablelayerfolderpath : LibC::LPWSTR [In],layerdata : LibC::LPWSTR [In],options : LibC::LPWSTR [In]
  fun HcsInitializeLegacyWritableLayer(writablelayermountpath : LibC::LPWSTR, writablelayerfolderpath : LibC::LPWSTR, layerdata : LibC::LPWSTR, options : LibC::LPWSTR) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In],layerdata : LibC::LPWSTR [In]
  fun HcsAttachLayerStorageFilter(layerpath : LibC::LPWSTR, layerdata : LibC::LPWSTR) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In]
  fun HcsDetachLayerStorageFilter(layerpath : LibC::LPWSTR) : HRESULT

  # Params # vhdhandle : LibC::HANDLE [In]
  fun HcsFormatWritableLayerVhd(vhdhandle : LibC::HANDLE) : HRESULT

  # Params # vhdhandle : LibC::HANDLE [In],mountpath : LibC::LPWSTR* [In]
  fun HcsGetLayerVhdMountPath(vhdhandle : LibC::HANDLE, mountpath : LibC::LPWSTR*) : HRESULT

  # Params # layerpath : LibC::LPWSTR [In],volumepath : LibC::LPWSTR [In],options : LibC::LPWSTR [In]
  fun HcsSetupBaseOSVolume(layerpath : LibC::LPWSTR, volumepath : LibC::LPWSTR, options : LibC::LPWSTR) : HRESULT
end
