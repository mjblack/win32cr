require "./../../system/com.cr"
require "./../../foundation.cr"

module Win32cr::UI::Input::Touch
  alias HGESTUREINFO = LibC::IntPtrT
  alias HTOUCHINPUT = LibC::IntPtrT

  CLSID_InertiaProcessor = LibC::GUID.new(0xabb27087_u32, 0x4ce0_u16, 0x4e58_u16, StaticArray[0xa0_u8, 0xcb_u8, 0xe2_u8, 0x4d_u8, 0xf9_u8, 0x68_u8, 0x14_u8, 0xbe_u8])

  CLSID_ManipulationProcessor = LibC::GUID.new(0x597d4fb0_u32, 0x47fd_u16, 0x4aff_u16, StaticArray[0x89_u8, 0xb9_u8, 0xc6_u8, 0xcf_u8, 0xae_u8, 0x8c_u8, 0xf0_u8, 0x8e_u8])

  @[Flags]
  enum GESTURECONFIG_ID : UInt32
    GID_BEGIN = 1_u32
    GID_END = 2_u32
    GID_ZOOM = 3_u32
    GID_PAN = 4_u32
    GID_ROTATE = 5_u32
    GID_TWOFINGERTAP = 6_u32
    GID_PRESSANDTAP = 7_u32
    GID_ROLLOVER = 7_u32
  end
  @[Flags]
  enum TOUCHEVENTF_FLAGS : UInt32
    TOUCHEVENTF_MOVE = 1_u32
    TOUCHEVENTF_DOWN = 2_u32
    TOUCHEVENTF_UP = 4_u32
    TOUCHEVENTF_INRANGE = 8_u32
    TOUCHEVENTF_PRIMARY = 16_u32
    TOUCHEVENTF_NOCOALESCE = 32_u32
    TOUCHEVENTF_PEN = 64_u32
    TOUCHEVENTF_PALM = 128_u32
  end
  @[Flags]
  enum TOUCHINPUTMASKF_MASK : UInt32
    TOUCHINPUTMASKF_TIMEFROMSYSTEM = 1_u32
    TOUCHINPUTMASKF_EXTRAINFO = 2_u32
    TOUCHINPUTMASKF_CONTACTAREA = 4_u32
  end
  enum REGISTER_TOUCH_WINDOW_FLAGS : UInt32
    TWF_FINETOUCH = 1_u32
    TWF_WANTPALM = 2_u32
  end
  enum MANIPULATION_PROCESSOR_MANIPULATIONS
    MANIPULATION_NONE = 0_i32
    MANIPULATION_TRANSLATE_X = 1_i32
    MANIPULATION_TRANSLATE_Y = 2_i32
    MANIPULATION_SCALE = 4_i32
    MANIPULATION_ROTATE = 8_i32
    MANIPULATION_ALL = 15_i32
  end

  @[Extern]
  record TOUCHINPUT,
    x : Int32,
    y : Int32,
    hSource : Win32cr::Foundation::HANDLE,
    dwID : UInt32,
    dwFlags : Win32cr::UI::Input::Touch::TOUCHEVENTF_FLAGS,
    dwMask : Win32cr::UI::Input::Touch::TOUCHINPUTMASKF_MASK,
    dwTime : UInt32,
    dwExtraInfo : LibC::UIntPtrT,
    cxContact : UInt32,
    cyContact : UInt32

  @[Extern]
  record GESTUREINFO,
    cbSize : UInt32,
    dwFlags : UInt32,
    dwID : UInt32,
    hwndTarget : Win32cr::Foundation::HWND,
    ptsLocation : Win32cr::Foundation::POINTS,
    dwInstanceID : UInt32,
    dwSequenceID : UInt32,
    ullArguments : UInt64,
    cbExtraArgs : UInt32

  @[Extern]
  record GESTURENOTIFYSTRUCT,
    cbSize : UInt32,
    dwFlags : UInt32,
    hwndTarget : Win32cr::Foundation::HWND,
    ptsLocation : Win32cr::Foundation::POINTS,
    dwInstanceID : UInt32

  @[Extern]
  record GESTURECONFIG,
    dwID : Win32cr::UI::Input::Touch::GESTURECONFIG_ID,
    dwWant : UInt32,
    dwBlock : UInt32

  @[Extern]
  record IManipulationEvents_Vtbl,
    query_interface : Proc(IManipulationEvents_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManipulationEvents_*, UInt32),
    release : Proc(IManipulationEvents_*, UInt32),
    manipulation_started : Proc(IManipulationEvents_*, Float32, Float32, Win32cr::Foundation::HRESULT),
    manipulation_delta : Proc(IManipulationEvents_*, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    manipulation_completed : Proc(IManipulationEvents_*, Float32, Float32, Float32, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4f62c8da-9c53-4b22-93df-927a862bbb03")]
  record IManipulationEvents_, lpVtbl : IManipulationEvents_Vtbl* do
    GUID = LibC::GUID.new(0x4f62c8da_u32, 0x9c53_u16, 0x4b22_u16, StaticArray[0x93_u8, 0xdf_u8, 0x92_u8, 0x7a_u8, 0x86_u8, 0x2b_u8, 0xbb_u8, 0x3_u8])
    def query_interface(this : IManipulationEvents_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManipulationEvents_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManipulationEvents_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def manipulation_started(this : IManipulationEvents_*, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.manipulation_started.call(this, x, y)
    end
    def manipulation_delta(this : IManipulationEvents_*, x : Float32, y : Float32, translationDeltaX : Float32, translationDeltaY : Float32, scaleDelta : Float32, expansionDelta : Float32, rotationDelta : Float32, cumulativeTranslationX : Float32, cumulativeTranslationY : Float32, cumulativeScale : Float32, cumulativeExpansion : Float32, cumulativeRotation : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.manipulation_delta.call(this, x, y, translationDeltaX, translationDeltaY, scaleDelta, expansionDelta, rotationDelta, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation)
    end
    def manipulation_completed(this : IManipulationEvents_*, x : Float32, y : Float32, cumulativeTranslationX : Float32, cumulativeTranslationY : Float32, cumulativeScale : Float32, cumulativeExpansion : Float32, cumulativeRotation : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.manipulation_completed.call(this, x, y, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation)
    end

  end

  @[Extern]
  record IInertiaProcessorVtbl,
    query_interface : Proc(IInertiaProcessor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInertiaProcessor*, UInt32),
    release : Proc(IInertiaProcessor*, UInt32),
    get_InitialOriginX : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialOriginX : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialOriginY : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialOriginY : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialVelocityX : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialVelocityX : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialVelocityY : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialVelocityY : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialAngularVelocity : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialAngularVelocity : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialExpansionVelocity : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialExpansionVelocity : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialRadius : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_InitialRadius : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_BoundaryLeft : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_BoundaryLeft : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_BoundaryTop : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_BoundaryTop : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_BoundaryRight : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_BoundaryRight : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_BoundaryBottom : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_BoundaryBottom : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_ElasticMarginLeft : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_ElasticMarginLeft : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_ElasticMarginTop : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_ElasticMarginTop : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_ElasticMarginRight : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_ElasticMarginRight : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_ElasticMarginBottom : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_ElasticMarginBottom : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_DesiredDisplacement : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DesiredDisplacement : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_DesiredRotation : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DesiredRotation : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_DesiredExpansion : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DesiredExpansion : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_DesiredDeceleration : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DesiredDeceleration : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_DesiredAngularDeceleration : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DesiredAngularDeceleration : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_DesiredExpansionDeceleration : Proc(IInertiaProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DesiredExpansionDeceleration : Proc(IInertiaProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_InitialTimestamp : Proc(IInertiaProcessor*, UInt32*, Win32cr::Foundation::HRESULT),
    put_InitialTimestamp : Proc(IInertiaProcessor*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IInertiaProcessor*, Win32cr::Foundation::HRESULT),
    process : Proc(IInertiaProcessor*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    process_time : Proc(IInertiaProcessor*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    complete : Proc(IInertiaProcessor*, Win32cr::Foundation::HRESULT),
    complete_time : Proc(IInertiaProcessor*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("18b00c6d-c5ee-41b1-90a9-9d4a929095ad")]
  record IInertiaProcessor, lpVtbl : IInertiaProcessorVtbl* do
    GUID = LibC::GUID.new(0x18b00c6d_u32, 0xc5ee_u16, 0x41b1_u16, StaticArray[0x90_u8, 0xa9_u8, 0x9d_u8, 0x4a_u8, 0x92_u8, 0x90_u8, 0x95_u8, 0xad_u8])
    def query_interface(this : IInertiaProcessor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInertiaProcessor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInertiaProcessor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_InitialOriginX(this : IInertiaProcessor*, x : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialOriginX.call(this, x)
    end
    def put_InitialOriginX(this : IInertiaProcessor*, x : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialOriginX.call(this, x)
    end
    def get_InitialOriginY(this : IInertiaProcessor*, y : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialOriginY.call(this, y)
    end
    def put_InitialOriginY(this : IInertiaProcessor*, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialOriginY.call(this, y)
    end
    def get_InitialVelocityX(this : IInertiaProcessor*, x : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialVelocityX.call(this, x)
    end
    def put_InitialVelocityX(this : IInertiaProcessor*, x : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialVelocityX.call(this, x)
    end
    def get_InitialVelocityY(this : IInertiaProcessor*, y : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialVelocityY.call(this, y)
    end
    def put_InitialVelocityY(this : IInertiaProcessor*, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialVelocityY.call(this, y)
    end
    def get_InitialAngularVelocity(this : IInertiaProcessor*, velocity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialAngularVelocity.call(this, velocity)
    end
    def put_InitialAngularVelocity(this : IInertiaProcessor*, velocity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialAngularVelocity.call(this, velocity)
    end
    def get_InitialExpansionVelocity(this : IInertiaProcessor*, velocity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialExpansionVelocity.call(this, velocity)
    end
    def put_InitialExpansionVelocity(this : IInertiaProcessor*, velocity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialExpansionVelocity.call(this, velocity)
    end
    def get_InitialRadius(this : IInertiaProcessor*, radius : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialRadius.call(this, radius)
    end
    def put_InitialRadius(this : IInertiaProcessor*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialRadius.call(this, radius)
    end
    def get_BoundaryLeft(this : IInertiaProcessor*, left : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BoundaryLeft.call(this, left)
    end
    def put_BoundaryLeft(this : IInertiaProcessor*, left : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BoundaryLeft.call(this, left)
    end
    def get_BoundaryTop(this : IInertiaProcessor*, top : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BoundaryTop.call(this, top)
    end
    def put_BoundaryTop(this : IInertiaProcessor*, top : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BoundaryTop.call(this, top)
    end
    def get_BoundaryRight(this : IInertiaProcessor*, right : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BoundaryRight.call(this, right)
    end
    def put_BoundaryRight(this : IInertiaProcessor*, right : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BoundaryRight.call(this, right)
    end
    def get_BoundaryBottom(this : IInertiaProcessor*, bottom : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BoundaryBottom.call(this, bottom)
    end
    def put_BoundaryBottom(this : IInertiaProcessor*, bottom : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BoundaryBottom.call(this, bottom)
    end
    def get_ElasticMarginLeft(this : IInertiaProcessor*, left : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ElasticMarginLeft.call(this, left)
    end
    def put_ElasticMarginLeft(this : IInertiaProcessor*, left : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ElasticMarginLeft.call(this, left)
    end
    def get_ElasticMarginTop(this : IInertiaProcessor*, top : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ElasticMarginTop.call(this, top)
    end
    def put_ElasticMarginTop(this : IInertiaProcessor*, top : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ElasticMarginTop.call(this, top)
    end
    def get_ElasticMarginRight(this : IInertiaProcessor*, right : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ElasticMarginRight.call(this, right)
    end
    def put_ElasticMarginRight(this : IInertiaProcessor*, right : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ElasticMarginRight.call(this, right)
    end
    def get_ElasticMarginBottom(this : IInertiaProcessor*, bottom : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ElasticMarginBottom.call(this, bottom)
    end
    def put_ElasticMarginBottom(this : IInertiaProcessor*, bottom : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ElasticMarginBottom.call(this, bottom)
    end
    def get_DesiredDisplacement(this : IInertiaProcessor*, displacement : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredDisplacement.call(this, displacement)
    end
    def put_DesiredDisplacement(this : IInertiaProcessor*, displacement : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredDisplacement.call(this, displacement)
    end
    def get_DesiredRotation(this : IInertiaProcessor*, rotation : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredRotation.call(this, rotation)
    end
    def put_DesiredRotation(this : IInertiaProcessor*, rotation : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredRotation.call(this, rotation)
    end
    def get_DesiredExpansion(this : IInertiaProcessor*, expansion : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredExpansion.call(this, expansion)
    end
    def put_DesiredExpansion(this : IInertiaProcessor*, expansion : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredExpansion.call(this, expansion)
    end
    def get_DesiredDeceleration(this : IInertiaProcessor*, deceleration : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredDeceleration.call(this, deceleration)
    end
    def put_DesiredDeceleration(this : IInertiaProcessor*, deceleration : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredDeceleration.call(this, deceleration)
    end
    def get_DesiredAngularDeceleration(this : IInertiaProcessor*, deceleration : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredAngularDeceleration.call(this, deceleration)
    end
    def put_DesiredAngularDeceleration(this : IInertiaProcessor*, deceleration : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredAngularDeceleration.call(this, deceleration)
    end
    def get_DesiredExpansionDeceleration(this : IInertiaProcessor*, deceleration : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DesiredExpansionDeceleration.call(this, deceleration)
    end
    def put_DesiredExpansionDeceleration(this : IInertiaProcessor*, deceleration : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DesiredExpansionDeceleration.call(this, deceleration)
    end
    def get_InitialTimestamp(this : IInertiaProcessor*, timestamp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitialTimestamp.call(this, timestamp)
    end
    def put_InitialTimestamp(this : IInertiaProcessor*, timestamp : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitialTimestamp.call(this, timestamp)
    end
    def reset(this : IInertiaProcessor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def process(this : IInertiaProcessor*, completed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process.call(this, completed)
    end
    def process_time(this : IInertiaProcessor*, timestamp : UInt32, completed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_time.call(this, timestamp, completed)
    end
    def complete(this : IInertiaProcessor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete.call(this)
    end
    def complete_time(this : IInertiaProcessor*, timestamp : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_time.call(this, timestamp)
    end

  end

  @[Extern]
  record IManipulationProcessorVtbl,
    query_interface : Proc(IManipulationProcessor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManipulationProcessor*, UInt32),
    release : Proc(IManipulationProcessor*, UInt32),
    get_SupportedManipulations : Proc(IManipulationProcessor*, Win32cr::UI::Input::Touch::MANIPULATION_PROCESSOR_MANIPULATIONS*, Win32cr::Foundation::HRESULT),
    put_SupportedManipulations : Proc(IManipulationProcessor*, Win32cr::UI::Input::Touch::MANIPULATION_PROCESSOR_MANIPULATIONS, Win32cr::Foundation::HRESULT),
    get_PivotPointX : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_PivotPointX : Proc(IManipulationProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_PivotPointY : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_PivotPointY : Proc(IManipulationProcessor*, Float32, Win32cr::Foundation::HRESULT),
    get_PivotRadius : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_PivotRadius : Proc(IManipulationProcessor*, Float32, Win32cr::Foundation::HRESULT),
    complete_manipulation : Proc(IManipulationProcessor*, Win32cr::Foundation::HRESULT),
    process_down : Proc(IManipulationProcessor*, UInt32, Float32, Float32, Win32cr::Foundation::HRESULT),
    process_move : Proc(IManipulationProcessor*, UInt32, Float32, Float32, Win32cr::Foundation::HRESULT),
    process_up : Proc(IManipulationProcessor*, UInt32, Float32, Float32, Win32cr::Foundation::HRESULT),
    process_down_with_time : Proc(IManipulationProcessor*, UInt32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    process_move_with_time : Proc(IManipulationProcessor*, UInt32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    process_up_with_time : Proc(IManipulationProcessor*, UInt32, Float32, Float32, UInt32, Win32cr::Foundation::HRESULT),
    get_velocity_x : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    get_velocity_y : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    get_expansion_velocity : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    get_angular_velocity : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    get_MinimumScaleRotateRadius : Proc(IManipulationProcessor*, Float32*, Win32cr::Foundation::HRESULT),
    put_MinimumScaleRotateRadius : Proc(IManipulationProcessor*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a22ac519-8300-48a0-bef4-f1be8737dba4")]
  record IManipulationProcessor, lpVtbl : IManipulationProcessorVtbl* do
    GUID = LibC::GUID.new(0xa22ac519_u32, 0x8300_u16, 0x48a0_u16, StaticArray[0xbe_u8, 0xf4_u8, 0xf1_u8, 0xbe_u8, 0x87_u8, 0x37_u8, 0xdb_u8, 0xa4_u8])
    def query_interface(this : IManipulationProcessor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManipulationProcessor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManipulationProcessor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_SupportedManipulations(this : IManipulationProcessor*, manipulations : Win32cr::UI::Input::Touch::MANIPULATION_PROCESSOR_MANIPULATIONS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedManipulations.call(this, manipulations)
    end
    def put_SupportedManipulations(this : IManipulationProcessor*, manipulations : Win32cr::UI::Input::Touch::MANIPULATION_PROCESSOR_MANIPULATIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportedManipulations.call(this, manipulations)
    end
    def get_PivotPointX(this : IManipulationProcessor*, pivotPointX : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PivotPointX.call(this, pivotPointX)
    end
    def put_PivotPointX(this : IManipulationProcessor*, pivotPointX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PivotPointX.call(this, pivotPointX)
    end
    def get_PivotPointY(this : IManipulationProcessor*, pivotPointY : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PivotPointY.call(this, pivotPointY)
    end
    def put_PivotPointY(this : IManipulationProcessor*, pivotPointY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PivotPointY.call(this, pivotPointY)
    end
    def get_PivotRadius(this : IManipulationProcessor*, pivotRadius : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PivotRadius.call(this, pivotRadius)
    end
    def put_PivotRadius(this : IManipulationProcessor*, pivotRadius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PivotRadius.call(this, pivotRadius)
    end
    def complete_manipulation(this : IManipulationProcessor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_manipulation.call(this)
    end
    def process_down(this : IManipulationProcessor*, manipulatorId : UInt32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_down.call(this, manipulatorId, x, y)
    end
    def process_move(this : IManipulationProcessor*, manipulatorId : UInt32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_move.call(this, manipulatorId, x, y)
    end
    def process_up(this : IManipulationProcessor*, manipulatorId : UInt32, x : Float32, y : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_up.call(this, manipulatorId, x, y)
    end
    def process_down_with_time(this : IManipulationProcessor*, manipulatorId : UInt32, x : Float32, y : Float32, timestamp : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_down_with_time.call(this, manipulatorId, x, y, timestamp)
    end
    def process_move_with_time(this : IManipulationProcessor*, manipulatorId : UInt32, x : Float32, y : Float32, timestamp : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_move_with_time.call(this, manipulatorId, x, y, timestamp)
    end
    def process_up_with_time(this : IManipulationProcessor*, manipulatorId : UInt32, x : Float32, y : Float32, timestamp : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_up_with_time.call(this, manipulatorId, x, y, timestamp)
    end
    def get_velocity_x(this : IManipulationProcessor*, velocityX : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_velocity_x.call(this, velocityX)
    end
    def get_velocity_y(this : IManipulationProcessor*, velocityY : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_velocity_y.call(this, velocityY)
    end
    def get_expansion_velocity(this : IManipulationProcessor*, expansionVelocity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_expansion_velocity.call(this, expansionVelocity)
    end
    def get_angular_velocity(this : IManipulationProcessor*, angularVelocity : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_angular_velocity.call(this, angularVelocity)
    end
    def get_MinimumScaleRotateRadius(this : IManipulationProcessor*, minRadius : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinimumScaleRotateRadius.call(this, minRadius)
    end
    def put_MinimumScaleRotateRadius(this : IManipulationProcessor*, minRadius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinimumScaleRotateRadius.call(this, minRadius)
    end

  end

  @[Link("user32")]
  lib C
    fun GetTouchInputInfo(hTouchInput : Win32cr::UI::Input::Touch::HTOUCHINPUT, cInputs : UInt32, pInputs : Win32cr::UI::Input::Touch::TOUCHINPUT*, cbSize : Int32) : Win32cr::Foundation::BOOL

    fun CloseTouchInputHandle(hTouchInput : Win32cr::UI::Input::Touch::HTOUCHINPUT) : Win32cr::Foundation::BOOL

    fun RegisterTouchWindow(hwnd : Win32cr::Foundation::HWND, ulFlags : Win32cr::UI::Input::Touch::REGISTER_TOUCH_WINDOW_FLAGS) : Win32cr::Foundation::BOOL

    fun UnregisterTouchWindow(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun IsTouchWindow(hwnd : Win32cr::Foundation::HWND, pulFlags : UInt32*) : Win32cr::Foundation::BOOL

    fun GetGestureInfo(hGestureInfo : Win32cr::UI::Input::Touch::HGESTUREINFO, pGestureInfo : Win32cr::UI::Input::Touch::GESTUREINFO*) : Win32cr::Foundation::BOOL

    fun GetGestureExtraArgs(hGestureInfo : Win32cr::UI::Input::Touch::HGESTUREINFO, cbExtraArgs : UInt32, pExtraArgs : UInt8*) : Win32cr::Foundation::BOOL

    fun CloseGestureInfoHandle(hGestureInfo : Win32cr::UI::Input::Touch::HGESTUREINFO) : Win32cr::Foundation::BOOL

    fun SetGestureConfig(hwnd : Win32cr::Foundation::HWND, dwReserved : UInt32, cIDs : UInt32, pGestureConfig : Win32cr::UI::Input::Touch::GESTURECONFIG*, cbSize : UInt32) : Win32cr::Foundation::BOOL

    fun GetGestureConfig(hwnd : Win32cr::Foundation::HWND, dwReserved : UInt32, dwFlags : UInt32, pcIDs : UInt32*, pGestureConfig : Win32cr::UI::Input::Touch::GESTURECONFIG*, cbSize : UInt32) : Win32cr::Foundation::BOOL

  end
end