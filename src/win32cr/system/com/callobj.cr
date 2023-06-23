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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_info : UInt64
    get_iid_and_method : UInt64
    get_names : UInt64
    get_stack_location : UInt64
    set_stack_location : UInt64
    set_return_value : UInt64
    get_return_value : UInt64
    get_param_info : UInt64
    set_param : UInt64
    get_param : UInt64
    copy : UInt64
    free : UInt64
    free_param : UInt64
    walk_frame : UInt64
    get_marshal_size_max : UInt64
    marshal : UInt64
    unmarshal : UInt64
    release_marshal_data : UInt64
    invoke : UInt64
  end

  ICallFrame_GUID = "d573b4b0-894e-11d2-b8b6-00c04fb9618a"
  IID_ICallFrame = LibC::GUID.new(0xd573b4b0_u32, 0x894e_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallFrame
    lpVtbl : ICallFrameVTbl*
  end

  struct ICallIndirectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    call_indirect : UInt64
    get_method_info : UInt64
    get_stack_size : UInt64
    get_iid : UInt64
  end

  ICallIndirect_GUID = "d573b4b1-894e-11d2-b8b6-00c04fb9618a"
  IID_ICallIndirect = LibC::GUID.new(0xd573b4b1_u32, 0x894e_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallIndirect
    lpVtbl : ICallIndirectVTbl*
  end

  struct ICallInterceptorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    call_indirect : UInt64
    get_method_info : UInt64
    get_stack_size : UInt64
    get_iid : UInt64
    register_sink : UInt64
    get_registered_sink : UInt64
  end

  ICallInterceptor_GUID = "60c7ca75-896d-11d2-b8b6-00c04fb9618a"
  IID_ICallInterceptor = LibC::GUID.new(0x60c7ca75_u32, 0x896d_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xb6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallInterceptor
    lpVtbl : ICallInterceptorVTbl*
  end

  struct ICallFrameEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_call : UInt64
  end

  ICallFrameEvents_GUID = "fd5e0843-fc91-11d0-97d7-00c04fb9618a"
  IID_ICallFrameEvents = LibC::GUID.new(0xfd5e0843_u32, 0xfc91_u16, 0x11d0_u16, StaticArray[0x97_u8, 0xd7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallFrameEvents
    lpVtbl : ICallFrameEventsVTbl*
  end

  struct ICallUnmarshalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    unmarshal : UInt64
    release_marshal_data : UInt64
  end

  ICallUnmarshal_GUID = "5333b003-2e42-11d2-b89d-00c04fb9618a"
  IID_ICallUnmarshal = LibC::GUID.new(0x5333b003_u32, 0x2e42_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0x9d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallUnmarshal
    lpVtbl : ICallUnmarshalVTbl*
  end

  struct ICallFrameWalkerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_walk_interface : UInt64
  end

  ICallFrameWalker_GUID = "08b23919-392d-11d2-b8a4-00c04fb9618a"
  IID_ICallFrameWalker = LibC::GUID.new(0x8b23919_u32, 0x392d_u16, 0x11d2_u16, StaticArray[0xb8_u8, 0xa4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x61_u8, 0x8a_u8])
  struct ICallFrameWalker
    lpVtbl : ICallFrameWalkerVTbl*
  end

  struct IInterfaceRelatedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_iid : UInt64
    get_iid : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_info(pinfo : CALLFRAMEINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(CALLFRAMEINFO*, HRESULT)).call(pinfo)
  end
  def get_iid_and_method(piid : Guid*, pimethod : UInt32*) : HRESULT
    @lpVtbl.value.get_iid_and_method.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(piid, pimethod)
  end
  def get_names(pwszinterface : LibC::LPWSTR*, pwszmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_names.unsafe_as(Proc(LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)).call(pwszinterface, pwszmethod)
  end
  def get_stack_location : Void*
    @lpVtbl.value.get_stack_location.unsafe_as(Proc(Void**)).call
  end
  def set_stack_location(pvstack : Void*) : Void
    @lpVtbl.value.set_stack_location.unsafe_as(Proc(Void*, Void)).call(pvstack)
  end
  def set_return_value(hr : HRESULT) : Void
    @lpVtbl.value.set_return_value.unsafe_as(Proc(HRESULT, Void)).call(hr)
  end
  def get_return_value : HRESULT
    @lpVtbl.value.get_return_value.unsafe_as(Proc(HRESULT)).call
  end
  def get_param_info(iparam : UInt32, pinfo : CALLFRAMEPARAMINFO*) : HRESULT
    @lpVtbl.value.get_param_info.unsafe_as(Proc(UInt32, CALLFRAMEPARAMINFO*, HRESULT)).call(iparam, pinfo)
  end
  def set_param(iparam : UInt32, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.set_param.unsafe_as(Proc(UInt32, VARIANT*, HRESULT)).call(iparam, pvar)
  end
  def get_param(iparam : UInt32, pvar : VARIANT*) : HRESULT
    @lpVtbl.value.get_param.unsafe_as(Proc(UInt32, VARIANT*, HRESULT)).call(iparam, pvar)
  end
  def copy(copycontrol : CALLFRAME_COPY, pwalker : ICallFrameWalker, ppframe : ICallFrame*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(CALLFRAME_COPY, ICallFrameWalker, ICallFrame*, HRESULT)).call(copycontrol, pwalker, ppframe)
  end
  def free(pframeargsdest : ICallFrame, pwalkerdestfree : ICallFrameWalker, pwalkercopy : ICallFrameWalker, freeflags : UInt32, pwalkerfree : ICallFrameWalker, nullflags : UInt32) : HRESULT
    @lpVtbl.value.free.unsafe_as(Proc(ICallFrame, ICallFrameWalker, ICallFrameWalker, UInt32, ICallFrameWalker, UInt32, HRESULT)).call(pframeargsdest, pwalkerdestfree, pwalkercopy, freeflags, pwalkerfree, nullflags)
  end
  def free_param(iparam : UInt32, freeflags : UInt32, pwalkerfree : ICallFrameWalker, nullflags : UInt32) : HRESULT
    @lpVtbl.value.free_param.unsafe_as(Proc(UInt32, UInt32, ICallFrameWalker, UInt32, HRESULT)).call(iparam, freeflags, pwalkerfree, nullflags)
  end
  def walk_frame(walkwhat : UInt32, pwalker : ICallFrameWalker) : HRESULT
    @lpVtbl.value.walk_frame.unsafe_as(Proc(UInt32, ICallFrameWalker, HRESULT)).call(walkwhat, pwalker)
  end
  def get_marshal_size_max(pmshlcontext : CALLFRAME_MARSHALCONTEXT*, mshlflags : MSHLFLAGS, pcbbufferneeded : UInt32*) : HRESULT
    @lpVtbl.value.get_marshal_size_max.unsafe_as(Proc(CALLFRAME_MARSHALCONTEXT*, MSHLFLAGS, UInt32*, HRESULT)).call(pmshlcontext, mshlflags, pcbbufferneeded)
  end
  def marshal(pmshlcontext : CALLFRAME_MARSHALCONTEXT*, mshlflags : MSHLFLAGS, pbuffer : Void*, cbbuffer : UInt32, pcbbufferused : UInt32*, pdatarep : UInt32*, prpcflags : UInt32*) : HRESULT
    @lpVtbl.value.marshal.unsafe_as(Proc(CALLFRAME_MARSHALCONTEXT*, MSHLFLAGS, Void*, UInt32, UInt32*, UInt32*, UInt32*, HRESULT)).call(pmshlcontext, mshlflags, pbuffer, cbbuffer, pcbbufferused, pdatarep, prpcflags)
  end
  def unmarshal(pbuffer : Void*, cbbuffer : UInt32, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*, pcbunmarshalled : UInt32*) : HRESULT
    @lpVtbl.value.unmarshal.unsafe_as(Proc(Void*, UInt32, UInt32, CALLFRAME_MARSHALCONTEXT*, UInt32*, HRESULT)).call(pbuffer, cbbuffer, datarep, pcontext, pcbunmarshalled)
  end
  def release_marshal_data(pbuffer : Void*, cbbuffer : UInt32, ibfirstrelease : UInt32, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*) : HRESULT
    @lpVtbl.value.release_marshal_data.unsafe_as(Proc(Void*, UInt32, UInt32, UInt32, CALLFRAME_MARSHALCONTEXT*, HRESULT)).call(pbuffer, cbbuffer, ibfirstrelease, datarep, pcontext)
  end
  def invoke(pvreceiver : Void*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Void*, HRESULT)).call(pvreceiver)
  end
end
struct LibWin32::ICallIndirect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def call_indirect(phrreturn : HRESULT*, imethod : UInt32, pvargs : Void*, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.call_indirect.unsafe_as(Proc(HRESULT*, UInt32, Void*, UInt32*, HRESULT)).call(phrreturn, imethod, pvargs, cbargs)
  end
  def get_method_info(imethod : UInt32, pinfo : CALLFRAMEINFO*, pwszmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_method_info.unsafe_as(Proc(UInt32, CALLFRAMEINFO*, LibC::LPWSTR*, HRESULT)).call(imethod, pinfo, pwszmethod)
  end
  def get_stack_size(imethod : UInt32, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.get_stack_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(imethod, cbargs)
  end
  def get_iid(piid : Guid*, pfderivesfromidispatch : LibC::BOOL*, pcmethod : UInt32*, pwszinterface : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_iid.unsafe_as(Proc(Guid*, LibC::BOOL*, UInt32*, LibC::LPWSTR*, HRESULT)).call(piid, pfderivesfromidispatch, pcmethod, pwszinterface)
  end
end
struct LibWin32::ICallInterceptor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def call_indirect(phrreturn : HRESULT*, imethod : UInt32, pvargs : Void*, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.call_indirect.unsafe_as(Proc(HRESULT*, UInt32, Void*, UInt32*, HRESULT)).call(phrreturn, imethod, pvargs, cbargs)
  end
  def get_method_info(imethod : UInt32, pinfo : CALLFRAMEINFO*, pwszmethod : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_method_info.unsafe_as(Proc(UInt32, CALLFRAMEINFO*, LibC::LPWSTR*, HRESULT)).call(imethod, pinfo, pwszmethod)
  end
  def get_stack_size(imethod : UInt32, cbargs : UInt32*) : HRESULT
    @lpVtbl.value.get_stack_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(imethod, cbargs)
  end
  def get_iid(piid : Guid*, pfderivesfromidispatch : LibC::BOOL*, pcmethod : UInt32*, pwszinterface : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_iid.unsafe_as(Proc(Guid*, LibC::BOOL*, UInt32*, LibC::LPWSTR*, HRESULT)).call(piid, pfderivesfromidispatch, pcmethod, pwszinterface)
  end
  def register_sink(psink : ICallFrameEvents) : HRESULT
    @lpVtbl.value.register_sink.unsafe_as(Proc(ICallFrameEvents, HRESULT)).call(psink)
  end
  def get_registered_sink(ppsink : ICallFrameEvents*) : HRESULT
    @lpVtbl.value.get_registered_sink.unsafe_as(Proc(ICallFrameEvents*, HRESULT)).call(ppsink)
  end
end
struct LibWin32::ICallFrameEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_call(pframe : ICallFrame) : HRESULT
    @lpVtbl.value.on_call.unsafe_as(Proc(ICallFrame, HRESULT)).call(pframe)
  end
end
struct LibWin32::ICallUnmarshal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def unmarshal(imethod : UInt32, pbuffer : Void*, cbbuffer : UInt32, fforcebuffercopy : LibC::BOOL, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*, pcbunmarshalled : UInt32*, ppframe : ICallFrame*) : HRESULT
    @lpVtbl.value.unmarshal.unsafe_as(Proc(UInt32, Void*, UInt32, LibC::BOOL, UInt32, CALLFRAME_MARSHALCONTEXT*, UInt32*, ICallFrame*, HRESULT)).call(imethod, pbuffer, cbbuffer, fforcebuffercopy, datarep, pcontext, pcbunmarshalled, ppframe)
  end
  def release_marshal_data(imethod : UInt32, pbuffer : Void*, cbbuffer : UInt32, ibfirstrelease : UInt32, datarep : UInt32, pcontext : CALLFRAME_MARSHALCONTEXT*) : HRESULT
    @lpVtbl.value.release_marshal_data.unsafe_as(Proc(UInt32, Void*, UInt32, UInt32, UInt32, CALLFRAME_MARSHALCONTEXT*, HRESULT)).call(imethod, pbuffer, cbbuffer, ibfirstrelease, datarep, pcontext)
  end
end
struct LibWin32::ICallFrameWalker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_walk_interface(iid : Guid*, ppvinterface : Void**, fin : LibC::BOOL, fout : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_walk_interface.unsafe_as(Proc(Guid*, Void**, LibC::BOOL, LibC::BOOL, HRESULT)).call(iid, ppvinterface, fin, fout)
  end
end
struct LibWin32::IInterfaceRelated
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_iid(iid : Guid*) : HRESULT
    @lpVtbl.value.set_iid.unsafe_as(Proc(Guid*, HRESULT)).call(iid)
  end
  def get_iid(piid : Guid*) : HRESULT
    @lpVtbl.value.get_iid.unsafe_as(Proc(Guid*, HRESULT)).call(piid)
  end
end
