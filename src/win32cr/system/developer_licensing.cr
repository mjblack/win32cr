require "./../foundation.cr"

module Win32cr::System::DeveloperLicensing
  extend self


  def checkDeveloperLicense(pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CheckDeveloperLicense(pExpiration)
    {% end %}
  end

  def acquireDeveloperLicense(hwndParent : Win32cr::Foundation::HWND, pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.AcquireDeveloperLicense(hwndParent, pExpiration)
    {% end %}
  end

  def removeDeveloperLicense(hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RemoveDeveloperLicense(hwndParent)
    {% end %}
  end

  @[Link("wsclient.dll")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun CheckDeveloperLicense(pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun AcquireDeveloperLicense(hwndParent : Win32cr::Foundation::HWND, pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RemoveDeveloperLicense(hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end