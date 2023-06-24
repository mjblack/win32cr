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

  CLSID_InertiaProcessor = LibC::GUID.new(0xabb27087_u32, 0x4ce0_u16, 0x4e58_u16, StaticArray[0xa0_u8, 0xcb_u8, 0xe2_u8, 0x4d_u8, 0xf9_u8, 0x68_u8, 0x14_u8, 0xbe_u8])
  CLSID_ManipulationProcessor = LibC::GUID.new(0x597d4fb0_u32, 0x47fd_u16, 0x4aff_u16, StaticArray[0x89_u8, 0xb9_u8, 0xc6_u8, 0xcf_u8, 0xae_u8, 0x8c_u8, 0xf0_u8, 0x8e_u8])


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

  IIManipulationEvents_GUID = "4f62c8da-9c53-4b22-93df-927a862bbb03"
  IID_IIManipulationEvents = LibC::GUID.new(0x4f62c8da_u32, 0x9c53_u16, 0x4b22_u16, StaticArray[0x93_u8, 0xdf_u8, 0x92_u8, 0x7a_u8, 0x86_u8, 0x2b_u8, 0xbb_u8, 0x3_u8])
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

  IInertiaProcessor_GUID = "18b00c6d-c5ee-41b1-90a9-9d4a929095ad"
  IID_IInertiaProcessor = LibC::GUID.new(0x18b00c6d_u32, 0xc5ee_u16, 0x41b1_u16, StaticArray[0x90_u8, 0xa9_u8, 0x9d_u8, 0x4a_u8, 0x92_u8, 0x90_u8, 0x95_u8, 0xad_u8])
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

  IManipulationProcessor_GUID = "a22ac519-8300-48a0-bef4-f1be8737dba4"
  IID_IManipulationProcessor = LibC::GUID.new(0xa22ac519_u32, 0x8300_u16, 0x48a0_u16, StaticArray[0xbe_u8, 0xf4_u8, 0xf1_u8, 0xbe_u8, 0x87_u8, 0x37_u8, 0xdb_u8, 0xa4_u8])
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
struct LibWin32::IIManipulationEvents
  def query_interface(this : IIManipulationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIManipulationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIManipulationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def manipulation_started(this : IIManipulationEvents*, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.manipulation_started.call(this, x, y)
  end
  def manipulation_delta(this : IIManipulationEvents*, x : Float32, y : Float32, translationdeltax : Float32, translationdeltay : Float32, scaledelta : Float32, expansiondelta : Float32, rotationdelta : Float32, cumulativetranslationx : Float32, cumulativetranslationy : Float32, cumulativescale : Float32, cumulativeexpansion : Float32, cumulativerotation : Float32) : HRESULT
    @lpVtbl.value.manipulation_delta.call(this, x, y, translationdeltax, translationdeltay, scaledelta, expansiondelta, rotationdelta, cumulativetranslationx, cumulativetranslationy, cumulativescale, cumulativeexpansion, cumulativerotation)
  end
  def manipulation_completed(this : IIManipulationEvents*, x : Float32, y : Float32, cumulativetranslationx : Float32, cumulativetranslationy : Float32, cumulativescale : Float32, cumulativeexpansion : Float32, cumulativerotation : Float32) : HRESULT
    @lpVtbl.value.manipulation_completed.call(this, x, y, cumulativetranslationx, cumulativetranslationy, cumulativescale, cumulativeexpansion, cumulativerotation)
  end
end
struct LibWin32::IInertiaProcessor
  def query_interface(this : IInertiaProcessor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInertiaProcessor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInertiaProcessor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_initial_origin_x(this : IInertiaProcessor*, x : Float32*) : HRESULT
    @lpVtbl.value.get_initial_origin_x.call(this, x)
  end
  def put_initial_origin_x(this : IInertiaProcessor*, x : Float32) : HRESULT
    @lpVtbl.value.put_initial_origin_x.call(this, x)
  end
  def get_initial_origin_y(this : IInertiaProcessor*, y : Float32*) : HRESULT
    @lpVtbl.value.get_initial_origin_y.call(this, y)
  end
  def put_initial_origin_y(this : IInertiaProcessor*, y : Float32) : HRESULT
    @lpVtbl.value.put_initial_origin_y.call(this, y)
  end
  def get_initial_velocity_x(this : IInertiaProcessor*, x : Float32*) : HRESULT
    @lpVtbl.value.get_initial_velocity_x.call(this, x)
  end
  def put_initial_velocity_x(this : IInertiaProcessor*, x : Float32) : HRESULT
    @lpVtbl.value.put_initial_velocity_x.call(this, x)
  end
  def get_initial_velocity_y(this : IInertiaProcessor*, y : Float32*) : HRESULT
    @lpVtbl.value.get_initial_velocity_y.call(this, y)
  end
  def put_initial_velocity_y(this : IInertiaProcessor*, y : Float32) : HRESULT
    @lpVtbl.value.put_initial_velocity_y.call(this, y)
  end
  def get_initial_angular_velocity(this : IInertiaProcessor*, velocity : Float32*) : HRESULT
    @lpVtbl.value.get_initial_angular_velocity.call(this, velocity)
  end
  def put_initial_angular_velocity(this : IInertiaProcessor*, velocity : Float32) : HRESULT
    @lpVtbl.value.put_initial_angular_velocity.call(this, velocity)
  end
  def get_initial_expansion_velocity(this : IInertiaProcessor*, velocity : Float32*) : HRESULT
    @lpVtbl.value.get_initial_expansion_velocity.call(this, velocity)
  end
  def put_initial_expansion_velocity(this : IInertiaProcessor*, velocity : Float32) : HRESULT
    @lpVtbl.value.put_initial_expansion_velocity.call(this, velocity)
  end
  def get_initial_radius(this : IInertiaProcessor*, radius : Float32*) : HRESULT
    @lpVtbl.value.get_initial_radius.call(this, radius)
  end
  def put_initial_radius(this : IInertiaProcessor*, radius : Float32) : HRESULT
    @lpVtbl.value.put_initial_radius.call(this, radius)
  end
  def get_boundary_left(this : IInertiaProcessor*, left : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_left.call(this, left)
  end
  def put_boundary_left(this : IInertiaProcessor*, left : Float32) : HRESULT
    @lpVtbl.value.put_boundary_left.call(this, left)
  end
  def get_boundary_top(this : IInertiaProcessor*, top : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_top.call(this, top)
  end
  def put_boundary_top(this : IInertiaProcessor*, top : Float32) : HRESULT
    @lpVtbl.value.put_boundary_top.call(this, top)
  end
  def get_boundary_right(this : IInertiaProcessor*, right : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_right.call(this, right)
  end
  def put_boundary_right(this : IInertiaProcessor*, right : Float32) : HRESULT
    @lpVtbl.value.put_boundary_right.call(this, right)
  end
  def get_boundary_bottom(this : IInertiaProcessor*, bottom : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_bottom.call(this, bottom)
  end
  def put_boundary_bottom(this : IInertiaProcessor*, bottom : Float32) : HRESULT
    @lpVtbl.value.put_boundary_bottom.call(this, bottom)
  end
  def get_elastic_margin_left(this : IInertiaProcessor*, left : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_left.call(this, left)
  end
  def put_elastic_margin_left(this : IInertiaProcessor*, left : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_left.call(this, left)
  end
  def get_elastic_margin_top(this : IInertiaProcessor*, top : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_top.call(this, top)
  end
  def put_elastic_margin_top(this : IInertiaProcessor*, top : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_top.call(this, top)
  end
  def get_elastic_margin_right(this : IInertiaProcessor*, right : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_right.call(this, right)
  end
  def put_elastic_margin_right(this : IInertiaProcessor*, right : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_right.call(this, right)
  end
  def get_elastic_margin_bottom(this : IInertiaProcessor*, bottom : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_bottom.call(this, bottom)
  end
  def put_elastic_margin_bottom(this : IInertiaProcessor*, bottom : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_bottom.call(this, bottom)
  end
  def get_desired_displacement(this : IInertiaProcessor*, displacement : Float32*) : HRESULT
    @lpVtbl.value.get_desired_displacement.call(this, displacement)
  end
  def put_desired_displacement(this : IInertiaProcessor*, displacement : Float32) : HRESULT
    @lpVtbl.value.put_desired_displacement.call(this, displacement)
  end
  def get_desired_rotation(this : IInertiaProcessor*, rotation : Float32*) : HRESULT
    @lpVtbl.value.get_desired_rotation.call(this, rotation)
  end
  def put_desired_rotation(this : IInertiaProcessor*, rotation : Float32) : HRESULT
    @lpVtbl.value.put_desired_rotation.call(this, rotation)
  end
  def get_desired_expansion(this : IInertiaProcessor*, expansion : Float32*) : HRESULT
    @lpVtbl.value.get_desired_expansion.call(this, expansion)
  end
  def put_desired_expansion(this : IInertiaProcessor*, expansion : Float32) : HRESULT
    @lpVtbl.value.put_desired_expansion.call(this, expansion)
  end
  def get_desired_deceleration(this : IInertiaProcessor*, deceleration : Float32*) : HRESULT
    @lpVtbl.value.get_desired_deceleration.call(this, deceleration)
  end
  def put_desired_deceleration(this : IInertiaProcessor*, deceleration : Float32) : HRESULT
    @lpVtbl.value.put_desired_deceleration.call(this, deceleration)
  end
  def get_desired_angular_deceleration(this : IInertiaProcessor*, deceleration : Float32*) : HRESULT
    @lpVtbl.value.get_desired_angular_deceleration.call(this, deceleration)
  end
  def put_desired_angular_deceleration(this : IInertiaProcessor*, deceleration : Float32) : HRESULT
    @lpVtbl.value.put_desired_angular_deceleration.call(this, deceleration)
  end
  def get_desired_expansion_deceleration(this : IInertiaProcessor*, deceleration : Float32*) : HRESULT
    @lpVtbl.value.get_desired_expansion_deceleration.call(this, deceleration)
  end
  def put_desired_expansion_deceleration(this : IInertiaProcessor*, deceleration : Float32) : HRESULT
    @lpVtbl.value.put_desired_expansion_deceleration.call(this, deceleration)
  end
  def get_initial_timestamp(this : IInertiaProcessor*, timestamp : UInt32*) : HRESULT
    @lpVtbl.value.get_initial_timestamp.call(this, timestamp)
  end
  def put_initial_timestamp(this : IInertiaProcessor*, timestamp : UInt32) : HRESULT
    @lpVtbl.value.put_initial_timestamp.call(this, timestamp)
  end
  def reset(this : IInertiaProcessor*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def process(this : IInertiaProcessor*, completed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process.call(this, completed)
  end
  def process_time(this : IInertiaProcessor*, timestamp : UInt32, completed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process_time.call(this, timestamp, completed)
  end
  def complete(this : IInertiaProcessor*) : HRESULT
    @lpVtbl.value.complete.call(this)
  end
  def complete_time(this : IInertiaProcessor*, timestamp : UInt32) : HRESULT
    @lpVtbl.value.complete_time.call(this, timestamp)
  end
end
struct LibWin32::IManipulationProcessor
  def query_interface(this : IManipulationProcessor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IManipulationProcessor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IManipulationProcessor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_supported_manipulations(this : IManipulationProcessor*, manipulations : MANIPULATION_PROCESSOR_MANIPULATIONS*) : HRESULT
    @lpVtbl.value.get_supported_manipulations.call(this, manipulations)
  end
  def put_supported_manipulations(this : IManipulationProcessor*, manipulations : MANIPULATION_PROCESSOR_MANIPULATIONS) : HRESULT
    @lpVtbl.value.put_supported_manipulations.call(this, manipulations)
  end
  def get_pivot_point_x(this : IManipulationProcessor*, pivotpointx : Float32*) : HRESULT
    @lpVtbl.value.get_pivot_point_x.call(this, pivotpointx)
  end
  def put_pivot_point_x(this : IManipulationProcessor*, pivotpointx : Float32) : HRESULT
    @lpVtbl.value.put_pivot_point_x.call(this, pivotpointx)
  end
  def get_pivot_point_y(this : IManipulationProcessor*, pivotpointy : Float32*) : HRESULT
    @lpVtbl.value.get_pivot_point_y.call(this, pivotpointy)
  end
  def put_pivot_point_y(this : IManipulationProcessor*, pivotpointy : Float32) : HRESULT
    @lpVtbl.value.put_pivot_point_y.call(this, pivotpointy)
  end
  def get_pivot_radius(this : IManipulationProcessor*, pivotradius : Float32*) : HRESULT
    @lpVtbl.value.get_pivot_radius.call(this, pivotradius)
  end
  def put_pivot_radius(this : IManipulationProcessor*, pivotradius : Float32) : HRESULT
    @lpVtbl.value.put_pivot_radius.call(this, pivotradius)
  end
  def complete_manipulation(this : IManipulationProcessor*) : HRESULT
    @lpVtbl.value.complete_manipulation.call(this)
  end
  def process_down(this : IManipulationProcessor*, manipulatorid : UInt32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.process_down.call(this, manipulatorid, x, y)
  end
  def process_move(this : IManipulationProcessor*, manipulatorid : UInt32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.process_move.call(this, manipulatorid, x, y)
  end
  def process_up(this : IManipulationProcessor*, manipulatorid : UInt32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.process_up.call(this, manipulatorid, x, y)
  end
  def process_down_with_time(this : IManipulationProcessor*, manipulatorid : UInt32, x : Float32, y : Float32, timestamp : UInt32) : HRESULT
    @lpVtbl.value.process_down_with_time.call(this, manipulatorid, x, y, timestamp)
  end
  def process_move_with_time(this : IManipulationProcessor*, manipulatorid : UInt32, x : Float32, y : Float32, timestamp : UInt32) : HRESULT
    @lpVtbl.value.process_move_with_time.call(this, manipulatorid, x, y, timestamp)
  end
  def process_up_with_time(this : IManipulationProcessor*, manipulatorid : UInt32, x : Float32, y : Float32, timestamp : UInt32) : HRESULT
    @lpVtbl.value.process_up_with_time.call(this, manipulatorid, x, y, timestamp)
  end
  def get_velocity_x(this : IManipulationProcessor*, velocityx : Float32*) : HRESULT
    @lpVtbl.value.get_velocity_x.call(this, velocityx)
  end
  def get_velocity_y(this : IManipulationProcessor*, velocityy : Float32*) : HRESULT
    @lpVtbl.value.get_velocity_y.call(this, velocityy)
  end
  def get_expansion_velocity(this : IManipulationProcessor*, expansionvelocity : Float32*) : HRESULT
    @lpVtbl.value.get_expansion_velocity.call(this, expansionvelocity)
  end
  def get_angular_velocity(this : IManipulationProcessor*, angularvelocity : Float32*) : HRESULT
    @lpVtbl.value.get_angular_velocity.call(this, angularvelocity)
  end
  def get_minimum_scale_rotate_radius(this : IManipulationProcessor*, minradius : Float32*) : HRESULT
    @lpVtbl.value.get_minimum_scale_rotate_radius.call(this, minradius)
  end
  def put_minimum_scale_rotate_radius(this : IManipulationProcessor*, minradius : Float32) : HRESULT
    @lpVtbl.value.put_minimum_scale_rotate_radius.call(this, minradius)
  end
end
