require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  RTL_CORRELATION_VECTOR_STRING_LENGTH = 129_u32
  RTL_CORRELATION_VECTOR_V1_PREFIX_LENGTH = 16_u32
  RTL_CORRELATION_VECTOR_V1_LENGTH = 64_u32
  RTL_CORRELATION_VECTOR_V2_PREFIX_LENGTH = 22_u32
  RTL_CORRELATION_VECTOR_V2_LENGTH = 128_u32

  struct CORRELATION_VECTOR
    version : CHAR
    vector : CHAR[129]*
  end


  # Params # correlationvector : CORRELATION_VECTOR* [In],version : Int32 [In],guid : Guid* [In]
  fun RtlInitializeCorrelationVector(correlationvector : CORRELATION_VECTOR*, version : Int32, guid : Guid*) : UInt32

  # Params # correlationvector : CORRELATION_VECTOR* [In]
  fun RtlIncrementCorrelationVector(correlationvector : CORRELATION_VECTOR*) : UInt32

  # Params # correlationvector : CORRELATION_VECTOR* [In]
  fun RtlExtendCorrelationVector(correlationvector : CORRELATION_VECTOR*) : UInt32

  # Params # vector : CORRELATION_VECTOR* [In]
  fun RtlValidateCorrelationVector(vector : CORRELATION_VECTOR*) : UInt32
end
