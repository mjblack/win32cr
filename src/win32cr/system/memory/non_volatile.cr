
module Win32cr::System::Memory::NonVolatile
  extend self


  @[Extern]
  struct NV_MEMORY_RANGE
    property base_address : Void*
    property length : LibC::UIntPtrT
    def initialize(@base_address : Void*, @length : LibC::UIntPtrT)
    end
  end

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlGetNonVolatileToken(nv_buffer : Void*, size : LibC::UIntPtrT, nv_token : Void**) : UInt32
    C.RtlGetNonVolatileToken(nv_buffer, size, nv_token)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlFreeNonVolatileToken(nv_token : Void*) : UInt32
    C.RtlFreeNonVolatileToken(nv_token)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlFlushNonVolatileMemory(nv_token : Void*, nv_buffer : Void*, size : LibC::UIntPtrT, flags : UInt32) : UInt32
    C.RtlFlushNonVolatileMemory(nv_token, nv_buffer, size, flags)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlDrainNonVolatileFlush(nv_token : Void*) : UInt32
    C.RtlDrainNonVolatileFlush(nv_token)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlWriteNonVolatileMemory(nv_token : Void*, nv_destination : Void*, source : Void*, size : LibC::UIntPtrT, flags : UInt32) : UInt32
    C.RtlWriteNonVolatileMemory(nv_token, nv_destination, source, size, flags)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlFillNonVolatileMemory(nv_token : Void*, nv_destination : Void*, size : LibC::UIntPtrT, value : UInt8, flags : UInt32) : UInt32
    C.RtlFillNonVolatileMemory(nv_token, nv_destination, size, value, flags)
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def rtlFlushNonVolatileMemoryRanges(nv_token : Void*, nv_ranges : Win32cr::System::Memory::NonVolatile::NV_MEMORY_RANGE*, num_ranges : LibC::UIntPtrT, flags : UInt32) : UInt32
    C.RtlFlushNonVolatileMemoryRanges(nv_token, nv_ranges, num_ranges, flags)
  end
{% end %}

  @[Link("ntdll")]
  lib C
    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlGetNonVolatileToken(nv_buffer : Void*, size : LibC::UIntPtrT, nv_token : Void**) : UInt32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlFreeNonVolatileToken(nv_token : Void*) : UInt32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlFlushNonVolatileMemory(nv_token : Void*, nv_buffer : Void*, size : LibC::UIntPtrT, flags : UInt32) : UInt32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlDrainNonVolatileFlush(nv_token : Void*) : UInt32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlWriteNonVolatileMemory(nv_token : Void*, nv_destination : Void*, source : Void*, size : LibC::UIntPtrT, flags : UInt32) : UInt32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlFillNonVolatileMemory(nv_token : Void*, nv_destination : Void*, size : LibC::UIntPtrT, value : UInt8, flags : UInt32) : UInt32
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun RtlFlushNonVolatileMemoryRanges(nv_token : Void*, nv_ranges : Win32cr::System::Memory::NonVolatile::NV_MEMORY_RANGE*, num_ranges : LibC::UIntPtrT, flags : UInt32) : UInt32
    {% end %}

  end
end