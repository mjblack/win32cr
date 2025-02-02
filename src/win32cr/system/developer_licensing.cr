require "./../foundation.cr"

module Win32cr::System::DeveloperLicensing
  extend self


  def checkDeveloperLicense(pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    C.CheckDeveloperLicense(pExpiration)
  end

  def acquireDeveloperLicense(hwndParent : Win32cr::Foundation::HWND, pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
    C.AcquireDeveloperLicense(hwndParent, pExpiration)
  end

  def removeDeveloperLicense(hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.RemoveDeveloperLicense(hwndParent)
  end

  @[Link("wsclient")]
  lib C
    # :nodoc:
    fun CheckDeveloperLicense(pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun AcquireDeveloperLicense(hwndParent : Win32cr::Foundation::HWND, pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RemoveDeveloperLicense(hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

  end
end