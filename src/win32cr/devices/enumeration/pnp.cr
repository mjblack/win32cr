require "./../../foundation.cr"
require "./../../security.cr"
require "./../../system/com.cr"
require "./../properties.cr"

module Win32cr::Devices::Enumeration::Pnp
  alias HSWDEVICE = LibC::IntPtrT
  alias SW_DEVICE_CREATE_CALLBACK = Proc(Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, Win32cr::Foundation::HRESULT, Void*, Win32cr::Foundation::PWSTR, Void)

  UPNP_E_ROOT_ELEMENT_EXPECTED = -2147220992_i32
  UPNP_E_DEVICE_ELEMENT_EXPECTED = -2147220991_i32
  UPNP_E_SERVICE_ELEMENT_EXPECTED = -2147220990_i32
  UPNP_E_SERVICE_NODE_INCOMPLETE = -2147220989_i32
  UPNP_E_DEVICE_NODE_INCOMPLETE = -2147220988_i32
  UPNP_E_ICON_ELEMENT_EXPECTED = -2147220987_i32
  UPNP_E_ICON_NODE_INCOMPLETE = -2147220986_i32
  UPNP_E_INVALID_ACTION = -2147220985_i32
  UPNP_E_INVALID_ARGUMENTS = -2147220984_i32
  UPNP_E_OUT_OF_SYNC = -2147220983_i32
  UPNP_E_ACTION_REQUEST_FAILED = -2147220976_i32
  UPNP_E_TRANSPORT_ERROR = -2147220975_i32
  UPNP_E_VARIABLE_VALUE_UNKNOWN = -2147220974_i32
  UPNP_E_INVALID_VARIABLE = -2147220973_i32
  UPNP_E_DEVICE_ERROR = -2147220972_i32
  UPNP_E_PROTOCOL_ERROR = -2147220971_i32
  UPNP_E_ERROR_PROCESSING_RESPONSE = -2147220970_i32
  UPNP_E_DEVICE_TIMEOUT = -2147220969_i32
  UPNP_E_INVALID_DOCUMENT = -2147220224_i32
  UPNP_E_EVENT_SUBSCRIPTION_FAILED = -2147220223_i32
  FAULT_INVALID_ACTION = 401_u32
  FAULT_INVALID_ARG = 402_u32
  FAULT_INVALID_SEQUENCE_NUMBER = 403_u32
  FAULT_INVALID_VARIABLE = 404_u32
  FAULT_DEVICE_INTERNAL_ERROR = 501_u32
  FAULT_ACTION_SPECIFIC_BASE = 600_u32
  FAULT_ACTION_SPECIFIC_MAX = 899_u32
  UPNP_E_ACTION_SPECIFIC_BASE = -2147220736_i32
  UPNP_ADDRESSFAMILY_IPv4 = 1_u32
  UPNP_ADDRESSFAMILY_IPv6 = 2_u32
  UPNP_ADDRESSFAMILY_BOTH = 3_u32
  UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION = 1_u32
  UPNP_E_REQUIRED_ELEMENT_ERROR = -2147180512_i32
  UPNP_E_DUPLICATE_NOT_ALLOWED = -2147180511_i32
  UPNP_E_DUPLICATE_SERVICE_ID = -2147180510_i32
  UPNP_E_INVALID_DESCRIPTION = -2147180509_i32
  UPNP_E_INVALID_SERVICE = -2147180508_i32
  UPNP_E_INVALID_ICON = -2147180507_i32
  UPNP_E_INVALID_XML = -2147180506_i32
  UPNP_E_INVALID_ROOT_NAMESPACE = -2147180505_i32
  UPNP_E_SUFFIX_TOO_LONG = -2147180504_i32
  UPNP_E_URLBASE_PRESENT = -2147180503_i32
  UPNP_E_VALUE_TOO_LONG = -2147180496_i32
  UPNP_E_DEVICE_RUNNING = -2147180495_i32
  UPNP_E_DEVICE_NOTREGISTERED = -2147180494_i32
  REMOTE_ADDRESS_VALUE_NAME = "RemoteAddress"
  ADDRESS_FAMILY_VALUE_NAME = "AddressFamily"

  CLSID_UPnPDeviceFinder = LibC::GUID.new(0xe2085f28_u32, 0xfeb7_u16, 0x404a_u16, StaticArray[0xb8_u8, 0xe7_u8, 0xe6_u8, 0x59_u8, 0xbd_u8, 0xea_u8, 0xaa_u8, 0x2_u8])

  CLSID_UPnPDevices = LibC::GUID.new(0xb9e84ffd_u32, 0xad3c_u16, 0x40a4_u16, StaticArray[0xb8_u8, 0x35_u8, 0x8_u8, 0x82_u8, 0xeb_u8, 0xcb_u8, 0xaa_u8, 0xa8_u8])

  CLSID_UPnPDevice = LibC::GUID.new(0xa32552c5_u32, 0xba61_u16, 0x457a_u16, StaticArray[0xb5_u8, 0x9a_u8, 0xa2_u8, 0x56_u8, 0x1e_u8, 0x12_u8, 0x5e_u8, 0x33_u8])

  CLSID_UPnPServices = LibC::GUID.new(0xc0bc4b4a_u32, 0xa406_u16, 0x4efc_u16, StaticArray[0x93_u8, 0x2f_u8, 0xb8_u8, 0x54_u8, 0x6b_u8, 0x81_u8, 0x0_u8, 0xcc_u8])

  CLSID_UPnPService = LibC::GUID.new(0xc624ba95_u32, 0xfbcb_u16, 0x4409_u16, StaticArray[0x8c_u8, 0x3_u8, 0x8c_u8, 0xce_u8, 0xec_u8, 0x53_u8, 0x3e_u8, 0xf1_u8])

  CLSID_UPnPDescriptionDocument = LibC::GUID.new(0x1d8a9b47_u32, 0x3a28_u16, 0x4ce2_u16, StaticArray[0x8a_u8, 0x4b_u8, 0xbd_u8, 0x34_u8, 0xe4_u8, 0x5b_u8, 0xce_u8, 0xeb_u8])

  CLSID_UPnPDeviceFinderEx = LibC::GUID.new(0x181b54fc_u32, 0x380b_u16, 0x4a75_u16, StaticArray[0xb3_u8, 0xf1_u8, 0x4a_u8, 0xc4_u8, 0x5e_u8, 0x96_u8, 0x5_u8, 0xb0_u8])

  CLSID_UPnPDescriptionDocumentEx = LibC::GUID.new(0x33fd0563_u32, 0xd81a_u16, 0x4393_u16, StaticArray[0x83_u8, 0xcc_u8, 0x1_u8, 0x95_u8, 0xb1_u8, 0xda_u8, 0x2f_u8, 0x91_u8])

  CLSID_UPnPRegistrar = LibC::GUID.new(0x204810b9_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])

  CLSID_UPnPRemoteEndpointInfo = LibC::GUID.new(0x2e5e84e9_u32, 0x4049_u16, 0x4244_u16, StaticArray[0xb7_u8, 0x28_u8, 0x2d_u8, 0x24_u8, 0x22_u8, 0x71_u8, 0x57_u8, 0xc7_u8])

  enum SW_DEVICE_CAPABILITIES
    SWDeviceCapabilitiesNone = 0_i32
    SWDeviceCapabilitiesRemovable = 1_i32
    SWDeviceCapabilitiesSilentInstall = 2_i32
    SWDeviceCapabilitiesNoDisplayInUI = 4_i32
    SWDeviceCapabilitiesDriverRequired = 8_i32
  end
  enum SW_DEVICE_LIFETIME
    SWDeviceLifetimeHandle = 0_i32
    SWDeviceLifetimeParentPresent = 1_i32
    SWDeviceLifetimeMax = 2_i32
  end

  @[Extern]
  struct SW_DEVICE_CREATE_INFO
    property cbSize : UInt32
    property pszInstanceId : Win32cr::Foundation::PWSTR
    property pszzHardwareIds : Win32cr::Foundation::PWSTR
    property pszzCompatibleIds : Win32cr::Foundation::PWSTR
    property pContainerId : LibC::GUID*
    property capability_flags : UInt32
    property pszDeviceDescription : Win32cr::Foundation::PWSTR
    property pszDeviceLocation : Win32cr::Foundation::PWSTR
    property pSecurityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*
    def initialize(@cbSize : UInt32, @pszInstanceId : Win32cr::Foundation::PWSTR, @pszzHardwareIds : Win32cr::Foundation::PWSTR, @pszzCompatibleIds : Win32cr::Foundation::PWSTR, @pContainerId : LibC::GUID*, @capability_flags : UInt32, @pszDeviceDescription : Win32cr::Foundation::PWSTR, @pszDeviceLocation : Win32cr::Foundation::PWSTR, @pSecurityDescriptor : Win32cr::Security::SECURITY_DESCRIPTOR*)
    end
  end

  @[Extern]
  record IUPnPDeviceFinderVtbl,
    query_interface : Proc(IUPnPDeviceFinder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceFinder*, UInt32),
    release : Proc(IUPnPDeviceFinder*, UInt32),
    get_type_info_count : Proc(IUPnPDeviceFinder*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPDeviceFinder*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPDeviceFinder*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPDeviceFinder*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    find_by_type : Proc(IUPnPDeviceFinder*, Win32cr::Foundation::BSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_async_find : Proc(IUPnPDeviceFinder*, Win32cr::Foundation::BSTR, UInt32, Void*, Int32*, Win32cr::Foundation::HRESULT),
    start_async_find : Proc(IUPnPDeviceFinder*, Int32, Win32cr::Foundation::HRESULT),
    cancel_async_find : Proc(IUPnPDeviceFinder*, Int32, Win32cr::Foundation::HRESULT),
    find_by_udn : Proc(IUPnPDeviceFinder*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceFinder, lpVtbl : IUPnPDeviceFinderVtbl* do
    GUID = LibC::GUID.new(0xadda3d55_u32, 0x6f72_u16, 0x4319_u16, StaticArray[0xbf_u8, 0xf9_u8, 0x18_u8, 0x60_u8, 0xa_u8, 0x53_u8, 0x9b_u8, 0x10_u8])
    def query_interface(this : IUPnPDeviceFinder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceFinder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceFinder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPDeviceFinder*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPDeviceFinder*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPDeviceFinder*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPDeviceFinder*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def find_by_type(this : IUPnPDeviceFinder*, bstrTypeURI : Win32cr::Foundation::BSTR, dwFlags : UInt32, pDevices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_by_type.call(this, bstrTypeURI, dwFlags, pDevices)
    end
    def create_async_find(this : IUPnPDeviceFinder*, bstrTypeURI : Win32cr::Foundation::BSTR, dwFlags : UInt32, punkDeviceFinderCallback : Void*, plFindData : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_async_find.call(this, bstrTypeURI, dwFlags, punkDeviceFinderCallback, plFindData)
    end
    def start_async_find(this : IUPnPDeviceFinder*, lFindData : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_async_find.call(this, lFindData)
    end
    def cancel_async_find(this : IUPnPDeviceFinder*, lFindData : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_async_find.call(this, lFindData)
    end
    def find_by_udn(this : IUPnPDeviceFinder*, bstrUDN : Win32cr::Foundation::BSTR, pDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_by_udn.call(this, bstrUDN, pDevice)
    end

  end

  @[Extern]
  record IUPnPAddressFamilyControlVtbl,
    query_interface : Proc(IUPnPAddressFamilyControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPAddressFamilyControl*, UInt32),
    release : Proc(IUPnPAddressFamilyControl*, UInt32),
    set_address_family : Proc(IUPnPAddressFamilyControl*, Int32, Win32cr::Foundation::HRESULT),
    get_address_family : Proc(IUPnPAddressFamilyControl*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPAddressFamilyControl, lpVtbl : IUPnPAddressFamilyControlVtbl* do
    GUID = LibC::GUID.new(0xe3bf6178_u32, 0x694e_u16, 0x459f_u16, StaticArray[0xa5_u8, 0xa6_u8, 0x19_u8, 0x1e_u8, 0xa0_u8, 0xff_u8, 0xa1_u8, 0xc7_u8])
    def query_interface(this : IUPnPAddressFamilyControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPAddressFamilyControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPAddressFamilyControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_address_family(this : IUPnPAddressFamilyControl*, dwFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_address_family.call(this, dwFlags)
    end
    def get_address_family(this : IUPnPAddressFamilyControl*, pdwFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_address_family.call(this, pdwFlags)
    end

  end

  @[Extern]
  record IUPnPHttpHeaderControlVtbl,
    query_interface : Proc(IUPnPHttpHeaderControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPHttpHeaderControl*, UInt32),
    release : Proc(IUPnPHttpHeaderControl*, UInt32),
    add_request_headers : Proc(IUPnPHttpHeaderControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPHttpHeaderControl, lpVtbl : IUPnPHttpHeaderControlVtbl* do
    GUID = LibC::GUID.new(0x405af4f_u32, 0x8b5c_u16, 0x447c_u16, StaticArray[0x80_u8, 0xf2_u8, 0xb7_u8, 0x59_u8, 0x84_u8, 0xa3_u8, 0x1f_u8, 0x3c_u8])
    def query_interface(this : IUPnPHttpHeaderControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPHttpHeaderControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPHttpHeaderControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_request_headers(this : IUPnPHttpHeaderControl*, bstrHttpHeaders : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_request_headers.call(this, bstrHttpHeaders)
    end

  end

  @[Extern]
  record IUPnPDeviceFinderCallbackVtbl,
    query_interface : Proc(IUPnPDeviceFinderCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceFinderCallback*, UInt32),
    release : Proc(IUPnPDeviceFinderCallback*, UInt32),
    device_added : Proc(IUPnPDeviceFinderCallback*, Int32, Void*, Win32cr::Foundation::HRESULT),
    device_removed : Proc(IUPnPDeviceFinderCallback*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    search_complete : Proc(IUPnPDeviceFinderCallback*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceFinderCallback, lpVtbl : IUPnPDeviceFinderCallbackVtbl* do
    GUID = LibC::GUID.new(0x415a984a_u32, 0x88b3_u16, 0x49f3_u16, StaticArray[0x92_u8, 0xaf_u8, 0x5_u8, 0x8_u8, 0xbe_u8, 0xdf_u8, 0xd_u8, 0x6c_u8])
    def query_interface(this : IUPnPDeviceFinderCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceFinderCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceFinderCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def device_added(this : IUPnPDeviceFinderCallback*, lFindData : Int32, pDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_added.call(this, lFindData, pDevice)
    end
    def device_removed(this : IUPnPDeviceFinderCallback*, lFindData : Int32, bstrUDN : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_removed.call(this, lFindData, bstrUDN)
    end
    def search_complete(this : IUPnPDeviceFinderCallback*, lFindData : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search_complete.call(this, lFindData)
    end

  end

  @[Extern]
  record IUPnPServicesVtbl,
    query_interface : Proc(IUPnPServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPServices*, UInt32),
    release : Proc(IUPnPServices*, UInt32),
    get_type_info_count : Proc(IUPnPServices*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPServices*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPServices*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPServices*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUPnPServices*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUPnPServices*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUPnPServices*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPServices, lpVtbl : IUPnPServicesVtbl* do
    GUID = LibC::GUID.new(0x3f8c8e9e_u32, 0x9a7a_u16, 0x4dc8_u16, StaticArray[0xbc_u8, 0x41_u8, 0xff_u8, 0x31_u8, 0xfa_u8, 0x37_u8, 0x49_u8, 0x56_u8])
    def query_interface(this : IUPnPServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPServices*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPServices*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPServices*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPServices*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IUPnPServices*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IUPnPServices*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppunk)
    end
    def get_Item(this : IUPnPServices*, bstrServiceId : Win32cr::Foundation::BSTR, ppService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, bstrServiceId, ppService)
    end

  end

  @[Extern]
  record IUPnPServiceVtbl,
    query_interface : Proc(IUPnPService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPService*, UInt32),
    release : Proc(IUPnPService*, UInt32),
    get_type_info_count : Proc(IUPnPService*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPService*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPService*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPService*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    query_state_variable : Proc(IUPnPService*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    invoke_action : Proc(IUPnPService*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ServiceTypeIdentifier : Proc(IUPnPService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_callback : Proc(IUPnPService*, Void*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IUPnPService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LastTransportStatus : Proc(IUPnPService*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPService, lpVtbl : IUPnPServiceVtbl* do
    GUID = LibC::GUID.new(0xa295019c_u32, 0xdc65_u16, 0x47dd_u16, StaticArray[0x90_u8, 0xdc_u8, 0x7f_u8, 0xe9_u8, 0x18_u8, 0xa1_u8, 0xab_u8, 0x44_u8])
    def query_interface(this : IUPnPService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPService*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPService*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPService*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPService*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def query_state_variable(this : IUPnPService*, bstrVariableName : Win32cr::Foundation::BSTR, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_state_variable.call(this, bstrVariableName, pValue)
    end
    def invoke_action(this : IUPnPService*, bstrActionName : Win32cr::Foundation::BSTR, vInActionArgs : Win32cr::System::Com::VARIANT, pvOutActionArgs : Win32cr::System::Com::VARIANT*, pvRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_action.call(this, bstrActionName, vInActionArgs, pvOutActionArgs, pvRetVal)
    end
    def get_ServiceTypeIdentifier(this : IUPnPService*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceTypeIdentifier.call(this, pVal)
    end
    def add_callback(this : IUPnPService*, pUnkCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_callback.call(this, pUnkCallback)
    end
    def get_Id(this : IUPnPService*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_LastTransportStatus(this : IUPnPService*, plValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastTransportStatus.call(this, plValue)
    end

  end

  @[Extern]
  record IUPnPAsyncResultVtbl,
    query_interface : Proc(IUPnPAsyncResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPAsyncResult*, UInt32),
    release : Proc(IUPnPAsyncResult*, UInt32),
    async_operation_complete : Proc(IUPnPAsyncResult*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPAsyncResult, lpVtbl : IUPnPAsyncResultVtbl* do
    GUID = LibC::GUID.new(0x4d65fd08_u32, 0xd13e_u16, 0x4274_u16, StaticArray[0x9c_u8, 0x8b_u8, 0xdd_u8, 0x8d_u8, 0x2_u8, 0x8c_u8, 0x86_u8, 0x44_u8])
    def query_interface(this : IUPnPAsyncResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPAsyncResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPAsyncResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def async_operation_complete(this : IUPnPAsyncResult*, ullRequestID : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.async_operation_complete.call(this, ullRequestID)
    end

  end

  @[Extern]
  record IUPnPServiceAsyncVtbl,
    query_interface : Proc(IUPnPServiceAsync*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPServiceAsync*, UInt32),
    release : Proc(IUPnPServiceAsync*, UInt32),
    begin_invoke_action : Proc(IUPnPServiceAsync*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    end_invoke_action : Proc(IUPnPServiceAsync*, UInt64, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    begin_query_state_variable : Proc(IUPnPServiceAsync*, Win32cr::Foundation::BSTR, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    end_query_state_variable : Proc(IUPnPServiceAsync*, UInt64, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    begin_subscribe_to_events : Proc(IUPnPServiceAsync*, Void*, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    end_subscribe_to_events : Proc(IUPnPServiceAsync*, UInt64, Win32cr::Foundation::HRESULT),
    begin_scpd_download : Proc(IUPnPServiceAsync*, Void*, UInt64*, Win32cr::Foundation::HRESULT),
    end_scpd_download : Proc(IUPnPServiceAsync*, UInt64, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    cancel_async_operation : Proc(IUPnPServiceAsync*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPServiceAsync, lpVtbl : IUPnPServiceAsyncVtbl* do
    GUID = LibC::GUID.new(0x98bdaf5_u32, 0x5ec1_u16, 0x49e7_u16, StaticArray[0xa2_u8, 0x60_u8, 0xb3_u8, 0xa1_u8, 0x1d_u8, 0xd8_u8, 0x68_u8, 0xc_u8])
    def query_interface(this : IUPnPServiceAsync*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPServiceAsync*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPServiceAsync*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_invoke_action(this : IUPnPServiceAsync*, bstrActionName : Win32cr::Foundation::BSTR, vInActionArgs : Win32cr::System::Com::VARIANT, pAsyncResult : Void*, pullRequestID : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_invoke_action.call(this, bstrActionName, vInActionArgs, pAsyncResult, pullRequestID)
    end
    def end_invoke_action(this : IUPnPServiceAsync*, ullRequestID : UInt64, pvOutActionArgs : Win32cr::System::Com::VARIANT*, pvRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_invoke_action.call(this, ullRequestID, pvOutActionArgs, pvRetVal)
    end
    def begin_query_state_variable(this : IUPnPServiceAsync*, bstrVariableName : Win32cr::Foundation::BSTR, pAsyncResult : Void*, pullRequestID : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_query_state_variable.call(this, bstrVariableName, pAsyncResult, pullRequestID)
    end
    def end_query_state_variable(this : IUPnPServiceAsync*, ullRequestID : UInt64, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_query_state_variable.call(this, ullRequestID, pValue)
    end
    def begin_subscribe_to_events(this : IUPnPServiceAsync*, pUnkCallback : Void*, pAsyncResult : Void*, pullRequestID : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_subscribe_to_events.call(this, pUnkCallback, pAsyncResult, pullRequestID)
    end
    def end_subscribe_to_events(this : IUPnPServiceAsync*, ullRequestID : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_subscribe_to_events.call(this, ullRequestID)
    end
    def begin_scpd_download(this : IUPnPServiceAsync*, pAsyncResult : Void*, pullRequestID : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_scpd_download.call(this, pAsyncResult, pullRequestID)
    end
    def end_scpd_download(this : IUPnPServiceAsync*, ullRequestID : UInt64, pbstrSCPDDoc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_scpd_download.call(this, ullRequestID, pbstrSCPDDoc)
    end
    def cancel_async_operation(this : IUPnPServiceAsync*, ullRequestID : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_async_operation.call(this, ullRequestID)
    end

  end

  @[Extern]
  record IUPnPServiceCallbackVtbl,
    query_interface : Proc(IUPnPServiceCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPServiceCallback*, UInt32),
    release : Proc(IUPnPServiceCallback*, UInt32),
    state_variable_changed : Proc(IUPnPServiceCallback*, Void*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    service_instance_died : Proc(IUPnPServiceCallback*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPServiceCallback, lpVtbl : IUPnPServiceCallbackVtbl* do
    GUID = LibC::GUID.new(0x31fadca9_u32, 0xab73_u16, 0x464b_u16, StaticArray[0xb6_u8, 0x7d_u8, 0x5c_u8, 0x1d_u8, 0xf_u8, 0x83_u8, 0xc8_u8, 0xb8_u8])
    def query_interface(this : IUPnPServiceCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPServiceCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPServiceCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def state_variable_changed(this : IUPnPServiceCallback*, pus : Void*, pcwszStateVarName : Win32cr::Foundation::PWSTR, vaValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.state_variable_changed.call(this, pus, pcwszStateVarName, vaValue)
    end
    def service_instance_died(this : IUPnPServiceCallback*, pus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.service_instance_died.call(this, pus)
    end

  end

  @[Extern]
  record IUPnPServiceEnumPropertyVtbl,
    query_interface : Proc(IUPnPServiceEnumProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPServiceEnumProperty*, UInt32),
    release : Proc(IUPnPServiceEnumProperty*, UInt32),
    set_service_enum_property : Proc(IUPnPServiceEnumProperty*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPServiceEnumProperty, lpVtbl : IUPnPServiceEnumPropertyVtbl* do
    GUID = LibC::GUID.new(0x38873b37_u32, 0x91bb_u16, 0x49f4_u16, StaticArray[0xb2_u8, 0x49_u8, 0x2e_u8, 0x8e_u8, 0xfb_u8, 0xb8_u8, 0xa8_u8, 0x16_u8])
    def query_interface(this : IUPnPServiceEnumProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPServiceEnumProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPServiceEnumProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_service_enum_property(this : IUPnPServiceEnumProperty*, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_service_enum_property.call(this, dwMask)
    end

  end

  @[Extern]
  record IUPnPServiceDocumentAccessVtbl,
    query_interface : Proc(IUPnPServiceDocumentAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPServiceDocumentAccess*, UInt32),
    release : Proc(IUPnPServiceDocumentAccess*, UInt32),
    get_document_url : Proc(IUPnPServiceDocumentAccess*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_document : Proc(IUPnPServiceDocumentAccess*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPServiceDocumentAccess, lpVtbl : IUPnPServiceDocumentAccessVtbl* do
    GUID = LibC::GUID.new(0x21905529_u32, 0xa5e_u16, 0x4589_u16, StaticArray[0x82_u8, 0x5d_u8, 0x7e_u8, 0x6d_u8, 0x87_u8, 0xea_u8, 0x69_u8, 0x98_u8])
    def query_interface(this : IUPnPServiceDocumentAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPServiceDocumentAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPServiceDocumentAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_url(this : IUPnPServiceDocumentAccess*, pbstrDocUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_url.call(this, pbstrDocUrl)
    end
    def get_document(this : IUPnPServiceDocumentAccess*, pbstrDoc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document.call(this, pbstrDoc)
    end

  end

  @[Extern]
  record IUPnPDevicesVtbl,
    query_interface : Proc(IUPnPDevices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDevices*, UInt32),
    release : Proc(IUPnPDevices*, UInt32),
    get_type_info_count : Proc(IUPnPDevices*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPDevices*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPDevices*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPDevices*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUPnPDevices*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUPnPDevices*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUPnPDevices*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDevices, lpVtbl : IUPnPDevicesVtbl* do
    GUID = LibC::GUID.new(0xfdbc0c73_u32, 0xbda3_u16, 0x4c66_u16, StaticArray[0xac_u8, 0x4f_u8, 0xf2_u8, 0xd9_u8, 0x6f_u8, 0xda_u8, 0xd6_u8, 0x8c_u8])
    def query_interface(this : IUPnPDevices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDevices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDevices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPDevices*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPDevices*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPDevices*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPDevices*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IUPnPDevices*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get__NewEnum(this : IUPnPDevices*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppunk)
    end
    def get_Item(this : IUPnPDevices*, bstrUDN : Win32cr::Foundation::BSTR, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, bstrUDN, ppDevice)
    end

  end

  @[Extern]
  record IUPnPDeviceVtbl,
    query_interface : Proc(IUPnPDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDevice*, UInt32),
    release : Proc(IUPnPDevice*, UInt32),
    get_type_info_count : Proc(IUPnPDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPDevice*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPDevice*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPDevice*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_IsRootDevice : Proc(IUPnPDevice*, Int16*, Win32cr::Foundation::HRESULT),
    get_RootDevice : Proc(IUPnPDevice*, Void**, Win32cr::Foundation::HRESULT),
    get_ParentDevice : Proc(IUPnPDevice*, Void**, Win32cr::Foundation::HRESULT),
    get_HasChildren : Proc(IUPnPDevice*, Int16*, Win32cr::Foundation::HRESULT),
    get_Children : Proc(IUPnPDevice*, Void**, Win32cr::Foundation::HRESULT),
    get_UniqueDeviceName : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PresentationURL : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ManufacturerName : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ManufacturerURL : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ModelName : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ModelNumber : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ModelURL : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UPC : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SerialNumber : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    icon_url : Proc(IUPnPDevice*, Win32cr::Foundation::BSTR, Int32, Int32, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Services : Proc(IUPnPDevice*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDevice, lpVtbl : IUPnPDeviceVtbl* do
    GUID = LibC::GUID.new(0x3d44d0d1_u32, 0x98c9_u16, 0x4889_u16, StaticArray[0xac_u8, 0xd1_u8, 0xf9_u8, 0xd6_u8, 0x74_u8, 0xbf_u8, 0x22_u8, 0x21_u8])
    def query_interface(this : IUPnPDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPDevice*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPDevice*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPDevice*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPDevice*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_IsRootDevice(this : IUPnPDevice*, pvarb : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRootDevice.call(this, pvarb)
    end
    def get_RootDevice(this : IUPnPDevice*, ppudRootDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RootDevice.call(this, ppudRootDevice)
    end
    def get_ParentDevice(this : IUPnPDevice*, ppudDeviceParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentDevice.call(this, ppudDeviceParent)
    end
    def get_HasChildren(this : IUPnPDevice*, pvarb : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HasChildren.call(this, pvarb)
    end
    def get_Children(this : IUPnPDevice*, ppudChildren : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Children.call(this, ppudChildren)
    end
    def get_UniqueDeviceName(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UniqueDeviceName.call(this, pbstr)
    end
    def get_FriendlyName(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbstr)
    end
    def get_Type(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pbstr)
    end
    def get_PresentationURL(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PresentationURL.call(this, pbstr)
    end
    def get_ManufacturerName(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ManufacturerName.call(this, pbstr)
    end
    def get_ManufacturerURL(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ManufacturerURL.call(this, pbstr)
    end
    def get_ModelName(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModelName.call(this, pbstr)
    end
    def get_ModelNumber(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModelNumber.call(this, pbstr)
    end
    def get_Description(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstr)
    end
    def get_ModelURL(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModelURL.call(this, pbstr)
    end
    def get_UPC(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UPC.call(this, pbstr)
    end
    def get_SerialNumber(this : IUPnPDevice*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SerialNumber.call(this, pbstr)
    end
    def icon_url(this : IUPnPDevice*, bstrEncodingFormat : Win32cr::Foundation::BSTR, lSizeX : Int32, lSizeY : Int32, lBitDepth : Int32, pbstrIconURL : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.icon_url.call(this, bstrEncodingFormat, lSizeX, lSizeY, lBitDepth, pbstrIconURL)
    end
    def get_Services(this : IUPnPDevice*, ppusServices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Services.call(this, ppusServices)
    end

  end

  @[Extern]
  record IUPnPDeviceDocumentAccessVtbl,
    query_interface : Proc(IUPnPDeviceDocumentAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceDocumentAccess*, UInt32),
    release : Proc(IUPnPDeviceDocumentAccess*, UInt32),
    get_document_url : Proc(IUPnPDeviceDocumentAccess*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceDocumentAccess, lpVtbl : IUPnPDeviceDocumentAccessVtbl* do
    GUID = LibC::GUID.new(0xe7772804_u32, 0x3287_u16, 0x418e_u16, StaticArray[0x90_u8, 0x72_u8, 0xcf_u8, 0x2b_u8, 0x47_u8, 0x23_u8, 0x89_u8, 0x81_u8])
    def query_interface(this : IUPnPDeviceDocumentAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceDocumentAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceDocumentAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document_url(this : IUPnPDeviceDocumentAccess*, pbstrDocument : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_url.call(this, pbstrDocument)
    end

  end

  @[Extern]
  record IUPnPDeviceDocumentAccessExVtbl,
    query_interface : Proc(IUPnPDeviceDocumentAccessEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceDocumentAccessEx*, UInt32),
    release : Proc(IUPnPDeviceDocumentAccessEx*, UInt32),
    get_document : Proc(IUPnPDeviceDocumentAccessEx*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceDocumentAccessEx, lpVtbl : IUPnPDeviceDocumentAccessExVtbl* do
    GUID = LibC::GUID.new(0xc4bc4050_u32, 0x6178_u16, 0x4bd1_u16, StaticArray[0xa4_u8, 0xb8_u8, 0x63_u8, 0x98_u8, 0x32_u8, 0x1f_u8, 0x32_u8, 0x47_u8])
    def query_interface(this : IUPnPDeviceDocumentAccessEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceDocumentAccessEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceDocumentAccessEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_document(this : IUPnPDeviceDocumentAccessEx*, pbstrDocument : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document.call(this, pbstrDocument)
    end

  end

  @[Extern]
  record IUPnPDescriptionDocumentVtbl,
    query_interface : Proc(IUPnPDescriptionDocument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDescriptionDocument*, UInt32),
    release : Proc(IUPnPDescriptionDocument*, UInt32),
    get_type_info_count : Proc(IUPnPDescriptionDocument*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUPnPDescriptionDocument*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUPnPDescriptionDocument*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUPnPDescriptionDocument*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ReadyState : Proc(IUPnPDescriptionDocument*, Int32*, Win32cr::Foundation::HRESULT),
    load : Proc(IUPnPDescriptionDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    load_async : Proc(IUPnPDescriptionDocument*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    get_LoadResult : Proc(IUPnPDescriptionDocument*, Int32*, Win32cr::Foundation::HRESULT),
    abort : Proc(IUPnPDescriptionDocument*, Win32cr::Foundation::HRESULT),
    root_device : Proc(IUPnPDescriptionDocument*, Void**, Win32cr::Foundation::HRESULT),
    device_by_udn : Proc(IUPnPDescriptionDocument*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDescriptionDocument, lpVtbl : IUPnPDescriptionDocumentVtbl* do
    GUID = LibC::GUID.new(0x11d1c1b2_u32, 0x7daa_u16, 0x4c9e_u16, StaticArray[0x95_u8, 0x95_u8, 0x7f_u8, 0x82_u8, 0xed_u8, 0x20_u8, 0x6d_u8, 0x1e_u8])
    def query_interface(this : IUPnPDescriptionDocument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDescriptionDocument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDescriptionDocument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUPnPDescriptionDocument*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUPnPDescriptionDocument*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUPnPDescriptionDocument*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUPnPDescriptionDocument*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ReadyState(this : IUPnPDescriptionDocument*, plReadyState : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadyState.call(this, plReadyState)
    end
    def load(this : IUPnPDescriptionDocument*, bstrUrl : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, bstrUrl)
    end
    def load_async(this : IUPnPDescriptionDocument*, bstrUrl : Win32cr::Foundation::BSTR, punkCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_async.call(this, bstrUrl, punkCallback)
    end
    def get_LoadResult(this : IUPnPDescriptionDocument*, phrError : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoadResult.call(this, phrError)
    end
    def abort(this : IUPnPDescriptionDocument*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def root_device(this : IUPnPDescriptionDocument*, ppudRootDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_device.call(this, ppudRootDevice)
    end
    def device_by_udn(this : IUPnPDescriptionDocument*, bstrUDN : Win32cr::Foundation::BSTR, ppudDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_by_udn.call(this, bstrUDN, ppudDevice)
    end

  end

  @[Extern]
  record IUPnPDeviceFinderAddCallbackWithInterfaceVtbl,
    query_interface : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, UInt32),
    release : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, UInt32),
    device_added_with_interface : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, Int32, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceFinderAddCallbackWithInterface, lpVtbl : IUPnPDeviceFinderAddCallbackWithInterfaceVtbl* do
    GUID = LibC::GUID.new(0x983dfc0b_u32, 0x1796_u16, 0x44df_u16, StaticArray[0x89_u8, 0x75_u8, 0xca_u8, 0x54_u8, 0x5b_u8, 0x62_u8, 0xe_u8, 0xe5_u8])
    def query_interface(this : IUPnPDeviceFinderAddCallbackWithInterface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceFinderAddCallbackWithInterface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceFinderAddCallbackWithInterface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def device_added_with_interface(this : IUPnPDeviceFinderAddCallbackWithInterface*, lFindData : Int32, pDevice : Void*, pguidInterface : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_added_with_interface.call(this, lFindData, pDevice, pguidInterface)
    end

  end

  @[Extern]
  record IUPnPDescriptionDocumentCallbackVtbl,
    query_interface : Proc(IUPnPDescriptionDocumentCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDescriptionDocumentCallback*, UInt32),
    release : Proc(IUPnPDescriptionDocumentCallback*, UInt32),
    load_complete : Proc(IUPnPDescriptionDocumentCallback*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDescriptionDocumentCallback, lpVtbl : IUPnPDescriptionDocumentCallbackVtbl* do
    GUID = LibC::GUID.new(0x77394c69_u32, 0x5486_u16, 0x40d6_u16, StaticArray[0x9b_u8, 0xc3_u8, 0x49_u8, 0x91_u8, 0x98_u8, 0x3e_u8, 0x2_u8, 0xda_u8])
    def query_interface(this : IUPnPDescriptionDocumentCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDescriptionDocumentCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDescriptionDocumentCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_complete(this : IUPnPDescriptionDocumentCallback*, hrLoadResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_complete.call(this, hrLoadResult)
    end

  end

  @[Extern]
  record IUPnPEventSinkVtbl,
    query_interface : Proc(IUPnPEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPEventSink*, UInt32),
    release : Proc(IUPnPEventSink*, UInt32),
    on_state_changed : Proc(IUPnPEventSink*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    on_state_changed_safe : Proc(IUPnPEventSink*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPEventSink, lpVtbl : IUPnPEventSinkVtbl* do
    GUID = LibC::GUID.new(0x204810b4_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_state_changed(this : IUPnPEventSink*, cChanges : UInt32, rgdispidChanges : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_state_changed.call(this, cChanges, rgdispidChanges)
    end
    def on_state_changed_safe(this : IUPnPEventSink*, varsadispidChanges : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_state_changed_safe.call(this, varsadispidChanges)
    end

  end

  @[Extern]
  record IUPnPEventSourceVtbl,
    query_interface : Proc(IUPnPEventSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPEventSource*, UInt32),
    release : Proc(IUPnPEventSource*, UInt32),
    advise : Proc(IUPnPEventSource*, Void*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IUPnPEventSource*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPEventSource, lpVtbl : IUPnPEventSourceVtbl* do
    GUID = LibC::GUID.new(0x204810b5_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPEventSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPEventSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPEventSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise(this : IUPnPEventSource*, pesSubscriber : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, pesSubscriber)
    end
    def unadvise(this : IUPnPEventSource*, pesSubscriber : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, pesSubscriber)
    end

  end

  @[Extern]
  record IUPnPRegistrarVtbl,
    query_interface : Proc(IUPnPRegistrar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPRegistrar*, UInt32),
    release : Proc(IUPnPRegistrar*, UInt32),
    register_device : Proc(IUPnPRegistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_running_device : Proc(IUPnPRegistrar*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_device_provider : Proc(IUPnPRegistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_unique_device_name : Proc(IUPnPRegistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    unregister_device : Proc(IUPnPRegistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unregister_device_provider : Proc(IUPnPRegistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPRegistrar, lpVtbl : IUPnPRegistrarVtbl* do
    GUID = LibC::GUID.new(0x204810b6_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPRegistrar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPRegistrar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPRegistrar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_device(this : IUPnPRegistrar*, bstrXMLDesc : Win32cr::Foundation::BSTR, bstrProgIDDeviceControlClass : Win32cr::Foundation::BSTR, bstrInitString : Win32cr::Foundation::BSTR, bstrContainerId : Win32cr::Foundation::BSTR, bstrResourcePath : Win32cr::Foundation::BSTR, nLifeTime : Int32, pbstrDeviceIdentifier : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_device.call(this, bstrXMLDesc, bstrProgIDDeviceControlClass, bstrInitString, bstrContainerId, bstrResourcePath, nLifeTime, pbstrDeviceIdentifier)
    end
    def register_running_device(this : IUPnPRegistrar*, bstrXMLDesc : Win32cr::Foundation::BSTR, punkDeviceControl : Void*, bstrInitString : Win32cr::Foundation::BSTR, bstrResourcePath : Win32cr::Foundation::BSTR, nLifeTime : Int32, pbstrDeviceIdentifier : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_running_device.call(this, bstrXMLDesc, punkDeviceControl, bstrInitString, bstrResourcePath, nLifeTime, pbstrDeviceIdentifier)
    end
    def register_device_provider(this : IUPnPRegistrar*, bstrProviderName : Win32cr::Foundation::BSTR, bstrProgIDProviderClass : Win32cr::Foundation::BSTR, bstrInitString : Win32cr::Foundation::BSTR, bstrContainerId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_device_provider.call(this, bstrProviderName, bstrProgIDProviderClass, bstrInitString, bstrContainerId)
    end
    def get_unique_device_name(this : IUPnPRegistrar*, bstrDeviceIdentifier : Win32cr::Foundation::BSTR, bstrTemplateUDN : Win32cr::Foundation::BSTR, pbstrUDN : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unique_device_name.call(this, bstrDeviceIdentifier, bstrTemplateUDN, pbstrUDN)
    end
    def unregister_device(this : IUPnPRegistrar*, bstrDeviceIdentifier : Win32cr::Foundation::BSTR, fPermanent : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_device.call(this, bstrDeviceIdentifier, fPermanent)
    end
    def unregister_device_provider(this : IUPnPRegistrar*, bstrProviderName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_device_provider.call(this, bstrProviderName)
    end

  end

  @[Extern]
  record IUPnPReregistrarVtbl,
    query_interface : Proc(IUPnPReregistrar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPReregistrar*, UInt32),
    release : Proc(IUPnPReregistrar*, UInt32),
    reregister_device : Proc(IUPnPReregistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    reregister_running_device : Proc(IUPnPReregistrar*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPReregistrar, lpVtbl : IUPnPReregistrarVtbl* do
    GUID = LibC::GUID.new(0x204810b7_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPReregistrar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPReregistrar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPReregistrar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reregister_device(this : IUPnPReregistrar*, bstrDeviceIdentifier : Win32cr::Foundation::BSTR, bstrXMLDesc : Win32cr::Foundation::BSTR, bstrProgIDDeviceControlClass : Win32cr::Foundation::BSTR, bstrInitString : Win32cr::Foundation::BSTR, bstrContainerId : Win32cr::Foundation::BSTR, bstrResourcePath : Win32cr::Foundation::BSTR, nLifeTime : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reregister_device.call(this, bstrDeviceIdentifier, bstrXMLDesc, bstrProgIDDeviceControlClass, bstrInitString, bstrContainerId, bstrResourcePath, nLifeTime)
    end
    def reregister_running_device(this : IUPnPReregistrar*, bstrDeviceIdentifier : Win32cr::Foundation::BSTR, bstrXMLDesc : Win32cr::Foundation::BSTR, punkDeviceControl : Void*, bstrInitString : Win32cr::Foundation::BSTR, bstrResourcePath : Win32cr::Foundation::BSTR, nLifeTime : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reregister_running_device.call(this, bstrDeviceIdentifier, bstrXMLDesc, punkDeviceControl, bstrInitString, bstrResourcePath, nLifeTime)
    end

  end

  @[Extern]
  record IUPnPDeviceControlVtbl,
    query_interface : Proc(IUPnPDeviceControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceControl*, UInt32),
    release : Proc(IUPnPDeviceControl*, UInt32),
    initialize__ : Proc(IUPnPDeviceControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_service_object : Proc(IUPnPDeviceControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceControl, lpVtbl : IUPnPDeviceControlVtbl* do
    GUID = LibC::GUID.new(0x204810ba_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPDeviceControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IUPnPDeviceControl*, bstrXMLDesc : Win32cr::Foundation::BSTR, bstrDeviceIdentifier : Win32cr::Foundation::BSTR, bstrInitString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, bstrXMLDesc, bstrDeviceIdentifier, bstrInitString)
    end
    def get_service_object(this : IUPnPDeviceControl*, bstrUDN : Win32cr::Foundation::BSTR, bstrServiceId : Win32cr::Foundation::BSTR, ppdispService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_service_object.call(this, bstrUDN, bstrServiceId, ppdispService)
    end

  end

  @[Extern]
  record IUPnPDeviceControlHttpHeadersVtbl,
    query_interface : Proc(IUPnPDeviceControlHttpHeaders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceControlHttpHeaders*, UInt32),
    release : Proc(IUPnPDeviceControlHttpHeaders*, UInt32),
    get_additional_response_headers : Proc(IUPnPDeviceControlHttpHeaders*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceControlHttpHeaders, lpVtbl : IUPnPDeviceControlHttpHeadersVtbl* do
    GUID = LibC::GUID.new(0x204810bb_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPDeviceControlHttpHeaders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceControlHttpHeaders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceControlHttpHeaders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_additional_response_headers(this : IUPnPDeviceControlHttpHeaders*, bstrHttpResponseHeaders : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_additional_response_headers.call(this, bstrHttpResponseHeaders)
    end

  end

  @[Extern]
  record IUPnPDeviceProviderVtbl,
    query_interface : Proc(IUPnPDeviceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPDeviceProvider*, UInt32),
    release : Proc(IUPnPDeviceProvider*, UInt32),
    start : Proc(IUPnPDeviceProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    stop : Proc(IUPnPDeviceProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPDeviceProvider, lpVtbl : IUPnPDeviceProviderVtbl* do
    GUID = LibC::GUID.new(0x204810b8_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
    def query_interface(this : IUPnPDeviceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPDeviceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPDeviceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IUPnPDeviceProvider*, bstrInitString : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, bstrInitString)
    end
    def stop(this : IUPnPDeviceProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end

  end

  @[Extern]
  record IUPnPRemoteEndpointInfoVtbl,
    query_interface : Proc(IUPnPRemoteEndpointInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUPnPRemoteEndpointInfo*, UInt32),
    release : Proc(IUPnPRemoteEndpointInfo*, UInt32),
    get_dword_value : Proc(IUPnPRemoteEndpointInfo*, Win32cr::Foundation::BSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_string_value : Proc(IUPnPRemoteEndpointInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid_value : Proc(IUPnPRemoteEndpointInfo*, Win32cr::Foundation::BSTR, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUPnPRemoteEndpointInfo, lpVtbl : IUPnPRemoteEndpointInfoVtbl* do
    GUID = LibC::GUID.new(0xc92eb863_u32, 0x269_u16, 0x4aff_u16, StaticArray[0x9c_u8, 0x72_u8, 0x75_u8, 0x32_u8, 0x1b_u8, 0xba_u8, 0x29_u8, 0x52_u8])
    def query_interface(this : IUPnPRemoteEndpointInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUPnPRemoteEndpointInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUPnPRemoteEndpointInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_dword_value(this : IUPnPRemoteEndpointInfo*, bstrValueName : Win32cr::Foundation::BSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dword_value.call(this, bstrValueName, pdwValue)
    end
    def get_string_value(this : IUPnPRemoteEndpointInfo*, bstrValueName : Win32cr::Foundation::BSTR, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_value.call(this, bstrValueName, pbstrValue)
    end
    def get_guid_value(this : IUPnPRemoteEndpointInfo*, bstrValueName : Win32cr::Foundation::BSTR, pguidValue : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid_value.call(this, bstrValueName, pguidValue)
    end

  end

  @[Link("cfgmgr32")]
  lib C
    fun SwDeviceCreate(pszEnumeratorName : Win32cr::Foundation::PWSTR, pszParentDeviceInstance : Win32cr::Foundation::PWSTR, pCreateInfo : Win32cr::Devices::Enumeration::Pnp::SW_DEVICE_CREATE_INFO*, cPropertyCount : UInt32, pProperties : Win32cr::Devices::Properties::DEVPROPERTY*, pCallback : Win32cr::Devices::Enumeration::Pnp::SW_DEVICE_CREATE_CALLBACK, pContext : Void*, phSwDevice : LibC::IntPtrT*) : Win32cr::Foundation::HRESULT

    fun SwDeviceClose(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE) : Void

    fun SwDeviceSetLifetime(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, lifetime : Win32cr::Devices::Enumeration::Pnp::SW_DEVICE_LIFETIME) : Win32cr::Foundation::HRESULT

    fun SwDeviceGetLifetime(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, pLifetime : Win32cr::Devices::Enumeration::Pnp::SW_DEVICE_LIFETIME*) : Win32cr::Foundation::HRESULT

    fun SwDevicePropertySet(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, cPropertyCount : UInt32, pProperties : Win32cr::Devices::Properties::DEVPROPERTY*) : Win32cr::Foundation::HRESULT

    fun SwDeviceInterfaceRegister(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, pInterfaceClassGuid : LibC::GUID*, pszReferenceString : Win32cr::Foundation::PWSTR, cPropertyCount : UInt32, pProperties : Win32cr::Devices::Properties::DEVPROPERTY*, fEnabled : Win32cr::Foundation::BOOL, ppszDeviceInterfaceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SwMemFree(pMem : Void*) : Void

    fun SwDeviceInterfaceSetState(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, pszDeviceInterfaceId : Win32cr::Foundation::PWSTR, fEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun SwDeviceInterfacePropertySet(hSwDevice : Win32cr::Devices::Enumeration::Pnp::HSWDEVICE, pszDeviceInterfaceId : Win32cr::Foundation::PWSTR, cPropertyCount : UInt32, pProperties : Win32cr::Devices::Properties::DEVPROPERTY*) : Win32cr::Foundation::HRESULT

  end
end