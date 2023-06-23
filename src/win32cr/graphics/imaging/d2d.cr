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
    query_interface : Proc(IWICImageEncoder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICImageEncoder*, UInt32)
    release : Proc(IWICImageEncoder*, UInt32)
    write_frame : Proc(IWICImageEncoder*, ID2D1Image, IWICBitmapFrameEncode, WICImageParameters*, HRESULT)
    write_frame_thumbnail : Proc(IWICImageEncoder*, ID2D1Image, IWICBitmapFrameEncode, WICImageParameters*, HRESULT)
    write_thumbnail : Proc(IWICImageEncoder*, ID2D1Image, IWICBitmapEncoder, WICImageParameters*, HRESULT)
  end

  IWICImageEncoder_GUID = "04c75bf8-3ce1-473b-acc5-3cc4f5e94999"
  IID_IWICImageEncoder = LibC::GUID.new(0x4c75bf8_u32, 0x3ce1_u16, 0x473b_u16, StaticArray[0xac_u8, 0xc5_u8, 0x3c_u8, 0xc4_u8, 0xf5_u8, 0xe9_u8, 0x49_u8, 0x99_u8])
  struct IWICImageEncoder
    lpVtbl : IWICImageEncoderVTbl*
  end

  struct IWICImagingFactory2VTbl
    query_interface : Proc(IWICImagingFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWICImagingFactory2*, UInt32)
    release : Proc(IWICImagingFactory2*, UInt32)
    create_decoder_from_filename : Proc(IWICImagingFactory2*, LibC::LPWSTR, Guid*, UInt32, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_decoder_from_stream : Proc(IWICImagingFactory2*, IStream, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_decoder_from_file_handle : Proc(IWICImagingFactory2*, LibC::UINT_PTR, Guid*, WICDecodeOptions, IWICBitmapDecoder*, HRESULT)
    create_component_info : Proc(IWICImagingFactory2*, Guid*, IWICComponentInfo*, HRESULT)
    create_decoder : Proc(IWICImagingFactory2*, Guid*, Guid*, IWICBitmapDecoder*, HRESULT)
    create_encoder : Proc(IWICImagingFactory2*, Guid*, Guid*, IWICBitmapEncoder*, HRESULT)
    create_palette : Proc(IWICImagingFactory2*, IWICPalette*, HRESULT)
    create_format_converter : Proc(IWICImagingFactory2*, IWICFormatConverter*, HRESULT)
    create_bitmap_scaler : Proc(IWICImagingFactory2*, IWICBitmapScaler*, HRESULT)
    create_bitmap_clipper : Proc(IWICImagingFactory2*, IWICBitmapClipper*, HRESULT)
    create_bitmap_flip_rotator : Proc(IWICImagingFactory2*, IWICBitmapFlipRotator*, HRESULT)
    create_stream : Proc(IWICImagingFactory2*, IWICStream*, HRESULT)
    create_color_context : Proc(IWICImagingFactory2*, IWICColorContext*, HRESULT)
    create_color_transformer : Proc(IWICImagingFactory2*, IWICColorTransform*, HRESULT)
    create_bitmap : Proc(IWICImagingFactory2*, UInt32, UInt32, Guid*, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)
    create_bitmap_from_source : Proc(IWICImagingFactory2*, IWICBitmapSource, WICBitmapCreateCacheOption, IWICBitmap*, HRESULT)
    create_bitmap_from_source_rect : Proc(IWICImagingFactory2*, IWICBitmapSource, UInt32, UInt32, UInt32, UInt32, IWICBitmap*, HRESULT)
    create_bitmap_from_memory : Proc(IWICImagingFactory2*, UInt32, UInt32, Guid*, UInt32, UInt32, UInt8*, IWICBitmap*, HRESULT)
    create_bitmap_from_hbitmap : Proc(IWICImagingFactory2*, HBITMAP, HPALETTE, WICBitmapAlphaChannelOption, IWICBitmap*, HRESULT)
    create_bitmap_from_hicon : Proc(IWICImagingFactory2*, LibC::HANDLE, IWICBitmap*, HRESULT)
    create_component_enumerator : Proc(IWICImagingFactory2*, UInt32, UInt32, IEnumUnknown*, HRESULT)
    create_fast_metadata_encoder_from_decoder : Proc(IWICImagingFactory2*, IWICBitmapDecoder, IWICFastMetadataEncoder*, HRESULT)
    create_fast_metadata_encoder_from_frame_decode : Proc(IWICImagingFactory2*, IWICBitmapFrameDecode, IWICFastMetadataEncoder*, HRESULT)
    create_query_writer : Proc(IWICImagingFactory2*, Guid*, Guid*, IWICMetadataQueryWriter*, HRESULT)
    create_query_writer_from_reader : Proc(IWICImagingFactory2*, IWICMetadataQueryReader, Guid*, IWICMetadataQueryWriter*, HRESULT)
    create_image_encoder : Proc(IWICImagingFactory2*, ID2D1Device, IWICImageEncoder*, HRESULT)
  end

  IWICImagingFactory2_GUID = "7b816b45-1996-4476-b132-de9e247c8af0"
  IID_IWICImagingFactory2 = LibC::GUID.new(0x7b816b45_u32, 0x1996_u16, 0x4476_u16, StaticArray[0xb1_u8, 0x32_u8, 0xde_u8, 0x9e_u8, 0x24_u8, 0x7c_u8, 0x8a_u8, 0xf0_u8])
  struct IWICImagingFactory2
    lpVtbl : IWICImagingFactory2VTbl*
  end

end
struct LibWin32::IWICImageEncoder
  def query_interface(this : IWICImageEncoder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWICImageEncoder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWICImageEncoder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def write_frame(this : IWICImageEncoder*, pimage : ID2D1Image, pframeencode : IWICBitmapFrameEncode, pimageparameters : WICImageParameters*) : HRESULT
    @lpVtbl.value.write_frame.call(this, pimage, pframeencode, pimageparameters)
  end
  def write_frame_thumbnail(this : IWICImageEncoder*, pimage : ID2D1Image, pframeencode : IWICBitmapFrameEncode, pimageparameters : WICImageParameters*) : HRESULT
    @lpVtbl.value.write_frame_thumbnail.call(this, pimage, pframeencode, pimageparameters)
  end
  def write_thumbnail(this : IWICImageEncoder*, pimage : ID2D1Image, pencoder : IWICBitmapEncoder, pimageparameters : WICImageParameters*) : HRESULT
    @lpVtbl.value.write_thumbnail.call(this, pimage, pencoder, pimageparameters)
  end
end
struct LibWin32::IWICImagingFactory2
  def query_interface(this : IWICImagingFactory2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWICImagingFactory2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWICImagingFactory2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_decoder_from_filename(this : IWICImagingFactory2*, wzfilename : LibC::LPWSTR, pguidvendor : Guid*, dwdesiredaccess : UInt32, metadataoptions : WICDecodeOptions, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder_from_filename.call(this, wzfilename, pguidvendor, dwdesiredaccess, metadataoptions, ppidecoder)
  end
  def create_decoder_from_stream(this : IWICImagingFactory2*, pistream : IStream, pguidvendor : Guid*, metadataoptions : WICDecodeOptions, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder_from_stream.call(this, pistream, pguidvendor, metadataoptions, ppidecoder)
  end
  def create_decoder_from_file_handle(this : IWICImagingFactory2*, hfile : LibC::UINT_PTR, pguidvendor : Guid*, metadataoptions : WICDecodeOptions, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder_from_file_handle.call(this, hfile, pguidvendor, metadataoptions, ppidecoder)
  end
  def create_component_info(this : IWICImagingFactory2*, clsidcomponent : Guid*, ppiinfo : IWICComponentInfo*) : HRESULT
    @lpVtbl.value.create_component_info.call(this, clsidcomponent, ppiinfo)
  end
  def create_decoder(this : IWICImagingFactory2*, guidcontainerformat : Guid*, pguidvendor : Guid*, ppidecoder : IWICBitmapDecoder*) : HRESULT
    @lpVtbl.value.create_decoder.call(this, guidcontainerformat, pguidvendor, ppidecoder)
  end
  def create_encoder(this : IWICImagingFactory2*, guidcontainerformat : Guid*, pguidvendor : Guid*, ppiencoder : IWICBitmapEncoder*) : HRESULT
    @lpVtbl.value.create_encoder.call(this, guidcontainerformat, pguidvendor, ppiencoder)
  end
  def create_palette(this : IWICImagingFactory2*, ppipalette : IWICPalette*) : HRESULT
    @lpVtbl.value.create_palette.call(this, ppipalette)
  end
  def create_format_converter(this : IWICImagingFactory2*, ppiformatconverter : IWICFormatConverter*) : HRESULT
    @lpVtbl.value.create_format_converter.call(this, ppiformatconverter)
  end
  def create_bitmap_scaler(this : IWICImagingFactory2*, ppibitmapscaler : IWICBitmapScaler*) : HRESULT
    @lpVtbl.value.create_bitmap_scaler.call(this, ppibitmapscaler)
  end
  def create_bitmap_clipper(this : IWICImagingFactory2*, ppibitmapclipper : IWICBitmapClipper*) : HRESULT
    @lpVtbl.value.create_bitmap_clipper.call(this, ppibitmapclipper)
  end
  def create_bitmap_flip_rotator(this : IWICImagingFactory2*, ppibitmapfliprotator : IWICBitmapFlipRotator*) : HRESULT
    @lpVtbl.value.create_bitmap_flip_rotator.call(this, ppibitmapfliprotator)
  end
  def create_stream(this : IWICImagingFactory2*, ppiwicstream : IWICStream*) : HRESULT
    @lpVtbl.value.create_stream.call(this, ppiwicstream)
  end
  def create_color_context(this : IWICImagingFactory2*, ppiwiccolorcontext : IWICColorContext*) : HRESULT
    @lpVtbl.value.create_color_context.call(this, ppiwiccolorcontext)
  end
  def create_color_transformer(this : IWICImagingFactory2*, ppiwiccolortransform : IWICColorTransform*) : HRESULT
    @lpVtbl.value.create_color_transformer.call(this, ppiwiccolortransform)
  end
  def create_bitmap(this : IWICImagingFactory2*, uiwidth : UInt32, uiheight : UInt32, pixelformat : Guid*, option : WICBitmapCreateCacheOption, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap.call(this, uiwidth, uiheight, pixelformat, option, ppibitmap)
  end
  def create_bitmap_from_source(this : IWICImagingFactory2*, pibitmapsource : IWICBitmapSource, option : WICBitmapCreateCacheOption, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_source.call(this, pibitmapsource, option, ppibitmap)
  end
  def create_bitmap_from_source_rect(this : IWICImagingFactory2*, pibitmapsource : IWICBitmapSource, x : UInt32, y : UInt32, width : UInt32, height : UInt32, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_source_rect.call(this, pibitmapsource, x, y, width, height, ppibitmap)
  end
  def create_bitmap_from_memory(this : IWICImagingFactory2*, uiwidth : UInt32, uiheight : UInt32, pixelformat : Guid*, cbstride : UInt32, cbbuffersize : UInt32, pbbuffer : UInt8*, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_memory.call(this, uiwidth, uiheight, pixelformat, cbstride, cbbuffersize, pbbuffer, ppibitmap)
  end
  def create_bitmap_from_hbitmap(this : IWICImagingFactory2*, hbitmap : HBITMAP, hpalette : HPALETTE, options : WICBitmapAlphaChannelOption, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_hbitmap.call(this, hbitmap, hpalette, options, ppibitmap)
  end
  def create_bitmap_from_hicon(this : IWICImagingFactory2*, hicon : LibC::HANDLE, ppibitmap : IWICBitmap*) : HRESULT
    @lpVtbl.value.create_bitmap_from_hicon.call(this, hicon, ppibitmap)
  end
  def create_component_enumerator(this : IWICImagingFactory2*, componenttypes : UInt32, options : UInt32, ppienumunknown : IEnumUnknown*) : HRESULT
    @lpVtbl.value.create_component_enumerator.call(this, componenttypes, options, ppienumunknown)
  end
  def create_fast_metadata_encoder_from_decoder(this : IWICImagingFactory2*, pidecoder : IWICBitmapDecoder, ppifastencoder : IWICFastMetadataEncoder*) : HRESULT
    @lpVtbl.value.create_fast_metadata_encoder_from_decoder.call(this, pidecoder, ppifastencoder)
  end
  def create_fast_metadata_encoder_from_frame_decode(this : IWICImagingFactory2*, piframedecoder : IWICBitmapFrameDecode, ppifastencoder : IWICFastMetadataEncoder*) : HRESULT
    @lpVtbl.value.create_fast_metadata_encoder_from_frame_decode.call(this, piframedecoder, ppifastencoder)
  end
  def create_query_writer(this : IWICImagingFactory2*, guidmetadataformat : Guid*, pguidvendor : Guid*, ppiquerywriter : IWICMetadataQueryWriter*) : HRESULT
    @lpVtbl.value.create_query_writer.call(this, guidmetadataformat, pguidvendor, ppiquerywriter)
  end
  def create_query_writer_from_reader(this : IWICImagingFactory2*, piqueryreader : IWICMetadataQueryReader, pguidvendor : Guid*, ppiquerywriter : IWICMetadataQueryWriter*) : HRESULT
    @lpVtbl.value.create_query_writer_from_reader.call(this, piqueryreader, pguidvendor, ppiquerywriter)
  end
  def create_image_encoder(this : IWICImagingFactory2*, pd2ddevice : ID2D1Device, ppwicimageencoder : IWICImageEncoder*) : HRESULT
    @lpVtbl.value.create_image_encoder.call(this, pd2ddevice, ppwicimageencoder)
  end
end
