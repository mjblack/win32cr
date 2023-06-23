require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  enum HANDLE_OPTIONS : UInt32
    HO_NONE = 0
    HO_OPEN_REQUIRING_OPLOCK = 262144
    HO_DELETE_ON_CLOSE = 67108864
    HO_SEQUENTIAL_SCAN = 134217728
    HO_RANDOM_ACCESS = 268435456
    HO_NO_BUFFERING = 536870912
    HO_OVERLAPPED = 1073741824
    HO_WRITE_THROUGH = 2147483648
  end

  enum HANDLE_ACCESS_OPTIONS : UInt32
    HAO_NONE = 0
    HAO_READ_ATTRIBUTES = 128
    HAO_READ = 1179785
    HAO_WRITE = 1179926
    HAO_DELETE = 65536
  end

  enum HANDLE_SHARING_OPTIONS : UInt32
    HSO_SHARE_NONE = 0
    HSO_SHARE_READ = 1
    HSO_SHARE_WRITE = 2
    HSO_SHARE_DELETE = 4
  end

  enum HANDLE_CREATION_OPTIONS : Int32
    HCO_CREATE_NEW = 1
    HCO_CREATE_ALWAYS = 2
    HCO_OPEN_EXISTING = 3
    HCO_OPEN_ALWAYS = 4
    HCO_TRUNCATE_EXISTING = 5
  end


  struct IRandomAccessStreamFileAccessModeVTbl
    query_interface : Proc(IRandomAccessStreamFileAccessMode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRandomAccessStreamFileAccessMode*, UInt32)
    release : Proc(IRandomAccessStreamFileAccessMode*, UInt32)
    get_mode : Proc(IRandomAccessStreamFileAccessMode*, UInt32*, HRESULT)
  end

  IRandomAccessStreamFileAccessMode_GUID = "332e5848-2e15-458e-85c4-c911c0c3d6f4"
  IID_IRandomAccessStreamFileAccessMode = LibC::GUID.new(0x332e5848_u32, 0x2e15_u16, 0x458e_u16, StaticArray[0x85_u8, 0xc4_u8, 0xc9_u8, 0x11_u8, 0xc0_u8, 0xc3_u8, 0xd6_u8, 0xf4_u8])
  struct IRandomAccessStreamFileAccessMode
    lpVtbl : IRandomAccessStreamFileAccessModeVTbl*
  end

  struct IUnbufferedFileHandleOplockCallbackVTbl
    query_interface : Proc(IUnbufferedFileHandleOplockCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUnbufferedFileHandleOplockCallback*, UInt32)
    release : Proc(IUnbufferedFileHandleOplockCallback*, UInt32)
    on_broken_callback : Proc(IUnbufferedFileHandleOplockCallback*, HRESULT)
  end

  IUnbufferedFileHandleOplockCallback_GUID = "d1019a0e-6243-4329-8497-2e75894d7710"
  IID_IUnbufferedFileHandleOplockCallback = LibC::GUID.new(0xd1019a0e_u32, 0x6243_u16, 0x4329_u16, StaticArray[0x84_u8, 0x97_u8, 0x2e_u8, 0x75_u8, 0x89_u8, 0x4d_u8, 0x77_u8, 0x10_u8])
  struct IUnbufferedFileHandleOplockCallback
    lpVtbl : IUnbufferedFileHandleOplockCallbackVTbl*
  end

  struct IUnbufferedFileHandleProviderVTbl
    query_interface : Proc(IUnbufferedFileHandleProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUnbufferedFileHandleProvider*, UInt32)
    release : Proc(IUnbufferedFileHandleProvider*, UInt32)
    open_unbuffered_file_handle : Proc(IUnbufferedFileHandleProvider*, IUnbufferedFileHandleOplockCallback, LibC::UINT_PTR*, HRESULT)
    close_unbuffered_file_handle : Proc(IUnbufferedFileHandleProvider*, HRESULT)
  end

  IUnbufferedFileHandleProvider_GUID = "a65c9109-42ab-4b94-a7b1-dd2e4e68515e"
  IID_IUnbufferedFileHandleProvider = LibC::GUID.new(0xa65c9109_u32, 0x42ab_u16, 0x4b94_u16, StaticArray[0xa7_u8, 0xb1_u8, 0xdd_u8, 0x2e_u8, 0x4e_u8, 0x68_u8, 0x51_u8, 0x5e_u8])
  struct IUnbufferedFileHandleProvider
    lpVtbl : IUnbufferedFileHandleProviderVTbl*
  end

  struct IOplockBreakingHandlerVTbl
    query_interface : Proc(IOplockBreakingHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOplockBreakingHandler*, UInt32)
    release : Proc(IOplockBreakingHandler*, UInt32)
    oplock_breaking : Proc(IOplockBreakingHandler*, HRESULT)
  end

  IOplockBreakingHandler_GUID = "826abe3d-3acd-47d3-84f2-88aaedcf6304"
  IID_IOplockBreakingHandler = LibC::GUID.new(0x826abe3d_u32, 0x3acd_u16, 0x47d3_u16, StaticArray[0x84_u8, 0xf2_u8, 0x88_u8, 0xaa_u8, 0xed_u8, 0xcf_u8, 0x63_u8, 0x4_u8])
  struct IOplockBreakingHandler
    lpVtbl : IOplockBreakingHandlerVTbl*
  end

  struct IStorageItemHandleAccessVTbl
    query_interface : Proc(IStorageItemHandleAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStorageItemHandleAccess*, UInt32)
    release : Proc(IStorageItemHandleAccess*, UInt32)
    create : Proc(IStorageItemHandleAccess*, HANDLE_ACCESS_OPTIONS, HANDLE_SHARING_OPTIONS, HANDLE_OPTIONS, IOplockBreakingHandler, LibC::HANDLE*, HRESULT)
  end

  IStorageItemHandleAccess_GUID = "5ca296b2-2c25-4d22-b785-b885c8201e6a"
  IID_IStorageItemHandleAccess = LibC::GUID.new(0x5ca296b2_u32, 0x2c25_u16, 0x4d22_u16, StaticArray[0xb7_u8, 0x85_u8, 0xb8_u8, 0x85_u8, 0xc8_u8, 0x20_u8, 0x1e_u8, 0x6a_u8])
  struct IStorageItemHandleAccess
    lpVtbl : IStorageItemHandleAccessVTbl*
  end

  struct IStorageFolderHandleAccessVTbl
    query_interface : Proc(IStorageFolderHandleAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStorageFolderHandleAccess*, UInt32)
    release : Proc(IStorageFolderHandleAccess*, UInt32)
    create : Proc(IStorageFolderHandleAccess*, LibC::LPWSTR, HANDLE_CREATION_OPTIONS, HANDLE_ACCESS_OPTIONS, HANDLE_SHARING_OPTIONS, HANDLE_OPTIONS, IOplockBreakingHandler, LibC::HANDLE*, HRESULT)
  end

  IStorageFolderHandleAccess_GUID = "df19938f-5462-48a0-be65-d2a3271a08d6"
  IID_IStorageFolderHandleAccess = LibC::GUID.new(0xdf19938f_u32, 0x5462_u16, 0x48a0_u16, StaticArray[0xbe_u8, 0x65_u8, 0xd2_u8, 0xa3_u8, 0x27_u8, 0x1a_u8, 0x8_u8, 0xd6_u8])
  struct IStorageFolderHandleAccess
    lpVtbl : IStorageFolderHandleAccessVTbl*
  end

