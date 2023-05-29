require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wsclient.dll")]
lib LibWin32

  # Params # pexpiration : FILETIME* [In]
  fun CheckDeveloperLicense(pexpiration : FILETIME*) : HRESULT

  # Params # hwndparent : LibC::HANDLE [In],pexpiration : FILETIME* [In]
  fun AcquireDeveloperLicense(hwndparent : LibC::HANDLE, pexpiration : FILETIME*) : HRESULT

  # Params # hwndparent : LibC::HANDLE [In]
  fun RemoveDeveloperLicense(hwndparent : LibC::HANDLE) : HRESULT
end
