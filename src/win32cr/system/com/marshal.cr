require "./../com.cr"
require "./../../foundation.cr"
require "./../../graphics/gdi.cr"
require "./../../ui/windows_and_messaging.cr"

module Win32cr::System::Com::Marshal
  extend self

  enum STDMSHLFLAGS
    SMEXF_SERVER = 1_i32
    SMEXF_HANDLER = 2_i32
  end

  @[Extern]
  record IMarshalVtbl,
    query_interface : Proc(IMarshal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMarshal*, UInt32),
    release : Proc(IMarshal*, UInt32),
    get_unmarshal_class : Proc(IMarshal*, LibC::GUID*, Void*, UInt32, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_marshal_size_max : Proc(IMarshal*, LibC::GUID*, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    marshal_interface : Proc(IMarshal*, Void*, LibC::GUID*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    unmarshal_interface : Proc(IMarshal*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    release_marshal_data : Proc(IMarshal*, Void*, Win32cr::Foundation::HRESULT),
    disconnect_object : Proc(IMarshal*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMarshal, lpVtbl : IMarshalVtbl* do
    GUID = LibC::GUID.new(0x3_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IMarshal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMarshal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMarshal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_unmarshal_class(this : IMarshal*, riid : LibC::GUID*, pv : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, pCid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unmarshal_class.call(this, riid, pv, dwDestContext, pvDestContext, mshlflags, pCid)
    end
    def get_marshal_size_max(this : IMarshal*, riid : LibC::GUID*, pv : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, pSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marshal_size_max.call(this, riid, pv, dwDestContext, pvDestContext, mshlflags, pSize)
    end
    def marshal_interface(this : IMarshal*, pStm : Void*, riid : LibC::GUID*, pv : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.marshal_interface.call(this, pStm, riid, pv, dwDestContext, pvDestContext, mshlflags)
    end
    def unmarshal_interface(this : IMarshal*, pStm : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmarshal_interface.call(this, pStm, riid, ppv)
    end
    def release_marshal_data(this : IMarshal*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_marshal_data.call(this, pStm)
    end
    def disconnect_object(this : IMarshal*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_object.call(this, dwReserved)
    end

  end

  @[Extern]
  record IMarshal2Vtbl,
    query_interface : Proc(IMarshal2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMarshal2*, UInt32),
    release : Proc(IMarshal2*, UInt32),
    get_unmarshal_class : Proc(IMarshal2*, LibC::GUID*, Void*, UInt32, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_marshal_size_max : Proc(IMarshal2*, LibC::GUID*, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    marshal_interface : Proc(IMarshal2*, Void*, LibC::GUID*, Void*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    unmarshal_interface : Proc(IMarshal2*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    release_marshal_data : Proc(IMarshal2*, Void*, Win32cr::Foundation::HRESULT),
    disconnect_object : Proc(IMarshal2*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMarshal2, lpVtbl : IMarshal2Vtbl* do
    GUID = LibC::GUID.new(0x1cf_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
    def query_interface(this : IMarshal2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMarshal2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMarshal2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_unmarshal_class(this : IMarshal2*, riid : LibC::GUID*, pv : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, pCid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unmarshal_class.call(this, riid, pv, dwDestContext, pvDestContext, mshlflags, pCid)
    end
    def get_marshal_size_max(this : IMarshal2*, riid : LibC::GUID*, pv : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, pSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marshal_size_max.call(this, riid, pv, dwDestContext, pvDestContext, mshlflags, pSize)
    end
    def marshal_interface(this : IMarshal2*, pStm : Void*, riid : LibC::GUID*, pv : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.marshal_interface.call(this, pStm, riid, pv, dwDestContext, pvDestContext, mshlflags)
    end
    def unmarshal_interface(this : IMarshal2*, pStm : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmarshal_interface.call(this, pStm, riid, ppv)
    end
    def release_marshal_data(this : IMarshal2*, pStm : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_marshal_data.call(this, pStm)
    end
    def disconnect_object(this : IMarshal2*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect_object.call(this, dwReserved)
    end

  end

  @[Extern]
  record IMarshalingStreamVtbl,
    query_interface : Proc(IMarshalingStream*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMarshalingStream*, UInt32),
    release : Proc(IMarshalingStream*, UInt32),
    read : Proc(IMarshalingStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    write : Proc(IMarshalingStream*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    seek : Proc(IMarshalingStream*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::System::Com::STREAM_SEEK, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IMarshalingStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::HRESULT),
    copy_to : Proc(IMarshalingStream*, Void*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::ULARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    commit : Proc(IMarshalingStream*, Win32cr::System::Com::STGC, Win32cr::Foundation::HRESULT),
    revert : Proc(IMarshalingStream*, Win32cr::Foundation::HRESULT),
    lock_region : Proc(IMarshalingStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    unlock_region : Proc(IMarshalingStream*, Win32cr::Foundation::ULARGE_INTEGER, Win32cr::Foundation::ULARGE_INTEGER, UInt32, Win32cr::Foundation::HRESULT),
    stat : Proc(IMarshalingStream*, Win32cr::System::Com::STATSTG*, UInt32, Win32cr::Foundation::HRESULT),
    clone : Proc(IMarshalingStream*, Void**, Win32cr::Foundation::HRESULT),
    get_marshaling_context_attribute : Proc(IMarshalingStream*, Win32cr::System::Com::CO_MARSHALING_CONTEXT_ATTRIBUTES, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMarshalingStream, lpVtbl : IMarshalingStreamVtbl* do
    GUID = LibC::GUID.new(0xd8f2f5e6_u32, 0x6102_u16, 0x4863_u16, StaticArray[0x9f_u8, 0x26_u8, 0x38_u8, 0x9a_u8, 0x46_u8, 0x76_u8, 0xef_u8, 0xde_u8])
    def query_interface(this : IMarshalingStream*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMarshalingStream*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMarshalingStream*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read(this : IMarshalingStream*, pv : Void*, cb : UInt32, pcbRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pv, cb, pcbRead)
    end
    def write(this : IMarshalingStream*, pv : Void*, cb : UInt32, pcbWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, pv, cb, pcbWritten)
    end
    def seek(this : IMarshalingStream*, dlibMove : Win32cr::Foundation::LARGE_INTEGER, dwOrigin : Win32cr::System::Com::STREAM_SEEK, plibNewPosition : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, dlibMove, dwOrigin, plibNewPosition)
    end
    def set_size(this : IMarshalingStream*, libNewSize : Win32cr::Foundation::ULARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, libNewSize)
    end
    def copy_to(this : IMarshalingStream*, pstm : Void*, cb : Win32cr::Foundation::ULARGE_INTEGER, pcbRead : Win32cr::Foundation::ULARGE_INTEGER*, pcbWritten : Win32cr::Foundation::ULARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to.call(this, pstm, cb, pcbRead, pcbWritten)
    end
    def commit(this : IMarshalingStream*, grfCommitFlags : Win32cr::System::Com::STGC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, grfCommitFlags)
    end
    def revert(this : IMarshalingStream*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert.call(this)
    end
    def lock_region(this : IMarshalingStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_region.call(this, libOffset, cb, dwLockType)
    end
    def unlock_region(this : IMarshalingStream*, libOffset : Win32cr::Foundation::ULARGE_INTEGER, cb : Win32cr::Foundation::ULARGE_INTEGER, dwLockType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlock_region.call(this, libOffset, cb, dwLockType)
    end
    def stat(this : IMarshalingStream*, pstatstg : Win32cr::System::Com::STATSTG*, grfStatFlag : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stat.call(this, pstatstg, grfStatFlag)
    end
    def clone(this : IMarshalingStream*, ppstm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppstm)
    end
    def get_marshaling_context_attribute(this : IMarshalingStream*, attribute : Win32cr::System::Com::CO_MARSHALING_CONTEXT_ATTRIBUTES, pAttributeValue : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marshaling_context_attribute.call(this, attribute, pAttributeValue)
    end

  end

  def bSTRUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::BSTR*) : UInt32
    C.BSTR_UserSize(param0, param1, param2)
  end

  def bSTRUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*
    C.BSTR_UserMarshal(param0, param1, param2)
  end

  def bSTRUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*
    C.BSTR_UserUnmarshal(param0, param1, param2)
  end

  def bSTRUserFree(param0 : UInt32*, param1 : Win32cr::Foundation::BSTR*) : Void
    C.BSTR_UserFree(param0, param1)
  end

  def hWNDUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::HWND*) : UInt32
    C.HWND_UserSize(param0, param1, param2)
  end

  def hWNDUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*
    C.HWND_UserMarshal(param0, param1, param2)
  end

  def hWNDUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*
    C.HWND_UserUnmarshal(param0, param1, param2)
  end

  def hWNDUserFree(param0 : UInt32*, param1 : Win32cr::Foundation::HWND*) : Void
    C.HWND_UserFree(param0, param1)
  end

  def vARIANTUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::VARIANT*) : UInt32
    C.VARIANT_UserSize(param0, param1, param2)
  end

  def vARIANTUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*
    C.VARIANT_UserMarshal(param0, param1, param2)
  end

  def vARIANTUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*
    C.VARIANT_UserUnmarshal(param0, param1, param2)
  end

  def vARIANTUserFree(param0 : UInt32*, param1 : Win32cr::System::Com::VARIANT*) : Void
    C.VARIANT_UserFree(param0, param1)
  end

  def bSTRUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::BSTR*) : UInt32
    C.BSTR_UserSize64(param0, param1, param2)
  end

  def bSTRUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*
    C.BSTR_UserMarshal64(param0, param1, param2)
  end

  def bSTRUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*
    C.BSTR_UserUnmarshal64(param0, param1, param2)
  end

  def bSTRUserFree64(param0 : UInt32*, param1 : Win32cr::Foundation::BSTR*) : Void
    C.BSTR_UserFree64(param0, param1)
  end

  def hWNDUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::HWND*) : UInt32
    C.HWND_UserSize64(param0, param1, param2)
  end

  def hWNDUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*
    C.HWND_UserMarshal64(param0, param1, param2)
  end

  def hWNDUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*
    C.HWND_UserUnmarshal64(param0, param1, param2)
  end

  def hWNDUserFree64(param0 : UInt32*, param1 : Win32cr::Foundation::HWND*) : Void
    C.HWND_UserFree64(param0, param1)
  end

  def vARIANTUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::VARIANT*) : UInt32
    C.VARIANT_UserSize64(param0, param1, param2)
  end

  def vARIANTUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*
    C.VARIANT_UserMarshal64(param0, param1, param2)
  end

  def vARIANTUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*
    C.VARIANT_UserUnmarshal64(param0, param1, param2)
  end

  def vARIANTUserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::VARIANT*) : Void
    C.VARIANT_UserFree64(param0, param1)
  end

  def cLIPFORMATUserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32
    C.CLIPFORMAT_UserSize(param0, param1, param2)
  end

  def cLIPFORMATUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*
    C.CLIPFORMAT_UserMarshal(param0, param1, param2)
  end

  def cLIPFORMATUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*
    C.CLIPFORMAT_UserUnmarshal(param0, param1, param2)
  end

  def cLIPFORMATUserFree(param0 : UInt32*, param1 : UInt16*) : Void
    C.CLIPFORMAT_UserFree(param0, param1)
  end

  def hBITMAPUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt32
    C.HBITMAP_UserSize(param0, param1, param2)
  end

  def hBITMAPUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*
    C.HBITMAP_UserMarshal(param0, param1, param2)
  end

  def hBITMAPUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*
    C.HBITMAP_UserUnmarshal(param0, param1, param2)
  end

  def hBITMAPUserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HBITMAP*) : Void
    C.HBITMAP_UserFree(param0, param1)
  end

  def hDCUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt32
    C.HDC_UserSize(param0, param1, param2)
  end

  def hDCUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*
    C.HDC_UserMarshal(param0, param1, param2)
  end

  def hDCUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*
    C.HDC_UserUnmarshal(param0, param1, param2)
  end

  def hDCUserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HDC*) : Void
    C.HDC_UserFree(param0, param1)
  end

  def hICONUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt32
    C.HICON_UserSize(param0, param1, param2)
  end

  def hICONUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*
    C.HICON_UserMarshal(param0, param1, param2)
  end

  def hICONUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*
    C.HICON_UserUnmarshal(param0, param1, param2)
  end

  def hICONUserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HICON*) : Void
    C.HICON_UserFree(param0, param1)
  end

  def sNBUserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32
    C.SNB_UserSize(param0, param1, param2)
  end

  def sNBUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*
    C.SNB_UserMarshal(param0, param1, param2)
  end

  def sNBUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*
    C.SNB_UserUnmarshal(param0, param1, param2)
  end

  def sNBUserFree(param0 : UInt32*, param1 : UInt16***) : Void
    C.SNB_UserFree(param0, param1)
  end

  def sTGMEDIUMUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt32
    C.STGMEDIUM_UserSize(param0, param1, param2)
  end

  def sTGMEDIUMUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*
    C.STGMEDIUM_UserMarshal(param0, param1, param2)
  end

  def sTGMEDIUMUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*
    C.STGMEDIUM_UserUnmarshal(param0, param1, param2)
  end

  def sTGMEDIUMUserFree(param0 : UInt32*, param1 : Win32cr::System::Com::STGMEDIUM*) : Void
    C.STGMEDIUM_UserFree(param0, param1)
  end

  def cLIPFORMATUserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32
    C.CLIPFORMAT_UserSize64(param0, param1, param2)
  end

  def cLIPFORMATUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*
    C.CLIPFORMAT_UserMarshal64(param0, param1, param2)
  end

  def cLIPFORMATUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*
    C.CLIPFORMAT_UserUnmarshal64(param0, param1, param2)
  end

  def cLIPFORMATUserFree64(param0 : UInt32*, param1 : UInt16*) : Void
    C.CLIPFORMAT_UserFree64(param0, param1)
  end

  def hBITMAPUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt32
    C.HBITMAP_UserSize64(param0, param1, param2)
  end

  def hBITMAPUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*
    C.HBITMAP_UserMarshal64(param0, param1, param2)
  end

  def hBITMAPUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*
    C.HBITMAP_UserUnmarshal64(param0, param1, param2)
  end

  def hBITMAPUserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HBITMAP*) : Void
    C.HBITMAP_UserFree64(param0, param1)
  end

  def hDCUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt32
    C.HDC_UserSize64(param0, param1, param2)
  end

  def hDCUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*
    C.HDC_UserMarshal64(param0, param1, param2)
  end

  def hDCUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*
    C.HDC_UserUnmarshal64(param0, param1, param2)
  end

  def hDCUserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HDC*) : Void
    C.HDC_UserFree64(param0, param1)
  end

  def hICONUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt32
    C.HICON_UserSize64(param0, param1, param2)
  end

  def hICONUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*
    C.HICON_UserMarshal64(param0, param1, param2)
  end

  def hICONUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*
    C.HICON_UserUnmarshal64(param0, param1, param2)
  end

  def hICONUserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HICON*) : Void
    C.HICON_UserFree64(param0, param1)
  end

  def sNBUserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32
    C.SNB_UserSize64(param0, param1, param2)
  end

  def sNBUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*
    C.SNB_UserMarshal64(param0, param1, param2)
  end

  def sNBUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*
    C.SNB_UserUnmarshal64(param0, param1, param2)
  end

  def sNBUserFree64(param0 : UInt32*, param1 : UInt16***) : Void
    C.SNB_UserFree64(param0, param1)
  end

  def sTGMEDIUMUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt32
    C.STGMEDIUM_UserSize64(param0, param1, param2)
  end

  def sTGMEDIUMUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*
    C.STGMEDIUM_UserMarshal64(param0, param1, param2)
  end

  def sTGMEDIUMUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*
    C.STGMEDIUM_UserUnmarshal64(param0, param1, param2)
  end

  def sTGMEDIUMUserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::STGMEDIUM*) : Void
    C.STGMEDIUM_UserFree64(param0, param1)
  end

  def coGetMarshalSizeMax(pulSize : UInt32*, riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT
    C.CoGetMarshalSizeMax(pulSize, riid, pUnk, dwDestContext, pvDestContext, mshlflags)
  end

  def coMarshalInterface(pStm : Void*, riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT
    C.CoMarshalInterface(pStm, riid, pUnk, dwDestContext, pvDestContext, mshlflags)
  end

  def coUnmarshalInterface(pStm : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    C.CoUnmarshalInterface(pStm, riid, ppv)
  end

  def coMarshalHresult(pstm : Void*, hresult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
    C.CoMarshalHresult(pstm, hresult)
  end

  def coUnmarshalHresult(pstm : Void*, phresult : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
    C.CoUnmarshalHresult(pstm, phresult)
  end

  def coReleaseMarshalData(pStm : Void*) : Win32cr::Foundation::HRESULT
    C.CoReleaseMarshalData(pStm)
  end

  def coGetStandardMarshal(riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, ppMarshal : Void**) : Win32cr::Foundation::HRESULT
    C.CoGetStandardMarshal(riid, pUnk, dwDestContext, pvDestContext, mshlflags, ppMarshal)
  end

  def coGetStdMarshalEx(pUnkOuter : Void*, smexflags : UInt32, ppUnkInner : Void**) : Win32cr::Foundation::HRESULT
    C.CoGetStdMarshalEx(pUnkOuter, smexflags, ppUnkInner)
  end

  def coMarshalInterThreadInterfaceInStream(riid : LibC::GUID*, pUnk : Void*, ppStm : Void**) : Win32cr::Foundation::HRESULT
    C.CoMarshalInterThreadInterfaceInStream(riid, pUnk, ppStm)
  end

  def lPSAFEARRAYUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt32
    C.LPSAFEARRAY_UserSize(param0, param1, param2)
  end

  def lPSAFEARRAYUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*
    C.LPSAFEARRAY_UserMarshal(param0, param1, param2)
  end

  def lPSAFEARRAYUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*
    C.LPSAFEARRAY_UserUnmarshal(param0, param1, param2)
  end

  def lPSAFEARRAYUserFree(param0 : UInt32*, param1 : Win32cr::System::Com::SAFEARRAY**) : Void
    C.LPSAFEARRAY_UserFree(param0, param1)
  end

  def lPSAFEARRAYUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt32
    C.LPSAFEARRAY_UserSize64(param0, param1, param2)
  end

  def lPSAFEARRAYUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*
    C.LPSAFEARRAY_UserMarshal64(param0, param1, param2)
  end

  def lPSAFEARRAYUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*
    C.LPSAFEARRAY_UserUnmarshal64(param0, param1, param2)
  end

  def lPSAFEARRAYUserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::SAFEARRAY**) : Void
    C.LPSAFEARRAY_UserFree64(param0, param1)
  end

  def hACCELUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt32
    C.HACCEL_UserSize(param0, param1, param2)
  end

  def hACCELUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*
    C.HACCEL_UserMarshal(param0, param1, param2)
  end

  def hACCELUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*
    C.HACCEL_UserUnmarshal(param0, param1, param2)
  end

  def hACCELUserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : Void
    C.HACCEL_UserFree(param0, param1)
  end

  def hGLOBALUserSize(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32
    C.HGLOBAL_UserSize(param0, param1, param2)
  end

  def hGLOBALUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*
    C.HGLOBAL_UserMarshal(param0, param1, param2)
  end

  def hGLOBALUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*
    C.HGLOBAL_UserUnmarshal(param0, param1, param2)
  end

  def hGLOBALUserFree(param0 : UInt32*, param1 : LibC::IntPtrT*) : Void
    C.HGLOBAL_UserFree(param0, param1)
  end

  def hMENUUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt32
    C.HMENU_UserSize(param0, param1, param2)
  end

  def hMENUUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*
    C.HMENU_UserMarshal(param0, param1, param2)
  end

  def hMENUUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*
    C.HMENU_UserUnmarshal(param0, param1, param2)
  end

  def hMENUUserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HMENU*) : Void
    C.HMENU_UserFree(param0, param1)
  end

  def hACCELUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt32
    C.HACCEL_UserSize64(param0, param1, param2)
  end

  def hACCELUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*
    C.HACCEL_UserMarshal64(param0, param1, param2)
  end

  def hACCELUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*
    C.HACCEL_UserUnmarshal64(param0, param1, param2)
  end

  def hACCELUserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : Void
    C.HACCEL_UserFree64(param0, param1)
  end

  def hGLOBALUserSize64(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32
    C.HGLOBAL_UserSize64(param0, param1, param2)
  end

  def hGLOBALUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*
    C.HGLOBAL_UserMarshal64(param0, param1, param2)
  end

  def hGLOBALUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*
    C.HGLOBAL_UserUnmarshal64(param0, param1, param2)
  end

  def hGLOBALUserFree64(param0 : UInt32*, param1 : LibC::IntPtrT*) : Void
    C.HGLOBAL_UserFree64(param0, param1)
  end

  def hMENUUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt32
    C.HMENU_UserSize64(param0, param1, param2)
  end

  def hMENUUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*
    C.HMENU_UserMarshal64(param0, param1, param2)
  end

  def hMENUUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*
    C.HMENU_UserUnmarshal64(param0, param1, param2)
  end

  def hMENUUserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HMENU*) : Void
    C.HMENU_UserFree64(param0, param1)
  end

  def hPALETTEUserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt32
    C.HPALETTE_UserSize(param0, param1, param2)
  end

  def hPALETTEUserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*
    C.HPALETTE_UserMarshal(param0, param1, param2)
  end

  def hPALETTEUserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*
    C.HPALETTE_UserUnmarshal(param0, param1, param2)
  end

  def hPALETTEUserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HPALETTE*) : Void
    C.HPALETTE_UserFree(param0, param1)
  end

  def hPALETTEUserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt32
    C.HPALETTE_UserSize64(param0, param1, param2)
  end

  def hPALETTEUserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*
    C.HPALETTE_UserMarshal64(param0, param1, param2)
  end

  def hPALETTEUserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*
    C.HPALETTE_UserUnmarshal64(param0, param1, param2)
  end

  def hPALETTEUserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HPALETTE*) : Void
    C.HPALETTE_UserFree64(param0, param1)
  end

  @[Link("oleaut32")]
  @[Link("ole32")]
  lib C
    # :nodoc:
    fun BSTR_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::BSTR*) : UInt32

    # :nodoc:
    fun BSTR_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    # :nodoc:
    fun BSTR_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    # :nodoc:
    fun BSTR_UserFree(param0 : UInt32*, param1 : Win32cr::Foundation::BSTR*) : Void

    # :nodoc:
    fun HWND_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::HWND*) : UInt32

    # :nodoc:
    fun HWND_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    # :nodoc:
    fun HWND_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    # :nodoc:
    fun HWND_UserFree(param0 : UInt32*, param1 : Win32cr::Foundation::HWND*) : Void

    # :nodoc:
    fun VARIANT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::VARIANT*) : UInt32

    # :nodoc:
    fun VARIANT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserFree(param0 : UInt32*, param1 : Win32cr::System::Com::VARIANT*) : Void

    # :nodoc:
    fun BSTR_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::BSTR*) : UInt32

    # :nodoc:
    fun BSTR_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    # :nodoc:
    fun BSTR_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    # :nodoc:
    fun BSTR_UserFree64(param0 : UInt32*, param1 : Win32cr::Foundation::BSTR*) : Void

    # :nodoc:
    fun HWND_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::HWND*) : UInt32

    # :nodoc:
    fun HWND_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    # :nodoc:
    fun HWND_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    # :nodoc:
    fun HWND_UserFree64(param0 : UInt32*, param1 : Win32cr::Foundation::HWND*) : Void

    # :nodoc:
    fun VARIANT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::VARIANT*) : UInt32

    # :nodoc:
    fun VARIANT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    # :nodoc:
    fun VARIANT_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::VARIANT*) : Void

    # :nodoc:
    fun CLIPFORMAT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32

    # :nodoc:
    fun CLIPFORMAT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    # :nodoc:
    fun CLIPFORMAT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    # :nodoc:
    fun CLIPFORMAT_UserFree(param0 : UInt32*, param1 : UInt16*) : Void

    # :nodoc:
    fun HBITMAP_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt32

    # :nodoc:
    fun HBITMAP_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    # :nodoc:
    fun HBITMAP_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    # :nodoc:
    fun HBITMAP_UserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HBITMAP*) : Void

    # :nodoc:
    fun HDC_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt32

    # :nodoc:
    fun HDC_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    # :nodoc:
    fun HDC_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    # :nodoc:
    fun HDC_UserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HDC*) : Void

    # :nodoc:
    fun HICON_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt32

    # :nodoc:
    fun HICON_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    # :nodoc:
    fun HICON_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    # :nodoc:
    fun HICON_UserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HICON*) : Void

    # :nodoc:
    fun SNB_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32

    # :nodoc:
    fun SNB_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    # :nodoc:
    fun SNB_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    # :nodoc:
    fun SNB_UserFree(param0 : UInt32*, param1 : UInt16***) : Void

    # :nodoc:
    fun STGMEDIUM_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt32

    # :nodoc:
    fun STGMEDIUM_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    # :nodoc:
    fun STGMEDIUM_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    # :nodoc:
    fun STGMEDIUM_UserFree(param0 : UInt32*, param1 : Win32cr::System::Com::STGMEDIUM*) : Void

    # :nodoc:
    fun CLIPFORMAT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32

    # :nodoc:
    fun CLIPFORMAT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    # :nodoc:
    fun CLIPFORMAT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    # :nodoc:
    fun CLIPFORMAT_UserFree64(param0 : UInt32*, param1 : UInt16*) : Void

    # :nodoc:
    fun HBITMAP_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt32

    # :nodoc:
    fun HBITMAP_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    # :nodoc:
    fun HBITMAP_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    # :nodoc:
    fun HBITMAP_UserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HBITMAP*) : Void

    # :nodoc:
    fun HDC_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt32

    # :nodoc:
    fun HDC_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    # :nodoc:
    fun HDC_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    # :nodoc:
    fun HDC_UserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HDC*) : Void

    # :nodoc:
    fun HICON_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt32

    # :nodoc:
    fun HICON_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    # :nodoc:
    fun HICON_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    # :nodoc:
    fun HICON_UserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HICON*) : Void

    # :nodoc:
    fun SNB_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32

    # :nodoc:
    fun SNB_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    # :nodoc:
    fun SNB_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    # :nodoc:
    fun SNB_UserFree64(param0 : UInt32*, param1 : UInt16***) : Void

    # :nodoc:
    fun STGMEDIUM_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt32

    # :nodoc:
    fun STGMEDIUM_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    # :nodoc:
    fun STGMEDIUM_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    # :nodoc:
    fun STGMEDIUM_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::STGMEDIUM*) : Void

    # :nodoc:
    fun CoGetMarshalSizeMax(pulSize : UInt32*, riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoMarshalInterface(pStm : Void*, riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoUnmarshalInterface(pStm : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoMarshalHresult(pstm : Void*, hresult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoUnmarshalHresult(pstm : Void*, phresult : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoReleaseMarshalData(pStm : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoGetStandardMarshal(riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, ppMarshal : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoGetStdMarshalEx(pUnkOuter : Void*, smexflags : UInt32, ppUnkInner : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CoMarshalInterThreadInterfaceInStream(riid : LibC::GUID*, pUnk : Void*, ppStm : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LPSAFEARRAY_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt32

    # :nodoc:
    fun LPSAFEARRAY_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    # :nodoc:
    fun LPSAFEARRAY_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    # :nodoc:
    fun LPSAFEARRAY_UserFree(param0 : UInt32*, param1 : Win32cr::System::Com::SAFEARRAY**) : Void

    # :nodoc:
    fun LPSAFEARRAY_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt32

    # :nodoc:
    fun LPSAFEARRAY_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    # :nodoc:
    fun LPSAFEARRAY_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    # :nodoc:
    fun LPSAFEARRAY_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::SAFEARRAY**) : Void

    # :nodoc:
    fun HACCEL_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt32

    # :nodoc:
    fun HACCEL_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    # :nodoc:
    fun HACCEL_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    # :nodoc:
    fun HACCEL_UserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : Void

    # :nodoc:
    fun HGLOBAL_UserSize(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun HGLOBAL_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    # :nodoc:
    fun HGLOBAL_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    # :nodoc:
    fun HGLOBAL_UserFree(param0 : UInt32*, param1 : LibC::IntPtrT*) : Void

    # :nodoc:
    fun HMENU_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt32

    # :nodoc:
    fun HMENU_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    # :nodoc:
    fun HMENU_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    # :nodoc:
    fun HMENU_UserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HMENU*) : Void

    # :nodoc:
    fun HACCEL_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt32

    # :nodoc:
    fun HACCEL_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    # :nodoc:
    fun HACCEL_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    # :nodoc:
    fun HACCEL_UserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : Void

    # :nodoc:
    fun HGLOBAL_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32

    # :nodoc:
    fun HGLOBAL_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    # :nodoc:
    fun HGLOBAL_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    # :nodoc:
    fun HGLOBAL_UserFree64(param0 : UInt32*, param1 : LibC::IntPtrT*) : Void

    # :nodoc:
    fun HMENU_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt32

    # :nodoc:
    fun HMENU_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    # :nodoc:
    fun HMENU_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    # :nodoc:
    fun HMENU_UserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HMENU*) : Void

    # :nodoc:
    fun HPALETTE_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt32

    # :nodoc:
    fun HPALETTE_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    # :nodoc:
    fun HPALETTE_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    # :nodoc:
    fun HPALETTE_UserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HPALETTE*) : Void

    # :nodoc:
    fun HPALETTE_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt32

    # :nodoc:
    fun HPALETTE_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    # :nodoc:
    fun HPALETTE_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    # :nodoc:
    fun HPALETTE_UserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HPALETTE*) : Void

  end
end