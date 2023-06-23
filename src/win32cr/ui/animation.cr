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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_animation_variable : UInt64
    schedule_transition : UInt64
    create_storyboard : UInt64
    finish_all_storyboards : UInt64
    abandon_all_storyboards : UInt64
    update : UInt64
    get_variable_from_tag : UInt64
    get_storyboard_from_tag : UInt64
    get_status : UInt64
    set_animation_mode : UInt64
    pause : UInt64
    resume : UInt64
    set_manager_event_handler : UInt64
    set_cancel_priority_comparison : UInt64
    set_trim_priority_comparison : UInt64
    set_compress_priority_comparison : UInt64
    set_conclude_priority_comparison : UInt64
    set_default_longest_acceptable_delay : UInt64
    shutdown : UInt64
  end

  IUIAnimationManager_GUID = "9169896c-ac8d-4e7d-94e5-67fa4dc2f2e8"
  IID_IUIAnimationManager = LibC::GUID.new(0x9169896c_u32, 0xac8d_u16, 0x4e7d_u16, StaticArray[0x94_u8, 0xe5_u8, 0x67_u8, 0xfa_u8, 0x4d_u8, 0xc2_u8, 0xf2_u8, 0xe8_u8])
  struct IUIAnimationManager
    lpVtbl : IUIAnimationManagerVTbl*
  end

  struct IUIAnimationVariableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_value : UInt64
    get_final_value : UInt64
    get_previous_value : UInt64
    get_integer_value : UInt64
    get_final_integer_value : UInt64
    get_previous_integer_value : UInt64
    get_current_storyboard : UInt64
    set_lower_bound : UInt64
    set_upper_bound : UInt64
    set_rounding_mode : UInt64
    set_tag : UInt64
    get_tag : UInt64
    set_variable_change_handler : UInt64
    set_variable_integer_change_handler : UInt64
  end

  IUIAnimationVariable_GUID = "8ceeb155-2849-4ce5-9448-91ff70e1e4d9"
  IID_IUIAnimationVariable = LibC::GUID.new(0x8ceeb155_u32, 0x2849_u16, 0x4ce5_u16, StaticArray[0x94_u8, 0x48_u8, 0x91_u8, 0xff_u8, 0x70_u8, 0xe1_u8, 0xe4_u8, 0xd9_u8])
  struct IUIAnimationVariable
    lpVtbl : IUIAnimationVariableVTbl*
  end

  struct IUIAnimationStoryboardVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_transition : UInt64
    add_keyframe_at_offset : UInt64
    add_keyframe_after_transition : UInt64
    add_transition_at_keyframe : UInt64
    add_transition_between_keyframes : UInt64
    repeat_between_keyframes : UInt64
    hold_variable : UInt64
    set_longest_acceptable_delay : UInt64
    schedule : UInt64
    conclude : UInt64
    finish : UInt64
    abandon : UInt64
    set_tag : UInt64
    get_tag : UInt64
    get_status : UInt64
    get_elapsed_time : UInt64
    set_storyboard_event_handler : UInt64
  end

  IUIAnimationStoryboard_GUID = "a8ff128f-9bf9-4af1-9e67-e5e410defb84"
  IID_IUIAnimationStoryboard = LibC::GUID.new(0xa8ff128f_u32, 0x9bf9_u16, 0x4af1_u16, StaticArray[0x9e_u8, 0x67_u8, 0xe5_u8, 0xe4_u8, 0x10_u8, 0xde_u8, 0xfb_u8, 0x84_u8])
  struct IUIAnimationStoryboard
    lpVtbl : IUIAnimationStoryboardVTbl*
  end

  struct IUIAnimationTransitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_initial_value : UInt64
    set_initial_velocity : UInt64
    is_duration_known : UInt64
    get_duration : UInt64
  end

  IUIAnimationTransition_GUID = "dc6ce252-f731-41cf-b610-614b6ca049ad"
  IID_IUIAnimationTransition = LibC::GUID.new(0xdc6ce252_u32, 0xf731_u16, 0x41cf_u16, StaticArray[0xb6_u8, 0x10_u8, 0x61_u8, 0x4b_u8, 0x6c_u8, 0xa0_u8, 0x49_u8, 0xad_u8])
  struct IUIAnimationTransition
    lpVtbl : IUIAnimationTransitionVTbl*
  end

  struct IUIAnimationManagerEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_manager_status_changed : UInt64
  end

  IUIAnimationManagerEventHandler_GUID = "783321ed-78a3-4366-b574-6af607a64788"
  IID_IUIAnimationManagerEventHandler = LibC::GUID.new(0x783321ed_u32, 0x78a3_u16, 0x4366_u16, StaticArray[0xb5_u8, 0x74_u8, 0x6a_u8, 0xf6_u8, 0x7_u8, 0xa6_u8, 0x47_u8, 0x88_u8])
  struct IUIAnimationManagerEventHandler
    lpVtbl : IUIAnimationManagerEventHandlerVTbl*
  end

  struct IUIAnimationVariableChangeHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_value_changed : UInt64
  end

  IUIAnimationVariableChangeHandler_GUID = "6358b7ba-87d2-42d5-bf71-82e919dd5862"
  IID_IUIAnimationVariableChangeHandler = LibC::GUID.new(0x6358b7ba_u32, 0x87d2_u16, 0x42d5_u16, StaticArray[0xbf_u8, 0x71_u8, 0x82_u8, 0xe9_u8, 0x19_u8, 0xdd_u8, 0x58_u8, 0x62_u8])
  struct IUIAnimationVariableChangeHandler
    lpVtbl : IUIAnimationVariableChangeHandlerVTbl*
  end

  struct IUIAnimationVariableIntegerChangeHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_integer_value_changed : UInt64
  end

  IUIAnimationVariableIntegerChangeHandler_GUID = "bb3e1550-356e-44b0-99da-85ac6017865e"
  IID_IUIAnimationVariableIntegerChangeHandler = LibC::GUID.new(0xbb3e1550_u32, 0x356e_u16, 0x44b0_u16, StaticArray[0x99_u8, 0xda_u8, 0x85_u8, 0xac_u8, 0x60_u8, 0x17_u8, 0x86_u8, 0x5e_u8])
  struct IUIAnimationVariableIntegerChangeHandler
    lpVtbl : IUIAnimationVariableIntegerChangeHandlerVTbl*
  end

  struct IUIAnimationStoryboardEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_storyboard_status_changed : UInt64
    on_storyboard_updated : UInt64
  end

  IUIAnimationStoryboardEventHandler_GUID = "3d5c9008-ec7c-4364-9f8a-9af3c58cbae6"
  IID_IUIAnimationStoryboardEventHandler = LibC::GUID.new(0x3d5c9008_u32, 0xec7c_u16, 0x4364_u16, StaticArray[0x9f_u8, 0x8a_u8, 0x9a_u8, 0xf3_u8, 0xc5_u8, 0x8c_u8, 0xba_u8, 0xe6_u8])
  struct IUIAnimationStoryboardEventHandler
    lpVtbl : IUIAnimationStoryboardEventHandlerVTbl*
  end

  struct IUIAnimationPriorityComparisonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    has_priority : UInt64
  end

  IUIAnimationPriorityComparison_GUID = "83fa9b74-5f86-4618-bc6a-a2fac19b3f44"
  IID_IUIAnimationPriorityComparison = LibC::GUID.new(0x83fa9b74_u32, 0x5f86_u16, 0x4618_u16, StaticArray[0xbc_u8, 0x6a_u8, 0xa2_u8, 0xfa_u8, 0xc1_u8, 0x9b_u8, 0x3f_u8, 0x44_u8])
  struct IUIAnimationPriorityComparison
    lpVtbl : IUIAnimationPriorityComparisonVTbl*
  end

  struct IUIAnimationTransitionLibraryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instantaneous_transition : UInt64
    create_constant_transition : UInt64
    create_discrete_transition : UInt64
    create_linear_transition : UInt64
    create_linear_transition_from_speed : UInt64
    create_sinusoidal_transition_from_velocity : UInt64
    create_sinusoidal_transition_from_range : UInt64
    create_accelerate_decelerate_transition : UInt64
    create_reversal_transition : UInt64
    create_cubic_transition : UInt64
    create_smooth_stop_transition : UInt64
    create_parabolic_transition_from_acceleration : UInt64
  end

  IUIAnimationTransitionLibrary_GUID = "ca5a14b1-d24f-48b8-8fe4-c78169ba954e"
  IID_IUIAnimationTransitionLibrary = LibC::GUID.new(0xca5a14b1_u32, 0xd24f_u16, 0x48b8_u16, StaticArray[0x8f_u8, 0xe4_u8, 0xc7_u8, 0x81_u8, 0x69_u8, 0xba_u8, 0x95_u8, 0x4e_u8])
  struct IUIAnimationTransitionLibrary
    lpVtbl : IUIAnimationTransitionLibraryVTbl*
  end

  struct IUIAnimationInterpolatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_initial_value_and_velocity : UInt64
    set_duration : UInt64
    get_duration : UInt64
    get_final_value : UInt64
    interpolate_value : UInt64
    interpolate_velocity : UInt64
    get_dependencies : UInt64
  end

  IUIAnimationInterpolator_GUID = "7815cbba-ddf7-478c-a46c-7b6c738b7978"
  IID_IUIAnimationInterpolator = LibC::GUID.new(0x7815cbba_u32, 0xddf7_u16, 0x478c_u16, StaticArray[0xa4_u8, 0x6c_u8, 0x7b_u8, 0x6c_u8, 0x73_u8, 0x8b_u8, 0x79_u8, 0x78_u8])
  struct IUIAnimationInterpolator
    lpVtbl : IUIAnimationInterpolatorVTbl*
  end

  struct IUIAnimationTransitionFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_transition : UInt64
  end

  IUIAnimationTransitionFactory_GUID = "fcd91e03-3e3b-45ad-bbb1-6dfc8153743d"
  IID_IUIAnimationTransitionFactory = LibC::GUID.new(0xfcd91e03_u32, 0x3e3b_u16, 0x45ad_u16, StaticArray[0xbb_u8, 0xb1_u8, 0x6d_u8, 0xfc_u8, 0x81_u8, 0x53_u8, 0x74_u8, 0x3d_u8])
  struct IUIAnimationTransitionFactory
    lpVtbl : IUIAnimationTransitionFactoryVTbl*
  end

  struct IUIAnimationTimerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_timer_update_handler : UInt64
    set_timer_event_handler : UInt64
    enable : UInt64
    disable : UInt64
    is_enabled : UInt64
    get_time : UInt64
    set_frame_rate_threshold : UInt64
  end

  IUIAnimationTimer_GUID = "6b0efad1-a053-41d6-9085-33a689144665"
  IID_IUIAnimationTimer = LibC::GUID.new(0x6b0efad1_u32, 0xa053_u16, 0x41d6_u16, StaticArray[0x90_u8, 0x85_u8, 0x33_u8, 0xa6_u8, 0x89_u8, 0x14_u8, 0x46_u8, 0x65_u8])
  struct IUIAnimationTimer
    lpVtbl : IUIAnimationTimerVTbl*
  end

  struct IUIAnimationTimerUpdateHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_update : UInt64
    set_timer_client_event_handler : UInt64
    clear_timer_client_event_handler : UInt64
  end

  IUIAnimationTimerUpdateHandler_GUID = "195509b7-5d5e-4e3e-b278-ee3759b367ad"
  IID_IUIAnimationTimerUpdateHandler = LibC::GUID.new(0x195509b7_u32, 0x5d5e_u16, 0x4e3e_u16, StaticArray[0xb2_u8, 0x78_u8, 0xee_u8, 0x37_u8, 0x59_u8, 0xb3_u8, 0x67_u8, 0xad_u8])
  struct IUIAnimationTimerUpdateHandler
    lpVtbl : IUIAnimationTimerUpdateHandlerVTbl*
  end

  struct IUIAnimationTimerClientEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_timer_client_status_changed : UInt64
  end

  IUIAnimationTimerClientEventHandler_GUID = "bedb4db6-94fa-4bfb-a47f-ef2d9e408c25"
  IID_IUIAnimationTimerClientEventHandler = LibC::GUID.new(0xbedb4db6_u32, 0x94fa_u16, 0x4bfb_u16, StaticArray[0xa4_u8, 0x7f_u8, 0xef_u8, 0x2d_u8, 0x9e_u8, 0x40_u8, 0x8c_u8, 0x25_u8])
  struct IUIAnimationTimerClientEventHandler
    lpVtbl : IUIAnimationTimerClientEventHandlerVTbl*
  end

  struct IUIAnimationTimerEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_pre_update : UInt64
    on_post_update : UInt64
    on_rendering_too_slow : UInt64
  end

  IUIAnimationTimerEventHandler_GUID = "274a7dea-d771-4095-abbd-8df7abd23ce3"
  IID_IUIAnimationTimerEventHandler = LibC::GUID.new(0x274a7dea_u32, 0xd771_u16, 0x4095_u16, StaticArray[0xab_u8, 0xbd_u8, 0x8d_u8, 0xf7_u8, 0xab_u8, 0xd2_u8, 0x3c_u8, 0xe3_u8])
  struct IUIAnimationTimerEventHandler
    lpVtbl : IUIAnimationTimerEventHandlerVTbl*
  end

  struct IUIAnimationManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_animation_vector_variable : UInt64
    create_animation_variable : UInt64
    schedule_transition : UInt64
    create_storyboard : UInt64
    finish_all_storyboards : UInt64
    abandon_all_storyboards : UInt64
    update : UInt64
    get_variable_from_tag : UInt64
    get_storyboard_from_tag : UInt64
    estimate_next_event_time : UInt64
    get_status : UInt64
    set_animation_mode : UInt64
    pause : UInt64
    resume : UInt64
    set_manager_event_handler : UInt64
    set_cancel_priority_comparison : UInt64
    set_trim_priority_comparison : UInt64
    set_compress_priority_comparison : UInt64
    set_conclude_priority_comparison : UInt64
    set_default_longest_acceptable_delay : UInt64
    shutdown : UInt64
  end

  IUIAnimationManager2_GUID = "d8b6f7d4-4109-4d3f-acee-879926968cb1"
  IID_IUIAnimationManager2 = LibC::GUID.new(0xd8b6f7d4_u32, 0x4109_u16, 0x4d3f_u16, StaticArray[0xac_u8, 0xee_u8, 0x87_u8, 0x99_u8, 0x26_u8, 0x96_u8, 0x8c_u8, 0xb1_u8])
  struct IUIAnimationManager2
    lpVtbl : IUIAnimationManager2VTbl*
  end

  struct IUIAnimationVariable2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dimension : UInt64
    get_value : UInt64
    get_vector_value : UInt64
    get_curve : UInt64
    get_vector_curve : UInt64
    get_final_value : UInt64
    get_final_vector_value : UInt64
    get_previous_value : UInt64
    get_previous_vector_value : UInt64
    get_integer_value : UInt64
    get_integer_vector_value : UInt64
    get_final_integer_value : UInt64
    get_final_integer_vector_value : UInt64
    get_previous_integer_value : UInt64
    get_previous_integer_vector_value : UInt64
    get_current_storyboard : UInt64
    set_lower_bound : UInt64
    set_lower_bound_vector : UInt64
    set_upper_bound : UInt64
    set_upper_bound_vector : UInt64
    set_rounding_mode : UInt64
    set_tag : UInt64
    get_tag : UInt64
    set_variable_change_handler : UInt64
    set_variable_integer_change_handler : UInt64
    set_variable_curve_change_handler : UInt64
  end

  IUIAnimationVariable2_GUID = "4914b304-96ab-44d9-9e77-d5109b7e7466"
  IID_IUIAnimationVariable2 = LibC::GUID.new(0x4914b304_u32, 0x96ab_u16, 0x44d9_u16, StaticArray[0x9e_u8, 0x77_u8, 0xd5_u8, 0x10_u8, 0x9b_u8, 0x7e_u8, 0x74_u8, 0x66_u8])
  struct IUIAnimationVariable2
    lpVtbl : IUIAnimationVariable2VTbl*
  end

  struct IUIAnimationTransition2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dimension : UInt64
    set_initial_value : UInt64
    set_initial_vector_value : UInt64
    set_initial_velocity : UInt64
    set_initial_vector_velocity : UInt64
    is_duration_known : UInt64
    get_duration : UInt64
  end

  IUIAnimationTransition2_GUID = "62ff9123-a85a-4e9b-a218-435a93e268fd"
  IID_IUIAnimationTransition2 = LibC::GUID.new(0x62ff9123_u32, 0xa85a_u16, 0x4e9b_u16, StaticArray[0xa2_u8, 0x18_u8, 0x43_u8, 0x5a_u8, 0x93_u8, 0xe2_u8, 0x68_u8, 0xfd_u8])
  struct IUIAnimationTransition2
    lpVtbl : IUIAnimationTransition2VTbl*
  end

  struct IUIAnimationManagerEventHandler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_manager_status_changed : UInt64
  end

  IUIAnimationManagerEventHandler2_GUID = "f6e022ba-bff3-42ec-9033-e073f33e83c3"
  IID_IUIAnimationManagerEventHandler2 = LibC::GUID.new(0xf6e022ba_u32, 0xbff3_u16, 0x42ec_u16, StaticArray[0x90_u8, 0x33_u8, 0xe0_u8, 0x73_u8, 0xf3_u8, 0x3e_u8, 0x83_u8, 0xc3_u8])
  struct IUIAnimationManagerEventHandler2
    lpVtbl : IUIAnimationManagerEventHandler2VTbl*
  end

  struct IUIAnimationVariableChangeHandler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_value_changed : UInt64
  end

  IUIAnimationVariableChangeHandler2_GUID = "63acc8d2-6eae-4bb0-b879-586dd8cfbe42"
  IID_IUIAnimationVariableChangeHandler2 = LibC::GUID.new(0x63acc8d2_u32, 0x6eae_u16, 0x4bb0_u16, StaticArray[0xb8_u8, 0x79_u8, 0x58_u8, 0x6d_u8, 0xd8_u8, 0xcf_u8, 0xbe_u8, 0x42_u8])
  struct IUIAnimationVariableChangeHandler2
    lpVtbl : IUIAnimationVariableChangeHandler2VTbl*
  end

  struct IUIAnimationVariableIntegerChangeHandler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_integer_value_changed : UInt64
  end

  IUIAnimationVariableIntegerChangeHandler2_GUID = "829b6cf1-4f3a-4412-ae09-b243eb4c6b58"
  IID_IUIAnimationVariableIntegerChangeHandler2 = LibC::GUID.new(0x829b6cf1_u32, 0x4f3a_u16, 0x4412_u16, StaticArray[0xae_u8, 0x9_u8, 0xb2_u8, 0x43_u8, 0xeb_u8, 0x4c_u8, 0x6b_u8, 0x58_u8])
  struct IUIAnimationVariableIntegerChangeHandler2
    lpVtbl : IUIAnimationVariableIntegerChangeHandler2VTbl*
  end

  struct IUIAnimationVariableCurveChangeHandler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_curve_changed : UInt64
  end

  IUIAnimationVariableCurveChangeHandler2_GUID = "72895e91-0145-4c21-9192-5aab40eddf80"
  IID_IUIAnimationVariableCurveChangeHandler2 = LibC::GUID.new(0x72895e91_u32, 0x145_u16, 0x4c21_u16, StaticArray[0x91_u8, 0x92_u8, 0x5a_u8, 0xab_u8, 0x40_u8, 0xed_u8, 0xdf_u8, 0x80_u8])
  struct IUIAnimationVariableCurveChangeHandler2
    lpVtbl : IUIAnimationVariableCurveChangeHandler2VTbl*
  end

  struct IUIAnimationStoryboardEventHandler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_storyboard_status_changed : UInt64
    on_storyboard_updated : UInt64
  end

  IUIAnimationStoryboardEventHandler2_GUID = "bac5f55a-ba7c-414c-b599-fbf850f553c6"
  IID_IUIAnimationStoryboardEventHandler2 = LibC::GUID.new(0xbac5f55a_u32, 0xba7c_u16, 0x414c_u16, StaticArray[0xb5_u8, 0x99_u8, 0xfb_u8, 0xf8_u8, 0x50_u8, 0xf5_u8, 0x53_u8, 0xc6_u8])
  struct IUIAnimationStoryboardEventHandler2
    lpVtbl : IUIAnimationStoryboardEventHandler2VTbl*
  end

  struct IUIAnimationLoopIterationChangeHandler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_loop_iteration_changed : UInt64
  end

  IUIAnimationLoopIterationChangeHandler2_GUID = "2d3b15a4-4762-47ab-a030-b23221df3ae0"
  IID_IUIAnimationLoopIterationChangeHandler2 = LibC::GUID.new(0x2d3b15a4_u32, 0x4762_u16, 0x47ab_u16, StaticArray[0xa0_u8, 0x30_u8, 0xb2_u8, 0x32_u8, 0x21_u8, 0xdf_u8, 0x3a_u8, 0xe0_u8])
  struct IUIAnimationLoopIterationChangeHandler2
    lpVtbl : IUIAnimationLoopIterationChangeHandler2VTbl*
  end

  struct IUIAnimationPriorityComparison2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    has_priority : UInt64
  end

  IUIAnimationPriorityComparison2_GUID = "5b6d7a37-4621-467c-8b05-70131de62ddb"
  IID_IUIAnimationPriorityComparison2 = LibC::GUID.new(0x5b6d7a37_u32, 0x4621_u16, 0x467c_u16, StaticArray[0x8b_u8, 0x5_u8, 0x70_u8, 0x13_u8, 0x1d_u8, 0xe6_u8, 0x2d_u8, 0xdb_u8])
  struct IUIAnimationPriorityComparison2
    lpVtbl : IUIAnimationPriorityComparison2VTbl*
  end

  struct IUIAnimationTransitionLibrary2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instantaneous_transition : UInt64
    create_instantaneous_vector_transition : UInt64
    create_constant_transition : UInt64
    create_discrete_transition : UInt64
    create_discrete_vector_transition : UInt64
    create_linear_transition : UInt64
    create_linear_vector_transition : UInt64
    create_linear_transition_from_speed : UInt64
    create_linear_vector_transition_from_speed : UInt64
    create_sinusoidal_transition_from_velocity : UInt64
    create_sinusoidal_transition_from_range : UInt64
    create_accelerate_decelerate_transition : UInt64
    create_reversal_transition : UInt64
    create_cubic_transition : UInt64
    create_cubic_vector_transition : UInt64
    create_smooth_stop_transition : UInt64
    create_parabolic_transition_from_acceleration : UInt64
    create_cubic_bezier_linear_transition : UInt64
    create_cubic_bezier_linear_vector_transition : UInt64
  end

  IUIAnimationTransitionLibrary2_GUID = "03cfae53-9580-4ee3-b363-2ece51b4af6a"
  IID_IUIAnimationTransitionLibrary2 = LibC::GUID.new(0x3cfae53_u32, 0x9580_u16, 0x4ee3_u16, StaticArray[0xb3_u8, 0x63_u8, 0x2e_u8, 0xce_u8, 0x51_u8, 0xb4_u8, 0xaf_u8, 0x6a_u8])
  struct IUIAnimationTransitionLibrary2
    lpVtbl : IUIAnimationTransitionLibrary2VTbl*
  end

  struct IUIAnimationPrimitiveInterpolationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_cubic : UInt64
    add_sinusoidal : UInt64
  end

  IUIAnimationPrimitiveInterpolation_GUID = "bab20d63-4361-45da-a24f-ab8508846b5b"
  IID_IUIAnimationPrimitiveInterpolation = LibC::GUID.new(0xbab20d63_u32, 0x4361_u16, 0x45da_u16, StaticArray[0xa2_u8, 0x4f_u8, 0xab_u8, 0x85_u8, 0x8_u8, 0x84_u8, 0x6b_u8, 0x5b_u8])
  struct IUIAnimationPrimitiveInterpolation
    lpVtbl : IUIAnimationPrimitiveInterpolationVTbl*
  end

  struct IUIAnimationInterpolator2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dimension : UInt64
    set_initial_value_and_velocity : UInt64
    set_duration : UInt64
    get_duration : UInt64
    get_final_value : UInt64
    interpolate_value : UInt64
    interpolate_velocity : UInt64
    get_primitive_interpolation : UInt64
    get_dependencies : UInt64
  end

  IUIAnimationInterpolator2_GUID = "ea76aff8-ea22-4a23-a0ef-a6a966703518"
  IID_IUIAnimationInterpolator2 = LibC::GUID.new(0xea76aff8_u32, 0xea22_u16, 0x4a23_u16, StaticArray[0xa0_u8, 0xef_u8, 0xa6_u8, 0xa9_u8, 0x66_u8, 0x70_u8, 0x35_u8, 0x18_u8])
  struct IUIAnimationInterpolator2
    lpVtbl : IUIAnimationInterpolator2VTbl*
  end

  struct IUIAnimationTransitionFactory2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_transition : UInt64
  end

  IUIAnimationTransitionFactory2_GUID = "937d4916-c1a6-42d5-88d8-30344d6efe31"
  IID_IUIAnimationTransitionFactory2 = LibC::GUID.new(0x937d4916_u32, 0xc1a6_u16, 0x42d5_u16, StaticArray[0x88_u8, 0xd8_u8, 0x30_u8, 0x34_u8, 0x4d_u8, 0x6e_u8, 0xfe_u8, 0x31_u8])
  struct IUIAnimationTransitionFactory2
    lpVtbl : IUIAnimationTransitionFactory2VTbl*
  end

  struct IUIAnimationStoryboard2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_transition : UInt64
    add_keyframe_at_offset : UInt64
    add_keyframe_after_transition : UInt64
    add_transition_at_keyframe : UInt64
    add_transition_between_keyframes : UInt64
    repeat_between_keyframes : UInt64
    hold_variable : UInt64
    set_longest_acceptable_delay : UInt64
    set_skip_duration : UInt64
    schedule : UInt64
    conclude : UInt64
    finish : UInt64
    abandon : UInt64
    set_tag : UInt64
    get_tag : UInt64
    get_status : UInt64
    get_elapsed_time : UInt64
    set_storyboard_event_handler : UInt64
  end

  IUIAnimationStoryboard2_GUID = "ae289cd2-12d4-4945-9419-9e41be034df2"
  IID_IUIAnimationStoryboard2 = LibC::GUID.new(0xae289cd2_u32, 0x12d4_u16, 0x4945_u16, StaticArray[0x94_u8, 0x19_u8, 0x9e_u8, 0x41_u8, 0xbe_u8, 0x3_u8, 0x4d_u8, 0xf2_u8])
  struct IUIAnimationStoryboard2
    lpVtbl : IUIAnimationStoryboard2VTbl*
  end

