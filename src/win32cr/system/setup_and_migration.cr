require "./../foundation.cr"

module Win32cr::System::SetupAndMigration
  extend self
  alias OOBE_COMPLETED_CALLBACK = Proc(Void*, Void)



  def oOBEComplete(isOOBEComplete : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.OOBEComplete(isOOBEComplete)
  end

  def registerWaitUntilOOBECompleted(oobe_completed_callback : Win32cr::System::SetupAndMigration::OOBE_COMPLETED_CALLBACK, callback_context : Void*, wait_handle : Void**) : Win32cr::Foundation::BOOL
    C.RegisterWaitUntilOOBECompleted(oobe_completed_callback, callback_context, wait_handle)
  end

  def unregisterWaitUntilOOBECompleted(wait_handle : Void*) : Win32cr::Foundation::BOOL
    C.UnregisterWaitUntilOOBECompleted(wait_handle)
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun OOBEComplete(isOOBEComplete : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterWaitUntilOOBECompleted(oobe_completed_callback : Win32cr::System::SetupAndMigration::OOBE_COMPLETED_CALLBACK, callback_context : Void*, wait_handle : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterWaitUntilOOBECompleted(wait_handle : Void*) : Win32cr::Foundation::BOOL

  end
end