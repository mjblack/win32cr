require "./../system/com.cr"
require "./../foundation.cr"
require "./../graphics/direct_composition.cr"

module Win32cr::UI::Animation
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

  enum UI_ANIMATION_UPDATE_RESULT
    UI_ANIMATION_UPDATE_NO_CHANGE = 0_i32
    UI_ANIMATION_UPDATE_VARIABLES_CHANGED = 1_i32
  end
  enum UI_ANIMATION_MANAGER_STATUS
    UI_ANIMATION_MANAGER_IDLE = 0_i32
    UI_ANIMATION_MANAGER_BUSY = 1_i32
  end
  enum UI_ANIMATION_MODE
    UI_ANIMATION_MODE_DISABLED = 0_i32
    UI_ANIMATION_MODE_SYSTEM_DEFAULT = 1_i32
    UI_ANIMATION_MODE_ENABLED = 2_i32
  end
  enum UI_ANIMATION_REPEAT_MODE
    UI_ANIMATION_REPEAT_MODE_NORMAL = 0_i32
    UI_ANIMATION_REPEAT_MODE_ALTERNATE = 1_i32
  end
  enum UI_ANIMATION_ROUNDING_MODE
    UI_ANIMATION_ROUNDING_NEAREST = 0_i32
    UI_ANIMATION_ROUNDING_FLOOR = 1_i32
    UI_ANIMATION_ROUNDING_CEILING = 2_i32
  end
  enum UI_ANIMATION_STORYBOARD_STATUS
    UI_ANIMATION_STORYBOARD_BUILDING = 0_i32
    UI_ANIMATION_STORYBOARD_SCHEDULED = 1_i32
    UI_ANIMATION_STORYBOARD_CANCELLED = 2_i32
    UI_ANIMATION_STORYBOARD_PLAYING = 3_i32
    UI_ANIMATION_STORYBOARD_TRUNCATED = 4_i32
    UI_ANIMATION_STORYBOARD_FINISHED = 5_i32
    UI_ANIMATION_STORYBOARD_READY = 6_i32
    UI_ANIMATION_STORYBOARD_INSUFFICIENT_PRIORITY = 7_i32
  end
  enum UI_ANIMATION_SCHEDULING_RESULT
    UI_ANIMATION_SCHEDULING_UNEXPECTED_FAILURE = 0_i32
    UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY = 1_i32
    UI_ANIMATION_SCHEDULING_ALREADY_SCHEDULED = 2_i32
    UI_ANIMATION_SCHEDULING_SUCCEEDED = 3_i32
    UI_ANIMATION_SCHEDULING_DEFERRED = 4_i32
  end
  enum UI_ANIMATION_PRIORITY_EFFECT
    UI_ANIMATION_PRIORITY_EFFECT_FAILURE = 0_i32
    UI_ANIMATION_PRIORITY_EFFECT_DELAY = 1_i32
  end
  enum UI_ANIMATION_SLOPE
    UI_ANIMATION_SLOPE_INCREASING = 0_i32
    UI_ANIMATION_SLOPE_DECREASING = 1_i32
  end
  @[Flags]
  enum UI_ANIMATION_DEPENDENCIES : UInt32
    UI_ANIMATION_DEPENDENCY_NONE = 0_u32
    UI_ANIMATION_DEPENDENCY_INTERMEDIATE_VALUES = 1_u32
    UI_ANIMATION_DEPENDENCY_FINAL_VALUE = 2_u32
    UI_ANIMATION_DEPENDENCY_FINAL_VELOCITY = 4_u32
    UI_ANIMATION_DEPENDENCY_DURATION = 8_u32
  end
  enum UI_ANIMATION_IDLE_BEHAVIOR
    UI_ANIMATION_IDLE_BEHAVIOR_CONTINUE = 0_i32
    UI_ANIMATION_IDLE_BEHAVIOR_DISABLE = 1_i32
  end
  enum UI_ANIMATION_TIMER_CLIENT_STATUS
    UI_ANIMATION_TIMER_CLIENT_IDLE = 0_i32
    UI_ANIMATION_TIMER_CLIENT_BUSY = 1_i32
  end

  @[Extern]
  record IUIAnimationManagerVtbl,
    query_interface : Proc(IUIAnimationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationManager*, UInt32),
    release : Proc(IUIAnimationManager*, UInt32),
    create_animation_variable : Proc(IUIAnimationManager*, Float64, Void**, Win32cr::Foundation::HRESULT),
    schedule_transition : Proc(IUIAnimationManager*, Void*, Void*, Float64, Win32cr::Foundation::HRESULT),
    create_storyboard : Proc(IUIAnimationManager*, Void**, Win32cr::Foundation::HRESULT),
    finish_all_storyboards : Proc(IUIAnimationManager*, Float64, Win32cr::Foundation::HRESULT),
    abandon_all_storyboards : Proc(IUIAnimationManager*, Win32cr::Foundation::HRESULT),
    update : Proc(IUIAnimationManager*, Float64, Win32cr::UI::Animation::UI_ANIMATION_UPDATE_RESULT*, Win32cr::Foundation::HRESULT),
    get_variable_from_tag : Proc(IUIAnimationManager*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_storyboard_from_tag : Proc(IUIAnimationManager*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_status : Proc(IUIAnimationManager*, Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS*, Win32cr::Foundation::HRESULT),
    set_animation_mode : Proc(IUIAnimationManager*, Win32cr::UI::Animation::UI_ANIMATION_MODE, Win32cr::Foundation::HRESULT),
    pause : Proc(IUIAnimationManager*, Win32cr::Foundation::HRESULT),
    resume : Proc(IUIAnimationManager*, Win32cr::Foundation::HRESULT),
    set_manager_event_handler : Proc(IUIAnimationManager*, Void*, Win32cr::Foundation::HRESULT),
    set_cancel_priority_comparison : Proc(IUIAnimationManager*, Void*, Win32cr::Foundation::HRESULT),
    set_trim_priority_comparison : Proc(IUIAnimationManager*, Void*, Win32cr::Foundation::HRESULT),
    set_compress_priority_comparison : Proc(IUIAnimationManager*, Void*, Win32cr::Foundation::HRESULT),
    set_conclude_priority_comparison : Proc(IUIAnimationManager*, Void*, Win32cr::Foundation::HRESULT),
    set_default_longest_acceptable_delay : Proc(IUIAnimationManager*, Float64, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IUIAnimationManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationManager, lpVtbl : IUIAnimationManagerVtbl* do
    GUID = LibC::GUID.new(0x9169896c_u32, 0xac8d_u16, 0x4e7d_u16, StaticArray[0x94_u8, 0xe5_u8, 0x67_u8, 0xfa_u8, 0x4d_u8, 0xc2_u8, 0xf2_u8, 0xe8_u8])
    def query_interface(this : IUIAnimationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_animation_variable(this : IUIAnimationManager*, initialValue : Float64, variable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation_variable.call(this, initialValue, variable)
    end
    def schedule_transition(this : IUIAnimationManager*, variable : Void*, transition : Void*, timeNow : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.schedule_transition.call(this, variable, transition, timeNow)
    end
    def create_storyboard(this : IUIAnimationManager*, storyboard : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storyboard.call(this, storyboard)
    end
    def finish_all_storyboards(this : IUIAnimationManager*, completionDeadline : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_all_storyboards.call(this, completionDeadline)
    end
    def abandon_all_storyboards(this : IUIAnimationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abandon_all_storyboards.call(this)
    end
    def update(this : IUIAnimationManager*, timeNow : Float64, updateResult : Win32cr::UI::Animation::UI_ANIMATION_UPDATE_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this, timeNow, updateResult)
    end
    def get_variable_from_tag(this : IUIAnimationManager*, object : Void*, id : UInt32, variable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_variable_from_tag.call(this, object, id, variable)
    end
    def get_storyboard_from_tag(this : IUIAnimationManager*, object : Void*, id : UInt32, storyboard : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storyboard_from_tag.call(this, object, id, storyboard)
    end
    def get_status(this : IUIAnimationManager*, status : Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def set_animation_mode(this : IUIAnimationManager*, mode : Win32cr::UI::Animation::UI_ANIMATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_animation_mode.call(this, mode)
    end
    def pause(this : IUIAnimationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IUIAnimationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def set_manager_event_handler(this : IUIAnimationManager*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manager_event_handler.call(this, handler)
    end
    def set_cancel_priority_comparison(this : IUIAnimationManager*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cancel_priority_comparison.call(this, comparison)
    end
    def set_trim_priority_comparison(this : IUIAnimationManager*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_trim_priority_comparison.call(this, comparison)
    end
    def set_compress_priority_comparison(this : IUIAnimationManager*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_compress_priority_comparison.call(this, comparison)
    end
    def set_conclude_priority_comparison(this : IUIAnimationManager*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_conclude_priority_comparison.call(this, comparison)
    end
    def set_default_longest_acceptable_delay(this : IUIAnimationManager*, delay : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_longest_acceptable_delay.call(this, delay)
    end
    def shutdown(this : IUIAnimationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end

  end

  @[Extern]
  record IUIAnimationVariableVtbl,
    query_interface : Proc(IUIAnimationVariable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariable*, UInt32),
    release : Proc(IUIAnimationVariable*, UInt32),
    get_value : Proc(IUIAnimationVariable*, Float64*, Win32cr::Foundation::HRESULT),
    get_final_value : Proc(IUIAnimationVariable*, Float64*, Win32cr::Foundation::HRESULT),
    get_previous_value : Proc(IUIAnimationVariable*, Float64*, Win32cr::Foundation::HRESULT),
    get_integer_value : Proc(IUIAnimationVariable*, Int32*, Win32cr::Foundation::HRESULT),
    get_final_integer_value : Proc(IUIAnimationVariable*, Int32*, Win32cr::Foundation::HRESULT),
    get_previous_integer_value : Proc(IUIAnimationVariable*, Int32*, Win32cr::Foundation::HRESULT),
    get_current_storyboard : Proc(IUIAnimationVariable*, Void**, Win32cr::Foundation::HRESULT),
    set_lower_bound : Proc(IUIAnimationVariable*, Float64, Win32cr::Foundation::HRESULT),
    set_upper_bound : Proc(IUIAnimationVariable*, Float64, Win32cr::Foundation::HRESULT),
    set_rounding_mode : Proc(IUIAnimationVariable*, Win32cr::UI::Animation::UI_ANIMATION_ROUNDING_MODE, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IUIAnimationVariable*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IUIAnimationVariable*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_variable_change_handler : Proc(IUIAnimationVariable*, Void*, Win32cr::Foundation::HRESULT),
    set_variable_integer_change_handler : Proc(IUIAnimationVariable*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariable, lpVtbl : IUIAnimationVariableVtbl* do
    GUID = LibC::GUID.new(0x8ceeb155_u32, 0x2849_u16, 0x4ce5_u16, StaticArray[0x94_u8, 0x48_u8, 0x91_u8, 0xff_u8, 0x70_u8, 0xe1_u8, 0xe4_u8, 0xd9_u8])
    def query_interface(this : IUIAnimationVariable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_value(this : IUIAnimationVariable*, value : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, value)
    end
    def get_final_value(this : IUIAnimationVariable*, finalValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_value.call(this, finalValue)
    end
    def get_previous_value(this : IUIAnimationVariable*, previousValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_value.call(this, previousValue)
    end
    def get_integer_value(this : IUIAnimationVariable*, value : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_integer_value.call(this, value)
    end
    def get_final_integer_value(this : IUIAnimationVariable*, finalValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_integer_value.call(this, finalValue)
    end
    def get_previous_integer_value(this : IUIAnimationVariable*, previousValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_integer_value.call(this, previousValue)
    end
    def get_current_storyboard(this : IUIAnimationVariable*, storyboard : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_storyboard.call(this, storyboard)
    end
    def set_lower_bound(this : IUIAnimationVariable*, bound : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_lower_bound.call(this, bound)
    end
    def set_upper_bound(this : IUIAnimationVariable*, bound : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_upper_bound.call(this, bound)
    end
    def set_rounding_mode(this : IUIAnimationVariable*, mode : Win32cr::UI::Animation::UI_ANIMATION_ROUNDING_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rounding_mode.call(this, mode)
    end
    def set_tag(this : IUIAnimationVariable*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_tag(this : IUIAnimationVariable*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, object, id)
    end
    def set_variable_change_handler(this : IUIAnimationVariable*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_variable_change_handler.call(this, handler)
    end
    def set_variable_integer_change_handler(this : IUIAnimationVariable*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_variable_integer_change_handler.call(this, handler)
    end

  end

  @[Extern]
  record IUIAnimationStoryboardVtbl,
    query_interface : Proc(IUIAnimationStoryboard*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationStoryboard*, UInt32),
    release : Proc(IUIAnimationStoryboard*, UInt32),
    add_transition : Proc(IUIAnimationStoryboard*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_keyframe_at_offset : Proc(IUIAnimationStoryboard*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Float64, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*, Win32cr::Foundation::HRESULT),
    add_keyframe_after_transition : Proc(IUIAnimationStoryboard*, Void*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*, Win32cr::Foundation::HRESULT),
    add_transition_at_keyframe : Proc(IUIAnimationStoryboard*, Void*, Void*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::Foundation::HRESULT),
    add_transition_between_keyframes : Proc(IUIAnimationStoryboard*, Void*, Void*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::Foundation::HRESULT),
    repeat_between_keyframes : Proc(IUIAnimationStoryboard*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Int32, Win32cr::Foundation::HRESULT),
    hold_variable : Proc(IUIAnimationStoryboard*, Void*, Win32cr::Foundation::HRESULT),
    set_longest_acceptable_delay : Proc(IUIAnimationStoryboard*, Float64, Win32cr::Foundation::HRESULT),
    schedule : Proc(IUIAnimationStoryboard*, Float64, Win32cr::UI::Animation::UI_ANIMATION_SCHEDULING_RESULT*, Win32cr::Foundation::HRESULT),
    conclude : Proc(IUIAnimationStoryboard*, Win32cr::Foundation::HRESULT),
    finish : Proc(IUIAnimationStoryboard*, Float64, Win32cr::Foundation::HRESULT),
    abandon : Proc(IUIAnimationStoryboard*, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IUIAnimationStoryboard*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IUIAnimationStoryboard*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IUIAnimationStoryboard*, Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS*, Win32cr::Foundation::HRESULT),
    get_elapsed_time : Proc(IUIAnimationStoryboard*, Float64*, Win32cr::Foundation::HRESULT),
    set_storyboard_event_handler : Proc(IUIAnimationStoryboard*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationStoryboard, lpVtbl : IUIAnimationStoryboardVtbl* do
    GUID = LibC::GUID.new(0xa8ff128f_u32, 0x9bf9_u16, 0x4af1_u16, StaticArray[0x9e_u8, 0x67_u8, 0xe5_u8, 0xe4_u8, 0x10_u8, 0xde_u8, 0xfb_u8, 0x84_u8])
    def query_interface(this : IUIAnimationStoryboard*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationStoryboard*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationStoryboard*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_transition(this : IUIAnimationStoryboard*, variable : Void*, transition : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_transition.call(this, variable, transition)
    end
    def add_keyframe_at_offset(this : IUIAnimationStoryboard*, existingKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, offset : Float64, keyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_keyframe_at_offset.call(this, existingKeyframe, offset, keyframe)
    end
    def add_keyframe_after_transition(this : IUIAnimationStoryboard*, transition : Void*, keyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_keyframe_after_transition.call(this, transition, keyframe)
    end
    def add_transition_at_keyframe(this : IUIAnimationStoryboard*, variable : Void*, transition : Void*, startKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_transition_at_keyframe.call(this, variable, transition, startKeyframe)
    end
    def add_transition_between_keyframes(this : IUIAnimationStoryboard*, variable : Void*, transition : Void*, startKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, endKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_transition_between_keyframes.call(this, variable, transition, startKeyframe, endKeyframe)
    end
    def repeat_between_keyframes(this : IUIAnimationStoryboard*, startKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, endKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, repetitionCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.repeat_between_keyframes.call(this, startKeyframe, endKeyframe, repetitionCount)
    end
    def hold_variable(this : IUIAnimationStoryboard*, variable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hold_variable.call(this, variable)
    end
    def set_longest_acceptable_delay(this : IUIAnimationStoryboard*, delay : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_longest_acceptable_delay.call(this, delay)
    end
    def schedule(this : IUIAnimationStoryboard*, timeNow : Float64, schedulingResult : Win32cr::UI::Animation::UI_ANIMATION_SCHEDULING_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.schedule.call(this, timeNow, schedulingResult)
    end
    def conclude(this : IUIAnimationStoryboard*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conclude.call(this)
    end
    def finish(this : IUIAnimationStoryboard*, completionDeadline : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish.call(this, completionDeadline)
    end
    def abandon(this : IUIAnimationStoryboard*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abandon.call(this)
    end
    def set_tag(this : IUIAnimationStoryboard*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_tag(this : IUIAnimationStoryboard*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, object, id)
    end
    def get_status(this : IUIAnimationStoryboard*, status : Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def get_elapsed_time(this : IUIAnimationStoryboard*, elapsedTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_elapsed_time.call(this, elapsedTime)
    end
    def set_storyboard_event_handler(this : IUIAnimationStoryboard*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_storyboard_event_handler.call(this, handler)
    end

  end

  @[Extern]
  record IUIAnimationTransitionVtbl,
    query_interface : Proc(IUIAnimationTransition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTransition*, UInt32),
    release : Proc(IUIAnimationTransition*, UInt32),
    set_initial_value : Proc(IUIAnimationTransition*, Float64, Win32cr::Foundation::HRESULT),
    set_initial_velocity : Proc(IUIAnimationTransition*, Float64, Win32cr::Foundation::HRESULT),
    is_duration_known : Proc(IUIAnimationTransition*, Win32cr::Foundation::HRESULT),
    get_duration : Proc(IUIAnimationTransition*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTransition, lpVtbl : IUIAnimationTransitionVtbl* do
    GUID = LibC::GUID.new(0xdc6ce252_u32, 0xf731_u16, 0x41cf_u16, StaticArray[0xb6_u8, 0x10_u8, 0x61_u8, 0x4b_u8, 0x6c_u8, 0xa0_u8, 0x49_u8, 0xad_u8])
    def query_interface(this : IUIAnimationTransition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTransition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTransition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_initial_value(this : IUIAnimationTransition*, value : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_value.call(this, value)
    end
    def set_initial_velocity(this : IUIAnimationTransition*, velocity : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_velocity.call(this, velocity)
    end
    def is_duration_known(this : IUIAnimationTransition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_duration_known.call(this)
    end
    def get_duration(this : IUIAnimationTransition*, duration : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duration.call(this, duration)
    end

  end

  @[Extern]
  record IUIAnimationManagerEventHandlerVtbl,
    query_interface : Proc(IUIAnimationManagerEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationManagerEventHandler*, UInt32),
    release : Proc(IUIAnimationManagerEventHandler*, UInt32),
    on_manager_status_changed : Proc(IUIAnimationManagerEventHandler*, Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS, Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationManagerEventHandler, lpVtbl : IUIAnimationManagerEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x783321ed_u32, 0x78a3_u16, 0x4366_u16, StaticArray[0xb5_u8, 0x74_u8, 0x6a_u8, 0xf6_u8, 0x7_u8, 0xa6_u8, 0x47_u8, 0x88_u8])
    def query_interface(this : IUIAnimationManagerEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationManagerEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationManagerEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_manager_status_changed(this : IUIAnimationManagerEventHandler*, newStatus : Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS, previousStatus : Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_manager_status_changed.call(this, newStatus, previousStatus)
    end

  end

  @[Extern]
  record IUIAnimationVariableChangeHandlerVtbl,
    query_interface : Proc(IUIAnimationVariableChangeHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariableChangeHandler*, UInt32),
    release : Proc(IUIAnimationVariableChangeHandler*, UInt32),
    on_value_changed : Proc(IUIAnimationVariableChangeHandler*, Void*, Void*, Float64, Float64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariableChangeHandler, lpVtbl : IUIAnimationVariableChangeHandlerVtbl* do
    GUID = LibC::GUID.new(0x6358b7ba_u32, 0x87d2_u16, 0x42d5_u16, StaticArray[0xbf_u8, 0x71_u8, 0x82_u8, 0xe9_u8, 0x19_u8, 0xdd_u8, 0x58_u8, 0x62_u8])
    def query_interface(this : IUIAnimationVariableChangeHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariableChangeHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariableChangeHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_value_changed(this : IUIAnimationVariableChangeHandler*, storyboard : Void*, variable : Void*, newValue : Float64, previousValue : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_value_changed.call(this, storyboard, variable, newValue, previousValue)
    end

  end

  @[Extern]
  record IUIAnimationVariableIntegerChangeHandlerVtbl,
    query_interface : Proc(IUIAnimationVariableIntegerChangeHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariableIntegerChangeHandler*, UInt32),
    release : Proc(IUIAnimationVariableIntegerChangeHandler*, UInt32),
    on_integer_value_changed : Proc(IUIAnimationVariableIntegerChangeHandler*, Void*, Void*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariableIntegerChangeHandler, lpVtbl : IUIAnimationVariableIntegerChangeHandlerVtbl* do
    GUID = LibC::GUID.new(0xbb3e1550_u32, 0x356e_u16, 0x44b0_u16, StaticArray[0x99_u8, 0xda_u8, 0x85_u8, 0xac_u8, 0x60_u8, 0x17_u8, 0x86_u8, 0x5e_u8])
    def query_interface(this : IUIAnimationVariableIntegerChangeHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariableIntegerChangeHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariableIntegerChangeHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_integer_value_changed(this : IUIAnimationVariableIntegerChangeHandler*, storyboard : Void*, variable : Void*, newValue : Int32, previousValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_integer_value_changed.call(this, storyboard, variable, newValue, previousValue)
    end

  end

  @[Extern]
  record IUIAnimationStoryboardEventHandlerVtbl,
    query_interface : Proc(IUIAnimationStoryboardEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationStoryboardEventHandler*, UInt32),
    release : Proc(IUIAnimationStoryboardEventHandler*, UInt32),
    on_storyboard_status_changed : Proc(IUIAnimationStoryboardEventHandler*, Void*, Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS, Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS, Win32cr::Foundation::HRESULT),
    on_storyboard_updated : Proc(IUIAnimationStoryboardEventHandler*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationStoryboardEventHandler, lpVtbl : IUIAnimationStoryboardEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x3d5c9008_u32, 0xec7c_u16, 0x4364_u16, StaticArray[0x9f_u8, 0x8a_u8, 0x9a_u8, 0xf3_u8, 0xc5_u8, 0x8c_u8, 0xba_u8, 0xe6_u8])
    def query_interface(this : IUIAnimationStoryboardEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationStoryboardEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationStoryboardEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_storyboard_status_changed(this : IUIAnimationStoryboardEventHandler*, storyboard : Void*, newStatus : Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS, previousStatus : Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_storyboard_status_changed.call(this, storyboard, newStatus, previousStatus)
    end
    def on_storyboard_updated(this : IUIAnimationStoryboardEventHandler*, storyboard : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_storyboard_updated.call(this, storyboard)
    end

  end

  @[Extern]
  record IUIAnimationPriorityComparisonVtbl,
    query_interface : Proc(IUIAnimationPriorityComparison*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationPriorityComparison*, UInt32),
    release : Proc(IUIAnimationPriorityComparison*, UInt32),
    has_priority : Proc(IUIAnimationPriorityComparison*, Void*, Void*, Win32cr::UI::Animation::UI_ANIMATION_PRIORITY_EFFECT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationPriorityComparison, lpVtbl : IUIAnimationPriorityComparisonVtbl* do
    GUID = LibC::GUID.new(0x83fa9b74_u32, 0x5f86_u16, 0x4618_u16, StaticArray[0xbc_u8, 0x6a_u8, 0xa2_u8, 0xfa_u8, 0xc1_u8, 0x9b_u8, 0x3f_u8, 0x44_u8])
    def query_interface(this : IUIAnimationPriorityComparison*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationPriorityComparison*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationPriorityComparison*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def has_priority(this : IUIAnimationPriorityComparison*, scheduledStoryboard : Void*, newStoryboard : Void*, priorityEffect : Win32cr::UI::Animation::UI_ANIMATION_PRIORITY_EFFECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_priority.call(this, scheduledStoryboard, newStoryboard, priorityEffect)
    end

  end

  @[Extern]
  record IUIAnimationTransitionLibraryVtbl,
    query_interface : Proc(IUIAnimationTransitionLibrary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTransitionLibrary*, UInt32),
    release : Proc(IUIAnimationTransitionLibrary*, UInt32),
    create_instantaneous_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_constant_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_discrete_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_linear_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_linear_transition_from_speed : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_sinusoidal_transition_from_velocity : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_sinusoidal_transition_from_range : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Float64, Win32cr::UI::Animation::UI_ANIMATION_SLOPE, Void**, Win32cr::Foundation::HRESULT),
    create_accelerate_decelerate_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_reversal_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_cubic_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_smooth_stop_transition : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_parabolic_transition_from_acceleration : Proc(IUIAnimationTransitionLibrary*, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTransitionLibrary, lpVtbl : IUIAnimationTransitionLibraryVtbl* do
    GUID = LibC::GUID.new(0xca5a14b1_u32, 0xd24f_u16, 0x48b8_u16, StaticArray[0x8f_u8, 0xe4_u8, 0xc7_u8, 0x81_u8, 0x69_u8, 0xba_u8, 0x95_u8, 0x4e_u8])
    def query_interface(this : IUIAnimationTransitionLibrary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTransitionLibrary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTransitionLibrary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instantaneous_transition(this : IUIAnimationTransitionLibrary*, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instantaneous_transition.call(this, finalValue, transition)
    end
    def create_constant_transition(this : IUIAnimationTransitionLibrary*, duration : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_constant_transition.call(this, duration, transition)
    end
    def create_discrete_transition(this : IUIAnimationTransitionLibrary*, delay : Float64, finalValue : Float64, hold : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_discrete_transition.call(this, delay, finalValue, hold, transition)
    end
    def create_linear_transition(this : IUIAnimationTransitionLibrary*, duration : Float64, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_transition.call(this, duration, finalValue, transition)
    end
    def create_linear_transition_from_speed(this : IUIAnimationTransitionLibrary*, speed : Float64, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_transition_from_speed.call(this, speed, finalValue, transition)
    end
    def create_sinusoidal_transition_from_velocity(this : IUIAnimationTransitionLibrary*, duration : Float64, period : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sinusoidal_transition_from_velocity.call(this, duration, period, transition)
    end
    def create_sinusoidal_transition_from_range(this : IUIAnimationTransitionLibrary*, duration : Float64, minimumValue : Float64, maximumValue : Float64, period : Float64, slope : Win32cr::UI::Animation::UI_ANIMATION_SLOPE, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sinusoidal_transition_from_range.call(this, duration, minimumValue, maximumValue, period, slope, transition)
    end
    def create_accelerate_decelerate_transition(this : IUIAnimationTransitionLibrary*, duration : Float64, finalValue : Float64, accelerationRatio : Float64, decelerationRatio : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_accelerate_decelerate_transition.call(this, duration, finalValue, accelerationRatio, decelerationRatio, transition)
    end
    def create_reversal_transition(this : IUIAnimationTransitionLibrary*, duration : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_reversal_transition.call(this, duration, transition)
    end
    def create_cubic_transition(this : IUIAnimationTransitionLibrary*, duration : Float64, finalValue : Float64, finalVelocity : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cubic_transition.call(this, duration, finalValue, finalVelocity, transition)
    end
    def create_smooth_stop_transition(this : IUIAnimationTransitionLibrary*, maximumDuration : Float64, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_smooth_stop_transition.call(this, maximumDuration, finalValue, transition)
    end
    def create_parabolic_transition_from_acceleration(this : IUIAnimationTransitionLibrary*, finalValue : Float64, finalVelocity : Float64, acceleration : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_parabolic_transition_from_acceleration.call(this, finalValue, finalVelocity, acceleration, transition)
    end

  end

  @[Extern]
  record IUIAnimationInterpolatorVtbl,
    query_interface : Proc(IUIAnimationInterpolator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationInterpolator*, UInt32),
    release : Proc(IUIAnimationInterpolator*, UInt32),
    set_initial_value_and_velocity : Proc(IUIAnimationInterpolator*, Float64, Float64, Win32cr::Foundation::HRESULT),
    set_duration : Proc(IUIAnimationInterpolator*, Float64, Win32cr::Foundation::HRESULT),
    get_duration : Proc(IUIAnimationInterpolator*, Float64*, Win32cr::Foundation::HRESULT),
    get_final_value : Proc(IUIAnimationInterpolator*, Float64*, Win32cr::Foundation::HRESULT),
    interpolate_value : Proc(IUIAnimationInterpolator*, Float64, Float64*, Win32cr::Foundation::HRESULT),
    interpolate_velocity : Proc(IUIAnimationInterpolator*, Float64, Float64*, Win32cr::Foundation::HRESULT),
    get_dependencies : Proc(IUIAnimationInterpolator*, Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationInterpolator, lpVtbl : IUIAnimationInterpolatorVtbl* do
    GUID = LibC::GUID.new(0x7815cbba_u32, 0xddf7_u16, 0x478c_u16, StaticArray[0xa4_u8, 0x6c_u8, 0x7b_u8, 0x6c_u8, 0x73_u8, 0x8b_u8, 0x79_u8, 0x78_u8])
    def query_interface(this : IUIAnimationInterpolator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationInterpolator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationInterpolator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_initial_value_and_velocity(this : IUIAnimationInterpolator*, initialValue : Float64, initialVelocity : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_value_and_velocity.call(this, initialValue, initialVelocity)
    end
    def set_duration(this : IUIAnimationInterpolator*, duration : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duration.call(this, duration)
    end
    def get_duration(this : IUIAnimationInterpolator*, duration : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duration.call(this, duration)
    end
    def get_final_value(this : IUIAnimationInterpolator*, value : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_value.call(this, value)
    end
    def interpolate_value(this : IUIAnimationInterpolator*, offset : Float64, value : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.interpolate_value.call(this, offset, value)
    end
    def interpolate_velocity(this : IUIAnimationInterpolator*, offset : Float64, velocity : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.interpolate_velocity.call(this, offset, velocity)
    end
    def get_dependencies(this : IUIAnimationInterpolator*, initialValueDependencies : Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, initialVelocityDependencies : Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, durationDependencies : Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dependencies.call(this, initialValueDependencies, initialVelocityDependencies, durationDependencies)
    end

  end

  @[Extern]
  record IUIAnimationTransitionFactoryVtbl,
    query_interface : Proc(IUIAnimationTransitionFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTransitionFactory*, UInt32),
    release : Proc(IUIAnimationTransitionFactory*, UInt32),
    create_transition : Proc(IUIAnimationTransitionFactory*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTransitionFactory, lpVtbl : IUIAnimationTransitionFactoryVtbl* do
    GUID = LibC::GUID.new(0xfcd91e03_u32, 0x3e3b_u16, 0x45ad_u16, StaticArray[0xbb_u8, 0xb1_u8, 0x6d_u8, 0xfc_u8, 0x81_u8, 0x53_u8, 0x74_u8, 0x3d_u8])
    def query_interface(this : IUIAnimationTransitionFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTransitionFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTransitionFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_transition(this : IUIAnimationTransitionFactory*, interpolator : Void*, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transition.call(this, interpolator, transition)
    end

  end

  @[Extern]
  record IUIAnimationTimerVtbl,
    query_interface : Proc(IUIAnimationTimer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTimer*, UInt32),
    release : Proc(IUIAnimationTimer*, UInt32),
    set_timer_update_handler : Proc(IUIAnimationTimer*, Void*, Win32cr::UI::Animation::UI_ANIMATION_IDLE_BEHAVIOR, Win32cr::Foundation::HRESULT),
    set_timer_event_handler : Proc(IUIAnimationTimer*, Void*, Win32cr::Foundation::HRESULT),
    enable : Proc(IUIAnimationTimer*, Win32cr::Foundation::HRESULT),
    disable : Proc(IUIAnimationTimer*, Win32cr::Foundation::HRESULT),
    is_enabled : Proc(IUIAnimationTimer*, Win32cr::Foundation::HRESULT),
    get_time : Proc(IUIAnimationTimer*, Float64*, Win32cr::Foundation::HRESULT),
    set_frame_rate_threshold : Proc(IUIAnimationTimer*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTimer, lpVtbl : IUIAnimationTimerVtbl* do
    GUID = LibC::GUID.new(0x6b0efad1_u32, 0xa053_u16, 0x41d6_u16, StaticArray[0x90_u8, 0x85_u8, 0x33_u8, 0xa6_u8, 0x89_u8, 0x14_u8, 0x46_u8, 0x65_u8])
    def query_interface(this : IUIAnimationTimer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTimer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTimer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_timer_update_handler(this : IUIAnimationTimer*, updateHandler : Void*, idleBehavior : Win32cr::UI::Animation::UI_ANIMATION_IDLE_BEHAVIOR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_timer_update_handler.call(this, updateHandler, idleBehavior)
    end
    def set_timer_event_handler(this : IUIAnimationTimer*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_timer_event_handler.call(this, handler)
    end
    def enable(this : IUIAnimationTimer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable.call(this)
    end
    def disable(this : IUIAnimationTimer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable.call(this)
    end
    def is_enabled(this : IUIAnimationTimer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_enabled.call(this)
    end
    def get_time(this : IUIAnimationTimer*, seconds : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time.call(this, seconds)
    end
    def set_frame_rate_threshold(this : IUIAnimationTimer*, framesPerSecond : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_frame_rate_threshold.call(this, framesPerSecond)
    end

  end

  @[Extern]
  record IUIAnimationTimerUpdateHandlerVtbl,
    query_interface : Proc(IUIAnimationTimerUpdateHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTimerUpdateHandler*, UInt32),
    release : Proc(IUIAnimationTimerUpdateHandler*, UInt32),
    on_update : Proc(IUIAnimationTimerUpdateHandler*, Float64, Win32cr::UI::Animation::UI_ANIMATION_UPDATE_RESULT*, Win32cr::Foundation::HRESULT),
    set_timer_client_event_handler : Proc(IUIAnimationTimerUpdateHandler*, Void*, Win32cr::Foundation::HRESULT),
    clear_timer_client_event_handler : Proc(IUIAnimationTimerUpdateHandler*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTimerUpdateHandler, lpVtbl : IUIAnimationTimerUpdateHandlerVtbl* do
    GUID = LibC::GUID.new(0x195509b7_u32, 0x5d5e_u16, 0x4e3e_u16, StaticArray[0xb2_u8, 0x78_u8, 0xee_u8, 0x37_u8, 0x59_u8, 0xb3_u8, 0x67_u8, 0xad_u8])
    def query_interface(this : IUIAnimationTimerUpdateHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTimerUpdateHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTimerUpdateHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_update(this : IUIAnimationTimerUpdateHandler*, timeNow : Float64, result : Win32cr::UI::Animation::UI_ANIMATION_UPDATE_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update.call(this, timeNow, result)
    end
    def set_timer_client_event_handler(this : IUIAnimationTimerUpdateHandler*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_timer_client_event_handler.call(this, handler)
    end
    def clear_timer_client_event_handler(this : IUIAnimationTimerUpdateHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_timer_client_event_handler.call(this)
    end

  end

  @[Extern]
  record IUIAnimationTimerClientEventHandlerVtbl,
    query_interface : Proc(IUIAnimationTimerClientEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTimerClientEventHandler*, UInt32),
    release : Proc(IUIAnimationTimerClientEventHandler*, UInt32),
    on_timer_client_status_changed : Proc(IUIAnimationTimerClientEventHandler*, Win32cr::UI::Animation::UI_ANIMATION_TIMER_CLIENT_STATUS, Win32cr::UI::Animation::UI_ANIMATION_TIMER_CLIENT_STATUS, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTimerClientEventHandler, lpVtbl : IUIAnimationTimerClientEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xbedb4db6_u32, 0x94fa_u16, 0x4bfb_u16, StaticArray[0xa4_u8, 0x7f_u8, 0xef_u8, 0x2d_u8, 0x9e_u8, 0x40_u8, 0x8c_u8, 0x25_u8])
    def query_interface(this : IUIAnimationTimerClientEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTimerClientEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTimerClientEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_timer_client_status_changed(this : IUIAnimationTimerClientEventHandler*, newStatus : Win32cr::UI::Animation::UI_ANIMATION_TIMER_CLIENT_STATUS, previousStatus : Win32cr::UI::Animation::UI_ANIMATION_TIMER_CLIENT_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_timer_client_status_changed.call(this, newStatus, previousStatus)
    end

  end

  @[Extern]
  record IUIAnimationTimerEventHandlerVtbl,
    query_interface : Proc(IUIAnimationTimerEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTimerEventHandler*, UInt32),
    release : Proc(IUIAnimationTimerEventHandler*, UInt32),
    on_pre_update : Proc(IUIAnimationTimerEventHandler*, Win32cr::Foundation::HRESULT),
    on_post_update : Proc(IUIAnimationTimerEventHandler*, Win32cr::Foundation::HRESULT),
    on_rendering_too_slow : Proc(IUIAnimationTimerEventHandler*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTimerEventHandler, lpVtbl : IUIAnimationTimerEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x274a7dea_u32, 0xd771_u16, 0x4095_u16, StaticArray[0xab_u8, 0xbd_u8, 0x8d_u8, 0xf7_u8, 0xab_u8, 0xd2_u8, 0x3c_u8, 0xe3_u8])
    def query_interface(this : IUIAnimationTimerEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTimerEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTimerEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_pre_update(this : IUIAnimationTimerEventHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_pre_update.call(this)
    end
    def on_post_update(this : IUIAnimationTimerEventHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_post_update.call(this)
    end
    def on_rendering_too_slow(this : IUIAnimationTimerEventHandler*, framesPerSecond : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_rendering_too_slow.call(this, framesPerSecond)
    end

  end

  @[Extern]
  record IUIAnimationManager2Vtbl,
    query_interface : Proc(IUIAnimationManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationManager2*, UInt32),
    release : Proc(IUIAnimationManager2*, UInt32),
    create_animation_vector_variable : Proc(IUIAnimationManager2*, Float64*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_animation_variable : Proc(IUIAnimationManager2*, Float64, Void**, Win32cr::Foundation::HRESULT),
    schedule_transition : Proc(IUIAnimationManager2*, Void*, Void*, Float64, Win32cr::Foundation::HRESULT),
    create_storyboard : Proc(IUIAnimationManager2*, Void**, Win32cr::Foundation::HRESULT),
    finish_all_storyboards : Proc(IUIAnimationManager2*, Float64, Win32cr::Foundation::HRESULT),
    abandon_all_storyboards : Proc(IUIAnimationManager2*, Win32cr::Foundation::HRESULT),
    update : Proc(IUIAnimationManager2*, Float64, Win32cr::UI::Animation::UI_ANIMATION_UPDATE_RESULT*, Win32cr::Foundation::HRESULT),
    get_variable_from_tag : Proc(IUIAnimationManager2*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_storyboard_from_tag : Proc(IUIAnimationManager2*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    estimate_next_event_time : Proc(IUIAnimationManager2*, Float64*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IUIAnimationManager2*, Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS*, Win32cr::Foundation::HRESULT),
    set_animation_mode : Proc(IUIAnimationManager2*, Win32cr::UI::Animation::UI_ANIMATION_MODE, Win32cr::Foundation::HRESULT),
    pause : Proc(IUIAnimationManager2*, Win32cr::Foundation::HRESULT),
    resume : Proc(IUIAnimationManager2*, Win32cr::Foundation::HRESULT),
    set_manager_event_handler : Proc(IUIAnimationManager2*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_cancel_priority_comparison : Proc(IUIAnimationManager2*, Void*, Win32cr::Foundation::HRESULT),
    set_trim_priority_comparison : Proc(IUIAnimationManager2*, Void*, Win32cr::Foundation::HRESULT),
    set_compress_priority_comparison : Proc(IUIAnimationManager2*, Void*, Win32cr::Foundation::HRESULT),
    set_conclude_priority_comparison : Proc(IUIAnimationManager2*, Void*, Win32cr::Foundation::HRESULT),
    set_default_longest_acceptable_delay : Proc(IUIAnimationManager2*, Float64, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IUIAnimationManager2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationManager2, lpVtbl : IUIAnimationManager2Vtbl* do
    GUID = LibC::GUID.new(0xd8b6f7d4_u32, 0x4109_u16, 0x4d3f_u16, StaticArray[0xac_u8, 0xee_u8, 0x87_u8, 0x99_u8, 0x26_u8, 0x96_u8, 0x8c_u8, 0xb1_u8])
    def query_interface(this : IUIAnimationManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_animation_vector_variable(this : IUIAnimationManager2*, initialValue : Float64*, cDimension : UInt32, variable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation_vector_variable.call(this, initialValue, cDimension, variable)
    end
    def create_animation_variable(this : IUIAnimationManager2*, initialValue : Float64, variable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation_variable.call(this, initialValue, variable)
    end
    def schedule_transition(this : IUIAnimationManager2*, variable : Void*, transition : Void*, timeNow : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.schedule_transition.call(this, variable, transition, timeNow)
    end
    def create_storyboard(this : IUIAnimationManager2*, storyboard : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_storyboard.call(this, storyboard)
    end
    def finish_all_storyboards(this : IUIAnimationManager2*, completionDeadline : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish_all_storyboards.call(this, completionDeadline)
    end
    def abandon_all_storyboards(this : IUIAnimationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abandon_all_storyboards.call(this)
    end
    def update(this : IUIAnimationManager2*, timeNow : Float64, updateResult : Win32cr::UI::Animation::UI_ANIMATION_UPDATE_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update.call(this, timeNow, updateResult)
    end
    def get_variable_from_tag(this : IUIAnimationManager2*, object : Void*, id : UInt32, variable : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_variable_from_tag.call(this, object, id, variable)
    end
    def get_storyboard_from_tag(this : IUIAnimationManager2*, object : Void*, id : UInt32, storyboard : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storyboard_from_tag.call(this, object, id, storyboard)
    end
    def estimate_next_event_time(this : IUIAnimationManager2*, seconds : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.estimate_next_event_time.call(this, seconds)
    end
    def get_status(this : IUIAnimationManager2*, status : Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def set_animation_mode(this : IUIAnimationManager2*, mode : Win32cr::UI::Animation::UI_ANIMATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_animation_mode.call(this, mode)
    end
    def pause(this : IUIAnimationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IUIAnimationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def set_manager_event_handler(this : IUIAnimationManager2*, handler : Void*, fRegisterForNextAnimationEvent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manager_event_handler.call(this, handler, fRegisterForNextAnimationEvent)
    end
    def set_cancel_priority_comparison(this : IUIAnimationManager2*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cancel_priority_comparison.call(this, comparison)
    end
    def set_trim_priority_comparison(this : IUIAnimationManager2*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_trim_priority_comparison.call(this, comparison)
    end
    def set_compress_priority_comparison(this : IUIAnimationManager2*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_compress_priority_comparison.call(this, comparison)
    end
    def set_conclude_priority_comparison(this : IUIAnimationManager2*, comparison : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_conclude_priority_comparison.call(this, comparison)
    end
    def set_default_longest_acceptable_delay(this : IUIAnimationManager2*, delay : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_longest_acceptable_delay.call(this, delay)
    end
    def shutdown(this : IUIAnimationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end

  end

  @[Extern]
  record IUIAnimationVariable2Vtbl,
    query_interface : Proc(IUIAnimationVariable2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariable2*, UInt32),
    release : Proc(IUIAnimationVariable2*, UInt32),
    get_dimension : Proc(IUIAnimationVariable2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_value : Proc(IUIAnimationVariable2*, Float64*, Win32cr::Foundation::HRESULT),
    get_vector_value : Proc(IUIAnimationVariable2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    get_curve : Proc(IUIAnimationVariable2*, Void*, Win32cr::Foundation::HRESULT),
    get_vector_curve : Proc(IUIAnimationVariable2*, Void**, UInt32, Win32cr::Foundation::HRESULT),
    get_final_value : Proc(IUIAnimationVariable2*, Float64*, Win32cr::Foundation::HRESULT),
    get_final_vector_value : Proc(IUIAnimationVariable2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    get_previous_value : Proc(IUIAnimationVariable2*, Float64*, Win32cr::Foundation::HRESULT),
    get_previous_vector_value : Proc(IUIAnimationVariable2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    get_integer_value : Proc(IUIAnimationVariable2*, Int32*, Win32cr::Foundation::HRESULT),
    get_integer_vector_value : Proc(IUIAnimationVariable2*, Int32*, UInt32, Win32cr::Foundation::HRESULT),
    get_final_integer_value : Proc(IUIAnimationVariable2*, Int32*, Win32cr::Foundation::HRESULT),
    get_final_integer_vector_value : Proc(IUIAnimationVariable2*, Int32*, UInt32, Win32cr::Foundation::HRESULT),
    get_previous_integer_value : Proc(IUIAnimationVariable2*, Int32*, Win32cr::Foundation::HRESULT),
    get_previous_integer_vector_value : Proc(IUIAnimationVariable2*, Int32*, UInt32, Win32cr::Foundation::HRESULT),
    get_current_storyboard : Proc(IUIAnimationVariable2*, Void**, Win32cr::Foundation::HRESULT),
    set_lower_bound : Proc(IUIAnimationVariable2*, Float64, Win32cr::Foundation::HRESULT),
    set_lower_bound_vector : Proc(IUIAnimationVariable2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    set_upper_bound : Proc(IUIAnimationVariable2*, Float64, Win32cr::Foundation::HRESULT),
    set_upper_bound_vector : Proc(IUIAnimationVariable2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    set_rounding_mode : Proc(IUIAnimationVariable2*, Win32cr::UI::Animation::UI_ANIMATION_ROUNDING_MODE, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IUIAnimationVariable2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IUIAnimationVariable2*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    set_variable_change_handler : Proc(IUIAnimationVariable2*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_variable_integer_change_handler : Proc(IUIAnimationVariable2*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_variable_curve_change_handler : Proc(IUIAnimationVariable2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariable2, lpVtbl : IUIAnimationVariable2Vtbl* do
    GUID = LibC::GUID.new(0x4914b304_u32, 0x96ab_u16, 0x44d9_u16, StaticArray[0x9e_u8, 0x77_u8, 0xd5_u8, 0x10_u8, 0x9b_u8, 0x7e_u8, 0x74_u8, 0x66_u8])
    def query_interface(this : IUIAnimationVariable2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariable2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariable2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dimension(this : IUIAnimationVariable2*, dimension : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dimension.call(this, dimension)
    end
    def get_value(this : IUIAnimationVariable2*, value : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, value)
    end
    def get_vector_value(this : IUIAnimationVariable2*, value : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vector_value.call(this, value, cDimension)
    end
    def get_curve(this : IUIAnimationVariable2*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_curve.call(this, animation)
    end
    def get_vector_curve(this : IUIAnimationVariable2*, animation : Void**, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_vector_curve.call(this, animation, cDimension)
    end
    def get_final_value(this : IUIAnimationVariable2*, finalValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_value.call(this, finalValue)
    end
    def get_final_vector_value(this : IUIAnimationVariable2*, finalValue : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_vector_value.call(this, finalValue, cDimension)
    end
    def get_previous_value(this : IUIAnimationVariable2*, previousValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_value.call(this, previousValue)
    end
    def get_previous_vector_value(this : IUIAnimationVariable2*, previousValue : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_vector_value.call(this, previousValue, cDimension)
    end
    def get_integer_value(this : IUIAnimationVariable2*, value : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_integer_value.call(this, value)
    end
    def get_integer_vector_value(this : IUIAnimationVariable2*, value : Int32*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_integer_vector_value.call(this, value, cDimension)
    end
    def get_final_integer_value(this : IUIAnimationVariable2*, finalValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_integer_value.call(this, finalValue)
    end
    def get_final_integer_vector_value(this : IUIAnimationVariable2*, finalValue : Int32*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_integer_vector_value.call(this, finalValue, cDimension)
    end
    def get_previous_integer_value(this : IUIAnimationVariable2*, previousValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_integer_value.call(this, previousValue)
    end
    def get_previous_integer_vector_value(this : IUIAnimationVariable2*, previousValue : Int32*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_integer_vector_value.call(this, previousValue, cDimension)
    end
    def get_current_storyboard(this : IUIAnimationVariable2*, storyboard : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_storyboard.call(this, storyboard)
    end
    def set_lower_bound(this : IUIAnimationVariable2*, bound : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_lower_bound.call(this, bound)
    end
    def set_lower_bound_vector(this : IUIAnimationVariable2*, bound : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_lower_bound_vector.call(this, bound, cDimension)
    end
    def set_upper_bound(this : IUIAnimationVariable2*, bound : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_upper_bound.call(this, bound)
    end
    def set_upper_bound_vector(this : IUIAnimationVariable2*, bound : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_upper_bound_vector.call(this, bound, cDimension)
    end
    def set_rounding_mode(this : IUIAnimationVariable2*, mode : Win32cr::UI::Animation::UI_ANIMATION_ROUNDING_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rounding_mode.call(this, mode)
    end
    def set_tag(this : IUIAnimationVariable2*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_tag(this : IUIAnimationVariable2*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, object, id)
    end
    def set_variable_change_handler(this : IUIAnimationVariable2*, handler : Void*, fRegisterForNextAnimationEvent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_variable_change_handler.call(this, handler, fRegisterForNextAnimationEvent)
    end
    def set_variable_integer_change_handler(this : IUIAnimationVariable2*, handler : Void*, fRegisterForNextAnimationEvent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_variable_integer_change_handler.call(this, handler, fRegisterForNextAnimationEvent)
    end
    def set_variable_curve_change_handler(this : IUIAnimationVariable2*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_variable_curve_change_handler.call(this, handler)
    end

  end

  @[Extern]
  record IUIAnimationTransition2Vtbl,
    query_interface : Proc(IUIAnimationTransition2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTransition2*, UInt32),
    release : Proc(IUIAnimationTransition2*, UInt32),
    get_dimension : Proc(IUIAnimationTransition2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_initial_value : Proc(IUIAnimationTransition2*, Float64, Win32cr::Foundation::HRESULT),
    set_initial_vector_value : Proc(IUIAnimationTransition2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    set_initial_velocity : Proc(IUIAnimationTransition2*, Float64, Win32cr::Foundation::HRESULT),
    set_initial_vector_velocity : Proc(IUIAnimationTransition2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    is_duration_known : Proc(IUIAnimationTransition2*, Win32cr::Foundation::HRESULT),
    get_duration : Proc(IUIAnimationTransition2*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTransition2, lpVtbl : IUIAnimationTransition2Vtbl* do
    GUID = LibC::GUID.new(0x62ff9123_u32, 0xa85a_u16, 0x4e9b_u16, StaticArray[0xa2_u8, 0x18_u8, 0x43_u8, 0x5a_u8, 0x93_u8, 0xe2_u8, 0x68_u8, 0xfd_u8])
    def query_interface(this : IUIAnimationTransition2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTransition2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTransition2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dimension(this : IUIAnimationTransition2*, dimension : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dimension.call(this, dimension)
    end
    def set_initial_value(this : IUIAnimationTransition2*, value : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_value.call(this, value)
    end
    def set_initial_vector_value(this : IUIAnimationTransition2*, value : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_vector_value.call(this, value, cDimension)
    end
    def set_initial_velocity(this : IUIAnimationTransition2*, velocity : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_velocity.call(this, velocity)
    end
    def set_initial_vector_velocity(this : IUIAnimationTransition2*, velocity : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_vector_velocity.call(this, velocity, cDimension)
    end
    def is_duration_known(this : IUIAnimationTransition2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_duration_known.call(this)
    end
    def get_duration(this : IUIAnimationTransition2*, duration : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duration.call(this, duration)
    end

  end

  @[Extern]
  record IUIAnimationManagerEventHandler2Vtbl,
    query_interface : Proc(IUIAnimationManagerEventHandler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationManagerEventHandler2*, UInt32),
    release : Proc(IUIAnimationManagerEventHandler2*, UInt32),
    on_manager_status_changed : Proc(IUIAnimationManagerEventHandler2*, Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS, Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationManagerEventHandler2, lpVtbl : IUIAnimationManagerEventHandler2Vtbl* do
    GUID = LibC::GUID.new(0xf6e022ba_u32, 0xbff3_u16, 0x42ec_u16, StaticArray[0x90_u8, 0x33_u8, 0xe0_u8, 0x73_u8, 0xf3_u8, 0x3e_u8, 0x83_u8, 0xc3_u8])
    def query_interface(this : IUIAnimationManagerEventHandler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationManagerEventHandler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationManagerEventHandler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_manager_status_changed(this : IUIAnimationManagerEventHandler2*, newStatus : Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS, previousStatus : Win32cr::UI::Animation::UI_ANIMATION_MANAGER_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_manager_status_changed.call(this, newStatus, previousStatus)
    end

  end

  @[Extern]
  record IUIAnimationVariableChangeHandler2Vtbl,
    query_interface : Proc(IUIAnimationVariableChangeHandler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariableChangeHandler2*, UInt32),
    release : Proc(IUIAnimationVariableChangeHandler2*, UInt32),
    on_value_changed : Proc(IUIAnimationVariableChangeHandler2*, Void*, Void*, Float64*, Float64*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariableChangeHandler2, lpVtbl : IUIAnimationVariableChangeHandler2Vtbl* do
    GUID = LibC::GUID.new(0x63acc8d2_u32, 0x6eae_u16, 0x4bb0_u16, StaticArray[0xb8_u8, 0x79_u8, 0x58_u8, 0x6d_u8, 0xd8_u8, 0xcf_u8, 0xbe_u8, 0x42_u8])
    def query_interface(this : IUIAnimationVariableChangeHandler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariableChangeHandler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariableChangeHandler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_value_changed(this : IUIAnimationVariableChangeHandler2*, storyboard : Void*, variable : Void*, newValue : Float64*, previousValue : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_value_changed.call(this, storyboard, variable, newValue, previousValue, cDimension)
    end

  end

  @[Extern]
  record IUIAnimationVariableIntegerChangeHandler2Vtbl,
    query_interface : Proc(IUIAnimationVariableIntegerChangeHandler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariableIntegerChangeHandler2*, UInt32),
    release : Proc(IUIAnimationVariableIntegerChangeHandler2*, UInt32),
    on_integer_value_changed : Proc(IUIAnimationVariableIntegerChangeHandler2*, Void*, Void*, Int32*, Int32*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariableIntegerChangeHandler2, lpVtbl : IUIAnimationVariableIntegerChangeHandler2Vtbl* do
    GUID = LibC::GUID.new(0x829b6cf1_u32, 0x4f3a_u16, 0x4412_u16, StaticArray[0xae_u8, 0x9_u8, 0xb2_u8, 0x43_u8, 0xeb_u8, 0x4c_u8, 0x6b_u8, 0x58_u8])
    def query_interface(this : IUIAnimationVariableIntegerChangeHandler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariableIntegerChangeHandler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariableIntegerChangeHandler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_integer_value_changed(this : IUIAnimationVariableIntegerChangeHandler2*, storyboard : Void*, variable : Void*, newValue : Int32*, previousValue : Int32*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_integer_value_changed.call(this, storyboard, variable, newValue, previousValue, cDimension)
    end

  end

  @[Extern]
  record IUIAnimationVariableCurveChangeHandler2Vtbl,
    query_interface : Proc(IUIAnimationVariableCurveChangeHandler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationVariableCurveChangeHandler2*, UInt32),
    release : Proc(IUIAnimationVariableCurveChangeHandler2*, UInt32),
    on_curve_changed : Proc(IUIAnimationVariableCurveChangeHandler2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationVariableCurveChangeHandler2, lpVtbl : IUIAnimationVariableCurveChangeHandler2Vtbl* do
    GUID = LibC::GUID.new(0x72895e91_u32, 0x145_u16, 0x4c21_u16, StaticArray[0x91_u8, 0x92_u8, 0x5a_u8, 0xab_u8, 0x40_u8, 0xed_u8, 0xdf_u8, 0x80_u8])
    def query_interface(this : IUIAnimationVariableCurveChangeHandler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationVariableCurveChangeHandler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationVariableCurveChangeHandler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_curve_changed(this : IUIAnimationVariableCurveChangeHandler2*, variable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_curve_changed.call(this, variable)
    end

  end

  @[Extern]
  record IUIAnimationStoryboardEventHandler2Vtbl,
    query_interface : Proc(IUIAnimationStoryboardEventHandler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationStoryboardEventHandler2*, UInt32),
    release : Proc(IUIAnimationStoryboardEventHandler2*, UInt32),
    on_storyboard_status_changed : Proc(IUIAnimationStoryboardEventHandler2*, Void*, Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS, Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS, Win32cr::Foundation::HRESULT),
    on_storyboard_updated : Proc(IUIAnimationStoryboardEventHandler2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationStoryboardEventHandler2, lpVtbl : IUIAnimationStoryboardEventHandler2Vtbl* do
    GUID = LibC::GUID.new(0xbac5f55a_u32, 0xba7c_u16, 0x414c_u16, StaticArray[0xb5_u8, 0x99_u8, 0xfb_u8, 0xf8_u8, 0x50_u8, 0xf5_u8, 0x53_u8, 0xc6_u8])
    def query_interface(this : IUIAnimationStoryboardEventHandler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationStoryboardEventHandler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationStoryboardEventHandler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_storyboard_status_changed(this : IUIAnimationStoryboardEventHandler2*, storyboard : Void*, newStatus : Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS, previousStatus : Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_storyboard_status_changed.call(this, storyboard, newStatus, previousStatus)
    end
    def on_storyboard_updated(this : IUIAnimationStoryboardEventHandler2*, storyboard : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_storyboard_updated.call(this, storyboard)
    end

  end

  @[Extern]
  record IUIAnimationLoopIterationChangeHandler2Vtbl,
    query_interface : Proc(IUIAnimationLoopIterationChangeHandler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationLoopIterationChangeHandler2*, UInt32),
    release : Proc(IUIAnimationLoopIterationChangeHandler2*, UInt32),
    on_loop_iteration_changed : Proc(IUIAnimationLoopIterationChangeHandler2*, Void*, LibC::UIntPtrT, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationLoopIterationChangeHandler2, lpVtbl : IUIAnimationLoopIterationChangeHandler2Vtbl* do
    GUID = LibC::GUID.new(0x2d3b15a4_u32, 0x4762_u16, 0x47ab_u16, StaticArray[0xa0_u8, 0x30_u8, 0xb2_u8, 0x32_u8, 0x21_u8, 0xdf_u8, 0x3a_u8, 0xe0_u8])
    def query_interface(this : IUIAnimationLoopIterationChangeHandler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationLoopIterationChangeHandler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationLoopIterationChangeHandler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_loop_iteration_changed(this : IUIAnimationLoopIterationChangeHandler2*, storyboard : Void*, id : LibC::UIntPtrT, newIterationCount : UInt32, oldIterationCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_loop_iteration_changed.call(this, storyboard, id, newIterationCount, oldIterationCount)
    end

  end

  @[Extern]
  record IUIAnimationPriorityComparison2Vtbl,
    query_interface : Proc(IUIAnimationPriorityComparison2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationPriorityComparison2*, UInt32),
    release : Proc(IUIAnimationPriorityComparison2*, UInt32),
    has_priority : Proc(IUIAnimationPriorityComparison2*, Void*, Void*, Win32cr::UI::Animation::UI_ANIMATION_PRIORITY_EFFECT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationPriorityComparison2, lpVtbl : IUIAnimationPriorityComparison2Vtbl* do
    GUID = LibC::GUID.new(0x5b6d7a37_u32, 0x4621_u16, 0x467c_u16, StaticArray[0x8b_u8, 0x5_u8, 0x70_u8, 0x13_u8, 0x1d_u8, 0xe6_u8, 0x2d_u8, 0xdb_u8])
    def query_interface(this : IUIAnimationPriorityComparison2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationPriorityComparison2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationPriorityComparison2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def has_priority(this : IUIAnimationPriorityComparison2*, scheduledStoryboard : Void*, newStoryboard : Void*, priorityEffect : Win32cr::UI::Animation::UI_ANIMATION_PRIORITY_EFFECT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.has_priority.call(this, scheduledStoryboard, newStoryboard, priorityEffect)
    end

  end

  @[Extern]
  record IUIAnimationTransitionLibrary2Vtbl,
    query_interface : Proc(IUIAnimationTransitionLibrary2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTransitionLibrary2*, UInt32),
    release : Proc(IUIAnimationTransitionLibrary2*, UInt32),
    create_instantaneous_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_instantaneous_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_constant_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_discrete_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_discrete_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_linear_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_linear_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_linear_transition_from_speed : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_linear_vector_transition_from_speed : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_sinusoidal_transition_from_velocity : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_sinusoidal_transition_from_range : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Float64, Win32cr::UI::Animation::UI_ANIMATION_SLOPE, Void**, Win32cr::Foundation::HRESULT),
    create_accelerate_decelerate_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_reversal_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_cubic_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_cubic_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, Float64*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_smooth_stop_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_parabolic_transition_from_acceleration : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_cubic_bezier_linear_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64, Float64, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    create_cubic_bezier_linear_vector_transition : Proc(IUIAnimationTransitionLibrary2*, Float64, Float64*, UInt32, Float64, Float64, Float64, Float64, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTransitionLibrary2, lpVtbl : IUIAnimationTransitionLibrary2Vtbl* do
    GUID = LibC::GUID.new(0x3cfae53_u32, 0x9580_u16, 0x4ee3_u16, StaticArray[0xb3_u8, 0x63_u8, 0x2e_u8, 0xce_u8, 0x51_u8, 0xb4_u8, 0xaf_u8, 0x6a_u8])
    def query_interface(this : IUIAnimationTransitionLibrary2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTransitionLibrary2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTransitionLibrary2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instantaneous_transition(this : IUIAnimationTransitionLibrary2*, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instantaneous_transition.call(this, finalValue, transition)
    end
    def create_instantaneous_vector_transition(this : IUIAnimationTransitionLibrary2*, finalValue : Float64*, cDimension : UInt32, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instantaneous_vector_transition.call(this, finalValue, cDimension, transition)
    end
    def create_constant_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_constant_transition.call(this, duration, transition)
    end
    def create_discrete_transition(this : IUIAnimationTransitionLibrary2*, delay : Float64, finalValue : Float64, hold : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_discrete_transition.call(this, delay, finalValue, hold, transition)
    end
    def create_discrete_vector_transition(this : IUIAnimationTransitionLibrary2*, delay : Float64, finalValue : Float64*, cDimension : UInt32, hold : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_discrete_vector_transition.call(this, delay, finalValue, cDimension, hold, transition)
    end
    def create_linear_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_transition.call(this, duration, finalValue, transition)
    end
    def create_linear_vector_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64*, cDimension : UInt32, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_vector_transition.call(this, duration, finalValue, cDimension, transition)
    end
    def create_linear_transition_from_speed(this : IUIAnimationTransitionLibrary2*, speed : Float64, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_transition_from_speed.call(this, speed, finalValue, transition)
    end
    def create_linear_vector_transition_from_speed(this : IUIAnimationTransitionLibrary2*, speed : Float64, finalValue : Float64*, cDimension : UInt32, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_vector_transition_from_speed.call(this, speed, finalValue, cDimension, transition)
    end
    def create_sinusoidal_transition_from_velocity(this : IUIAnimationTransitionLibrary2*, duration : Float64, period : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sinusoidal_transition_from_velocity.call(this, duration, period, transition)
    end
    def create_sinusoidal_transition_from_range(this : IUIAnimationTransitionLibrary2*, duration : Float64, minimumValue : Float64, maximumValue : Float64, period : Float64, slope : Win32cr::UI::Animation::UI_ANIMATION_SLOPE, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_sinusoidal_transition_from_range.call(this, duration, minimumValue, maximumValue, period, slope, transition)
    end
    def create_accelerate_decelerate_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64, accelerationRatio : Float64, decelerationRatio : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_accelerate_decelerate_transition.call(this, duration, finalValue, accelerationRatio, decelerationRatio, transition)
    end
    def create_reversal_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_reversal_transition.call(this, duration, transition)
    end
    def create_cubic_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64, finalVelocity : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cubic_transition.call(this, duration, finalValue, finalVelocity, transition)
    end
    def create_cubic_vector_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64*, finalVelocity : Float64*, cDimension : UInt32, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cubic_vector_transition.call(this, duration, finalValue, finalVelocity, cDimension, transition)
    end
    def create_smooth_stop_transition(this : IUIAnimationTransitionLibrary2*, maximumDuration : Float64, finalValue : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_smooth_stop_transition.call(this, maximumDuration, finalValue, transition)
    end
    def create_parabolic_transition_from_acceleration(this : IUIAnimationTransitionLibrary2*, finalValue : Float64, finalVelocity : Float64, acceleration : Float64, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_parabolic_transition_from_acceleration.call(this, finalValue, finalVelocity, acceleration, transition)
    end
    def create_cubic_bezier_linear_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, ppTransition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cubic_bezier_linear_transition.call(this, duration, finalValue, x1, y1, x2, y2, ppTransition)
    end
    def create_cubic_bezier_linear_vector_transition(this : IUIAnimationTransitionLibrary2*, duration : Float64, finalValue : Float64*, cDimension : UInt32, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, ppTransition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cubic_bezier_linear_vector_transition.call(this, duration, finalValue, cDimension, x1, y1, x2, y2, ppTransition)
    end

  end

  @[Extern]
  record IUIAnimationPrimitiveInterpolationVtbl,
    query_interface : Proc(IUIAnimationPrimitiveInterpolation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationPrimitiveInterpolation*, UInt32),
    release : Proc(IUIAnimationPrimitiveInterpolation*, UInt32),
    add_cubic : Proc(IUIAnimationPrimitiveInterpolation*, UInt32, Float64, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    add_sinusoidal : Proc(IUIAnimationPrimitiveInterpolation*, UInt32, Float64, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationPrimitiveInterpolation, lpVtbl : IUIAnimationPrimitiveInterpolationVtbl* do
    GUID = LibC::GUID.new(0xbab20d63_u32, 0x4361_u16, 0x45da_u16, StaticArray[0xa2_u8, 0x4f_u8, 0xab_u8, 0x85_u8, 0x8_u8, 0x84_u8, 0x6b_u8, 0x5b_u8])
    def query_interface(this : IUIAnimationPrimitiveInterpolation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationPrimitiveInterpolation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationPrimitiveInterpolation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_cubic(this : IUIAnimationPrimitiveInterpolation*, dimension : UInt32, beginOffset : Float64, constantCoefficient : Float32, linearCoefficient : Float32, quadraticCoefficient : Float32, cubicCoefficient : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_cubic.call(this, dimension, beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient)
    end
    def add_sinusoidal(this : IUIAnimationPrimitiveInterpolation*, dimension : UInt32, beginOffset : Float64, bias : Float32, amplitude : Float32, frequency : Float32, phase : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_sinusoidal.call(this, dimension, beginOffset, bias, amplitude, frequency, phase)
    end

  end

  @[Extern]
  record IUIAnimationInterpolator2Vtbl,
    query_interface : Proc(IUIAnimationInterpolator2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationInterpolator2*, UInt32),
    release : Proc(IUIAnimationInterpolator2*, UInt32),
    get_dimension : Proc(IUIAnimationInterpolator2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_initial_value_and_velocity : Proc(IUIAnimationInterpolator2*, Float64*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    set_duration : Proc(IUIAnimationInterpolator2*, Float64, Win32cr::Foundation::HRESULT),
    get_duration : Proc(IUIAnimationInterpolator2*, Float64*, Win32cr::Foundation::HRESULT),
    get_final_value : Proc(IUIAnimationInterpolator2*, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    interpolate_value : Proc(IUIAnimationInterpolator2*, Float64, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    interpolate_velocity : Proc(IUIAnimationInterpolator2*, Float64, Float64*, UInt32, Win32cr::Foundation::HRESULT),
    get_primitive_interpolation : Proc(IUIAnimationInterpolator2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_dependencies : Proc(IUIAnimationInterpolator2*, Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationInterpolator2, lpVtbl : IUIAnimationInterpolator2Vtbl* do
    GUID = LibC::GUID.new(0xea76aff8_u32, 0xea22_u16, 0x4a23_u16, StaticArray[0xa0_u8, 0xef_u8, 0xa6_u8, 0xa9_u8, 0x66_u8, 0x70_u8, 0x35_u8, 0x18_u8])
    def query_interface(this : IUIAnimationInterpolator2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationInterpolator2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationInterpolator2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dimension(this : IUIAnimationInterpolator2*, dimension : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dimension.call(this, dimension)
    end
    def set_initial_value_and_velocity(this : IUIAnimationInterpolator2*, initialValue : Float64*, initialVelocity : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_initial_value_and_velocity.call(this, initialValue, initialVelocity, cDimension)
    end
    def set_duration(this : IUIAnimationInterpolator2*, duration : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_duration.call(this, duration)
    end
    def get_duration(this : IUIAnimationInterpolator2*, duration : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duration.call(this, duration)
    end
    def get_final_value(this : IUIAnimationInterpolator2*, value : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_final_value.call(this, value, cDimension)
    end
    def interpolate_value(this : IUIAnimationInterpolator2*, offset : Float64, value : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.interpolate_value.call(this, offset, value, cDimension)
    end
    def interpolate_velocity(this : IUIAnimationInterpolator2*, offset : Float64, velocity : Float64*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.interpolate_velocity.call(this, offset, velocity, cDimension)
    end
    def get_primitive_interpolation(this : IUIAnimationInterpolator2*, interpolation : Void*, cDimension : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_primitive_interpolation.call(this, interpolation, cDimension)
    end
    def get_dependencies(this : IUIAnimationInterpolator2*, initialValueDependencies : Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, initialVelocityDependencies : Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*, durationDependencies : Win32cr::UI::Animation::UI_ANIMATION_DEPENDENCIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dependencies.call(this, initialValueDependencies, initialVelocityDependencies, durationDependencies)
    end

  end

  @[Extern]
  record IUIAnimationTransitionFactory2Vtbl,
    query_interface : Proc(IUIAnimationTransitionFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationTransitionFactory2*, UInt32),
    release : Proc(IUIAnimationTransitionFactory2*, UInt32),
    create_transition : Proc(IUIAnimationTransitionFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationTransitionFactory2, lpVtbl : IUIAnimationTransitionFactory2Vtbl* do
    GUID = LibC::GUID.new(0x937d4916_u32, 0xc1a6_u16, 0x42d5_u16, StaticArray[0x88_u8, 0xd8_u8, 0x30_u8, 0x34_u8, 0x4d_u8, 0x6e_u8, 0xfe_u8, 0x31_u8])
    def query_interface(this : IUIAnimationTransitionFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationTransitionFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationTransitionFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_transition(this : IUIAnimationTransitionFactory2*, interpolator : Void*, transition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transition.call(this, interpolator, transition)
    end

  end

  @[Extern]
  record IUIAnimationStoryboard2Vtbl,
    query_interface : Proc(IUIAnimationStoryboard2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAnimationStoryboard2*, UInt32),
    release : Proc(IUIAnimationStoryboard2*, UInt32),
    add_transition : Proc(IUIAnimationStoryboard2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_keyframe_at_offset : Proc(IUIAnimationStoryboard2*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Float64, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*, Win32cr::Foundation::HRESULT),
    add_keyframe_after_transition : Proc(IUIAnimationStoryboard2*, Void*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*, Win32cr::Foundation::HRESULT),
    add_transition_at_keyframe : Proc(IUIAnimationStoryboard2*, Void*, Void*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::Foundation::HRESULT),
    add_transition_between_keyframes : Proc(IUIAnimationStoryboard2*, Void*, Void*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::Foundation::HRESULT),
    repeat_between_keyframes : Proc(IUIAnimationStoryboard2*, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, Float64, Win32cr::UI::Animation::UI_ANIMATION_REPEAT_MODE, Void*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    hold_variable : Proc(IUIAnimationStoryboard2*, Void*, Win32cr::Foundation::HRESULT),
    set_longest_acceptable_delay : Proc(IUIAnimationStoryboard2*, Float64, Win32cr::Foundation::HRESULT),
    set_skip_duration : Proc(IUIAnimationStoryboard2*, Float64, Win32cr::Foundation::HRESULT),
    schedule : Proc(IUIAnimationStoryboard2*, Float64, Win32cr::UI::Animation::UI_ANIMATION_SCHEDULING_RESULT*, Win32cr::Foundation::HRESULT),
    conclude : Proc(IUIAnimationStoryboard2*, Win32cr::Foundation::HRESULT),
    finish : Proc(IUIAnimationStoryboard2*, Float64, Win32cr::Foundation::HRESULT),
    abandon : Proc(IUIAnimationStoryboard2*, Win32cr::Foundation::HRESULT),
    set_tag : Proc(IUIAnimationStoryboard2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_tag : Proc(IUIAnimationStoryboard2*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IUIAnimationStoryboard2*, Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS*, Win32cr::Foundation::HRESULT),
    get_elapsed_time : Proc(IUIAnimationStoryboard2*, Float64*, Win32cr::Foundation::HRESULT),
    set_storyboard_event_handler : Proc(IUIAnimationStoryboard2*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAnimationStoryboard2, lpVtbl : IUIAnimationStoryboard2Vtbl* do
    GUID = LibC::GUID.new(0xae289cd2_u32, 0x12d4_u16, 0x4945_u16, StaticArray[0x94_u8, 0x19_u8, 0x9e_u8, 0x41_u8, 0xbe_u8, 0x3_u8, 0x4d_u8, 0xf2_u8])
    def query_interface(this : IUIAnimationStoryboard2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAnimationStoryboard2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAnimationStoryboard2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_transition(this : IUIAnimationStoryboard2*, variable : Void*, transition : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_transition.call(this, variable, transition)
    end
    def add_keyframe_at_offset(this : IUIAnimationStoryboard2*, existingKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, offset : Float64, keyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_keyframe_at_offset.call(this, existingKeyframe, offset, keyframe)
    end
    def add_keyframe_after_transition(this : IUIAnimationStoryboard2*, transition : Void*, keyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_keyframe_after_transition.call(this, transition, keyframe)
    end
    def add_transition_at_keyframe(this : IUIAnimationStoryboard2*, variable : Void*, transition : Void*, startKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_transition_at_keyframe.call(this, variable, transition, startKeyframe)
    end
    def add_transition_between_keyframes(this : IUIAnimationStoryboard2*, variable : Void*, transition : Void*, startKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, endKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_transition_between_keyframes.call(this, variable, transition, startKeyframe, endKeyframe)
    end
    def repeat_between_keyframes(this : IUIAnimationStoryboard2*, startKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, endKeyframe : Win32cr::UI::Animation::UI_ANIMATION_KEYFRAME, cRepetition : Float64, repeatMode : Win32cr::UI::Animation::UI_ANIMATION_REPEAT_MODE, pIterationChangeHandler : Void*, id : LibC::UIntPtrT, fRegisterForNextAnimationEvent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.repeat_between_keyframes.call(this, startKeyframe, endKeyframe, cRepetition, repeatMode, pIterationChangeHandler, id, fRegisterForNextAnimationEvent)
    end
    def hold_variable(this : IUIAnimationStoryboard2*, variable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hold_variable.call(this, variable)
    end
    def set_longest_acceptable_delay(this : IUIAnimationStoryboard2*, delay : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_longest_acceptable_delay.call(this, delay)
    end
    def set_skip_duration(this : IUIAnimationStoryboard2*, secondsDuration : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_skip_duration.call(this, secondsDuration)
    end
    def schedule(this : IUIAnimationStoryboard2*, timeNow : Float64, schedulingResult : Win32cr::UI::Animation::UI_ANIMATION_SCHEDULING_RESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.schedule.call(this, timeNow, schedulingResult)
    end
    def conclude(this : IUIAnimationStoryboard2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conclude.call(this)
    end
    def finish(this : IUIAnimationStoryboard2*, completionDeadline : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finish.call(this, completionDeadline)
    end
    def abandon(this : IUIAnimationStoryboard2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abandon.call(this)
    end
    def set_tag(this : IUIAnimationStoryboard2*, object : Void*, id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tag.call(this, object, id)
    end
    def get_tag(this : IUIAnimationStoryboard2*, object : Void**, id : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tag.call(this, object, id)
    end
    def get_status(this : IUIAnimationStoryboard2*, status : Win32cr::UI::Animation::UI_ANIMATION_STORYBOARD_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def get_elapsed_time(this : IUIAnimationStoryboard2*, elapsedTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_elapsed_time.call(this, elapsedTime)
    end
    def set_storyboard_event_handler(this : IUIAnimationStoryboard2*, handler : Void*, fRegisterStatusChangeForNextAnimationEvent : Win32cr::Foundation::BOOL, fRegisterUpdateForNextAnimationEvent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_storyboard_event_handler.call(this, handler, fRegisterStatusChangeForNextAnimationEvent, fRegisterUpdateForNextAnimationEvent)
    end

  end

end