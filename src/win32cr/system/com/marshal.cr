require "../../system/com.cr"
require "../../foundation.cr"
require "../../graphics/gdi.cr"
require "../../ui/windowsandmessaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:oleaut32.dll")]
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
{% else %}
@[Link("oleaut32")]
@[Link("ole32")]
{% end %}
lib LibWin32

  enum STDMSHLFLAGS : Int32
    SMEXF_SERVER = 1
    SMEXF_HANDLER = 2
  end


  struct IMarshalVTbl
    query_interface : Proc(IMarshal*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMarshal*, UInt32)
    release : Proc(IMarshal*, UInt32)
    get_unmarshal_class : Proc(IMarshal*, Guid*, Void*, UInt32, Void*, UInt32, Guid*, HRESULT)
    get_marshal_size_max : Proc(IMarshal*, Guid*, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)
    marshal_interface : Proc(IMarshal*, IStream, Guid*, Void*, UInt32, Void*, UInt32, HRESULT)
    unmarshal_interface : Proc(IMarshal*, IStream, Guid*, Void**, HRESULT)
    release_marshal_data : Proc(IMarshal*, IStream, HRESULT)
    disconnect_object : Proc(IMarshal*, UInt32, HRESULT)
  end

  IMarshal_GUID = "00000003-0000-0000-c000-000000000046"
  IID_IMarshal = LibC::GUID.new(0x3_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMarshal
    lpVtbl : IMarshalVTbl*
  end

  struct IMarshal2VTbl
    query_interface : Proc(IMarshal2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMarshal2*, UInt32)
    release : Proc(IMarshal2*, UInt32)
    get_unmarshal_class : Proc(IMarshal2*, Guid*, Void*, UInt32, Void*, UInt32, Guid*, HRESULT)
    get_marshal_size_max : Proc(IMarshal2*, Guid*, Void*, UInt32, Void*, UInt32, UInt32*, HRESULT)
    marshal_interface : Proc(IMarshal2*, IStream, Guid*, Void*, UInt32, Void*, UInt32, HRESULT)
    unmarshal_interface : Proc(IMarshal2*, IStream, Guid*, Void**, HRESULT)
    release_marshal_data : Proc(IMarshal2*, IStream, HRESULT)
    disconnect_object : Proc(IMarshal2*, UInt32, HRESULT)
  end

  IMarshal2_GUID = "000001cf-0000-0000-c000-000000000046"
  IID_IMarshal2 = LibC::GUID.new(0x1cf_u32, 0x0_u16, 0x0_u16, StaticArray[0xc0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x46_u8])
  struct IMarshal2
    lpVtbl : IMarshal2VTbl*
  end

  struct IMarshalingStreamVTbl
    query_interface : Proc(IMarshalingStream*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMarshalingStream*, UInt32)
    release : Proc(IMarshalingStream*, UInt32)
    read : Proc(IMarshalingStream*, Void*, UInt32, UInt32*, HRESULT)
    write : Proc(IMarshalingStream*, Void*, UInt32, UInt32*, HRESULT)
    seek : Proc(IMarshalingStream*, LARGE_INTEGER, STREAM_SEEK, ULARGE_INTEGER*, HRESULT)
    set_size : Proc(IMarshalingStream*, ULARGE_INTEGER, HRESULT)
    copy_to : Proc(IMarshalingStream*, IStream, ULARGE_INTEGER, ULARGE_INTEGER*, ULARGE_INTEGER*, HRESULT)
    commit : Proc(IMarshalingStream*, UInt32, HRESULT)
    revert : Proc(IMarshalingStream*, HRESULT)
    lock_region : Proc(IMarshalingStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    unlock_region : Proc(IMarshalingStream*, ULARGE_INTEGER, ULARGE_INTEGER, UInt32, HRESULT)
    stat : Proc(IMarshalingStream*, STATSTG*, UInt32, HRESULT)
    clone : Proc(IMarshalingStream*, IStream*, HRESULT)
    get_marshaling_context_attribute : Proc(IMarshalingStream*, CO_MARSHALING_CONTEXT_ATTRIBUTES, LibC::UINT_PTR*, HRESULT)
  end

  IMarshalingStream_GUID = "d8f2f5e6-6102-4863-9f26-389a4676efde"
  IID_IMarshalingStream = LibC::GUID.new(0xd8f2f5e6_u32, 0x6102_u16, 0x4863_u16, StaticArray[0x9f_u8, 0x26_u8, 0x38_u8, 0x9a_u8, 0x46_u8, 0x76_u8, 0xef_u8, 0xde_u8])
  struct IMarshalingStream
    lpVtbl : IMarshalingStreamVTbl*
  end


  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : UInt8** [In]
  fun BSTR_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt8**) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt8** [In]
  fun BSTR_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt8**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt8** [In]
  fun BSTR_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt8**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8** [In]
  fun BSTR_UserFree(param0 : UInt32*, param1 : UInt8**)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HWND_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HWND_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HWND_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HWND_UserFree(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : VARIANT* [In]
  fun VARIANT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : VARIANT*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : VARIANT* [In]
  fun VARIANT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : VARIANT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : VARIANT* [In]
  fun VARIANT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : VARIANT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : VARIANT* [In]
  fun VARIANT_UserFree(param0 : UInt32*, param1 : VARIANT*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : UInt8** [In]
  fun BSTR_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt8**) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt8** [In]
  fun BSTR_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt8**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt8** [In]
  fun BSTR_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt8**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8** [In]
  fun BSTR_UserFree64(param0 : UInt32*, param1 : UInt8**)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HWND_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HWND_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HWND_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HWND_UserFree64(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : VARIANT* [In]
  fun VARIANT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : VARIANT*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : VARIANT* [In]
  fun VARIANT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : VARIANT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : VARIANT* [In]
  fun VARIANT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : VARIANT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : VARIANT* [In]
  fun VARIANT_UserFree64(param0 : UInt32*, param1 : VARIANT*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : UInt16* [In]
  fun CLIPFORMAT_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16* [In]
  fun CLIPFORMAT_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16* [In]
  fun CLIPFORMAT_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt16* [In]
  fun CLIPFORMAT_UserFree(param0 : UInt32*, param1 : UInt16*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HBITMAP* [In]
  fun HBITMAP_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HBITMAP*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HBITMAP* [In]
  fun HBITMAP_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HBITMAP*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HBITMAP* [In]
  fun HBITMAP_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HBITMAP*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HBITMAP* [In]
  fun HBITMAP_UserFree(param0 : UInt32*, param1 : HBITMAP*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HDC* [In]
  fun HDC_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HDC*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HDC* [In]
  fun HDC_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HDC*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HDC* [In]
  fun HDC_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HDC*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HDC* [In]
  fun HDC_UserFree(param0 : UInt32*, param1 : HDC*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HICON_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HICON_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HICON_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HICON_UserFree(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : UInt16*** [In]
  fun SNB_UserSize(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16*** [In]
  fun SNB_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16*** [In]
  fun SNB_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt16*** [In]
  fun SNB_UserFree(param0 : UInt32*, param1 : UInt16***)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : STGMEDIUM* [In]
  fun STGMEDIUM_UserSize(param0 : UInt32*, param1 : UInt32, param2 : STGMEDIUM*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : STGMEDIUM* [In]
  fun STGMEDIUM_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : STGMEDIUM*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : STGMEDIUM* [In]
  fun STGMEDIUM_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : STGMEDIUM*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : STGMEDIUM* [In]
  fun STGMEDIUM_UserFree(param0 : UInt32*, param1 : STGMEDIUM*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : UInt16* [In]
  fun CLIPFORMAT_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16* [In]
  fun CLIPFORMAT_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16* [In]
  fun CLIPFORMAT_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt16* [In]
  fun CLIPFORMAT_UserFree64(param0 : UInt32*, param1 : UInt16*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HBITMAP* [In]
  fun HBITMAP_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HBITMAP*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HBITMAP* [In]
  fun HBITMAP_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HBITMAP*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HBITMAP* [In]
  fun HBITMAP_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HBITMAP*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HBITMAP* [In]
  fun HBITMAP_UserFree64(param0 : UInt32*, param1 : HBITMAP*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HDC* [In]
  fun HDC_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HDC*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HDC* [In]
  fun HDC_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HDC*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HDC* [In]
  fun HDC_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HDC*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HDC* [In]
  fun HDC_UserFree64(param0 : UInt32*, param1 : HDC*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HICON_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HICON_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HICON_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HICON_UserFree64(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : UInt16*** [In]
  fun SNB_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : UInt16***) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16*** [In]
  fun SNB_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : UInt16*** [In]
  fun SNB_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : UInt16***) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt16*** [In]
  fun SNB_UserFree64(param0 : UInt32*, param1 : UInt16***)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : STGMEDIUM* [In]
  fun STGMEDIUM_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : STGMEDIUM*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : STGMEDIUM* [In]
  fun STGMEDIUM_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : STGMEDIUM*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : STGMEDIUM* [In]
  fun STGMEDIUM_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : STGMEDIUM*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : STGMEDIUM* [In]
  fun STGMEDIUM_UserFree64(param0 : UInt32*, param1 : STGMEDIUM*)

  # Params # pulsize : UInt32* [In],riid : Guid* [In],punk : IUnknown [In],dwdestcontext : UInt32 [In],pvdestcontext : Void* [In],mshlflags : UInt32 [In]
  fun CoGetMarshalSizeMax(pulsize : UInt32*, riid : Guid*, punk : IUnknown, dwdestcontext : UInt32, pvdestcontext : Void*, mshlflags : UInt32) : HRESULT

  # Params # pstm : IStream [In],riid : Guid* [In],punk : IUnknown [In],dwdestcontext : UInt32 [In],pvdestcontext : Void* [In],mshlflags : UInt32 [In]
  fun CoMarshalInterface(pstm : IStream, riid : Guid*, punk : IUnknown, dwdestcontext : UInt32, pvdestcontext : Void*, mshlflags : UInt32) : HRESULT

  # Params # pstm : IStream [In],riid : Guid* [In],ppv : Void** [In]
  fun CoUnmarshalInterface(pstm : IStream, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pstm : IStream [In],hresult : HRESULT [In]
  fun CoMarshalHresult(pstm : IStream, hresult : HRESULT) : HRESULT

  # Params # pstm : IStream [In],phresult : HRESULT* [In]
  fun CoUnmarshalHresult(pstm : IStream, phresult : HRESULT*) : HRESULT

  # Params # pstm : IStream [In]
  fun CoReleaseMarshalData(pstm : IStream) : HRESULT

  # Params # riid : Guid* [In],punk : IUnknown [In],dwdestcontext : UInt32 [In],pvdestcontext : Void* [In],mshlflags : UInt32 [In],ppmarshal : IMarshal* [In]
  fun CoGetStandardMarshal(riid : Guid*, punk : IUnknown, dwdestcontext : UInt32, pvdestcontext : Void*, mshlflags : UInt32, ppmarshal : IMarshal*) : HRESULT

  # Params # punkouter : IUnknown [In],smexflags : UInt32 [In],ppunkinner : IUnknown* [In]
  fun CoGetStdMarshalEx(punkouter : IUnknown, smexflags : UInt32, ppunkinner : IUnknown*) : HRESULT

  # Params # riid : Guid* [In],punk : IUnknown [In],ppstm : IStream* [In]
  fun CoMarshalInterThreadInterfaceInStream(riid : Guid*, punk : IUnknown, ppstm : IStream*) : HRESULT

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserSize(param0 : UInt32*, param1 : UInt32, param2 : SAFEARRAY**) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : SAFEARRAY**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : SAFEARRAY**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserFree(param0 : UInt32*, param1 : SAFEARRAY**)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : SAFEARRAY**) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : SAFEARRAY**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : SAFEARRAY**) : UInt8*

  # Params # param0 : UInt32* [In],param1 : SAFEARRAY** [In]
  fun LPSAFEARRAY_UserFree64(param0 : UInt32*, param1 : SAFEARRAY**)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HACCEL_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HACCEL_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HACCEL_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HACCEL_UserFree(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserSize(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserFree(param0 : UInt32*, param1 : LibC::IntPtrT*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HMENU_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HMENU_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HMENU_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HMENU_UserFree(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HACCEL_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HACCEL_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HACCEL_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HACCEL_UserFree64(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : LibC::IntPtrT*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : LibC::IntPtrT*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : LibC::IntPtrT* [In]
  fun HGLOBAL_UserFree64(param0 : UInt32*, param1 : LibC::IntPtrT*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HANDLE* [In]
  fun HMENU_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HANDLE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HMENU_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HANDLE* [In]
  fun HMENU_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HANDLE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HANDLE* [In]
  fun HMENU_UserFree64(param0 : UInt32*, param1 : HANDLE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HPALETTE* [In]
  fun HPALETTE_UserSize(param0 : UInt32*, param1 : UInt32, param2 : HPALETTE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HPALETTE* [In]
  fun HPALETTE_UserMarshal(param0 : UInt32*, param1 : UInt8*, param2 : HPALETTE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HPALETTE* [In]
  fun HPALETTE_UserUnmarshal(param0 : UInt32*, param1 : UInt8*, param2 : HPALETTE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HPALETTE* [In]
  fun HPALETTE_UserFree(param0 : UInt32*, param1 : HPALETTE*)

  # Params # param0 : UInt32* [In],param1 : UInt32 [In],param2 : HPALETTE* [In]
  fun HPALETTE_UserSize64(param0 : UInt32*, param1 : UInt32, param2 : HPALETTE*) : UInt32

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HPALETTE* [In]
  fun HPALETTE_UserMarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HPALETTE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : UInt8* [In],param2 : HPALETTE* [In]
  fun HPALETTE_UserUnmarshal64(param0 : UInt32*, param1 : UInt8*, param2 : HPALETTE*) : UInt8*

  # Params # param0 : UInt32* [In],param1 : HPALETTE* [In]
  fun HPALETTE_UserFree64(param0 : UInt32*, param1 : HPALETTE*)
end