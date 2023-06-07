require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:licenseprotection.dll")]
{% else %}
@[Link("licenseprotection")]
{% end %}
lib LibWin32

  enum LicenseProtectionStatus : Int32
    Success = 0
    LicenseKeyNotFound = 1
    LicenseKeyUnprotected = 2
    LicenseKeyCorrupted = 3
    LicenseKeyAlreadyExists = 4
  end


  # Params # licensekey : LibC::LPWSTR [In],validityindays : UInt32 [In],status : LicenseProtectionStatus* [In]
  fun RegisterLicenseKeyWithExpiration(licensekey : LibC::LPWSTR, validityindays : UInt32, status : LicenseProtectionStatus*) : HRESULT

  # Params # licensekey : LibC::LPWSTR [In],notvalidbefore : FILETIME* [In],notvalidafter : FILETIME* [In],status : LicenseProtectionStatus* [In]
  fun ValidateLicenseKeyProtection(licensekey : LibC::LPWSTR, notvalidbefore : FILETIME*, notvalidafter : FILETIME*, status : LicenseProtectionStatus*) : HRESULT
end
