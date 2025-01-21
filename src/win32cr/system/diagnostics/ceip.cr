require "./../../foundation.cr"

module Win32cr::System::Diagnostics::Ceip


  @[Link("kernel32")]
  lib C
    fun CeipIsOptedIn : Win32cr::Foundation::BOOL

  end
end