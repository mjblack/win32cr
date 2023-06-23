require "../system/com.cr"
require "../foundation.cr"
require "../ui/windowsandmessaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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


  enum DIRECTMANIPULATION_STATUS : Int32
    DIRECTMANIPULATION_BUILDING = 0
    DIRECTMANIPULATION_ENABLED = 1
    DIRECTMANIPULATION_DISABLED = 2
    DIRECTMANIPULATION_RUNNING = 3
    DIRECTMANIPULATION_INERTIA = 4
    DIRECTMANIPULATION_READY = 5
    DIRECTMANIPULATION_SUSPENDED = 6
  end

  enum DIRECTMANIPULATION_HITTEST_TYPE : Int32
    DIRECTMANIPULATION_HITTEST_TYPE_ASYNCHRONOUS = 0
    DIRECTMANIPULATION_HITTEST_TYPE_SYNCHRONOUS = 1
    DIRECTMANIPULATION_HITTEST_TYPE_AUTO_SYNCHRONOUS = 2
  end

  enum DIRECTMANIPULATION_CONFIGURATION : Int32
    DIRECTMANIPULATION_CONFIGURATION_NONE = 0
    DIRECTMANIPULATION_CONFIGURATION_INTERACTION = 1
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X = 2
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y = 4
    DIRECTMANIPULATION_CONFIGURATION_SCALING = 16
    DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_INERTIA = 32
    DIRECTMANIPULATION_CONFIGURATION_SCALING_INERTIA = 128
    DIRECTMANIPULATION_CONFIGURATION_RAILS_X = 256
    DIRECTMANIPULATION_CONFIGURATION_RAILS_Y = 512
  end

  enum DIRECTMANIPULATION_GESTURE_CONFIGURATION : Int32
    DIRECTMANIPULATION_GESTURE_NONE = 0
    DIRECTMANIPULATION_GESTURE_DEFAULT = 0
    DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_VERTICAL = 8
    DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_HORIZONTAL = 16
    DIRECTMANIPULATION_GESTURE_PINCH_ZOOM = 32
  end

  enum DIRECTMANIPULATION_MOTION_TYPES : Int32
    DIRECTMANIPULATION_MOTION_NONE = 0
    DIRECTMANIPULATION_MOTION_TRANSLATEX = 1
    DIRECTMANIPULATION_MOTION_TRANSLATEY = 2
    DIRECTMANIPULATION_MOTION_ZOOM = 4
    DIRECTMANIPULATION_MOTION_CENTERX = 16
    DIRECTMANIPULATION_MOTION_CENTERY = 32
    DIRECTMANIPULATION_MOTION_ALL = 55
  end

  enum DIRECTMANIPULATION_VIEWPORT_OPTIONS : Int32
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_DEFAULT = 0
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_AUTODISABLE = 1
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_MANUALUPDATE = 2
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT = 4
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_EXPLICITHITTEST = 8
    DIRECTMANIPULATION_VIEWPORT_OPTIONS_DISABLEPIXELSNAPPING = 16
  end

  enum DIRECTMANIPULATION_SNAPPOINT_TYPE : Int32
    DIRECTMANIPULATION_SNAPPOINT_MANDATORY = 0
    DIRECTMANIPULATION_SNAPPOINT_OPTIONAL = 1
    DIRECTMANIPULATION_SNAPPOINT_MANDATORY_SINGLE = 2
    DIRECTMANIPULATION_SNAPPOINT_OPTIONAL_SINGLE = 3
  end

  enum DIRECTMANIPULATION_SNAPPOINT_COORDINATE : Int32
    DIRECTMANIPULATION_COORDINATE_BOUNDARY = 0
    DIRECTMANIPULATION_COORDINATE_ORIGIN = 1
    DIRECTMANIPULATION_COORDINATE_MIRRORED = 16
  end

  enum DIRECTMANIPULATION_HORIZONTALALIGNMENT : Int32
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE = 0
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT = 1
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_CENTER = 2
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT = 4
    DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER = 8
  end

  enum DIRECTMANIPULATION_VERTICALALIGNMENT : Int32
    DIRECTMANIPULATION_VERTICALALIGNMENT_NONE = 0
    DIRECTMANIPULATION_VERTICALALIGNMENT_TOP = 1
    DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER = 2
    DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM = 4
    DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER = 8
  end

  enum DIRECTMANIPULATION_INPUT_MODE : Int32
    DIRECTMANIPULATION_INPUT_MODE_AUTOMATIC = 0
    DIRECTMANIPULATION_INPUT_MODE_MANUAL = 1
  end

  enum DIRECTMANIPULATION_DRAG_DROP_STATUS : Int32
    DIRECTMANIPULATION_DRAG_DROP_READY = 0
    DIRECTMANIPULATION_DRAG_DROP_PRESELECT = 1
    DIRECTMANIPULATION_DRAG_DROP_SELECTING = 2
    DIRECTMANIPULATION_DRAG_DROP_DRAGGING = 3
    DIRECTMANIPULATION_DRAG_DROP_CANCELLED = 4
    DIRECTMANIPULATION_DRAG_DROP_COMMITTED = 5
  end

  enum DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION : Int32
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_VERTICAL = 1
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HORIZONTAL = 2
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_ONLY = 16
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_SELECT_DRAG = 32
    DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION_HOLD_DRAG = 64
  end

  enum DIRECTMANIPULATION_INTERACTION_TYPE : Int32
    DIRECTMANIPULATION_INTERACTION_BEGIN = 0
    DIRECTMANIPULATION_INTERACTION_TYPE_MANIPULATION = 1
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_TAP = 2
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_HOLD = 3
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_CROSS_SLIDE = 4
    DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_PINCH_ZOOM = 5
    DIRECTMANIPULATION_INTERACTION_END = 100
  end

  enum DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION : Int32
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_STOP = 0
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_FORWARD = 1
    DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_REVERSE = 2
  end


  struct IDirectManipulationManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    register_hit_test_target : UInt64
    process_input : UInt64
    get_update_manager : UInt64
    create_viewport : UInt64
    create_content : UInt64
  end

  IDirectManipulationManager_GUID = "fbf5d3b4-70c7-4163-9322-5a6f660d6fbc"
  IID_IDirectManipulationManager = LibC::GUID.new(0xfbf5d3b4_u32, 0x70c7_u16, 0x4163_u16, StaticArray[0x93_u8, 0x22_u8, 0x5a_u8, 0x6f_u8, 0x66_u8, 0xd_u8, 0x6f_u8, 0xbc_u8])
  struct IDirectManipulationManager
    lpVtbl : IDirectManipulationManagerVTbl*
  end

  struct IDirectManipulationManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    register_hit_test_target : UInt64
    process_input : UInt64
    get_update_manager : UInt64
    create_viewport : UInt64
    create_content : UInt64
    create_behavior : UInt64
  end

  IDirectManipulationManager2_GUID = "fa1005e9-3d16-484c-bfc9-62b61e56ec4e"
  IID_IDirectManipulationManager2 = LibC::GUID.new(0xfa1005e9_u32, 0x3d16_u16, 0x484c_u16, StaticArray[0xbf_u8, 0xc9_u8, 0x62_u8, 0xb6_u8, 0x1e_u8, 0x56_u8, 0xec_u8, 0x4e_u8])
  struct IDirectManipulationManager2
    lpVtbl : IDirectManipulationManager2VTbl*
  end

  struct IDirectManipulationManager3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    register_hit_test_target : UInt64
    process_input : UInt64
    get_update_manager : UInt64
    create_viewport : UInt64
    create_content : UInt64
    create_behavior : UInt64
    get_service : UInt64
  end

  IDirectManipulationManager3_GUID = "2cb6b33d-ffe8-488c-b750-fbdfe88dca8c"
  IID_IDirectManipulationManager3 = LibC::GUID.new(0x2cb6b33d_u32, 0xffe8_u16, 0x488c_u16, StaticArray[0xb7_u8, 0x50_u8, 0xfb_u8, 0xdf_u8, 0xe8_u8, 0x8d_u8, 0xca_u8, 0x8c_u8])
  struct IDirectManipulationManager3
    lpVtbl : IDirectManipulationManager3VTbl*
  end

  struct IDirectManipulationViewportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable : UInt64
    disable : UInt64
    set_contact : UInt64
    release_contact : UInt64
    release_all_contacts : UInt64
    get_status : UInt64
    get_tag : UInt64
    set_tag : UInt64
    get_viewport_rect : UInt64
    set_viewport_rect : UInt64
    zoom_to_rect : UInt64
    set_viewport_transform : UInt64
    sync_display_transform : UInt64
    get_primary_content : UInt64
    add_content : UInt64
    remove_content : UInt64
    set_viewport_options : UInt64
    add_configuration : UInt64
    remove_configuration : UInt64
    activate_configuration : UInt64
    set_manual_gesture : UInt64
    set_chaining : UInt64
    add_event_handler : UInt64
    remove_event_handler : UInt64
    set_input_mode : UInt64
    set_update_mode : UInt64
    stop : UInt64
    abandon : UInt64
  end

  IDirectManipulationViewport_GUID = "28b85a3d-60a0-48bd-9ba1-5ce8d9ea3a6d"
  IID_IDirectManipulationViewport = LibC::GUID.new(0x28b85a3d_u32, 0x60a0_u16, 0x48bd_u16, StaticArray[0x9b_u8, 0xa1_u8, 0x5c_u8, 0xe8_u8, 0xd9_u8, 0xea_u8, 0x3a_u8, 0x6d_u8])
  struct IDirectManipulationViewport
    lpVtbl : IDirectManipulationViewportVTbl*
  end

  struct IDirectManipulationViewport2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable : UInt64
    disable : UInt64
    set_contact : UInt64
    release_contact : UInt64
    release_all_contacts : UInt64
    get_status : UInt64
    get_tag : UInt64
    set_tag : UInt64
    get_viewport_rect : UInt64
    set_viewport_rect : UInt64
    zoom_to_rect : UInt64
    set_viewport_transform : UInt64
    sync_display_transform : UInt64
    get_primary_content : UInt64
    add_content : UInt64
    remove_content : UInt64
    set_viewport_options : UInt64
    add_configuration : UInt64
    remove_configuration : UInt64
    activate_configuration : UInt64
    set_manual_gesture : UInt64
    set_chaining : UInt64
    add_event_handler : UInt64
    remove_event_handler : UInt64
    set_input_mode : UInt64
    set_update_mode : UInt64
    stop : UInt64
    abandon : UInt64
    add_behavior : UInt64
    remove_behavior : UInt64
    remove_all_behaviors : UInt64
  end

  IDirectManipulationViewport2_GUID = "923ccaac-61e1-4385-b726-017af189882a"
  IID_IDirectManipulationViewport2 = LibC::GUID.new(0x923ccaac_u32, 0x61e1_u16, 0x4385_u16, StaticArray[0xb7_u8, 0x26_u8, 0x1_u8, 0x7a_u8, 0xf1_u8, 0x89_u8, 0x88_u8, 0x2a_u8])
  struct IDirectManipulationViewport2
    lpVtbl : IDirectManipulationViewport2VTbl*
  end

  struct IDirectManipulationViewportEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_viewport_status_changed : UInt64
    on_viewport_updated : UInt64
    on_content_updated : UInt64
  end

  IDirectManipulationViewportEventHandler_GUID = "952121da-d69f-45f9-b0f9-f23944321a6d"
  IID_IDirectManipulationViewportEventHandler = LibC::GUID.new(0x952121da_u32, 0xd69f_u16, 0x45f9_u16, StaticArray[0xb0_u8, 0xf9_u8, 0xf2_u8, 0x39_u8, 0x44_u8, 0x32_u8, 0x1a_u8, 0x6d_u8])
  struct IDirectManipulationViewportEventHandler
    lpVtbl : IDirectManipulationViewportEventHandlerVTbl*
  end

  struct IDirectManipulationContentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_content_rect : UInt64
    set_content_rect : UInt64
    get_viewport : UInt64
    get_tag : UInt64
    set_tag : UInt64
    get_output_transform : UInt64
    get_content_transform : UInt64
    sync_content_transform : UInt64
  end

  IDirectManipulationContent_GUID = "b89962cb-3d89-442b-bb58-5098fa0f9f16"
  IID_IDirectManipulationContent = LibC::GUID.new(0xb89962cb_u32, 0x3d89_u16, 0x442b_u16, StaticArray[0xbb_u8, 0x58_u8, 0x50_u8, 0x98_u8, 0xfa_u8, 0xf_u8, 0x9f_u8, 0x16_u8])
  struct IDirectManipulationContent
    lpVtbl : IDirectManipulationContentVTbl*
  end

  struct IDirectManipulationPrimaryContentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_snap_interval : UInt64
    set_snap_points : UInt64
    set_snap_type : UInt64
    set_snap_coordinate : UInt64
    set_zoom_boundaries : UInt64
    set_horizontal_alignment : UInt64
    set_vertical_alignment : UInt64
    get_inertia_end_transform : UInt64
    get_center_point : UInt64
  end

  IDirectManipulationPrimaryContent_GUID = "c12851e4-1698-4625-b9b1-7ca3ec18630b"
  IID_IDirectManipulationPrimaryContent = LibC::GUID.new(0xc12851e4_u32, 0x1698_u16, 0x4625_u16, StaticArray[0xb9_u8, 0xb1_u8, 0x7c_u8, 0xa3_u8, 0xec_u8, 0x18_u8, 0x63_u8, 0xb_u8])
  struct IDirectManipulationPrimaryContent
    lpVtbl : IDirectManipulationPrimaryContentVTbl*
  end

  struct IDirectManipulationDragDropEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_drag_drop_status_change : UInt64
  end

  IDirectManipulationDragDropEventHandler_GUID = "1fa11b10-701b-41ae-b5f2-49e36bd595aa"
  IID_IDirectManipulationDragDropEventHandler = LibC::GUID.new(0x1fa11b10_u32, 0x701b_u16, 0x41ae_u16, StaticArray[0xb5_u8, 0xf2_u8, 0x49_u8, 0xe3_u8, 0x6b_u8, 0xd5_u8, 0x95_u8, 0xaa_u8])
  struct IDirectManipulationDragDropEventHandler
    lpVtbl : IDirectManipulationDragDropEventHandlerVTbl*
  end

  struct IDirectManipulationDragDropBehaviorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_configuration : UInt64
    get_status : UInt64
  end

  IDirectManipulationDragDropBehavior_GUID = "814b5af5-c2c8-4270-a9b7-a198ce8d02fa"
  IID_IDirectManipulationDragDropBehavior = LibC::GUID.new(0x814b5af5_u32, 0xc2c8_u16, 0x4270_u16, StaticArray[0xa9_u8, 0xb7_u8, 0xa1_u8, 0x98_u8, 0xce_u8, 0x8d_u8, 0x2_u8, 0xfa_u8])
  struct IDirectManipulationDragDropBehavior
    lpVtbl : IDirectManipulationDragDropBehaviorVTbl*
  end

  struct IDirectManipulationInteractionEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_interaction : UInt64
  end

  IDirectManipulationInteractionEventHandler_GUID = "e43f45b8-42b4-403e-b1f2-273b8f510830"
  IID_IDirectManipulationInteractionEventHandler = LibC::GUID.new(0xe43f45b8_u32, 0x42b4_u16, 0x403e_u16, StaticArray[0xb1_u8, 0xf2_u8, 0x27_u8, 0x3b_u8, 0x8f_u8, 0x51_u8, 0x8_u8, 0x30_u8])
  struct IDirectManipulationInteractionEventHandler
    lpVtbl : IDirectManipulationInteractionEventHandlerVTbl*
  end

  struct IDirectManipulationFrameInfoProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_next_frame_info : UInt64
  end

  IDirectManipulationFrameInfoProvider_GUID = "fb759dba-6f4c-4c01-874e-19c8a05907f9"
  IID_IDirectManipulationFrameInfoProvider = LibC::GUID.new(0xfb759dba_u32, 0x6f4c_u16, 0x4c01_u16, StaticArray[0x87_u8, 0x4e_u8, 0x19_u8, 0xc8_u8, 0xa0_u8, 0x59_u8, 0x7_u8, 0xf9_u8])
  struct IDirectManipulationFrameInfoProvider
    lpVtbl : IDirectManipulationFrameInfoProviderVTbl*
  end

  struct IDirectManipulationCompositorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_content : UInt64
    remove_content : UInt64
    set_update_manager : UInt64
    flush : UInt64
  end

  IDirectManipulationCompositor_GUID = "537a0825-0387-4efa-b62f-71eb1f085a7e"
  IID_IDirectManipulationCompositor = LibC::GUID.new(0x537a0825_u32, 0x387_u16, 0x4efa_u16, StaticArray[0xb6_u8, 0x2f_u8, 0x71_u8, 0xeb_u8, 0x1f_u8, 0x8_u8, 0x5a_u8, 0x7e_u8])
  struct IDirectManipulationCompositor
    lpVtbl : IDirectManipulationCompositorVTbl*
  end

  struct IDirectManipulationCompositor2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_content : UInt64
    remove_content : UInt64
    set_update_manager : UInt64
    flush : UInt64
    add_content_with_cross_process_chaining : UInt64
  end

  IDirectManipulationCompositor2_GUID = "d38c7822-f1cb-43cb-b4b9-ac0c767a412e"
  IID_IDirectManipulationCompositor2 = LibC::GUID.new(0xd38c7822_u32, 0xf1cb_u16, 0x43cb_u16, StaticArray[0xb4_u8, 0xb9_u8, 0xac_u8, 0xc_u8, 0x76_u8, 0x7a_u8, 0x41_u8, 0x2e_u8])
  struct IDirectManipulationCompositor2
    lpVtbl : IDirectManipulationCompositor2VTbl*
  end

  struct IDirectManipulationUpdateHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    update : UInt64
  end

  IDirectManipulationUpdateHandler_GUID = "790b6337-64f8-4ff5-a269-b32bc2af27a7"
  IID_IDirectManipulationUpdateHandler = LibC::GUID.new(0x790b6337_u32, 0x64f8_u16, 0x4ff5_u16, StaticArray[0xa2_u8, 0x69_u8, 0xb3_u8, 0x2b_u8, 0xc2_u8, 0xaf_u8, 0x27_u8, 0xa7_u8])
  struct IDirectManipulationUpdateHandler
    lpVtbl : IDirectManipulationUpdateHandlerVTbl*
  end

  struct IDirectManipulationUpdateManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_wait_handle_callback : UInt64
    unregister_wait_handle_callback : UInt64
    update : UInt64
  end

  IDirectManipulationUpdateManager_GUID = "b0ae62fd-be34-46e7-9caa-d361facbb9cc"
  IID_IDirectManipulationUpdateManager = LibC::GUID.new(0xb0ae62fd_u32, 0xbe34_u16, 0x46e7_u16, StaticArray[0x9c_u8, 0xaa_u8, 0xd3_u8, 0x61_u8, 0xfa_u8, 0xcb_u8, 0xb9_u8, 0xcc_u8])
  struct IDirectManipulationUpdateManager
    lpVtbl : IDirectManipulationUpdateManagerVTbl*
  end

  struct IDirectManipulationAutoScrollBehaviorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_configuration : UInt64
  end

  IDirectManipulationAutoScrollBehavior_GUID = "6d5954d4-2003-4356-9b31-d051c9ff0af7"
  IID_IDirectManipulationAutoScrollBehavior = LibC::GUID.new(0x6d5954d4_u32, 0x2003_u16, 0x4356_u16, StaticArray[0x9b_u8, 0x31_u8, 0xd0_u8, 0x51_u8, 0xc9_u8, 0xff_u8, 0xa_u8, 0xf7_u8])
  struct IDirectManipulationAutoScrollBehavior
    lpVtbl : IDirectManipulationAutoScrollBehaviorVTbl*
  end

  struct IDirectManipulationDeferContactServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    defer_contact : UInt64
    cancel_contact : UInt64
    cancel_deferral : UInt64
  end

  IDirectManipulationDeferContactService_GUID = "652d5c71-fe60-4a98-be70-e5f21291e7f1"
  IID_IDirectManipulationDeferContactService = LibC::GUID.new(0x652d5c71_u32, 0xfe60_u16, 0x4a98_u16, StaticArray[0xbe_u8, 0x70_u8, 0xe5_u8, 0xf2_u8, 0x12_u8, 0x91_u8, 0xe7_u8, 0xf1_u8])
  struct IDirectManipulationDeferContactService
    lpVtbl : IDirectManipulationDeferContactServiceVTbl*
  end

