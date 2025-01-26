require "./../../system/com.cr"
require "./../../foundation.cr"
require "./../direct2_d.cr"
require "./../imaging.cr"

module Win32cr::Graphics::Imaging::D2D


  @[Extern]
  record IWICImageEncoderVtbl,
    query_interface : Proc(IWICImageEncoder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICImageEncoder*, UInt32),
    release : Proc(IWICImageEncoder*, UInt32),
    write_frame : Proc(IWICImageEncoder*, Void*, Void*, Win32cr::Graphics::Imaging::WICImageParameters*, Win32cr::Foundation::HRESULT),
    write_frame_thumbnail : Proc(IWICImageEncoder*, Void*, Void*, Win32cr::Graphics::Imaging::WICImageParameters*, Win32cr::Foundation::HRESULT),
    write_thumbnail : Proc(IWICImageEncoder*, Void*, Void*, Win32cr::Graphics::Imaging::WICImageParameters*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICImageEncoder, lpVtbl : IWICImageEncoderVtbl* do
    GUID = LibC::GUID.new(0x4c75bf8_u32, 0x3ce1_u16, 0x473b_u16, StaticArray[0xac_u8, 0xc5_u8, 0x3c_u8, 0xc4_u8, 0xf5_u8, 0xe9_u8, 0x49_u8, 0x99_u8])
    def query_interface(this : IWICImageEncoder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICImageEncoder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICImageEncoder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def write_frame(this : IWICImageEncoder*, pImage : Void*, pFrameEncode : Void*, pImageParameters : Win32cr::Graphics::Imaging::WICImageParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_frame.call(this, pImage, pFrameEncode, pImageParameters)
    end
    def write_frame_thumbnail(this : IWICImageEncoder*, pImage : Void*, pFrameEncode : Void*, pImageParameters : Win32cr::Graphics::Imaging::WICImageParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_frame_thumbnail.call(this, pImage, pFrameEncode, pImageParameters)
    end
    def write_thumbnail(this : IWICImageEncoder*, pImage : Void*, pEncoder : Void*, pImageParameters : Win32cr::Graphics::Imaging::WICImageParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_thumbnail.call(this, pImage, pEncoder, pImageParameters)
    end

  end

  @[Extern]
  record IWICImagingFactory2Vtbl,
    query_interface : Proc(IWICImagingFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWICImagingFactory2*, UInt32),
    release : Proc(IWICImagingFactory2*, UInt32),
    create_decoder_from_filename : Proc(IWICImagingFactory2*, Win32cr::Foundation::PWSTR, LibC::GUID*, UInt32, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_decoder_from_stream : Proc(IWICImagingFactory2*, Void*, LibC::GUID*, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_decoder_from_file_handle : Proc(IWICImagingFactory2*, LibC::UIntPtrT, LibC::GUID*, Win32cr::Graphics::Imaging::WICDecodeOptions, Void**, Win32cr::Foundation::HRESULT),
    create_component_info : Proc(IWICImagingFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_decoder : Proc(IWICImagingFactory2*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_encoder : Proc(IWICImagingFactory2*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_palette : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_format_converter : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_scaler : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_clipper : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_flip_rotator : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_stream : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_color_context : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_color_transformer : Proc(IWICImagingFactory2*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap : Proc(IWICImagingFactory2*, UInt32, UInt32, LibC::GUID*, Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_source : Proc(IWICImagingFactory2*, Void*, Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_source_rect : Proc(IWICImagingFactory2*, Void*, UInt32, UInt32, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_memory : Proc(IWICImagingFactory2*, UInt32, UInt32, LibC::GUID*, UInt32, UInt32, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_hbitmap : Proc(IWICImagingFactory2*, Win32cr::Graphics::Gdi::HBITMAP, Win32cr::Graphics::Gdi::HPALETTE, Win32cr::Graphics::Imaging::WICBitmapAlphaChannelOption, Void**, Win32cr::Foundation::HRESULT),
    create_bitmap_from_hicon : Proc(IWICImagingFactory2*, Win32cr::UI::WindowsAndMessaging::HICON, Void**, Win32cr::Foundation::HRESULT),
    create_component_enumerator : Proc(IWICImagingFactory2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_fast_metadata_encoder_from_decoder : Proc(IWICImagingFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_fast_metadata_encoder_from_frame_decode : Proc(IWICImagingFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer : Proc(IWICImagingFactory2*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_query_writer_from_reader : Proc(IWICImagingFactory2*, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    create_image_encoder : Proc(IWICImagingFactory2*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWICImagingFactory2, lpVtbl : IWICImagingFactory2Vtbl* do
    GUID = LibC::GUID.new(0x7b816b45_u32, 0x1996_u16, 0x4476_u16, StaticArray[0xb1_u8, 0x32_u8, 0xde_u8, 0x9e_u8, 0x24_u8, 0x7c_u8, 0x8a_u8, 0xf0_u8])
    def query_interface(this : IWICImagingFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWICImagingFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWICImagingFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_decoder_from_filename(this : IWICImagingFactory2*, wzFilename : Win32cr::Foundation::PWSTR, pguidVendor : LibC::GUID*, dwDesiredAccess : UInt32, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_filename.call(this, wzFilename, pguidVendor, dwDesiredAccess, metadataOptions, ppIDecoder)
    end
    def create_decoder_from_stream(this : IWICImagingFactory2*, pIStream : Void*, pguidVendor : LibC::GUID*, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_stream.call(this, pIStream, pguidVendor, metadataOptions, ppIDecoder)
    end
    def create_decoder_from_file_handle(this : IWICImagingFactory2*, hFile : LibC::UIntPtrT, pguidVendor : LibC::GUID*, metadataOptions : Win32cr::Graphics::Imaging::WICDecodeOptions, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder_from_file_handle.call(this, hFile, pguidVendor, metadataOptions, ppIDecoder)
    end
    def create_component_info(this : IWICImagingFactory2*, clsidComponent : LibC::GUID*, ppIInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component_info.call(this, clsidComponent, ppIInfo)
    end
    def create_decoder(this : IWICImagingFactory2*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIDecoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decoder.call(this, guidContainerFormat, pguidVendor, ppIDecoder)
    end
    def create_encoder(this : IWICImagingFactory2*, guidContainerFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_encoder.call(this, guidContainerFormat, pguidVendor, ppIEncoder)
    end
    def create_palette(this : IWICImagingFactory2*, ppIPalette : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_palette.call(this, ppIPalette)
    end
    def create_format_converter(this : IWICImagingFactory2*, ppIFormatConverter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_format_converter.call(this, ppIFormatConverter)
    end
    def create_bitmap_scaler(this : IWICImagingFactory2*, ppIBitmapScaler : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_scaler.call(this, ppIBitmapScaler)
    end
    def create_bitmap_clipper(this : IWICImagingFactory2*, ppIBitmapClipper : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_clipper.call(this, ppIBitmapClipper)
    end
    def create_bitmap_flip_rotator(this : IWICImagingFactory2*, ppIBitmapFlipRotator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_flip_rotator.call(this, ppIBitmapFlipRotator)
    end
    def create_stream(this : IWICImagingFactory2*, ppIWICStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stream.call(this, ppIWICStream)
    end
    def create_color_context(this : IWICImagingFactory2*, ppIWICColorContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_context.call(this, ppIWICColorContext)
    end
    def create_color_transformer(this : IWICImagingFactory2*, ppIWICColorTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_transformer.call(this, ppIWICColorTransform)
    end
    def create_bitmap(this : IWICImagingFactory2*, uiWidth : UInt32, uiHeight : UInt32, pixelFormat : LibC::GUID*, option : Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap.call(this, uiWidth, uiHeight, pixelFormat, option, ppIBitmap)
    end
    def create_bitmap_from_source(this : IWICImagingFactory2*, pIBitmapSource : Void*, option : Win32cr::Graphics::Imaging::WICBitmapCreateCacheOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_source.call(this, pIBitmapSource, option, ppIBitmap)
    end
    def create_bitmap_from_source_rect(this : IWICImagingFactory2*, pIBitmapSource : Void*, x : UInt32, y : UInt32, width : UInt32, height : UInt32, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_source_rect.call(this, pIBitmapSource, x, y, width, height, ppIBitmap)
    end
    def create_bitmap_from_memory(this : IWICImagingFactory2*, uiWidth : UInt32, uiHeight : UInt32, pixelFormat : LibC::GUID*, cbStride : UInt32, cbBufferSize : UInt32, pbBuffer : UInt8*, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_memory.call(this, uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap)
    end
    def create_bitmap_from_hbitmap(this : IWICImagingFactory2*, hBitmap : Win32cr::Graphics::Gdi::HBITMAP, hPalette : Win32cr::Graphics::Gdi::HPALETTE, options : Win32cr::Graphics::Imaging::WICBitmapAlphaChannelOption, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_hbitmap.call(this, hBitmap, hPalette, options, ppIBitmap)
    end
    def create_bitmap_from_hicon(this : IWICImagingFactory2*, hIcon : Win32cr::UI::WindowsAndMessaging::HICON, ppIBitmap : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_bitmap_from_hicon.call(this, hIcon, ppIBitmap)
    end
    def create_component_enumerator(this : IWICImagingFactory2*, componentTypes : UInt32, options : UInt32, ppIEnumUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_component_enumerator.call(this, componentTypes, options, ppIEnumUnknown)
    end
    def create_fast_metadata_encoder_from_decoder(this : IWICImagingFactory2*, pIDecoder : Void*, ppIFastEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_fast_metadata_encoder_from_decoder.call(this, pIDecoder, ppIFastEncoder)
    end
    def create_fast_metadata_encoder_from_frame_decode(this : IWICImagingFactory2*, pIFrameDecoder : Void*, ppIFastEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_fast_metadata_encoder_from_frame_decode.call(this, pIFrameDecoder, ppIFastEncoder)
    end
    def create_query_writer(this : IWICImagingFactory2*, guidMetadataFormat : LibC::GUID*, pguidVendor : LibC::GUID*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer.call(this, guidMetadataFormat, pguidVendor, ppIQueryWriter)
    end
    def create_query_writer_from_reader(this : IWICImagingFactory2*, pIQueryReader : Void*, pguidVendor : LibC::GUID*, ppIQueryWriter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_query_writer_from_reader.call(this, pIQueryReader, pguidVendor, ppIQueryWriter)
    end
    def create_image_encoder(this : IWICImagingFactory2*, pD2DDevice : Void*, ppWICImageEncoder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_image_encoder.call(this, pD2DDevice, ppWICImageEncoder)
    end

  end

end