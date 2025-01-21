require "./../foundation.cr"

module Win32cr::System::TpmBaseServices
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
  record TBS_CONTEXT_PARAMS,
    version : UInt32

  @[Extern]
  record TBS_CONTEXT_PARAMS2,
    version : UInt32,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      asUINT32 : UInt32 do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        _bitfield : UInt32

    end

  end

  @[Extern]
  record Tdtpm_wnf_provisioning,
    status : UInt32,
    message : UInt8[28]

  @[Extern]
  record TPM_DEVICE_INFO,
    structVersion : UInt32,
    tpmVersion : UInt32,
    tpmInterfaceType : UInt32,
    tpmImpRevision : UInt32

  @[Link("tbs")]
  lib C
    fun Tbsi_Context_Create(pContextParams : Win32cr::System::TpmBaseServices::TBS_CONTEXT_PARAMS*, phContext : Void**) : UInt32

    fun Tbsip_Context_Close(hContext : Void*) : UInt32

    fun Tbsip_Submit_Command(hContext : Void*, locality : Win32cr::System::TpmBaseServices::TBS_COMMAND_LOCALITY, priority : Win32cr::System::TpmBaseServices::TBS_COMMAND_PRIORITY, pabCommand : UInt8*, cbCommand : UInt32, pabResult : UInt8*, pcbResult : UInt32*) : UInt32

    fun Tbsip_Cancel_Commands(hContext : Void*) : UInt32

    fun Tbsi_Physical_Presence_Command(hContext : Void*, pabInput : UInt8*, cbInput : UInt32, pabOutput : UInt8*, pcbOutput : UInt32*) : UInt32

    fun Tbsi_Get_TCG_Log(hContext : Void*, pOutputBuf : UInt8*, pOutputBufLen : UInt32*) : UInt32

    fun Tbsi_GetDeviceInfo(size : UInt32, info : Void*) : UInt32

    fun Tbsi_Get_OwnerAuth(hContext : Void*, ownerauthType : UInt32, pOutputBuf : UInt8*, pOutputBufLen : UInt32*) : UInt32

    fun Tbsi_Revoke_Attestation : UInt32

    fun GetDeviceID(pbWindowsAIK : UInt8*, cbWindowsAIK : UInt32, pcbResult : UInt32*, pfProtectedByTPM : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun GetDeviceIDString(pszWindowsAIK : UInt16*, cchWindowsAIK : UInt32, pcchResult : UInt32*, pfProtectedByTPM : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun Tbsi_Create_Windows_Key(keyHandle : UInt32) : UInt32

    fun Tbsi_Get_TCG_Log_Ex(logType : UInt32, pbOutput : UInt8*, pcbOutput : UInt32*) : UInt32

  end
end
