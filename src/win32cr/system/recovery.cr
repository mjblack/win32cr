require "./../foundation.cr"
require "./windows_programming.cr"

module Win32cr::System::Recovery

  @[Flags]
  enum REGISTER_APPLICATION_RESTART_FLAGS : UInt32
    RESTART_NO_CRASH = 1_u32
    RESTART_NO_HANG = 2_u32
    RESTART_NO_PATCH = 4_u32
    RESTART_NO_REBOOT = 8_u32
  end

  @[Link("kernel32")]
  lib C
    fun RegisterApplicationRecoveryCallback(pRecoveyCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK, pvParameter : Void*, dwPingInterval : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    fun UnregisterApplicationRecoveryCallback : Win32cr::Foundation::HRESULT

    fun RegisterApplicationRestart(pwzCommandline : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Recovery::REGISTER_APPLICATION_RESTART_FLAGS) : Win32cr::Foundation::HRESULT

    fun UnregisterApplicationRestart : Win32cr::Foundation::HRESULT

    fun GetApplicationRecoveryCallback(hProcess : Win32cr::Foundation::HANDLE, pRecoveryCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK*, ppvParameter : Void**, pdwPingInterval : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT

    fun GetApplicationRestartSettings(hProcess : Win32cr::Foundation::HANDLE, pwzCommandline : UInt16*, pcchSize : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT

    fun ApplicationRecoveryInProgress(pbCancelled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun ApplicationRecoveryFinished(bSuccess : Win32cr::Foundation::BOOL) : Void

  end
end