end
struct LibWin32::IUIAnimationManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_animation_variable(initialvalue : Float64, variable : IUIAnimationVariable*) : HRESULT
    @lpVtbl.value.create_animation_variable.unsafe_as(Proc(Float64, IUIAnimationVariable*, HRESULT)).call(initialvalue, variable)
  end
  def schedule_transition(variable : IUIAnimationVariable, transition : IUIAnimationTransition, timenow : Float64) : HRESULT
    @lpVtbl.value.schedule_transition.unsafe_as(Proc(IUIAnimationVariable, IUIAnimationTransition, Float64, HRESULT)).call(variable, transition, timenow)
  end
  def create_storyboard(storyboard : IUIAnimationStoryboard*) : HRESULT
    @lpVtbl.value.create_storyboard.unsafe_as(Proc(IUIAnimationStoryboard*, HRESULT)).call(storyboard)
  end
  def finish_all_storyboards(completiondeadline : Float64) : HRESULT
    @lpVtbl.value.finish_all_storyboards.unsafe_as(Proc(Float64, HRESULT)).call(completiondeadline)
  end
  def abandon_all_storyboards : HRESULT
    @lpVtbl.value.abandon_all_storyboards.unsafe_as(Proc(HRESULT)).call
  end
  def update(timenow : Float64, updateresult : UI_ANIMATION_UPDATE_RESULT*) : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(Float64, UI_ANIMATION_UPDATE_RESULT*, HRESULT)).call(timenow, updateresult)
  end
  def get_variable_from_tag(object : IUnknown, id : UInt32, variable : IUIAnimationVariable*) : HRESULT
    @lpVtbl.value.get_variable_from_tag.unsafe_as(Proc(IUnknown, UInt32, IUIAnimationVariable*, HRESULT)).call(object, id, variable)
  end
  def get_storyboard_from_tag(object : IUnknown, id : UInt32, storyboard : IUIAnimationStoryboard*) : HRESULT
    @lpVtbl.value.get_storyboard_from_tag.unsafe_as(Proc(IUnknown, UInt32, IUIAnimationStoryboard*, HRESULT)).call(object, id, storyboard)
  end
  def get_status(status : UI_ANIMATION_MANAGER_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UI_ANIMATION_MANAGER_STATUS*, HRESULT)).call(status)
  end
  def set_animation_mode(mode : UI_ANIMATION_MODE) : HRESULT
    @lpVtbl.value.set_animation_mode.unsafe_as(Proc(UI_ANIMATION_MODE, HRESULT)).call(mode)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def set_manager_event_handler(handler : IUIAnimationManagerEventHandler) : HRESULT
    @lpVtbl.value.set_manager_event_handler.unsafe_as(Proc(IUIAnimationManagerEventHandler, HRESULT)).call(handler)
  end
  def set_cancel_priority_comparison(comparison : IUIAnimationPriorityComparison) : HRESULT
    @lpVtbl.value.set_cancel_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison, HRESULT)).call(comparison)
  end
  def set_trim_priority_comparison(comparison : IUIAnimationPriorityComparison) : HRESULT
    @lpVtbl.value.set_trim_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison, HRESULT)).call(comparison)
  end
  def set_compress_priority_comparison(comparison : IUIAnimationPriorityComparison) : HRESULT
    @lpVtbl.value.set_compress_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison, HRESULT)).call(comparison)
  end
  def set_conclude_priority_comparison(comparison : IUIAnimationPriorityComparison) : HRESULT
    @lpVtbl.value.set_conclude_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison, HRESULT)).call(comparison)
  end
  def set_default_longest_acceptable_delay(delay : Float64) : HRESULT
    @lpVtbl.value.set_default_longest_acceptable_delay.unsafe_as(Proc(Float64, HRESULT)).call(delay)
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAnimationVariable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_value(value : Float64*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(Float64*, HRESULT)).call(value)
  end
  def get_final_value(finalvalue : Float64*) : HRESULT
    @lpVtbl.value.get_final_value.unsafe_as(Proc(Float64*, HRESULT)).call(finalvalue)
  end
  def get_previous_value(previousvalue : Float64*) : HRESULT
    @lpVtbl.value.get_previous_value.unsafe_as(Proc(Float64*, HRESULT)).call(previousvalue)
  end
  def get_integer_value(value : Int32*) : HRESULT
    @lpVtbl.value.get_integer_value.unsafe_as(Proc(Int32*, HRESULT)).call(value)
  end
  def get_final_integer_value(finalvalue : Int32*) : HRESULT
    @lpVtbl.value.get_final_integer_value.unsafe_as(Proc(Int32*, HRESULT)).call(finalvalue)
  end
  def get_previous_integer_value(previousvalue : Int32*) : HRESULT
    @lpVtbl.value.get_previous_integer_value.unsafe_as(Proc(Int32*, HRESULT)).call(previousvalue)
  end
  def get_current_storyboard(storyboard : IUIAnimationStoryboard*) : HRESULT
    @lpVtbl.value.get_current_storyboard.unsafe_as(Proc(IUIAnimationStoryboard*, HRESULT)).call(storyboard)
  end
  def set_lower_bound(bound : Float64) : HRESULT
    @lpVtbl.value.set_lower_bound.unsafe_as(Proc(Float64, HRESULT)).call(bound)
  end
  def set_upper_bound(bound : Float64) : HRESULT
    @lpVtbl.value.set_upper_bound.unsafe_as(Proc(Float64, HRESULT)).call(bound)
  end
  def set_rounding_mode(mode : UI_ANIMATION_ROUNDING_MODE) : HRESULT
    @lpVtbl.value.set_rounding_mode.unsafe_as(Proc(UI_ANIMATION_ROUNDING_MODE, HRESULT)).call(mode)
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_tag(object : IUnknown*, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(IUnknown*, UInt32*, HRESULT)).call(object, id)
  end
  def set_variable_change_handler(handler : IUIAnimationVariableChangeHandler) : HRESULT
    @lpVtbl.value.set_variable_change_handler.unsafe_as(Proc(IUIAnimationVariableChangeHandler, HRESULT)).call(handler)
  end
  def set_variable_integer_change_handler(handler : IUIAnimationVariableIntegerChangeHandler) : HRESULT
    @lpVtbl.value.set_variable_integer_change_handler.unsafe_as(Proc(IUIAnimationVariableIntegerChangeHandler, HRESULT)).call(handler)
  end
