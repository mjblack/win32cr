require "./../foundation.cr"

module Win32cr::System::SetupAndMigration
  alias OOBE_COMPLETED_CALLBACK = Proc(Void*, Void)*



  @[Link("kernel32")]
  lib C
    fun OOBEComplete(isOOBEComplete : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun RegisterWaitUntilOOBECompleted(oobe_completed_callback : Win32cr::System::SetupAndMigration::OOBE_COMPLETED_CALLBACK, callback_context : Void*, wait_handle : Void**) : Win32cr::Foundation::BOOL

    fun UnregisterWaitUntilOOBECompleted(wait_handle : Void*) : Win32cr::Foundation::BOOL

  end
end