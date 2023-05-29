require "../networking/winsock.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:ualapi.dll")]
lib LibWin32
  struct UAL_DATA_BLOB
    size : UInt32
    role_guid : Guid
    tenant_id : Guid
    address : SOCKADDR_STORAGE
    user_name : Char[260]*
  end


  # Params # data : UAL_DATA_BLOB* [In]
  fun UalStart(data : UAL_DATA_BLOB*) : HRESULT

  # Params # data : UAL_DATA_BLOB* [In]
  fun UalStop(data : UAL_DATA_BLOB*) : HRESULT

  # Params # data : UAL_DATA_BLOB* [In]
  fun UalInstrument(data : UAL_DATA_BLOB*) : HRESULT

  # Params # wszproductname : LibC::LPWSTR [In],wszrolename : LibC::LPWSTR [In],wszguid : LibC::LPWSTR [In]
  fun UalRegisterProduct(wszproductname : LibC::LPWSTR, wszrolename : LibC::LPWSTR, wszguid : LibC::LPWSTR) : HRESULT
end
