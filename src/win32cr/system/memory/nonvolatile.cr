
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
  struct NV_MEMORY_RANGE
    base_address : Void*
    length : LibC::UINT_PTR
  end


  # Params # nvbuffer : Void* [In],size : LibC::UINT_PTR [In],nvtoken : Void** [In]
  fun RtlGetNonVolatileToken(nvbuffer : Void*, size : LibC::UINT_PTR, nvtoken : Void**) : UInt32

  # Params # nvtoken : Void* [In]
  fun RtlFreeNonVolatileToken(nvtoken : Void*) : UInt32

  # Params # nvtoken : Void* [In],nvbuffer : Void* [In],size : LibC::UINT_PTR [In],flags : UInt32 [In]
  fun RtlFlushNonVolatileMemory(nvtoken : Void*, nvbuffer : Void*, size : LibC::UINT_PTR, flags : UInt32) : UInt32

  # Params # nvtoken : Void* [In]
  fun RtlDrainNonVolatileFlush(nvtoken : Void*) : UInt32

  # Params # nvtoken : Void* [In],nvdestination : Void* [In],source : Void* [In],size : LibC::UINT_PTR [In],flags : UInt32 [In]
  fun RtlWriteNonVolatileMemory(nvtoken : Void*, nvdestination : Void*, source : Void*, size : LibC::UINT_PTR, flags : UInt32) : UInt32

  # Params # nvtoken : Void* [In],nvdestination : Void* [In],size : LibC::UINT_PTR [In],value : UInt8 [In],flags : UInt32 [In]
  fun RtlFillNonVolatileMemory(nvtoken : Void*, nvdestination : Void*, size : LibC::UINT_PTR, value : UInt8, flags : UInt32) : UInt32

  # Params # nvtoken : Void* [In],nvranges : NV_MEMORY_RANGE* [In],numranges : LibC::UINT_PTR [In],flags : UInt32 [In]
  fun RtlFlushNonVolatileMemoryRanges(nvtoken : Void*, nvranges : NV_MEMORY_RANGE*, numranges : LibC::UINT_PTR, flags : UInt32) : UInt32
end
