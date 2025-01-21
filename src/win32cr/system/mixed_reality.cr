
module Win32cr::System::MixedReality
  PERCEPTIONFIELD_StateStream_TimeStamps = "aa886119-f32f-49bf-92ca-f9ddf784d297"


  @[Extern]
  record PERCEPTION_PAYLOAD_FIELD,
    field_id : LibC::GUID,
    offset_in_bytes : UInt32,
    size_in_bytes : UInt32

  @[Extern]
  record PERCEPTION_STATE_STREAM_TIMESTAMPS,
    input_timestamp_in_qpc_counts : Int64,
    available_timestamp_in_qpc_counts : Int64

end