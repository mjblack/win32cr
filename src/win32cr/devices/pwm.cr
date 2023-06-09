require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  GUID_DEVINTERFACE_PWM_CONTROLLER = "60824b4c-eed1-4c9c-b49c-1b961461a819"
  IOCTL_PWM_CONTROLLER_GET_INFO = 262144_u32
  IOCTL_PWM_CONTROLLER_GET_ACTUAL_PERIOD = 262148_u32
  IOCTL_PWM_CONTROLLER_SET_DESIRED_PERIOD = 294920_u32
  IOCTL_PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 262544_u32
  IOCTL_PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 295316_u32
  IOCTL_PWM_PIN_GET_POLARITY = 262552_u32
  IOCTL_PWM_PIN_SET_POLARITY = 295324_u32
  IOCTL_PWM_PIN_START = 295331_u32
  IOCTL_PWM_PIN_STOP = 295335_u32
  IOCTL_PWM_PIN_IS_STARTED = 262568_u32
  PWM_IOCTL_ID_CONTROLLER_GET_INFO = 0_i32
  PWM_IOCTL_ID_CONTROLLER_GET_ACTUAL_PERIOD = 1_i32
  PWM_IOCTL_ID_CONTROLLER_SET_DESIRED_PERIOD = 2_i32
  PWM_IOCTL_ID_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 100_i32
  PWM_IOCTL_ID_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 101_i32
  PWM_IOCTL_ID_PIN_GET_POLARITY = 102_i32
  PWM_IOCTL_ID_PIN_SET_POLARITY = 103_i32
  PWM_IOCTL_ID_PIN_START = 104_i32
  PWM_IOCTL_ID_PIN_STOP = 105_i32
  PWM_IOCTL_ID_PIN_IS_STARTED = 106_i32


  enum PWM_POLARITY : Int32
    PWM_ACTIVE_HIGH = 0
    PWM_ACTIVE_LOW = 1
  end

  struct PWM_CONTROLLER_INFO
    size : LibC::UINT_PTR
    pin_count : UInt32
    minimum_period : UInt64
    maximum_period : UInt64
  end
  struct PWM_CONTROLLER_GET_ACTUAL_PERIOD_OUTPUT
    actual_period : UInt64
  end
  struct PWM_CONTROLLER_SET_DESIRED_PERIOD_INPUT
    desired_period : UInt64
  end
  struct PWM_CONTROLLER_SET_DESIRED_PERIOD_OUTPUT
    actual_period : UInt64
  end
  struct PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE_OUTPUT
    percentage : UInt64
  end
  struct PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE_INPUT
    percentage : UInt64
  end
  struct PWM_PIN_GET_POLARITY_OUTPUT
    polarity : PWM_POLARITY
  end
  struct PWM_PIN_SET_POLARITY_INPUT
    polarity : PWM_POLARITY
  end
  struct PWM_PIN_IS_STARTED_OUTPUT
    is_started : BOOLEAN
  end

end
