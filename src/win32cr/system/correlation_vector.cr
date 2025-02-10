require "./../foundation.cr"

module Win32cr::System::CorrelationVector
  extend self
  RTL_CORRELATION_VECTOR_STRING_LENGTH = 129_u32
  RTL_CORRELATION_VECTOR_V1_PREFIX_LENGTH = 16_u32
  RTL_CORRELATION_VECTOR_V1_LENGTH = 64_u32
  RTL_CORRELATION_VECTOR_V2_PREFIX_LENGTH = 22_u32
  RTL_CORRELATION_VECTOR_V2_LENGTH = 128_u32


  @[Extern]
  struct CORRELATION_VECTOR
    property version : Win32cr::Foundation::CHAR
    property vector : Win32cr::Foundation::CHAR[129]
    def initialize(@version : Win32cr::Foundation::CHAR, @vector : Win32cr::Foundation::CHAR[129])
    end
  end

  def rtlInitializeCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*, version : Int32, guid : LibC::GUID*) : UInt32
    {% if !flag?(:docs) %}
    C.RtlInitializeCorrelationVector(correlation_vector, version, guid)
    {% end %}
  end

  def rtlIncrementCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32
    {% if !flag?(:docs) %}
    C.RtlIncrementCorrelationVector(correlation_vector)
    {% end %}
  end

  def rtlExtendCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32
    {% if !flag?(:docs) %}
    C.RtlExtendCorrelationVector(correlation_vector)
    {% end %}
  end

  def rtlValidateCorrelationVector(vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32
    {% if !flag?(:docs) %}
    C.RtlValidateCorrelationVector(vector)
    {% end %}
  end

  @[Link("ntdll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun RtlInitializeCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*, version : Int32, guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun RtlIncrementCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32

    # :nodoc:
    fun RtlExtendCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32

    # :nodoc:
    fun RtlValidateCorrelationVector(vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32

  end
  {% end %}
end