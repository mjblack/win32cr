require "../networking/winsock.cr"
require "../networkmanagement/windowsfilteringplatform.cr"
require "../foundation.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wnvapi.dll")]
lib LibWin32
  WNV_API_MAJOR_VERSION_1 = 1_u32
  WNV_API_MINOR_VERSION_0 = 0_u32


  enum WNV_NOTIFICATION_TYPE : Int32
    WnvPolicyMismatchType = 0
    WnvRedirectType = 1
    WnvObjectChangeType = 2
    WnvNotificationTypeMax = 3
  end

  enum WNV_OBJECT_TYPE : Int32
    WnvProviderAddressType = 0
    WnvCustomerAddressType = 1
    WnvObjectTypeMax = 2
  end

  enum WNV_CA_NOTIFICATION_TYPE : Int32
    WnvCustomerAddressAdded = 0
    WnvCustomerAddressDeleted = 1
    WnvCustomerAddressMoved = 2
    WnvCustomerAddressMax = 3
  end

  union WNV_IP_ADDRESS_IP_e__Union
    v4 : IN_ADDR
    v6 : IN6_ADDR
    addr : UInt8[16]*
  end
  union WNV_OBJECT_CHANGE_PARAM_ObjectParam_e__Union
    provider_address_change : WNV_PROVIDER_ADDRESS_CHANGE_PARAM
    customer_address_change : WNV_CUSTOMER_ADDRESS_CHANGE_PARAM
  end

  struct WNV_OBJECT_HEADER
    major_version : UInt8
    minor_version : UInt8
    size : UInt32
  end
  struct WNV_NOTIFICATION_PARAM
    header : WNV_OBJECT_HEADER
    notification_type : WNV_NOTIFICATION_TYPE
    pending_notifications : UInt32
    buffer : UInt8*
  end
  struct WNV_IP_ADDRESS
    ip : WNV_IP_ADDRESS_IP_e__Union
  end
  struct WNV_POLICY_MISMATCH_PARAM
    ca_family : UInt16
    pa_family : UInt16
    virtual_subnet_id : UInt32
    ca : WNV_IP_ADDRESS
    pa : WNV_IP_ADDRESS
  end
  struct WNV_PROVIDER_ADDRESS_CHANGE_PARAM
    pa_family : UInt16
    pa : WNV_IP_ADDRESS
    address_state : NL_DAD_STATE
  end
  struct WNV_CUSTOMER_ADDRESS_CHANGE_PARAM
    mac_address : DL_EUI48
    ca_family : UInt16
    ca : WNV_IP_ADDRESS
    virtual_subnet_id : UInt32
    pa_family : UInt16
    pa : WNV_IP_ADDRESS
    notification_reason : WNV_CA_NOTIFICATION_TYPE
  end
  struct WNV_OBJECT_CHANGE_PARAM
    object_type : WNV_OBJECT_TYPE
    object_param : WNV_OBJECT_CHANGE_PARAM_ObjectParam_e__Union
  end
  struct WNV_REDIRECT_PARAM
    ca_family : UInt16
    pa_family : UInt16
    new_pa_family : UInt16
    virtual_subnet_id : UInt32
    ca : WNV_IP_ADDRESS
    pa : WNV_IP_ADDRESS
    new_pa : WNV_IP_ADDRESS
  end


  # Params # 
  fun WnvOpen : LibC::HANDLE

  # Params # wnvhandle : LibC::HANDLE [In],notificationparam : WNV_NOTIFICATION_PARAM* [In],overlapped : OVERLAPPED* [In],bytestransferred : UInt32* [In]
  fun WnvRequestNotification(wnvhandle : LibC::HANDLE, notificationparam : WNV_NOTIFICATION_PARAM*, overlapped : OVERLAPPED*, bytestransferred : UInt32*) : UInt32
end
