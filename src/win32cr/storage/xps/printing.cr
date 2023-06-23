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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read : UInt64
    write : UInt64
    close : UInt64
  end

  IXpsPrintJobStream_GUID = "7a77dc5f-45d6-4dff-9307-d8cb846347ca"
  IID_IXpsPrintJobStream = LibC::GUID.new(0x7a77dc5f_u32, 0x45d6_u16, 0x4dff_u16, StaticArray[0x93_u8, 0x7_u8, 0xd8_u8, 0xcb_u8, 0x84_u8, 0x63_u8, 0x47_u8, 0xca_u8])
  struct IXpsPrintJobStream
    lpVtbl : IXpsPrintJobStreamVTbl*
  end

  struct IXpsPrintJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    cancel : UInt64
    get_job_status : UInt64
  end

  IXpsPrintJob_GUID = "5ab89b06-8194-425f-ab3b-d7a96e350161"
  IID_IXpsPrintJob = LibC::GUID.new(0x5ab89b06_u32, 0x8194_u16, 0x425f_u16, StaticArray[0xab_u8, 0x3b_u8, 0xd7_u8, 0xa9_u8, 0x6e_u8, 0x35_u8, 0x1_u8, 0x61_u8])
  struct IXpsPrintJob
    lpVtbl : IXpsPrintJobVTbl*
  end

  struct IPrintDocumentPackageTargetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_package_target_types : UInt64
    get_package_target : UInt64
    cancel : UInt64
  end

  IPrintDocumentPackageTarget_GUID = "1b8efec4-3019-4c27-964e-367202156906"
  IID_IPrintDocumentPackageTarget = LibC::GUID.new(0x1b8efec4_u32, 0x3019_u16, 0x4c27_u16, StaticArray[0x96_u8, 0x4e_u8, 0x36_u8, 0x72_u8, 0x2_u8, 0x15_u8, 0x69_u8, 0x6_u8])
  struct IPrintDocumentPackageTarget
    lpVtbl : IPrintDocumentPackageTargetVTbl*
  end

  struct IPrintDocumentPackageStatusEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    package_status_updated : UInt64
  end

  IPrintDocumentPackageStatusEvent_GUID = "ed90c8ad-5c34-4d05-a1ec-0e8a9b3ad7af"
  IID_IPrintDocumentPackageStatusEvent = LibC::GUID.new(0xed90c8ad_u32, 0x5c34_u16, 0x4d05_u16, StaticArray[0xa1_u8, 0xec_u8, 0xe_u8, 0x8a_u8, 0x9b_u8, 0x3a_u8, 0xd7_u8, 0xaf_u8])
  struct IPrintDocumentPackageStatusEvent
    lpVtbl : IPrintDocumentPackageStatusEventVTbl*
  end

  struct IPrintDocumentPackageTargetFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_document_package_target_for_print_job : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read(pv : Void*, cb : UInt32, pcbread : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbread)
  end
  def write(pv : Void*, cb : UInt32, pcbwritten : UInt32*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(Void*, UInt32, UInt32*, HRESULT)).call(pv, cb, pcbwritten)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IXpsPrintJob
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def get_job_status(jobstatus : XPS_JOB_STATUS*) : HRESULT
    @lpVtbl.value.get_job_status.unsafe_as(Proc(XPS_JOB_STATUS*, HRESULT)).call(jobstatus)
  end
end
struct LibWin32::IPrintDocumentPackageTarget
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_package_target_types(targetcount : UInt32*, targettypes : Guid**) : HRESULT
    @lpVtbl.value.get_package_target_types.unsafe_as(Proc(UInt32*, Guid**, HRESULT)).call(targetcount, targettypes)
  end
  def get_package_target(guidtargettype : Guid*, riid : Guid*, ppvtarget : Void**) : HRESULT
    @lpVtbl.value.get_package_target.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(guidtargettype, riid, ppvtarget)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IPrintDocumentPackageStatusEvent
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
  def package_status_updated(packagestatus : PrintDocumentPackageStatus*) : HRESULT
    @lpVtbl.value.package_status_updated.unsafe_as(Proc(PrintDocumentPackageStatus*, HRESULT)).call(packagestatus)
  end
end
struct LibWin32::IPrintDocumentPackageTargetFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_document_package_target_for_print_job(printername : LibC::LPWSTR, jobname : LibC::LPWSTR, joboutputstream : IStream, jobprintticketstream : IStream, docpackagetarget : IPrintDocumentPackageTarget*) : HRESULT
    @lpVtbl.value.create_document_package_target_for_print_job.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, IStream, IStream, IPrintDocumentPackageTarget*, HRESULT)).call(printername, jobname, joboutputstream, jobprintticketstream, docpackagetarget)
  end
end
