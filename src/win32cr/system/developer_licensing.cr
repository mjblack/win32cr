require "./../foundation.cr"

module Win32cr::System::DeveloperLicensing


  @[Link("wsclient")]
  lib C
    fun CheckDeveloperLicense(pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun AcquireDeveloperLicense(hwndParent : Win32cr::Foundation::HWND, pExpiration : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT

    fun RemoveDeveloperLicense(hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

  end
end