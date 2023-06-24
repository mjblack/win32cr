require "../../foundation.cr"
require "../../security.cr"
require "../../system/com.cr"
require "../../devices/properties.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:cfgmgr32.dll")]
{% else %}
@[Link("cfgmgr32")]
{% end %}
lib LibWin32
  alias HSWDEVICE = LibC::IntPtrT

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

  alias SW_DEVICE_CREATE_CALLBACK = Proc(HSWDEVICE, HRESULT, Void*, LibC::LPWSTR, Void)


  enum SW_DEVICE_CAPABILITIES : Int32
    SWDeviceCapabilitiesNone = 0
    SWDeviceCapabilitiesRemovable = 1
    SWDeviceCapabilitiesSilentInstall = 2
    SWDeviceCapabilitiesNoDisplayInUI = 4
    SWDeviceCapabilitiesDriverRequired = 8
  end

  enum SW_DEVICE_LIFETIME : Int32
    SWDeviceLifetimeHandle = 0
    SWDeviceLifetimeParentPresent = 1
    SWDeviceLifetimeMax = 2
  end

  struct SW_DEVICE_CREATE_INFO
    cb_size : UInt32
    psz_instance_id : LibC::LPWSTR
    pszz_hardware_ids : LibC::LPWSTR
    pszz_compatible_ids : LibC::LPWSTR
    p_container_id : Guid*
    capability_flags : UInt32
    psz_device_description : LibC::LPWSTR
    psz_device_location : LibC::LPWSTR
    p_security_descriptor : SECURITY_DESCRIPTOR*
  end


  struct IUPnPDeviceFinderVTbl
    query_interface : Proc(IUPnPDeviceFinder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceFinder*, UInt32)
    release : Proc(IUPnPDeviceFinder*, UInt32)
    get_type_info_count : Proc(IUPnPDeviceFinder*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPDeviceFinder*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPDeviceFinder*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPDeviceFinder*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    find_by_type : Proc(IUPnPDeviceFinder*, UInt8*, UInt32, IUPnPDevices*, HRESULT)
    create_async_find : Proc(IUPnPDeviceFinder*, UInt8*, UInt32, IUnknown, Int32*, HRESULT)
    start_async_find : Proc(IUPnPDeviceFinder*, Int32, HRESULT)
    cancel_async_find : Proc(IUPnPDeviceFinder*, Int32, HRESULT)
    find_by_udn : Proc(IUPnPDeviceFinder*, UInt8*, IUPnPDevice*, HRESULT)
  end

  IUPnPDeviceFinder_GUID = "adda3d55-6f72-4319-bff9-18600a539b10"
  IID_IUPnPDeviceFinder = LibC::GUID.new(0xadda3d55_u32, 0x6f72_u16, 0x4319_u16, StaticArray[0xbf_u8, 0xf9_u8, 0x18_u8, 0x60_u8, 0xa_u8, 0x53_u8, 0x9b_u8, 0x10_u8])
  struct IUPnPDeviceFinder
    lpVtbl : IUPnPDeviceFinderVTbl*
  end

  struct IUPnPAddressFamilyControlVTbl
    query_interface : Proc(IUPnPAddressFamilyControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPAddressFamilyControl*, UInt32)
    release : Proc(IUPnPAddressFamilyControl*, UInt32)
    set_address_family : Proc(IUPnPAddressFamilyControl*, Int32, HRESULT)
    get_address_family : Proc(IUPnPAddressFamilyControl*, Int32*, HRESULT)
  end

  IUPnPAddressFamilyControl_GUID = "e3bf6178-694e-459f-a5a6-191ea0ffa1c7"
  IID_IUPnPAddressFamilyControl = LibC::GUID.new(0xe3bf6178_u32, 0x694e_u16, 0x459f_u16, StaticArray[0xa5_u8, 0xa6_u8, 0x19_u8, 0x1e_u8, 0xa0_u8, 0xff_u8, 0xa1_u8, 0xc7_u8])
  struct IUPnPAddressFamilyControl
    lpVtbl : IUPnPAddressFamilyControlVTbl*
  end

  struct IUPnPHttpHeaderControlVTbl
    query_interface : Proc(IUPnPHttpHeaderControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPHttpHeaderControl*, UInt32)
    release : Proc(IUPnPHttpHeaderControl*, UInt32)
    add_request_headers : Proc(IUPnPHttpHeaderControl*, UInt8*, HRESULT)
  end

  IUPnPHttpHeaderControl_GUID = "0405af4f-8b5c-447c-80f2-b75984a31f3c"
  IID_IUPnPHttpHeaderControl = LibC::GUID.new(0x405af4f_u32, 0x8b5c_u16, 0x447c_u16, StaticArray[0x80_u8, 0xf2_u8, 0xb7_u8, 0x59_u8, 0x84_u8, 0xa3_u8, 0x1f_u8, 0x3c_u8])
  struct IUPnPHttpHeaderControl
    lpVtbl : IUPnPHttpHeaderControlVTbl*
  end

  struct IUPnPDeviceFinderCallbackVTbl
    query_interface : Proc(IUPnPDeviceFinderCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceFinderCallback*, UInt32)
    release : Proc(IUPnPDeviceFinderCallback*, UInt32)
    device_added : Proc(IUPnPDeviceFinderCallback*, Int32, IUPnPDevice, HRESULT)
    device_removed : Proc(IUPnPDeviceFinderCallback*, Int32, UInt8*, HRESULT)
    search_complete : Proc(IUPnPDeviceFinderCallback*, Int32, HRESULT)
  end

  IUPnPDeviceFinderCallback_GUID = "415a984a-88b3-49f3-92af-0508bedf0d6c"
  IID_IUPnPDeviceFinderCallback = LibC::GUID.new(0x415a984a_u32, 0x88b3_u16, 0x49f3_u16, StaticArray[0x92_u8, 0xaf_u8, 0x5_u8, 0x8_u8, 0xbe_u8, 0xdf_u8, 0xd_u8, 0x6c_u8])
  struct IUPnPDeviceFinderCallback
    lpVtbl : IUPnPDeviceFinderCallbackVTbl*
  end

  struct IUPnPServicesVTbl
    query_interface : Proc(IUPnPServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPServices*, UInt32)
    release : Proc(IUPnPServices*, UInt32)
    get_type_info_count : Proc(IUPnPServices*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPServices*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPServices*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPServices*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IUPnPServices*, Int32*, HRESULT)
    get__new_enum : Proc(IUPnPServices*, IUnknown*, HRESULT)
    get_item : Proc(IUPnPServices*, UInt8*, IUPnPService*, HRESULT)
  end

  IUPnPServices_GUID = "3f8c8e9e-9a7a-4dc8-bc41-ff31fa374956"
  IID_IUPnPServices = LibC::GUID.new(0x3f8c8e9e_u32, 0x9a7a_u16, 0x4dc8_u16, StaticArray[0xbc_u8, 0x41_u8, 0xff_u8, 0x31_u8, 0xfa_u8, 0x37_u8, 0x49_u8, 0x56_u8])
  struct IUPnPServices
    lpVtbl : IUPnPServicesVTbl*
  end

  struct IUPnPServiceVTbl
    query_interface : Proc(IUPnPService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPService*, UInt32)
    release : Proc(IUPnPService*, UInt32)
    get_type_info_count : Proc(IUPnPService*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPService*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPService*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPService*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    query_state_variable : Proc(IUPnPService*, UInt8*, VARIANT*, HRESULT)
    invoke_action : Proc(IUPnPService*, UInt8*, VARIANT, VARIANT*, VARIANT*, HRESULT)
    get_service_type_identifier : Proc(IUPnPService*, UInt8**, HRESULT)
    add_callback : Proc(IUPnPService*, IUnknown, HRESULT)
    get_id : Proc(IUPnPService*, UInt8**, HRESULT)
    get_last_transport_status : Proc(IUPnPService*, Int32*, HRESULT)
  end

  IUPnPService_GUID = "a295019c-dc65-47dd-90dc-7fe918a1ab44"
  IID_IUPnPService = LibC::GUID.new(0xa295019c_u32, 0xdc65_u16, 0x47dd_u16, StaticArray[0x90_u8, 0xdc_u8, 0x7f_u8, 0xe9_u8, 0x18_u8, 0xa1_u8, 0xab_u8, 0x44_u8])
  struct IUPnPService
    lpVtbl : IUPnPServiceVTbl*
  end

  struct IUPnPAsyncResultVTbl
    query_interface : Proc(IUPnPAsyncResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPAsyncResult*, UInt32)
    release : Proc(IUPnPAsyncResult*, UInt32)
    async_operation_complete : Proc(IUPnPAsyncResult*, UInt64, HRESULT)
  end

  IUPnPAsyncResult_GUID = "4d65fd08-d13e-4274-9c8b-dd8d028c8644"
  IID_IUPnPAsyncResult = LibC::GUID.new(0x4d65fd08_u32, 0xd13e_u16, 0x4274_u16, StaticArray[0x9c_u8, 0x8b_u8, 0xdd_u8, 0x8d_u8, 0x2_u8, 0x8c_u8, 0x86_u8, 0x44_u8])
  struct IUPnPAsyncResult
    lpVtbl : IUPnPAsyncResultVTbl*
  end

  struct IUPnPServiceAsyncVTbl
    query_interface : Proc(IUPnPServiceAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPServiceAsync*, UInt32)
    release : Proc(IUPnPServiceAsync*, UInt32)
    begin_invoke_action : Proc(IUPnPServiceAsync*, UInt8*, VARIANT, IUPnPAsyncResult, UInt64*, HRESULT)
    end_invoke_action : Proc(IUPnPServiceAsync*, UInt64, VARIANT*, VARIANT*, HRESULT)
    begin_query_state_variable : Proc(IUPnPServiceAsync*, UInt8*, IUPnPAsyncResult, UInt64*, HRESULT)
    end_query_state_variable : Proc(IUPnPServiceAsync*, UInt64, VARIANT*, HRESULT)
    begin_subscribe_to_events : Proc(IUPnPServiceAsync*, IUnknown, IUPnPAsyncResult, UInt64*, HRESULT)
    end_subscribe_to_events : Proc(IUPnPServiceAsync*, UInt64, HRESULT)
    begin_scpd_download : Proc(IUPnPServiceAsync*, IUPnPAsyncResult, UInt64*, HRESULT)
    end_scpd_download : Proc(IUPnPServiceAsync*, UInt64, UInt8**, HRESULT)
    cancel_async_operation : Proc(IUPnPServiceAsync*, UInt64, HRESULT)
  end

  IUPnPServiceAsync_GUID = "098bdaf5-5ec1-49e7-a260-b3a11dd8680c"
  IID_IUPnPServiceAsync = LibC::GUID.new(0x98bdaf5_u32, 0x5ec1_u16, 0x49e7_u16, StaticArray[0xa2_u8, 0x60_u8, 0xb3_u8, 0xa1_u8, 0x1d_u8, 0xd8_u8, 0x68_u8, 0xc_u8])
  struct IUPnPServiceAsync
    lpVtbl : IUPnPServiceAsyncVTbl*
  end

  struct IUPnPServiceCallbackVTbl
    query_interface : Proc(IUPnPServiceCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPServiceCallback*, UInt32)
    release : Proc(IUPnPServiceCallback*, UInt32)
    state_variable_changed : Proc(IUPnPServiceCallback*, IUPnPService, LibC::LPWSTR, VARIANT, HRESULT)
    service_instance_died : Proc(IUPnPServiceCallback*, IUPnPService, HRESULT)
  end

  IUPnPServiceCallback_GUID = "31fadca9-ab73-464b-b67d-5c1d0f83c8b8"
  IID_IUPnPServiceCallback = LibC::GUID.new(0x31fadca9_u32, 0xab73_u16, 0x464b_u16, StaticArray[0xb6_u8, 0x7d_u8, 0x5c_u8, 0x1d_u8, 0xf_u8, 0x83_u8, 0xc8_u8, 0xb8_u8])
  struct IUPnPServiceCallback
    lpVtbl : IUPnPServiceCallbackVTbl*
  end

  struct IUPnPServiceEnumPropertyVTbl
    query_interface : Proc(IUPnPServiceEnumProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPServiceEnumProperty*, UInt32)
    release : Proc(IUPnPServiceEnumProperty*, UInt32)
    set_service_enum_property : Proc(IUPnPServiceEnumProperty*, UInt32, HRESULT)
  end

  IUPnPServiceEnumProperty_GUID = "38873b37-91bb-49f4-b249-2e8efbb8a816"
  IID_IUPnPServiceEnumProperty = LibC::GUID.new(0x38873b37_u32, 0x91bb_u16, 0x49f4_u16, StaticArray[0xb2_u8, 0x49_u8, 0x2e_u8, 0x8e_u8, 0xfb_u8, 0xb8_u8, 0xa8_u8, 0x16_u8])
  struct IUPnPServiceEnumProperty
    lpVtbl : IUPnPServiceEnumPropertyVTbl*
  end

  struct IUPnPServiceDocumentAccessVTbl
    query_interface : Proc(IUPnPServiceDocumentAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPServiceDocumentAccess*, UInt32)
    release : Proc(IUPnPServiceDocumentAccess*, UInt32)
    get_document_url : Proc(IUPnPServiceDocumentAccess*, UInt8**, HRESULT)
    get_document : Proc(IUPnPServiceDocumentAccess*, UInt8**, HRESULT)
  end

  IUPnPServiceDocumentAccess_GUID = "21905529-0a5e-4589-825d-7e6d87ea6998"
  IID_IUPnPServiceDocumentAccess = LibC::GUID.new(0x21905529_u32, 0xa5e_u16, 0x4589_u16, StaticArray[0x82_u8, 0x5d_u8, 0x7e_u8, 0x6d_u8, 0x87_u8, 0xea_u8, 0x69_u8, 0x98_u8])
  struct IUPnPServiceDocumentAccess
    lpVtbl : IUPnPServiceDocumentAccessVTbl*
  end

  struct IUPnPDevicesVTbl
    query_interface : Proc(IUPnPDevices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDevices*, UInt32)
    release : Proc(IUPnPDevices*, UInt32)
    get_type_info_count : Proc(IUPnPDevices*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPDevices*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPDevices*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPDevices*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IUPnPDevices*, Int32*, HRESULT)
    get__new_enum : Proc(IUPnPDevices*, IUnknown*, HRESULT)
    get_item : Proc(IUPnPDevices*, UInt8*, IUPnPDevice*, HRESULT)
  end

  IUPnPDevices_GUID = "fdbc0c73-bda3-4c66-ac4f-f2d96fdad68c"
  IID_IUPnPDevices = LibC::GUID.new(0xfdbc0c73_u32, 0xbda3_u16, 0x4c66_u16, StaticArray[0xac_u8, 0x4f_u8, 0xf2_u8, 0xd9_u8, 0x6f_u8, 0xda_u8, 0xd6_u8, 0x8c_u8])
  struct IUPnPDevices
    lpVtbl : IUPnPDevicesVTbl*
  end

  struct IUPnPDeviceVTbl
    query_interface : Proc(IUPnPDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDevice*, UInt32)
    release : Proc(IUPnPDevice*, UInt32)
    get_type_info_count : Proc(IUPnPDevice*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPDevice*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPDevice*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPDevice*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_is_root_device : Proc(IUPnPDevice*, Int16*, HRESULT)
    get_root_device : Proc(IUPnPDevice*, IUPnPDevice*, HRESULT)
    get_parent_device : Proc(IUPnPDevice*, IUPnPDevice*, HRESULT)
    get_has_children : Proc(IUPnPDevice*, Int16*, HRESULT)
    get_children : Proc(IUPnPDevice*, IUPnPDevices*, HRESULT)
    get_unique_device_name : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_friendly_name : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_type : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_presentation_url : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_manufacturer_name : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_manufacturer_url : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_model_name : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_model_number : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_description : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_model_url : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_upc : Proc(IUPnPDevice*, UInt8**, HRESULT)
    get_serial_number : Proc(IUPnPDevice*, UInt8**, HRESULT)
    icon_url : Proc(IUPnPDevice*, UInt8*, Int32, Int32, Int32, UInt8**, HRESULT)
    get_services : Proc(IUPnPDevice*, IUPnPServices*, HRESULT)
  end

  IUPnPDevice_GUID = "3d44d0d1-98c9-4889-acd1-f9d674bf2221"
  IID_IUPnPDevice = LibC::GUID.new(0x3d44d0d1_u32, 0x98c9_u16, 0x4889_u16, StaticArray[0xac_u8, 0xd1_u8, 0xf9_u8, 0xd6_u8, 0x74_u8, 0xbf_u8, 0x22_u8, 0x21_u8])
  struct IUPnPDevice
    lpVtbl : IUPnPDeviceVTbl*
  end

  struct IUPnPDeviceDocumentAccessVTbl
    query_interface : Proc(IUPnPDeviceDocumentAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceDocumentAccess*, UInt32)
    release : Proc(IUPnPDeviceDocumentAccess*, UInt32)
    get_document_url : Proc(IUPnPDeviceDocumentAccess*, UInt8**, HRESULT)
  end

  IUPnPDeviceDocumentAccess_GUID = "e7772804-3287-418e-9072-cf2b47238981"
  IID_IUPnPDeviceDocumentAccess = LibC::GUID.new(0xe7772804_u32, 0x3287_u16, 0x418e_u16, StaticArray[0x90_u8, 0x72_u8, 0xcf_u8, 0x2b_u8, 0x47_u8, 0x23_u8, 0x89_u8, 0x81_u8])
  struct IUPnPDeviceDocumentAccess
    lpVtbl : IUPnPDeviceDocumentAccessVTbl*
  end

  struct IUPnPDeviceDocumentAccessExVTbl
    query_interface : Proc(IUPnPDeviceDocumentAccessEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceDocumentAccessEx*, UInt32)
    release : Proc(IUPnPDeviceDocumentAccessEx*, UInt32)
    get_document : Proc(IUPnPDeviceDocumentAccessEx*, UInt8**, HRESULT)
  end

  IUPnPDeviceDocumentAccessEx_GUID = "c4bc4050-6178-4bd1-a4b8-6398321f3247"
  IID_IUPnPDeviceDocumentAccessEx = LibC::GUID.new(0xc4bc4050_u32, 0x6178_u16, 0x4bd1_u16, StaticArray[0xa4_u8, 0xb8_u8, 0x63_u8, 0x98_u8, 0x32_u8, 0x1f_u8, 0x32_u8, 0x47_u8])
  struct IUPnPDeviceDocumentAccessEx
    lpVtbl : IUPnPDeviceDocumentAccessExVTbl*
  end

  struct IUPnPDescriptionDocumentVTbl
    query_interface : Proc(IUPnPDescriptionDocument*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDescriptionDocument*, UInt32)
    release : Proc(IUPnPDescriptionDocument*, UInt32)
    get_type_info_count : Proc(IUPnPDescriptionDocument*, UInt32*, HRESULT)
    get_type_info : Proc(IUPnPDescriptionDocument*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUPnPDescriptionDocument*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUPnPDescriptionDocument*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_ready_state : Proc(IUPnPDescriptionDocument*, Int32*, HRESULT)
    load : Proc(IUPnPDescriptionDocument*, UInt8*, HRESULT)
    load_async : Proc(IUPnPDescriptionDocument*, UInt8*, IUnknown, HRESULT)
    get_load_result : Proc(IUPnPDescriptionDocument*, Int32*, HRESULT)
    abort : Proc(IUPnPDescriptionDocument*, HRESULT)
    root_device : Proc(IUPnPDescriptionDocument*, IUPnPDevice*, HRESULT)
    device_by_udn : Proc(IUPnPDescriptionDocument*, UInt8*, IUPnPDevice*, HRESULT)
  end

  IUPnPDescriptionDocument_GUID = "11d1c1b2-7daa-4c9e-9595-7f82ed206d1e"
  IID_IUPnPDescriptionDocument = LibC::GUID.new(0x11d1c1b2_u32, 0x7daa_u16, 0x4c9e_u16, StaticArray[0x95_u8, 0x95_u8, 0x7f_u8, 0x82_u8, 0xed_u8, 0x20_u8, 0x6d_u8, 0x1e_u8])
  struct IUPnPDescriptionDocument
    lpVtbl : IUPnPDescriptionDocumentVTbl*
  end

  struct IUPnPDeviceFinderAddCallbackWithInterfaceVTbl
    query_interface : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, UInt32)
    release : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, UInt32)
    device_added_with_interface : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, Int32, IUPnPDevice, Guid*, HRESULT)
  end

  IUPnPDeviceFinderAddCallbackWithInterface_GUID = "983dfc0b-1796-44df-8975-ca545b620ee5"
  IID_IUPnPDeviceFinderAddCallbackWithInterface = LibC::GUID.new(0x983dfc0b_u32, 0x1796_u16, 0x44df_u16, StaticArray[0x89_u8, 0x75_u8, 0xca_u8, 0x54_u8, 0x5b_u8, 0x62_u8, 0xe_u8, 0xe5_u8])
  struct IUPnPDeviceFinderAddCallbackWithInterface
    lpVtbl : IUPnPDeviceFinderAddCallbackWithInterfaceVTbl*
  end

  struct IUPnPDescriptionDocumentCallbackVTbl
    query_interface : Proc(IUPnPDescriptionDocumentCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDescriptionDocumentCallback*, UInt32)
    release : Proc(IUPnPDescriptionDocumentCallback*, UInt32)
    load_complete : Proc(IUPnPDescriptionDocumentCallback*, HRESULT, HRESULT)
  end

  IUPnPDescriptionDocumentCallback_GUID = "77394c69-5486-40d6-9bc3-4991983e02da"
  IID_IUPnPDescriptionDocumentCallback = LibC::GUID.new(0x77394c69_u32, 0x5486_u16, 0x40d6_u16, StaticArray[0x9b_u8, 0xc3_u8, 0x49_u8, 0x91_u8, 0x98_u8, 0x3e_u8, 0x2_u8, 0xda_u8])
  struct IUPnPDescriptionDocumentCallback
    lpVtbl : IUPnPDescriptionDocumentCallbackVTbl*
  end

  struct IUPnPEventSinkVTbl
    query_interface : Proc(IUPnPEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPEventSink*, UInt32)
    release : Proc(IUPnPEventSink*, UInt32)
    on_state_changed : Proc(IUPnPEventSink*, UInt32, Int32*, HRESULT)
    on_state_changed_safe : Proc(IUPnPEventSink*, VARIANT, HRESULT)
  end

  IUPnPEventSink_GUID = "204810b4-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPEventSink = LibC::GUID.new(0x204810b4_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPEventSink
    lpVtbl : IUPnPEventSinkVTbl*
  end

  struct IUPnPEventSourceVTbl
    query_interface : Proc(IUPnPEventSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPEventSource*, UInt32)
    release : Proc(IUPnPEventSource*, UInt32)
    advise : Proc(IUPnPEventSource*, IUPnPEventSink, HRESULT)
    unadvise : Proc(IUPnPEventSource*, IUPnPEventSink, HRESULT)
  end

  IUPnPEventSource_GUID = "204810b5-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPEventSource = LibC::GUID.new(0x204810b5_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPEventSource
    lpVtbl : IUPnPEventSourceVTbl*
  end

  struct IUPnPRegistrarVTbl
    query_interface : Proc(IUPnPRegistrar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPRegistrar*, UInt32)
    release : Proc(IUPnPRegistrar*, UInt32)
    register_device : Proc(IUPnPRegistrar*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, UInt8**, HRESULT)
    register_running_device : Proc(IUPnPRegistrar*, UInt8*, IUnknown, UInt8*, UInt8*, Int32, UInt8**, HRESULT)
    register_device_provider : Proc(IUPnPRegistrar*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_unique_device_name : Proc(IUPnPRegistrar*, UInt8*, UInt8*, UInt8**, HRESULT)
    unregister_device : Proc(IUPnPRegistrar*, UInt8*, LibC::BOOL, HRESULT)
    unregister_device_provider : Proc(IUPnPRegistrar*, UInt8*, HRESULT)
  end

  IUPnPRegistrar_GUID = "204810b6-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPRegistrar = LibC::GUID.new(0x204810b6_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPRegistrar
    lpVtbl : IUPnPRegistrarVTbl*
  end

  struct IUPnPReregistrarVTbl
    query_interface : Proc(IUPnPReregistrar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPReregistrar*, UInt32)
    release : Proc(IUPnPReregistrar*, UInt32)
    reregister_device : Proc(IUPnPReregistrar*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, HRESULT)
    reregister_running_device : Proc(IUPnPReregistrar*, UInt8*, UInt8*, IUnknown, UInt8*, UInt8*, Int32, HRESULT)
  end

  IUPnPReregistrar_GUID = "204810b7-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPReregistrar = LibC::GUID.new(0x204810b7_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPReregistrar
    lpVtbl : IUPnPReregistrarVTbl*
  end

  struct IUPnPDeviceControlVTbl
    query_interface : Proc(IUPnPDeviceControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceControl*, UInt32)
    release : Proc(IUPnPDeviceControl*, UInt32)
    initialize : Proc(IUPnPDeviceControl*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_service_object : Proc(IUPnPDeviceControl*, UInt8*, UInt8*, IDispatch*, HRESULT)
  end

  IUPnPDeviceControl_GUID = "204810ba-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPDeviceControl = LibC::GUID.new(0x204810ba_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPDeviceControl
    lpVtbl : IUPnPDeviceControlVTbl*
  end

  struct IUPnPDeviceControlHttpHeadersVTbl
    query_interface : Proc(IUPnPDeviceControlHttpHeaders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceControlHttpHeaders*, UInt32)
    release : Proc(IUPnPDeviceControlHttpHeaders*, UInt32)
    get_additional_response_headers : Proc(IUPnPDeviceControlHttpHeaders*, UInt8**, HRESULT)
  end

  IUPnPDeviceControlHttpHeaders_GUID = "204810bb-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPDeviceControlHttpHeaders = LibC::GUID.new(0x204810bb_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPDeviceControlHttpHeaders
    lpVtbl : IUPnPDeviceControlHttpHeadersVTbl*
  end

  struct IUPnPDeviceProviderVTbl
    query_interface : Proc(IUPnPDeviceProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceProvider*, UInt32)
    release : Proc(IUPnPDeviceProvider*, UInt32)
    start : Proc(IUPnPDeviceProvider*, UInt8*, HRESULT)
    stop : Proc(IUPnPDeviceProvider*, HRESULT)
  end

  IUPnPDeviceProvider_GUID = "204810b8-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPDeviceProvider = LibC::GUID.new(0x204810b8_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPDeviceProvider
    lpVtbl : IUPnPDeviceProviderVTbl*
  end

  struct IUPnPRemoteEndpointInfoVTbl
    query_interface : Proc(IUPnPRemoteEndpointInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPRemoteEndpointInfo*, UInt32)
    release : Proc(IUPnPRemoteEndpointInfo*, UInt32)
    get_dword_value : Proc(IUPnPRemoteEndpointInfo*, UInt8*, UInt32*, HRESULT)
    get_string_value : Proc(IUPnPRemoteEndpointInfo*, UInt8*, UInt8**, HRESULT)
    get_guid_value : Proc(IUPnPRemoteEndpointInfo*, UInt8*, Guid*, HRESULT)
  end

  IUPnPRemoteEndpointInfo_GUID = "c92eb863-0269-4aff-9c72-75321bba2952"
  IID_IUPnPRemoteEndpointInfo = LibC::GUID.new(0xc92eb863_u32, 0x269_u16, 0x4aff_u16, StaticArray[0x9c_u8, 0x72_u8, 0x75_u8, 0x32_u8, 0x1b_u8, 0xba_u8, 0x29_u8, 0x52_u8])
  struct IUPnPRemoteEndpointInfo
    lpVtbl : IUPnPRemoteEndpointInfoVTbl*
  end


  # Params # pszenumeratorname : LibC::LPWSTR [In],pszparentdeviceinstance : LibC::LPWSTR [In],pcreateinfo : SW_DEVICE_CREATE_INFO* [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In],pcallback : SW_DEVICE_CREATE_CALLBACK [In],pcontext : Void* [In],phswdevice : LibC::IntPtrT* [In]
  fun SwDeviceCreate(pszenumeratorname : LibC::LPWSTR, pszparentdeviceinstance : LibC::LPWSTR, pcreateinfo : SW_DEVICE_CREATE_INFO*, cpropertycount : UInt32, pproperties : DEVPROPERTY*, pcallback : SW_DEVICE_CREATE_CALLBACK, pcontext : Void*, phswdevice : LibC::IntPtrT*) : HRESULT

  # Params # hswdevice : HSWDEVICE [In]
  fun SwDeviceClose(hswdevice : HSWDEVICE) : Void

  # Params # hswdevice : HSWDEVICE [In],lifetime : SW_DEVICE_LIFETIME [In]
  fun SwDeviceSetLifetime(hswdevice : HSWDEVICE, lifetime : SW_DEVICE_LIFETIME) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],plifetime : SW_DEVICE_LIFETIME* [In]
  fun SwDeviceGetLifetime(hswdevice : HSWDEVICE, plifetime : SW_DEVICE_LIFETIME*) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In]
  fun SwDevicePropertySet(hswdevice : HSWDEVICE, cpropertycount : UInt32, pproperties : DEVPROPERTY*) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],pinterfaceclassguid : Guid* [In],pszreferencestring : LibC::LPWSTR [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In],fenabled : LibC::BOOL [In],ppszdeviceinterfaceid : LibC::LPWSTR* [In]
  fun SwDeviceInterfaceRegister(hswdevice : HSWDEVICE, pinterfaceclassguid : Guid*, pszreferencestring : LibC::LPWSTR, cpropertycount : UInt32, pproperties : DEVPROPERTY*, fenabled : LibC::BOOL, ppszdeviceinterfaceid : LibC::LPWSTR*) : HRESULT

  # Params # pmem : Void* [In]
  fun SwMemFree(pmem : Void*) : Void

  # Params # hswdevice : HSWDEVICE [In],pszdeviceinterfaceid : LibC::LPWSTR [In],fenabled : LibC::BOOL [In]
  fun SwDeviceInterfaceSetState(hswdevice : HSWDEVICE, pszdeviceinterfaceid : LibC::LPWSTR, fenabled : LibC::BOOL) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],pszdeviceinterfaceid : LibC::LPWSTR [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In]
  fun SwDeviceInterfacePropertySet(hswdevice : HSWDEVICE, pszdeviceinterfaceid : LibC::LPWSTR, cpropertycount : UInt32, pproperties : DEVPROPERTY*) : HRESULT
