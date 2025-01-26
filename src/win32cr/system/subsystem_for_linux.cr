require "./../foundation.cr"

module Win32cr::System::SubsystemForLinux

  @[Flags]
  enum WSL_DISTRIBUTION_FLAGS : UInt32
    WSL_DISTRIBUTION_FLAGS_NONE = 0_u32
    WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP = 1_u32
    WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH = 2_u32
    WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING = 4_u32
  end

  lib C
    fun WslIsDistributionRegistered(distributionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun WslRegisterDistribution(distributionName : Win32cr::Foundation::PWSTR, tarGzFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun WslUnregisterDistribution(distributionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun WslConfigureDistribution(distributionName : Win32cr::Foundation::PWSTR, defaultUID : UInt32, wslDistributionFlags : Win32cr::System::SubsystemForLinux::WSL_DISTRIBUTION_FLAGS) : Win32cr::Foundation::HRESULT

    fun WslGetDistributionConfiguration(distributionName : Win32cr::Foundation::PWSTR, distributionVersion : UInt32*, defaultUID : UInt32*, wslDistributionFlags : Win32cr::System::SubsystemForLinux::WSL_DISTRIBUTION_FLAGS*, defaultEnvironmentVariables : Win32cr::Foundation::PSTR**, defaultEnvironmentVariableCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun WslLaunchInteractive(distributionName : Win32cr::Foundation::PWSTR, command : Win32cr::Foundation::PWSTR, useCurrentWorkingDirectory : Win32cr::Foundation::BOOL, exitCode : UInt32*) : Win32cr::Foundation::HRESULT

    fun WslLaunch(distributionName : Win32cr::Foundation::PWSTR, command : Win32cr::Foundation::PWSTR, useCurrentWorkingDirectory : Win32cr::Foundation::BOOL, stdIn : Win32cr::Foundation::HANDLE, stdOut : Win32cr::Foundation::HANDLE, stdErr : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

  end
end