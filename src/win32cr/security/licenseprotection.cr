require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:licenseprotection.dll")]
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
