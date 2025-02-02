require "./diagnostics/debug.cr"
require "./../foundation.cr"
require "./com.cr"

module Win32cr::System::Js
  extend self
  alias JsMemoryAllocationCallback = Proc(Void*, Win32cr::System::Js::JsMemoryEventType, LibC::UIntPtrT, Bool)

  alias JsBeforeCollectCallback = Proc(Void*, Void)

  alias JsBackgroundWorkItemCallback = Proc(Void*, Void)

  alias JsThreadServiceCallback = Proc(Win32cr::System::Js::JsBackgroundWorkItemCallback, Void*, Bool)

  alias JsFinalizeCallback = Proc(Void*, Void)

  alias JsNativeFunction = Proc(Void*, Bool, Void**, UInt16, Void*, Void*)

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

  def jsCreateRuntime(attributes : Win32cr::System::Js::JsRuntimeAttributes, runtimeVersion : Win32cr::System::Js::JsRuntimeVersion, threadService : Win32cr::System::Js::JsThreadServiceCallback, runtime : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateRuntime(attributes, runtimeVersion, threadService, runtime)
  end

  def jsCollectGarbage(runtime : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsCollectGarbage(runtime)
  end

  def jsDisposeRuntime(runtime : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsDisposeRuntime(runtime)
  end

  def jsGetRuntimeMemoryUsage(runtime : Void*, memoryUsage : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode
    C.JsGetRuntimeMemoryUsage(runtime, memoryUsage)
  end

  def jsGetRuntimeMemoryLimit(runtime : Void*, memoryLimit : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode
    C.JsGetRuntimeMemoryLimit(runtime, memoryLimit)
  end

  def jsSetRuntimeMemoryLimit(runtime : Void*, memoryLimit : LibC::UIntPtrT) : Win32cr::System::Js::JsErrorCode
    C.JsSetRuntimeMemoryLimit(runtime, memoryLimit)
  end

  def jsSetRuntimeMemoryAllocationCallback(runtime : Void*, callbackState : Void*, allocationCallback : Win32cr::System::Js::JsMemoryAllocationCallback) : Win32cr::System::Js::JsErrorCode
    C.JsSetRuntimeMemoryAllocationCallback(runtime, callbackState, allocationCallback)
  end

  def jsSetRuntimeBeforeCollectCallback(runtime : Void*, callbackState : Void*, beforeCollectCallback : Win32cr::System::Js::JsBeforeCollectCallback) : Win32cr::System::Js::JsErrorCode
    C.JsSetRuntimeBeforeCollectCallback(runtime, callbackState, beforeCollectCallback)
  end

  def jsAddRef(ref : Void*, count : UInt32*) : Win32cr::System::Js::JsErrorCode
    C.JsAddRef(ref, count)
  end

  def jsRelease(ref : Void*, count : UInt32*) : Win32cr::System::Js::JsErrorCode
    C.JsRelease(ref, count)
  end

{% if flag?(:x86_64) || flag?(:arm) %}
  def jsCreateContext(runtime : Void*, debugApplication : Void*, newContext : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateContext(runtime, debugApplication, newContext)
  end
{% end %}

  def jsGetCurrentContext(currentContext : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetCurrentContext(currentContext)
  end

  def jsSetCurrentContext(context : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsSetCurrentContext(context)
  end

  def jsGetRuntime(context : Void*, runtime : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetRuntime(context, runtime)
  end

{% if flag?(:x86_64) || flag?(:arm) %}
  def jsStartDebugging(debugApplication : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsStartDebugging(debugApplication)
  end
{% end %}

  def jsIdle(nextIdleTick : UInt32*) : Win32cr::System::Js::JsErrorCode
    C.JsIdle(nextIdleTick)
  end

  def jsParseScript(script : Win32cr::Foundation::PWSTR, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsParseScript(script, sourceContext, sourceUrl, result)
  end

  def jsRunScript(script : Win32cr::Foundation::PWSTR, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsRunScript(script, sourceContext, sourceUrl, result)
  end

  def jsSerializeScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, bufferSize : UInt32*) : Win32cr::System::Js::JsErrorCode
    C.JsSerializeScript(script, buffer, bufferSize)
  end

  def jsParseSerializedScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsParseSerializedScript(script, buffer, sourceContext, sourceUrl, result)
  end

  def jsRunSerializedScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsRunSerializedScript(script, buffer, sourceContext, sourceUrl, result)
  end

  def jsGetPropertyIdFromName(name : Win32cr::Foundation::PWSTR, propertyId : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetPropertyIdFromName(name, propertyId)
  end

  def jsGetPropertyNameFromId(propertyId : Void*, name : UInt16**) : Win32cr::System::Js::JsErrorCode
    C.JsGetPropertyNameFromId(propertyId, name)
  end

  def jsGetUndefinedValue(undefinedValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetUndefinedValue(undefinedValue)
  end

  def jsGetNullValue(nullValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetNullValue(nullValue)
  end

  def jsGetTrueValue(trueValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetTrueValue(trueValue)
  end

  def jsGetFalseValue(falseValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetFalseValue(falseValue)
  end

  def jsBoolToBoolean(value : UInt8, booleanValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsBoolToBoolean(value, booleanValue)
  end

  def jsBooleanToBool(value : Void*, boolValue : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsBooleanToBool(value, boolValue)
  end

  def jsConvertValueToBoolean(value : Void*, booleanValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsConvertValueToBoolean(value, booleanValue)
  end

  def jsGetValueType(value : Void*, type__ : Win32cr::System::Js::JsValueType*) : Win32cr::System::Js::JsErrorCode
    C.JsGetValueType(value, type__)
  end

  def jsDoubleToNumber(doubleValue : Float64, value : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsDoubleToNumber(doubleValue, value)
  end

  def jsIntToNumber(intValue : Int32, value : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsIntToNumber(intValue, value)
  end

  def jsNumberToDouble(value : Void*, doubleValue : Float64*) : Win32cr::System::Js::JsErrorCode
    C.JsNumberToDouble(value, doubleValue)
  end

  def jsConvertValueToNumber(value : Void*, numberValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsConvertValueToNumber(value, numberValue)
  end

  def jsGetStringLength(stringValue : Void*, length : Int32*) : Win32cr::System::Js::JsErrorCode
    C.JsGetStringLength(stringValue, length)
  end

  def jsPointerToString(stringValue : UInt16*, stringLength : LibC::UIntPtrT, value : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsPointerToString(stringValue, stringLength, value)
  end

  def jsStringToPointer(value : Void*, stringValue : UInt16**, stringLength : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode
    C.JsStringToPointer(value, stringValue, stringLength)
  end

  def jsConvertValueToString(value : Void*, stringValue : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsConvertValueToString(value, stringValue)
  end

  def jsVariantToValue(variant : Win32cr::System::Com::VARIANT*, value : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsVariantToValue(variant, value)
  end

  def jsValueToVariant(object : Void*, variant : Win32cr::System::Com::VARIANT*) : Win32cr::System::Js::JsErrorCode
    C.JsValueToVariant(object, variant)
  end

  def jsGetGlobalObject(globalObject : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetGlobalObject(globalObject)
  end

  def jsCreateObject(object : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateObject(object)
  end

  def jsCreateExternalObject(data : Void*, finalizeCallback : Win32cr::System::Js::JsFinalizeCallback, object : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateExternalObject(data, finalizeCallback, object)
  end

  def jsConvertValueToObject(value : Void*, object : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsConvertValueToObject(value, object)
  end

  def jsGetPrototype(object : Void*, prototypeObject : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetPrototype(object, prototypeObject)
  end

  def jsSetPrototype(object : Void*, prototypeObject : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsSetPrototype(object, prototypeObject)
  end

  def jsGetExtensionAllowed(object : Void*, value : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsGetExtensionAllowed(object, value)
  end

  def jsPreventExtension(object : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsPreventExtension(object)
  end

  def jsGetProperty(object : Void*, propertyId : Void*, value : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetProperty(object, propertyId, value)
  end

  def jsGetOwnPropertyDescriptor(object : Void*, propertyId : Void*, propertyDescriptor : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetOwnPropertyDescriptor(object, propertyId, propertyDescriptor)
  end

  def jsGetOwnPropertyNames(object : Void*, propertyNames : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetOwnPropertyNames(object, propertyNames)
  end

  def jsSetProperty(object : Void*, propertyId : Void*, value : Void*, useStrictRules : UInt8) : Win32cr::System::Js::JsErrorCode
    C.JsSetProperty(object, propertyId, value, useStrictRules)
  end

  def jsHasProperty(object : Void*, propertyId : Void*, hasProperty : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsHasProperty(object, propertyId, hasProperty)
  end

  def jsDeleteProperty(object : Void*, propertyId : Void*, useStrictRules : UInt8, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsDeleteProperty(object, propertyId, useStrictRules, result)
  end

  def jsDefineProperty(object : Void*, propertyId : Void*, propertyDescriptor : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsDefineProperty(object, propertyId, propertyDescriptor, result)
  end

  def jsHasIndexedProperty(object : Void*, index : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsHasIndexedProperty(object, index, result)
  end

  def jsGetIndexedProperty(object : Void*, index : Void*, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetIndexedProperty(object, index, result)
  end

  def jsSetIndexedProperty(object : Void*, index : Void*, value : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsSetIndexedProperty(object, index, value)
  end

  def jsDeleteIndexedProperty(object : Void*, index : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsDeleteIndexedProperty(object, index)
  end

  def jsEquals(object1 : Void*, object2 : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsEquals(object1, object2, result)
  end

  def jsStrictEquals(object1 : Void*, object2 : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsStrictEquals(object1, object2, result)
  end

  def jsHasExternalData(object : Void*, value : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsHasExternalData(object, value)
  end

  def jsGetExternalData(object : Void*, externalData : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetExternalData(object, externalData)
  end

  def jsSetExternalData(object : Void*, externalData : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsSetExternalData(object, externalData)
  end

  def jsCreateArray(length : UInt32, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateArray(length, result)
  end

  def jsCallFunction(function : Void*, arguments : Void**, argumentCount : UInt16, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCallFunction(function, arguments, argumentCount, result)
  end

  def jsConstructObject(function : Void*, arguments : Void**, argumentCount : UInt16, result : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsConstructObject(function, arguments, argumentCount, result)
  end

  def jsCreateFunction(nativeFunction : Win32cr::System::Js::JsNativeFunction, callbackState : Void*, function : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateFunction(nativeFunction, callbackState, function)
  end

  def jsCreateError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateError(message, error)
  end

  def jsCreateRangeError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateRangeError(message, error)
  end

  def jsCreateReferenceError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateReferenceError(message, error)
  end

  def jsCreateSyntaxError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateSyntaxError(message, error)
  end

  def jsCreateTypeError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateTypeError(message, error)
  end

  def jsCreateURIError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateURIError(message, error)
  end

  def jsHasException(hasException : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsHasException(hasException)
  end

  def jsGetAndClearException(exception : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsGetAndClearException(exception)
  end

  def jsSetException(exception : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsSetException(exception)
  end

  def jsDisableRuntimeExecution(runtime : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsDisableRuntimeExecution(runtime)
  end

  def jsEnableRuntimeExecution(runtime : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsEnableRuntimeExecution(runtime)
  end

  def jsIsRuntimeExecutionDisabled(runtime : Void*, isDisabled : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsIsRuntimeExecutionDisabled(runtime, isDisabled)
  end

  def jsStartProfiling(callback : Void*, eventMask : Win32cr::System::Diagnostics::Debug::PROFILER_EVENT_MASK, context : UInt32) : Win32cr::System::Js::JsErrorCode
    C.JsStartProfiling(callback, eventMask, context)
  end

  def jsStopProfiling(reason : Win32cr::Foundation::HRESULT) : Win32cr::System::Js::JsErrorCode
    C.JsStopProfiling(reason)
  end

  def jsEnumerateHeap(enumerator : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsEnumerateHeap(enumerator)
  end

  def jsIsEnumeratingHeap(isEnumeratingHeap : Bool*) : Win32cr::System::Js::JsErrorCode
    C.JsIsEnumeratingHeap(isEnumeratingHeap)
  end

{% if flag?(:i386) %}
  def jsCreateContext(runtime : Void*, debugApplication : Void*, newContext : Void**) : Win32cr::System::Js::JsErrorCode
    C.JsCreateContext(runtime, debugApplication, newContext)
  end
{% end %}

{% if flag?(:i386) %}
  def jsStartDebugging(debugApplication : Void*) : Win32cr::System::Js::JsErrorCode
    C.JsStartDebugging(debugApplication)
  end
{% end %}

  @[Link("chakra")]
  lib C
    # :nodoc:
    fun JsCreateRuntime(attributes : Win32cr::System::Js::JsRuntimeAttributes, runtimeVersion : Win32cr::System::Js::JsRuntimeVersion, threadService : Win32cr::System::Js::JsThreadServiceCallback, runtime : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCollectGarbage(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsDisposeRuntime(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetRuntimeMemoryUsage(runtime : Void*, memoryUsage : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetRuntimeMemoryLimit(runtime : Void*, memoryLimit : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetRuntimeMemoryLimit(runtime : Void*, memoryLimit : LibC::UIntPtrT) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetRuntimeMemoryAllocationCallback(runtime : Void*, callbackState : Void*, allocationCallback : Win32cr::System::Js::JsMemoryAllocationCallback) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetRuntimeBeforeCollectCallback(runtime : Void*, callbackState : Void*, beforeCollectCallback : Win32cr::System::Js::JsBeforeCollectCallback) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsAddRef(ref : Void*, count : UInt32*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsRelease(ref : Void*, count : UInt32*) : Win32cr::System::Js::JsErrorCode

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun JsCreateContext(runtime : Void*, debugApplication : Void*, newContext : Void**) : Win32cr::System::Js::JsErrorCode
    {% end %}

    # :nodoc:
    fun JsGetCurrentContext(currentContext : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetCurrentContext(context : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetRuntime(context : Void*, runtime : Void**) : Win32cr::System::Js::JsErrorCode

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun JsStartDebugging(debugApplication : Void*) : Win32cr::System::Js::JsErrorCode
    {% end %}

    # :nodoc:
    fun JsIdle(nextIdleTick : UInt32*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsParseScript(script : Win32cr::Foundation::PWSTR, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsRunScript(script : Win32cr::Foundation::PWSTR, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSerializeScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, bufferSize : UInt32*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsParseSerializedScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsRunSerializedScript(script : Win32cr::Foundation::PWSTR, buffer : UInt8*, sourceContext : LibC::UIntPtrT, sourceUrl : Win32cr::Foundation::PWSTR, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetPropertyIdFromName(name : Win32cr::Foundation::PWSTR, propertyId : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetPropertyNameFromId(propertyId : Void*, name : UInt16**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetUndefinedValue(undefinedValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetNullValue(nullValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetTrueValue(trueValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetFalseValue(falseValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsBoolToBoolean(value : UInt8, booleanValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsBooleanToBool(value : Void*, boolValue : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsConvertValueToBoolean(value : Void*, booleanValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetValueType(value : Void*, type__ : Win32cr::System::Js::JsValueType*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsDoubleToNumber(doubleValue : Float64, value : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsIntToNumber(intValue : Int32, value : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsNumberToDouble(value : Void*, doubleValue : Float64*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsConvertValueToNumber(value : Void*, numberValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetStringLength(stringValue : Void*, length : Int32*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsPointerToString(stringValue : UInt16*, stringLength : LibC::UIntPtrT, value : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsStringToPointer(value : Void*, stringValue : UInt16**, stringLength : LibC::UIntPtrT*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsConvertValueToString(value : Void*, stringValue : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsVariantToValue(variant : Win32cr::System::Com::VARIANT*, value : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsValueToVariant(object : Void*, variant : Win32cr::System::Com::VARIANT*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetGlobalObject(globalObject : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateObject(object : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateExternalObject(data : Void*, finalizeCallback : Win32cr::System::Js::JsFinalizeCallback, object : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsConvertValueToObject(value : Void*, object : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetPrototype(object : Void*, prototypeObject : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetPrototype(object : Void*, prototypeObject : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetExtensionAllowed(object : Void*, value : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsPreventExtension(object : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetProperty(object : Void*, propertyId : Void*, value : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetOwnPropertyDescriptor(object : Void*, propertyId : Void*, propertyDescriptor : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetOwnPropertyNames(object : Void*, propertyNames : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetProperty(object : Void*, propertyId : Void*, value : Void*, useStrictRules : UInt8) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsHasProperty(object : Void*, propertyId : Void*, hasProperty : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsDeleteProperty(object : Void*, propertyId : Void*, useStrictRules : UInt8, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsDefineProperty(object : Void*, propertyId : Void*, propertyDescriptor : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsHasIndexedProperty(object : Void*, index : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetIndexedProperty(object : Void*, index : Void*, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetIndexedProperty(object : Void*, index : Void*, value : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsDeleteIndexedProperty(object : Void*, index : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsEquals(object1 : Void*, object2 : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsStrictEquals(object1 : Void*, object2 : Void*, result : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsHasExternalData(object : Void*, value : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetExternalData(object : Void*, externalData : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetExternalData(object : Void*, externalData : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateArray(length : UInt32, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCallFunction(function : Void*, arguments : Void**, argumentCount : UInt16, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsConstructObject(function : Void*, arguments : Void**, argumentCount : UInt16, result : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateFunction(nativeFunction : Win32cr::System::Js::JsNativeFunction, callbackState : Void*, function : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateRangeError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateReferenceError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateSyntaxError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateTypeError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsCreateURIError(message : Void*, error : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsHasException(hasException : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsGetAndClearException(exception : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsSetException(exception : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsDisableRuntimeExecution(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsEnableRuntimeExecution(runtime : Void*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsIsRuntimeExecutionDisabled(runtime : Void*, isDisabled : Bool*) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsStartProfiling(callback : Void*, eventMask : Win32cr::System::Diagnostics::Debug::PROFILER_EVENT_MASK, context : UInt32) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsStopProfiling(reason : Win32cr::Foundation::HRESULT) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsEnumerateHeap(enumerator : Void**) : Win32cr::System::Js::JsErrorCode

    # :nodoc:
    fun JsIsEnumeratingHeap(isEnumeratingHeap : Bool*) : Win32cr::System::Js::JsErrorCode

    {% if flag?(:i386) %}
    # :nodoc:
    fun JsCreateContext(runtime : Void*, debugApplication : Void*, newContext : Void**) : Win32cr::System::Js::JsErrorCode
    {% end %}

    {% if flag?(:i386) %}
    # :nodoc:
    fun JsStartDebugging(debugApplication : Void*) : Win32cr::System::Js::JsErrorCode
    {% end %}

  end
end