end
struct LibWin32::IDirectManipulationManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(window : LibC::HANDLE) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(window)
  end
  def deactivate(window : LibC::HANDLE) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(window)
  end
  def register_hit_test_target(window : LibC::HANDLE, hittestwindow : LibC::HANDLE, type : DIRECTMANIPULATION_HITTEST_TYPE) : HRESULT
    @lpVtbl.value.register_hit_test_target.unsafe_as(Proc(LibC::HANDLE, LibC::HANDLE, DIRECTMANIPULATION_HITTEST_TYPE, HRESULT)).call(window, hittestwindow, type)
  end
  def process_input(message : MSG*, handled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process_input.unsafe_as(Proc(MSG*, LibC::BOOL*, HRESULT)).call(message, handled)
  end
  def get_update_manager(riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_update_manager.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, object)
  end
  def create_viewport(frameinfo : IDirectManipulationFrameInfoProvider, window : LibC::HANDLE, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_viewport.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, LibC::HANDLE, Guid*, Void**, HRESULT)).call(frameinfo, window, riid, object)
  end
  def create_content(frameinfo : IDirectManipulationFrameInfoProvider, clsid : Guid*, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_content.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, Guid*, Guid*, Void**, HRESULT)).call(frameinfo, clsid, riid, object)
  end
