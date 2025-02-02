require "./../foundation.cr"

module Win32cr::Storage::Compression
  extend self
  alias COMPRESSOR_HANDLE = LibC::IntPtrT
  alias PFN_COMPRESS_ALLOCATE = Proc(Void*, LibC::UIntPtrT, Void*)

  alias PFN_COMPRESS_FREE = Proc(Void*, Void*, Void)

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
  struct COMPRESS_ALLOCATION_ROUTINES
    property allocate : Win32cr::Storage::Compression::PFN_COMPRESS_ALLOCATE
    property free : Win32cr::Storage::Compression::PFN_COMPRESS_FREE
    property user_context : Void*
    def initialize(@allocate : Win32cr::Storage::Compression::PFN_COMPRESS_ALLOCATE, @free : Win32cr::Storage::Compression::PFN_COMPRESS_FREE, @user_context : Void*)
    end
  end

  def createCompressor(algorithm : Win32cr::Storage::Compression::COMPRESS_ALGORITHM, allocation_routines : Win32cr::Storage::Compression::COMPRESS_ALLOCATION_ROUTINES*, compressor_handle : LibC::IntPtrT*) : Win32cr::Foundation::BOOL
    C.CreateCompressor(algorithm, allocation_routines, compressor_handle)
  end

  def setCompressorInformation(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.SetCompressorInformation(compressor_handle, compress_information_class, compress_information, compress_information_size)
  end

  def queryCompressorInformation(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.QueryCompressorInformation(compressor_handle, compress_information_class, compress_information, compress_information_size)
  end

  def compress(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, uncompressed_data : Void*, uncompressed_data_size : LibC::UIntPtrT, compressed_buffer : Void*, compressed_buffer_size : LibC::UIntPtrT, compressed_data_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.Compress(compressor_handle, uncompressed_data, uncompressed_data_size, compressed_buffer, compressed_buffer_size, compressed_data_size)
  end

  def resetCompressor(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE) : Win32cr::Foundation::BOOL
    C.ResetCompressor(compressor_handle)
  end

  def closeCompressor(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE) : Win32cr::Foundation::BOOL
    C.CloseCompressor(compressor_handle)
  end

  def createDecompressor(algorithm : Win32cr::Storage::Compression::COMPRESS_ALGORITHM, allocation_routines : Win32cr::Storage::Compression::COMPRESS_ALLOCATION_ROUTINES*, decompressor_handle : LibC::IntPtrT*) : Win32cr::Foundation::BOOL
    C.CreateDecompressor(algorithm, allocation_routines, decompressor_handle)
  end

  def setDecompressorInformation(decompressor_handle : LibC::IntPtrT, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.SetDecompressorInformation(decompressor_handle, compress_information_class, compress_information, compress_information_size)
  end

  def queryDecompressorInformation(decompressor_handle : LibC::IntPtrT, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.QueryDecompressorInformation(decompressor_handle, compress_information_class, compress_information, compress_information_size)
  end

  def decompress(decompressor_handle : LibC::IntPtrT, compressed_data : Void*, compressed_data_size : LibC::UIntPtrT, uncompressed_buffer : Void*, uncompressed_buffer_size : LibC::UIntPtrT, uncompressed_data_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.Decompress(decompressor_handle, compressed_data, compressed_data_size, uncompressed_buffer, uncompressed_buffer_size, uncompressed_data_size)
  end

  def resetDecompressor(decompressor_handle : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.ResetDecompressor(decompressor_handle)
  end

  def closeDecompressor(decompressor_handle : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.CloseDecompressor(decompressor_handle)
  end

  @[Link("cabinet")]
  lib C
    # :nodoc:
    fun CreateCompressor(algorithm : Win32cr::Storage::Compression::COMPRESS_ALGORITHM, allocation_routines : Win32cr::Storage::Compression::COMPRESS_ALLOCATION_ROUTINES*, compressor_handle : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCompressorInformation(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryCompressorInformation(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun Compress(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE, uncompressed_data : Void*, uncompressed_data_size : LibC::UIntPtrT, compressed_buffer : Void*, compressed_buffer_size : LibC::UIntPtrT, compressed_data_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ResetCompressor(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CloseCompressor(compressor_handle : Win32cr::Storage::Compression::COMPRESSOR_HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateDecompressor(algorithm : Win32cr::Storage::Compression::COMPRESS_ALGORITHM, allocation_routines : Win32cr::Storage::Compression::COMPRESS_ALLOCATION_ROUTINES*, decompressor_handle : LibC::IntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDecompressorInformation(decompressor_handle : LibC::IntPtrT, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryDecompressorInformation(decompressor_handle : LibC::IntPtrT, compress_information_class : Win32cr::Storage::Compression::COMPRESS_INFORMATION_CLASS, compress_information : Void*, compress_information_size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun Decompress(decompressor_handle : LibC::IntPtrT, compressed_data : Void*, compressed_data_size : LibC::UIntPtrT, uncompressed_buffer : Void*, uncompressed_buffer_size : LibC::UIntPtrT, uncompressed_data_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ResetDecompressor(decompressor_handle : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CloseDecompressor(decompressor_handle : LibC::IntPtrT) : Win32cr::Foundation::BOOL

  end
end