end
struct LibWin32::IUPnPDeviceFinder
  def query_interface(this : IUPnPDeviceFinder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceFinder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceFinder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPDeviceFinder*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPDeviceFinder*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPDeviceFinder*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPDeviceFinder*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def find_by_type(this : IUPnPDeviceFinder*, bstrtypeuri : UInt8*, dwflags : UInt32, pdevices : IUPnPDevices*) : HRESULT
    @lpVtbl.value.find_by_type.call(this, bstrtypeuri, dwflags, pdevices)
  end
  def create_async_find(this : IUPnPDeviceFinder*, bstrtypeuri : UInt8*, dwflags : UInt32, punkdevicefindercallback : IUnknown, plfinddata : Int32*) : HRESULT
    @lpVtbl.value.create_async_find.call(this, bstrtypeuri, dwflags, punkdevicefindercallback, plfinddata)
  end
  def start_async_find(this : IUPnPDeviceFinder*, lfinddata : Int32) : HRESULT
    @lpVtbl.value.start_async_find.call(this, lfinddata)
  end
  def cancel_async_find(this : IUPnPDeviceFinder*, lfinddata : Int32) : HRESULT
    @lpVtbl.value.cancel_async_find.call(this, lfinddata)
  end
  def find_by_udn(this : IUPnPDeviceFinder*, bstrudn : UInt8*, pdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.find_by_udn.call(this, bstrudn, pdevice)
  end
end
struct LibWin32::IUPnPAddressFamilyControl
  def query_interface(this : IUPnPAddressFamilyControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPAddressFamilyControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPAddressFamilyControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_address_family(this : IUPnPAddressFamilyControl*, dwflags : Int32) : HRESULT
    @lpVtbl.value.set_address_family.call(this, dwflags)
  end
  def get_address_family(this : IUPnPAddressFamilyControl*, pdwflags : Int32*) : HRESULT
    @lpVtbl.value.get_address_family.call(this, pdwflags)
  end
end
struct LibWin32::IUPnPHttpHeaderControl
  def query_interface(this : IUPnPHttpHeaderControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPHttpHeaderControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPHttpHeaderControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_request_headers(this : IUPnPHttpHeaderControl*, bstrhttpheaders : UInt8*) : HRESULT
    @lpVtbl.value.add_request_headers.call(this, bstrhttpheaders)
  end
end
struct LibWin32::IUPnPDeviceFinderCallback
  def query_interface(this : IUPnPDeviceFinderCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceFinderCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceFinderCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def device_added(this : IUPnPDeviceFinderCallback*, lfinddata : Int32, pdevice : IUPnPDevice) : HRESULT
    @lpVtbl.value.device_added.call(this, lfinddata, pdevice)
  end
  def device_removed(this : IUPnPDeviceFinderCallback*, lfinddata : Int32, bstrudn : UInt8*) : HRESULT
    @lpVtbl.value.device_removed.call(this, lfinddata, bstrudn)
  end
  def search_complete(this : IUPnPDeviceFinderCallback*, lfinddata : Int32) : HRESULT
    @lpVtbl.value.search_complete.call(this, lfinddata)
  end
end
struct LibWin32::IUPnPServices
  def query_interface(this : IUPnPServices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPServices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPServices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPServices*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPServices*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPServices*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPServices*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IUPnPServices*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get__new_enum(this : IUPnPServices*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IUPnPServices*, bstrserviceid : UInt8*, ppservice : IUPnPService*) : HRESULT
    @lpVtbl.value.get_item.call(this, bstrserviceid, ppservice)
  end
end
struct LibWin32::IUPnPService
  def query_interface(this : IUPnPService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPService*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPService*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPService*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPService*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def query_state_variable(this : IUPnPService*, bstrvariablename : UInt8*, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.query_state_variable.call(this, bstrvariablename, pvalue)
  end
  def invoke_action(this : IUPnPService*, bstractionname : UInt8*, vinactionargs : VARIANT, pvoutactionargs : VARIANT*, pvretval : VARIANT*) : HRESULT
    @lpVtbl.value.invoke_action.call(this, bstractionname, vinactionargs, pvoutactionargs, pvretval)
  end
  def get_service_type_identifier(this : IUPnPService*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_identifier.call(this, pval)
  end
  def add_callback(this : IUPnPService*, punkcallback : IUnknown) : HRESULT
    @lpVtbl.value.add_callback.call(this, punkcallback)
  end
  def get_id(this : IUPnPService*, pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pbstrid)
  end
  def get_last_transport_status(this : IUPnPService*, plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_last_transport_status.call(this, plvalue)
  end
end
struct LibWin32::IUPnPAsyncResult
  def query_interface(this : IUPnPAsyncResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPAsyncResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPAsyncResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def async_operation_complete(this : IUPnPAsyncResult*, ullrequestid : UInt64) : HRESULT
    @lpVtbl.value.async_operation_complete.call(this, ullrequestid)
  end
end
struct LibWin32::IUPnPServiceAsync
  def query_interface(this : IUPnPServiceAsync*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPServiceAsync*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPServiceAsync*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_invoke_action(this : IUPnPServiceAsync*, bstractionname : UInt8*, vinactionargs : VARIANT, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_invoke_action.call(this, bstractionname, vinactionargs, pasyncresult, pullrequestid)
  end
  def end_invoke_action(this : IUPnPServiceAsync*, ullrequestid : UInt64, pvoutactionargs : VARIANT*, pvretval : VARIANT*) : HRESULT
    @lpVtbl.value.end_invoke_action.call(this, ullrequestid, pvoutactionargs, pvretval)
  end
  def begin_query_state_variable(this : IUPnPServiceAsync*, bstrvariablename : UInt8*, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_query_state_variable.call(this, bstrvariablename, pasyncresult, pullrequestid)
  end
  def end_query_state_variable(this : IUPnPServiceAsync*, ullrequestid : UInt64, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.end_query_state_variable.call(this, ullrequestid, pvalue)
  end
  def begin_subscribe_to_events(this : IUPnPServiceAsync*, punkcallback : IUnknown, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_subscribe_to_events.call(this, punkcallback, pasyncresult, pullrequestid)
  end
  def end_subscribe_to_events(this : IUPnPServiceAsync*, ullrequestid : UInt64) : HRESULT
    @lpVtbl.value.end_subscribe_to_events.call(this, ullrequestid)
  end
  def begin_scpd_download(this : IUPnPServiceAsync*, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_scpd_download.call(this, pasyncresult, pullrequestid)
  end
  def end_scpd_download(this : IUPnPServiceAsync*, ullrequestid : UInt64, pbstrscpddoc : UInt8**) : HRESULT
    @lpVtbl.value.end_scpd_download.call(this, ullrequestid, pbstrscpddoc)
  end
  def cancel_async_operation(this : IUPnPServiceAsync*, ullrequestid : UInt64) : HRESULT
    @lpVtbl.value.cancel_async_operation.call(this, ullrequestid)
  end
end
struct LibWin32::IUPnPServiceCallback
  def query_interface(this : IUPnPServiceCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPServiceCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPServiceCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def state_variable_changed(this : IUPnPServiceCallback*, pus : IUPnPService, pcwszstatevarname : LibC::LPWSTR, vavalue : VARIANT) : HRESULT
    @lpVtbl.value.state_variable_changed.call(this, pus, pcwszstatevarname, vavalue)
  end
  def service_instance_died(this : IUPnPServiceCallback*, pus : IUPnPService) : HRESULT
    @lpVtbl.value.service_instance_died.call(this, pus)
  end
end
struct LibWin32::IUPnPServiceEnumProperty
  def query_interface(this : IUPnPServiceEnumProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPServiceEnumProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPServiceEnumProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_service_enum_property(this : IUPnPServiceEnumProperty*, dwmask : UInt32) : HRESULT
    @lpVtbl.value.set_service_enum_property.call(this, dwmask)
  end
end
struct LibWin32::IUPnPServiceDocumentAccess
  def query_interface(this : IUPnPServiceDocumentAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPServiceDocumentAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPServiceDocumentAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_document_url(this : IUPnPServiceDocumentAccess*, pbstrdocurl : UInt8**) : HRESULT
    @lpVtbl.value.get_document_url.call(this, pbstrdocurl)
  end
  def get_document(this : IUPnPServiceDocumentAccess*, pbstrdoc : UInt8**) : HRESULT
    @lpVtbl.value.get_document.call(this, pbstrdoc)
  end
end
struct LibWin32::IUPnPDevices
  def query_interface(this : IUPnPDevices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDevices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDevices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPDevices*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPDevices*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPDevices*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPDevices*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IUPnPDevices*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get__new_enum(this : IUPnPDevices*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppunk)
  end
  def get_item(this : IUPnPDevices*, bstrudn : UInt8*, ppdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.get_item.call(this, bstrudn, ppdevice)
  end
end
struct LibWin32::IUPnPDevice
  def query_interface(this : IUPnPDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPDevice*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPDevice*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPDevice*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPDevice*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_is_root_device(this : IUPnPDevice*, pvarb : Int16*) : HRESULT
    @lpVtbl.value.get_is_root_device.call(this, pvarb)
  end
  def get_root_device(this : IUPnPDevice*, ppudrootdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.get_root_device.call(this, ppudrootdevice)
  end
  def get_parent_device(this : IUPnPDevice*, ppuddeviceparent : IUPnPDevice*) : HRESULT
    @lpVtbl.value.get_parent_device.call(this, ppuddeviceparent)
  end
  def get_has_children(this : IUPnPDevice*, pvarb : Int16*) : HRESULT
    @lpVtbl.value.get_has_children.call(this, pvarb)
  end
  def get_children(this : IUPnPDevice*, ppudchildren : IUPnPDevices*) : HRESULT
    @lpVtbl.value.get_children.call(this, ppudchildren)
  end
  def get_unique_device_name(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_device_name.call(this, pbstr)
  end
  def get_friendly_name(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.call(this, pbstr)
  end
  def get_type(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_type.call(this, pbstr)
  end
  def get_presentation_url(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_presentation_url.call(this, pbstr)
  end
  def get_manufacturer_name(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_manufacturer_name.call(this, pbstr)
  end
  def get_manufacturer_url(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_manufacturer_url.call(this, pbstr)
  end
  def get_model_name(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_model_name.call(this, pbstr)
  end
  def get_model_number(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_model_number.call(this, pbstr)
  end
  def get_description(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pbstr)
  end
  def get_model_url(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_model_url.call(this, pbstr)
  end
  def get_upc(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_upc.call(this, pbstr)
  end
  def get_serial_number(this : IUPnPDevice*, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_serial_number.call(this, pbstr)
  end
  def icon_url(this : IUPnPDevice*, bstrencodingformat : UInt8*, lsizex : Int32, lsizey : Int32, lbitdepth : Int32, pbstriconurl : UInt8**) : HRESULT
    @lpVtbl.value.icon_url.call(this, bstrencodingformat, lsizex, lsizey, lbitdepth, pbstriconurl)
  end
  def get_services(this : IUPnPDevice*, ppusservices : IUPnPServices*) : HRESULT
    @lpVtbl.value.get_services.call(this, ppusservices)
  end
end
struct LibWin32::IUPnPDeviceDocumentAccess
  def query_interface(this : IUPnPDeviceDocumentAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceDocumentAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceDocumentAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_document_url(this : IUPnPDeviceDocumentAccess*, pbstrdocument : UInt8**) : HRESULT
    @lpVtbl.value.get_document_url.call(this, pbstrdocument)
  end
end
struct LibWin32::IUPnPDeviceDocumentAccessEx
  def query_interface(this : IUPnPDeviceDocumentAccessEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceDocumentAccessEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceDocumentAccessEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_document(this : IUPnPDeviceDocumentAccessEx*, pbstrdocument : UInt8**) : HRESULT
    @lpVtbl.value.get_document.call(this, pbstrdocument)
  end
end
struct LibWin32::IUPnPDescriptionDocument
  def query_interface(this : IUPnPDescriptionDocument*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDescriptionDocument*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDescriptionDocument*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IUPnPDescriptionDocument*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IUPnPDescriptionDocument*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IUPnPDescriptionDocument*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IUPnPDescriptionDocument*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_ready_state(this : IUPnPDescriptionDocument*, plreadystate : Int32*) : HRESULT
    @lpVtbl.value.get_ready_state.call(this, plreadystate)
  end
  def load(this : IUPnPDescriptionDocument*, bstrurl : UInt8*) : HRESULT
    @lpVtbl.value.load.call(this, bstrurl)
  end
  def load_async(this : IUPnPDescriptionDocument*, bstrurl : UInt8*, punkcallback : IUnknown) : HRESULT
    @lpVtbl.value.load_async.call(this, bstrurl, punkcallback)
  end
  def get_load_result(this : IUPnPDescriptionDocument*, phrerror : Int32*) : HRESULT
    @lpVtbl.value.get_load_result.call(this, phrerror)
  end
  def abort(this : IUPnPDescriptionDocument*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
  def root_device(this : IUPnPDescriptionDocument*, ppudrootdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.root_device.call(this, ppudrootdevice)
  end
  def device_by_udn(this : IUPnPDescriptionDocument*, bstrudn : UInt8*, ppuddevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.device_by_udn.call(this, bstrudn, ppuddevice)
  end
end
struct LibWin32::IUPnPDeviceFinderAddCallbackWithInterface
  def query_interface(this : IUPnPDeviceFinderAddCallbackWithInterface*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceFinderAddCallbackWithInterface*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceFinderAddCallbackWithInterface*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def device_added_with_interface(this : IUPnPDeviceFinderAddCallbackWithInterface*, lfinddata : Int32, pdevice : IUPnPDevice, pguidinterface : Guid*) : HRESULT
    @lpVtbl.value.device_added_with_interface.call(this, lfinddata, pdevice, pguidinterface)
  end
end
struct LibWin32::IUPnPDescriptionDocumentCallback
  def query_interface(this : IUPnPDescriptionDocumentCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDescriptionDocumentCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDescriptionDocumentCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def load_complete(this : IUPnPDescriptionDocumentCallback*, hrloadresult : HRESULT) : HRESULT
    @lpVtbl.value.load_complete.call(this, hrloadresult)
  end
end
struct LibWin32::IUPnPEventSink
  def query_interface(this : IUPnPEventSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPEventSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPEventSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_state_changed(this : IUPnPEventSink*, cchanges : UInt32, rgdispidchanges : Int32*) : HRESULT
    @lpVtbl.value.on_state_changed.call(this, cchanges, rgdispidchanges)
  end
  def on_state_changed_safe(this : IUPnPEventSink*, varsadispidchanges : VARIANT) : HRESULT
    @lpVtbl.value.on_state_changed_safe.call(this, varsadispidchanges)
  end
end
struct LibWin32::IUPnPEventSource
  def query_interface(this : IUPnPEventSource*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPEventSource*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPEventSource*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise(this : IUPnPEventSource*, pessubscriber : IUPnPEventSink) : HRESULT
    @lpVtbl.value.advise.call(this, pessubscriber)
  end
  def unadvise(this : IUPnPEventSource*, pessubscriber : IUPnPEventSink) : HRESULT
    @lpVtbl.value.unadvise.call(this, pessubscriber)
  end
end
struct LibWin32::IUPnPRegistrar
  def query_interface(this : IUPnPRegistrar*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPRegistrar*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPRegistrar*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_device(this : IUPnPRegistrar*, bstrxmldesc : UInt8*, bstrprogiddevicecontrolclass : UInt8*, bstrinitstring : UInt8*, bstrcontainerid : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32, pbstrdeviceidentifier : UInt8**) : HRESULT
    @lpVtbl.value.register_device.call(this, bstrxmldesc, bstrprogiddevicecontrolclass, bstrinitstring, bstrcontainerid, bstrresourcepath, nlifetime, pbstrdeviceidentifier)
  end
  def register_running_device(this : IUPnPRegistrar*, bstrxmldesc : UInt8*, punkdevicecontrol : IUnknown, bstrinitstring : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32, pbstrdeviceidentifier : UInt8**) : HRESULT
    @lpVtbl.value.register_running_device.call(this, bstrxmldesc, punkdevicecontrol, bstrinitstring, bstrresourcepath, nlifetime, pbstrdeviceidentifier)
  end
  def register_device_provider(this : IUPnPRegistrar*, bstrprovidername : UInt8*, bstrprogidproviderclass : UInt8*, bstrinitstring : UInt8*, bstrcontainerid : UInt8*) : HRESULT
    @lpVtbl.value.register_device_provider.call(this, bstrprovidername, bstrprogidproviderclass, bstrinitstring, bstrcontainerid)
  end
  def get_unique_device_name(this : IUPnPRegistrar*, bstrdeviceidentifier : UInt8*, bstrtemplateudn : UInt8*, pbstrudn : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_device_name.call(this, bstrdeviceidentifier, bstrtemplateudn, pbstrudn)
  end
  def unregister_device(this : IUPnPRegistrar*, bstrdeviceidentifier : UInt8*, fpermanent : LibC::BOOL) : HRESULT
    @lpVtbl.value.unregister_device.call(this, bstrdeviceidentifier, fpermanent)
  end
  def unregister_device_provider(this : IUPnPRegistrar*, bstrprovidername : UInt8*) : HRESULT
    @lpVtbl.value.unregister_device_provider.call(this, bstrprovidername)
  end
end
struct LibWin32::IUPnPReregistrar
  def query_interface(this : IUPnPReregistrar*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPReregistrar*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPReregistrar*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reregister_device(this : IUPnPReregistrar*, bstrdeviceidentifier : UInt8*, bstrxmldesc : UInt8*, bstrprogiddevicecontrolclass : UInt8*, bstrinitstring : UInt8*, bstrcontainerid : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32) : HRESULT
    @lpVtbl.value.reregister_device.call(this, bstrdeviceidentifier, bstrxmldesc, bstrprogiddevicecontrolclass, bstrinitstring, bstrcontainerid, bstrresourcepath, nlifetime)
  end
  def reregister_running_device(this : IUPnPReregistrar*, bstrdeviceidentifier : UInt8*, bstrxmldesc : UInt8*, punkdevicecontrol : IUnknown, bstrinitstring : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32) : HRESULT
    @lpVtbl.value.reregister_running_device.call(this, bstrdeviceidentifier, bstrxmldesc, punkdevicecontrol, bstrinitstring, bstrresourcepath, nlifetime)
  end
end
struct LibWin32::IUPnPDeviceControl
  def query_interface(this : IUPnPDeviceControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IUPnPDeviceControl*, bstrxmldesc : UInt8*, bstrdeviceidentifier : UInt8*, bstrinitstring : UInt8*) : HRESULT
    @lpVtbl.value.initialize.call(this, bstrxmldesc, bstrdeviceidentifier, bstrinitstring)
  end
  def get_service_object(this : IUPnPDeviceControl*, bstrudn : UInt8*, bstrserviceid : UInt8*, ppdispservice : IDispatch*) : HRESULT
    @lpVtbl.value.get_service_object.call(this, bstrudn, bstrserviceid, ppdispservice)
  end
end
struct LibWin32::IUPnPDeviceControlHttpHeaders
  def query_interface(this : IUPnPDeviceControlHttpHeaders*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceControlHttpHeaders*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceControlHttpHeaders*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_additional_response_headers(this : IUPnPDeviceControlHttpHeaders*, bstrhttpresponseheaders : UInt8**) : HRESULT
    @lpVtbl.value.get_additional_response_headers.call(this, bstrhttpresponseheaders)
  end
end
struct LibWin32::IUPnPDeviceProvider
  def query_interface(this : IUPnPDeviceProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPDeviceProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPDeviceProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start(this : IUPnPDeviceProvider*, bstrinitstring : UInt8*) : HRESULT
    @lpVtbl.value.start.call(this, bstrinitstring)
  end
  def stop(this : IUPnPDeviceProvider*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
end
struct LibWin32::IUPnPRemoteEndpointInfo
  def query_interface(this : IUPnPRemoteEndpointInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUPnPRemoteEndpointInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUPnPRemoteEndpointInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_dword_value(this : IUPnPRemoteEndpointInfo*, bstrvaluename : UInt8*, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword_value.call(this, bstrvaluename, pdwvalue)
  end
  def get_string_value(this : IUPnPRemoteEndpointInfo*, bstrvaluename : UInt8*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_string_value.call(this, bstrvaluename, pbstrvalue)
  end
  def get_guid_value(this : IUPnPRemoteEndpointInfo*, bstrvaluename : UInt8*, pguidvalue : Guid*) : HRESULT
    @lpVtbl.value.get_guid_value.call(this, bstrvaluename, pguidvalue)
  end
end
