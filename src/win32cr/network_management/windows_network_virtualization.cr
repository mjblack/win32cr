require "./../networking/win_sock.cr"
require "./../foundation.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::WindowsNetworkVirtualization
  extend self
  WNV_API_MAJOR_VERSION_1 = 1_u32
  WNV_API_MINOR_VERSION_0 = 0_u32

  enum WNV_NOTIFICATION_TYPE
    WnvPolicyMismatchType = 0_i32
    WnvRedirectType = 1_i32
    WnvObjectChangeType = 2_i32
    WnvNotificationTypeMax = 3_i32
  end
  enum WNV_OBJECT_TYPE
    WnvProviderAddressType = 0_i32
    WnvCustomerAddressType = 1_i32
    WnvObjectTypeMax = 2_i32
  end
  enum WNV_CA_NOTIFICATION_TYPE
    WnvCustomerAddressAdded = 0_i32
    WnvCustomerAddressDeleted = 1_i32
    WnvCustomerAddressMoved = 2_i32
    WnvCustomerAddressMax = 3_i32
  end

  @[Extern]
  struct WNV_OBJECT_HEADER
    property major_version : UInt8
    property minor_version : UInt8
    property size : UInt32
    def initialize(@major_version : UInt8, @minor_version : UInt8, @size : UInt32)
    end
  end

  @[Extern]
  struct WNV_NOTIFICATION_PARAM
    property header : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_OBJECT_HEADER
    property notification_type : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_NOTIFICATION_TYPE
    property pending_notifications : UInt32
    property buffer : UInt8*
    def initialize(@header : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_OBJECT_HEADER, @notification_type : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_NOTIFICATION_TYPE, @pending_notifications : UInt32, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct WNV_IP_ADDRESS
    property ip : IP_e__Union_

    # Nested Type IP_e__Union_
    @[Extern(union: true)]
    struct IP_e__Union_
    property v4 : Win32cr::Networking::WinSock::IN_ADDR
    property v6 : Win32cr::Networking::WinSock::IN6_ADDR
    property addr : UInt8[16]
    def initialize(@v4 : Win32cr::Networking::WinSock::IN_ADDR, @v6 : Win32cr::Networking::WinSock::IN6_ADDR, @addr : UInt8[16])
    end
    end

    def initialize(@ip : IP_e__Union_)
    end
  end

  @[Extern]
  struct WNV_POLICY_MISMATCH_PARAM
    property ca_family : UInt16
    property pa_family : UInt16
    property virtual_subnet_id : UInt32
    property ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    property pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    def initialize(@ca_family : UInt16, @pa_family : UInt16, @virtual_subnet_id : UInt32, @ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS, @pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS)
    end
  end

  @[Extern]
  struct WNV_PROVIDER_ADDRESS_CHANGE_PARAM
    property pa_family : UInt16
    property pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    property address_state : Win32cr::Networking::WinSock::NL_DAD_STATE
    def initialize(@pa_family : UInt16, @pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS, @address_state : Win32cr::Networking::WinSock::NL_DAD_STATE)
    end
  end

  @[Extern]
  struct WNV_CUSTOMER_ADDRESS_CHANGE_PARAM
    property mac_address : Win32cr::Networking::WinSock::DL_EUI48
    property ca_family : UInt16
    property ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    property virtual_subnet_id : UInt32
    property pa_family : UInt16
    property pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    property notification_reason : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_CA_NOTIFICATION_TYPE
    def initialize(@mac_address : Win32cr::Networking::WinSock::DL_EUI48, @ca_family : UInt16, @ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS, @virtual_subnet_id : UInt32, @pa_family : UInt16, @pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS, @notification_reason : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_CA_NOTIFICATION_TYPE)
    end
  end

  @[Extern]
  struct WNV_OBJECT_CHANGE_PARAM
    property object_type : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_OBJECT_TYPE
    property object_param : ObjectParam_e__Union_

    # Nested Type ObjectParam_e__Union_
    @[Extern(union: true)]
    struct ObjectParam_e__Union_
    property provider_address_change : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_PROVIDER_ADDRESS_CHANGE_PARAM
    property customer_address_change : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_CUSTOMER_ADDRESS_CHANGE_PARAM
    def initialize(@provider_address_change : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_PROVIDER_ADDRESS_CHANGE_PARAM, @customer_address_change : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_CUSTOMER_ADDRESS_CHANGE_PARAM)
    end
    end

    def initialize(@object_type : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_OBJECT_TYPE, @object_param : ObjectParam_e__Union_)
    end
  end

  @[Extern]
  struct WNV_REDIRECT_PARAM
    property ca_family : UInt16
    property pa_family : UInt16
    property new_pa_family : UInt16
    property virtual_subnet_id : UInt32
    property ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    property pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    property new_pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS
    def initialize(@ca_family : UInt16, @pa_family : UInt16, @new_pa_family : UInt16, @virtual_subnet_id : UInt32, @ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS, @pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS, @new_pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS)
    end
  end

  def wnvOpen : Win32cr::Foundation::HANDLE
    C.WnvOpen
  end

  def wnvRequestNotification(wnv_handle : Win32cr::Foundation::HANDLE, notification_param : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_NOTIFICATION_PARAM*, overlapped : Win32cr::System::IO::OVERLAPPED*, bytes_transferred : UInt32*) : UInt32
    C.WnvRequestNotification(wnv_handle, notification_param, overlapped, bytes_transferred)
  end

  @[Link("wnvapi")]
  lib C
    # :nodoc:
    fun WnvOpen : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun WnvRequestNotification(wnv_handle : Win32cr::Foundation::HANDLE, notification_param : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_NOTIFICATION_PARAM*, overlapped : Win32cr::System::IO::OVERLAPPED*, bytes_transferred : UInt32*) : UInt32

  end
end