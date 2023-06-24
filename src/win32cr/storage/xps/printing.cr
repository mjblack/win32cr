require "../../foundation.cr"
require "../../system/com.cr"
require "../../storage/xps.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:xpsprint.dll")]
{% else %}
@[Link("xpsprint")]
{% end %}
lib LibWin32
  ID_DOCUMENTPACKAGETARGET_MSXPS = "9cae40a8-ded1-41c9-a9fd-d735ef33aeda"
  ID_DOCUMENTPACKAGETARGET_OPENXPS = "0056bb72-8c9c-4612-bd0f-93012a87099d"
  ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D = "63dbd720-8b14-4577-b074-7bb11b596d28"
  CLSID_PrintDocumentPackageTarget = LibC::GUID.new(0x4842669e_u32, 0x9947_u16, 0x46ea_u16, StaticArray[0x8b_u8, 0xa2_u8, 0xd8_u8, 0xcc_u8, 0xe4_u8, 0x32_u8, 0xc2_u8, 0xca_u8])
  CLSID_PrintDocumentPackageTargetFactory = LibC::GUID.new(0x348ef17d_u32, 0x6c81_u16, 0x4982_u16, StaticArray[0x92_u8, 0xb4_u8, 0xee_u8, 0x18_u8, 0x8a_u8, 0x43_u8, 0x86_u8, 0x7a_u8])


  enum XPS_JOB_COMPLETION : Int32
    XPS_JOB_IN_PROGRESS = 0
    XPS_JOB_COMPLETED = 1
    XPS_JOB_CANCELLED = 2
    XPS_JOB_FAILED = 3
  end

  enum PrintDocumentPackageCompletion : Int32
    PrintDocumentPackageCompletion_InProgress = 0
    PrintDocumentPackageCompletion_Completed = 1
    PrintDocumentPackageCompletion_Canceled = 2
    PrintDocumentPackageCompletion_Failed = 3
  end

  struct XPS_JOB_STATUS
    job_id : UInt32
    current_document : Int32
    current_page : Int32
    current_page_total : Int32
    completion : XPS_JOB_COMPLETION
    job_status : HRESULT
  end
  struct PrintDocumentPackageStatus
    job_id : UInt32
    current_document : Int32
    current_page : Int32
    current_page_total : Int32
    completion : PrintDocumentPackageCompletion
    package_status : HRESULT
  end


  struct IXpsPrintJobStreamVTbl
    query_interface : Proc(IXpsPrintJobStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsPrintJobStream*, UInt32)
    release : Proc(IXpsPrintJobStream*, UInt32)
    read : Proc(IXpsPrintJobStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(IXpsPrintJobStream*, Void*, UInt32, UInt32*, HRESULT)
    close : Proc(IXpsPrintJobStream*, HRESULT)
  end

  IXpsPrintJobStream_GUID = "7a77dc5f-45d6-4dff-9307-d8cb846347ca"
  IID_IXpsPrintJobStream = LibC::GUID.new(0x7a77dc5f_u32, 0x45d6_u16, 0x4dff_u16, StaticArray[0x93_u8, 0x7_u8, 0xd8_u8, 0xcb_u8, 0x84_u8, 0x63_u8, 0x47_u8, 0xca_u8])
  struct IXpsPrintJobStream
    lpVtbl : IXpsPrintJobStreamVTbl*
  end

  struct IXpsPrintJobVTbl
    query_interface : Proc(IXpsPrintJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXpsPrintJob*, UInt32)
    release : Proc(IXpsPrintJob*, UInt32)
    cancel : Proc(IXpsPrintJob*, HRESULT)
    get_job_status : Proc(IXpsPrintJob*, XPS_JOB_STATUS*, HRESULT)
  end

  IXpsPrintJob_GUID = "5ab89b06-8194-425f-ab3b-d7a96e350161"
  IID_IXpsPrintJob = LibC::GUID.new(0x5ab89b06_u32, 0x8194_u16, 0x425f_u16, StaticArray[0xab_u8, 0x3b_u8, 0xd7_u8, 0xa9_u8, 0x6e_u8, 0x35_u8, 0x1_u8, 0x61_u8])
  struct IXpsPrintJob
    lpVtbl : IXpsPrintJobVTbl*
  end

  struct IPrintDocumentPackageTargetVTbl
    query_interface : Proc(IPrintDocumentPackageTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintDocumentPackageTarget*, UInt32)
    release : Proc(IPrintDocumentPackageTarget*, UInt32)
    get_package_target_types : Proc(IPrintDocumentPackageTarget*, UInt32*, Guid**, HRESULT)
    get_package_target : Proc(IPrintDocumentPackageTarget*, Guid*, Guid*, Void**, HRESULT)
    cancel : Proc(IPrintDocumentPackageTarget*, HRESULT)
  end

  IPrintDocumentPackageTarget_GUID = "1b8efec4-3019-4c27-964e-367202156906"
  IID_IPrintDocumentPackageTarget = LibC::GUID.new(0x1b8efec4_u32, 0x3019_u16, 0x4c27_u16, StaticArray[0x96_u8, 0x4e_u8, 0x36_u8, 0x72_u8, 0x2_u8, 0x15_u8, 0x69_u8, 0x6_u8])
  struct IPrintDocumentPackageTarget
    lpVtbl : IPrintDocumentPackageTargetVTbl*
  end

  struct IPrintDocumentPackageStatusEventVTbl
    query_interface : Proc(IPrintDocumentPackageStatusEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintDocumentPackageStatusEvent*, UInt32)
    release : Proc(IPrintDocumentPackageStatusEvent*, UInt32)
    get_type_info_count : Proc(IPrintDocumentPackageStatusEvent*, UInt32*, HRESULT)
    get_type_info : Proc(IPrintDocumentPackageStatusEvent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPrintDocumentPackageStatusEvent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPrintDocumentPackageStatusEvent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    package_status_updated : Proc(IPrintDocumentPackageStatusEvent*, PrintDocumentPackageStatus*, HRESULT)
  end

  IPrintDocumentPackageStatusEvent_GUID = "ed90c8ad-5c34-4d05-a1ec-0e8a9b3ad7af"
  IID_IPrintDocumentPackageStatusEvent = LibC::GUID.new(0xed90c8ad_u32, 0x5c34_u16, 0x4d05_u16, StaticArray[0xa1_u8, 0xec_u8, 0xe_u8, 0x8a_u8, 0x9b_u8, 0x3a_u8, 0xd7_u8, 0xaf_u8])
  struct IPrintDocumentPackageStatusEvent
    lpVtbl : IPrintDocumentPackageStatusEventVTbl*
  end

  struct IPrintDocumentPackageTargetFactoryVTbl
    query_interface : Proc(IPrintDocumentPackageTargetFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintDocumentPackageTargetFactory*, UInt32)
    release : Proc(IPrintDocumentPackageTargetFactory*, UInt32)
    create_document_package_target_for_print_job : Proc(IPrintDocumentPackageTargetFactory*, LibC::LPWSTR, LibC::LPWSTR, IStream, IStream, IPrintDocumentPackageTarget*, HRESULT)
  end

  IPrintDocumentPackageTargetFactory_GUID = "d2959bf7-b31b-4a3d-9600-712eb1335ba4"
  IID_IPrintDocumentPackageTargetFactory = LibC::GUID.new(0xd2959bf7_u32, 0xb31b_u16, 0x4a3d_u16, StaticArray[0x96_u8, 0x0_u8, 0x71_u8, 0x2e_u8, 0xb1_u8, 0x33_u8, 0x5b_u8, 0xa4_u8])
  struct IPrintDocumentPackageTargetFactory
    lpVtbl : IPrintDocumentPackageTargetFactoryVTbl*
  end


  # Params # printername : LibC::LPWSTR [In],jobname : LibC::LPWSTR [In],outputfilename : LibC::LPWSTR [In],progressevent : LibC::HANDLE [In],completionevent : LibC::HANDLE [In],printablepageson : UInt8* [In],printablepagesoncount : UInt32 [In],xpsprintjob : IXpsPrintJob* [In],documentstream : IXpsPrintJobStream* [In],printticketstream : IXpsPrintJobStream* [In]
  fun StartXpsPrintJob(printername : LibC::LPWSTR, jobname : LibC::LPWSTR, outputfilename : LibC::LPWSTR, progressevent : LibC::HANDLE, completionevent : LibC::HANDLE, printablepageson : UInt8*, printablepagesoncount : UInt32, xpsprintjob : IXpsPrintJob*, documentstream : IXpsPrintJobStream*, printticketstream : IXpsPrintJobStream*) : HRESULT

  # Params # printername : LibC::LPWSTR [In],jobname : LibC::LPWSTR [In],outputfilename : LibC::LPWSTR [In],progressevent : LibC::HANDLE [In],completionevent : LibC::HANDLE [In],xpsprintjob : IXpsPrintJob* [In],printcontentreceiver : IXpsOMPackageTarget* [In]
  fun StartXpsPrintJob1(printername : LibC::LPWSTR, jobname : LibC::LPWSTR, outputfilename : LibC::LPWSTR, progressevent : LibC::HANDLE, completionevent : LibC::HANDLE, xpsprintjob : IXpsPrintJob*, printcontentreceiver : IXpsOMPackageTarget*) : HRESULT
end
struct LibWin32::IXpsPrintJobStream
  def query_interface(this : IXpsPrintJobStream*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXpsPrintJobStream*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXpsPrintJobStream*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read(this : IXpsPrintJobStream*, pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.call(this, pv, cb, pcbread)
  end
  def write(this : IXpsPrintJobStream*, pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.call(this, pv, cb, pcbwritten)
  end
  def close(this : IXpsPrintJobStream*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IXpsPrintJob
  def query_interface(this : IXpsPrintJob*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXpsPrintJob*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXpsPrintJob*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def cancel(this : IXpsPrintJob*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def get_job_status(this : IXpsPrintJob*, jobstatus : XPS_JOB_STATUS*) : HRESULT
    @lpVtbl.value.get_job_status.call(this, jobstatus)
  end
end
struct LibWin32::IPrintDocumentPackageTarget
  def query_interface(this : IPrintDocumentPackageTarget*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrintDocumentPackageTarget*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrintDocumentPackageTarget*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_package_target_types(this : IPrintDocumentPackageTarget*, targetcount : UInt32*, targettypes : Guid**) : HRESULT
    @lpVtbl.value.get_package_target_types.call(this, targetcount, targettypes)
  end
  def get_package_target(this : IPrintDocumentPackageTarget*, guidtargettype : Guid*, riid : Guid*, ppvtarget : Void**) : HRESULT
    @lpVtbl.value.get_package_target.call(this, guidtargettype, riid, ppvtarget)
  end
  def cancel(this : IPrintDocumentPackageTarget*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::IPrintDocumentPackageStatusEvent
  def query_interface(this : IPrintDocumentPackageStatusEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrintDocumentPackageStatusEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrintDocumentPackageStatusEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IPrintDocumentPackageStatusEvent*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IPrintDocumentPackageStatusEvent*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IPrintDocumentPackageStatusEvent*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IPrintDocumentPackageStatusEvent*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def package_status_updated(this : IPrintDocumentPackageStatusEvent*, packagestatus : PrintDocumentPackageStatus*) : HRESULT
    @lpVtbl.value.package_status_updated.call(this, packagestatus)
  end
end
struct LibWin32::IPrintDocumentPackageTargetFactory
  def query_interface(this : IPrintDocumentPackageTargetFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrintDocumentPackageTargetFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrintDocumentPackageTargetFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_document_package_target_for_print_job(this : IPrintDocumentPackageTargetFactory*, printername : LibC::LPWSTR, jobname : LibC::LPWSTR, joboutputstream : IStream, jobprintticketstream : IStream, docpackagetarget : IPrintDocumentPackageTarget*) : HRESULT
    @lpVtbl.value.create_document_package_target_for_print_job.call(this, printername, jobname, joboutputstream, jobprintticketstream, docpackagetarget)
  end
end
