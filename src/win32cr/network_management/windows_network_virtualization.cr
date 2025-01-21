require "./../networking/win_sock.cr"
require "./../foundation.cr"
require "./../system/io.cr"

module Win32cr::NetworkManagement::WindowsNetworkVirtualization
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
  record WNV_OBJECT_HEADER,
    major_version : UInt8,
    minor_version : UInt8,
    size : UInt32

  @[Extern]
  record WNV_NOTIFICATION_PARAM,
    header : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_OBJECT_HEADER,
    notification_type : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_NOTIFICATION_TYPE,
    pending_notifications : UInt32,
    buffer : UInt8*

  @[Extern]
  record WNV_IP_ADDRESS,
    ip : IP_e__Union_ do

    # Nested Type IP_e__Union_
    @[Extern(union: true)]
    record IP_e__Union_,
      v4 : Win32cr::Networking::WinSock::IN_ADDR,
      v6 : Win32cr::Networking::WinSock::IN6_ADDR,
      addr : UInt8[16]

  end

  @[Extern]
  record WNV_POLICY_MISMATCH_PARAM,
    ca_family : UInt16,
    pa_family : UInt16,
    virtual_subnet_id : UInt32,
    ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS,
    pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS

  @[Extern]
  record WNV_PROVIDER_ADDRESS_CHANGE_PARAM,
    pa_family : UInt16,
    pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS,
    address_state : Win32cr::Networking::WinSock::NL_DAD_STATE

  @[Extern]
  record WNV_CUSTOMER_ADDRESS_CHANGE_PARAM,
    mac_address : Win32cr::Networking::WinSock::DL_EUI48,
    ca_family : UInt16,
    ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS,
    virtual_subnet_id : UInt32,
    pa_family : UInt16,
    pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS,
    notification_reason : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_CA_NOTIFICATION_TYPE

  @[Extern]
  record WNV_OBJECT_CHANGE_PARAM,
    object_type : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_OBJECT_TYPE,
    object_param : ObjectParam_e__Union_ do

    # Nested Type ObjectParam_e__Union_
    @[Extern(union: true)]
    record ObjectParam_e__Union_,
      provider_address_change : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_PROVIDER_ADDRESS_CHANGE_PARAM,
      customer_address_change : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_CUSTOMER_ADDRESS_CHANGE_PARAM

  end

  @[Extern]
  record WNV_REDIRECT_PARAM,
    ca_family : UInt16,
    pa_family : UInt16,
    new_pa_family : UInt16,
    virtual_subnet_id : UInt32,
    ca : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS,
    pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS,
    new_pa : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_IP_ADDRESS

  @[Link("wnvapi")]
  lib C
    fun WnvOpen : Win32cr::Foundation::HANDLE

    fun WnvRequestNotification(wnv_handle : Win32cr::Foundation::HANDLE, notification_param : Win32cr::NetworkManagement::WindowsNetworkVirtualization::WNV_NOTIFICATION_PARAM*, overlapped : Win32cr::System::IO::OVERLAPPED*, bytes_transferred : UInt32*) : UInt32

  end
end