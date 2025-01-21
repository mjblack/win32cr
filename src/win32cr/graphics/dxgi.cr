require "./../foundation.cr"
require "./dxgi/common.cr"
require "./gdi.cr"
require "./../system/com.cr"
require "./../security.cr"

module Win32cr::Graphics::Dxgi
  DXGI_USAGE_SHADER_INPUT = 16_u32
  DXGI_USAGE_RENDER_TARGET_OUTPUT = 32_u32
  DXGI_USAGE_BACK_BUFFER = 64_u32
  DXGI_USAGE_SHARED = 128_u32
  DXGI_USAGE_READ_ONLY = 256_u32
  DXGI_USAGE_DISCARD_ON_PRESENT = 512_u32
  DXGI_USAGE_UNORDERED_ACCESS = 1024_u32
  DXGI_MAP_READ = 1_u32
  DXGI_MAP_WRITE = 2_u32
  DXGI_MAP_DISCARD = 4_u32
  DXGI_ENUM_MODES_INTERLACED = 1_u32
  DXGI_ENUM_MODES_SCALING = 2_u32
  DXGI_MAX_SWAP_CHAIN_BUFFERS = 16_u32
  DXGI_PRESENT_TEST = 1_u32
  DXGI_PRESENT_DO_NOT_SEQUENCE = 2_u32
  DXGI_PRESENT_RESTART = 4_u32
  DXGI_PRESENT_DO_NOT_WAIT = 8_u32
  DXGI_PRESENT_STEREO_PREFER_RIGHT = 16_u32
  DXGI_PRESENT_STEREO_TEMPORARY_MONO = 32_u32
  DXGI_PRESENT_RESTRICT_TO_OUTPUT = 64_u32
  DXGI_PRESENT_USE_DURATION = 256_u32
  DXGI_PRESENT_ALLOW_TEARING = 512_u32
  DXGI_MWA_NO_WINDOW_CHANGES = 1_u32
  DXGI_MWA_NO_ALT_ENTER = 2_u32
  DXGI_MWA_NO_PRINT_SCREEN = 4_u32
  DXGI_MWA_VALID = 7_u32
  DXGI_ENUM_MODES_STEREO = 4_u32
  DXGI_ENUM_MODES_DISABLED_STEREO = 8_u32
  DXGI_SHARED_RESOURCE_READ = 2147483648_u32
  DXGI_SHARED_RESOURCE_WRITE = 1_u32
  DXGI_DEBUG_BINARY_VERSION = 1_u32
  DXGI_DEBUG_ALL = "e48ae283-da80-490b-87e6-43e9a9cfda08"
  DXGI_DEBUG_DX = "35cdd7fc-13b2-421d-a5d7-7e4451287d64"
  DXGI_DEBUG_DXGI = "25cddaa4-b1c6-47e1-ac3e-98875b5a2e2a"
  DXGI_DEBUG_APP = "06cd6e01-4219-4ebd-8709-27ed23360c62"
  DXGI_INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION = 0_u32
  DXGI_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT = 1024_u32
  DXGI_CREATE_FACTORY_DEBUG = 1_u32
  DXGI_ERROR_INVALID_CALL = -2005270527_i32
  DXGI_ERROR_NOT_FOUND = -2005270526_i32
  DXGI_ERROR_MORE_DATA = -2005270525_i32
  DXGI_ERROR_UNSUPPORTED = -2005270524_i32
  DXGI_ERROR_DEVICE_REMOVED = -2005270523_i32
  DXGI_ERROR_DEVICE_HUNG = -2005270522_i32
  DXGI_ERROR_DEVICE_RESET = -2005270521_i32
  DXGI_ERROR_WAS_STILL_DRAWING = -2005270518_i32
  DXGI_ERROR_FRAME_STATISTICS_DISJOINT = -2005270517_i32
  DXGI_ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE = -2005270516_i32
  DXGI_ERROR_DRIVER_INTERNAL_ERROR = -2005270496_i32
  DXGI_ERROR_NONEXCLUSIVE = -2005270495_i32
  DXGI_ERROR_NOT_CURRENTLY_AVAILABLE = -2005270494_i32
  DXGI_ERROR_REMOTE_CLIENT_DISCONNECTED = -2005270493_i32
  DXGI_ERROR_REMOTE_OUTOFMEMORY = -2005270492_i32
  DXGI_ERROR_ACCESS_LOST = -2005270490_i32
  DXGI_ERROR_WAIT_TIMEOUT = -2005270489_i32
  DXGI_ERROR_SESSION_DISCONNECTED = -2005270488_i32
  DXGI_ERROR_RESTRICT_TO_OUTPUT_STALE = -2005270487_i32
  DXGI_ERROR_CANNOT_PROTECT_CONTENT = -2005270486_i32
  DXGI_ERROR_ACCESS_DENIED = -2005270485_i32
  DXGI_ERROR_NAME_ALREADY_EXISTS = -2005270484_i32
  DXGI_ERROR_SDK_COMPONENT_MISSING = -2005270483_i32
  DXGI_ERROR_NOT_CURRENT = -2005270482_i32
  DXGI_ERROR_HW_PROTECTION_OUTOFMEMORY = -2005270480_i32
  DXGI_ERROR_DYNAMIC_CODE_POLICY_VIOLATION = -2005270479_i32
  DXGI_ERROR_NON_COMPOSITED_UI = -2005270478_i32
  DXGI_ERROR_MODE_CHANGE_IN_PROGRESS = -2005270491_i32
  DXGI_ERROR_CACHE_CORRUPT = -2005270477_i32
  DXGI_ERROR_CACHE_FULL = -2005270476_i32
  DXGI_ERROR_CACHE_HASH_COLLISION = -2005270475_i32
  DXGI_ERROR_ALREADY_EXISTS = -2005270474_i32

  enum DXGI_RESOURCE_PRIORITY : UInt32
    DXGI_RESOURCE_PRIORITY_MINIMUM = 671088640_u32
    DXGI_RESOURCE_PRIORITY_LOW = 1342177280_u32
    DXGI_RESOURCE_PRIORITY_NORMAL = 2013265920_u32
    DXGI_RESOURCE_PRIORITY_HIGH = 2684354560_u32
    DXGI_RESOURCE_PRIORITY_MAXIMUM = 3355443200_u32
  end
  enum DXGI_RESIDENCY
    DXGI_RESIDENCY_FULLY_RESIDENT = 1_i32
    DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY = 2_i32
    DXGI_RESIDENCY_EVICTED_TO_DISK = 3_i32
  end
  enum DXGI_SWAP_EFFECT
    DXGI_SWAP_EFFECT_DISCARD = 0_i32
    DXGI_SWAP_EFFECT_SEQUENTIAL = 1_i32
    DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL = 3_i32
    DXGI_SWAP_EFFECT_FLIP_DISCARD = 4_i32
  end
  enum DXGI_SWAP_CHAIN_FLAG
    DXGI_SWAP_CHAIN_FLAG_NONPREROTATED = 1_i32
    DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH = 2_i32
    DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE = 4_i32
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT = 8_i32
    DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER = 16_i32
    DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY = 32_i32
    DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT = 64_i32
    DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER = 128_i32
    DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO = 256_i32
    DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO = 512_i32
    DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED = 1024_i32
    DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING = 2048_i32
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS = 4096_i32
  end
  @[Flags]
  enum DXGI_ADAPTER_FLAG : UInt32
    DXGI_ADAPTER_FLAG_NONE = 0_u32
    DXGI_ADAPTER_FLAG_REMOTE = 1_u32
    DXGI_ADAPTER_FLAG_SOFTWARE = 2_u32
  end
  enum DXGI_OUTDUPL_POINTER_SHAPE_TYPE
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME = 1_i32
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_COLOR = 2_i32
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR = 4_i32
  end
  enum DXGI_OFFER_RESOURCE_PRIORITY
    DXGI_OFFER_RESOURCE_PRIORITY_LOW = 1_i32
    DXGI_OFFER_RESOURCE_PRIORITY_NORMAL = 2_i32
    DXGI_OFFER_RESOURCE_PRIORITY_HIGH = 3_i32
  end
  enum DXGI_SCALING
    DXGI_SCALING_STRETCH = 0_i32
    DXGI_SCALING_NONE = 1_i32
    DXGI_SCALING_ASPECT_RATIO_STRETCH = 2_i32
  end
  enum DXGI_GRAPHICS_PREEMPTION_GRANULARITY
    DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY = 0_i32
    DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY = 1_i32
    DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY = 2_i32
    DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY = 3_i32
    DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY = 4_i32
  end
  enum DXGI_COMPUTE_PREEMPTION_GRANULARITY
    DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY = 0_i32
    DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY = 1_i32
    DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY = 2_i32
    DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY = 3_i32
    DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY = 4_i32
  end
  enum DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE = 1_i32
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709 = 2_i32
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC = 4_i32
  end
  enum DXGI_FRAME_PRESENTATION_MODE
    DXGI_FRAME_PRESENTATION_MODE_COMPOSED = 0_i32
    DXGI_FRAME_PRESENTATION_MODE_OVERLAY = 1_i32
    DXGI_FRAME_PRESENTATION_MODE_NONE = 2_i32
    DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE = 3_i32
  end
  enum DXGI_OVERLAY_SUPPORT_FLAG
    DXGI_OVERLAY_SUPPORT_FLAG_DIRECT = 1_i32
    DXGI_OVERLAY_SUPPORT_FLAG_SCALING = 2_i32
  end
  enum DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 1_i32
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_OVERLAY_PRESENT = 2_i32
  end
  enum DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG
    DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 1_i32
  end
  enum DXGI_MEMORY_SEGMENT_GROUP
    DXGI_MEMORY_SEGMENT_GROUP_LOCAL = 0_i32
    DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL = 1_i32
  end
  enum DXGI_OUTDUPL_FLAG
    DXGI_OUTDUPL_COMPOSITED_UI_CAPTURE_ONLY = 1_i32
  end
  enum DXGI_HDR_METADATA_TYPE
    DXGI_HDR_METADATA_TYPE_NONE = 0_i32
    DXGI_HDR_METADATA_TYPE_HDR10 = 1_i32
    DXGI_HDR_METADATA_TYPE_HDR10PLUS = 2_i32
  end
  enum DXGI_OFFER_RESOURCE_FLAGS
    DXGI_OFFER_RESOURCE_FLAG_ALLOW_DECOMMIT = 1_i32
  end
  enum DXGI_RECLAIM_RESOURCE_RESULTS
    DXGI_RECLAIM_RESOURCE_RESULT_OK = 0_i32
    DXGI_RECLAIM_RESOURCE_RESULT_DISCARDED = 1_i32
    DXGI_RECLAIM_RESOURCE_RESULT_NOT_COMMITTED = 2_i32
  end
  enum DXGI_FEATURE
    DXGI_FEATURE_PRESENT_ALLOW_TEARING = 0_i32
  end
  @[Flags]
  enum DXGI_ADAPTER_FLAG3 : UInt32
    DXGI_ADAPTER_FLAG3_NONE = 0_u32
    DXGI_ADAPTER_FLAG3_REMOTE = 1_u32
    DXGI_ADAPTER_FLAG3_SOFTWARE = 2_u32
    DXGI_ADAPTER_FLAG3_ACG_COMPATIBLE = 4_u32
    DXGI_ADAPTER_FLAG3_SUPPORT_MONITORED_FENCES = 8_u32
    DXGI_ADAPTER_FLAG3_SUPPORT_NON_MONITORED_FENCES = 16_u32
    DXGI_ADAPTER_FLAG3_KEYED_MUTEX_CONFORMANCE = 32_u32
    DXGI_ADAPTER_FLAG3_FORCE_DWORD = 4294967295_u32
  end
  @[Flags]
  enum DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS : UInt32
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_FULLSCREEN = 1_u32
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_WINDOWED = 2_u32
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_CURSOR_STRETCHED = 4_u32
  end
  enum DXGI_GPU_PREFERENCE
    DXGI_GPU_PREFERENCE_UNSPECIFIED = 0_i32
    DXGI_GPU_PREFERENCE_MINIMUM_POWER = 1_i32
    DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE = 2_i32
  end
  @[Flags]
  enum DXGI_DEBUG_RLO_FLAGS : UInt32
    DXGI_DEBUG_RLO_SUMMARY = 1_u32
    DXGI_DEBUG_RLO_DETAIL = 2_u32
    DXGI_DEBUG_RLO_IGNORE_INTERNAL = 4_u32
    DXGI_DEBUG_RLO_ALL = 7_u32
  end
  enum DXGI_INFO_QUEUE_MESSAGE_CATEGORY
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_UNKNOWN = 0_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_MISCELLANEOUS = 1_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_INITIALIZATION = 2_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_CLEANUP = 3_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_COMPILATION = 4_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_CREATION = 5_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_SETTING = 6_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_GETTING = 7_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_RESOURCE_MANIPULATION = 8_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_EXECUTION = 9_i32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_SHADER = 10_i32
  end
  enum DXGI_INFO_QUEUE_MESSAGE_SEVERITY
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_CORRUPTION = 0_i32
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_ERROR = 1_i32
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_WARNING = 2_i32
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_INFO = 3_i32
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_MESSAGE = 4_i32
  end
  enum DXGI_Message_Id
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow = 0_i32
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred = 1_i32
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred = 2_i32
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged = 3_i32
    DXGI_MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded = 4_i32
    DXGI_MSG_IDXGISwapChain_Creation_TooFewBuffers = 5_i32
    DXGI_MSG_IDXGISwapChain_Creation_NoOutputWindow = 6_i32
    DXGI_MSG_IDXGISwapChain_Destruction_OtherMethodsCalled = 7_i32
    DXGI_MSG_IDXGISwapChain_GetDesc_pDescIsNULL = 8_i32
    DXGI_MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL = 9_i32
    DXGI_MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers = 10_i32
    DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero = 11_i32
    DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferOOB = 12_i32
    DXGI_MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL = 13_i32
    DXGI_MSG_IDXGISwapChain_Present_SyncIntervalOOB = 14_i32
    DXGI_MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag = 15_i32
    DXGI_MSG_IDXGISwapChain_Present_NoAllocatedBuffers = 16_i32
    DXGI_MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed = 17_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB = 18_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences = 19_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag = 20_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag = 21_i32
    DXGI_MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero = 22_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget = 23_i32
    DXGI_MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL = 24_i32
    DXGI_MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL = 25_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported = 26_i32
    DXGI_MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex = 27_i32
    DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL = 28_i32
    DXGI_MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL = 29_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL = 30_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL = 31_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect = 32_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFlags = 33_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed = 34_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface = 35_i32
    DXGI_MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL = 36_i32
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags = 37_i32
    DXGI_MSG_IDXGISurface_Map_InvalidSurface = 38_i32
    DXGI_MSG_IDXGISurface_Map_FlagsSetToZero = 39_i32
    DXGI_MSG_IDXGISurface_Map_DiscardAndReadFlagSet = 40_i32
    DXGI_MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet = 41_i32
    DXGI_MSG_IDXGISurface_Map_NoCPUAccess = 42_i32
    DXGI_MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic = 43_i32
    DXGI_MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic = 44_i32
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL = 45_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight = 46_i32
    DXGI_MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice = 47_i32
    DXGI_MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL = 48_i32
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice = 49_i32
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL = 50_i32
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed = 51_i32
    DXGI_MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice = 52_i32
    DXGI_MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL = 53_i32
    DXGI_MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice = 54_i32
    DXGI_MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice = 55_i32
    DXGI_MSG_IDXGIOutput_GetGammaControl_NoGammaControls = 56_i32
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary = 57_i32
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid = 58_i32
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice = 59_i32
    DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported = 60_i32
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported = 61_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported = 62_i32
    DXGI_MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource = 63_i32
    DXGI_MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL = 64_i32
    DXGI_MSG_IDXGISwapChain_Creation_InvalidOutputWindow = 65_i32
    DXGI_MSG_IDXGISwapChain_Release_SwapChainIsFullscreen = 66_i32
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat = 67_i32
    DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL = 68_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice = 69_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL = 70_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero = 71_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration = 72_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering = 73_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling = 74_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination = 75_i32
    DXGI_MSG_IDXGIFactory_Creation_CalledFromDllMain = 76_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice = 77_i32
    DXGI_MSG_IDXGISwapChain_Creation_InvalidWindowStyle = 78_i32
    DXGI_MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics = 79_i32
    DXGI_MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput = 80_i32
    DXGI_MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL = 81_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows = 82_i32
    DXGI_MSG_IDXGIFactory_Release_CalledFromDllMain = 83_i32
    DXGI_MSG_IDXGISwapChain_Present_UnreleasedHDC = 84_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags = 85_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags = 86_i32
    DXGI_MSG_IDXGISurface1_GetDC_pHdcIsNULL = 87_i32
    DXGI_MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D = 88_i32
    DXGI_MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet = 89_i32
    DXGI_MSG_IDXGISurface1_GetDC_UnreleasedHDC = 90_i32
    DXGI_MSG_IDXGISurface_Map_NoCPUAccess2 = 91_i32
    DXGI_MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled = 92_i32
    DXGI_MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions = 93_i32
    DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported = 94_i32
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported = 95_i32
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported = 96_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory = 97_i32
    DXGI_MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration = 98_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10 = 99_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential = 100_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential = 101_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential = 102_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential = 103_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential = 104_i32
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation = 105_i32
    DXGI_MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid = 106_i32
    DXGI_MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag = 107_i32
    DXGI_MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified = 108_i32
    DXGI_MSG_IDXGISwapChain_Present_EmptyScrollRect = 109_i32
    DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds = 110_i32
    DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset = 111_i32
    DXGI_MSG_IDXGISwapChain_Present_EmptyDirtyRect = 112_i32
    DXGI_MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds = 113_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags = 114_i32
    DXGI_MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined = 115_i32
    DXGI_MSG_IDXGISwapChain_Present_UnsupportedFlags = 116_i32
    DXGI_MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition = 117_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory = 118_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter = 119_i32
    DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput = 120_i32
    DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen = 121_i32
    DXGI_MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain = 122_i32
    DXGI_MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag = 123_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0 = 124_i32
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0 = 125_i32
    DXGI_MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0 = 126_i32
    DXGI_MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0 = 127_i32
    DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled = 128_i32
    DXGI_MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound = 129_i32
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay = 130_i32
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential = 131_i32
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver = 132_i32
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity = 133_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero = 134_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported = 135_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter = 136_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7 = 137_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain = 138_i32
    DXGI_MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain = 139_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero = 140_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly = 141_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized = 142_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported = 143_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported = 144_i32
    DXGI_MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly = 145_i32
    DXGI_MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly = 146_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported = 147_i32
    DXGI_MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange = 148_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported = 149_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported = 150_i32
    DXGI_MSG_IDXGISwapchain_Present_ScrollUnsupported = 151_i32
    DXGI_MSG_IDXGISwapChain1_SetRotation_UnsupportedOS = 152_i32
    DXGI_MSG_IDXGISwapChain1_GetRotation_UnsupportedOS = 153_i32
    DXGI_MSG_IDXGISwapchain_Present_FullscreenRotation = 154_i32
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers = 155_i32
    DXGI_MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired = 156_i32
    DXGI_MSG_IDXGISwapChain1_SetRotation_InvalidRotation = 157_i32
    DXGI_MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired = 158_i32
    DXGI_MSG_IDXGISwapChain_GetHwnd_WrongType = 159_i32
    DXGI_MSG_IDXGISwapChain_GetCompositionSurface_WrongType = 160_i32
    DXGI_MSG_IDXGISwapChain_GetCoreWindow_WrongType = 161_i32
    DXGI_MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd = 162_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_CoreWindow = 163_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7 = 164_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL = 165_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps = 166_i32
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_ModernApp = 167_i32
    DXGI_MSG_IDXGISwapChain_ResizeTarget_ModernApp = 168_i32
    DXGI_MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL = 169_i32
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_ModernApp = 170_i32
    DXGI_MSG_IDXGIOutput_TakeOwnership_ModernApp = 171_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid = 172_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle = 173_i32
    DXGI_MSG_IDXGISurface1_GetDC_ModernApp = 174_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer = 175_i32
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight = 176_i32
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence = 177_i32
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo = 178_i32
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported = 179_i32
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch = 180_i32
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard = 181_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized = 182_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly = 183_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly = 184_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch = 185_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy = 186_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy = 187_i32
    DXGI_MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex = 188_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling = 189_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect = 190_i32
    DXGI_MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS = 191_i32
    DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS = 192_i32
    DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS = 193_i32
    DXGI_MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS = 194_i32
    DXGI_MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS = 195_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode = 196_i32
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource = 197_i32
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID = 198_i32
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS = 199_i32
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly = 200_i32
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly = 201_i32
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite = 202_i32
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared = 203_i32
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1 = 204_i32
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource = 205_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps = 206_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated = 207_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 208_i32
    DXGI_MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 209_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly = 210_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen = 211_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_Waitable = 212_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag = 213_i32
    DXGI_MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable = 214_i32
    DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable = 215_i32
    DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL = 216_i32
    DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable = 217_i32
    DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds = 218_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly = 219_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter = 220_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling = 221_i32
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode = 222_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag = 223_i32
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull = 224_i32
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain = 225_i32
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite = 226_i32
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale = 227_i32
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull = 228_i32
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain = 229_i32
    DXGI_MSG_DXGIGetDebugInterface1_NULL_ppDebug = 230_i32
    DXGI_MSG_DXGIGetDebugInterface1_InvalidFlags = 231_i32
    DXGI_MSG_IDXGISwapChain_Present_Decode = 232_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_Decode = 233_i32
    DXGI_MSG_IDXGISwapChain_SetSourceSize_FlipModel = 234_i32
    DXGI_MSG_IDXGISwapChain_SetSourceSize_Decode = 235_i32
    DXGI_MSG_IDXGISwapChain_SetSourceSize_WidthHeight = 236_i32
    DXGI_MSG_IDXGISwapChain_GetSourceSize_NullPointers = 237_i32
    DXGI_MSG_IDXGISwapChain_GetSourceSize_Decode = 238_i32
    DXGI_MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags = 239_i32
    DXGI_MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect = 240_i32
    DXGI_MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect = 241_i32
    DXGI_MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize = 242_i32
    DXGI_MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer = 243_i32
    DXGI_MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer = 244_i32
    DXGI_MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer = 245_i32
    DXGI_MSG_IDXGISwapChain_PresentBuffer_YUV = 246_i32
    DXGI_MSG_IDXGISwapChain_SetSourceSize_YUV = 247_i32
    DXGI_MSG_IDXGISwapChain_GetSourceSize_YUV = 248_i32
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_YUV = 249_i32
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_YUV = 250_i32
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentation_YUV = 251_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV = 252_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV = 253_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV = 254_i32
    DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers = 255_i32
    DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice = 256_i32
    DXGI_MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag = 257_i32
    DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard = 258_i32
    DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers = 259_i32
    DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice = 260_i32
    DXGI_MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers = 261_i32
    DXGI_MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace = 262_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect = 263_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported = 264_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect = 265_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported = 266_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only = 267_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_FlipModel = 268_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired = 269_i32
    DXGI_MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag = 270_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag = 271_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported = 272_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired = 273_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidDevice = 274_i32
    DXGI_MSG_IDXGIOutput_TakeOwnership_Unsupported = 275_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidQueue = 276_i32
    DXGI_MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue = 277_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling = 278_i32
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize = 279_i32
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer = 280_i32
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType = 281_i32
    DXGI_MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid = 282_i32
    DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero = 283_i32
    DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag = 284_i32
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag = 285_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly = 286_i32
    DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature = 287_i32
    DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize = 288_i32
    DXGI_MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer = 289_i32
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied = 290_i32
    DXGI_MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied = 291_i32
    DXGI_MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired = 292_i32
    DXGI_MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound = 293_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect = 294_i32
    DXGI_MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged = 295_i32
    DXGI_MSG_IDXGISwapChain_Present_11On12_Released_Resource = 296_i32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr = 297_i32
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior = 298_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow = 1000_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount = 1001_i32
    DXGI_MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable = 1002_i32
    DXGI_MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable = 1003_i32
    DXGI_MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable = 1004_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex = 1005_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex = 1006_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag = 1007_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidRotation = 1008_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidBlend = 1009_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidResource = 1010_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource = 1011_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary = 1012_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay = 1013_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex = 1014_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect = 1015_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect = 1016_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleResource = 1017_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_NotSharedResource = 1018_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidFlag = 1019_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidInterval = 1020_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported = 1021_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp = 1022_i32
    DXGI_MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp = 1023_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1 = 1024_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor = 1025_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering = 1026_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount = 1027_i32
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only = 1028_i32
    DXGI_MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays = 1029_i32
    DXGI_MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired = 1030_i32
    DXGI_MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired = 1031_i32
  end

  @[Extern]
  record DXGI_RGBA,
    r : Float32,
    g : Float32,
    b : Float32,
    a : Float32

  @[Extern]
  record DXGI_FRAME_STATISTICS,
    present_count : UInt32,
    present_refresh_count : UInt32,
    sync_refresh_count : UInt32,
    sync_qpc_time : Win32cr::Foundation::LARGE_INTEGER,
    sync_gpu_time : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record DXGI_MAPPED_RECT,
    pitch : Int32,
    pBits : UInt8*

  @[Extern]
  record DXGI_ADAPTER_DESC,
    description : UInt16[128],
    vendor_id : UInt32,
    device_id : UInt32,
    sub_sys_id : UInt32,
    revision : UInt32,
    dedicated_video_memory : LibC::UIntPtrT,
    dedicated_system_memory : LibC::UIntPtrT,
    shared_system_memory : LibC::UIntPtrT,
    adapter_luid : Win32cr::Foundation::LUID

  @[Extern]
  record DXGI_OUTPUT_DESC,
    device_name : UInt16[32],
    desktop_coordinates : Win32cr::Foundation::RECT,
    attached_to_desktop : Win32cr::Foundation::BOOL,
    rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION,
    monitor : Win32cr::Graphics::Gdi::HMONITOR

  @[Extern]
  record DXGI_SHARED_RESOURCE,
    handle : Win32cr::Foundation::HANDLE

  @[Extern]
  record DXGI_SURFACE_DESC,
    width : UInt32,
    height : UInt32,
    format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT,
    sample_desc : Win32cr::Graphics::Dxgi::Common::DXGI_SAMPLE_DESC

  @[Extern]
  record DXGI_SWAP_CHAIN_DESC,
    buffer_desc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC,
    sample_desc : Win32cr::Graphics::Dxgi::Common::DXGI_SAMPLE_DESC,
    buffer_usage : UInt32,
    buffer_count : UInt32,
    output_window : Win32cr::Foundation::HWND,
    windowed : Win32cr::Foundation::BOOL,
    swap_effect : Win32cr::Graphics::Dxgi::DXGI_SWAP_EFFECT,
    flags : UInt32

  @[Extern]
  record DXGI_ADAPTER_DESC1,
    description : UInt16[128],
    vendor_id : UInt32,
    device_id : UInt32,
    sub_sys_id : UInt32,
    revision : UInt32,
    dedicated_video_memory : LibC::UIntPtrT,
    dedicated_system_memory : LibC::UIntPtrT,
    shared_system_memory : LibC::UIntPtrT,
    adapter_luid : Win32cr::Foundation::LUID,
    flags : UInt32

  @[Extern]
  record DXGI_DISPLAY_COLOR_SPACE,
    primary_coordinates : Float32[16],
    white_points : Float32[32]

  @[Extern]
  record DXGI_OUTDUPL_MOVE_RECT,
    source_point : Win32cr::Foundation::POINT,
    destination_rect : Win32cr::Foundation::RECT

  @[Extern]
  record DXGI_OUTDUPL_DESC,
    mode_desc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC,
    rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION,
    desktop_image_in_system_memory : Win32cr::Foundation::BOOL

  @[Extern]
  record DXGI_OUTDUPL_POINTER_POSITION,
    position : Win32cr::Foundation::POINT,
    visible : Win32cr::Foundation::BOOL

  @[Extern]
  record DXGI_OUTDUPL_POINTER_SHAPE_INFO,
    type__ : UInt32,
    width : UInt32,
    height : UInt32,
    pitch : UInt32,
    hot_spot : Win32cr::Foundation::POINT

  @[Extern]
  record DXGI_OUTDUPL_FRAME_INFO,
    last_present_time : Win32cr::Foundation::LARGE_INTEGER,
    last_mouse_update_time : Win32cr::Foundation::LARGE_INTEGER,
    accumulated_frames : UInt32,
    rects_coalesced : Win32cr::Foundation::BOOL,
    protected_content_masked_out : Win32cr::Foundation::BOOL,
    pointer_position : Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_POINTER_POSITION,
    total_metadata_buffer_size : UInt32,
    pointer_shape_buffer_size : UInt32

  @[Extern]
  record DXGI_MODE_DESC1,
    width : UInt32,
    height : UInt32,
    refresh_rate : Win32cr::Graphics::Dxgi::Common::DXGI_RATIONAL,
    format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT,
    scanline_ordering : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_SCANLINE_ORDER,
    scaling : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_SCALING,
    stereo : Win32cr::Foundation::BOOL

  @[Extern]
  record DXGI_SWAP_CHAIN_DESC1,
    width : UInt32,
    height : UInt32,
    format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT,
    stereo : Win32cr::Foundation::BOOL,
    sample_desc : Win32cr::Graphics::Dxgi::Common::DXGI_SAMPLE_DESC,
    buffer_usage : UInt32,
    buffer_count : UInt32,
    scaling : Win32cr::Graphics::Dxgi::DXGI_SCALING,
    swap_effect : Win32cr::Graphics::Dxgi::DXGI_SWAP_EFFECT,
    alpha_mode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE,
    flags : UInt32

  @[Extern]
  record DXGI_SWAP_CHAIN_FULLSCREEN_DESC,
    refresh_rate : Win32cr::Graphics::Dxgi::Common::DXGI_RATIONAL,
    scanline_ordering : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_SCANLINE_ORDER,
    scaling : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_SCALING,
    windowed : Win32cr::Foundation::BOOL

  @[Extern]
  record DXGI_PRESENT_PARAMETERS,
    dirty_rects_count : UInt32,
    pDirtyRects : Win32cr::Foundation::RECT*,
    pScrollRect : Win32cr::Foundation::RECT*,
    pScrollOffset : Win32cr::Foundation::POINT*

  @[Extern]
  record DXGI_ADAPTER_DESC2,
    description : UInt16[128],
    vendor_id : UInt32,
    device_id : UInt32,
    sub_sys_id : UInt32,
    revision : UInt32,
    dedicated_video_memory : LibC::UIntPtrT,
    dedicated_system_memory : LibC::UIntPtrT,
    shared_system_memory : LibC::UIntPtrT,
    adapter_luid : Win32cr::Foundation::LUID,
    flags : UInt32,
    graphics_preemption_granularity : Win32cr::Graphics::Dxgi::DXGI_GRAPHICS_PREEMPTION_GRANULARITY,
    compute_preemption_granularity : Win32cr::Graphics::Dxgi::DXGI_COMPUTE_PREEMPTION_GRANULARITY

  @[Extern]
  record DXGI_MATRIX_3X2_F,
    _11 : Float32,
    _12 : Float32,
    _21 : Float32,
    _22 : Float32,
    _31 : Float32,
    _32 : Float32

  @[Extern]
  record DXGI_DECODE_SWAP_CHAIN_DESC,
    flags : UInt32

  @[Extern]
  record DXGI_FRAME_STATISTICS_MEDIA,
    present_count : UInt32,
    present_refresh_count : UInt32,
    sync_refresh_count : UInt32,
    sync_qpc_time : Win32cr::Foundation::LARGE_INTEGER,
    sync_gpu_time : Win32cr::Foundation::LARGE_INTEGER,
    composition_mode : Win32cr::Graphics::Dxgi::DXGI_FRAME_PRESENTATION_MODE,
    approved_present_duration : UInt32

  @[Extern]
  record DXGI_QUERY_VIDEO_MEMORY_INFO,
    budget : UInt64,
    current_usage : UInt64,
    available_for_reservation : UInt64,
    current_reservation : UInt64

  @[Extern]
  record DXGI_HDR_METADATA_HDR10,
    red_primary : UInt16[2],
    green_primary : UInt16[2],
    blue_primary : UInt16[2],
    white_point : UInt16[2],
    max_mastering_luminance : UInt32,
    min_mastering_luminance : UInt32,
    max_content_light_level : UInt16,
    max_frame_average_light_level : UInt16

  @[Extern]
  record DXGI_HDR_METADATA_HDR10PLUS,
    data : UInt8[72]

  @[Extern]
  record DXGI_ADAPTER_DESC3,
    description : UInt16[128],
    vendor_id : UInt32,
    device_id : UInt32,
    sub_sys_id : UInt32,
    revision : UInt32,
    dedicated_video_memory : LibC::UIntPtrT,
    dedicated_system_memory : LibC::UIntPtrT,
    shared_system_memory : LibC::UIntPtrT,
    adapter_luid : Win32cr::Foundation::LUID,
    flags : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_FLAG3,
    graphics_preemption_granularity : Win32cr::Graphics::Dxgi::DXGI_GRAPHICS_PREEMPTION_GRANULARITY,
    compute_preemption_granularity : Win32cr::Graphics::Dxgi::DXGI_COMPUTE_PREEMPTION_GRANULARITY

  @[Extern]
  record DXGI_OUTPUT_DESC1,
    device_name : UInt16[32],
    desktop_coordinates : Win32cr::Foundation::RECT,
    attached_to_desktop : Win32cr::Foundation::BOOL,
    rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION,
    monitor : Win32cr::Graphics::Gdi::HMONITOR,
    bits_per_color : UInt32,
    color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE,
    red_primary : Float32[2],
    green_primary : Float32[2],
    blue_primary : Float32[2],
    white_point : Float32[2],
    min_luminance : Float32,
    max_luminance : Float32,
    max_full_frame_luminance : Float32

  @[Extern]
  record DXGI_INFO_QUEUE_MESSAGE,
    producer : LibC::GUID,
    category : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY,
    severity : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY,
    id : Int32,
    pDescription : UInt8*,
    description_byte_length : LibC::UIntPtrT

  @[Extern]
  record DXGI_INFO_QUEUE_FILTER_DESC,
    num_categories : UInt32,
    pCategoryList : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY*,
    num_severities : UInt32,
    pSeverityList : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY*,
    num_i_ds : UInt32,
    pIDList : Int32*

  @[Extern]
  record DXGI_INFO_QUEUE_FILTER,
    allow_list : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER_DESC,
    deny_list : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER_DESC

  @[Extern]
  record IDXGIObjectVtbl,
    query_interface : Proc(IDXGIObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIObject*, UInt32),
    release : Proc(IDXGIObject*, UInt32),
    set_private_data : Proc(IDXGIObject*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIObject*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIObject*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aec22fb8-76f3-4639-9be0-28eb43a67a2e")]
  record IDXGIObject, lpVtbl : IDXGIObjectVtbl* do
    GUID = LibC::GUID.new(0xaec22fb8_u32, 0x76f3_u16, 0x4639_u16, StaticArray[0x9b_u8, 0xe0_u8, 0x28_u8, 0xeb_u8, 0x43_u8, 0xa6_u8, 0x7a_u8, 0x2e_u8])
    def query_interface(this : IDXGIObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIObject*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIObject*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIObject*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIObject*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end

  end

  @[Extern]
  record IDXGIDeviceSubObjectVtbl,
    query_interface : Proc(IDXGIDeviceSubObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDeviceSubObject*, UInt32),
    release : Proc(IDXGIDeviceSubObject*, UInt32),
    set_private_data : Proc(IDXGIDeviceSubObject*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIDeviceSubObject*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIDeviceSubObject*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIDeviceSubObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGIDeviceSubObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3d3e0379-f9de-4d58-bb6c-18d62992f1a6")]
  record IDXGIDeviceSubObject, lpVtbl : IDXGIDeviceSubObjectVtbl* do
    GUID = LibC::GUID.new(0x3d3e0379_u32, 0xf9de_u16, 0x4d58_u16, StaticArray[0xbb_u8, 0x6c_u8, 0x18_u8, 0xd6_u8, 0x29_u8, 0x92_u8, 0xf1_u8, 0xa6_u8])
    def query_interface(this : IDXGIDeviceSubObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDeviceSubObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDeviceSubObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIDeviceSubObject*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIDeviceSubObject*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIDeviceSubObject*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIDeviceSubObject*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGIDeviceSubObject*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end

  end

  @[Extern]
  record IDXGIResourceVtbl,
    query_interface : Proc(IDXGIResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIResource*, UInt32),
    release : Proc(IDXGIResource*, UInt32),
    set_private_data : Proc(IDXGIResource*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIResource*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIResource*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGIResource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_handle : Proc(IDXGIResource*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_usage : Proc(IDXGIResource*, UInt32*, Win32cr::Foundation::HRESULT),
    set_eviction_priority : Proc(IDXGIResource*, Win32cr::Graphics::Dxgi::DXGI_RESOURCE_PRIORITY, Win32cr::Foundation::HRESULT),
    get_eviction_priority : Proc(IDXGIResource*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("035f3ab4-482e-4e50-b41f-8a7f8bd8960b")]
  record IDXGIResource, lpVtbl : IDXGIResourceVtbl* do
    GUID = LibC::GUID.new(0x35f3ab4_u32, 0x482e_u16, 0x4e50_u16, StaticArray[0xb4_u8, 0x1f_u8, 0x8a_u8, 0x7f_u8, 0x8b_u8, 0xd8_u8, 0x96_u8, 0xb_u8])
    def query_interface(this : IDXGIResource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIResource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIResource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIResource*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIResource*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIResource*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIResource*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGIResource*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def get_shared_handle(this : IDXGIResource*, pSharedHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_handle.call(this, pSharedHandle)
    end
    def get_usage(this : IDXGIResource*, pUsage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_usage.call(this, pUsage)
    end
    def set_eviction_priority(this : IDXGIResource*, eviction_priority : Win32cr::Graphics::Dxgi::DXGI_RESOURCE_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_eviction_priority.call(this, eviction_priority)
    end
    def get_eviction_priority(this : IDXGIResource*, pEvictionPriority : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eviction_priority.call(this, pEvictionPriority)
    end

  end

  @[Extern]
  record IDXGIKeyedMutexVtbl,
    query_interface : Proc(IDXGIKeyedMutex*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIKeyedMutex*, UInt32),
    release : Proc(IDXGIKeyedMutex*, UInt32),
    set_private_data : Proc(IDXGIKeyedMutex*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIKeyedMutex*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIKeyedMutex*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIKeyedMutex*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGIKeyedMutex*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    acquire_sync : Proc(IDXGIKeyedMutex*, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    release_sync : Proc(IDXGIKeyedMutex*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9d8e1289-d7b3-465f-8126-250e349af85d")]
  record IDXGIKeyedMutex, lpVtbl : IDXGIKeyedMutexVtbl* do
    GUID = LibC::GUID.new(0x9d8e1289_u32, 0xd7b3_u16, 0x465f_u16, StaticArray[0x81_u8, 0x26_u8, 0x25_u8, 0xe_u8, 0x34_u8, 0x9a_u8, 0xf8_u8, 0x5d_u8])
    def query_interface(this : IDXGIKeyedMutex*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIKeyedMutex*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIKeyedMutex*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIKeyedMutex*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIKeyedMutex*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIKeyedMutex*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIKeyedMutex*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGIKeyedMutex*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def acquire_sync(this : IDXGIKeyedMutex*, key : UInt64, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_sync.call(this, key, dwMilliseconds)
    end
    def release_sync(this : IDXGIKeyedMutex*, key : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_sync.call(this, key)
    end

  end

  @[Extern]
  record IDXGISurfaceVtbl,
    query_interface : Proc(IDXGISurface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISurface*, UInt32),
    release : Proc(IDXGISurface*, UInt32),
    set_private_data : Proc(IDXGISurface*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISurface*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISurface*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISurface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISurface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISurface*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, Win32cr::Foundation::HRESULT),
    map : Proc(IDXGISurface*, Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, UInt32, Win32cr::Foundation::HRESULT),
    unmap : Proc(IDXGISurface*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cafcb56c-6ac3-4889-bf47-9e23bbd260ec")]
  record IDXGISurface, lpVtbl : IDXGISurfaceVtbl* do
    GUID = LibC::GUID.new(0xcafcb56c_u32, 0x6ac3_u16, 0x4889_u16, StaticArray[0xbf_u8, 0x47_u8, 0x9e_u8, 0x23_u8, 0xbb_u8, 0xd2_u8, 0x60_u8, 0xec_u8])
    def query_interface(this : IDXGISurface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISurface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISurface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISurface*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISurface*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISurface*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISurface*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISurface*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def get_desc(this : IDXGISurface*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def map(this : IDXGISurface*, pLockedRect : Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, map_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map.call(this, pLockedRect, map_flags)
    end
    def unmap(this : IDXGISurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmap.call(this)
    end

  end

  @[Extern]
  record IDXGISurface1Vtbl,
    query_interface : Proc(IDXGISurface1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISurface1*, UInt32),
    release : Proc(IDXGISurface1*, UInt32),
    set_private_data : Proc(IDXGISurface1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISurface1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISurface1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISurface1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISurface1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISurface1*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, Win32cr::Foundation::HRESULT),
    map : Proc(IDXGISurface1*, Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, UInt32, Win32cr::Foundation::HRESULT),
    unmap : Proc(IDXGISurface1*, Win32cr::Foundation::HRESULT),
    get_dc : Proc(IDXGISurface1*, Win32cr::Foundation::BOOL, Win32cr::Graphics::Gdi::HDC*, Win32cr::Foundation::HRESULT),
    release_dc : Proc(IDXGISurface1*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4ae63092-6327-4c1b-80ae-bfe12ea32b86")]
  record IDXGISurface1, lpVtbl : IDXGISurface1Vtbl* do
    GUID = LibC::GUID.new(0x4ae63092_u32, 0x6327_u16, 0x4c1b_u16, StaticArray[0x80_u8, 0xae_u8, 0xbf_u8, 0xe1_u8, 0x2e_u8, 0xa3_u8, 0x2b_u8, 0x86_u8])
    def query_interface(this : IDXGISurface1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISurface1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISurface1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISurface1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISurface1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISurface1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISurface1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISurface1*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def get_desc(this : IDXGISurface1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def map(this : IDXGISurface1*, pLockedRect : Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, map_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map.call(this, pLockedRect, map_flags)
    end
    def unmap(this : IDXGISurface1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmap.call(this)
    end
    def get_dc(this : IDXGISurface1*, discard : Win32cr::Foundation::BOOL, phdc : Win32cr::Graphics::Gdi::HDC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dc.call(this, discard, phdc)
    end
    def release_dc(this : IDXGISurface1*, pDirtyRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_dc.call(this, pDirtyRect)
    end

  end

  @[Extern]
  record IDXGIAdapterVtbl,
    query_interface : Proc(IDXGIAdapter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIAdapter*, UInt32),
    release : Proc(IDXGIAdapter*, UInt32),
    set_private_data : Proc(IDXGIAdapter*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIAdapter*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIAdapter*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIAdapter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_outputs : Proc(IDXGIAdapter*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIAdapter*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*, Win32cr::Foundation::HRESULT),
    check_interface_support : Proc(IDXGIAdapter*, LibC::GUID*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2411e7e1-12ac-4ccf-bd14-9798e8534dc0")]
  record IDXGIAdapter, lpVtbl : IDXGIAdapterVtbl* do
    GUID = LibC::GUID.new(0x2411e7e1_u32, 0x12ac_u16, 0x4ccf_u16, StaticArray[0xbd_u8, 0x14_u8, 0x97_u8, 0x98_u8, 0xe8_u8, 0x53_u8, 0x4d_u8, 0xc0_u8])
    def query_interface(this : IDXGIAdapter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIAdapter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIAdapter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIAdapter*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIAdapter*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIAdapter*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIAdapter*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_outputs(this : IDXGIAdapter*, output : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_outputs.call(this, output, ppOutput)
    end
    def get_desc(this : IDXGIAdapter*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def check_interface_support(this : IDXGIAdapter*, interface_name : LibC::GUID*, pUMDVersion : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_interface_support.call(this, interface_name, pUMDVersion)
    end

  end

  @[Extern]
  record IDXGIOutputVtbl,
    query_interface : Proc(IDXGIOutput*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput*, UInt32),
    release : Proc(IDXGIOutput*, UInt32),
    set_private_data : Proc(IDXGIOutput*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ae02eedb-c735-4690-8d52-5a8dc20213aa")]
  record IDXGIOutput, lpVtbl : IDXGIOutputVtbl* do
    GUID = LibC::GUID.new(0xae02eedb_u32, 0xc735_u16, 0x4690_u16, StaticArray[0x8d_u8, 0x52_u8, 0x5a_u8, 0x8d_u8, 0xc2_u8, 0x2_u8, 0x13_u8, 0xaa_u8])
    def query_interface(this : IDXGIOutput*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end

  end

  @[Extern]
  record IDXGISwapChainVtbl,
    query_interface : Proc(IDXGISwapChain*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISwapChain*, UInt32),
    release : Proc(IDXGISwapChain*, UInt32),
    set_private_data : Proc(IDXGISwapChain*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISwapChain*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISwapChain*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISwapChain*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISwapChain*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present : Proc(IDXGISwapChain*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(IDXGISwapChain*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_fullscreen_state : Proc(IDXGISwapChain*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    get_fullscreen_state : Proc(IDXGISwapChain*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISwapChain*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Win32cr::Foundation::HRESULT),
    resize_buffers : Proc(IDXGISwapChain*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, Win32cr::Foundation::HRESULT),
    resize_target : Proc(IDXGISwapChain*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    get_containing_output : Proc(IDXGISwapChain*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGISwapChain*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_last_present_count : Proc(IDXGISwapChain*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("310d36a0-d2e7-4c0a-aa04-6a9d23b8886a")]
  record IDXGISwapChain, lpVtbl : IDXGISwapChainVtbl* do
    GUID = LibC::GUID.new(0x310d36a0_u32, 0xd2e7_u16, 0x4c0a_u16, StaticArray[0xaa_u8, 0x4_u8, 0x6a_u8, 0x9d_u8, 0x23_u8, 0xb8_u8, 0x88_u8, 0x6a_u8])
    def query_interface(this : IDXGISwapChain*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISwapChain*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISwapChain*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISwapChain*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISwapChain*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISwapChain*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISwapChain*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISwapChain*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def present(this : IDXGISwapChain*, sync_interval : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this, sync_interval, flags)
    end
    def get_buffer(this : IDXGISwapChain*, buffer : UInt32, riid : LibC::GUID*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, buffer, riid, ppSurface)
    end
    def set_fullscreen_state(this : IDXGISwapChain*, fullscreen : Win32cr::Foundation::BOOL, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fullscreen_state.call(this, fullscreen, pTarget)
    end
    def get_fullscreen_state(this : IDXGISwapChain*, pFullscreen : Win32cr::Foundation::BOOL*, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_state.call(this, pFullscreen, ppTarget)
    end
    def get_desc(this : IDXGISwapChain*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def resize_buffers(this : IDXGISwapChain*, buffer_count : UInt32, width : UInt32, height : UInt32, new_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers.call(this, buffer_count, width, height, new_format, swap_chain_flags)
    end
    def resize_target(this : IDXGISwapChain*, pNewTargetParameters : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_target.call(this, pNewTargetParameters)
    end
    def get_containing_output(this : IDXGISwapChain*, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_output.call(this, ppOutput)
    end
    def get_frame_statistics(this : IDXGISwapChain*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_last_present_count(this : IDXGISwapChain*, pLastPresentCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_present_count.call(this, pLastPresentCount)
    end

  end

  @[Extern]
  record IDXGIFactoryVtbl,
    query_interface : Proc(IDXGIFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory*, UInt32),
    release : Proc(IDXGIFactory*, UInt32),
    set_private_data : Proc(IDXGIFactory*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7b7166ec-21c7-44ae-b21a-c9ae321ae369")]
  record IDXGIFactory, lpVtbl : IDXGIFactoryVtbl* do
    GUID = LibC::GUID.new(0x7b7166ec_u32, 0x21c7_u16, 0x44ae_u16, StaticArray[0xb2_u8, 0x1a_u8, 0xc9_u8, 0xae_u8, 0x32_u8, 0x1a_u8, 0xe3_u8, 0x69_u8])
    def query_interface(this : IDXGIFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end

  end

  @[Extern]
  record IDXGIDeviceVtbl,
    query_interface : Proc(IDXGIDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDevice*, UInt32),
    release : Proc(IDXGIDevice*, UInt32),
    set_private_data : Proc(IDXGIDevice*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIDevice*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIDevice*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter : Proc(IDXGIDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDXGIDevice*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, Void**, Win32cr::Foundation::HRESULT),
    query_resource_residency : Proc(IDXGIDevice*, Void**, Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, UInt32, Win32cr::Foundation::HRESULT),
    set_gpu_thread_priority : Proc(IDXGIDevice*, Int32, Win32cr::Foundation::HRESULT),
    get_gpu_thread_priority : Proc(IDXGIDevice*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("54ec77fa-1377-44e6-8c32-88fd5f44c84c")]
  record IDXGIDevice, lpVtbl : IDXGIDeviceVtbl* do
    GUID = LibC::GUID.new(0x54ec77fa_u32, 0x1377_u16, 0x44e6_u16, StaticArray[0x8c_u8, 0x32_u8, 0x88_u8, 0xfd_u8, 0x5f_u8, 0x44_u8, 0xc8_u8, 0x4c_u8])
    def query_interface(this : IDXGIDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIDevice*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIDevice*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIDevice*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIDevice*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_adapter(this : IDXGIDevice*, pAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter.call(this, pAdapter)
    end
    def create_surface(this : IDXGIDevice*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, num_surfaces : UInt32, usage : UInt32, pSharedResource : Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, pDesc, num_surfaces, usage, pSharedResource, ppSurface)
    end
    def query_resource_residency(this : IDXGIDevice*, ppResources : Void**, pResidencyStatus : Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, num_resources : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_resource_residency.call(this, ppResources, pResidencyStatus, num_resources)
    end
    def set_gpu_thread_priority(this : IDXGIDevice*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gpu_thread_priority.call(this, priority)
    end
    def get_gpu_thread_priority(this : IDXGIDevice*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpu_thread_priority.call(this, pPriority)
    end

  end

  @[Extern]
  record IDXGIFactory1Vtbl,
    query_interface : Proc(IDXGIFactory1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory1*, UInt32),
    release : Proc(IDXGIFactory1*, UInt32),
    set_private_data : Proc(IDXGIFactory1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory1*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory1*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory1*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory1*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory1*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory1*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory1*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("770aae78-f26f-4dba-a829-253c83d1b387")]
  record IDXGIFactory1, lpVtbl : IDXGIFactory1Vtbl* do
    GUID = LibC::GUID.new(0x770aae78_u32, 0xf26f_u16, 0x4dba_u16, StaticArray[0xa8_u8, 0x29_u8, 0x25_u8, 0x3c_u8, 0x83_u8, 0xd1_u8, 0xb3_u8, 0x87_u8])
    def query_interface(this : IDXGIFactory1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory1*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory1*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory1*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory1*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory1*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory1*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory1*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end

  end

  @[Extern]
  record IDXGIAdapter1Vtbl,
    query_interface : Proc(IDXGIAdapter1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIAdapter1*, UInt32),
    release : Proc(IDXGIAdapter1*, UInt32),
    set_private_data : Proc(IDXGIAdapter1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIAdapter1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIAdapter1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIAdapter1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_outputs : Proc(IDXGIAdapter1*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIAdapter1*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*, Win32cr::Foundation::HRESULT),
    check_interface_support : Proc(IDXGIAdapter1*, LibC::GUID*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGIAdapter1*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("29038f61-3839-4626-91fd-086879011a05")]
  record IDXGIAdapter1, lpVtbl : IDXGIAdapter1Vtbl* do
    GUID = LibC::GUID.new(0x29038f61_u32, 0x3839_u16, 0x4626_u16, StaticArray[0x91_u8, 0xfd_u8, 0x8_u8, 0x68_u8, 0x79_u8, 0x1_u8, 0x1a_u8, 0x5_u8])
    def query_interface(this : IDXGIAdapter1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIAdapter1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIAdapter1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIAdapter1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIAdapter1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIAdapter1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIAdapter1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_outputs(this : IDXGIAdapter1*, output : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_outputs.call(this, output, ppOutput)
    end
    def get_desc(this : IDXGIAdapter1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def check_interface_support(this : IDXGIAdapter1*, interface_name : LibC::GUID*, pUMDVersion : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_interface_support.call(this, interface_name, pUMDVersion)
    end
    def get_desc1(this : IDXGIAdapter1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end

  end

  @[Extern]
  record IDXGIDevice1Vtbl,
    query_interface : Proc(IDXGIDevice1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDevice1*, UInt32),
    release : Proc(IDXGIDevice1*, UInt32),
    set_private_data : Proc(IDXGIDevice1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIDevice1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIDevice1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIDevice1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter : Proc(IDXGIDevice1*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDXGIDevice1*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, Void**, Win32cr::Foundation::HRESULT),
    query_resource_residency : Proc(IDXGIDevice1*, Void**, Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, UInt32, Win32cr::Foundation::HRESULT),
    set_gpu_thread_priority : Proc(IDXGIDevice1*, Int32, Win32cr::Foundation::HRESULT),
    get_gpu_thread_priority : Proc(IDXGIDevice1*, Int32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGIDevice1*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGIDevice1*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("77db970f-6276-48ba-ba28-070143b4392c")]
  record IDXGIDevice1, lpVtbl : IDXGIDevice1Vtbl* do
    GUID = LibC::GUID.new(0x77db970f_u32, 0x6276_u16, 0x48ba_u16, StaticArray[0xba_u8, 0x28_u8, 0x7_u8, 0x1_u8, 0x43_u8, 0xb4_u8, 0x39_u8, 0x2c_u8])
    def query_interface(this : IDXGIDevice1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDevice1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDevice1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIDevice1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIDevice1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIDevice1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIDevice1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_adapter(this : IDXGIDevice1*, pAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter.call(this, pAdapter)
    end
    def create_surface(this : IDXGIDevice1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, num_surfaces : UInt32, usage : UInt32, pSharedResource : Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, pDesc, num_surfaces, usage, pSharedResource, ppSurface)
    end
    def query_resource_residency(this : IDXGIDevice1*, ppResources : Void**, pResidencyStatus : Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, num_resources : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_resource_residency.call(this, ppResources, pResidencyStatus, num_resources)
    end
    def set_gpu_thread_priority(this : IDXGIDevice1*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gpu_thread_priority.call(this, priority)
    end
    def get_gpu_thread_priority(this : IDXGIDevice1*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpu_thread_priority.call(this, pPriority)
    end
    def set_maximum_frame_latency(this : IDXGIDevice1*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGIDevice1*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end

  end

  @[Extern]
  record IDXGIDisplayControlVtbl,
    query_interface : Proc(IDXGIDisplayControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDisplayControl*, UInt32),
    release : Proc(IDXGIDisplayControl*, UInt32),
    is_stereo_enabled : Proc(IDXGIDisplayControl*, Win32cr::Foundation::BOOL),
    set_stereo_enabled : Proc(IDXGIDisplayControl*, Win32cr::Foundation::BOOL, Void)


  @[Extern]
  #@[Com("ea9dbf1a-c88e-4486-854a-98aa0138f30c")]
  record IDXGIDisplayControl, lpVtbl : IDXGIDisplayControlVtbl* do
    GUID = LibC::GUID.new(0xea9dbf1a_u32, 0xc88e_u16, 0x4486_u16, StaticArray[0x85_u8, 0x4a_u8, 0x98_u8, 0xaa_u8, 0x1_u8, 0x38_u8, 0xf3_u8, 0xc_u8])
    def query_interface(this : IDXGIDisplayControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDisplayControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDisplayControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_stereo_enabled(this : IDXGIDisplayControl*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_stereo_enabled.call(this)
    end
    def set_stereo_enabled(this : IDXGIDisplayControl*, enabled : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.set_stereo_enabled.call(this, enabled)
    end

  end

  @[Extern]
  record IDXGIOutputDuplicationVtbl,
    query_interface : Proc(IDXGIOutputDuplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutputDuplication*, UInt32),
    release : Proc(IDXGIOutputDuplication*, UInt32),
    set_private_data : Proc(IDXGIOutputDuplication*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutputDuplication*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutputDuplication*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutputDuplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutputDuplication*, Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_DESC*, Void),
    acquire_next_frame : Proc(IDXGIOutputDuplication*, UInt32, Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_FRAME_INFO*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_dirty_rects : Proc(IDXGIOutputDuplication*, UInt32, Win32cr::Foundation::RECT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_frame_move_rects : Proc(IDXGIOutputDuplication*, UInt32, Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_MOVE_RECT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_frame_pointer_shape : Proc(IDXGIOutputDuplication*, UInt32, Void*, UInt32*, Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_POINTER_SHAPE_INFO*, Win32cr::Foundation::HRESULT),
    map_desktop_surface : Proc(IDXGIOutputDuplication*, Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, Win32cr::Foundation::HRESULT),
    un_map_desktop_surface : Proc(IDXGIOutputDuplication*, Win32cr::Foundation::HRESULT),
    release_frame : Proc(IDXGIOutputDuplication*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("191cfac3-a341-470d-b26e-a864f428319c")]
  record IDXGIOutputDuplication, lpVtbl : IDXGIOutputDuplicationVtbl* do
    GUID = LibC::GUID.new(0x191cfac3_u32, 0xa341_u16, 0x470d_u16, StaticArray[0xb2_u8, 0x6e_u8, 0xa8_u8, 0x64_u8, 0xf4_u8, 0x28_u8, 0x31_u8, 0x9c_u8])
    def query_interface(this : IDXGIOutputDuplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutputDuplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutputDuplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutputDuplication*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutputDuplication*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutputDuplication*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutputDuplication*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutputDuplication*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_DESC*) : Void
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def acquire_next_frame(this : IDXGIOutputDuplication*, timeout_in_milliseconds : UInt32, pFrameInfo : Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_FRAME_INFO*, ppDesktopResource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_next_frame.call(this, timeout_in_milliseconds, pFrameInfo, ppDesktopResource)
    end
    def get_frame_dirty_rects(this : IDXGIOutputDuplication*, dirty_rects_buffer_size : UInt32, pDirtyRectsBuffer : Win32cr::Foundation::RECT*, pDirtyRectsBufferSizeRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_dirty_rects.call(this, dirty_rects_buffer_size, pDirtyRectsBuffer, pDirtyRectsBufferSizeRequired)
    end
    def get_frame_move_rects(this : IDXGIOutputDuplication*, move_rects_buffer_size : UInt32, pMoveRectBuffer : Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_MOVE_RECT*, pMoveRectsBufferSizeRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_move_rects.call(this, move_rects_buffer_size, pMoveRectBuffer, pMoveRectsBufferSizeRequired)
    end
    def get_frame_pointer_shape(this : IDXGIOutputDuplication*, pointer_shape_buffer_size : UInt32, pPointerShapeBuffer : Void*, pPointerShapeBufferSizeRequired : UInt32*, pPointerShapeInfo : Win32cr::Graphics::Dxgi::DXGI_OUTDUPL_POINTER_SHAPE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_pointer_shape.call(this, pointer_shape_buffer_size, pPointerShapeBuffer, pPointerShapeBufferSizeRequired, pPointerShapeInfo)
    end
    def map_desktop_surface(this : IDXGIOutputDuplication*, pLockedRect : Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_desktop_surface.call(this, pLockedRect)
    end
    def un_map_desktop_surface(this : IDXGIOutputDuplication*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_map_desktop_surface.call(this)
    end
    def release_frame(this : IDXGIOutputDuplication*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_frame.call(this)
    end

  end

  @[Extern]
  record IDXGISurface2Vtbl,
    query_interface : Proc(IDXGISurface2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISurface2*, UInt32),
    release : Proc(IDXGISurface2*, UInt32),
    set_private_data : Proc(IDXGISurface2*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISurface2*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISurface2*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISurface2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISurface2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISurface2*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, Win32cr::Foundation::HRESULT),
    map : Proc(IDXGISurface2*, Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, UInt32, Win32cr::Foundation::HRESULT),
    unmap : Proc(IDXGISurface2*, Win32cr::Foundation::HRESULT),
    get_dc : Proc(IDXGISurface2*, Win32cr::Foundation::BOOL, Win32cr::Graphics::Gdi::HDC*, Win32cr::Foundation::HRESULT),
    release_dc : Proc(IDXGISurface2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_resource : Proc(IDXGISurface2*, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aba496dd-b617-4cb8-a866-bc44d7eb1fa2")]
  record IDXGISurface2, lpVtbl : IDXGISurface2Vtbl* do
    GUID = LibC::GUID.new(0xaba496dd_u32, 0xb617_u16, 0x4cb8_u16, StaticArray[0xa8_u8, 0x66_u8, 0xbc_u8, 0x44_u8, 0xd7_u8, 0xeb_u8, 0x1f_u8, 0xa2_u8])
    def query_interface(this : IDXGISurface2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISurface2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISurface2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISurface2*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISurface2*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISurface2*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISurface2*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISurface2*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def get_desc(this : IDXGISurface2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def map(this : IDXGISurface2*, pLockedRect : Win32cr::Graphics::Dxgi::DXGI_MAPPED_RECT*, map_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map.call(this, pLockedRect, map_flags)
    end
    def unmap(this : IDXGISurface2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmap.call(this)
    end
    def get_dc(this : IDXGISurface2*, discard : Win32cr::Foundation::BOOL, phdc : Win32cr::Graphics::Gdi::HDC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dc.call(this, discard, phdc)
    end
    def release_dc(this : IDXGISurface2*, pDirtyRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_dc.call(this, pDirtyRect)
    end
    def get_resource(this : IDXGISurface2*, riid : LibC::GUID*, ppParentResource : Void**, pSubresourceIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource.call(this, riid, ppParentResource, pSubresourceIndex)
    end

  end

  @[Extern]
  record IDXGIResource1Vtbl,
    query_interface : Proc(IDXGIResource1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIResource1*, UInt32),
    release : Proc(IDXGIResource1*, UInt32),
    set_private_data : Proc(IDXGIResource1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIResource1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIResource1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIResource1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGIResource1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_handle : Proc(IDXGIResource1*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_usage : Proc(IDXGIResource1*, UInt32*, Win32cr::Foundation::HRESULT),
    set_eviction_priority : Proc(IDXGIResource1*, Win32cr::Graphics::Dxgi::DXGI_RESOURCE_PRIORITY, Win32cr::Foundation::HRESULT),
    get_eviction_priority : Proc(IDXGIResource1*, UInt32*, Win32cr::Foundation::HRESULT),
    create_subresource_surface : Proc(IDXGIResource1*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_shared_handle : Proc(IDXGIResource1*, Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30961379-4609-4a41-998e-54fe567ee0c1")]
  record IDXGIResource1, lpVtbl : IDXGIResource1Vtbl* do
    GUID = LibC::GUID.new(0x30961379_u32, 0x4609_u16, 0x4a41_u16, StaticArray[0x99_u8, 0x8e_u8, 0x54_u8, 0xfe_u8, 0x56_u8, 0x7e_u8, 0xe0_u8, 0xc1_u8])
    def query_interface(this : IDXGIResource1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIResource1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIResource1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIResource1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIResource1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIResource1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIResource1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGIResource1*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def get_shared_handle(this : IDXGIResource1*, pSharedHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_handle.call(this, pSharedHandle)
    end
    def get_usage(this : IDXGIResource1*, pUsage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_usage.call(this, pUsage)
    end
    def set_eviction_priority(this : IDXGIResource1*, eviction_priority : Win32cr::Graphics::Dxgi::DXGI_RESOURCE_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_eviction_priority.call(this, eviction_priority)
    end
    def get_eviction_priority(this : IDXGIResource1*, pEvictionPriority : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_eviction_priority.call(this, pEvictionPriority)
    end
    def create_subresource_surface(this : IDXGIResource1*, index : UInt32, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_subresource_surface.call(this, index, ppSurface)
    end
    def create_shared_handle(this : IDXGIResource1*, pAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwAccess : UInt32, lpName : Win32cr::Foundation::PWSTR, pHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_shared_handle.call(this, pAttributes, dwAccess, lpName, pHandle)
    end

  end

  @[Extern]
  record IDXGIDevice2Vtbl,
    query_interface : Proc(IDXGIDevice2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDevice2*, UInt32),
    release : Proc(IDXGIDevice2*, UInt32),
    set_private_data : Proc(IDXGIDevice2*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIDevice2*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIDevice2*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIDevice2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter : Proc(IDXGIDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDXGIDevice2*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, Void**, Win32cr::Foundation::HRESULT),
    query_resource_residency : Proc(IDXGIDevice2*, Void**, Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, UInt32, Win32cr::Foundation::HRESULT),
    set_gpu_thread_priority : Proc(IDXGIDevice2*, Int32, Win32cr::Foundation::HRESULT),
    get_gpu_thread_priority : Proc(IDXGIDevice2*, Int32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGIDevice2*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGIDevice2*, UInt32*, Win32cr::Foundation::HRESULT),
    offer_resources : Proc(IDXGIDevice2*, UInt32, Void**, Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY, Win32cr::Foundation::HRESULT),
    reclaim_resources : Proc(IDXGIDevice2*, UInt32, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enqueue_set_event : Proc(IDXGIDevice2*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("05008617-fbfd-4051-a790-144884b4f6a9")]
  record IDXGIDevice2, lpVtbl : IDXGIDevice2Vtbl* do
    GUID = LibC::GUID.new(0x5008617_u32, 0xfbfd_u16, 0x4051_u16, StaticArray[0xa7_u8, 0x90_u8, 0x14_u8, 0x48_u8, 0x84_u8, 0xb4_u8, 0xf6_u8, 0xa9_u8])
    def query_interface(this : IDXGIDevice2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDevice2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDevice2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIDevice2*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIDevice2*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIDevice2*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIDevice2*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_adapter(this : IDXGIDevice2*, pAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter.call(this, pAdapter)
    end
    def create_surface(this : IDXGIDevice2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, num_surfaces : UInt32, usage : UInt32, pSharedResource : Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, pDesc, num_surfaces, usage, pSharedResource, ppSurface)
    end
    def query_resource_residency(this : IDXGIDevice2*, ppResources : Void**, pResidencyStatus : Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, num_resources : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_resource_residency.call(this, ppResources, pResidencyStatus, num_resources)
    end
    def set_gpu_thread_priority(this : IDXGIDevice2*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gpu_thread_priority.call(this, priority)
    end
    def get_gpu_thread_priority(this : IDXGIDevice2*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpu_thread_priority.call(this, pPriority)
    end
    def set_maximum_frame_latency(this : IDXGIDevice2*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGIDevice2*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end
    def offer_resources(this : IDXGIDevice2*, num_resources : UInt32, ppResources : Void**, priority : Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.offer_resources.call(this, num_resources, ppResources, priority)
    end
    def reclaim_resources(this : IDXGIDevice2*, num_resources : UInt32, ppResources : Void**, pDiscarded : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reclaim_resources.call(this, num_resources, ppResources, pDiscarded)
    end
    def enqueue_set_event(this : IDXGIDevice2*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enqueue_set_event.call(this, hEvent)
    end

  end

  @[Extern]
  record IDXGISwapChain1Vtbl,
    query_interface : Proc(IDXGISwapChain1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISwapChain1*, UInt32),
    release : Proc(IDXGISwapChain1*, UInt32),
    set_private_data : Proc(IDXGISwapChain1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISwapChain1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISwapChain1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISwapChain1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISwapChain1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present : Proc(IDXGISwapChain1*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(IDXGISwapChain1*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_fullscreen_state : Proc(IDXGISwapChain1*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    get_fullscreen_state : Proc(IDXGISwapChain1*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Win32cr::Foundation::HRESULT),
    resize_buffers : Proc(IDXGISwapChain1*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, Win32cr::Foundation::HRESULT),
    resize_target : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    get_containing_output : Proc(IDXGISwapChain1*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_last_present_count : Proc(IDXGISwapChain1*, UInt32*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Foundation::HRESULT),
    get_fullscreen_desc : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Win32cr::Foundation::HRESULT),
    get_hwnd : Proc(IDXGISwapChain1*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_core_window : Proc(IDXGISwapChain1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present1 : Proc(IDXGISwapChain1*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*, Win32cr::Foundation::HRESULT),
    is_temporary_mono_supported : Proc(IDXGISwapChain1*, Win32cr::Foundation::BOOL),
    get_restrict_to_output : Proc(IDXGISwapChain1*, Void**, Win32cr::Foundation::HRESULT),
    set_background_color : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    get_background_color : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    set_rotation : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION, Win32cr::Foundation::HRESULT),
    get_rotation : Proc(IDXGISwapChain1*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("790a45f7-0d42-4876-983a-0a55cfe6f4aa")]
  record IDXGISwapChain1, lpVtbl : IDXGISwapChain1Vtbl* do
    GUID = LibC::GUID.new(0x790a45f7_u32, 0xd42_u16, 0x4876_u16, StaticArray[0x98_u8, 0x3a_u8, 0xa_u8, 0x55_u8, 0xcf_u8, 0xe6_u8, 0xf4_u8, 0xaa_u8])
    def query_interface(this : IDXGISwapChain1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISwapChain1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISwapChain1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISwapChain1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISwapChain1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISwapChain1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISwapChain1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISwapChain1*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def present(this : IDXGISwapChain1*, sync_interval : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this, sync_interval, flags)
    end
    def get_buffer(this : IDXGISwapChain1*, buffer : UInt32, riid : LibC::GUID*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, buffer, riid, ppSurface)
    end
    def set_fullscreen_state(this : IDXGISwapChain1*, fullscreen : Win32cr::Foundation::BOOL, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fullscreen_state.call(this, fullscreen, pTarget)
    end
    def get_fullscreen_state(this : IDXGISwapChain1*, pFullscreen : Win32cr::Foundation::BOOL*, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_state.call(this, pFullscreen, ppTarget)
    end
    def get_desc(this : IDXGISwapChain1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def resize_buffers(this : IDXGISwapChain1*, buffer_count : UInt32, width : UInt32, height : UInt32, new_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers.call(this, buffer_count, width, height, new_format, swap_chain_flags)
    end
    def resize_target(this : IDXGISwapChain1*, pNewTargetParameters : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_target.call(this, pNewTargetParameters)
    end
    def get_containing_output(this : IDXGISwapChain1*, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_output.call(this, ppOutput)
    end
    def get_frame_statistics(this : IDXGISwapChain1*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_last_present_count(this : IDXGISwapChain1*, pLastPresentCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_present_count.call(this, pLastPresentCount)
    end
    def get_desc1(this : IDXGISwapChain1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_fullscreen_desc(this : IDXGISwapChain1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_desc.call(this, pDesc)
    end
    def get_hwnd(this : IDXGISwapChain1*, pHwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hwnd.call(this, pHwnd)
    end
    def get_core_window(this : IDXGISwapChain1*, refiid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_core_window.call(this, refiid, ppUnk)
    end
    def present1(this : IDXGISwapChain1*, sync_interval : UInt32, present_flags : UInt32, pPresentParameters : Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present1.call(this, sync_interval, present_flags, pPresentParameters)
    end
    def is_temporary_mono_supported(this : IDXGISwapChain1*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_temporary_mono_supported.call(this)
    end
    def get_restrict_to_output(this : IDXGISwapChain1*, ppRestrictToOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrict_to_output.call(this, ppRestrictToOutput)
    end
    def set_background_color(this : IDXGISwapChain1*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_background_color.call(this, pColor)
    end
    def get_background_color(this : IDXGISwapChain1*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_background_color.call(this, pColor)
    end
    def set_rotation(this : IDXGISwapChain1*, rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rotation.call(this, rotation)
    end
    def get_rotation(this : IDXGISwapChain1*, pRotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rotation.call(this, pRotation)
    end

  end

  @[Extern]
  record IDXGIFactory2Vtbl,
    query_interface : Proc(IDXGIFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory2*, UInt32),
    release : Proc(IDXGIFactory2*, UInt32),
    set_private_data : Proc(IDXGIFactory2*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory2*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory2*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory2*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory2*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory2*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory2*, Win32cr::Foundation::BOOL),
    is_windowed_stereo_enabled : Proc(IDXGIFactory2*, Win32cr::Foundation::BOOL),
    create_swap_chain_for_hwnd : Proc(IDXGIFactory2*, Void*, Win32cr::Foundation::HWND, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_swap_chain_for_core_window : Proc(IDXGIFactory2*, Void*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_resource_adapter_luid : Proc(IDXGIFactory2*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    register_stereo_status_window : Proc(IDXGIFactory2*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_stereo_status_event : Proc(IDXGIFactory2*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_stereo_status : Proc(IDXGIFactory2*, UInt32, Void),
    register_occlusion_status_window : Proc(IDXGIFactory2*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_occlusion_status_event : Proc(IDXGIFactory2*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_occlusion_status : Proc(IDXGIFactory2*, UInt32, Void),
    create_swap_chain_for_composition : Proc(IDXGIFactory2*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("50c83a1c-e072-4c48-87b0-3630fa36a6d0")]
  record IDXGIFactory2, lpVtbl : IDXGIFactory2Vtbl* do
    GUID = LibC::GUID.new(0x50c83a1c_u32, 0xe072_u16, 0x4c48_u16, StaticArray[0x87_u8, 0xb0_u8, 0x36_u8, 0x30_u8, 0xfa_u8, 0x36_u8, 0xa6_u8, 0xd0_u8])
    def query_interface(this : IDXGIFactory2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory2*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory2*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory2*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory2*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory2*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory2*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory2*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory2*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory2*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory2*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory2*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end
    def is_windowed_stereo_enabled(this : IDXGIFactory2*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_windowed_stereo_enabled.call(this)
    end
    def create_swap_chain_for_hwnd(this : IDXGIFactory2*, pDevice : Void*, hWnd : Win32cr::Foundation::HWND, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pFullscreenDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_hwnd.call(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_swap_chain_for_core_window(this : IDXGIFactory2*, pDevice : Void*, pWindow : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_core_window.call(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_shared_resource_adapter_luid(this : IDXGIFactory2*, hResource : Win32cr::Foundation::HANDLE, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_resource_adapter_luid.call(this, hResource, pLuid)
    end
    def register_stereo_status_window(this : IDXGIFactory2*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_stereo_status_event(this : IDXGIFactory2*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_stereo_status(this : IDXGIFactory2*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_stereo_status.call(this, dwCookie)
    end
    def register_occlusion_status_window(this : IDXGIFactory2*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_occlusion_status_event(this : IDXGIFactory2*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_occlusion_status(this : IDXGIFactory2*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_occlusion_status.call(this, dwCookie)
    end
    def create_swap_chain_for_composition(this : IDXGIFactory2*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition.call(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain)
    end

  end

  @[Extern]
  record IDXGIAdapter2Vtbl,
    query_interface : Proc(IDXGIAdapter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIAdapter2*, UInt32),
    release : Proc(IDXGIAdapter2*, UInt32),
    set_private_data : Proc(IDXGIAdapter2*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIAdapter2*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIAdapter2*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIAdapter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_outputs : Proc(IDXGIAdapter2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIAdapter2*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*, Win32cr::Foundation::HRESULT),
    check_interface_support : Proc(IDXGIAdapter2*, LibC::GUID*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGIAdapter2*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*, Win32cr::Foundation::HRESULT),
    get_desc2 : Proc(IDXGIAdapter2*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0aa1ae0a-fa0e-4b84-8644-e05ff8e5acb5")]
  record IDXGIAdapter2, lpVtbl : IDXGIAdapter2Vtbl* do
    GUID = LibC::GUID.new(0xaa1ae0a_u32, 0xfa0e_u16, 0x4b84_u16, StaticArray[0x86_u8, 0x44_u8, 0xe0_u8, 0x5f_u8, 0xf8_u8, 0xe5_u8, 0xac_u8, 0xb5_u8])
    def query_interface(this : IDXGIAdapter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIAdapter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIAdapter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIAdapter2*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIAdapter2*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIAdapter2*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIAdapter2*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_outputs(this : IDXGIAdapter2*, output : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_outputs.call(this, output, ppOutput)
    end
    def get_desc(this : IDXGIAdapter2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def check_interface_support(this : IDXGIAdapter2*, interface_name : LibC::GUID*, pUMDVersion : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_interface_support.call(this, interface_name, pUMDVersion)
    end
    def get_desc1(this : IDXGIAdapter2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_desc2(this : IDXGIAdapter2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc2.call(this, pDesc)
    end

  end

  @[Extern]
  record IDXGIOutput1Vtbl,
    query_interface : Proc(IDXGIOutput1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput1*, UInt32),
    release : Proc(IDXGIOutput1*, UInt32),
    set_private_data : Proc(IDXGIOutput1*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput1*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput1*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput1*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput1*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput1*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput1*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_display_mode_list1 : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode1 : Proc(IDXGIOutput1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data1 : Proc(IDXGIOutput1*, Void*, Win32cr::Foundation::HRESULT),
    duplicate_output : Proc(IDXGIOutput1*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("00cddea8-939b-4b83-a340-a685226666cc")]
  record IDXGIOutput1, lpVtbl : IDXGIOutput1Vtbl* do
    GUID = LibC::GUID.new(0xcddea8_u32, 0x939b_u16, 0x4b83_u16, StaticArray[0xa3_u8, 0x40_u8, 0xa6_u8, 0x85_u8, 0x22_u8, 0x66_u8, 0x66_u8, 0xcc_u8])
    def query_interface(this : IDXGIOutput1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput1*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput1*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput1*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput1*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput1*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput1*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput1*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput1*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput1*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput1*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput1*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput1*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput1*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput1*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput1*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_display_mode_list1(this : IDXGIOutput1*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list1.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode1(this : IDXGIOutput1*, pModeToMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pClosestMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode1.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def get_display_surface_data1(this : IDXGIOutput1*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data1.call(this, pDestination)
    end
    def duplicate_output(this : IDXGIOutput1*, pDevice : Void*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output.call(this, pDevice, ppOutputDuplication)
    end

  end

  @[Extern]
  record IDXGIDevice3Vtbl,
    query_interface : Proc(IDXGIDevice3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDevice3*, UInt32),
    release : Proc(IDXGIDevice3*, UInt32),
    set_private_data : Proc(IDXGIDevice3*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIDevice3*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIDevice3*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIDevice3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter : Proc(IDXGIDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDXGIDevice3*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, Void**, Win32cr::Foundation::HRESULT),
    query_resource_residency : Proc(IDXGIDevice3*, Void**, Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, UInt32, Win32cr::Foundation::HRESULT),
    set_gpu_thread_priority : Proc(IDXGIDevice3*, Int32, Win32cr::Foundation::HRESULT),
    get_gpu_thread_priority : Proc(IDXGIDevice3*, Int32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGIDevice3*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGIDevice3*, UInt32*, Win32cr::Foundation::HRESULT),
    offer_resources : Proc(IDXGIDevice3*, UInt32, Void**, Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY, Win32cr::Foundation::HRESULT),
    reclaim_resources : Proc(IDXGIDevice3*, UInt32, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enqueue_set_event : Proc(IDXGIDevice3*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    trim : Proc(IDXGIDevice3*, Void)


  @[Extern]
  #@[Com("6007896c-3244-4afd-bf18-a6d3beda5023")]
  record IDXGIDevice3, lpVtbl : IDXGIDevice3Vtbl* do
    GUID = LibC::GUID.new(0x6007896c_u32, 0x3244_u16, 0x4afd_u16, StaticArray[0xbf_u8, 0x18_u8, 0xa6_u8, 0xd3_u8, 0xbe_u8, 0xda_u8, 0x50_u8, 0x23_u8])
    def query_interface(this : IDXGIDevice3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDevice3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDevice3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIDevice3*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIDevice3*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIDevice3*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIDevice3*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_adapter(this : IDXGIDevice3*, pAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter.call(this, pAdapter)
    end
    def create_surface(this : IDXGIDevice3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, num_surfaces : UInt32, usage : UInt32, pSharedResource : Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, pDesc, num_surfaces, usage, pSharedResource, ppSurface)
    end
    def query_resource_residency(this : IDXGIDevice3*, ppResources : Void**, pResidencyStatus : Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, num_resources : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_resource_residency.call(this, ppResources, pResidencyStatus, num_resources)
    end
    def set_gpu_thread_priority(this : IDXGIDevice3*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gpu_thread_priority.call(this, priority)
    end
    def get_gpu_thread_priority(this : IDXGIDevice3*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpu_thread_priority.call(this, pPriority)
    end
    def set_maximum_frame_latency(this : IDXGIDevice3*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGIDevice3*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end
    def offer_resources(this : IDXGIDevice3*, num_resources : UInt32, ppResources : Void**, priority : Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.offer_resources.call(this, num_resources, ppResources, priority)
    end
    def reclaim_resources(this : IDXGIDevice3*, num_resources : UInt32, ppResources : Void**, pDiscarded : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reclaim_resources.call(this, num_resources, ppResources, pDiscarded)
    end
    def enqueue_set_event(this : IDXGIDevice3*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enqueue_set_event.call(this, hEvent)
    end
    def trim(this : IDXGIDevice3*) : Void
      @lpVtbl.try &.value.trim.call(this)
    end

  end

  @[Extern]
  record IDXGISwapChain2Vtbl,
    query_interface : Proc(IDXGISwapChain2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISwapChain2*, UInt32),
    release : Proc(IDXGISwapChain2*, UInt32),
    set_private_data : Proc(IDXGISwapChain2*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISwapChain2*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISwapChain2*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISwapChain2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISwapChain2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present : Proc(IDXGISwapChain2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(IDXGISwapChain2*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_fullscreen_state : Proc(IDXGISwapChain2*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    get_fullscreen_state : Proc(IDXGISwapChain2*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Win32cr::Foundation::HRESULT),
    resize_buffers : Proc(IDXGISwapChain2*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, Win32cr::Foundation::HRESULT),
    resize_target : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    get_containing_output : Proc(IDXGISwapChain2*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_last_present_count : Proc(IDXGISwapChain2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Foundation::HRESULT),
    get_fullscreen_desc : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Win32cr::Foundation::HRESULT),
    get_hwnd : Proc(IDXGISwapChain2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_core_window : Proc(IDXGISwapChain2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present1 : Proc(IDXGISwapChain2*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*, Win32cr::Foundation::HRESULT),
    is_temporary_mono_supported : Proc(IDXGISwapChain2*, Win32cr::Foundation::BOOL),
    get_restrict_to_output : Proc(IDXGISwapChain2*, Void**, Win32cr::Foundation::HRESULT),
    set_background_color : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    get_background_color : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    set_rotation : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION, Win32cr::Foundation::HRESULT),
    get_rotation : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*, Win32cr::Foundation::HRESULT),
    set_source_size : Proc(IDXGISwapChain2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_source_size : Proc(IDXGISwapChain2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGISwapChain2*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGISwapChain2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_frame_latency_waitable_object : Proc(IDXGISwapChain2*, Win32cr::Foundation::HANDLE),
    set_matrix_transform : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    get_matrix_transform : Proc(IDXGISwapChain2*, Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a8be2ac4-199f-4946-b331-79599fb98de7")]
  record IDXGISwapChain2, lpVtbl : IDXGISwapChain2Vtbl* do
    GUID = LibC::GUID.new(0xa8be2ac4_u32, 0x199f_u16, 0x4946_u16, StaticArray[0xb3_u8, 0x31_u8, 0x79_u8, 0x59_u8, 0x9f_u8, 0xb9_u8, 0x8d_u8, 0xe7_u8])
    def query_interface(this : IDXGISwapChain2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISwapChain2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISwapChain2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISwapChain2*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISwapChain2*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISwapChain2*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISwapChain2*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISwapChain2*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def present(this : IDXGISwapChain2*, sync_interval : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this, sync_interval, flags)
    end
    def get_buffer(this : IDXGISwapChain2*, buffer : UInt32, riid : LibC::GUID*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, buffer, riid, ppSurface)
    end
    def set_fullscreen_state(this : IDXGISwapChain2*, fullscreen : Win32cr::Foundation::BOOL, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fullscreen_state.call(this, fullscreen, pTarget)
    end
    def get_fullscreen_state(this : IDXGISwapChain2*, pFullscreen : Win32cr::Foundation::BOOL*, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_state.call(this, pFullscreen, ppTarget)
    end
    def get_desc(this : IDXGISwapChain2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def resize_buffers(this : IDXGISwapChain2*, buffer_count : UInt32, width : UInt32, height : UInt32, new_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers.call(this, buffer_count, width, height, new_format, swap_chain_flags)
    end
    def resize_target(this : IDXGISwapChain2*, pNewTargetParameters : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_target.call(this, pNewTargetParameters)
    end
    def get_containing_output(this : IDXGISwapChain2*, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_output.call(this, ppOutput)
    end
    def get_frame_statistics(this : IDXGISwapChain2*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_last_present_count(this : IDXGISwapChain2*, pLastPresentCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_present_count.call(this, pLastPresentCount)
    end
    def get_desc1(this : IDXGISwapChain2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_fullscreen_desc(this : IDXGISwapChain2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_desc.call(this, pDesc)
    end
    def get_hwnd(this : IDXGISwapChain2*, pHwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hwnd.call(this, pHwnd)
    end
    def get_core_window(this : IDXGISwapChain2*, refiid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_core_window.call(this, refiid, ppUnk)
    end
    def present1(this : IDXGISwapChain2*, sync_interval : UInt32, present_flags : UInt32, pPresentParameters : Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present1.call(this, sync_interval, present_flags, pPresentParameters)
    end
    def is_temporary_mono_supported(this : IDXGISwapChain2*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_temporary_mono_supported.call(this)
    end
    def get_restrict_to_output(this : IDXGISwapChain2*, ppRestrictToOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrict_to_output.call(this, ppRestrictToOutput)
    end
    def set_background_color(this : IDXGISwapChain2*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_background_color.call(this, pColor)
    end
    def get_background_color(this : IDXGISwapChain2*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_background_color.call(this, pColor)
    end
    def set_rotation(this : IDXGISwapChain2*, rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rotation.call(this, rotation)
    end
    def get_rotation(this : IDXGISwapChain2*, pRotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rotation.call(this, pRotation)
    end
    def set_source_size(this : IDXGISwapChain2*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_size.call(this, width, height)
    end
    def get_source_size(this : IDXGISwapChain2*, pWidth : UInt32*, pHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_size.call(this, pWidth, pHeight)
    end
    def set_maximum_frame_latency(this : IDXGISwapChain2*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGISwapChain2*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end
    def get_frame_latency_waitable_object(this : IDXGISwapChain2*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_frame_latency_waitable_object.call(this)
    end
    def set_matrix_transform(this : IDXGISwapChain2*, pMatrix : Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_transform.call(this, pMatrix)
    end
    def get_matrix_transform(this : IDXGISwapChain2*, pMatrix : Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matrix_transform.call(this, pMatrix)
    end

  end

  @[Extern]
  record IDXGIOutput2Vtbl,
    query_interface : Proc(IDXGIOutput2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput2*, UInt32),
    release : Proc(IDXGIOutput2*, UInt32),
    set_private_data : Proc(IDXGIOutput2*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput2*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput2*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput2*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput2*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput2*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput2*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput2*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_display_mode_list1 : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode1 : Proc(IDXGIOutput2*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data1 : Proc(IDXGIOutput2*, Void*, Win32cr::Foundation::HRESULT),
    duplicate_output : Proc(IDXGIOutput2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_overlays : Proc(IDXGIOutput2*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("595e39d1-2724-4663-99b1-da969de28364")]
  record IDXGIOutput2, lpVtbl : IDXGIOutput2Vtbl* do
    GUID = LibC::GUID.new(0x595e39d1_u32, 0x2724_u16, 0x4663_u16, StaticArray[0x99_u8, 0xb1_u8, 0xda_u8, 0x96_u8, 0x9d_u8, 0xe2_u8, 0x83_u8, 0x64_u8])
    def query_interface(this : IDXGIOutput2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput2*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput2*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput2*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput2*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput2*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput2*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput2*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput2*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput2*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput2*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput2*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput2*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput2*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput2*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput2*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_display_mode_list1(this : IDXGIOutput2*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list1.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode1(this : IDXGIOutput2*, pModeToMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pClosestMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode1.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def get_display_surface_data1(this : IDXGIOutput2*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data1.call(this, pDestination)
    end
    def duplicate_output(this : IDXGIOutput2*, pDevice : Void*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output.call(this, pDevice, ppOutputDuplication)
    end
    def supports_overlays(this : IDXGIOutput2*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.supports_overlays.call(this)
    end

  end

  @[Extern]
  record IDXGIFactory3Vtbl,
    query_interface : Proc(IDXGIFactory3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory3*, UInt32),
    release : Proc(IDXGIFactory3*, UInt32),
    set_private_data : Proc(IDXGIFactory3*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory3*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory3*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory3*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory3*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory3*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory3*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory3*, Win32cr::Foundation::BOOL),
    is_windowed_stereo_enabled : Proc(IDXGIFactory3*, Win32cr::Foundation::BOOL),
    create_swap_chain_for_hwnd : Proc(IDXGIFactory3*, Void*, Win32cr::Foundation::HWND, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_swap_chain_for_core_window : Proc(IDXGIFactory3*, Void*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_resource_adapter_luid : Proc(IDXGIFactory3*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    register_stereo_status_window : Proc(IDXGIFactory3*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_stereo_status_event : Proc(IDXGIFactory3*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_stereo_status : Proc(IDXGIFactory3*, UInt32, Void),
    register_occlusion_status_window : Proc(IDXGIFactory3*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_occlusion_status_event : Proc(IDXGIFactory3*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_occlusion_status : Proc(IDXGIFactory3*, UInt32, Void),
    create_swap_chain_for_composition : Proc(IDXGIFactory3*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_creation_flags : Proc(IDXGIFactory3*, UInt32)


  @[Extern]
  #@[Com("25483823-cd46-4c7d-86ca-47aa95b837bd")]
  record IDXGIFactory3, lpVtbl : IDXGIFactory3Vtbl* do
    GUID = LibC::GUID.new(0x25483823_u32, 0xcd46_u16, 0x4c7d_u16, StaticArray[0x86_u8, 0xca_u8, 0x47_u8, 0xaa_u8, 0x95_u8, 0xb8_u8, 0x37_u8, 0xbd_u8])
    def query_interface(this : IDXGIFactory3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory3*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory3*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory3*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory3*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory3*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory3*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory3*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory3*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory3*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory3*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory3*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end
    def is_windowed_stereo_enabled(this : IDXGIFactory3*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_windowed_stereo_enabled.call(this)
    end
    def create_swap_chain_for_hwnd(this : IDXGIFactory3*, pDevice : Void*, hWnd : Win32cr::Foundation::HWND, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pFullscreenDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_hwnd.call(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_swap_chain_for_core_window(this : IDXGIFactory3*, pDevice : Void*, pWindow : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_core_window.call(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_shared_resource_adapter_luid(this : IDXGIFactory3*, hResource : Win32cr::Foundation::HANDLE, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_resource_adapter_luid.call(this, hResource, pLuid)
    end
    def register_stereo_status_window(this : IDXGIFactory3*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_stereo_status_event(this : IDXGIFactory3*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_stereo_status(this : IDXGIFactory3*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_stereo_status.call(this, dwCookie)
    end
    def register_occlusion_status_window(this : IDXGIFactory3*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_occlusion_status_event(this : IDXGIFactory3*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_occlusion_status(this : IDXGIFactory3*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_occlusion_status.call(this, dwCookie)
    end
    def create_swap_chain_for_composition(this : IDXGIFactory3*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition.call(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_creation_flags(this : IDXGIFactory3*) : UInt32
      @lpVtbl.try &.value.get_creation_flags.call(this)
    end

  end

  @[Extern]
  record IDXGIDecodeSwapChainVtbl,
    query_interface : Proc(IDXGIDecodeSwapChain*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDecodeSwapChain*, UInt32),
    release : Proc(IDXGIDecodeSwapChain*, UInt32),
    present_buffer : Proc(IDXGIDecodeSwapChain*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_source_rect : Proc(IDXGIDecodeSwapChain*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    set_target_rect : Proc(IDXGIDecodeSwapChain*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    set_dest_size : Proc(IDXGIDecodeSwapChain*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_source_rect : Proc(IDXGIDecodeSwapChain*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_target_rect : Proc(IDXGIDecodeSwapChain*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_dest_size : Proc(IDXGIDecodeSwapChain*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_color_space : Proc(IDXGIDecodeSwapChain*, Win32cr::Graphics::Dxgi::DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS, Win32cr::Foundation::HRESULT),
    get_color_space : Proc(IDXGIDecodeSwapChain*, Win32cr::Graphics::Dxgi::DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS)


  @[Extern]
  #@[Com("2633066b-4514-4c7a-8fd8-12ea98059d18")]
  record IDXGIDecodeSwapChain, lpVtbl : IDXGIDecodeSwapChainVtbl* do
    GUID = LibC::GUID.new(0x2633066b_u32, 0x4514_u16, 0x4c7a_u16, StaticArray[0x8f_u8, 0xd8_u8, 0x12_u8, 0xea_u8, 0x98_u8, 0x5_u8, 0x9d_u8, 0x18_u8])
    def query_interface(this : IDXGIDecodeSwapChain*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDecodeSwapChain*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDecodeSwapChain*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def present_buffer(this : IDXGIDecodeSwapChain*, buffer_to_present : UInt32, sync_interval : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present_buffer.call(this, buffer_to_present, sync_interval, flags)
    end
    def set_source_rect(this : IDXGIDecodeSwapChain*, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_rect.call(this, pRect)
    end
    def set_target_rect(this : IDXGIDecodeSwapChain*, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_rect.call(this, pRect)
    end
    def set_dest_size(this : IDXGIDecodeSwapChain*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dest_size.call(this, width, height)
    end
    def get_source_rect(this : IDXGIDecodeSwapChain*, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_rect.call(this, pRect)
    end
    def get_target_rect(this : IDXGIDecodeSwapChain*, pRect : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_rect.call(this, pRect)
    end
    def get_dest_size(this : IDXGIDecodeSwapChain*, pWidth : UInt32*, pHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dest_size.call(this, pWidth, pHeight)
    end
    def set_color_space(this : IDXGIDecodeSwapChain*, color_space : Win32cr::Graphics::Dxgi::DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_space.call(this, color_space)
    end
    def get_color_space(this : IDXGIDecodeSwapChain*) : Win32cr::Graphics::Dxgi::DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS
      @lpVtbl.try &.value.get_color_space.call(this)
    end

  end

  @[Extern]
  record IDXGIFactoryMediaVtbl,
    query_interface : Proc(IDXGIFactoryMedia*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactoryMedia*, UInt32),
    release : Proc(IDXGIFactoryMedia*, UInt32),
    create_swap_chain_for_composition_surface_handle : Proc(IDXGIFactoryMedia*, Void*, Win32cr::Foundation::HANDLE, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_decode_swap_chain_for_composition_surface_handle : Proc(IDXGIFactoryMedia*, Void*, Win32cr::Foundation::HANDLE, Win32cr::Graphics::Dxgi::DXGI_DECODE_SWAP_CHAIN_DESC*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12")]
  record IDXGIFactoryMedia, lpVtbl : IDXGIFactoryMediaVtbl* do
    GUID = LibC::GUID.new(0x41e7d1f2_u32, 0xa591_u16, 0x4f7b_u16, StaticArray[0xa2_u8, 0xe5_u8, 0xfa_u8, 0x9c_u8, 0x84_u8, 0x3e_u8, 0x1c_u8, 0x12_u8])
    def query_interface(this : IDXGIFactoryMedia*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactoryMedia*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactoryMedia*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_swap_chain_for_composition_surface_handle(this : IDXGIFactoryMedia*, pDevice : Void*, hSurface : Win32cr::Foundation::HANDLE, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition_surface_handle.call(this, pDevice, hSurface, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_decode_swap_chain_for_composition_surface_handle(this : IDXGIFactoryMedia*, pDevice : Void*, hSurface : Win32cr::Foundation::HANDLE, pDesc : Win32cr::Graphics::Dxgi::DXGI_DECODE_SWAP_CHAIN_DESC*, pYuvDecodeBuffers : Void*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_decode_swap_chain_for_composition_surface_handle.call(this, pDevice, hSurface, pDesc, pYuvDecodeBuffers, pRestrictToOutput, ppSwapChain)
    end

  end

  @[Extern]
  record IDXGISwapChainMediaVtbl,
    query_interface : Proc(IDXGISwapChainMedia*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISwapChainMedia*, UInt32),
    release : Proc(IDXGISwapChainMedia*, UInt32),
    get_frame_statistics_media : Proc(IDXGISwapChainMedia*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS_MEDIA*, Win32cr::Foundation::HRESULT),
    set_present_duration : Proc(IDXGISwapChainMedia*, UInt32, Win32cr::Foundation::HRESULT),
    check_present_duration_support : Proc(IDXGISwapChainMedia*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dd95b90b-f05f-4f6a-bd65-25bfb264bd84")]
  record IDXGISwapChainMedia, lpVtbl : IDXGISwapChainMediaVtbl* do
    GUID = LibC::GUID.new(0xdd95b90b_u32, 0xf05f_u16, 0x4f6a_u16, StaticArray[0xbd_u8, 0x65_u8, 0x25_u8, 0xbf_u8, 0xb2_u8, 0x64_u8, 0xbd_u8, 0x84_u8])
    def query_interface(this : IDXGISwapChainMedia*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISwapChainMedia*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISwapChainMedia*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_frame_statistics_media(this : IDXGISwapChainMedia*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS_MEDIA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics_media.call(this, pStats)
    end
    def set_present_duration(this : IDXGISwapChainMedia*, duration : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_present_duration.call(this, duration)
    end
    def check_present_duration_support(this : IDXGISwapChainMedia*, desired_present_duration : UInt32, pClosestSmallerPresentDuration : UInt32*, pClosestLargerPresentDuration : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_present_duration_support.call(this, desired_present_duration, pClosestSmallerPresentDuration, pClosestLargerPresentDuration)
    end

  end

  @[Extern]
  record IDXGIOutput3Vtbl,
    query_interface : Proc(IDXGIOutput3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput3*, UInt32),
    release : Proc(IDXGIOutput3*, UInt32),
    set_private_data : Proc(IDXGIOutput3*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput3*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput3*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput3*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput3*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput3*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput3*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput3*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_display_mode_list1 : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode1 : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data1 : Proc(IDXGIOutput3*, Void*, Win32cr::Foundation::HRESULT),
    duplicate_output : Proc(IDXGIOutput3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_overlays : Proc(IDXGIOutput3*, Win32cr::Foundation::BOOL),
    check_overlay_support : Proc(IDXGIOutput3*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Void*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8a6bb301-7e7e-41f4-a8e0-5b32f7f99b18")]
  record IDXGIOutput3, lpVtbl : IDXGIOutput3Vtbl* do
    GUID = LibC::GUID.new(0x8a6bb301_u32, 0x7e7e_u16, 0x41f4_u16, StaticArray[0xa8_u8, 0xe0_u8, 0x5b_u8, 0x32_u8, 0xf7_u8, 0xf9_u8, 0x9b_u8, 0x18_u8])
    def query_interface(this : IDXGIOutput3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput3*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput3*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput3*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput3*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput3*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput3*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput3*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput3*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput3*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput3*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput3*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput3*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput3*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput3*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_display_mode_list1(this : IDXGIOutput3*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list1.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode1(this : IDXGIOutput3*, pModeToMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pClosestMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode1.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def get_display_surface_data1(this : IDXGIOutput3*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data1.call(this, pDestination)
    end
    def duplicate_output(this : IDXGIOutput3*, pDevice : Void*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output.call(this, pDevice, ppOutputDuplication)
    end
    def supports_overlays(this : IDXGIOutput3*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.supports_overlays.call(this)
    end
    def check_overlay_support(this : IDXGIOutput3*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_support.call(this, enum_format, pConcernedDevice, pFlags)
    end

  end

  @[Extern]
  record IDXGISwapChain3Vtbl,
    query_interface : Proc(IDXGISwapChain3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISwapChain3*, UInt32),
    release : Proc(IDXGISwapChain3*, UInt32),
    set_private_data : Proc(IDXGISwapChain3*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISwapChain3*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISwapChain3*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISwapChain3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISwapChain3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present : Proc(IDXGISwapChain3*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(IDXGISwapChain3*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_fullscreen_state : Proc(IDXGISwapChain3*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    get_fullscreen_state : Proc(IDXGISwapChain3*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Win32cr::Foundation::HRESULT),
    resize_buffers : Proc(IDXGISwapChain3*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, Win32cr::Foundation::HRESULT),
    resize_target : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    get_containing_output : Proc(IDXGISwapChain3*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_last_present_count : Proc(IDXGISwapChain3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Foundation::HRESULT),
    get_fullscreen_desc : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Win32cr::Foundation::HRESULT),
    get_hwnd : Proc(IDXGISwapChain3*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_core_window : Proc(IDXGISwapChain3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present1 : Proc(IDXGISwapChain3*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*, Win32cr::Foundation::HRESULT),
    is_temporary_mono_supported : Proc(IDXGISwapChain3*, Win32cr::Foundation::BOOL),
    get_restrict_to_output : Proc(IDXGISwapChain3*, Void**, Win32cr::Foundation::HRESULT),
    set_background_color : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    get_background_color : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    set_rotation : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION, Win32cr::Foundation::HRESULT),
    get_rotation : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*, Win32cr::Foundation::HRESULT),
    set_source_size : Proc(IDXGISwapChain3*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_source_size : Proc(IDXGISwapChain3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGISwapChain3*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGISwapChain3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_frame_latency_waitable_object : Proc(IDXGISwapChain3*, Win32cr::Foundation::HANDLE),
    set_matrix_transform : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    get_matrix_transform : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    get_current_back_buffer_index : Proc(IDXGISwapChain3*, UInt32),
    check_color_space_support : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, UInt32*, Win32cr::Foundation::HRESULT),
    set_color_space1 : Proc(IDXGISwapChain3*, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, Win32cr::Foundation::HRESULT),
    resize_buffers1 : Proc(IDXGISwapChain3*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("94d99bdb-f1f8-4ab0-b236-7da0170edab1")]
  record IDXGISwapChain3, lpVtbl : IDXGISwapChain3Vtbl* do
    GUID = LibC::GUID.new(0x94d99bdb_u32, 0xf1f8_u16, 0x4ab0_u16, StaticArray[0xb2_u8, 0x36_u8, 0x7d_u8, 0xa0_u8, 0x17_u8, 0xe_u8, 0xda_u8, 0xb1_u8])
    def query_interface(this : IDXGISwapChain3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISwapChain3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISwapChain3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISwapChain3*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISwapChain3*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISwapChain3*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISwapChain3*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISwapChain3*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def present(this : IDXGISwapChain3*, sync_interval : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this, sync_interval, flags)
    end
    def get_buffer(this : IDXGISwapChain3*, buffer : UInt32, riid : LibC::GUID*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, buffer, riid, ppSurface)
    end
    def set_fullscreen_state(this : IDXGISwapChain3*, fullscreen : Win32cr::Foundation::BOOL, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fullscreen_state.call(this, fullscreen, pTarget)
    end
    def get_fullscreen_state(this : IDXGISwapChain3*, pFullscreen : Win32cr::Foundation::BOOL*, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_state.call(this, pFullscreen, ppTarget)
    end
    def get_desc(this : IDXGISwapChain3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def resize_buffers(this : IDXGISwapChain3*, buffer_count : UInt32, width : UInt32, height : UInt32, new_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers.call(this, buffer_count, width, height, new_format, swap_chain_flags)
    end
    def resize_target(this : IDXGISwapChain3*, pNewTargetParameters : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_target.call(this, pNewTargetParameters)
    end
    def get_containing_output(this : IDXGISwapChain3*, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_output.call(this, ppOutput)
    end
    def get_frame_statistics(this : IDXGISwapChain3*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_last_present_count(this : IDXGISwapChain3*, pLastPresentCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_present_count.call(this, pLastPresentCount)
    end
    def get_desc1(this : IDXGISwapChain3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_fullscreen_desc(this : IDXGISwapChain3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_desc.call(this, pDesc)
    end
    def get_hwnd(this : IDXGISwapChain3*, pHwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hwnd.call(this, pHwnd)
    end
    def get_core_window(this : IDXGISwapChain3*, refiid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_core_window.call(this, refiid, ppUnk)
    end
    def present1(this : IDXGISwapChain3*, sync_interval : UInt32, present_flags : UInt32, pPresentParameters : Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present1.call(this, sync_interval, present_flags, pPresentParameters)
    end
    def is_temporary_mono_supported(this : IDXGISwapChain3*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_temporary_mono_supported.call(this)
    end
    def get_restrict_to_output(this : IDXGISwapChain3*, ppRestrictToOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrict_to_output.call(this, ppRestrictToOutput)
    end
    def set_background_color(this : IDXGISwapChain3*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_background_color.call(this, pColor)
    end
    def get_background_color(this : IDXGISwapChain3*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_background_color.call(this, pColor)
    end
    def set_rotation(this : IDXGISwapChain3*, rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rotation.call(this, rotation)
    end
    def get_rotation(this : IDXGISwapChain3*, pRotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rotation.call(this, pRotation)
    end
    def set_source_size(this : IDXGISwapChain3*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_size.call(this, width, height)
    end
    def get_source_size(this : IDXGISwapChain3*, pWidth : UInt32*, pHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_size.call(this, pWidth, pHeight)
    end
    def set_maximum_frame_latency(this : IDXGISwapChain3*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGISwapChain3*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end
    def get_frame_latency_waitable_object(this : IDXGISwapChain3*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_frame_latency_waitable_object.call(this)
    end
    def set_matrix_transform(this : IDXGISwapChain3*, pMatrix : Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_transform.call(this, pMatrix)
    end
    def get_matrix_transform(this : IDXGISwapChain3*, pMatrix : Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matrix_transform.call(this, pMatrix)
    end
    def get_current_back_buffer_index(this : IDXGISwapChain3*) : UInt32
      @lpVtbl.try &.value.get_current_back_buffer_index.call(this)
    end
    def check_color_space_support(this : IDXGISwapChain3*, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, pColorSpaceSupport : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_color_space_support.call(this, color_space, pColorSpaceSupport)
    end
    def set_color_space1(this : IDXGISwapChain3*, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_space1.call(this, color_space)
    end
    def resize_buffers1(this : IDXGISwapChain3*, buffer_count : UInt32, width : UInt32, height : UInt32, format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32, pCreationNodeMask : UInt32*, ppPresentQueue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers1.call(this, buffer_count, width, height, format, swap_chain_flags, pCreationNodeMask, ppPresentQueue)
    end

  end

  @[Extern]
  record IDXGIOutput4Vtbl,
    query_interface : Proc(IDXGIOutput4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput4*, UInt32),
    release : Proc(IDXGIOutput4*, UInt32),
    set_private_data : Proc(IDXGIOutput4*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput4*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput4*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput4*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput4*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput4*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput4*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput4*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_display_mode_list1 : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode1 : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data1 : Proc(IDXGIOutput4*, Void*, Win32cr::Foundation::HRESULT),
    duplicate_output : Proc(IDXGIOutput4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_overlays : Proc(IDXGIOutput4*, Win32cr::Foundation::BOOL),
    check_overlay_support : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    check_overlay_color_space_support : Proc(IDXGIOutput4*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, Void*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dc7dca35-2196-414d-9f53-617884032a60")]
  record IDXGIOutput4, lpVtbl : IDXGIOutput4Vtbl* do
    GUID = LibC::GUID.new(0xdc7dca35_u32, 0x2196_u16, 0x414d_u16, StaticArray[0x9f_u8, 0x53_u8, 0x61_u8, 0x78_u8, 0x84_u8, 0x3_u8, 0x2a_u8, 0x60_u8])
    def query_interface(this : IDXGIOutput4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput4*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput4*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput4*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput4*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput4*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput4*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput4*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput4*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput4*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput4*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput4*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput4*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput4*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput4*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_display_mode_list1(this : IDXGIOutput4*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list1.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode1(this : IDXGIOutput4*, pModeToMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pClosestMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode1.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def get_display_surface_data1(this : IDXGIOutput4*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data1.call(this, pDestination)
    end
    def duplicate_output(this : IDXGIOutput4*, pDevice : Void*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output.call(this, pDevice, ppOutputDuplication)
    end
    def supports_overlays(this : IDXGIOutput4*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.supports_overlays.call(this)
    end
    def check_overlay_support(this : IDXGIOutput4*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_support.call(this, enum_format, pConcernedDevice, pFlags)
    end
    def check_overlay_color_space_support(this : IDXGIOutput4*, format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_color_space_support.call(this, format, color_space, pConcernedDevice, pFlags)
    end

  end

  @[Extern]
  record IDXGIFactory4Vtbl,
    query_interface : Proc(IDXGIFactory4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory4*, UInt32),
    release : Proc(IDXGIFactory4*, UInt32),
    set_private_data : Proc(IDXGIFactory4*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory4*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory4*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory4*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory4*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory4*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory4*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory4*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory4*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory4*, Win32cr::Foundation::BOOL),
    is_windowed_stereo_enabled : Proc(IDXGIFactory4*, Win32cr::Foundation::BOOL),
    create_swap_chain_for_hwnd : Proc(IDXGIFactory4*, Void*, Win32cr::Foundation::HWND, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_swap_chain_for_core_window : Proc(IDXGIFactory4*, Void*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_resource_adapter_luid : Proc(IDXGIFactory4*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    register_stereo_status_window : Proc(IDXGIFactory4*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_stereo_status_event : Proc(IDXGIFactory4*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_stereo_status : Proc(IDXGIFactory4*, UInt32, Void),
    register_occlusion_status_window : Proc(IDXGIFactory4*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_occlusion_status_event : Proc(IDXGIFactory4*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_occlusion_status : Proc(IDXGIFactory4*, UInt32, Void),
    create_swap_chain_for_composition : Proc(IDXGIFactory4*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_creation_flags : Proc(IDXGIFactory4*, UInt32),
    enum_adapter_by_luid : Proc(IDXGIFactory4*, Win32cr::Foundation::LUID, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_warp_adapter : Proc(IDXGIFactory4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1bc6ea02-ef36-464f-bf0c-21ca39e5168a")]
  record IDXGIFactory4, lpVtbl : IDXGIFactory4Vtbl* do
    GUID = LibC::GUID.new(0x1bc6ea02_u32, 0xef36_u16, 0x464f_u16, StaticArray[0xbf_u8, 0xc_u8, 0x21_u8, 0xca_u8, 0x39_u8, 0xe5_u8, 0x16_u8, 0x8a_u8])
    def query_interface(this : IDXGIFactory4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory4*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory4*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory4*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory4*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory4*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory4*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory4*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory4*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory4*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory4*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory4*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end
    def is_windowed_stereo_enabled(this : IDXGIFactory4*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_windowed_stereo_enabled.call(this)
    end
    def create_swap_chain_for_hwnd(this : IDXGIFactory4*, pDevice : Void*, hWnd : Win32cr::Foundation::HWND, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pFullscreenDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_hwnd.call(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_swap_chain_for_core_window(this : IDXGIFactory4*, pDevice : Void*, pWindow : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_core_window.call(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_shared_resource_adapter_luid(this : IDXGIFactory4*, hResource : Win32cr::Foundation::HANDLE, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_resource_adapter_luid.call(this, hResource, pLuid)
    end
    def register_stereo_status_window(this : IDXGIFactory4*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_stereo_status_event(this : IDXGIFactory4*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_stereo_status(this : IDXGIFactory4*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_stereo_status.call(this, dwCookie)
    end
    def register_occlusion_status_window(this : IDXGIFactory4*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_occlusion_status_event(this : IDXGIFactory4*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_occlusion_status(this : IDXGIFactory4*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_occlusion_status.call(this, dwCookie)
    end
    def create_swap_chain_for_composition(this : IDXGIFactory4*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition.call(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_creation_flags(this : IDXGIFactory4*) : UInt32
      @lpVtbl.try &.value.get_creation_flags.call(this)
    end
    def enum_adapter_by_luid(this : IDXGIFactory4*, adapter_luid : Win32cr::Foundation::LUID, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapter_by_luid.call(this, adapter_luid, riid, ppvAdapter)
    end
    def enum_warp_adapter(this : IDXGIFactory4*, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_warp_adapter.call(this, riid, ppvAdapter)
    end

  end

  @[Extern]
  record IDXGIAdapter3Vtbl,
    query_interface : Proc(IDXGIAdapter3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIAdapter3*, UInt32),
    release : Proc(IDXGIAdapter3*, UInt32),
    set_private_data : Proc(IDXGIAdapter3*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIAdapter3*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIAdapter3*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIAdapter3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_outputs : Proc(IDXGIAdapter3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIAdapter3*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*, Win32cr::Foundation::HRESULT),
    check_interface_support : Proc(IDXGIAdapter3*, LibC::GUID*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGIAdapter3*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*, Win32cr::Foundation::HRESULT),
    get_desc2 : Proc(IDXGIAdapter3*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC2*, Win32cr::Foundation::HRESULT),
    register_hardware_content_protection_teardown_status_event : Proc(IDXGIAdapter3*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_hardware_content_protection_teardown_status : Proc(IDXGIAdapter3*, UInt32, Void),
    query_video_memory_info : Proc(IDXGIAdapter3*, UInt32, Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, Win32cr::Graphics::Dxgi::DXGI_QUERY_VIDEO_MEMORY_INFO*, Win32cr::Foundation::HRESULT),
    set_video_memory_reservation : Proc(IDXGIAdapter3*, UInt32, Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, UInt64, Win32cr::Foundation::HRESULT),
    register_video_memory_budget_change_notification_event : Proc(IDXGIAdapter3*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_video_memory_budget_change_notification : Proc(IDXGIAdapter3*, UInt32, Void)


  @[Extern]
  #@[Com("645967a4-1392-4310-a798-8053ce3e93fd")]
  record IDXGIAdapter3, lpVtbl : IDXGIAdapter3Vtbl* do
    GUID = LibC::GUID.new(0x645967a4_u32, 0x1392_u16, 0x4310_u16, StaticArray[0xa7_u8, 0x98_u8, 0x80_u8, 0x53_u8, 0xce_u8, 0x3e_u8, 0x93_u8, 0xfd_u8])
    def query_interface(this : IDXGIAdapter3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIAdapter3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIAdapter3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIAdapter3*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIAdapter3*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIAdapter3*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIAdapter3*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_outputs(this : IDXGIAdapter3*, output : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_outputs.call(this, output, ppOutput)
    end
    def get_desc(this : IDXGIAdapter3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def check_interface_support(this : IDXGIAdapter3*, interface_name : LibC::GUID*, pUMDVersion : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_interface_support.call(this, interface_name, pUMDVersion)
    end
    def get_desc1(this : IDXGIAdapter3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_desc2(this : IDXGIAdapter3*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc2.call(this, pDesc)
    end
    def register_hardware_content_protection_teardown_status_event(this : IDXGIAdapter3*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_hardware_content_protection_teardown_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_hardware_content_protection_teardown_status(this : IDXGIAdapter3*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_hardware_content_protection_teardown_status.call(this, dwCookie)
    end
    def query_video_memory_info(this : IDXGIAdapter3*, node_index : UInt32, memory_segment_group : Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, pVideoMemoryInfo : Win32cr::Graphics::Dxgi::DXGI_QUERY_VIDEO_MEMORY_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_video_memory_info.call(this, node_index, memory_segment_group, pVideoMemoryInfo)
    end
    def set_video_memory_reservation(this : IDXGIAdapter3*, node_index : UInt32, memory_segment_group : Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, reservation : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_video_memory_reservation.call(this, node_index, memory_segment_group, reservation)
    end
    def register_video_memory_budget_change_notification_event(this : IDXGIAdapter3*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_video_memory_budget_change_notification_event.call(this, hEvent, pdwCookie)
    end
    def unregister_video_memory_budget_change_notification(this : IDXGIAdapter3*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_video_memory_budget_change_notification.call(this, dwCookie)
    end

  end

  @[Extern]
  record IDXGIOutput5Vtbl,
    query_interface : Proc(IDXGIOutput5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput5*, UInt32),
    release : Proc(IDXGIOutput5*, UInt32),
    set_private_data : Proc(IDXGIOutput5*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput5*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput5*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput5*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput5*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput5*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput5*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput5*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_display_mode_list1 : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode1 : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data1 : Proc(IDXGIOutput5*, Void*, Win32cr::Foundation::HRESULT),
    duplicate_output : Proc(IDXGIOutput5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_overlays : Proc(IDXGIOutput5*, Win32cr::Foundation::BOOL),
    check_overlay_support : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    check_overlay_color_space_support : Proc(IDXGIOutput5*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    duplicate_output1 : Proc(IDXGIOutput5*, Void*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80a07424-ab52-42eb-833c-0c42fd282d98")]
  record IDXGIOutput5, lpVtbl : IDXGIOutput5Vtbl* do
    GUID = LibC::GUID.new(0x80a07424_u32, 0xab52_u16, 0x42eb_u16, StaticArray[0x83_u8, 0x3c_u8, 0xc_u8, 0x42_u8, 0xfd_u8, 0x28_u8, 0x2d_u8, 0x98_u8])
    def query_interface(this : IDXGIOutput5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput5*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput5*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput5*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput5*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput5*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput5*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput5*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput5*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput5*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput5*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput5*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput5*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput5*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput5*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput5*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_display_mode_list1(this : IDXGIOutput5*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list1.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode1(this : IDXGIOutput5*, pModeToMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pClosestMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode1.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def get_display_surface_data1(this : IDXGIOutput5*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data1.call(this, pDestination)
    end
    def duplicate_output(this : IDXGIOutput5*, pDevice : Void*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output.call(this, pDevice, ppOutputDuplication)
    end
    def supports_overlays(this : IDXGIOutput5*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.supports_overlays.call(this)
    end
    def check_overlay_support(this : IDXGIOutput5*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_support.call(this, enum_format, pConcernedDevice, pFlags)
    end
    def check_overlay_color_space_support(this : IDXGIOutput5*, format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_color_space_support.call(this, format, color_space, pConcernedDevice, pFlags)
    end
    def duplicate_output1(this : IDXGIOutput5*, pDevice : Void*, flags : UInt32, supported_formats_count : UInt32, pSupportedFormats : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output1.call(this, pDevice, flags, supported_formats_count, pSupportedFormats, ppOutputDuplication)
    end

  end

  @[Extern]
  record IDXGISwapChain4Vtbl,
    query_interface : Proc(IDXGISwapChain4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGISwapChain4*, UInt32),
    release : Proc(IDXGISwapChain4*, UInt32),
    set_private_data : Proc(IDXGISwapChain4*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGISwapChain4*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGISwapChain4*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGISwapChain4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_device : Proc(IDXGISwapChain4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present : Proc(IDXGISwapChain4*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(IDXGISwapChain4*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_fullscreen_state : Proc(IDXGISwapChain4*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    get_fullscreen_state : Proc(IDXGISwapChain4*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Win32cr::Foundation::HRESULT),
    resize_buffers : Proc(IDXGISwapChain4*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, Win32cr::Foundation::HRESULT),
    resize_target : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    get_containing_output : Proc(IDXGISwapChain4*, Void**, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_last_present_count : Proc(IDXGISwapChain4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Foundation::HRESULT),
    get_fullscreen_desc : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Win32cr::Foundation::HRESULT),
    get_hwnd : Proc(IDXGISwapChain4*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_core_window : Proc(IDXGISwapChain4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    present1 : Proc(IDXGISwapChain4*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*, Win32cr::Foundation::HRESULT),
    is_temporary_mono_supported : Proc(IDXGISwapChain4*, Win32cr::Foundation::BOOL),
    get_restrict_to_output : Proc(IDXGISwapChain4*, Void**, Win32cr::Foundation::HRESULT),
    set_background_color : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    get_background_color : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_RGBA*, Win32cr::Foundation::HRESULT),
    set_rotation : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION, Win32cr::Foundation::HRESULT),
    get_rotation : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*, Win32cr::Foundation::HRESULT),
    set_source_size : Proc(IDXGISwapChain4*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_source_size : Proc(IDXGISwapChain4*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGISwapChain4*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGISwapChain4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_frame_latency_waitable_object : Proc(IDXGISwapChain4*, Win32cr::Foundation::HANDLE),
    set_matrix_transform : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    get_matrix_transform : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    get_current_back_buffer_index : Proc(IDXGISwapChain4*, UInt32),
    check_color_space_support : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, UInt32*, Win32cr::Foundation::HRESULT),
    set_color_space1 : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, Win32cr::Foundation::HRESULT),
    resize_buffers1 : Proc(IDXGISwapChain4*, UInt32, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    set_hdr_meta_data : Proc(IDXGISwapChain4*, Win32cr::Graphics::Dxgi::DXGI_HDR_METADATA_TYPE, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3d585d5a-bd4a-489e-b1f4-3dbcb6452ffb")]
  record IDXGISwapChain4, lpVtbl : IDXGISwapChain4Vtbl* do
    GUID = LibC::GUID.new(0x3d585d5a_u32, 0xbd4a_u16, 0x489e_u16, StaticArray[0xb1_u8, 0xf4_u8, 0x3d_u8, 0xbc_u8, 0xb6_u8, 0x45_u8, 0x2f_u8, 0xfb_u8])
    def query_interface(this : IDXGISwapChain4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGISwapChain4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGISwapChain4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGISwapChain4*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGISwapChain4*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGISwapChain4*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGISwapChain4*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_device(this : IDXGISwapChain4*, riid : LibC::GUID*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, riid, ppDevice)
    end
    def present(this : IDXGISwapChain4*, sync_interval : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present.call(this, sync_interval, flags)
    end
    def get_buffer(this : IDXGISwapChain4*, buffer : UInt32, riid : LibC::GUID*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, buffer, riid, ppSurface)
    end
    def set_fullscreen_state(this : IDXGISwapChain4*, fullscreen : Win32cr::Foundation::BOOL, pTarget : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_fullscreen_state.call(this, fullscreen, pTarget)
    end
    def get_fullscreen_state(this : IDXGISwapChain4*, pFullscreen : Win32cr::Foundation::BOOL*, ppTarget : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_state.call(this, pFullscreen, ppTarget)
    end
    def get_desc(this : IDXGISwapChain4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def resize_buffers(this : IDXGISwapChain4*, buffer_count : UInt32, width : UInt32, height : UInt32, new_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers.call(this, buffer_count, width, height, new_format, swap_chain_flags)
    end
    def resize_target(this : IDXGISwapChain4*, pNewTargetParameters : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_target.call(this, pNewTargetParameters)
    end
    def get_containing_output(this : IDXGISwapChain4*, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_containing_output.call(this, ppOutput)
    end
    def get_frame_statistics(this : IDXGISwapChain4*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_last_present_count(this : IDXGISwapChain4*, pLastPresentCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_present_count.call(this, pLastPresentCount)
    end
    def get_desc1(this : IDXGISwapChain4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_fullscreen_desc(this : IDXGISwapChain4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_fullscreen_desc.call(this, pDesc)
    end
    def get_hwnd(this : IDXGISwapChain4*, pHwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hwnd.call(this, pHwnd)
    end
    def get_core_window(this : IDXGISwapChain4*, refiid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_core_window.call(this, refiid, ppUnk)
    end
    def present1(this : IDXGISwapChain4*, sync_interval : UInt32, present_flags : UInt32, pPresentParameters : Win32cr::Graphics::Dxgi::DXGI_PRESENT_PARAMETERS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.present1.call(this, sync_interval, present_flags, pPresentParameters)
    end
    def is_temporary_mono_supported(this : IDXGISwapChain4*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_temporary_mono_supported.call(this)
    end
    def get_restrict_to_output(this : IDXGISwapChain4*, ppRestrictToOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrict_to_output.call(this, ppRestrictToOutput)
    end
    def set_background_color(this : IDXGISwapChain4*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_background_color.call(this, pColor)
    end
    def get_background_color(this : IDXGISwapChain4*, pColor : Win32cr::Graphics::Dxgi::DXGI_RGBA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_background_color.call(this, pColor)
    end
    def set_rotation(this : IDXGISwapChain4*, rotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rotation.call(this, rotation)
    end
    def get_rotation(this : IDXGISwapChain4*, pRotation : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_ROTATION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rotation.call(this, pRotation)
    end
    def set_source_size(this : IDXGISwapChain4*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_source_size.call(this, width, height)
    end
    def get_source_size(this : IDXGISwapChain4*, pWidth : UInt32*, pHeight : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_size.call(this, pWidth, pHeight)
    end
    def set_maximum_frame_latency(this : IDXGISwapChain4*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGISwapChain4*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end
    def get_frame_latency_waitable_object(this : IDXGISwapChain4*) : Win32cr::Foundation::HANDLE
      @lpVtbl.try &.value.get_frame_latency_waitable_object.call(this)
    end
    def set_matrix_transform(this : IDXGISwapChain4*, pMatrix : Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_transform.call(this, pMatrix)
    end
    def get_matrix_transform(this : IDXGISwapChain4*, pMatrix : Win32cr::Graphics::Dxgi::DXGI_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_matrix_transform.call(this, pMatrix)
    end
    def get_current_back_buffer_index(this : IDXGISwapChain4*) : UInt32
      @lpVtbl.try &.value.get_current_back_buffer_index.call(this)
    end
    def check_color_space_support(this : IDXGISwapChain4*, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, pColorSpaceSupport : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_color_space_support.call(this, color_space, pColorSpaceSupport)
    end
    def set_color_space1(this : IDXGISwapChain4*, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color_space1.call(this, color_space)
    end
    def resize_buffers1(this : IDXGISwapChain4*, buffer_count : UInt32, width : UInt32, height : UInt32, format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, swap_chain_flags : UInt32, pCreationNodeMask : UInt32*, ppPresentQueue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_buffers1.call(this, buffer_count, width, height, format, swap_chain_flags, pCreationNodeMask, ppPresentQueue)
    end
    def set_hdr_meta_data(this : IDXGISwapChain4*, type__ : Win32cr::Graphics::Dxgi::DXGI_HDR_METADATA_TYPE, size : UInt32, pMetaData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hdr_meta_data.call(this, type__, size, pMetaData)
    end

  end

  @[Extern]
  record IDXGIDevice4Vtbl,
    query_interface : Proc(IDXGIDevice4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDevice4*, UInt32),
    release : Proc(IDXGIDevice4*, UInt32),
    set_private_data : Proc(IDXGIDevice4*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIDevice4*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIDevice4*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIDevice4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_adapter : Proc(IDXGIDevice4*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDXGIDevice4*, Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, UInt32, UInt32, Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, Void**, Win32cr::Foundation::HRESULT),
    query_resource_residency : Proc(IDXGIDevice4*, Void**, Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, UInt32, Win32cr::Foundation::HRESULT),
    set_gpu_thread_priority : Proc(IDXGIDevice4*, Int32, Win32cr::Foundation::HRESULT),
    get_gpu_thread_priority : Proc(IDXGIDevice4*, Int32*, Win32cr::Foundation::HRESULT),
    set_maximum_frame_latency : Proc(IDXGIDevice4*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_frame_latency : Proc(IDXGIDevice4*, UInt32*, Win32cr::Foundation::HRESULT),
    offer_resources : Proc(IDXGIDevice4*, UInt32, Void**, Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY, Win32cr::Foundation::HRESULT),
    reclaim_resources : Proc(IDXGIDevice4*, UInt32, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enqueue_set_event : Proc(IDXGIDevice4*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    trim : Proc(IDXGIDevice4*, Void),
    offer_resources1 : Proc(IDXGIDevice4*, UInt32, Void**, Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY, UInt32, Win32cr::Foundation::HRESULT),
    reclaim_resources1 : Proc(IDXGIDevice4*, UInt32, Void**, Win32cr::Graphics::Dxgi::DXGI_RECLAIM_RESOURCE_RESULTS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("95b4f95f-d8da-4ca4-9ee6-3b76d5968a10")]
  record IDXGIDevice4, lpVtbl : IDXGIDevice4Vtbl* do
    GUID = LibC::GUID.new(0x95b4f95f_u32, 0xd8da_u16, 0x4ca4_u16, StaticArray[0x9e_u8, 0xe6_u8, 0x3b_u8, 0x76_u8, 0xd5_u8, 0x96_u8, 0x8a_u8, 0x10_u8])
    def query_interface(this : IDXGIDevice4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDevice4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDevice4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIDevice4*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIDevice4*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIDevice4*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIDevice4*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_adapter(this : IDXGIDevice4*, pAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adapter.call(this, pAdapter)
    end
    def create_surface(this : IDXGIDevice4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SURFACE_DESC*, num_surfaces : UInt32, usage : UInt32, pSharedResource : Win32cr::Graphics::Dxgi::DXGI_SHARED_RESOURCE*, ppSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, pDesc, num_surfaces, usage, pSharedResource, ppSurface)
    end
    def query_resource_residency(this : IDXGIDevice4*, ppResources : Void**, pResidencyStatus : Win32cr::Graphics::Dxgi::DXGI_RESIDENCY*, num_resources : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_resource_residency.call(this, ppResources, pResidencyStatus, num_resources)
    end
    def set_gpu_thread_priority(this : IDXGIDevice4*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gpu_thread_priority.call(this, priority)
    end
    def get_gpu_thread_priority(this : IDXGIDevice4*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gpu_thread_priority.call(this, pPriority)
    end
    def set_maximum_frame_latency(this : IDXGIDevice4*, max_latency : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_frame_latency.call(this, max_latency)
    end
    def get_maximum_frame_latency(this : IDXGIDevice4*, pMaxLatency : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_frame_latency.call(this, pMaxLatency)
    end
    def offer_resources(this : IDXGIDevice4*, num_resources : UInt32, ppResources : Void**, priority : Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.offer_resources.call(this, num_resources, ppResources, priority)
    end
    def reclaim_resources(this : IDXGIDevice4*, num_resources : UInt32, ppResources : Void**, pDiscarded : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reclaim_resources.call(this, num_resources, ppResources, pDiscarded)
    end
    def enqueue_set_event(this : IDXGIDevice4*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enqueue_set_event.call(this, hEvent)
    end
    def trim(this : IDXGIDevice4*) : Void
      @lpVtbl.try &.value.trim.call(this)
    end
    def offer_resources1(this : IDXGIDevice4*, num_resources : UInt32, ppResources : Void**, priority : Win32cr::Graphics::Dxgi::DXGI_OFFER_RESOURCE_PRIORITY, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.offer_resources1.call(this, num_resources, ppResources, priority, flags)
    end
    def reclaim_resources1(this : IDXGIDevice4*, num_resources : UInt32, ppResources : Void**, pResults : Win32cr::Graphics::Dxgi::DXGI_RECLAIM_RESOURCE_RESULTS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reclaim_resources1.call(this, num_resources, ppResources, pResults)
    end

  end

  @[Extern]
  record IDXGIFactory5Vtbl,
    query_interface : Proc(IDXGIFactory5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory5*, UInt32),
    release : Proc(IDXGIFactory5*, UInt32),
    set_private_data : Proc(IDXGIFactory5*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory5*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory5*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory5*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory5*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory5*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory5*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory5*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory5*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory5*, Win32cr::Foundation::BOOL),
    is_windowed_stereo_enabled : Proc(IDXGIFactory5*, Win32cr::Foundation::BOOL),
    create_swap_chain_for_hwnd : Proc(IDXGIFactory5*, Void*, Win32cr::Foundation::HWND, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_swap_chain_for_core_window : Proc(IDXGIFactory5*, Void*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_resource_adapter_luid : Proc(IDXGIFactory5*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    register_stereo_status_window : Proc(IDXGIFactory5*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_stereo_status_event : Proc(IDXGIFactory5*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_stereo_status : Proc(IDXGIFactory5*, UInt32, Void),
    register_occlusion_status_window : Proc(IDXGIFactory5*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_occlusion_status_event : Proc(IDXGIFactory5*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_occlusion_status : Proc(IDXGIFactory5*, UInt32, Void),
    create_swap_chain_for_composition : Proc(IDXGIFactory5*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_creation_flags : Proc(IDXGIFactory5*, UInt32),
    enum_adapter_by_luid : Proc(IDXGIFactory5*, Win32cr::Foundation::LUID, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_warp_adapter : Proc(IDXGIFactory5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    check_feature_support : Proc(IDXGIFactory5*, Win32cr::Graphics::Dxgi::DXGI_FEATURE, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7632e1f5-ee65-4dca-87fd-84cd75f8838d")]
  record IDXGIFactory5, lpVtbl : IDXGIFactory5Vtbl* do
    GUID = LibC::GUID.new(0x7632e1f5_u32, 0xee65_u16, 0x4dca_u16, StaticArray[0x87_u8, 0xfd_u8, 0x84_u8, 0xcd_u8, 0x75_u8, 0xf8_u8, 0x83_u8, 0x8d_u8])
    def query_interface(this : IDXGIFactory5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory5*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory5*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory5*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory5*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory5*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory5*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory5*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory5*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory5*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory5*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory5*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end
    def is_windowed_stereo_enabled(this : IDXGIFactory5*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_windowed_stereo_enabled.call(this)
    end
    def create_swap_chain_for_hwnd(this : IDXGIFactory5*, pDevice : Void*, hWnd : Win32cr::Foundation::HWND, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pFullscreenDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_hwnd.call(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_swap_chain_for_core_window(this : IDXGIFactory5*, pDevice : Void*, pWindow : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_core_window.call(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_shared_resource_adapter_luid(this : IDXGIFactory5*, hResource : Win32cr::Foundation::HANDLE, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_resource_adapter_luid.call(this, hResource, pLuid)
    end
    def register_stereo_status_window(this : IDXGIFactory5*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_stereo_status_event(this : IDXGIFactory5*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_stereo_status(this : IDXGIFactory5*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_stereo_status.call(this, dwCookie)
    end
    def register_occlusion_status_window(this : IDXGIFactory5*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_occlusion_status_event(this : IDXGIFactory5*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_occlusion_status(this : IDXGIFactory5*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_occlusion_status.call(this, dwCookie)
    end
    def create_swap_chain_for_composition(this : IDXGIFactory5*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition.call(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_creation_flags(this : IDXGIFactory5*) : UInt32
      @lpVtbl.try &.value.get_creation_flags.call(this)
    end
    def enum_adapter_by_luid(this : IDXGIFactory5*, adapter_luid : Win32cr::Foundation::LUID, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapter_by_luid.call(this, adapter_luid, riid, ppvAdapter)
    end
    def enum_warp_adapter(this : IDXGIFactory5*, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_warp_adapter.call(this, riid, ppvAdapter)
    end
    def check_feature_support(this : IDXGIFactory5*, feature : Win32cr::Graphics::Dxgi::DXGI_FEATURE, pFeatureSupportData : Void*, feature_support_data_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_feature_support.call(this, feature, pFeatureSupportData, feature_support_data_size)
    end

  end

  @[Extern]
  record IDXGIAdapter4Vtbl,
    query_interface : Proc(IDXGIAdapter4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIAdapter4*, UInt32),
    release : Proc(IDXGIAdapter4*, UInt32),
    set_private_data : Proc(IDXGIAdapter4*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIAdapter4*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIAdapter4*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIAdapter4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_outputs : Proc(IDXGIAdapter4*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIAdapter4*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*, Win32cr::Foundation::HRESULT),
    check_interface_support : Proc(IDXGIAdapter4*, LibC::GUID*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGIAdapter4*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*, Win32cr::Foundation::HRESULT),
    get_desc2 : Proc(IDXGIAdapter4*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC2*, Win32cr::Foundation::HRESULT),
    register_hardware_content_protection_teardown_status_event : Proc(IDXGIAdapter4*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_hardware_content_protection_teardown_status : Proc(IDXGIAdapter4*, UInt32, Void),
    query_video_memory_info : Proc(IDXGIAdapter4*, UInt32, Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, Win32cr::Graphics::Dxgi::DXGI_QUERY_VIDEO_MEMORY_INFO*, Win32cr::Foundation::HRESULT),
    set_video_memory_reservation : Proc(IDXGIAdapter4*, UInt32, Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, UInt64, Win32cr::Foundation::HRESULT),
    register_video_memory_budget_change_notification_event : Proc(IDXGIAdapter4*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_video_memory_budget_change_notification : Proc(IDXGIAdapter4*, UInt32, Void),
    get_desc3 : Proc(IDXGIAdapter4*, Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC3*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3c8d99d1-4fbf-4181-a82c-af66bf7bd24e")]
  record IDXGIAdapter4, lpVtbl : IDXGIAdapter4Vtbl* do
    GUID = LibC::GUID.new(0x3c8d99d1_u32, 0x4fbf_u16, 0x4181_u16, StaticArray[0xa8_u8, 0x2c_u8, 0xaf_u8, 0x66_u8, 0xbf_u8, 0x7b_u8, 0xd2_u8, 0x4e_u8])
    def query_interface(this : IDXGIAdapter4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIAdapter4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIAdapter4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIAdapter4*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIAdapter4*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIAdapter4*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIAdapter4*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_outputs(this : IDXGIAdapter4*, output : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_outputs.call(this, output, ppOutput)
    end
    def get_desc(this : IDXGIAdapter4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def check_interface_support(this : IDXGIAdapter4*, interface_name : LibC::GUID*, pUMDVersion : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_interface_support.call(this, interface_name, pUMDVersion)
    end
    def get_desc1(this : IDXGIAdapter4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def get_desc2(this : IDXGIAdapter4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc2.call(this, pDesc)
    end
    def register_hardware_content_protection_teardown_status_event(this : IDXGIAdapter4*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_hardware_content_protection_teardown_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_hardware_content_protection_teardown_status(this : IDXGIAdapter4*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_hardware_content_protection_teardown_status.call(this, dwCookie)
    end
    def query_video_memory_info(this : IDXGIAdapter4*, node_index : UInt32, memory_segment_group : Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, pVideoMemoryInfo : Win32cr::Graphics::Dxgi::DXGI_QUERY_VIDEO_MEMORY_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_video_memory_info.call(this, node_index, memory_segment_group, pVideoMemoryInfo)
    end
    def set_video_memory_reservation(this : IDXGIAdapter4*, node_index : UInt32, memory_segment_group : Win32cr::Graphics::Dxgi::DXGI_MEMORY_SEGMENT_GROUP, reservation : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_video_memory_reservation.call(this, node_index, memory_segment_group, reservation)
    end
    def register_video_memory_budget_change_notification_event(this : IDXGIAdapter4*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_video_memory_budget_change_notification_event.call(this, hEvent, pdwCookie)
    end
    def unregister_video_memory_budget_change_notification(this : IDXGIAdapter4*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_video_memory_budget_change_notification.call(this, dwCookie)
    end
    def get_desc3(this : IDXGIAdapter4*, pDesc : Win32cr::Graphics::Dxgi::DXGI_ADAPTER_DESC3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc3.call(this, pDesc)
    end

  end

  @[Extern]
  record IDXGIOutput6Vtbl,
    query_interface : Proc(IDXGIOutput6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIOutput6*, UInt32),
    release : Proc(IDXGIOutput6*, UInt32),
    set_private_data : Proc(IDXGIOutput6*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIOutput6*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIOutput6*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIOutput6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_desc : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*, Win32cr::Foundation::HRESULT),
    get_display_mode_list : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, Void*, Win32cr::Foundation::HRESULT),
    wait_for_v_blank : Proc(IDXGIOutput6*, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(IDXGIOutput6*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    release_ownership : Proc(IDXGIOutput6*, Void),
    get_gamma_control_capabilities : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*, Win32cr::Foundation::HRESULT),
    set_gamma_control : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    get_gamma_control : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*, Win32cr::Foundation::HRESULT),
    set_display_surface : Proc(IDXGIOutput6*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data : Proc(IDXGIOutput6*, Void*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    get_display_mode_list1 : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, UInt32, UInt32*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Foundation::HRESULT),
    find_closest_matching_mode1 : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, Void*, Win32cr::Foundation::HRESULT),
    get_display_surface_data1 : Proc(IDXGIOutput6*, Void*, Win32cr::Foundation::HRESULT),
    duplicate_output : Proc(IDXGIOutput6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    supports_overlays : Proc(IDXGIOutput6*, Win32cr::Foundation::BOOL),
    check_overlay_support : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    check_overlay_color_space_support : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    duplicate_output1 : Proc(IDXGIOutput6*, Void*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT*, Void**, Win32cr::Foundation::HRESULT),
    get_desc1 : Proc(IDXGIOutput6*, Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC1*, Win32cr::Foundation::HRESULT),
    check_hardware_composition_support : Proc(IDXGIOutput6*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("068346e8-aaec-4b84-add7-137f513f77a1")]
  record IDXGIOutput6, lpVtbl : IDXGIOutput6Vtbl* do
    GUID = LibC::GUID.new(0x68346e8_u32, 0xaaec_u16, 0x4b84_u16, StaticArray[0xad_u8, 0xd7_u8, 0x13_u8, 0x7f_u8, 0x51_u8, 0x3f_u8, 0x77_u8, 0xa1_u8])
    def query_interface(this : IDXGIOutput6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIOutput6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIOutput6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIOutput6*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIOutput6*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIOutput6*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIOutput6*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def get_desc(this : IDXGIOutput6*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc.call(this, pDesc)
    end
    def get_display_mode_list(this : IDXGIOutput6*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode(this : IDXGIOutput6*, pModeToMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pClosestMatch : Win32cr::Graphics::Dxgi::Common::DXGI_MODE_DESC*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def wait_for_v_blank(this : IDXGIOutput6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_v_blank.call(this)
    end
    def take_ownership(this : IDXGIOutput6*, pDevice : Void*, exclusive : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, pDevice, exclusive)
    end
    def release_ownership(this : IDXGIOutput6*) : Void
      @lpVtbl.try &.value.release_ownership.call(this)
    end
    def get_gamma_control_capabilities(this : IDXGIOutput6*, pGammaCaps : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL_CAPABILITIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control_capabilities.call(this, pGammaCaps)
    end
    def set_gamma_control(this : IDXGIOutput6*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamma_control.call(this, pArray)
    end
    def get_gamma_control(this : IDXGIOutput6*, pArray : Win32cr::Graphics::Dxgi::Common::DXGI_GAMMA_CONTROL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamma_control.call(this, pArray)
    end
    def set_display_surface(this : IDXGIOutput6*, pScanoutSurface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_display_surface.call(this, pScanoutSurface)
    end
    def get_display_surface_data(this : IDXGIOutput6*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data.call(this, pDestination)
    end
    def get_frame_statistics(this : IDXGIOutput6*, pStats : Win32cr::Graphics::Dxgi::DXGI_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, pStats)
    end
    def get_display_mode_list1(this : IDXGIOutput6*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, flags : UInt32, pNumModes : UInt32*, pDesc : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_mode_list1.call(this, enum_format, flags, pNumModes, pDesc)
    end
    def find_closest_matching_mode1(this : IDXGIOutput6*, pModeToMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pClosestMatch : Win32cr::Graphics::Dxgi::DXGI_MODE_DESC1*, pConcernedDevice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_matching_mode1.call(this, pModeToMatch, pClosestMatch, pConcernedDevice)
    end
    def get_display_surface_data1(this : IDXGIOutput6*, pDestination : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_surface_data1.call(this, pDestination)
    end
    def duplicate_output(this : IDXGIOutput6*, pDevice : Void*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output.call(this, pDevice, ppOutputDuplication)
    end
    def supports_overlays(this : IDXGIOutput6*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.supports_overlays.call(this)
    end
    def check_overlay_support(this : IDXGIOutput6*, enum_format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_support.call(this, enum_format, pConcernedDevice, pFlags)
    end
    def check_overlay_color_space_support(this : IDXGIOutput6*, format : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, color_space : Win32cr::Graphics::Dxgi::Common::DXGI_COLOR_SPACE_TYPE, pConcernedDevice : Void*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_overlay_color_space_support.call(this, format, color_space, pConcernedDevice, pFlags)
    end
    def duplicate_output1(this : IDXGIOutput6*, pDevice : Void*, flags : UInt32, supported_formats_count : UInt32, pSupportedFormats : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT*, ppOutputDuplication : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.duplicate_output1.call(this, pDevice, flags, supported_formats_count, pSupportedFormats, ppOutputDuplication)
    end
    def get_desc1(this : IDXGIOutput6*, pDesc : Win32cr::Graphics::Dxgi::DXGI_OUTPUT_DESC1*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_desc1.call(this, pDesc)
    end
    def check_hardware_composition_support(this : IDXGIOutput6*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_hardware_composition_support.call(this, pFlags)
    end

  end

  @[Extern]
  record IDXGIFactory6Vtbl,
    query_interface : Proc(IDXGIFactory6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory6*, UInt32),
    release : Proc(IDXGIFactory6*, UInt32),
    set_private_data : Proc(IDXGIFactory6*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory6*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory6*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory6*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory6*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory6*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory6*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory6*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory6*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory6*, Win32cr::Foundation::BOOL),
    is_windowed_stereo_enabled : Proc(IDXGIFactory6*, Win32cr::Foundation::BOOL),
    create_swap_chain_for_hwnd : Proc(IDXGIFactory6*, Void*, Win32cr::Foundation::HWND, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_swap_chain_for_core_window : Proc(IDXGIFactory6*, Void*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_resource_adapter_luid : Proc(IDXGIFactory6*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    register_stereo_status_window : Proc(IDXGIFactory6*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_stereo_status_event : Proc(IDXGIFactory6*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_stereo_status : Proc(IDXGIFactory6*, UInt32, Void),
    register_occlusion_status_window : Proc(IDXGIFactory6*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_occlusion_status_event : Proc(IDXGIFactory6*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_occlusion_status : Proc(IDXGIFactory6*, UInt32, Void),
    create_swap_chain_for_composition : Proc(IDXGIFactory6*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_creation_flags : Proc(IDXGIFactory6*, UInt32),
    enum_adapter_by_luid : Proc(IDXGIFactory6*, Win32cr::Foundation::LUID, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_warp_adapter : Proc(IDXGIFactory6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    check_feature_support : Proc(IDXGIFactory6*, Win32cr::Graphics::Dxgi::DXGI_FEATURE, Void*, UInt32, Win32cr::Foundation::HRESULT),
    enum_adapter_by_gpu_preference : Proc(IDXGIFactory6*, UInt32, Win32cr::Graphics::Dxgi::DXGI_GPU_PREFERENCE, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c1b6694f-ff09-44a9-b03c-77900a0a1d17")]
  record IDXGIFactory6, lpVtbl : IDXGIFactory6Vtbl* do
    GUID = LibC::GUID.new(0xc1b6694f_u32, 0xff09_u16, 0x44a9_u16, StaticArray[0xb0_u8, 0x3c_u8, 0x77_u8, 0x90_u8, 0xa_u8, 0xa_u8, 0x1d_u8, 0x17_u8])
    def query_interface(this : IDXGIFactory6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory6*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory6*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory6*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory6*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory6*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory6*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory6*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory6*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory6*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory6*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory6*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end
    def is_windowed_stereo_enabled(this : IDXGIFactory6*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_windowed_stereo_enabled.call(this)
    end
    def create_swap_chain_for_hwnd(this : IDXGIFactory6*, pDevice : Void*, hWnd : Win32cr::Foundation::HWND, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pFullscreenDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_hwnd.call(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_swap_chain_for_core_window(this : IDXGIFactory6*, pDevice : Void*, pWindow : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_core_window.call(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_shared_resource_adapter_luid(this : IDXGIFactory6*, hResource : Win32cr::Foundation::HANDLE, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_resource_adapter_luid.call(this, hResource, pLuid)
    end
    def register_stereo_status_window(this : IDXGIFactory6*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_stereo_status_event(this : IDXGIFactory6*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_stereo_status(this : IDXGIFactory6*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_stereo_status.call(this, dwCookie)
    end
    def register_occlusion_status_window(this : IDXGIFactory6*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_occlusion_status_event(this : IDXGIFactory6*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_occlusion_status(this : IDXGIFactory6*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_occlusion_status.call(this, dwCookie)
    end
    def create_swap_chain_for_composition(this : IDXGIFactory6*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition.call(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_creation_flags(this : IDXGIFactory6*) : UInt32
      @lpVtbl.try &.value.get_creation_flags.call(this)
    end
    def enum_adapter_by_luid(this : IDXGIFactory6*, adapter_luid : Win32cr::Foundation::LUID, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapter_by_luid.call(this, adapter_luid, riid, ppvAdapter)
    end
    def enum_warp_adapter(this : IDXGIFactory6*, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_warp_adapter.call(this, riid, ppvAdapter)
    end
    def check_feature_support(this : IDXGIFactory6*, feature : Win32cr::Graphics::Dxgi::DXGI_FEATURE, pFeatureSupportData : Void*, feature_support_data_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_feature_support.call(this, feature, pFeatureSupportData, feature_support_data_size)
    end
    def enum_adapter_by_gpu_preference(this : IDXGIFactory6*, adapter : UInt32, gpu_preference : Win32cr::Graphics::Dxgi::DXGI_GPU_PREFERENCE, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapter_by_gpu_preference.call(this, adapter, gpu_preference, riid, ppvAdapter)
    end

  end

  @[Extern]
  record IDXGIFactory7Vtbl,
    query_interface : Proc(IDXGIFactory7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIFactory7*, UInt32),
    release : Proc(IDXGIFactory7*, UInt32),
    set_private_data : Proc(IDXGIFactory7*, LibC::GUID*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_private_data_interface : Proc(IDXGIFactory7*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_private_data : Proc(IDXGIFactory7*, LibC::GUID*, UInt32*, Void*, Win32cr::Foundation::HRESULT),
    get_parent : Proc(IDXGIFactory7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters : Proc(IDXGIFactory7*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    make_window_association : Proc(IDXGIFactory7*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_window_association : Proc(IDXGIFactory7*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    create_swap_chain : Proc(IDXGIFactory7*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, Void**, Win32cr::Foundation::HRESULT),
    create_software_adapter : Proc(IDXGIFactory7*, Win32cr::Foundation::HINSTANCE, Void**, Win32cr::Foundation::HRESULT),
    enum_adapters1 : Proc(IDXGIFactory7*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    is_current : Proc(IDXGIFactory7*, Win32cr::Foundation::BOOL),
    is_windowed_stereo_enabled : Proc(IDXGIFactory7*, Win32cr::Foundation::BOOL),
    create_swap_chain_for_hwnd : Proc(IDXGIFactory7*, Void*, Win32cr::Foundation::HWND, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_swap_chain_for_core_window : Proc(IDXGIFactory7*, Void*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_shared_resource_adapter_luid : Proc(IDXGIFactory7*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::LUID*, Win32cr::Foundation::HRESULT),
    register_stereo_status_window : Proc(IDXGIFactory7*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_stereo_status_event : Proc(IDXGIFactory7*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_stereo_status : Proc(IDXGIFactory7*, UInt32, Void),
    register_occlusion_status_window : Proc(IDXGIFactory7*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    register_occlusion_status_event : Proc(IDXGIFactory7*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_occlusion_status : Proc(IDXGIFactory7*, UInt32, Void),
    create_swap_chain_for_composition : Proc(IDXGIFactory7*, Void*, Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_creation_flags : Proc(IDXGIFactory7*, UInt32),
    enum_adapter_by_luid : Proc(IDXGIFactory7*, Win32cr::Foundation::LUID, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_warp_adapter : Proc(IDXGIFactory7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    check_feature_support : Proc(IDXGIFactory7*, Win32cr::Graphics::Dxgi::DXGI_FEATURE, Void*, UInt32, Win32cr::Foundation::HRESULT),
    enum_adapter_by_gpu_preference : Proc(IDXGIFactory7*, UInt32, Win32cr::Graphics::Dxgi::DXGI_GPU_PREFERENCE, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    register_adapters_changed_event : Proc(IDXGIFactory7*, Win32cr::Foundation::HANDLE, UInt32*, Win32cr::Foundation::HRESULT),
    unregister_adapters_changed_event : Proc(IDXGIFactory7*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a4966eed-76db-44da-84c1-ee9a7afb20a8")]
  record IDXGIFactory7, lpVtbl : IDXGIFactory7Vtbl* do
    GUID = LibC::GUID.new(0xa4966eed_u32, 0x76db_u16, 0x44da_u16, StaticArray[0x84_u8, 0xc1_u8, 0xee_u8, 0x9a_u8, 0x7a_u8, 0xfb_u8, 0x20_u8, 0xa8_u8])
    def query_interface(this : IDXGIFactory7*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIFactory7*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIFactory7*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_private_data(this : IDXGIFactory7*, name : LibC::GUID*, data_size : UInt32, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data.call(this, name, data_size, pData)
    end
    def set_private_data_interface(this : IDXGIFactory7*, name : LibC::GUID*, pUnknown : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_private_data_interface.call(this, name, pUnknown)
    end
    def get_private_data(this : IDXGIFactory7*, name : LibC::GUID*, pDataSize : UInt32*, pData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_private_data.call(this, name, pDataSize, pData)
    end
    def get_parent(this : IDXGIFactory7*, riid : LibC::GUID*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent.call(this, riid, ppParent)
    end
    def enum_adapters(this : IDXGIFactory7*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters.call(this, adapter, ppAdapter)
    end
    def make_window_association(this : IDXGIFactory7*, window_handle : Win32cr::Foundation::HWND, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_window_association.call(this, window_handle, flags)
    end
    def get_window_association(this : IDXGIFactory7*, pWindowHandle : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_window_association.call(this, pWindowHandle)
    end
    def create_swap_chain(this : IDXGIFactory7*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain.call(this, pDevice, pDesc, ppSwapChain)
    end
    def create_software_adapter(this : IDXGIFactory7*, module__ : Win32cr::Foundation::HINSTANCE, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_software_adapter.call(this, module__, ppAdapter)
    end
    def enum_adapters1(this : IDXGIFactory7*, adapter : UInt32, ppAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapters1.call(this, adapter, ppAdapter)
    end
    def is_current(this : IDXGIFactory7*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_current.call(this)
    end
    def is_windowed_stereo_enabled(this : IDXGIFactory7*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_windowed_stereo_enabled.call(this)
    end
    def create_swap_chain_for_hwnd(this : IDXGIFactory7*, pDevice : Void*, hWnd : Win32cr::Foundation::HWND, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pFullscreenDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_hwnd.call(this, pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput, ppSwapChain)
    end
    def create_swap_chain_for_core_window(this : IDXGIFactory7*, pDevice : Void*, pWindow : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_core_window.call(this, pDevice, pWindow, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_shared_resource_adapter_luid(this : IDXGIFactory7*, hResource : Win32cr::Foundation::HANDLE, pLuid : Win32cr::Foundation::LUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_resource_adapter_luid.call(this, hResource, pLuid)
    end
    def register_stereo_status_window(this : IDXGIFactory7*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_stereo_status_event(this : IDXGIFactory7*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_stereo_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_stereo_status(this : IDXGIFactory7*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_stereo_status.call(this, dwCookie)
    end
    def register_occlusion_status_window(this : IDXGIFactory7*, window_handle : Win32cr::Foundation::HWND, wMsg : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_window.call(this, window_handle, wMsg, pdwCookie)
    end
    def register_occlusion_status_event(this : IDXGIFactory7*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_occlusion_status_event.call(this, hEvent, pdwCookie)
    end
    def unregister_occlusion_status(this : IDXGIFactory7*, dwCookie : UInt32) : Void
      @lpVtbl.try &.value.unregister_occlusion_status.call(this, dwCookie)
    end
    def create_swap_chain_for_composition(this : IDXGIFactory7*, pDevice : Void*, pDesc : Win32cr::Graphics::Dxgi::DXGI_SWAP_CHAIN_DESC1*, pRestrictToOutput : Void*, ppSwapChain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_swap_chain_for_composition.call(this, pDevice, pDesc, pRestrictToOutput, ppSwapChain)
    end
    def get_creation_flags(this : IDXGIFactory7*) : UInt32
      @lpVtbl.try &.value.get_creation_flags.call(this)
    end
    def enum_adapter_by_luid(this : IDXGIFactory7*, adapter_luid : Win32cr::Foundation::LUID, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapter_by_luid.call(this, adapter_luid, riid, ppvAdapter)
    end
    def enum_warp_adapter(this : IDXGIFactory7*, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_warp_adapter.call(this, riid, ppvAdapter)
    end
    def check_feature_support(this : IDXGIFactory7*, feature : Win32cr::Graphics::Dxgi::DXGI_FEATURE, pFeatureSupportData : Void*, feature_support_data_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_feature_support.call(this, feature, pFeatureSupportData, feature_support_data_size)
    end
    def enum_adapter_by_gpu_preference(this : IDXGIFactory7*, adapter : UInt32, gpu_preference : Win32cr::Graphics::Dxgi::DXGI_GPU_PREFERENCE, riid : LibC::GUID*, ppvAdapter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_adapter_by_gpu_preference.call(this, adapter, gpu_preference, riid, ppvAdapter)
    end
    def register_adapters_changed_event(this : IDXGIFactory7*, hEvent : Win32cr::Foundation::HANDLE, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_adapters_changed_event.call(this, hEvent, pdwCookie)
    end
    def unregister_adapters_changed_event(this : IDXGIFactory7*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_adapters_changed_event.call(this, dwCookie)
    end

  end

  @[Extern]
  record IDXGIInfoQueueVtbl,
    query_interface : Proc(IDXGIInfoQueue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIInfoQueue*, UInt32),
    release : Proc(IDXGIInfoQueue*, UInt32),
    set_message_count_limit : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64, Win32cr::Foundation::HRESULT),
    clear_stored_messages : Proc(IDXGIInfoQueue*, LibC::GUID, Void),
    get_message : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_num_stored_messages_allowed_by_retrieval_filters : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64),
    get_num_stored_messages : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64),
    get_num_messages_discarded_by_message_count_limit : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64),
    get_message_count_limit : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64),
    get_num_messages_allowed_by_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64),
    get_num_messages_denied_by_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, UInt64),
    add_storage_filter_entries : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, Win32cr::Foundation::HRESULT),
    get_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    clear_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Void),
    push_empty_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::HRESULT),
    push_deny_all_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::HRESULT),
    push_copy_of_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::HRESULT),
    push_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, Win32cr::Foundation::HRESULT),
    pop_storage_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Void),
    get_storage_filter_stack_size : Proc(IDXGIInfoQueue*, LibC::GUID, UInt32),
    add_retrieval_filter_entries : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, Win32cr::Foundation::HRESULT),
    get_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    clear_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Void),
    push_empty_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::HRESULT),
    push_deny_all_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::HRESULT),
    push_copy_of_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::HRESULT),
    push_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, Win32cr::Foundation::HRESULT),
    pop_retrieval_filter : Proc(IDXGIInfoQueue*, LibC::GUID, Void),
    get_retrieval_filter_stack_size : Proc(IDXGIInfoQueue*, LibC::GUID, UInt32),
    add_message : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Int32, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    add_application_message : Proc(IDXGIInfoQueue*, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Win32cr::Foundation::PSTR, Win32cr::Foundation::HRESULT),
    set_break_on_category : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_break_on_severity : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_break_on_id : Proc(IDXGIInfoQueue*, LibC::GUID, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_break_on_category : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Win32cr::Foundation::BOOL),
    get_break_on_severity : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Win32cr::Foundation::BOOL),
    get_break_on_id : Proc(IDXGIInfoQueue*, LibC::GUID, Int32, Win32cr::Foundation::BOOL),
    set_mute_debug_output : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::BOOL, Void),
    get_mute_debug_output : Proc(IDXGIInfoQueue*, LibC::GUID, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("d67441c7-672a-476f-9e82-cd55b44949ce")]
  record IDXGIInfoQueue, lpVtbl : IDXGIInfoQueueVtbl* do
    GUID = LibC::GUID.new(0xd67441c7_u32, 0x672a_u16, 0x476f_u16, StaticArray[0x9e_u8, 0x82_u8, 0xcd_u8, 0x55_u8, 0xb4_u8, 0x49_u8, 0x49_u8, 0xce_u8])
    def query_interface(this : IDXGIInfoQueue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIInfoQueue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIInfoQueue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_message_count_limit(this : IDXGIInfoQueue*, producer : LibC::GUID, message_count_limit : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_message_count_limit.call(this, producer, message_count_limit)
    end
    def clear_stored_messages(this : IDXGIInfoQueue*, producer : LibC::GUID) : Void
      @lpVtbl.try &.value.clear_stored_messages.call(this, producer)
    end
    def get_message(this : IDXGIInfoQueue*, producer : LibC::GUID, message_index : UInt64, pMessage : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE*, pMessageByteLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message.call(this, producer, message_index, pMessage, pMessageByteLength)
    end
    def get_num_stored_messages_allowed_by_retrieval_filters(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt64
      @lpVtbl.try &.value.get_num_stored_messages_allowed_by_retrieval_filters.call(this, producer)
    end
    def get_num_stored_messages(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt64
      @lpVtbl.try &.value.get_num_stored_messages.call(this, producer)
    end
    def get_num_messages_discarded_by_message_count_limit(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt64
      @lpVtbl.try &.value.get_num_messages_discarded_by_message_count_limit.call(this, producer)
    end
    def get_message_count_limit(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt64
      @lpVtbl.try &.value.get_message_count_limit.call(this, producer)
    end
    def get_num_messages_allowed_by_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt64
      @lpVtbl.try &.value.get_num_messages_allowed_by_storage_filter.call(this, producer)
    end
    def get_num_messages_denied_by_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt64
      @lpVtbl.try &.value.get_num_messages_denied_by_storage_filter.call(this, producer)
    end
    def add_storage_filter_entries(this : IDXGIInfoQueue*, producer : LibC::GUID, pFilter : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_storage_filter_entries.call(this, producer, pFilter)
    end
    def get_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID, pFilter : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, pFilterByteLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_filter.call(this, producer, pFilter, pFilterByteLength)
    end
    def clear_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Void
      @lpVtbl.try &.value.clear_storage_filter.call(this, producer)
    end
    def push_empty_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_empty_storage_filter.call(this, producer)
    end
    def push_deny_all_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_deny_all_storage_filter.call(this, producer)
    end
    def push_copy_of_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_copy_of_storage_filter.call(this, producer)
    end
    def push_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID, pFilter : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_storage_filter.call(this, producer, pFilter)
    end
    def pop_storage_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Void
      @lpVtbl.try &.value.pop_storage_filter.call(this, producer)
    end
    def get_storage_filter_stack_size(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt32
      @lpVtbl.try &.value.get_storage_filter_stack_size.call(this, producer)
    end
    def add_retrieval_filter_entries(this : IDXGIInfoQueue*, producer : LibC::GUID, pFilter : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_retrieval_filter_entries.call(this, producer, pFilter)
    end
    def get_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID, pFilter : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*, pFilterByteLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_retrieval_filter.call(this, producer, pFilter, pFilterByteLength)
    end
    def clear_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Void
      @lpVtbl.try &.value.clear_retrieval_filter.call(this, producer)
    end
    def push_empty_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_empty_retrieval_filter.call(this, producer)
    end
    def push_deny_all_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_deny_all_retrieval_filter.call(this, producer)
    end
    def push_copy_of_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_copy_of_retrieval_filter.call(this, producer)
    end
    def push_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID, pFilter : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_FILTER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_retrieval_filter.call(this, producer, pFilter)
    end
    def pop_retrieval_filter(this : IDXGIInfoQueue*, producer : LibC::GUID) : Void
      @lpVtbl.try &.value.pop_retrieval_filter.call(this, producer)
    end
    def get_retrieval_filter_stack_size(this : IDXGIInfoQueue*, producer : LibC::GUID) : UInt32
      @lpVtbl.try &.value.get_retrieval_filter_stack_size.call(this, producer)
    end
    def add_message(this : IDXGIInfoQueue*, producer : LibC::GUID, category : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY, severity : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, id : Int32, pDescription : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_message.call(this, producer, category, severity, id, pDescription)
    end
    def add_application_message(this : IDXGIInfoQueue*, severity : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, pDescription : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_application_message.call(this, severity, pDescription)
    end
    def set_break_on_category(this : IDXGIInfoQueue*, producer : LibC::GUID, category : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_break_on_category.call(this, producer, category, bEnable)
    end
    def set_break_on_severity(this : IDXGIInfoQueue*, producer : LibC::GUID, severity : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_break_on_severity.call(this, producer, severity, bEnable)
    end
    def set_break_on_id(this : IDXGIInfoQueue*, producer : LibC::GUID, id : Int32, bEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_break_on_id.call(this, producer, id, bEnable)
    end
    def get_break_on_category(this : IDXGIInfoQueue*, producer : LibC::GUID, category : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_CATEGORY) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.get_break_on_category.call(this, producer, category)
    end
    def get_break_on_severity(this : IDXGIInfoQueue*, producer : LibC::GUID, severity : Win32cr::Graphics::Dxgi::DXGI_INFO_QUEUE_MESSAGE_SEVERITY) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.get_break_on_severity.call(this, producer, severity)
    end
    def get_break_on_id(this : IDXGIInfoQueue*, producer : LibC::GUID, id : Int32) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.get_break_on_id.call(this, producer, id)
    end
    def set_mute_debug_output(this : IDXGIInfoQueue*, producer : LibC::GUID, bMute : Win32cr::Foundation::BOOL) : Void
      @lpVtbl.try &.value.set_mute_debug_output.call(this, producer, bMute)
    end
    def get_mute_debug_output(this : IDXGIInfoQueue*, producer : LibC::GUID) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.get_mute_debug_output.call(this, producer)
    end

  end

  @[Extern]
  record IDXGIDebugVtbl,
    query_interface : Proc(IDXGIDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDebug*, UInt32),
    release : Proc(IDXGIDebug*, UInt32),
    report_live_objects : Proc(IDXGIDebug*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_DEBUG_RLO_FLAGS, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("119e7452-de9e-40fe-8806-88f90c12b441")]
  record IDXGIDebug, lpVtbl : IDXGIDebugVtbl* do
    GUID = LibC::GUID.new(0x119e7452_u32, 0xde9e_u16, 0x40fe_u16, StaticArray[0x88_u8, 0x6_u8, 0x88_u8, 0xf9_u8, 0xc_u8, 0x12_u8, 0xb4_u8, 0x41_u8])
    def query_interface(this : IDXGIDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def report_live_objects(this : IDXGIDebug*, apiid : LibC::GUID, flags : Win32cr::Graphics::Dxgi::DXGI_DEBUG_RLO_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_live_objects.call(this, apiid, flags)
    end

  end

  @[Extern]
  record IDXGIDebug1Vtbl,
    query_interface : Proc(IDXGIDebug1*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGIDebug1*, UInt32),
    release : Proc(IDXGIDebug1*, UInt32),
    report_live_objects : Proc(IDXGIDebug1*, LibC::GUID, Win32cr::Graphics::Dxgi::DXGI_DEBUG_RLO_FLAGS, Win32cr::Foundation::HRESULT),
    enable_leak_tracking_for_thread : Proc(IDXGIDebug1*, Void),
    disable_leak_tracking_for_thread : Proc(IDXGIDebug1*, Void),
    is_leak_tracking_enabled_for_thread : Proc(IDXGIDebug1*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550")]
  record IDXGIDebug1, lpVtbl : IDXGIDebug1Vtbl* do
    GUID = LibC::GUID.new(0xc5a05f0c_u32, 0x16f2_u16, 0x4adf_u16, StaticArray[0x9f_u8, 0x4d_u8, 0xa8_u8, 0xc4_u8, 0xd5_u8, 0x8a_u8, 0xc5_u8, 0x50_u8])
    def query_interface(this : IDXGIDebug1*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGIDebug1*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGIDebug1*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def report_live_objects(this : IDXGIDebug1*, apiid : LibC::GUID, flags : Win32cr::Graphics::Dxgi::DXGI_DEBUG_RLO_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_live_objects.call(this, apiid, flags)
    end
    def enable_leak_tracking_for_thread(this : IDXGIDebug1*) : Void
      @lpVtbl.try &.value.enable_leak_tracking_for_thread.call(this)
    end
    def disable_leak_tracking_for_thread(this : IDXGIDebug1*) : Void
      @lpVtbl.try &.value.disable_leak_tracking_for_thread.call(this)
    end
    def is_leak_tracking_enabled_for_thread(this : IDXGIDebug1*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_leak_tracking_enabled_for_thread.call(this)
    end

  end

  @[Extern]
  record IDXGraphicsAnalysisVtbl,
    query_interface : Proc(IDXGraphicsAnalysis*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDXGraphicsAnalysis*, UInt32),
    release : Proc(IDXGraphicsAnalysis*, UInt32),
    begin_capture : Proc(IDXGraphicsAnalysis*, Void),
    end_capture : Proc(IDXGraphicsAnalysis*, Void)


  @[Extern]
  #@[Com("9f251514-9d4d-4902-9d60-18988ab7d4b5")]
  record IDXGraphicsAnalysis, lpVtbl : IDXGraphicsAnalysisVtbl* do
    GUID = LibC::GUID.new(0x9f251514_u32, 0x9d4d_u16, 0x4902_u16, StaticArray[0x9d_u8, 0x60_u8, 0x18_u8, 0x98_u8, 0x8a_u8, 0xb7_u8, 0xd4_u8, 0xb5_u8])
    def query_interface(this : IDXGraphicsAnalysis*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDXGraphicsAnalysis*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDXGraphicsAnalysis*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_capture(this : IDXGraphicsAnalysis*) : Void
      @lpVtbl.try &.value.begin_capture.call(this)
    end
    def end_capture(this : IDXGraphicsAnalysis*) : Void
      @lpVtbl.try &.value.end_capture.call(this)
    end

  end

  @[Link("dxgi")]
  lib C
    fun CreateDXGIFactory(riid : LibC::GUID*, ppFactory : Void**) : Win32cr::Foundation::HRESULT

    fun CreateDXGIFactory1(riid : LibC::GUID*, ppFactory : Void**) : Win32cr::Foundation::HRESULT

    fun CreateDXGIFactory2(flags : UInt32, riid : LibC::GUID*, ppFactory : Void**) : Win32cr::Foundation::HRESULT

    fun DXGIGetDebugInterface1(flags : UInt32, riid : LibC::GUID*, pDebug : Void**) : Win32cr::Foundation::HRESULT

    fun DXGIDeclareAdapterRemovalSupport : Win32cr::Foundation::HRESULT

  end
end