end
struct LibWin32::IDirectManipulationManager2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(window : LibC::HANDLE) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(window)
  end
  def deactivate(window : LibC::HANDLE) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(window)
  end
  def register_hit_test_target(window : LibC::HANDLE, hittestwindow : LibC::HANDLE, type : DIRECTMANIPULATION_HITTEST_TYPE) : HRESULT
    @lpVtbl.value.register_hit_test_target.unsafe_as(Proc(LibC::HANDLE, LibC::HANDLE, DIRECTMANIPULATION_HITTEST_TYPE, HRESULT)).call(window, hittestwindow, type)
  end
  def process_input(message : MSG*, handled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process_input.unsafe_as(Proc(MSG*, LibC::BOOL*, HRESULT)).call(message, handled)
  end
  def get_update_manager(riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_update_manager.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, object)
  end
  def create_viewport(frameinfo : IDirectManipulationFrameInfoProvider, window : LibC::HANDLE, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_viewport.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, LibC::HANDLE, Guid*, Void**, HRESULT)).call(frameinfo, window, riid, object)
  end
  def create_content(frameinfo : IDirectManipulationFrameInfoProvider, clsid : Guid*, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_content.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, Guid*, Guid*, Void**, HRESULT)).call(frameinfo, clsid, riid, object)
  end
  def create_behavior(clsid : Guid*, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_behavior.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(clsid, riid, object)
  end
end
struct LibWin32::IDirectManipulationManager3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(window : LibC::HANDLE) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(window)
  end
  def deactivate(window : LibC::HANDLE) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(window)
  end
  def register_hit_test_target(window : LibC::HANDLE, hittestwindow : LibC::HANDLE, type : DIRECTMANIPULATION_HITTEST_TYPE) : HRESULT
    @lpVtbl.value.register_hit_test_target.unsafe_as(Proc(LibC::HANDLE, LibC::HANDLE, DIRECTMANIPULATION_HITTEST_TYPE, HRESULT)).call(window, hittestwindow, type)
  end
  def process_input(message : MSG*, handled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.process_input.unsafe_as(Proc(MSG*, LibC::BOOL*, HRESULT)).call(message, handled)
  end
  def get_update_manager(riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_update_manager.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, object)
  end
  def create_viewport(frameinfo : IDirectManipulationFrameInfoProvider, window : LibC::HANDLE, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_viewport.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, LibC::HANDLE, Guid*, Void**, HRESULT)).call(frameinfo, window, riid, object)
  end
  def create_content(frameinfo : IDirectManipulationFrameInfoProvider, clsid : Guid*, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_content.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, Guid*, Guid*, Void**, HRESULT)).call(frameinfo, clsid, riid, object)
  end
  def create_behavior(clsid : Guid*, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.create_behavior.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(clsid, riid, object)
  end
  def get_service(clsid : Guid*, riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_service.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(clsid, riid, object)
  end
end
struct LibWin32::IDirectManipulationViewport
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(HRESULT)).call
  end
  def disable : HRESULT
    @lpVtbl.value.disable.unsafe_as(Proc(HRESULT)).call
  end
  def set_contact(pointerid : UInt32) : HRESULT
    @lpVtbl.value.set_contact.unsafe_as(Proc(UInt32, HRESULT)).call(pointerid)
  end
  def release_contact(pointerid : UInt32) : HRESULT
    @lpVtbl.value.release_contact.unsafe_as(Proc(UInt32, HRESULT)).call(pointerid)
  end
  def release_all_contacts : HRESULT
    @lpVtbl.value.release_all_contacts.unsafe_as(Proc(HRESULT)).call
  end
  def get_status(status : DIRECTMANIPULATION_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(DIRECTMANIPULATION_STATUS*, HRESULT)).call(status)
  end
  def get_tag(riid : Guid*, object : Void**, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(Guid*, Void**, UInt32*, HRESULT)).call(riid, object, id)
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_viewport_rect(viewport : RECT*) : HRESULT
    @lpVtbl.value.get_viewport_rect.unsafe_as(Proc(RECT*, HRESULT)).call(viewport)
  end
  def set_viewport_rect(viewport : RECT*) : HRESULT
    @lpVtbl.value.set_viewport_rect.unsafe_as(Proc(RECT*, HRESULT)).call(viewport)
  end
  def zoom_to_rect(left : Float32, top : Float32, right : Float32, bottom : Float32, animate : LibC::BOOL) : HRESULT
    @lpVtbl.value.zoom_to_rect.unsafe_as(Proc(Float32, Float32, Float32, Float32, LibC::BOOL, HRESULT)).call(left, top, right, bottom, animate)
  end
  def set_viewport_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.set_viewport_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def sync_display_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.sync_display_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def get_primary_content(riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_primary_content.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, object)
  end
  def add_content(content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.add_content.unsafe_as(Proc(IDirectManipulationContent, HRESULT)).call(content)
  end
  def remove_content(content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.remove_content.unsafe_as(Proc(IDirectManipulationContent, HRESULT)).call(content)
  end
  def set_viewport_options(options : DIRECTMANIPULATION_VIEWPORT_OPTIONS) : HRESULT
    @lpVtbl.value.set_viewport_options.unsafe_as(Proc(DIRECTMANIPULATION_VIEWPORT_OPTIONS, HRESULT)).call(options)
  end
  def add_configuration(configuration : DIRECTMANIPULATION_CONFIGURATION) : HRESULT
    @lpVtbl.value.add_configuration.unsafe_as(Proc(DIRECTMANIPULATION_CONFIGURATION, HRESULT)).call(configuration)
  end
  def remove_configuration(configuration : DIRECTMANIPULATION_CONFIGURATION) : HRESULT
    @lpVtbl.value.remove_configuration.unsafe_as(Proc(DIRECTMANIPULATION_CONFIGURATION, HRESULT)).call(configuration)
  end
  def activate_configuration(configuration : DIRECTMANIPULATION_CONFIGURATION) : HRESULT
    @lpVtbl.value.activate_configuration.unsafe_as(Proc(DIRECTMANIPULATION_CONFIGURATION, HRESULT)).call(configuration)
  end
  def set_manual_gesture(configuration : DIRECTMANIPULATION_GESTURE_CONFIGURATION) : HRESULT
    @lpVtbl.value.set_manual_gesture.unsafe_as(Proc(DIRECTMANIPULATION_GESTURE_CONFIGURATION, HRESULT)).call(configuration)
  end
  def set_chaining(enabledtypes : DIRECTMANIPULATION_MOTION_TYPES) : HRESULT
    @lpVtbl.value.set_chaining.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, HRESULT)).call(enabledtypes)
  end
  def add_event_handler(window : LibC::HANDLE, eventhandler : IDirectManipulationViewportEventHandler, cookie : UInt32*) : HRESULT
    @lpVtbl.value.add_event_handler.unsafe_as(Proc(LibC::HANDLE, IDirectManipulationViewportEventHandler, UInt32*, HRESULT)).call(window, eventhandler, cookie)
  end
  def remove_event_handler(cookie : UInt32) : HRESULT
    @lpVtbl.value.remove_event_handler.unsafe_as(Proc(UInt32, HRESULT)).call(cookie)
  end
  def set_input_mode(mode : DIRECTMANIPULATION_INPUT_MODE) : HRESULT
    @lpVtbl.value.set_input_mode.unsafe_as(Proc(DIRECTMANIPULATION_INPUT_MODE, HRESULT)).call(mode)
  end
  def set_update_mode(mode : DIRECTMANIPULATION_INPUT_MODE) : HRESULT
    @lpVtbl.value.set_update_mode.unsafe_as(Proc(DIRECTMANIPULATION_INPUT_MODE, HRESULT)).call(mode)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def abandon : HRESULT
    @lpVtbl.value.abandon.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectManipulationViewport2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(HRESULT)).call
  end
  def disable : HRESULT
    @lpVtbl.value.disable.unsafe_as(Proc(HRESULT)).call
  end
  def set_contact(pointerid : UInt32) : HRESULT
    @lpVtbl.value.set_contact.unsafe_as(Proc(UInt32, HRESULT)).call(pointerid)
  end
  def release_contact(pointerid : UInt32) : HRESULT
    @lpVtbl.value.release_contact.unsafe_as(Proc(UInt32, HRESULT)).call(pointerid)
  end
  def release_all_contacts : HRESULT
    @lpVtbl.value.release_all_contacts.unsafe_as(Proc(HRESULT)).call
  end
  def get_status(status : DIRECTMANIPULATION_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(DIRECTMANIPULATION_STATUS*, HRESULT)).call(status)
  end
  def get_tag(riid : Guid*, object : Void**, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(Guid*, Void**, UInt32*, HRESULT)).call(riid, object, id)
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_viewport_rect(viewport : RECT*) : HRESULT
    @lpVtbl.value.get_viewport_rect.unsafe_as(Proc(RECT*, HRESULT)).call(viewport)
  end
  def set_viewport_rect(viewport : RECT*) : HRESULT
    @lpVtbl.value.set_viewport_rect.unsafe_as(Proc(RECT*, HRESULT)).call(viewport)
  end
  def zoom_to_rect(left : Float32, top : Float32, right : Float32, bottom : Float32, animate : LibC::BOOL) : HRESULT
    @lpVtbl.value.zoom_to_rect.unsafe_as(Proc(Float32, Float32, Float32, Float32, LibC::BOOL, HRESULT)).call(left, top, right, bottom, animate)
  end
  def set_viewport_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.set_viewport_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def sync_display_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.sync_display_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def get_primary_content(riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_primary_content.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, object)
  end
  def add_content(content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.add_content.unsafe_as(Proc(IDirectManipulationContent, HRESULT)).call(content)
  end
  def remove_content(content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.remove_content.unsafe_as(Proc(IDirectManipulationContent, HRESULT)).call(content)
  end
  def set_viewport_options(options : DIRECTMANIPULATION_VIEWPORT_OPTIONS) : HRESULT
    @lpVtbl.value.set_viewport_options.unsafe_as(Proc(DIRECTMANIPULATION_VIEWPORT_OPTIONS, HRESULT)).call(options)
  end
  def add_configuration(configuration : DIRECTMANIPULATION_CONFIGURATION) : HRESULT
    @lpVtbl.value.add_configuration.unsafe_as(Proc(DIRECTMANIPULATION_CONFIGURATION, HRESULT)).call(configuration)
  end
  def remove_configuration(configuration : DIRECTMANIPULATION_CONFIGURATION) : HRESULT
    @lpVtbl.value.remove_configuration.unsafe_as(Proc(DIRECTMANIPULATION_CONFIGURATION, HRESULT)).call(configuration)
  end
  def activate_configuration(configuration : DIRECTMANIPULATION_CONFIGURATION) : HRESULT
    @lpVtbl.value.activate_configuration.unsafe_as(Proc(DIRECTMANIPULATION_CONFIGURATION, HRESULT)).call(configuration)
  end
  def set_manual_gesture(configuration : DIRECTMANIPULATION_GESTURE_CONFIGURATION) : HRESULT
    @lpVtbl.value.set_manual_gesture.unsafe_as(Proc(DIRECTMANIPULATION_GESTURE_CONFIGURATION, HRESULT)).call(configuration)
  end
  def set_chaining(enabledtypes : DIRECTMANIPULATION_MOTION_TYPES) : HRESULT
    @lpVtbl.value.set_chaining.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, HRESULT)).call(enabledtypes)
  end
  def add_event_handler(window : LibC::HANDLE, eventhandler : IDirectManipulationViewportEventHandler, cookie : UInt32*) : HRESULT
    @lpVtbl.value.add_event_handler.unsafe_as(Proc(LibC::HANDLE, IDirectManipulationViewportEventHandler, UInt32*, HRESULT)).call(window, eventhandler, cookie)
  end
  def remove_event_handler(cookie : UInt32) : HRESULT
    @lpVtbl.value.remove_event_handler.unsafe_as(Proc(UInt32, HRESULT)).call(cookie)
  end
  def set_input_mode(mode : DIRECTMANIPULATION_INPUT_MODE) : HRESULT
    @lpVtbl.value.set_input_mode.unsafe_as(Proc(DIRECTMANIPULATION_INPUT_MODE, HRESULT)).call(mode)
  end
  def set_update_mode(mode : DIRECTMANIPULATION_INPUT_MODE) : HRESULT
    @lpVtbl.value.set_update_mode.unsafe_as(Proc(DIRECTMANIPULATION_INPUT_MODE, HRESULT)).call(mode)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def abandon : HRESULT
    @lpVtbl.value.abandon.unsafe_as(Proc(HRESULT)).call
  end
  def add_behavior(behavior : IUnknown, cookie : UInt32*) : HRESULT
    @lpVtbl.value.add_behavior.unsafe_as(Proc(IUnknown, UInt32*, HRESULT)).call(behavior, cookie)
  end
  def remove_behavior(cookie : UInt32) : HRESULT
    @lpVtbl.value.remove_behavior.unsafe_as(Proc(UInt32, HRESULT)).call(cookie)
  end
  def remove_all_behaviors : HRESULT
    @lpVtbl.value.remove_all_behaviors.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectManipulationViewportEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_viewport_status_changed(viewport : IDirectManipulationViewport, current : DIRECTMANIPULATION_STATUS, previous : DIRECTMANIPULATION_STATUS) : HRESULT
    @lpVtbl.value.on_viewport_status_changed.unsafe_as(Proc(IDirectManipulationViewport, DIRECTMANIPULATION_STATUS, DIRECTMANIPULATION_STATUS, HRESULT)).call(viewport, current, previous)
  end
  def on_viewport_updated(viewport : IDirectManipulationViewport) : HRESULT
    @lpVtbl.value.on_viewport_updated.unsafe_as(Proc(IDirectManipulationViewport, HRESULT)).call(viewport)
  end
  def on_content_updated(viewport : IDirectManipulationViewport, content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.on_content_updated.unsafe_as(Proc(IDirectManipulationViewport, IDirectManipulationContent, HRESULT)).call(viewport, content)
  end
end
struct LibWin32::IDirectManipulationContent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_content_rect(contentsize : RECT*) : HRESULT
    @lpVtbl.value.get_content_rect.unsafe_as(Proc(RECT*, HRESULT)).call(contentsize)
  end
  def set_content_rect(contentsize : RECT*) : HRESULT
    @lpVtbl.value.set_content_rect.unsafe_as(Proc(RECT*, HRESULT)).call(contentsize)
  end
  def get_viewport(riid : Guid*, object : Void**) : HRESULT
    @lpVtbl.value.get_viewport.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, object)
  end
  def get_tag(riid : Guid*, object : Void**, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(Guid*, Void**, UInt32*, HRESULT)).call(riid, object, id)
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_output_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.get_output_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def get_content_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.get_content_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def sync_content_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.sync_content_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
end
struct LibWin32::IDirectManipulationPrimaryContent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_snap_interval(motion : DIRECTMANIPULATION_MOTION_TYPES, interval : Float32, offset : Float32) : HRESULT
    @lpVtbl.value.set_snap_interval.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, Float32, Float32, HRESULT)).call(motion, interval, offset)
  end
  def set_snap_points(motion : DIRECTMANIPULATION_MOTION_TYPES, points : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.set_snap_points.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, Float32*, UInt32, HRESULT)).call(motion, points, pointcount)
  end
  def set_snap_type(motion : DIRECTMANIPULATION_MOTION_TYPES, type : DIRECTMANIPULATION_SNAPPOINT_TYPE) : HRESULT
    @lpVtbl.value.set_snap_type.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, DIRECTMANIPULATION_SNAPPOINT_TYPE, HRESULT)).call(motion, type)
  end
  def set_snap_coordinate(motion : DIRECTMANIPULATION_MOTION_TYPES, coordinate : DIRECTMANIPULATION_SNAPPOINT_COORDINATE, origin : Float32) : HRESULT
    @lpVtbl.value.set_snap_coordinate.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, DIRECTMANIPULATION_SNAPPOINT_COORDINATE, Float32, HRESULT)).call(motion, coordinate, origin)
  end
  def set_zoom_boundaries(zoomminimum : Float32, zoommaximum : Float32) : HRESULT
    @lpVtbl.value.set_zoom_boundaries.unsafe_as(Proc(Float32, Float32, HRESULT)).call(zoomminimum, zoommaximum)
  end
  def set_horizontal_alignment(alignment : DIRECTMANIPULATION_HORIZONTALALIGNMENT) : HRESULT
    @lpVtbl.value.set_horizontal_alignment.unsafe_as(Proc(DIRECTMANIPULATION_HORIZONTALALIGNMENT, HRESULT)).call(alignment)
  end
  def set_vertical_alignment(alignment : DIRECTMANIPULATION_VERTICALALIGNMENT) : HRESULT
    @lpVtbl.value.set_vertical_alignment.unsafe_as(Proc(DIRECTMANIPULATION_VERTICALALIGNMENT, HRESULT)).call(alignment)
  end
  def get_inertia_end_transform(matrix : Float32*, pointcount : UInt32) : HRESULT
    @lpVtbl.value.get_inertia_end_transform.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(matrix, pointcount)
  end
  def get_center_point(centerx : Float32*, centery : Float32*) : HRESULT
    @lpVtbl.value.get_center_point.unsafe_as(Proc(Float32*, Float32*, HRESULT)).call(centerx, centery)
  end
