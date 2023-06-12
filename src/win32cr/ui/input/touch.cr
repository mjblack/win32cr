require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("user32")]
{% end %}
lib LibWin32
  alias HGESTUREINFO = LibC::IntPtrT
  alias HTOUCHINPUT = LibC::IntPtrT

  InertiaProcessor = LibC::GUID.new(0xabb27087_u32, 0x4ce0_u16, 0x4e58_u16, StaticArray[0xa0_u8, 0xcb_u8, 0xe2_u8, 0x4d_u8, 0xf9_u8, 0x68_u8, 0x14_u8, 0xbe_u8])
  ManipulationProcessor = LibC::GUID.new(0x597d4fb0_u32, 0x47fd_u16, 0x4aff_u16, StaticArray[0x89_u8, 0xb9_u8, 0xc6_u8, 0xcf_u8, 0xae_u8, 0x8c_u8, 0xf0_u8, 0x8e_u8])


  enum GESTURECONFIG_ID : UInt32
    GID_BEGIN = 1
    GID_END = 2
    GID_ZOOM = 3
    GID_PAN = 4
    GID_ROTATE = 5
    GID_TWOFINGERTAP = 6
    GID_PRESSANDTAP = 7
    GID_ROLLOVER = 7
  end

  enum TOUCHEVENTF_FLAGS : UInt32
    TOUCHEVENTF_MOVE = 1
    TOUCHEVENTF_DOWN = 2
    TOUCHEVENTF_UP = 4
    TOUCHEVENTF_INRANGE = 8
    TOUCHEVENTF_PRIMARY = 16
    TOUCHEVENTF_NOCOALESCE = 32
    TOUCHEVENTF_PEN = 64
    TOUCHEVENTF_PALM = 128
  end

  enum TOUCHINPUTMASKF_MASK : UInt32
    TOUCHINPUTMASKF_TIMEFROMSYSTEM = 1
    TOUCHINPUTMASKF_EXTRAINFO = 2
    TOUCHINPUTMASKF_CONTACTAREA = 4
  end

  enum REGISTER_TOUCH_WINDOW_FLAGS : UInt32
    TWF_FINETOUCH = 1
    TWF_WANTPALM = 2
  end

  enum MANIPULATION_PROCESSOR_MANIPULATIONS : Int32
    MANIPULATION_NONE = 0
    MANIPULATION_TRANSLATE_X = 1
    MANIPULATION_TRANSLATE_Y = 2
    MANIPULATION_SCALE = 4
    MANIPULATION_ROTATE = 8
    MANIPULATION_ALL = 15
  end

  struct TOUCHINPUT
    x : Int32
    y : Int32
    h_source : LibC::HANDLE
    dw_id : UInt32
    dw_flags : TOUCHEVENTF_FLAGS
    dw_mask : TOUCHINPUTMASKF_MASK
    dw_time : UInt32
    dw_extra_info : LibC::UINT_PTR
    cx_contact : UInt32
    cy_contact : UInt32
  end
  struct GESTUREINFO
    cb_size : UInt32
    dw_flags : UInt32
    dw_id : UInt32
    hwnd_target : HANDLE
    pts_location : POINTS
    dw_instance_id : UInt32
    dw_sequence_id : UInt32
    ull_arguments : UInt64
    cb_extra_args : UInt32
  end
  struct GESTURENOTIFYSTRUCT
    cb_size : UInt32
    dw_flags : UInt32
    hwnd_target : HANDLE
    pts_location : POINTS
    dw_instance_id : UInt32
  end
  struct GESTURECONFIG
    dw_id : GESTURECONFIG_ID
    dw_want : UInt32
    dw_block : UInt32
  end


  struct IIManipulationEventsVTbl
    query_interface : Proc(IIManipulationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIManipulationEvents*, UInt32)
    release : Proc(IIManipulationEvents*, UInt32)
    manipulation_started : Proc(IIManipulationEvents*, Float32, Float32, HRESULT)
    manipulation_delta : Proc(IIManipulationEvents*, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, HRESULT)
    manipulation_completed : Proc(IIManipulationEvents*, Float32, Float32, Float32, Float32, Float32, Float32, Float32, HRESULT)
  end

  IIManipulationEvents_GUID = LibC::GUID.new("4f62c8da-9c53-4b22-93df-927a862bbb03")
  CLSID_IIManipulationEvents = "4f62c8da-9c53-4b22-93df-927a862bbb03"
  struct IIManipulationEvents
    lpVtbl : IIManipulationEventsVTbl*
  end

  struct IInertiaProcessorVTbl
    query_interface : Proc(IInertiaProcessor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInertiaProcessor*, UInt32)
    release : Proc(IInertiaProcessor*, UInt32)
    get_initial_origin_x : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_origin_x : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_origin_y : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_origin_y : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_velocity_x : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_velocity_x : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_velocity_y : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_velocity_y : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_angular_velocity : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_angular_velocity : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_expansion_velocity : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_expansion_velocity : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_radius : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_initial_radius : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_boundary_left : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_boundary_left : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_boundary_top : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_boundary_top : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_boundary_right : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_boundary_right : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_boundary_bottom : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_boundary_bottom : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_elastic_margin_left : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_elastic_margin_left : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_elastic_margin_top : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_elastic_margin_top : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_elastic_margin_right : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_elastic_margin_right : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_elastic_margin_bottom : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_elastic_margin_bottom : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_desired_displacement : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_desired_displacement : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_desired_rotation : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_desired_rotation : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_desired_expansion : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_desired_expansion : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_desired_deceleration : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_desired_deceleration : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_desired_angular_deceleration : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_desired_angular_deceleration : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_desired_expansion_deceleration : Proc(IInertiaProcessor*, Float32*, HRESULT)
    put_desired_expansion_deceleration : Proc(IInertiaProcessor*, Float32, HRESULT)
    get_initial_timestamp : Proc(IInertiaProcessor*, UInt32*, HRESULT)
    put_initial_timestamp : Proc(IInertiaProcessor*, UInt32, HRESULT)
    reset : Proc(IInertiaProcessor*, HRESULT)
    process : Proc(IInertiaProcessor*, LibC::BOOL*, HRESULT)
    process_time : Proc(IInertiaProcessor*, UInt32, LibC::BOOL*, HRESULT)
    complete : Proc(IInertiaProcessor*, HRESULT)
    complete_time : Proc(IInertiaProcessor*, UInt32, HRESULT)
  end

  IInertiaProcessor_GUID = LibC::GUID.new("18b00c6d-c5ee-41b1-90a9-9d4a929095ad")
  CLSID_IInertiaProcessor = "18b00c6d-c5ee-41b1-90a9-9d4a929095ad"
  struct IInertiaProcessor
    lpVtbl : IInertiaProcessorVTbl*
  end

  struct IManipulationProcessorVTbl
    query_interface : Proc(IManipulationProcessor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManipulationProcessor*, UInt32)
    release : Proc(IManipulationProcessor*, UInt32)
    get_supported_manipulations : Proc(IManipulationProcessor*, MANIPULATION_PROCESSOR_MANIPULATIONS*, HRESULT)
    put_supported_manipulations : Proc(IManipulationProcessor*, MANIPULATION_PROCESSOR_MANIPULATIONS, HRESULT)
    get_pivot_point_x : Proc(IManipulationProcessor*, Float32*, HRESULT)
    put_pivot_point_x : Proc(IManipulationProcessor*, Float32, HRESULT)
    get_pivot_point_y : Proc(IManipulationProcessor*, Float32*, HRESULT)
    put_pivot_point_y : Proc(IManipulationProcessor*, Float32, HRESULT)
    get_pivot_radius : Proc(IManipulationProcessor*, Float32*, HRESULT)
    put_pivot_radius : Proc(IManipulationProcessor*, Float32, HRESULT)
    complete_manipulation : Proc(IManipulationProcessor*, HRESULT)
    process_down : Proc(IManipulationProcessor*, UInt32, Float32, Float32, HRESULT)
    process_move : Proc(IManipulationProcessor*, UInt32, Float32, Float32, HRESULT)
    process_up : Proc(IManipulationProcessor*, UInt32, Float32, Float32, HRESULT)
    process_down_with_time : Proc(IManipulationProcessor*, UInt32, Float32, Float32, UInt32, HRESULT)
    process_move_with_time : Proc(IManipulationProcessor*, UInt32, Float32, Float32, UInt32, HRESULT)
    process_up_with_time : Proc(IManipulationProcessor*, UInt32, Float32, Float32, UInt32, HRESULT)
    get_velocity_x : Proc(IManipulationProcessor*, Float32*, HRESULT)
    get_velocity_y : Proc(IManipulationProcessor*, Float32*, HRESULT)
    get_expansion_velocity : Proc(IManipulationProcessor*, Float32*, HRESULT)
    get_angular_velocity : Proc(IManipulationProcessor*, Float32*, HRESULT)
    get_minimum_scale_rotate_radius : Proc(IManipulationProcessor*, Float32*, HRESULT)
    put_minimum_scale_rotate_radius : Proc(IManipulationProcessor*, Float32, HRESULT)
  end

  IManipulationProcessor_GUID = LibC::GUID.new("a22ac519-8300-48a0-bef4-f1be8737dba4")
  CLSID_IManipulationProcessor = "a22ac519-8300-48a0-bef4-f1be8737dba4"
  struct IManipulationProcessor
    lpVtbl : IManipulationProcessorVTbl*
  end


  # Params # htouchinput : HTOUCHINPUT [In],cinputs : UInt32 [In],pinputs : TOUCHINPUT* [In],cbsize : Int32 [In]
  fun GetTouchInputInfo(htouchinput : HTOUCHINPUT, cinputs : UInt32, pinputs : TOUCHINPUT*, cbsize : Int32) : LibC::BOOL

  # Params # htouchinput : HTOUCHINPUT [In]
  fun CloseTouchInputHandle(htouchinput : HTOUCHINPUT) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],ulflags : REGISTER_TOUCH_WINDOW_FLAGS [In]
  fun RegisterTouchWindow(hwnd : LibC::HANDLE, ulflags : REGISTER_TOUCH_WINDOW_FLAGS) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In]
  fun UnregisterTouchWindow(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pulflags : UInt32* [In]
  fun IsTouchWindow(hwnd : LibC::HANDLE, pulflags : UInt32*) : LibC::BOOL

  # Params # hgestureinfo : HGESTUREINFO [In],pgestureinfo : GESTUREINFO* [In]
  fun GetGestureInfo(hgestureinfo : HGESTUREINFO, pgestureinfo : GESTUREINFO*) : LibC::BOOL

  # Params # hgestureinfo : HGESTUREINFO [In],cbextraargs : UInt32 [In],pextraargs : UInt8* [In]
  fun GetGestureExtraArgs(hgestureinfo : HGESTUREINFO, cbextraargs : UInt32, pextraargs : UInt8*) : LibC::BOOL

  # Params # hgestureinfo : HGESTUREINFO [In]
  fun CloseGestureInfoHandle(hgestureinfo : HGESTUREINFO) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],dwreserved : UInt32 [In],cids : UInt32 [In],pgestureconfig : GESTURECONFIG* [In],cbsize : UInt32 [In]
  fun SetGestureConfig(hwnd : LibC::HANDLE, dwreserved : UInt32, cids : UInt32, pgestureconfig : GESTURECONFIG*, cbsize : UInt32) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],dwreserved : UInt32 [In],dwflags : UInt32 [In],pcids : UInt32* [In],pgestureconfig : GESTURECONFIG* [In],cbsize : UInt32 [In]
  fun GetGestureConfig(hwnd : LibC::HANDLE, dwreserved : UInt32, dwflags : UInt32, pcids : UInt32*, pgestureconfig : GESTURECONFIG*, cbsize : UInt32) : LibC::BOOL
end
