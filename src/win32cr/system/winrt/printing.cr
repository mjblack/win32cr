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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  IPrinting3DManagerInterop_GUID = LibC::GUID.new("9ca31010-1484-4587-b26b-dddf9f9caecd")
  CLSID_IPrinting3DManagerInterop = "9ca31010-1484-4587-b26b-dddf9f9caecd"
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

  IPrintManagerInterop_GUID = LibC::GUID.new("c5435a42-8d43-4e7b-a68a-ef311e392087")
  CLSID_IPrintManagerInterop = "c5435a42-8d43-4e7b-a68a-ef311e392087"
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

  IPrintWorkflowXpsReceiver_GUID = LibC::GUID.new("04097374-77b8-47f6-8167-aae29d4cf84b")
  CLSID_IPrintWorkflowXpsReceiver = "04097374-77b8-47f6-8167-aae29d4cf84b"
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

  IPrintWorkflowXpsReceiver2_GUID = LibC::GUID.new("023bcc0c-dfab-4a61-b074-490c6995580d")
  CLSID_IPrintWorkflowXpsReceiver2 = "023bcc0c-dfab-4a61-b074-490c6995580d"
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

  IPrintWorkflowObjectModelSourceFileContentNative_GUID = LibC::GUID.new("68c9e477-993e-4052-8ac6-454eff58db9d")
  CLSID_IPrintWorkflowObjectModelSourceFileContentNative = "68c9e477-993e-4052-8ac6-454eff58db9d"
  struct IPrintWorkflowObjectModelSourceFileContentNative
    lpVtbl : IPrintWorkflowObjectModelSourceFileContentNativeVTbl*
  end

  struct IPrintWorkflowXpsObjectModelTargetPackageNativeVTbl
    query_interface : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, UInt32)
    release : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, UInt32)
    get_document_package_target : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, IXpsDocumentPackageTarget*, HRESULT)
  end

  IPrintWorkflowXpsObjectModelTargetPackageNative_GUID = LibC::GUID.new("7d96bc74-9b54-4ca1-ad3a-979c3d44ddac")
  CLSID_IPrintWorkflowXpsObjectModelTargetPackageNative = "7d96bc74-9b54-4ca1-ad3a-979c3d44ddac"
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

  IPrintWorkflowConfigurationNative_GUID = LibC::GUID.new("c056be0a-9ee2-450a-9823-964f0006f2bb")
  CLSID_IPrintWorkflowConfigurationNative = "c056be0a-9ee2-450a-9823-964f0006f2bb"
  struct IPrintWorkflowConfigurationNative
    lpVtbl : IPrintWorkflowConfigurationNativeVTbl*
  end

end
