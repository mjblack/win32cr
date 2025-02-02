require "./../networking/win_sock.cr"
require "./../foundation.cr"

module Win32cr::System::UserAccessLogging
  extend self


  @[Extern]
  struct UAL_DATA_BLOB
    property size : UInt32
    property role_guid : LibC::GUID
    property tenant_id : LibC::GUID
    property address : Win32cr::Networking::WinSock::SOCKADDR_STORAGE
    property user_name : UInt16[260]
    def initialize(@size : UInt32, @role_guid : LibC::GUID, @tenant_id : LibC::GUID, @address : Win32cr::Networking::WinSock::SOCKADDR_STORAGE, @user_name : UInt16[260])
    end
  end

  def ualStart(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT
    C.UalStart(data)
  end

  def ualStop(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT
    C.UalStop(data)
  end

  def ualInstrument(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT
    C.UalInstrument(data)
  end

  def ualRegisterProduct(wszProductName : Win32cr::Foundation::PWSTR, wszRoleName : Win32cr::Foundation::PWSTR, wszGuid : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.UalRegisterProduct(wszProductName, wszRoleName, wszGuid)
  end

  @[Link("ualapi")]
  lib C
    # :nodoc:
    fun UalStart(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UalStop(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UalInstrument(data : Win32cr::System::UserAccessLogging::UAL_DATA_BLOB*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UalRegisterProduct(wszProductName : Win32cr::Foundation::PWSTR, wszRoleName : Win32cr::Foundation::PWSTR, wszGuid : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end