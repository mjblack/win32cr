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
    {% if !flag?(:docs) %}
    C.RegisterApplicationRecoveryCallback(pRecoveyCallback, pvParameter, dwPingInterval, dwFlags)
    {% end %}
  end

  def unregisterApplicationRecoveryCallback : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.UnregisterApplicationRecoveryCallback
    {% end %}
  end

  def registerApplicationRestart(pwzCommandline : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Recovery::REGISTER_APPLICATION_RESTART_FLAGS) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RegisterApplicationRestart(pwzCommandline, dwFlags)
    {% end %}
  end

  def unregisterApplicationRestart : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.UnregisterApplicationRestart
    {% end %}
  end

  def getApplicationRecoveryCallback(hProcess : Win32cr::Foundation::HANDLE, pRecoveryCallback : Win32cr::System::WindowsProgramming::APPLICATION_RECOVERY_CALLBACK*, ppvParameter : Void**, pdwPingInterval : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetApplicationRecoveryCallback(hProcess, pRecoveryCallback, ppvParameter, pdwPingInterval, pdwFlags)
    {% end %}
  end

  def getApplicationRestartSettings(hProcess : Win32cr::Foundation::HANDLE, pwzCommandline : UInt16*, pcchSize : UInt32*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetApplicationRestartSettings(hProcess, pwzCommandline, pcchSize, pdwFlags)
    {% end %}
  end

  def applicationRecoveryInProgress(pbCancelled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ApplicationRecoveryInProgress(pbCancelled)
    {% end %}
  end

  def applicationRecoveryFinished(bSuccess : Win32cr::Foundation::BOOL) : Void
    {% if !flag?(:docs) %}
    C.ApplicationRecoveryFinished(bSuccess)
    {% end %}
  end

  @[Link("kernel32.dll")]
  {% if !flag?(:docs) %}
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
  {% end %}
end