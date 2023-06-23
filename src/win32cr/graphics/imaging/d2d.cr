require "../../system/com.cr"
require "../../foundation.cr"
require "../../graphics/direct2d.cr"
require "../../graphics/imaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  struct IWICImageEncoderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    write_frame : UInt64
    write_frame_thumbnail : UInt64
    write_thumbnail : UInt64
  end

  IWICImageEncoder_GUID = "04c75bf8-3ce1-473b-acc5-3cc4f5e94999"
  IID_IWICImageEncoder = LibC::GUID.new(0x4c75bf8_u32, 0x3ce1_u16, 0x473b_u16, StaticArray[0xac_u8, 0xc5_u8, 0x3c_u8, 0xc4_u8, 0xf5_u8, 0xe9_u8, 0x49_u8, 0x99_u8])
  struct IWICImageEncoder
    lpVtbl : IWICImageEncoderVTbl*
  end

  struct IWICImagingFactory2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_decoder_from_filename : UInt64
    create_decoder_from_stream : UInt64
    create_decoder_from_file_handle : UInt64
    create_component_info : UInt64
    create_decoder : UInt64
    create_encoder : UInt64
    create_palette : UInt64
    create_format_converter : UInt64
    create_bitmap_scaler : UInt64
    create_bitmap_clipper : UInt64
    create_bitmap_flip_rotator : UInt64
    create_stream : UInt64
    create_color_context : UInt64
    create_color_transformer : UInt64
    create_bitmap : UInt64
    create_bitmap_from_source : UInt64
    create_bitmap_from_source_rect : UInt64
    create_bitmap_from_memory : UInt64
    create_bitmap_from_hbitmap : UInt64
    create_bitmap_from_hicon : UInt64
    create_component_enumerator : UInt64
    create_fast_metadata_encoder_from_decoder : UInt64
    create_fast_metadata_encoder_from_frame_decode : UInt64
    create_query_writer : UInt64
    create_query_writer_from_reader : UInt64
    create_image_encoder : UInt64
  end

  IWICImagingFactory2_GUID = "7b816b45-1996-4476-b132-de9e247c8af0"
  IID_IWICImagingFactory2 = LibC::GUID.new(0x7b816b45_u32, 0x1996_u16, 0x4476_u16, StaticArray[0xb1_u8, 0x32_u8, 0xde_u8, 0x9e_u8, 0x24_u8, 0x7c_u8, 0x8a_u8, 0xf0_u8])
  struct IWICImagingFactory2
    lpVtbl : IWICImagingFactory2VTbl*
  end

end
struct LibWin32::IWICImageEncoder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def write_frame(pimage : ID2D1Image, pframeencode : IWICBitmapFrameEncode, pimageparameters : WICImageParameters*) : HRESULT
    @lpVtbl.value.write_frame.unsafe_as(Proc(ID2D1Image, IWICBitmapFrameEncode, WICImageParameters*, HRESULT)).call(pimage, pframeencode, pimageparameters)
  end
  def write_frame_thumbnail(pimage : ID2D1Image, pframeencode : IWICBitmapFrameEncode, pimageparameters : WICImageParameters*) : HRESULT
    @lpVtbl.value.write_frame_thumbnail.unsafe_as(Proc(ID2D1Image, IWICBitmapFrameEncode, WICImageParameters*, HRESULT)).call(pimage, pframeencode, pimageparameters)
  end
  def write_thumbnail(pimage : ID2D1Image, pencoder : IWICBitmapEncoder, pimageparameters : WICImageParameters*) : HRESULT
    @lpVtbl.value.write_thumbnail.unsafe_as(Proc(ID2D1Image, IWICBitmapEncoder, WICImageParameters*, HRESULT)).call(pimage, pencoder, pimageparameters)
  end
