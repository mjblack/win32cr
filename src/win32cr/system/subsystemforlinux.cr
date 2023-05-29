require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-wsl-api-l1-1-0.dll")]
lib LibWin32

  enum WSL_DISTRIBUTION_FLAGS : UInt32
    WSL_DISTRIBUTION_FLAGS_NONE = 0
    WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP = 1
    WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH = 2
    WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING = 4
  end


  # Params # distributionname : LibC::LPWSTR [In]
  fun WslIsDistributionRegistered(distributionname : LibC::LPWSTR) : LibC::BOOL

  # Params # distributionname : LibC::LPWSTR [In],targzfilename : LibC::LPWSTR [In]
  fun WslRegisterDistribution(distributionname : LibC::LPWSTR, targzfilename : LibC::LPWSTR) : HRESULT

  # Params # distributionname : LibC::LPWSTR [In]
  fun WslUnregisterDistribution(distributionname : LibC::LPWSTR) : HRESULT

  # Params # distributionname : LibC::LPWSTR [In],defaultuid : UInt32 [In],wsldistributionflags : WSL_DISTRIBUTION_FLAGS [In]
  fun WslConfigureDistribution(distributionname : LibC::LPWSTR, defaultuid : UInt32, wsldistributionflags : WSL_DISTRIBUTION_FLAGS) : HRESULT

  # Params # distributionname : LibC::LPWSTR [In],distributionversion : UInt32* [In],defaultuid : UInt32* [In],wsldistributionflags : WSL_DISTRIBUTION_FLAGS* [In],defaultenvironmentvariables : PSTR** [In],defaultenvironmentvariablecount : UInt32* [In]
  fun WslGetDistributionConfiguration(distributionname : LibC::LPWSTR, distributionversion : UInt32*, defaultuid : UInt32*, wsldistributionflags : WSL_DISTRIBUTION_FLAGS*, defaultenvironmentvariables : PSTR**, defaultenvironmentvariablecount : UInt32*) : HRESULT

  # Params # distributionname : LibC::LPWSTR [In],command : LibC::LPWSTR [In],usecurrentworkingdirectory : LibC::BOOL [In],exitcode : UInt32* [In]
  fun WslLaunchInteractive(distributionname : LibC::LPWSTR, command : LibC::LPWSTR, usecurrentworkingdirectory : LibC::BOOL, exitcode : UInt32*) : HRESULT

  # Params # distributionname : LibC::LPWSTR [In],command : LibC::LPWSTR [In],usecurrentworkingdirectory : LibC::BOOL [In],stdin : LibC::HANDLE [In],stdout : LibC::HANDLE [In],stderr : LibC::HANDLE [In],process : LibC::HANDLE* [In]
  fun WslLaunch(distributionname : LibC::LPWSTR, command : LibC::LPWSTR, usecurrentworkingdirectory : LibC::BOOL, stdin : LibC::HANDLE, stdout : LibC::HANDLE, stderr : LibC::HANDLE, process : LibC::HANDLE*) : HRESULT
end
