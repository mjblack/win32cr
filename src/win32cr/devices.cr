
module Win32cr::Devices
  extend self
  BUS1394_VIRTUAL_DEVICE_LIST_KEY = "Virtual Device List"
  BUS1394_LOCAL_HOST_INSTANCE_KEY = "LOCAL HOST EUI64"
  IOCTL_IEEE1394_API_REQUEST = 2229248_u32
  IEEE1394_API_ADD_VIRTUAL_DEVICE = 1_u32
  IEEE1394_API_REMOVE_VIRTUAL_DEVICE = 2_u32
  IEEE1394_API_DEVICE_ACCESS_TRANSFER = 3_u32
  IEEE1394_API_SET_LOCAL_NODE_PROPERTIES = 4_u32
  IEEE1394_REQUEST_FLAG_UNICODE = 1_u32
  IEEE1394_REQUEST_FLAG_PERSISTENT = 2_u32
  IEEE1394_REQUEST_FLAG_USE_LOCAL_HOST_EUI = 4_u32
  IEEE1394API_NOTIFICATION_DEVICE_ACCESS = 1_u32
  IEEE1394API_NOTIFICATION_BUS_RESET = 2_u32
  IEEE1394API_DEVICE_OWNERSHIP_LOCAL_NODE = 1_u32
  IEEE1394API_RESOURCE_OWNERSHIP_LOCAL_NODE = 2_u32
  IEEE1394API_DEVICE_OWNERSHIP_REMOTE_NODE = 4_u32
  IEEE1394API_RESOURCE_OWNERSHIP_REMOTE_NODE = 8_u32
  IEEE1394API_ACCESS_SHARED_READ = 16_u32
  IEEE1394API_ACCESS_SHARED_WRITE = 32_u32
  IEEE1394API_ACCESS_EXCLUSIVE = 64_u32
  IEEE1394API_REMOTE_ACCESS_TRANSFER_REQUEST = 1_u32
  IEEE1394API_BUS_RESET_LOCAL_NODE_IS_ROOT = 1_u32
  IEEE1394API_BUS_RESET_LOCAL_NODE_IS_IRM = 2_u32
  IEEE1394API_BUS_RESET_LOCAL_NODE_INITIATED = 4_u32


  @[Extern]
  struct IEEE1394_VDEV_PNP_REQUEST
    property fulFlags : UInt32
    property reserved : UInt32
    property instance_id : UInt64
    property device_id : UInt8
    def initialize(@fulFlags : UInt32, @reserved : UInt32, @instance_id : UInt64, @device_id : UInt8)
    end
  end

  @[Extern]
  struct IEEE1394_API_REQUEST
    property request_number : UInt32
    property flags : UInt32
    property u : U_e__union_

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property add_virtual_device : Win32cr::Devices::IEEE1394_VDEV_PNP_REQUEST
    property remove_virtual_device : Win32cr::Devices::IEEE1394_VDEV_PNP_REQUEST
    def initialize(@add_virtual_device : Win32cr::Devices::IEEE1394_VDEV_PNP_REQUEST, @remove_virtual_device : Win32cr::Devices::IEEE1394_VDEV_PNP_REQUEST)
    end
    end

    def initialize(@request_number : UInt32, @flags : UInt32, @u : U_e__union_)
    end
  end

end