require "./../com.cr"
require "./../../foundation.cr"
require "./../../graphics/gdi.cr"
require "./../../ui/windows_and_messaging.cr"

module Win32cr::System::Com::Marshal

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
  #@[Com("00000003-0000-0000-c000-000000000046")]
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
  #@[Com("000001cf-0000-0000-c000-000000000046")]
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
  #@[Com("d8f2f5e6-6102-4863-9f26-389a4676efde")]
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

  @[Link("oleaut32")]
  @[Link("ole32")]
  lib C
    fun BSTR_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::BSTR*) : UInt32

    fun BSTR_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    fun BSTR_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    fun BSTR_UserFree(param0 : UInt32*, param1 : Win32cr::Foundation::BSTR*) : Void

    fun HWND_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::HWND*) : UInt32

    fun HWND_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    fun HWND_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    fun HWND_UserFree(param0 : UInt32*, param1 : Win32cr::Foundation::HWND*) : Void

    fun VARIANT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::VARIANT*) : UInt32

    fun VARIANT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    fun VARIANT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    fun VARIANT_UserFree(param0 : UInt32*, param1 : Win32cr::System::Com::VARIANT*) : Void

    fun BSTR_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::BSTR*) : UInt32

    fun BSTR_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    fun BSTR_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::BSTR*) : UInt8*

    fun BSTR_UserFree64(param0 : UInt32*, param1 : Win32cr::Foundation::BSTR*) : Void

    fun HWND_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Foundation::HWND*) : UInt32

    fun HWND_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    fun HWND_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Foundation::HWND*) : UInt8*

    fun HWND_UserFree64(param0 : UInt32*, param1 : Win32cr::Foundation::HWND*) : Void

    fun VARIANT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::VARIANT*) : UInt32

    fun VARIANT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    fun VARIANT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::VARIANT*) : UInt8*

    fun VARIANT_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::VARIANT*) : Void

    fun CLIPFORMAT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32

    fun CLIPFORMAT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    fun CLIPFORMAT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    fun CLIPFORMAT_UserFree(param0 : UInt32*, param1 : UInt16*) : Void

    fun HBITMAP_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt32

    fun HBITMAP_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    fun HBITMAP_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    fun HBITMAP_UserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HBITMAP*) : Void

    fun HDC_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt32

    fun HDC_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    fun HDC_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    fun HDC_UserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HDC*) : Void

    fun HICON_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt32

    fun HICON_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    fun HICON_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    fun HICON_UserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HICON*) : Void

    fun SNB_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32

    fun SNB_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    fun SNB_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    fun SNB_UserFree(param0 : UInt32*, param1 : UInt16***) : Void

    fun STGMEDIUM_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt32

    fun STGMEDIUM_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    fun STGMEDIUM_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    fun STGMEDIUM_UserFree(param0 : UInt32*, param1 : Win32cr::System::Com::STGMEDIUM*) : Void

    fun CLIPFORMAT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32

    fun CLIPFORMAT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    fun CLIPFORMAT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

    fun CLIPFORMAT_UserFree64(param0 : UInt32*, param1 : UInt16*) : Void

    fun HBITMAP_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt32

    fun HBITMAP_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    fun HBITMAP_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HBITMAP*) : UInt8*

    fun HBITMAP_UserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HBITMAP*) : Void

    fun HDC_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt32

    fun HDC_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    fun HDC_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HDC*) : UInt8*

    fun HDC_UserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HDC*) : Void

    fun HICON_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt32

    fun HICON_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    fun HICON_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HICON*) : UInt8*

    fun HICON_UserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HICON*) : Void

    fun SNB_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32

    fun SNB_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    fun SNB_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

    fun SNB_UserFree64(param0 : UInt32*, param1 : UInt16***) : Void

    fun STGMEDIUM_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt32

    fun STGMEDIUM_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    fun STGMEDIUM_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::STGMEDIUM*) : UInt8*

    fun STGMEDIUM_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::STGMEDIUM*) : Void

    fun CoGetMarshalSizeMax(pulSize : UInt32*, riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT

    fun CoMarshalInterface(pStm : Void*, riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32) : Win32cr::Foundation::HRESULT

    fun CoUnmarshalInterface(pStm : Void*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoMarshalHresult(pstm : Void*, hresult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT

    fun CoUnmarshalHresult(pstm : Void*, phresult : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT

    fun CoReleaseMarshalData(pStm : Void*) : Win32cr::Foundation::HRESULT

    fun CoGetStandardMarshal(riid : LibC::GUID*, pUnk : Void*, dwDestContext : UInt32, pvDestContext : Void*, mshlflags : UInt32, ppMarshal : Void**) : Win32cr::Foundation::HRESULT

    fun CoGetStdMarshalEx(pUnkOuter : Void*, smexflags : UInt32, ppUnkInner : Void**) : Win32cr::Foundation::HRESULT

    fun CoMarshalInterThreadInterfaceInStream(riid : LibC::GUID*, pUnk : Void*, ppStm : Void**) : Win32cr::Foundation::HRESULT

    fun LPSAFEARRAY_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt32

    fun LPSAFEARRAY_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    fun LPSAFEARRAY_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    fun LPSAFEARRAY_UserFree(param0 : UInt32*, param1 : Win32cr::System::Com::SAFEARRAY**) : Void

    fun LPSAFEARRAY_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt32

    fun LPSAFEARRAY_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    fun LPSAFEARRAY_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::System::Com::SAFEARRAY**) : UInt8*

    fun LPSAFEARRAY_UserFree64(param0 : UInt32*, param1 : Win32cr::System::Com::SAFEARRAY**) : Void

    fun HACCEL_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt32

    fun HACCEL_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    fun HACCEL_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    fun HACCEL_UserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : Void

    fun HGLOBAL_UserSize(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32

    fun HGLOBAL_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    fun HGLOBAL_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    fun HGLOBAL_UserFree(param0 : UInt32*, param1 : LibC::IntPtrT*) : Void

    fun HMENU_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt32

    fun HMENU_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    fun HMENU_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    fun HMENU_UserFree(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HMENU*) : Void

    fun HACCEL_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt32

    fun HACCEL_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    fun HACCEL_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : UInt8*

    fun HACCEL_UserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HACCEL*) : Void

    fun HGLOBAL_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32

    fun HGLOBAL_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    fun HGLOBAL_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

    fun HGLOBAL_UserFree64(param0 : UInt32*, param1 : LibC::IntPtrT*) : Void

    fun HMENU_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt32

    fun HMENU_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    fun HMENU_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::UI::WindowsAndMessaging::HMENU*) : UInt8*

    fun HMENU_UserFree64(param0 : UInt32*, param1 : Win32cr::UI::WindowsAndMessaging::HMENU*) : Void

    fun HPALETTE_UserSize(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt32

    fun HPALETTE_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    fun HPALETTE_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    fun HPALETTE_UserFree(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HPALETTE*) : Void

    fun HPALETTE_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt32

    fun HPALETTE_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    fun HPALETTE_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : Win32cr::Graphics::Gdi::HPALETTE*) : UInt8*

    fun HPALETTE_UserFree64(param0 : UInt32*, param1 : Win32cr::Graphics::Gdi::HPALETTE*) : Void

  end
end