require "../../foundation.cr"
require "../../system/com.cr"
require "../../storage/xps.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:xpsprint.dll")]
lib LibWin32
  ID_DOCUMENTPACKAGETARGET_MSXPS = "9cae40a8-ded1-41c9-a9fd-d735ef33aeda"
  ID_DOCUMENTPACKAGETARGET_OPENXPS = "0056bb72-8c9c-4612-bd0f-93012a87099d"
  ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D = "63dbd720-8b14-4577-b074-7bb11b596d28"
  PrintDocumentPackageTarget = LibC::GUID.new(0x4842669e_u32, 0x9947_u16, 0x46ea_u16, StaticArray[0x8b_u8, 0xa2_u8, 0xd8_u8, 0xcc_u8, 0xe4_u8, 0x32_u8, 0xc2_u8, 0xca_u8])
  PrintDocumentPackageTargetFactory = LibC::GUID.new(0x348ef17d_u32, 0x6c81_u16, 0x4982_u16, StaticArray[0x92_u8, 0xb4_u8, 0xee_u8, 0x18_u8, 0x8a_u8, 0x43_u8, 0x86_u8, 0x7a_u8])


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

  struct IPrintDocumentPackageStatusEvent
    lpVtbl : IPrintDocumentPackageStatusEventVTbl*
  end

  struct IPrintDocumentPackageTargetFactoryVTbl
    query_interface : Proc(IPrintDocumentPackageTargetFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrintDocumentPackageTargetFactory*, UInt32)
    release : Proc(IPrintDocumentPackageTargetFactory*, UInt32)
    create_document_package_target_for_print_job : Proc(IPrintDocumentPackageTargetFactory*, LibC::LPWSTR, LibC::LPWSTR, IStream, IStream, IPrintDocumentPackageTarget*, HRESULT)
  end

  struct IPrintDocumentPackageTargetFactory
    lpVtbl : IPrintDocumentPackageTargetFactoryVTbl*
  end


  # Params # printername : LibC::LPWSTR [In],jobname : LibC::LPWSTR [In],outputfilename : LibC::LPWSTR [In],progressevent : LibC::HANDLE [In],completionevent : LibC::HANDLE [In],printablepageson : UInt8* [In],printablepagesoncount : UInt32 [In],xpsprintjob : IXpsPrintJob* [In],documentstream : IXpsPrintJobStream* [In],printticketstream : IXpsPrintJobStream* [In]
  fun StartXpsPrintJob(printername : LibC::LPWSTR, jobname : LibC::LPWSTR, outputfilename : LibC::LPWSTR, progressevent : LibC::HANDLE, completionevent : LibC::HANDLE, printablepageson : UInt8*, printablepagesoncount : UInt32, xpsprintjob : IXpsPrintJob*, documentstream : IXpsPrintJobStream*, printticketstream : IXpsPrintJobStream*) : HRESULT

  # Params # printername : LibC::LPWSTR [In],jobname : LibC::LPWSTR [In],outputfilename : LibC::LPWSTR [In],progressevent : LibC::HANDLE [In],completionevent : LibC::HANDLE [In],xpsprintjob : IXpsPrintJob* [In],printcontentreceiver : IXpsOMPackageTarget* [In]
  fun StartXpsPrintJob1(printername : LibC::LPWSTR, jobname : LibC::LPWSTR, outputfilename : LibC::LPWSTR, progressevent : LibC::HANDLE, completionevent : LibC::HANDLE, xpsprintjob : IXpsPrintJob*, printcontentreceiver : IXpsOMPackageTarget*) : HRESULT
end
