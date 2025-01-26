require "./../../foundation.cr"
require "./../../system/com.cr"
require "./../xps.cr"

module Win32cr::Storage::Xps::Printing
  ID_DOCUMENTPACKAGETARGET_MSXPS = "9cae40a8-ded1-41c9-a9fd-d735ef33aeda"
  ID_DOCUMENTPACKAGETARGET_OPENXPS = "0056bb72-8c9c-4612-bd0f-93012a87099d"
  ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D = "63dbd720-8b14-4577-b074-7bb11b596d28"

  CLSID_PrintDocumentPackageTarget = LibC::GUID.new(0x4842669e_u32, 0x9947_u16, 0x46ea_u16, StaticArray[0x8b_u8, 0xa2_u8, 0xd8_u8, 0xcc_u8, 0xe4_u8, 0x32_u8, 0xc2_u8, 0xca_u8])

  CLSID_PrintDocumentPackageTargetFactory = LibC::GUID.new(0x348ef17d_u32, 0x6c81_u16, 0x4982_u16, StaticArray[0x92_u8, 0xb4_u8, 0xee_u8, 0x18_u8, 0x8a_u8, 0x43_u8, 0x86_u8, 0x7a_u8])

  enum XPS_JOB_COMPLETION
    XPS_JOB_IN_PROGRESS = 0_i32
    XPS_JOB_COMPLETED = 1_i32
    XPS_JOB_CANCELLED = 2_i32
    XPS_JOB_FAILED = 3_i32
  end
  enum PrintDocumentPackageCompletion
    PrintDocumentPackageCompletion_InProgress = 0_i32
    PrintDocumentPackageCompletion_Completed = 1_i32
    PrintDocumentPackageCompletion_Canceled = 2_i32
    PrintDocumentPackageCompletion_Failed = 3_i32
  end

  @[Extern]
  struct XPS_JOB_STATUS
    property jobId : UInt32
    property currentDocument : Int32
    property currentPage : Int32
    property currentPageTotal : Int32
    property completion : Win32cr::Storage::Xps::Printing::XPS_JOB_COMPLETION
    property jobStatus : Win32cr::Foundation::HRESULT
    def initialize(@jobId : UInt32, @currentDocument : Int32, @currentPage : Int32, @currentPageTotal : Int32, @completion : Win32cr::Storage::Xps::Printing::XPS_JOB_COMPLETION, @jobStatus : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct PrintDocumentPackageStatus
    property job_id : UInt32
    property current_document : Int32
    property current_page : Int32
    property current_page_total : Int32
    property completion : Win32cr::Storage::Xps::Printing::PrintDocumentPackageCompletion
    property package_status : Win32cr::Foundation::HRESULT
    def initialize(@job_id : UInt32, @current_document : Int32, @current_page : Int32, @current_page_total : Int32, @completion : Win32cr::Storage::Xps::Printing::PrintDocumentPackageCompletion, @package_status : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  record IXpsPrintJobStreamVtbl,
    query_interface : Proc(IXpsPrintJobStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsPrintJobStream*, UInt32),
    release : Proc(IXpsPrintJobStream*, UInt32),
    read : Proc(IXpsPrintJobStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(IXpsPrintJobStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    close : Proc(IXpsPrintJobStream*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsPrintJobStream, lpVtbl : IXpsPrintJobStreamVtbl* do
    GUID = LibC::GUID.new(0x7a77dc5f_u32, 0x45d6_u16, 0x4dff_u16, StaticArray[0x93_u8, 0x7_u8, 0xd8_u8, 0xcb_u8, 0x84_u8, 0x63_u8, 0x47_u8, 0xca_u8])
    def query_interface(this : IXpsPrintJobStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsPrintJobStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsPrintJobStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IXpsPrintJobStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : IXpsPrintJobStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def close(this : IXpsPrintJobStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IXpsPrintJobVtbl,
    query_interface : Proc(IXpsPrintJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXpsPrintJob*, UInt32),
    release : Proc(IXpsPrintJob*, UInt32),
    cancel : Proc(IXpsPrintJob*, Win32cr::Foundation::HRESULT),
    get_job_status : Proc(IXpsPrintJob*, Win32cr::Storage::Xps::Printing::XPS_JOB_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXpsPrintJob, lpVtbl : IXpsPrintJobVtbl* do
    GUID = LibC::GUID.new(0x5ab89b06_u32, 0x8194_u16, 0x425f_u16, StaticArray[0xab_u8, 0x3b_u8, 0xd7_u8, 0xa9_u8, 0x6e_u8, 0x35_u8, 0x1_u8, 0x61_u8])
    def query_interface(this : IXpsPrintJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXpsPrintJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXpsPrintJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cancel(this : IXpsPrintJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def get_job_status(this : IXpsPrintJob*, jobStatus : Win32cr::Storage::Xps::Printing::XPS_JOB_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job_status.call(this, jobStatus)
    end

  end

  @[Extern]
  record IPrintDocumentPackageTargetVtbl,
    query_interface : Proc(IPrintDocumentPackageTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintDocumentPackageTarget*, UInt32),
    release : Proc(IPrintDocumentPackageTarget*, UInt32),
    get_package_target_types : Proc(IPrintDocumentPackageTarget*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_package_target : Proc(IPrintDocumentPackageTarget*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    cancel : Proc(IPrintDocumentPackageTarget*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPrintDocumentPackageTarget, lpVtbl : IPrintDocumentPackageTargetVtbl* do
    GUID = LibC::GUID.new(0x1b8efec4_u32, 0x3019_u16, 0x4c27_u16, StaticArray[0x96_u8, 0x4e_u8, 0x36_u8, 0x72_u8, 0x2_u8, 0x15_u8, 0x69_u8, 0x6_u8])
    def query_interface(this : IPrintDocumentPackageTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintDocumentPackageTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintDocumentPackageTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_package_target_types(this : IPrintDocumentPackageTarget*, targetCount : UInt32*, targetTypes : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_target_types.call(this, targetCount, targetTypes)
    end
    def get_package_target(this : IPrintDocumentPackageTarget*, guidTargetType : LibC::GUID*, riid : LibC::GUID*, ppvTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_package_target.call(this, guidTargetType, riid, ppvTarget)
    end
    def cancel(this : IPrintDocumentPackageTarget*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record IPrintDocumentPackageStatusEventVtbl,
    query_interface : Proc(IPrintDocumentPackageStatusEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintDocumentPackageStatusEvent*, UInt32),
    release : Proc(IPrintDocumentPackageStatusEvent*, UInt32),
    get_type_info_count : Proc(IPrintDocumentPackageStatusEvent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPrintDocumentPackageStatusEvent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPrintDocumentPackageStatusEvent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPrintDocumentPackageStatusEvent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    package_status_updated : Proc(IPrintDocumentPackageStatusEvent*, Win32cr::Storage::Xps::Printing::PrintDocumentPackageStatus*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPrintDocumentPackageStatusEvent, lpVtbl : IPrintDocumentPackageStatusEventVtbl* do
    GUID = LibC::GUID.new(0xed90c8ad_u32, 0x5c34_u16, 0x4d05_u16, StaticArray[0xa1_u8, 0xec_u8, 0xe_u8, 0x8a_u8, 0x9b_u8, 0x3a_u8, 0xd7_u8, 0xaf_u8])
    def query_interface(this : IPrintDocumentPackageStatusEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintDocumentPackageStatusEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintDocumentPackageStatusEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPrintDocumentPackageStatusEvent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPrintDocumentPackageStatusEvent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPrintDocumentPackageStatusEvent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPrintDocumentPackageStatusEvent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def package_status_updated(this : IPrintDocumentPackageStatusEvent*, packageStatus : Win32cr::Storage::Xps::Printing::PrintDocumentPackageStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.package_status_updated.call(this, packageStatus)
    end

  end

  @[Extern]
  record IPrintDocumentPackageTargetFactoryVtbl,
    query_interface : Proc(IPrintDocumentPackageTargetFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrintDocumentPackageTargetFactory*, UInt32),
    release : Proc(IPrintDocumentPackageTargetFactory*, UInt32),
    create_document_package_target_for_print_job : Proc(IPrintDocumentPackageTargetFactory*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPrintDocumentPackageTargetFactory, lpVtbl : IPrintDocumentPackageTargetFactoryVtbl* do
    GUID = LibC::GUID.new(0xd2959bf7_u32, 0xb31b_u16, 0x4a3d_u16, StaticArray[0x96_u8, 0x0_u8, 0x71_u8, 0x2e_u8, 0xb1_u8, 0x33_u8, 0x5b_u8, 0xa4_u8])
    def query_interface(this : IPrintDocumentPackageTargetFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrintDocumentPackageTargetFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrintDocumentPackageTargetFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_document_package_target_for_print_job(this : IPrintDocumentPackageTargetFactory*, printerName : Win32cr::Foundation::PWSTR, jobName : Win32cr::Foundation::PWSTR, jobOutputStream : Void*, jobPrintTicketStream : Void*, docPackageTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_package_target_for_print_job.call(this, printerName, jobName, jobOutputStream, jobPrintTicketStream, docPackageTarget)
    end

  end

  @[Link("xpsprint")]
  lib C
    fun StartXpsPrintJob(printerName : Win32cr::Foundation::PWSTR, jobName : Win32cr::Foundation::PWSTR, outputFileName : Win32cr::Foundation::PWSTR, progressEvent : Win32cr::Foundation::HANDLE, completionEvent : Win32cr::Foundation::HANDLE, printablePagesOn : UInt8*, printablePagesOnCount : UInt32, xpsPrintJob : Void**, documentStream : Void**, printTicketStream : Void**) : Win32cr::Foundation::HRESULT

    fun StartXpsPrintJob1(printerName : Win32cr::Foundation::PWSTR, jobName : Win32cr::Foundation::PWSTR, outputFileName : Win32cr::Foundation::PWSTR, progressEvent : Win32cr::Foundation::HANDLE, completionEvent : Win32cr::Foundation::HANDLE, xpsPrintJob : Void**, printContentReceiver : Void**) : Win32cr::Foundation::HRESULT

  end
end