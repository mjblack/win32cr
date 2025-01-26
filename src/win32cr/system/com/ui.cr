require "./../com.cr"
require "./../../foundation.cr"
require "./structured_storage.cr"
require "./../../graphics/gdi.cr"
require "./../../ui/windows_and_messaging.cr"

module Win32cr::System::Com::UI


  @[Extern]
  record IThumbnailExtractorVtbl,
    query_interface : Proc(IThumbnailExtractor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IThumbnailExtractor*, UInt32),
    release : Proc(IThumbnailExtractor*, UInt32),
    extract_thumbnail : Proc(IThumbnailExtractor*, Void*, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Foundation::HRESULT),
    on_file_updated : Proc(IThumbnailExtractor*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IThumbnailExtractor, lpVtbl : IThumbnailExtractorVtbl* do
    GUID = LibC::GUID.new(0x969dc708_u32, 0x5c76_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0x86_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x4_u8, 0xb0_u8, 0x57_u8])
    def query_interface(this : IThumbnailExtractor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IThumbnailExtractor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IThumbnailExtractor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def extract_thumbnail(this : IThumbnailExtractor*, pStg : Void*, ulLength : UInt32, ulHeight : UInt32, pulOutputLength : UInt32*, pulOutputHeight : UInt32*, phOutputBitmap : Win32cr::Graphics::Gdi::HBITMAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.extract_thumbnail.call(this, pStg, ulLength, ulHeight, pulOutputLength, pulOutputHeight, phOutputBitmap)
    end
    def on_file_updated(this : IThumbnailExtractor*, pStg : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_file_updated.call(this, pStg)
    end

  end

  @[Extern]
  record IDummyHICONIncluderVtbl,
    query_interface : Proc(IDummyHICONIncluder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDummyHICONIncluder*, UInt32),
    release : Proc(IDummyHICONIncluder*, UInt32),
    dummy : Proc(IDummyHICONIncluder*, Win32cr::UI::WindowsAndMessaging::HICON, Win32cr::Graphics::Gdi::HDC, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDummyHICONIncluder, lpVtbl : IDummyHICONIncluderVtbl* do
    GUID = LibC::GUID.new(0x947990de_u32, 0xcc28_u16, 0x11d2_u16, StaticArray[0xa0_u8, 0xf7_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x85_u8, 0x8f_u8, 0xb1_u8])
    def query_interface(this : IDummyHICONIncluder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDummyHICONIncluder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDummyHICONIncluder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def dummy(this : IDummyHICONIncluder*, h1 : Win32cr::UI::WindowsAndMessaging::HICON, h2 : Win32cr::Graphics::Gdi::HDC) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dummy.call(this, h1, h2)
    end

  end

end