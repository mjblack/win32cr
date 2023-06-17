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