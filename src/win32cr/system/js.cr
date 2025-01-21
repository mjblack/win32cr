require "./diagnostics/debug.cr"
require "./../foundation.cr"
require "./com.cr"

module Win32cr::System::Js
  alias JsMemoryAllocationCallback = Proc(Void*, Win32cr::System::Js::JsMemoryEventType, LibC::UIntPtrT, Bool)*

  alias JsBeforeCollectCallback = Proc(Void*, Void)*

  alias JsBackgroundWorkItemCallback = Proc(Void*, Void)*

  alias JsThreadServiceCallback = Proc(Win32cr::System::Js::JsBackgroundWorkItemCallback, Void*, Bool)*

  alias JsFinalizeCallback = Proc(Void*, Void)*

  alias JsNativeFunction = Proc(Void*, Bool, Void**, UInt16, Void*, Void*)*

  JS_SOURCE_CONTEXT_NONE = 18446744073709551615_u64

  enum JsRuntimeVersion
    JsRuntimeVersion10 = 0_i32
    JsRuntimeVersion11 = 1_i32
    JsRuntimeVersionEdge = -1_i32
  end
  enum JsErrorCode : UInt32
    JsNoError = 0_u32
    JsErrorCategoryUsage = 65536_u32
    JsErrorInvalidArgument = 65537_u32
    JsErrorNullArgument = 65538_u32
    JsErrorNoCurrentContext = 65539_u32
    JsErrorInExceptionState = 65540_u32
    JsErrorNotImplemented = 65541_u32
    JsErrorWrongThread = 65542_u32
    JsErrorRuntimeInUse = 65543_u32
    JsErrorBadSerializedScript = 65544_u32
    JsErrorInDisabledState = 65545_u32
    JsErrorCannotDisableExecution = 65546_u32
    JsErrorHeapEnumInProgress = 65547_u32
    JsErrorArgumentNotObject = 65548_u32
    JsErrorInProfileCallback = 65549_u32
    JsErrorInThreadServiceCallback = 65550_u32
    JsErrorCannotSerializeDebugScript = 65551_u32
    JsErrorAlreadyDebuggingContext = 65552_u32
    JsErrorAlreadyProfilingContext = 65553_u32
    JsErrorIdleNotEnabled = 65554_u32
    JsErrorCategoryEngine = 131072_u32
    JsErrorOutOfMemory = 131073_u32
    JsErrorCategoryScript = 196608_u32
    JsErrorScriptException = 196609_u32
    JsErrorScriptCompile = 196610_u32
    JsErrorScriptTerminated = 196611_u32
    JsErrorScriptEvalDisabled = 196612_u32
    JsErrorCategoryFatal = 262144_u32
    JsErrorFatal = 262145_u32
  end
  enum JsRuntimeAttributes
    JsRuntimeAttributeNone = 0_i32
    JsRuntimeAttributeDisableBackgroundWork = 1_i32
    JsRuntimeAttributeAllowScriptInterrupt = 2_i32
    JsRuntimeAttributeEnableIdleProcessing = 4_i32
    JsRuntimeAttributeDisableNativeCodeGeneration = 8_i32
    JsRuntimeAttributeDisableEval = 16_i32
  end
  enum JsMemoryEventType
    JsMemoryAllocate = 0_i32
    JsMemoryFree = 1_i32
    JsMemoryFailure = 2_i32
  end
  enum JsValueType
    JsUndefined = 0_i32
    JsNull = 1_i32
    JsNumber = 2_i32
    JsString = 3_i32
    JsBoolean = 4_i32
    JsObject = 5_i32
    JsFunction = 6_i32
    JsError = 7_i32
    JsArray = 8_i32
  end

  @[Link("chakra")]
  lib C
    fun JsCreateRuntime(attributes : Win32cr::System::Js::JsRuntimeAttributes, runtimeVersion : Win32cr::System::Js::JsRuntimeVersion, threadService : Win32cr::System::Js::JsThreadServiceCallback, runtime : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCollectGarbage(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsDisposeRuntime(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsGetRuntimeMemoryUsage(runtime : Void*, memoryUsage : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode

    fun JsGetRuntimeMemoryLimit(runtime : Void*, memoryLimit : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode

    fun JsSetRuntimeMemoryLimit(runtime : Void*, memoryLimit : LibC::UIntPtrT) : Win32cr::System::Js::JsErrorCode

    fun JsSetRuntimeMemoryAllocationCallback(runtime : Void*, callbackState : Void*, allocationCallback : Win32cr::System::Js::JsMemoryAllocationCallback) : Win32cr::System::Js::JsErrorCode

    fun JsSetRuntimeBeforeCollectCallback(runtime : Void*, callbackState : Void*, beforeCollectCallback : Win32cr::System::Js::JsBeforeCollectCallback) : Win32cr::System::Js::JsErrorCode

    fun JsAddRef(ref : Void*, count : UInt32*) : Win32cr::System::Js::JsErrorCode

    fun JsRelease(ref : Void*, count : UInt32*) : Win32cr::System::Js::JsErrorCode

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun JsCreateContext(runtime : Void*, debugApplication : Void*, newContext : Void**) : Win32cr::System::Js::JsErrorCode
  {% end %}

    fun JsGetCurrentContext(currentContext : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSetCurrentContext(context : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsGetRuntime(context : Void*, runtime : Void**) : Win32cr::System::Js::JsErrorCode

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun JsStartDebugging(debugApplication : Void*) : Win32cr::System::Js::JsErrorCode
  {% end %}

    fun JsIdle(nextIdleTick : UInt32*) : Win32cr::System::Js::JsErrorCode

    fun JsParseScript(script : Win32cr::Foundation::PWSTR, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsRunScript(script : Win32cr::Foundation::PWSTR, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSerializeScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, bufferSize : UInt32*) : Win32cr::System::Js::JsErrorCode

    fun JsParseSerializedScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsRunSerializedScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetPropertyIdFromName(name : Win32cr::Foundation::PWSTR, propertyId : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetPropertyNameFromId(propertyId : Void*, name : UInt16**) : Win32cr::System::Js::JsErrorCode

    fun JsGetUndefinedValue(undefinedValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetNullValue(nullValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetTrueValue(trueValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetFalseValue(falseValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsBoolToBoolean(value : UInt8, booleanValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsBooleanToBool(value : Void*, boolValue : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsConvertValueToBoolean(value : Void*, booleanValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetValueType(value : Void*, type__ : Win32cr::System::Js::JsValueType*) : Win32cr::System::Js::JsErrorCode

    fun JsDoubleToNumber(doubleValue : Float64, value : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsIntToNumber(intValue : Int32, value : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsNumberToDouble(value : Void*, doubleValue : Float64*) : Win32cr::System::Js::JsErrorCode

    fun JsConvertValueToNumber(value : Void*, numberValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetStringLength(stringValue : Void*, length : Int32*) : Win32cr::System::Js::JsErrorCode

    fun JsPointerToString(stringValue : UInt16*, stringLength : LibC::UIntPtrT, value : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsStringToPointer(value : Void*, stringValue : UInt16**, stringLength : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode

    fun JsConvertValueToString(value : Void*, stringValue : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsVariantToValue(variant : Win32cr::System::Com::VARIANT*, value : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsValueToVariant(object : Void*, variant : Win32cr::System::Com::VARIANT*) : Win32cr::System::Js::JsErrorCode

    fun JsGetGlobalObject(globalObject : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateObject(object : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateExternalObject(data : Void*, finalizeCallback : Win32cr::System::Js::JsFinalizeCallback, object : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsConvertValueToObject(value : Void*, object : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetPrototype(object : Void*, prototypeObject : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSetPrototype(object : Void*, prototypeObject : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsGetExtensionAllowed(object : Void*, value : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsPreventExtension(object : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsGetProperty(object : Void*, propertyId : Void*, value : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetOwnPropertyDescriptor(object : Void*, propertyId : Void*, propertyDescriptor : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsGetOwnPropertyNames(object : Void*, propertyNames : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSetProperty(object : Void*, propertyId : Void*, value : Void*, useStrictRules : UInt8) : Win32cr::System::Js::JsErrorCode

    fun JsHasProperty(object : Void*, propertyId : Void*, hasProperty : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsDeleteProperty(object : Void*, propertyId : Void*, useStrictRules : UInt8, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsDefineProperty(object : Void*, propertyId : Void*, propertyDescriptor : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsHasIndexedProperty(object : Void*, index : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsGetIndexedProperty(object : Void*, index : Void*, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSetIndexedProperty(object : Void*, index : Void*, value : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsDeleteIndexedProperty(object : Void*, index : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsEquals(object1 : Void*, object2 : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsStrictEquals(object1 : Void*, object2 : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsHasExternalData(object : Void*, value : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsGetExternalData(object : Void*, externalData : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSetExternalData(object : Void*, externalData : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsCreateArray(length : UInt32, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCallFunction(function : Void*, arguments : Void**, argumentCount : UInt16, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsConstructObject(function : Void*, arguments : Void**, argumentCount : UInt16, result : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateFunction(nativeFunction : Win32cr::System::Js::JsNativeFunction, callbackState : Void*, function : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateRangeError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateReferenceError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateSyntaxError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateTypeError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsCreateURIError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsHasException(hasException : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsGetAndClearException(exception : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsSetException(exception : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsDisableRuntimeExecution(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsEnableRuntimeExecution(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    fun JsIsRuntimeExecutionDisabled(runtime : Void*, isDisabled : Bool*) : Win32cr::System::Js::JsErrorCode

    fun JsStartProfiling(callback : Void*, eventMask : Win32cr::System::Diagnostics::Debug::PROFILER_EVENT_MASK, context : UInt32) : Win32cr::System::Js::JsErrorCode

    fun JsStopProfiling(reason : Win32cr::Foundation::HRESULT) : Win32cr::System::Js::JsErrorCode

    fun JsEnumerateHeap(enumerator : Void**) : Win32cr::System::Js::JsErrorCode

    fun JsIsEnumeratingHeap(isEnumeratingHeap : Bool*) : Win32cr::System::Js::JsErrorCode

    {% if flag?(:i386) %}
    fun JsCreateContext(runtime : Void*, debugApplication : Void*, newContext : Void**) : Win32cr::System::Js::JsErrorCode
  {% end %}

    {% if flag?(:i386) %}
    fun JsStartDebugging(debugApplication : Void*) : Win32cr::System::Js::JsErrorCode
  {% end %}

  end
end