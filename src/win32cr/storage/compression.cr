require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:cabinet.dll")]
{% else %}
@[Link("cabinet")]
{% end %}
lib LibWin32
  alias COMPRESSOR_HANDLE = LibC::IntPtrT

  COMPRESS_ALGORITHM_INVALID = 0_u32
  COMPRESS_ALGORITHM_NULL = 1_u32
  COMPRESS_ALGORITHM_MAX = 6_u32
  COMPRESS_RAW = 536870912_u32

  alias PFN_COMPRESS_ALLOCATE = Proc(Void*, LibC::UINT_PTR, Void*)
  alias PFN_COMPRESS_FREE = Proc(Void*, Void*, Void)


  enum COMPRESS_ALGORITHM : UInt32
    COMPRESS_ALGORITHM_MSZIP = 2
    COMPRESS_ALGORITHM_XPRESS = 3
    COMPRESS_ALGORITHM_XPRESS_HUFF = 4
    COMPRESS_ALGORITHM_LZMS = 5
  end

  enum COMPRESS_INFORMATION_CLASS : Int32
    COMPRESS_INFORMATION_CLASS_INVALID = 0
    COMPRESS_INFORMATION_CLASS_BLOCK_SIZE = 1
    COMPRESS_INFORMATION_CLASS_LEVEL = 2
  end

  struct COMPRESS_ALLOCATION_ROUTINES
    allocate : PFN_COMPRESS_ALLOCATE
    free : PFN_COMPRESS_FREE
    user_context : Void*
  end


  # Params # algorithm : COMPRESS_ALGORITHM [In],allocationroutines : COMPRESS_ALLOCATION_ROUTINES* [In],compressorhandle : LibC::IntPtrT* [In]
  fun CreateCompressor(algorithm : COMPRESS_ALGORITHM, allocationroutines : COMPRESS_ALLOCATION_ROUTINES*, compressorhandle : LibC::IntPtrT*) : LibC::BOOL

  # Params # compressorhandle : COMPRESSOR_HANDLE [In],compressinformationclass : COMPRESS_INFORMATION_CLASS [In],compressinformation : Void* [In],compressinformationsize : LibC::UINT_PTR [In]
  fun SetCompressorInformation(compressorhandle : COMPRESSOR_HANDLE, compressinformationclass : COMPRESS_INFORMATION_CLASS, compressinformation : Void*, compressinformationsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # compressorhandle : COMPRESSOR_HANDLE [In],compressinformationclass : COMPRESS_INFORMATION_CLASS [In],compressinformation : Void* [In],compressinformationsize : LibC::UINT_PTR [In]
  fun QueryCompressorInformation(compressorhandle : COMPRESSOR_HANDLE, compressinformationclass : COMPRESS_INFORMATION_CLASS, compressinformation : Void*, compressinformationsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # compressorhandle : COMPRESSOR_HANDLE [In],uncompresseddata : Void* [In],uncompresseddatasize : LibC::UINT_PTR [In],compressedbuffer : Void* [In],compressedbuffersize : LibC::UINT_PTR [In],compresseddatasize : LibC::UINT_PTR* [In]
  fun Compress(compressorhandle : COMPRESSOR_HANDLE, uncompresseddata : Void*, uncompresseddatasize : LibC::UINT_PTR, compressedbuffer : Void*, compressedbuffersize : LibC::UINT_PTR, compresseddatasize : LibC::UINT_PTR*) : LibC::BOOL

  # Params # compressorhandle : COMPRESSOR_HANDLE [In]
  fun ResetCompressor(compressorhandle : COMPRESSOR_HANDLE) : LibC::BOOL

  # Params # compressorhandle : COMPRESSOR_HANDLE [In]
  fun CloseCompressor(compressorhandle : COMPRESSOR_HANDLE) : LibC::BOOL

  # Params # algorithm : COMPRESS_ALGORITHM [In],allocationroutines : COMPRESS_ALLOCATION_ROUTINES* [In],decompressorhandle : LibC::IntPtrT* [In]
  fun CreateDecompressor(algorithm : COMPRESS_ALGORITHM, allocationroutines : COMPRESS_ALLOCATION_ROUTINES*, decompressorhandle : LibC::IntPtrT*) : LibC::BOOL

  # Params # decompressorhandle : LibC::IntPtrT [In],compressinformationclass : COMPRESS_INFORMATION_CLASS [In],compressinformation : Void* [In],compressinformationsize : LibC::UINT_PTR [In]
  fun SetDecompressorInformation(decompressorhandle : LibC::IntPtrT, compressinformationclass : COMPRESS_INFORMATION_CLASS, compressinformation : Void*, compressinformationsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # decompressorhandle : LibC::IntPtrT [In],compressinformationclass : COMPRESS_INFORMATION_CLASS [In],compressinformation : Void* [In],compressinformationsize : LibC::UINT_PTR [In]
  fun QueryDecompressorInformation(decompressorhandle : LibC::IntPtrT, compressinformationclass : COMPRESS_INFORMATION_CLASS, compressinformation : Void*, compressinformationsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # decompressorhandle : LibC::IntPtrT [In],compresseddata : Void* [In],compresseddatasize : LibC::UINT_PTR [In],uncompressedbuffer : Void* [In],uncompressedbuffersize : LibC::UINT_PTR [In],uncompresseddatasize : LibC::UINT_PTR* [In]
  fun Decompress(decompressorhandle : LibC::IntPtrT, compresseddata : Void*, compresseddatasize : LibC::UINT_PTR, uncompressedbuffer : Void*, uncompressedbuffersize : LibC::UINT_PTR, uncompresseddatasize : LibC::UINT_PTR*) : LibC::BOOL

  # Params # decompressorhandle : LibC::IntPtrT [In]
  fun ResetDecompressor(decompressorhandle : LibC::IntPtrT) : LibC::BOOL

  # Params # decompressorhandle : LibC::IntPtrT [In]
  fun CloseDecompressor(decompressorhandle : LibC::IntPtrT) : LibC::BOOL
end
