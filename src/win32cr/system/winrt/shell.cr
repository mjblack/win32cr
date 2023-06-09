require "../../system/com.cr"
require "../../foundation.cr"
require "../../ui/shell.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
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

  IDDEInitializer_GUID = "30dc931f-33fc-4ffd-a168-942258cf3ca4"
  IID_IDDEInitializer = LibC::GUID.new(0x30dc931f_u32, 0x33fc_u16, 0x4ffd_u16, StaticArray[0xa1_u8, 0x68_u8, 0x94_u8, 0x22_u8, 0x58_u8, 0xcf_u8, 0x3c_u8, 0xa4_u8])
  struct IDDEInitializer
    lpVtbl : IDDEInitializerVTbl*
  end

end
struct LibWin32::IDDEInitializer
  def query_interface(this : IDDEInitializer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDDEInitializer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDDEInitializer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IDDEInitializer*, fileextensionorprotocol : LibC::LPWSTR, method : CreateProcessMethod, currentdirectory : LibC::LPWSTR, exectarget : IShellItem, site : IUnknown, application : LibC::LPWSTR, targetfile : LibC::LPWSTR, arguments : LibC::LPWSTR, verb : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.initialize.call(this, fileextensionorprotocol, method, currentdirectory, exectarget, site, application, targetfile, arguments, verb)
  end
end
