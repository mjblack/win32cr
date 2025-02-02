require "./../foundation.cr"
require "./windows_programming.cr"

module Win32cr::System::Recovery
  extend self

  @[Flags]
  enum REGISTER_APPLICATION_RESTART_FLAGS : UInt32
    RESTART_NO_CRASH = 1_u32
    RESTART_NO_HANG = 2_u32
    RESTART_NO_PATCH = 4_u32
    RESTART_NO_REBOOT = 8_u32
  end

  def registerApplicationRecoveryCallback(pRecoveyCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK, pvParameter : Void*, dwPingInterval : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.RegisterApplicationRecoveryCallback(pRecoveyCallback, pvParameter, dwPingInterval, dwFlags)
  end

  def unregisterApplicationRecoveryCallback : Win32cr::Foundation::HRESULT
    C.UnregisterApplicationRecoveryCallback
  end

  def registerApplicationRestart(pwzCommandline : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Recovery::REGISTER_APPLICATION_RESTART_FLAGS) : Win32cr::Foundation::HRESULT
    C.RegisterApplicationRestart(pwzCommandline, dwFlags)
  end

  def unregisterApplicationRestart : Win32cr::Foundation::HRESULT
    C.UnregisterApplicationRestart
  end

  def getApplicationRecoveryCallback(hProcess : Win32cr::Foundation::HANDLE, pRecoveryCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK*, ppvParameter : Void**, pdwPingInterval : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetApplicationRecoveryCallback(hProcess, pRecoveryCallback, ppvParameter, pdwPingInterval, pdwFlags)
  end

  def getApplicationRestartSettings(hProcess : Win32cr::Foundation::HANDLE, pwzCommandline : UInt16*, pcchSize : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetApplicationRestartSettings(hProcess, pwzCommandline, pcchSize, pdwFlags)
  end

  def applicationRecoveryInProgress(pbCancelled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.ApplicationRecoveryInProgress(pbCancelled)
  end

  def applicationRecoveryFinished(bSuccess : Win32cr::Foundation::BOOL) : Void
    C.ApplicationRecoveryFinished(bSuccess)
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun RegisterApplicationRecoveryCallback(pRecoveyCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK, pvParameter : Void*, dwPingInterval : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UnregisterApplicationRecoveryCallback : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegisterApplicationRestart(pwzCommandline : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Recovery::REGISTER_APPLICATION_RESTART_FLAGS) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UnregisterApplicationRestart : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetApplicationRecoveryCallback(hProcess : Win32cr::Foundation::HANDLE, pRecoveryCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK*, ppvParameter : Void**, pdwPingInterval : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetApplicationRestartSettings(hProcess : Win32cr::Foundation::HANDLE, pwzCommandline : UInt16*, pcchSize : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplicationRecoveryInProgress(pbCancelled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplicationRecoveryFinished(bSuccess : Win32cr::Foundation::BOOL) : Void

  end
end