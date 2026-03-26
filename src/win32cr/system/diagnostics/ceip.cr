require "./../../foundation.cr"

module Win32cr::System::Diagnostics::Ceip
  extend self


  def ceipIsOptedIn : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.CeipIsOptedIn
    {% end %}
  end

  @[Link("kernel32.dll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun CeipIsOptedIn : Win32cr::Foundation::BOOL

  end
  {% end %}
end