require "./../foundation.cr"

module Win32cr::Security::LicenseProtection
  extend self

  enum LicenseProtectionStatus
    Success = 0_i32
    LicenseKeyNotFound = 1_i32
    LicenseKeyUnprotected = 2_i32
    LicenseKeyCorrupted = 3_i32
    LicenseKeyAlreadyExists = 4_i32
  end

  def registerLicenseKeyWithExpiration(licenseKey : Win32cr::Foundation::PWSTR, validityInDays : UInt32, status : Win32cr::Security::LicenseProtection::LicenseProtectionStatus*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RegisterLicenseKeyWithExpiration(licenseKey, validityInDays, status)
    {% end %}
  end

  def validateLicenseKeyProtection(licenseKey : Win32cr::Foundation::PWSTR, notValidBefore : Win32cr::Foundation::FILETIME*, notValidAfter : Win32cr::Foundation::FILETIME*, status : Win32cr::Security::LicenseProtection::LicenseProtectionStatus*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ValidateLicenseKeyProtection(licenseKey, notValidBefore, notValidAfter, status)
    {% end %}
  end

  @[Link("licenseprotection")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun RegisterLicenseKeyWithExpiration(licenseKey : Win32cr::Foundation::PWSTR, validityInDays : UInt32, status : Win32cr::Security::LicenseProtection::LicenseProtectionStatus*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ValidateLicenseKeyProtection(licenseKey : Win32cr::Foundation::PWSTR, notValidBefore : Win32cr::Foundation::FILETIME*, notValidAfter : Win32cr::Foundation::FILETIME*, status : Win32cr::Security::LicenseProtection::LicenseProtectionStatus*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end