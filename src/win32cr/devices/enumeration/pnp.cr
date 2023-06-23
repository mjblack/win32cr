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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    find_by_type : UInt64
    create_async_find : UInt64
    start_async_find : UInt64
    cancel_async_find : UInt64
    find_by_udn : UInt64
  end

  IUPnPDeviceFinder_GUID = "adda3d55-6f72-4319-bff9-18600a539b10"
  IID_IUPnPDeviceFinder = LibC::GUID.new(0xadda3d55_u32, 0x6f72_u16, 0x4319_u16, StaticArray[0xbf_u8, 0xf9_u8, 0x18_u8, 0x60_u8, 0xa_u8, 0x53_u8, 0x9b_u8, 0x10_u8])
  struct IUPnPDeviceFinder
    lpVtbl : IUPnPDeviceFinderVTbl*
  end

  struct IUPnPAddressFamilyControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_address_family : UInt64
    get_address_family : UInt64
  end

  IUPnPAddressFamilyControl_GUID = "e3bf6178-694e-459f-a5a6-191ea0ffa1c7"
  IID_IUPnPAddressFamilyControl = LibC::GUID.new(0xe3bf6178_u32, 0x694e_u16, 0x459f_u16, StaticArray[0xa5_u8, 0xa6_u8, 0x19_u8, 0x1e_u8, 0xa0_u8, 0xff_u8, 0xa1_u8, 0xc7_u8])
  struct IUPnPAddressFamilyControl
    lpVtbl : IUPnPAddressFamilyControlVTbl*
  end

  struct IUPnPHttpHeaderControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_request_headers : UInt64
  end

  IUPnPHttpHeaderControl_GUID = "0405af4f-8b5c-447c-80f2-b75984a31f3c"
  IID_IUPnPHttpHeaderControl = LibC::GUID.new(0x405af4f_u32, 0x8b5c_u16, 0x447c_u16, StaticArray[0x80_u8, 0xf2_u8, 0xb7_u8, 0x59_u8, 0x84_u8, 0xa3_u8, 0x1f_u8, 0x3c_u8])
  struct IUPnPHttpHeaderControl
    lpVtbl : IUPnPHttpHeaderControlVTbl*
  end

  struct IUPnPDeviceFinderCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    device_added : UInt64
    device_removed : UInt64
    search_complete : UInt64
  end

  IUPnPDeviceFinderCallback_GUID = "415a984a-88b3-49f3-92af-0508bedf0d6c"
  IID_IUPnPDeviceFinderCallback = LibC::GUID.new(0x415a984a_u32, 0x88b3_u16, 0x49f3_u16, StaticArray[0x92_u8, 0xaf_u8, 0x5_u8, 0x8_u8, 0xbe_u8, 0xdf_u8, 0xd_u8, 0x6c_u8])
  struct IUPnPDeviceFinderCallback
    lpVtbl : IUPnPDeviceFinderCallbackVTbl*
  end

  struct IUPnPServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_item : UInt64
  end

  IUPnPServices_GUID = "3f8c8e9e-9a7a-4dc8-bc41-ff31fa374956"
  IID_IUPnPServices = LibC::GUID.new(0x3f8c8e9e_u32, 0x9a7a_u16, 0x4dc8_u16, StaticArray[0xbc_u8, 0x41_u8, 0xff_u8, 0x31_u8, 0xfa_u8, 0x37_u8, 0x49_u8, 0x56_u8])
  struct IUPnPServices
    lpVtbl : IUPnPServicesVTbl*
  end

  struct IUPnPServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    query_state_variable : UInt64
    invoke_action : UInt64
    get_service_type_identifier : UInt64
    add_callback : UInt64
    get_id : UInt64
    get_last_transport_status : UInt64
  end

  IUPnPService_GUID = "a295019c-dc65-47dd-90dc-7fe918a1ab44"
  IID_IUPnPService = LibC::GUID.new(0xa295019c_u32, 0xdc65_u16, 0x47dd_u16, StaticArray[0x90_u8, 0xdc_u8, 0x7f_u8, 0xe9_u8, 0x18_u8, 0xa1_u8, 0xab_u8, 0x44_u8])
  struct IUPnPService
    lpVtbl : IUPnPServiceVTbl*
  end

  struct IUPnPAsyncResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    async_operation_complete : UInt64
  end

  IUPnPAsyncResult_GUID = "4d65fd08-d13e-4274-9c8b-dd8d028c8644"
  IID_IUPnPAsyncResult = LibC::GUID.new(0x4d65fd08_u32, 0xd13e_u16, 0x4274_u16, StaticArray[0x9c_u8, 0x8b_u8, 0xdd_u8, 0x8d_u8, 0x2_u8, 0x8c_u8, 0x86_u8, 0x44_u8])
  struct IUPnPAsyncResult
    lpVtbl : IUPnPAsyncResultVTbl*
  end

  struct IUPnPServiceAsyncVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_invoke_action : UInt64
    end_invoke_action : UInt64
    begin_query_state_variable : UInt64
    end_query_state_variable : UInt64
    begin_subscribe_to_events : UInt64
    end_subscribe_to_events : UInt64
    begin_scpd_download : UInt64
    end_scpd_download : UInt64
    cancel_async_operation : UInt64
  end

  IUPnPServiceAsync_GUID = "098bdaf5-5ec1-49e7-a260-b3a11dd8680c"
  IID_IUPnPServiceAsync = LibC::GUID.new(0x98bdaf5_u32, 0x5ec1_u16, 0x49e7_u16, StaticArray[0xa2_u8, 0x60_u8, 0xb3_u8, 0xa1_u8, 0x1d_u8, 0xd8_u8, 0x68_u8, 0xc_u8])
  struct IUPnPServiceAsync
    lpVtbl : IUPnPServiceAsyncVTbl*
  end

  struct IUPnPServiceCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    state_variable_changed : UInt64
    service_instance_died : UInt64
  end

  IUPnPServiceCallback_GUID = "31fadca9-ab73-464b-b67d-5c1d0f83c8b8"
  IID_IUPnPServiceCallback = LibC::GUID.new(0x31fadca9_u32, 0xab73_u16, 0x464b_u16, StaticArray[0xb6_u8, 0x7d_u8, 0x5c_u8, 0x1d_u8, 0xf_u8, 0x83_u8, 0xc8_u8, 0xb8_u8])
  struct IUPnPServiceCallback
    lpVtbl : IUPnPServiceCallbackVTbl*
  end

  struct IUPnPServiceEnumPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_service_enum_property : UInt64
  end

  IUPnPServiceEnumProperty_GUID = "38873b37-91bb-49f4-b249-2e8efbb8a816"
  IID_IUPnPServiceEnumProperty = LibC::GUID.new(0x38873b37_u32, 0x91bb_u16, 0x49f4_u16, StaticArray[0xb2_u8, 0x49_u8, 0x2e_u8, 0x8e_u8, 0xfb_u8, 0xb8_u8, 0xa8_u8, 0x16_u8])
  struct IUPnPServiceEnumProperty
    lpVtbl : IUPnPServiceEnumPropertyVTbl*
  end

  struct IUPnPServiceDocumentAccessVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_document_url : UInt64
    get_document : UInt64
  end

  IUPnPServiceDocumentAccess_GUID = "21905529-0a5e-4589-825d-7e6d87ea6998"
  IID_IUPnPServiceDocumentAccess = LibC::GUID.new(0x21905529_u32, 0xa5e_u16, 0x4589_u16, StaticArray[0x82_u8, 0x5d_u8, 0x7e_u8, 0x6d_u8, 0x87_u8, 0xea_u8, 0x69_u8, 0x98_u8])
  struct IUPnPServiceDocumentAccess
    lpVtbl : IUPnPServiceDocumentAccessVTbl*
  end

  struct IUPnPDevicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_item : UInt64
  end

  IUPnPDevices_GUID = "fdbc0c73-bda3-4c66-ac4f-f2d96fdad68c"
  IID_IUPnPDevices = LibC::GUID.new(0xfdbc0c73_u32, 0xbda3_u16, 0x4c66_u16, StaticArray[0xac_u8, 0x4f_u8, 0xf2_u8, 0xd9_u8, 0x6f_u8, 0xda_u8, 0xd6_u8, 0x8c_u8])
  struct IUPnPDevices
    lpVtbl : IUPnPDevicesVTbl*
  end

  struct IUPnPDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_is_root_device : UInt64
    get_root_device : UInt64
    get_parent_device : UInt64
    get_has_children : UInt64
    get_children : UInt64
    get_unique_device_name : UInt64
    get_friendly_name : UInt64
    get_type : UInt64
    get_presentation_url : UInt64
    get_manufacturer_name : UInt64
    get_manufacturer_url : UInt64
    get_model_name : UInt64
    get_model_number : UInt64
    get_description : UInt64
    get_model_url : UInt64
    get_upc : UInt64
    get_serial_number : UInt64
    icon_url : UInt64
    get_services : UInt64
  end

  IUPnPDevice_GUID = "3d44d0d1-98c9-4889-acd1-f9d674bf2221"
  IID_IUPnPDevice = LibC::GUID.new(0x3d44d0d1_u32, 0x98c9_u16, 0x4889_u16, StaticArray[0xac_u8, 0xd1_u8, 0xf9_u8, 0xd6_u8, 0x74_u8, 0xbf_u8, 0x22_u8, 0x21_u8])
  struct IUPnPDevice
    lpVtbl : IUPnPDeviceVTbl*
  end

  struct IUPnPDeviceDocumentAccessVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_document_url : UInt64
  end

  IUPnPDeviceDocumentAccess_GUID = "e7772804-3287-418e-9072-cf2b47238981"
  IID_IUPnPDeviceDocumentAccess = LibC::GUID.new(0xe7772804_u32, 0x3287_u16, 0x418e_u16, StaticArray[0x90_u8, 0x72_u8, 0xcf_u8, 0x2b_u8, 0x47_u8, 0x23_u8, 0x89_u8, 0x81_u8])
  struct IUPnPDeviceDocumentAccess
    lpVtbl : IUPnPDeviceDocumentAccessVTbl*
  end

  struct IUPnPDeviceDocumentAccessExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_document : UInt64
  end

  IUPnPDeviceDocumentAccessEx_GUID = "c4bc4050-6178-4bd1-a4b8-6398321f3247"
  IID_IUPnPDeviceDocumentAccessEx = LibC::GUID.new(0xc4bc4050_u32, 0x6178_u16, 0x4bd1_u16, StaticArray[0xa4_u8, 0xb8_u8, 0x63_u8, 0x98_u8, 0x32_u8, 0x1f_u8, 0x32_u8, 0x47_u8])
  struct IUPnPDeviceDocumentAccessEx
    lpVtbl : IUPnPDeviceDocumentAccessExVTbl*
  end

  struct IUPnPDescriptionDocumentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_ready_state : UInt64
    load : UInt64
    load_async : UInt64
    get_load_result : UInt64
    abort : UInt64
    root_device : UInt64
    device_by_udn : UInt64
  end

  IUPnPDescriptionDocument_GUID = "11d1c1b2-7daa-4c9e-9595-7f82ed206d1e"
  IID_IUPnPDescriptionDocument = LibC::GUID.new(0x11d1c1b2_u32, 0x7daa_u16, 0x4c9e_u16, StaticArray[0x95_u8, 0x95_u8, 0x7f_u8, 0x82_u8, 0xed_u8, 0x20_u8, 0x6d_u8, 0x1e_u8])
  struct IUPnPDescriptionDocument
    lpVtbl : IUPnPDescriptionDocumentVTbl*
  end

  struct IUPnPDeviceFinderAddCallbackWithInterfaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    device_added_with_interface : UInt64
  end

  IUPnPDeviceFinderAddCallbackWithInterface_GUID = "983dfc0b-1796-44df-8975-ca545b620ee5"
  IID_IUPnPDeviceFinderAddCallbackWithInterface = LibC::GUID.new(0x983dfc0b_u32, 0x1796_u16, 0x44df_u16, StaticArray[0x89_u8, 0x75_u8, 0xca_u8, 0x54_u8, 0x5b_u8, 0x62_u8, 0xe_u8, 0xe5_u8])
  struct IUPnPDeviceFinderAddCallbackWithInterface
    lpVtbl : IUPnPDeviceFinderAddCallbackWithInterfaceVTbl*
  end

  struct IUPnPDescriptionDocumentCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_complete : UInt64
  end

  IUPnPDescriptionDocumentCallback_GUID = "77394c69-5486-40d6-9bc3-4991983e02da"
  IID_IUPnPDescriptionDocumentCallback = LibC::GUID.new(0x77394c69_u32, 0x5486_u16, 0x40d6_u16, StaticArray[0x9b_u8, 0xc3_u8, 0x49_u8, 0x91_u8, 0x98_u8, 0x3e_u8, 0x2_u8, 0xda_u8])
  struct IUPnPDescriptionDocumentCallback
    lpVtbl : IUPnPDescriptionDocumentCallbackVTbl*
  end

  struct IUPnPEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_state_changed : UInt64
    on_state_changed_safe : UInt64
  end

  IUPnPEventSink_GUID = "204810b4-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPEventSink = LibC::GUID.new(0x204810b4_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPEventSink
    lpVtbl : IUPnPEventSinkVTbl*
  end

  struct IUPnPEventSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise : UInt64
    unadvise : UInt64
  end

  IUPnPEventSource_GUID = "204810b5-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPEventSource = LibC::GUID.new(0x204810b5_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPEventSource
    lpVtbl : IUPnPEventSourceVTbl*
  end

  struct IUPnPRegistrarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_device : UInt64
    register_running_device : UInt64
    register_device_provider : UInt64
    get_unique_device_name : UInt64
    unregister_device : UInt64
    unregister_device_provider : UInt64
  end

  IUPnPRegistrar_GUID = "204810b6-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPRegistrar = LibC::GUID.new(0x204810b6_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPRegistrar
    lpVtbl : IUPnPRegistrarVTbl*
  end

  struct IUPnPReregistrarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reregister_device : UInt64
    reregister_running_device : UInt64
  end

  IUPnPReregistrar_GUID = "204810b7-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPReregistrar = LibC::GUID.new(0x204810b7_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPReregistrar
    lpVtbl : IUPnPReregistrarVTbl*
  end

  struct IUPnPDeviceControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_service_object : UInt64
  end

  IUPnPDeviceControl_GUID = "204810ba-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPDeviceControl = LibC::GUID.new(0x204810ba_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPDeviceControl
    lpVtbl : IUPnPDeviceControlVTbl*
  end

  struct IUPnPDeviceControlHttpHeadersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_additional_response_headers : UInt64
  end

  IUPnPDeviceControlHttpHeaders_GUID = "204810bb-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPDeviceControlHttpHeaders = LibC::GUID.new(0x204810bb_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPDeviceControlHttpHeaders
    lpVtbl : IUPnPDeviceControlHttpHeadersVTbl*
  end

  struct IUPnPDeviceProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start : UInt64
    stop : UInt64
  end

  IUPnPDeviceProvider_GUID = "204810b8-73b2-11d4-bf42-00b0d0118b56"
  IID_IUPnPDeviceProvider = LibC::GUID.new(0x204810b8_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  struct IUPnPDeviceProvider
    lpVtbl : IUPnPDeviceProviderVTbl*
  end

  struct IUPnPRemoteEndpointInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_dword_value : UInt64
    get_string_value : UInt64
    get_guid_value : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def find_by_type(bstrtypeuri : UInt8*, dwflags : UInt32, pdevices : IUPnPDevices*) : HRESULT
    @lpVtbl.value.find_by_type.unsafe_as(Proc(UInt8*, UInt32, IUPnPDevices*, HRESULT)).call(bstrtypeuri, dwflags, pdevices)
  end
  def create_async_find(bstrtypeuri : UInt8*, dwflags : UInt32, punkdevicefindercallback : IUnknown, plfinddata : Int32*) : HRESULT
    @lpVtbl.value.create_async_find.unsafe_as(Proc(UInt8*, UInt32, IUnknown, Int32*, HRESULT)).call(bstrtypeuri, dwflags, punkdevicefindercallback, plfinddata)
  end
  def start_async_find(lfinddata : Int32) : HRESULT
    @lpVtbl.value.start_async_find.unsafe_as(Proc(Int32, HRESULT)).call(lfinddata)
  end
  def cancel_async_find(lfinddata : Int32) : HRESULT
    @lpVtbl.value.cancel_async_find.unsafe_as(Proc(Int32, HRESULT)).call(lfinddata)
  end
  def find_by_udn(bstrudn : UInt8*, pdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.find_by_udn.unsafe_as(Proc(UInt8*, IUPnPDevice*, HRESULT)).call(bstrudn, pdevice)
  end
end
struct LibWin32::IUPnPAddressFamilyControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_address_family(dwflags : Int32) : HRESULT
    @lpVtbl.value.set_address_family.unsafe_as(Proc(Int32, HRESULT)).call(dwflags)
  end
  def get_address_family(pdwflags : Int32*) : HRESULT
    @lpVtbl.value.get_address_family.unsafe_as(Proc(Int32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::IUPnPHttpHeaderControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_request_headers(bstrhttpheaders : UInt8*) : HRESULT
    @lpVtbl.value.add_request_headers.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrhttpheaders)
  end
end
struct LibWin32::IUPnPDeviceFinderCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def device_added(lfinddata : Int32, pdevice : IUPnPDevice) : HRESULT
    @lpVtbl.value.device_added.unsafe_as(Proc(Int32, IUPnPDevice, HRESULT)).call(lfinddata, pdevice)
  end
  def device_removed(lfinddata : Int32, bstrudn : UInt8*) : HRESULT
    @lpVtbl.value.device_removed.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(lfinddata, bstrudn)
  end
  def search_complete(lfinddata : Int32) : HRESULT
    @lpVtbl.value.search_complete.unsafe_as(Proc(Int32, HRESULT)).call(lfinddata)
  end
end
struct LibWin32::IUPnPServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(bstrserviceid : UInt8*, ppservice : IUPnPService*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, IUPnPService*, HRESULT)).call(bstrserviceid, ppservice)
  end
end
struct LibWin32::IUPnPService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def query_state_variable(bstrvariablename : UInt8*, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.query_state_variable.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrvariablename, pvalue)
  end
  def invoke_action(bstractionname : UInt8*, vinactionargs : VARIANT, pvoutactionargs : VARIANT*, pvretval : VARIANT*) : HRESULT
    @lpVtbl.value.invoke_action.unsafe_as(Proc(UInt8*, VARIANT, VARIANT*, VARIANT*, HRESULT)).call(bstractionname, vinactionargs, pvoutactionargs, pvretval)
  end
  def get_service_type_identifier(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_type_identifier.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def add_callback(punkcallback : IUnknown) : HRESULT
    @lpVtbl.value.add_callback.unsafe_as(Proc(IUnknown, HRESULT)).call(punkcallback)
  end
  def get_id(pbstrid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrid)
  end
  def get_last_transport_status(plvalue : Int32*) : HRESULT
    @lpVtbl.value.get_last_transport_status.unsafe_as(Proc(Int32*, HRESULT)).call(plvalue)
  end
end
struct LibWin32::IUPnPAsyncResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def async_operation_complete(ullrequestid : UInt64) : HRESULT
    @lpVtbl.value.async_operation_complete.unsafe_as(Proc(UInt64, HRESULT)).call(ullrequestid)
  end
end
struct LibWin32::IUPnPServiceAsync
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_invoke_action(bstractionname : UInt8*, vinactionargs : VARIANT, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_invoke_action.unsafe_as(Proc(UInt8*, VARIANT, IUPnPAsyncResult, UInt64*, HRESULT)).call(bstractionname, vinactionargs, pasyncresult, pullrequestid)
  end
  def end_invoke_action(ullrequestid : UInt64, pvoutactionargs : VARIANT*, pvretval : VARIANT*) : HRESULT
    @lpVtbl.value.end_invoke_action.unsafe_as(Proc(UInt64, VARIANT*, VARIANT*, HRESULT)).call(ullrequestid, pvoutactionargs, pvretval)
  end
  def begin_query_state_variable(bstrvariablename : UInt8*, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_query_state_variable.unsafe_as(Proc(UInt8*, IUPnPAsyncResult, UInt64*, HRESULT)).call(bstrvariablename, pasyncresult, pullrequestid)
  end
  def end_query_state_variable(ullrequestid : UInt64, pvalue : VARIANT*) : HRESULT
    @lpVtbl.value.end_query_state_variable.unsafe_as(Proc(UInt64, VARIANT*, HRESULT)).call(ullrequestid, pvalue)
  end
  def begin_subscribe_to_events(punkcallback : IUnknown, pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_subscribe_to_events.unsafe_as(Proc(IUnknown, IUPnPAsyncResult, UInt64*, HRESULT)).call(punkcallback, pasyncresult, pullrequestid)
  end
  def end_subscribe_to_events(ullrequestid : UInt64) : HRESULT
    @lpVtbl.value.end_subscribe_to_events.unsafe_as(Proc(UInt64, HRESULT)).call(ullrequestid)
  end
  def begin_scpd_download(pasyncresult : IUPnPAsyncResult, pullrequestid : UInt64*) : HRESULT
    @lpVtbl.value.begin_scpd_download.unsafe_as(Proc(IUPnPAsyncResult, UInt64*, HRESULT)).call(pasyncresult, pullrequestid)
  end
  def end_scpd_download(ullrequestid : UInt64, pbstrscpddoc : UInt8**) : HRESULT
    @lpVtbl.value.end_scpd_download.unsafe_as(Proc(UInt64, UInt8**, HRESULT)).call(ullrequestid, pbstrscpddoc)
  end
  def cancel_async_operation(ullrequestid : UInt64) : HRESULT
    @lpVtbl.value.cancel_async_operation.unsafe_as(Proc(UInt64, HRESULT)).call(ullrequestid)
  end
end
struct LibWin32::IUPnPServiceCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def state_variable_changed(pus : IUPnPService, pcwszstatevarname : LibC::LPWSTR, vavalue : VARIANT) : HRESULT
    @lpVtbl.value.state_variable_changed.unsafe_as(Proc(IUPnPService, LibC::LPWSTR, VARIANT, HRESULT)).call(pus, pcwszstatevarname, vavalue)
  end
  def service_instance_died(pus : IUPnPService) : HRESULT
    @lpVtbl.value.service_instance_died.unsafe_as(Proc(IUPnPService, HRESULT)).call(pus)
  end
end
struct LibWin32::IUPnPServiceEnumProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_service_enum_property(dwmask : UInt32) : HRESULT
    @lpVtbl.value.set_service_enum_property.unsafe_as(Proc(UInt32, HRESULT)).call(dwmask)
  end
end
struct LibWin32::IUPnPServiceDocumentAccess
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_document_url(pbstrdocurl : UInt8**) : HRESULT
    @lpVtbl.value.get_document_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocurl)
  end
  def get_document(pbstrdoc : UInt8**) : HRESULT
    @lpVtbl.value.get_document.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdoc)
  end
end
struct LibWin32::IUPnPDevices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get__new_enum(ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunk)
  end
  def get_item(bstrudn : UInt8*, ppdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, IUPnPDevice*, HRESULT)).call(bstrudn, ppdevice)
  end
end
struct LibWin32::IUPnPDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_is_root_device(pvarb : Int16*) : HRESULT
    @lpVtbl.value.get_is_root_device.unsafe_as(Proc(Int16*, HRESULT)).call(pvarb)
  end
  def get_root_device(ppudrootdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.get_root_device.unsafe_as(Proc(IUPnPDevice*, HRESULT)).call(ppudrootdevice)
  end
  def get_parent_device(ppuddeviceparent : IUPnPDevice*) : HRESULT
    @lpVtbl.value.get_parent_device.unsafe_as(Proc(IUPnPDevice*, HRESULT)).call(ppuddeviceparent)
  end
  def get_has_children(pvarb : Int16*) : HRESULT
    @lpVtbl.value.get_has_children.unsafe_as(Proc(Int16*, HRESULT)).call(pvarb)
  end
  def get_children(ppudchildren : IUPnPDevices*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(IUPnPDevices*, HRESULT)).call(ppudchildren)
  end
  def get_unique_device_name(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_device_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_friendly_name(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_friendly_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_type(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_presentation_url(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_presentation_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_manufacturer_name(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_manufacturer_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_manufacturer_url(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_manufacturer_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_model_name(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_model_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_model_number(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_model_number.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_description(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_model_url(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_model_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_upc(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_upc.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_serial_number(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def icon_url(bstrencodingformat : UInt8*, lsizex : Int32, lsizey : Int32, lbitdepth : Int32, pbstriconurl : UInt8**) : HRESULT
    @lpVtbl.value.icon_url.unsafe_as(Proc(UInt8*, Int32, Int32, Int32, UInt8**, HRESULT)).call(bstrencodingformat, lsizex, lsizey, lbitdepth, pbstriconurl)
  end
  def get_services(ppusservices : IUPnPServices*) : HRESULT
    @lpVtbl.value.get_services.unsafe_as(Proc(IUPnPServices*, HRESULT)).call(ppusservices)
  end
end
struct LibWin32::IUPnPDeviceDocumentAccess
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_document_url(pbstrdocument : UInt8**) : HRESULT
    @lpVtbl.value.get_document_url.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocument)
  end
end
struct LibWin32::IUPnPDeviceDocumentAccessEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_document(pbstrdocument : UInt8**) : HRESULT
    @lpVtbl.value.get_document.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdocument)
  end
end
struct LibWin32::IUPnPDescriptionDocument
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_ready_state(plreadystate : Int32*) : HRESULT
    @lpVtbl.value.get_ready_state.unsafe_as(Proc(Int32*, HRESULT)).call(plreadystate)
  end
  def load(bstrurl : UInt8*) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrurl)
  end
  def load_async(bstrurl : UInt8*, punkcallback : IUnknown) : HRESULT
    @lpVtbl.value.load_async.unsafe_as(Proc(UInt8*, IUnknown, HRESULT)).call(bstrurl, punkcallback)
  end
  def get_load_result(phrerror : Int32*) : HRESULT
    @lpVtbl.value.get_load_result.unsafe_as(Proc(Int32*, HRESULT)).call(phrerror)
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
  def root_device(ppudrootdevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.root_device.unsafe_as(Proc(IUPnPDevice*, HRESULT)).call(ppudrootdevice)
  end
  def device_by_udn(bstrudn : UInt8*, ppuddevice : IUPnPDevice*) : HRESULT
    @lpVtbl.value.device_by_udn.unsafe_as(Proc(UInt8*, IUPnPDevice*, HRESULT)).call(bstrudn, ppuddevice)
  end
end
struct LibWin32::IUPnPDeviceFinderAddCallbackWithInterface
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def device_added_with_interface(lfinddata : Int32, pdevice : IUPnPDevice, pguidinterface : Guid*) : HRESULT
    @lpVtbl.value.device_added_with_interface.unsafe_as(Proc(Int32, IUPnPDevice, Guid*, HRESULT)).call(lfinddata, pdevice, pguidinterface)
  end
end
struct LibWin32::IUPnPDescriptionDocumentCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_complete(hrloadresult : HRESULT) : HRESULT
    @lpVtbl.value.load_complete.unsafe_as(Proc(HRESULT, HRESULT)).call(hrloadresult)
  end
end
struct LibWin32::IUPnPEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_state_changed(cchanges : UInt32, rgdispidchanges : Int32*) : HRESULT
    @lpVtbl.value.on_state_changed.unsafe_as(Proc(UInt32, Int32*, HRESULT)).call(cchanges, rgdispidchanges)
  end
  def on_state_changed_safe(varsadispidchanges : VARIANT) : HRESULT
    @lpVtbl.value.on_state_changed_safe.unsafe_as(Proc(VARIANT, HRESULT)).call(varsadispidchanges)
  end
end
struct LibWin32::IUPnPEventSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise(pessubscriber : IUPnPEventSink) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(IUPnPEventSink, HRESULT)).call(pessubscriber)
  end
  def unadvise(pessubscriber : IUPnPEventSink) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(IUPnPEventSink, HRESULT)).call(pessubscriber)
  end
end
struct LibWin32::IUPnPRegistrar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_device(bstrxmldesc : UInt8*, bstrprogiddevicecontrolclass : UInt8*, bstrinitstring : UInt8*, bstrcontainerid : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32, pbstrdeviceidentifier : UInt8**) : HRESULT
    @lpVtbl.value.register_device.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, UInt8**, HRESULT)).call(bstrxmldesc, bstrprogiddevicecontrolclass, bstrinitstring, bstrcontainerid, bstrresourcepath, nlifetime, pbstrdeviceidentifier)
  end
  def register_running_device(bstrxmldesc : UInt8*, punkdevicecontrol : IUnknown, bstrinitstring : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32, pbstrdeviceidentifier : UInt8**) : HRESULT
    @lpVtbl.value.register_running_device.unsafe_as(Proc(UInt8*, IUnknown, UInt8*, UInt8*, Int32, UInt8**, HRESULT)).call(bstrxmldesc, punkdevicecontrol, bstrinitstring, bstrresourcepath, nlifetime, pbstrdeviceidentifier)
  end
  def register_device_provider(bstrprovidername : UInt8*, bstrprogidproviderclass : UInt8*, bstrinitstring : UInt8*, bstrcontainerid : UInt8*) : HRESULT
    @lpVtbl.value.register_device_provider.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrprovidername, bstrprogidproviderclass, bstrinitstring, bstrcontainerid)
  end
  def get_unique_device_name(bstrdeviceidentifier : UInt8*, bstrtemplateudn : UInt8*, pbstrudn : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_device_name.unsafe_as(Proc(UInt8*, UInt8*, UInt8**, HRESULT)).call(bstrdeviceidentifier, bstrtemplateudn, pbstrudn)
  end
  def unregister_device(bstrdeviceidentifier : UInt8*, fpermanent : LibC::BOOL) : HRESULT
    @lpVtbl.value.unregister_device.unsafe_as(Proc(UInt8*, LibC::BOOL, HRESULT)).call(bstrdeviceidentifier, fpermanent)
  end
  def unregister_device_provider(bstrprovidername : UInt8*) : HRESULT
    @lpVtbl.value.unregister_device_provider.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrprovidername)
  end
end
struct LibWin32::IUPnPReregistrar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reregister_device(bstrdeviceidentifier : UInt8*, bstrxmldesc : UInt8*, bstrprogiddevicecontrolclass : UInt8*, bstrinitstring : UInt8*, bstrcontainerid : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32) : HRESULT
    @lpVtbl.value.reregister_device.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int32, HRESULT)).call(bstrdeviceidentifier, bstrxmldesc, bstrprogiddevicecontrolclass, bstrinitstring, bstrcontainerid, bstrresourcepath, nlifetime)
  end
  def reregister_running_device(bstrdeviceidentifier : UInt8*, bstrxmldesc : UInt8*, punkdevicecontrol : IUnknown, bstrinitstring : UInt8*, bstrresourcepath : UInt8*, nlifetime : Int32) : HRESULT
    @lpVtbl.value.reregister_running_device.unsafe_as(Proc(UInt8*, UInt8*, IUnknown, UInt8*, UInt8*, Int32, HRESULT)).call(bstrdeviceidentifier, bstrxmldesc, punkdevicecontrol, bstrinitstring, bstrresourcepath, nlifetime)
  end
end
struct LibWin32::IUPnPDeviceControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(bstrxmldesc : UInt8*, bstrdeviceidentifier : UInt8*, bstrinitstring : UInt8*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrxmldesc, bstrdeviceidentifier, bstrinitstring)
  end
  def get_service_object(bstrudn : UInt8*, bstrserviceid : UInt8*, ppdispservice : IDispatch*) : HRESULT
    @lpVtbl.value.get_service_object.unsafe_as(Proc(UInt8*, UInt8*, IDispatch*, HRESULT)).call(bstrudn, bstrserviceid, ppdispservice)
  end
end
struct LibWin32::IUPnPDeviceControlHttpHeaders
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_additional_response_headers(bstrhttpresponseheaders : UInt8**) : HRESULT
    @lpVtbl.value.get_additional_response_headers.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrhttpresponseheaders)
  end
end
struct LibWin32::IUPnPDeviceProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start(bstrinitstring : UInt8*) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrinitstring)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUPnPRemoteEndpointInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_dword_value(bstrvaluename : UInt8*, pdwvalue : UInt32*) : HRESULT
    @lpVtbl.value.get_dword_value.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(bstrvaluename, pdwvalue)
  end
  def get_string_value(bstrvaluename : UInt8*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_string_value.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrvaluename, pbstrvalue)
  end
  def get_guid_value(bstrvaluename : UInt8*, pguidvalue : Guid*) : HRESULT
    @lpVtbl.value.get_guid_value.unsafe_as(Proc(UInt8*, Guid*, HRESULT)).call(bstrvaluename, pguidvalue)
  end
end