end
struct LibWin32::IDirectManipulationDragDropEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_drag_drop_status_change(viewport : IDirectManipulationViewport2, current : DIRECTMANIPULATION_DRAG_DROP_STATUS, previous : DIRECTMANIPULATION_DRAG_DROP_STATUS) : HRESULT
    @lpVtbl.value.on_drag_drop_status_change.unsafe_as(Proc(IDirectManipulationViewport2, DIRECTMANIPULATION_DRAG_DROP_STATUS, DIRECTMANIPULATION_DRAG_DROP_STATUS, HRESULT)).call(viewport, current, previous)
  end
end
struct LibWin32::IDirectManipulationDragDropBehavior
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_configuration(configuration : DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION) : HRESULT
    @lpVtbl.value.set_configuration.unsafe_as(Proc(DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION, HRESULT)).call(configuration)
  end
  def get_status(status : DIRECTMANIPULATION_DRAG_DROP_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(DIRECTMANIPULATION_DRAG_DROP_STATUS*, HRESULT)).call(status)
  end
end
struct LibWin32::IDirectManipulationInteractionEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_interaction(viewport : IDirectManipulationViewport2, interaction : DIRECTMANIPULATION_INTERACTION_TYPE) : HRESULT
    @lpVtbl.value.on_interaction.unsafe_as(Proc(IDirectManipulationViewport2, DIRECTMANIPULATION_INTERACTION_TYPE, HRESULT)).call(viewport, interaction)
  end
