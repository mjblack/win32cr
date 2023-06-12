require "../system/com.cr"
require "../foundation.cr"
require "../graphics/directcomposition.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  alias UI_ANIMATION_KEYFRAME = LibC::IntPtrT

  UI_ANIMATION_SECONDS_EVENTUALLY = -1_i32
  UI_ANIMATION_REPEAT_INDEFINITELY = -1_i32
  UI_ANIMATION_REPEAT_INDEFINITELY_CONCLUDE_AT_END = -1_i32
  UI_ANIMATION_REPEAT_INDEFINITELY_CONCLUDE_AT_START = -2_i32
  UI_ANIMATION_SECONDS_INFINITE = -1_i32
  UIAnimationManager = LibC::GUID.new(0x4c1fc63a_u32, 0x695c_u16, 0x47e8_u16, StaticArray[0xa3_u8, 0x39_u8, 0x1a_u8, 0x19_u8, 0x4b_u8, 0xe3_u8, 0xd0_u8, 0xb8_u8])
  UIAnimationManager2 = LibC::GUID.new(0xd25d8842_u32, 0x8884_u16, 0x4a4a_u16, StaticArray[0xb3_u8, 0x21_u8, 0x9_u8, 0x13_u8, 0x14_u8, 0x37_u8, 0x9b_u8, 0xdd_u8])
  UIAnimationTransitionLibrary = LibC::GUID.new(0x1d6322ad_u32, 0xaa85_u16, 0x4ef5_u16, StaticArray[0xa8_u8, 0x28_u8, 0x86_u8, 0xd7_u8, 0x10_u8, 0x67_u8, 0xd1_u8, 0x45_u8])
  UIAnimationTransitionLibrary2 = LibC::GUID.new(0x812f944a_u32, 0xc5c8_u16, 0x4cd9_u16, StaticArray[0xb0_u8, 0xa6_u8, 0xb3_u8, 0xda_u8, 0x80_u8, 0x2f_u8, 0x22_u8, 0x8d_u8])
  UIAnimationTransitionFactory = LibC::GUID.new(0x8a9b1cdd_u32, 0xfcd7_u16, 0x419c_u16, StaticArray[0x8b_u8, 0x44_u8, 0x42_u8, 0xfd_u8, 0x17_u8, 0xdb_u8, 0x18_u8, 0x87_u8])
  UIAnimationTransitionFactory2 = LibC::GUID.new(0x84302f97_u32, 0x7f7b_u16, 0x4040_u16, StaticArray[0xb1_u8, 0x90_u8, 0x72_u8, 0xac_u8, 0x9d_u8, 0x18_u8, 0xe4_u8, 0x20_u8])
  UIAnimationTimer = LibC::GUID.new(0xbfcd4a0c_u32, 0x6b6_u16, 0x4384_u16, StaticArray[0xb7_u8, 0x68_u8, 0xd_u8, 0xaa_u8, 0x79_u8, 0x2c_u8, 0x38_u8, 0xe_u8])


  enum UI_ANIMATION_UPDATE_RESULT : Int32
    UI_ANIMATION_UPDATE_NO_CHANGE = 0
    UI_ANIMATION_UPDATE_VARIABLES_CHANGED = 1
  end

  enum UI_ANIMATION_MANAGER_STATUS : Int32
    UI_ANIMATION_MANAGER_IDLE = 0
    UI_ANIMATION_MANAGER_BUSY = 1
  end

  enum UI_ANIMATION_MODE : Int32
    UI_ANIMATION_MODE_DISABLED = 0
    UI_ANIMATION_MODE_SYSTEM_DEFAULT = 1
    UI_ANIMATION_MODE_ENABLED = 2
  end

  enum UI_ANIMATION_REPEAT_MODE : Int32
    UI_ANIMATION_REPEAT_MODE_NORMAL = 0
    UI_ANIMATION_REPEAT_MODE_ALTERNATE = 1
  end

  enum UI_ANIMATION_ROUNDING_MODE : Int32
    UI_ANIMATION_ROUNDING_NEAREST = 0
    UI_ANIMATION_ROUNDING_FLOOR = 1
    UI_ANIMATION_ROUNDING_CEILING = 2
  end

  enum UI_ANIMATION_STORYBOARD_STATUS : Int32
    UI_ANIMATION_STORYBOARD_BUILDING = 0
    UI_ANIMATION_STORYBOARD_SCHEDULED = 1
    UI_ANIMATION_STORYBOARD_CANCELLED = 2
    UI_ANIMATION_STORYBOARD_PLAYING = 3
    UI_ANIMATION_STORYBOARD_TRUNCATED = 4
    UI_ANIMATION_STORYBOARD_FINISHED = 5
    UI_ANIMATION_STORYBOARD_READY = 6
    UI_ANIMATION_STORYBOARD_INSUFFICIENT_PRIORITY = 7
  end

  enum UI_ANIMATION_SCHEDULING_RESULT : Int32
    UI_ANIMATION_SCHEDULING_UNEXPECTED_FAILURE = 0
    UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY = 1
    UI_ANIMATION_SCHEDULING_ALREADY_SCHEDULED = 2
    UI_ANIMATION_SCHEDULING_SUCCEEDED = 3
    UI_ANIMATION_SCHEDULING_DEFERRED = 4
  end

  enum UI_ANIMATION_PRIORITY_EFFECT : Int32
    UI_ANIMATION_PRIORITY_EFFECT_FAILURE = 0
    UI_ANIMATION_PRIORITY_EFFECT_DELAY = 1
  end

  enum UI_ANIMATION_SLOPE : Int32
    UI_ANIMATION_SLOPE_INCREASING = 0
    UI_ANIMATION_SLOPE_DECREASING = 1
  end

  enum UI_ANIMATION_DEPENDENCIES : UInt32
    UI_ANIMATION_DEPENDENCY_NONE = 0
    UI_ANIMATION_DEPENDENCY_INTERMEDIATE_VALUES = 1
    UI_ANIMATION_DEPENDENCY_FINAL_VALUE = 2
    UI_ANIMATION_DEPENDENCY_FINAL_VELOCITY = 4
    UI_ANIMATION_DEPENDENCY_DURATION = 8
  end

  enum UI_ANIMATION_IDLE_BEHAVIOR : Int32
    UI_ANIMATION_IDLE_BEHAVIOR_CONTINUE = 0
    UI_ANIMATION_IDLE_BEHAVIOR_DISABLE = 1
  end

  enum UI_ANIMATION_TIMER_CLIENT_STATUS : Int32
    UI_ANIMATION_TIMER_CLIENT_IDLE = 0
    UI_ANIMATION_TIMER_CLIENT_BUSY = 1
  end


  struct IUIAnimationManagerVTbl
    query_interface : Proc(IUIAnimationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationManager*, UInt32)
    release : Proc(IUIAnimationManager*, UInt32)
    create_animation_variable : Proc(IUIAnimationManager*, Float64, IUIAnimationVariable*, HRESULT)
    schedule_transition : Proc(IUIAnimationManager*, IUIAnimationVariable, IUIAnimationTransition, Float64, HRESULT)
    create_storyboard : Proc(IUIAnimationManager*, IUIAnimationStoryboard*, HRESULT)
    finish_all_storyboards : Proc(IUIAnimationManager*, Float64, HRESULT)
    abandon_all_storyboards : Proc(IUIAnimationManager*, HRESULT)
    update : Proc(IUIAnimationManager*, Float64, UI_ANIMATION_UPDATE_RESULT*, HRESULT)
    get_variable_from_tag : Proc(IUIAnimationManager*, IUnknown, UInt32, IUIAnimationVariable*, HRESULT)
    get_storyboard_from_tag : Proc(IUIAnimationManager*, IUnknown, UInt32, IUIAnimationStoryboard*, HRESULT)
    get_status : Proc(IUIAnimationManager*, UI_ANIMATION_MANAGER_STATUS*, HRESULT)
    set_animation_mode : Proc(IUIAnimationManager*, UI_ANIMATION_MODE, HRESULT)
    pause : Proc(IUIAnimationManager*, HRESULT)
    resume : Proc(IUIAnimationManager*, HRESULT)
    set_manager_event_handler : Proc(IUIAnimationManager*, IUIAnimationManagerEventHandler, HRESULT)
    set_cancel_priority_comparison : Proc(IUIAnimationManager*, IUIAnimationPriorityComparison, HRESULT)
    set_trim_priority_comparison : Proc(IUIAnimationManager*, IUIAnimationPriorityComparison, HRESULT)
    set_compress_priority_comparison : Proc(IUIAnimationManager*, IUIAnimationPriorityComparison, HRESULT)
    set_conclude_priority_comparison : Proc(IUIAnimationManager*, IUIAnimationPriorityComparison, HRESULT)
    set_default_longest_acceptable_delay : Proc(IUIAnimationManager*, Float64, HRESULT)
    shutdown : Proc(IUIAnimationManager*, HRESULT)
  end

  IUIAnimationManager_GUID = LibC::GUID.new("9169896c-ac8d-4e7d-94e5-67fa4dc2f2e8")
  CLSID_IUIAnimationManager = "9169896c-ac8d-4e7d-94e5-67fa4dc2f2e8"
  struct IUIAnimationManager
    lpVtbl : IUIAnimationManagerVTbl*
  end

  struct IUIAnimationVariableVTbl
    query_interface : Proc(IUIAnimationVariable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariable*, UInt32)
    release : Proc(IUIAnimationVariable*, UInt32)
    get_value : Proc(IUIAnimationVariable*, Float64*, HRESULT)
    get_final_value : Proc(IUIAnimationVariable*, Float64*, HRESULT)
    get_previous_value : Proc(IUIAnimationVariable*, Float64*, HRESULT)
    get_integer_value : Proc(IUIAnimationVariable*, Int32*, HRESULT)
    get_final_integer_value : Proc(IUIAnimationVariable*, Int32*, HRESULT)
    get_previous_integer_value : Proc(IUIAnimationVariable*, Int32*, HRESULT)
    get_current_storyboard : Proc(IUIAnimationVariable*, IUIAnimationStoryboard*, HRESULT)
    set_lower_bound : Proc(IUIAnimationVariable*, Float64, HRESULT)
    set_upper_bound : Proc(IUIAnimationVariable*, Float64, HRESULT)
    set_rounding_mode : Proc(IUIAnimationVariable*, UI_ANIMATION_ROUNDING_MODE, HRESULT)
    set_tag : Proc(IUIAnimationVariable*, IUnknown, UInt32, HRESULT)
    get_tag : Proc(IUIAnimationVariable*, IUnknown*, UInt32*, HRESULT)
    set_variable_change_handler : Proc(IUIAnimationVariable*, IUIAnimationVariableChangeHandler, HRESULT)
    set_variable_integer_change_handler : Proc(IUIAnimationVariable*, IUIAnimationVariableIntegerChangeHandler, HRESULT)
  end

  IUIAnimationVariable_GUID = LibC::GUID.new("8ceeb155-2849-4ce5-9448-91ff70e1e4d9")
  CLSID_IUIAnimationVariable = "8ceeb155-2849-4ce5-9448-91ff70e1e4d9"
  struct IUIAnimationVariable
    lpVtbl : IUIAnimationVariableVTbl*
  end

  struct IUIAnimationStoryboardVTbl
    query_interface : Proc(IUIAnimationStoryboard*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationStoryboard*, UInt32)
    release : Proc(IUIAnimationStoryboard*, UInt32)
    add_transition : Proc(IUIAnimationStoryboard*, IUIAnimationVariable, IUIAnimationTransition, HRESULT)
    add_keyframe_at_offset : Proc(IUIAnimationStoryboard*, UI_ANIMATION_KEYFRAME, Float64, UI_ANIMATION_KEYFRAME*, HRESULT)
    add_keyframe_after_transition : Proc(IUIAnimationStoryboard*, IUIAnimationTransition, UI_ANIMATION_KEYFRAME*, HRESULT)
    add_transition_at_keyframe : Proc(IUIAnimationStoryboard*, IUIAnimationVariable, IUIAnimationTransition, UI_ANIMATION_KEYFRAME, HRESULT)
    add_transition_between_keyframes : Proc(IUIAnimationStoryboard*, IUIAnimationVariable, IUIAnimationTransition, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, HRESULT)
    repeat_between_keyframes : Proc(IUIAnimationStoryboard*, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, Int32, HRESULT)
    hold_variable : Proc(IUIAnimationStoryboard*, IUIAnimationVariable, HRESULT)
    set_longest_acceptable_delay : Proc(IUIAnimationStoryboard*, Float64, HRESULT)
    schedule : Proc(IUIAnimationStoryboard*, Float64, UI_ANIMATION_SCHEDULING_RESULT*, HRESULT)
    conclude : Proc(IUIAnimationStoryboard*, HRESULT)
    finish : Proc(IUIAnimationStoryboard*, Float64, HRESULT)
    abandon : Proc(IUIAnimationStoryboard*, HRESULT)
    set_tag : Proc(IUIAnimationStoryboard*, IUnknown, UInt32, HRESULT)
    get_tag : Proc(IUIAnimationStoryboard*, IUnknown*, UInt32*, HRESULT)
    get_status : Proc(IUIAnimationStoryboard*, UI_ANIMATION_STORYBOARD_STATUS*, HRESULT)
    get_elapsed_time : Proc(IUIAnimationStoryboard*, Float64*, HRESULT)
    set_storyboard_event_handler : Proc(IUIAnimationStoryboard*, IUIAnimationStoryboardEventHandler, HRESULT)
  end

  IUIAnimationStoryboard_GUID = LibC::GUID.new("a8ff128f-9bf9-4af1-9e67-e5e410defb84")
  CLSID_IUIAnimationStoryboard = "a8ff128f-9bf9-4af1-9e67-e5e410defb84"
  struct IUIAnimationStoryboard
    lpVtbl : IUIAnimationStoryboardVTbl*
  end

  struct IUIAnimationTransitionVTbl
    query_interface : Proc(IUIAnimationTransition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransition*, UInt32)
    release : Proc(IUIAnimationTransition*, UInt32)
    set_initial_value : Proc(IUIAnimationTransition*, Float64, HRESULT)
    set_initial_velocity : Proc(IUIAnimationTransition*, Float64, HRESULT)
    is_duration_known : Proc(IUIAnimationTransition*, HRESULT)
    get_duration : Proc(IUIAnimationTransition*, Float64*, HRESULT)
  end

  IUIAnimationTransition_GUID = LibC::GUID.new("dc6ce252-f731-41cf-b610-614b6ca049ad")
  CLSID_IUIAnimationTransition = "dc6ce252-f731-41cf-b610-614b6ca049ad"
  struct IUIAnimationTransition
    lpVtbl : IUIAnimationTransitionVTbl*
  end

  struct IUIAnimationManagerEventHandlerVTbl
    query_interface : Proc(IUIAnimationManagerEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationManagerEventHandler*, UInt32)
    release : Proc(IUIAnimationManagerEventHandler*, UInt32)
    on_manager_status_changed : Proc(IUIAnimationManagerEventHandler*, UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS, HRESULT)
  end

  IUIAnimationManagerEventHandler_GUID = LibC::GUID.new("783321ed-78a3-4366-b574-6af607a64788")
  CLSID_IUIAnimationManagerEventHandler = "783321ed-78a3-4366-b574-6af607a64788"
  struct IUIAnimationManagerEventHandler
    lpVtbl : IUIAnimationManagerEventHandlerVTbl*
  end

  struct IUIAnimationVariableChangeHandlerVTbl
    query_interface : Proc(IUIAnimationVariableChangeHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableChangeHandler*, UInt32)
    release : Proc(IUIAnimationVariableChangeHandler*, UInt32)
    on_value_changed : Proc(IUIAnimationVariableChangeHandler*, IUIAnimationStoryboard, IUIAnimationVariable, Float64, Float64, HRESULT)
  end

  IUIAnimationVariableChangeHandler_GUID = LibC::GUID.new("6358b7ba-87d2-42d5-bf71-82e919dd5862")
  CLSID_IUIAnimationVariableChangeHandler = "6358b7ba-87d2-42d5-bf71-82e919dd5862"
  struct IUIAnimationVariableChangeHandler
    lpVtbl : IUIAnimationVariableChangeHandlerVTbl*
  end

  struct IUIAnimationVariableIntegerChangeHandlerVTbl
    query_interface : Proc(IUIAnimationVariableIntegerChangeHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableIntegerChangeHandler*, UInt32)
    release : Proc(IUIAnimationVariableIntegerChangeHandler*, UInt32)
    on_integer_value_changed : Proc(IUIAnimationVariableIntegerChangeHandler*, IUIAnimationStoryboard, IUIAnimationVariable, Int32, Int32, HRESULT)
  end

  IUIAnimationVariableIntegerChangeHandler_GUID = LibC::GUID.new("bb3e1550-356e-44b0-99da-85ac6017865e")
  CLSID_IUIAnimationVariableIntegerChangeHandler = "bb3e1550-356e-44b0-99da-85ac6017865e"
  struct IUIAnimationVariableIntegerChangeHandler
    lpVtbl : IUIAnimationVariableIntegerChangeHandlerVTbl*
  end

  struct IUIAnimationStoryboardEventHandlerVTbl
    query_interface : Proc(IUIAnimationStoryboardEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationStoryboardEventHandler*, UInt32)
    release : Proc(IUIAnimationStoryboardEventHandler*, UInt32)
    on_storyboard_status_changed : Proc(IUIAnimationStoryboardEventHandler*, IUIAnimationStoryboard, UI_ANIMATION_STORYBOARD_STATUS, UI_ANIMATION_STORYBOARD_STATUS, HRESULT)
    on_storyboard_updated : Proc(IUIAnimationStoryboardEventHandler*, IUIAnimationStoryboard, HRESULT)
  end

  IUIAnimationStoryboardEventHandler_GUID = LibC::GUID.new("3d5c9008-ec7c-4364-9f8a-9af3c58cbae6")
  CLSID_IUIAnimationStoryboardEventHandler = "3d5c9008-ec7c-4364-9f8a-9af3c58cbae6"
  struct IUIAnimationStoryboardEventHandler
    lpVtbl : IUIAnimationStoryboardEventHandlerVTbl*
  end

  struct IUIAnimationPriorityComparisonVTbl
    query_interface : Proc(IUIAnimationPriorityComparison*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationPriorityComparison*, UInt32)
    release : Proc(IUIAnimationPriorityComparison*, UInt32)
    has_priority : Proc(IUIAnimationPriorityComparison*, IUIAnimationStoryboard, IUIAnimationStoryboard, UI_ANIMATION_PRIORITY_EFFECT, HRESULT)
  end

  IUIAnimationPriorityComparison_GUID = LibC::GUID.new("83fa9b74-5f86-4618-bc6a-a2fac19b3f44")
  CLSID_IUIAnimationPriorityComparison = "83fa9b74-5f86-4618-bc6a-a2fac19b3f44"
  struct IUIAnimationPriorityComparison
    lpVtbl : IUIAnimationPriorityComparisonVTbl*
  end

  struct IUIAnimationTransitionLibraryVTbl
    query_interface : Proc(IUIAnimationTransitionLibrary*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransitionLibrary*, UInt32)
    release : Proc(IUIAnimationTransitionLibrary*, UInt32)
    create_instantaneous_transition : Proc(IUIAnimationTransitionLibrary*, Float64, IUIAnimationTransition*, HRESULT)
    create_constant_transition : Proc(IUIAnimationTransitionLibrary*, Float64, IUIAnimationTransition*, HRESULT)
    create_discrete_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_linear_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_linear_transition_from_speed : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_sinusoidal_transition_from_velocity : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_sinusoidal_transition_from_range : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Float64, UI_ANIMATION_SLOPE, IUIAnimationTransition*, HRESULT)
    create_accelerate_decelerate_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_reversal_transition : Proc(IUIAnimationTransitionLibrary*, Float64, IUIAnimationTransition*, HRESULT)
    create_cubic_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_smooth_stop_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, IUIAnimationTransition*, HRESULT)
    create_parabolic_transition_from_acceleration : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)
  end

  IUIAnimationTransitionLibrary_GUID = LibC::GUID.new("ca5a14b1-d24f-48b8-8fe4-c78169ba954e")
  CLSID_IUIAnimationTransitionLibrary = "ca5a14b1-d24f-48b8-8fe4-c78169ba954e"
  struct IUIAnimationTransitionLibrary
    lpVtbl : IUIAnimationTransitionLibraryVTbl*
  end

  struct IUIAnimationInterpolatorVTbl
    query_interface : Proc(IUIAnimationInterpolator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationInterpolator*, UInt32)
    release : Proc(IUIAnimationInterpolator*, UInt32)
    set_initial_value_and_velocity : Proc(IUIAnimationInterpolator*, Float64, Float64, HRESULT)
    set_duration : Proc(IUIAnimationInterpolator*, Float64, HRESULT)
    get_duration : Proc(IUIAnimationInterpolator*, Float64*, HRESULT)
    get_final_value : Proc(IUIAnimationInterpolator*, Float64*, HRESULT)
    interpolate_value : Proc(IUIAnimationInterpolator*, Float64, Float64*, HRESULT)
    interpolate_velocity : Proc(IUIAnimationInterpolator*, Float64, Float64*, HRESULT)
    get_dependencies : Proc(IUIAnimationInterpolator*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, HRESULT)
  end

  IUIAnimationInterpolator_GUID = LibC::GUID.new("7815cbba-ddf7-478c-a46c-7b6c738b7978")
  CLSID_IUIAnimationInterpolator = "7815cbba-ddf7-478c-a46c-7b6c738b7978"
  struct IUIAnimationInterpolator
    lpVtbl : IUIAnimationInterpolatorVTbl*
  end

  struct IUIAnimationTransitionFactoryVTbl
    query_interface : Proc(IUIAnimationTransitionFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransitionFactory*, UInt32)
    release : Proc(IUIAnimationTransitionFactory*, UInt32)
    create_transition : Proc(IUIAnimationTransitionFactory*, IUIAnimationInterpolator, IUIAnimationTransition*, HRESULT)
  end

  IUIAnimationTransitionFactory_GUID = LibC::GUID.new("fcd91e03-3e3b-45ad-bbb1-6dfc8153743d")
  CLSID_IUIAnimationTransitionFactory = "fcd91e03-3e3b-45ad-bbb1-6dfc8153743d"
  struct IUIAnimationTransitionFactory
    lpVtbl : IUIAnimationTransitionFactoryVTbl*
  end

  struct IUIAnimationTimerVTbl
    query_interface : Proc(IUIAnimationTimer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTimer*, UInt32)
    release : Proc(IUIAnimationTimer*, UInt32)
    set_timer_update_handler : Proc(IUIAnimationTimer*, IUIAnimationTimerUpdateHandler, UI_ANIMATION_IDLE_BEHAVIOR, HRESULT)
    set_timer_event_handler : Proc(IUIAnimationTimer*, IUIAnimationTimerEventHandler, HRESULT)
    enable : Proc(IUIAnimationTimer*, HRESULT)
    disable : Proc(IUIAnimationTimer*, HRESULT)
    is_enabled : Proc(IUIAnimationTimer*, HRESULT)
    get_time : Proc(IUIAnimationTimer*, Float64*, HRESULT)
    set_frame_rate_threshold : Proc(IUIAnimationTimer*, UInt32, HRESULT)
  end

  IUIAnimationTimer_GUID = LibC::GUID.new("6b0efad1-a053-41d6-9085-33a689144665")
  CLSID_IUIAnimationTimer = "6b0efad1-a053-41d6-9085-33a689144665"
  struct IUIAnimationTimer
    lpVtbl : IUIAnimationTimerVTbl*
  end

  struct IUIAnimationTimerUpdateHandlerVTbl
    query_interface : Proc(IUIAnimationTimerUpdateHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTimerUpdateHandler*, UInt32)
    release : Proc(IUIAnimationTimerUpdateHandler*, UInt32)
    on_update : Proc(IUIAnimationTimerUpdateHandler*, Float64, UI_ANIMATION_UPDATE_RESULT*, HRESULT)
    set_timer_client_event_handler : Proc(IUIAnimationTimerUpdateHandler*, IUIAnimationTimerClientEventHandler, HRESULT)
    clear_timer_client_event_handler : Proc(IUIAnimationTimerUpdateHandler*, HRESULT)
  end

  IUIAnimationTimerUpdateHandler_GUID = LibC::GUID.new("195509b7-5d5e-4e3e-b278-ee3759b367ad")
  CLSID_IUIAnimationTimerUpdateHandler = "195509b7-5d5e-4e3e-b278-ee3759b367ad"
  struct IUIAnimationTimerUpdateHandler
    lpVtbl : IUIAnimationTimerUpdateHandlerVTbl*
  end

  struct IUIAnimationTimerClientEventHandlerVTbl
    query_interface : Proc(IUIAnimationTimerClientEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTimerClientEventHandler*, UInt32)
    release : Proc(IUIAnimationTimerClientEventHandler*, UInt32)
    on_timer_client_status_changed : Proc(IUIAnimationTimerClientEventHandler*, UI_ANIMATION_TIMER_CLIENT_STATUS, UI_ANIMATION_TIMER_CLIENT_STATUS, HRESULT)
  end

  IUIAnimationTimerClientEventHandler_GUID = LibC::GUID.new("bedb4db6-94fa-4bfb-a47f-ef2d9e408c25")
  CLSID_IUIAnimationTimerClientEventHandler = "bedb4db6-94fa-4bfb-a47f-ef2d9e408c25"
  struct IUIAnimationTimerClientEventHandler
    lpVtbl : IUIAnimationTimerClientEventHandlerVTbl*
  end

  struct IUIAnimationTimerEventHandlerVTbl
    query_interface : Proc(IUIAnimationTimerEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTimerEventHandler*, UInt32)
    release : Proc(IUIAnimationTimerEventHandler*, UInt32)
    on_pre_update : Proc(IUIAnimationTimerEventHandler*, HRESULT)
    on_post_update : Proc(IUIAnimationTimerEventHandler*, HRESULT)
    on_rendering_too_slow : Proc(IUIAnimationTimerEventHandler*, UInt32, HRESULT)
  end

  IUIAnimationTimerEventHandler_GUID = LibC::GUID.new("274a7dea-d771-4095-abbd-8df7abd23ce3")
  CLSID_IUIAnimationTimerEventHandler = "274a7dea-d771-4095-abbd-8df7abd23ce3"
  struct IUIAnimationTimerEventHandler
    lpVtbl : IUIAnimationTimerEventHandlerVTbl*
  end

  struct IUIAnimationManager2VTbl
    query_interface : Proc(IUIAnimationManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationManager2*, UInt32)
    release : Proc(IUIAnimationManager2*, UInt32)
    create_animation_vector_variable : Proc(IUIAnimationManager2*, Float64*, UInt32, IUIAnimationVariable2*, HRESULT)
    create_animation_variable : Proc(IUIAnimationManager2*, Float64, IUIAnimationVariable2*, HRESULT)
    schedule_transition : Proc(IUIAnimationManager2*, IUIAnimationVariable2, IUIAnimationTransition2, Float64, HRESULT)
    create_storyboard : Proc(IUIAnimationManager2*, IUIAnimationStoryboard2*, HRESULT)
    finish_all_storyboards : Proc(IUIAnimationManager2*, Float64, HRESULT)
    abandon_all_storyboards : Proc(IUIAnimationManager2*, HRESULT)
    update : Proc(IUIAnimationManager2*, Float64, UI_ANIMATION_UPDATE_RESULT*, HRESULT)
    get_variable_from_tag : Proc(IUIAnimationManager2*, IUnknown, UInt32, IUIAnimationVariable2*, HRESULT)
    get_storyboard_from_tag : Proc(IUIAnimationManager2*, IUnknown, UInt32, IUIAnimationStoryboard2*, HRESULT)
    estimate_next_event_time : Proc(IUIAnimationManager2*, Float64*, HRESULT)
    get_status : Proc(IUIAnimationManager2*, UI_ANIMATION_MANAGER_STATUS*, HRESULT)
    set_animation_mode : Proc(IUIAnimationManager2*, UI_ANIMATION_MODE, HRESULT)
    pause : Proc(IUIAnimationManager2*, HRESULT)
    resume : Proc(IUIAnimationManager2*, HRESULT)
    set_manager_event_handler : Proc(IUIAnimationManager2*, IUIAnimationManagerEventHandler2, LibC::BOOL, HRESULT)
    set_cancel_priority_comparison : Proc(IUIAnimationManager2*, IUIAnimationPriorityComparison2, HRESULT)
    set_trim_priority_comparison : Proc(IUIAnimationManager2*, IUIAnimationPriorityComparison2, HRESULT)
    set_compress_priority_comparison : Proc(IUIAnimationManager2*, IUIAnimationPriorityComparison2, HRESULT)
    set_conclude_priority_comparison : Proc(IUIAnimationManager2*, IUIAnimationPriorityComparison2, HRESULT)
    set_default_longest_acceptable_delay : Proc(IUIAnimationManager2*, Float64, HRESULT)
    shutdown : Proc(IUIAnimationManager2*, HRESULT)
  end

  IUIAnimationManager2_GUID = LibC::GUID.new("d8b6f7d4-4109-4d3f-acee-879926968cb1")
  CLSID_IUIAnimationManager2 = "d8b6f7d4-4109-4d3f-acee-879926968cb1"
  struct IUIAnimationManager2
    lpVtbl : IUIAnimationManager2VTbl*
  end

  struct IUIAnimationVariable2VTbl
    query_interface : Proc(IUIAnimationVariable2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariable2*, UInt32)
    release : Proc(IUIAnimationVariable2*, UInt32)
    get_dimension : Proc(IUIAnimationVariable2*, UInt32*, HRESULT)
    get_value : Proc(IUIAnimationVariable2*, Float64*, HRESULT)
    get_vector_value : Proc(IUIAnimationVariable2*, Float64*, UInt32, HRESULT)
    get_curve : Proc(IUIAnimationVariable2*, IDCompositionAnimation, HRESULT)
    get_vector_curve : Proc(IUIAnimationVariable2*, IDCompositionAnimation*, UInt32, HRESULT)
    get_final_value : Proc(IUIAnimationVariable2*, Float64*, HRESULT)
    get_final_vector_value : Proc(IUIAnimationVariable2*, Float64*, UInt32, HRESULT)
    get_previous_value : Proc(IUIAnimationVariable2*, Float64*, HRESULT)
    get_previous_vector_value : Proc(IUIAnimationVariable2*, Float64*, UInt32, HRESULT)
    get_integer_value : Proc(IUIAnimationVariable2*, Int32*, HRESULT)
    get_integer_vector_value : Proc(IUIAnimationVariable2*, Int32*, UInt32, HRESULT)
    get_final_integer_value : Proc(IUIAnimationVariable2*, Int32*, HRESULT)
    get_final_integer_vector_value : Proc(IUIAnimationVariable2*, Int32*, UInt32, HRESULT)
    get_previous_integer_value : Proc(IUIAnimationVariable2*, Int32*, HRESULT)
    get_previous_integer_vector_value : Proc(IUIAnimationVariable2*, Int32*, UInt32, HRESULT)
    get_current_storyboard : Proc(IUIAnimationVariable2*, IUIAnimationStoryboard2*, HRESULT)
    set_lower_bound : Proc(IUIAnimationVariable2*, Float64, HRESULT)
    set_lower_bound_vector : Proc(IUIAnimationVariable2*, Float64*, UInt32, HRESULT)
    set_upper_bound : Proc(IUIAnimationVariable2*, Float64, HRESULT)
    set_upper_bound_vector : Proc(IUIAnimationVariable2*, Float64*, UInt32, HRESULT)
    set_rounding_mode : Proc(IUIAnimationVariable2*, UI_ANIMATION_ROUNDING_MODE, HRESULT)
    set_tag : Proc(IUIAnimationVariable2*, IUnknown, UInt32, HRESULT)
    get_tag : Proc(IUIAnimationVariable2*, IUnknown*, UInt32*, HRESULT)
    set_variable_change_handler : Proc(IUIAnimationVariable2*, IUIAnimationVariableChangeHandler2, LibC::BOOL, HRESULT)
    set_variable_integer_change_handler : Proc(IUIAnimationVariable2*, IUIAnimationVariableIntegerChangeHandler2, LibC::BOOL, HRESULT)
    set_variable_curve_change_handler : Proc(IUIAnimationVariable2*, IUIAnimationVariableCurveChangeHandler2, HRESULT)
  end

  IUIAnimationVariable2_GUID = LibC::GUID.new("4914b304-96ab-44d9-9e77-d5109b7e7466")
  CLSID_IUIAnimationVariable2 = "4914b304-96ab-44d9-9e77-d5109b7e7466"
  struct IUIAnimationVariable2
    lpVtbl : IUIAnimationVariable2VTbl*
  end

  struct IUIAnimationTransition2VTbl
    query_interface : Proc(IUIAnimationTransition2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransition2*, UInt32)
    release : Proc(IUIAnimationTransition2*, UInt32)
    get_dimension : Proc(IUIAnimationTransition2*, UInt32*, HRESULT)
    set_initial_value : Proc(IUIAnimationTransition2*, Float64, HRESULT)
    set_initial_vector_value : Proc(IUIAnimationTransition2*, Float64*, UInt32, HRESULT)
    set_initial_velocity : Proc(IUIAnimationTransition2*, Float64, HRESULT)
    set_initial_vector_velocity : Proc(IUIAnimationTransition2*, Float64*, UInt32, HRESULT)
    is_duration_known : Proc(IUIAnimationTransition2*, HRESULT)
    get_duration : Proc(IUIAnimationTransition2*, Float64*, HRESULT)
  end

  IUIAnimationTransition2_GUID = LibC::GUID.new("62ff9123-a85a-4e9b-a218-435a93e268fd")
  CLSID_IUIAnimationTransition2 = "62ff9123-a85a-4e9b-a218-435a93e268fd"
  struct IUIAnimationTransition2
    lpVtbl : IUIAnimationTransition2VTbl*
  end

  struct IUIAnimationManagerEventHandler2VTbl
    query_interface : Proc(IUIAnimationManagerEventHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationManagerEventHandler2*, UInt32)
    release : Proc(IUIAnimationManagerEventHandler2*, UInt32)
    on_manager_status_changed : Proc(IUIAnimationManagerEventHandler2*, UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS, HRESULT)
  end

  IUIAnimationManagerEventHandler2_GUID = LibC::GUID.new("f6e022ba-bff3-42ec-9033-e073f33e83c3")
  CLSID_IUIAnimationManagerEventHandler2 = "f6e022ba-bff3-42ec-9033-e073f33e83c3"
  struct IUIAnimationManagerEventHandler2
    lpVtbl : IUIAnimationManagerEventHandler2VTbl*
  end

  struct IUIAnimationVariableChangeHandler2VTbl
    query_interface : Proc(IUIAnimationVariableChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableChangeHandler2*, UInt32)
    release : Proc(IUIAnimationVariableChangeHandler2*, UInt32)
    on_value_changed : Proc(IUIAnimationVariableChangeHandler2*, IUIAnimationStoryboard2, IUIAnimationVariable2, Float64*, Float64*, UInt32, HRESULT)
  end

  IUIAnimationVariableChangeHandler2_GUID = LibC::GUID.new("63acc8d2-6eae-4bb0-b879-586dd8cfbe42")
  CLSID_IUIAnimationVariableChangeHandler2 = "63acc8d2-6eae-4bb0-b879-586dd8cfbe42"
  struct IUIAnimationVariableChangeHandler2
    lpVtbl : IUIAnimationVariableChangeHandler2VTbl*
  end

  struct IUIAnimationVariableIntegerChangeHandler2VTbl
    query_interface : Proc(IUIAnimationVariableIntegerChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableIntegerChangeHandler2*, UInt32)
    release : Proc(IUIAnimationVariableIntegerChangeHandler2*, UInt32)
    on_integer_value_changed : Proc(IUIAnimationVariableIntegerChangeHandler2*, IUIAnimationStoryboard2, IUIAnimationVariable2, Int32*, Int32*, UInt32, HRESULT)
  end

  IUIAnimationVariableIntegerChangeHandler2_GUID = LibC::GUID.new("829b6cf1-4f3a-4412-ae09-b243eb4c6b58")
  CLSID_IUIAnimationVariableIntegerChangeHandler2 = "829b6cf1-4f3a-4412-ae09-b243eb4c6b58"
  struct IUIAnimationVariableIntegerChangeHandler2
    lpVtbl : IUIAnimationVariableIntegerChangeHandler2VTbl*
  end

  struct IUIAnimationVariableCurveChangeHandler2VTbl
    query_interface : Proc(IUIAnimationVariableCurveChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableCurveChangeHandler2*, UInt32)
    release : Proc(IUIAnimationVariableCurveChangeHandler2*, UInt32)
    on_curve_changed : Proc(IUIAnimationVariableCurveChangeHandler2*, IUIAnimationVariable2, HRESULT)
  end

  IUIAnimationVariableCurveChangeHandler2_GUID = LibC::GUID.new("72895e91-0145-4c21-9192-5aab40eddf80")
  CLSID_IUIAnimationVariableCurveChangeHandler2 = "72895e91-0145-4c21-9192-5aab40eddf80"
  struct IUIAnimationVariableCurveChangeHandler2
    lpVtbl : IUIAnimationVariableCurveChangeHandler2VTbl*
  end

  struct IUIAnimationStoryboardEventHandler2VTbl
    query_interface : Proc(IUIAnimationStoryboardEventHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationStoryboardEventHandler2*, UInt32)
    release : Proc(IUIAnimationStoryboardEventHandler2*, UInt32)
    on_storyboard_status_changed : Proc(IUIAnimationStoryboardEventHandler2*, IUIAnimationStoryboard2, UI_ANIMATION_STORYBOARD_STATUS, UI_ANIMATION_STORYBOARD_STATUS, HRESULT)
    on_storyboard_updated : Proc(IUIAnimationStoryboardEventHandler2*, IUIAnimationStoryboard2, HRESULT)
  end

  IUIAnimationStoryboardEventHandler2_GUID = LibC::GUID.new("bac5f55a-ba7c-414c-b599-fbf850f553c6")
  CLSID_IUIAnimationStoryboardEventHandler2 = "bac5f55a-ba7c-414c-b599-fbf850f553c6"
  struct IUIAnimationStoryboardEventHandler2
    lpVtbl : IUIAnimationStoryboardEventHandler2VTbl*
  end

  struct IUIAnimationLoopIterationChangeHandler2VTbl
    query_interface : Proc(IUIAnimationLoopIterationChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationLoopIterationChangeHandler2*, UInt32)
    release : Proc(IUIAnimationLoopIterationChangeHandler2*, UInt32)
    on_loop_iteration_changed : Proc(IUIAnimationLoopIterationChangeHandler2*, IUIAnimationStoryboard2, LibC::UINT_PTR, UInt32, UInt32, HRESULT)
  end

  IUIAnimationLoopIterationChangeHandler2_GUID = LibC::GUID.new("2d3b15a4-4762-47ab-a030-b23221df3ae0")
  CLSID_IUIAnimationLoopIterationChangeHandler2 = "2d3b15a4-4762-47ab-a030-b23221df3ae0"
  struct IUIAnimationLoopIterationChangeHandler2
    lpVtbl : IUIAnimationLoopIterationChangeHandler2VTbl*
  end

  struct IUIAnimationPriorityComparison2VTbl
    query_interface : Proc(IUIAnimationPriorityComparison2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationPriorityComparison2*, UInt32)
    release : Proc(IUIAnimationPriorityComparison2*, UInt32)
    has_priority : Proc(IUIAnimationPriorityComparison2*, IUIAnimationStoryboard2, IUIAnimationStoryboard2, UI_ANIMATION_PRIORITY_EFFECT, HRESULT)
  end

  IUIAnimationPriorityComparison2_GUID = LibC::GUID.new("5b6d7a37-4621-467c-8b05-70131de62ddb")
  CLSID_IUIAnimationPriorityComparison2 = "5b6d7a37-4621-467c-8b05-70131de62ddb"
  struct IUIAnimationPriorityComparison2
    lpVtbl : IUIAnimationPriorityComparison2VTbl*
  end

  struct IUIAnimationTransitionLibrary2VTbl
    query_interface : Proc(IUIAnimationTransitionLibrary2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransitionLibrary2*, UInt32)
    release : Proc(IUIAnimationTransitionLibrary2*, UInt32)
    create_instantaneous_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, IUIAnimationTransition2*, HRESULT)
    create_instantaneous_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)
    create_constant_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, IUIAnimationTransition2*, HRESULT)
    create_discrete_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_discrete_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, Float64, IUIAnimationTransition2*, HRESULT)
    create_linear_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_linear_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)
    create_linear_transition_from_speed : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_linear_vector_transition_from_speed : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)
    create_sinusoidal_transition_from_velocity : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_sinusoidal_transition_from_range : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Float64, UI_ANIMATION_SLOPE, IUIAnimationTransition2*, HRESULT)
    create_accelerate_decelerate_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_reversal_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, IUIAnimationTransition2*, HRESULT)
    create_cubic_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_cubic_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)
    create_smooth_stop_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_parabolic_transition_from_acceleration : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_cubic_bezier_linear_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)
    create_cubic_bezier_linear_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, Float64, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)
  end

  IUIAnimationTransitionLibrary2_GUID = LibC::GUID.new("03cfae53-9580-4ee3-b363-2ece51b4af6a")
  CLSID_IUIAnimationTransitionLibrary2 = "03cfae53-9580-4ee3-b363-2ece51b4af6a"
  struct IUIAnimationTransitionLibrary2
    lpVtbl : IUIAnimationTransitionLibrary2VTbl*
  end

  struct IUIAnimationPrimitiveInterpolationVTbl
    query_interface : Proc(IUIAnimationPrimitiveInterpolation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationPrimitiveInterpolation*, UInt32)
    release : Proc(IUIAnimationPrimitiveInterpolation*, UInt32)
    add_cubic : Proc(IUIAnimationPrimitiveInterpolation*, UInt32, Float64, Float32, Float32, Float32, Float32, HRESULT)
    add_sinusoidal : Proc(IUIAnimationPrimitiveInterpolation*, UInt32, Float64, Float32, Float32, Float32, Float32, HRESULT)
  end

  IUIAnimationPrimitiveInterpolation_GUID = LibC::GUID.new("bab20d63-4361-45da-a24f-ab8508846b5b")
  CLSID_IUIAnimationPrimitiveInterpolation = "bab20d63-4361-45da-a24f-ab8508846b5b"
  struct IUIAnimationPrimitiveInterpolation
    lpVtbl : IUIAnimationPrimitiveInterpolationVTbl*
  end

  struct IUIAnimationInterpolator2VTbl
    query_interface : Proc(IUIAnimationInterpolator2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationInterpolator2*, UInt32)
    release : Proc(IUIAnimationInterpolator2*, UInt32)
    get_dimension : Proc(IUIAnimationInterpolator2*, UInt32*, HRESULT)
    set_initial_value_and_velocity : Proc(IUIAnimationInterpolator2*, Float64*, Float64*, UInt32, HRESULT)
    set_duration : Proc(IUIAnimationInterpolator2*, Float64, HRESULT)
    get_duration : Proc(IUIAnimationInterpolator2*, Float64*, HRESULT)
    get_final_value : Proc(IUIAnimationInterpolator2*, Float64*, UInt32, HRESULT)
    interpolate_value : Proc(IUIAnimationInterpolator2*, Float64, Float64*, UInt32, HRESULT)
    interpolate_velocity : Proc(IUIAnimationInterpolator2*, Float64, Float64*, UInt32, HRESULT)
    get_primitive_interpolation : Proc(IUIAnimationInterpolator2*, IUIAnimationPrimitiveInterpolation, UInt32, HRESULT)
    get_dependencies : Proc(IUIAnimationInterpolator2*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, HRESULT)
  end

  IUIAnimationInterpolator2_GUID = LibC::GUID.new("ea76aff8-ea22-4a23-a0ef-a6a966703518")
  CLSID_IUIAnimationInterpolator2 = "ea76aff8-ea22-4a23-a0ef-a6a966703518"
  struct IUIAnimationInterpolator2
    lpVtbl : IUIAnimationInterpolator2VTbl*
  end

  struct IUIAnimationTransitionFactory2VTbl
    query_interface : Proc(IUIAnimationTransitionFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransitionFactory2*, UInt32)
    release : Proc(IUIAnimationTransitionFactory2*, UInt32)
    create_transition : Proc(IUIAnimationTransitionFactory2*, IUIAnimationInterpolator2, IUIAnimationTransition2*, HRESULT)
  end

  IUIAnimationTransitionFactory2_GUID = LibC::GUID.new("937d4916-c1a6-42d5-88d8-30344d6efe31")
  CLSID_IUIAnimationTransitionFactory2 = "937d4916-c1a6-42d5-88d8-30344d6efe31"
  struct IUIAnimationTransitionFactory2
    lpVtbl : IUIAnimationTransitionFactory2VTbl*
  end

  struct IUIAnimationStoryboard2VTbl
    query_interface : Proc(IUIAnimationStoryboard2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationStoryboard2*, UInt32)
    release : Proc(IUIAnimationStoryboard2*, UInt32)
    add_transition : Proc(IUIAnimationStoryboard2*, IUIAnimationVariable2, IUIAnimationTransition2, HRESULT)
    add_keyframe_at_offset : Proc(IUIAnimationStoryboard2*, UI_ANIMATION_KEYFRAME, Float64, UI_ANIMATION_KEYFRAME*, HRESULT)
    add_keyframe_after_transition : Proc(IUIAnimationStoryboard2*, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME*, HRESULT)
    add_transition_at_keyframe : Proc(IUIAnimationStoryboard2*, IUIAnimationVariable2, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME, HRESULT)
    add_transition_between_keyframes : Proc(IUIAnimationStoryboard2*, IUIAnimationVariable2, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, HRESULT)
    repeat_between_keyframes : Proc(IUIAnimationStoryboard2*, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, Float64, UI_ANIMATION_REPEAT_MODE, IUIAnimationLoopIterationChangeHandler2, LibC::UINT_PTR, LibC::BOOL, HRESULT)
    hold_variable : Proc(IUIAnimationStoryboard2*, IUIAnimationVariable2, HRESULT)
    set_longest_acceptable_delay : Proc(IUIAnimationStoryboard2*, Float64, HRESULT)
    set_skip_duration : Proc(IUIAnimationStoryboard2*, Float64, HRESULT)
    schedule : Proc(IUIAnimationStoryboard2*, Float64, UI_ANIMATION_SCHEDULING_RESULT*, HRESULT)
    conclude : Proc(IUIAnimationStoryboard2*, HRESULT)
    finish : Proc(IUIAnimationStoryboard2*, Float64, HRESULT)
    abandon : Proc(IUIAnimationStoryboard2*, HRESULT)
    set_tag : Proc(IUIAnimationStoryboard2*, IUnknown, UInt32, HRESULT)
    get_tag : Proc(IUIAnimationStoryboard2*, IUnknown*, UInt32*, HRESULT)
    get_status : Proc(IUIAnimationStoryboard2*, UI_ANIMATION_STORYBOARD_STATUS*, HRESULT)
    get_elapsed_time : Proc(IUIAnimationStoryboard2*, Float64*, HRESULT)
    set_storyboard_event_handler : Proc(IUIAnimationStoryboard2*, IUIAnimationStoryboardEventHandler2, LibC::BOOL, LibC::BOOL, HRESULT)
  end

  IUIAnimationStoryboard2_GUID = LibC::GUID.new("ae289cd2-12d4-4945-9419-9e41be034df2")
  CLSID_IUIAnimationStoryboard2 = "ae289cd2-12d4-4945-9419-9e41be034df2"
  struct IUIAnimationStoryboard2
    lpVtbl : IUIAnimationStoryboard2VTbl*
  end

end
