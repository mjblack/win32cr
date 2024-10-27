require "./../win_rt.cr"
require "./../../foundation.cr"
require "./../com.cr"
require "./../../storage/xps.cr"
require "./../../graphics/printing.cr"

module Win32cr::System::WinRT::Printing


  @[Extern]
  record IPrinting3DManagerInteropVtbl,
    query_interface : Proc(IPrinting3DManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrinting3DManagerInterop*, UInt32),
    release : Proc(IPrinting3DManagerInterop*, UInt32),
    get_iids : Proc(IPrinting3DManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IPrinting3DManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IPrinting3DManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IPrinting3DManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    show_print_ui_for_window_async : Proc(IPrinting3DManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ca31010-1484-4587-b26b-dddf9f9caecd")]
  record IPrinting3DManagerInterop, lpVtbl : IPrinting3DManagerInteropVtbl* do
    GUID = LibC::GUID.new(0x9ca31010_u32, 0x1484_u16, 0x4587_u16, StaticArray[0xb2_u8, 0x6b_u8, 0xdd_u8, 0xdf_u8, 0x9f_u8, 0x9c_u8, 0xae_u8, 0xcd_u8])
    def query_interface(this : IPrinting3DManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrinting3DManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrinting3DManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IPrinting3DManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IPrinting3DManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IPrinting3DManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IPrinting3DManagerInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, printManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, printManager)
    end
    def show_print_ui_for_window_async(this : IPrinting3DManagerInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_print_ui_for_window_async.call(this, appWindow, riid, asyncOperation)
    end

  end

  @[Extern]
  record IPrintManagerInteropVtbl,
    query_interface : Proc(IPrintManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintManagerInterop*, UInt32),
    release : Proc(IPrintManagerInterop*, UInt32),
    get_iids : Proc(IPrintManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IPrintManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IPrintManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IPrintManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    show_print_ui_for_window_async : Proc(IPrintManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c5435a42-8d43-4e7b-a68a-ef311e392087")]
  record IPrintManagerInterop, lpVtbl : IPrintManagerInteropVtbl* do
    GUID = LibC::GUID.new(0xc5435a42_u32, 0x8d43_u16, 0x4e7b_u16, StaticArray[0xa6_u8, 0x8a_u8, 0xef_u8, 0x31_u8, 0x1e_u8, 0x39_u8, 0x20_u8, 0x87_u8])
    def query_interface(this : IPrintManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IPrintManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IPrintManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IPrintManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def get_for_window(this : IPrintManagerInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, printManager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, printManager)
    end
    def show_print_ui_for_window_async(this : IPrintManagerInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_print_ui_for_window_async.call(this, appWindow, riid, asyncOperation)
    end

  end

  @[Extern]
  record IPrintWorkflowXpsReceiverVtbl,
    query_interface : Proc(IPrintWorkflowXpsReceiver*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintWorkflowXpsReceiver*, UInt32),
    release : Proc(IPrintWorkflowXpsReceiver*, UInt32),
    set_document_sequence_print_ticket : Proc(IPrintWorkflowXpsReceiver*, Void*, Win32cr::Foundation::HRESULT),
    set_document_sequence_uri : Proc(IPrintWorkflowXpsReceiver*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_document_data : Proc(IPrintWorkflowXpsReceiver*, UInt32, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_page : Proc(IPrintWorkflowXpsReceiver*, UInt32, UInt32, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IPrintWorkflowXpsReceiver*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("04097374-77b8-47f6-8167-aae29d4cf84b")]
  record IPrintWorkflowXpsReceiver, lpVtbl : IPrintWorkflowXpsReceiverVtbl* do
    GUID = LibC::GUID.new(0x4097374_u32, 0x77b8_u16, 0x47f6_u16, StaticArray[0x81_u8, 0x67_u8, 0xaa_u8, 0xe2_u8, 0x9d_u8, 0x4c_u8, 0xf8_u8, 0x4b_u8])
    def query_interface(this : IPrintWorkflowXpsReceiver*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintWorkflowXpsReceiver*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintWorkflowXpsReceiver*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_document_sequence_print_ticket(this : IPrintWorkflowXpsReceiver*, documentSequencePrintTicket : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_sequence_print_ticket.call(this, documentSequencePrintTicket)
    end
    def set_document_sequence_uri(this : IPrintWorkflowXpsReceiver*, documentSequenceUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_sequence_uri.call(this, documentSequenceUri)
    end
    def add_document_data(this : IPrintWorkflowXpsReceiver*, documentId : UInt32, documentPrintTicket : Void*, documentUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_document_data.call(this, documentId, documentPrintTicket, documentUri)
    end
    def add_page(this : IPrintWorkflowXpsReceiver*, documentId : UInt32, pageId : UInt32, pageReference : Void*, pageUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_page.call(this, documentId, pageId, pageReference, pageUri)
    end
    def close(this : IPrintWorkflowXpsReceiver*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IPrintWorkflowXpsReceiver2Vtbl,
    query_interface : Proc(IPrintWorkflowXpsReceiver2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintWorkflowXpsReceiver2*, UInt32),
    release : Proc(IPrintWorkflowXpsReceiver2*, UInt32),
    set_document_sequence_print_ticket : Proc(IPrintWorkflowXpsReceiver2*, Void*, Win32cr::Foundation::HRESULT),
    set_document_sequence_uri : Proc(IPrintWorkflowXpsReceiver2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_document_data : Proc(IPrintWorkflowXpsReceiver2*, UInt32, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_page : Proc(IPrintWorkflowXpsReceiver2*, UInt32, UInt32, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IPrintWorkflowXpsReceiver2*, Win32cr::Foundation::HRESULT),
    failed : Proc(IPrintWorkflowXpsReceiver2*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("023bcc0c-dfab-4a61-b074-490c6995580d")]
  record IPrintWorkflowXpsReceiver2, lpVtbl : IPrintWorkflowXpsReceiver2Vtbl* do
    GUID = LibC::GUID.new(0x23bcc0c_u32, 0xdfab_u16, 0x4a61_u16, StaticArray[0xb0_u8, 0x74_u8, 0x49_u8, 0xc_u8, 0x69_u8, 0x95_u8, 0x58_u8, 0xd_u8])
    def query_interface(this : IPrintWorkflowXpsReceiver2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintWorkflowXpsReceiver2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintWorkflowXpsReceiver2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_document_sequence_print_ticket(this : IPrintWorkflowXpsReceiver2*, documentSequencePrintTicket : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_sequence_print_ticket.call(this, documentSequencePrintTicket)
    end
    def set_document_sequence_uri(this : IPrintWorkflowXpsReceiver2*, documentSequenceUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_document_sequence_uri.call(this, documentSequenceUri)
    end
    def add_document_data(this : IPrintWorkflowXpsReceiver2*, documentId : UInt32, documentPrintTicket : Void*, documentUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_document_data.call(this, documentId, documentPrintTicket, documentUri)
    end
    def add_page(this : IPrintWorkflowXpsReceiver2*, documentId : UInt32, pageId : UInt32, pageReference : Void*, pageUri : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_page.call(this, documentId, pageId, pageReference, pageUri)
    end
    def close(this : IPrintWorkflowXpsReceiver2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def failed(this : IPrintWorkflowXpsReceiver2*, xps_error : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.failed.call(this, xps_error)
    end

  end

  @[Extern]
  record IPrintWorkflowObjectModelSourceFileContentNativeVtbl,
    query_interface : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, UInt32),
    release : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, UInt32),
    start_xps_om_generation : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, Void*, Win32cr::Foundation::HRESULT),
    get_ObjectFactory : Proc(IPrintWorkflowObjectModelSourceFileContentNative*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("68c9e477-993e-4052-8ac6-454eff58db9d")]
  record IPrintWorkflowObjectModelSourceFileContentNative, lpVtbl : IPrintWorkflowObjectModelSourceFileContentNativeVtbl* do
    GUID = LibC::GUID.new(0x68c9e477_u32, 0x993e_u16, 0x4052_u16, StaticArray[0x8a_u8, 0xc6_u8, 0x45_u8, 0x4e_u8, 0xff_u8, 0x58_u8, 0xdb_u8, 0x9d_u8])
    def query_interface(this : IPrintWorkflowObjectModelSourceFileContentNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintWorkflowObjectModelSourceFileContentNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintWorkflowObjectModelSourceFileContentNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_xps_om_generation(this : IPrintWorkflowObjectModelSourceFileContentNative*, receiver : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_xps_om_generation.call(this, receiver)
    end
    def get_ObjectFactory(this : IPrintWorkflowObjectModelSourceFileContentNative*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ObjectFactory.call(this, value)
    end

  end

  @[Extern]
  record IPrintWorkflowXpsObjectModelTargetPackageNativeVtbl,
    query_interface : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, UInt32),
    release : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, UInt32),
    get_DocumentPackageTarget : Proc(IPrintWorkflowXpsObjectModelTargetPackageNative*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7d96bc74-9b54-4ca1-ad3a-979c3d44ddac")]
  record IPrintWorkflowXpsObjectModelTargetPackageNative, lpVtbl : IPrintWorkflowXpsObjectModelTargetPackageNativeVtbl* do
    GUID = LibC::GUID.new(0x7d96bc74_u32, 0x9b54_u16, 0x4ca1_u16, StaticArray[0xad_u8, 0x3a_u8, 0x97_u8, 0x9c_u8, 0x3d_u8, 0x44_u8, 0xdd_u8, 0xac_u8])
    def query_interface(this : IPrintWorkflowXpsObjectModelTargetPackageNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintWorkflowXpsObjectModelTargetPackageNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintWorkflowXpsObjectModelTargetPackageNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_DocumentPackageTarget(this : IPrintWorkflowXpsObjectModelTargetPackageNative*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentPackageTarget.call(this, value)
    end

  end

  @[Extern]
  record IPrintWorkflowConfigurationNativeVtbl,
    query_interface : Proc(IPrintWorkflowConfigurationNative*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintWorkflowConfigurationNative*, UInt32),
    release : Proc(IPrintWorkflowConfigurationNative*, UInt32),
    get_PrinterQueue : Proc(IPrintWorkflowConfigurationNative*, Void**, Win32cr::Foundation::HRESULT),
    get_DriverProperties : Proc(IPrintWorkflowConfigurationNative*, Void**, Win32cr::Foundation::HRESULT),
    get_UserProperties : Proc(IPrintWorkflowConfigurationNative*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c056be0a-9ee2-450a-9823-964f0006f2bb")]
  record IPrintWorkflowConfigurationNative, lpVtbl : IPrintWorkflowConfigurationNativeVtbl* do
    GUID = LibC::GUID.new(0xc056be0a_u32, 0x9ee2_u16, 0x450a_u16, StaticArray[0x98_u8, 0x23_u8, 0x96_u8, 0x4f_u8, 0x0_u8, 0x6_u8, 0xf2_u8, 0xbb_u8])
    def query_interface(this : IPrintWorkflowConfigurationNative*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintWorkflowConfigurationNative*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintWorkflowConfigurationNative*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PrinterQueue(this : IPrintWorkflowConfigurationNative*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrinterQueue.call(this, value)
    end
    def get_DriverProperties(this : IPrintWorkflowConfigurationNative*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProperties.call(this, value)
    end
    def get_UserProperties(this : IPrintWorkflowConfigurationNative*, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserProperties.call(this, value)
    end

  end

end