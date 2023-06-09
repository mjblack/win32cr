require "../system/com.cr"
require "../foundation.cr"
require "../system/threading.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wscapi.dll")]
{% else %}
@[Link("wscapi")]
{% end %}
lib LibWin32
  CLSID_WSCProductList = LibC::GUID.new(0x17072f7b_u32, 0x9abe_u16, 0x4a74_u16, StaticArray[0xa2_u8, 0x61_u8, 0x1e_u8, 0xb7_u8, 0x6b_u8, 0x55_u8, 0x10_u8, 0x7a_u8])
  CLSID_WSCDefaultProduct = LibC::GUID.new(0x2981a36e_u32, 0xf22d_u16, 0x11e5_u16, StaticArray[0x9c_u8, 0xe9_u8, 0x5e_u8, 0x55_u8, 0x17_u8, 0x50_u8, 0x7c_u8, 0x66_u8])


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
    get_product_name : Proc(IWscProduct*, UInt8**, HRESULT)
    get_product_state : Proc(IWscProduct*, WSC_SECURITY_PRODUCT_STATE*, HRESULT)
    get_signature_status : Proc(IWscProduct*, WSC_SECURITY_SIGNATURE_STATUS*, HRESULT)
    get_remediation_path : Proc(IWscProduct*, UInt8**, HRESULT)
    get_product_state_timestamp : Proc(IWscProduct*, UInt8**, HRESULT)
    get_product_guid : Proc(IWscProduct*, UInt8**, HRESULT)
    get_product_is_default : Proc(IWscProduct*, LibC::BOOL*, HRESULT)
  end

  IWscProduct_GUID = "8c38232e-3a45-4a27-92b0-1a16a975f669"
  IID_IWscProduct = LibC::GUID.new(0x8c38232e_u32, 0x3a45_u16, 0x4a27_u16, StaticArray[0x92_u8, 0xb0_u8, 0x1a_u8, 0x16_u8, 0xa9_u8, 0x75_u8, 0xf6_u8, 0x69_u8])
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
    get_product_name : Proc(IWscProduct2*, UInt8**, HRESULT)
    get_product_state : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_STATE*, HRESULT)
    get_signature_status : Proc(IWscProduct2*, WSC_SECURITY_SIGNATURE_STATUS*, HRESULT)
    get_remediation_path : Proc(IWscProduct2*, UInt8**, HRESULT)
    get_product_state_timestamp : Proc(IWscProduct2*, UInt8**, HRESULT)
    get_product_guid : Proc(IWscProduct2*, UInt8**, HRESULT)
    get_product_is_default : Proc(IWscProduct2*, LibC::BOOL*, HRESULT)
    get_antivirus_scan_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_settings_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_protection_update_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_domain_profile_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_private_profile_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_public_profile_substatus : Proc(IWscProduct2*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
  end

  IWscProduct2_GUID = "f896ca54-fe09-4403-86d4-23cb488d81d8"
  IID_IWscProduct2 = LibC::GUID.new(0xf896ca54_u32, 0xfe09_u16, 0x4403_u16, StaticArray[0x86_u8, 0xd4_u8, 0x23_u8, 0xcb_u8, 0x48_u8, 0x8d_u8, 0x81_u8, 0xd8_u8])
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
    get_product_name : Proc(IWscProduct3*, UInt8**, HRESULT)
    get_product_state : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_STATE*, HRESULT)
    get_signature_status : Proc(IWscProduct3*, WSC_SECURITY_SIGNATURE_STATUS*, HRESULT)
    get_remediation_path : Proc(IWscProduct3*, UInt8**, HRESULT)
    get_product_state_timestamp : Proc(IWscProduct3*, UInt8**, HRESULT)
    get_product_guid : Proc(IWscProduct3*, UInt8**, HRESULT)
    get_product_is_default : Proc(IWscProduct3*, LibC::BOOL*, HRESULT)
    get_antivirus_scan_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_settings_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_protection_update_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_domain_profile_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_private_profile_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_firewall_public_profile_substatus : Proc(IWscProduct3*, WSC_SECURITY_PRODUCT_SUBSTATUS*, HRESULT)
    get_antivirus_days_until_expired : Proc(IWscProduct3*, UInt32*, HRESULT)
  end

  IWscProduct3_GUID = "55536524-d1d1-4726-8c7c-04996a1904e7"
  IID_IWscProduct3 = LibC::GUID.new(0x55536524_u32, 0xd1d1_u16, 0x4726_u16, StaticArray[0x8c_u8, 0x7c_u8, 0x4_u8, 0x99_u8, 0x6a_u8, 0x19_u8, 0x4_u8, 0xe7_u8])
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

  IWSCProductList_GUID = "722a338c-6e8e-4e72-ac27-1417fb0c81c2"
  IID_IWSCProductList = LibC::GUID.new(0x722a338c_u32, 0x6e8e_u16, 0x4e72_u16, StaticArray[0xac_u8, 0x27_u8, 0x14_u8, 0x17_u8, 0xfb_u8, 0xc_u8, 0x81_u8, 0xc2_u8])
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
    set_default_product : Proc(IWSCDefaultProduct*, SECURITY_PRODUCT_TYPE, UInt8*, HRESULT)
  end

  IWSCDefaultProduct_GUID = "0476d69c-f21a-11e5-9ce9-5e5517507c66"
  IID_IWSCDefaultProduct = LibC::GUID.new(0x476d69c_u32, 0xf21a_u16, 0x11e5_u16, StaticArray[0x9c_u8, 0xe9_u8, 0x5e_u8, 0x55_u8, 0x17_u8, 0x50_u8, 0x7c_u8, 0x66_u8])
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
struct LibWin32::IWscProduct
  def query_interface(this : IWscProduct*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWscProduct*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWscProduct*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWscProduct*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWscProduct*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWscProduct*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWscProduct*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_product_name(this : IWscProduct*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_name.call(this, pval)
  end
  def get_product_state(this : IWscProduct*, pval : WSC_SECURITY_PRODUCT_STATE*) : HRESULT
    @lpVtbl.value.get_product_state.call(this, pval)
  end
  def get_signature_status(this : IWscProduct*, pval : WSC_SECURITY_SIGNATURE_STATUS*) : HRESULT
    @lpVtbl.value.get_signature_status.call(this, pval)
  end
  def get_remediation_path(this : IWscProduct*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_remediation_path.call(this, pval)
  end
  def get_product_state_timestamp(this : IWscProduct*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_state_timestamp.call(this, pval)
  end
  def get_product_guid(this : IWscProduct*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_guid.call(this, pval)
  end
  def get_product_is_default(this : IWscProduct*, pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_product_is_default.call(this, pval)
  end
end
struct LibWin32::IWscProduct2
  def query_interface(this : IWscProduct2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWscProduct2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWscProduct2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWscProduct2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWscProduct2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWscProduct2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWscProduct2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_product_name(this : IWscProduct2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_name.call(this, pval)
  end
  def get_product_state(this : IWscProduct2*, pval : WSC_SECURITY_PRODUCT_STATE*) : HRESULT
    @lpVtbl.value.get_product_state.call(this, pval)
  end
  def get_signature_status(this : IWscProduct2*, pval : WSC_SECURITY_SIGNATURE_STATUS*) : HRESULT
    @lpVtbl.value.get_signature_status.call(this, pval)
  end
  def get_remediation_path(this : IWscProduct2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_remediation_path.call(this, pval)
  end
  def get_product_state_timestamp(this : IWscProduct2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_state_timestamp.call(this, pval)
  end
  def get_product_guid(this : IWscProduct2*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_guid.call(this, pval)
  end
  def get_product_is_default(this : IWscProduct2*, pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_product_is_default.call(this, pval)
  end
  def get_antivirus_scan_substatus(this : IWscProduct2*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_antivirus_scan_substatus.call(this, pestatus)
  end
  def get_antivirus_settings_substatus(this : IWscProduct2*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_antivirus_settings_substatus.call(this, pestatus)
  end
  def get_antivirus_protection_update_substatus(this : IWscProduct2*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_antivirus_protection_update_substatus.call(this, pestatus)
  end
  def get_firewall_domain_profile_substatus(this : IWscProduct2*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_firewall_domain_profile_substatus.call(this, pestatus)
  end
  def get_firewall_private_profile_substatus(this : IWscProduct2*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_firewall_private_profile_substatus.call(this, pestatus)
  end
  def get_firewall_public_profile_substatus(this : IWscProduct2*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_firewall_public_profile_substatus.call(this, pestatus)
  end
end
struct LibWin32::IWscProduct3
  def query_interface(this : IWscProduct3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWscProduct3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWscProduct3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWscProduct3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWscProduct3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWscProduct3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWscProduct3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_product_name(this : IWscProduct3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_name.call(this, pval)
  end
  def get_product_state(this : IWscProduct3*, pval : WSC_SECURITY_PRODUCT_STATE*) : HRESULT
    @lpVtbl.value.get_product_state.call(this, pval)
  end
  def get_signature_status(this : IWscProduct3*, pval : WSC_SECURITY_SIGNATURE_STATUS*) : HRESULT
    @lpVtbl.value.get_signature_status.call(this, pval)
  end
  def get_remediation_path(this : IWscProduct3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_remediation_path.call(this, pval)
  end
  def get_product_state_timestamp(this : IWscProduct3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_state_timestamp.call(this, pval)
  end
  def get_product_guid(this : IWscProduct3*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_product_guid.call(this, pval)
  end
  def get_product_is_default(this : IWscProduct3*, pval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_product_is_default.call(this, pval)
  end
  def get_antivirus_scan_substatus(this : IWscProduct3*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_antivirus_scan_substatus.call(this, pestatus)
  end
  def get_antivirus_settings_substatus(this : IWscProduct3*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_antivirus_settings_substatus.call(this, pestatus)
  end
  def get_antivirus_protection_update_substatus(this : IWscProduct3*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_antivirus_protection_update_substatus.call(this, pestatus)
  end
  def get_firewall_domain_profile_substatus(this : IWscProduct3*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_firewall_domain_profile_substatus.call(this, pestatus)
  end
  def get_firewall_private_profile_substatus(this : IWscProduct3*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_firewall_private_profile_substatus.call(this, pestatus)
  end
  def get_firewall_public_profile_substatus(this : IWscProduct3*, pestatus : WSC_SECURITY_PRODUCT_SUBSTATUS*) : HRESULT
    @lpVtbl.value.get_firewall_public_profile_substatus.call(this, pestatus)
  end
  def get_antivirus_days_until_expired(this : IWscProduct3*, pdwdays : UInt32*) : HRESULT
    @lpVtbl.value.get_antivirus_days_until_expired.call(this, pdwdays)
  end
end
struct LibWin32::IWSCProductList
  def query_interface(this : IWSCProductList*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSCProductList*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSCProductList*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWSCProductList*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWSCProductList*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWSCProductList*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWSCProductList*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def initialize(this : IWSCProductList*, provider : WSC_SECURITY_PROVIDER) : HRESULT
    @lpVtbl.value.initialize.call(this, provider)
  end
  def get_count(this : IWSCProductList*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_item(this : IWSCProductList*, index : UInt32, pval : IWscProduct*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, pval)
  end
end
struct LibWin32::IWSCDefaultProduct
  def query_interface(this : IWSCDefaultProduct*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWSCDefaultProduct*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWSCDefaultProduct*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWSCDefaultProduct*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWSCDefaultProduct*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWSCDefaultProduct*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWSCDefaultProduct*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def set_default_product(this : IWSCDefaultProduct*, etype : SECURITY_PRODUCT_TYPE, pguid : UInt8*) : HRESULT
    @lpVtbl.value.set_default_product.call(this, etype, pguid)
  end
end