end
struct LibWin32::IUIAnimationStoryboard
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_transition(variable : IUIAnimationVariable, transition : IUIAnimationTransition) : HRESULT
    @lpVtbl.value.add_transition.unsafe_as(Proc(IUIAnimationVariable, IUIAnimationTransition, HRESULT)).call(variable, transition)
  end
  def add_keyframe_at_offset(existingkeyframe : UI_ANIMATION_KEYFRAME, offset : Float64, keyframe : UI_ANIMATION_KEYFRAME*) : HRESULT
    @lpVtbl.value.add_keyframe_at_offset.unsafe_as(Proc(UI_ANIMATION_KEYFRAME, Float64, UI_ANIMATION_KEYFRAME*, HRESULT)).call(existingkeyframe, offset, keyframe)
  end
  def add_keyframe_after_transition(transition : IUIAnimationTransition, keyframe : UI_ANIMATION_KEYFRAME*) : HRESULT
    @lpVtbl.value.add_keyframe_after_transition.unsafe_as(Proc(IUIAnimationTransition, UI_ANIMATION_KEYFRAME*, HRESULT)).call(transition, keyframe)
  end
  def add_transition_at_keyframe(variable : IUIAnimationVariable, transition : IUIAnimationTransition, startkeyframe : UI_ANIMATION_KEYFRAME) : HRESULT
    @lpVtbl.value.add_transition_at_keyframe.unsafe_as(Proc(IUIAnimationVariable, IUIAnimationTransition, UI_ANIMATION_KEYFRAME, HRESULT)).call(variable, transition, startkeyframe)
  end
  def add_transition_between_keyframes(variable : IUIAnimationVariable, transition : IUIAnimationTransition, startkeyframe : UI_ANIMATION_KEYFRAME, endkeyframe : UI_ANIMATION_KEYFRAME) : HRESULT
    @lpVtbl.value.add_transition_between_keyframes.unsafe_as(Proc(IUIAnimationVariable, IUIAnimationTransition, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, HRESULT)).call(variable, transition, startkeyframe, endkeyframe)
  end
  def repeat_between_keyframes(startkeyframe : UI_ANIMATION_KEYFRAME, endkeyframe : UI_ANIMATION_KEYFRAME, repetitioncount : Int32) : HRESULT
    @lpVtbl.value.repeat_between_keyframes.unsafe_as(Proc(UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, Int32, HRESULT)).call(startkeyframe, endkeyframe, repetitioncount)
  end
  def hold_variable(variable : IUIAnimationVariable) : HRESULT
    @lpVtbl.value.hold_variable.unsafe_as(Proc(IUIAnimationVariable, HRESULT)).call(variable)
  end
  def set_longest_acceptable_delay(delay : Float64) : HRESULT
    @lpVtbl.value.set_longest_acceptable_delay.unsafe_as(Proc(Float64, HRESULT)).call(delay)
  end
  def schedule(timenow : Float64, schedulingresult : UI_ANIMATION_SCHEDULING_RESULT*) : HRESULT
    @lpVtbl.value.schedule.unsafe_as(Proc(Float64, UI_ANIMATION_SCHEDULING_RESULT*, HRESULT)).call(timenow, schedulingresult)
  end
  def conclude : HRESULT
    @lpVtbl.value.conclude.unsafe_as(Proc(HRESULT)).call
  end
  def finish(completiondeadline : Float64) : HRESULT
    @lpVtbl.value.finish.unsafe_as(Proc(Float64, HRESULT)).call(completiondeadline)
  end
  def abandon : HRESULT
    @lpVtbl.value.abandon.unsafe_as(Proc(HRESULT)).call
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_tag(object : IUnknown*, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(IUnknown*, UInt32*, HRESULT)).call(object, id)
  end
  def get_status(status : UI_ANIMATION_STORYBOARD_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UI_ANIMATION_STORYBOARD_STATUS*, HRESULT)).call(status)
  end
  def get_elapsed_time(elapsedtime : Float64*) : HRESULT
    @lpVtbl.value.get_elapsed_time.unsafe_as(Proc(Float64*, HRESULT)).call(elapsedtime)
  end
  def set_storyboard_event_handler(handler : IUIAnimationStoryboardEventHandler) : HRESULT
    @lpVtbl.value.set_storyboard_event_handler.unsafe_as(Proc(IUIAnimationStoryboardEventHandler, HRESULT)).call(handler)
  end
