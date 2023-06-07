require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wsclient.dll")]
{% else %}
@[Link("wsclient")]
{% end %}
lib LibWin32

  # Params # pexpiration : FILETIME* [In]
  fun CheckDeveloperLicense(pexpiration : FILETIME*) : HRESULT

  # Params # hwndparent : LibC::HANDLE [In],pexpiration : FILETIME* [In]
  fun AcquireDeveloperLicense(hwndparent : LibC::HANDLE, pexpiration : FILETIME*) : HRESULT

  # Params # hwndparent : LibC::HANDLE [In]
  fun RemoveDeveloperLicense(hwndparent : LibC::HANDLE) : HRESULT
end
