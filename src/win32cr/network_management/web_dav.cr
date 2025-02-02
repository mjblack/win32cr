require "./../foundation.cr"

module Win32cr::NetworkManagement::WebDav
  extend self
  alias PFNDAVAUTHCALLBACK_FREECRED = Proc(Void*, UInt32)

  alias PFNDAVAUTHCALLBACK = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::NetworkManagement::WebDav::DAV_CALLBACK_CRED*, Win32cr::NetworkManagement::WebDav::AUTHNEXTSTEP*, Win32cr::NetworkManagement::WebDav::PFNDAVAUTHCALLBACK_FREECRED*, UInt32)

  DAV_AUTHN_SCHEME_BASIC = 1_u32
  DAV_AUTHN_SCHEME_NTLM = 2_u32
  DAV_AUTHN_SCHEME_PASSPORT = 4_u32
  DAV_AUTHN_SCHEME_DIGEST = 8_u32
  DAV_AUTHN_SCHEME_NEGOTIATE = 16_u32
  DAV_AUTHN_SCHEME_CERT = 65536_u32
  DAV_AUTHN_SCHEME_FBA = 1048576_u32

  enum AUTHNEXTSTEP
    DefaultBehavior = 0_i32
    RetryRequest = 1_i32
    CancelRequest = 2_i32
  end

  @[Extern]
  struct DAV_CALLBACK_AUTH_BLOB
    property pBuffer : Void*
    property ulSize : UInt32
    property ulType : UInt32
    def initialize(@pBuffer : Void*, @ulSize : UInt32, @ulType : UInt32)
    end
  end

  @[Extern]
  struct DAV_CALLBACK_AUTH_UNP
    property pszUserName : Win32cr::Foundation::PWSTR
    property ulUserNameLength : UInt32
    property pszPassword : Win32cr::Foundation::PWSTR
    property ulPasswordLength : UInt32
    def initialize(@pszUserName : Win32cr::Foundation::PWSTR, @ulUserNameLength : UInt32, @pszPassword : Win32cr::Foundation::PWSTR, @ulPasswordLength : UInt32)
    end
  end

  @[Extern]
  struct DAV_CALLBACK_CRED
    property auth_blob : Win32cr::NetworkManagement::WebDav::DAV_CALLBACK_AUTH_BLOB
    property unp_blob : Win32cr::NetworkManagement::WebDav::DAV_CALLBACK_AUTH_UNP
    property bAuthBlobValid : Win32cr::Foundation::BOOL
    property bSave : Win32cr::Foundation::BOOL
    def initialize(@auth_blob : Win32cr::NetworkManagement::WebDav::DAV_CALLBACK_AUTH_BLOB, @unp_blob : Win32cr::NetworkManagement::WebDav::DAV_CALLBACK_AUTH_UNP, @bAuthBlobValid : Win32cr::Foundation::BOOL, @bSave : Win32cr::Foundation::BOOL)
    end
  end

  def davAddConnection(connection_handle : Win32cr::Foundation::HANDLE*, remote_name : Win32cr::Foundation::PWSTR, user_name : Win32cr::Foundation::PWSTR, password : Win32cr::Foundation::PWSTR, client_cert : UInt8*, cert_size : UInt32) : UInt32
    C.DavAddConnection(connection_handle, remote_name, user_name, password, client_cert, cert_size)
  end

  def davDeleteConnection(connection_handle : Win32cr::Foundation::HANDLE) : UInt32
    C.DavDeleteConnection(connection_handle)
  end

  def davGetUNCFromHTTPPath(url : Win32cr::Foundation::PWSTR, unc_path : UInt16*, lpSize : UInt32*) : UInt32
    C.DavGetUNCFromHTTPPath(url, unc_path, lpSize)
  end

  def davGetHTTPFromUNCPath(unc_path : Win32cr::Foundation::PWSTR, url : UInt16*, lpSize : UInt32*) : UInt32
    C.DavGetHTTPFromUNCPath(unc_path, url, lpSize)
  end

  def davGetTheLockOwnerOfTheFile(file_name : Win32cr::Foundation::PWSTR, lock_owner_name : Win32cr::Foundation::PWSTR, lock_owner_name_length_in_bytes : UInt32*) : UInt32
    C.DavGetTheLockOwnerOfTheFile(file_name, lock_owner_name, lock_owner_name_length_in_bytes)
  end

  def davGetExtendedError(hFile : Win32cr::Foundation::HANDLE, ext_error : UInt32*, ext_error_string : UInt16*, cChSize : UInt32*) : UInt32
    C.DavGetExtendedError(hFile, ext_error, ext_error_string, cChSize)
  end

  def davFlushFile(hFile : Win32cr::Foundation::HANDLE) : UInt32
    C.DavFlushFile(hFile)
  end

  def davInvalidateCache(url_name : Win32cr::Foundation::PWSTR) : UInt32
    C.DavInvalidateCache(url_name)
  end

  def davCancelConnectionsToServer(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32
    C.DavCancelConnectionsToServer(lpName, fForce)
  end

  def davRegisterAuthCallback(call_back : Win32cr::NetworkManagement::WebDav::PFNDAVAUTHCALLBACK, version : UInt32) : UInt32
    C.DavRegisterAuthCallback(call_back, version)
  end

  def davUnregisterAuthCallback(hCallback : UInt32) : Void
    C.DavUnregisterAuthCallback(hCallback)
  end

  @[Link("netapi32")]
  @[Link("davclnt")]
  lib C
    # :nodoc:
    fun DavAddConnection(connection_handle : Win32cr::Foundation::HANDLE*, remote_name : Win32cr::Foundation::PWSTR, user_name : Win32cr::Foundation::PWSTR, password : Win32cr::Foundation::PWSTR, client_cert : UInt8*, cert_size : UInt32) : UInt32

    # :nodoc:
    fun DavDeleteConnection(connection_handle : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun DavGetUNCFromHTTPPath(url : Win32cr::Foundation::PWSTR, unc_path : UInt16*, lpSize : UInt32*) : UInt32

    # :nodoc:
    fun DavGetHTTPFromUNCPath(unc_path : Win32cr::Foundation::PWSTR, url : UInt16*, lpSize : UInt32*) : UInt32

    # :nodoc:
    fun DavGetTheLockOwnerOfTheFile(file_name : Win32cr::Foundation::PWSTR, lock_owner_name : Win32cr::Foundation::PWSTR, lock_owner_name_length_in_bytes : UInt32*) : UInt32

    # :nodoc:
    fun DavGetExtendedError(hFile : Win32cr::Foundation::HANDLE, ext_error : UInt32*, ext_error_string : UInt16*, cChSize : UInt32*) : UInt32

    # :nodoc:
    fun DavFlushFile(hFile : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun DavInvalidateCache(url_name : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun DavCancelConnectionsToServer(lpName : Win32cr::Foundation::PWSTR, fForce : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun DavRegisterAuthCallback(call_back : Win32cr::NetworkManagement::WebDav::PFNDAVAUTHCALLBACK, version : UInt32) : UInt32

    # :nodoc:
    fun DavUnregisterAuthCallback(hCallback : UInt32) : Void

  end
end