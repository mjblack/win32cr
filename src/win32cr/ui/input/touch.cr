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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    manipulation_started : UInt64
    manipulation_delta : UInt64
    manipulation_completed : UInt64
  end

  IIManipulationEvents_GUID = "4f62c8da-9c53-4b22-93df-927a862bbb03"
  IID_IIManipulationEvents = LibC::GUID.new(0x4f62c8da_u32, 0x9c53_u16, 0x4b22_u16, StaticArray[0x93_u8, 0xdf_u8, 0x92_u8, 0x7a_u8, 0x86_u8, 0x2b_u8, 0xbb_u8, 0x3_u8])
  struct IIManipulationEvents
    lpVtbl : IIManipulationEventsVTbl*
  end

  struct IInertiaProcessorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_initial_origin_x : UInt64
    put_initial_origin_x : UInt64
    get_initial_origin_y : UInt64
    put_initial_origin_y : UInt64
    get_initial_velocity_x : UInt64
    put_initial_velocity_x : UInt64
    get_initial_velocity_y : UInt64
    put_initial_velocity_y : UInt64
    get_initial_angular_velocity : UInt64
    put_initial_angular_velocity : UInt64
    get_initial_expansion_velocity : UInt64
    put_initial_expansion_velocity : UInt64
    get_initial_radius : UInt64
    put_initial_radius : UInt64
    get_boundary_left : UInt64
    put_boundary_left : UInt64
    get_boundary_top : UInt64
    put_boundary_top : UInt64
    get_boundary_right : UInt64
    put_boundary_right : UInt64
    get_boundary_bottom : UInt64
    put_boundary_bottom : UInt64
    get_elastic_margin_left : UInt64
    put_elastic_margin_left : UInt64
    get_elastic_margin_top : UInt64
    put_elastic_margin_top : UInt64
    get_elastic_margin_right : UInt64
    put_elastic_margin_right : UInt64
    get_elastic_margin_bottom : UInt64
    put_elastic_margin_bottom : UInt64
    get_desired_displacement : UInt64
    put_desired_displacement : UInt64
    get_desired_rotation : UInt64
    put_desired_rotation : UInt64
    get_desired_expansion : UInt64
    put_desired_expansion : UInt64
    get_desired_deceleration : UInt64
    put_desired_deceleration : UInt64
    get_desired_angular_deceleration : UInt64
    put_desired_angular_deceleration : UInt64
    get_desired_expansion_deceleration : UInt64
    put_desired_expansion_deceleration : UInt64
    get_initial_timestamp : UInt64
    put_initial_timestamp : UInt64
    reset : UInt64
    process : UInt64
    process_time : UInt64
    complete : UInt64
    complete_time : UInt64
  end

  IInertiaProcessor_GUID = "18b00c6d-c5ee-41b1-90a9-9d4a929095ad"
  IID_IInertiaProcessor = LibC::GUID.new(0x18b00c6d_u32, 0xc5ee_u16, 0x41b1_u16, StaticArray[0x90_u8, 0xa9_u8, 0x9d_u8, 0x4a_u8, 0x92_u8, 0x90_u8, 0x95_u8, 0xad_u8])
  struct IInertiaProcessor
    lpVtbl : IInertiaProcessorVTbl*
  end

  struct IManipulationProcessorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_supported_manipulations : UInt64
    put_supported_manipulations : UInt64
    get_pivot_point_x : UInt64
    put_pivot_point_x : UInt64
    get_pivot_point_y : UInt64
    put_pivot_point_y : UInt64
    get_pivot_radius : UInt64
    put_pivot_radius : UInt64
    complete_manipulation : UInt64
    process_down : UInt64
    process_move : UInt64
    process_up : UInt64
    process_down_with_time : UInt64
    process_move_with_time : UInt64
    process_up_with_time : UInt64
    get_velocity_x : UInt64
    get_velocity_y : UInt64
    get_expansion_velocity : UInt64
    get_angular_velocity : UInt64
    get_minimum_scale_rotate_radius : UInt64
    put_minimum_scale_rotate_radius : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def manipulation_started(x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.manipulation_started.unsafe_as(Proc(Float32, Float32, HRESULT)).call(x, y)
  end
  def manipulation_delta(x : Float32, y : Float32, translationdeltax : Float32, translationdeltay : Float32, scaledelta : Float32, expansiondelta : Float32, rotationdelta : Float32, cumulativetranslationx : Float32, cumulativetranslationy : Float32, cumulativescale : Float32, cumulativeexpansion : Float32, cumulativerotation : Float32) : HRESULT
    @lpVtbl.value.manipulation_delta.unsafe_as(Proc(Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, HRESULT)).call(x, y, translationdeltax, translationdeltay, scaledelta, expansiondelta, rotationdelta, cumulativetranslationx, cumulativetranslationy, cumulativescale, cumulativeexpansion, cumulativerotation)
  end
  def manipulation_completed(x : Float32, y : Float32, cumulativetranslationx : Float32, cumulativetranslationy : Float32, cumulativescale : Float32, cumulativeexpansion : Float32, cumulativerotation : Float32) : HRESULT
    @lpVtbl.value.manipulation_completed.unsafe_as(Proc(Float32, Float32, Float32, Float32, Float32, Float32, Float32, HRESULT)).call(x, y, cumulativetranslationx, cumulativetranslationy, cumulativescale, cumulativeexpansion, cumulativerotation)
  end
end
struct LibWin32::IInertiaProcessor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_initial_origin_x(x : Float32*) : HRESULT
    @lpVtbl.value.get_initial_origin_x.unsafe_as(Proc(Float32*, HRESULT)).call(x)
  end
  def put_initial_origin_x(x : Float32) : HRESULT
    @lpVtbl.value.put_initial_origin_x.unsafe_as(Proc(Float32, HRESULT)).call(x)
  end
  def get_initial_origin_y(y : Float32*) : HRESULT
    @lpVtbl.value.get_initial_origin_y.unsafe_as(Proc(Float32*, HRESULT)).call(y)
  end
  def put_initial_origin_y(y : Float32) : HRESULT
    @lpVtbl.value.put_initial_origin_y.unsafe_as(Proc(Float32, HRESULT)).call(y)
  end
  def get_initial_velocity_x(x : Float32*) : HRESULT
    @lpVtbl.value.get_initial_velocity_x.unsafe_as(Proc(Float32*, HRESULT)).call(x)
  end
  def put_initial_velocity_x(x : Float32) : HRESULT
    @lpVtbl.value.put_initial_velocity_x.unsafe_as(Proc(Float32, HRESULT)).call(x)
  end
  def get_initial_velocity_y(y : Float32*) : HRESULT
    @lpVtbl.value.get_initial_velocity_y.unsafe_as(Proc(Float32*, HRESULT)).call(y)
  end
  def put_initial_velocity_y(y : Float32) : HRESULT
    @lpVtbl.value.put_initial_velocity_y.unsafe_as(Proc(Float32, HRESULT)).call(y)
  end
  def get_initial_angular_velocity(velocity : Float32*) : HRESULT
    @lpVtbl.value.get_initial_angular_velocity.unsafe_as(Proc(Float32*, HRESULT)).call(velocity)
  end
  def put_initial_angular_velocity(velocity : Float32) : HRESULT
    @lpVtbl.value.put_initial_angular_velocity.unsafe_as(Proc(Float32, HRESULT)).call(velocity)
  end
  def get_initial_expansion_velocity(velocity : Float32*) : HRESULT
    @lpVtbl.value.get_initial_expansion_velocity.unsafe_as(Proc(Float32*, HRESULT)).call(velocity)
  end
  def put_initial_expansion_velocity(velocity : Float32) : HRESULT
    @lpVtbl.value.put_initial_expansion_velocity.unsafe_as(Proc(Float32, HRESULT)).call(velocity)
  end
  def get_initial_radius(radius : Float32*) : HRESULT
    @lpVtbl.value.get_initial_radius.unsafe_as(Proc(Float32*, HRESULT)).call(radius)
  end
  def put_initial_radius(radius : Float32) : HRESULT
    @lpVtbl.value.put_initial_radius.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def get_boundary_left(left : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_left.unsafe_as(Proc(Float32*, HRESULT)).call(left)
  end
  def put_boundary_left(left : Float32) : HRESULT
    @lpVtbl.value.put_boundary_left.unsafe_as(Proc(Float32, HRESULT)).call(left)
  end
  def get_boundary_top(top : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_top.unsafe_as(Proc(Float32*, HRESULT)).call(top)
  end
  def put_boundary_top(top : Float32) : HRESULT
    @lpVtbl.value.put_boundary_top.unsafe_as(Proc(Float32, HRESULT)).call(top)
  end
  def get_boundary_right(right : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_right.unsafe_as(Proc(Float32*, HRESULT)).call(right)
  end
  def put_boundary_right(right : Float32) : HRESULT
    @lpVtbl.value.put_boundary_right.unsafe_as(Proc(Float32, HRESULT)).call(right)
  end
  def get_boundary_bottom(bottom : Float32*) : HRESULT
    @lpVtbl.value.get_boundary_bottom.unsafe_as(Proc(Float32*, HRESULT)).call(bottom)
  end
  def put_boundary_bottom(bottom : Float32) : HRESULT
    @lpVtbl.value.put_boundary_bottom.unsafe_as(Proc(Float32, HRESULT)).call(bottom)
  end
  def get_elastic_margin_left(left : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_left.unsafe_as(Proc(Float32*, HRESULT)).call(left)
  end
  def put_elastic_margin_left(left : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_left.unsafe_as(Proc(Float32, HRESULT)).call(left)
  end
  def get_elastic_margin_top(top : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_top.unsafe_as(Proc(Float32*, HRESULT)).call(top)
  end
  def put_elastic_margin_top(top : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_top.unsafe_as(Proc(Float32, HRESULT)).call(top)
  end
  def get_elastic_margin_right(right : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_right.unsafe_as(Proc(Float32*, HRESULT)).call(right)
  end
  def put_elastic_margin_right(right : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_right.unsafe_as(Proc(Float32, HRESULT)).call(right)
  end
  def get_elastic_margin_bottom(bottom : Float32*) : HRESULT
    @lpVtbl.value.get_elastic_margin_bottom.unsafe_as(Proc(Float32*, HRESULT)).call(bottom)
  end
  def put_elastic_margin_bottom(bottom : Float32) : HRESULT
    @lpVtbl.value.put_elastic_margin_bottom.unsafe_as(Proc(Float32, HRESULT)).call(bottom)
  end
  def get_desired_displacement(displacement : Float32*) : HRESULT
    @lpVtbl.value.get_desired_displacement.unsafe_as(Proc(Float32*, HRESULT)).call(displacement)
  end
  def put_desired_displacement(displacement : Float32) : HRESULT
    @lpVtbl.value.put_desired_displacement.unsafe_as(Proc(Float32, HRESULT)).call(displacement)
  end
  def get_desired_rotation(rotation : Float32*) : HRESULT
    @lpVtbl.value.get_desired_rotation.unsafe_as(Proc(Float32*, HRESULT)).call(rotation)
  end
  def put_desired_rotation(rotation : Float32) : HRESULT
    @lpVtbl.value.put_desired_rotation.unsafe_as(Proc(Float32, HRESULT)).call(rotation)
  end
  def get_desired_expansion(expansion : Float32*) : HRESULT
    @lpVtbl.value.get_desired_expansion.unsafe_as(Proc(Float32*, HRESULT)).call(expansion)
  end
  def put_desired_expansion(expansion : Float32) : HRESULT
    @lpVtbl.value.put_desired_expansion.unsafe_as(Proc(Float32, HRESULT)).call(expansion)
  end
  def get_desired_deceleration(deceleration : Float32*) : HRESULT
    @lpVtbl.value.get_desired_deceleration.unsafe_as(Proc(Float32*, HRESULT)).call(deceleration)
  end
  def put_desired_deceleration(deceleration : Float32) : HRESULT
    @lpVtbl.value.put_desired_deceleration.unsafe_as(Proc(Float32, HRESULT)).call(deceleration)
  end
  def get_desired_angular_deceleration(deceleration : Float32*) : HRESULT
    @lpVtbl.value.get_desired_angular_deceleration.unsafe_as(Proc(Float32*, HRESULT)).call(deceleration)
  end
  def put_desired_angular_deceleration(deceleration : Float32) : HRESULT
    @lpVtbl.value.put_desired_angular_deceleration.unsafe_as(Proc(Float32, HRESULT)).call(deceleration)
  end
  def get_desired_expansion_deceleration(deceleration : Float32*) : HRESULT
    @lpVtbl.value.get_desired_expansion_deceleration.unsafe_as(Proc(Float32*, HRESULT)).call(deceleration)
  end
  def put_desired_expansion_deceleration(deceleration : Float32) : HRESULT
    @lpVtbl.value.put_desired_expansion_deceleration.unsafe_as(Proc(Float32, HRESULT)).call(deceleration)
  end
  def get_initial_timestamp(timestamp : UInt32*) : HRESULT
    @lpVtbl.value.get_initial_timestamp.unsafe_as(Proc(UInt32*, HRESULT)).call(timestamp)
  end
  def put_initial_timestamp(timestamp : UInt32) : HRESULT
    @lpVtbl.value.put_initial_timestamp.unsafe_as(Proc(UInt32, HRESULT)).call(timestamp)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def process(completed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(completed)
  end
  def process_time(timestamp : UInt32, completed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process_time.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(timestamp, completed)
  end
  def complete : HRESULT
    @lpVtbl.value.complete.unsafe_as(Proc(HRESULT)).call
  end
  def complete_time(timestamp : UInt32) : HRESULT
    @lpVtbl.value.complete_time.unsafe_as(Proc(UInt32, HRESULT)).call(timestamp)
  end
end
struct LibWin32::IManipulationProcessor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_supported_manipulations(manipulations : MANIPULATION_PROCESSOR_MANIPULATIONS*) : HRESULT
    @lpVtbl.value.get_supported_manipulations.unsafe_as(Proc(MANIPULATION_PROCESSOR_MANIPULATIONS*, HRESULT)).call(manipulations)
  end
  def put_supported_manipulations(manipulations : MANIPULATION_PROCESSOR_MANIPULATIONS) : HRESULT
    @lpVtbl.value.put_supported_manipulations.unsafe_as(Proc(MANIPULATION_PROCESSOR_MANIPULATIONS, HRESULT)).call(manipulations)
  end
  def get_pivot_point_x(pivotpointx : Float32*) : HRESULT
    @lpVtbl.value.get_pivot_point_x.unsafe_as(Proc(Float32*, HRESULT)).call(pivotpointx)
  end
  def put_pivot_point_x(pivotpointx : Float32) : HRESULT
    @lpVtbl.value.put_pivot_point_x.unsafe_as(Proc(Float32, HRESULT)).call(pivotpointx)
  end
  def get_pivot_point_y(pivotpointy : Float32*) : HRESULT
    @lpVtbl.value.get_pivot_point_y.unsafe_as(Proc(Float32*, HRESULT)).call(pivotpointy)
  end
  def put_pivot_point_y(pivotpointy : Float32) : HRESULT
    @lpVtbl.value.put_pivot_point_y.unsafe_as(Proc(Float32, HRESULT)).call(pivotpointy)
  end
  def get_pivot_radius(pivotradius : Float32*) : HRESULT
    @lpVtbl.value.get_pivot_radius.unsafe_as(Proc(Float32*, HRESULT)).call(pivotradius)
  end
  def put_pivot_radius(pivotradius : Float32) : HRESULT
    @lpVtbl.value.put_pivot_radius.unsafe_as(Proc(Float32, HRESULT)).call(pivotradius)
  end
  def complete_manipulation : HRESULT
    @lpVtbl.value.complete_manipulation.unsafe_as(Proc(HRESULT)).call
  end
  def process_down(manipulatorid : UInt32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.process_down.unsafe_as(Proc(UInt32, Float32, Float32, HRESULT)).call(manipulatorid, x, y)
  end
  def process_move(manipulatorid : UInt32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.process_move.unsafe_as(Proc(UInt32, Float32, Float32, HRESULT)).call(manipulatorid, x, y)
  end
  def process_up(manipulatorid : UInt32, x : Float32, y : Float32) : HRESULT
    @lpVtbl.value.process_up.unsafe_as(Proc(UInt32, Float32, Float32, HRESULT)).call(manipulatorid, x, y)
  end
  def process_down_with_time(manipulatorid : UInt32, x : Float32, y : Float32, timestamp : UInt32) : HRESULT
    @lpVtbl.value.process_down_with_time.unsafe_as(Proc(UInt32, Float32, Float32, UInt32, HRESULT)).call(manipulatorid, x, y, timestamp)
  end
  def process_move_with_time(manipulatorid : UInt32, x : Float32, y : Float32, timestamp : UInt32) : HRESULT
    @lpVtbl.value.process_move_with_time.unsafe_as(Proc(UInt32, Float32, Float32, UInt32, HRESULT)).call(manipulatorid, x, y, timestamp)
  end
  def process_up_with_time(manipulatorid : UInt32, x : Float32, y : Float32, timestamp : UInt32) : HRESULT
    @lpVtbl.value.process_up_with_time.unsafe_as(Proc(UInt32, Float32, Float32, UInt32, HRESULT)).call(manipulatorid, x, y, timestamp)
  end
  def get_velocity_x(velocityx : Float32*) : HRESULT
    @lpVtbl.value.get_velocity_x.unsafe_as(Proc(Float32*, HRESULT)).call(velocityx)
  end
  def get_velocity_y(velocityy : Float32*) : HRESULT
    @lpVtbl.value.get_velocity_y.unsafe_as(Proc(Float32*, HRESULT)).call(velocityy)
  end
  def get_expansion_velocity(expansionvelocity : Float32*) : HRESULT
    @lpVtbl.value.get_expansion_velocity.unsafe_as(Proc(Float32*, HRESULT)).call(expansionvelocity)
  end
  def get_angular_velocity(angularvelocity : Float32*) : HRESULT
    @lpVtbl.value.get_angular_velocity.unsafe_as(Proc(Float32*, HRESULT)).call(angularvelocity)
  end
  def get_minimum_scale_rotate_radius(minradius : Float32*) : HRESULT
    @lpVtbl.value.get_minimum_scale_rotate_radius.unsafe_as(Proc(Float32*, HRESULT)).call(minradius)
  end
  def put_minimum_scale_rotate_radius(minradius : Float32) : HRESULT
    @lpVtbl.value.put_minimum_scale_rotate_radius.unsafe_as(Proc(Float32, HRESULT)).call(minradius)
  end
end
