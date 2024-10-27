require "./../foundation.cr"

module Win32cr::System::CorrelationVector
  RTL_CORRELATION_VECTOR_STRING_LENGTH = 129_u32
  RTL_CORRELATION_VECTOR_V1_PREFIX_LENGTH = 16_u32
  RTL_CORRELATION_VECTOR_V1_LENGTH = 64_u32
  RTL_CORRELATION_VECTOR_V2_PREFIX_LENGTH = 22_u32
  RTL_CORRELATION_VECTOR_V2_LENGTH = 128_u32


  @[Extern]
  record CORRELATION_VECTOR,
    version : Win32cr::Foundation::CHAR,
    vector : Win32cr::Foundation::CHAR[129]

  @[Link("ntdll")]
  lib C
    fun RtlInitializeCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*, version : Int32, guid : LibC::GUID*) : UInt32

    fun RtlIncrementCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32

    fun RtlExtendCorrelationVector(correlation_vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32

    fun RtlValidateCorrelationVector(vector : Win32cr::System::CorrelationVector::CORRELATION_VECTOR*) : UInt32

  end
end