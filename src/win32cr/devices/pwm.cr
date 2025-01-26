require "./../foundation.cr"

module Win32cr::Devices::Pwm
  GUID_DEVINTERFACE_PWM_CONTROLLER = "60824b4c-eed1-4c9c-b49c-1b961461a819"
  GUID_DEVINTERFACE_PWM_CONTROLLER_WSZ = "{60824B4C-EED1-4C9C-B49C-1B961461A819}"
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

  enum PWM_POLARITY
    PWM_ACTIVE_HIGH = 0_i32
    PWM_ACTIVE_LOW = 1_i32
  end

  @[Extern]
  struct PWM_CONTROLLER_INFO
    property size : LibC::UIntPtrT
    property pin_count : UInt32
    property minimum_period : UInt64
    property maximum_period : UInt64
    def initialize(@size : LibC::UIntPtrT, @pin_count : UInt32, @minimum_period : UInt64, @maximum_period : UInt64)
    end
  end

  @[Extern]
  struct PWM_CONTROLLER_GET_ACTUAL_PERIOD_OUTPUT
    property actual_period : UInt64
    def initialize(@actual_period : UInt64)
    end
  end

  @[Extern]
  struct PWM_CONTROLLER_SET_DESIRED_PERIOD_INPUT
    property desired_period : UInt64
    def initialize(@desired_period : UInt64)
    end
  end

  @[Extern]
  struct PWM_CONTROLLER_SET_DESIRED_PERIOD_OUTPUT
    property actual_period : UInt64
    def initialize(@actual_period : UInt64)
    end
  end

  @[Extern]
  struct PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE_OUTPUT
    property percentage : UInt64
    def initialize(@percentage : UInt64)
    end
  end

  @[Extern]
  struct PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE_INPUT
    property percentage : UInt64
    def initialize(@percentage : UInt64)
    end
  end

  @[Extern]
  struct PWM_PIN_GET_POLARITY_OUTPUT
    property polarity : Win32cr::Devices::Pwm::PWM_POLARITY
    def initialize(@polarity : Win32cr::Devices::Pwm::PWM_POLARITY)
    end
  end

  @[Extern]
  struct PWM_PIN_SET_POLARITY_INPUT
    property polarity : Win32cr::Devices::Pwm::PWM_POLARITY
    def initialize(@polarity : Win32cr::Devices::Pwm::PWM_POLARITY)
    end
  end

  @[Extern]
  struct PWM_PIN_IS_STARTED_OUTPUT
    property is_started : Win32cr::Foundation::BOOLEAN
    def initialize(@is_started : Win32cr::Foundation::BOOLEAN)
    end
  end

end