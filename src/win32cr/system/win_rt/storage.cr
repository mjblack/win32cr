require "./../com.cr"
require "./../../foundation.cr"

module Win32cr::System::WinRT::Storage

  @[Flags]
  enum HANDLE_OPTIONS : UInt32
    HO_NONE = 0_u32
    HO_OPEN_REQUIRING_OPLOCK = 262144_u32
    HO_DELETE_ON_CLOSE = 67108864_u32
    HO_SEQUENTIAL_SCAN = 134217728_u32
    HO_RANDOM_ACCESS = 268435456_u32
    HO_NO_BUFFERING = 536870912_u32
    HO_OVERLAPPED = 1073741824_u32
    HO_WRITE_THROUGH = 2147483648_u32
  end
  @[Flags]
  enum HANDLE_ACCESS_OPTIONS : UInt32
    HAO_NONE = 0_u32
    HAO_READ_ATTRIBUTES = 128_u32
    HAO_READ = 1179785_u32
    HAO_WRITE = 1179926_u32
    HAO_DELETE = 65536_u32
  end
  @[Flags]
  enum HANDLE_SHARING_OPTIONS : UInt32
    HSO_SHARE_NONE = 0_u32
    HSO_SHARE_READ = 1_u32
    HSO_SHARE_WRITE = 2_u32
    HSO_SHARE_DELETE = 4_u32
  end
  enum HANDLE_CREATION_OPTIONS
    HCO_CREATE_NEW = 1_i32
    HCO_CREATE_ALWAYS = 2_i32
    HCO_OPEN_EXISTING = 3_i32
    HCO_OPEN_ALWAYS = 4_i32
    HCO_TRUNCATE_EXISTING = 5_i32
  end

  @[Extern]
  record IRandomAccessStreamFileAccessModeVtbl,
    query_interface : Proc(IRandomAccessStreamFileAccessMode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRandomAccessStreamFileAccessMode*, UInt32),
    release : Proc(IRandomAccessStreamFileAccessMode*, UInt32),
    get_mode : Proc(IRandomAccessStreamFileAccessMode*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRandomAccessStreamFileAccessMode, lpVtbl : IRandomAccessStreamFileAccessModeVtbl* do
    GUID = LibC::GUID.new(0x332e5848_u32, 0x2e15_u16, 0x458e_u16, StaticArray[0x85_u8, 0xc4_u8, 0xc9_u8, 0x11_u8, 0xc0_u8, 0xc3_u8, 0xd6_u8, 0xf4_u8])
    def query_interface(this : IRandomAccessStreamFileAccessMode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRandomAccessStreamFileAccessMode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRandomAccessStreamFileAccessMode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_mode(this : IRandomAccessStreamFileAccessMode*, fileAccessMode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mode.call(this, fileAccessMode)
    end

  end

  @[Extern]
  record IUnbufferedFileHandleOplockCallbackVtbl,
    query_interface : Proc(IUnbufferedFileHandleOplockCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUnbufferedFileHandleOplockCallback*, UInt32),
    release : Proc(IUnbufferedFileHandleOplockCallback*, UInt32),
    on_broken_callback : Proc(IUnbufferedFileHandleOplockCallback*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUnbufferedFileHandleOplockCallback, lpVtbl : IUnbufferedFileHandleOplockCallbackVtbl* do
    GUID = LibC::GUID.new(0xd1019a0e_u32, 0x6243_u16, 0x4329_u16, StaticArray[0x84_u8, 0x97_u8, 0x2e_u8, 0x75_u8, 0x89_u8, 0x4d_u8, 0x77_u8, 0x10_u8])
    def query_interface(this : IUnbufferedFileHandleOplockCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUnbufferedFileHandleOplockCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUnbufferedFileHandleOplockCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_broken_callback(this : IUnbufferedFileHandleOplockCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_broken_callback.call(this)
    end

  end

  @[Extern]
  record IUnbufferedFileHandleProviderVtbl,
    query_interface : Proc(IUnbufferedFileHandleProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUnbufferedFileHandleProvider*, UInt32),
    release : Proc(IUnbufferedFileHandleProvider*, UInt32),
    open_unbuffered_file_handle : Proc(IUnbufferedFileHandleProvider*, Void*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    close_unbuffered_file_handle : Proc(IUnbufferedFileHandleProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUnbufferedFileHandleProvider, lpVtbl : IUnbufferedFileHandleProviderVtbl* do
    GUID = LibC::GUID.new(0xa65c9109_u32, 0x42ab_u16, 0x4b94_u16, StaticArray[0xa7_u8, 0xb1_u8, 0xdd_u8, 0x2e_u8, 0x4e_u8, 0x68_u8, 0x51_u8, 0x5e_u8])
    def query_interface(this : IUnbufferedFileHandleProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUnbufferedFileHandleProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUnbufferedFileHandleProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open_unbuffered_file_handle(this : IUnbufferedFileHandleProvider*, oplockBreakCallback : Void*, fileHandle : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_unbuffered_file_handle.call(this, oplockBreakCallback, fileHandle)
    end
    def close_unbuffered_file_handle(this : IUnbufferedFileHandleProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_unbuffered_file_handle.call(this)
    end

  end

  @[Extern]
  record IOplockBreakingHandlerVtbl,
    query_interface : Proc(IOplockBreakingHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IOplockBreakingHandler*, UInt32),
    release : Proc(IOplockBreakingHandler*, UInt32),
    oplock_breaking : Proc(IOplockBreakingHandler*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IOplockBreakingHandler, lpVtbl : IOplockBreakingHandlerVtbl* do
    GUID = LibC::GUID.new(0x826abe3d_u32, 0x3acd_u16, 0x47d3_u16, StaticArray[0x84_u8, 0xf2_u8, 0x88_u8, 0xaa_u8, 0xed_u8, 0xcf_u8, 0x63_u8, 0x4_u8])
    def query_interface(this : IOplockBreakingHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IOplockBreakingHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IOplockBreakingHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def oplock_breaking(this : IOplockBreakingHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.oplock_breaking.call(this)
    end

  end

  @[Extern]
  record IStorageItemHandleAccessVtbl,
    query_interface : Proc(IStorageItemHandleAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStorageItemHandleAccess*, UInt32),
    release : Proc(IStorageItemHandleAccess*, UInt32),
    create : Proc(IStorageItemHandleAccess*, Win32cr::System::WinRT::Storage::HANDLE_ACCESS_OPTIONS, Win32cr::System::WinRT::Storage::HANDLE_SHARING_OPTIONS, Win32cr::System::WinRT::Storage::HANDLE_OPTIONS, Void*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStorageItemHandleAccess, lpVtbl : IStorageItemHandleAccessVtbl* do
    GUID = LibC::GUID.new(0x5ca296b2_u32, 0x2c25_u16, 0x4d22_u16, StaticArray[0xb7_u8, 0x85_u8, 0xb8_u8, 0x85_u8, 0xc8_u8, 0x20_u8, 0x1e_u8, 0x6a_u8])
    def query_interface(this : IStorageItemHandleAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStorageItemHandleAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStorageItemHandleAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IStorageItemHandleAccess*, accessOptions : Win32cr::System::WinRT::Storage::HANDLE_ACCESS_OPTIONS, sharingOptions : Win32cr::System::WinRT::Storage::HANDLE_SHARING_OPTIONS, options : Win32cr::System::WinRT::Storage::HANDLE_OPTIONS, oplockBreakingHandler : Void*, interopHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, accessOptions, sharingOptions, options, oplockBreakingHandler, interopHandle)
    end

  end

  @[Extern]
  record IStorageFolderHandleAccessVtbl,
    query_interface : Proc(IStorageFolderHandleAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStorageFolderHandleAccess*, UInt32),
    release : Proc(IStorageFolderHandleAccess*, UInt32),
    create : Proc(IStorageFolderHandleAccess*, Win32cr::Foundation::PWSTR, Win32cr::System::WinRT::Storage::HANDLE_CREATION_OPTIONS, Win32cr::System::WinRT::Storage::HANDLE_ACCESS_OPTIONS, Win32cr::System::WinRT::Storage::HANDLE_SHARING_OPTIONS, Win32cr::System::WinRT::Storage::HANDLE_OPTIONS, Void*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStorageFolderHandleAccess, lpVtbl : IStorageFolderHandleAccessVtbl* do
    GUID = LibC::GUID.new(0xdf19938f_u32, 0x5462_u16, 0x48a0_u16, StaticArray[0xbe_u8, 0x65_u8, 0xd2_u8, 0xa3_u8, 0x27_u8, 0x1a_u8, 0x8_u8, 0xd6_u8])
    def query_interface(this : IStorageFolderHandleAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStorageFolderHandleAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStorageFolderHandleAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create(this : IStorageFolderHandleAccess*, fileName : Win32cr::Foundation::PWSTR, creationOptions : Win32cr::System::WinRT::Storage::HANDLE_CREATION_OPTIONS, accessOptions : Win32cr::System::WinRT::Storage::HANDLE_ACCESS_OPTIONS, sharingOptions : Win32cr::System::WinRT::Storage::HANDLE_SHARING_OPTIONS, options : Win32cr::System::WinRT::Storage::HANDLE_OPTIONS, oplockBreakingHandler : Void*, interopHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, fileName, creationOptions, accessOptions, sharingOptions, options, oplockBreakingHandler, interopHandle)
    end

  end

end