
module Win32cr::System::MixedReality
  extend self
  PERCEPTIONFIELD_StateStream_TimeStamps = LibC::GUID.new(0xaa886119_u32, 0xf32f_u16, 0x49bf_u16, StaticArray[0x92_u8, 0xca_u8, 0xf9_u8, 0xdd_u8, 0xf7_u8, 0x84_u8, 0xd2_u8, 0x97_u8])


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