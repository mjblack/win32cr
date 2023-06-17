require "../../system/winrt.cr"
require "../../foundation.cr"
require "../../system/com.cr"
require "../../storage/xps.cr"
require "../../graphics/printing.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  struct IPrinting3DManagerInteropVTbl
    query_interface : Proc(IPrinting3DManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrinting3DManagerInterop*, UInt32)
    release : Proc(IPrinting3DManagerInterop*, UInt32)
    get_iids : Proc(IPrinting3DManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IPrinting3DManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IPrinting3DManagerInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IPrinting3DManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
    show_print_ui_for_window_async : Proc(IPrinting3DManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IPrinting3DManagerInterop_GUID = "9ca31010-1484-4587-b26b-dddf9f9caecd"
  IID_IPrinting3DManagerInterop = LibC::GUID.new(0x9ca31010_u32, 0x1484_u16, 0x4587_u16, StaticArray[0xb2_u8, 0x6b_u8, 0xdd_u8, 0xdf_u8, 0x9f_u8, 0x9c_u8, 0xae_u8, 0xcd_u8])
  struct IPrinting3DManagerInterop
    lpVtbl : IPrinting3DManagerInteropVTbl*
  end

  struct IPrintManagerInteropVTbl
    query_interface : Proc(IPrintManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintManagerInterop*, UInt32)
    release : Proc(IPrintManagerInterop*, UInt32)
    get_iids : Proc(IPrintManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IPrintManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IPrintManagerInterop*, TrustLevel*, HRESULT)
    get_for_window : Proc(IPrintManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
    show_print_ui_for_window_async : Proc(IPrintManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IPrintManagerInterop_GUID = "c5435a42-8d43-4e7b-a68a-ef311e392087"
  IID_IPrintManagerInterop = LibC::GUID.new(0xc5435a42_u32, 0x8d43_u16, 0x4e7b_u16, StaticArray[0xa6_u8, 0x8a_u8, 0xef_u8, 0x31_u8, 0x1e_u8, 0x39_u8, 0x20_u8, 0x87_u8])
  struct IPrintManagerInterop
    lpVtbl : IPrintManagerInteropVTbl*
  end

  struct IPrintWorkflowXpsReceiverVTbl
    query_interface : Proc(IPrintWorkflowXpsReceiver*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintWorkflowXpsReceiver*, UInt32)
    release : Proc(IPrintWorkflowXpsReceiver*, UInt32)
    set_document_sequence_print_ticket : Proc(IPrintWorkflowXpsReceiver*, IStream, HRESULT)
    set_document_sequence_uri : Proc(IPrintWorkflowXpsReceiver*, LibC::LPWSTR, HRESULT)
    add_document_data : Proc(IPrintWorkflowXpsReceiver*, UInt32, IStream, LibC::LPWSTR, HRESULT)
    add_page : Proc(IPrintWorkflowXpsReceiver*, UInt32, UInt32, IXpsOMPageReference, LibC::LPWSTR, HRESULT)
    close : Proc(IPrintWorkflowXpsReceiver*, HRESULT)
  end

  IPrintWorkflowXpsReceiver_GUID = "04097374-77b8-47f6-8167-aae29d4cf84b"
  IID_IPrintWorkflowXpsReceiver = LibC::GUID.new(0x4097374_u32, 0x77b8_u16, 0x47f6_u16, StaticArray[0x81_u8, 0x67_u8, 0xaa_u8, 0xe2_u8, 0x9d_u8, 0x4c_u8, 0xf8_u8, 0x4b_u8])
  struct IPrintWorkflowXpsReceiver
    lpVtbl : IPrintWorkflowXpsReceiverVTbl*
  end

  struct IPrintWorkflowXpsReceiver2VTbl
    query_interface : Proc(IPrintWorkflowXpsReceiver2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintWorkflowXpsReceiver2*, UInt32)
    release : Proc(IPrintWorkflowXpsReceiver2*, UInt32)
    set_document_sequence_print_ticket : Proc(IPrintWorkflowXpsReceiver2*, IStream, HRESULT)
    set_document_sequence_uri : Proc(IPrintWorkflowXpsReceiver2*, LibC::LPWSTR, HRESULT)
    add_document_data : Proc(IPrintWorkflowXpsReceiver2*, UInt32, IStream, LibC::LPWSTR, HRESULT)
    add_page : Proc(IPrintWorkflowXpsReceiver2*, UInt32, UInt32, IXpsOMPageReference, LibC::LPWSTR, HRESULT)
    close : Proc(IPrintWorkflowXpsReceiver2*, HRESULT)
    failed : Proc(IPrintWorkflowXpsReceiver2*, HRESULT, HRESULT)
  end

  IPrintWorkflowXpsReceiver2_GUID = "023bcc0c-dfab-4a61-b074-490c6995580d"
  IID_IPrintWorkflowXpsReceiver2 = LibC::GUID.new(0x23bcc0c_u32, 0xdfab_u16, 0x4a61_u16, StaticArray[0xb0_u8, 0x74_u8, 0x49_u8, 0xc_u8, 0x69_u8, 0x95_u8, 0x58_u8, 0xd_u8])
  struct IPrintWorkflowXpsReceiver2
    lpVtbl : IPrintWorkflowXpsReceiver2VTbl*
  end

  struct IPrintWorkflowObjectModelSourceFileContentNativeVTbl
    query_interface : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, UInt32)
    release : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, UInt32)
    start_xps_om_generation : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, IPrintWorkflowXpsReceiver, HRESULT)
    get_object_factory : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, IXpsOMObjectFactory1*, HRESULT)
  end

  IPrintWorkflowObjectModelSourceFileContentNative_GUID = "68c9e477-993e-4052-8ac6-454eff58db9d"
  IID_IPrintWorkflowObjectModelSourceFileContentNative = LibC::GUID.new(0x68c9e477_u32, 0x993e_u16, 0x4052_u16, StaticArray[0x8a_u8, 0xc6_u8, 0x45_u8, 0x4e_u8, 0xff_u8, 0x58_u8, 0xdb_u8, 0x9d_u8])
  struct IPrintWorkflowObjectModelSourceFileContentNative
    lpVtbl : IPrintWorkflowObjectModelSourceFileContentNativeVTbl*
  end

  struct IPrintWorkflowXpsObjectModelTargetPackageNativeVTbl
    query_interface : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, UInt32)
    release : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, UInt32)
    get_document_package_target : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, IXpsDocumentPackageTarget*, HRESULT)
  end

  IPrintWorkflowXpsObjectModelTargetPackageNative_GUID = "7d96bc74-9b54-4ca1-ad3a-979c3d44ddac"
  IID_IPrintWorkflowXpsObjectModelTargetPackageNative = LibC::GUID.new(0x7d96bc74_u32, 0x9b54_u16, 0x4ca1_u16, StaticArray[0xad_u8, 0x3a_u8, 0x97_u8, 0x9c_u8, 0x3d_u8, 0x44_u8, 0xdd_u8, 0xac_u8])
  struct IPrintWorkflowXpsObjectModelTargetPackageNative
    lpVtbl : IPrintWorkflowXpsObjectModelTargetPackageNativeVTbl*
  end

  struct IPrintWorkflowConfigurationNativeVTbl
    query_interface : Proc(IPrintWorkflowConfigurationNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintWorkflowConfigurationNative*, UInt32)
    release : Proc(IPrintWorkflowConfigurationNative*, UInt32)
    get_printer_queue : Proc(IPrintWorkflowConfigurationNative*, IPrinterQueue*, HRESULT)
    get_driver_properties : Proc(IPrintWorkflowConfigurationNative*, IPrinterPropertyBag*, HRESULT)
    get_user_properties : Proc(IPrintWorkflowConfigurationNative*, IPrinterPropertyBag*, HRESULT)
  end

  IPrintWorkflowConfigurationNative_GUID = "c056be0a-9ee2-450a-9823-964f0006f2bb"
  IID_IPrintWorkflowConfigurationNative = LibC::GUID.new(0xc056be0a_u32, 0x9ee2_u16, 0x450a_u16, StaticArray[0x98_u8, 0x23_u8, 0x96_u8, 0x4f_u8, 0x0_u8, 0x6_u8, 0xf2_u8, 0xbb_u8])
  struct IPrintWorkflowConfigurationNative
    lpVtbl : IPrintWorkflowConfigurationNativeVTbl*
  end

end