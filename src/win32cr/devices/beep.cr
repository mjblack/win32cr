
module Win32cr::Devices::Beep
  extend self
  DD_BEEP_DEVICE_NAME = "\\Device\\Beep"
  DD_BEEP_DEVICE_NAME_U = "\\Device\\Beep"
  IOCTL_BEEP_SET = 65536_u32
  BEEP_FREQUENCY_MINIMUM = 37_u32
  BEEP_FREQUENCY_MAXIMUM = 32767_u32


  @[Extern]
  struct BEEP_SET_PARAMETERS
    property frequency : UInt32
    property duration : UInt32
    def initialize(@frequency : UInt32, @duration : UInt32)
    end
  end

end