require "../system/com.cr"
require "../foundation.cr"
require "../ui/windowsandmessaging.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  DIRECTMANIPULATION_KEYBOARDFOCUS = 4294967294_u32
  DIRECTMANIPULATION_MOUSEFOCUS = 4294967293_u32
  CLSID_VerticalIndicatorContent = "a10b5f17-afe0-4aa2-91e9-3e7001d2e6b4"
  CLSID_HorizontalIndicatorContent = "e7d18cf5-3ec7-44d5-a76b-3770f3cf903d"
  CLSID_VirtualViewportContent = "3206a19a-86f0-4cb4-a7f3-16e3b7e2d852"
  CLSID_DragDropConfigurationBehavior = "09b01b3e-ba6c-454d-82e8-95e352329f23"
  CLSID_AutoScrollBehavior = "26126a51-3c70-4c9a-aec2-948849eeb093"
  CLSID_DeferContactService = "d7b67cf4-84bb-434e-86ae-6592bbc9abd9"
  DirectManipulationViewport = LibC::GUID.new(0x34e211b6_u32, 0x3650_u16, 0x4f75_u16, StaticArray[0x83_u8, 0x34_u8, 0xfa_u8, 0x35_u8, 0x95_u8, 0x98_u8, 0xe1_u8, 0xc5_u8])
  DirectManipulationUpdateManager = LibC::GUID.new(0x9fc1bfd5_u32, 0x1835_u16, 0x441a_u16, StaticArray[0xb3_u8, 0xb1_u8, 0xb6_u8, 0xcc_u8, 0x74_u8, 0xb7_u8, 0x27_u8, 0xd0_u8])
  DirectManipulationPrimaryContent = LibC::GUID.new(0xcaa02661_u32, 0xd59e_u16, 0x41c7_u16, StaticArray[0x83_u8, 0x93_u8, 0x3b_u8, 0xa3_u8, 0xba_u8, 0xcb_u8, 0x6b_u8, 0x57_u8])
  DirectManipulationManager = LibC::GUID.new(0x54e211b6_u32, 0x3650_u16, 0x4f75_u16, StaticArray[0x83_u8, 0x34_u8, 0xfa_u8, 0x35_u8, 0x95_u8, 0x98_u8, 0xe1_u8, 0xc5_u8])
  DirectManipulationSharedManager = LibC::GUID.new(0x99793286_u32, 0x77cc_u16, 0x4b57_u16, StaticArray[0x96_u8, 0xdb_u8, 0x3b_u8, 0x35_u8, 0x4f_u8, 0x6f_u8, 0x9f_u8, 0xb5_u8])
  DCompManipulationCompositor = LibC::GUID.new(0x79dea627_u32, 0xa08a_u16, 0x43ac_u16, StaticArray[0x8e_u8, 0xf5_u8, 0x69_u8, 0x0_u8, 0xb9_u8, 0x29_u8, 0x91_u8, 0x26_u8])


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
    query_interface : Proc(IDirectManipulationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationManager*, UInt32)
    release : Proc(IDirectManipulationManager*, UInt32)
    activate : Proc(IDirectManipulationManager*, LibC::HANDLE, HRESULT)
    deactivate : Proc(IDirectManipulationManager*, LibC::HANDLE, HRESULT)
    register_hit_test_target : Proc(IDirectManipulationManager*, LibC::HANDLE, LibC::HANDLE, DIRECTMANIPULATION_HITTEST_TYPE, HRESULT)
    process_input : Proc(IDirectManipulationManager*, MSG*, LibC::BOOL*, HRESULT)
    get_update_manager : Proc(IDirectManipulationManager*, Guid*, Void**, HRESULT)
    create_viewport : Proc(IDirectManipulationManager*, IDirectManipulationFrameInfoProvider, LibC::HANDLE, Guid*, Void**, HRESULT)
    create_content : Proc(IDirectManipulationManager*, IDirectManipulationFrameInfoProvider, Guid*, Guid*, Void**, HRESULT)
  end

  struct IDirectManipulationManager
    lpVtbl : IDirectManipulationManagerVTbl*
  end

  struct IDirectManipulationManager2VTbl
    query_interface : Proc(IDirectManipulationManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationManager2*, UInt32)
    release : Proc(IDirectManipulationManager2*, UInt32)
    activate : Proc(IDirectManipulationManager2*, LibC::HANDLE, HRESULT)
    deactivate : Proc(IDirectManipulationManager2*, LibC::HANDLE, HRESULT)
    register_hit_test_target : Proc(IDirectManipulationManager2*, LibC::HANDLE, LibC::HANDLE, DIRECTMANIPULATION_HITTEST_TYPE, HRESULT)
    process_input : Proc(IDirectManipulationManager2*, MSG*, LibC::BOOL*, HRESULT)
    get_update_manager : Proc(IDirectManipulationManager2*, Guid*, Void**, HRESULT)
    create_viewport : Proc(IDirectManipulationManager2*, IDirectManipulationFrameInfoProvider, LibC::HANDLE, Guid*, Void**, HRESULT)
    create_content : Proc(IDirectManipulationManager2*, IDirectManipulationFrameInfoProvider, Guid*, Guid*, Void**, HRESULT)
    create_behavior : Proc(IDirectManipulationManager2*, Guid*, Guid*, Void**, HRESULT)
  end

  struct IDirectManipulationManager2
    lpVtbl : IDirectManipulationManager2VTbl*
  end

  struct IDirectManipulationManager3VTbl
    query_interface : Proc(IDirectManipulationManager3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationManager3*, UInt32)
    release : Proc(IDirectManipulationManager3*, UInt32)
    activate : Proc(IDirectManipulationManager3*, LibC::HANDLE, HRESULT)
    deactivate : Proc(IDirectManipulationManager3*, LibC::HANDLE, HRESULT)
    register_hit_test_target : Proc(IDirectManipulationManager3*, LibC::HANDLE, LibC::HANDLE, DIRECTMANIPULATION_HITTEST_TYPE, HRESULT)
    process_input : Proc(IDirectManipulationManager3*, MSG*, LibC::BOOL*, HRESULT)
    get_update_manager : Proc(IDirectManipulationManager3*, Guid*, Void**, HRESULT)
    create_viewport : Proc(IDirectManipulationManager3*, IDirectManipulationFrameInfoProvider, LibC::HANDLE, Guid*, Void**, HRESULT)
    create_content : Proc(IDirectManipulationManager3*, IDirectManipulationFrameInfoProvider, Guid*, Guid*, Void**, HRESULT)
    create_behavior : Proc(IDirectManipulationManager3*, Guid*, Guid*, Void**, HRESULT)
    get_service : Proc(IDirectManipulationManager3*, Guid*, Guid*, Void**, HRESULT)
  end

  struct IDirectManipulationManager3
    lpVtbl : IDirectManipulationManager3VTbl*
  end

  struct IDirectManipulationViewportVTbl
    query_interface : Proc(IDirectManipulationViewport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationViewport*, UInt32)
    release : Proc(IDirectManipulationViewport*, UInt32)
    enable : Proc(IDirectManipulationViewport*, HRESULT)
    disable : Proc(IDirectManipulationViewport*, HRESULT)
    set_contact : Proc(IDirectManipulationViewport*, UInt32, HRESULT)
    release_contact : Proc(IDirectManipulationViewport*, UInt32, HRESULT)
    release_all_contacts : Proc(IDirectManipulationViewport*, HRESULT)
    get_status : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_STATUS*, HRESULT)
    get_tag : Proc(IDirectManipulationViewport*, Guid*, Void**, UInt32*, HRESULT)
    set_tag : Proc(IDirectManipulationViewport*, IUnknown, UInt32, HRESULT)
    get_viewport_rect : Proc(IDirectManipulationViewport*, RECT*, HRESULT)
    set_viewport_rect : Proc(IDirectManipulationViewport*, RECT*, HRESULT)
    zoom_to_rect : Proc(IDirectManipulationViewport*, Float32, Float32, Float32, Float32, LibC::BOOL, HRESULT)
    set_viewport_transform : Proc(IDirectManipulationViewport*, Float32*, UInt32, HRESULT)
    sync_display_transform : Proc(IDirectManipulationViewport*, Float32*, UInt32, HRESULT)
    get_primary_content : Proc(IDirectManipulationViewport*, Guid*, Void**, HRESULT)
    add_content : Proc(IDirectManipulationViewport*, IDirectManipulationContent, HRESULT)
    remove_content : Proc(IDirectManipulationViewport*, IDirectManipulationContent, HRESULT)
    set_viewport_options : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_VIEWPORT_OPTIONS, HRESULT)
    add_configuration : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_CONFIGURATION, HRESULT)
    remove_configuration : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_CONFIGURATION, HRESULT)
    activate_configuration : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_CONFIGURATION, HRESULT)
    set_manual_gesture : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_GESTURE_CONFIGURATION, HRESULT)
    set_chaining : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_MOTION_TYPES, HRESULT)
    add_event_handler : Proc(IDirectManipulationViewport*, LibC::HANDLE, IDirectManipulationViewportEventHandler, UInt32*, HRESULT)
    remove_event_handler : Proc(IDirectManipulationViewport*, UInt32, HRESULT)
    set_input_mode : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_INPUT_MODE, HRESULT)
    set_update_mode : Proc(IDirectManipulationViewport*, DIRECTMANIPULATION_INPUT_MODE, HRESULT)
    stop : Proc(IDirectManipulationViewport*, HRESULT)
    abandon : Proc(IDirectManipulationViewport*, HRESULT)
  end

  struct IDirectManipulationViewport
    lpVtbl : IDirectManipulationViewportVTbl*
  end

  struct IDirectManipulationViewport2VTbl
    query_interface : Proc(IDirectManipulationViewport2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationViewport2*, UInt32)
    release : Proc(IDirectManipulationViewport2*, UInt32)
    enable : Proc(IDirectManipulationViewport2*, HRESULT)
    disable : Proc(IDirectManipulationViewport2*, HRESULT)
    set_contact : Proc(IDirectManipulationViewport2*, UInt32, HRESULT)
    release_contact : Proc(IDirectManipulationViewport2*, UInt32, HRESULT)
    release_all_contacts : Proc(IDirectManipulationViewport2*, HRESULT)
    get_status : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_STATUS*, HRESULT)
    get_tag : Proc(IDirectManipulationViewport2*, Guid*, Void**, UInt32*, HRESULT)
    set_tag : Proc(IDirectManipulationViewport2*, IUnknown, UInt32, HRESULT)
    get_viewport_rect : Proc(IDirectManipulationViewport2*, RECT*, HRESULT)
    set_viewport_rect : Proc(IDirectManipulationViewport2*, RECT*, HRESULT)
    zoom_to_rect : Proc(IDirectManipulationViewport2*, Float32, Float32, Float32, Float32, LibC::BOOL, HRESULT)
    set_viewport_transform : Proc(IDirectManipulationViewport2*, Float32*, UInt32, HRESULT)
    sync_display_transform : Proc(IDirectManipulationViewport2*, Float32*, UInt32, HRESULT)
    get_primary_content : Proc(IDirectManipulationViewport2*, Guid*, Void**, HRESULT)
    add_content : Proc(IDirectManipulationViewport2*, IDirectManipulationContent, HRESULT)
    remove_content : Proc(IDirectManipulationViewport2*, IDirectManipulationContent, HRESULT)
    set_viewport_options : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_VIEWPORT_OPTIONS, HRESULT)
    add_configuration : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_CONFIGURATION, HRESULT)
    remove_configuration : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_CONFIGURATION, HRESULT)
    activate_configuration : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_CONFIGURATION, HRESULT)
    set_manual_gesture : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_GESTURE_CONFIGURATION, HRESULT)
    set_chaining : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_MOTION_TYPES, HRESULT)
    add_event_handler : Proc(IDirectManipulationViewport2*, LibC::HANDLE, IDirectManipulationViewportEventHandler, UInt32*, HRESULT)
    remove_event_handler : Proc(IDirectManipulationViewport2*, UInt32, HRESULT)
    set_input_mode : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_INPUT_MODE, HRESULT)
    set_update_mode : Proc(IDirectManipulationViewport2*, DIRECTMANIPULATION_INPUT_MODE, HRESULT)
    stop : Proc(IDirectManipulationViewport2*, HRESULT)
    abandon : Proc(IDirectManipulationViewport2*, HRESULT)
    add_behavior : Proc(IDirectManipulationViewport2*, IUnknown, UInt32*, HRESULT)
    remove_behavior : Proc(IDirectManipulationViewport2*, UInt32, HRESULT)
    remove_all_behaviors : Proc(IDirectManipulationViewport2*, HRESULT)
  end

  struct IDirectManipulationViewport2
    lpVtbl : IDirectManipulationViewport2VTbl*
  end

  struct IDirectManipulationViewportEventHandlerVTbl
    query_interface : Proc(IDirectManipulationViewportEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationViewportEventHandler*, UInt32)
    release : Proc(IDirectManipulationViewportEventHandler*, UInt32)
    on_viewport_status_changed : Proc(IDirectManipulationViewportEventHandler*, IDirectManipulationViewport, DIRECTMANIPULATION_STATUS, DIRECTMANIPULATION_STATUS, HRESULT)
    on_viewport_updated : Proc(IDirectManipulationViewportEventHandler*, IDirectManipulationViewport, HRESULT)
    on_content_updated : Proc(IDirectManipulationViewportEventHandler*, IDirectManipulationViewport, IDirectManipulationContent, HRESULT)
  end

  struct IDirectManipulationViewportEventHandler
    lpVtbl : IDirectManipulationViewportEventHandlerVTbl*
  end

  struct IDirectManipulationContentVTbl
    query_interface : Proc(IDirectManipulationContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationContent*, UInt32)
    release : Proc(IDirectManipulationContent*, UInt32)
    get_content_rect : Proc(IDirectManipulationContent*, RECT*, HRESULT)
    set_content_rect : Proc(IDirectManipulationContent*, RECT*, HRESULT)
    get_viewport : Proc(IDirectManipulationContent*, Guid*, Void**, HRESULT)
    get_tag : Proc(IDirectManipulationContent*, Guid*, Void**, UInt32*, HRESULT)
    set_tag : Proc(IDirectManipulationContent*, IUnknown, UInt32, HRESULT)
    get_output_transform : Proc(IDirectManipulationContent*, Float32*, UInt32, HRESULT)
    get_content_transform : Proc(IDirectManipulationContent*, Float32*, UInt32, HRESULT)
    sync_content_transform : Proc(IDirectManipulationContent*, Float32*, UInt32, HRESULT)
  end

  struct IDirectManipulationContent
    lpVtbl : IDirectManipulationContentVTbl*
  end

  struct IDirectManipulationPrimaryContentVTbl
    query_interface : Proc(IDirectManipulationPrimaryContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationPrimaryContent*, UInt32)
    release : Proc(IDirectManipulationPrimaryContent*, UInt32)
    set_snap_interval : Proc(IDirectManipulationPrimaryContent*, DIRECTMANIPULATION_MOTION_TYPES, Float32, Float32, HRESULT)
    set_snap_points : Proc(IDirectManipulationPrimaryContent*, DIRECTMANIPULATION_MOTION_TYPES, Float32*, UInt32, HRESULT)
    set_snap_type : Proc(IDirectManipulationPrimaryContent*, DIRECTMANIPULATION_MOTION_TYPES, DIRECTMANIPULATION_SNAPPOINT_TYPE, HRESULT)
    set_snap_coordinate : Proc(IDirectManipulationPrimaryContent*, DIRECTMANIPULATION_MOTION_TYPES, DIRECTMANIPULATION_SNAPPOINT_COORDINATE, Float32, HRESULT)
    set_zoom_boundaries : Proc(IDirectManipulationPrimaryContent*, Float32, Float32, HRESULT)
    set_horizontal_alignment : Proc(IDirectManipulationPrimaryContent*, DIRECTMANIPULATION_HORIZONTALALIGNMENT, HRESULT)
    set_vertical_alignment : Proc(IDirectManipulationPrimaryContent*, DIRECTMANIPULATION_VERTICALALIGNMENT, HRESULT)
    get_inertia_end_transform : Proc(IDirectManipulationPrimaryContent*, Float32*, UInt32, HRESULT)
    get_center_point : Proc(IDirectManipulationPrimaryContent*, Float32*, Float32*, HRESULT)
  end

  struct IDirectManipulationPrimaryContent
    lpVtbl : IDirectManipulationPrimaryContentVTbl*
  end

  struct IDirectManipulationDragDropEventHandlerVTbl
    query_interface : Proc(IDirectManipulationDragDropEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationDragDropEventHandler*, UInt32)
    release : Proc(IDirectManipulationDragDropEventHandler*, UInt32)
    on_drag_drop_status_change : Proc(IDirectManipulationDragDropEventHandler*, IDirectManipulationViewport2, DIRECTMANIPULATION_DRAG_DROP_STATUS, DIRECTMANIPULATION_DRAG_DROP_STATUS, HRESULT)
  end

  struct IDirectManipulationDragDropEventHandler
    lpVtbl : IDirectManipulationDragDropEventHandlerVTbl*
  end

  struct IDirectManipulationDragDropBehaviorVTbl
    query_interface : Proc(IDirectManipulationDragDropBehavior*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationDragDropBehavior*, UInt32)
    release : Proc(IDirectManipulationDragDropBehavior*, UInt32)
    set_configuration : Proc(IDirectManipulationDragDropBehavior*, DIRECTMANIPULATION_DRAG_DROP_CONFIGURATION, HRESULT)
    get_status : Proc(IDirectManipulationDragDropBehavior*, DIRECTMANIPULATION_DRAG_DROP_STATUS*, HRESULT)
  end

  struct IDirectManipulationDragDropBehavior
    lpVtbl : IDirectManipulationDragDropBehaviorVTbl*
  end

  struct IDirectManipulationInteractionEventHandlerVTbl
    query_interface : Proc(IDirectManipulationInteractionEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationInteractionEventHandler*, UInt32)
    release : Proc(IDirectManipulationInteractionEventHandler*, UInt32)
    on_interaction : Proc(IDirectManipulationInteractionEventHandler*, IDirectManipulationViewport2, DIRECTMANIPULATION_INTERACTION_TYPE, HRESULT)
  end

  struct IDirectManipulationInteractionEventHandler
    lpVtbl : IDirectManipulationInteractionEventHandlerVTbl*
  end

  struct IDirectManipulationFrameInfoProviderVTbl
    query_interface : Proc(IDirectManipulationFrameInfoProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationFrameInfoProvider*, UInt32)
    release : Proc(IDirectManipulationFrameInfoProvider*, UInt32)
    get_next_frame_info : Proc(IDirectManipulationFrameInfoProvider*, UInt64*, UInt64*, UInt64*, HRESULT)
  end

  struct IDirectManipulationFrameInfoProvider
    lpVtbl : IDirectManipulationFrameInfoProviderVTbl*
  end

  struct IDirectManipulationCompositorVTbl
    query_interface : Proc(IDirectManipulationCompositor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationCompositor*, UInt32)
    release : Proc(IDirectManipulationCompositor*, UInt32)
    add_content : Proc(IDirectManipulationCompositor*, IDirectManipulationContent, IUnknown, IUnknown, IUnknown, HRESULT)
    remove_content : Proc(IDirectManipulationCompositor*, IDirectManipulationContent, HRESULT)
    set_update_manager : Proc(IDirectManipulationCompositor*, IDirectManipulationUpdateManager, HRESULT)
    flush : Proc(IDirectManipulationCompositor*, HRESULT)
  end

  struct IDirectManipulationCompositor
    lpVtbl : IDirectManipulationCompositorVTbl*
  end

  struct IDirectManipulationCompositor2VTbl
    query_interface : Proc(IDirectManipulationCompositor2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationCompositor2*, UInt32)
    release : Proc(IDirectManipulationCompositor2*, UInt32)
    add_content : Proc(IDirectManipulationCompositor2*, IDirectManipulationContent, IUnknown, IUnknown, IUnknown, HRESULT)
    remove_content : Proc(IDirectManipulationCompositor2*, IDirectManipulationContent, HRESULT)
    set_update_manager : Proc(IDirectManipulationCompositor2*, IDirectManipulationUpdateManager, HRESULT)
    flush : Proc(IDirectManipulationCompositor2*, HRESULT)
    add_content_with_cross_process_chaining : Proc(IDirectManipulationCompositor2*, IDirectManipulationPrimaryContent, IUnknown, IUnknown, IUnknown, HRESULT)
  end

  struct IDirectManipulationCompositor2
    lpVtbl : IDirectManipulationCompositor2VTbl*
  end

  struct IDirectManipulationUpdateHandlerVTbl
    query_interface : Proc(IDirectManipulationUpdateHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationUpdateHandler*, UInt32)
    release : Proc(IDirectManipulationUpdateHandler*, UInt32)
    update : Proc(IDirectManipulationUpdateHandler*, HRESULT)
  end

  struct IDirectManipulationUpdateHandler
    lpVtbl : IDirectManipulationUpdateHandlerVTbl*
  end

  struct IDirectManipulationUpdateManagerVTbl
    query_interface : Proc(IDirectManipulationUpdateManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationUpdateManager*, UInt32)
    release : Proc(IDirectManipulationUpdateManager*, UInt32)
    register_wait_handle_callback : Proc(IDirectManipulationUpdateManager*, LibC::HANDLE, IDirectManipulationUpdateHandler, UInt32*, HRESULT)
    unregister_wait_handle_callback : Proc(IDirectManipulationUpdateManager*, UInt32, HRESULT)
    update : Proc(IDirectManipulationUpdateManager*, IDirectManipulationFrameInfoProvider, HRESULT)
  end

  struct IDirectManipulationUpdateManager
    lpVtbl : IDirectManipulationUpdateManagerVTbl*
  end

  struct IDirectManipulationAutoScrollBehaviorVTbl
    query_interface : Proc(IDirectManipulationAutoScrollBehavior*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationAutoScrollBehavior*, UInt32)
    release : Proc(IDirectManipulationAutoScrollBehavior*, UInt32)
    set_configuration : Proc(IDirectManipulationAutoScrollBehavior*, DIRECTMANIPULATION_MOTION_TYPES, DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION, HRESULT)
  end

  struct IDirectManipulationAutoScrollBehavior
    lpVtbl : IDirectManipulationAutoScrollBehaviorVTbl*
  end

  struct IDirectManipulationDeferContactServiceVTbl
    query_interface : Proc(IDirectManipulationDeferContactService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDirectManipulationDeferContactService*, UInt32)
    release : Proc(IDirectManipulationDeferContactService*, UInt32)
    defer_contact : Proc(IDirectManipulationDeferContactService*, UInt32, UInt32, HRESULT)
    cancel_contact : Proc(IDirectManipulationDeferContactService*, UInt32, HRESULT)
    cancel_deferral : Proc(IDirectManipulationDeferContactService*, UInt32, HRESULT)
  end

  struct IDirectManipulationDeferContactService
    lpVtbl : IDirectManipulationDeferContactServiceVTbl*
  end

end
