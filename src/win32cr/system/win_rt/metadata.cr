require "./../../foundation.cr"
require "./../com.cr"
require "./../variant.cr"
require "./../win_rt.cr"

module Win32cr::System::WinRT::Metadata
  extend self
  alias ROPARAMIIDHANDLE = Void*
  INVALID_CONNECTION_ID = 0_u32
  INVALID_TASK_ID = 0_u32
  MAX_CONNECTION_NAME = 260_u32
  MAIN_CLR_MODULE_NAME_W = "coreclr"
  MAIN_CLR_MODULE_NAME_A = "coreclr"
  MSCOREE_SHIM_W = "mscoree.dll"
  MSCOREE_SHIM_A = "mscoree.dll"
  COR_NATIVE_LINK_CUSTOM_VALUE = "COMPLUS_NativeLink"
  COR_NATIVE_LINK_CUSTOM_VALUE_ANSI = "COMPLUS_NativeLink"
  COR_NATIVE_LINK_CUSTOM_VALUE_CC = 18_u32
  COR_BASE_SECURITY_ATTRIBUTE_CLASS = "System.Security.Permissions.SecurityAttribute"
  COR_BASE_SECURITY_ATTRIBUTE_CLASS_ANSI = "System.Security.Permissions.SecurityAttribute"
  COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE = "System.Security.SuppressUnmanagedCodeSecurityAttribute"
  COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE_ANSI = "System.Security.SuppressUnmanagedCodeSecurityAttribute"
  COR_UNVER_CODE_ATTRIBUTE = "System.Security.UnverifiableCodeAttribute"
  COR_UNVER_CODE_ATTRIBUTE_ANSI = "System.Security.UnverifiableCodeAttribute"
  COR_REQUIRES_SECOBJ_ATTRIBUTE = "System.Security.DynamicSecurityMethodAttribute"
  COR_REQUIRES_SECOBJ_ATTRIBUTE_ANSI = "System.Security.DynamicSecurityMethodAttribute"
  COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE = "System.Runtime.CompilerServices.DiscardableAttribute"
  COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE_ASNI = "System.Runtime.CompilerServices.DiscardableAttribute"
  COR_E_UNAUTHORIZEDACCESS = -2147024891_i32
  COR_E_ARGUMENT = -2147024809_i32
  COR_E_INVALIDCAST = -2147467262_i32
  COR_E_OUTOFMEMORY = -2147024882_i32
  COR_E_NULLREFERENCE = -2147467261_i32
  COR_E_AMBIGUOUSMATCH = -2147475171_i32
  COR_E_TARGETPARAMCOUNT = -2147352562_i32
  COR_E_DIVIDEBYZERO = -2147352558_i32
  COR_E_BADIMAGEFORMAT = -2147024885_i32
  FRAMEWORK_REGISTRY_KEY = "Software\\Microsoft\\.NETFramework"
  FRAMEWORK_REGISTRY_KEY_W = "Software\\Microsoft\\.NETFramework"
  USER_FRAMEWORK_REGISTRY_KEY = "Software\\Microsoft\\.NETFramework64"
  USER_FRAMEWORK_REGISTRY_KEY_W = "Software\\Microsoft\\.NETFramework64"
  COR_CTOR_METHOD_NAME = ".ctor"
  COR_CTOR_METHOD_NAME_W = ".ctor"
  COR_CCTOR_METHOD_NAME = ".cctor"
  COR_CCTOR_METHOD_NAME_W = ".cctor"
  COR_ENUM_FIELD_NAME = "value__"
  COR_ENUM_FIELD_NAME_W = "value__"
  COR_DELETED_NAME_A = "_Deleted"
  COR_DELETED_NAME_W = "_Deleted"
  COR_VTABLEGAP_NAME_A = "_VtblGap"
  COR_VTABLEGAP_NAME_W = "_VtblGap"
  INTEROP_DISPID_TYPE_W = "System.Runtime.InteropServices.DispIdAttribute"
  INTEROP_DISPID_TYPE = "System.Runtime.InteropServices.DispIdAttribute"
  INTEROP_INTERFACETYPE_TYPE_W = "System.Runtime.InteropServices.InterfaceTypeAttribute"
  INTEROP_INTERFACETYPE_TYPE = "System.Runtime.InteropServices.InterfaceTypeAttribute"
  INTEROP_CLASSINTERFACE_TYPE_W = "System.Runtime.InteropServices.ClassInterfaceAttribute"
  INTEROP_CLASSINTERFACE_TYPE = "System.Runtime.InteropServices.ClassInterfaceAttribute"
  INTEROP_COMVISIBLE_TYPE_W = "System.Runtime.InteropServices.ComVisibleAttribute"
  INTEROP_COMVISIBLE_TYPE = "System.Runtime.InteropServices.ComVisibleAttribute"
  INTEROP_COMREGISTERFUNCTION_TYPE_W = "System.Runtime.InteropServices.ComRegisterFunctionAttribute"
  INTEROP_COMREGISTERFUNCTION_TYPE = "System.Runtime.InteropServices.ComRegisterFunctionAttribute"
  INTEROP_COMUNREGISTERFUNCTION_TYPE_W = "System.Runtime.InteropServices.ComUnregisterFunctionAttribute"
  INTEROP_COMUNREGISTERFUNCTION_TYPE = "System.Runtime.InteropServices.ComUnregisterFunctionAttribute"
  INTEROP_IMPORTEDFROMTYPELIB_TYPE_W = "System.Runtime.InteropServices.ImportedFromTypeLibAttribute"
  INTEROP_IMPORTEDFROMTYPELIB_TYPE = "System.Runtime.InteropServices.ImportedFromTypeLibAttribute"
  INTEROP_PRIMARYINTEROPASSEMBLY_TYPE_W = "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute"
  INTEROP_PRIMARYINTEROPASSEMBLY_TYPE = "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute"
  INTEROP_IDISPATCHIMPL_TYPE_W = "System.Runtime.InteropServices.IDispatchImplAttribute"
  INTEROP_IDISPATCHIMPL_TYPE = "System.Runtime.InteropServices.IDispatchImplAttribute"
  INTEROP_COMSOURCEINTERFACES_TYPE_W = "System.Runtime.InteropServices.ComSourceInterfacesAttribute"
  INTEROP_COMSOURCEINTERFACES_TYPE = "System.Runtime.InteropServices.ComSourceInterfacesAttribute"
  INTEROP_COMDEFAULTINTERFACE_TYPE_W = "System.Runtime.InteropServices.ComDefaultInterfaceAttribute"
  INTEROP_COMDEFAULTINTERFACE_TYPE = "System.Runtime.InteropServices.ComDefaultInterfaceAttribute"
  INTEROP_COMCONVERSIONLOSS_TYPE_W = "System.Runtime.InteropServices.ComConversionLossAttribute"
  INTEROP_COMCONVERSIONLOSS_TYPE = "System.Runtime.InteropServices.ComConversionLossAttribute"
  INTEROP_BESTFITMAPPING_TYPE_W = "System.Runtime.InteropServices.BestFitMappingAttribute"
  INTEROP_BESTFITMAPPING_TYPE = "System.Runtime.InteropServices.BestFitMappingAttribute"
  INTEROP_TYPELIBTYPE_TYPE_W = "System.Runtime.InteropServices.TypeLibTypeAttribute"
  INTEROP_TYPELIBTYPE_TYPE = "System.Runtime.InteropServices.TypeLibTypeAttribute"
  INTEROP_TYPELIBFUNC_TYPE_W = "System.Runtime.InteropServices.TypeLibFuncAttribute"
  INTEROP_TYPELIBFUNC_TYPE = "System.Runtime.InteropServices.TypeLibFuncAttribute"
  INTEROP_TYPELIBVAR_TYPE_W = "System.Runtime.InteropServices.TypeLibVarAttribute"
  INTEROP_TYPELIBVAR_TYPE = "System.Runtime.InteropServices.TypeLibVarAttribute"
  INTEROP_MARSHALAS_TYPE_W = "System.Runtime.InteropServices.MarshalAsAttribute"
  INTEROP_MARSHALAS_TYPE = "System.Runtime.InteropServices.MarshalAsAttribute"
  INTEROP_COMIMPORT_TYPE_W = "System.Runtime.InteropServices.ComImportAttribute"
  INTEROP_COMIMPORT_TYPE = "System.Runtime.InteropServices.ComImportAttribute"
  INTEROP_GUID_TYPE_W = "System.Runtime.InteropServices.GuidAttribute"
  INTEROP_GUID_TYPE = "System.Runtime.InteropServices.GuidAttribute"
  INTEROP_DEFAULTMEMBER_TYPE_W = "System.Reflection.DefaultMemberAttribute"
  INTEROP_DEFAULTMEMBER_TYPE = "System.Reflection.DefaultMemberAttribute"
  INTEROP_COMEMULATE_TYPE_W = "System.Runtime.InteropServices.ComEmulateAttribute"
  INTEROP_COMEMULATE_TYPE = "System.Runtime.InteropServices.ComEmulateAttribute"
  INTEROP_PRESERVESIG_TYPE_W = "System.Runtime.InteropServices.PreserveSigAttribure"
  INTEROP_PRESERVESIG_TYPE = "System.Runtime.InteropServices.PreserveSigAttribure"
  INTEROP_IN_TYPE_W = "System.Runtime.InteropServices.InAttribute"
  INTEROP_IN_TYPE = "System.Runtime.InteropServices.InAttribute"
  INTEROP_OUT_TYPE_W = "System.Runtime.InteropServices.OutAttribute"
  INTEROP_OUT_TYPE = "System.Runtime.InteropServices.OutAttribute"
  INTEROP_COMALIASNAME_TYPE_W = "System.Runtime.InteropServices.ComAliasNameAttribute"
  INTEROP_COMALIASNAME_TYPE = "System.Runtime.InteropServices.ComAliasNameAttribute"
  INTEROP_PARAMARRAY_TYPE_W = "System.ParamArrayAttribute"
  INTEROP_PARAMARRAY_TYPE = "System.ParamArrayAttribute"
  INTEROP_LCIDCONVERSION_TYPE_W = "System.Runtime.InteropServices.LCIDConversionAttribute"
  INTEROP_LCIDCONVERSION_TYPE = "System.Runtime.InteropServices.LCIDConversionAttribute"
  INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE_W = "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute"
  INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE = "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute"
  INTEROP_DECIMALVALUE_TYPE_W = "System.Runtime.CompilerServices.DecimalConstantAttribute"
  INTEROP_DECIMALVALUE_TYPE = "System.Runtime.CompilerServices.DecimalConstantAttribute"
  INTEROP_DATETIMEVALUE_TYPE_W = "System.Runtime.CompilerServices.DateTimeConstantAttribute"
  INTEROP_DATETIMEVALUE_TYPE = "System.Runtime.CompilerServices.DateTimeConstantAttribute"
  INTEROP_IUNKNOWNVALUE_TYPE_W = "System.Runtime.CompilerServices.IUnknownConstantAttribute"
  INTEROP_IUNKNOWNVALUE_TYPE = "System.Runtime.CompilerServices.IUnknownConstantAttribute"
  INTEROP_IDISPATCHVALUE_TYPE_W = "System.Runtime.CompilerServices.IDispatchConstantAttribute"
  INTEROP_IDISPATCHVALUE_TYPE = "System.Runtime.CompilerServices.IDispatchConstantAttribute"
  INTEROP_AUTOPROXY_TYPE_W = "System.Runtime.InteropServices.AutomationProxyAttribute"
  INTEROP_AUTOPROXY_TYPE = "System.Runtime.InteropServices.AutomationProxyAttribute"
  INTEROP_TYPELIBIMPORTCLASS_TYPE_W = "System.Runtime.InteropServices.TypeLibImportClassAttribute"
  INTEROP_TYPELIBIMPORTCLASS_TYPE = "System.Runtime.InteropServices.TypeLibImportClassAttribute"
  INTEROP_TYPELIBVERSION_TYPE_W = "System.Runtime.InteropServices.TypeLibVersionAttribute"
  INTEROP_TYPELIBVERSION_TYPE = "System.Runtime.InteropServices.TypeLibVersionAttribute"
  INTEROP_COMCOMPATIBLEVERSION_TYPE_W = "System.Runtime.InteropServices.ComCompatibleVersionAttribute"
  INTEROP_COMCOMPATIBLEVERSION_TYPE = "System.Runtime.InteropServices.ComCompatibleVersionAttribute"
  INTEROP_COMEVENTINTERFACE_TYPE_W = "System.Runtime.InteropServices.ComEventInterfaceAttribute"
  INTEROP_COMEVENTINTERFACE_TYPE = "System.Runtime.InteropServices.ComEventInterfaceAttribute"
  INTEROP_COCLASS_TYPE_W = "System.Runtime.InteropServices.CoClassAttribute"
  INTEROP_COCLASS_TYPE = "System.Runtime.InteropServices.CoClassAttribute"
  INTEROP_SERIALIZABLE_TYPE_W = "System.SerializableAttribute"
  INTEROP_SERIALIZABLE_TYPE = "System.SerializableAttribute"
  INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE_W = "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute"
  INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE = "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute"
  FORWARD_INTEROP_STUB_METHOD_TYPE_W = "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute"
  FORWARD_INTEROP_STUB_METHOD_TYPE = "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute"
  FRIEND_ASSEMBLY_TYPE_W = "System.Runtime.CompilerServices.InternalsVisibleToAttribute"
  FRIEND_ASSEMBLY_TYPE = "System.Runtime.CompilerServices.InternalsVisibleToAttribute"
  FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE_W = "System.Runtime.CompilerServices.FriendAccessAllowedAttribute"
  FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE = "System.Runtime.CompilerServices.FriendAccessAllowedAttribute"
  SUBJECT_ASSEMBLY_TYPE_W = "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute"
  SUBJECT_ASSEMBLY_TYPE = "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute"
  DISABLED_PRIVATE_REFLECTION_TYPE_W = "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute"
  DISABLED_PRIVATE_REFLECTION_TYPE = "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute"
  DEFAULTDOMAIN_STA_TYPE_W = "System.STAThreadAttribute"
  DEFAULTDOMAIN_STA_TYPE = "System.STAThreadAttribute"
  DEFAULTDOMAIN_MTA_TYPE_W = "System.MTAThreadAttribute"
  DEFAULTDOMAIN_MTA_TYPE = "System.MTAThreadAttribute"
  DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE_W = "System.LoaderOptimizationAttribute"
  DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE = "System.LoaderOptimizationAttribute"
  NONVERSIONABLE_TYPE_W = "System.Runtime.Versioning.NonVersionableAttribute"
  NONVERSIONABLE_TYPE = "System.Runtime.Versioning.NonVersionableAttribute"
  COMPILATIONRELAXATIONS_TYPE_W = "System.Runtime.CompilerServices.CompilationRelaxationsAttribute"
  COMPILATIONRELAXATIONS_TYPE = "System.Runtime.CompilerServices.CompilationRelaxationsAttribute"
  RUNTIMECOMPATIBILITY_TYPE_W = "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute"
  RUNTIMECOMPATIBILITY_TYPE = "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute"
  DEFAULTDEPENDENCY_TYPE_W = "System.Runtime.CompilerServices.DefaultDependencyAttribute"
  DEFAULTDEPENDENCY_TYPE = "System.Runtime.CompilerServices.DefaultDependencyAttribute"
  DEPENDENCY_TYPE_W = "System.Runtime.CompilerServices.DependencyAttribute"
  DEPENDENCY_TYPE = "System.Runtime.CompilerServices.DependencyAttribute"
  TARGET_FRAMEWORK_TYPE_W = "System.Runtime.Versioning.TargetFrameworkAttribute"
  TARGET_FRAMEWORK_TYPE = "System.Runtime.Versioning.TargetFrameworkAttribute"
  ASSEMBLY_METADATA_TYPE_W = "System.Reflection.AssemblyMetadataAttribute"
  ASSEMBLY_METADATA_TYPE = "System.Reflection.AssemblyMetadataAttribute"
  CMOD_CALLCONV_NAMESPACE_OLD = "System.Runtime.InteropServices"
  CMOD_CALLCONV_NAMESPACE = "System.Runtime.CompilerServices"
  CMOD_CALLCONV_NAME_CDECL = "CallConvCdecl"
  CMOD_CALLCONV_NAME_STDCALL = "CallConvStdcall"
  CMOD_CALLCONV_NAME_THISCALL = "CallConvThiscall"
  CMOD_CALLCONV_NAME_FASTCALL = "CallConvFastcall"
  LIBID_ComPlusRuntime = LibC::GUID.new(0xbed7f4ea_u32, 0x1a96_u16, 0x11d2_u16, StaticArray[0x8f_u8, 0x8_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa6_u8, 0x18_u8, 0x6d_u8])
  GUID_ExportedFromComPlus = LibC::GUID.new(0x90883f05_u32, 0x3d28_u16, 0x11d2_u16, StaticArray[0x8f_u8, 0x17_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xa6_u8, 0x18_u8, 0x6d_u8])
  GUID_ManagedName = LibC::GUID.new(0xf21f359_u32, 0xab84_u16, 0x41e8_u16, StaticArray[0x9a_u8, 0x78_u8, 0x36_u8, 0xd1_u8, 0x10_u8, 0xe6_u8, 0xd2_u8, 0xf9_u8])
  GUID_Function2Getter = LibC::GUID.new(0x54fc8f55_u32, 0x38de_u16, 0x4703_u16, StaticArray[0x9c_u8, 0x4e_u8, 0x25_u8, 0x3_u8, 0x51_u8, 0x30_u8, 0x2b_u8, 0x1c_u8])
  CLSID_CorMetaDataDispenserRuntime = LibC::GUID.new(0x1ec2de53_u32, 0x75cc_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x75_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb4_u8, 0xd5_u8, 0xc_u8])
  GUID_DispIdOverride = LibC::GUID.new(0xcd2bc5c9_u32, 0xf452_u16, 0x4326_u16, StaticArray[0xb7_u8, 0x14_u8, 0xf9_u8, 0xc5_u8, 0x39_u8, 0xd4_u8, 0xda_u8, 0x58_u8])
  GUID_ForceIEnumerable = LibC::GUID.new(0xb64784eb_u32, 0xd8d4_u16, 0x4d9b_u16, StaticArray[0x9a_u8, 0xcd_u8, 0xe_u8, 0x30_u8, 0x80_u8, 0x64_u8, 0x26_u8, 0xf7_u8])
  GUID_PropGetCA = LibC::GUID.new(0x2941ff83_u32, 0x88d8_u16, 0x4f73_u16, StaticArray[0xb6_u8, 0xa9_u8, 0xbd_u8, 0xf8_u8, 0x71_u8, 0x2d_u8, 0x0_u8, 0xd_u8])
  GUID_PropPutCA = LibC::GUID.new(0x29533527_u32, 0x3683_u16, 0x4364_u16, StaticArray[0xab_u8, 0xc0_u8, 0xdb_u8, 0x1a_u8, 0xdd_u8, 0x82_u8, 0x2f_u8, 0xa2_u8])
  CLSID_CLR_v1_MetaData = LibC::GUID.new(0x5023ca_u32, 0x72b1_u16, 0x11d3_u16, StaticArray[0x9f_u8, 0xc4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
  CLSID_CLR_v2_MetaData = LibC::GUID.new(0xefea471a_u32, 0x44fd_u16, 0x4862_u16, StaticArray[0x92_u8, 0x92_u8, 0xc_u8, 0x58_u8, 0xd4_u8, 0x6e_u8, 0x1f_u8, 0x3a_u8])
  MetaDataCheckDuplicatesFor = LibC::GUID.new(0x30fe7be8_u32, 0xd7d9_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0x80_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
  MetaDataRefToDefCheck = LibC::GUID.new(0xde3856f8_u32, 0xd7d9_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0x80_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
  MetaDataNotificationForTokenMovement = LibC::GUID.new(0xe5d71a4c_u32, 0xd7da_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0x80_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
  MetaDataSetUpdate = LibC::GUID.new(0x2eee315c_u32, 0xd7db_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0x80_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
  MetaDataImportOption = LibC::GUID.new(0x79700f36_u32, 0x4aac_u16, 0x11d3_u16, StaticArray[0x84_u8, 0xc3_u8, 0x0_u8, 0x90_u8, 0x27_u8, 0x86_u8, 0x8c_u8, 0xb1_u8])
  MetaDataThreadSafetyOptions = LibC::GUID.new(0xf7559806_u32, 0xf266_u16, 0x42ea_u16, StaticArray[0x8c_u8, 0x63_u8, 0xa_u8, 0xdb_u8, 0x45_u8, 0xe8_u8, 0xb2_u8, 0x34_u8])
  MetaDataErrorIfEmitOutOfOrder = LibC::GUID.new(0x1547872d_u32, 0xdc03_u16, 0x11d2_u16, StaticArray[0x94_u8, 0x20_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x8_u8, 0x34_u8, 0x60_u8])
  MetaDataGenerateTCEAdapters = LibC::GUID.new(0xdcc9de90_u32, 0x4151_u16, 0x11d3_u16, StaticArray[0x88_u8, 0xd6_u8, 0x0_u8, 0x90_u8, 0x27_u8, 0x54_u8, 0xc4_u8, 0x3a_u8])
  MetaDataTypeLibImportNamespace = LibC::GUID.new(0xf17ff889_u32, 0x5a63_u16, 0x11d3_u16, StaticArray[0x9f_u8, 0xf2_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xf7_u8, 0x43_u8, 0x1a_u8])
  MetaDataLinkerOptions = LibC::GUID.new(0x47e099b6_u32, 0xae7c_u16, 0x4797_u16, StaticArray[0x83_u8, 0x17_u8, 0xb4_u8, 0x8a_u8, 0xa6_u8, 0x45_u8, 0xb8_u8, 0xf9_u8])
  MetaDataRuntimeVersion = LibC::GUID.new(0x47e099b7_u32, 0xae7c_u16, 0x4797_u16, StaticArray[0x83_u8, 0x17_u8, 0xb4_u8, 0x8a_u8, 0xa6_u8, 0x45_u8, 0xb8_u8, 0xf9_u8])
  MetaDataMergerOptions = LibC::GUID.new(0x132d3a6e_u32, 0xb35d_u16, 0x464e_u16, StaticArray[0x95_u8, 0x1a_u8, 0x42_u8, 0xef_u8, 0xb9_u8, 0xfb_u8, 0x66_u8, 0x1_u8])
  MetaDataPreserveLocalRefs = LibC::GUID.new(0xa55c0354_u32, 0xe91b_u16, 0x468b_u16, StaticArray[0x86_u8, 0x48_u8, 0x7c_u8, 0xc3_u8, 0x10_u8, 0x35_u8, 0xd5_u8, 0x33_u8])
  DESCR_GROUP_METHODDEF = 0_i32
  DESCR_GROUP_METHODIMPL = 1_i32
  CLSID_Cor = LibC::GUID.new(0xbee00010_u32, 0xee77_u16, 0x11d0_u16, StaticArray[0xa0_u8, 0x15_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb8_u8, 0x84_u8])
  CLSID_CorMetaDataDispenser = LibC::GUID.new(0xe5cb7a31_u32, 0x7512_u16, 0x11d2_u16, StaticArray[0x89_u8, 0xce_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0x92_u8, 0xe5_u8, 0xd8_u8])
  CLSID_CorMetaDataDispenserReg = LibC::GUID.new(0x435755ff_u32, 0x7397_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x71_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb4_u8, 0xd5_u8, 0xc_u8])
  CLSID_CorMetaDataReg = LibC::GUID.new(0x87f3a1f5_u32, 0x7397_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x71_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb4_u8, 0xd5_u8, 0xc_u8])
  SIGN_MASK_ONEBYTE = -64_i32
  SIGN_MASK_TWOBYTE = -8192_i32
  SIGN_MASK_FOURBYTE = -268435456_i32

  enum COINITICOR
    COINITCOR_DEFAULT = 0_i32
  end
  enum COINITIEE
    COINITEE_DEFAULT = 0_i32
    COINITEE_DLL = 1_i32
    COINITEE_MAIN = 2_i32
  end
  enum COUNINITIEE
    COUNINITEE_DEFAULT = 0_i32
    COUNINITEE_DLL = 1_i32
  end
  enum ReplacesGeneralNumericDefines
    IMAGE_DIRECTORY_ENTRY_COMHEADER = 14_i32
  end
  enum CorTypeAttr
    Tdvisibilitymask = 7_i32
    Tdnotpublic = 0_i32
    Tdpublic = 1_i32
    Tdnestedpublic = 2_i32
    Tdnestedprivate = 3_i32
    Tdnestedfamily = 4_i32
    Tdnestedassembly = 5_i32
    Tdnestedfamandassem = 6_i32
    Tdnestedfamorassem = 7_i32
    Tdlayoutmask = 24_i32
    Tdautolayout = 0_i32
    Tdsequentiallayout = 8_i32
    Tdexplicitlayout = 16_i32
    Tdclasssemanticsmask = 32_i32
    Tdclass = 0_i32
    Tdinterface = 32_i32
    Tdabstract = 128_i32
    Tdsealed = 256_i32
    Tdspecialname = 1024_i32
    Tdimport = 4096_i32
    Tdserializable = 8192_i32
    Tdwindowsruntime = 16384_i32
    Tdstringformatmask = 196608_i32
    Tdansiclass = 0_i32
    Tdunicodeclass = 65536_i32
    Tdautoclass = 131072_i32
    Tdcustomformatclass = 196608_i32
    Tdcustomformatmask = 12582912_i32
    Tdbeforefieldinit = 1048576_i32
    Tdforwarder = 2097152_i32
    Tdreservedmask = 264192_i32
    Tdrtspecialname = 2048_i32
    Tdhassecurity = 262144_i32
  end
  enum CorMethodAttr
    Mdmemberaccessmask = 7_i32
    Mdprivatescope = 0_i32
    Mdprivate = 1_i32
    Mdfamandassem = 2_i32
    Mdassem = 3_i32
    Mdfamily = 4_i32
    Mdfamorassem = 5_i32
    Mdpublic = 6_i32
    Mdstatic = 16_i32
    Mdfinal = 32_i32
    Mdvirtual = 64_i32
    Mdhidebysig = 128_i32
    Mdvtablelayoutmask = 256_i32
    Mdreuseslot = 0_i32
    Mdnewslot = 256_i32
    Mdcheckaccessonoverride = 512_i32
    Mdabstract = 1024_i32
    Mdspecialname = 2048_i32
    Mdpinvokeimpl = 8192_i32
    Mdunmanagedexport = 8_i32
    Mdreservedmask = 53248_i32
    Mdrtspecialname = 4096_i32
    Mdhassecurity = 16384_i32
    Mdrequiresecobject = 32768_i32
  end
  enum CorFieldAttr
    Fdfieldaccessmask = 7_i32
    Fdprivatescope = 0_i32
    Fdprivate = 1_i32
    Fdfamandassem = 2_i32
    Fdassembly = 3_i32
    Fdfamily = 4_i32
    Fdfamorassem = 5_i32
    Fdpublic = 6_i32
    Fdstatic = 16_i32
    Fdinitonly = 32_i32
    Fdliteral = 64_i32
    Fdnotserialized = 128_i32
    Fdspecialname = 512_i32
    Fdpinvokeimpl = 8192_i32
    Fdreservedmask = 38144_i32
    Fdrtspecialname = 1024_i32
    Fdhasfieldmarshal = 4096_i32
    Fdhasdefault = 32768_i32
    Fdhasfieldrva = 256_i32
  end
  enum CorParamAttr
    Pdin = 1_i32
    Pdout = 2_i32
    Pdoptional = 16_i32
    Pdreservedmask = 61440_i32
    Pdhasdefault = 4096_i32
    Pdhasfieldmarshal = 8192_i32
    Pdunused = 53216_i32
  end
  enum CorPropertyAttr
    Prspecialname = 512_i32
    Prreservedmask = 62464_i32
    Prrtspecialname = 1024_i32
    Prhasdefault = 4096_i32
    Prunused = 59903_i32
  end
  enum CorEventAttr
    Evspecialname = 512_i32
    Evreservedmask = 1024_i32
    Evrtspecialname = 1024_i32
  end
  enum CorMethodSemanticsAttr
    Mssetter = 1_i32
    Msgetter = 2_i32
    Msother = 4_i32
    Msaddon = 8_i32
    Msremoveon = 16_i32
    Msfire = 32_i32
  end
  enum CorDeclSecurity
    Dclactionmask = 31_i32
    Dclactionnil = 0_i32
    Dclrequest = 1_i32
    Dcldemand = 2_i32
    Dclassert = 3_i32
    Dcldeny = 4_i32
    Dclpermitonly = 5_i32
    Dcllinktimecheck = 6_i32
    Dclinheritancecheck = 7_i32
    Dclrequestminimum = 8_i32
    Dclrequestoptional = 9_i32
    Dclrequestrefuse = 10_i32
    Dclprejitgrant = 11_i32
    Dclprejitdenied = 12_i32
    Dclnoncasdemand = 13_i32
    Dclnoncaslinkdemand = 14_i32
    Dclnoncasinheritance = 15_i32
    Dclmaximumvalue = 15_i32
  end
  enum CorMethodImpl
    Micodetypemask = 3_i32
    Miil = 0_i32
    Minative = 1_i32
    Mioptil = 2_i32
    Miruntime = 3_i32
    Mimanagedmask = 4_i32
    Miunmanaged = 4_i32
    Mimanaged = 0_i32
    Miforwardref = 16_i32
    Mipreservesig = 128_i32
    Miinternalcall = 4096_i32
    Misynchronized = 32_i32
    Minoinlining = 8_i32
    Miaggressiveinlining = 256_i32
    Minooptimization = 64_i32
    Misecuritymitigations = 1024_i32
    Miusermask = 5628_i32
    Mimaxmethodimplval = 65535_i32
  end
  enum CorPinvokeMap
    Pmnomangle = 1_i32
    Pmcharsetmask = 6_i32
    Pmcharsetnotspec = 0_i32
    Pmcharsetansi = 2_i32
    Pmcharsetunicode = 4_i32
    Pmcharsetauto = 6_i32
    Pmbestfituseassem = 0_i32
    Pmbestfitenabled = 16_i32
    Pmbestfitdisabled = 32_i32
    Pmbestfitmask = 48_i32
    Pmthrowonunmappablecharuseassem = 0_i32
    Pmthrowonunmappablecharenabled = 4096_i32
    Pmthrowonunmappablechardisabled = 8192_i32
    Pmthrowonunmappablecharmask = 12288_i32
    Pmsupportslasterror = 64_i32
    Pmcallconvmask = 1792_i32
    Pmcallconvwinapi = 256_i32
    Pmcallconvcdecl = 512_i32
    Pmcallconvstdcall = 768_i32
    Pmcallconvthiscall = 1024_i32
    Pmcallconvfastcall = 1280_i32
    Pmmaxvalue = 65535_i32
  end
  enum CorAssemblyFlags
    Afpublickey = 1_i32
    Afpa_none = 0_i32
    Afpa_msil = 16_i32
    Afpa_x86 = 32_i32
    Afpa_ia64 = 48_i32
    Afpa_amd64 = 64_i32
    Afpa_arm = 80_i32
    Afpa_noplatform = 112_i32
    Afpa_specified = 128_i32
    Afpa_mask = 112_i32
    Afpa_fullmask = 240_i32
    Afpa_shift = 4_i32
    Afenablejitcompiletracking = 32768_i32
    Afdisablejitcompileoptimizer = 16384_i32
    Afretargetable = 256_i32
    Afcontenttype_default = 0_i32
    Afcontenttype_windowsruntime = 512_i32
    Afcontenttype_mask = 3584_i32
  end
  enum CorManifestResourceFlags
    Mrvisibilitymask = 7_i32
    Mrpublic = 1_i32
    Mrprivate = 2_i32
  end
  enum CorFileFlags
    Ffcontainsmetadata = 0_i32
    Ffcontainsnometadata = 1_i32
  end
  enum CorPEKind
    Penot = 0_i32
    Peilonly = 1_i32
    Pe32bitrequired = 2_i32
    Pe32plus = 4_i32
    Pe32unmanaged = 8_i32
    Pe32bitpreferred = 16_i32
  end
  enum CorGenericParamAttr
    Gpvariancemask = 3_i32
    Gpnonvariant = 0_i32
    Gpcovariant = 1_i32
    Gpcontravariant = 2_i32
    Gpspecialconstraintmask = 28_i32
    Gpnospecialconstraint = 0_i32
    Gpreferencetypeconstraint = 4_i32
    Gpnotnullablevaluetypeconstraint = 8_i32
    Gpdefaultconstructorconstraint = 16_i32
  end
  enum CorElementType : UInt8
    ELEMENT_TYPE_END = 0_u8
    ELEMENT_TYPE_VOID = 1_u8
    ELEMENT_TYPE_BOOLEAN = 2_u8
    ELEMENT_TYPE_CHAR = 3_u8
    ELEMENT_TYPE_I1 = 4_u8
    ELEMENT_TYPE_U1 = 5_u8
    ELEMENT_TYPE_I2 = 6_u8
    ELEMENT_TYPE_U2 = 7_u8
    ELEMENT_TYPE_I4 = 8_u8
    ELEMENT_TYPE_U4 = 9_u8
    ELEMENT_TYPE_I8 = 10_u8
    ELEMENT_TYPE_U8 = 11_u8
    ELEMENT_TYPE_R4 = 12_u8
    ELEMENT_TYPE_R8 = 13_u8
    ELEMENT_TYPE_STRING = 14_u8
    ELEMENT_TYPE_PTR = 15_u8
    ELEMENT_TYPE_BYREF = 16_u8
    ELEMENT_TYPE_VALUETYPE = 17_u8
    ELEMENT_TYPE_CLASS = 18_u8
    ELEMENT_TYPE_VAR = 19_u8
    ELEMENT_TYPE_ARRAY = 20_u8
    ELEMENT_TYPE_GENERICINST = 21_u8
    ELEMENT_TYPE_TYPEDBYREF = 22_u8
    ELEMENT_TYPE_I = 24_u8
    ELEMENT_TYPE_U = 25_u8
    ELEMENT_TYPE_FNPTR = 27_u8
    ELEMENT_TYPE_OBJECT = 28_u8
    ELEMENT_TYPE_SZARRAY = 29_u8
    ELEMENT_TYPE_MVAR = 30_u8
    ELEMENT_TYPE_CMOD_REQD = 31_u8
    ELEMENT_TYPE_CMOD_OPT = 32_u8
    ELEMENT_TYPE_INTERNAL = 33_u8
    ELEMENT_TYPE_MAX = 34_u8
    ELEMENT_TYPE_MODIFIER = 64_u8
    ELEMENT_TYPE_SENTINEL = 65_u8
    ELEMENT_TYPE_PINNED = 69_u8
  end
  enum CorSerializationType
    SERIALIZATION_TYPE_UNDEFINED = 0_i32
    SERIALIZATION_TYPE_BOOLEAN = 2_i32
    SERIALIZATION_TYPE_CHAR = 3_i32
    SERIALIZATION_TYPE_I1 = 4_i32
    SERIALIZATION_TYPE_U1 = 5_i32
    SERIALIZATION_TYPE_I2 = 6_i32
    SERIALIZATION_TYPE_U2 = 7_i32
    SERIALIZATION_TYPE_I4 = 8_i32
    SERIALIZATION_TYPE_U4 = 9_i32
    SERIALIZATION_TYPE_I8 = 10_i32
    SERIALIZATION_TYPE_U8 = 11_i32
    SERIALIZATION_TYPE_R4 = 12_i32
    SERIALIZATION_TYPE_R8 = 13_i32
    SERIALIZATION_TYPE_STRING = 14_i32
    SERIALIZATION_TYPE_SZARRAY = 29_i32
    SERIALIZATION_TYPE_TYPE = 80_i32
    SERIALIZATION_TYPE_TAGGED_OBJECT = 81_i32
    SERIALIZATION_TYPE_FIELD = 83_i32
    SERIALIZATION_TYPE_PROPERTY = 84_i32
    SERIALIZATION_TYPE_ENUM = 85_i32
  end
  enum CorCallingConvention
    IMAGE_CEE_CS_CALLCONV_DEFAULT = 0_i32
    IMAGE_CEE_CS_CALLCONV_VARARG = 5_i32
    IMAGE_CEE_CS_CALLCONV_FIELD = 6_i32
    IMAGE_CEE_CS_CALLCONV_LOCAL_SIG = 7_i32
    IMAGE_CEE_CS_CALLCONV_PROPERTY = 8_i32
    IMAGE_CEE_CS_CALLCONV_UNMGD = 9_i32
    IMAGE_CEE_CS_CALLCONV_GENERICINST = 10_i32
    IMAGE_CEE_CS_CALLCONV_NATIVEVARARG = 11_i32
    IMAGE_CEE_CS_CALLCONV_MAX = 12_i32
    IMAGE_CEE_CS_CALLCONV_MASK = 15_i32
    IMAGE_CEE_CS_CALLCONV_HASTHIS = 32_i32
    IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS = 64_i32
    IMAGE_CEE_CS_CALLCONV_GENERIC = 16_i32
  end
  enum CorUnmanagedCallingConvention
    IMAGE_CEE_UNMANAGED_CALLCONV_C = 1_i32
    IMAGE_CEE_UNMANAGED_CALLCONV_STDCALL = 2_i32
    IMAGE_CEE_UNMANAGED_CALLCONV_THISCALL = 3_i32
    IMAGE_CEE_UNMANAGED_CALLCONV_FASTCALL = 4_i32
    IMAGE_CEE_CS_CALLCONV_C = 1_i32
    IMAGE_CEE_CS_CALLCONV_STDCALL = 2_i32
    IMAGE_CEE_CS_CALLCONV_THISCALL = 3_i32
    IMAGE_CEE_CS_CALLCONV_FASTCALL = 4_i32
  end
  enum CorArgType
    IMAGE_CEE_CS_END = 0_i32
    IMAGE_CEE_CS_VOID = 1_i32
    IMAGE_CEE_CS_I4 = 2_i32
    IMAGE_CEE_CS_I8 = 3_i32
    IMAGE_CEE_CS_R4 = 4_i32
    IMAGE_CEE_CS_R8 = 5_i32
    IMAGE_CEE_CS_PTR = 6_i32
    IMAGE_CEE_CS_OBJECT = 7_i32
    IMAGE_CEE_CS_STRUCT4 = 8_i32
    IMAGE_CEE_CS_STRUCT32 = 9_i32
    IMAGE_CEE_CS_BYVALUE = 10_i32
  end
  enum CorNativeType
    NATIVE_TYPE_END = 0_i32
    NATIVE_TYPE_VOID = 1_i32
    NATIVE_TYPE_BOOLEAN = 2_i32
    NATIVE_TYPE_I1 = 3_i32
    NATIVE_TYPE_U1 = 4_i32
    NATIVE_TYPE_I2 = 5_i32
    NATIVE_TYPE_U2 = 6_i32
    NATIVE_TYPE_I4 = 7_i32
    NATIVE_TYPE_U4 = 8_i32
    NATIVE_TYPE_I8 = 9_i32
    NATIVE_TYPE_U8 = 10_i32
    NATIVE_TYPE_R4 = 11_i32
    NATIVE_TYPE_R8 = 12_i32
    NATIVE_TYPE_SYSCHAR = 13_i32
    NATIVE_TYPE_VARIANT = 14_i32
    NATIVE_TYPE_CURRENCY = 15_i32
    NATIVE_TYPE_PTR = 16_i32
    NATIVE_TYPE_DECIMAL = 17_i32
    NATIVE_TYPE_DATE = 18_i32
    NATIVE_TYPE_BSTR = 19_i32
    NATIVE_TYPE_LPSTR = 20_i32
    NATIVE_TYPE_LPWSTR = 21_i32
    NATIVE_TYPE_LPTSTR = 22_i32
    NATIVE_TYPE_FIXEDSYSSTRING = 23_i32
    NATIVE_TYPE_OBJECTREF = 24_i32
    NATIVE_TYPE_IUNKNOWN = 25_i32
    NATIVE_TYPE_IDISPATCH = 26_i32
    NATIVE_TYPE_STRUCT = 27_i32
    NATIVE_TYPE_INTF = 28_i32
    NATIVE_TYPE_SAFEARRAY = 29_i32
    NATIVE_TYPE_FIXEDARRAY = 30_i32
    NATIVE_TYPE_INT = 31_i32
    NATIVE_TYPE_UINT = 32_i32
    NATIVE_TYPE_NESTEDSTRUCT = 33_i32
    NATIVE_TYPE_BYVALSTR = 34_i32
    NATIVE_TYPE_ANSIBSTR = 35_i32
    NATIVE_TYPE_TBSTR = 36_i32
    NATIVE_TYPE_VARIANTBOOL = 37_i32
    NATIVE_TYPE_FUNC = 38_i32
    NATIVE_TYPE_ASANY = 40_i32
    NATIVE_TYPE_ARRAY = 42_i32
    NATIVE_TYPE_LPSTRUCT = 43_i32
    NATIVE_TYPE_CUSTOMMARSHALER = 44_i32
    NATIVE_TYPE_ERROR = 45_i32
    NATIVE_TYPE_IINSPECTABLE = 46_i32
    NATIVE_TYPE_HSTRING = 47_i32
    NATIVE_TYPE_LPUTF8STR = 48_i32
    NATIVE_TYPE_MAX = 80_i32
  end
  enum CorILMethodSect
    CorILMethod_Sect_Reserved = 0_i32
    CorILMethod_Sect_EHTable = 1_i32
    CorILMethod_Sect_OptILTable = 2_i32
    CorILMethod_Sect_KindMask = 63_i32
    CorILMethod_Sect_FatFormat = 64_i32
    CorILMethod_Sect_MoreSects = 128_i32
  end
  enum CorExceptionFlag
    COR_ILEXCEPTION_CLAUSE_NONE = 0_i32
    COR_ILEXCEPTION_CLAUSE_OFFSETLEN = 0_i32
    COR_ILEXCEPTION_CLAUSE_DEPRECATED = 0_i32
    COR_ILEXCEPTION_CLAUSE_FILTER = 1_i32
    COR_ILEXCEPTION_CLAUSE_FINALLY = 2_i32
    COR_ILEXCEPTION_CLAUSE_FAULT = 4_i32
    COR_ILEXCEPTION_CLAUSE_DUPLICATED = 8_i32
  end
  enum CorILMethodFlags
    CorILMethod_InitLocals = 16_i32
    CorILMethod_MoreSects = 8_i32
    CorILMethod_CompressedIL = 64_i32
    CorILMethod_FormatShift = 3_i32
    CorILMethod_FormatMask = 7_i32
    CorILMethod_TinyFormat = 2_i32
    CorILMethod_SmallFormat = 0_i32
    CorILMethod_FatFormat = 3_i32
    CorILMethod_TinyFormat1 = 6_i32
  end
  enum CorCheckDuplicatesFor
    MDDupAll = -1_i32
    MDDupENC = -1_i32
    MDNoDupChecks = 0_i32
    MDDupTypeDef = 1_i32
    MDDupInterfaceImpl = 2_i32
    MDDupMethodDef = 4_i32
    MDDupTypeRef = 8_i32
    MDDupMemberRef = 16_i32
    MDDupCustomAttribute = 32_i32
    MDDupParamDef = 64_i32
    MDDupPermission = 128_i32
    MDDupProperty = 256_i32
    MDDupEvent = 512_i32
    MDDupFieldDef = 1024_i32
    MDDupSignature = 2048_i32
    MDDupModuleRef = 4096_i32
    MDDupTypeSpec = 8192_i32
    MDDupImplMap = 16384_i32
    MDDupAssemblyRef = 32768_i32
    MDDupFile = 65536_i32
    MDDupExportedType = 131072_i32
    MDDupManifestResource = 262144_i32
    MDDupGenericParam = 524288_i32
    MDDupMethodSpec = 1048576_i32
    MDDupGenericParamConstraint = 2097152_i32
    MDDupAssembly = 268435456_i32
    MDDupDefault = 1058840_i32
  end
  enum CorRefToDefCheck
    MDRefToDefDefault = 3_i32
    MDRefToDefAll = -1_i32
    MDRefToDefNone = 0_i32
    MDTypeRefToDef = 1_i32
    MDMemberRefToDef = 2_i32
  end
  enum CorNotificationForTokenMovement
    MDNotifyDefault = 15_i32
    MDNotifyAll = -1_i32
    MDNotifyNone = 0_i32
    MDNotifyMethodDef = 1_i32
    MDNotifyMemberRef = 2_i32
    MDNotifyFieldDef = 4_i32
    MDNotifyTypeRef = 8_i32
    MDNotifyTypeDef = 16_i32
    MDNotifyParamDef = 32_i32
    MDNotifyInterfaceImpl = 64_i32
    MDNotifyProperty = 128_i32
    MDNotifyEvent = 256_i32
    MDNotifySignature = 512_i32
    MDNotifyTypeSpec = 1024_i32
    MDNotifyCustomAttribute = 2048_i32
    MDNotifySecurityValue = 4096_i32
    MDNotifyPermission = 8192_i32
    MDNotifyModuleRef = 16384_i32
    MDNotifyNameSpace = 32768_i32
    MDNotifyAssemblyRef = 16777216_i32
    MDNotifyFile = 33554432_i32
    MDNotifyExportedType = 67108864_i32
    MDNotifyResource = 134217728_i32
  end
  enum CorSetENC
    MDSetENCOn = 1_i32
    MDSetENCOff = 2_i32
    MDUpdateENC = 1_i32
    MDUpdateFull = 2_i32
    MDUpdateExtension = 3_i32
    MDUpdateIncremental = 4_i32
    MDUpdateDelta = 5_i32
    MDUpdateMask = 7_i32
  end
  enum CorErrorIfEmitOutOfOrder
    MDErrorOutOfOrderDefault = 0_i32
    MDErrorOutOfOrderNone = 0_i32
    MDErrorOutOfOrderAll = -1_i32
    MDMethodOutOfOrder = 1_i32
    MDFieldOutOfOrder = 2_i32
    MDParamOutOfOrder = 4_i32
    MDPropertyOutOfOrder = 8_i32
    MDEventOutOfOrder = 16_i32
  end
  enum CorImportOptions
    MDImportOptionDefault = 0_i32
    MDImportOptionAll = -1_i32
    MDImportOptionAllTypeDefs = 1_i32
    MDImportOptionAllMethodDefs = 2_i32
    MDImportOptionAllFieldDefs = 4_i32
    MDImportOptionAllProperties = 8_i32
    MDImportOptionAllEvents = 16_i32
    MDImportOptionAllCustomAttributes = 32_i32
    MDImportOptionAllExportedTypes = 64_i32
  end
  enum CorThreadSafetyOptions
    MDThreadSafetyDefault = 0_i32
    MDThreadSafetyOff = 0_i32
    MDThreadSafetyOn = 1_i32
  end
  enum CorLinkerOptions
    MDAssembly = 0_i32
    MDNetModule = 1_i32
  end
  enum MergeFlags
    MergeFlagsNone = 0_i32
    MergeManifest = 1_i32
    DropMemberRefCAs = 2_i32
    NoDupCheck = 4_i32
    MergeExportedTypes = 8_i32
  end
  enum CorLocalRefPreservation
    MDPreserveLocalRefsNone = 0_i32
    MDPreserveLocalTypeRef = 1_i32
    MDPreserveLocalMemberRef = 2_i32
  end
  enum CorTokenType
    Mdtmodule = 0_i32
    Mdttyperef = 16777216_i32
    Mdttypedef = 33554432_i32
    Mdtfielddef = 67108864_i32
    Mdtmethoddef = 100663296_i32
    Mdtparamdef = 134217728_i32
    Mdtinterfaceimpl = 150994944_i32
    Mdtmemberref = 167772160_i32
    Mdtcustomattribute = 201326592_i32
    Mdtpermission = 234881024_i32
    Mdtsignature = 285212672_i32
    Mdtevent = 335544320_i32
    Mdtproperty = 385875968_i32
    Mdtmethodimpl = 419430400_i32
    Mdtmoduleref = 436207616_i32
    Mdttypespec = 452984832_i32
    Mdtassembly = 536870912_i32
    Mdtassemblyref = 587202560_i32
    Mdtfile = 637534208_i32
    Mdtexportedtype = 654311424_i32
    Mdtmanifestresource = 671088640_i32
    Mdtgenericparam = 704643072_i32
    Mdtmethodspec = 721420288_i32
    Mdtgenericparamconstraint = 738197504_i32
    Mdtstring = 1879048192_i32
    Mdtname = 1895825408_i32
    Mdtbasetype = 1912602624_i32
  end
  enum CorOpenFlags
    Ofread = 0_i32
    Ofwrite = 1_i32
    Ofreadwritemask = 1_i32
    Ofcopymemory = 2_i32
    Ofreadonly = 16_i32
    Oftakeownership = 32_i32
    Ofnotypelib = 128_i32
    Ofnotransform = 4096_i32
    Ofcheckintegrity = 2048_i32
    Ofreserved1 = 256_i32
    Ofreserved2 = 512_i32
    Ofreserved3 = 1024_i32
    Ofreserved = -6336_i32
  end
  enum CorFileMapping
    Fmflat = 0_i32
    Fmexecutableimage = 1_i32
  end
  enum CorAttributeTargets
    Catassembly = 1_i32
    Catmodule = 2_i32
    Catclass = 4_i32
    Catstruct = 8_i32
    Catenum = 16_i32
    Catconstructor = 32_i32
    Catmethod = 64_i32
    Catproperty = 128_i32
    Catfield = 256_i32
    Catevent = 512_i32
    Catinterface = 1024_i32
    Catparameter = 2048_i32
    Catdelegate = 4096_i32
    Catgenericparameter = 16384_i32
    Catall = 24575_i32
    Catclassmembers = 6140_i32
  end
  enum CompilationRelaxationsEnum
    CompilationRelaxations_NoStringInterning = 8_i32
  end
  enum NGenHintEnum
    NGenDefault = 0_i32
    NGenEager = 1_i32
    NGenLazy = 2_i32
    NGenNever = 3_i32
  end
  enum LoadHintEnum
    LoadDefault = 0_i32
    LoadAlways = 1_i32
    LoadSometimes = 2_i32
    LoadNever = 3_i32
  end
  enum CorSaveSize
    Cssaccurate = 0_i32
    Cssquick = 1_i32
    Cssdiscardtransientcas = 2_i32
  end
  enum NativeTypeArrayFlags
    Ntasizeparamindexspecified = 1_i32
    Ntareserved = 65534_i32
  end
  enum CorValidatorModuleType
    ValidatorModuleTypeInvalid = 0_i32
    ValidatorModuleTypeMin = 1_i32
    ValidatorModuleTypePE = 1_i32
    ValidatorModuleTypeObj = 2_i32
    ValidatorModuleTypeEnc = 3_i32
    ValidatorModuleTypeIncr = 4_i32
    ValidatorModuleTypeMax = 4_i32
  end
  enum CorRegFlags
    Regnocopy = 1_i32
    Regconfig = 2_i32
    Reghasrefs = 4_i32
  end
  enum CeeSectionAttr : Int64
    Sdnone = 0_i64
    Sdreadonly = 1073741888_i64
    Sdreadwrite = 3221225536_i64
    Sdexecute = 1610612768_i64
  end
  enum CeeSectionRelocType
    Srrelocabsolute = 0_i32
    Srrelochighlow = 3_i32
    Srrelochighadj = 4_i32
    Srrelocmaptoken = 5_i32
    Srrelocrelative = 6_i32
    Srrelocfilepos = 7_i32
    Srreloccoderelative = 8_i32
    Srrelocia64imm64 = 9_i32
    Srrelocdir64 = 10_i32
    Srrelocia64pcrel25 = 11_i32
    Srrelocia64pcrel64 = 12_i32
    Srrelocabsolutetagged = 13_i32
    Srrelocsentinel = 14_i32
    Srnobasereloc = 16384_i32
    Srrelocptr = 32768_i32
    Srrelocabsoluteptr = 32768_i32
    Srrelochighlowptr = 32771_i32
    Srrelocrelativeptr = 32774_i32
    Srrelocia64imm64ptr = 32777_i32
    Srrelocdir64ptr = 32778_i32
  end
  enum CorNativeLinkType
    Nltnone = 1_i32
    Nltansi = 2_i32
    Nltunicode = 3_i32
    Nltauto = 4_i32
    Nltole = 5_i32
    Nltmaxvalue = 7_i32
  end
  enum CorNativeLinkFlags
    Nlfnone = 0_i32
    Nlflasterror = 1_i32
    Nlfnomangle = 2_i32
    Nlfmaxvalue = 3_i32
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL
    property _bitfield1 : UInt32
    property _bitfield2 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property class_token : UInt32
    property filter_offset : UInt32
    def initialize(@class_token : UInt32, @filter_offset : UInt32)
    end
    end

    def initialize(@_bitfield1 : UInt32, @_bitfield2 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_SMALL
    property kind : UInt8
    property data_size : UInt8
    def initialize(@kind : UInt8, @data_size : UInt8)
    end
  end

  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_FAT
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
  end

  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT
    property flags : Win32cr::System::WinRT::Metadata::CorExceptionFlag
    property try_offset : UInt32
    property try_length : UInt32
    property handler_offset : UInt32
    property handler_length : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property class_token : UInt32
    property filter_offset : UInt32
    def initialize(@class_token : UInt32, @filter_offset : UInt32)
    end
    end

    def initialize(@flags : Win32cr::System::WinRT::Metadata::CorExceptionFlag, @try_offset : UInt32, @try_length : UInt32, @handler_offset : UInt32, @handler_length : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_EH_FAT
    property sect_fat : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_FAT
    property clauses : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT[1]
    def initialize(@sect_fat : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_FAT, @clauses : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT[1])
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL
    property _bitfield1 : Int32
    property _bitfield2 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property class_token : UInt32
    property filter_offset : UInt32
    def initialize(@class_token : UInt32, @filter_offset : UInt32)
    end
    end

    def initialize(@_bitfield1 : Int32, @_bitfield2 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  @[Extern]
  struct IMAGE_COR_ILMETHOD_SECT_EH_SMALL
    property sect_small : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_SMALL
    property reserved : UInt16
    property clauses : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL[1]
    def initialize(@sect_small : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_SMALL, @reserved : UInt16, @clauses : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL[1])
    end
  end

  @[Extern(union: true)]
  struct IMAGE_COR_ILMETHOD_SECT_EH
    property small : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_SMALL
    property fat : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_FAT
    def initialize(@small : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_SMALL, @fat : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_SECT_EH_FAT)
    end
  end

  @[Extern]
  struct IMAGE_COR_ILMETHOD_TINY
    property flags_code_size : UInt8
    def initialize(@flags_code_size : UInt8)
    end
  end

  @[Extern]
  struct IMAGE_COR_ILMETHOD_FAT
    property _bitfield : UInt32
    property code_size : UInt32
    property local_var_sig_tok : UInt32
    def initialize(@_bitfield : UInt32, @code_size : UInt32, @local_var_sig_tok : UInt32)
    end
  end

  @[Extern(union: true)]
  struct IMAGE_COR_ILMETHOD
    property tiny : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_TINY
    property fat : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_FAT
    def initialize(@tiny : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_TINY, @fat : Win32cr::System::WinRT::Metadata::IMAGE_COR_ILMETHOD_FAT)
    end
  end

  @[Extern]
  struct IMAGE_COR_VTABLEFIXUP
    property rva : UInt32
    property count : UInt16
    property type__ : UInt16
    def initialize(@rva : UInt32, @count : UInt16, @type__ : UInt16)
    end
  end

  @[Extern]
  struct COR_FIELD_OFFSET
    property ridOfField : UInt32
    property ulOffset : UInt32
    def initialize(@ridOfField : UInt32, @ulOffset : UInt32)
    end
  end

  @[Extern]
  struct COR_SECATTR
    property tkCtor : UInt32
    property pCustomAttribute : Void*
    property cbCustomAttribute : UInt32
    def initialize(@tkCtor : UInt32, @pCustomAttribute : Void*, @cbCustomAttribute : UInt32)
    end
  end

  @[Extern]
  struct OSINFO
    property dwOSPlatformId : UInt32
    property dwOSMajorVersion : UInt32
    property dwOSMinorVersion : UInt32
    def initialize(@dwOSPlatformId : UInt32, @dwOSMajorVersion : UInt32, @dwOSMinorVersion : UInt32)
    end
  end

  @[Extern]
  struct ASSEMBLYMETADATA
    property usMajorVersion : UInt16
    property usMinorVersion : UInt16
    property usBuildNumber : UInt16
    property usRevisionNumber : UInt16
    property szLocale : Win32cr::Foundation::PWSTR
    property cbLocale : UInt32
    property rProcessor : UInt32*
    property ulProcessor : UInt32
    property rOS : Win32cr::System::WinRT::Metadata::OSINFO*
    property ulOS : UInt32
    def initialize(@usMajorVersion : UInt16, @usMinorVersion : UInt16, @usBuildNumber : UInt16, @usRevisionNumber : UInt16, @szLocale : Win32cr::Foundation::PWSTR, @cbLocale : UInt32, @rProcessor : UInt32*, @ulProcessor : UInt32, @rOS : Win32cr::System::WinRT::Metadata::OSINFO*, @ulOS : UInt32)
    end
  end

  @[Extern]
  struct CVStruct
    property major : Int16
    property minor : Int16
    property sub : Int16
    property build : Int16
    def initialize(@major : Int16, @minor : Int16, @sub : Int16, @build : Int16)
    end
  end

  @[Extern(union: true)]
  struct CeeSectionRelocExtra
    property highAdj : UInt16
    def initialize(@highAdj : UInt16)
    end
  end

  @[Extern]
  struct COR_NATIVE_LINK
    property m_linkType : UInt8
    property m_flags : UInt8
    property m_entryPoint : UInt32
    def initialize(@m_linkType : UInt8, @m_flags : UInt8, @m_entryPoint : UInt32)
    end
  end

  @[Extern]

  record IMetaDataErrorVtable,
    query_interface : Proc(IMetaDataError*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataError*, UInt32),
    release : Proc(IMetaDataError*, UInt32),
    on_error : Proc(IMetaDataError*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataError, lpVtbl : IMetaDataErrorVtable* do
    GUID = LibC::GUID.new(0xb81ff171_u32, 0x20f3_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xcc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb0_u8, 0x9c_u8, 0x19_u8])
    def query_interface(this : IMetaDataError*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataError*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataError*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : IMetaDataError*, hrError : Win32cr::Foundation::HRESULT, token : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hrError, token)
    end

  end

  @[Extern]

  record IMapTokenVtable,
    query_interface : Proc(IMapToken*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMapToken*, UInt32),
    release : Proc(IMapToken*, UInt32),
    map : Proc(IMapToken*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMapToken, lpVtbl : IMapTokenVtable* do
    GUID = LibC::GUID.new(0x6a3ea8b_u32, 0x225_u16, 0x11d1_u16, StaticArray[0xbf_u8, 0x72_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x1e_u8, 0x12_u8])
    def query_interface(this : IMapToken*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMapToken*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMapToken*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def map(this : IMapToken*, tkImp : UInt32, tkEmit : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map.call(this, tkImp, tkEmit)
    end

  end

  @[Extern]

  record IMetaDataDispenserVtable,
    query_interface : Proc(IMetaDataDispenser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataDispenser*, UInt32),
    release : Proc(IMetaDataDispenser*, UInt32),
    define_scope : Proc(IMetaDataDispenser*, LibC::GUID*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    open_scope : Proc(IMetaDataDispenser*, Win32cr::Foundation::PWSTR, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    open_scope_on_memory : Proc(IMetaDataDispenser*, Void*, UInt32, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataDispenser, lpVtbl : IMetaDataDispenserVtable* do
    GUID = LibC::GUID.new(0x809c652e_u32, 0x7396_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x71_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb4_u8, 0xd5_u8, 0xc_u8])
    def query_interface(this : IMetaDataDispenser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataDispenser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataDispenser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def define_scope(this : IMetaDataDispenser*, rclsid : LibC::GUID*, dwCreateFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_scope.call(this, rclsid, dwCreateFlags, riid, ppIUnk)
    end
    def open_scope(this : IMetaDataDispenser*, szScope : Win32cr::Foundation::PWSTR, dwOpenFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope.call(this, szScope, dwOpenFlags, riid, ppIUnk)
    end
    def open_scope_on_memory(this : IMetaDataDispenser*, pData : Void*, cbData : UInt32, dwOpenFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope_on_memory.call(this, pData, cbData, dwOpenFlags, riid, ppIUnk)
    end

  end

  @[Extern]

  record IMetaDataEmitVtable,
    query_interface : Proc(IMetaDataEmit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataEmit*, UInt32),
    release : Proc(IMetaDataEmit*, UInt32),
    set_module_props : Proc(IMetaDataEmit*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    save : Proc(IMetaDataEmit*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    save_to_stream : Proc(IMetaDataEmit*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_save_size : Proc(IMetaDataEmit*, Win32cr::System::WinRT::Metadata::CorSaveSize, UInt32*, Win32cr::Foundation::HRESULT),
    define_type_def : Proc(IMetaDataEmit*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    define_nested_type : Proc(IMetaDataEmit*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_handler : Proc(IMetaDataEmit*, Void*, Win32cr::Foundation::HRESULT),
    define_method : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_method_impl : Proc(IMetaDataEmit*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    define_type_ref_by_name : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    define_import_type : Proc(IMetaDataEmit*, Void*, Void*, UInt32, Void*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    define_member_ref : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_import_member : Proc(IMetaDataEmit*, Void*, Void*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_event : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_class_layout : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, Win32cr::Foundation::HRESULT),
    delete_class_layout : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::HRESULT),
    set_field_marshal : Proc(IMetaDataEmit*, UInt32, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    delete_field_marshal : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::HRESULT),
    define_permission_set : Proc(IMetaDataEmit*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_rva : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_token_from_sig : Proc(IMetaDataEmit*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_module_ref : Proc(IMetaDataEmit*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    set_parent : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_token_from_type_spec : Proc(IMetaDataEmit*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(IMetaDataEmit*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_user_string : Proc(IMetaDataEmit*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    delete_token : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::HRESULT),
    set_method_props : Proc(IMetaDataEmit*, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_type_def_props : Proc(IMetaDataEmit*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_props : Proc(IMetaDataEmit*, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_permission_set_props : Proc(IMetaDataEmit*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_pinvoke_map : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_pinvoke_map : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    delete_pinvoke_map : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::HRESULT),
    define_custom_attribute : Proc(IMetaDataEmit*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_custom_attribute_value : Proc(IMetaDataEmit*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_field : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_property : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    define_param : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_field_props : Proc(IMetaDataEmit*, UInt32, UInt32, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_property_props : Proc(IMetaDataEmit*, UInt32, UInt32, UInt32, Void*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_param_props : Proc(IMetaDataEmit*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_security_attribute_set : Proc(IMetaDataEmit*, UInt32, Win32cr::System::WinRT::Metadata::COR_SECATTR*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    apply_edit_and_continue : Proc(IMetaDataEmit*, Void*, Win32cr::Foundation::HRESULT),
    translate_sig_with_scope : Proc(IMetaDataEmit*, Void*, Void*, UInt32, Void*, UInt8*, UInt32, Void*, Void*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_method_impl_flags : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_field_rva : Proc(IMetaDataEmit*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    merge : Proc(IMetaDataEmit*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    merge_end : Proc(IMetaDataEmit*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataEmit, lpVtbl : IMetaDataEmitVtable* do
    GUID = LibC::GUID.new(0xba3fee4c_u32, 0xecb9_u16, 0x4e41_u16, StaticArray[0x83_u8, 0xb7_u8, 0x18_u8, 0x3f_u8, 0xa4_u8, 0x1c_u8, 0xd8_u8, 0x59_u8])
    def query_interface(this : IMetaDataEmit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataEmit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataEmit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_module_props(this : IMetaDataEmit*, szName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_module_props.call(this, szName)
    end
    def save(this : IMetaDataEmit*, szFile : Win32cr::Foundation::PWSTR, dwSaveFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, szFile, dwSaveFlags)
    end
    def save_to_stream(this : IMetaDataEmit*, pIStream : Void*, dwSaveFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_stream.call(this, pIStream, dwSaveFlags)
    end
    def get_save_size(this : IMetaDataEmit*, fSave : Win32cr::System::WinRT::Metadata::CorSaveSize, pdwSaveSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_size.call(this, fSave, pdwSaveSize)
    end
    def define_type_def(this : IMetaDataEmit*, szTypeDef : Win32cr::Foundation::PWSTR, dwTypeDefFlags : UInt32, tkExtends : UInt32, rtkImplements : UInt32*, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_type_def.call(this, szTypeDef, dwTypeDefFlags, tkExtends, rtkImplements, ptd)
    end
    def define_nested_type(this : IMetaDataEmit*, szTypeDef : Win32cr::Foundation::PWSTR, dwTypeDefFlags : UInt32, tkExtends : UInt32, rtkImplements : UInt32*, tdEncloser : UInt32, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_nested_type.call(this, szTypeDef, dwTypeDefFlags, tkExtends, rtkImplements, tdEncloser, ptd)
    end
    def set_handler(this : IMetaDataEmit*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_handler.call(this, pUnk)
    end
    def define_method(this : IMetaDataEmit*, td : UInt32, szName : Win32cr::Foundation::PWSTR, dwMethodFlags : UInt32, pvSigBlob : UInt8*, cbSigBlob : UInt32, ulCodeRVA : UInt32, dwImplFlags : UInt32, pmd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_method.call(this, td, szName, dwMethodFlags, pvSigBlob, cbSigBlob, ulCodeRVA, dwImplFlags, pmd)
    end
    def define_method_impl(this : IMetaDataEmit*, td : UInt32, tkBody : UInt32, tkDecl : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_method_impl.call(this, td, tkBody, tkDecl)
    end
    def define_type_ref_by_name(this : IMetaDataEmit*, tkResolutionScope : UInt32, szName : Win32cr::Foundation::PWSTR, ptr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_type_ref_by_name.call(this, tkResolutionScope, szName, ptr)
    end
    def define_import_type(this : IMetaDataEmit*, pAssemImport : Void*, pbHashValue : Void*, cbHashValue : UInt32, pImport : Void*, tdImport : UInt32, pAssemEmit : Void*, ptr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_import_type.call(this, pAssemImport, pbHashValue, cbHashValue, pImport, tdImport, pAssemEmit, ptr)
    end
    def define_member_ref(this : IMetaDataEmit*, tkImport : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_member_ref.call(this, tkImport, szName, pvSigBlob, cbSigBlob, pmr)
    end
    def define_import_member(this : IMetaDataEmit*, pAssemImport : Void*, pbHashValue : Void*, cbHashValue : UInt32, pImport : Void*, mbMember : UInt32, pAssemEmit : Void*, tkParent : UInt32, pmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_import_member.call(this, pAssemImport, pbHashValue, cbHashValue, pImport, mbMember, pAssemEmit, tkParent, pmr)
    end
    def define_event(this : IMetaDataEmit*, td : UInt32, szEvent : Win32cr::Foundation::PWSTR, dwEventFlags : UInt32, tkEventType : UInt32, mdAddOn : UInt32, mdRemoveOn : UInt32, mdFire : UInt32, rmdOtherMethods : UInt32*, pmdEvent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_event.call(this, td, szEvent, dwEventFlags, tkEventType, mdAddOn, mdRemoveOn, mdFire, rmdOtherMethods, pmdEvent)
    end
    def set_class_layout(this : IMetaDataEmit*, td : UInt32, dwPackSize : UInt32, rFieldOffsets : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, ulClassSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_class_layout.call(this, td, dwPackSize, rFieldOffsets, ulClassSize)
    end
    def delete_class_layout(this : IMetaDataEmit*, td : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_class_layout.call(this, td)
    end
    def set_field_marshal(this : IMetaDataEmit*, tk : UInt32, pvNativeType : UInt8*, cbNativeType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_field_marshal.call(this, tk, pvNativeType, cbNativeType)
    end
    def delete_field_marshal(this : IMetaDataEmit*, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_field_marshal.call(this, tk)
    end
    def define_permission_set(this : IMetaDataEmit*, tk : UInt32, dwAction : UInt32, pvPermission : Void*, cbPermission : UInt32, ppm : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_permission_set.call(this, tk, dwAction, pvPermission, cbPermission, ppm)
    end
    def set_rva(this : IMetaDataEmit*, md : UInt32, ulRVA : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rva.call(this, md, ulRVA)
    end
    def get_token_from_sig(this : IMetaDataEmit*, pvSig : UInt8*, cbSig : UInt32, pmsig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_from_sig.call(this, pvSig, cbSig, pmsig)
    end
    def define_module_ref(this : IMetaDataEmit*, szName : Win32cr::Foundation::PWSTR, pmur : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_module_ref.call(this, szName, pmur)
    end
    def set_parent(this : IMetaDataEmit*, mr : UInt32, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parent.call(this, mr, tk)
    end
    def get_token_from_type_spec(this : IMetaDataEmit*, pvSig : UInt8*, cbSig : UInt32, ptypespec : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_from_type_spec.call(this, pvSig, cbSig, ptypespec)
    end
    def save_to_memory(this : IMetaDataEmit*, pbData : Void*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, pbData, cbData)
    end
    def define_user_string(this : IMetaDataEmit*, szString : Win32cr::Foundation::PWSTR, cchString : UInt32, pstk : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_user_string.call(this, szString, cchString, pstk)
    end
    def delete_token(this : IMetaDataEmit*, tkObj : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_token.call(this, tkObj)
    end
    def set_method_props(this : IMetaDataEmit*, md : UInt32, dwMethodFlags : UInt32, ulCodeRVA : UInt32, dwImplFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_method_props.call(this, md, dwMethodFlags, ulCodeRVA, dwImplFlags)
    end
    def set_type_def_props(this : IMetaDataEmit*, td : UInt32, dwTypeDefFlags : UInt32, tkExtends : UInt32, rtkImplements : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_type_def_props.call(this, td, dwTypeDefFlags, tkExtends, rtkImplements)
    end
    def set_event_props(this : IMetaDataEmit*, ev : UInt32, dwEventFlags : UInt32, tkEventType : UInt32, mdAddOn : UInt32, mdRemoveOn : UInt32, mdFire : UInt32, rmdOtherMethods : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_props.call(this, ev, dwEventFlags, tkEventType, mdAddOn, mdRemoveOn, mdFire, rmdOtherMethods)
    end
    def set_permission_set_props(this : IMetaDataEmit*, tk : UInt32, dwAction : UInt32, pvPermission : Void*, cbPermission : UInt32, ppm : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_permission_set_props.call(this, tk, dwAction, pvPermission, cbPermission, ppm)
    end
    def define_pinvoke_map(this : IMetaDataEmit*, tk : UInt32, dwMappingFlags : UInt32, szImportName : Win32cr::Foundation::PWSTR, mrImportDLL : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_pinvoke_map.call(this, tk, dwMappingFlags, szImportName, mrImportDLL)
    end
    def set_pinvoke_map(this : IMetaDataEmit*, tk : UInt32, dwMappingFlags : UInt32, szImportName : Win32cr::Foundation::PWSTR, mrImportDLL : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pinvoke_map.call(this, tk, dwMappingFlags, szImportName, mrImportDLL)
    end
    def delete_pinvoke_map(this : IMetaDataEmit*, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_pinvoke_map.call(this, tk)
    end
    def define_custom_attribute(this : IMetaDataEmit*, tkOwner : UInt32, tkCtor : UInt32, pCustomAttribute : Void*, cbCustomAttribute : UInt32, pcv : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_custom_attribute.call(this, tkOwner, tkCtor, pCustomAttribute, cbCustomAttribute, pcv)
    end
    def set_custom_attribute_value(this : IMetaDataEmit*, pcv : UInt32, pCustomAttribute : Void*, cbCustomAttribute : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_custom_attribute_value.call(this, pcv, pCustomAttribute, cbCustomAttribute)
    end
    def define_field(this : IMetaDataEmit*, td : UInt32, szName : Win32cr::Foundation::PWSTR, dwFieldFlags : UInt32, pvSigBlob : UInt8*, cbSigBlob : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, pmd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_field.call(this, td, szName, dwFieldFlags, pvSigBlob, cbSigBlob, dwCPlusTypeFlag, pValue, cchValue, pmd)
    end
    def define_property(this : IMetaDataEmit*, td : UInt32, szProperty : Win32cr::Foundation::PWSTR, dwPropFlags : UInt32, pvSig : UInt8*, cbSig : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, mdSetter : UInt32, mdGetter : UInt32, rmdOtherMethods : UInt32*, pmdProp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_property.call(this, td, szProperty, dwPropFlags, pvSig, cbSig, dwCPlusTypeFlag, pValue, cchValue, mdSetter, mdGetter, rmdOtherMethods, pmdProp)
    end
    def define_param(this : IMetaDataEmit*, md : UInt32, ulParamSeq : UInt32, szName : Win32cr::Foundation::PWSTR, dwParamFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, ppd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_param.call(this, md, ulParamSeq, szName, dwParamFlags, dwCPlusTypeFlag, pValue, cchValue, ppd)
    end
    def set_field_props(this : IMetaDataEmit*, fd : UInt32, dwFieldFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_field_props.call(this, fd, dwFieldFlags, dwCPlusTypeFlag, pValue, cchValue)
    end
    def set_property_props(this : IMetaDataEmit*, pr : UInt32, dwPropFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, mdSetter : UInt32, mdGetter : UInt32, rmdOtherMethods : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_props.call(this, pr, dwPropFlags, dwCPlusTypeFlag, pValue, cchValue, mdSetter, mdGetter, rmdOtherMethods)
    end
    def set_param_props(this : IMetaDataEmit*, pd : UInt32, szName : Win32cr::Foundation::PWSTR, dwParamFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_param_props.call(this, pd, szName, dwParamFlags, dwCPlusTypeFlag, pValue, cchValue)
    end
    def define_security_attribute_set(this : IMetaDataEmit*, tkObj : UInt32, rSecAttrs : Win32cr::System::WinRT::Metadata::COR_SECATTR*, cSecAttrs : UInt32, pulErrorAttr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_security_attribute_set.call(this, tkObj, rSecAttrs, cSecAttrs, pulErrorAttr)
    end
    def apply_edit_and_continue(this : IMetaDataEmit*, pImport : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_edit_and_continue.call(this, pImport)
    end
    def translate_sig_with_scope(this : IMetaDataEmit*, pAssemImport : Void*, pbHashValue : Void*, cbHashValue : UInt32, import : Void*, pbSigBlob : UInt8*, cbSigBlob : UInt32, pAssemEmit : Void*, emit : Void*, pvTranslatedSig : UInt8*, cbTranslatedSigMax : UInt32, pcbTranslatedSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.translate_sig_with_scope.call(this, pAssemImport, pbHashValue, cbHashValue, import, pbSigBlob, cbSigBlob, pAssemEmit, emit, pvTranslatedSig, cbTranslatedSigMax, pcbTranslatedSig)
    end
    def set_method_impl_flags(this : IMetaDataEmit*, md : UInt32, dwImplFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_method_impl_flags.call(this, md, dwImplFlags)
    end
    def set_field_rva(this : IMetaDataEmit*, fd : UInt32, ulRVA : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_field_rva.call(this, fd, ulRVA)
    end
    def merge(this : IMetaDataEmit*, pImport : Void*, pHostMapToken : Void*, pHandler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge.call(this, pImport, pHostMapToken, pHandler)
    end
    def merge_end(this : IMetaDataEmit*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge_end.call(this)
    end

  end

  @[Extern]

  record IMetaDataEmit2Vtable,
    query_interface : Proc(IMetaDataEmit2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataEmit2*, UInt32),
    release : Proc(IMetaDataEmit2*, UInt32),
    set_module_props : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    save : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    save_to_stream : Proc(IMetaDataEmit2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_save_size : Proc(IMetaDataEmit2*, Win32cr::System::WinRT::Metadata::CorSaveSize, UInt32*, Win32cr::Foundation::HRESULT),
    define_type_def : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    define_nested_type : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_handler : Proc(IMetaDataEmit2*, Void*, Win32cr::Foundation::HRESULT),
    define_method : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_method_impl : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    define_type_ref_by_name : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    define_import_type : Proc(IMetaDataEmit2*, Void*, Void*, UInt32, Void*, UInt32, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    define_member_ref : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_import_member : Proc(IMetaDataEmit2*, Void*, Void*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_event : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_class_layout : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, Win32cr::Foundation::HRESULT),
    delete_class_layout : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::HRESULT),
    set_field_marshal : Proc(IMetaDataEmit2*, UInt32, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    delete_field_marshal : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::HRESULT),
    define_permission_set : Proc(IMetaDataEmit2*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_rva : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_token_from_sig : Proc(IMetaDataEmit2*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_module_ref : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    set_parent : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_token_from_type_spec : Proc(IMetaDataEmit2*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    save_to_memory : Proc(IMetaDataEmit2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_user_string : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    delete_token : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::HRESULT),
    set_method_props : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_type_def_props : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_props : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_permission_set_props : Proc(IMetaDataEmit2*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_pinvoke_map : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    set_pinvoke_map : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    delete_pinvoke_map : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::HRESULT),
    define_custom_attribute : Proc(IMetaDataEmit2*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_custom_attribute_value : Proc(IMetaDataEmit2*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_field : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_property : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, UInt32, Void*, UInt32, UInt32, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    define_param : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_field_props : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_property_props : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, Void*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_param_props : Proc(IMetaDataEmit2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_security_attribute_set : Proc(IMetaDataEmit2*, UInt32, Win32cr::System::WinRT::Metadata::COR_SECATTR*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    apply_edit_and_continue : Proc(IMetaDataEmit2*, Void*, Win32cr::Foundation::HRESULT),
    translate_sig_with_scope : Proc(IMetaDataEmit2*, Void*, Void*, UInt32, Void*, UInt8*, UInt32, Void*, Void*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_method_impl_flags : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_field_rva : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    merge : Proc(IMetaDataEmit2*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    merge_end : Proc(IMetaDataEmit2*, Win32cr::Foundation::HRESULT),
    define_method_spec : Proc(IMetaDataEmit2*, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_delta_save_size : Proc(IMetaDataEmit2*, Win32cr::System::WinRT::Metadata::CorSaveSize, UInt32*, Win32cr::Foundation::HRESULT),
    save_delta : Proc(IMetaDataEmit2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    save_delta_to_stream : Proc(IMetaDataEmit2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    save_delta_to_memory : Proc(IMetaDataEmit2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    define_generic_param : Proc(IMetaDataEmit2*, UInt32, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_generic_param_props : Proc(IMetaDataEmit2*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    reset_enc_log : Proc(IMetaDataEmit2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataEmit2, lpVtbl : IMetaDataEmit2Vtable* do
    GUID = LibC::GUID.new(0xf5dd9950_u32, 0xf693_u16, 0x42e6_u16, StaticArray[0x83_u8, 0xe_u8, 0x7b_u8, 0x83_u8, 0x3e_u8, 0x81_u8, 0x46_u8, 0xa9_u8])
    def query_interface(this : IMetaDataEmit2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataEmit2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataEmit2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_module_props(this : IMetaDataEmit2*, szName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_module_props.call(this, szName)
    end
    def save(this : IMetaDataEmit2*, szFile : Win32cr::Foundation::PWSTR, dwSaveFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, szFile, dwSaveFlags)
    end
    def save_to_stream(this : IMetaDataEmit2*, pIStream : Void*, dwSaveFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_stream.call(this, pIStream, dwSaveFlags)
    end
    def get_save_size(this : IMetaDataEmit2*, fSave : Win32cr::System::WinRT::Metadata::CorSaveSize, pdwSaveSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_size.call(this, fSave, pdwSaveSize)
    end
    def define_type_def(this : IMetaDataEmit2*, szTypeDef : Win32cr::Foundation::PWSTR, dwTypeDefFlags : UInt32, tkExtends : UInt32, rtkImplements : UInt32*, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_type_def.call(this, szTypeDef, dwTypeDefFlags, tkExtends, rtkImplements, ptd)
    end
    def define_nested_type(this : IMetaDataEmit2*, szTypeDef : Win32cr::Foundation::PWSTR, dwTypeDefFlags : UInt32, tkExtends : UInt32, rtkImplements : UInt32*, tdEncloser : UInt32, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_nested_type.call(this, szTypeDef, dwTypeDefFlags, tkExtends, rtkImplements, tdEncloser, ptd)
    end
    def set_handler(this : IMetaDataEmit2*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_handler.call(this, pUnk)
    end
    def define_method(this : IMetaDataEmit2*, td : UInt32, szName : Win32cr::Foundation::PWSTR, dwMethodFlags : UInt32, pvSigBlob : UInt8*, cbSigBlob : UInt32, ulCodeRVA : UInt32, dwImplFlags : UInt32, pmd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_method.call(this, td, szName, dwMethodFlags, pvSigBlob, cbSigBlob, ulCodeRVA, dwImplFlags, pmd)
    end
    def define_method_impl(this : IMetaDataEmit2*, td : UInt32, tkBody : UInt32, tkDecl : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_method_impl.call(this, td, tkBody, tkDecl)
    end
    def define_type_ref_by_name(this : IMetaDataEmit2*, tkResolutionScope : UInt32, szName : Win32cr::Foundation::PWSTR, ptr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_type_ref_by_name.call(this, tkResolutionScope, szName, ptr)
    end
    def define_import_type(this : IMetaDataEmit2*, pAssemImport : Void*, pbHashValue : Void*, cbHashValue : UInt32, pImport : Void*, tdImport : UInt32, pAssemEmit : Void*, ptr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_import_type.call(this, pAssemImport, pbHashValue, cbHashValue, pImport, tdImport, pAssemEmit, ptr)
    end
    def define_member_ref(this : IMetaDataEmit2*, tkImport : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_member_ref.call(this, tkImport, szName, pvSigBlob, cbSigBlob, pmr)
    end
    def define_import_member(this : IMetaDataEmit2*, pAssemImport : Void*, pbHashValue : Void*, cbHashValue : UInt32, pImport : Void*, mbMember : UInt32, pAssemEmit : Void*, tkParent : UInt32, pmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_import_member.call(this, pAssemImport, pbHashValue, cbHashValue, pImport, mbMember, pAssemEmit, tkParent, pmr)
    end
    def define_event(this : IMetaDataEmit2*, td : UInt32, szEvent : Win32cr::Foundation::PWSTR, dwEventFlags : UInt32, tkEventType : UInt32, mdAddOn : UInt32, mdRemoveOn : UInt32, mdFire : UInt32, rmdOtherMethods : UInt32*, pmdEvent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_event.call(this, td, szEvent, dwEventFlags, tkEventType, mdAddOn, mdRemoveOn, mdFire, rmdOtherMethods, pmdEvent)
    end
    def set_class_layout(this : IMetaDataEmit2*, td : UInt32, dwPackSize : UInt32, rFieldOffsets : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, ulClassSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_class_layout.call(this, td, dwPackSize, rFieldOffsets, ulClassSize)
    end
    def delete_class_layout(this : IMetaDataEmit2*, td : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_class_layout.call(this, td)
    end
    def set_field_marshal(this : IMetaDataEmit2*, tk : UInt32, pvNativeType : UInt8*, cbNativeType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_field_marshal.call(this, tk, pvNativeType, cbNativeType)
    end
    def delete_field_marshal(this : IMetaDataEmit2*, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_field_marshal.call(this, tk)
    end
    def define_permission_set(this : IMetaDataEmit2*, tk : UInt32, dwAction : UInt32, pvPermission : Void*, cbPermission : UInt32, ppm : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_permission_set.call(this, tk, dwAction, pvPermission, cbPermission, ppm)
    end
    def set_rva(this : IMetaDataEmit2*, md : UInt32, ulRVA : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rva.call(this, md, ulRVA)
    end
    def get_token_from_sig(this : IMetaDataEmit2*, pvSig : UInt8*, cbSig : UInt32, pmsig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_from_sig.call(this, pvSig, cbSig, pmsig)
    end
    def define_module_ref(this : IMetaDataEmit2*, szName : Win32cr::Foundation::PWSTR, pmur : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_module_ref.call(this, szName, pmur)
    end
    def set_parent(this : IMetaDataEmit2*, mr : UInt32, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parent.call(this, mr, tk)
    end
    def get_token_from_type_spec(this : IMetaDataEmit2*, pvSig : UInt8*, cbSig : UInt32, ptypespec : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_from_type_spec.call(this, pvSig, cbSig, ptypespec)
    end
    def save_to_memory(this : IMetaDataEmit2*, pbData : Void*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_memory.call(this, pbData, cbData)
    end
    def define_user_string(this : IMetaDataEmit2*, szString : Win32cr::Foundation::PWSTR, cchString : UInt32, pstk : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_user_string.call(this, szString, cchString, pstk)
    end
    def delete_token(this : IMetaDataEmit2*, tkObj : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_token.call(this, tkObj)
    end
    def set_method_props(this : IMetaDataEmit2*, md : UInt32, dwMethodFlags : UInt32, ulCodeRVA : UInt32, dwImplFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_method_props.call(this, md, dwMethodFlags, ulCodeRVA, dwImplFlags)
    end
    def set_type_def_props(this : IMetaDataEmit2*, td : UInt32, dwTypeDefFlags : UInt32, tkExtends : UInt32, rtkImplements : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_type_def_props.call(this, td, dwTypeDefFlags, tkExtends, rtkImplements)
    end
    def set_event_props(this : IMetaDataEmit2*, ev : UInt32, dwEventFlags : UInt32, tkEventType : UInt32, mdAddOn : UInt32, mdRemoveOn : UInt32, mdFire : UInt32, rmdOtherMethods : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_props.call(this, ev, dwEventFlags, tkEventType, mdAddOn, mdRemoveOn, mdFire, rmdOtherMethods)
    end
    def set_permission_set_props(this : IMetaDataEmit2*, tk : UInt32, dwAction : UInt32, pvPermission : Void*, cbPermission : UInt32, ppm : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_permission_set_props.call(this, tk, dwAction, pvPermission, cbPermission, ppm)
    end
    def define_pinvoke_map(this : IMetaDataEmit2*, tk : UInt32, dwMappingFlags : UInt32, szImportName : Win32cr::Foundation::PWSTR, mrImportDLL : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_pinvoke_map.call(this, tk, dwMappingFlags, szImportName, mrImportDLL)
    end
    def set_pinvoke_map(this : IMetaDataEmit2*, tk : UInt32, dwMappingFlags : UInt32, szImportName : Win32cr::Foundation::PWSTR, mrImportDLL : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_pinvoke_map.call(this, tk, dwMappingFlags, szImportName, mrImportDLL)
    end
    def delete_pinvoke_map(this : IMetaDataEmit2*, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_pinvoke_map.call(this, tk)
    end
    def define_custom_attribute(this : IMetaDataEmit2*, tkOwner : UInt32, tkCtor : UInt32, pCustomAttribute : Void*, cbCustomAttribute : UInt32, pcv : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_custom_attribute.call(this, tkOwner, tkCtor, pCustomAttribute, cbCustomAttribute, pcv)
    end
    def set_custom_attribute_value(this : IMetaDataEmit2*, pcv : UInt32, pCustomAttribute : Void*, cbCustomAttribute : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_custom_attribute_value.call(this, pcv, pCustomAttribute, cbCustomAttribute)
    end
    def define_field(this : IMetaDataEmit2*, td : UInt32, szName : Win32cr::Foundation::PWSTR, dwFieldFlags : UInt32, pvSigBlob : UInt8*, cbSigBlob : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, pmd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_field.call(this, td, szName, dwFieldFlags, pvSigBlob, cbSigBlob, dwCPlusTypeFlag, pValue, cchValue, pmd)
    end
    def define_property(this : IMetaDataEmit2*, td : UInt32, szProperty : Win32cr::Foundation::PWSTR, dwPropFlags : UInt32, pvSig : UInt8*, cbSig : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, mdSetter : UInt32, mdGetter : UInt32, rmdOtherMethods : UInt32*, pmdProp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_property.call(this, td, szProperty, dwPropFlags, pvSig, cbSig, dwCPlusTypeFlag, pValue, cchValue, mdSetter, mdGetter, rmdOtherMethods, pmdProp)
    end
    def define_param(this : IMetaDataEmit2*, md : UInt32, ulParamSeq : UInt32, szName : Win32cr::Foundation::PWSTR, dwParamFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, ppd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_param.call(this, md, ulParamSeq, szName, dwParamFlags, dwCPlusTypeFlag, pValue, cchValue, ppd)
    end
    def set_field_props(this : IMetaDataEmit2*, fd : UInt32, dwFieldFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_field_props.call(this, fd, dwFieldFlags, dwCPlusTypeFlag, pValue, cchValue)
    end
    def set_property_props(this : IMetaDataEmit2*, pr : UInt32, dwPropFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32, mdSetter : UInt32, mdGetter : UInt32, rmdOtherMethods : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property_props.call(this, pr, dwPropFlags, dwCPlusTypeFlag, pValue, cchValue, mdSetter, mdGetter, rmdOtherMethods)
    end
    def set_param_props(this : IMetaDataEmit2*, pd : UInt32, szName : Win32cr::Foundation::PWSTR, dwParamFlags : UInt32, dwCPlusTypeFlag : UInt32, pValue : Void*, cchValue : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_param_props.call(this, pd, szName, dwParamFlags, dwCPlusTypeFlag, pValue, cchValue)
    end
    def define_security_attribute_set(this : IMetaDataEmit2*, tkObj : UInt32, rSecAttrs : Win32cr::System::WinRT::Metadata::COR_SECATTR*, cSecAttrs : UInt32, pulErrorAttr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_security_attribute_set.call(this, tkObj, rSecAttrs, cSecAttrs, pulErrorAttr)
    end
    def apply_edit_and_continue(this : IMetaDataEmit2*, pImport : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_edit_and_continue.call(this, pImport)
    end
    def translate_sig_with_scope(this : IMetaDataEmit2*, pAssemImport : Void*, pbHashValue : Void*, cbHashValue : UInt32, import : Void*, pbSigBlob : UInt8*, cbSigBlob : UInt32, pAssemEmit : Void*, emit : Void*, pvTranslatedSig : UInt8*, cbTranslatedSigMax : UInt32, pcbTranslatedSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.translate_sig_with_scope.call(this, pAssemImport, pbHashValue, cbHashValue, import, pbSigBlob, cbSigBlob, pAssemEmit, emit, pvTranslatedSig, cbTranslatedSigMax, pcbTranslatedSig)
    end
    def set_method_impl_flags(this : IMetaDataEmit2*, md : UInt32, dwImplFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_method_impl_flags.call(this, md, dwImplFlags)
    end
    def set_field_rva(this : IMetaDataEmit2*, fd : UInt32, ulRVA : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_field_rva.call(this, fd, ulRVA)
    end
    def merge(this : IMetaDataEmit2*, pImport : Void*, pHostMapToken : Void*, pHandler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge.call(this, pImport, pHostMapToken, pHandler)
    end
    def merge_end(this : IMetaDataEmit2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge_end.call(this)
    end
    def define_method_spec(this : IMetaDataEmit2*, tkParent : UInt32, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmi : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_method_spec.call(this, tkParent, pvSigBlob, cbSigBlob, pmi)
    end
    def get_delta_save_size(this : IMetaDataEmit2*, fSave : Win32cr::System::WinRT::Metadata::CorSaveSize, pdwSaveSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_delta_save_size.call(this, fSave, pdwSaveSize)
    end
    def save_delta(this : IMetaDataEmit2*, szFile : Win32cr::Foundation::PWSTR, dwSaveFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_delta.call(this, szFile, dwSaveFlags)
    end
    def save_delta_to_stream(this : IMetaDataEmit2*, pIStream : Void*, dwSaveFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_delta_to_stream.call(this, pIStream, dwSaveFlags)
    end
    def save_delta_to_memory(this : IMetaDataEmit2*, pbData : Void*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_delta_to_memory.call(this, pbData, cbData)
    end
    def define_generic_param(this : IMetaDataEmit2*, tk : UInt32, ulParamSeq : UInt32, dwParamFlags : UInt32, szname : Win32cr::Foundation::PWSTR, reserved : UInt32, rtkConstraints : UInt32*, pgp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_generic_param.call(this, tk, ulParamSeq, dwParamFlags, szname, reserved, rtkConstraints, pgp)
    end
    def set_generic_param_props(this : IMetaDataEmit2*, gp : UInt32, dwParamFlags : UInt32, szName : Win32cr::Foundation::PWSTR, reserved : UInt32, rtkConstraints : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_generic_param_props.call(this, gp, dwParamFlags, szName, reserved, rtkConstraints)
    end
    def reset_enc_log(this : IMetaDataEmit2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_enc_log.call(this)
    end

  end

  @[Extern]

  record IMetaDataImportVtable,
    query_interface : Proc(IMetaDataImport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataImport*, UInt32),
    release : Proc(IMetaDataImport*, UInt32),
    close_enum : Proc(IMetaDataImport*, Void*, Void),
    count_enum : Proc(IMetaDataImport*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    reset_enum : Proc(IMetaDataImport*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    enum_type_defs : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_interface_impls : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_type_refs : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_type_def_by_name : Proc(IMetaDataImport*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_scope_props : Proc(IMetaDataImport*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_module_from_scope : Proc(IMetaDataImport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_def_props : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_interface_impl_props : Proc(IMetaDataImport*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_ref_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    resolve_type_ref : Proc(IMetaDataImport*, UInt32, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_members : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_members_with_name : Proc(IMetaDataImport*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_methods : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_methods_with_name : Proc(IMetaDataImport*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_fields : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_fields_with_name : Proc(IMetaDataImport*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_params : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_member_refs : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_method_impls : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_permission_sets : Proc(IMetaDataImport*, Void**, UInt32, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_member : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_method : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_field : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_member_ref : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_member_ref_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_properties : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_events : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_method_semantics : Proc(IMetaDataImport*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_semantics : Proc(IMetaDataImport*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_field_marshal : Proc(IMetaDataImport*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_rva : Proc(IMetaDataImport*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_permission_set_props : Proc(IMetaDataImport*, UInt32, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_sig_from_token : Proc(IMetaDataImport*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_ref_props : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_module_refs : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_spec_from_token : Proc(IMetaDataImport*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_name_from_token : Proc(IMetaDataImport*, UInt32, Int8**, Win32cr::Foundation::HRESULT),
    enum_unresolved_methods : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_user_string : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_pinvoke_map : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_signatures : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_type_specs : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_user_strings : Proc(IMetaDataImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_param_for_method_index : Proc(IMetaDataImport*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_custom_attributes : Proc(IMetaDataImport*, Void**, UInt32, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_custom_attribute_props : Proc(IMetaDataImport*, UInt32, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    find_type_ref : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_member_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_field_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, Void**, UInt32*, UInt32*, UInt32*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_param_props : Proc(IMetaDataImport*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_custom_attribute_by_name : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::PWSTR, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    is_valid_token : Proc(IMetaDataImport*, UInt32, Win32cr::Foundation::BOOL),
    get_nested_class_props : Proc(IMetaDataImport*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_native_call_conv_from_sig : Proc(IMetaDataImport*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_global : Proc(IMetaDataImport*, UInt32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataImport, lpVtbl : IMetaDataImportVtable* do
    GUID = LibC::GUID.new(0x7dac8207_u32, 0xd3ae_u16, 0x4c75_u16, StaticArray[0x9b_u8, 0x67_u8, 0x92_u8, 0x80_u8, 0x1a_u8, 0x49_u8, 0x7d_u8, 0x44_u8])
    def query_interface(this : IMetaDataImport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataImport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataImport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def close_enum(this : IMetaDataImport*, hEnum : Void*) : Void
      @lpVtbl.try &.value.close_enum.call(this, hEnum)
    end
    def count_enum(this : IMetaDataImport*, hEnum : Void*, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count_enum.call(this, hEnum, pulCount)
    end
    def reset_enum(this : IMetaDataImport*, hEnum : Void*, ulPos : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_enum.call(this, hEnum, ulPos)
    end
    def enum_type_defs(this : IMetaDataImport*, phEnum : Void**, rTypeDefs : UInt32*, cMax : UInt32, pcTypeDefs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_defs.call(this, phEnum, rTypeDefs, cMax, pcTypeDefs)
    end
    def enum_interface_impls(this : IMetaDataImport*, phEnum : Void**, td : UInt32, rImpls : UInt32*, cMax : UInt32, pcImpls : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_interface_impls.call(this, phEnum, td, rImpls, cMax, pcImpls)
    end
    def enum_type_refs(this : IMetaDataImport*, phEnum : Void**, rTypeRefs : UInt32*, cMax : UInt32, pcTypeRefs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_refs.call(this, phEnum, rTypeRefs, cMax, pcTypeRefs)
    end
    def find_type_def_by_name(this : IMetaDataImport*, szTypeDef : Win32cr::Foundation::PWSTR, tkEnclosingClass : UInt32, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_type_def_by_name.call(this, szTypeDef, tkEnclosingClass, ptd)
    end
    def get_scope_props(this : IMetaDataImport*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, pmvid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scope_props.call(this, szName, cchName, pchName, pmvid)
    end
    def get_module_from_scope(this : IMetaDataImport*, pmd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_from_scope.call(this, pmd)
    end
    def get_type_def_props(this : IMetaDataImport*, td : UInt32, szTypeDef : Win32cr::Foundation::PWSTR, cchTypeDef : UInt32, pchTypeDef : UInt32*, pdwTypeDefFlags : UInt32*, ptkExtends : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_def_props.call(this, td, szTypeDef, cchTypeDef, pchTypeDef, pdwTypeDefFlags, ptkExtends)
    end
    def get_interface_impl_props(this : IMetaDataImport*, iiImpl : UInt32, pClass : UInt32*, ptkIface : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface_impl_props.call(this, iiImpl, pClass, ptkIface)
    end
    def get_type_ref_props(this : IMetaDataImport*, tr : UInt32, ptkResolutionScope : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_ref_props.call(this, tr, ptkResolutionScope, szName, cchName, pchName)
    end
    def resolve_type_ref(this : IMetaDataImport*, tr : UInt32, riid : LibC::GUID*, ppIScope : Void**, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_type_ref.call(this, tr, riid, ppIScope, ptd)
    end
    def enum_members(this : IMetaDataImport*, phEnum : Void**, cl : UInt32, rMembers : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_members.call(this, phEnum, cl, rMembers, cMax, pcTokens)
    end
    def enum_members_with_name(this : IMetaDataImport*, phEnum : Void**, cl : UInt32, szName : Win32cr::Foundation::PWSTR, rMembers : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_members_with_name.call(this, phEnum, cl, szName, rMembers, cMax, pcTokens)
    end
    def enum_methods(this : IMetaDataImport*, phEnum : Void**, cl : UInt32, rMethods : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_methods.call(this, phEnum, cl, rMethods, cMax, pcTokens)
    end
    def enum_methods_with_name(this : IMetaDataImport*, phEnum : Void**, cl : UInt32, szName : Win32cr::Foundation::PWSTR, rMethods : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_methods_with_name.call(this, phEnum, cl, szName, rMethods, cMax, pcTokens)
    end
    def enum_fields(this : IMetaDataImport*, phEnum : Void**, cl : UInt32, rFields : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_fields.call(this, phEnum, cl, rFields, cMax, pcTokens)
    end
    def enum_fields_with_name(this : IMetaDataImport*, phEnum : Void**, cl : UInt32, szName : Win32cr::Foundation::PWSTR, rFields : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_fields_with_name.call(this, phEnum, cl, szName, rFields, cMax, pcTokens)
    end
    def enum_params(this : IMetaDataImport*, phEnum : Void**, mb : UInt32, rParams : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_params.call(this, phEnum, mb, rParams, cMax, pcTokens)
    end
    def enum_member_refs(this : IMetaDataImport*, phEnum : Void**, tkParent : UInt32, rMemberRefs : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_member_refs.call(this, phEnum, tkParent, rMemberRefs, cMax, pcTokens)
    end
    def enum_method_impls(this : IMetaDataImport*, phEnum : Void**, td : UInt32, rMethodBody : UInt32*, rMethodDecl : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_method_impls.call(this, phEnum, td, rMethodBody, rMethodDecl, cMax, pcTokens)
    end
    def enum_permission_sets(this : IMetaDataImport*, phEnum : Void**, tk : UInt32, dwActions : UInt32, rPermission : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_permission_sets.call(this, phEnum, tk, dwActions, rPermission, cMax, pcTokens)
    end
    def find_member(this : IMetaDataImport*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_member.call(this, td, szName, pvSigBlob, cbSigBlob, pmb)
    end
    def find_method(this : IMetaDataImport*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_method.call(this, td, szName, pvSigBlob, cbSigBlob, pmb)
    end
    def find_field(this : IMetaDataImport*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_field.call(this, td, szName, pvSigBlob, cbSigBlob, pmb)
    end
    def find_member_ref(this : IMetaDataImport*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_member_ref.call(this, td, szName, pvSigBlob, cbSigBlob, pmr)
    end
    def get_method_props(this : IMetaDataImport*, mb : UInt32, pClass : UInt32*, szMethod : Win32cr::Foundation::PWSTR, cchMethod : UInt32, pchMethod : UInt32*, pdwAttr : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*, pulCodeRVA : UInt32*, pdwImplFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_props.call(this, mb, pClass, szMethod, cchMethod, pchMethod, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags)
    end
    def get_member_ref_props(this : IMetaDataImport*, mr : UInt32, ptk : UInt32*, szMember : Win32cr::Foundation::PWSTR, cchMember : UInt32, pchMember : UInt32*, ppvSigBlob : UInt8**, pbSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_member_ref_props.call(this, mr, ptk, szMember, cchMember, pchMember, ppvSigBlob, pbSig)
    end
    def enum_properties(this : IMetaDataImport*, phEnum : Void**, td : UInt32, rProperties : UInt32*, cMax : UInt32, pcProperties : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_properties.call(this, phEnum, td, rProperties, cMax, pcProperties)
    end
    def enum_events(this : IMetaDataImport*, phEnum : Void**, td : UInt32, rEvents : UInt32*, cMax : UInt32, pcEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_events.call(this, phEnum, td, rEvents, cMax, pcEvents)
    end
    def get_event_props(this : IMetaDataImport*, ev : UInt32, pClass : UInt32*, szEvent : Win32cr::Foundation::PWSTR, cchEvent : UInt32, pchEvent : UInt32*, pdwEventFlags : UInt32*, ptkEventType : UInt32*, pmdAddOn : UInt32*, pmdRemoveOn : UInt32*, pmdFire : UInt32*, rmdOtherMethod : UInt32*, cMax : UInt32, pcOtherMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_props.call(this, ev, pClass, szEvent, cchEvent, pchEvent, pdwEventFlags, ptkEventType, pmdAddOn, pmdRemoveOn, pmdFire, rmdOtherMethod, cMax, pcOtherMethod)
    end
    def enum_method_semantics(this : IMetaDataImport*, phEnum : Void**, mb : UInt32, rEventProp : UInt32*, cMax : UInt32, pcEventProp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_method_semantics.call(this, phEnum, mb, rEventProp, cMax, pcEventProp)
    end
    def get_method_semantics(this : IMetaDataImport*, mb : UInt32, tkEventProp : UInt32, pdwSemanticsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_semantics.call(this, mb, tkEventProp, pdwSemanticsFlags)
    end
    def get_class_layout(this : IMetaDataImport*, td : UInt32, pdwPackSize : UInt32*, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cMax : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, td, pdwPackSize, rFieldOffset, cMax, pcFieldOffset, pulClassSize)
    end
    def get_field_marshal(this : IMetaDataImport*, tk : UInt32, ppvNativeType : UInt8**, pcbNativeType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_field_marshal.call(this, tk, ppvNativeType, pcbNativeType)
    end
    def get_rva(this : IMetaDataImport*, tk : UInt32, pulCodeRVA : UInt32*, pdwImplFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva.call(this, tk, pulCodeRVA, pdwImplFlags)
    end
    def get_permission_set_props(this : IMetaDataImport*, pm : UInt32, pdwAction : UInt32*, ppvPermission : Void**, pcbPermission : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_permission_set_props.call(this, pm, pdwAction, ppvPermission, pcbPermission)
    end
    def get_sig_from_token(this : IMetaDataImport*, mdSig : UInt32, ppvSig : UInt8**, pcbSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sig_from_token.call(this, mdSig, ppvSig, pcbSig)
    end
    def get_module_ref_props(this : IMetaDataImport*, mur : UInt32, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_ref_props.call(this, mur, szName, cchName, pchName)
    end
    def enum_module_refs(this : IMetaDataImport*, phEnum : Void**, rModuleRefs : UInt32*, cmax : UInt32, pcModuleRefs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_refs.call(this, phEnum, rModuleRefs, cmax, pcModuleRefs)
    end
    def get_type_spec_from_token(this : IMetaDataImport*, typespec : UInt32, ppvSig : UInt8**, pcbSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_spec_from_token.call(this, typespec, ppvSig, pcbSig)
    end
    def get_name_from_token(this : IMetaDataImport*, tk : UInt32, pszUtf8NamePtr : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name_from_token.call(this, tk, pszUtf8NamePtr)
    end
    def enum_unresolved_methods(this : IMetaDataImport*, phEnum : Void**, rMethods : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_unresolved_methods.call(this, phEnum, rMethods, cMax, pcTokens)
    end
    def get_user_string(this : IMetaDataImport*, stk : UInt32, szString : Win32cr::Foundation::PWSTR, cchString : UInt32, pchString : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_string.call(this, stk, szString, cchString, pchString)
    end
    def get_pinvoke_map(this : IMetaDataImport*, tk : UInt32, pdwMappingFlags : UInt32*, szImportName : Win32cr::Foundation::PWSTR, cchImportName : UInt32, pchImportName : UInt32*, pmrImportDLL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pinvoke_map.call(this, tk, pdwMappingFlags, szImportName, cchImportName, pchImportName, pmrImportDLL)
    end
    def enum_signatures(this : IMetaDataImport*, phEnum : Void**, rSignatures : UInt32*, cmax : UInt32, pcSignatures : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_signatures.call(this, phEnum, rSignatures, cmax, pcSignatures)
    end
    def enum_type_specs(this : IMetaDataImport*, phEnum : Void**, rTypeSpecs : UInt32*, cmax : UInt32, pcTypeSpecs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_specs.call(this, phEnum, rTypeSpecs, cmax, pcTypeSpecs)
    end
    def enum_user_strings(this : IMetaDataImport*, phEnum : Void**, rStrings : UInt32*, cmax : UInt32, pcStrings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_user_strings.call(this, phEnum, rStrings, cmax, pcStrings)
    end
    def get_param_for_method_index(this : IMetaDataImport*, md : UInt32, ulParamSeq : UInt32, ppd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param_for_method_index.call(this, md, ulParamSeq, ppd)
    end
    def enum_custom_attributes(this : IMetaDataImport*, phEnum : Void**, tk : UInt32, tkType : UInt32, rCustomAttributes : UInt32*, cMax : UInt32, pcCustomAttributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_custom_attributes.call(this, phEnum, tk, tkType, rCustomAttributes, cMax, pcCustomAttributes)
    end
    def get_custom_attribute_props(this : IMetaDataImport*, cv : UInt32, ptkObj : UInt32*, ptkType : UInt32*, ppBlob : Void**, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_attribute_props.call(this, cv, ptkObj, ptkType, ppBlob, pcbSize)
    end
    def find_type_ref(this : IMetaDataImport*, tkResolutionScope : UInt32, szName : Win32cr::Foundation::PWSTR, ptr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_type_ref.call(this, tkResolutionScope, szName, ptr)
    end
    def get_member_props(this : IMetaDataImport*, mb : UInt32, pClass : UInt32*, szMember : Win32cr::Foundation::PWSTR, cchMember : UInt32, pchMember : UInt32*, pdwAttr : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*, pulCodeRVA : UInt32*, pdwImplFlags : UInt32*, pdwCPlusTypeFlag : UInt32*, ppValue : Void**, pcchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_member_props.call(this, mb, pClass, szMember, cchMember, pchMember, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags, pdwCPlusTypeFlag, ppValue, pcchValue)
    end
    def get_field_props(this : IMetaDataImport*, mb : UInt32, pClass : UInt32*, szField : Win32cr::Foundation::PWSTR, cchField : UInt32, pchField : UInt32*, pdwAttr : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*, pdwCPlusTypeFlag : UInt32*, ppValue : Void**, pcchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_field_props.call(this, mb, pClass, szField, cchField, pchField, pdwAttr, ppvSigBlob, pcbSigBlob, pdwCPlusTypeFlag, ppValue, pcchValue)
    end
    def get_property_props(this : IMetaDataImport*, prop : UInt32, pClass : UInt32*, szProperty : Win32cr::Foundation::PWSTR, cchProperty : UInt32, pchProperty : UInt32*, pdwPropFlags : UInt32*, ppvSig : UInt8**, pbSig : UInt32*, pdwCPlusTypeFlag : UInt32*, ppDefaultValue : Void**, pcchDefaultValue : UInt32*, pmdSetter : UInt32*, pmdGetter : UInt32*, rmdOtherMethod : UInt32*, cMax : UInt32, pcOtherMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_props.call(this, prop, pClass, szProperty, cchProperty, pchProperty, pdwPropFlags, ppvSig, pbSig, pdwCPlusTypeFlag, ppDefaultValue, pcchDefaultValue, pmdSetter, pmdGetter, rmdOtherMethod, cMax, pcOtherMethod)
    end
    def get_param_props(this : IMetaDataImport*, tk : UInt32, pmd : UInt32*, pulSequence : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, pdwAttr : UInt32*, pdwCPlusTypeFlag : UInt32*, ppValue : Void**, pcchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param_props.call(this, tk, pmd, pulSequence, szName, cchName, pchName, pdwAttr, pdwCPlusTypeFlag, ppValue, pcchValue)
    end
    def get_custom_attribute_by_name(this : IMetaDataImport*, tkObj : UInt32, szName : Win32cr::Foundation::PWSTR, ppData : Void**, pcbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_attribute_by_name.call(this, tkObj, szName, ppData, pcbData)
    end
    def is_valid_token(this : IMetaDataImport*, tk : UInt32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_valid_token.call(this, tk)
    end
    def get_nested_class_props(this : IMetaDataImport*, tdNestedClass : UInt32, ptdEnclosingClass : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_nested_class_props.call(this, tdNestedClass, ptdEnclosingClass)
    end
    def get_native_call_conv_from_sig(this : IMetaDataImport*, pvSig : Void*, cbSig : UInt32, pCallConv : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_call_conv_from_sig.call(this, pvSig, cbSig, pCallConv)
    end
    def is_global(this : IMetaDataImport*, pd : UInt32, pbGlobal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_global.call(this, pd, pbGlobal)
    end

  end

  @[Extern]

  record IMetaDataImport2Vtable,
    query_interface : Proc(IMetaDataImport2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataImport2*, UInt32),
    release : Proc(IMetaDataImport2*, UInt32),
    close_enum : Proc(IMetaDataImport2*, Void*, Void),
    count_enum : Proc(IMetaDataImport2*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    reset_enum : Proc(IMetaDataImport2*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    enum_type_defs : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_interface_impls : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_type_refs : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_type_def_by_name : Proc(IMetaDataImport2*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_scope_props : Proc(IMetaDataImport2*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_module_from_scope : Proc(IMetaDataImport2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_def_props : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_interface_impl_props : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_ref_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    resolve_type_ref : Proc(IMetaDataImport2*, UInt32, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_members : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_members_with_name : Proc(IMetaDataImport2*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_methods : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_methods_with_name : Proc(IMetaDataImport2*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_fields : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_fields_with_name : Proc(IMetaDataImport2*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_params : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_member_refs : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_method_impls : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_permission_sets : Proc(IMetaDataImport2*, Void**, UInt32, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_member : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_method : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_field : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_member_ref : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_member_ref_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_properties : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_events : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_method_semantics : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_semantics : Proc(IMetaDataImport2*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_field_marshal : Proc(IMetaDataImport2*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_rva : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_permission_set_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_sig_from_token : Proc(IMetaDataImport2*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_ref_props : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_module_refs : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_spec_from_token : Proc(IMetaDataImport2*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_name_from_token : Proc(IMetaDataImport2*, UInt32, Int8**, Win32cr::Foundation::HRESULT),
    enum_unresolved_methods : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_user_string : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_pinvoke_map : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_signatures : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_type_specs : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_user_strings : Proc(IMetaDataImport2*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_param_for_method_index : Proc(IMetaDataImport2*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_custom_attributes : Proc(IMetaDataImport2*, Void**, UInt32, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_custom_attribute_props : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    find_type_ref : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_member_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_field_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt8**, UInt32*, UInt32*, Void**, UInt32*, UInt32*, UInt32*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_param_props : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_custom_attribute_by_name : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::PWSTR, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    is_valid_token : Proc(IMetaDataImport2*, UInt32, Win32cr::Foundation::BOOL),
    get_nested_class_props : Proc(IMetaDataImport2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_native_call_conv_from_sig : Proc(IMetaDataImport2*, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_global : Proc(IMetaDataImport2*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    enum_generic_params : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_generic_param_props : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_spec_props : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_generic_param_constraints : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_generic_param_constraint_props : Proc(IMetaDataImport2*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_pe_kind : Proc(IMetaDataImport2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_version_string : Proc(IMetaDataImport2*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_method_specs : Proc(IMetaDataImport2*, Void**, UInt32, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataImport2, lpVtbl : IMetaDataImport2Vtable* do
    GUID = LibC::GUID.new(0xfce5efa0_u32, 0x8bba_u16, 0x4f8e_u16, StaticArray[0xa0_u8, 0x36_u8, 0x8f_u8, 0x20_u8, 0x22_u8, 0xb0_u8, 0x84_u8, 0x66_u8])
    def query_interface(this : IMetaDataImport2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataImport2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataImport2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def close_enum(this : IMetaDataImport2*, hEnum : Void*) : Void
      @lpVtbl.try &.value.close_enum.call(this, hEnum)
    end
    def count_enum(this : IMetaDataImport2*, hEnum : Void*, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count_enum.call(this, hEnum, pulCount)
    end
    def reset_enum(this : IMetaDataImport2*, hEnum : Void*, ulPos : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_enum.call(this, hEnum, ulPos)
    end
    def enum_type_defs(this : IMetaDataImport2*, phEnum : Void**, rTypeDefs : UInt32*, cMax : UInt32, pcTypeDefs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_defs.call(this, phEnum, rTypeDefs, cMax, pcTypeDefs)
    end
    def enum_interface_impls(this : IMetaDataImport2*, phEnum : Void**, td : UInt32, rImpls : UInt32*, cMax : UInt32, pcImpls : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_interface_impls.call(this, phEnum, td, rImpls, cMax, pcImpls)
    end
    def enum_type_refs(this : IMetaDataImport2*, phEnum : Void**, rTypeRefs : UInt32*, cMax : UInt32, pcTypeRefs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_refs.call(this, phEnum, rTypeRefs, cMax, pcTypeRefs)
    end
    def find_type_def_by_name(this : IMetaDataImport2*, szTypeDef : Win32cr::Foundation::PWSTR, tkEnclosingClass : UInt32, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_type_def_by_name.call(this, szTypeDef, tkEnclosingClass, ptd)
    end
    def get_scope_props(this : IMetaDataImport2*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, pmvid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scope_props.call(this, szName, cchName, pchName, pmvid)
    end
    def get_module_from_scope(this : IMetaDataImport2*, pmd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_from_scope.call(this, pmd)
    end
    def get_type_def_props(this : IMetaDataImport2*, td : UInt32, szTypeDef : Win32cr::Foundation::PWSTR, cchTypeDef : UInt32, pchTypeDef : UInt32*, pdwTypeDefFlags : UInt32*, ptkExtends : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_def_props.call(this, td, szTypeDef, cchTypeDef, pchTypeDef, pdwTypeDefFlags, ptkExtends)
    end
    def get_interface_impl_props(this : IMetaDataImport2*, iiImpl : UInt32, pClass : UInt32*, ptkIface : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface_impl_props.call(this, iiImpl, pClass, ptkIface)
    end
    def get_type_ref_props(this : IMetaDataImport2*, tr : UInt32, ptkResolutionScope : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_ref_props.call(this, tr, ptkResolutionScope, szName, cchName, pchName)
    end
    def resolve_type_ref(this : IMetaDataImport2*, tr : UInt32, riid : LibC::GUID*, ppIScope : Void**, ptd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve_type_ref.call(this, tr, riid, ppIScope, ptd)
    end
    def enum_members(this : IMetaDataImport2*, phEnum : Void**, cl : UInt32, rMembers : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_members.call(this, phEnum, cl, rMembers, cMax, pcTokens)
    end
    def enum_members_with_name(this : IMetaDataImport2*, phEnum : Void**, cl : UInt32, szName : Win32cr::Foundation::PWSTR, rMembers : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_members_with_name.call(this, phEnum, cl, szName, rMembers, cMax, pcTokens)
    end
    def enum_methods(this : IMetaDataImport2*, phEnum : Void**, cl : UInt32, rMethods : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_methods.call(this, phEnum, cl, rMethods, cMax, pcTokens)
    end
    def enum_methods_with_name(this : IMetaDataImport2*, phEnum : Void**, cl : UInt32, szName : Win32cr::Foundation::PWSTR, rMethods : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_methods_with_name.call(this, phEnum, cl, szName, rMethods, cMax, pcTokens)
    end
    def enum_fields(this : IMetaDataImport2*, phEnum : Void**, cl : UInt32, rFields : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_fields.call(this, phEnum, cl, rFields, cMax, pcTokens)
    end
    def enum_fields_with_name(this : IMetaDataImport2*, phEnum : Void**, cl : UInt32, szName : Win32cr::Foundation::PWSTR, rFields : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_fields_with_name.call(this, phEnum, cl, szName, rFields, cMax, pcTokens)
    end
    def enum_params(this : IMetaDataImport2*, phEnum : Void**, mb : UInt32, rParams : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_params.call(this, phEnum, mb, rParams, cMax, pcTokens)
    end
    def enum_member_refs(this : IMetaDataImport2*, phEnum : Void**, tkParent : UInt32, rMemberRefs : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_member_refs.call(this, phEnum, tkParent, rMemberRefs, cMax, pcTokens)
    end
    def enum_method_impls(this : IMetaDataImport2*, phEnum : Void**, td : UInt32, rMethodBody : UInt32*, rMethodDecl : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_method_impls.call(this, phEnum, td, rMethodBody, rMethodDecl, cMax, pcTokens)
    end
    def enum_permission_sets(this : IMetaDataImport2*, phEnum : Void**, tk : UInt32, dwActions : UInt32, rPermission : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_permission_sets.call(this, phEnum, tk, dwActions, rPermission, cMax, pcTokens)
    end
    def find_member(this : IMetaDataImport2*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_member.call(this, td, szName, pvSigBlob, cbSigBlob, pmb)
    end
    def find_method(this : IMetaDataImport2*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_method.call(this, td, szName, pvSigBlob, cbSigBlob, pmb)
    end
    def find_field(this : IMetaDataImport2*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_field.call(this, td, szName, pvSigBlob, cbSigBlob, pmb)
    end
    def find_member_ref(this : IMetaDataImport2*, td : UInt32, szName : Win32cr::Foundation::PWSTR, pvSigBlob : UInt8*, cbSigBlob : UInt32, pmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_member_ref.call(this, td, szName, pvSigBlob, cbSigBlob, pmr)
    end
    def get_method_props(this : IMetaDataImport2*, mb : UInt32, pClass : UInt32*, szMethod : Win32cr::Foundation::PWSTR, cchMethod : UInt32, pchMethod : UInt32*, pdwAttr : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*, pulCodeRVA : UInt32*, pdwImplFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_props.call(this, mb, pClass, szMethod, cchMethod, pchMethod, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags)
    end
    def get_member_ref_props(this : IMetaDataImport2*, mr : UInt32, ptk : UInt32*, szMember : Win32cr::Foundation::PWSTR, cchMember : UInt32, pchMember : UInt32*, ppvSigBlob : UInt8**, pbSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_member_ref_props.call(this, mr, ptk, szMember, cchMember, pchMember, ppvSigBlob, pbSig)
    end
    def enum_properties(this : IMetaDataImport2*, phEnum : Void**, td : UInt32, rProperties : UInt32*, cMax : UInt32, pcProperties : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_properties.call(this, phEnum, td, rProperties, cMax, pcProperties)
    end
    def enum_events(this : IMetaDataImport2*, phEnum : Void**, td : UInt32, rEvents : UInt32*, cMax : UInt32, pcEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_events.call(this, phEnum, td, rEvents, cMax, pcEvents)
    end
    def get_event_props(this : IMetaDataImport2*, ev : UInt32, pClass : UInt32*, szEvent : Win32cr::Foundation::PWSTR, cchEvent : UInt32, pchEvent : UInt32*, pdwEventFlags : UInt32*, ptkEventType : UInt32*, pmdAddOn : UInt32*, pmdRemoveOn : UInt32*, pmdFire : UInt32*, rmdOtherMethod : UInt32*, cMax : UInt32, pcOtherMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_props.call(this, ev, pClass, szEvent, cchEvent, pchEvent, pdwEventFlags, ptkEventType, pmdAddOn, pmdRemoveOn, pmdFire, rmdOtherMethod, cMax, pcOtherMethod)
    end
    def enum_method_semantics(this : IMetaDataImport2*, phEnum : Void**, mb : UInt32, rEventProp : UInt32*, cMax : UInt32, pcEventProp : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_method_semantics.call(this, phEnum, mb, rEventProp, cMax, pcEventProp)
    end
    def get_method_semantics(this : IMetaDataImport2*, mb : UInt32, tkEventProp : UInt32, pdwSemanticsFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_semantics.call(this, mb, tkEventProp, pdwSemanticsFlags)
    end
    def get_class_layout(this : IMetaDataImport2*, td : UInt32, pdwPackSize : UInt32*, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cMax : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, td, pdwPackSize, rFieldOffset, cMax, pcFieldOffset, pulClassSize)
    end
    def get_field_marshal(this : IMetaDataImport2*, tk : UInt32, ppvNativeType : UInt8**, pcbNativeType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_field_marshal.call(this, tk, ppvNativeType, pcbNativeType)
    end
    def get_rva(this : IMetaDataImport2*, tk : UInt32, pulCodeRVA : UInt32*, pdwImplFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva.call(this, tk, pulCodeRVA, pdwImplFlags)
    end
    def get_permission_set_props(this : IMetaDataImport2*, pm : UInt32, pdwAction : UInt32*, ppvPermission : Void**, pcbPermission : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_permission_set_props.call(this, pm, pdwAction, ppvPermission, pcbPermission)
    end
    def get_sig_from_token(this : IMetaDataImport2*, mdSig : UInt32, ppvSig : UInt8**, pcbSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sig_from_token.call(this, mdSig, ppvSig, pcbSig)
    end
    def get_module_ref_props(this : IMetaDataImport2*, mur : UInt32, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_ref_props.call(this, mur, szName, cchName, pchName)
    end
    def enum_module_refs(this : IMetaDataImport2*, phEnum : Void**, rModuleRefs : UInt32*, cmax : UInt32, pcModuleRefs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_refs.call(this, phEnum, rModuleRefs, cmax, pcModuleRefs)
    end
    def get_type_spec_from_token(this : IMetaDataImport2*, typespec : UInt32, ppvSig : UInt8**, pcbSig : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_spec_from_token.call(this, typespec, ppvSig, pcbSig)
    end
    def get_name_from_token(this : IMetaDataImport2*, tk : UInt32, pszUtf8NamePtr : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name_from_token.call(this, tk, pszUtf8NamePtr)
    end
    def enum_unresolved_methods(this : IMetaDataImport2*, phEnum : Void**, rMethods : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_unresolved_methods.call(this, phEnum, rMethods, cMax, pcTokens)
    end
    def get_user_string(this : IMetaDataImport2*, stk : UInt32, szString : Win32cr::Foundation::PWSTR, cchString : UInt32, pchString : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_string.call(this, stk, szString, cchString, pchString)
    end
    def get_pinvoke_map(this : IMetaDataImport2*, tk : UInt32, pdwMappingFlags : UInt32*, szImportName : Win32cr::Foundation::PWSTR, cchImportName : UInt32, pchImportName : UInt32*, pmrImportDLL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pinvoke_map.call(this, tk, pdwMappingFlags, szImportName, cchImportName, pchImportName, pmrImportDLL)
    end
    def enum_signatures(this : IMetaDataImport2*, phEnum : Void**, rSignatures : UInt32*, cmax : UInt32, pcSignatures : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_signatures.call(this, phEnum, rSignatures, cmax, pcSignatures)
    end
    def enum_type_specs(this : IMetaDataImport2*, phEnum : Void**, rTypeSpecs : UInt32*, cmax : UInt32, pcTypeSpecs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_type_specs.call(this, phEnum, rTypeSpecs, cmax, pcTypeSpecs)
    end
    def enum_user_strings(this : IMetaDataImport2*, phEnum : Void**, rStrings : UInt32*, cmax : UInt32, pcStrings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_user_strings.call(this, phEnum, rStrings, cmax, pcStrings)
    end
    def get_param_for_method_index(this : IMetaDataImport2*, md : UInt32, ulParamSeq : UInt32, ppd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param_for_method_index.call(this, md, ulParamSeq, ppd)
    end
    def enum_custom_attributes(this : IMetaDataImport2*, phEnum : Void**, tk : UInt32, tkType : UInt32, rCustomAttributes : UInt32*, cMax : UInt32, pcCustomAttributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_custom_attributes.call(this, phEnum, tk, tkType, rCustomAttributes, cMax, pcCustomAttributes)
    end
    def get_custom_attribute_props(this : IMetaDataImport2*, cv : UInt32, ptkObj : UInt32*, ptkType : UInt32*, ppBlob : Void**, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_attribute_props.call(this, cv, ptkObj, ptkType, ppBlob, pcbSize)
    end
    def find_type_ref(this : IMetaDataImport2*, tkResolutionScope : UInt32, szName : Win32cr::Foundation::PWSTR, ptr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_type_ref.call(this, tkResolutionScope, szName, ptr)
    end
    def get_member_props(this : IMetaDataImport2*, mb : UInt32, pClass : UInt32*, szMember : Win32cr::Foundation::PWSTR, cchMember : UInt32, pchMember : UInt32*, pdwAttr : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*, pulCodeRVA : UInt32*, pdwImplFlags : UInt32*, pdwCPlusTypeFlag : UInt32*, ppValue : Void**, pcchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_member_props.call(this, mb, pClass, szMember, cchMember, pchMember, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags, pdwCPlusTypeFlag, ppValue, pcchValue)
    end
    def get_field_props(this : IMetaDataImport2*, mb : UInt32, pClass : UInt32*, szField : Win32cr::Foundation::PWSTR, cchField : UInt32, pchField : UInt32*, pdwAttr : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*, pdwCPlusTypeFlag : UInt32*, ppValue : Void**, pcchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_field_props.call(this, mb, pClass, szField, cchField, pchField, pdwAttr, ppvSigBlob, pcbSigBlob, pdwCPlusTypeFlag, ppValue, pcchValue)
    end
    def get_property_props(this : IMetaDataImport2*, prop : UInt32, pClass : UInt32*, szProperty : Win32cr::Foundation::PWSTR, cchProperty : UInt32, pchProperty : UInt32*, pdwPropFlags : UInt32*, ppvSig : UInt8**, pbSig : UInt32*, pdwCPlusTypeFlag : UInt32*, ppDefaultValue : Void**, pcchDefaultValue : UInt32*, pmdSetter : UInt32*, pmdGetter : UInt32*, rmdOtherMethod : UInt32*, cMax : UInt32, pcOtherMethod : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_props.call(this, prop, pClass, szProperty, cchProperty, pchProperty, pdwPropFlags, ppvSig, pbSig, pdwCPlusTypeFlag, ppDefaultValue, pcchDefaultValue, pmdSetter, pmdGetter, rmdOtherMethod, cMax, pcOtherMethod)
    end
    def get_param_props(this : IMetaDataImport2*, tk : UInt32, pmd : UInt32*, pulSequence : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, pdwAttr : UInt32*, pdwCPlusTypeFlag : UInt32*, ppValue : Void**, pcchValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_param_props.call(this, tk, pmd, pulSequence, szName, cchName, pchName, pdwAttr, pdwCPlusTypeFlag, ppValue, pcchValue)
    end
    def get_custom_attribute_by_name(this : IMetaDataImport2*, tkObj : UInt32, szName : Win32cr::Foundation::PWSTR, ppData : Void**, pcbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_attribute_by_name.call(this, tkObj, szName, ppData, pcbData)
    end
    def is_valid_token(this : IMetaDataImport2*, tk : UInt32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_valid_token.call(this, tk)
    end
    def get_nested_class_props(this : IMetaDataImport2*, tdNestedClass : UInt32, ptdEnclosingClass : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_nested_class_props.call(this, tdNestedClass, ptdEnclosingClass)
    end
    def get_native_call_conv_from_sig(this : IMetaDataImport2*, pvSig : Void*, cbSig : UInt32, pCallConv : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_call_conv_from_sig.call(this, pvSig, cbSig, pCallConv)
    end
    def is_global(this : IMetaDataImport2*, pd : UInt32, pbGlobal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_global.call(this, pd, pbGlobal)
    end
    def enum_generic_params(this : IMetaDataImport2*, phEnum : Void**, tk : UInt32, rGenericParams : UInt32*, cMax : UInt32, pcGenericParams : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_generic_params.call(this, phEnum, tk, rGenericParams, cMax, pcGenericParams)
    end
    def get_generic_param_props(this : IMetaDataImport2*, gp : UInt32, pulParamSeq : UInt32*, pdwParamFlags : UInt32*, ptOwner : UInt32*, reserved : UInt32*, wzname : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generic_param_props.call(this, gp, pulParamSeq, pdwParamFlags, ptOwner, reserved, wzname, cchName, pchName)
    end
    def get_method_spec_props(this : IMetaDataImport2*, mi : UInt32, tkParent : UInt32*, ppvSigBlob : UInt8**, pcbSigBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_spec_props.call(this, mi, tkParent, ppvSigBlob, pcbSigBlob)
    end
    def enum_generic_param_constraints(this : IMetaDataImport2*, phEnum : Void**, tk : UInt32, rGenericParamConstraints : UInt32*, cMax : UInt32, pcGenericParamConstraints : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_generic_param_constraints.call(this, phEnum, tk, rGenericParamConstraints, cMax, pcGenericParamConstraints)
    end
    def get_generic_param_constraint_props(this : IMetaDataImport2*, gpc : UInt32, ptGenericParam : UInt32*, ptkConstraintType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generic_param_constraint_props.call(this, gpc, ptGenericParam, ptkConstraintType)
    end
    def get_pe_kind(this : IMetaDataImport2*, pdwPEKind : UInt32*, pdwMAchine : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pe_kind.call(this, pdwPEKind, pdwMAchine)
    end
    def get_version_string(this : IMetaDataImport2*, pwzBuf : Win32cr::Foundation::PWSTR, ccBufSize : UInt32, pccBufSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version_string.call(this, pwzBuf, ccBufSize, pccBufSize)
    end
    def enum_method_specs(this : IMetaDataImport2*, phEnum : Void**, tk : UInt32, rMethodSpecs : UInt32*, cMax : UInt32, pcMethodSpecs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_method_specs.call(this, phEnum, tk, rMethodSpecs, cMax, pcMethodSpecs)
    end

  end

  @[Extern]

  record IMetaDataFilterVtable,
    query_interface : Proc(IMetaDataFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataFilter*, UInt32),
    release : Proc(IMetaDataFilter*, UInt32),
    unmark_all : Proc(IMetaDataFilter*, Win32cr::Foundation::HRESULT),
    mark_token : Proc(IMetaDataFilter*, UInt32, Win32cr::Foundation::HRESULT),
    is_token_marked : Proc(IMetaDataFilter*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataFilter, lpVtbl : IMetaDataFilterVtable* do
    GUID = LibC::GUID.new(0xd0e80dd1_u32, 0x12d4_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x9d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xf8_u8, 0x17_u8, 0x95_u8])
    def query_interface(this : IMetaDataFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def unmark_all(this : IMetaDataFilter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmark_all.call(this)
    end
    def mark_token(this : IMetaDataFilter*, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.mark_token.call(this, tk)
    end
    def is_token_marked(this : IMetaDataFilter*, tk : UInt32, pIsMarked : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_token_marked.call(this, tk, pIsMarked)
    end

  end

  @[Extern]

  record IHostFilterVtable,
    query_interface : Proc(IHostFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostFilter*, UInt32),
    release : Proc(IHostFilter*, UInt32),
    mark_token : Proc(IHostFilter*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostFilter, lpVtbl : IHostFilterVtable* do
    GUID = LibC::GUID.new(0xd0e80dd3_u32, 0x12d4_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x9d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xf8_u8, 0x17_u8, 0x95_u8])
    def query_interface(this : IHostFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def mark_token(this : IHostFilter*, tk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.mark_token.call(this, tk)
    end

  end

  @[Extern]

  record IMetaDataAssemblyEmitVtable,
    query_interface : Proc(IMetaDataAssemblyEmit*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataAssemblyEmit*, UInt32),
    release : Proc(IMetaDataAssemblyEmit*, UInt32),
    define_assembly : Proc(IMetaDataAssemblyEmit*, Void*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_assembly_ref : Proc(IMetaDataAssemblyEmit*, Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, Void*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_file : Proc(IMetaDataAssemblyEmit*, Win32cr::Foundation::PWSTR, Void*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_exported_type : Proc(IMetaDataAssemblyEmit*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    define_manifest_resource : Proc(IMetaDataAssemblyEmit*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_assembly_props : Proc(IMetaDataAssemblyEmit*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, UInt32, Win32cr::Foundation::HRESULT),
    set_assembly_ref_props : Proc(IMetaDataAssemblyEmit*, UInt32, Void*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_file_props : Proc(IMetaDataAssemblyEmit*, UInt32, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_exported_type_props : Proc(IMetaDataAssemblyEmit*, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_manifest_resource_props : Proc(IMetaDataAssemblyEmit*, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataAssemblyEmit, lpVtbl : IMetaDataAssemblyEmitVtable* do
    GUID = LibC::GUID.new(0x211ef15b_u32, 0x5317_u16, 0x4438_u16, StaticArray[0xb1_u8, 0x96_u8, 0xde_u8, 0xc8_u8, 0x7b_u8, 0x88_u8, 0x76_u8, 0x93_u8])
    def query_interface(this : IMetaDataAssemblyEmit*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataAssemblyEmit*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataAssemblyEmit*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def define_assembly(this : IMetaDataAssemblyEmit*, pbPublicKey : Void*, cbPublicKey : UInt32, ulHashAlgId : UInt32, szName : Win32cr::Foundation::PWSTR, pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, dwAssemblyFlags : UInt32, pma : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_assembly.call(this, pbPublicKey, cbPublicKey, ulHashAlgId, szName, pMetaData, dwAssemblyFlags, pma)
    end
    def define_assembly_ref(this : IMetaDataAssemblyEmit*, pbPublicKeyOrToken : Void*, cbPublicKeyOrToken : UInt32, szName : Win32cr::Foundation::PWSTR, pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, pbHashValue : Void*, cbHashValue : UInt32, dwAssemblyRefFlags : UInt32, pmdar : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_assembly_ref.call(this, pbPublicKeyOrToken, cbPublicKeyOrToken, szName, pMetaData, pbHashValue, cbHashValue, dwAssemblyRefFlags, pmdar)
    end
    def define_file(this : IMetaDataAssemblyEmit*, szName : Win32cr::Foundation::PWSTR, pbHashValue : Void*, cbHashValue : UInt32, dwFileFlags : UInt32, pmdf : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_file.call(this, szName, pbHashValue, cbHashValue, dwFileFlags, pmdf)
    end
    def define_exported_type(this : IMetaDataAssemblyEmit*, szName : Win32cr::Foundation::PWSTR, tkImplementation : UInt32, tkTypeDef : UInt32, dwExportedTypeFlags : UInt32, pmdct : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_exported_type.call(this, szName, tkImplementation, tkTypeDef, dwExportedTypeFlags, pmdct)
    end
    def define_manifest_resource(this : IMetaDataAssemblyEmit*, szName : Win32cr::Foundation::PWSTR, tkImplementation : UInt32, dwOffset : UInt32, dwResourceFlags : UInt32, pmdmr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_manifest_resource.call(this, szName, tkImplementation, dwOffset, dwResourceFlags, pmdmr)
    end
    def set_assembly_props(this : IMetaDataAssemblyEmit*, pma : UInt32, pbPublicKey : Void*, cbPublicKey : UInt32, ulHashAlgId : UInt32, szName : Win32cr::Foundation::PWSTR, pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, dwAssemblyFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_assembly_props.call(this, pma, pbPublicKey, cbPublicKey, ulHashAlgId, szName, pMetaData, dwAssemblyFlags)
    end
    def set_assembly_ref_props(this : IMetaDataAssemblyEmit*, ar : UInt32, pbPublicKeyOrToken : Void*, cbPublicKeyOrToken : UInt32, szName : Win32cr::Foundation::PWSTR, pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, pbHashValue : Void*, cbHashValue : UInt32, dwAssemblyRefFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_assembly_ref_props.call(this, ar, pbPublicKeyOrToken, cbPublicKeyOrToken, szName, pMetaData, pbHashValue, cbHashValue, dwAssemblyRefFlags)
    end
    def set_file_props(this : IMetaDataAssemblyEmit*, file : UInt32, pbHashValue : Void*, cbHashValue : UInt32, dwFileFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_props.call(this, file, pbHashValue, cbHashValue, dwFileFlags)
    end
    def set_exported_type_props(this : IMetaDataAssemblyEmit*, ct : UInt32, tkImplementation : UInt32, tkTypeDef : UInt32, dwExportedTypeFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_exported_type_props.call(this, ct, tkImplementation, tkTypeDef, dwExportedTypeFlags)
    end
    def set_manifest_resource_props(this : IMetaDataAssemblyEmit*, mr : UInt32, tkImplementation : UInt32, dwOffset : UInt32, dwResourceFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manifest_resource_props.call(this, mr, tkImplementation, dwOffset, dwResourceFlags)
    end

  end

  @[Extern]

  record IMetaDataAssemblyImportVtable,
    query_interface : Proc(IMetaDataAssemblyImport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataAssemblyImport*, UInt32),
    release : Proc(IMetaDataAssemblyImport*, UInt32),
    get_assembly_props : Proc(IMetaDataAssemblyImport*, UInt32, Void**, UInt32*, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, UInt32*, Win32cr::Foundation::HRESULT),
    get_assembly_ref_props : Proc(IMetaDataAssemblyImport*, UInt32, Void**, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, Void**, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_props : Proc(IMetaDataAssemblyImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Void**, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_exported_type_props : Proc(IMetaDataAssemblyImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_manifest_resource_props : Proc(IMetaDataAssemblyImport*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_assembly_refs : Proc(IMetaDataAssemblyImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_files : Proc(IMetaDataAssemblyImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_exported_types : Proc(IMetaDataAssemblyImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    enum_manifest_resources : Proc(IMetaDataAssemblyImport*, Void**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_assembly_from_scope : Proc(IMetaDataAssemblyImport*, UInt32*, Win32cr::Foundation::HRESULT),
    find_exported_type_by_name : Proc(IMetaDataAssemblyImport*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_manifest_resource_by_name : Proc(IMetaDataAssemblyImport*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    close_enum : Proc(IMetaDataAssemblyImport*, Void*, Void),
    find_assemblies_by_name : Proc(IMetaDataAssemblyImport*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Void**, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataAssemblyImport, lpVtbl : IMetaDataAssemblyImportVtable* do
    GUID = LibC::GUID.new(0xee62470b_u32, 0xe94b_u16, 0x424e_u16, StaticArray[0x9b_u8, 0x7c_u8, 0x2f_u8, 0x0_u8, 0xc9_u8, 0x24_u8, 0x9f_u8, 0x93_u8])
    def query_interface(this : IMetaDataAssemblyImport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataAssemblyImport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataAssemblyImport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_assembly_props(this : IMetaDataAssemblyImport*, mda : UInt32, ppbPublicKey : Void**, pcbPublicKey : UInt32*, pulHashAlgId : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, pdwAssemblyFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_props.call(this, mda, ppbPublicKey, pcbPublicKey, pulHashAlgId, szName, cchName, pchName, pMetaData, pdwAssemblyFlags)
    end
    def get_assembly_ref_props(this : IMetaDataAssemblyImport*, mdar : UInt32, ppbPublicKeyOrToken : Void**, pcbPublicKeyOrToken : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, ppbHashValue : Void**, pcbHashValue : UInt32*, pdwAssemblyRefFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_ref_props.call(this, mdar, ppbPublicKeyOrToken, pcbPublicKeyOrToken, szName, cchName, pchName, pMetaData, ppbHashValue, pcbHashValue, pdwAssemblyRefFlags)
    end
    def get_file_props(this : IMetaDataAssemblyImport*, mdf : UInt32, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, ppbHashValue : Void**, pcbHashValue : UInt32*, pdwFileFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_props.call(this, mdf, szName, cchName, pchName, ppbHashValue, pcbHashValue, pdwFileFlags)
    end
    def get_exported_type_props(this : IMetaDataAssemblyImport*, mdct : UInt32, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, ptkImplementation : UInt32*, ptkTypeDef : UInt32*, pdwExportedTypeFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exported_type_props.call(this, mdct, szName, cchName, pchName, ptkImplementation, ptkTypeDef, pdwExportedTypeFlags)
    end
    def get_manifest_resource_props(this : IMetaDataAssemblyImport*, mdmr : UInt32, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*, ptkImplementation : UInt32*, pdwOffset : UInt32*, pdwResourceFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manifest_resource_props.call(this, mdmr, szName, cchName, pchName, ptkImplementation, pdwOffset, pdwResourceFlags)
    end
    def enum_assembly_refs(this : IMetaDataAssemblyImport*, phEnum : Void**, rAssemblyRefs : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_assembly_refs.call(this, phEnum, rAssemblyRefs, cMax, pcTokens)
    end
    def enum_files(this : IMetaDataAssemblyImport*, phEnum : Void**, rFiles : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_files.call(this, phEnum, rFiles, cMax, pcTokens)
    end
    def enum_exported_types(this : IMetaDataAssemblyImport*, phEnum : Void**, rExportedTypes : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_exported_types.call(this, phEnum, rExportedTypes, cMax, pcTokens)
    end
    def enum_manifest_resources(this : IMetaDataAssemblyImport*, phEnum : Void**, rManifestResources : UInt32*, cMax : UInt32, pcTokens : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_manifest_resources.call(this, phEnum, rManifestResources, cMax, pcTokens)
    end
    def get_assembly_from_scope(this : IMetaDataAssemblyImport*, ptkAssembly : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_from_scope.call(this, ptkAssembly)
    end
    def find_exported_type_by_name(this : IMetaDataAssemblyImport*, szName : Win32cr::Foundation::PWSTR, mdtExportedType : UInt32, ptkExportedType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_exported_type_by_name.call(this, szName, mdtExportedType, ptkExportedType)
    end
    def find_manifest_resource_by_name(this : IMetaDataAssemblyImport*, szName : Win32cr::Foundation::PWSTR, ptkManifestResource : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_manifest_resource_by_name.call(this, szName, ptkManifestResource)
    end
    def close_enum(this : IMetaDataAssemblyImport*, hEnum : Void*) : Void
      @lpVtbl.try &.value.close_enum.call(this, hEnum)
    end
    def find_assemblies_by_name(this : IMetaDataAssemblyImport*, szAppBase : Win32cr::Foundation::PWSTR, szPrivateBin : Win32cr::Foundation::PWSTR, szAssemblyName : Win32cr::Foundation::PWSTR, ppIUnk : Void**, cMax : UInt32, pcAssemblies : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_assemblies_by_name.call(this, szAppBase, szPrivateBin, szAssemblyName, ppIUnk, cMax, pcAssemblies)
    end

  end

  @[Extern]

  record IMetaDataValidateVtable,
    query_interface : Proc(IMetaDataValidate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataValidate*, UInt32),
    release : Proc(IMetaDataValidate*, UInt32),
    validator_init : Proc(IMetaDataValidate*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    validate_meta_data : Proc(IMetaDataValidate*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataValidate, lpVtbl : IMetaDataValidateVtable* do
    GUID = LibC::GUID.new(0x4709c9c6_u32, 0x81ff_u16, 0x11d3_u16, StaticArray[0x9f_u8, 0xc7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
    def query_interface(this : IMetaDataValidate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataValidate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataValidate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def validator_init(this : IMetaDataValidate*, dwModuleType : UInt32, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validator_init.call(this, dwModuleType, pUnk)
    end
    def validate_meta_data(this : IMetaDataValidate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_meta_data.call(this)
    end

  end

  @[Extern]

  record IMetaDataDispenserExVtable,
    query_interface : Proc(IMetaDataDispenserEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataDispenserEx*, UInt32),
    release : Proc(IMetaDataDispenserEx*, UInt32),
    define_scope : Proc(IMetaDataDispenserEx*, LibC::GUID*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    open_scope : Proc(IMetaDataDispenserEx*, Win32cr::Foundation::PWSTR, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    open_scope_on_memory : Proc(IMetaDataDispenserEx*, Void*, UInt32, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_option : Proc(IMetaDataDispenserEx*, LibC::GUID*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    get_option : Proc(IMetaDataDispenserEx*, LibC::GUID*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    open_scope_on_i_type_info : Proc(IMetaDataDispenserEx*, Void*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cor_system_directory : Proc(IMetaDataDispenserEx*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_assembly : Proc(IMetaDataDispenserEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    find_assembly_module : Proc(IMetaDataDispenserEx*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataDispenserEx, lpVtbl : IMetaDataDispenserExVtable* do
    GUID = LibC::GUID.new(0x31bcfce2_u32, 0xdafb_u16, 0x11d2_u16, StaticArray[0x9f_u8, 0x81_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xa0_u8, 0xa3_u8])
    def query_interface(this : IMetaDataDispenserEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataDispenserEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataDispenserEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def define_scope(this : IMetaDataDispenserEx*, rclsid : LibC::GUID*, dwCreateFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.define_scope.call(this, rclsid, dwCreateFlags, riid, ppIUnk)
    end
    def open_scope(this : IMetaDataDispenserEx*, szScope : Win32cr::Foundation::PWSTR, dwOpenFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope.call(this, szScope, dwOpenFlags, riid, ppIUnk)
    end
    def open_scope_on_memory(this : IMetaDataDispenserEx*, pData : Void*, cbData : UInt32, dwOpenFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope_on_memory.call(this, pData, cbData, dwOpenFlags, riid, ppIUnk)
    end
    def set_option(this : IMetaDataDispenserEx*, optionid : LibC::GUID*, value : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_option.call(this, optionid, value)
    end
    def get_option(this : IMetaDataDispenserEx*, optionid : LibC::GUID*, pvalue : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_option.call(this, optionid, pvalue)
    end
    def open_scope_on_i_type_info(this : IMetaDataDispenserEx*, pITI : Void*, dwOpenFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_scope_on_i_type_info.call(this, pITI, dwOpenFlags, riid, ppIUnk)
    end
    def get_cor_system_directory(this : IMetaDataDispenserEx*, szBuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, pchBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cor_system_directory.call(this, szBuffer, cchBuffer, pchBuffer)
    end
    def find_assembly(this : IMetaDataDispenserEx*, szAppBase : Win32cr::Foundation::PWSTR, szPrivateBin : Win32cr::Foundation::PWSTR, szGlobalBin : Win32cr::Foundation::PWSTR, szAssemblyName : Win32cr::Foundation::PWSTR, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pcName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_assembly.call(this, szAppBase, szPrivateBin, szGlobalBin, szAssemblyName, szName, cchName, pcName)
    end
    def find_assembly_module(this : IMetaDataDispenserEx*, szAppBase : Win32cr::Foundation::PWSTR, szPrivateBin : Win32cr::Foundation::PWSTR, szGlobalBin : Win32cr::Foundation::PWSTR, szAssemblyName : Win32cr::Foundation::PWSTR, szModuleName : Win32cr::Foundation::PWSTR, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pcName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_assembly_module.call(this, szAppBase, szPrivateBin, szGlobalBin, szAssemblyName, szModuleName, szName, cchName, pcName)
    end

  end

  @[Extern]

  record ICeeGenVtable,
    query_interface : Proc(ICeeGen*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICeeGen*, UInt32),
    release : Proc(ICeeGen*, UInt32),
    emit_string : Proc(ICeeGen*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(ICeeGen*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    allocate_method_buffer : Proc(ICeeGen*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_method_buffer : Proc(ICeeGen*, UInt32, UInt8**, Win32cr::Foundation::HRESULT),
    get_i_map_token_iface : Proc(ICeeGen*, Void**, Win32cr::Foundation::HRESULT),
    generate_cee_file : Proc(ICeeGen*, Win32cr::Foundation::HRESULT),
    get_il_section : Proc(ICeeGen*, Void**, Win32cr::Foundation::HRESULT),
    get_string_section : Proc(ICeeGen*, Void**, Win32cr::Foundation::HRESULT),
    add_section_reloc : Proc(ICeeGen*, Void*, UInt32, Void*, Win32cr::System::WinRT::Metadata::CeeSectionRelocType, Win32cr::Foundation::HRESULT),
    get_section_create : Proc(ICeeGen*, Win32cr::Foundation::PSTR, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_section_data_len : Proc(ICeeGen*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_section_block : Proc(ICeeGen*, Void*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    truncate_section : Proc(ICeeGen*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    generate_cee_memory_image : Proc(ICeeGen*, Void**, Win32cr::Foundation::HRESULT),
    compute_pointer : Proc(ICeeGen*, Void*, UInt32, UInt8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICeeGen, lpVtbl : ICeeGenVtable* do
    GUID = LibC::GUID.new(0x7ed1bdff_u32, 0x8e36_u16, 0x11d2_u16, StaticArray[0x9c_u8, 0x56_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb7_u8, 0xcc_u8, 0x45_u8])
    def query_interface(this : ICeeGen*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICeeGen*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICeeGen*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def emit_string(this : ICeeGen*, lpString : Win32cr::Foundation::PWSTR, rva : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.emit_string.call(this, lpString, rva)
    end
    def get_string(this : ICeeGen*, rva : UInt32, lpString : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, rva, lpString)
    end
    def allocate_method_buffer(this : ICeeGen*, cchBuffer : UInt32, lpBuffer : UInt8**, rva : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_method_buffer.call(this, cchBuffer, lpBuffer, rva)
    end
    def get_method_buffer(this : ICeeGen*, rva : UInt32, lpBuffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_method_buffer.call(this, rva, lpBuffer)
    end
    def get_i_map_token_iface(this : ICeeGen*, pIMapToken : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_map_token_iface.call(this, pIMapToken)
    end
    def generate_cee_file(this : ICeeGen*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_cee_file.call(this)
    end
    def get_il_section(this : ICeeGen*, section : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_section.call(this, section)
    end
    def get_string_section(this : ICeeGen*, section : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_section.call(this, section)
    end
    def add_section_reloc(this : ICeeGen*, section : Void*, offset : UInt32, relativeTo : Void*, relocType : Win32cr::System::WinRT::Metadata::CeeSectionRelocType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_section_reloc.call(this, section, offset, relativeTo, relocType)
    end
    def get_section_create(this : ICeeGen*, name : Win32cr::Foundation::PSTR, flags : UInt32, section : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_section_create.call(this, name, flags, section)
    end
    def get_section_data_len(this : ICeeGen*, section : Void*, dataLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_section_data_len.call(this, section, dataLen)
    end
    def get_section_block(this : ICeeGen*, section : Void*, len : UInt32, align : UInt32, ppBytes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_section_block.call(this, section, len, align, ppBytes)
    end
    def truncate_section(this : ICeeGen*, section : Void*, len : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.truncate_section.call(this, section, len)
    end
    def generate_cee_memory_image(this : ICeeGen*, ppImage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_cee_memory_image.call(this, ppImage)
    end
    def compute_pointer(this : ICeeGen*, section : Void*, rva : UInt32, lpBuffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compute_pointer.call(this, section, rva, lpBuffer)
    end

  end

  @[Extern]

  record IMetaDataTablesVtable,
    query_interface : Proc(IMetaDataTables*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataTables*, UInt32),
    release : Proc(IMetaDataTables*, UInt32),
    get_string_heap_size : Proc(IMetaDataTables*, UInt32*, Win32cr::Foundation::HRESULT),
    get_blob_heap_size : Proc(IMetaDataTables*, UInt32*, Win32cr::Foundation::HRESULT),
    get_guid_heap_size : Proc(IMetaDataTables*, UInt32*, Win32cr::Foundation::HRESULT),
    get_user_string_heap_size : Proc(IMetaDataTables*, UInt32*, Win32cr::Foundation::HRESULT),
    get_num_tables : Proc(IMetaDataTables*, UInt32*, Win32cr::Foundation::HRESULT),
    get_table_index : Proc(IMetaDataTables*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_table_info : Proc(IMetaDataTables*, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, Int8**, Win32cr::Foundation::HRESULT),
    get_column_info : Proc(IMetaDataTables*, UInt32, UInt32, UInt32*, UInt32*, UInt32*, Int8**, Win32cr::Foundation::HRESULT),
    get_coded_token_info : Proc(IMetaDataTables*, UInt32, UInt32*, UInt32**, Int8**, Win32cr::Foundation::HRESULT),
    get_row : Proc(IMetaDataTables*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_column : Proc(IMetaDataTables*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(IMetaDataTables*, UInt32, Int8**, Win32cr::Foundation::HRESULT),
    get_blob : Proc(IMetaDataTables*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_guid : Proc(IMetaDataTables*, UInt32, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_user_string : Proc(IMetaDataTables*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_next_string : Proc(IMetaDataTables*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_blob : Proc(IMetaDataTables*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_guid : Proc(IMetaDataTables*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_user_string : Proc(IMetaDataTables*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataTables, lpVtbl : IMetaDataTablesVtable* do
    GUID = LibC::GUID.new(0xd8f579ab_u32, 0x402d_u16, 0x4b8e_u16, StaticArray[0x82_u8, 0xd9_u8, 0x5d_u8, 0x63_u8, 0xb1_u8, 0x6_u8, 0x5c_u8, 0x68_u8])
    def query_interface(this : IMetaDataTables*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataTables*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataTables*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string_heap_size(this : IMetaDataTables*, pcbStrings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_heap_size.call(this, pcbStrings)
    end
    def get_blob_heap_size(this : IMetaDataTables*, pcbBlobs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob_heap_size.call(this, pcbBlobs)
    end
    def get_guid_heap_size(this : IMetaDataTables*, pcbGuids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid_heap_size.call(this, pcbGuids)
    end
    def get_user_string_heap_size(this : IMetaDataTables*, pcbBlobs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_string_heap_size.call(this, pcbBlobs)
    end
    def get_num_tables(this : IMetaDataTables*, pcTables : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_tables.call(this, pcTables)
    end
    def get_table_index(this : IMetaDataTables*, token : UInt32, pixTbl : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table_index.call(this, token, pixTbl)
    end
    def get_table_info(this : IMetaDataTables*, ixTbl : UInt32, pcbRow : UInt32*, pcRows : UInt32*, pcCols : UInt32*, piKey : UInt32*, ppName : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table_info.call(this, ixTbl, pcbRow, pcRows, pcCols, piKey, ppName)
    end
    def get_column_info(this : IMetaDataTables*, ixTbl : UInt32, ixCol : UInt32, poCol : UInt32*, pcbCol : UInt32*, pType : UInt32*, ppName : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_info.call(this, ixTbl, ixCol, poCol, pcbCol, pType, ppName)
    end
    def get_coded_token_info(this : IMetaDataTables*, ixCdTkn : UInt32, pcTokens : UInt32*, ppTokens : UInt32**, ppName : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_coded_token_info.call(this, ixCdTkn, pcTokens, ppTokens, ppName)
    end
    def get_row(this : IMetaDataTables*, ixTbl : UInt32, rid : UInt32, ppRow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row.call(this, ixTbl, rid, ppRow)
    end
    def get_column(this : IMetaDataTables*, ixTbl : UInt32, ixCol : UInt32, rid : UInt32, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column.call(this, ixTbl, ixCol, rid, pVal)
    end
    def get_string(this : IMetaDataTables*, ixString : UInt32, ppString : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, ixString, ppString)
    end
    def get_blob(this : IMetaDataTables*, ixBlob : UInt32, pcbData : UInt32*, ppData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob.call(this, ixBlob, pcbData, ppData)
    end
    def get_guid(this : IMetaDataTables*, ixGuid : UInt32, ppGUID : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, ixGuid, ppGUID)
    end
    def get_user_string(this : IMetaDataTables*, ixUserString : UInt32, pcbData : UInt32*, ppData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_string.call(this, ixUserString, pcbData, ppData)
    end
    def get_next_string(this : IMetaDataTables*, ixString : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_string.call(this, ixString, pNext)
    end
    def get_next_blob(this : IMetaDataTables*, ixBlob : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_blob.call(this, ixBlob, pNext)
    end
    def get_next_guid(this : IMetaDataTables*, ixGuid : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_guid.call(this, ixGuid, pNext)
    end
    def get_next_user_string(this : IMetaDataTables*, ixUserString : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_user_string.call(this, ixUserString, pNext)
    end

  end

  @[Extern]

  record IMetaDataTables2Vtable,
    query_interface : Proc(IMetaDataTables2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataTables2*, UInt32),
    release : Proc(IMetaDataTables2*, UInt32),
    get_string_heap_size : Proc(IMetaDataTables2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_blob_heap_size : Proc(IMetaDataTables2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_guid_heap_size : Proc(IMetaDataTables2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_user_string_heap_size : Proc(IMetaDataTables2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_num_tables : Proc(IMetaDataTables2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_table_index : Proc(IMetaDataTables2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_table_info : Proc(IMetaDataTables2*, UInt32, UInt32*, UInt32*, UInt32*, UInt32*, Int8**, Win32cr::Foundation::HRESULT),
    get_column_info : Proc(IMetaDataTables2*, UInt32, UInt32, UInt32*, UInt32*, UInt32*, Int8**, Win32cr::Foundation::HRESULT),
    get_coded_token_info : Proc(IMetaDataTables2*, UInt32, UInt32*, UInt32**, Int8**, Win32cr::Foundation::HRESULT),
    get_row : Proc(IMetaDataTables2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_column : Proc(IMetaDataTables2*, UInt32, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(IMetaDataTables2*, UInt32, Int8**, Win32cr::Foundation::HRESULT),
    get_blob : Proc(IMetaDataTables2*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_guid : Proc(IMetaDataTables2*, UInt32, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_user_string : Proc(IMetaDataTables2*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_next_string : Proc(IMetaDataTables2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_blob : Proc(IMetaDataTables2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_guid : Proc(IMetaDataTables2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_user_string : Proc(IMetaDataTables2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_meta_data_storage : Proc(IMetaDataTables2*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_meta_data_stream_info : Proc(IMetaDataTables2*, UInt32, Int8**, Void**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataTables2, lpVtbl : IMetaDataTables2Vtable* do
    GUID = LibC::GUID.new(0xbadb5f70_u32, 0x58da_u16, 0x43a9_u16, StaticArray[0xa1_u8, 0xc6_u8, 0xd7_u8, 0x48_u8, 0x19_u8, 0xf1_u8, 0x9b_u8, 0x15_u8])
    def query_interface(this : IMetaDataTables2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataTables2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataTables2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string_heap_size(this : IMetaDataTables2*, pcbStrings : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_heap_size.call(this, pcbStrings)
    end
    def get_blob_heap_size(this : IMetaDataTables2*, pcbBlobs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob_heap_size.call(this, pcbBlobs)
    end
    def get_guid_heap_size(this : IMetaDataTables2*, pcbGuids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid_heap_size.call(this, pcbGuids)
    end
    def get_user_string_heap_size(this : IMetaDataTables2*, pcbBlobs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_string_heap_size.call(this, pcbBlobs)
    end
    def get_num_tables(this : IMetaDataTables2*, pcTables : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_tables.call(this, pcTables)
    end
    def get_table_index(this : IMetaDataTables2*, token : UInt32, pixTbl : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table_index.call(this, token, pixTbl)
    end
    def get_table_info(this : IMetaDataTables2*, ixTbl : UInt32, pcbRow : UInt32*, pcRows : UInt32*, pcCols : UInt32*, piKey : UInt32*, ppName : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table_info.call(this, ixTbl, pcbRow, pcRows, pcCols, piKey, ppName)
    end
    def get_column_info(this : IMetaDataTables2*, ixTbl : UInt32, ixCol : UInt32, poCol : UInt32*, pcbCol : UInt32*, pType : UInt32*, ppName : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_info.call(this, ixTbl, ixCol, poCol, pcbCol, pType, ppName)
    end
    def get_coded_token_info(this : IMetaDataTables2*, ixCdTkn : UInt32, pcTokens : UInt32*, ppTokens : UInt32**, ppName : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_coded_token_info.call(this, ixCdTkn, pcTokens, ppTokens, ppName)
    end
    def get_row(this : IMetaDataTables2*, ixTbl : UInt32, rid : UInt32, ppRow : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row.call(this, ixTbl, rid, ppRow)
    end
    def get_column(this : IMetaDataTables2*, ixTbl : UInt32, ixCol : UInt32, rid : UInt32, pVal : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column.call(this, ixTbl, ixCol, rid, pVal)
    end
    def get_string(this : IMetaDataTables2*, ixString : UInt32, ppString : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, ixString, ppString)
    end
    def get_blob(this : IMetaDataTables2*, ixBlob : UInt32, pcbData : UInt32*, ppData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob.call(this, ixBlob, pcbData, ppData)
    end
    def get_guid(this : IMetaDataTables2*, ixGuid : UInt32, ppGUID : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, ixGuid, ppGUID)
    end
    def get_user_string(this : IMetaDataTables2*, ixUserString : UInt32, pcbData : UInt32*, ppData : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_string.call(this, ixUserString, pcbData, ppData)
    end
    def get_next_string(this : IMetaDataTables2*, ixString : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_string.call(this, ixString, pNext)
    end
    def get_next_blob(this : IMetaDataTables2*, ixBlob : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_blob.call(this, ixBlob, pNext)
    end
    def get_next_guid(this : IMetaDataTables2*, ixGuid : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_guid.call(this, ixGuid, pNext)
    end
    def get_next_user_string(this : IMetaDataTables2*, ixUserString : UInt32, pNext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_user_string.call(this, ixUserString, pNext)
    end
    def get_meta_data_storage(this : IMetaDataTables2*, ppvMd : Void**, pcbMd : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_meta_data_storage.call(this, ppvMd, pcbMd)
    end
    def get_meta_data_stream_info(this : IMetaDataTables2*, ix : UInt32, ppchName : Int8**, ppv : Void**, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_meta_data_stream_info.call(this, ix, ppchName, ppv, pcb)
    end

  end

  @[Extern]

  record IMetaDataInfoVtable,
    query_interface : Proc(IMetaDataInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataInfo*, UInt32),
    release : Proc(IMetaDataInfo*, UInt32),
    get_file_mapping : Proc(IMetaDataInfo*, Void**, UInt64*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataInfo, lpVtbl : IMetaDataInfoVtable* do
    GUID = LibC::GUID.new(0x7998ea64_u32, 0x7f95_u16, 0x48b8_u16, StaticArray[0x86_u8, 0xfc_u8, 0x17_u8, 0xca_u8, 0xf4_u8, 0x8b_u8, 0xf5_u8, 0xcb_u8])
    def query_interface(this : IMetaDataInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_file_mapping(this : IMetaDataInfo*, ppvData : Void**, pcbData : UInt64*, pdwMappingType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_mapping.call(this, ppvData, pcbData, pdwMappingType)
    end

  end

  @[Extern]

  record IMetaDataWinMDImportVtable,
    query_interface : Proc(IMetaDataWinMDImport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMetaDataWinMDImport*, UInt32),
    release : Proc(IMetaDataWinMDImport*, UInt32),
    get_untransformed_type_ref_props : Proc(IMetaDataWinMDImport*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMetaDataWinMDImport, lpVtbl : IMetaDataWinMDImportVtable* do
    GUID = LibC::GUID.new(0x969ea0c5_u32, 0x964e_u16, 0x411b_u16, StaticArray[0xa8_u8, 0x7_u8, 0xb0_u8, 0xf3_u8, 0xc2_u8, 0xdf_u8, 0xcb_u8, 0xd4_u8])
    def query_interface(this : IMetaDataWinMDImport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMetaDataWinMDImport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMetaDataWinMDImport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_untransformed_type_ref_props(this : IMetaDataWinMDImport*, tr : UInt32, ptkResolutionScope : UInt32*, szName : Win32cr::Foundation::PWSTR, cchName : UInt32, pchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_untransformed_type_ref_props.call(this, tr, ptkResolutionScope, szName, cchName, pchName)
    end

  end

  @[Extern]

  record IRoSimpleMetaDataBuilderVtable,
    set_win_rt_interface : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, Win32cr::Foundation::HRESULT),
    set_delegate : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, Win32cr::Foundation::HRESULT),
    set_interface_group_simple_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_interface_group_parameterized_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_runtime_class_simple_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_runtime_class_parameterized_default : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_struct : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_enum : Proc(IRoSimpleMetaDataBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_parameterized_interface : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, UInt32, Win32cr::Foundation::HRESULT),
    set_parameterized_delegate : Proc(IRoSimpleMetaDataBuilder*, LibC::GUID, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRoSimpleMetaDataBuilder, lpVtbl : IRoSimpleMetaDataBuilderVtable* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def set_win_rt_interface(this : IRoSimpleMetaDataBuilder*, iid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_win_rt_interface.call(this, iid)
    end
    def set_delegate(this : IRoSimpleMetaDataBuilder*, iid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_delegate.call(this, iid)
    end
    def set_interface_group_simple_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, defaultInterfaceName : Win32cr::Foundation::PWSTR, defaultInterfaceIID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interface_group_simple_default.call(this, name, defaultInterfaceName, defaultInterfaceIID)
    end
    def set_interface_group_parameterized_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, elementCount : UInt32, defaultInterfaceNameElements : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interface_group_parameterized_default.call(this, name, elementCount, defaultInterfaceNameElements)
    end
    def set_runtime_class_simple_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, defaultInterfaceName : Win32cr::Foundation::PWSTR, defaultInterfaceIID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_runtime_class_simple_default.call(this, name, defaultInterfaceName, defaultInterfaceIID)
    end
    def set_runtime_class_parameterized_default(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, elementCount : UInt32, defaultInterfaceNameElements : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_runtime_class_parameterized_default.call(this, name, elementCount, defaultInterfaceNameElements)
    end
    def set_struct(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, numFields : UInt32, fieldTypeNames : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_struct.call(this, name, numFields, fieldTypeNames)
    end
    def set_enum(this : IRoSimpleMetaDataBuilder*, name : Win32cr::Foundation::PWSTR, baseType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enum.call(this, name, baseType)
    end
    def set_parameterized_interface(this : IRoSimpleMetaDataBuilder*, piid : LibC::GUID, numArgs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameterized_interface.call(this, piid, numArgs)
    end
    def set_parameterized_delegate(this : IRoSimpleMetaDataBuilder*, piid : LibC::GUID, numArgs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameterized_delegate.call(this, piid, numArgs)
    end

  end

  @[Extern]

  record IRoMetaDataLocatorVtable,
    locate : Proc(IRoMetaDataLocator*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRoMetaDataLocator, lpVtbl : IRoMetaDataLocatorVtable* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def locate(this : IRoMetaDataLocator*, nameElement : Win32cr::Foundation::PWSTR, metaDataDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locate.call(this, nameElement, metaDataDestination)
    end

  end

  def metaDataGetDispenser(rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.MetaDataGetDispenser(rclsid, riid, ppv)
    {% end %}
  end

  def roGetMetaDataFile(name : Win32cr::System::WinRT::HSTRING, metaDataDispenser : Void*, metaDataFilePath : Win32cr::System::WinRT::HSTRING*, metaDataImport : Void**, typeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoGetMetaDataFile(name, metaDataDispenser, metaDataFilePath, metaDataImport, typeDefToken)
    {% end %}
  end

  def roParseTypeName(typeName : Win32cr::System::WinRT::HSTRING, partsCount : UInt32*, typeNameParts : Win32cr::System::WinRT::HSTRING**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoParseTypeName(typeName, partsCount, typeNameParts)
    {% end %}
  end

  def roResolveNamespace(name : Win32cr::System::WinRT::HSTRING, windowsMetaDataDir : Win32cr::System::WinRT::HSTRING, packageGraphDirsCount : UInt32, packageGraphDirs : Win32cr::System::WinRT::HSTRING*, metaDataFilePathsCount : UInt32*, metaDataFilePaths : Win32cr::System::WinRT::HSTRING**, subNamespacesCount : UInt32*, subNamespaces : Win32cr::System::WinRT::HSTRING**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoResolveNamespace(name, windowsMetaDataDir, packageGraphDirsCount, packageGraphDirs, metaDataFilePathsCount, metaDataFilePaths, subNamespacesCount, subNamespaces)
    {% end %}
  end

  def roIsApiContractPresent(name : Win32cr::Foundation::PWSTR, majorVersion : UInt16, minorVersion : UInt16, present : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoIsApiContractPresent(name, majorVersion, minorVersion, present)
    {% end %}
  end

  def roIsApiContractMajorVersionPresent(name : Win32cr::Foundation::PWSTR, majorVersion : UInt16, present : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoIsApiContractMajorVersionPresent(name, majorVersion, present)
    {% end %}
  end

  def roCreateNonAgilePropertySet(ppPropertySet : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoCreateNonAgilePropertySet(ppPropertySet)
    {% end %}
  end

  def roCreatePropertySetSerializer(ppPropertySetSerializer : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoCreatePropertySetSerializer(ppPropertySetSerializer)
    {% end %}
  end

  def roGetParameterizedTypeInstanceIID(nameElementCount : UInt32, nameElements : Win32cr::Foundation::PWSTR*, metaDataLocator : Void*, iid : LibC::GUID*, pExtra : Win32cr::System::WinRT::Metadata::ROPARAMIIDHANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RoGetParameterizedTypeInstanceIID(nameElementCount, nameElements, metaDataLocator, iid, pExtra)
    {% end %}
  end

  def roFreeParameterizedTypeExtra(extra : Win32cr::System::WinRT::Metadata::ROPARAMIIDHANDLE) : Void
    {% if !flag?(:docs) %}
    C.RoFreeParameterizedTypeExtra(extra)
    {% end %}
  end

  def roParameterizedTypeExtraGetTypeSignature(extra : Win32cr::System::WinRT::Metadata::ROPARAMIIDHANDLE) : Win32cr::Foundation::PSTR
    {% if !flag?(:docs) %}
    C.RoParameterizedTypeExtraGetTypeSignature(extra)
    {% end %}
  end

  @[Link("rometadata")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun MetaDataGetDispenser(rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoGetMetaDataFile(name : Win32cr::System::WinRT::HSTRING, metaDataDispenser : Void*, metaDataFilePath : Win32cr::System::WinRT::HSTRING*, metaDataImport : Void**, typeDefToken : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoParseTypeName(typeName : Win32cr::System::WinRT::HSTRING, partsCount : UInt32*, typeNameParts : Win32cr::System::WinRT::HSTRING**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoResolveNamespace(name : Win32cr::System::WinRT::HSTRING, windowsMetaDataDir : Win32cr::System::WinRT::HSTRING, packageGraphDirsCount : UInt32, packageGraphDirs : Win32cr::System::WinRT::HSTRING*, metaDataFilePathsCount : UInt32*, metaDataFilePaths : Win32cr::System::WinRT::HSTRING**, subNamespacesCount : UInt32*, subNamespaces : Win32cr::System::WinRT::HSTRING**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoIsApiContractPresent(name : Win32cr::Foundation::PWSTR, majorVersion : UInt16, minorVersion : UInt16, present : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoIsApiContractMajorVersionPresent(name : Win32cr::Foundation::PWSTR, majorVersion : UInt16, present : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoCreateNonAgilePropertySet(ppPropertySet : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoCreatePropertySetSerializer(ppPropertySetSerializer : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoGetParameterizedTypeInstanceIID(nameElementCount : UInt32, nameElements : Win32cr::Foundation::PWSTR*, metaDataLocator : Void*, iid : LibC::GUID*, pExtra : Win32cr::System::WinRT::Metadata::ROPARAMIIDHANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RoFreeParameterizedTypeExtra(extra : Win32cr::System::WinRT::Metadata::ROPARAMIIDHANDLE) : Void

    # :nodoc:
    fun RoParameterizedTypeExtraGetTypeSignature(extra : Win32cr::System::WinRT::Metadata::ROPARAMIIDHANDLE) : Win32cr::Foundation::PSTR

  end
  {% end %}
end