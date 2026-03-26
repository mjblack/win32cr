require "./../foundation.cr"

module Win32cr::System::SetupAndMigration
  extend self
  alias OOBE_COMPLETED_CALLBACK = Proc(Void*, Void)



  def oOBEComplete(isOOBEComplete : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.OOBEComplete(isOOBEComplete)
    {% end %}
  end

  def registerWaitUntilOOBECompleted(oobe_completed_callback : Win32cr::System::SetupAndMigration::OOBE_COMPLETED_CALLBACK, callback_context : Void*, wait_handle : Void**) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.RegisterWaitUntilOOBECompleted(oobe_completed_callback, callback_context, wait_handle)
    {% end %}
  end

  def unregisterWaitUntilOOBECompleted(wait_handle : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.UnregisterWaitUntilOOBECompleted(wait_handle)
    {% end %}
  end

  @[Link("kernel32.dll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun OOBEComplete(isOOBEComplete : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterWaitUntilOOBECompleted(oobe_completed_callback : Win32cr::System::SetupAndMigration::OOBE_COMPLETED_CALLBACK, callback_context : Void*, wait_handle : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterWaitUntilOOBECompleted(wait_handle : Void*) : Win32cr::Foundation::BOOL

  end
  {% end %}
end