require "../system/diagnostics/debug.cr"
require "../foundation.cr"
require "../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:chakra.dll")]
lib LibWin32
  JS_SOURCE_CONTEXT_NONE = 18446744073709551615_u64

  alias JsMemoryAllocationCallback = Proc(Void*, JsMemoryEventType, LibC::UINT_PTR, Bool)
  alias JsBeforeCollectCallback = Proc(Void*, Void)
  alias JsBackgroundWorkItemCallback = Proc(Void*, Void)
  alias JsThreadServiceCallback = Proc(JsBackgroundWorkItemCallback, Void*, Bool)
  alias JsFinalizeCallback = Proc(Void*, Void)
  alias JsNativeFunction = Proc(Void*, Bool, Void**, UInt16, Void*, Void*)


  enum JsRuntimeVersion : Int32
    JsRuntimeVersion10 = 0
    JsRuntimeVersion11 = 1
    JsRuntimeVersionEdge = -1
  end

  enum JsErrorCode : UInt32
    JsNoError = 0
    JsErrorCategoryUsage = 65536
    JsErrorInvalidArgument = 65537
    JsErrorNullArgument = 65538
    JsErrorNoCurrentContext = 65539
    JsErrorInExceptionState = 65540
    JsErrorNotImplemented = 65541
    JsErrorWrongThread = 65542
    JsErrorRuntimeInUse = 65543
    JsErrorBadSerializedScript = 65544
    JsErrorInDisabledState = 65545
    JsErrorCannotDisableExecution = 65546
    JsErrorHeapEnumInProgress = 65547
    JsErrorArgumentNotObject = 65548
    JsErrorInProfileCallback = 65549
    JsErrorInThreadServiceCallback = 65550
    JsErrorCannotSerializeDebugScript = 65551
    JsErrorAlreadyDebuggingContext = 65552
    JsErrorAlreadyProfilingContext = 65553
    JsErrorIdleNotEnabled = 65554
    JsErrorCategoryEngine = 131072
    JsErrorOutOfMemory = 131073
    JsErrorCategoryScript = 196608
    JsErrorScriptException = 196609
    JsErrorScriptCompile = 196610
    JsErrorScriptTerminated = 196611
    JsErrorScriptEvalDisabled = 196612
    JsErrorCategoryFatal = 262144
    JsErrorFatal = 262145
  end

  enum JsRuntimeAttributes : Int32
    JsRuntimeAttributeNone = 0
    JsRuntimeAttributeDisableBackgroundWork = 1
    JsRuntimeAttributeAllowScriptInterrupt = 2
    JsRuntimeAttributeEnableIdleProcessing = 4
    JsRuntimeAttributeDisableNativeCodeGeneration = 8
    JsRuntimeAttributeDisableEval = 16
  end

  enum JsMemoryEventType : Int32
    JsMemoryAllocate = 0
    JsMemoryFree = 1
    JsMemoryFailure = 2
  end

  enum JsValueType : Int32
    JsUndefined = 0
    JsNull = 1
    JsNumber = 2
    JsString = 3
    JsBoolean = 4
    JsObject = 5
    JsFunction = 6
    JsError = 7
    JsArray = 8
  end


  # Params # attributes : JsRuntimeAttributes [In],runtimeversion : JsRuntimeVersion [In],threadservice : JsThreadServiceCallback [In],runtime : Void** [In]
  fun JsCreateRuntime(attributes : JsRuntimeAttributes, runtimeversion : JsRuntimeVersion, threadservice : JsThreadServiceCallback, runtime : Void**) : JsErrorCode

  # Params # runtime : Void* [In]
  fun JsCollectGarbage(runtime : Void*) : JsErrorCode

  # Params # runtime : Void* [In]
  fun JsDisposeRuntime(runtime : Void*) : JsErrorCode

  # Params # runtime : Void* [In],memoryusage : LibC::UINT_PTR* [In]
  fun JsGetRuntimeMemoryUsage(runtime : Void*, memoryusage : LibC::UINT_PTR*) : JsErrorCode

  # Params # runtime : Void* [In],memorylimit : LibC::UINT_PTR* [In]
  fun JsGetRuntimeMemoryLimit(runtime : Void*, memorylimit : LibC::UINT_PTR*) : JsErrorCode

  # Params # runtime : Void* [In],memorylimit : LibC::UINT_PTR [In]
  fun JsSetRuntimeMemoryLimit(runtime : Void*, memorylimit : LibC::UINT_PTR) : JsErrorCode

  # Params # runtime : Void* [In],callbackstate : Void* [In],allocationcallback : JsMemoryAllocationCallback [In]
  fun JsSetRuntimeMemoryAllocationCallback(runtime : Void*, callbackstate : Void*, allocationcallback : JsMemoryAllocationCallback) : JsErrorCode

  # Params # runtime : Void* [In],callbackstate : Void* [In],beforecollectcallback : JsBeforeCollectCallback [In]
  fun JsSetRuntimeBeforeCollectCallback(runtime : Void*, callbackstate : Void*, beforecollectcallback : JsBeforeCollectCallback) : JsErrorCode

  # Params # ref : Void* [In],count : UInt32* [In]
  fun JsAddRef(ref : Void*, count : UInt32*) : JsErrorCode

  # Params # ref : Void* [In],count : UInt32* [In]
  fun JsRelease(ref : Void*, count : UInt32*) : JsErrorCode

  # Params # runtime : Void* [In],debugapplication : IDebugApplication64 [In],newcontext : Void** [In]
  fun JsCreateContext(runtime : Void*, debugapplication : IDebugApplication64, newcontext : Void**) : JsErrorCode

  # Params # currentcontext : Void** [In]
  fun JsGetCurrentContext(currentcontext : Void**) : JsErrorCode

  # Params # context : Void* [In]
  fun JsSetCurrentContext(context : Void*) : JsErrorCode

  # Params # context : Void* [In],runtime : Void** [In]
  fun JsGetRuntime(context : Void*, runtime : Void**) : JsErrorCode

  # Params # debugapplication : IDebugApplication64 [In]
  fun JsStartDebugging(debugapplication : IDebugApplication64) : JsErrorCode

  # Params # nextidletick : UInt32* [In]
  fun JsIdle(nextidletick : UInt32*) : JsErrorCode

  # Params # script : LibC::LPWSTR [In],sourcecontext : LibC::UINT_PTR [In],sourceurl : LibC::LPWSTR [In],result : Void** [In]
  fun JsParseScript(script : LibC::LPWSTR, sourcecontext : LibC::UINT_PTR, sourceurl : LibC::LPWSTR, result : Void**) : JsErrorCode

  # Params # script : LibC::LPWSTR [In],sourcecontext : LibC::UINT_PTR [In],sourceurl : LibC::LPWSTR [In],result : Void** [In]
  fun JsRunScript(script : LibC::LPWSTR, sourcecontext : LibC::UINT_PTR, sourceurl : LibC::LPWSTR, result : Void**) : JsErrorCode

  # Params # script : LibC::LPWSTR [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun JsSerializeScript(script : LibC::LPWSTR, buffer : UInt8*, buffersize : UInt32*) : JsErrorCode

  # Params # script : LibC::LPWSTR [In],buffer : UInt8* [In],sourcecontext : LibC::UINT_PTR [In],sourceurl : LibC::LPWSTR [In],result : Void** [In]
  fun JsParseSerializedScript(script : LibC::LPWSTR, buffer : UInt8*, sourcecontext : LibC::UINT_PTR, sourceurl : LibC::LPWSTR, result : Void**) : JsErrorCode

  # Params # script : LibC::LPWSTR [In],buffer : UInt8* [In],sourcecontext : LibC::UINT_PTR [In],sourceurl : LibC::LPWSTR [In],result : Void** [In]
  fun JsRunSerializedScript(script : LibC::LPWSTR, buffer : UInt8*, sourcecontext : LibC::UINT_PTR, sourceurl : LibC::LPWSTR, result : Void**) : JsErrorCode

  # Params # name : LibC::LPWSTR [In],propertyid : Void** [In]
  fun JsGetPropertyIdFromName(name : LibC::LPWSTR, propertyid : Void**) : JsErrorCode

  # Params # propertyid : Void* [In],name : UInt16** [In]
  fun JsGetPropertyNameFromId(propertyid : Void*, name : UInt16**) : JsErrorCode

  # Params # undefinedvalue : Void** [In]
  fun JsGetUndefinedValue(undefinedvalue : Void**) : JsErrorCode

  # Params # nullvalue : Void** [In]
  fun JsGetNullValue(nullvalue : Void**) : JsErrorCode

  # Params # truevalue : Void** [In]
  fun JsGetTrueValue(truevalue : Void**) : JsErrorCode

  # Params # falsevalue : Void** [In]
  fun JsGetFalseValue(falsevalue : Void**) : JsErrorCode

  # Params # value : UInt8 [In],booleanvalue : Void** [In]
  fun JsBoolToBoolean(value : UInt8, booleanvalue : Void**) : JsErrorCode

  # Params # value : Void* [In],boolvalue : Bool* [In]
  fun JsBooleanToBool(value : Void*, boolvalue : Bool*) : JsErrorCode

  # Params # value : Void* [In],booleanvalue : Void** [In]
  fun JsConvertValueToBoolean(value : Void*, booleanvalue : Void**) : JsErrorCode

  # Params # value : Void* [In],type : JsValueType* [In]
  fun JsGetValueType(value : Void*, type : JsValueType*) : JsErrorCode

  # Params # doublevalue : Float64 [In],value : Void** [In]
  fun JsDoubleToNumber(doublevalue : Float64, value : Void**) : JsErrorCode

  # Params # intvalue : Int32 [In],value : Void** [In]
  fun JsIntToNumber(intvalue : Int32, value : Void**) : JsErrorCode

  # Params # value : Void* [In],doublevalue : Float64* [In]
  fun JsNumberToDouble(value : Void*, doublevalue : Float64*) : JsErrorCode

  # Params # value : Void* [In],numbervalue : Void** [In]
  fun JsConvertValueToNumber(value : Void*, numbervalue : Void**) : JsErrorCode

  # Params # stringvalue : Void* [In],length : Int32* [In]
  fun JsGetStringLength(stringvalue : Void*, length : Int32*) : JsErrorCode

  # Params # stringvalue : Char* [In],stringlength : LibC::UINT_PTR [In],value : Void** [In]
  fun JsPointerToString(stringvalue : Char*, stringlength : LibC::UINT_PTR, value : Void**) : JsErrorCode

  # Params # value : Void* [In],stringvalue : UInt16** [In],stringlength : LibC::UINT_PTR* [In]
  fun JsStringToPointer(value : Void*, stringvalue : UInt16**, stringlength : LibC::UINT_PTR*) : JsErrorCode

  # Params # value : Void* [In],stringvalue : Void** [In]
  fun JsConvertValueToString(value : Void*, stringvalue : Void**) : JsErrorCode

  # Params # variant : VARIANT* [In],value : Void** [In]
  fun JsVariantToValue(variant : VARIANT*, value : Void**) : JsErrorCode

  # Params # object : Void* [In],variant : VARIANT* [In]
  fun JsValueToVariant(object : Void*, variant : VARIANT*) : JsErrorCode

  # Params # globalobject : Void** [In]
  fun JsGetGlobalObject(globalobject : Void**) : JsErrorCode

  # Params # object : Void** [In]
  fun JsCreateObject(object : Void**) : JsErrorCode

  # Params # data : Void* [In],finalizecallback : JsFinalizeCallback [In],object : Void** [In]
  fun JsCreateExternalObject(data : Void*, finalizecallback : JsFinalizeCallback, object : Void**) : JsErrorCode

  # Params # value : Void* [In],object : Void** [In]
  fun JsConvertValueToObject(value : Void*, object : Void**) : JsErrorCode

  # Params # object : Void* [In],prototypeobject : Void** [In]
  fun JsGetPrototype(object : Void*, prototypeobject : Void**) : JsErrorCode

  # Params # object : Void* [In],prototypeobject : Void* [In]
  fun JsSetPrototype(object : Void*, prototypeobject : Void*) : JsErrorCode

  # Params # object : Void* [In],value : Bool* [In]
  fun JsGetExtensionAllowed(object : Void*, value : Bool*) : JsErrorCode

  # Params # object : Void* [In]
  fun JsPreventExtension(object : Void*) : JsErrorCode

  # Params # object : Void* [In],propertyid : Void* [In],value : Void** [In]
  fun JsGetProperty(object : Void*, propertyid : Void*, value : Void**) : JsErrorCode

  # Params # object : Void* [In],propertyid : Void* [In],propertydescriptor : Void** [In]
  fun JsGetOwnPropertyDescriptor(object : Void*, propertyid : Void*, propertydescriptor : Void**) : JsErrorCode

  # Params # object : Void* [In],propertynames : Void** [In]
  fun JsGetOwnPropertyNames(object : Void*, propertynames : Void**) : JsErrorCode

  # Params # object : Void* [In],propertyid : Void* [In],value : Void* [In],usestrictrules : UInt8 [In]
  fun JsSetProperty(object : Void*, propertyid : Void*, value : Void*, usestrictrules : UInt8) : JsErrorCode

  # Params # object : Void* [In],propertyid : Void* [In],hasproperty : Bool* [In]
  fun JsHasProperty(object : Void*, propertyid : Void*, hasproperty : Bool*) : JsErrorCode

  # Params # object : Void* [In],propertyid : Void* [In],usestrictrules : UInt8 [In],result : Void** [In]
  fun JsDeleteProperty(object : Void*, propertyid : Void*, usestrictrules : UInt8, result : Void**) : JsErrorCode

  # Params # object : Void* [In],propertyid : Void* [In],propertydescriptor : Void* [In],result : Bool* [In]
  fun JsDefineProperty(object : Void*, propertyid : Void*, propertydescriptor : Void*, result : Bool*) : JsErrorCode

  # Params # object : Void* [In],index : Void* [In],result : Bool* [In]
  fun JsHasIndexedProperty(object : Void*, index : Void*, result : Bool*) : JsErrorCode

  # Params # object : Void* [In],index : Void* [In],result : Void** [In]
  fun JsGetIndexedProperty(object : Void*, index : Void*, result : Void**) : JsErrorCode

  # Params # object : Void* [In],index : Void* [In],value : Void* [In]
  fun JsSetIndexedProperty(object : Void*, index : Void*, value : Void*) : JsErrorCode

  # Params # object : Void* [In],index : Void* [In]
  fun JsDeleteIndexedProperty(object : Void*, index : Void*) : JsErrorCode

  # Params # object1 : Void* [In],object2 : Void* [In],result : Bool* [In]
  fun JsEquals(object1 : Void*, object2 : Void*, result : Bool*) : JsErrorCode

  # Params # object1 : Void* [In],object2 : Void* [In],result : Bool* [In]
  fun JsStrictEquals(object1 : Void*, object2 : Void*, result : Bool*) : JsErrorCode

  # Params # object : Void* [In],value : Bool* [In]
  fun JsHasExternalData(object : Void*, value : Bool*) : JsErrorCode

  # Params # object : Void* [In],externaldata : Void** [In]
  fun JsGetExternalData(object : Void*, externaldata : Void**) : JsErrorCode

  # Params # object : Void* [In],externaldata : Void* [In]
  fun JsSetExternalData(object : Void*, externaldata : Void*) : JsErrorCode

  # Params # length : UInt32 [In],result : Void** [In]
  fun JsCreateArray(length : UInt32, result : Void**) : JsErrorCode

  # Params # function : Void* [In],arguments : Void** [In],argumentcount : UInt16 [In],result : Void** [In]
  fun JsCallFunction(function : Void*, arguments : Void**, argumentcount : UInt16, result : Void**) : JsErrorCode

  # Params # function : Void* [In],arguments : Void** [In],argumentcount : UInt16 [In],result : Void** [In]
  fun JsConstructObject(function : Void*, arguments : Void**, argumentcount : UInt16, result : Void**) : JsErrorCode

  # Params # nativefunction : JsNativeFunction [In],callbackstate : Void* [In],function : Void** [In]
  fun JsCreateFunction(nativefunction : JsNativeFunction, callbackstate : Void*, function : Void**) : JsErrorCode

  # Params # message : Void* [In],error : Void** [In]
  fun JsCreateError(message : Void*, error : Void**) : JsErrorCode

  # Params # message : Void* [In],error : Void** [In]
  fun JsCreateRangeError(message : Void*, error : Void**) : JsErrorCode

  # Params # message : Void* [In],error : Void** [In]
  fun JsCreateReferenceError(message : Void*, error : Void**) : JsErrorCode

  # Params # message : Void* [In],error : Void** [In]
  fun JsCreateSyntaxError(message : Void*, error : Void**) : JsErrorCode

  # Params # message : Void* [In],error : Void** [In]
  fun JsCreateTypeError(message : Void*, error : Void**) : JsErrorCode

  # Params # message : Void* [In],error : Void** [In]
  fun JsCreateURIError(message : Void*, error : Void**) : JsErrorCode

  # Params # hasexception : Bool* [In]
  fun JsHasException(hasexception : Bool*) : JsErrorCode

  # Params # exception : Void** [In]
  fun JsGetAndClearException(exception : Void**) : JsErrorCode

  # Params # exception : Void* [In]
  fun JsSetException(exception : Void*) : JsErrorCode

  # Params # runtime : Void* [In]
  fun JsDisableRuntimeExecution(runtime : Void*) : JsErrorCode

  # Params # runtime : Void* [In]
  fun JsEnableRuntimeExecution(runtime : Void*) : JsErrorCode

  # Params # runtime : Void* [In],isdisabled : Bool* [In]
  fun JsIsRuntimeExecutionDisabled(runtime : Void*, isdisabled : Bool*) : JsErrorCode

  # Params # callback : IActiveScriptProfilerCallback [In],eventmask : PROFILER_EVENT_MASK [In],context : UInt32 [In]
  fun JsStartProfiling(callback : IActiveScriptProfilerCallback, eventmask : PROFILER_EVENT_MASK, context : UInt32) : JsErrorCode

  # Params # reason : HRESULT [In]
  fun JsStopProfiling(reason : HRESULT) : JsErrorCode

  # Params # enumerator : IActiveScriptProfilerHeapEnum* [In]
  fun JsEnumerateHeap(enumerator : IActiveScriptProfilerHeapEnum*) : JsErrorCode

  # Params # isenumeratingheap : Bool* [In]
  fun JsIsEnumeratingHeap(isenumeratingheap : Bool*) : JsErrorCode
end
