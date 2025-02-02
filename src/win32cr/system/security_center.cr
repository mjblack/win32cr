require "./com.cr"
require "./../foundation.cr"
require "./threading.cr"

module Win32cr::System::SecurityCenter
  extend self

  CLSID_WSCProductList = LibC::GUID.new(0x17072f7b_u32, 0x9abe_u16, 0x4a74_u16, StaticArray[0xa2_u8, 0x61_u8, 0x1e_u8, 0xb7_u8, 0x6b_u8, 0x55_u8, 0x10_u8, 0x7a_u8])

  CLSID_WSCDefaultProduct = LibC::GUID.new(0x2981a36e_u32, 0xf22d_u16, 0x11e5_u16, StaticArray[0x9c_u8, 0xe9_u8, 0x5e_u8, 0x55_u8, 0x17_u8, 0x50_u8, 0x7c_u8, 0x66_u8])

  enum WSC_SECURITY_PRODUCT_SUBSTATUS
    WSC_SECURITY_PRODUCT_SUBSTATUS_NOT_SET = 0_i32
    WSC_SECURITY_PRODUCT_SUBSTATUS_NO_ACTION = 1_i32
    WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_RECOMMENDED = 2_i32
    WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_NEEDED = 3_i32
  end
  enum WSC_SECURITY_PRODUCT_STATE
    WSC_SECURITY_PRODUCT_STATE_ON = 0_i32
    WSC_SECURITY_PRODUCT_STATE_OFF = 1_i32
    WSC_SECURITY_PRODUCT_STATE_SNOOZED = 2_i32
    WSC_SECURITY_PRODUCT_STATE_EXPIRED = 3_i32
  end
  enum SECURITY_PRODUCT_TYPE
    SECURITY_PRODUCT_TYPE_ANTIVIRUS = 0_i32
    SECURITY_PRODUCT_TYPE_FIREWALL = 1_i32
    SECURITY_PRODUCT_TYPE_ANTISPYWARE = 2_i32
  end
  enum WSC_SECURITY_SIGNATURE_STATUS
    WSC_SECURITY_PRODUCT_OUT_OF_DATE = 0_i32
    WSC_SECURITY_PRODUCT_UP_TO_DATE = 1_i32
  end
  enum WSC_SECURITY_PROVIDER
    WSC_SECURITY_PROVIDER_FIREWALL = 1_i32
    WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS = 2_i32
    WSC_SECURITY_PROVIDER_ANTIVIRUS = 4_i32
    WSC_SECURITY_PROVIDER_ANTISPYWARE = 8_i32
    WSC_SECURITY_PROVIDER_INTERNET_SETTINGS = 16_i32
    WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL = 32_i32
    WSC_SECURITY_PROVIDER_SERVICE = 64_i32
    WSC_SECURITY_PROVIDER_NONE = 0_i32
    WSC_SECURITY_PROVIDER_ALL = 127_i32
  end
  enum WSC_SECURITY_PROVIDER_HEALTH
    WSC_SECURITY_PROVIDER_HEALTH_GOOD = 0_i32
    WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED = 1_i32
    WSC_SECURITY_PROVIDER_HEALTH_POOR = 2_i32
    WSC_SECURITY_PROVIDER_HEALTH_SNOOZE = 3_i32
  end

  @[Extern]
  record IWscProductVtbl,
    query_interface : Proc(IWscProduct*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWscProduct*, UInt32),
    release : Proc(IWscProduct*, UInt32),
    get_type_info_count : Proc(IWscProduct*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWscProduct*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWscProduct*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWscProduct*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ProductName : Proc(IWscProduct*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductState : Proc(IWscProduct*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_STATE*, Win32cr::Foundation::HRESULT),
    get_SignatureStatus : Proc(IWscProduct*, Win32cr::System::SecurityCenter::WSC_SECURITY_SIGNATURE_STATUS*, Win32cr::Foundation::HRESULT),
    get_RemediationPath : Proc(IWscProduct*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductStateTimestamp : Proc(IWscProduct*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductGuid : Proc(IWscProduct*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductIsDefault : Proc(IWscProduct*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWscProduct, lpVtbl : IWscProductVtbl* do
    GUID = LibC::GUID.new(0x8c38232e_u32, 0x3a45_u16, 0x4a27_u16, StaticArray[0x92_u8, 0xb0_u8, 0x1a_u8, 0x16_u8, 0xa9_u8, 0x75_u8, 0xf6_u8, 0x69_u8])
    def query_interface(this : IWscProduct*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWscProduct*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWscProduct*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWscProduct*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWscProduct*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWscProduct*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWscProduct*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ProductName(this : IWscProduct*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductName.call(this, pVal)
    end
    def get_ProductState(this : IWscProduct*, pVal : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductState.call(this, pVal)
    end
    def get_SignatureStatus(this : IWscProduct*, pVal : Win32cr::System::SecurityCenter::WSC_SECURITY_SIGNATURE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SignatureStatus.call(this, pVal)
    end
    def get_RemediationPath(this : IWscProduct*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemediationPath.call(this, pVal)
    end
    def get_ProductStateTimestamp(this : IWscProduct*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductStateTimestamp.call(this, pVal)
    end
    def get_ProductGuid(this : IWscProduct*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductGuid.call(this, pVal)
    end
    def get_ProductIsDefault(this : IWscProduct*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductIsDefault.call(this, pVal)
    end

  end

  @[Extern]
  record IWscProduct2Vtbl,
    query_interface : Proc(IWscProduct2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWscProduct2*, UInt32),
    release : Proc(IWscProduct2*, UInt32),
    get_type_info_count : Proc(IWscProduct2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWscProduct2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWscProduct2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWscProduct2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ProductName : Proc(IWscProduct2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductState : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_STATE*, Win32cr::Foundation::HRESULT),
    get_SignatureStatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_SIGNATURE_STATUS*, Win32cr::Foundation::HRESULT),
    get_RemediationPath : Proc(IWscProduct2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductStateTimestamp : Proc(IWscProduct2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductGuid : Proc(IWscProduct2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductIsDefault : Proc(IWscProduct2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_AntivirusScanSubstatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_AntivirusSettingsSubstatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_AntivirusProtectionUpdateSubstatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_FirewallDomainProfileSubstatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_FirewallPrivateProfileSubstatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_FirewallPublicProfileSubstatus : Proc(IWscProduct2*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWscProduct2, lpVtbl : IWscProduct2Vtbl* do
    GUID = LibC::GUID.new(0xf896ca54_u32, 0xfe09_u16, 0x4403_u16, StaticArray[0x86_u8, 0xd4_u8, 0x23_u8, 0xcb_u8, 0x48_u8, 0x8d_u8, 0x81_u8, 0xd8_u8])
    def query_interface(this : IWscProduct2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWscProduct2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWscProduct2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWscProduct2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWscProduct2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWscProduct2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWscProduct2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ProductName(this : IWscProduct2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductName.call(this, pVal)
    end
    def get_ProductState(this : IWscProduct2*, pVal : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductState.call(this, pVal)
    end
    def get_SignatureStatus(this : IWscProduct2*, pVal : Win32cr::System::SecurityCenter::WSC_SECURITY_SIGNATURE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SignatureStatus.call(this, pVal)
    end
    def get_RemediationPath(this : IWscProduct2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemediationPath.call(this, pVal)
    end
    def get_ProductStateTimestamp(this : IWscProduct2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductStateTimestamp.call(this, pVal)
    end
    def get_ProductGuid(this : IWscProduct2*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductGuid.call(this, pVal)
    end
    def get_ProductIsDefault(this : IWscProduct2*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductIsDefault.call(this, pVal)
    end
    def get_AntivirusScanSubstatus(this : IWscProduct2*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusScanSubstatus.call(this, peStatus)
    end
    def get_AntivirusSettingsSubstatus(this : IWscProduct2*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusSettingsSubstatus.call(this, peStatus)
    end
    def get_AntivirusProtectionUpdateSubstatus(this : IWscProduct2*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusProtectionUpdateSubstatus.call(this, peStatus)
    end
    def get_FirewallDomainProfileSubstatus(this : IWscProduct2*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallDomainProfileSubstatus.call(this, peStatus)
    end
    def get_FirewallPrivateProfileSubstatus(this : IWscProduct2*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallPrivateProfileSubstatus.call(this, peStatus)
    end
    def get_FirewallPublicProfileSubstatus(this : IWscProduct2*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallPublicProfileSubstatus.call(this, peStatus)
    end

  end

  @[Extern]
  record IWscProduct3Vtbl,
    query_interface : Proc(IWscProduct3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWscProduct3*, UInt32),
    release : Proc(IWscProduct3*, UInt32),
    get_type_info_count : Proc(IWscProduct3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWscProduct3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWscProduct3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWscProduct3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ProductName : Proc(IWscProduct3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductState : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_STATE*, Win32cr::Foundation::HRESULT),
    get_SignatureStatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_SIGNATURE_STATUS*, Win32cr::Foundation::HRESULT),
    get_RemediationPath : Proc(IWscProduct3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductStateTimestamp : Proc(IWscProduct3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductGuid : Proc(IWscProduct3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProductIsDefault : Proc(IWscProduct3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_AntivirusScanSubstatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_AntivirusSettingsSubstatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_AntivirusProtectionUpdateSubstatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_FirewallDomainProfileSubstatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_FirewallPrivateProfileSubstatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_FirewallPublicProfileSubstatus : Proc(IWscProduct3*, Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*, Win32cr::Foundation::HRESULT),
    get_AntivirusDaysUntilExpired : Proc(IWscProduct3*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWscProduct3, lpVtbl : IWscProduct3Vtbl* do
    GUID = LibC::GUID.new(0x55536524_u32, 0xd1d1_u16, 0x4726_u16, StaticArray[0x8c_u8, 0x7c_u8, 0x4_u8, 0x99_u8, 0x6a_u8, 0x19_u8, 0x4_u8, 0xe7_u8])
    def query_interface(this : IWscProduct3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWscProduct3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWscProduct3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWscProduct3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWscProduct3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWscProduct3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWscProduct3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ProductName(this : IWscProduct3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductName.call(this, pVal)
    end
    def get_ProductState(this : IWscProduct3*, pVal : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductState.call(this, pVal)
    end
    def get_SignatureStatus(this : IWscProduct3*, pVal : Win32cr::System::SecurityCenter::WSC_SECURITY_SIGNATURE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SignatureStatus.call(this, pVal)
    end
    def get_RemediationPath(this : IWscProduct3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemediationPath.call(this, pVal)
    end
    def get_ProductStateTimestamp(this : IWscProduct3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductStateTimestamp.call(this, pVal)
    end
    def get_ProductGuid(this : IWscProduct3*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductGuid.call(this, pVal)
    end
    def get_ProductIsDefault(this : IWscProduct3*, pVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProductIsDefault.call(this, pVal)
    end
    def get_AntivirusScanSubstatus(this : IWscProduct3*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusScanSubstatus.call(this, peStatus)
    end
    def get_AntivirusSettingsSubstatus(this : IWscProduct3*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusSettingsSubstatus.call(this, peStatus)
    end
    def get_AntivirusProtectionUpdateSubstatus(this : IWscProduct3*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusProtectionUpdateSubstatus.call(this, peStatus)
    end
    def get_FirewallDomainProfileSubstatus(this : IWscProduct3*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallDomainProfileSubstatus.call(this, peStatus)
    end
    def get_FirewallPrivateProfileSubstatus(this : IWscProduct3*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallPrivateProfileSubstatus.call(this, peStatus)
    end
    def get_FirewallPublicProfileSubstatus(this : IWscProduct3*, peStatus : Win32cr::System::SecurityCenter::WSC_SECURITY_PRODUCT_SUBSTATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirewallPublicProfileSubstatus.call(this, peStatus)
    end
    def get_AntivirusDaysUntilExpired(this : IWscProduct3*, pdwDays : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntivirusDaysUntilExpired.call(this, pdwDays)
    end

  end

  @[Extern]
  record IWSCProductListVtbl,
    query_interface : Proc(IWSCProductList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSCProductList*, UInt32),
    release : Proc(IWSCProductList*, UInt32),
    get_type_info_count : Proc(IWSCProductList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWSCProductList*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWSCProductList*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWSCProductList*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IWSCProductList*, Win32cr::System::SecurityCenter::WSC_SECURITY_PROVIDER, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IWSCProductList*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IWSCProductList*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSCProductList, lpVtbl : IWSCProductListVtbl* do
    GUID = LibC::GUID.new(0x722a338c_u32, 0x6e8e_u16, 0x4e72_u16, StaticArray[0xac_u8, 0x27_u8, 0x14_u8, 0x17_u8, 0xfb_u8, 0xc_u8, 0x81_u8, 0xc2_u8])
    def query_interface(this : IWSCProductList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSCProductList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSCProductList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWSCProductList*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWSCProductList*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWSCProductList*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWSCProductList*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def initialize__(this : IWSCProductList*, provider : Win32cr::System::SecurityCenter::WSC_SECURITY_PROVIDER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, provider)
    end
    def get_Count(this : IWSCProductList*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_Item(this : IWSCProductList*, index : UInt32, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, pVal)
    end

  end

  @[Extern]
  record IWSCDefaultProductVtbl,
    query_interface : Proc(IWSCDefaultProduct*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWSCDefaultProduct*, UInt32),
    release : Proc(IWSCDefaultProduct*, UInt32),
    get_type_info_count : Proc(IWSCDefaultProduct*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWSCDefaultProduct*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWSCDefaultProduct*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWSCDefaultProduct*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    set_default_product : Proc(IWSCDefaultProduct*, Win32cr::System::SecurityCenter::SECURITY_PRODUCT_TYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWSCDefaultProduct, lpVtbl : IWSCDefaultProductVtbl* do
    GUID = LibC::GUID.new(0x476d69c_u32, 0xf21a_u16, 0x11e5_u16, StaticArray[0x9c_u8, 0xe9_u8, 0x5e_u8, 0x55_u8, 0x17_u8, 0x50_u8, 0x7c_u8, 0x66_u8])
    def query_interface(this : IWSCDefaultProduct*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWSCDefaultProduct*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWSCDefaultProduct*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWSCDefaultProduct*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWSCDefaultProduct*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWSCDefaultProduct*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWSCDefaultProduct*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def set_default_product(this : IWSCDefaultProduct*, eType : Win32cr::System::SecurityCenter::SECURITY_PRODUCT_TYPE, pGuid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_product.call(this, eType, pGuid)
    end

  end

  def wscRegisterForChanges(reserved : Void*, phCallbackRegistration : Win32cr::Foundation::HANDLE*, lpCallbackAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.WscRegisterForChanges(reserved, phCallbackRegistration, lpCallbackAddress, pContext)
  end

  def wscUnRegisterChanges(hRegistrationHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.WscUnRegisterChanges(hRegistrationHandle)
  end

  def wscRegisterForUserNotifications : Win32cr::Foundation::HRESULT
    C.WscRegisterForUserNotifications
  end

  def wscGetSecurityProviderHealth(providers : UInt32, pHealth : Win32cr::System::SecurityCenter::WSC_SECURITY_PROVIDER_HEALTH*) : Win32cr::Foundation::HRESULT
    C.WscGetSecurityProviderHealth(providers, pHealth)
  end

  def wscQueryAntiMalwareUri : Win32cr::Foundation::HRESULT
    C.WscQueryAntiMalwareUri
  end

  def wscGetAntiMalwareUri(ppszUri : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.WscGetAntiMalwareUri(ppszUri)
  end

  @[Link("wscapi")]
  lib C
    # :nodoc:
    fun WscRegisterForChanges(reserved : Void*, phCallbackRegistration : Win32cr::Foundation::HANDLE*, lpCallbackAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WscUnRegisterChanges(hRegistrationHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WscRegisterForUserNotifications : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WscGetSecurityProviderHealth(providers : UInt32, pHealth : Win32cr::System::SecurityCenter::WSC_SECURITY_PROVIDER_HEALTH*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WscQueryAntiMalwareUri : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WscGetAntiMalwareUri(ppszUri : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

  end
end