end
struct LibWin32::IUIAnimationTransition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_initial_value(value : Float64) : HRESULT
    @lpVtbl.value.set_initial_value.unsafe_as(Proc(Float64, HRESULT)).call(value)
  end
  def set_initial_velocity(velocity : Float64) : HRESULT
    @lpVtbl.value.set_initial_velocity.unsafe_as(Proc(Float64, HRESULT)).call(velocity)
  end
  def is_duration_known : HRESULT
    @lpVtbl.value.is_duration_known.unsafe_as(Proc(HRESULT)).call
  end
  def get_duration(duration : Float64*) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(Float64*, HRESULT)).call(duration)
  end
end
struct LibWin32::IUIAnimationManagerEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_manager_status_changed(newstatus : UI_ANIMATION_MANAGER_STATUS, previousstatus : UI_ANIMATION_MANAGER_STATUS) : HRESULT
    @lpVtbl.value.on_manager_status_changed.unsafe_as(Proc(UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS, HRESULT)).call(newstatus, previousstatus)
  end
end
struct LibWin32::IUIAnimationVariableChangeHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_value_changed(storyboard : IUIAnimationStoryboard, variable : IUIAnimationVariable, newvalue : Float64, previousvalue : Float64) : HRESULT
    @lpVtbl.value.on_value_changed.unsafe_as(Proc(IUIAnimationStoryboard, IUIAnimationVariable, Float64, Float64, HRESULT)).call(storyboard, variable, newvalue, previousvalue)
  end
