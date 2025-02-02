require "./../../foundation.cr"

module Win32cr::System::Diagnostics::Ceip
  extend self


  def ceipIsOptedIn : Win32cr::Foundation::BOOL
    C.CeipIsOptedIn
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun CeipIsOptedIn : Win32cr::Foundation::BOOL

  end
end