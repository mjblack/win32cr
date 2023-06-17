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
  fun SwDeviceClose(hswdevice : HSWDEVICE)

  # Params # hswdevice : HSWDEVICE [In],lifetime : SW_DEVICE_LIFETIME [In]
  fun SwDeviceSetLifetime(hswdevice : HSWDEVICE, lifetime : SW_DEVICE_LIFETIME) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],plifetime : SW_DEVICE_LIFETIME* [In]
  fun SwDeviceGetLifetime(hswdevice : HSWDEVICE, plifetime : SW_DEVICE_LIFETIME*) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In]
  fun SwDevicePropertySet(hswdevice : HSWDEVICE, cpropertycount : UInt32, pproperties : DEVPROPERTY*) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],pinterfaceclassguid : Guid* [In],pszreferencestring : LibC::LPWSTR [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In],fenabled : LibC::BOOL [In],ppszdeviceinterfaceid : LibC::LPWSTR* [In]
  fun SwDeviceInterfaceRegister(hswdevice : HSWDEVICE, pinterfaceclassguid : Guid*, pszreferencestring : LibC::LPWSTR, cpropertycount : UInt32, pproperties : DEVPROPERTY*, fenabled : LibC::BOOL, ppszdeviceinterfaceid : LibC::LPWSTR*) : HRESULT

  # Params # pmem : Void* [In]
  fun SwMemFree(pmem : Void*)

  # Params # hswdevice : HSWDEVICE [In],pszdeviceinterfaceid : LibC::LPWSTR [In],fenabled : LibC::BOOL [In]
  fun SwDeviceInterfaceSetState(hswdevice : HSWDEVICE, pszdeviceinterfaceid : LibC::LPWSTR, fenabled : LibC::BOOL) : HRESULT

  # Params # hswdevice : HSWDEVICE [In],pszdeviceinterfaceid : LibC::LPWSTR [In],cpropertycount : UInt32 [In],pproperties : DEVPROPERTY* [In]
  fun SwDeviceInterfacePropertySet(hswdevice : HSWDEVICE, pszdeviceinterfaceid : LibC::LPWSTR, cpropertycount : UInt32, pproperties : DEVPROPERTY*) : HRESULT
end