end
struct LibWin32::IUIAnimationVariableIntegerChangeHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_integer_value_changed(storyboard : IUIAnimationStoryboard, variable : IUIAnimationVariable, newvalue : Int32, previousvalue : Int32) : HRESULT
    @lpVtbl.value.on_integer_value_changed.unsafe_as(Proc(IUIAnimationStoryboard, IUIAnimationVariable, Int32, Int32, HRESULT)).call(storyboard, variable, newvalue, previousvalue)
  end
end
struct LibWin32::IUIAnimationStoryboardEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_storyboard_status_changed(storyboard : IUIAnimationStoryboard, newstatus : UI_ANIMATION_STORYBOARD_STATUS, previousstatus : UI_ANIMATION_STORYBOARD_STATUS) : HRESULT
    @lpVtbl.value.on_storyboard_status_changed.unsafe_as(Proc(IUIAnimationStoryboard, UI_ANIMATION_STORYBOARD_STATUS, UI_ANIMATION_STORYBOARD_STATUS, HRESULT)).call(storyboard, newstatus, previousstatus)
  end
  def on_storyboard_updated(storyboard : IUIAnimationStoryboard) : HRESULT
    @lpVtbl.value.on_storyboard_updated.unsafe_as(Proc(IUIAnimationStoryboard, HRESULT)).call(storyboard)
  end
end
struct LibWin32::IUIAnimationPriorityComparison
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def has_priority(scheduledstoryboard : IUIAnimationStoryboard, newstoryboard : IUIAnimationStoryboard, priorityeffect : UI_ANIMATION_PRIORITY_EFFECT) : HRESULT
    @lpVtbl.value.has_priority.unsafe_as(Proc(IUIAnimationStoryboard, IUIAnimationStoryboard, UI_ANIMATION_PRIORITY_EFFECT, HRESULT)).call(scheduledstoryboard, newstoryboard, priorityeffect)
  end
