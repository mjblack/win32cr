require "./../foundation.cr"

module Win32cr::System::SubsystemForLinux
  extend self

  @[Flags]
  enum WSL_DISTRIBUTION_FLAGS : UInt32
    WSL_DISTRIBUTION_FLAGS_NONE = 0_u32
    WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP = 1_u32
    WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH = 2_u32
    WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING = 4_u32
  end

  def wslIsDistributionRegistered(distributionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.WslIsDistributionRegistered(distributionName)
  end

  def wslRegisterDistribution(distributionName : Win32cr::Foundation::PWSTR, tarGzFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WslRegisterDistribution(distributionName, tarGzFilename)
  end

  def wslUnregisterDistribution(distributionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WslUnregisterDistribution(distributionName)
  end

  def wslConfigureDistribution(distributionName : Win32cr::Foundation::PWSTR, defaultUID : UInt32, wslDistributionFlags : Win32cr::System::SubsystemForLinux::WSL_DISTRIBUTION_FLAGS) : Win32cr::Foundation::HRESULT
    C.WslConfigureDistribution(distributionName, defaultUID, wslDistributionFlags)
  end

  def wslGetDistributionConfiguration(distributionName : Win32cr::Foundation::PWSTR, distributionVersion : UInt32*, defaultUID : UInt32*, wslDistributionFlags : Win32cr::System::SubsystemForLinux::WSL_DISTRIBUTION_FLAGS*, defaultEnvironmentVariables : Win32cr::Foundation::PSTR**, defaultEnvironmentVariableCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.WslGetDistributionConfiguration(distributionName, distributionVersion, defaultUID, wslDistributionFlags, defaultEnvironmentVariables, defaultEnvironmentVariableCount)
  end

  def wslLaunchInteractive(distributionName : Win32cr::Foundation::PWSTR, command : Win32cr::Foundation::PWSTR, useCurrentWorkingDirectory : Win32cr::Foundation::BOOL, exitCode : UInt32*) : Win32cr::Foundation::HRESULT
    C.WslLaunchInteractive(distributionName, command, useCurrentWorkingDirectory, exitCode)
  end

  def wslLaunch(distributionName : Win32cr::Foundation::PWSTR, command : Win32cr::Foundation::PWSTR, useCurrentWorkingDirectory : Win32cr::Foundation::BOOL, stdIn : Win32cr::Foundation::HANDLE, stdOut : Win32cr::Foundation::HANDLE, stdErr : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.WslLaunch(distributionName, command, useCurrentWorkingDirectory, stdIn, stdOut, stdErr, process)
  end

  lib C
    # :nodoc:
    fun WslIsDistributionRegistered(distributionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WslRegisterDistribution(distributionName : Win32cr::Foundation::PWSTR, tarGzFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WslUnregisterDistribution(distributionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WslConfigureDistribution(distributionName : Win32cr::Foundation::PWSTR, defaultUID : UInt32, wslDistributionFlags : Win32cr::System::SubsystemForLinux::WSL_DISTRIBUTION_FLAGS) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WslGetDistributionConfiguration(distributionName : Win32cr::Foundation::PWSTR, distributionVersion : UInt32*, defaultUID : UInt32*, wslDistributionFlags : Win32cr::System::SubsystemForLinux::WSL_DISTRIBUTION_FLAGS*, defaultEnvironmentVariables : Win32cr::Foundation::PSTR**, defaultEnvironmentVariableCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WslLaunchInteractive(distributionName : Win32cr::Foundation::PWSTR, command : Win32cr::Foundation::PWSTR, useCurrentWorkingDirectory : Win32cr::Foundation::BOOL, exitCode : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WslLaunch(distributionName : Win32cr::Foundation::PWSTR, command : Win32cr::Foundation::PWSTR, useCurrentWorkingDirectory : Win32cr::Foundation::BOOL, stdIn : Win32cr::Foundation::HANDLE, stdOut : Win32cr::Foundation::HANDLE, stdErr : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

  end
end