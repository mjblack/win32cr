require "../foundation.cr"
require "../system/windowsprogramming.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  enum REGISTER_APPLICATION_RESTART_FLAGS : UInt32
    RESTART_NO_CRASH = 1
    RESTART_NO_HANG = 2
    RESTART_NO_PATCH = 4
    RESTART_NO_REBOOT = 8
  end


  # Params # precoveycallback : APPLICATION_RECOVERY_CALLBACK [In],pvparameter : Void* [In],dwpinginterval : UInt32 [In],dwflags : UInt32 [In]
  fun RegisterApplicationRecoveryCallback(precoveycallback : APPLICATION_RECOVERY_CALLBACK, pvparameter : Void*, dwpinginterval : UInt32, dwflags : UInt32) : HRESULT

  # Params # 
  fun UnregisterApplicationRecoveryCallback : HRESULT

  # Params # pwzcommandline : LibC::LPWSTR [In],dwflags : REGISTER_APPLICATION_RESTART_FLAGS [In]
  fun RegisterApplicationRestart(pwzcommandline : LibC::LPWSTR, dwflags : REGISTER_APPLICATION_RESTART_FLAGS) : HRESULT

  # Params # 
  fun UnregisterApplicationRestart : HRESULT

  # Params # hprocess : LibC::HANDLE [In],precoverycallback : APPLICATION_RECOVERY_CALLBACK* [In],ppvparameter : Void** [In],pdwpinginterval : UInt32* [In],pdwflags : UInt32* [In]
  fun GetApplicationRecoveryCallback(hprocess : LibC::HANDLE, precoverycallback : APPLICATION_RECOVERY_CALLBACK*, ppvparameter : Void**, pdwpinginterval : UInt32*, pdwflags : UInt32*) : HRESULT

  # Params # hprocess : LibC::HANDLE [In],pwzcommandline : Char* [In],pcchsize : UInt32* [In],pdwflags : UInt32* [In]
  fun GetApplicationRestartSettings(hprocess : LibC::HANDLE, pwzcommandline : Char*, pcchsize : UInt32*, pdwflags : UInt32*) : HRESULT

  # Params # pbcancelled : LibC::BOOL* [In]
  fun ApplicationRecoveryInProgress(pbcancelled : LibC::BOOL*) : HRESULT

  # Params # bsuccess : LibC::BOOL [In]
  fun ApplicationRecoveryFinished(bsuccess : LibC::BOOL)
end