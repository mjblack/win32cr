require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  struct IRandomAccessStreamFileAccessMode
    lpVtbl : IRandomAccessStreamFileAccessModeVTbl*
  end

  struct IUnbufferedFileHandleOplockCallbackVTbl
    query_interface : Proc(IUnbufferedFileHandleOplockCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUnbufferedFileHandleOplockCallback*, UInt32)
    release : Proc(IUnbufferedFileHandleOplockCallback*, UInt32)
    on_broken_callback : Proc(IUnbufferedFileHandleOplockCallback*, HRESULT)
  end

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

  struct IUnbufferedFileHandleProvider
    lpVtbl : IUnbufferedFileHandleProviderVTbl*
  end

  struct IOplockBreakingHandlerVTbl
    query_interface : Proc(IOplockBreakingHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOplockBreakingHandler*, UInt32)
    release : Proc(IOplockBreakingHandler*, UInt32)
    oplock_breaking : Proc(IOplockBreakingHandler*, HRESULT)
  end

  struct IOplockBreakingHandler
    lpVtbl : IOplockBreakingHandlerVTbl*
  end

  struct IStorageItemHandleAccessVTbl
    query_interface : Proc(IStorageItemHandleAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStorageItemHandleAccess*, UInt32)
    release : Proc(IStorageItemHandleAccess*, UInt32)
    create : Proc(IStorageItemHandleAccess*, HANDLE_ACCESS_OPTIONS, HANDLE_SHARING_OPTIONS, HANDLE_OPTIONS, IOplockBreakingHandler, LibC::HANDLE*, HRESULT)
  end

  struct IStorageItemHandleAccess
    lpVtbl : IStorageItemHandleAccessVTbl*
  end

  struct IStorageFolderHandleAccessVTbl
    query_interface : Proc(IStorageFolderHandleAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStorageFolderHandleAccess*, UInt32)
    release : Proc(IStorageFolderHandleAccess*, UInt32)
    create : Proc(IStorageFolderHandleAccess*, LibC::LPWSTR, HANDLE_CREATION_OPTIONS, HANDLE_ACCESS_OPTIONS, HANDLE_SHARING_OPTIONS, HANDLE_OPTIONS, IOplockBreakingHandler, LibC::HANDLE*, HRESULT)
  end

  struct IStorageFolderHandleAccess
    lpVtbl : IStorageFolderHandleAccessVTbl*
  end

end
