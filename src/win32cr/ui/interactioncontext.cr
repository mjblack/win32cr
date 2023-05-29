require "../ui/windowsandmessaging.cr"
require "../foundation.cr"
require "../ui/input/pointer.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:ninput.dll")]
lib LibWin32
  alias HINTERACTIONCONTEXT = LibC::IntPtrT

  alias INTERACTION_CONTEXT_OUTPUT_CALLBACK = Proc(Void*, INTERACTION_CONTEXT_OUTPUT*, Void)
  alias INTERACTION_CONTEXT_OUTPUT_CALLBACK2 = Proc(Void*, INTERACTION_CONTEXT_OUTPUT2*, Void)


  enum INTERACTION_ID : Int32
    INTERACTION_ID_NONE = 0
    INTERACTION_ID_MANIPULATION = 1
    INTERACTION_ID_TAP = 2
    INTERACTION_ID_SECONDARY_TAP = 3
    INTERACTION_ID_HOLD = 4
    INTERACTION_ID_DRAG = 5
    INTERACTION_ID_CROSS_SLIDE = 6
    INTERACTION_ID_MAX = -1
  end

  enum INTERACTION_FLAGS : UInt32
    INTERACTION_FLAG_NONE = 0
    INTERACTION_FLAG_BEGIN = 1
    INTERACTION_FLAG_END = 2
    INTERACTION_FLAG_CANCEL = 4
    INTERACTION_FLAG_INERTIA = 8
    INTERACTION_FLAG_MAX = 4294967295
  end

  enum INTERACTION_CONFIGURATION_FLAGS : UInt32
    INTERACTION_CONFIGURATION_FLAG_NONE = 0
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION = 1
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X = 2
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y = 4
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION = 8
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING = 16
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA = 32
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA = 64
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA = 128
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X = 256
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y = 512
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT = 1024
    INTERACTION_CONFIGURATION_FLAG_MANIPULATION_MULTIPLE_FINGER_PANNING = 2048
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE = 1
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL = 2
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT = 4
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP = 8
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE = 16
    INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT = 32
    INTERACTION_CONFIGURATION_FLAG_TAP = 1
    INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE = 2
    INTERACTION_CONFIGURATION_FLAG_TAP_MULTIPLE_FINGER = 4
    INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP = 1
    INTERACTION_CONFIGURATION_FLAG_HOLD = 1
    INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE = 2
    INTERACTION_CONFIGURATION_FLAG_HOLD_MULTIPLE_FINGER = 4
    INTERACTION_CONFIGURATION_FLAG_DRAG = 1
    INTERACTION_CONFIGURATION_FLAG_MAX = 4294967295
  end

  enum INERTIA_PARAMETER : Int32
    INERTIA_PARAMETER_TRANSLATION_DECELERATION = 1
    INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT = 2
    INERTIA_PARAMETER_ROTATION_DECELERATION = 3
    INERTIA_PARAMETER_ROTATION_ANGLE = 4
    INERTIA_PARAMETER_EXPANSION_DECELERATION = 5
    INERTIA_PARAMETER_EXPANSION_EXPANSION = 6
    INERTIA_PARAMETER_MAX = -1
  end

  enum INTERACTION_STATE : Int32
    INTERACTION_STATE_IDLE = 0
    INTERACTION_STATE_IN_INTERACTION = 1
    INTERACTION_STATE_POSSIBLE_DOUBLE_TAP = 2
    INTERACTION_STATE_MAX = -1
  end

  enum INTERACTION_CONTEXT_PROPERTY : Int32
    INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS = 1
    INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK = 2
    INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS = 3
    INTERACTION_CONTEXT_PROPERTY_MAX = -1
  end

  enum CROSS_SLIDE_THRESHOLD : Int32
    CROSS_SLIDE_THRESHOLD_SELECT_START = 0
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START = 1
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END = 2
    CROSS_SLIDE_THRESHOLD_REARRANGE_START = 3
    CROSS_SLIDE_THRESHOLD_COUNT = 4
    CROSS_SLIDE_THRESHOLD_MAX = -1
  end

  enum CROSS_SLIDE_FLAGS : UInt32
    CROSS_SLIDE_FLAGS_NONE = 0
    CROSS_SLIDE_FLAGS_SELECT = 1
    CROSS_SLIDE_FLAGS_SPEED_BUMP = 2
    CROSS_SLIDE_FLAGS_REARRANGE = 4
    CROSS_SLIDE_FLAGS_MAX = 4294967295
  end

  enum MOUSE_WHEEL_PARAMETER : Int32
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X = 1
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y = 2
    MOUSE_WHEEL_PARAMETER_DELTA_SCALE = 3
    MOUSE_WHEEL_PARAMETER_DELTA_ROTATION = 4
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X = 5
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y = 6
    MOUSE_WHEEL_PARAMETER_MAX = -1
  end

  enum TAP_PARAMETER : Int32
    TAP_PARAMETER_MIN_CONTACT_COUNT = 0
    TAP_PARAMETER_MAX_CONTACT_COUNT = 1
    TAP_PARAMETER_MAX = -1
  end

  enum HOLD_PARAMETER : Int32
    HOLD_PARAMETER_MIN_CONTACT_COUNT = 0
    HOLD_PARAMETER_MAX_CONTACT_COUNT = 1
    HOLD_PARAMETER_THRESHOLD_RADIUS = 2
    HOLD_PARAMETER_THRESHOLD_START_DELAY = 3
    HOLD_PARAMETER_MAX = -1
  end

  enum TRANSLATION_PARAMETER : Int32
    TRANSLATION_PARAMETER_MIN_CONTACT_COUNT = 0
    TRANSLATION_PARAMETER_MAX_CONTACT_COUNT = 1
    TRANSLATION_PARAMETER_MAX = -1
  end

  enum MANIPULATION_RAILS_STATE : Int32
    MANIPULATION_RAILS_STATE_UNDECIDED = 0
    MANIPULATION_RAILS_STATE_FREE = 1
    MANIPULATION_RAILS_STATE_RAILED = 2
    MANIPULATION_RAILS_STATE_MAX = -1
  end

  union INTERACTION_CONTEXT_OUTPUT_arguments_e__Union
    manipulation : INTERACTION_ARGUMENTS_MANIPULATION
    tap : INTERACTION_ARGUMENTS_TAP
    cross_slide : INTERACTION_ARGUMENTS_CROSS_SLIDE
  end
  union INTERACTION_CONTEXT_OUTPUT2_arguments_e__Union
    manipulation : INTERACTION_ARGUMENTS_MANIPULATION
    tap : INTERACTION_ARGUMENTS_TAP
    cross_slide : INTERACTION_ARGUMENTS_CROSS_SLIDE
  end

  struct MANIPULATION_TRANSFORM
    translation_x : Float32
    translation_y : Float32
    scale : Float32
    expansion : Float32
    rotation : Float32
  end
  struct MANIPULATION_VELOCITY
    velocity_x : Float32
    velocity_y : Float32
    velocity_expansion : Float32
    velocity_angular : Float32
  end
  struct INTERACTION_ARGUMENTS_MANIPULATION
    delta : MANIPULATION_TRANSFORM
    cumulative : MANIPULATION_TRANSFORM
    velocity : MANIPULATION_VELOCITY
    rails_state : MANIPULATION_RAILS_STATE
  end
  struct INTERACTION_ARGUMENTS_TAP
    count : UInt32
  end
  struct INTERACTION_ARGUMENTS_CROSS_SLIDE
    flags : CROSS_SLIDE_FLAGS
  end
  struct INTERACTION_CONTEXT_OUTPUT
    interaction_id : INTERACTION_ID
    interaction_flags : INTERACTION_FLAGS
    input_type : POINTER_INPUT_TYPE
    x : Float32
    y : Float32
    arguments : INTERACTION_CONTEXT_OUTPUT_arguments_e__Union
  end
  struct INTERACTION_CONTEXT_OUTPUT2
    interaction_id : INTERACTION_ID
    interaction_flags : INTERACTION_FLAGS
    input_type : POINTER_INPUT_TYPE
    contact_count : UInt32
    current_contact_count : UInt32
    x : Float32
    y : Float32
    arguments : INTERACTION_CONTEXT_OUTPUT2_arguments_e__Union
  end
  struct INTERACTION_CONTEXT_CONFIGURATION
    interaction_id : INTERACTION_ID
    enable : INTERACTION_CONFIGURATION_FLAGS
  end
  struct CROSS_SLIDE_PARAMETER
    threshold : CROSS_SLIDE_THRESHOLD
    distance : Float32
  end


  # Params # interactioncontext : HINTERACTIONCONTEXT* [In]
  fun CreateInteractionContext(interactioncontext : HINTERACTIONCONTEXT*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In]
  fun DestroyInteractionContext(interactioncontext : HINTERACTIONCONTEXT) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],outputcallback : INTERACTION_CONTEXT_OUTPUT_CALLBACK [In],clientdata : Void* [In]
  fun RegisterOutputCallbackInteractionContext(interactioncontext : HINTERACTIONCONTEXT, outputcallback : INTERACTION_CONTEXT_OUTPUT_CALLBACK, clientdata : Void*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],outputcallback : INTERACTION_CONTEXT_OUTPUT_CALLBACK2 [In],clientdata : Void* [In]
  fun RegisterOutputCallbackInteractionContext2(interactioncontext : HINTERACTIONCONTEXT, outputcallback : INTERACTION_CONTEXT_OUTPUT_CALLBACK2, clientdata : Void*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],configurationcount : UInt32 [In],configuration : INTERACTION_CONTEXT_CONFIGURATION* [In]
  fun SetInteractionConfigurationInteractionContext(interactioncontext : HINTERACTIONCONTEXT, configurationcount : UInt32, configuration : INTERACTION_CONTEXT_CONFIGURATION*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],configurationcount : UInt32 [In],configuration : INTERACTION_CONTEXT_CONFIGURATION* [In]
  fun GetInteractionConfigurationInteractionContext(interactioncontext : HINTERACTIONCONTEXT, configurationcount : UInt32, configuration : INTERACTION_CONTEXT_CONFIGURATION*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],contextproperty : INTERACTION_CONTEXT_PROPERTY [In],value : UInt32 [In]
  fun SetPropertyInteractionContext(interactioncontext : HINTERACTIONCONTEXT, contextproperty : INTERACTION_CONTEXT_PROPERTY, value : UInt32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],contextproperty : INTERACTION_CONTEXT_PROPERTY [In],value : UInt32* [In]
  fun GetPropertyInteractionContext(interactioncontext : HINTERACTIONCONTEXT, contextproperty : INTERACTION_CONTEXT_PROPERTY, value : UInt32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],inertiaparameter : INERTIA_PARAMETER [In],value : Float32 [In]
  fun SetInertiaParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, inertiaparameter : INERTIA_PARAMETER, value : Float32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],inertiaparameter : INERTIA_PARAMETER [In],value : Float32* [In]
  fun GetInertiaParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, inertiaparameter : INERTIA_PARAMETER, value : Float32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parametercount : UInt32 [In],crossslideparameters : CROSS_SLIDE_PARAMETER* [In]
  fun SetCrossSlideParametersInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parametercount : UInt32, crossslideparameters : CROSS_SLIDE_PARAMETER*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],threshold : CROSS_SLIDE_THRESHOLD [In],distance : Float32* [In]
  fun GetCrossSlideParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, threshold : CROSS_SLIDE_THRESHOLD, distance : Float32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : TAP_PARAMETER [In],value : Float32 [In]
  fun SetTapParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : TAP_PARAMETER, value : Float32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : TAP_PARAMETER [In],value : Float32* [In]
  fun GetTapParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : TAP_PARAMETER, value : Float32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : HOLD_PARAMETER [In],value : Float32 [In]
  fun SetHoldParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : HOLD_PARAMETER, value : Float32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : HOLD_PARAMETER [In],value : Float32* [In]
  fun GetHoldParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : HOLD_PARAMETER, value : Float32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : TRANSLATION_PARAMETER [In],value : Float32 [In]
  fun SetTranslationParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : TRANSLATION_PARAMETER, value : Float32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : TRANSLATION_PARAMETER [In],value : Float32* [In]
  fun GetTranslationParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : TRANSLATION_PARAMETER, value : Float32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : MOUSE_WHEEL_PARAMETER [In],value : Float32 [In]
  fun SetMouseWheelParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : MOUSE_WHEEL_PARAMETER, value : Float32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],parameter : MOUSE_WHEEL_PARAMETER [In],value : Float32* [In]
  fun GetMouseWheelParameterInteractionContext(interactioncontext : HINTERACTIONCONTEXT, parameter : MOUSE_WHEEL_PARAMETER, value : Float32*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In]
  fun ResetInteractionContext(interactioncontext : HINTERACTIONCONTEXT) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],pointerinfo : POINTER_INFO* [In],state : INTERACTION_STATE* [In]
  fun GetStateInteractionContext(interactioncontext : HINTERACTIONCONTEXT, pointerinfo : POINTER_INFO*, state : INTERACTION_STATE*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],pointerid : UInt32 [In]
  fun AddPointerInteractionContext(interactioncontext : HINTERACTIONCONTEXT, pointerid : UInt32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],pointerid : UInt32 [In]
  fun RemovePointerInteractionContext(interactioncontext : HINTERACTIONCONTEXT, pointerid : UInt32) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],entriescount : UInt32 [In],pointercount : UInt32 [In],pointerinfo : POINTER_INFO* [In]
  fun ProcessPointerFramesInteractionContext(interactioncontext : HINTERACTIONCONTEXT, entriescount : UInt32, pointercount : UInt32, pointerinfo : POINTER_INFO*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],entriescount : UInt32 [In],pointerinfo : POINTER_INFO* [In]
  fun BufferPointerPacketsInteractionContext(interactioncontext : HINTERACTIONCONTEXT, entriescount : UInt32, pointerinfo : POINTER_INFO*) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In]
  fun ProcessBufferedPacketsInteractionContext(interactioncontext : HINTERACTIONCONTEXT) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In]
  fun ProcessInertiaInteractionContext(interactioncontext : HINTERACTIONCONTEXT) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In]
  fun StopInteractionContext(interactioncontext : HINTERACTIONCONTEXT) : HRESULT

  # Params # interactioncontext : HINTERACTIONCONTEXT [In],x : Float32 [In],y : Float32 [In],radius : Float32 [In]
  fun SetPivotInteractionContext(interactioncontext : HINTERACTIONCONTEXT, x : Float32, y : Float32, radius : Float32) : HRESULT
end