end
struct LibWin32::IRandomAccessStreamFileAccessMode
  def query_interface(this : IRandomAccessStreamFileAccessMode*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRandomAccessStreamFileAccessMode*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRandomAccessStreamFileAccessMode*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_mode(this : IRandomAccessStreamFileAccessMode*, fileaccessmode : UInt32*) : HRESULT
    @lpVtbl.value.get_mode.call(this, fileaccessmode)
  end
end
struct LibWin32::IUnbufferedFileHandleOplockCallback
  def query_interface(this : IUnbufferedFileHandleOplockCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUnbufferedFileHandleOplockCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUnbufferedFileHandleOplockCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_broken_callback(this : IUnbufferedFileHandleOplockCallback*) : HRESULT
    @lpVtbl.value.on_broken_callback.call(this)
  end
end
struct LibWin32::IUnbufferedFileHandleProvider
  def query_interface(this : IUnbufferedFileHandleProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUnbufferedFileHandleProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUnbufferedFileHandleProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open_unbuffered_file_handle(this : IUnbufferedFileHandleProvider*, oplockbreakcallback : IUnbufferedFileHandleOplockCallback, filehandle : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.open_unbuffered_file_handle.call(this, oplockbreakcallback, filehandle)
  end
  def close_unbuffered_file_handle(this : IUnbufferedFileHandleProvider*) : HRESULT
    @lpVtbl.value.close_unbuffered_file_handle.call(this)
  end
end
struct LibWin32::IOplockBreakingHandler
  def query_interface(this : IOplockBreakingHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IOplockBreakingHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IOplockBreakingHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def oplock_breaking(this : IOplockBreakingHandler*) : HRESULT
    @lpVtbl.value.oplock_breaking.call(this)
  end
end
struct LibWin32::IStorageItemHandleAccess
  def query_interface(this : IStorageItemHandleAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStorageItemHandleAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStorageItemHandleAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IStorageItemHandleAccess*, accessoptions : HANDLE_ACCESS_OPTIONS, sharingoptions : HANDLE_SHARING_OPTIONS, options : HANDLE_OPTIONS, oplockbreakinghandler : IOplockBreakingHandler, interophandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.create.call(this, accessoptions, sharingoptions, options, oplockbreakinghandler, interophandle)
  end
end
struct LibWin32::IStorageFolderHandleAccess
  def query_interface(this : IStorageFolderHandleAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStorageFolderHandleAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStorageFolderHandleAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create(this : IStorageFolderHandleAccess*, filename : LibC::LPWSTR, creationoptions : HANDLE_CREATION_OPTIONS, accessoptions : HANDLE_ACCESS_OPTIONS, sharingoptions : HANDLE_SHARING_OPTIONS, options : HANDLE_OPTIONS, oplockbreakinghandler : IOplockBreakingHandler, interophandle : LibC::HANDLE*) : HRESULT
    @lpVtbl.value.create.call(this, filename, creationoptions, accessoptions, sharingoptions, options, oplockbreakinghandler, interophandle)
  end
end
