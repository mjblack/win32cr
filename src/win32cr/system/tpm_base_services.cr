require "./../foundation.cr"

module Win32cr::System::TpmBaseServices
  extend self
  TBS_CONTEXT_VERSION_ONE = 1_u32
  TBS_SUCCESS = 0_u32
  TBS_OWNERAUTH_TYPE_FULL = 1_u32
  TBS_OWNERAUTH_TYPE_ADMIN = 2_u32
  TBS_OWNERAUTH_TYPE_USER = 3_u32
  TBS_OWNERAUTH_TYPE_ENDORSEMENT = 4_u32
  TBS_OWNERAUTH_TYPE_ENDORSEMENT_20 = 12_u32
  TBS_OWNERAUTH_TYPE_STORAGE_20 = 13_u32
  TBS_CONTEXT_VERSION_TWO = 2_u32
  TPM_WNF_INFO_CLEAR_SUCCESSFUL = 1_u32
  TPM_WNF_INFO_OWNERSHIP_SUCCESSFUL = 2_u32
  TPM_WNF_INFO_NO_REBOOT_REQUIRED = 1_u32
  TPM_VERSION_UNKNOWN = 0_u32
  TPM_VERSION_12 = 1_u32
  TPM_VERSION_20 = 2_u32
  TPM_IFTYPE_UNKNOWN = 0_u32
  TPM_IFTYPE_1 = 1_u32
  TPM_IFTYPE_TRUSTZONE = 2_u32
  TPM_IFTYPE_HW = 3_u32
  TPM_IFTYPE_EMULATOR = 4_u32
  TPM_IFTYPE_SPB = 5_u32
  TBS_TCGLOG_SRTM_CURRENT = 0_u32
  TBS_TCGLOG_DRTM_CURRENT = 1_u32
  TBS_TCGLOG_SRTM_BOOT = 2_u32
  TBS_TCGLOG_SRTM_RESUME = 3_u32
  TBS_TCGLOG_DRTM_BOOT = 4_u32
  TBS_TCGLOG_DRTM_RESUME = 5_u32

  enum TBS_COMMAND_PRIORITY : UInt32
    TBS_COMMAND_PRIORITY_LOW = 100_u32
    TBS_COMMAND_PRIORITY_NORMAL = 200_u32
    TBS_COMMAND_PRIORITY_SYSTEM = 400_u32
    TBS_COMMAND_PRIORITY_HIGH = 300_u32
    TBS_COMMAND_PRIORITY_MAX = 2147483648_u32
  end
  enum TBS_COMMAND_LOCALITY : UInt32
    TBS_COMMAND_LOCALITY_ZERO = 0_u32
    TBS_COMMAND_LOCALITY_ONE = 1_u32
    TBS_COMMAND_LOCALITY_TWO = 2_u32
    TBS_COMMAND_LOCALITY_THREE = 3_u32
    TBS_COMMAND_LOCALITY_FOUR = 4_u32
  end

  @[Extern]
  struct TBS_CONTEXT_PARAMS
    property version : UInt32
    def initialize(@version : UInt32)
    end
  end

  @[Extern]
  struct TBS_CONTEXT_PARAMS2
    property version : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property asUINT32 : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @asUINT32 : UInt32)
    end
    end

    def initialize(@version : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct Tdtpm_wnf_provisioning
    property status : UInt32
    property message : UInt8[28]
    def initialize(@status : UInt32, @message : UInt8[28])
    end
  end

  @[Extern]
  struct TPM_DEVICE_INFO
    property structVersion : UInt32
    property tpmVersion : UInt32
    property tpmInterfaceType : UInt32
    property tpmImpRevision : UInt32
    def initialize(@structVersion : UInt32, @tpmVersion : UInt32, @tpmInterfaceType : UInt32, @tpmImpRevision : UInt32)
    end
  end

  def tbsiContextCreate(pContextParams : Win32cr::System::TpmBaseServices::TBS_CONTEXT_PARAMS*, phContext : Void**) : UInt32
    C.Tbsi_Context_Create(pContextParams, phContext)
  end

  def tbsipContextClose(hContext : Void*) : UInt32
    C.Tbsip_Context_Close(hContext)
  end

  def tbsipSubmitCommand(hContext : Void*, locality : Win32cr::System::TpmBaseServices::TBS_COMMAND_LOCALITY, priority : Win32cr::System::TpmBaseServices::TBS_COMMAND_PRIORITY, pabCommand : UInt8*, cbCommand : UInt32, pabResult : UInt8*, pcbResult : UInt32*) : UInt32
    C.Tbsip_Submit_Command(hContext, locality, priority, pabCommand, cbCommand, pabResult, pcbResult)
  end

  def tbsipCancelCommands(hContext : Void*) : UInt32
    C.Tbsip_Cancel_Commands(hContext)
  end

  def tbsiPhysicalPresenceCommand(hContext : Void*, pabInput : UInt8*, cbInput : UInt32, pabOutput : UInt8*, pcbOutput : UInt32*) : UInt32
    C.Tbsi_Physical_Presence_Command(hContext, pabInput, cbInput, pabOutput, pcbOutput)
  end

  def tbsiGetTCGLog(hContext : Void*, pOutputBuf : UInt8*, pOutputBufLen : UInt32*) : UInt32
    C.Tbsi_Get_TCG_Log(hContext, pOutputBuf, pOutputBufLen)
  end

  def tbsiGetDeviceInfo(size : UInt32, info : Void*) : UInt32
    C.Tbsi_GetDeviceInfo(size, info)
  end

  def tbsiGetOwnerAuth(hContext : Void*, ownerauthType : UInt32, pOutputBuf : UInt8*, pOutputBufLen : UInt32*) : UInt32
    C.Tbsi_Get_OwnerAuth(hContext, ownerauthType, pOutputBuf, pOutputBufLen)
  end

  def tbsiRevokeAttestation : UInt32
    C.Tbsi_Revoke_Attestation
  end

  def getDeviceID(pbWindowsAIK : UInt8*, cbWindowsAIK : UInt32, pcbResult : UInt32*, pfProtectedByTPM : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.GetDeviceID(pbWindowsAIK, cbWindowsAIK, pcbResult, pfProtectedByTPM)
  end

  def getDeviceIDString(pszWindowsAIK : UInt16*, cchWindowsAIK : UInt32, pcchResult : UInt32*, pfProtectedByTPM : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.GetDeviceIDString(pszWindowsAIK, cchWindowsAIK, pcchResult, pfProtectedByTPM)
  end

  def tbsiCreateWindowsKey(keyHandle : UInt32) : UInt32
    C.Tbsi_Create_Windows_Key(keyHandle)
  end

  def tbsiGetTCGLogEx(logType : UInt32, pbOutput : UInt8*, pcbOutput : UInt32*) : UInt32
    C.Tbsi_Get_TCG_Log_Ex(logType, pbOutput, pcbOutput)
  end

  @[Link("tbs")]
  lib C
    # :nodoc:
    fun Tbsi_Context_Create(pContextParams : Win32cr::System::TpmBaseServices::TBS_CONTEXT_PARAMS*, phContext : Void**) : UInt32

    # :nodoc:
    fun Tbsip_Context_Close(hContext : Void*) : UInt32

    # :nodoc:
    fun Tbsip_Submit_Command(hContext : Void*, locality : Win32cr::System::TpmBaseServices::TBS_COMMAND_LOCALITY, priority : Win32cr::System::TpmBaseServices::TBS_COMMAND_PRIORITY, pabCommand : UInt8*, cbCommand : UInt32, pabResult : UInt8*, pcbResult : UInt32*) : UInt32

    # :nodoc:
    fun Tbsip_Cancel_Commands(hContext : Void*) : UInt32

    # :nodoc:
    fun Tbsi_Physical_Presence_Command(hContext : Void*, pabInput : UInt8*, cbInput : UInt32, pabOutput : UInt8*, pcbOutput : UInt32*) : UInt32

    # :nodoc:
    fun Tbsi_Get_TCG_Log(hContext : Void*, pOutputBuf : UInt8*, pOutputBufLen : UInt32*) : UInt32

    # :nodoc:
    fun Tbsi_GetDeviceInfo(size : UInt32, info : Void*) : UInt32

    # :nodoc:
    fun Tbsi_Get_OwnerAuth(hContext : Void*, ownerauthType : UInt32, pOutputBuf : UInt8*, pOutputBufLen : UInt32*) : UInt32

    # :nodoc:
    fun Tbsi_Revoke_Attestation : UInt32

    # :nodoc:
    fun GetDeviceID(pbWindowsAIK : UInt8*, cbWindowsAIK : UInt32, pcbResult : UInt32*, pfProtectedByTPM : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetDeviceIDString(pszWindowsAIK : UInt16*, cchWindowsAIK : UInt32, pcchResult : UInt32*, pfProtectedByTPM : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun Tbsi_Create_Windows_Key(keyHandle : UInt32) : UInt32

    # :nodoc:
    fun Tbsi_Get_TCG_Log_Ex(logType : UInt32, pbOutput : UInt8*, pcbOutput : UInt32*) : UInt32

  end
end