end
struct LibWin32::IUIAnimationTransitionLibrary
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instantaneous_transition(finalvalue : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_instantaneous_transition.unsafe_as(Proc(Float64, IUIAnimationTransition*, HRESULT)).call(finalvalue, transition)
  end
  def create_constant_transition(duration : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_constant_transition.unsafe_as(Proc(Float64, IUIAnimationTransition*, HRESULT)).call(duration, transition)
  end
  def create_discrete_transition(delay : Float64, finalvalue : Float64, hold : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_discrete_transition.unsafe_as(Proc(Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)).call(delay, finalvalue, hold, transition)
  end
  def create_linear_transition(duration : Float64, finalvalue : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_linear_transition.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition*, HRESULT)).call(duration, finalvalue, transition)
  end
  def create_linear_transition_from_speed(speed : Float64, finalvalue : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_linear_transition_from_speed.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition*, HRESULT)).call(speed, finalvalue, transition)
  end
  def create_sinusoidal_transition_from_velocity(duration : Float64, period : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_sinusoidal_transition_from_velocity.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition*, HRESULT)).call(duration, period, transition)
  end
  def create_sinusoidal_transition_from_range(duration : Float64, minimumvalue : Float64, maximumvalue : Float64, period : Float64, slope : UI_ANIMATION_SLOPE, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_sinusoidal_transition_from_range.unsafe_as(Proc(Float64, Float64, Float64, Float64, UI_ANIMATION_SLOPE, IUIAnimationTransition*, HRESULT)).call(duration, minimumvalue, maximumvalue, period, slope, transition)
  end
  def create_accelerate_decelerate_transition(duration : Float64, finalvalue : Float64, accelerationratio : Float64, decelerationratio : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_accelerate_decelerate_transition.unsafe_as(Proc(Float64, Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)).call(duration, finalvalue, accelerationratio, decelerationratio, transition)
  end
  def create_reversal_transition(duration : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_reversal_transition.unsafe_as(Proc(Float64, IUIAnimationTransition*, HRESULT)).call(duration, transition)
  end
  def create_cubic_transition(duration : Float64, finalvalue : Float64, finalvelocity : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_cubic_transition.unsafe_as(Proc(Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)).call(duration, finalvalue, finalvelocity, transition)
  end
  def create_smooth_stop_transition(maximumduration : Float64, finalvalue : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_smooth_stop_transition.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition*, HRESULT)).call(maximumduration, finalvalue, transition)
  end
  def create_parabolic_transition_from_acceleration(finalvalue : Float64, finalvelocity : Float64, acceleration : Float64, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_parabolic_transition_from_acceleration.unsafe_as(Proc(Float64, Float64, Float64, IUIAnimationTransition*, HRESULT)).call(finalvalue, finalvelocity, acceleration, transition)
  end
end
struct LibWin32::IUIAnimationInterpolator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_initial_value_and_velocity(initialvalue : Float64, initialvelocity : Float64) : HRESULT
    @lpVtbl.value.set_initial_value_and_velocity.unsafe_as(Proc(Float64, Float64, HRESULT)).call(initialvalue, initialvelocity)
  end
  def set_duration(duration : Float64) : HRESULT
    @lpVtbl.value.set_duration.unsafe_as(Proc(Float64, HRESULT)).call(duration)
  end
  def get_duration(duration : Float64*) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(Float64*, HRESULT)).call(duration)
  end
  def get_final_value(value : Float64*) : HRESULT
    @lpVtbl.value.get_final_value.unsafe_as(Proc(Float64*, HRESULT)).call(value)
  end
  def interpolate_value(offset : Float64, value : Float64*) : HRESULT
    @lpVtbl.value.interpolate_value.unsafe_as(Proc(Float64, Float64*, HRESULT)).call(offset, value)
  end
  def interpolate_velocity(offset : Float64, velocity : Float64*) : HRESULT
    @lpVtbl.value.interpolate_velocity.unsafe_as(Proc(Float64, Float64*, HRESULT)).call(offset, velocity)
  end
  def get_dependencies(initialvaluedependencies : UI_ANIMATION_DEPENDENCIES*, initialvelocitydependencies : UI_ANIMATION_DEPENDENCIES*, durationdependencies : UI_ANIMATION_DEPENDENCIES*) : HRESULT
    @lpVtbl.value.get_dependencies.unsafe_as(Proc(UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, HRESULT)).call(initialvaluedependencies, initialvelocitydependencies, durationdependencies)
  end
end
struct LibWin32::IUIAnimationTransitionFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_transition(interpolator : IUIAnimationInterpolator, transition : IUIAnimationTransition*) : HRESULT
    @lpVtbl.value.create_transition.unsafe_as(Proc(IUIAnimationInterpolator, IUIAnimationTransition*, HRESULT)).call(interpolator, transition)
  end
end
struct LibWin32::IUIAnimationTimer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_timer_update_handler(updatehandler : IUIAnimationTimerUpdateHandler, idlebehavior : UI_ANIMATION_IDLE_BEHAVIOR) : HRESULT
    @lpVtbl.value.set_timer_update_handler.unsafe_as(Proc(IUIAnimationTimerUpdateHandler, UI_ANIMATION_IDLE_BEHAVIOR, HRESULT)).call(updatehandler, idlebehavior)
  end
  def set_timer_event_handler(handler : IUIAnimationTimerEventHandler) : HRESULT
    @lpVtbl.value.set_timer_event_handler.unsafe_as(Proc(IUIAnimationTimerEventHandler, HRESULT)).call(handler)
  end
  def enable : HRESULT
    @lpVtbl.value.enable.unsafe_as(Proc(HRESULT)).call
  end
  def disable : HRESULT
    @lpVtbl.value.disable.unsafe_as(Proc(HRESULT)).call
  end
  def is_enabled : HRESULT
    @lpVtbl.value.is_enabled.unsafe_as(Proc(HRESULT)).call
  end
  def get_time(seconds : Float64*) : HRESULT
    @lpVtbl.value.get_time.unsafe_as(Proc(Float64*, HRESULT)).call(seconds)
  end
  def set_frame_rate_threshold(framespersecond : UInt32) : HRESULT
    @lpVtbl.value.set_frame_rate_threshold.unsafe_as(Proc(UInt32, HRESULT)).call(framespersecond)
  end
end
struct LibWin32::IUIAnimationTimerUpdateHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_update(timenow : Float64, result : UI_ANIMATION_UPDATE_RESULT*) : HRESULT
    @lpVtbl.value.on_update.unsafe_as(Proc(Float64, UI_ANIMATION_UPDATE_RESULT*, HRESULT)).call(timenow, result)
  end
  def set_timer_client_event_handler(handler : IUIAnimationTimerClientEventHandler) : HRESULT
    @lpVtbl.value.set_timer_client_event_handler.unsafe_as(Proc(IUIAnimationTimerClientEventHandler, HRESULT)).call(handler)
  end
  def clear_timer_client_event_handler : HRESULT
    @lpVtbl.value.clear_timer_client_event_handler.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAnimationTimerClientEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_timer_client_status_changed(newstatus : UI_ANIMATION_TIMER_CLIENT_STATUS, previousstatus : UI_ANIMATION_TIMER_CLIENT_STATUS) : HRESULT
    @lpVtbl.value.on_timer_client_status_changed.unsafe_as(Proc(UI_ANIMATION_TIMER_CLIENT_STATUS, UI_ANIMATION_TIMER_CLIENT_STATUS, HRESULT)).call(newstatus, previousstatus)
  end
end
struct LibWin32::IUIAnimationTimerEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_pre_update : HRESULT
    @lpVtbl.value.on_pre_update.unsafe_as(Proc(HRESULT)).call
  end
  def on_post_update : HRESULT
    @lpVtbl.value.on_post_update.unsafe_as(Proc(HRESULT)).call
  end
  def on_rendering_too_slow(framespersecond : UInt32) : HRESULT
    @lpVtbl.value.on_rendering_too_slow.unsafe_as(Proc(UInt32, HRESULT)).call(framespersecond)
  end
end
struct LibWin32::IUIAnimationManager2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_animation_vector_variable(initialvalue : Float64*, cdimension : UInt32, variable : IUIAnimationVariable2*) : HRESULT
    @lpVtbl.value.create_animation_vector_variable.unsafe_as(Proc(Float64*, UInt32, IUIAnimationVariable2*, HRESULT)).call(initialvalue, cdimension, variable)
  end
  def create_animation_variable(initialvalue : Float64, variable : IUIAnimationVariable2*) : HRESULT
    @lpVtbl.value.create_animation_variable.unsafe_as(Proc(Float64, IUIAnimationVariable2*, HRESULT)).call(initialvalue, variable)
  end
  def schedule_transition(variable : IUIAnimationVariable2, transition : IUIAnimationTransition2, timenow : Float64) : HRESULT
    @lpVtbl.value.schedule_transition.unsafe_as(Proc(IUIAnimationVariable2, IUIAnimationTransition2, Float64, HRESULT)).call(variable, transition, timenow)
  end
  def create_storyboard(storyboard : IUIAnimationStoryboard2*) : HRESULT
    @lpVtbl.value.create_storyboard.unsafe_as(Proc(IUIAnimationStoryboard2*, HRESULT)).call(storyboard)
  end
  def finish_all_storyboards(completiondeadline : Float64) : HRESULT
    @lpVtbl.value.finish_all_storyboards.unsafe_as(Proc(Float64, HRESULT)).call(completiondeadline)
  end
  def abandon_all_storyboards : HRESULT
    @lpVtbl.value.abandon_all_storyboards.unsafe_as(Proc(HRESULT)).call
  end
  def update(timenow : Float64, updateresult : UI_ANIMATION_UPDATE_RESULT*) : HRESULT
    @lpVtbl.value.update.unsafe_as(Proc(Float64, UI_ANIMATION_UPDATE_RESULT*, HRESULT)).call(timenow, updateresult)
  end
  def get_variable_from_tag(object : IUnknown, id : UInt32, variable : IUIAnimationVariable2*) : HRESULT
    @lpVtbl.value.get_variable_from_tag.unsafe_as(Proc(IUnknown, UInt32, IUIAnimationVariable2*, HRESULT)).call(object, id, variable)
  end
  def get_storyboard_from_tag(object : IUnknown, id : UInt32, storyboard : IUIAnimationStoryboard2*) : HRESULT
    @lpVtbl.value.get_storyboard_from_tag.unsafe_as(Proc(IUnknown, UInt32, IUIAnimationStoryboard2*, HRESULT)).call(object, id, storyboard)
  end
  def estimate_next_event_time(seconds : Float64*) : HRESULT
    @lpVtbl.value.estimate_next_event_time.unsafe_as(Proc(Float64*, HRESULT)).call(seconds)
  end
  def get_status(status : UI_ANIMATION_MANAGER_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UI_ANIMATION_MANAGER_STATUS*, HRESULT)).call(status)
  end
  def set_animation_mode(mode : UI_ANIMATION_MODE) : HRESULT
    @lpVtbl.value.set_animation_mode.unsafe_as(Proc(UI_ANIMATION_MODE, HRESULT)).call(mode)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def set_manager_event_handler(handler : IUIAnimationManagerEventHandler2, fregisterfornextanimationevent : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manager_event_handler.unsafe_as(Proc(IUIAnimationManagerEventHandler2, LibC::BOOL, HRESULT)).call(handler, fregisterfornextanimationevent)
  end
  def set_cancel_priority_comparison(comparison : IUIAnimationPriorityComparison2) : HRESULT
    @lpVtbl.value.set_cancel_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison2, HRESULT)).call(comparison)
  end
  def set_trim_priority_comparison(comparison : IUIAnimationPriorityComparison2) : HRESULT
    @lpVtbl.value.set_trim_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison2, HRESULT)).call(comparison)
  end
  def set_compress_priority_comparison(comparison : IUIAnimationPriorityComparison2) : HRESULT
    @lpVtbl.value.set_compress_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison2, HRESULT)).call(comparison)
  end
  def set_conclude_priority_comparison(comparison : IUIAnimationPriorityComparison2) : HRESULT
    @lpVtbl.value.set_conclude_priority_comparison.unsafe_as(Proc(IUIAnimationPriorityComparison2, HRESULT)).call(comparison)
  end
  def set_default_longest_acceptable_delay(delay : Float64) : HRESULT
    @lpVtbl.value.set_default_longest_acceptable_delay.unsafe_as(Proc(Float64, HRESULT)).call(delay)
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAnimationVariable2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dimension(dimension : UInt32*) : HRESULT
    @lpVtbl.value.get_dimension.unsafe_as(Proc(UInt32*, HRESULT)).call(dimension)
  end
  def get_value(value : Float64*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(Float64*, HRESULT)).call(value)
  end
  def get_vector_value(value : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_vector_value.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(value, cdimension)
  end
  def get_curve(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.get_curve.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def get_vector_curve(animation : IDCompositionAnimation*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_vector_curve.unsafe_as(Proc(IDCompositionAnimation*, UInt32, HRESULT)).call(animation, cdimension)
  end
  def get_final_value(finalvalue : Float64*) : HRESULT
    @lpVtbl.value.get_final_value.unsafe_as(Proc(Float64*, HRESULT)).call(finalvalue)
  end
  def get_final_vector_value(finalvalue : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_final_vector_value.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(finalvalue, cdimension)
  end
  def get_previous_value(previousvalue : Float64*) : HRESULT
    @lpVtbl.value.get_previous_value.unsafe_as(Proc(Float64*, HRESULT)).call(previousvalue)
  end
  def get_previous_vector_value(previousvalue : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_previous_vector_value.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(previousvalue, cdimension)
  end
  def get_integer_value(value : Int32*) : HRESULT
    @lpVtbl.value.get_integer_value.unsafe_as(Proc(Int32*, HRESULT)).call(value)
  end
  def get_integer_vector_value(value : Int32*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_integer_vector_value.unsafe_as(Proc(Int32*, UInt32, HRESULT)).call(value, cdimension)
  end
  def get_final_integer_value(finalvalue : Int32*) : HRESULT
    @lpVtbl.value.get_final_integer_value.unsafe_as(Proc(Int32*, HRESULT)).call(finalvalue)
  end
  def get_final_integer_vector_value(finalvalue : Int32*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_final_integer_vector_value.unsafe_as(Proc(Int32*, UInt32, HRESULT)).call(finalvalue, cdimension)
  end
  def get_previous_integer_value(previousvalue : Int32*) : HRESULT
    @lpVtbl.value.get_previous_integer_value.unsafe_as(Proc(Int32*, HRESULT)).call(previousvalue)
  end
  def get_previous_integer_vector_value(previousvalue : Int32*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_previous_integer_vector_value.unsafe_as(Proc(Int32*, UInt32, HRESULT)).call(previousvalue, cdimension)
  end
  def get_current_storyboard(storyboard : IUIAnimationStoryboard2*) : HRESULT
    @lpVtbl.value.get_current_storyboard.unsafe_as(Proc(IUIAnimationStoryboard2*, HRESULT)).call(storyboard)
  end
  def set_lower_bound(bound : Float64) : HRESULT
    @lpVtbl.value.set_lower_bound.unsafe_as(Proc(Float64, HRESULT)).call(bound)
  end
  def set_lower_bound_vector(bound : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.set_lower_bound_vector.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(bound, cdimension)
  end
  def set_upper_bound(bound : Float64) : HRESULT
    @lpVtbl.value.set_upper_bound.unsafe_as(Proc(Float64, HRESULT)).call(bound)
  end
  def set_upper_bound_vector(bound : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.set_upper_bound_vector.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(bound, cdimension)
  end
  def set_rounding_mode(mode : UI_ANIMATION_ROUNDING_MODE) : HRESULT
    @lpVtbl.value.set_rounding_mode.unsafe_as(Proc(UI_ANIMATION_ROUNDING_MODE, HRESULT)).call(mode)
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_tag(object : IUnknown*, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(IUnknown*, UInt32*, HRESULT)).call(object, id)
  end
  def set_variable_change_handler(handler : IUIAnimationVariableChangeHandler2, fregisterfornextanimationevent : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_variable_change_handler.unsafe_as(Proc(IUIAnimationVariableChangeHandler2, LibC::BOOL, HRESULT)).call(handler, fregisterfornextanimationevent)
  end
  def set_variable_integer_change_handler(handler : IUIAnimationVariableIntegerChangeHandler2, fregisterfornextanimationevent : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_variable_integer_change_handler.unsafe_as(Proc(IUIAnimationVariableIntegerChangeHandler2, LibC::BOOL, HRESULT)).call(handler, fregisterfornextanimationevent)
  end
  def set_variable_curve_change_handler(handler : IUIAnimationVariableCurveChangeHandler2) : HRESULT
    @lpVtbl.value.set_variable_curve_change_handler.unsafe_as(Proc(IUIAnimationVariableCurveChangeHandler2, HRESULT)).call(handler)
  end
end
struct LibWin32::IUIAnimationTransition2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dimension(dimension : UInt32*) : HRESULT
    @lpVtbl.value.get_dimension.unsafe_as(Proc(UInt32*, HRESULT)).call(dimension)
  end
  def set_initial_value(value : Float64) : HRESULT
    @lpVtbl.value.set_initial_value.unsafe_as(Proc(Float64, HRESULT)).call(value)
  end
  def set_initial_vector_value(value : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.set_initial_vector_value.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(value, cdimension)
  end
  def set_initial_velocity(velocity : Float64) : HRESULT
    @lpVtbl.value.set_initial_velocity.unsafe_as(Proc(Float64, HRESULT)).call(velocity)
  end
  def set_initial_vector_velocity(velocity : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.set_initial_vector_velocity.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(velocity, cdimension)
  end
  def is_duration_known : HRESULT
    @lpVtbl.value.is_duration_known.unsafe_as(Proc(HRESULT)).call
  end
  def get_duration(duration : Float64*) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(Float64*, HRESULT)).call(duration)
  end
end
struct LibWin32::IUIAnimationManagerEventHandler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_manager_status_changed(newstatus : UI_ANIMATION_MANAGER_STATUS, previousstatus : UI_ANIMATION_MANAGER_STATUS) : HRESULT
    @lpVtbl.value.on_manager_status_changed.unsafe_as(Proc(UI_ANIMATION_MANAGER_STATUS, UI_ANIMATION_MANAGER_STATUS, HRESULT)).call(newstatus, previousstatus)
  end
end
struct LibWin32::IUIAnimationVariableChangeHandler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_value_changed(storyboard : IUIAnimationStoryboard2, variable : IUIAnimationVariable2, newvalue : Float64*, previousvalue : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.on_value_changed.unsafe_as(Proc(IUIAnimationStoryboard2, IUIAnimationVariable2, Float64*, Float64*, UInt32, HRESULT)).call(storyboard, variable, newvalue, previousvalue, cdimension)
  end
end
struct LibWin32::IUIAnimationVariableIntegerChangeHandler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_integer_value_changed(storyboard : IUIAnimationStoryboard2, variable : IUIAnimationVariable2, newvalue : Int32*, previousvalue : Int32*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.on_integer_value_changed.unsafe_as(Proc(IUIAnimationStoryboard2, IUIAnimationVariable2, Int32*, Int32*, UInt32, HRESULT)).call(storyboard, variable, newvalue, previousvalue, cdimension)
  end
end
struct LibWin32::IUIAnimationVariableCurveChangeHandler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_curve_changed(variable : IUIAnimationVariable2) : HRESULT
    @lpVtbl.value.on_curve_changed.unsafe_as(Proc(IUIAnimationVariable2, HRESULT)).call(variable)
  end
end
struct LibWin32::IUIAnimationStoryboardEventHandler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_storyboard_status_changed(storyboard : IUIAnimationStoryboard2, newstatus : UI_ANIMATION_STORYBOARD_STATUS, previousstatus : UI_ANIMATION_STORYBOARD_STATUS) : HRESULT
    @lpVtbl.value.on_storyboard_status_changed.unsafe_as(Proc(IUIAnimationStoryboard2, UI_ANIMATION_STORYBOARD_STATUS, UI_ANIMATION_STORYBOARD_STATUS, HRESULT)).call(storyboard, newstatus, previousstatus)
  end
  def on_storyboard_updated(storyboard : IUIAnimationStoryboard2) : HRESULT
    @lpVtbl.value.on_storyboard_updated.unsafe_as(Proc(IUIAnimationStoryboard2, HRESULT)).call(storyboard)
  end
end
struct LibWin32::IUIAnimationLoopIterationChangeHandler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_loop_iteration_changed(storyboard : IUIAnimationStoryboard2, id : LibC::UINT_PTR, newiterationcount : UInt32, olditerationcount : UInt32) : HRESULT
    @lpVtbl.value.on_loop_iteration_changed.unsafe_as(Proc(IUIAnimationStoryboard2, LibC::UINT_PTR, UInt32, UInt32, HRESULT)).call(storyboard, id, newiterationcount, olditerationcount)
  end
end
struct LibWin32::IUIAnimationPriorityComparison2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def has_priority(scheduledstoryboard : IUIAnimationStoryboard2, newstoryboard : IUIAnimationStoryboard2, priorityeffect : UI_ANIMATION_PRIORITY_EFFECT) : HRESULT
    @lpVtbl.value.has_priority.unsafe_as(Proc(IUIAnimationStoryboard2, IUIAnimationStoryboard2, UI_ANIMATION_PRIORITY_EFFECT, HRESULT)).call(scheduledstoryboard, newstoryboard, priorityeffect)
  end
end
struct LibWin32::IUIAnimationTransitionLibrary2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instantaneous_transition(finalvalue : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_instantaneous_transition.unsafe_as(Proc(Float64, IUIAnimationTransition2*, HRESULT)).call(finalvalue, transition)
  end
  def create_instantaneous_vector_transition(finalvalue : Float64*, cdimension : UInt32, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_instantaneous_vector_transition.unsafe_as(Proc(Float64*, UInt32, IUIAnimationTransition2*, HRESULT)).call(finalvalue, cdimension, transition)
  end
  def create_constant_transition(duration : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_constant_transition.unsafe_as(Proc(Float64, IUIAnimationTransition2*, HRESULT)).call(duration, transition)
  end
  def create_discrete_transition(delay : Float64, finalvalue : Float64, hold : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_discrete_transition.unsafe_as(Proc(Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(delay, finalvalue, hold, transition)
  end
  def create_discrete_vector_transition(delay : Float64, finalvalue : Float64*, cdimension : UInt32, hold : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_discrete_vector_transition.unsafe_as(Proc(Float64, Float64*, UInt32, Float64, IUIAnimationTransition2*, HRESULT)).call(delay, finalvalue, cdimension, hold, transition)
  end
  def create_linear_transition(duration : Float64, finalvalue : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_linear_transition.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, transition)
  end
  def create_linear_vector_transition(duration : Float64, finalvalue : Float64*, cdimension : UInt32, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_linear_vector_transition.unsafe_as(Proc(Float64, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, cdimension, transition)
  end
  def create_linear_transition_from_speed(speed : Float64, finalvalue : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_linear_transition_from_speed.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(speed, finalvalue, transition)
  end
  def create_linear_vector_transition_from_speed(speed : Float64, finalvalue : Float64*, cdimension : UInt32, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_linear_vector_transition_from_speed.unsafe_as(Proc(Float64, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)).call(speed, finalvalue, cdimension, transition)
  end
  def create_sinusoidal_transition_from_velocity(duration : Float64, period : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_sinusoidal_transition_from_velocity.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(duration, period, transition)
  end
  def create_sinusoidal_transition_from_range(duration : Float64, minimumvalue : Float64, maximumvalue : Float64, period : Float64, slope : UI_ANIMATION_SLOPE, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_sinusoidal_transition_from_range.unsafe_as(Proc(Float64, Float64, Float64, Float64, UI_ANIMATION_SLOPE, IUIAnimationTransition2*, HRESULT)).call(duration, minimumvalue, maximumvalue, period, slope, transition)
  end
  def create_accelerate_decelerate_transition(duration : Float64, finalvalue : Float64, accelerationratio : Float64, decelerationratio : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_accelerate_decelerate_transition.unsafe_as(Proc(Float64, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, accelerationratio, decelerationratio, transition)
  end
  def create_reversal_transition(duration : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_reversal_transition.unsafe_as(Proc(Float64, IUIAnimationTransition2*, HRESULT)).call(duration, transition)
  end
  def create_cubic_transition(duration : Float64, finalvalue : Float64, finalvelocity : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_cubic_transition.unsafe_as(Proc(Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, finalvelocity, transition)
  end
  def create_cubic_vector_transition(duration : Float64, finalvalue : Float64*, finalvelocity : Float64*, cdimension : UInt32, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_cubic_vector_transition.unsafe_as(Proc(Float64, Float64*, Float64*, UInt32, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, finalvelocity, cdimension, transition)
  end
  def create_smooth_stop_transition(maximumduration : Float64, finalvalue : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_smooth_stop_transition.unsafe_as(Proc(Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(maximumduration, finalvalue, transition)
  end
  def create_parabolic_transition_from_acceleration(finalvalue : Float64, finalvelocity : Float64, acceleration : Float64, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_parabolic_transition_from_acceleration.unsafe_as(Proc(Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(finalvalue, finalvelocity, acceleration, transition)
  end
  def create_cubic_bezier_linear_transition(duration : Float64, finalvalue : Float64, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, pptransition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_cubic_bezier_linear_transition.unsafe_as(Proc(Float64, Float64, Float64, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, x1, y1, x2, y2, pptransition)
  end
  def create_cubic_bezier_linear_vector_transition(duration : Float64, finalvalue : Float64*, cdimension : UInt32, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, pptransition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_cubic_bezier_linear_vector_transition.unsafe_as(Proc(Float64, Float64*, UInt32, Float64, Float64, Float64, Float64, IUIAnimationTransition2*, HRESULT)).call(duration, finalvalue, cdimension, x1, y1, x2, y2, pptransition)
  end
end
struct LibWin32::IUIAnimationPrimitiveInterpolation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_cubic(dimension : UInt32, beginoffset : Float64, constantcoefficient : Float32, linearcoefficient : Float32, quadraticcoefficient : Float32, cubiccoefficient : Float32) : HRESULT
    @lpVtbl.value.add_cubic.unsafe_as(Proc(UInt32, Float64, Float32, Float32, Float32, Float32, HRESULT)).call(dimension, beginoffset, constantcoefficient, linearcoefficient, quadraticcoefficient, cubiccoefficient)
  end
  def add_sinusoidal(dimension : UInt32, beginoffset : Float64, bias : Float32, amplitude : Float32, frequency : Float32, phase : Float32) : HRESULT
    @lpVtbl.value.add_sinusoidal.unsafe_as(Proc(UInt32, Float64, Float32, Float32, Float32, Float32, HRESULT)).call(dimension, beginoffset, bias, amplitude, frequency, phase)
  end
end
struct LibWin32::IUIAnimationInterpolator2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dimension(dimension : UInt32*) : HRESULT
    @lpVtbl.value.get_dimension.unsafe_as(Proc(UInt32*, HRESULT)).call(dimension)
  end
  def set_initial_value_and_velocity(initialvalue : Float64*, initialvelocity : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.set_initial_value_and_velocity.unsafe_as(Proc(Float64*, Float64*, UInt32, HRESULT)).call(initialvalue, initialvelocity, cdimension)
  end
  def set_duration(duration : Float64) : HRESULT
    @lpVtbl.value.set_duration.unsafe_as(Proc(Float64, HRESULT)).call(duration)
  end
  def get_duration(duration : Float64*) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(Float64*, HRESULT)).call(duration)
  end
  def get_final_value(value : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_final_value.unsafe_as(Proc(Float64*, UInt32, HRESULT)).call(value, cdimension)
  end
  def interpolate_value(offset : Float64, value : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.interpolate_value.unsafe_as(Proc(Float64, Float64*, UInt32, HRESULT)).call(offset, value, cdimension)
  end
  def interpolate_velocity(offset : Float64, velocity : Float64*, cdimension : UInt32) : HRESULT
    @lpVtbl.value.interpolate_velocity.unsafe_as(Proc(Float64, Float64*, UInt32, HRESULT)).call(offset, velocity, cdimension)
  end
  def get_primitive_interpolation(interpolation : IUIAnimationPrimitiveInterpolation, cdimension : UInt32) : HRESULT
    @lpVtbl.value.get_primitive_interpolation.unsafe_as(Proc(IUIAnimationPrimitiveInterpolation, UInt32, HRESULT)).call(interpolation, cdimension)
  end
  def get_dependencies(initialvaluedependencies : UI_ANIMATION_DEPENDENCIES*, initialvelocitydependencies : UI_ANIMATION_DEPENDENCIES*, durationdependencies : UI_ANIMATION_DEPENDENCIES*) : HRESULT
    @lpVtbl.value.get_dependencies.unsafe_as(Proc(UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, UI_ANIMATION_DEPENDENCIES*, HRESULT)).call(initialvaluedependencies, initialvelocitydependencies, durationdependencies)
  end
end
struct LibWin32::IUIAnimationTransitionFactory2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_transition(interpolator : IUIAnimationInterpolator2, transition : IUIAnimationTransition2*) : HRESULT
    @lpVtbl.value.create_transition.unsafe_as(Proc(IUIAnimationInterpolator2, IUIAnimationTransition2*, HRESULT)).call(interpolator, transition)
  end
end
struct LibWin32::IUIAnimationStoryboard2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_transition(variable : IUIAnimationVariable2, transition : IUIAnimationTransition2) : HRESULT
    @lpVtbl.value.add_transition.unsafe_as(Proc(IUIAnimationVariable2, IUIAnimationTransition2, HRESULT)).call(variable, transition)
  end
  def add_keyframe_at_offset(existingkeyframe : UI_ANIMATION_KEYFRAME, offset : Float64, keyframe : UI_ANIMATION_KEYFRAME*) : HRESULT
    @lpVtbl.value.add_keyframe_at_offset.unsafe_as(Proc(UI_ANIMATION_KEYFRAME, Float64, UI_ANIMATION_KEYFRAME*, HRESULT)).call(existingkeyframe, offset, keyframe)
  end
  def add_keyframe_after_transition(transition : IUIAnimationTransition2, keyframe : UI_ANIMATION_KEYFRAME*) : HRESULT
    @lpVtbl.value.add_keyframe_after_transition.unsafe_as(Proc(IUIAnimationTransition2, UI_ANIMATION_KEYFRAME*, HRESULT)).call(transition, keyframe)
  end
  def add_transition_at_keyframe(variable : IUIAnimationVariable2, transition : IUIAnimationTransition2, startkeyframe : UI_ANIMATION_KEYFRAME) : HRESULT
    @lpVtbl.value.add_transition_at_keyframe.unsafe_as(Proc(IUIAnimationVariable2, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME, HRESULT)).call(variable, transition, startkeyframe)
  end
  def add_transition_between_keyframes(variable : IUIAnimationVariable2, transition : IUIAnimationTransition2, startkeyframe : UI_ANIMATION_KEYFRAME, endkeyframe : UI_ANIMATION_KEYFRAME) : HRESULT
    @lpVtbl.value.add_transition_between_keyframes.unsafe_as(Proc(IUIAnimationVariable2, IUIAnimationTransition2, UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, HRESULT)).call(variable, transition, startkeyframe, endkeyframe)
  end
  def repeat_between_keyframes(startkeyframe : UI_ANIMATION_KEYFRAME, endkeyframe : UI_ANIMATION_KEYFRAME, crepetition : Float64, repeatmode : UI_ANIMATION_REPEAT_MODE, piterationchangehandler : IUIAnimationLoopIterationChangeHandler2, id : LibC::UINT_PTR, fregisterfornextanimationevent : LibC::BOOL) : HRESULT
    @lpVtbl.value.repeat_between_keyframes.unsafe_as(Proc(UI_ANIMATION_KEYFRAME, UI_ANIMATION_KEYFRAME, Float64, UI_ANIMATION_REPEAT_MODE, IUIAnimationLoopIterationChangeHandler2, LibC::UINT_PTR, LibC::BOOL, HRESULT)).call(startkeyframe, endkeyframe, crepetition, repeatmode, piterationchangehandler, id, fregisterfornextanimationevent)
  end
  def hold_variable(variable : IUIAnimationVariable2) : HRESULT
    @lpVtbl.value.hold_variable.unsafe_as(Proc(IUIAnimationVariable2, HRESULT)).call(variable)
  end
  def set_longest_acceptable_delay(delay : Float64) : HRESULT
    @lpVtbl.value.set_longest_acceptable_delay.unsafe_as(Proc(Float64, HRESULT)).call(delay)
  end
  def set_skip_duration(secondsduration : Float64) : HRESULT
    @lpVtbl.value.set_skip_duration.unsafe_as(Proc(Float64, HRESULT)).call(secondsduration)
  end
  def schedule(timenow : Float64, schedulingresult : UI_ANIMATION_SCHEDULING_RESULT*) : HRESULT
    @lpVtbl.value.schedule.unsafe_as(Proc(Float64, UI_ANIMATION_SCHEDULING_RESULT*, HRESULT)).call(timenow, schedulingresult)
  end
  def conclude : HRESULT
    @lpVtbl.value.conclude.unsafe_as(Proc(HRESULT)).call
  end
  def finish(completiondeadline : Float64) : HRESULT
    @lpVtbl.value.finish.unsafe_as(Proc(Float64, HRESULT)).call(completiondeadline)
  end
  def abandon : HRESULT
    @lpVtbl.value.abandon.unsafe_as(Proc(HRESULT)).call
  end
  def set_tag(object : IUnknown, id : UInt32) : HRESULT
    @lpVtbl.value.set_tag.unsafe_as(Proc(IUnknown, UInt32, HRESULT)).call(object, id)
  end
  def get_tag(object : IUnknown*, id : UInt32*) : HRESULT
    @lpVtbl.value.get_tag.unsafe_as(Proc(IUnknown*, UInt32*, HRESULT)).call(object, id)
  end
  def get_status(status : UI_ANIMATION_STORYBOARD_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UI_ANIMATION_STORYBOARD_STATUS*, HRESULT)).call(status)
  end
  def get_elapsed_time(elapsedtime : Float64*) : HRESULT
    @lpVtbl.value.get_elapsed_time.unsafe_as(Proc(Float64*, HRESULT)).call(elapsedtime)
  end
  def set_storyboard_event_handler(handler : IUIAnimationStoryboardEventHandler2, fregisterstatuschangefornextanimationevent : LibC::BOOL, fregisterupdatefornextanimationevent : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_storyboard_event_handler.unsafe_as(Proc(IUIAnimationStoryboardEventHandler2, LibC::BOOL, LibC::BOOL, HRESULT)).call(handler, fregisterstatuschangefornextanimationevent, fregisterupdatefornextanimationevent)
  end
end
