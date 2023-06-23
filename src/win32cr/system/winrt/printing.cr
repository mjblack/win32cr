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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
    show_print_ui_for_window_async : UInt64
  end

  IPrinting3DManagerInterop_GUID = "9ca31010-1484-4587-b26b-dddf9f9caecd"
  IID_IPrinting3DManagerInterop = LibC::GUID.new(0x9ca31010_u32, 0x1484_u16, 0x4587_u16, StaticArray[0xb2_u8, 0x6b_u8, 0xdd_u8, 0xdf_u8, 0x9f_u8, 0x9c_u8, 0xae_u8, 0xcd_u8])
  struct IPrinting3DManagerInterop
    lpVtbl : IPrinting3DManagerInteropVTbl*
  end

  struct IPrintManagerInteropVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_iids : UInt64
    get_runtime_class_name : UInt64
    get_trust_level : UInt64
    get_for_window : UInt64
    show_print_ui_for_window_async : UInt64
  end

  IPrintManagerInterop_GUID = "c5435a42-8d43-4e7b-a68a-ef311e392087"
  IID_IPrintManagerInterop = LibC::GUID.new(0xc5435a42_u32, 0x8d43_u16, 0x4e7b_u16, StaticArray[0xa6_u8, 0x8a_u8, 0xef_u8, 0x31_u8, 0x1e_u8, 0x39_u8, 0x20_u8, 0x87_u8])
  struct IPrintManagerInterop
    lpVtbl : IPrintManagerInteropVTbl*
  end

  struct IPrintWorkflowXpsReceiverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_document_sequence_print_ticket : UInt64
    set_document_sequence_uri : UInt64
    add_document_data : UInt64
    add_page : UInt64
    close : UInt64
  end

  IPrintWorkflowXpsReceiver_GUID = "04097374-77b8-47f6-8167-aae29d4cf84b"
  IID_IPrintWorkflowXpsReceiver = LibC::GUID.new(0x4097374_u32, 0x77b8_u16, 0x47f6_u16, StaticArray[0x81_u8, 0x67_u8, 0xaa_u8, 0xe2_u8, 0x9d_u8, 0x4c_u8, 0xf8_u8, 0x4b_u8])
  struct IPrintWorkflowXpsReceiver
    lpVtbl : IPrintWorkflowXpsReceiverVTbl*
  end

  struct IPrintWorkflowXpsReceiver2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_document_sequence_print_ticket : UInt64
    set_document_sequence_uri : UInt64
    add_document_data : UInt64
    add_page : UInt64
    close : UInt64
    failed : UInt64
  end

  IPrintWorkflowXpsReceiver2_GUID = "023bcc0c-dfab-4a61-b074-490c6995580d"
  IID_IPrintWorkflowXpsReceiver2 = LibC::GUID.new(0x23bcc0c_u32, 0xdfab_u16, 0x4a61_u16, StaticArray[0xb0_u8, 0x74_u8, 0x49_u8, 0xc_u8, 0x69_u8, 0x95_u8, 0x58_u8, 0xd_u8])
  struct IPrintWorkflowXpsReceiver2
    lpVtbl : IPrintWorkflowXpsReceiver2VTbl*
  end

  struct IPrintWorkflowObjectModelSourceFileContentNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_xps_om_generation : UInt64
    get_object_factory : UInt64
  end

  IPrintWorkflowObjectModelSourceFileContentNative_GUID = "68c9e477-993e-4052-8ac6-454eff58db9d"
  IID_IPrintWorkflowObjectModelSourceFileContentNative = LibC::GUID.new(0x68c9e477_u32, 0x993e_u16, 0x4052_u16, StaticArray[0x8a_u8, 0xc6_u8, 0x45_u8, 0x4e_u8, 0xff_u8, 0x58_u8, 0xdb_u8, 0x9d_u8])
  struct IPrintWorkflowObjectModelSourceFileContentNative
    lpVtbl : IPrintWorkflowObjectModelSourceFileContentNativeVTbl*
  end

  struct IPrintWorkflowXpsObjectModelTargetPackageNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_document_package_target : UInt64
  end

  IPrintWorkflowXpsObjectModelTargetPackageNative_GUID = "7d96bc74-9b54-4ca1-ad3a-979c3d44ddac"
  IID_IPrintWorkflowXpsObjectModelTargetPackageNative = LibC::GUID.new(0x7d96bc74_u32, 0x9b54_u16, 0x4ca1_u16, StaticArray[0xad_u8, 0x3a_u8, 0x97_u8, 0x9c_u8, 0x3d_u8, 0x44_u8, 0xdd_u8, 0xac_u8])
  struct IPrintWorkflowXpsObjectModelTargetPackageNative
    lpVtbl : IPrintWorkflowXpsObjectModelTargetPackageNativeVTbl*
  end

  struct IPrintWorkflowConfigurationNativeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_printer_queue : UInt64
    get_driver_properties : UInt64
    get_user_properties : UInt64
  end

  IPrintWorkflowConfigurationNative_GUID = "c056be0a-9ee2-450a-9823-964f0006f2bb"
  IID_IPrintWorkflowConfigurationNative = LibC::GUID.new(0xc056be0a_u32, 0x9ee2_u16, 0x450a_u16, StaticArray[0x98_u8, 0x23_u8, 0x96_u8, 0x4f_u8, 0x0_u8, 0x6_u8, 0xf2_u8, 0xbb_u8])
  struct IPrintWorkflowConfigurationNative
    lpVtbl : IPrintWorkflowConfigurationNativeVTbl*
  end

