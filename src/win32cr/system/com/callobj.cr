require "../../foundation.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
{% else %}
@[Link("ole32")]
{% end %}
lib LibWin32

  enum CALLFRAME_COPY : Int32
    CALLFRAME_COPY_NESTED = 1
    CALLFRAME_COPY_INDEPENDENT = 2
  end

  enum CALLFRAME_FREE : Int32
    CALLFRAME_FREE_NONE = 0
    CALLFRAME_FREE_IN = 1
    CALLFRAME_FREE_INOUT = 2
    CALLFRAME_FREE_OUT = 4
    CALLFRAME_FREE_TOP_INOUT = 8
    CALLFRAME_FREE_TOP_OUT = 16
    CALLFRAME_FREE_ALL = 31
  end

  enum CALLFRAME_NULL : Int32
    CALLFRAME_NULL_NONE = 0
    CALLFRAME_NULL_INOUT = 2
    CALLFRAME_NULL_OUT = 4
    CALLFRAME_NULL_ALL = 6
  end

  enum CALLFRAME_WALK : Int32
    CALLFRAME_WALK_IN = 1
    CALLFRAME_WALK_INOUT = 2
    CALLFRAME_WALK_OUT = 4
  end

  struct CALLFRAMEINFO
    i_method : UInt32
    f_has_in_values : LibC::BOOL
    f_has_in_out_values : LibC::BOOL
    f_has_out_values : LibC::BOOL
    f_derives_from_i_dispatch : LibC::BOOL
    c_in_interfaces_max : Int32
    c_in_out_interfaces_max : Int32
    c_out_interfaces_max : Int32
    c_top_level_in_interfaces : Int32
    iid : Guid
    c_method : UInt32
    c_params : UInt32
  end
  struct CALLFRAMEPARAMINFO
    f_in : BOOLEAN
    f_out : BOOLEAN
    stack_offset : UInt32
    cb_param : UInt32
  end
  struct CALLFRAME_MARSHALCONTEXT
    f_in : BOOLEAN
    dw_dest_context : UInt32
    pv_dest_context : Void*
    punk_reserved : IUnknown
    guid_transfer_syntax : Guid
  end


  struct ICallFrameVTbl
    query_interface : Proc(ICallFrame*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallFrame*, UInt32)
    release : Proc(ICallFrame*, UInt32)
    get_info : Proc(ICallFrame*, CALLFRAMEINFO*, HRESULT)
    get_iid_and_method : Proc(ICallFrame*, Guid*, UInt32*, HRESULT)
    get_names : Proc(ICallFrame*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    get_stack_location : Proc(ICallFrame*, Void**)
    set_stack_location : Proc(ICallFrame*, Void*, Void)
    set_return_value : Proc(ICallFrame*, HRESULT, Void)
    get_return_value : Proc(ICallFrame*, HRESULT)
    get_param_info : Proc(ICallFrame*, UInt32, CALLFRAMEPARAMINFO*, HRESULT)
    set_param : Proc(ICallFrame*, UInt32, VARIANT*, HRESULT)
    get_param : Proc(ICallFrame*, UInt32, VARIANT*, HRESULT)
    copy : Proc(ICallFrame*, CALLFRAME_COPY, ICallFrameWalker, ICallFrame*, HRESULT)
    free : Proc(ICallFrame*, ICallFrame, ICallFrameWalker, ICallFrameWalker, UInt32, ICallFrameWalker, UInt32, HRESULT)
    free_param : Proc(ICallFrame*, UInt32, UInt32, ICallFrameWalker, UInt32, HRESULT)
    walk_frame : Proc(ICallFrame*, UInt32, ICallFrameWalker, HRESULT)
    get_marshal_size_max : Proc(ICallFrame*, CALLFRAME_MARSHALCONTEXT*, MSHLFLAGS, UInt32*, HRESULT)
    marshal : Proc(ICallFrame*, CALLFRAME_MARSHALCONTEXT*, MSHLFLAGS, Void*, UInt32, UInt32*, UInt32*, UInt32*, HRESULT)
    unmarshal : Proc(ICallFrame*, Void*, UInt32, UInt32, CALLFRAME_MARSHALCONTEXT*, UInt32*, HRESULT)
    release_marshal_data : Proc(ICallFrame*, Void*, UInt32, UInt32, UInt32, CALLFRAME_MARSHALCONTEXT*, HRESULT)
    invoke : Proc(ICallFrame*, Void*, HRESULT)
  end

  ICallFrame_GUID = "d573b4b0-894e-11d2-b8b6-00c04fb9618a"
  IID_ICallFrame = LibC::GUID.new(0xd573b4b0_u32, 0x894e_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallFrame
    lpVtbl : ICallFrameVTbl*
  end

  struct ICallIndirectVTbl
    query_interface : Proc(ICallIndirect*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallIndirect*, UInt32)
    release : Proc(ICallIndirect*, UInt32)
    call_indirect : Proc(ICallIndirect*, HRESULT*, UInt32, Void*, UInt32*, HRESULT)
    get_method_info : Proc(ICallIndirect*, UInt32, CALLFRAMEINFO*, LibC::LPWSTR*, HRESULT)
    get_stack_size : Proc(ICallIndirect*, UInt32, UInt32*, HRESULT)
    get_iid : Proc(ICallIndirect*, Guid*, LibC::BOOL*, UInt32*, LibC::LPWSTR*, HRESULT)
  end

  ICallIndirect_GUID = "d573b4b1-894e-11d2-b8b6-00c04fb9618a"
  IID_ICallIndirect = LibC::GUID.new(0xd573b4b1_u32, 0x894e_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallIndirect
    lpVtbl : ICallIndirectVTbl*
  end

  struct ICallInterceptorVTbl
    query_interface : Proc(ICallInterceptor*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallInterceptor*, UInt32)
    release : Proc(ICallInterceptor*, UInt32)
    call_indirect : Proc(ICallInterceptor*, HRESULT*, UInt32, Void*, UInt32*, HRESULT)
    get_method_info : Proc(ICallInterceptor*, UInt32, CALLFRAMEINFO*, LibC::LPWSTR*, HRESULT)
    get_stack_size : Proc(ICallInterceptor*, UInt32, UInt32*, HRESULT)
    get_iid : Proc(ICallInterceptor*, Guid*, LibC::BOOL*, UInt32*, LibC::LPWSTR*, HRESULT)
    register_sink : Proc(ICallInterceptor*, ICallFrameEvents, HRESULT)
    get_registered_sink : Proc(ICallInterceptor*, ICallFrameEvents*, HRESULT)
  end

  ICallInterceptor_GUID = "60c7ca75-896d-11d2-b8b6-00c04fb9618a"
  IID_ICallInterceptor = LibC::GUID.new(0x60c7ca75_u32, 0x896d_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallInterceptor
    lpVtbl : ICallInterceptorVTbl*
  end

  struct ICallFrameEventsVTbl
    query_interface : Proc(ICallFrameEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallFrameEvents*, UInt32)
    release : Proc(ICallFrameEvents*, UInt32)
    on_call : Proc(ICallFrameEvents*, ICallFrame, HRESULT)
  end

  ICallFrameEvents_GUID = "fd5e0843-fc91-11d0-97d7-00c04fb9618a"
  IID_ICallFrameEvents = LibC::GUID.new(0xfd5e0843_u32, 0xfc91_u16, 0x11d0_u16, StaticArray[0x97_u8, 0xd7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallFrameEvents
    lpVtbl : ICallFrameEventsVTbl*
  end

  struct ICallUnmarshalVTbl
    query_interface : Proc(ICallUnmarshal*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallUnmarshal*, UInt32)
    release : Proc(ICallUnmarshal*, UInt32)
    unmarshal : Proc(ICallUnmarshal*, UInt32, Void*, UInt32, LibC::BOOL, UInt32, CALLFRAME_MARSHALCONTEXT*, UInt32*, ICallFrame*, HRESULT)
    release_marshal_data : Proc(ICallUnmarshal*, UInt32, Void*, UInt32, UInt32, UInt32, CALLFRAME_MARSHALCONTEXT*, HRESULT)
  end

  ICallUnmarshal_GUID = "5333b003-2e42-11d2-b89d-00c04fb9618a"
  IID_ICallUnmarshal = LibC::GUID.new(0x5333b003_u32, 0x2e42_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0x9d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallUnmarshal
    lpVtbl : ICallUnmarshalVTbl*
  end

  struct ICallFrameWalkerVTbl
    query_interface : Proc(ICallFrameWalker*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICallFrameWalker*, UInt32)
    release : Proc(ICallFrameWalker*, UInt32)
    on_walk_interface : Proc(ICallFrameWalker*, Guid*, Void**, LibC::BOOL, LibC::BOOL, HRESULT)
  end

  ICallFrameWalker_GUID = "08b23919-392d-11d2-b8a4-00c04fb9618a"
  IID_ICallFrameWalker = LibC::GUID.new(0x8b23919_u32, 0x392d_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xa4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallFrameWalker
    lpVtbl : ICallFrameWalkerVTbl*
  end

  struct IInterfaceRelatedVTbl
    query_interface : Proc(IInterfaceRelated*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInterfaceRelated*, UInt32)
    release : Proc(IInterfaceRelated*, UInt32)
    set_iid : Proc(IInterfaceRelated*, Guid*, HRESULT)
    get_iid : Proc(IInterfaceRelated*, Guid*, HRESULT)
  end

  IInterfaceRelated_GUID = "d1fb5a79-7706-11d1-adba-00c04fc2adc0"
  IID_IInterfaceRelated = LibC::GUID.new(0xd1fb5a79_u32, 0x7706_u16, 0x11d1_u16, StaticArray[0xad_u8, 0xba_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xad_u8, 0xc0_u8])
  struct IInterfaceRelated
    lpVtbl : IInterfaceRelatedVTbl*
  end


  # Params # iidintercepted : Guid* [In],punkouter : IUnknown [In],iid : Guid* [In],ppv : Void** [In]
  fun CoGetInterceptor(iidintercepted : Guid*, punkouter : IUnknown, iid : Guid*, ppv : Void**) : HRESULT

  # Params # iidintercepted : Guid* [In],punkouter : IUnknown [In],typeinfo : ITypeInfo [In],iid : Guid* [In],ppv : Void** [In]
  fun CoGetInterceptorFromTypeInfo(iidintercepted : Guid*, punkouter : IUnknown, typeinfo : ITypeInfo, iid : Guid*, ppv : Void**) : HRESULT
end
struct LibWin32::ICallFrame
  def query_interface(this : ICallFrame*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallFrame*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallFrame*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_info(this : ICallFrame*, pinfo : CALLFRAMEINFO*) : HRESULT
    @lpVtbl.value.get_info.call(this, pinfo)
  end
  def get_iid_and_method(this : ICallFrame*, piid : Guid*, pimethod : UInt32*) : HRESULT
    @lpVtbl.value.get_iid_and_method.call(this, piid, pimethod)
  end
  def get_names(this : ICallFrame*, pwszinterface : LibC::LPWSTR*, pwszmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_names.call(this, pwszinterface, pwszmethod)
  end
  def get_stack_location(this : ICallFrame*) : Void*
    @lpVtbl.value.get_stack_location.call(this)
  end
  def set_stack_location(this : ICallFrame*, pvstack : Void*) : Void
    @lpVtbl.value.set_stack_location.call(this, pvstack)
  end
  def set_return_value(this : ICallFrame*, hr : HRESULT) : Void
    @lpVtbl.value.set_return_value.call(this, hr)
  end
  def get_return_value(this : ICallFrame*) : HRESULT
    @lpVtbl.value.get_return_value.call(this)
  end
  def get_param_info(this : ICallFrame*, iparam : UInt32, pinfo : CALLFRAMEPARAMINFO*) : HRESULT
    @lpVtbl.value.get_param_info.call(this, iparam, pinfo)
  end
  def set_param(this : ICallFrame*, iparam : UInt32, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.set_param.call(this, iparam, pvar)
  end
  def get_param(this : ICallFrame*, iparam : UInt32, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.get_param.call(this, iparam, pvar)
  end
  def copy(this : ICallFrame*, copycontrol : CALLFRAME_COPY, pwalker : ICallFrameWalker, ppframe : ICallFrame*) : HRESULT
    @lpVtbl.value.copy.call(this, copycontrol, pwalker, ppframe)
  end
  def free(this : ICallFrame*, pframeargsdest : ICallFrame, pwalkerdestfree : ICallFrameWalker, pwalkercopy : ICallFrameWalker, freeflags : UInt32, pwalkerfree : ICallFrameWalker, nullflags : UInt32) : HRESULT
    @lpVtbl.value.free.call(this, pframeargsdest, pwalkerdestfree, pwalkercopy, freeflags, pwalkerfree, nullflags)
  end
  def free_param(this : ICallFrame*, iparam : UInt32, freeflags : UInt32, pwalkerfree : ICallFrameWalker, nullflags : UInt32) : HRESULT
    @lpVtbl.value.free_param.call(this, iparam, freeflags, pwalkerfree, nullflags)
  end
  def walk_frame(this : ICallFrame*, walkwhat : UInt32, pwalker : ICallFrameWalker) : HRESULT
    @lpVtbl.value.walk_frame.call(this, walkwhat, pwalker)
  end
  def get_marshal_size_max(this : ICallFrame*, pmshlcontext : CALLFRAME_MARSHALCONTEXT*, mshlflags : MSHLFLAGS, pcbbufferneeded : UInt32*) : HRESULT
    @lpVtbl.value.get_marshal_size_max.call(this, pmshlcontext, mshlflags, pcbbufferneeded)
  end
  def marshal(this : ICallFrame*, pmshlcontext : CALLFRAME_MARSHALCONTEXT*, mshlflags : MSHLFLAGS, pbuffer : Void*, cbbuffer : UInt32, pcbbufferused : UInt32*, pdatarep : UInt32*, prpcflags : UInt32*) : HRESULT
    @lpVtbl.value.marshal.call(this, pmshlcontext, mshlflags, pbuffer, cbbuffer, pcbbufferused, pdatarep, prpcflags)
  end
  def unmarshal(this : ICallFrame*, pbuffer : Void*, cbbuffer : UInt32, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*, pcbunmarshalled : UInt32*) : HRESULT
    @lpVtbl.value.unmarshal.call(this, pbuffer, cbbuffer, datarep, pcontext, pcbunmarshalled)
  end
  def release_marshal_data(this : ICallFrame*, pbuffer : Void*, cbbuffer : UInt32, ibfirstrelease : UInt32, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*) : HRESULT
    @lpVtbl.value.release_marshal_data.call(this, pbuffer, cbbuffer, ibfirstrelease, datarep, pcontext)
  end
  def invoke(this : ICallFrame*, pvreceiver : Void*) : HRESULT
    @lpVtbl.value.invoke.call(this, pvreceiver)
  end
end
struct LibWin32::ICallIndirect
  def query_interface(this : ICallIndirect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallIndirect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallIndirect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def call_indirect(this : ICallIndirect*, phrreturn : HRESULT*, imethod : UInt32, pvargs : Void*, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.call_indirect.call(this, phrreturn, imethod, pvargs, cbargs)
  end
  def get_method_info(this : ICallIndirect*, imethod : UInt32, pinfo : CALLFRAMEINFO*, pwszmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_method_info.call(this, imethod, pinfo, pwszmethod)
  end
  def get_stack_size(this : ICallIndirect*, imethod : UInt32, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.get_stack_size.call(this, imethod, cbargs)
  end
  def get_iid(this : ICallIndirect*, piid : Guid*, pfderivesfromidispatch : LibC::BOOL*, pcmethod : UInt32*, pwszinterface : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_iid.call(this, piid, pfderivesfromidispatch, pcmethod, pwszinterface)
  end
end
struct LibWin32::ICallInterceptor
  def query_interface(this : ICallInterceptor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallInterceptor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallInterceptor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def call_indirect(this : ICallInterceptor*, phrreturn : HRESULT*, imethod : UInt32, pvargs : Void*, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.call_indirect.call(this, phrreturn, imethod, pvargs, cbargs)
  end
  def get_method_info(this : ICallInterceptor*, imethod : UInt32, pinfo : CALLFRAMEINFO*, pwszmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_method_info.call(this, imethod, pinfo, pwszmethod)
  end
  def get_stack_size(this : ICallInterceptor*, imethod : UInt32, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.get_stack_size.call(this, imethod, cbargs)
  end
  def get_iid(this : ICallInterceptor*, piid : Guid*, pfderivesfromidispatch : LibC::BOOL*, pcmethod : UInt32*, pwszinterface : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_iid.call(this, piid, pfderivesfromidispatch, pcmethod, pwszinterface)
  end
  def register_sink(this : ICallInterceptor*, psink : ICallFrameEvents) : HRESULT
    @lpVtbl.value.register_sink.call(this, psink)
  end
  def get_registered_sink(this : ICallInterceptor*, ppsink : ICallFrameEvents*) : HRESULT
    @lpVtbl.value.get_registered_sink.call(this, ppsink)
  end
end
struct LibWin32::ICallFrameEvents
  def query_interface(this : ICallFrameEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallFrameEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallFrameEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_call(this : ICallFrameEvents*, pframe : ICallFrame) : HRESULT
    @lpVtbl.value.on_call.call(this, pframe)
  end
end
struct LibWin32::ICallUnmarshal
  def query_interface(this : ICallUnmarshal*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallUnmarshal*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallUnmarshal*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def unmarshal(this : ICallUnmarshal*, imethod : UInt32, pbuffer : Void*, cbbuffer : UInt32, fforcebuffercopy : LibC::BOOL, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*, pcbunmarshalled : UInt32*, ppframe : ICallFrame*) : HRESULT
    @lpVtbl.value.unmarshal.call(this, imethod, pbuffer, cbbuffer, fforcebuffercopy, datarep, pcontext, pcbunmarshalled, ppframe)
  end
  def release_marshal_data(this : ICallUnmarshal*, imethod : UInt32, pbuffer : Void*, cbbuffer : UInt32, ibfirstrelease : UInt32, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*) : HRESULT
    @lpVtbl.value.release_marshal_data.call(this, imethod, pbuffer, cbbuffer, ibfirstrelease, datarep, pcontext)
  end
end
struct LibWin32::ICallFrameWalker
  def query_interface(this : ICallFrameWalker*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICallFrameWalker*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICallFrameWalker*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_walk_interface(this : ICallFrameWalker*, iid : Guid*, ppvinterface : Void**, fin : LibC::BOOL, fout : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_walk_interface.call(this, iid, ppvinterface, fin, fout)
  end
end
struct LibWin32::IInterfaceRelated
  def query_interface(this : IInterfaceRelated*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInterfaceRelated*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInterfaceRelated*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_iid(this : IInterfaceRelated*, iid : Guid*) : HRESULT
    @lpVtbl.value.set_iid.call(this, iid)
  end
  def get_iid(this : IInterfaceRelated*, piid : Guid*) : HRESULT
    @lpVtbl.value.get_iid.call(this, piid)
  end
end
