require "./../system/com.cr"
require "./../foundation.cr"
require "./../ui/windows_and_messaging.cr"

module Win32cr::Graphics::DirectManipulation
  DIRECTMANIPULATION_KEYBOARDFOCUS = 4294967294_u32
  DIRECTMANIPULATION_MOUSEFOCUS = 4294967293_u32
  CLSID_VerticalIndicatorContent = "a10b5f17-afe0-4aa2-91e9-3e7001d2e6b4"
  CLSID_HorizontalIndicatorContent = "e7d18cf5-3ec7-44d5-a76b-3770f3cf903d"
  CLSID_VirtualViewportContent = "3206a19a-86f0-4cb4-a7f3-16e3b7e2d852"
  CLSID_DragDropConfigurationBehavior = "09b01b3e-ba6c-454d-82e8-95e352329f23"
  CLSID_AutoScrollBehavior = "26126a51-3c70-4c9a-aec2-948849eeb093"
  CLSID_DeferContactService = "d7b67cf4-84bb-434e-86ae-6592bbc9abd9"

  CLSID_DirectManipulationViewport = LibC::GUID.new(0x34e211b6_u32, 0x3650_u16, 0x4f75_u16, StaticArray[0x83_u8, 0x34_u8, 0xfa_u8, 0x35_u8, 0x95_u8, 0x98_u8, 0xe1_u8, 0xc5_u8])

  CLSID_DirectManipulationUpdateManager = LibC::GUID.new(0x9fc1bfd5_u32, 0x1835_u16, 0x441a_u16, StaticArray[0xb3_u8, 0xb1_u8, 0xb6_u8, 0xcc_u8, 0x74_u8, 0xb7_u8, 0x27_u8, 0xd0_u8])

  CLSID_DirectManipulationPrimaryContent = LibC::GUID.new(0xcaa02661_u32, 0xd59e_u16, 0x41c7_u16, StaticArray[0x83_u8, 0x93_u8, 0x3b_u8, 0xa3_u8, 0xba_u8, 0xcb_u8, 0x6b_u8, 0x57_u8])

  CLSID_DirectManipulationManager = LibC::GUID.new(0x54e211b6_u32, 0x3650_u16, 0x4f75_u16, StaticArray[0x83_u8, 0x34_u8, 0xfa_u8, 0x35_u8, 0x95_u8, 0x98_u8, 0xe1_u8, 0xc5_u8])

  CLSID_DirectManipulationSharedManager = LibC::GUID.new(0x99793286_u32, 0x77cc_u16, 0x4b57_u16, StaticArray[0x96_u8, 0xdb_u8, 0x3b_u8, 0x35_u8, 0x4f_u8, 0x6f_u8, 0x9f_u8, 0xb5_u8])

  CLSID_DCompManipulationCompositor = LibC::GUID.new(0x79dea627_u32, 0xa08a_u16, 0x43ac_u16, StaticArray[0x8e_u8, 0xf5_u8, 0x69_u8, 0x0_u8, 0xb9_u8, 0x29_u8, 0x91_u8, 0x26_u8])

  enum DIRECTMANIPULATION_STATUS
    DIRECTMANIPULATION_BUILDING = 0_i32
    DIRECTMANIPULATION_ENABLED = 1_i32
    DIRECTMANIPULATION_DISABLED = 2_i32
    DIRECTMANIPULATION_RUNNING = 3_i32
    DIRECTMANIPULATION_INERTIA = 4_i32
    DIRECTMANIPULATION_READY = 5_i32
    DIRECTMANIPULATION_SUSPENDED = 6_i32
  end
  enum DIRECTMANIPULATION_HITTEST_TYPE
    DIRECTMANIPULATION_HITTEST_TYPE_ASYNCHRONOUS = 0_i32
    DIRECTMANIPULATION_HITTEST_TYPE_SYNCHRONOUS = 1_i32
    DIRECTMANIPULATION_HITTEST_TYPE_AUTO_SYNCHRONOUS = 2_i32
  end
  enum DIRECTMANIPULATION_CONFIGURATION
    DIRECTMANIPULATION_CONFIGURATION_NONE = 0_i32
    DIRECTMANIPULATION_CONFIGURATION_INTERACTION = 1_i32
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X = 2_i32
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y = 4_i32
    DIRECTMANIPULATION_CONFIGURATION_SCALING = 16_i32
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_INERTIA = 32_i32
    DIRECTMANIPULATION_CONFIGURATION_SCALING_INERTIA = 128_i32
    DIRECTMANIPULATION_CONFIGURATION_RAILS_X = 256_i32
    DIRECTMANIPULATION_CONFIGURATION_RAILS_Y = 512_i32
  end
  enum DIRECTMANIPULATION_GESTURE_CONFIGURATION
    DIRECTMANIPULATION_GESTURE_NONE = 0_i32
    DIRECTMANIPULATION_GESTURE_DEFAULT = 0_i32
    DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_VERTICAL = 8_i32
    DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_HORIZONTAL = 16_i32
    DIRECTMANIPULATION_GESTURE_PINCH_ZOOM = 32_i32
  end
  enum DIRECTMANIPULATION_MOTION_TYPES
    DIRECTMANIPULATION_MOTION_NONE = 0_i32
    DIRECTMANIPULATION_MOTION_TRANSLATEX = 1_i32
    DIRECTMANIPULATION_MOTION_TRANSLATEY = 2_i32
    DIRECTMANIPULATION_MOTION_ZOOM = 4_i32
    DIRECTMANIPULATION_MOTION_CENTERX = 16_i32
    DIRECTMANIPULATION_MOTION_CENTERY = 32_i32
    DIRECTMANIPULATION_MOTION_ALL = 55_i32
  end
  enum DIRECTMANIPULATION_VIEWPORT_OPTIONS
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_DEFAULT = 0_i32
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_AUTODISABLE = 1_i32
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_MANUALUPDATE = 2_i32
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT = 4_i32
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_EXPLICITHITTEST = 8_i32
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_DISABLEPIXELSNAPPING = 16_i32
  end
  enum DIRECTMANIPULATION_SNAPPOINT_TYPE
    DIRECTMANIPULATION_SNAPPOINT_MANDATORY = 0_i32
    DIRECTMANIPULATION_SNAPPOINT_OPTIONAL = 1_i32
    DIRECTMANIPULATION_SNAPPOINT_MANDATORY_SINGLE = 2_i32
    DIRECTMANIPULATION_SNAPPOINT_OPTIONAL_SINGLE = 3_i32
  end
  enum DIRECTMANIPULATION_SNAPPOINT_COORDINATE
    DIRECTMANIPULATION_COORDINATE_BOUNDARY = 0_i32
    DIRECTMANIPULATION_COORDINATE_ORIGIN = 1_i32
    DIRECTMANIPULATION_COORDINATE_MIRRORED = 16_i32
  end
  enum DIRECTMANIPULATION_HORIZONTALALIGNMENT
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE = 0_i32
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT = 1_i32
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_CENTER = 2_i32
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT = 4_i32
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER = 8_i32
  end
  enum DIRECTMANIPULATION_VERTICALALIGNMENT
    DIRECTMANIPULATION_VERTICALALIGNMENT_NONE = 0_i32
    DIRECTMANIPULATION_VERTICALALIGNMENT_TOP = 1_i32
    DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER = 2_i32
    DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM = 4_i32
    DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER = 8_i32
  end
  enum DIRECTMANIPULATION_INPUT_MODE
    DIRECTMANIPULATION_INPUT_MODE_AUTOMATIC = 0_i32
    DIRECTMANIPULATION_INPUT_MODE_MANUAL = 1_i32
  end
  enum DIRECTMANIPULATION_DRAG_DROP_STATUS
    DIRECTMANIPULATION_DRAG_DROP_READY = 0_i32
    DIRECTMANIPULATION_DRAG_DROP_PRESELECT = 1_i32
    DIRECTMANIPULATION_DRAG_DROP_SELECTING = 2_i32
    DIRECTMANIPULATION_DRAG_DROP_DRAGGING = 3_i32
    DIRECTMANIPULATION_DRAG_DROP_CANCELLED = 4_i32
    DIRECTMANIPULATION_DRAG_DROP_COMMITTED = 5_i32
  end
  enum DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_VERTICAL = 1_i32
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HORIZONTAL = 2_i32
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_ONLY = 16_i32
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_DRAG = 32_i32
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HOLD_DRAG = 64_i32
  end
  enum DIRECTMANIPULATION_INTERACTION_TYPE
    DIRECTMANIPULATION_INTERACTION_BEGIN = 0_i32
    DIRECTMANIPULATION_INTERACTION_TYPE_MANIPULATION = 1_i32
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_TAP = 2_i32
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_HOLD = 3_i32
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_CROSS_SLIDE = 4_i32
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_PINCH_ZOOM = 5_i32
    DIRECTMANIPULATION_INTERACTION_END = 100_i32
  end
  enum DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_STOP = 0_i32
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_FORWARD = 1_i32
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_REVERSE = 2_i32
  end

  @[Extern]
  record IDirectManipulationManagerVtbl,
    query_interface : Proc(IDirectManipulationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationManager*, UInt32),
    release : Proc(IDirectManipulationManager*, UInt32),
    activate : Proc(IDirectManipulationManager*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IDirectManipulationManager*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    register_hit_test_target : Proc(IDirectManipulationManager*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HITTEST_TYPE, Win32cr::Foundation::HRESULT),
    process_input : Proc(IDirectManipulationManager*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_update_manager : Proc(IDirectManipulationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_viewport : Proc(IDirectManipulationManager*, Void*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_content : Proc(IDirectManipulationManager*, Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fbf5d3b4-70c7-4163-9322-5a6f660d6fbc")]
  record IDirectManipulationManager, lpVtbl : IDirectManipulationManagerVtbl* do
    GUID = LibC::GUID.new(0xfbf5d3b4_u32, 0x70c7_u16, 0x4163_u16, StaticArray[0x93_u8, 0x22_u8, 0x5a_u8, 0x6f_u8, 0x66_u8, 0xd_u8, 0x6f_u8, 0xbc_u8])
    def query_interface(this : IDirectManipulationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : IDirectManipulationManager*, window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, window)
    end
    def deactivate(this : IDirectManipulationManager*, window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, window)
    end
    def register_hit_test_target(this : IDirectManipulationManager*, window : Win32cr::Foundation::HWND, hitTestWindow : Win32cr::Foundation::HWND, type__ : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HITTEST_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_hit_test_target.call(this, window, hitTestWindow, type__)
    end
    def process_input(this : IDirectManipulationManager*, message : Win32cr::UI::WindowsAndMessaging::MSG*, handled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_input.call(this, message, handled)
    end
    def get_update_manager(this : IDirectManipulationManager*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_manager.call(this, riid, object)
    end
    def create_viewport(this : IDirectManipulationManager*, frameInfo : Void*, window : Win32cr::Foundation::HWND, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_viewport.call(this, frameInfo, window, riid, object)
    end
    def create_content(this : IDirectManipulationManager*, frameInfo : Void*, clsid : LibC::GUID*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_content.call(this, frameInfo, clsid, riid, object)
    end

  end

  @[Extern]
  record IDirectManipulationManager2Vtbl,
    query_interface : Proc(IDirectManipulationManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationManager2*, UInt32),
    release : Proc(IDirectManipulationManager2*, UInt32),
    activate : Proc(IDirectManipulationManager2*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IDirectManipulationManager2*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    register_hit_test_target : Proc(IDirectManipulationManager2*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HITTEST_TYPE, Win32cr::Foundation::HRESULT),
    process_input : Proc(IDirectManipulationManager2*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_update_manager : Proc(IDirectManipulationManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_viewport : Proc(IDirectManipulationManager2*, Void*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_content : Proc(IDirectManipulationManager2*, Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_behavior : Proc(IDirectManipulationManager2*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fa1005e9-3d16-484c-bfc9-62b61e56ec4e")]
  record IDirectManipulationManager2, lpVtbl : IDirectManipulationManager2Vtbl* do
    GUID = LibC::GUID.new(0xfa1005e9_u32, 0x3d16_u16, 0x484c_u16, StaticArray[0xbf_u8, 0xc9_u8, 0x62_u8, 0xb6_u8, 0x1e_u8, 0x56_u8, 0xec_u8, 0x4e_u8])
    def query_interface(this : IDirectManipulationManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : IDirectManipulationManager2*, window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, window)
    end
    def deactivate(this : IDirectManipulationManager2*, window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, window)
    end
    def register_hit_test_target(this : IDirectManipulationManager2*, window : Win32cr::Foundation::HWND, hitTestWindow : Win32cr::Foundation::HWND, type__ : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HITTEST_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_hit_test_target.call(this, window, hitTestWindow, type__)
    end
    def process_input(this : IDirectManipulationManager2*, message : Win32cr::UI::WindowsAndMessaging::MSG*, handled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_input.call(this, message, handled)
    end
    def get_update_manager(this : IDirectManipulationManager2*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_manager.call(this, riid, object)
    end
    def create_viewport(this : IDirectManipulationManager2*, frameInfo : Void*, window : Win32cr::Foundation::HWND, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_viewport.call(this, frameInfo, window, riid, object)
    end
    def create_content(this : IDirectManipulationManager2*, frameInfo : Void*, clsid : LibC::GUID*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_content.call(this, frameInfo, clsid, riid, object)
    end
    def create_behavior(this : IDirectManipulationManager2*, clsid : LibC::GUID*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_behavior.call(this, clsid, riid, object)
    end

  end

  @[Extern]
  record IDirectManipulationManager3Vtbl,
    query_interface : Proc(IDirectManipulationManager3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationManager3*, UInt32),
    release : Proc(IDirectManipulationManager3*, UInt32),
    activate : Proc(IDirectManipulationManager3*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IDirectManipulationManager3*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    register_hit_test_target : Proc(IDirectManipulationManager3*, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HITTEST_TYPE, Win32cr::Foundation::HRESULT),
    process_input : Proc(IDirectManipulationManager3*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_update_manager : Proc(IDirectManipulationManager3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_viewport : Proc(IDirectManipulationManager3*, Void*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_content : Proc(IDirectManipulationManager3*, Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_behavior : Proc(IDirectManipulationManager3*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_service : Proc(IDirectManipulationManager3*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2cb6b33d-ffe8-488c-b750-fbdfe88dca8c")]
  record IDirectManipulationManager3, lpVtbl : IDirectManipulationManager3Vtbl* do
    GUID = LibC::GUID.new(0x2cb6b33d_u32, 0xffe8_u16, 0x488c_u16, StaticArray[0xb7_u8, 0x50_u8, 0xfb_u8, 0xdf_u8, 0xe8_u8, 0x8d_u8, 0xca_u8, 0x8c_u8])
    def query_interface(this : IDirectManipulationManager3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationManager3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationManager3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : IDirectManipulationManager3*, window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, window)
    end
    def deactivate(this : IDirectManipulationManager3*, window : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, window)
    end
    def register_hit_test_target(this : IDirectManipulationManager3*, window : Win32cr::Foundation::HWND, hitTestWindow : Win32cr::Foundation::HWND, type__ : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HITTEST_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_hit_test_target.call(this, window, hitTestWindow, type__)
    end
    def process_input(this : IDirectManipulationManager3*, message : Win32cr::UI::WindowsAndMessaging::MSG*, handled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_input.call(this, message, handled)
    end
    def get_update_manager(this : IDirectManipulationManager3*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_manager.call(this, riid, object)
    end
    def create_viewport(this : IDirectManipulationManager3*, frameInfo : Void*, window : Win32cr::Foundation::HWND, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_viewport.call(this, frameInfo, window, riid, object)
    end
    def create_content(this : IDirectManipulationManager3*, frameInfo : Void*, clsid : LibC::GUID*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_content.call(this, frameInfo, clsid, riid, object)
    end
    def create_behavior(this : IDirectManipulationManager3*, clsid : LibC::GUID*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_behavior.call(this, clsid, riid, object)
    end
    def get_service(this : IDirectManipulationManager3*, clsid : LibC::GUID*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service.call(this, clsid, riid, object)
    end

  end

  @[Extern]
  record IDirectManipulationViewportVtbl,
    query_interface : Proc(IDirectManipulationViewport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationViewport*, UInt32),
    release : Proc(IDirectManipulationViewport*, UInt32),
    enable : Proc(IDirectManipulationViewport*, Win32cr::Foundation::HRESULT),
    disable : Proc(IDirectManipulationViewport*, Win32cr::Foundation::HRESULT),
    set_contact : Proc(IDirectManipulationViewport*, UInt32, Win32cr::Foundation::HRESULT),
    release_contact : Proc(IDirectManipulationViewport*, UInt32, Win32cr::Foundation::HRESULT),
    release_all_contacts : Proc(IDirectManipulationViewport*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS*, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IDirectManipulationViewport*, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IDirectManipulationViewport*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_viewport_rect : Proc(IDirectManipulationViewport*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    set_viewport_rect : Proc(IDirectManipulationViewport*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    zoom_to_rect : Proc(IDirectManipulationViewport*, Float32, Float32, Float32, Float32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_viewport_transform : Proc(IDirectManipulationViewport*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    sync_display_transform : Proc(IDirectManipulationViewport*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_primary_content : Proc(IDirectManipulationViewport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_content : Proc(IDirectManipulationViewport*, Void*, Win32cr::Foundation::HRESULT),
    remove_content : Proc(IDirectManipulationViewport*, Void*, Win32cr::Foundation::HRESULT),
    set_viewport_options : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_VIEWPORT_OPTIONS, Win32cr::Foundation::HRESULT),
    add_configuration : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION, Win32cr::Foundation::HRESULT),
    remove_configuration : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION, Win32cr::Foundation::HRESULT),
    activate_configuration : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION, Win32cr::Foundation::HRESULT),
    set_manual_gesture : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_GESTURE_CONFIGURATION, Win32cr::Foundation::HRESULT),
    set_chaining : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Win32cr::Foundation::HRESULT),
    add_event_handler : Proc(IDirectManipulationViewport*, Win32cr::Foundation::HWND, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_event_handler : Proc(IDirectManipulationViewport*, UInt32, Win32cr::Foundation::HRESULT),
    set_input_mode : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE, Win32cr::Foundation::HRESULT),
    set_update_mode : Proc(IDirectManipulationViewport*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE, Win32cr::Foundation::HRESULT),
    stop : Proc(IDirectManipulationViewport*, Win32cr::Foundation::HRESULT),
    abandon : Proc(IDirectManipulationViewport*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("28b85a3d-60a0-48bd-9ba1-5ce8d9ea3a6d")]
  record IDirectManipulationViewport, lpVtbl : IDirectManipulationViewportVtbl* do
    GUID = LibC::GUID.new(0x28b85a3d_u32, 0x60a0_u16, 0x48bd_u16, StaticArray[0x9b_u8, 0xa1_u8, 0x5c_u8, 0xe8_u8, 0xd9_u8, 0xea_u8, 0x3a_u8, 0x6d_u8])
    def query_interface(this : IDirectManipulationViewport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationViewport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationViewport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable(this : IDirectManipulationViewport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def disable(this : IDirectManipulationViewport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this)
    end
    def set_contact(this : IDirectManipulationViewport*, pointerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_contact.call(this, pointerId)
    end
    def release_contact(this : IDirectManipulationViewport*, pointerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_contact.call(this, pointerId)
    end
    def release_all_contacts(this : IDirectManipulationViewport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_all_contacts.call(this)
    end
    def get_status(this : IDirectManipulationViewport*, status : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def get_tag(this : IDirectManipulationViewport*, riid : LibC::GUID*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, riid, object, id)
    end
    def set_tag(this : IDirectManipulationViewport*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_viewport_rect(this : IDirectManipulationViewport*, viewport : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewport_rect.call(this, viewport)
    end
    def set_viewport_rect(this : IDirectManipulationViewport*, viewport : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport_rect.call(this, viewport)
    end
    def zoom_to_rect(this : IDirectManipulationViewport*, left : Float32, top : Float32, right : Float32, bottom : Float32, animate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom_to_rect.call(this, left, top, right, bottom, animate)
    end
    def set_viewport_transform(this : IDirectManipulationViewport*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport_transform.call(this, matrix, pointCount)
    end
    def sync_display_transform(this : IDirectManipulationViewport*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_display_transform.call(this, matrix, pointCount)
    end
    def get_primary_content(this : IDirectManipulationViewport*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_primary_content.call(this, riid, object)
    end
    def add_content(this : IDirectManipulationViewport*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_content.call(this, content)
    end
    def remove_content(this : IDirectManipulationViewport*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_content.call(this, content)
    end
    def set_viewport_options(this : IDirectManipulationViewport*, options : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_VIEWPORT_OPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport_options.call(this, options)
    end
    def add_configuration(this : IDirectManipulationViewport*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_configuration.call(this, configuration)
    end
    def remove_configuration(this : IDirectManipulationViewport*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_configuration.call(this, configuration)
    end
    def activate_configuration(this : IDirectManipulationViewport*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_configuration.call(this, configuration)
    end
    def set_manual_gesture(this : IDirectManipulationViewport*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_GESTURE_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_gesture.call(this, configuration)
    end
    def set_chaining(this : IDirectManipulationViewport*, enabledTypes : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_chaining.call(this, enabledTypes)
    end
    def add_event_handler(this : IDirectManipulationViewport*, window : Win32cr::Foundation::HWND, eventHandler : Void*, cookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_event_handler.call(this, window, eventHandler, cookie)
    end
    def remove_event_handler(this : IDirectManipulationViewport*, cookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_event_handler.call(this, cookie)
    end
    def set_input_mode(this : IDirectManipulationViewport*, mode : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_mode.call(this, mode)
    end
    def set_update_mode(this : IDirectManipulationViewport*, mode : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_update_mode.call(this, mode)
    end
    def stop(this : IDirectManipulationViewport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def abandon(this : IDirectManipulationViewport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abandon.call(this)
    end

  end

  @[Extern]
  record IDirectManipulationViewport2Vtbl,
    query_interface : Proc(IDirectManipulationViewport2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationViewport2*, UInt32),
    release : Proc(IDirectManipulationViewport2*, UInt32),
    enable : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HRESULT),
    disable : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HRESULT),
    set_contact : Proc(IDirectManipulationViewport2*, UInt32, Win32cr::Foundation::HRESULT),
    release_contact : Proc(IDirectManipulationViewport2*, UInt32, Win32cr::Foundation::HRESULT),
    release_all_contacts : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS*, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IDirectManipulationViewport2*, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IDirectManipulationViewport2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_viewport_rect : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    set_viewport_rect : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    zoom_to_rect : Proc(IDirectManipulationViewport2*, Float32, Float32, Float32, Float32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_viewport_transform : Proc(IDirectManipulationViewport2*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    sync_display_transform : Proc(IDirectManipulationViewport2*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_primary_content : Proc(IDirectManipulationViewport2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_content : Proc(IDirectManipulationViewport2*, Void*, Win32cr::Foundation::HRESULT),
    remove_content : Proc(IDirectManipulationViewport2*, Void*, Win32cr::Foundation::HRESULT),
    set_viewport_options : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_VIEWPORT_OPTIONS, Win32cr::Foundation::HRESULT),
    add_configuration : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION, Win32cr::Foundation::HRESULT),
    remove_configuration : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION, Win32cr::Foundation::HRESULT),
    activate_configuration : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION, Win32cr::Foundation::HRESULT),
    set_manual_gesture : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_GESTURE_CONFIGURATION, Win32cr::Foundation::HRESULT),
    set_chaining : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Win32cr::Foundation::HRESULT),
    add_event_handler : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HWND, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_event_handler : Proc(IDirectManipulationViewport2*, UInt32, Win32cr::Foundation::HRESULT),
    set_input_mode : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE, Win32cr::Foundation::HRESULT),
    set_update_mode : Proc(IDirectManipulationViewport2*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE, Win32cr::Foundation::HRESULT),
    stop : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HRESULT),
    abandon : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HRESULT),
    add_behavior : Proc(IDirectManipulationViewport2*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_behavior : Proc(IDirectManipulationViewport2*, UInt32, Win32cr::Foundation::HRESULT),
    remove_all_behaviors : Proc(IDirectManipulationViewport2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("923ccaac-61e1-4385-b726-017af189882a")]
  record IDirectManipulationViewport2, lpVtbl : IDirectManipulationViewport2Vtbl* do
    GUID = LibC::GUID.new(0x923ccaac_u32, 0x61e1_u16, 0x4385_u16, StaticArray[0xb7_u8, 0x26_u8, 0x1_u8, 0x7a_u8, 0xf1_u8, 0x89_u8, 0x88_u8, 0x2a_u8])
    def query_interface(this : IDirectManipulationViewport2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationViewport2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationViewport2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable(this : IDirectManipulationViewport2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def disable(this : IDirectManipulationViewport2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this)
    end
    def set_contact(this : IDirectManipulationViewport2*, pointerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_contact.call(this, pointerId)
    end
    def release_contact(this : IDirectManipulationViewport2*, pointerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_contact.call(this, pointerId)
    end
    def release_all_contacts(this : IDirectManipulationViewport2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_all_contacts.call(this)
    end
    def get_status(this : IDirectManipulationViewport2*, status : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def get_tag(this : IDirectManipulationViewport2*, riid : LibC::GUID*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, riid, object, id)
    end
    def set_tag(this : IDirectManipulationViewport2*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_viewport_rect(this : IDirectManipulationViewport2*, viewport : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewport_rect.call(this, viewport)
    end
    def set_viewport_rect(this : IDirectManipulationViewport2*, viewport : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport_rect.call(this, viewport)
    end
    def zoom_to_rect(this : IDirectManipulationViewport2*, left : Float32, top : Float32, right : Float32, bottom : Float32, animate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom_to_rect.call(this, left, top, right, bottom, animate)
    end
    def set_viewport_transform(this : IDirectManipulationViewport2*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport_transform.call(this, matrix, pointCount)
    end
    def sync_display_transform(this : IDirectManipulationViewport2*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_display_transform.call(this, matrix, pointCount)
    end
    def get_primary_content(this : IDirectManipulationViewport2*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_primary_content.call(this, riid, object)
    end
    def add_content(this : IDirectManipulationViewport2*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_content.call(this, content)
    end
    def remove_content(this : IDirectManipulationViewport2*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_content.call(this, content)
    end
    def set_viewport_options(this : IDirectManipulationViewport2*, options : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_VIEWPORT_OPTIONS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_viewport_options.call(this, options)
    end
    def add_configuration(this : IDirectManipulationViewport2*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_configuration.call(this, configuration)
    end
    def remove_configuration(this : IDirectManipulationViewport2*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_configuration.call(this, configuration)
    end
    def activate_configuration(this : IDirectManipulationViewport2*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_configuration.call(this, configuration)
    end
    def set_manual_gesture(this : IDirectManipulationViewport2*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_GESTURE_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_gesture.call(this, configuration)
    end
    def set_chaining(this : IDirectManipulationViewport2*, enabledTypes : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_chaining.call(this, enabledTypes)
    end
    def add_event_handler(this : IDirectManipulationViewport2*, window : Win32cr::Foundation::HWND, eventHandler : Void*, cookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_event_handler.call(this, window, eventHandler, cookie)
    end
    def remove_event_handler(this : IDirectManipulationViewport2*, cookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_event_handler.call(this, cookie)
    end
    def set_input_mode(this : IDirectManipulationViewport2*, mode : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_mode.call(this, mode)
    end
    def set_update_mode(this : IDirectManipulationViewport2*, mode : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INPUT_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_update_mode.call(this, mode)
    end
    def stop(this : IDirectManipulationViewport2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def abandon(this : IDirectManipulationViewport2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abandon.call(this)
    end
    def add_behavior(this : IDirectManipulationViewport2*, behavior : Void*, cookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_behavior.call(this, behavior, cookie)
    end
    def remove_behavior(this : IDirectManipulationViewport2*, cookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_behavior.call(this, cookie)
    end
    def remove_all_behaviors(this : IDirectManipulationViewport2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_behaviors.call(this)
    end

  end

  @[Extern]
  record IDirectManipulationViewportEventHandlerVtbl,
    query_interface : Proc(IDirectManipulationViewportEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationViewportEventHandler*, UInt32),
    release : Proc(IDirectManipulationViewportEventHandler*, UInt32),
    on_viewport_status_changed : Proc(IDirectManipulationViewportEventHandler*, Void*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS, Win32cr::Foundation::HRESULT),
    on_viewport_updated : Proc(IDirectManipulationViewportEventHandler*, Void*, Win32cr::Foundation::HRESULT),
    on_content_updated : Proc(IDirectManipulationViewportEventHandler*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("952121da-d69f-45f9-b0f9-f23944321a6d")]
  record IDirectManipulationViewportEventHandler, lpVtbl : IDirectManipulationViewportEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x952121da_u32, 0xd69f_u16, 0x45f9_u16, StaticArray[0xb0_u8, 0xf9_u8, 0xf2_u8, 0x39_u8, 0x44_u8, 0x32_u8, 0x1a_u8, 0x6d_u8])
    def query_interface(this : IDirectManipulationViewportEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationViewportEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationViewportEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_viewport_status_changed(this : IDirectManipulationViewportEventHandler*, viewport : Void*, current : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS, previous : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_viewport_status_changed.call(this, viewport, current, previous)
    end
    def on_viewport_updated(this : IDirectManipulationViewportEventHandler*, viewport : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_viewport_updated.call(this, viewport)
    end
    def on_content_updated(this : IDirectManipulationViewportEventHandler*, viewport : Void*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_content_updated.call(this, viewport, content)
    end

  end

  @[Extern]
  record IDirectManipulationContentVtbl,
    query_interface : Proc(IDirectManipulationContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationContent*, UInt32),
    release : Proc(IDirectManipulationContent*, UInt32),
    get_content_rect : Proc(IDirectManipulationContent*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    set_content_rect : Proc(IDirectManipulationContent*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_viewport : Proc(IDirectManipulationContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IDirectManipulationContent*, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IDirectManipulationContent*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_output_transform : Proc(IDirectManipulationContent*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_content_transform : Proc(IDirectManipulationContent*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    sync_content_transform : Proc(IDirectManipulationContent*, Float32*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b89962cb-3d89-442b-bb58-5098fa0f9f16")]
  record IDirectManipulationContent, lpVtbl : IDirectManipulationContentVtbl* do
    GUID = LibC::GUID.new(0xb89962cb_u32, 0x3d89_u16, 0x442b_u16, StaticArray[0xbb_u8, 0x58_u8, 0x50_u8, 0x98_u8, 0xfa_u8, 0xf_u8, 0x9f_u8, 0x16_u8])
    def query_interface(this : IDirectManipulationContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_content_rect(this : IDirectManipulationContent*, contentSize : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_rect.call(this, contentSize)
    end
    def set_content_rect(this : IDirectManipulationContent*, contentSize : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content_rect.call(this, contentSize)
    end
    def get_viewport(this : IDirectManipulationContent*, riid : LibC::GUID*, object : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_viewport.call(this, riid, object)
    end
    def get_tag(this : IDirectManipulationContent*, riid : LibC::GUID*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, riid, object, id)
    end
    def set_tag(this : IDirectManipulationContent*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_output_transform(this : IDirectManipulationContent*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_transform.call(this, matrix, pointCount)
    end
    def get_content_transform(this : IDirectManipulationContent*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_content_transform.call(this, matrix, pointCount)
    end
    def sync_content_transform(this : IDirectManipulationContent*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sync_content_transform.call(this, matrix, pointCount)
    end

  end

  @[Extern]
  record IDirectManipulationPrimaryContentVtbl,
    query_interface : Proc(IDirectManipulationPrimaryContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationPrimaryContent*, UInt32),
    release : Proc(IDirectManipulationPrimaryContent*, UInt32),
    set_snap_interval : Proc(IDirectManipulationPrimaryContent*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Float32, Float32, Win32cr::Foundation::HRESULT),
    set_snap_points : Proc(IDirectManipulationPrimaryContent*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    set_snap_type : Proc(IDirectManipulationPrimaryContent*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_SNAPPOINT_TYPE, Win32cr::Foundation::HRESULT),
    set_snap_coordinate : Proc(IDirectManipulationPrimaryContent*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_SNAPPOINT_COORDINATE, Float32, Win32cr::Foundation::HRESULT),
    set_zoom_boundaries : Proc(IDirectManipulationPrimaryContent*, Float32, Float32, Win32cr::Foundation::HRESULT),
    set_horizontal_alignment : Proc(IDirectManipulationPrimaryContent*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HORIZONTALALIGNMENT, Win32cr::Foundation::HRESULT),
    set_vertical_alignment : Proc(IDirectManipulationPrimaryContent*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_VERTICALALIGNMENT, Win32cr::Foundation::HRESULT),
    get_inertia_end_transform : Proc(IDirectManipulationPrimaryContent*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    get_center_point : Proc(IDirectManipulationPrimaryContent*, Float32*, Float32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c12851e4-1698-4625-b9b1-7ca3ec18630b")]
  record IDirectManipulationPrimaryContent, lpVtbl : IDirectManipulationPrimaryContentVtbl* do
    GUID = LibC::GUID.new(0xc12851e4_u32, 0x1698_u16, 0x4625_u16, StaticArray[0xb9_u8, 0xb1_u8, 0x7c_u8, 0xa3_u8, 0xec_u8, 0x18_u8, 0x63_u8, 0xb_u8])
    def query_interface(this : IDirectManipulationPrimaryContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationPrimaryContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationPrimaryContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_snap_interval(this : IDirectManipulationPrimaryContent*, motion : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, interval : Float32, offset : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snap_interval.call(this, motion, interval, offset)
    end
    def set_snap_points(this : IDirectManipulationPrimaryContent*, motion : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, points : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snap_points.call(this, motion, points, pointCount)
    end
    def set_snap_type(this : IDirectManipulationPrimaryContent*, motion : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, type__ : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_SNAPPOINT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snap_type.call(this, motion, type__)
    end
    def set_snap_coordinate(this : IDirectManipulationPrimaryContent*, motion : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, coordinate : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_SNAPPOINT_COORDINATE, origin : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_snap_coordinate.call(this, motion, coordinate, origin)
    end
    def set_zoom_boundaries(this : IDirectManipulationPrimaryContent*, zoomMinimum : Float32, zoomMaximum : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_zoom_boundaries.call(this, zoomMinimum, zoomMaximum)
    end
    def set_horizontal_alignment(this : IDirectManipulationPrimaryContent*, alignment : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_HORIZONTALALIGNMENT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_horizontal_alignment.call(this, alignment)
    end
    def set_vertical_alignment(this : IDirectManipulationPrimaryContent*, alignment : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_VERTICALALIGNMENT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_vertical_alignment.call(this, alignment)
    end
    def get_inertia_end_transform(this : IDirectManipulationPrimaryContent*, matrix : Float32*, pointCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inertia_end_transform.call(this, matrix, pointCount)
    end
    def get_center_point(this : IDirectManipulationPrimaryContent*, centerX : Float32*, centerY : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_center_point.call(this, centerX, centerY)
    end

  end

  @[Extern]
  record IDirectManipulationDragDropEventHandlerVtbl,
    query_interface : Proc(IDirectManipulationDragDropEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationDragDropEventHandler*, UInt32),
    release : Proc(IDirectManipulationDragDropEventHandler*, UInt32),
    on_drag_drop_status_change : Proc(IDirectManipulationDragDropEventHandler*, Void*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_STATUS, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_STATUS, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1fa11b10-701b-41ae-b5f2-49e36bd595aa")]
  record IDirectManipulationDragDropEventHandler, lpVtbl : IDirectManipulationDragDropEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x1fa11b10_u32, 0x701b_u16, 0x41ae_u16, StaticArray[0xb5_u8, 0xf2_u8, 0x49_u8, 0xe3_u8, 0x6b_u8, 0xd5_u8, 0x95_u8, 0xaa_u8])
    def query_interface(this : IDirectManipulationDragDropEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationDragDropEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationDragDropEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_drag_drop_status_change(this : IDirectManipulationDragDropEventHandler*, viewport : Void*, current : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_STATUS, previous : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_drag_drop_status_change.call(this, viewport, current, previous)
    end

  end

  @[Extern]
  record IDirectManipulationDragDropBehaviorVtbl,
    query_interface : Proc(IDirectManipulationDragDropBehavior*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationDragDropBehavior*, UInt32),
    release : Proc(IDirectManipulationDragDropBehavior*, UInt32),
    set_configuration : Proc(IDirectManipulationDragDropBehavior*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDirectManipulationDragDropBehavior*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("814b5af5-c2c8-4270-a9b7-a198ce8d02fa")]
  record IDirectManipulationDragDropBehavior, lpVtbl : IDirectManipulationDragDropBehaviorVtbl* do
    GUID = LibC::GUID.new(0x814b5af5_u32, 0xc2c8_u16, 0x4270_u16, StaticArray[0xa9_u8, 0xb7_u8, 0xa1_u8, 0x98_u8, 0xce_u8, 0x8d_u8, 0x2_u8, 0xfa_u8])
    def query_interface(this : IDirectManipulationDragDropBehavior*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationDragDropBehavior*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationDragDropBehavior*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_configuration(this : IDirectManipulationDragDropBehavior*, configuration : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_configuration.call(this, configuration)
    end
    def get_status(this : IDirectManipulationDragDropBehavior*, status : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_DRAG_DROP_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end

  end

  @[Extern]
  record IDirectManipulationInteractionEventHandlerVtbl,
    query_interface : Proc(IDirectManipulationInteractionEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationInteractionEventHandler*, UInt32),
    release : Proc(IDirectManipulationInteractionEventHandler*, UInt32),
    on_interaction : Proc(IDirectManipulationInteractionEventHandler*, Void*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INTERACTION_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e43f45b8-42b4-403e-b1f2-273b8f510830")]
  record IDirectManipulationInteractionEventHandler, lpVtbl : IDirectManipulationInteractionEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xe43f45b8_u32, 0x42b4_u16, 0x403e_u16, StaticArray[0xb1_u8, 0xf2_u8, 0x27_u8, 0x3b_u8, 0x8f_u8, 0x51_u8, 0x8_u8, 0x30_u8])
    def query_interface(this : IDirectManipulationInteractionEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationInteractionEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationInteractionEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_interaction(this : IDirectManipulationInteractionEventHandler*, viewport : Void*, interaction : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_INTERACTION_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_interaction.call(this, viewport, interaction)
    end

  end

  @[Extern]
  record IDirectManipulationFrameInfoProviderVtbl,
    query_interface : Proc(IDirectManipulationFrameInfoProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationFrameInfoProvider*, UInt32),
    release : Proc(IDirectManipulationFrameInfoProvider*, UInt32),
    get_next_frame_info : Proc(IDirectManipulationFrameInfoProvider*, UInt64*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fb759dba-6f4c-4c01-874e-19c8a05907f9")]
  record IDirectManipulationFrameInfoProvider, lpVtbl : IDirectManipulationFrameInfoProviderVtbl* do
    GUID = LibC::GUID.new(0xfb759dba_u32, 0x6f4c_u16, 0x4c01_u16, StaticArray[0x87_u8, 0x4e_u8, 0x19_u8, 0xc8_u8, 0xa0_u8, 0x59_u8, 0x7_u8, 0xf9_u8])
    def query_interface(this : IDirectManipulationFrameInfoProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationFrameInfoProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationFrameInfoProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_next_frame_info(this : IDirectManipulationFrameInfoProvider*, time : UInt64*, processTime : UInt64*, compositionTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_frame_info.call(this, time, processTime, compositionTime)
    end

  end

  @[Extern]
  record IDirectManipulationCompositorVtbl,
    query_interface : Proc(IDirectManipulationCompositor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationCompositor*, UInt32),
    release : Proc(IDirectManipulationCompositor*, UInt32),
    add_content : Proc(IDirectManipulationCompositor*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_content : Proc(IDirectManipulationCompositor*, Void*, Win32cr::Foundation::HRESULT),
    set_update_manager : Proc(IDirectManipulationCompositor*, Void*, Win32cr::Foundation::HRESULT),
    flush : Proc(IDirectManipulationCompositor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("537a0825-0387-4efa-b62f-71eb1f085a7e")]
  record IDirectManipulationCompositor, lpVtbl : IDirectManipulationCompositorVtbl* do
    GUID = LibC::GUID.new(0x537a0825_u32, 0x387_u16, 0x4efa_u16, StaticArray[0xb6_u8, 0x2f_u8, 0x71_u8, 0xeb_u8, 0x1f_u8, 0x8_u8, 0x5a_u8, 0x7e_u8])
    def query_interface(this : IDirectManipulationCompositor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationCompositor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationCompositor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_content(this : IDirectManipulationCompositor*, content : Void*, device : Void*, parentVisual : Void*, childVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_content.call(this, content, device, parentVisual, childVisual)
    end
    def remove_content(this : IDirectManipulationCompositor*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_content.call(this, content)
    end
    def set_update_manager(this : IDirectManipulationCompositor*, updateManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_update_manager.call(this, updateManager)
    end
    def flush(this : IDirectManipulationCompositor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end

  end

  @[Extern]
  record IDirectManipulationCompositor2Vtbl,
    query_interface : Proc(IDirectManipulationCompositor2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationCompositor2*, UInt32),
    release : Proc(IDirectManipulationCompositor2*, UInt32),
    add_content : Proc(IDirectManipulationCompositor2*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_content : Proc(IDirectManipulationCompositor2*, Void*, Win32cr::Foundation::HRESULT),
    set_update_manager : Proc(IDirectManipulationCompositor2*, Void*, Win32cr::Foundation::HRESULT),
    flush : Proc(IDirectManipulationCompositor2*, Win32cr::Foundation::HRESULT),
    add_content_with_cross_process_chaining : Proc(IDirectManipulationCompositor2*, Void*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d38c7822-f1cb-43cb-b4b9-ac0c767a412e")]
  record IDirectManipulationCompositor2, lpVtbl : IDirectManipulationCompositor2Vtbl* do
    GUID = LibC::GUID.new(0xd38c7822_u32, 0xf1cb_u16, 0x43cb_u16, StaticArray[0xb4_u8, 0xb9_u8, 0xac_u8, 0xc_u8, 0x76_u8, 0x7a_u8, 0x41_u8, 0x2e_u8])
    def query_interface(this : IDirectManipulationCompositor2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationCompositor2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationCompositor2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_content(this : IDirectManipulationCompositor2*, content : Void*, device : Void*, parentVisual : Void*, childVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_content.call(this, content, device, parentVisual, childVisual)
    end
    def remove_content(this : IDirectManipulationCompositor2*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_content.call(this, content)
    end
    def set_update_manager(this : IDirectManipulationCompositor2*, updateManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_update_manager.call(this, updateManager)
    end
    def flush(this : IDirectManipulationCompositor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def add_content_with_cross_process_chaining(this : IDirectManipulationCompositor2*, content : Void*, device : Void*, parentVisual : Void*, childVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_content_with_cross_process_chaining.call(this, content, device, parentVisual, childVisual)
    end

  end

  @[Extern]
  record IDirectManipulationUpdateHandlerVtbl,
    query_interface : Proc(IDirectManipulationUpdateHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationUpdateHandler*, UInt32),
    release : Proc(IDirectManipulationUpdateHandler*, UInt32),
    update : Proc(IDirectManipulationUpdateHandler*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("790b6337-64f8-4ff5-a269-b32bc2af27a7")]
  record IDirectManipulationUpdateHandler, lpVtbl : IDirectManipulationUpdateHandlerVtbl* do
    GUID = LibC::GUID.new(0x790b6337_u32, 0x64f8_u16, 0x4ff5_u16, StaticArray[0xa2_u8, 0x69_u8, 0xb3_u8, 0x2b_u8, 0xc2_u8, 0xaf_u8, 0x27_u8, 0xa7_u8])
    def query_interface(this : IDirectManipulationUpdateHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationUpdateHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationUpdateHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def update(this : IDirectManipulationUpdateHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this)
    end

  end

  @[Extern]
  record IDirectManipulationUpdateManagerVtbl,
    query_interface : Proc(IDirectManipulationUpdateManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationUpdateManager*, UInt32),
    release : Proc(IDirectManipulationUpdateManager*, UInt32),
    register_wait_handle_callback : Proc(IDirectManipulationUpdateManager*, Win32cr::Foundation::HANDLE, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_wait_handle_callback : Proc(IDirectManipulationUpdateManager*, UInt32, Win32cr::Foundation::HRESULT),
    update : Proc(IDirectManipulationUpdateManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b0ae62fd-be34-46e7-9caa-d361facbb9cc")]
  record IDirectManipulationUpdateManager, lpVtbl : IDirectManipulationUpdateManagerVtbl* do
    GUID = LibC::GUID.new(0xb0ae62fd_u32, 0xbe34_u16, 0x46e7_u16, StaticArray[0x9c_u8, 0xaa_u8, 0xd3_u8, 0x61_u8, 0xfa_u8, 0xcb_u8, 0xb9_u8, 0xcc_u8])
    def query_interface(this : IDirectManipulationUpdateManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationUpdateManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationUpdateManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_wait_handle_callback(this : IDirectManipulationUpdateManager*, handle : Win32cr::Foundation::HANDLE, eventHandler : Void*, cookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_wait_handle_callback.call(this, handle, eventHandler, cookie)
    end
    def unregister_wait_handle_callback(this : IDirectManipulationUpdateManager*, cookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_wait_handle_callback.call(this, cookie)
    end
    def update(this : IDirectManipulationUpdateManager*, frameInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this, frameInfo)
    end

  end

  @[Extern]
  record IDirectManipulationAutoScrollBehaviorVtbl,
    query_interface : Proc(IDirectManipulationAutoScrollBehavior*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationAutoScrollBehavior*, UInt32),
    release : Proc(IDirectManipulationAutoScrollBehavior*, UInt32),
    set_configuration : Proc(IDirectManipulationAutoScrollBehavior*, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6d5954d4-2003-4356-9b31-d051c9ff0af7")]
  record IDirectManipulationAutoScrollBehavior, lpVtbl : IDirectManipulationAutoScrollBehaviorVtbl* do
    GUID = LibC::GUID.new(0x6d5954d4_u32, 0x2003_u16, 0x4356_u16, StaticArray[0x9b_u8, 0x31_u8, 0xd0_u8, 0x51_u8, 0xc9_u8, 0xff_u8, 0xa_u8, 0xf7_u8])
    def query_interface(this : IDirectManipulationAutoScrollBehavior*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationAutoScrollBehavior*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationAutoScrollBehavior*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_configuration(this : IDirectManipulationAutoScrollBehavior*, motionTypes : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_MOTION_TYPES, scrollMotion : Win32cr::Graphics::DirectManipulation::DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_configuration.call(this, motionTypes, scrollMotion)
    end

  end

  @[Extern]
  record IDirectManipulationDeferContactServiceVtbl,
    query_interface : Proc(IDirectManipulationDeferContactService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDirectManipulationDeferContactService*, UInt32),
    release : Proc(IDirectManipulationDeferContactService*, UInt32),
    defer_contact : Proc(IDirectManipulationDeferContactService*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    cancel_contact : Proc(IDirectManipulationDeferContactService*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_deferral : Proc(IDirectManipulationDeferContactService*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("652d5c71-fe60-4a98-be70-e5f21291e7f1")]
  record IDirectManipulationDeferContactService, lpVtbl : IDirectManipulationDeferContactServiceVtbl* do
    GUID = LibC::GUID.new(0x652d5c71_u32, 0xfe60_u16, 0x4a98_u16, StaticArray[0xbe_u8, 0x70_u8, 0xe5_u8, 0xf2_u8, 0x12_u8, 0x91_u8, 0xe7_u8, 0xf1_u8])
    def query_interface(this : IDirectManipulationDeferContactService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDirectManipulationDeferContactService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDirectManipulationDeferContactService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def defer_contact(this : IDirectManipulationDeferContactService*, pointerId : UInt32, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.defer_contact.call(this, pointerId, timeout)
    end
    def cancel_contact(this : IDirectManipulationDeferContactService*, pointerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_contact.call(this, pointerId)
    end
    def cancel_deferral(this : IDirectManipulationDeferContactService*, pointerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_deferral.call(this, pointerId)
    end

  end

end