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
  CLSID_UIAnimationManager = LibC::GUID.new(0x4c1fc63a_u32, 0x695c_u16, 0x47e8_u16, StaticArray[0xa3_u8, 0x39_u8, 0x1a_u8, 0x19_u8, 0x4b_u8, 0xe3_u8, 0xd0_u8, 0xb8_u8])
  CLSID_UIAnimationManager2 = LibC::GUID.new(0xd25d8842_u32, 0x8884_u16, 0x4a4a_u16, StaticArray[0xb3_u8, 0x21_u8, 0x9_u8, 0x13_u8, 0x14_u8, 0x37_u8, 0x9b_u8, 0xdd_u8])
  CLSID_UIAnimationTransitionLibrary = LibC::GUID.new(0x1d6322ad_u32, 0xaa85_u16, 0x4ef5_u16, StaticArray[0xa8_u8, 0x28_u8, 0x86_u8, 0xd7_u8, 0x10_u8, 0x67_u8, 0xd1_u8, 0x45_u8])
  CLSID_UIAnimationTransitionLibrary2 = LibC::GUID.new(0x812f944a_u32, 0xc5c8_u16, 0x4cd9_u16, StaticArray[0xb0_u8, 0xa6_u8, 0xb3_u8, 0xda_u8, 0x80_u8, 0x2f_u8, 0x22_u8, 0x8d_u8])
  CLSID_UIAnimationTransitionFactory = LibC::GUID.new(0x8a9b1cdd_u32, 0xfcd7_u16, 0x419c_u16, StaticArray[0x8b_u8, 0x44_u8, 0x42_u8, 0xfd_u8, 0x17_u8, 0xdb_u8, 0x18_u8, 0x87_u8])
  CLSID_UIAnimationTransitionFactory2 = LibC::GUID.new(0x84302f97_u32, 0x7f7b_u16, 0x4040_u16, StaticArray[0xb1_u8, 0x90_u8, 0x72_u8, 0xac_u8, 0x9d_u8, 0x18_u8, 0xe4_u8, 0x20_u8])
  CLSID_UIAnimationTimer = LibC::GUID.new(0xbfcd4a0c_u32, 0x6b6_u16, 0x4384_u16, StaticArray[0xb7_u8, 0x68_u8, 0xd_u8, 0xaa_u8, 0x79_u8, 0x2c_u8, 0x38_u8, 0xe_u8])


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

  IUIAnimationManager_GUID = "9169896c-ac8d-4e7d-94e5-67fa4dc2f2e8"
  IID_IUIAnimationManager = LibC::GUID.new(0x9169896c_u32, 0xac8d_u16, 0x4e7d_u16, StaticArray[0x94_u8, 0xe5_u8, 0x67_u8, 0xfa_u8, 0x4d_u8, 0xc2_u8, 0xf2_u8, 0xe8_u8])
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

  IUIAnimationVariable_GUID = "8ceeb155-2849-4ce5-9448-91ff70e1e4d9"
  IID_IUIAnimationVariable = LibC::GUID.new(0x8ceeb155_u32, 0x2849_u16, 0x4ce5_u16, StaticArray[0x94_u8, 0x48_u8, 0x91_u8, 0xff_u8, 0x70_u8, 0xe1_u8, 0xe4_u8, 0xd9_u8])
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

  IUIAnimationStoryboard_GUID = "a8ff128f-9bf9-4af1-9e67-e5e410defb84"
  IID_IUIAnimationStoryboard = LibC::GUID.new(0xa8ff128f_u32, 0x9bf9_u16, 0x4af1_u16, StaticArray[0x9e_u8, 0x67_u8, 0xe5_u8, 0xe4_u8, 0x10_u8, 0xde_u8, 0xfb_u8, 0x84_u8])
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

  IUIAnimationTransition_GUID = "dc6ce252-f731-41cf-b610-614b6ca049ad"
  IID_IUIAnimationTransition = LibC::GUID.new(0xdc6ce252_u32, 0xf731_u16, 0x41cf_u16, StaticArray[0xb6_u8, 0x10_u8, 0x61_u8, 0x4b_u8, 0x6c_u8, 0xa0_u8, 0x49_u8, 0xad_u8])
  struct IUIAnimationTransition
    lpVtbl : IUIAnimationTransitionVTbl*
  end

  struct IUIAnimationManagerEventHandlerVTbl
    query_interface : Proc(IUIAnimationManagerEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationManagerEventHandler*, UInt32)
    release : Proc(IUIAnimationManagerEventHandler*, UInt32)
    on_manager_status_changed : Proc(IUIAnimationManagerEventHandler*, UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS, HRESULT)
  end

  IUIAnimationManagerEventHandler_GUID = "783321ed-78a3-4366-b574-6af607a64788"
  IID_IUIAnimationManagerEventHandler = LibC::GUID.new(0x783321ed_u32, 0x78a3_u16, 0x4366_u16, StaticArray[0xb5_u8, 0x74_u8, 0x6a_u8, 0xf6_u8, 0x7_u8, 0xa6_u8, 0x47_u8, 0x88_u8])
  struct IUIAnimationManagerEventHandler
    lpVtbl : IUIAnimationManagerEventHandlerVTbl*
  end

  struct IUIAnimationVariableChangeHandlerVTbl
    query_interface : Proc(IUIAnimationVariableChangeHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableChangeHandler*, UInt32)
    release : Proc(IUIAnimationVariableChangeHandler*, UInt32)
    on_value_changed : Proc(IUIAnimationVariableChangeHandler*, IUIAnimationStoryboard, IUIAnimationVariable, Float64, Float64, HRESULT)
  end

  IUIAnimationVariableChangeHandler_GUID = "6358b7ba-87d2-42d5-bf71-82e919dd5862"
  IID_IUIAnimationVariableChangeHandler = LibC::GUID.new(0x6358b7ba_u32, 0x87d2_u16, 0x42d5_u16, StaticArray[0xbf_u8, 0x71_u8, 0x82_u8, 0xe9_u8, 0x19_u8, 0xdd_u8, 0x58_u8, 0x62_u8])
  struct IUIAnimationVariableChangeHandler
    lpVtbl : IUIAnimationVariableChangeHandlerVTbl*
  end

  struct IUIAnimationVariableIntegerChangeHandlerVTbl
    query_interface : Proc(IUIAnimationVariableIntegerChangeHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableIntegerChangeHandler*, UInt32)
    release : Proc(IUIAnimationVariableIntegerChangeHandler*, UInt32)
    on_integer_value_changed : Proc(IUIAnimationVariableIntegerChangeHandler*, IUIAnimationStoryboard, IUIAnimationVariable, Int32, Int32, HRESULT)
  end

  IUIAnimationVariableIntegerChangeHandler_GUID = "bb3e1550-356e-44b0-99da-85ac6017865e"
  IID_IUIAnimationVariableIntegerChangeHandler = LibC::GUID.new(0xbb3e1550_u32, 0x356e_u16, 0x44b0_u16, StaticArray[0x99_u8, 0xda_u8, 0x85_u8, 0xac_u8, 0x60_u8, 0x17_u8, 0x86_u8, 0x5e_u8])
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

  IUIAnimationStoryboardEventHandler_GUID = "3d5c9008-ec7c-4364-9f8a-9af3c58cbae6"
  IID_IUIAnimationStoryboardEventHandler = LibC::GUID.new(0x3d5c9008_u32, 0xec7c_u16, 0x4364_u16, StaticArray[0x9f_u8, 0x8a_u8, 0x9a_u8, 0xf3_u8, 0xc5_u8, 0x8c_u8, 0xba_u8, 0xe6_u8])
  struct IUIAnimationStoryboardEventHandler
    lpVtbl : IUIAnimationStoryboardEventHandlerVTbl*
  end

  struct IUIAnimationPriorityComparisonVTbl
    query_interface : Proc(IUIAnimationPriorityComparison*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationPriorityComparison*, UInt32)
    release : Proc(IUIAnimationPriorityComparison*, UInt32)
    has_priority : Proc(IUIAnimationPriorityComparison*, IUIAnimationStoryboard, IUIAnimationStoryboard, UI_ANIMATION_PRIORITY_EFFECT, HRESULT)
  end

  IUIAnimationPriorityComparison_GUID = "83fa9b74-5f86-4618-bc6a-a2fac19b3f44"
  IID_IUIAnimationPriorityComparison = LibC::GUID.new(0x83fa9b74_u32, 0x5f86_u16, 0x4618_u16, StaticArray[0xbc_u8, 0x6a_u8, 0xa2_u8, 0xfa_u8, 0xc1_u8, 0x9b_u8, 0x3f_u8, 0x44_u8])
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

  IUIAnimationTransitionLibrary_GUID = "ca5a14b1-d24f-48b8-8fe4-c78169ba954e"
  IID_IUIAnimationTransitionLibrary = LibC::GUID.new(0xca5a14b1_u32, 0xd24f_u16, 0x48b8_u16, StaticArray[0x8f_u8, 0xe4_u8, 0xc7_u8, 0x81_u8, 0x69_u8, 0xba_u8, 0x95_u8, 0x4e_u8])
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

  IUIAnimationInterpolator_GUID = "7815cbba-ddf7-478c-a46c-7b6c738b7978"
  IID_IUIAnimationInterpolator = LibC::GUID.new(0x7815cbba_u32, 0xddf7_u16, 0x478c_u16, StaticArray[0xa4_u8, 0x6c_u8, 0x7b_u8, 0x6c_u8, 0x73_u8, 0x8b_u8, 0x79_u8, 0x78_u8])
  struct IUIAnimationInterpolator
    lpVtbl : IUIAnimationInterpolatorVTbl*
  end

  struct IUIAnimationTransitionFactoryVTbl
    query_interface : Proc(IUIAnimationTransitionFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransitionFactory*, UInt32)
    release : Proc(IUIAnimationTransitionFactory*, UInt32)
    create_transition : Proc(IUIAnimationTransitionFactory*, IUIAnimationInterpolator, IUIAnimationTransition*, HRESULT)
  end

  IUIAnimationTransitionFactory_GUID = "fcd91e03-3e3b-45ad-bbb1-6dfc8153743d"
  IID_IUIAnimationTransitionFactory = LibC::GUID.new(0xfcd91e03_u32, 0x3e3b_u16, 0x45ad_u16, StaticArray[0xbb_u8, 0xb1_u8, 0x6d_u8, 0xfc_u8, 0x81_u8, 0x53_u8, 0x74_u8, 0x3d_u8])
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

  IUIAnimationTimer_GUID = "6b0efad1-a053-41d6-9085-33a689144665"
  IID_IUIAnimationTimer = LibC::GUID.new(0x6b0efad1_u32, 0xa053_u16, 0x41d6_u16, StaticArray[0x90_u8, 0x85_u8, 0x33_u8, 0xa6_u8, 0x89_u8, 0x14_u8, 0x46_u8, 0x65_u8])
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

  IUIAnimationTimerUpdateHandler_GUID = "195509b7-5d5e-4e3e-b278-ee3759b367ad"
  IID_IUIAnimationTimerUpdateHandler = LibC::GUID.new(0x195509b7_u32, 0x5d5e_u16, 0x4e3e_u16, StaticArray[0xb2_u8, 0x78_u8, 0xee_u8, 0x37_u8, 0x59_u8, 0xb3_u8, 0x67_u8, 0xad_u8])
  struct IUIAnimationTimerUpdateHandler
    lpVtbl : IUIAnimationTimerUpdateHandlerVTbl*
  end

  struct IUIAnimationTimerClientEventHandlerVTbl
    query_interface : Proc(IUIAnimationTimerClientEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTimerClientEventHandler*, UInt32)
    release : Proc(IUIAnimationTimerClientEventHandler*, UInt32)
    on_timer_client_status_changed : Proc(IUIAnimationTimerClientEventHandler*, UI_ANIMATION_TIMER_CLIENT_STATUS, UI_ANIMATION_TIMER_CLIENT_STATUS, HRESULT)
  end

  IUIAnimationTimerClientEventHandler_GUID = "bedb4db6-94fa-4bfb-a47f-ef2d9e408c25"
  IID_IUIAnimationTimerClientEventHandler = LibC::GUID.new(0xbedb4db6_u32, 0x94fa_u16, 0x4bfb_u16, StaticArray[0xa4_u8, 0x7f_u8, 0xef_u8, 0x2d_u8, 0x9e_u8, 0x40_u8, 0x8c_u8, 0x25_u8])
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

  IUIAnimationTimerEventHandler_GUID = "274a7dea-d771-4095-abbd-8df7abd23ce3"
  IID_IUIAnimationTimerEventHandler = LibC::GUID.new(0x274a7dea_u32, 0xd771_u16, 0x4095_u16, StaticArray[0xab_u8, 0xbd_u8, 0x8d_u8, 0xf7_u8, 0xab_u8, 0xd2_u8, 0x3c_u8, 0xe3_u8])
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

  IUIAnimationManager2_GUID = "d8b6f7d4-4109-4d3f-acee-879926968cb1"
  IID_IUIAnimationManager2 = LibC::GUID.new(0xd8b6f7d4_u32, 0x4109_u16, 0x4d3f_u16, StaticArray[0xac_u8, 0xee_u8, 0x87_u8, 0x99_u8, 0x26_u8, 0x96_u8, 0x8c_u8, 0xb1_u8])
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

  IUIAnimationVariable2_GUID = "4914b304-96ab-44d9-9e77-d5109b7e7466"
  IID_IUIAnimationVariable2 = LibC::GUID.new(0x4914b304_u32, 0x96ab_u16, 0x44d9_u16, StaticArray[0x9e_u8, 0x77_u8, 0xd5_u8, 0x10_u8, 0x9b_u8, 0x7e_u8, 0x74_u8, 0x66_u8])
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

  IUIAnimationTransition2_GUID = "62ff9123-a85a-4e9b-a218-435a93e268fd"
  IID_IUIAnimationTransition2 = LibC::GUID.new(0x62ff9123_u32, 0xa85a_u16, 0x4e9b_u16, StaticArray[0xa2_u8, 0x18_u8, 0x43_u8, 0x5a_u8, 0x93_u8, 0xe2_u8, 0x68_u8, 0xfd_u8])
  struct IUIAnimationTransition2
    lpVtbl : IUIAnimationTransition2VTbl*
  end

  struct IUIAnimationManagerEventHandler2VTbl
    query_interface : Proc(IUIAnimationManagerEventHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationManagerEventHandler2*, UInt32)
    release : Proc(IUIAnimationManagerEventHandler2*, UInt32)
    on_manager_status_changed : Proc(IUIAnimationManagerEventHandler2*, UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS, HRESULT)
  end

  IUIAnimationManagerEventHandler2_GUID = "f6e022ba-bff3-42ec-9033-e073f33e83c3"
  IID_IUIAnimationManagerEventHandler2 = LibC::GUID.new(0xf6e022ba_u32, 0xbff3_u16, 0x42ec_u16, StaticArray[0x90_u8, 0x33_u8, 0xe0_u8, 0x73_u8, 0xf3_u8, 0x3e_u8, 0x83_u8, 0xc3_u8])
  struct IUIAnimationManagerEventHandler2
    lpVtbl : IUIAnimationManagerEventHandler2VTbl*
  end

  struct IUIAnimationVariableChangeHandler2VTbl
    query_interface : Proc(IUIAnimationVariableChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableChangeHandler2*, UInt32)
    release : Proc(IUIAnimationVariableChangeHandler2*, UInt32)
    on_value_changed : Proc(IUIAnimationVariableChangeHandler2*, IUIAnimationStoryboard2, IUIAnimationVariable2, Float64*, Float64*, UInt32, HRESULT)
  end

  IUIAnimationVariableChangeHandler2_GUID = "63acc8d2-6eae-4bb0-b879-586dd8cfbe42"
  IID_IUIAnimationVariableChangeHandler2 = LibC::GUID.new(0x63acc8d2_u32, 0x6eae_u16, 0x4bb0_u16, StaticArray[0xb8_u8, 0x79_u8, 0x58_u8, 0x6d_u8, 0xd8_u8, 0xcf_u8, 0xbe_u8, 0x42_u8])
  struct IUIAnimationVariableChangeHandler2
    lpVtbl : IUIAnimationVariableChangeHandler2VTbl*
  end

  struct IUIAnimationVariableIntegerChangeHandler2VTbl
    query_interface : Proc(IUIAnimationVariableIntegerChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableIntegerChangeHandler2*, UInt32)
    release : Proc(IUIAnimationVariableIntegerChangeHandler2*, UInt32)
    on_integer_value_changed : Proc(IUIAnimationVariableIntegerChangeHandler2*, IUIAnimationStoryboard2, IUIAnimationVariable2, Int32*, Int32*, UInt32, HRESULT)
  end

  IUIAnimationVariableIntegerChangeHandler2_GUID = "829b6cf1-4f3a-4412-ae09-b243eb4c6b58"
  IID_IUIAnimationVariableIntegerChangeHandler2 = LibC::GUID.new(0x829b6cf1_u32, 0x4f3a_u16, 0x4412_u16, StaticArray[0xae_u8, 0x9_u8, 0xb2_u8, 0x43_u8, 0xeb_u8, 0x4c_u8, 0x6b_u8, 0x58_u8])
  struct IUIAnimationVariableIntegerChangeHandler2
    lpVtbl : IUIAnimationVariableIntegerChangeHandler2VTbl*
  end

  struct IUIAnimationVariableCurveChangeHandler2VTbl
    query_interface : Proc(IUIAnimationVariableCurveChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationVariableCurveChangeHandler2*, UInt32)
    release : Proc(IUIAnimationVariableCurveChangeHandler2*, UInt32)
    on_curve_changed : Proc(IUIAnimationVariableCurveChangeHandler2*, IUIAnimationVariable2, HRESULT)
  end

  IUIAnimationVariableCurveChangeHandler2_GUID = "72895e91-0145-4c21-9192-5aab40eddf80"
  IID_IUIAnimationVariableCurveChangeHandler2 = LibC::GUID.new(0x72895e91_u32, 0x145_u16, 0x4c21_u16, StaticArray[0x91_u8, 0x92_u8, 0x5a_u8, 0xab_u8, 0x40_u8, 0xed_u8, 0xdf_u8, 0x80_u8])
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

  IUIAnimationStoryboardEventHandler2_GUID = "bac5f55a-ba7c-414c-b599-fbf850f553c6"
  IID_IUIAnimationStoryboardEventHandler2 = LibC::GUID.new(0xbac5f55a_u32, 0xba7c_u16, 0x414c_u16, StaticArray[0xb5_u8, 0x99_u8, 0xfb_u8, 0xf8_u8, 0x50_u8, 0xf5_u8, 0x53_u8, 0xc6_u8])
  struct IUIAnimationStoryboardEventHandler2
    lpVtbl : IUIAnimationStoryboardEventHandler2VTbl*
  end

  struct IUIAnimationLoopIterationChangeHandler2VTbl
    query_interface : Proc(IUIAnimationLoopIterationChangeHandler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationLoopIterationChangeHandler2*, UInt32)
    release : Proc(IUIAnimationLoopIterationChangeHandler2*, UInt32)
    on_loop_iteration_changed : Proc(IUIAnimationLoopIterationChangeHandler2*, IUIAnimationStoryboard2, LibC::UINT_PTR, UInt32, UInt32, HRESULT)
  end

  IUIAnimationLoopIterationChangeHandler2_GUID = "2d3b15a4-4762-47ab-a030-b23221df3ae0"
  IID_IUIAnimationLoopIterationChangeHandler2 = LibC::GUID.new(0x2d3b15a4_u32, 0x4762_u16, 0x47ab_u16, StaticArray[0xa0_u8, 0x30_u8, 0xb2_u8, 0x32_u8, 0x21_u8, 0xdf_u8, 0x3a_u8, 0xe0_u8])
  struct IUIAnimationLoopIterationChangeHandler2
    lpVtbl : IUIAnimationLoopIterationChangeHandler2VTbl*
  end

  struct IUIAnimationPriorityComparison2VTbl
    query_interface : Proc(IUIAnimationPriorityComparison2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationPriorityComparison2*, UInt32)
    release : Proc(IUIAnimationPriorityComparison2*, UInt32)
    has_priority : Proc(IUIAnimationPriorityComparison2*, IUIAnimationStoryboard2, IUIAnimationStoryboard2, UI_ANIMATION_PRIORITY_EFFECT, HRESULT)
  end

  IUIAnimationPriorityComparison2_GUID = "5b6d7a37-4621-467c-8b05-70131de62ddb"
  IID_IUIAnimationPriorityComparison2 = LibC::GUID.new(0x5b6d7a37_u32, 0x4621_u16, 0x467c_u16, StaticArray[0x8b_u8, 0x5_u8, 0x70_u8, 0x13_u8, 0x1d_u8, 0xe6_u8, 0x2d_u8, 0xdb_u8])
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

  IUIAnimationTransitionLibrary2_GUID = "03cfae53-9580-4ee3-b363-2ece51b4af6a"
  IID_IUIAnimationTransitionLibrary2 = LibC::GUID.new(0x3cfae53_u32, 0x9580_u16, 0x4ee3_u16, StaticArray[0xb3_u8, 0x63_u8, 0x2e_u8, 0xce_u8, 0x51_u8, 0xb4_u8, 0xaf_u8, 0x6a_u8])
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

  IUIAnimationPrimitiveInterpolation_GUID = "bab20d63-4361-45da-a24f-ab8508846b5b"
  IID_IUIAnimationPrimitiveInterpolation = LibC::GUID.new(0xbab20d63_u32, 0x4361_u16, 0x45da_u16, StaticArray[0xa2_u8, 0x4f_u8, 0xab_u8, 0x85_u8, 0x8_u8, 0x84_u8, 0x6b_u8, 0x5b_u8])
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

  IUIAnimationInterpolator2_GUID = "ea76aff8-ea22-4a23-a0ef-a6a966703518"
  IID_IUIAnimationInterpolator2 = LibC::GUID.new(0xea76aff8_u32, 0xea22_u16, 0x4a23_u16, StaticArray[0xa0_u8, 0xef_u8, 0xa6_u8, 0xa9_u8, 0x66_u8, 0x70_u8, 0x35_u8, 0x18_u8])
  struct IUIAnimationInterpolator2
    lpVtbl : IUIAnimationInterpolator2VTbl*
  end

  struct IUIAnimationTransitionFactory2VTbl
    query_interface : Proc(IUIAnimationTransitionFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAnimationTransitionFactory2*, UInt32)
    release : Proc(IUIAnimationTransitionFactory2*, UInt32)
    create_transition : Proc(IUIAnimationTransitionFactory2*, IUIAnimationInterpolator2, IUIAnimationTransition2*, HRESULT)
  end

  IUIAnimationTransitionFactory2_GUID = "937d4916-c1a6-42d5-88d8-30344d6efe31"
  IID_IUIAnimationTransitionFactory2 = LibC::GUID.new(0x937d4916_u32, 0xc1a6_u16, 0x42d5_u16, StaticArray[0x88_u8, 0xd8_u8, 0x30_u8, 0x34_u8, 0x4d_u8, 0x6e_u8, 0xfe_u8, 0x31_u8])
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

  IUIAnimationStoryboard2_GUID = "ae289cd2-12d4-4945-9419-9e41be034df2"
  IID_IUIAnimationStoryboard2 = LibC::GUID.new(0xae289cd2_u32, 0x12d4_u16, 0x4945_u16, StaticArray[0x94_u8, 0x19_u8, 0x9e_u8, 0x41_u8, 0xbe_u8, 0x3_u8, 0x4d_u8, 0xf2_u8])
  struct IUIAnimationStoryboard2
    lpVtbl : IUIAnimationStoryboard2VTbl*
  end

end