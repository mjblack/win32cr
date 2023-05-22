require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:tbs.dll")]
lib LibWin32
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
    TBS_COMMAND_PRIORITY_LOW = 100
    TBS_COMMAND_PRIORITY_NORMAL = 200
    TBS_COMMAND_PRIORITY_SYSTEM = 400
    TBS_COMMAND_PRIORITY_HIGH = 300
    TBS_COMMAND_PRIORITY_MAX = 2147483648
  end

  enum TBS_COMMAND_LOCALITY : UInt32
    TBS_COMMAND_LOCALITY_ZERO = 0
    TBS_COMMAND_LOCALITY_ONE = 1
    TBS_COMMAND_LOCALITY_TWO = 2
    TBS_COMMAND_LOCALITY_THREE = 3
    TBS_COMMAND_LOCALITY_FOUR = 4
  end

union TBS_CONTEXT_PARAMS2_Anonymous_e__Union
  anonymous : TBS_CONTEXT_PARAMS2_Anonymous_e__Union_Anonymous_e__Struct
  as_uint32 : UInt32
end

  struct TBS_CONTEXT_PARAMS
    version : UInt32
  end
  struct TBS_CONTEXT_PARAMS2
    version : UInt32
    anonymous : TBS_CONTEXT_PARAMS2_Anonymous_e__Union
  end
  struct TBS_CONTEXT_PARAMS2_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct Tdtpm_wnf_provisioning
    status : UInt32
    message : UInt8[28]*
  end
  struct TPM_DEVICE_INFO
    struct_version : UInt32
    tpm_version : UInt32
    tpm_interface_type : UInt32
    tpm_imp_revision : UInt32
  end


  # Params # pcontextparams : TBS_CONTEXT_PARAMS* [In],phcontext : Void** [In]
  fun Tbsi_Context_Create(pcontextparams : TBS_CONTEXT_PARAMS*, phcontext : Void**) : UInt32

  # Params # hcontext : Void* [In]
  fun Tbsip_Context_Close(hcontext : Void*) : UInt32

  # Params # hcontext : Void* [In],locality : TBS_COMMAND_LOCALITY [In],priority : TBS_COMMAND_PRIORITY [In],pabcommand : UInt8* [In],cbcommand : UInt32 [In],pabresult : UInt8* [In],pcbresult : UInt32* [In]
  fun Tbsip_Submit_Command(hcontext : Void*, locality : TBS_COMMAND_LOCALITY, priority : TBS_COMMAND_PRIORITY, pabcommand : UInt8*, cbcommand : UInt32, pabresult : UInt8*, pcbresult : UInt32*) : UInt32

  # Params # hcontext : Void* [In]
  fun Tbsip_Cancel_Commands(hcontext : Void*) : UInt32

  # Params # hcontext : Void* [In],pabinput : UInt8* [In],cbinput : UInt32 [In],paboutput : UInt8* [In],pcboutput : UInt32* [In]
  fun Tbsi_Physical_Presence_Command(hcontext : Void*, pabinput : UInt8*, cbinput : UInt32, paboutput : UInt8*, pcboutput : UInt32*) : UInt32

  # Params # hcontext : Void* [In],poutputbuf : UInt8* [In],poutputbuflen : UInt32* [In]
  fun Tbsi_Get_TCG_Log(hcontext : Void*, poutputbuf : UInt8*, poutputbuflen : UInt32*) : UInt32

  # Params # size : UInt32 [In],info : Void* [In]
  fun Tbsi_GetDeviceInfo(size : UInt32, info : Void*) : UInt32

  # Params # hcontext : Void* [In],ownerauthtype : UInt32 [In],poutputbuf : UInt8* [In],poutputbuflen : UInt32* [In]
  fun Tbsi_Get_OwnerAuth(hcontext : Void*, ownerauthtype : UInt32, poutputbuf : UInt8*, poutputbuflen : UInt32*) : UInt32

  # Params # 
  fun Tbsi_Revoke_Attestation : UInt32

  # Params # pbwindowsaik : UInt8* [In],cbwindowsaik : UInt32 [In],pcbresult : UInt32* [In],pfprotectedbytpm : LibC::BOOL* [In]
  fun GetDeviceID(pbwindowsaik : UInt8*, cbwindowsaik : UInt32, pcbresult : UInt32*, pfprotectedbytpm : LibC::BOOL*) : HRESULT

  # Params # pszwindowsaik : Char* [In],cchwindowsaik : UInt32 [In],pcchresult : UInt32* [In],pfprotectedbytpm : LibC::BOOL* [In]
  fun GetDeviceIDString(pszwindowsaik : Char*, cchwindowsaik : UInt32, pcchresult : UInt32*, pfprotectedbytpm : LibC::BOOL*) : HRESULT

  # Params # keyhandle : UInt32 [In]
  fun Tbsi_Create_Windows_Key(keyhandle : UInt32) : UInt32

  # Params # logtype : UInt32 [In],pboutput : UInt8* [In],pcboutput : UInt32* [In]
  fun Tbsi_Get_TCG_Log_Ex(logtype : UInt32, pboutput : UInt8*, pcboutput : UInt32*) : UInt32
end