end
struct LibWin32::IPrinting3DManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, printmanager : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, printmanager)
  end
  def show_print_ui_for_window_async(appwindow : LibC::HANDLE, riid : Guid*, asyncoperation : Void**) : HRESULT
    @lpVtbl.value.show_print_ui_for_window_async.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, asyncoperation)
  end
end
struct LibWin32::IPrintManagerInterop
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_iids(iidcount : UInt32*, iids : Guid**) : HRESULT
    @lpVtbl.value.get_iids.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(iidcount, iids)
  end
  def get_runtime_class_name(classname : HSTRING*) : HRESULT
    @lpVtbl.value.get_runtime_class_name.unsafe_as(Proc(HSTRING*, HRESULT)).call(classname)
  end
  def get_trust_level(trustlevel : TrustLevel*) : HRESULT
    @lpVtbl.value.get_trust_level.unsafe_as(Proc(TrustLevel*, HRESULT)).call(trustlevel)
  end
  def get_for_window(appwindow : LibC::HANDLE, riid : Guid*, printmanager : Void**) : HRESULT
    @lpVtbl.value.get_for_window.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, printmanager)
  end
  def show_print_ui_for_window_async(appwindow : LibC::HANDLE, riid : Guid*, asyncoperation : Void**) : HRESULT
    @lpVtbl.value.show_print_ui_for_window_async.unsafe_as(Proc(LibC::HANDLE, Guid*, Void**, HRESULT)).call(appwindow, riid, asyncoperation)
  end
end
struct LibWin32::IPrintWorkflowXpsReceiver
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_document_sequence_print_ticket(documentsequenceprintticket : IStream) : HRESULT
    @lpVtbl.value.set_document_sequence_print_ticket.unsafe_as(Proc(IStream, HRESULT)).call(documentsequenceprintticket)
  end
  def set_document_sequence_uri(documentsequenceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_document_sequence_uri.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(documentsequenceuri)
  end
  def add_document_data(documentid : UInt32, documentprintticket : IStream, documenturi : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_document_data.unsafe_as(Proc(UInt32, IStream, LibC::LPWSTR, HRESULT)).call(documentid, documentprintticket, documenturi)
  end
  def add_page(documentid : UInt32, pageid : UInt32, pagereference : IXpsOMPageReference, pageuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_page.unsafe_as(Proc(UInt32, UInt32, IXpsOMPageReference, LibC::LPWSTR, HRESULT)).call(documentid, pageid, pagereference, pageuri)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPrintWorkflowXpsReceiver2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_document_sequence_print_ticket(documentsequenceprintticket : IStream) : HRESULT
    @lpVtbl.value.set_document_sequence_print_ticket.unsafe_as(Proc(IStream, HRESULT)).call(documentsequenceprintticket)
  end
  def set_document_sequence_uri(documentsequenceuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_document_sequence_uri.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(documentsequenceuri)
  end
  def add_document_data(documentid : UInt32, documentprintticket : IStream, documenturi : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_document_data.unsafe_as(Proc(UInt32, IStream, LibC::LPWSTR, HRESULT)).call(documentid, documentprintticket, documenturi)
  end
  def add_page(documentid : UInt32, pageid : UInt32, pagereference : IXpsOMPageReference, pageuri : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_page.unsafe_as(Proc(UInt32, UInt32, IXpsOMPageReference, LibC::LPWSTR, HRESULT)).call(documentid, pageid, pagereference, pageuri)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def failed(xpserror : HRESULT) : HRESULT
    @lpVtbl.value.failed.unsafe_as(Proc(HRESULT, HRESULT)).call(xpserror)
  end
end
struct LibWin32::IPrintWorkflowObjectModelSourceFileContentNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_xps_om_generation(receiver : IPrintWorkflowXpsReceiver) : HRESULT
    @lpVtbl.value.start_xps_om_generation.unsafe_as(Proc(IPrintWorkflowXpsReceiver, HRESULT)).call(receiver)
  end
  def get_object_factory(value : IXpsOMObjectFactory1*) : HRESULT
    @lpVtbl.value.get_object_factory.unsafe_as(Proc(IXpsOMObjectFactory1*, HRESULT)).call(value)
  end
end
struct LibWin32::IPrintWorkflowXpsObjectModelTargetPackageNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_document_package_target(value : IXpsDocumentPackageTarget*) : HRESULT
    @lpVtbl.value.get_document_package_target.unsafe_as(Proc(IXpsDocumentPackageTarget*, HRESULT)).call(value)
  end
end
struct LibWin32::IPrintWorkflowConfigurationNative
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_printer_queue(value : IPrinterQueue*) : HRESULT
    @lpVtbl.value.get_printer_queue.unsafe_as(Proc(IPrinterQueue*, HRESULT)).call(value)
  end
  def get_driver_properties(value : IPrinterPropertyBag*) : HRESULT
    @lpVtbl.value.get_driver_properties.unsafe_as(Proc(IPrinterPropertyBag*, HRESULT)).call(value)
  end
  def get_user_properties(value : IPrinterPropertyBag*) : HRESULT
    @lpVtbl.value.get_user_properties.unsafe_as(Proc(IPrinterPropertyBag*, HRESULT)).call(value)
  end
end
