require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:netapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:davclnt.dll")]
{% else %}
@[Link("netapi32")]
@[Link("davclnt")]
{% end %}
lib LibWin32
  DAV_AUTHN_SCHEME_BASIC = 1_u32
  DAV_AUTHN_SCHEME_NTLM = 2_u32
  DAV_AUTHN_SCHEME_PASSPORT = 4_u32
  DAV_AUTHN_SCHEME_DIGEST = 8_u32
  DAV_AUTHN_SCHEME_NEGOTIATE = 16_u32
  DAV_AUTHN_SCHEME_CERT = 65536_u32
  DAV_AUTHN_SCHEME_FBA = 1048576_u32

  alias PFNDAVAUTHCALLBACK_FREECRED = Proc(Void*, UInt32)
  alias PFNDAVAUTHCALLBACK = Proc(LibC::LPWSTR, LibC::LPWSTR, UInt32, UInt32, DAV_CALLBACK_CRED*, AUTHNEXTSTEP*, PFNDAVAUTHCALLBACK_FREECRED*, UInt32)


  enum AUTHNEXTSTEP : Int32
    DefaultBehavior = 0
    RetryRequest = 1
    CancelRequest = 2
  end

  struct DAV_CALLBACK_AUTH_BLOB
    p_buffer : Void*
    ul_size : UInt32
    ul_type : UInt32
  end
  struct DAV_CALLBACK_AUTH_UNP
    psz_user_name : LibC::LPWSTR
    ul_user_name_length : UInt32
    psz_password : LibC::LPWSTR
    ul_password_length : UInt32
  end
  struct DAV_CALLBACK_CRED
    auth_blob : DAV_CALLBACK_AUTH_BLOB
    unp_blob : DAV_CALLBACK_AUTH_UNP
    b_auth_blob_valid : LibC::BOOL
    b_save : LibC::BOOL
  end


  # Params # connectionhandle : LibC::HANDLE* [In],remotename : LibC::LPWSTR [In],username : LibC::LPWSTR [In],password : LibC::LPWSTR [In],clientcert : UInt8* [In],certsize : UInt32 [In]
  fun DavAddConnection(connectionhandle : LibC::HANDLE*, remotename : LibC::LPWSTR, username : LibC::LPWSTR, password : LibC::LPWSTR, clientcert : UInt8*, certsize : UInt32) : UInt32

  # Params # connectionhandle : LibC::HANDLE [In]
  fun DavDeleteConnection(connectionhandle : LibC::HANDLE) : UInt32

  # Params # url : LibC::LPWSTR [In],uncpath : Char* [In],lpsize : UInt32* [In]
  fun DavGetUNCFromHTTPPath(url : LibC::LPWSTR, uncpath : Char*, lpsize : UInt32*) : UInt32

  # Params # uncpath : LibC::LPWSTR [In],url : Char* [In],lpsize : UInt32* [In]
  fun DavGetHTTPFromUNCPath(uncpath : LibC::LPWSTR, url : Char*, lpsize : UInt32*) : UInt32

  # Params # filename : LibC::LPWSTR [In],lockownername : LibC::LPWSTR [In],lockownernamelengthinbytes : UInt32* [In]
  fun DavGetTheLockOwnerOfTheFile(filename : LibC::LPWSTR, lockownername : LibC::LPWSTR, lockownernamelengthinbytes : UInt32*) : UInt32

  # Params # hfile : LibC::HANDLE [In],exterror : UInt32* [In],exterrorstring : Char* [In],cchsize : UInt32* [In]
  fun DavGetExtendedError(hfile : LibC::HANDLE, exterror : UInt32*, exterrorstring : Char*, cchsize : UInt32*) : UInt32

  # Params # hfile : LibC::HANDLE [In]
  fun DavFlushFile(hfile : LibC::HANDLE) : UInt32

  # Params # urlname : LibC::LPWSTR [In]
  fun DavInvalidateCache(urlname : LibC::LPWSTR) : UInt32

  # Params # lpname : LibC::LPWSTR [In],fforce : LibC::BOOL [In]
  fun DavCancelConnectionsToServer(lpname : LibC::LPWSTR, fforce : LibC::BOOL) : UInt32

  # Params # callback : PFNDAVAUTHCALLBACK [In],version : UInt32 [In]
  fun DavRegisterAuthCallback(callback : PFNDAVAUTHCALLBACK, version : UInt32) : UInt32

  # Params # hcallback : UInt32 [In]
  fun DavUnregisterAuthCallback(hcallback : UInt32) : Void
end
