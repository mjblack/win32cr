module Win32cr::System::Memory::NonVolatile


  @[Extern]
  record NV_MEMORY_RANGE,
    base_address : Void*,
    length : LibC::UIntPtrT

  @[Link("ntdll")]
  lib C
    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlGetNonVolatileToken(nv_buffer : Void*, size : LibC::UIntPtrT, nv_token : Void**) : UInt32
  {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlFreeNonVolatileToken(nv_token : Void*) : UInt32
  {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlFlushNonVolatileMemory(nv_token : Void*, nv_buffer : Void*, size : LibC::UIntPtrT, flags : UInt32) : UInt32
  {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlDrainNonVolatileFlush(nv_token : Void*) : UInt32
  {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlWriteNonVolatileMemory(nv_token : Void*, nv_destination : Void*, source : Void*, size : LibC::UIntPtrT, flags : UInt32) : UInt32
  {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlFillNonVolatileMemory(nv_token : Void*, nv_destination : Void*, size : LibC::UIntPtrT, value : UInt8, flags : UInt32) : UInt32
  {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    fun RtlFlushNonVolatileMemoryRanges(nv_token : Void*, nv_ranges : Win32cr::System::Memory::NonVolatile::NV_MEMORY_RANGE*, num_ranges : LibC::UIntPtrT, flags : UInt32) : UInt32
  {% end %}

  end
end