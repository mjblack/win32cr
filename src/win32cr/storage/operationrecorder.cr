require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
{% else %}
@[Link("advapi32")]
{% end %}
lib LibWin32

  enum OPERATION_START_FLAGS : UInt32
    OPERATION_START_TRACE_CURRENT_THREAD = 1
  end

  enum OPERATION_END_PARAMETERS_FLAGS : UInt32
    OPERATION_END_DISCARD = 1
  end

  struct OPERATION_START_PARAMETERS
    version : UInt32
    operation_id : UInt32
    flags : OPERATION_START_FLAGS
  end
  struct OPERATION_END_PARAMETERS
    version : UInt32
    operation_id : UInt32
    flags : OPERATION_END_PARAMETERS_FLAGS
  end


  # Params # operationstartparams : OPERATION_START_PARAMETERS* [In]
  fun OperationStart(operationstartparams : OPERATION_START_PARAMETERS*) : LibC::BOOL

  # Params # operationendparams : OPERATION_END_PARAMETERS* [In]
  fun OperationEnd(operationendparams : OPERATION_END_PARAMETERS*) : LibC::BOOL
end
