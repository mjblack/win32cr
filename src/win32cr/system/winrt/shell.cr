require "../../system/com.cr"
require "../../foundation.cr"
require "../../ui/shell.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  enum CreateProcessMethod : Int32
    CpCreateProcess = 0
    CpCreateProcessAsUser = 1
    CpAicLaunchAdminProcess = 2
  end


  struct IDDEInitializerVTbl
    query_interface : Proc(IDDEInitializer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDDEInitializer*, UInt32)
    release : Proc(IDDEInitializer*, UInt32)
    initialize : Proc(IDDEInitializer*, LibC::LPWSTR, CreateProcessMethod, LibC::LPWSTR, IShellItem, IUnknown, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  struct IDDEInitializer
    lpVtbl : IDDEInitializerVTbl*
  end

end
