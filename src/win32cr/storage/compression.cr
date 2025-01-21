require "./../foundation.cr"

module Win32cr::Storage::Compression
  alias COMPRESSOR_HANDLE = LibC::IntPtrT
  alias PFN_COMPRESS_ALLOCATE = Proc(Void*, LibC::UIntPtrT, Void*)*

  alias PFN_COMPRESS_FREE = Proc(Void*, Void*, Void)*

  COMPRESS_ALGORITHM_INVALID = 0_u32
  COMPRESS_ALGORITHM_NULL = 1_u32
  COMPRESS_ALGORITHM_MAX = 6_u32
  COMPRESS_RAW = 536870912_u32

  enum COMPRESS_ALGORITHM : UInt32
    COMPRESS_ALGORITHM_MSZIP = 2_u32
    COMPRESS_ALGORITHM_XPRESS = 3_u32
    COMPRESS_ALGORITHM_XPRESS_HUFF = 4_u32
    COMPRESS_ALGORITHM_LZMS = 5_u32
  end
  enum COMPRESS_INFORMATION_CLASS
    COMPRESS_INFORMATION_CLASS_INVALID = 0_i32
    COMPRESS_INFORMATION_CLASS_BLOCK_SIZE = 1_i32
    COMPRESS_INFORMATION_CLASS_LEVEL = 2_i32
  end

  @[Extern]
  record COMPRESS_ALLOCATION_ROUTINES,
    allocate : Win32cr::Storage::Compression::PFN_COMPRESS_ALLOCATE,
    free : Win32cr::Storage::Compression::PFN_COMPRESS_FREE,
    user_context : Void*

  @[Link("cabinet")]
  lib C
    fun CreateCompressor(algorithm : Win32cr::Storage::Compression::COMPRESS_ALGORITHM, allocation_routines : Win32cr::Storage::Compression::COMPRESS_ALLOCATION_ROUTINES*, compressor_handle : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    fun SetCompressorInformation(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun QueryCompressorInformation(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun Compress(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, uncompressed_data : Void*, uncompressed_data_size : LibC::UIntPtrT, compressed_buffer : Void*, compressed_buffer_size : LibC::UIntPtrT, compressed_data_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun ResetCompressor(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE) : Win32cr::Foundation::BOOL

    fun CloseCompressor(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE) : Win32cr::Foundation::BOOL

    fun CreateDecompressor(algorithm : Win32cr::Storage::Compression::COMPRESS_ALGORITHM, allocation_routines : Win32cr::Storage::Compression::COMPRESS_ALLOCATION_ROUTINES*, decompressor_handle : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    fun SetDecompressorInformation(decompressor_handle : LibC::IntPtrT, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun QueryDecompressorInformation(decompressor_handle : LibC::IntPtrT, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun Decompress(decompressor_handle : LibC::IntPtrT, compressed_data : Void*, compressed_data_size : LibC::UIntPtrT, uncompressed_buffer : Void*, uncompressed_buffer_size : LibC::UIntPtrT, uncompressed_data_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun ResetDecompressor(decompressor_handle : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun CloseDecompressor(decompressor_handle : LibC::IntPtrT) : Win32cr::Foundation::BOOL

  end
end