end
struct LibWin32::IWICImagingFactory2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_decoder_from_filename(wzfilename : LibC::LPWSTR, pguidvendor : Guid*, dwdesiredaccess : UInt32, metadataoptions : WICDecodeOptions, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder_from_filename.unsafe_as(Proc(LibC::LPWSTR, Guid*, UInt32, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)).call(wzfilename, pguidvendor, dwdesiredaccess, metadataoptions, ppidecoder)
  end
  def create_decoder_from_stream(pistream : IStream, pguidvendor : Guid*, metadataoptions : WICDecodeOptions, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder_from_stream.unsafe_as(Proc(IStream, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)).call(pistream, pguidvendor, metadataoptions, ppidecoder)
  end
  def create_decoder_from_file_handle(hfile : LibC::UINT_PTR, pguidvendor : Guid*, metadataoptions : WICDecodeOptions, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder_from_file_handle.unsafe_as(Proc(LibC::UINT_PTR, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)).call(hfile, pguidvendor, metadataoptions, ppidecoder)
  end
  def create_component_info(clsidcomponent : Guid*, ppiinfo : IWICComponentInfo*) : HRESULT
    @lpVtbl.value.create_component_info.unsafe_as(Proc(Guid*, IWICComponentInfo*, HRESULT)).call(clsidcomponent, ppiinfo)
  end
  def create_decoder(guidcontainerformat : Guid*, pguidvendor : Guid*, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder.unsafe_as(Proc(Guid*, Guid*, IWICBitmapDecoder*, HRESULT)).call(guidcontainerformat, pguidvendor, ppidecoder)
  end
  def create_encoder(guidcontainerformat : Guid*, pguidvendor : Guid*, ppiencoder : IWICBitmapEncoder*) : HRESULT
    @lpVtbl.value.create_encoder.unsafe_as(Proc(Guid*, Guid*, IWICBitmapEncoder*, HRESULT)).call(guidcontainerformat, pguidvendor, ppiencoder)
  end
  def create_palette(ppipalette : IWICPalette*) : HRESULT
    @lpVtbl.value.create_palette.unsafe_as(Proc(IWICPalette*, HRESULT)).call(ppipalette)
  end
  def create_format_converter(ppiformatconverter : IWICFormatConverter*) : HRESULT
    @lpVtbl.value.create_format_converter.unsafe_as(Proc(IWICFormatConverter*, HRESULT)).call(ppiformatconverter)
  end
  def create_bitmap_scaler(ppibitmapscaler : IWICBitmapScaler*) : HRESULT
    @lpVtbl.value.create_bitmap_scaler.unsafe_as(Proc(IWICBitmapScaler*, HRESULT)).call(ppibitmapscaler)
  end
  def create_bitmap_clipper(ppibitmapclipper : IWICBitmapClipper*) : HRESULT
    @lpVtbl.value.create_bitmap_clipper.unsafe_as(Proc(IWICBitmapClipper*, HRESULT)).call(ppibitmapclipper)
  end
  def create_bitmap_flip_rotator(ppibitmapfliprotator : IWICBitmapFlipRotator*) : HRESULT
    @lpVtbl.value.create_bitmap_flip_rotator.unsafe_as(Proc(IWICBitmapFlipRotator*, HRESULT)).call(ppibitmapfliprotator)
  end
  def create_stream(ppiwicstream : IWICStream*) : HRESULT
    @lpVtbl.value.create_stream.unsafe_as(Proc(IWICStream*, HRESULT)).call(ppiwicstream)
  end
  def create_color_context(ppiwiccolorcontext : IWICColorContext*) : HRESULT
    @lpVtbl.value.create_color_context.unsafe_as(Proc(IWICColorContext*, HRESULT)).call(ppiwiccolorcontext)
  end
  def create_color_transformer(ppiwiccolortransform : IWICColorTransform*) : HRESULT
    @lpVtbl.value.create_color_transformer.unsafe_as(Proc(IWICColorTransform*, HRESULT)).call(ppiwiccolortransform)
  end
  def create_bitmap(uiwidth : UInt32, uiheight : UInt32, pixelformat : Guid*, option : WICBitmapCreateCacheOption, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap.unsafe_as(Proc(UInt32, UInt32, Guid*, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)).call(uiwidth, uiheight, pixelformat, option, ppibitmap)
  end
  def create_bitmap_from_source(pibitmapsource : IWICBitmapSource, option : WICBitmapCreateCacheOption, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_source.unsafe_as(Proc(IWICBitmapSource, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)).call(pibitmapsource, option, ppibitmap)
  end
  def create_bitmap_from_source_rect(pibitmapsource : IWICBitmapSource, x : UInt32, y : UInt32, width : UInt32, height : UInt32, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_source_rect.unsafe_as(Proc(IWICBitmapSource, UInt32, UInt32, UInt32, UInt32, IWICBitmap*, HRESULT)).call(pibitmapsource, x, y, width, height, ppibitmap)
  end
  def create_bitmap_from_memory(uiwidth : UInt32, uiheight : UInt32, pixelformat : Guid*, cbstride : UInt32, cbbuffersize : UInt32, pbbuffer : UInt8*, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_memory.unsafe_as(Proc(UInt32, UInt32, Guid*, UInt32, UInt32, UInt8*, IWICBitmap*, HRESULT)).call(uiwidth, uiheight, pixelformat, cbstride, cbbuffersize, pbbuffer, ppibitmap)
  end
  def create_bitmap_from_hbitmap(hbitmap : HBITMAP, hpalette : HPALETTE, options : WICBitmapAlphaChannelOption, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_hbitmap.unsafe_as(Proc(HBITMAP, HPALETTE, WICBitmapAlphaChannelOption, IWICBitmap*, HRESULT)).call(hbitmap, hpalette, options, ppibitmap)
  end
  def create_bitmap_from_hicon(hicon : LibC::HANDLE, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_hicon.unsafe_as(Proc(LibC::HANDLE, IWICBitmap*, HRESULT)).call(hicon, ppibitmap)
  end
  def create_component_enumerator(componenttypes : UInt32, options : UInt32, ppienumunknown : IEnumUnknown*) : HRESULT
    @lpVtbl.value.create_component_enumerator.unsafe_as(Proc(UInt32, UInt32, IEnumUnknown*, HRESULT)).call(componenttypes, options, ppienumunknown)
  end
  def create_fast_metadata_encoder_from_decoder(pidecoder : IWICBitmapDecoder, ppifastencoder : IWICFastMetadataEncoder*) : HRESULT
    @lpVtbl.value.create_fast_metadata_encoder_from_decoder.unsafe_as(Proc(IWICBitmapDecoder, IWICFastMetadataEncoder*, HRESULT)).call(pidecoder, ppifastencoder)
  end
  def create_fast_metadata_encoder_from_frame_decode(piframedecoder : IWICBitmapFrameDecode, ppifastencoder : IWICFastMetadataEncoder*) : HRESULT
    @lpVtbl.value.create_fast_metadata_encoder_from_frame_decode.unsafe_as(Proc(IWICBitmapFrameDecode, IWICFastMetadataEncoder*, HRESULT)).call(piframedecoder, ppifastencoder)
  end
  def create_query_writer(guidmetadataformat : Guid*, pguidvendor : Guid*, ppiquerywriter : IWICMetadataQueryWriter*) : HRESULT
    @lpVtbl.value.create_query_writer.unsafe_as(Proc(Guid*, Guid*, IWICMetadataQueryWriter*, HRESULT)).call(guidmetadataformat, pguidvendor, ppiquerywriter)
  end
  def create_query_writer_from_reader(piqueryreader : IWICMetadataQueryReader, pguidvendor : Guid*, ppiquerywriter : IWICMetadataQueryWriter*) : HRESULT
    @lpVtbl.value.create_query_writer_from_reader.unsafe_as(Proc(IWICMetadataQueryReader, Guid*, IWICMetadataQueryWriter*, HRESULT)).call(piqueryreader, pguidvendor, ppiquerywriter)
  end
  def create_image_encoder(pd2ddevice : ID2D1Device, ppwicimageencoder : IWICImageEncoder*) : HRESULT
    @lpVtbl.value.create_image_encoder.unsafe_as(Proc(ID2D1Device, IWICImageEncoder*, HRESULT)).call(pd2ddevice, ppwicimageencoder)
  end
end
