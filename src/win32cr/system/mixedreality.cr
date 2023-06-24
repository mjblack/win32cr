{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  PERCEPTIONFIELD_StateStream_TimeStamps = "aa886119-f32f-49bf-92ca-f9ddf784d297"

  struct PERCEPTION_PAYLOAD_FIELD
    field_id : Guid
    offset_in_bytes : UInt32
    size_in_bytes : UInt32
  end
  struct PERCEPTION_STATE_STREAM_TIMESTAMPS
    input_timestamp_in_qpc_counts : Int64
    available_timestamp_in_qpc_counts : Int64
  end

end
