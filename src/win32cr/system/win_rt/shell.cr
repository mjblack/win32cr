require "./../com.cr"
require "./../../foundation.cr"
require "./../../ui/shell.cr"

module Win32cr::System::WinRT::Shell

  enum CreateProcessMethod
    CpCreateProcess = 0_i32
    CpCreateProcessAsUser = 1_i32
    CpAicLaunchAdminProcess = 2_i32
  end

  @[Extern]
  record IDDEInitializerVtbl,
    query_interface : Proc(IDDEInitializer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDDEInitializer*, UInt32),
    release : Proc(IDDEInitializer*, UInt32),
    initialize__ : Proc(IDDEInitializer*, Win32cr::Foundation::PWSTR, Win32cr::System::WinRT::Shell::CreateProcessMethod, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30dc931f-33fc-4ffd-a168-942258cf3ca4")]
  record IDDEInitializer, lpVtbl : IDDEInitializerVtbl* do
    GUID = LibC::GUID.new(0x30dc931f_u32, 0x33fc_u16, 0x4ffd_u16, StaticArray[0xa1_u8, 0x68_u8, 0x94_u8, 0x22_u8, 0x58_u8, 0xcf_u8, 0x3c_u8, 0xa4_u8])
    def query_interface(this : IDDEInitializer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDDEInitializer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDDEInitializer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IDDEInitializer*, fileExtensionOrProtocol : Win32cr::Foundation::PWSTR, method : Win32cr::System::WinRT::Shell::CreateProcessMethod, currentDirectory : Win32cr::Foundation::PWSTR, execTarget : Void*, site : Void*, application : Win32cr::Foundation::PWSTR, targetFile : Win32cr::Foundation::PWSTR, arguments : Win32cr::Foundation::PWSTR, verb : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, fileExtensionOrProtocol, method, currentDirectory, execTarget, site, application, targetFile, arguments, verb)
    end

  end

end