require "./../../foundation.cr"
require "./../com.cr"

module Win32cr::System::Com::CallObj

  enum CALLFRAME_COPY
    CALLFRAME_COPY_NESTED = 1_i32
    CALLFRAME_COPY_INDEPENDENT = 2_i32
  end
  enum CALLFRAME_FREE
    CALLFRAME_FREE_NONE = 0_i32
    CALLFRAME_FREE_IN = 1_i32
    CALLFRAME_FREE_INOUT = 2_i32
    CALLFRAME_FREE_OUT = 4_i32
    CALLFRAME_FREE_TOP_INOUT = 8_i32
    CALLFRAME_FREE_TOP_OUT = 16_i32
    CALLFRAME_FREE_ALL = 31_i32
  end
  enum CALLFRAME_NULL
    CALLFRAME_NULL_NONE = 0_i32
    CALLFRAME_NULL_INOUT = 2_i32
    CALLFRAME_NULL_OUT = 4_i32
    CALLFRAME_NULL_ALL = 6_i32
  end
  enum CALLFRAME_WALK
    CALLFRAME_WALK_IN = 1_i32
    CALLFRAME_WALK_INOUT = 2_i32
    CALLFRAME_WALK_OUT = 4_i32
  end

  @[Extern]
  record CALLFRAMEINFO,
    iMethod : UInt32,
    fHasInValues : Win32cr::Foundation::BOOL,
    fHasInOutValues : Win32cr::Foundation::BOOL,
    fHasOutValues : Win32cr::Foundation::BOOL,
    fDerivesFromIDispatch : Win32cr::Foundation::BOOL,
    cInInterfacesMax : Int32,
    cInOutInterfacesMax : Int32,
    cOutInterfacesMax : Int32,
    cTopLevelInInterfaces : Int32,
    iid : LibC::GUID,
    cMethod : UInt32,
    cParams : UInt32

  @[Extern]
  record CALLFRAMEPARAMINFO,
    fIn : Win32cr::Foundation::BOOLEAN,
    fOut : Win32cr::Foundation::BOOLEAN,
    stackOffset : UInt32,
    cbParam : UInt32

  @[Extern]
  record CALLFRAME_MARSHALCONTEXT,
    fIn : Win32cr::Foundation::BOOLEAN,
    dwDestContext : UInt32,
    pvDestContext : Void*,
    punkReserved : Void*,
    guidTransferSyntax : LibC::GUID

  @[Extern]
  record ICallFrameVtbl,
    query_interface : Proc(ICallFrame*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallFrame*, UInt32),
    release : Proc(ICallFrame*, UInt32),
    get_info : Proc(ICallFrame*, Win32cr::System::Com::CallObj::CALLFRAMEINFO*, Win32cr::Foundation::HRESULT),
    get_iid_and_method : Proc(ICallFrame*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_names : Proc(ICallFrame*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_stack_location : Proc(ICallFrame*, Void*),
    set_stack_location : Proc(ICallFrame*, Void*, Void),
    set_return_value : Proc(ICallFrame*, Win32cr::Foundation::HRESULT, Void),
    get_return_value : Proc(ICallFrame*, Win32cr::Foundation::HRESULT),
    get_param_info : Proc(ICallFrame*, UInt32, Win32cr::System::Com::CallObj::CALLFRAMEPARAMINFO*, Win32cr::Foundation::HRESULT),
    set_param : Proc(ICallFrame*, UInt32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_param : Proc(ICallFrame*, UInt32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    copy : Proc(ICallFrame*, Win32cr::System::Com::CallObj::CALLFRAME_COPY, Void*, Void**, Win32cr::Foundation::HRESULT),
    free : Proc(ICallFrame*, Void*, Void*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    free_param : Proc(ICallFrame*, UInt32, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    walk_frame : Proc(ICallFrame*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_marshal_size_max : Proc(ICallFrame*, Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, Win32cr::System::Com::MSHLFLAGS, UInt32*, Win32cr::Foundation::HRESULT),
    marshal : Proc(ICallFrame*, Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, Win32cr::System::Com::MSHLFLAGS, Void*, UInt32, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    unmarshal : Proc(ICallFrame*, Void*, UInt32, UInt32, Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, UInt32*, Win32cr::Foundation::HRESULT),
    release_marshal_data : Proc(ICallFrame*, Void*, UInt32, UInt32, UInt32, Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, Win32cr::Foundation::HRESULT),
    invoke : Proc(ICallFrame*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d573b4b0-894e-11d2-b8b6-00c04fb9618a")]
  record ICallFrame, lpVtbl : ICallFrameVtbl* do
    GUID = LibC::GUID.new(0xd573b4b0_u32, 0x894e_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : ICallFrame*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallFrame*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallFrame*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : ICallFrame*, pInfo : Win32cr::System::Com::CallObj::CALLFRAMEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_iid_and_method(this : ICallFrame*, pIID : LibC::GUID*, piMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iid_and_method.call(this, pIID, piMethod)
    end
    def get_names(this : ICallFrame*, pwszInterface : Win32cr::Foundation::PWSTR*, pwszMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names.call(this, pwszInterface, pwszMethod)
    end
    def get_stack_location(this : ICallFrame*) : Void*
      @lpVtbl.try &.value.get_stack_location.call(this)
    end
    def set_stack_location(this : ICallFrame*, pvStack : Void*) : Void
      @lpVtbl.try &.value.set_stack_location.call(this, pvStack)
    end
    def set_return_value(this : ICallFrame*, hr : Win32cr::Foundation::HRESULT) : Void
      @lpVtbl.try &.value.set_return_value.call(this, hr)
    end
    def get_return_value(this : ICallFrame*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_return_value.call(this)
    end
    def get_param_info(this : ICallFrame*, iparam : UInt32, pInfo : Win32cr::System::Com::CallObj::CALLFRAMEPARAMINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param_info.call(this, iparam, pInfo)
    end
    def set_param(this : ICallFrame*, iparam : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_param.call(this, iparam, pvar)
    end
    def get_param(this : ICallFrame*, iparam : UInt32, pvar : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param.call(this, iparam, pvar)
    end
    def copy(this : ICallFrame*, copyControl : Win32cr::System::Com::CallObj::CALLFRAME_COPY, pWalker : Void*, ppFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, copyControl, pWalker, ppFrame)
    end
    def free(this : ICallFrame*, pframeArgsDest : Void*, pWalkerDestFree : Void*, pWalkerCopy : Void*, freeFlags : UInt32, pWalkerFree : Void*, nullFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free.call(this, pframeArgsDest, pWalkerDestFree, pWalkerCopy, freeFlags, pWalkerFree, nullFlags)
    end
    def free_param(this : ICallFrame*, iparam : UInt32, freeFlags : UInt32, pWalkerFree : Void*, nullFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_param.call(this, iparam, freeFlags, pWalkerFree, nullFlags)
    end
    def walk_frame(this : ICallFrame*, walkWhat : UInt32, pWalker : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.walk_frame.call(this, walkWhat, pWalker)
    end
    def get_marshal_size_max(this : ICallFrame*, pmshlContext : Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, mshlflags : Win32cr::System::Com::MSHLFLAGS, pcbBufferNeeded : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marshal_size_max.call(this, pmshlContext, mshlflags, pcbBufferNeeded)
    end
    def marshal(this : ICallFrame*, pmshlContext : Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, mshlflags : Win32cr::System::Com::MSHLFLAGS, pBuffer : Void*, cbBuffer : UInt32, pcbBufferUsed : UInt32*, pdataRep : UInt32*, prpcFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.marshal.call(this, pmshlContext, mshlflags, pBuffer, cbBuffer, pcbBufferUsed, pdataRep, prpcFlags)
    end
    def unmarshal(this : ICallFrame*, pBuffer : Void*, cbBuffer : UInt32, dataRep : UInt32, pcontext : Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, pcbUnmarshalled : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmarshal.call(this, pBuffer, cbBuffer, dataRep, pcontext, pcbUnmarshalled)
    end
    def release_marshal_data(this : ICallFrame*, pBuffer : Void*, cbBuffer : UInt32, ibFirstRelease : UInt32, dataRep : UInt32, pcontext : Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_marshal_data.call(this, pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext)
    end
    def invoke(this : ICallFrame*, pvReceiver : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, pvReceiver)
    end

  end

  @[Extern]
  record ICallIndirectVtbl,
    query_interface : Proc(ICallIndirect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallIndirect*, UInt32),
    release : Proc(ICallIndirect*, UInt32),
    call_indirect : Proc(ICallIndirect*, Win32cr::Foundation::HRESULT*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_info : Proc(ICallIndirect*, UInt32, Win32cr::System::Com::CallObj::CALLFRAMEINFO*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_stack_size : Proc(ICallIndirect*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_iid : Proc(ICallIndirect*, LibC::GUID*, Win32cr::Foundation::BOOL*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d573b4b1-894e-11d2-b8b6-00c04fb9618a")]
  record ICallIndirect, lpVtbl : ICallIndirectVtbl* do
    GUID = LibC::GUID.new(0xd573b4b1_u32, 0x894e_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : ICallIndirect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallIndirect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallIndirect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def call_indirect(this : ICallIndirect*, phrReturn : Win32cr::Foundation::HRESULT*, iMethod : UInt32, pvArgs : Void*, cbArgs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.call_indirect.call(this, phrReturn, iMethod, pvArgs, cbArgs)
    end
    def get_method_info(this : ICallIndirect*, iMethod : UInt32, pInfo : Win32cr::System::Com::CallObj::CALLFRAMEINFO*, pwszMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_info.call(this, iMethod, pInfo, pwszMethod)
    end
    def get_stack_size(this : ICallIndirect*, iMethod : UInt32, cbArgs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_size.call(this, iMethod, cbArgs)
    end
    def get_iid(this : ICallIndirect*, piid : LibC::GUID*, pfDerivesFromIDispatch : Win32cr::Foundation::BOOL*, pcMethod : UInt32*, pwszInterface : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iid.call(this, piid, pfDerivesFromIDispatch, pcMethod, pwszInterface)
    end

  end

  @[Extern]
  record ICallInterceptorVtbl,
    query_interface : Proc(ICallInterceptor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallInterceptor*, UInt32),
    release : Proc(ICallInterceptor*, UInt32),
    call_indirect : Proc(ICallInterceptor*, Win32cr::Foundation::HRESULT*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_info : Proc(ICallInterceptor*, UInt32, Win32cr::System::Com::CallObj::CALLFRAMEINFO*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_stack_size : Proc(ICallInterceptor*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_iid : Proc(ICallInterceptor*, LibC::GUID*, Win32cr::Foundation::BOOL*, UInt32*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    register_sink : Proc(ICallInterceptor*, Void*, Win32cr::Foundation::HRESULT),
    get_registered_sink : Proc(ICallInterceptor*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("60c7ca75-896d-11d2-b8b6-00c04fb9618a")]
  record ICallInterceptor, lpVtbl : ICallInterceptorVtbl* do
    GUID = LibC::GUID.new(0x60c7ca75_u32, 0x896d_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : ICallInterceptor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallInterceptor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallInterceptor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def call_indirect(this : ICallInterceptor*, phrReturn : Win32cr::Foundation::HRESULT*, iMethod : UInt32, pvArgs : Void*, cbArgs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.call_indirect.call(this, phrReturn, iMethod, pvArgs, cbArgs)
    end
    def get_method_info(this : ICallInterceptor*, iMethod : UInt32, pInfo : Win32cr::System::Com::CallObj::CALLFRAMEINFO*, pwszMethod : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_info.call(this, iMethod, pInfo, pwszMethod)
    end
    def get_stack_size(this : ICallInterceptor*, iMethod : UInt32, cbArgs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_size.call(this, iMethod, cbArgs)
    end
    def get_iid(this : ICallInterceptor*, piid : LibC::GUID*, pfDerivesFromIDispatch : Win32cr::Foundation::BOOL*, pcMethod : UInt32*, pwszInterface : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iid.call(this, piid, pfDerivesFromIDispatch, pcMethod, pwszInterface)
    end
    def register_sink(this : ICallInterceptor*, psink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_sink.call(this, psink)
    end
    def get_registered_sink(this : ICallInterceptor*, ppsink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registered_sink.call(this, ppsink)
    end

  end

  @[Extern]
  record ICallFrameEventsVtbl,
    query_interface : Proc(ICallFrameEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallFrameEvents*, UInt32),
    release : Proc(ICallFrameEvents*, UInt32),
    on_call : Proc(ICallFrameEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fd5e0843-fc91-11d0-97d7-00c04fb9618a")]
  record ICallFrameEvents, lpVtbl : ICallFrameEventsVtbl* do
    GUID = LibC::GUID.new(0xfd5e0843_u32, 0xfc91_u16, 0x11d0_u16, StaticArray[0x97_u8, 0xd7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : ICallFrameEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallFrameEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallFrameEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_call(this : ICallFrameEvents*, pFrame : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_call.call(this, pFrame)
    end

  end

  @[Extern]
  record ICallUnmarshalVtbl,
    query_interface : Proc(ICallUnmarshal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallUnmarshal*, UInt32),
    release : Proc(ICallUnmarshal*, UInt32),
    unmarshal : Proc(ICallUnmarshal*, UInt32, Void*, UInt32, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    release_marshal_data : Proc(ICallUnmarshal*, UInt32, Void*, UInt32, UInt32, UInt32, Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5333b003-2e42-11d2-b89d-00c04fb9618a")]
  record ICallUnmarshal, lpVtbl : ICallUnmarshalVtbl* do
    GUID = LibC::GUID.new(0x5333b003_u32, 0x2e42_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0x9d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : ICallUnmarshal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallUnmarshal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallUnmarshal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def unmarshal(this : ICallUnmarshal*, iMethod : UInt32, pBuffer : Void*, cbBuffer : UInt32, fForceBufferCopy : Win32cr::Foundation::BOOL, dataRep : UInt32, pcontext : Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*, pcbUnmarshalled : UInt32*, ppFrame : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmarshal.call(this, iMethod, pBuffer, cbBuffer, fForceBufferCopy, dataRep, pcontext, pcbUnmarshalled, ppFrame)
    end
    def release_marshal_data(this : ICallUnmarshal*, iMethod : UInt32, pBuffer : Void*, cbBuffer : UInt32, ibFirstRelease : UInt32, dataRep : UInt32, pcontext : Win32cr::System::Com::CallObj::CALLFRAME_MARSHALCONTEXT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_marshal_data.call(this, iMethod, pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext)
    end

  end

  @[Extern]
  record ICallFrameWalkerVtbl,
    query_interface : Proc(ICallFrameWalker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICallFrameWalker*, UInt32),
    release : Proc(ICallFrameWalker*, UInt32),
    on_walk_interface : Proc(ICallFrameWalker*, LibC::GUID*, Void**, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("08b23919-392d-11d2-b8a4-00c04fb9618a")]
  record ICallFrameWalker, lpVtbl : ICallFrameWalkerVtbl* do
    GUID = LibC::GUID.new(0x8b23919_u32, 0x392d_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xa4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
    def query_interface(this : ICallFrameWalker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICallFrameWalker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICallFrameWalker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_walk_interface(this : ICallFrameWalker*, iid : LibC::GUID*, ppvInterface : Void**, fIn : Win32cr::Foundation::BOOL, fOut : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_walk_interface.call(this, iid, ppvInterface, fIn, fOut)
    end

  end

  @[Extern]
  record IInterfaceRelatedVtbl,
    query_interface : Proc(IInterfaceRelated*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInterfaceRelated*, UInt32),
    release : Proc(IInterfaceRelated*, UInt32),
    set_iid : Proc(IInterfaceRelated*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_iid : Proc(IInterfaceRelated*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d1fb5a79-7706-11d1-adba-00c04fc2adc0")]
  record IInterfaceRelated, lpVtbl : IInterfaceRelatedVtbl* do
    GUID = LibC::GUID.new(0xd1fb5a79_u32, 0x7706_u16, 0x11d1_u16, StaticArray[0xad_u8, 0xba_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xad_u8, 0xc0_u8])
    def query_interface(this : IInterfaceRelated*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInterfaceRelated*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInterfaceRelated*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_iid(this : IInterfaceRelated*, iid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_iid.call(this, iid)
    end
    def get_iid(this : IInterfaceRelated*, piid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iid.call(this, piid)
    end

  end

  @[Link("ole32")]
  lib C
    fun CoGetInterceptor(iidIntercepted : LibC::GUID*, punkOuter : Void*, iid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoGetInterceptorFromTypeInfo(iidIntercepted : LibC::GUID*, punkOuter : Void*, typeInfo : Void*, iid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

  end
end