end
struct LibWin32::IDirectManipulationFrameInfoProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_next_frame_info(time : UInt64*, processtime : UInt64*, compositiontime : UInt64*) : HRESULT
    @lpVtbl.value.get_next_frame_info.unsafe_as(Proc(UInt64*, UInt64*, UInt64*, HRESULT)).call(time, processtime, compositiontime)
  end
end
struct LibWin32::IDirectManipulationCompositor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_content(content : IDirectManipulationContent, device : IUnknown, parentvisual : IUnknown, childvisual : IUnknown) : HRESULT
    @lpVtbl.value.add_content.unsafe_as(Proc(IDirectManipulationContent, IUnknown, IUnknown, IUnknown, HRESULT)).call(content, device, parentvisual, childvisual)
  end
  def remove_content(content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.remove_content.unsafe_as(Proc(IDirectManipulationContent, HRESULT)).call(content)
  end
  def set_update_manager(updatemanager : IDirectManipulationUpdateManager) : HRESULT
    @lpVtbl.value.set_update_manager.unsafe_as(Proc(IDirectManipulationUpdateManager, HRESULT)).call(updatemanager)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectManipulationCompositor2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_content(content : IDirectManipulationContent, device : IUnknown, parentvisual : IUnknown, childvisual : IUnknown) : HRESULT
    @lpVtbl.value.add_content.unsafe_as(Proc(IDirectManipulationContent, IUnknown, IUnknown, IUnknown, HRESULT)).call(content, device, parentvisual, childvisual)
  end
  def remove_content(content : IDirectManipulationContent) : HRESULT
    @lpVtbl.value.remove_content.unsafe_as(Proc(IDirectManipulationContent, HRESULT)).call(content)
  end
  def set_update_manager(updatemanager : IDirectManipulationUpdateManager) : HRESULT
    @lpVtbl.value.set_update_manager.unsafe_as(Proc(IDirectManipulationUpdateManager, HRESULT)).call(updatemanager)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
  def add_content_with_cross_process_chaining(content : IDirectManipulationPrimaryContent, device : IUnknown, parentvisual : IUnknown, childvisual : IUnknown) : HRESULT
    @lpVtbl.value.add_content_with_cross_process_chaining.unsafe_as(Proc(IDirectManipulationPrimaryContent, IUnknown, IUnknown, IUnknown, HRESULT)).call(content, device, parentvisual, childvisual)
  end
end
struct LibWin32::IDirectManipulationUpdateHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def update : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDirectManipulationUpdateManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_wait_handle_callback(handle : LibC::HANDLE, eventhandler : IDirectManipulationUpdateHandler, cookie : UInt32*) : HRESULT
    @lpVtbl.value.register_wait_handle_callback.unsafe_as(Proc(LibC::HANDLE, IDirectManipulationUpdateHandler, UInt32*, HRESULT)).call(handle, eventhandler, cookie)
  end
  def unregister_wait_handle_callback(cookie : UInt32) : HRESULT
    @lpVtbl.value.unregister_wait_handle_callback.unsafe_as(Proc(UInt32, HRESULT)).call(cookie)
  end
  def update(frameinfo : IDirectManipulationFrameInfoProvider) : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(IDirectManipulationFrameInfoProvider, HRESULT)).call(frameinfo)
  end
end
struct LibWin32::IDirectManipulationAutoScrollBehavior
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_configuration(motiontypes : DIRECTMANIPULATION_MOTION_TYPES, scrollmotion : DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION) : HRESULT
    @lpVtbl.value.set_configuration.unsafe_as(Proc(DIRECTMANIPULATION_MOTION_TYPES, DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION, HRESULT)).call(motiontypes, scrollmotion)
  end
end
struct LibWin32::IDirectManipulationDeferContactService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def defer_contact(pointerid : UInt32, timeout : UInt32) : HRESULT
    @lpVtbl.value.defer_contact.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(pointerid, timeout)
  end
  def cancel_contact(pointerid : UInt32) : HRESULT
    @lpVtbl.value.cancel_contact.unsafe_as(Proc(UInt32, HRESULT)).call(pointerid)
  end
  def cancel_deferral(pointerid : UInt32) : HRESULT
    @lpVtbl.value.cancel_deferral.unsafe_as(Proc(UInt32, HRESULT)).call(pointerid)
  end
end
