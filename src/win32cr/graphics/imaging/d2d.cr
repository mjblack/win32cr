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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  IWICImageEncoder_GUID = LibC::GUID.new("04c75bf8-3ce1-473b-acc5-3cc4f5e94999")
  CLSID_IWICImageEncoder = "04c75bf8-3ce1-473b-acc5-3cc4f5e94999"
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

  IWICImagingFactory2_GUID = LibC::GUID.new("7b816b45-1996-4476-b132-de9e247c8af0")
  CLSID_IWICImagingFactory2 = "7b816b45-1996-4476-b132-de9e247c8af0"
  struct IWICImagingFactory2
    lpVtbl : IWICImagingFactory2VTbl*
  end

end
