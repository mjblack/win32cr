require "./../networking/win_sock.cr"
require "./../foundation.cr"

module Win32cr::System::UserAccessLogging


  @[Extern]
  record UAL_DATA_BLOB,
    size : UInt32,
    role_guid : LibC::GUID,
    tenant_id : LibC::GUID,
    address : Win32cr::Networking::WinSock::SOCKADDR_STORAGE,
    user_name : UInt16[260]

  @[Link("ualapi")]
  lib C
    fun UalStart(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT

    fun UalStop(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT

    fun UalInstrument(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT

    fun UalRegisterProduct(wszProductName : Win32cr::Foundation::PWSTR, wszRoleName : Win32cr::Foundation::PWSTR, wszGuid : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end