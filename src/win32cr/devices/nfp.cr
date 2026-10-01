require "./../foundation.cr"

module Win32cr::Devices::Nfp
  extend self
  GUID_DEVINTERFACE_NFP = LibC::GUID.new(0xfb3842cd_u32, 0x9e2a_u16, 0x4f83_u16, StaticArray[0x8f_u8, 0xcc_u8, 0x4b_u8, 0x7_u8, 0x61_u8, 0x13_u8, 0x9a_u8, 0xe9_u8])
  DEVPKEY_NFP_Capabilities = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0xfb3842cd_u32, 0x9e2a_u16, 0x4f83_u16, StaticArray[0x8f_u8, 0xcc_u8, 0x4b_u8, 0x7_u8, 0x61_u8, 0x13_u8, 0x9a_u8, 0xe9_u8]), 2_u32)
  IOCTL_NFP_GET_NEXT_SUBSCRIBED_MESSAGE = 5308480_u32
  IOCTL_NFP_SET_PAYLOAD = 5308484_u32
  IOCTL_NFP_GET_NEXT_TRANSMITTED_MESSAGE = 5308488_u32
  IOCTL_NFP_DISABLE = 5308492_u32
  IOCTL_NFP_ENABLE = 5308496_u32
  IOCTL_NFP_GET_MAX_MESSAGE_BYTES = 5308544_u32
  IOCTL_NFP_GET_KILO_BYTES_PER_SECOND = 5308548_u32


  @[Extern]
  struct SUBSCRIBED_MESSAGE
    property cbPayloadHint : UInt32
    property payload : UInt8[1]
    def initialize(@cbPayloadHint : UInt32, @payload : UInt8[1])
    end
  end

end