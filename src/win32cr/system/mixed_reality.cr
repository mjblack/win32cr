
module Win32cr::System::MixedReality
  PERCEPTIONFIELD_StateStream_TimeStamps = "aa886119-f32f-49bf-92ca-f9ddf784d297"


  @[Extern]
  struct PERCEPTION_PAYLOAD_FIELD
    property field_id : LibC::GUID
    property offset_in_bytes : UInt32
    property size_in_bytes : UInt32
    def initialize(@field_id : LibC::GUID, @offset_in_bytes : UInt32, @size_in_bytes : UInt32)
    end
  end

  @[Extern]
  struct PERCEPTION_STATE_STREAM_TIMESTAMPS
    property input_timestamp_in_qpc_counts : Int64
    property available_timestamp_in_qpc_counts : Int64
    def initialize(@input_timestamp_in_qpc_counts : Int64, @available_timestamp_in_qpc_counts : Int64)
    end
  end

end