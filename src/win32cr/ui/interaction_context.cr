require "./windows_and_messaging.cr"
require "./../foundation.cr"
require "./input/pointer.cr"

module Win32cr::UI::InteractionContext
  alias HINTERACTIONCONTEXT = LibC::IntPtrT
  alias INTERACTION_CONTEXT_OUTPUT_CALLBACK = Proc(Void*, Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_OUTPUT*, Void)

  alias INTERACTION_CONTEXT_OUTPUT_CALLBACK2 = Proc(Void*, Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_OUTPUT2*, Void)


  enum INTERACTION_ID
    INTERACTION_ID_NONE = 0_i32
    INTERACTION_ID_MANIPULATION = 1_i32
    INTERACTION_ID_TAP = 2_i32
    INTERACTION_ID_SECONDARY_TAP = 3_i32
    INTERACTION_ID_HOLD = 4_i32
    INTERACTION_ID_DRAG = 5_i32
    INTERACTION_ID_CROSS_SLIDE = 6_i32
    INTERACTION_ID_MAX = -1_i32
  end
  @[Flags]
  enum INTERACTION_FLAGS : UInt32
    INTERACTION_FLAG_NONE = 0_u32
    INTERACTION_FLAG_BEGIN = 1_u32
    INTERACTION_FLAG_END = 2_u32
    INTERACTION_FLAG_CANCEL = 4_u32
    INTERACTION_FLAG_INERTIA = 8_u32
    INTERACTION_FLAG_MAX = 4294967295_u32
  end
  @[Flags]
  enum INTERACTION_CONFIGURATION_FLAGS : UInt32
    INTERACTION_CONFIGURATION_FLAG_NONE = 0_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION = 1_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X = 2_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y = 4_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION = 8_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING = 16_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA = 32_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA = 64_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA = 128_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X = 256_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y = 512_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT = 1024_u32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_MULTIPLE_FINGER_PANNING = 2048_u32
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE = 1_u32
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL = 2_u32
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT = 4_u32
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP = 8_u32
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE = 16_u32
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT = 32_u32
    INTERACTION_CONFIGURATION_FLAG_TAP = 1_u32
    INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE = 2_u32
    INTERACTION_CONFIGURATION_FLAG_TAP_MULTIPLE_FINGER = 4_u32
    INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP = 1_u32
    INTERACTION_CONFIGURATION_FLAG_HOLD = 1_u32
    INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE = 2_u32
    INTERACTION_CONFIGURATION_FLAG_HOLD_MULTIPLE_FINGER = 4_u32
    INTERACTION_CONFIGURATION_FLAG_DRAG = 1_u32
    INTERACTION_CONFIGURATION_FLAG_MAX = 4294967295_u32
  end
  enum INERTIA_PARAMETER
    INERTIA_PARAMETER_TRANSLATION_DECELERATION = 1_i32
    INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT = 2_i32
    INERTIA_PARAMETER_ROTATION_DECELERATION = 3_i32
    INERTIA_PARAMETER_ROTATION_ANGLE = 4_i32
    INERTIA_PARAMETER_EXPANSION_DECELERATION = 5_i32
    INERTIA_PARAMETER_EXPANSION_EXPANSION = 6_i32
    INERTIA_PARAMETER_MAX = -1_i32
  end
  enum INTERACTION_STATE
    INTERACTION_STATE_IDLE = 0_i32
    INTERACTION_STATE_IN_INTERACTION = 1_i32
    INTERACTION_STATE_POSSIBLE_DOUBLE_TAP = 2_i32
    INTERACTION_STATE_MAX = -1_i32
  end
  enum INTERACTION_CONTEXT_PROPERTY
    INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS = 1_i32
    INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK = 2_i32
    INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS = 3_i32
    INTERACTION_CONTEXT_PROPERTY_MAX = -1_i32
  end
  enum CROSS_SLIDE_THRESHOLD
    CROSS_SLIDE_THRESHOLD_SELECT_START = 0_i32
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START = 1_i32
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END = 2_i32
    CROSS_SLIDE_THRESHOLD_REARRANGE_START = 3_i32
    CROSS_SLIDE_THRESHOLD_COUNT = 4_i32
    CROSS_SLIDE_THRESHOLD_MAX = -1_i32
  end
  @[Flags]
  enum CROSS_SLIDE_FLAGS : UInt32
    CROSS_SLIDE_FLAGS_NONE = 0_u32
    CROSS_SLIDE_FLAGS_SELECT = 1_u32
    CROSS_SLIDE_FLAGS_SPEED_BUMP = 2_u32
    CROSS_SLIDE_FLAGS_REARRANGE = 4_u32
    CROSS_SLIDE_FLAGS_MAX = 4294967295_u32
  end
  enum MOUSE_WHEEL_PARAMETER
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X = 1_i32
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y = 2_i32
    MOUSE_WHEEL_PARAMETER_DELTA_SCALE = 3_i32
    MOUSE_WHEEL_PARAMETER_DELTA_ROTATION = 4_i32
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X = 5_i32
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y = 6_i32
    MOUSE_WHEEL_PARAMETER_MAX = -1_i32
  end
  enum TAP_PARAMETER
    TAP_PARAMETER_MIN_CONTACT_COUNT = 0_i32
    TAP_PARAMETER_MAX_CONTACT_COUNT = 1_i32
    TAP_PARAMETER_MAX = -1_i32
  end
  enum HOLD_PARAMETER
    HOLD_PARAMETER_MIN_CONTACT_COUNT = 0_i32
    HOLD_PARAMETER_MAX_CONTACT_COUNT = 1_i32
    HOLD_PARAMETER_THRESHOLD_RADIUS = 2_i32
    HOLD_PARAMETER_THRESHOLD_START_DELAY = 3_i32
    HOLD_PARAMETER_MAX = -1_i32
  end
  enum TRANSLATION_PARAMETER
    TRANSLATION_PARAMETER_MIN_CONTACT_COUNT = 0_i32
    TRANSLATION_PARAMETER_MAX_CONTACT_COUNT = 1_i32
    TRANSLATION_PARAMETER_MAX = -1_i32
  end
  enum MANIPULATION_RAILS_STATE
    MANIPULATION_RAILS_STATE_UNDECIDED = 0_i32
    MANIPULATION_RAILS_STATE_FREE = 1_i32
    MANIPULATION_RAILS_STATE_RAILED = 2_i32
    MANIPULATION_RAILS_STATE_MAX = -1_i32
  end

  @[Extern]
  struct MANIPULATION_TRANSFORM
    property translationX : Float32
    property translationY : Float32
    property scale : Float32
    property expansion : Float32
    property rotation : Float32
    def initialize(@translationX : Float32, @translationY : Float32, @scale : Float32, @expansion : Float32, @rotation : Float32)
    end
  end

  @[Extern]
  struct MANIPULATION_VELOCITY
    property velocityX : Float32
    property velocityY : Float32
    property velocityExpansion : Float32
    property velocityAngular : Float32
    def initialize(@velocityX : Float32, @velocityY : Float32, @velocityExpansion : Float32, @velocityAngular : Float32)
    end
  end

  @[Extern]
  struct INTERACTION_ARGUMENTS_MANIPULATION
    property delta : Win32cr::UI::InteractionContext::MANIPULATION_TRANSFORM
    property cumulative : Win32cr::UI::InteractionContext::MANIPULATION_TRANSFORM
    property velocity : Win32cr::UI::InteractionContext::MANIPULATION_VELOCITY
    property railsState : Win32cr::UI::InteractionContext::MANIPULATION_RAILS_STATE
    def initialize(@delta : Win32cr::UI::InteractionContext::MANIPULATION_TRANSFORM, @cumulative : Win32cr::UI::InteractionContext::MANIPULATION_TRANSFORM, @velocity : Win32cr::UI::InteractionContext::MANIPULATION_VELOCITY, @railsState : Win32cr::UI::InteractionContext::MANIPULATION_RAILS_STATE)
    end
  end

  @[Extern]
  struct INTERACTION_ARGUMENTS_TAP
    property count : UInt32
    def initialize(@count : UInt32)
    end
  end

  @[Extern]
  struct INTERACTION_ARGUMENTS_CROSS_SLIDE
    property flags : Win32cr::UI::InteractionContext::CROSS_SLIDE_FLAGS
    def initialize(@flags : Win32cr::UI::InteractionContext::CROSS_SLIDE_FLAGS)
    end
  end

  @[Extern]
  struct INTERACTION_CONTEXT_OUTPUT
    property interactionId : Win32cr::UI::InteractionContext::INTERACTION_ID
    property interactionFlags : Win32cr::UI::InteractionContext::INTERACTION_FLAGS
    property inputType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE
    property x : Float32
    property y : Float32
    property arguments : Arguments_e__union_

    # Nested Type Arguments_e__union_
    @[Extern(union: true)]
    struct Arguments_e__union_
    property manipulation : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_MANIPULATION
    property tap : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_TAP
    property crossSlide : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_CROSS_SLIDE
    def initialize(@manipulation : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_MANIPULATION, @tap : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_TAP, @crossSlide : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_CROSS_SLIDE)
    end
    end

    def initialize(@interactionId : Win32cr::UI::InteractionContext::INTERACTION_ID, @interactionFlags : Win32cr::UI::InteractionContext::INTERACTION_FLAGS, @inputType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE, @x : Float32, @y : Float32, @arguments : Arguments_e__union_)
    end
  end

  @[Extern]
  struct INTERACTION_CONTEXT_OUTPUT2
    property interactionId : Win32cr::UI::InteractionContext::INTERACTION_ID
    property interactionFlags : Win32cr::UI::InteractionContext::INTERACTION_FLAGS
    property inputType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE
    property contactCount : UInt32
    property currentContactCount : UInt32
    property x : Float32
    property y : Float32
    property arguments : Arguments_e__union_

    # Nested Type Arguments_e__union_
    @[Extern(union: true)]
    struct Arguments_e__union_
    property manipulation : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_MANIPULATION
    property tap : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_TAP
    property crossSlide : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_CROSS_SLIDE
    def initialize(@manipulation : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_MANIPULATION, @tap : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_TAP, @crossSlide : Win32cr::UI::InteractionContext::INTERACTION_ARGUMENTS_CROSS_SLIDE)
    end
    end

    def initialize(@interactionId : Win32cr::UI::InteractionContext::INTERACTION_ID, @interactionFlags : Win32cr::UI::InteractionContext::INTERACTION_FLAGS, @inputType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE, @contactCount : UInt32, @currentContactCount : UInt32, @x : Float32, @y : Float32, @arguments : Arguments_e__union_)
    end
  end

  @[Extern]
  struct INTERACTION_CONTEXT_CONFIGURATION
    property interactionId : Win32cr::UI::InteractionContext::INTERACTION_ID
    property enable : Win32cr::UI::InteractionContext::INTERACTION_CONFIGURATION_FLAGS
    def initialize(@interactionId : Win32cr::UI::InteractionContext::INTERACTION_ID, @enable : Win32cr::UI::InteractionContext::INTERACTION_CONFIGURATION_FLAGS)
    end
  end

  @[Extern]
  struct CROSS_SLIDE_PARAMETER
    property threshold : Win32cr::UI::InteractionContext::CROSS_SLIDE_THRESHOLD
    property distance : Float32
    def initialize(@threshold : Win32cr::UI::InteractionContext::CROSS_SLIDE_THRESHOLD, @distance : Float32)
    end
  end

  @[Link("ninput")]
  lib C
    fun CreateInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT*) : Win32cr::Foundation::HRESULT

    fun DestroyInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT) : Win32cr::Foundation::HRESULT

    fun RegisterOutputCallbackInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, outputCallback : Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_OUTPUT_CALLBACK, clientData : Void*) : Win32cr::Foundation::HRESULT

    fun RegisterOutputCallbackInteractionContext2(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, outputCallback : Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_OUTPUT_CALLBACK2, clientData : Void*) : Win32cr::Foundation::HRESULT

    fun SetInteractionConfigurationInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, configurationCount : UInt32, configuration : Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_CONFIGURATION*) : Win32cr::Foundation::HRESULT

    fun GetInteractionConfigurationInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, configurationCount : UInt32, configuration : Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_CONFIGURATION*) : Win32cr::Foundation::HRESULT

    fun SetPropertyInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, contextProperty : Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_PROPERTY, value : UInt32) : Win32cr::Foundation::HRESULT

    fun GetPropertyInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, contextProperty : Win32cr::UI::InteractionContext::INTERACTION_CONTEXT_PROPERTY, value : UInt32*) : Win32cr::Foundation::HRESULT

    fun SetInertiaParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, inertiaParameter : Win32cr::UI::InteractionContext::INERTIA_PARAMETER, value : Float32) : Win32cr::Foundation::HRESULT

    fun GetInertiaParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, inertiaParameter : Win32cr::UI::InteractionContext::INERTIA_PARAMETER, value : Float32*) : Win32cr::Foundation::HRESULT

    fun SetCrossSlideParametersInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameterCount : UInt32, crossSlideParameters : Win32cr::UI::InteractionContext::CROSS_SLIDE_PARAMETER*) : Win32cr::Foundation::HRESULT

    fun GetCrossSlideParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, threshold : Win32cr::UI::InteractionContext::CROSS_SLIDE_THRESHOLD, distance : Float32*) : Win32cr::Foundation::HRESULT

    fun SetTapParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::TAP_PARAMETER, value : Float32) : Win32cr::Foundation::HRESULT

    fun GetTapParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::TAP_PARAMETER, value : Float32*) : Win32cr::Foundation::HRESULT

    fun SetHoldParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::HOLD_PARAMETER, value : Float32) : Win32cr::Foundation::HRESULT

    fun GetHoldParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::HOLD_PARAMETER, value : Float32*) : Win32cr::Foundation::HRESULT

    fun SetTranslationParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::TRANSLATION_PARAMETER, value : Float32) : Win32cr::Foundation::HRESULT

    fun GetTranslationParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::TRANSLATION_PARAMETER, value : Float32*) : Win32cr::Foundation::HRESULT

    fun SetMouseWheelParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::MOUSE_WHEEL_PARAMETER, value : Float32) : Win32cr::Foundation::HRESULT

    fun GetMouseWheelParameterInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, parameter : Win32cr::UI::InteractionContext::MOUSE_WHEEL_PARAMETER, value : Float32*) : Win32cr::Foundation::HRESULT

    fun ResetInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT) : Win32cr::Foundation::HRESULT

    fun GetStateInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*, state : Win32cr::UI::InteractionContext::INTERACTION_STATE*) : Win32cr::Foundation::HRESULT

    fun AddPointerInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, pointerId : UInt32) : Win32cr::Foundation::HRESULT

    fun RemovePointerInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, pointerId : UInt32) : Win32cr::Foundation::HRESULT

    fun ProcessPointerFramesInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, entriesCount : UInt32, pointerCount : UInt32, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::HRESULT

    fun BufferPointerPacketsInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, entriesCount : UInt32, pointerInfo : Win32cr::UI::Input::Pointer::POINTER_INFO*) : Win32cr::Foundation::HRESULT

    fun ProcessBufferedPacketsInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT) : Win32cr::Foundation::HRESULT

    fun ProcessInertiaInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT) : Win32cr::Foundation::HRESULT

    fun StopInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT) : Win32cr::Foundation::HRESULT

    fun SetPivotInteractionContext(interactionContext : Win32cr::UI::InteractionContext::HINTERACTIONCONTEXT, x : Float32, y : Float32, radius : Float32) : Win32cr::Foundation::HRESULT

  end
end