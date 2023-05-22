require "../system/com.cr"
require "../foundation.cr"
require "../system/threading.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wscapi.dll")]
lib LibWin32
  WSCProductList = LibC::GUID.new(0x17072f7b_u32, 0x9abe_u16, 0x4a74_u16, StaticArray[0xa2_u8, 0x61_u8, 0x1e_u8, 0xb7_u8, 0x6b_u8, 0x55_u8, 0x10_u8, 0x7a_u8])
  WSCDefaultProduct = LibC::GUID.new(0x2981a36e_u32, 0xf22d_u16, 0x11e5_u16, StaticArray[0x9c_u8, 0xe9_u8, 0x5e_u8, 0x55_u8, 0x17_u8, 0x50_u8, 0x7c_u8, 0x66_u8])


  enum WSC_SECURITY_PRODUCT_SUBSTATUS : Int32
    WSC_SECURITY_PRODUCT_SUBSTATUS_NOT_SET = 0
    WSC_SECURITY_PRODUCT_SUBSTATUS_NO_ACTION = 1
    WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_RECOMMENDED = 2
    WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_NEEDED = 3
  end

  enum WSC_SECURITY_PRODUCT_STATE : Int32
    WSC_SECURITY_PRODUCT_STATE_ON = 0
    WSC_SECURITY_PRODUCT_STATE_OFF = 1
    WSC_SECURITY_PRODUCT_STATE_SNOOZED = 2
    WSC_SECURITY_PRODUCT_STATE_EXPIRED = 3
  end

  enum SECURITY_PRODUCT_TYPE : Int32
    SECURITY_PRODUCT_TYPE_ANTIVIRUS = 0
    SECURITY_PRODUCT_TYPE_FIREWALL = 1
    SECURITY_PRODUCT_TYPE_ANTISPYWARE = 2
  end

  enum WSC_SECURITY_SIGNATURE_STATUS : Int32
    WSC_SECURITY_PRODUCT_OUT_OF_DATE = 0
    WSC_SECURITY_PRODUCT_UP_TO_DATE = 1
  end

  enum WSC_SECURITY_PROVIDER : Int32
    WSC_SECURITY_PROVIDER_FIREWALL = 1
    WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS = 2
    WSC_SECURITY_PROVIDER_ANTIVIRUS = 4
    WSC_SECURITY_PROVIDER_ANTISPYWARE = 8
    WSC_SECURITY_PROVIDER_INTERNET_SETTINGS = 16
    WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL = 32
    WSC_SECURITY_PROVIDER_SERVICE = 64
    WSC_SECURITY_PROVIDER_NONE = 0
    WSC_SECURITY_PROVIDER_ALL = 127
  end

  enum WSC_SECURITY_PROVIDER_HEALTH : Int32
    WSC_SECURITY_PROVIDER_HEALTH_GOOD = 0
    WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED = 1
    WSC_SECURITY_PROVIDER_HEALTH_POOR = 2
    WSC_SECURITY_PROVIDER_HEALTH_SNOOZE = 3
  end


  struct IWscProductVTbl
    query_interface : Proc(IWscProduct*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWscProduct*, UInt32)
    release : Proc(IWscProduct*, UInt32)
    get_type_info_count : Proc(IWscProduct*, UInt32*, HRESULT)
    get_type_info : Proc(IWscProduct*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWscProduct*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWscProduct*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_product_name : Proc(IWscProduct*, UInt8*, HRESULT)
    get_product_state : Proc(IWscProduct*, WSC_SECURITY_PRODUCT_STATE*, HRESULT)
    get_signature_status : Proc(IWscProduct*, WSC_SECURITY_SIGNATURE_STATUS*, HRESULT)
    get_remediation_path : Proc(IWscProduct*, UInt8*, HRESULT)
    get_product_state_timestamp : Proc(IWscProduct*, UInt8*, HRESULT)
    get_product_guid : Proc(IWscProduct*, UInt8*, HRESULT)
    get_product_is_default : Proc(IWscProduct*, LibC::BOOL*, HRESULT)
  end

  struct IWscProduct
    lpVtbl : IWscProductVTbl*
  end

  struct IWscProduct2VTbl
    query_interface : Proc(IWscProduct2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWscProduct2*, UInt32)
    release : Proc(IWscProduct2*, UInt32)
    get_type_info_count : Proc(IWscProduct2*, UInt32*, HRESULT)
    get_type_info : Proc(IWscProduct2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWscProduct2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWscProduct2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_product_name : Proc(IWscProduct2*, UInt8*, HRESULT)
    get_product_state : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_STATE*, HRESULT)
    get_signature_status : Proc(IWscProduct2*, WSC_SECURITY_SIGNATURE_STATUS*, HRESULT)
    get_remediation_path : Proc(IWscProduct2*, UInt8*, HRESULT)
    get_product_state_timestamp : Proc(IWscProduct2*, UInt8*, HRESULT)
    get_product_guid : Proc(IWscProduct2*, UInt8*, HRESULT)
    get_product_is_default : Proc(IWscProduct2*, LibC::BOOL*, HRESULT)
    get_antivirus_scan_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_settings_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_protection_update_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_domain_profile_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_private_profile_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_public_profile_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
  end

  struct IWscProduct2
    lpVtbl : IWscProduct2VTbl*
  end

  struct IWscProduct3VTbl
    query_interface : Proc(IWscProduct3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWscProduct3*, UInt32)
    release : Proc(IWscProduct3*, UInt32)
    get_type_info_count : Proc(IWscProduct3*, UInt32*, HRESULT)
    get_type_info : Proc(IWscProduct3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWscProduct3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWscProduct3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_product_name : Proc(IWscProduct3*, UInt8*, HRESULT)
    get_product_state : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_STATE*, HRESULT)
    get_signature_status : Proc(IWscProduct3*, WSC_SECURITY_SIGNATURE_STATUS*, HRESULT)
    get_remediation_path : Proc(IWscProduct3*, UInt8*, HRESULT)
    get_product_state_timestamp : Proc(IWscProduct3*, UInt8*, HRESULT)
    get_product_guid : Proc(IWscProduct3*, UInt8*, HRESULT)
    get_product_is_default : Proc(IWscProduct3*, LibC::BOOL*, HRESULT)
    get_antivirus_scan_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_settings_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_protection_update_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_domain_profile_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_private_profile_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_public_profile_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_days_until_expired : Proc(IWscProduct3*, UInt32*, HRESULT)
  end

  struct IWscProduct3
    lpVtbl : IWscProduct3VTbl*
  end

  struct IWSCProductListVTbl
    query_interface : Proc(IWSCProductList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSCProductList*, UInt32)
    release : Proc(IWSCProductList*, UInt32)
    get_type_info_count : Proc(IWSCProductList*, UInt32*, HRESULT)
    get_type_info : Proc(IWSCProductList*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWSCProductList*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWSCProductList*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IWSCProductList*, WSC_SECURITY_PROVIDER, HRESULT)
    get_count : Proc(IWSCProductList*, Int32*, HRESULT)
    get_item : Proc(IWSCProductList*, UInt32, IWscProduct*, HRESULT)
  end

  struct IWSCProductList
    lpVtbl : IWSCProductListVTbl*
  end

  struct IWSCDefaultProductVTbl
    query_interface : Proc(IWSCDefaultProduct*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWSCDefaultProduct*, UInt32)
    release : Proc(IWSCDefaultProduct*, UInt32)
    get_type_info_count : Proc(IWSCDefaultProduct*, UInt32*, HRESULT)
    get_type_info : Proc(IWSCDefaultProduct*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWSCDefaultProduct*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWSCDefaultProduct*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    set_default_product : Proc(IWSCDefaultProduct*, SECURITY_PRODUCT_TYPE, UInt8, HRESULT)
  end

  struct IWSCDefaultProduct
    lpVtbl : IWSCDefaultProductVTbl*
  end


  # Params # reserved : Void* [In],phcallbackregistration : LibC::HANDLE* [In],lpcallbackaddress : LPTHREAD_START_ROUTINE [In],pcontext : Void* [In]
  fun WscRegisterForChanges(reserved : Void*, phcallbackregistration : LibC::HANDLE*, lpcallbackaddress : LPTHREAD_START_ROUTINE, pcontext : Void*) : HRESULT

  # Params # hregistrationhandle : LibC::HANDLE [In]
  fun WscUnRegisterChanges(hregistrationhandle : LibC::HANDLE) : HRESULT

  # Params # 
  fun WscRegisterForUserNotifications : HRESULT

  # Params # providers : UInt32 [In],phealth : WSC_SECURITY_PROVIDER_HEALTH* [In]
  fun WscGetSecurityProviderHealth(providers : UInt32, phealth : WSC_SECURITY_PROVIDER_HEALTH*) : HRESULT

  # Params # 
  fun WscQueryAntiMalwareUri : HRESULT

  # Params # ppszuri : LibC::LPWSTR* [In]
  fun WscGetAntiMalwareUri(ppszuri : LibC::LPWSTR*) : HRESULT
end
