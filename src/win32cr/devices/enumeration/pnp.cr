require "../../foundation.cr"
require "../../security.cr"
require "../../system/com.cr"
require "../../devices/properties.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:cfgmgr32.dll")]
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
  UPnPDeviceFinder = LibC::GUID.new(0xe2085f28_u32, 0xfeb7_u16, 0x404a_u16, StaticArray[0xb8_u8, 0xe7_u8, 0xe6_u8, 0x59_u8, 0xbd_u8, 0xea_u8, 0xaa_u8, 0x2_u8])
  UPnPDevices = LibC::GUID.new(0xb9e84ffd_u32, 0xad3c_u16, 0x40a4_u16, StaticArray[0xb8_u8, 0x35_u8, 0x8_u8, 0x82_u8, 0xeb_u8, 0xcb_u8, 0xaa_u8, 0xa8_u8])
  UPnPDevice = LibC::GUID.new(0xa32552c5_u32, 0xba61_u16, 0x457a_u16, StaticArray[0xb5_u8, 0x9a_u8, 0xa2_u8, 0x56_u8, 0x1e_u8, 0x12_u8, 0x5e_u8, 0x33_u8])
  UPnPServices = LibC::GUID.new(0xc0bc4b4a_u32, 0xa406_u16, 0x4efc_u16, StaticArray[0x93_u8, 0x2f_u8, 0xb8_u8, 0x54_u8, 0x6b_u8, 0x81_u8, 0x0_u8, 0xcc_u8])
  UPnPService = LibC::GUID.new(0xc624ba95_u32, 0xfbcb_u16, 0x4409_u16, StaticArray[0x8c_u8, 0x3_u8, 0x8c_u8, 0xce_u8, 0xec_u8, 0x53_u8, 0x3e_u8, 0xf1_u8])
  UPnPDescriptionDocument = LibC::GUID.new(0x1d8a9b47_u32, 0x3a28_u16, 0x4ce2_u16, StaticArray[0x8a_u8, 0x4b_u8, 0xbd_u8, 0x34_u8, 0xe4_u8, 0x5b_u8, 0xce_u8, 0xeb_u8])
  UPnPDeviceFinderEx = LibC::GUID.new(0x181b54fc_u32, 0x380b_u16, 0x4a75_u16, StaticArray[0xb3_u8, 0xf1_u8, 0x4a_u8, 0xc4_u8, 0x5e_u8, 0x96_u8, 0x5_u8, 0xb0_u8])
  UPnPDescriptionDocumentEx = LibC::GUID.new(0x33fd0563_u32, 0xd81a_u16, 0x4393_u16, StaticArray[0x83_u8, 0xcc_u8, 0x1_u8, 0x95_u8, 0xb1_u8, 0xda_u8, 0x2f_u8, 0x91_u8])
  UPnPRegistrar = LibC::GUID.new(0x204810b9_u32, 0x73b2_u16, 0x11d4_u16, StaticArray[0xbf_u8, 0x42_u8, 0x0_u8, 0xb0_u8, 0xd0_u8, 0x11_u8, 0x8b_u8, 0x56_u8])
  UPnPRemoteEndpointInfo = LibC::GUID.new(0x2e5e84e9_u32, 0x4049_u16, 0x4244_u16, StaticArray[0xb7_u8, 0x28_u8, 0x2d_u8, 0x24_u8, 0x22_u8, 0x71_u8, 0x57_u8, 0xc7_u8])

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

  struct IUPnPAddressFamilyControl
    lpVtbl : IUPnPAddressFamilyControlVTbl*
  end

  struct IUPnPHttpHeaderControlVTbl
    query_interface : Proc(IUPnPHttpHeaderControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPHttpHeaderControl*, UInt32)
    release : Proc(IUPnPHttpHeaderControl*, UInt32)
    add_request_headers : Proc(IUPnPHttpHeaderControl*, UInt8*, HRESULT)
  end

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

  struct IUPnPService
    lpVtbl : IUPnPServiceVTbl*
  end

  struct IUPnPAsyncResultVTbl
    query_interface : Proc(IUPnPAsyncResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPAsyncResult*, UInt32)
    release : Proc(IUPnPAsyncResult*, UInt32)
    async_operation_complete : Proc(IUPnPAsyncResult*, UInt64, HRESULT)
  end

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

  struct IUPnPServiceCallback
    lpVtbl : IUPnPServiceCallbackVTbl*
  end

  struct IUPnPServiceEnumPropertyVTbl
    query_interface : Proc(IUPnPServiceEnumProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPServiceEnumProperty*, UInt32)
    release : Proc(IUPnPServiceEnumProperty*, UInt32)
    set_service_enum_property : Proc(IUPnPServiceEnumProperty*, UInt32, HRESULT)
  end

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

  struct IUPnPDevice
    lpVtbl : IUPnPDeviceVTbl*
  end

  struct IUPnPDeviceDocumentAccessVTbl
    query_interface : Proc(IUPnPDeviceDocumentAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceDocumentAccess*, UInt32)
    release : Proc(IUPnPDeviceDocumentAccess*, UInt32)
    get_document_url : Proc(IUPnPDeviceDocumentAccess*, UInt8**, HRESULT)
  end

  struct IUPnPDeviceDocumentAccess
    lpVtbl : IUPnPDeviceDocumentAccessVTbl*
  end

  struct IUPnPDeviceDocumentAccessExVTbl
    query_interface : Proc(IUPnPDeviceDocumentAccessEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceDocumentAccessEx*, UInt32)
    release : Proc(IUPnPDeviceDocumentAccessEx*, UInt32)
    get_document : Proc(IUPnPDeviceDocumentAccessEx*, UInt8**, HRESULT)
  end

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

  struct IUPnPDescriptionDocument
    lpVtbl : IUPnPDescriptionDocumentVTbl*
  end

  struct IUPnPDeviceFinderAddCallbackWithInterfaceVTbl
    query_interface : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, UInt32)
    release : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, UInt32)
    device_added_with_interface : Proc(IUPnPDeviceFinderAddCallbackWithInterface*, Int32, IUPnPDevice, Guid*, HRESULT)
  end

  struct IUPnPDeviceFinderAddCallbackWithInterface
    lpVtbl : IUPnPDeviceFinderAddCallbackWithInterfaceVTbl*
  end

  struct IUPnPDescriptionDocumentCallbackVTbl
    query_interface : Proc(IUPnPDescriptionDocumentCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDescriptionDocumentCallback*, UInt32)
    release : Proc(IUPnPDescriptionDocumentCallback*, UInt32)
    load_complete : Proc(IUPnPDescriptionDocumentCallback*, HRESULT, HRESULT)
  end

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

  struct IUPnPDeviceControl
    lpVtbl : IUPnPDeviceControlVTbl*
  end

  struct IUPnPDeviceControlHttpHeadersVTbl
    query_interface : Proc(IUPnPDeviceControlHttpHeaders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUPnPDeviceControlHttpHeaders*, UInt32)
    release : Proc(IUPnPDeviceControlHttpHeaders*, UInt32)
    get_additional_response_headers : Proc(IUPnPDeviceControlHttpHeaders*, UInt8**, HRESULT)
  end

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
