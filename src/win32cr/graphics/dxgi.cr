require "../foundation.cr"
require "../graphics/dxgi/common.cr"
require "../graphics/gdi.cr"
require "../system/com.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dxgi.dll")]
{% else %}
@[Link("dxgi")]
{% end %}
lib LibWin32
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
    DXGI_RESOURCE_PRIORITY_MINIMUM = 671088640
    DXGI_RESOURCE_PRIORITY_LOW = 1342177280
    DXGI_RESOURCE_PRIORITY_NORMAL = 2013265920
    DXGI_RESOURCE_PRIORITY_HIGH = 2684354560
    DXGI_RESOURCE_PRIORITY_MAXIMUM = 3355443200
  end

  enum DXGI_RESIDENCY : Int32
    DXGI_RESIDENCY_FULLY_RESIDENT = 1
    DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY = 2
    DXGI_RESIDENCY_EVICTED_TO_DISK = 3
  end

  enum DXGI_SWAP_EFFECT : Int32
    DXGI_SWAP_EFFECT_DISCARD = 0
    DXGI_SWAP_EFFECT_SEQUENTIAL = 1
    DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL = 3
    DXGI_SWAP_EFFECT_FLIP_DISCARD = 4
  end

  enum DXGI_SWAP_CHAIN_FLAG : Int32
    DXGI_SWAP_CHAIN_FLAG_NONPREROTATED = 1
    DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH = 2
    DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE = 4
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT = 8
    DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER = 16
    DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY = 32
    DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT = 64
    DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER = 128
    DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO = 256
    DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO = 512
    DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED = 1024
    DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING = 2048
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS = 4096
  end

  enum DXGI_ADAPTER_FLAG : UInt32
    DXGI_ADAPTER_FLAG_NONE = 0
    DXGI_ADAPTER_FLAG_REMOTE = 1
    DXGI_ADAPTER_FLAG_SOFTWARE = 2
  end

  enum DXGI_OUTDUPL_POINTER_SHAPE_TYPE : Int32
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME = 1
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_COLOR = 2
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR = 4
  end

  enum DXGI_OFFER_RESOURCE_PRIORITY : Int32
    DXGI_OFFER_RESOURCE_PRIORITY_LOW = 1
    DXGI_OFFER_RESOURCE_PRIORITY_NORMAL = 2
    DXGI_OFFER_RESOURCE_PRIORITY_HIGH = 3
  end

  enum DXGI_SCALING : Int32
    DXGI_SCALING_STRETCH = 0
    DXGI_SCALING_NONE = 1
    DXGI_SCALING_ASPECT_RATIO_STRETCH = 2
  end

  enum DXGI_GRAPHICS_PREEMPTION_GRANULARITY : Int32
    DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY = 0
    DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY = 1
    DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY = 2
    DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY = 3
    DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY = 4
  end

  enum DXGI_COMPUTE_PREEMPTION_GRANULARITY : Int32
    DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY = 0
    DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY = 1
    DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY = 2
    DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY = 3
    DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY = 4
  end

  enum DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS : Int32
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE = 1
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709 = 2
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC = 4
  end

  enum DXGI_FRAME_PRESENTATION_MODE : Int32
    DXGI_FRAME_PRESENTATION_MODE_COMPOSED = 0
    DXGI_FRAME_PRESENTATION_MODE_OVERLAY = 1
    DXGI_FRAME_PRESENTATION_MODE_NONE = 2
    DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE = 3
  end

  enum DXGI_OVERLAY_SUPPORT_FLAG : Int32
    DXGI_OVERLAY_SUPPORT_FLAG_DIRECT = 1
    DXGI_OVERLAY_SUPPORT_FLAG_SCALING = 2
  end

  enum DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG : Int32
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 1
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_OVERLAY_PRESENT = 2
  end

  enum DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG : Int32
    DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 1
  end

  enum DXGI_MEMORY_SEGMENT_GROUP : Int32
    DXGI_MEMORY_SEGMENT_GROUP_LOCAL = 0
    DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL = 1
  end

  enum DXGI_OUTDUPL_FLAG : Int32
    DXGI_OUTDUPL_COMPOSITED_UI_CAPTURE_ONLY = 1
  end

  enum DXGI_HDR_METADATA_TYPE : Int32
    DXGI_HDR_METADATA_TYPE_NONE = 0
    DXGI_HDR_METADATA_TYPE_HDR10 = 1
    DXGI_HDR_METADATA_TYPE_HDR10PLUS = 2
  end

  enum DXGI_OFFER_RESOURCE_FLAGS : Int32
    DXGI_OFFER_RESOURCE_FLAG_ALLOW_DECOMMIT = 1
  end

  enum DXGI_RECLAIM_RESOURCE_RESULTS : Int32
    DXGI_RECLAIM_RESOURCE_RESULT_OK = 0
    DXGI_RECLAIM_RESOURCE_RESULT_DISCARDED = 1
    DXGI_RECLAIM_RESOURCE_RESULT_NOT_COMMITTED = 2
  end

  enum DXGI_FEATURE : Int32
    DXGI_FEATURE_PRESENT_ALLOW_TEARING = 0
  end

  enum DXGI_ADAPTER_FLAG3 : UInt32
    DXGI_ADAPTER_FLAG3_NONE = 0
    DXGI_ADAPTER_FLAG3_REMOTE = 1
    DXGI_ADAPTER_FLAG3_SOFTWARE = 2
    DXGI_ADAPTER_FLAG3_ACG_COMPATIBLE = 4
    DXGI_ADAPTER_FLAG3_SUPPORT_MONITORED_FENCES = 8
    DXGI_ADAPTER_FLAG3_SUPPORT_NON_MONITORED_FENCES = 16
    DXGI_ADAPTER_FLAG3_KEYED_MUTEX_CONFORMANCE = 32
    DXGI_ADAPTER_FLAG3_FORCE_DWORD = 4294967295
  end

  enum DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS : UInt32
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_FULLSCREEN = 1
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_WINDOWED = 2
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_CURSOR_STRETCHED = 4
  end

  enum DXGI_GPU_PREFERENCE : Int32
    DXGI_GPU_PREFERENCE_UNSPECIFIED = 0
    DXGI_GPU_PREFERENCE_MINIMUM_POWER = 1
    DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE = 2
  end

  enum DXGI_DEBUG_RLO_FLAGS : UInt32
    DXGI_DEBUG_RLO_SUMMARY = 1
    DXGI_DEBUG_RLO_DETAIL = 2
    DXGI_DEBUG_RLO_IGNORE_INTERNAL = 4
    DXGI_DEBUG_RLO_ALL = 7
  end

  enum DXGI_INFO_QUEUE_MESSAGE_CATEGORY : Int32
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_UNKNOWN = 0
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_MISCELLANEOUS = 1
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_INITIALIZATION = 2
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_CLEANUP = 3
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_COMPILATION = 4
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_CREATION = 5
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_SETTING = 6
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_GETTING = 7
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_RESOURCE_MANIPULATION = 8
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_EXECUTION = 9
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_SHADER = 10
  end

  enum DXGI_INFO_QUEUE_MESSAGE_SEVERITY : Int32
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_CORRUPTION = 0
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_ERROR = 1
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_WARNING = 2
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_INFO = 3
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_MESSAGE = 4
  end

  enum DXGI_Message_Id : Int32
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow = 0
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred = 1
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred = 2
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged = 3
    DXGI_MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded = 4
    DXGI_MSG_IDXGISwapChain_Creation_TooFewBuffers = 5
    DXGI_MSG_IDXGISwapChain_Creation_NoOutputWindow = 6
    DXGI_MSG_IDXGISwapChain_Destruction_OtherMethodsCalled = 7
    DXGI_MSG_IDXGISwapChain_GetDesc_pDescIsNULL = 8
    DXGI_MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL = 9
    DXGI_MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers = 10
    DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero = 11
    DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferOOB = 12
    DXGI_MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL = 13
    DXGI_MSG_IDXGISwapChain_Present_SyncIntervalOOB = 14
    DXGI_MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag = 15
    DXGI_MSG_IDXGISwapChain_Present_NoAllocatedBuffers = 16
    DXGI_MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed = 17
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB = 18
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences = 19
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag = 20
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag = 21
    DXGI_MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero = 22
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget = 23
    DXGI_MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL = 24
    DXGI_MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL = 25
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported = 26
    DXGI_MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex = 27
    DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL = 28
    DXGI_MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL = 29
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL = 30
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL = 31
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect = 32
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFlags = 33
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed = 34
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface = 35
    DXGI_MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL = 36
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags = 37
    DXGI_MSG_IDXGISurface_Map_InvalidSurface = 38
    DXGI_MSG_IDXGISurface_Map_FlagsSetToZero = 39
    DXGI_MSG_IDXGISurface_Map_DiscardAndReadFlagSet = 40
    DXGI_MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet = 41
    DXGI_MSG_IDXGISurface_Map_NoCPUAccess = 42
    DXGI_MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic = 43
    DXGI_MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic = 44
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL = 45
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight = 46
    DXGI_MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice = 47
    DXGI_MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL = 48
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice = 49
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL = 50
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed = 51
    DXGI_MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice = 52
    DXGI_MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL = 53
    DXGI_MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice = 54
    DXGI_MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice = 55
    DXGI_MSG_IDXGIOutput_GetGammaControl_NoGammaControls = 56
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary = 57
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid = 58
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice = 59
    DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported = 60
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported = 61
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported = 62
    DXGI_MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource = 63
    DXGI_MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL = 64
    DXGI_MSG_IDXGISwapChain_Creation_InvalidOutputWindow = 65
    DXGI_MSG_IDXGISwapChain_Release_SwapChainIsFullscreen = 66
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat = 67
    DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL = 68
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice = 69
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL = 70
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero = 71
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration = 72
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering = 73
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling = 74
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination = 75
    DXGI_MSG_IDXGIFactory_Creation_CalledFromDllMain = 76
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice = 77
    DXGI_MSG_IDXGISwapChain_Creation_InvalidWindowStyle = 78
    DXGI_MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics = 79
    DXGI_MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput = 80
    DXGI_MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL = 81
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows = 82
    DXGI_MSG_IDXGIFactory_Release_CalledFromDllMain = 83
    DXGI_MSG_IDXGISwapChain_Present_UnreleasedHDC = 84
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags = 85
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags = 86
    DXGI_MSG_IDXGISurface1_GetDC_pHdcIsNULL = 87
    DXGI_MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D = 88
    DXGI_MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet = 89
    DXGI_MSG_IDXGISurface1_GetDC_UnreleasedHDC = 90
    DXGI_MSG_IDXGISurface_Map_NoCPUAccess2 = 91
    DXGI_MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled = 92
    DXGI_MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions = 93
    DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported = 94
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported = 95
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported = 96
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory = 97
    DXGI_MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration = 98
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10 = 99
    DXGI_MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential = 100
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential = 101
    DXGI_MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential = 102
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential = 103
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential = 104
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation = 105
    DXGI_MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid = 106
    DXGI_MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag = 107
    DXGI_MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified = 108
    DXGI_MSG_IDXGISwapChain_Present_EmptyScrollRect = 109
    DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds = 110
    DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset = 111
    DXGI_MSG_IDXGISwapChain_Present_EmptyDirtyRect = 112
    DXGI_MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds = 113
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags = 114
    DXGI_MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined = 115
    DXGI_MSG_IDXGISwapChain_Present_UnsupportedFlags = 116
    DXGI_MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition = 117
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory = 118
    DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter = 119
    DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput = 120
    DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen = 121
    DXGI_MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain = 122
    DXGI_MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag = 123
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0 = 124
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0 = 125
    DXGI_MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0 = 126
    DXGI_MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0 = 127
    DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled = 128
    DXGI_MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound = 129
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay = 130
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential = 131
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver = 132
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity = 133
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero = 134
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported = 135
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter = 136
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7 = 137
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain = 138
    DXGI_MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain = 139
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero = 140
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly = 141
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized = 142
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported = 143
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported = 144
    DXGI_MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly = 145
    DXGI_MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly = 146
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported = 147
    DXGI_MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange = 148
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported = 149
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported = 150
    DXGI_MSG_IDXGISwapchain_Present_ScrollUnsupported = 151
    DXGI_MSG_IDXGISwapChain1_SetRotation_UnsupportedOS = 152
    DXGI_MSG_IDXGISwapChain1_GetRotation_UnsupportedOS = 153
    DXGI_MSG_IDXGISwapchain_Present_FullscreenRotation = 154
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers = 155
    DXGI_MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired = 156
    DXGI_MSG_IDXGISwapChain1_SetRotation_InvalidRotation = 157
    DXGI_MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired = 158
    DXGI_MSG_IDXGISwapChain_GetHwnd_WrongType = 159
    DXGI_MSG_IDXGISwapChain_GetCompositionSurface_WrongType = 160
    DXGI_MSG_IDXGISwapChain_GetCoreWindow_WrongType = 161
    DXGI_MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd = 162
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_CoreWindow = 163
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7 = 164
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL = 165
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps = 166
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_ModernApp = 167
    DXGI_MSG_IDXGISwapChain_ResizeTarget_ModernApp = 168
    DXGI_MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL = 169
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_ModernApp = 170
    DXGI_MSG_IDXGIOutput_TakeOwnership_ModernApp = 171
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid = 172
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle = 173
    DXGI_MSG_IDXGISurface1_GetDC_ModernApp = 174
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer = 175
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight = 176
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence = 177
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo = 178
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported = 179
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch = 180
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard = 181
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized = 182
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly = 183
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly = 184
    DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch = 185
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy = 186
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy = 187
    DXGI_MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex = 188
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling = 189
    DXGI_MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect = 190
    DXGI_MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS = 191
    DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS = 192
    DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS = 193
    DXGI_MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS = 194
    DXGI_MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS = 195
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode = 196
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource = 197
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID = 198
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS = 199
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly = 200
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly = 201
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite = 202
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared = 203
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1 = 204
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource = 205
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps = 206
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated = 207
    DXGI_MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 208
    DXGI_MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 209
    DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly = 210
    DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen = 211
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_Waitable = 212
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag = 213
    DXGI_MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable = 214
    DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable = 215
    DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL = 216
    DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable = 217
    DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds = 218
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly = 219
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter = 220
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling = 221
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode = 222
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag = 223
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull = 224
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain = 225
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite = 226
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale = 227
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull = 228
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain = 229
    DXGI_MSG_DXGIGetDebugInterface1_NULL_ppDebug = 230
    DXGI_MSG_DXGIGetDebugInterface1_InvalidFlags = 231
    DXGI_MSG_IDXGISwapChain_Present_Decode = 232
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_Decode = 233
    DXGI_MSG_IDXGISwapChain_SetSourceSize_FlipModel = 234
    DXGI_MSG_IDXGISwapChain_SetSourceSize_Decode = 235
    DXGI_MSG_IDXGISwapChain_SetSourceSize_WidthHeight = 236
    DXGI_MSG_IDXGISwapChain_GetSourceSize_NullPointers = 237
    DXGI_MSG_IDXGISwapChain_GetSourceSize_Decode = 238
    DXGI_MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags = 239
    DXGI_MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect = 240
    DXGI_MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect = 241
    DXGI_MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize = 242
    DXGI_MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer = 243
    DXGI_MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer = 244
    DXGI_MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer = 245
    DXGI_MSG_IDXGISwapChain_PresentBuffer_YUV = 246
    DXGI_MSG_IDXGISwapChain_SetSourceSize_YUV = 247
    DXGI_MSG_IDXGISwapChain_GetSourceSize_YUV = 248
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_YUV = 249
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_YUV = 250
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentation_YUV = 251
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV = 252
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV = 253
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV = 254
    DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers = 255
    DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice = 256
    DXGI_MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag = 257
    DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard = 258
    DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers = 259
    DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice = 260
    DXGI_MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers = 261
    DXGI_MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace = 262
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect = 263
    DXGI_MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported = 264
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect = 265
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported = 266
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only = 267
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_FlipModel = 268
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired = 269
    DXGI_MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag = 270
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag = 271
    DXGI_MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported = 272
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired = 273
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidDevice = 274
    DXGI_MSG_IDXGIOutput_TakeOwnership_Unsupported = 275
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidQueue = 276
    DXGI_MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue = 277
    DXGI_MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling = 278
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize = 279
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer = 280
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType = 281
    DXGI_MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid = 282
    DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero = 283
    DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag = 284
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag = 285
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly = 286
    DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature = 287
    DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize = 288
    DXGI_MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer = 289
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied = 290
    DXGI_MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied = 291
    DXGI_MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired = 292
    DXGI_MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound = 293
    DXGI_MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect = 294
    DXGI_MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged = 295
    DXGI_MSG_IDXGISwapChain_Present_11On12_Released_Resource = 296
    DXGI_MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr = 297
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior = 298
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow = 1000
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount = 1001
    DXGI_MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable = 1002
    DXGI_MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable = 1003
    DXGI_MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable = 1004
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex = 1005
    DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex = 1006
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag = 1007
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidRotation = 1008
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidBlend = 1009
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidResource = 1010
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource = 1011
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary = 1012
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay = 1013
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex = 1014
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect = 1015
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect = 1016
    DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleResource = 1017
    DXGI_MSG_Phone_IDXGISwapChain_Present_NotSharedResource = 1018
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidFlag = 1019
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidInterval = 1020
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported = 1021
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp = 1022
    DXGI_MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp = 1023
    DXGI_MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1 = 1024
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor = 1025
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering = 1026
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount = 1027
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only = 1028
    DXGI_MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays = 1029
    DXGI_MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired = 1030
    DXGI_MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired = 1031
  end

  struct DXGI_RGBA
    r : Float32
    g : Float32
    b : Float32
    a : Float32
  end
  struct DXGI_FRAME_STATISTICS
    present_count : UInt32
    present_refresh_count : UInt32
    sync_refresh_count : UInt32
    sync_qpc_time : LARGE_INTEGER
    sync_gpu_time : LARGE_INTEGER
  end
  struct DXGI_MAPPED_RECT
    pitch : Int32
    p_bits : UInt8*
  end
  struct DXGI_ADAPTER_DESC
    description : Char[128]*
    vendor_id : UInt32
    device_id : UInt32
    sub_sys_id : UInt32
    revision : UInt32
    dedicated_video_memory : LibC::UINT_PTR
    dedicated_system_memory : LibC::UINT_PTR
    shared_system_memory : LibC::UINT_PTR
    adapter_luid : LUID
  end
  struct DXGI_OUTPUT_DESC
    device_name : Char[32]*
    desktop_coordinates : RECT
    attached_to_desktop : LibC::BOOL
    rotation : DXGI_MODE_ROTATION
    monitor : HMONITOR
  end
  struct DXGI_SHARED_RESOURCE
    handle : LibC::HANDLE
  end
  struct DXGI_SURFACE_DESC
    width : UInt32
    height : UInt32
    format : DXGI_FORMAT
    sample_desc : DXGI_SAMPLE_DESC
  end
  struct DXGI_SWAP_CHAIN_DESC
    buffer_desc : DXGI_MODE_DESC
    sample_desc : DXGI_SAMPLE_DESC
    buffer_usage : UInt32
    buffer_count : UInt32
    output_window : HANDLE
    windowed : LibC::BOOL
    swap_effect : DXGI_SWAP_EFFECT
    flags : UInt32
  end
  struct DXGI_ADAPTER_DESC1
    description : Char[128]*
    vendor_id : UInt32
    device_id : UInt32
    sub_sys_id : UInt32
    revision : UInt32
    dedicated_video_memory : LibC::UINT_PTR
    dedicated_system_memory : LibC::UINT_PTR
    shared_system_memory : LibC::UINT_PTR
    adapter_luid : LUID
    flags : UInt32
  end
  struct DXGI_DISPLAY_COLOR_SPACE
    primary_coordinates : Float32[16]*
    white_points : Float32[32]*
  end
  struct DXGI_OUTDUPL_MOVE_RECT
    source_point : POINT
    destination_rect : RECT
  end
  struct DXGI_OUTDUPL_DESC
    mode_desc : DXGI_MODE_DESC
    rotation : DXGI_MODE_ROTATION
    desktop_image_in_system_memory : LibC::BOOL
  end
  struct DXGI_OUTDUPL_POINTER_POSITION
    position : POINT
    visible : LibC::BOOL
  end
  struct DXGI_OUTDUPL_POINTER_SHAPE_INFO
    type : UInt32
    width : UInt32
    height : UInt32
    pitch : UInt32
    hot_spot : POINT
  end
  struct DXGI_OUTDUPL_FRAME_INFO
    last_present_time : LARGE_INTEGER
    last_mouse_update_time : LARGE_INTEGER
    accumulated_frames : UInt32
    rects_coalesced : LibC::BOOL
    protected_content_masked_out : LibC::BOOL
    pointer_position : DXGI_OUTDUPL_POINTER_POSITION
    total_metadata_buffer_size : UInt32
    pointer_shape_buffer_size : UInt32
  end
  struct DXGI_MODE_DESC1
    width : UInt32
    height : UInt32
    refresh_rate : DXGI_RATIONAL
    format : DXGI_FORMAT
    scanline_ordering : DXGI_MODE_SCANLINE_ORDER
    scaling : DXGI_MODE_SCALING
    stereo : LibC::BOOL
  end
  struct DXGI_SWAP_CHAIN_DESC1
    width : UInt32
    height : UInt32
    format : DXGI_FORMAT
    stereo : LibC::BOOL
    sample_desc : DXGI_SAMPLE_DESC
    buffer_usage : UInt32
    buffer_count : UInt32
    scaling : DXGI_SCALING
    swap_effect : DXGI_SWAP_EFFECT
    alpha_mode : DXGI_ALPHA_MODE
    flags : UInt32
  end
  struct DXGI_SWAP_CHAIN_FULLSCREEN_DESC
    refresh_rate : DXGI_RATIONAL
    scanline_ordering : DXGI_MODE_SCANLINE_ORDER
    scaling : DXGI_MODE_SCALING
    windowed : LibC::BOOL
  end
  struct DXGI_PRESENT_PARAMETERS
    dirty_rects_count : UInt32
    p_dirty_rects : RECT*
    p_scroll_rect : RECT*
    p_scroll_offset : POINT*
  end
  struct DXGI_ADAPTER_DESC2
    description : Char[128]*
    vendor_id : UInt32
    device_id : UInt32
    sub_sys_id : UInt32
    revision : UInt32
    dedicated_video_memory : LibC::UINT_PTR
    dedicated_system_memory : LibC::UINT_PTR
    shared_system_memory : LibC::UINT_PTR
    adapter_luid : LUID
    flags : UInt32
    graphics_preemption_granularity : DXGI_GRAPHICS_PREEMPTION_GRANULARITY
    compute_preemption_granularity : DXGI_COMPUTE_PREEMPTION_GRANULARITY
  end
  struct DXGI_MATRIX_3X2_F
    _11 : Float32
    _12 : Float32
    _21 : Float32
    _22 : Float32
    _31 : Float32
    _32 : Float32
  end
  struct DXGI_DECODE_SWAP_CHAIN_DESC
    flags : UInt32
  end
  struct DXGI_FRAME_STATISTICS_MEDIA
    present_count : UInt32
    present_refresh_count : UInt32
    sync_refresh_count : UInt32
    sync_qpc_time : LARGE_INTEGER
    sync_gpu_time : LARGE_INTEGER
    composition_mode : DXGI_FRAME_PRESENTATION_MODE
    approved_present_duration : UInt32
  end
  struct DXGI_QUERY_VIDEO_MEMORY_INFO
    budget : UInt64
    current_usage : UInt64
    available_for_reservation : UInt64
    current_reservation : UInt64
  end
  struct DXGI_HDR_METADATA_HDR10
    red_primary : UInt16[2]*
    green_primary : UInt16[2]*
    blue_primary : UInt16[2]*
    white_point : UInt16[2]*
    max_mastering_luminance : UInt32
    min_mastering_luminance : UInt32
    max_content_light_level : UInt16
    max_frame_average_light_level : UInt16
  end
  struct DXGI_HDR_METADATA_HDR10PLUS
    data : UInt8[72]*
  end
  struct DXGI_ADAPTER_DESC3
    description : Char[128]*
    vendor_id : UInt32
    device_id : UInt32
    sub_sys_id : UInt32
    revision : UInt32
    dedicated_video_memory : LibC::UINT_PTR
    dedicated_system_memory : LibC::UINT_PTR
    shared_system_memory : LibC::UINT_PTR
    adapter_luid : LUID
    flags : DXGI_ADAPTER_FLAG3
    graphics_preemption_granularity : DXGI_GRAPHICS_PREEMPTION_GRANULARITY
    compute_preemption_granularity : DXGI_COMPUTE_PREEMPTION_GRANULARITY
  end
  struct DXGI_OUTPUT_DESC1
    device_name : Char[32]*
    desktop_coordinates : RECT
    attached_to_desktop : LibC::BOOL
    rotation : DXGI_MODE_ROTATION
    monitor : HMONITOR
    bits_per_color : UInt32
    color_space : DXGI_COLOR_SPACE_TYPE
    red_primary : Float32[2]*
    green_primary : Float32[2]*
    blue_primary : Float32[2]*
    white_point : Float32[2]*
    min_luminance : Float32
    max_luminance : Float32
    max_full_frame_luminance : Float32
  end
  struct DXGI_INFO_QUEUE_MESSAGE
    producer : Guid
    category : DXGI_INFO_QUEUE_MESSAGE_CATEGORY
    severity : DXGI_INFO_QUEUE_MESSAGE_SEVERITY
    id : Int32
    p_description : UInt8*
    description_byte_length : LibC::UINT_PTR
  end
  struct DXGI_INFO_QUEUE_FILTER_DESC
    num_categories : UInt32
    p_category_list : DXGI_INFO_QUEUE_MESSAGE_CATEGORY*
    num_severities : UInt32
    p_severity_list : DXGI_INFO_QUEUE_MESSAGE_SEVERITY*
    num_i_ds : UInt32
    p_id_list : Int32*
  end
  struct DXGI_INFO_QUEUE_FILTER
    allow_list : DXGI_INFO_QUEUE_FILTER_DESC
    deny_list : DXGI_INFO_QUEUE_FILTER_DESC
  end


  struct IDXGIObjectVTbl
    query_interface : Proc(IDXGIObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIObject*, UInt32)
    release : Proc(IDXGIObject*, UInt32)
    set_private_data : Proc(IDXGIObject*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIObject*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIObject*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIObject*, Guid*, Void**, HRESULT)
  end

  IDXGIObject_GUID = "aec22fb8-76f3-4639-9be0-28eb43a67a2e"
  IID_IDXGIObject = LibC::GUID.new(0xaec22fb8_u32, 0x76f3_u16, 0x4639_u16, StaticArray[0x9b_u8, 0xe0_u8, 0x28_u8, 0xeb_u8, 0x43_u8, 0xa6_u8, 0x7a_u8, 0x2e_u8])
  struct IDXGIObject
    lpVtbl : IDXGIObjectVTbl*
  end

  struct IDXGIDeviceSubObjectVTbl
    query_interface : Proc(IDXGIDeviceSubObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDeviceSubObject*, UInt32)
    release : Proc(IDXGIDeviceSubObject*, UInt32)
    set_private_data : Proc(IDXGIDeviceSubObject*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIDeviceSubObject*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIDeviceSubObject*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIDeviceSubObject*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGIDeviceSubObject*, Guid*, Void**, HRESULT)
  end

  IDXGIDeviceSubObject_GUID = "3d3e0379-f9de-4d58-bb6c-18d62992f1a6"
  IID_IDXGIDeviceSubObject = LibC::GUID.new(0x3d3e0379_u32, 0xf9de_u16, 0x4d58_u16, StaticArray[0xbb_u8, 0x6c_u8, 0x18_u8, 0xd6_u8, 0x29_u8, 0x92_u8, 0xf1_u8, 0xa6_u8])
  struct IDXGIDeviceSubObject
    lpVtbl : IDXGIDeviceSubObjectVTbl*
  end

  struct IDXGIResourceVTbl
    query_interface : Proc(IDXGIResource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIResource*, UInt32)
    release : Proc(IDXGIResource*, UInt32)
    set_private_data : Proc(IDXGIResource*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIResource*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIResource*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIResource*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGIResource*, Guid*, Void**, HRESULT)
    get_shared_handle : Proc(IDXGIResource*, LibC::HANDLE*, HRESULT)
    get_usage : Proc(IDXGIResource*, UInt32*, HRESULT)
    set_eviction_priority : Proc(IDXGIResource*, DXGI_RESOURCE_PRIORITY, HRESULT)
    get_eviction_priority : Proc(IDXGIResource*, UInt32*, HRESULT)
  end

  IDXGIResource_GUID = "035f3ab4-482e-4e50-b41f-8a7f8bd8960b"
  IID_IDXGIResource = LibC::GUID.new(0x35f3ab4_u32, 0x482e_u16, 0x4e50_u16, StaticArray[0xb4_u8, 0x1f_u8, 0x8a_u8, 0x7f_u8, 0x8b_u8, 0xd8_u8, 0x96_u8, 0xb_u8])
  struct IDXGIResource
    lpVtbl : IDXGIResourceVTbl*
  end

  struct IDXGIKeyedMutexVTbl
    query_interface : Proc(IDXGIKeyedMutex*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIKeyedMutex*, UInt32)
    release : Proc(IDXGIKeyedMutex*, UInt32)
    set_private_data : Proc(IDXGIKeyedMutex*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIKeyedMutex*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIKeyedMutex*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIKeyedMutex*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGIKeyedMutex*, Guid*, Void**, HRESULT)
    acquire_sync : Proc(IDXGIKeyedMutex*, UInt64, UInt32, HRESULT)
    release_sync : Proc(IDXGIKeyedMutex*, UInt64, HRESULT)
  end

  IDXGIKeyedMutex_GUID = "9d8e1289-d7b3-465f-8126-250e349af85d"
  IID_IDXGIKeyedMutex = LibC::GUID.new(0x9d8e1289_u32, 0xd7b3_u16, 0x465f_u16, StaticArray[0x81_u8, 0x26_u8, 0x25_u8, 0xe_u8, 0x34_u8, 0x9a_u8, 0xf8_u8, 0x5d_u8])
  struct IDXGIKeyedMutex
    lpVtbl : IDXGIKeyedMutexVTbl*
  end

  struct IDXGISurfaceVTbl
    query_interface : Proc(IDXGISurface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISurface*, UInt32)
    release : Proc(IDXGISurface*, UInt32)
    set_private_data : Proc(IDXGISurface*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISurface*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISurface*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISurface*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISurface*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGISurface*, DXGI_SURFACE_DESC*, HRESULT)
    map : Proc(IDXGISurface*, DXGI_MAPPED_RECT*, UInt32, HRESULT)
    unmap : Proc(IDXGISurface*, HRESULT)
  end

  IDXGISurface_GUID = "cafcb56c-6ac3-4889-bf47-9e23bbd260ec"
  IID_IDXGISurface = LibC::GUID.new(0xcafcb56c_u32, 0x6ac3_u16, 0x4889_u16, StaticArray[0xbf_u8, 0x47_u8, 0x9e_u8, 0x23_u8, 0xbb_u8, 0xd2_u8, 0x60_u8, 0xec_u8])
  struct IDXGISurface
    lpVtbl : IDXGISurfaceVTbl*
  end

  struct IDXGISurface1VTbl
    query_interface : Proc(IDXGISurface1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISurface1*, UInt32)
    release : Proc(IDXGISurface1*, UInt32)
    set_private_data : Proc(IDXGISurface1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISurface1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISurface1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISurface1*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISurface1*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGISurface1*, DXGI_SURFACE_DESC*, HRESULT)
    map : Proc(IDXGISurface1*, DXGI_MAPPED_RECT*, UInt32, HRESULT)
    unmap : Proc(IDXGISurface1*, HRESULT)
    get_dc : Proc(IDXGISurface1*, LibC::BOOL, HDC*, HRESULT)
    release_dc : Proc(IDXGISurface1*, RECT*, HRESULT)
  end

  IDXGISurface1_GUID = "4ae63092-6327-4c1b-80ae-bfe12ea32b86"
  IID_IDXGISurface1 = LibC::GUID.new(0x4ae63092_u32, 0x6327_u16, 0x4c1b_u16, StaticArray[0x80_u8, 0xae_u8, 0xbf_u8, 0xe1_u8, 0x2e_u8, 0xa3_u8, 0x2b_u8, 0x86_u8])
  struct IDXGISurface1
    lpVtbl : IDXGISurface1VTbl*
  end

  struct IDXGIAdapterVTbl
    query_interface : Proc(IDXGIAdapter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIAdapter*, UInt32)
    release : Proc(IDXGIAdapter*, UInt32)
    set_private_data : Proc(IDXGIAdapter*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIAdapter*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIAdapter*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIAdapter*, Guid*, Void**, HRESULT)
    enum_outputs : Proc(IDXGIAdapter*, UInt32, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGIAdapter*, DXGI_ADAPTER_DESC*, HRESULT)
    check_interface_support : Proc(IDXGIAdapter*, Guid*, LARGE_INTEGER*, HRESULT)
  end

  IDXGIAdapter_GUID = "2411e7e1-12ac-4ccf-bd14-9798e8534dc0"
  IID_IDXGIAdapter = LibC::GUID.new(0x2411e7e1_u32, 0x12ac_u16, 0x4ccf_u16, StaticArray[0xbd_u8, 0x14_u8, 0x97_u8, 0x98_u8, 0xe8_u8, 0x53_u8, 0x4d_u8, 0xc0_u8])
  struct IDXGIAdapter
    lpVtbl : IDXGIAdapterVTbl*
  end

  struct IDXGIOutputVTbl
    query_interface : Proc(IDXGIOutput*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput*, UInt32)
    release : Proc(IDXGIOutput*, UInt32)
    set_private_data : Proc(IDXGIOutput*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput*, HRESULT)
    take_ownership : Proc(IDXGIOutput*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput*, DXGI_FRAME_STATISTICS*, HRESULT)
  end

  IDXGIOutput_GUID = "ae02eedb-c735-4690-8d52-5a8dc20213aa"
  IID_IDXGIOutput = LibC::GUID.new(0xae02eedb_u32, 0xc735_u16, 0x4690_u16, StaticArray[0x8d_u8, 0x52_u8, 0x5a_u8, 0x8d_u8, 0xc2_u8, 0x2_u8, 0x13_u8, 0xaa_u8])
  struct IDXGIOutput
    lpVtbl : IDXGIOutputVTbl*
  end

  struct IDXGISwapChainVTbl
    query_interface : Proc(IDXGISwapChain*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISwapChain*, UInt32)
    release : Proc(IDXGISwapChain*, UInt32)
    set_private_data : Proc(IDXGISwapChain*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISwapChain*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISwapChain*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISwapChain*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISwapChain*, Guid*, Void**, HRESULT)
    present : Proc(IDXGISwapChain*, UInt32, UInt32, HRESULT)
    get_buffer : Proc(IDXGISwapChain*, UInt32, Guid*, Void**, HRESULT)
    set_fullscreen_state : Proc(IDXGISwapChain*, LibC::BOOL, IDXGIOutput, HRESULT)
    get_fullscreen_state : Proc(IDXGISwapChain*, LibC::BOOL*, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGISwapChain*, DXGI_SWAP_CHAIN_DESC*, HRESULT)
    resize_buffers : Proc(IDXGISwapChain*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, HRESULT)
    resize_target : Proc(IDXGISwapChain*, DXGI_MODE_DESC*, HRESULT)
    get_containing_output : Proc(IDXGISwapChain*, IDXGIOutput*, HRESULT)
    get_frame_statistics : Proc(IDXGISwapChain*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_last_present_count : Proc(IDXGISwapChain*, UInt32*, HRESULT)
  end

  IDXGISwapChain_GUID = "310d36a0-d2e7-4c0a-aa04-6a9d23b8886a"
  IID_IDXGISwapChain = LibC::GUID.new(0x310d36a0_u32, 0xd2e7_u16, 0x4c0a_u16, StaticArray[0xaa_u8, 0x4_u8, 0x6a_u8, 0x9d_u8, 0x23_u8, 0xb8_u8, 0x88_u8, 0x6a_u8])
  struct IDXGISwapChain
    lpVtbl : IDXGISwapChainVTbl*
  end

  struct IDXGIFactoryVTbl
    query_interface : Proc(IDXGIFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory*, UInt32)
    release : Proc(IDXGIFactory*, UInt32)
    set_private_data : Proc(IDXGIFactory*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory*, HINSTANCE, IDXGIAdapter*, HRESULT)
  end

  IDXGIFactory_GUID = "7b7166ec-21c7-44ae-b21a-c9ae321ae369"
  IID_IDXGIFactory = LibC::GUID.new(0x7b7166ec_u32, 0x21c7_u16, 0x44ae_u16, StaticArray[0xb2_u8, 0x1a_u8, 0xc9_u8, 0xae_u8, 0x32_u8, 0x1a_u8, 0xe3_u8, 0x69_u8])
  struct IDXGIFactory
    lpVtbl : IDXGIFactoryVTbl*
  end

  struct IDXGIDeviceVTbl
    query_interface : Proc(IDXGIDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDevice*, UInt32)
    release : Proc(IDXGIDevice*, UInt32)
    set_private_data : Proc(IDXGIDevice*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIDevice*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIDevice*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIDevice*, Guid*, Void**, HRESULT)
    get_adapter : Proc(IDXGIDevice*, IDXGIAdapter*, HRESULT)
    create_surface : Proc(IDXGIDevice*, DXGI_SURFACE_DESC*, UInt32, UInt32, DXGI_SHARED_RESOURCE*, IDXGISurface*, HRESULT)
    query_resource_residency : Proc(IDXGIDevice*, IUnknown*, DXGI_RESIDENCY*, UInt32, HRESULT)
    set_gpu_thread_priority : Proc(IDXGIDevice*, Int32, HRESULT)
    get_gpu_thread_priority : Proc(IDXGIDevice*, Int32*, HRESULT)
  end

  IDXGIDevice_GUID = "54ec77fa-1377-44e6-8c32-88fd5f44c84c"
  IID_IDXGIDevice = LibC::GUID.new(0x54ec77fa_u32, 0x1377_u16, 0x44e6_u16, StaticArray[0x8c_u8, 0x32_u8, 0x88_u8, 0xfd_u8, 0x5f_u8, 0x44_u8, 0xc8_u8, 0x4c_u8])
  struct IDXGIDevice
    lpVtbl : IDXGIDeviceVTbl*
  end

  struct IDXGIFactory1VTbl
    query_interface : Proc(IDXGIFactory1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory1*, UInt32)
    release : Proc(IDXGIFactory1*, UInt32)
    set_private_data : Proc(IDXGIFactory1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory1*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory1*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory1*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory1*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory1*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory1*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory1*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory1*, LibC::BOOL)
  end

  IDXGIFactory1_GUID = "770aae78-f26f-4dba-a829-253c83d1b387"
  IID_IDXGIFactory1 = LibC::GUID.new(0x770aae78_u32, 0xf26f_u16, 0x4dba_u16, StaticArray[0xa8_u8, 0x29_u8, 0x25_u8, 0x3c_u8, 0x83_u8, 0xd1_u8, 0xb3_u8, 0x87_u8])
  struct IDXGIFactory1
    lpVtbl : IDXGIFactory1VTbl*
  end

  struct IDXGIAdapter1VTbl
    query_interface : Proc(IDXGIAdapter1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIAdapter1*, UInt32)
    release : Proc(IDXGIAdapter1*, UInt32)
    set_private_data : Proc(IDXGIAdapter1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIAdapter1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIAdapter1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIAdapter1*, Guid*, Void**, HRESULT)
    enum_outputs : Proc(IDXGIAdapter1*, UInt32, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGIAdapter1*, DXGI_ADAPTER_DESC*, HRESULT)
    check_interface_support : Proc(IDXGIAdapter1*, Guid*, LARGE_INTEGER*, HRESULT)
    get_desc1 : Proc(IDXGIAdapter1*, DXGI_ADAPTER_DESC1*, HRESULT)
  end

  IDXGIAdapter1_GUID = "29038f61-3839-4626-91fd-086879011a05"
  IID_IDXGIAdapter1 = LibC::GUID.new(0x29038f61_u32, 0x3839_u16, 0x4626_u16, StaticArray[0x91_u8, 0xfd_u8, 0x8_u8, 0x68_u8, 0x79_u8, 0x1_u8, 0x1a_u8, 0x5_u8])
  struct IDXGIAdapter1
    lpVtbl : IDXGIAdapter1VTbl*
  end

  struct IDXGIDevice1VTbl
    query_interface : Proc(IDXGIDevice1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDevice1*, UInt32)
    release : Proc(IDXGIDevice1*, UInt32)
    set_private_data : Proc(IDXGIDevice1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIDevice1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIDevice1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIDevice1*, Guid*, Void**, HRESULT)
    get_adapter : Proc(IDXGIDevice1*, IDXGIAdapter*, HRESULT)
    create_surface : Proc(IDXGIDevice1*, DXGI_SURFACE_DESC*, UInt32, UInt32, DXGI_SHARED_RESOURCE*, IDXGISurface*, HRESULT)
    query_resource_residency : Proc(IDXGIDevice1*, IUnknown*, DXGI_RESIDENCY*, UInt32, HRESULT)
    set_gpu_thread_priority : Proc(IDXGIDevice1*, Int32, HRESULT)
    get_gpu_thread_priority : Proc(IDXGIDevice1*, Int32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGIDevice1*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGIDevice1*, UInt32*, HRESULT)
  end

  IDXGIDevice1_GUID = "77db970f-6276-48ba-ba28-070143b4392c"
  IID_IDXGIDevice1 = LibC::GUID.new(0x77db970f_u32, 0x6276_u16, 0x48ba_u16, StaticArray[0xba_u8, 0x28_u8, 0x7_u8, 0x1_u8, 0x43_u8, 0xb4_u8, 0x39_u8, 0x2c_u8])
  struct IDXGIDevice1
    lpVtbl : IDXGIDevice1VTbl*
  end

  struct IDXGIDisplayControlVTbl
    query_interface : Proc(IDXGIDisplayControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDisplayControl*, UInt32)
    release : Proc(IDXGIDisplayControl*, UInt32)
    is_stereo_enabled : Proc(IDXGIDisplayControl*, LibC::BOOL)
    set_stereo_enabled : Proc(IDXGIDisplayControl*, LibC::BOOL, Void)
  end

  IDXGIDisplayControl_GUID = "ea9dbf1a-c88e-4486-854a-98aa0138f30c"
  IID_IDXGIDisplayControl = LibC::GUID.new(0xea9dbf1a_u32, 0xc88e_u16, 0x4486_u16, StaticArray[0x85_u8, 0x4a_u8, 0x98_u8, 0xaa_u8, 0x1_u8, 0x38_u8, 0xf3_u8, 0xc_u8])
  struct IDXGIDisplayControl
    lpVtbl : IDXGIDisplayControlVTbl*
  end

  struct IDXGIOutputDuplicationVTbl
    query_interface : Proc(IDXGIOutputDuplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutputDuplication*, UInt32)
    release : Proc(IDXGIOutputDuplication*, UInt32)
    set_private_data : Proc(IDXGIOutputDuplication*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutputDuplication*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutputDuplication*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutputDuplication*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutputDuplication*, DXGI_OUTDUPL_DESC*, Void)
    acquire_next_frame : Proc(IDXGIOutputDuplication*, UInt32, DXGI_OUTDUPL_FRAME_INFO*, IDXGIResource*, HRESULT)
    get_frame_dirty_rects : Proc(IDXGIOutputDuplication*, UInt32, RECT*, UInt32*, HRESULT)
    get_frame_move_rects : Proc(IDXGIOutputDuplication*, UInt32, DXGI_OUTDUPL_MOVE_RECT*, UInt32*, HRESULT)
    get_frame_pointer_shape : Proc(IDXGIOutputDuplication*, UInt32, Void*, UInt32*, DXGI_OUTDUPL_POINTER_SHAPE_INFO*, HRESULT)
    map_desktop_surface : Proc(IDXGIOutputDuplication*, DXGI_MAPPED_RECT*, HRESULT)
    un_map_desktop_surface : Proc(IDXGIOutputDuplication*, HRESULT)
    release_frame : Proc(IDXGIOutputDuplication*, HRESULT)
  end

  IDXGIOutputDuplication_GUID = "191cfac3-a341-470d-b26e-a864f428319c"
  IID_IDXGIOutputDuplication = LibC::GUID.new(0x191cfac3_u32, 0xa341_u16, 0x470d_u16, StaticArray[0xb2_u8, 0x6e_u8, 0xa8_u8, 0x64_u8, 0xf4_u8, 0x28_u8, 0x31_u8, 0x9c_u8])
  struct IDXGIOutputDuplication
    lpVtbl : IDXGIOutputDuplicationVTbl*
  end

  struct IDXGISurface2VTbl
    query_interface : Proc(IDXGISurface2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISurface2*, UInt32)
    release : Proc(IDXGISurface2*, UInt32)
    set_private_data : Proc(IDXGISurface2*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISurface2*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISurface2*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISurface2*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISurface2*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGISurface2*, DXGI_SURFACE_DESC*, HRESULT)
    map : Proc(IDXGISurface2*, DXGI_MAPPED_RECT*, UInt32, HRESULT)
    unmap : Proc(IDXGISurface2*, HRESULT)
    get_dc : Proc(IDXGISurface2*, LibC::BOOL, HDC*, HRESULT)
    release_dc : Proc(IDXGISurface2*, RECT*, HRESULT)
    get_resource : Proc(IDXGISurface2*, Guid*, Void**, UInt32*, HRESULT)
  end

  IDXGISurface2_GUID = "aba496dd-b617-4cb8-a866-bc44d7eb1fa2"
  IID_IDXGISurface2 = LibC::GUID.new(0xaba496dd_u32, 0xb617_u16, 0x4cb8_u16, StaticArray[0xa8_u8, 0x66_u8, 0xbc_u8, 0x44_u8, 0xd7_u8, 0xeb_u8, 0x1f_u8, 0xa2_u8])
  struct IDXGISurface2
    lpVtbl : IDXGISurface2VTbl*
  end

  struct IDXGIResource1VTbl
    query_interface : Proc(IDXGIResource1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIResource1*, UInt32)
    release : Proc(IDXGIResource1*, UInt32)
    set_private_data : Proc(IDXGIResource1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIResource1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIResource1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIResource1*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGIResource1*, Guid*, Void**, HRESULT)
    get_shared_handle : Proc(IDXGIResource1*, LibC::HANDLE*, HRESULT)
    get_usage : Proc(IDXGIResource1*, UInt32*, HRESULT)
    set_eviction_priority : Proc(IDXGIResource1*, DXGI_RESOURCE_PRIORITY, HRESULT)
    get_eviction_priority : Proc(IDXGIResource1*, UInt32*, HRESULT)
    create_subresource_surface : Proc(IDXGIResource1*, UInt32, IDXGISurface2*, HRESULT)
    create_shared_handle : Proc(IDXGIResource1*, SECURITY_ATTRIBUTES*, UInt32, LibC::LPWSTR, LibC::HANDLE*, HRESULT)
  end

  IDXGIResource1_GUID = "30961379-4609-4a41-998e-54fe567ee0c1"
  IID_IDXGIResource1 = LibC::GUID.new(0x30961379_u32, 0x4609_u16, 0x4a41_u16, StaticArray[0x99_u8, 0x8e_u8, 0x54_u8, 0xfe_u8, 0x56_u8, 0x7e_u8, 0xe0_u8, 0xc1_u8])
  struct IDXGIResource1
    lpVtbl : IDXGIResource1VTbl*
  end

  struct IDXGIDevice2VTbl
    query_interface : Proc(IDXGIDevice2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDevice2*, UInt32)
    release : Proc(IDXGIDevice2*, UInt32)
    set_private_data : Proc(IDXGIDevice2*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIDevice2*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIDevice2*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIDevice2*, Guid*, Void**, HRESULT)
    get_adapter : Proc(IDXGIDevice2*, IDXGIAdapter*, HRESULT)
    create_surface : Proc(IDXGIDevice2*, DXGI_SURFACE_DESC*, UInt32, UInt32, DXGI_SHARED_RESOURCE*, IDXGISurface*, HRESULT)
    query_resource_residency : Proc(IDXGIDevice2*, IUnknown*, DXGI_RESIDENCY*, UInt32, HRESULT)
    set_gpu_thread_priority : Proc(IDXGIDevice2*, Int32, HRESULT)
    get_gpu_thread_priority : Proc(IDXGIDevice2*, Int32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGIDevice2*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGIDevice2*, UInt32*, HRESULT)
    offer_resources : Proc(IDXGIDevice2*, UInt32, IDXGIResource*, DXGI_OFFER_RESOURCE_PRIORITY, HRESULT)
    reclaim_resources : Proc(IDXGIDevice2*, UInt32, IDXGIResource*, LibC::BOOL*, HRESULT)
    enqueue_set_event : Proc(IDXGIDevice2*, LibC::HANDLE, HRESULT)
  end

  IDXGIDevice2_GUID = "05008617-fbfd-4051-a790-144884b4f6a9"
  IID_IDXGIDevice2 = LibC::GUID.new(0x5008617_u32, 0xfbfd_u16, 0x4051_u16, StaticArray[0xa7_u8, 0x90_u8, 0x14_u8, 0x48_u8, 0x84_u8, 0xb4_u8, 0xf6_u8, 0xa9_u8])
  struct IDXGIDevice2
    lpVtbl : IDXGIDevice2VTbl*
  end

  struct IDXGISwapChain1VTbl
    query_interface : Proc(IDXGISwapChain1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISwapChain1*, UInt32)
    release : Proc(IDXGISwapChain1*, UInt32)
    set_private_data : Proc(IDXGISwapChain1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISwapChain1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISwapChain1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISwapChain1*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISwapChain1*, Guid*, Void**, HRESULT)
    present : Proc(IDXGISwapChain1*, UInt32, UInt32, HRESULT)
    get_buffer : Proc(IDXGISwapChain1*, UInt32, Guid*, Void**, HRESULT)
    set_fullscreen_state : Proc(IDXGISwapChain1*, LibC::BOOL, IDXGIOutput, HRESULT)
    get_fullscreen_state : Proc(IDXGISwapChain1*, LibC::BOOL*, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGISwapChain1*, DXGI_SWAP_CHAIN_DESC*, HRESULT)
    resize_buffers : Proc(IDXGISwapChain1*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, HRESULT)
    resize_target : Proc(IDXGISwapChain1*, DXGI_MODE_DESC*, HRESULT)
    get_containing_output : Proc(IDXGISwapChain1*, IDXGIOutput*, HRESULT)
    get_frame_statistics : Proc(IDXGISwapChain1*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_last_present_count : Proc(IDXGISwapChain1*, UInt32*, HRESULT)
    get_desc1 : Proc(IDXGISwapChain1*, DXGI_SWAP_CHAIN_DESC1*, HRESULT)
    get_fullscreen_desc : Proc(IDXGISwapChain1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, HRESULT)
    get_hwnd : Proc(IDXGISwapChain1*, HANDLE*, HRESULT)
    get_core_window : Proc(IDXGISwapChain1*, Guid*, Void**, HRESULT)
    present1 : Proc(IDXGISwapChain1*, UInt32, UInt32, DXGI_PRESENT_PARAMETERS*, HRESULT)
    is_temporary_mono_supported : Proc(IDXGISwapChain1*, LibC::BOOL)
    get_restrict_to_output : Proc(IDXGISwapChain1*, IDXGIOutput*, HRESULT)
    set_background_color : Proc(IDXGISwapChain1*, DXGI_RGBA*, HRESULT)
    get_background_color : Proc(IDXGISwapChain1*, DXGI_RGBA*, HRESULT)
    set_rotation : Proc(IDXGISwapChain1*, DXGI_MODE_ROTATION, HRESULT)
    get_rotation : Proc(IDXGISwapChain1*, DXGI_MODE_ROTATION*, HRESULT)
  end

  IDXGISwapChain1_GUID = "790a45f7-0d42-4876-983a-0a55cfe6f4aa"
  IID_IDXGISwapChain1 = LibC::GUID.new(0x790a45f7_u32, 0xd42_u16, 0x4876_u16, StaticArray[0x98_u8, 0x3a_u8, 0xa_u8, 0x55_u8, 0xcf_u8, 0xe6_u8, 0xf4_u8, 0xaa_u8])
  struct IDXGISwapChain1
    lpVtbl : IDXGISwapChain1VTbl*
  end

  struct IDXGIFactory2VTbl
    query_interface : Proc(IDXGIFactory2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory2*, UInt32)
    release : Proc(IDXGIFactory2*, UInt32)
    set_private_data : Proc(IDXGIFactory2*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory2*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory2*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory2*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory2*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory2*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory2*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory2*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory2*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory2*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory2*, LibC::BOOL)
    is_windowed_stereo_enabled : Proc(IDXGIFactory2*, LibC::BOOL)
    create_swap_chain_for_hwnd : Proc(IDXGIFactory2*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_swap_chain_for_core_window : Proc(IDXGIFactory2*, IUnknown, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_shared_resource_adapter_luid : Proc(IDXGIFactory2*, LibC::HANDLE, LUID*, HRESULT)
    register_stereo_status_window : Proc(IDXGIFactory2*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_stereo_status_event : Proc(IDXGIFactory2*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_stereo_status : Proc(IDXGIFactory2*, UInt32, Void)
    register_occlusion_status_window : Proc(IDXGIFactory2*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_occlusion_status_event : Proc(IDXGIFactory2*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_occlusion_status : Proc(IDXGIFactory2*, UInt32, Void)
    create_swap_chain_for_composition : Proc(IDXGIFactory2*, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
  end

  IDXGIFactory2_GUID = "50c83a1c-e072-4c48-87b0-3630fa36a6d0"
  IID_IDXGIFactory2 = LibC::GUID.new(0x50c83a1c_u32, 0xe072_u16, 0x4c48_u16, StaticArray[0x87_u8, 0xb0_u8, 0x36_u8, 0x30_u8, 0xfa_u8, 0x36_u8, 0xa6_u8, 0xd0_u8])
  struct IDXGIFactory2
    lpVtbl : IDXGIFactory2VTbl*
  end

  struct IDXGIAdapter2VTbl
    query_interface : Proc(IDXGIAdapter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIAdapter2*, UInt32)
    release : Proc(IDXGIAdapter2*, UInt32)
    set_private_data : Proc(IDXGIAdapter2*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIAdapter2*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIAdapter2*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIAdapter2*, Guid*, Void**, HRESULT)
    enum_outputs : Proc(IDXGIAdapter2*, UInt32, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGIAdapter2*, DXGI_ADAPTER_DESC*, HRESULT)
    check_interface_support : Proc(IDXGIAdapter2*, Guid*, LARGE_INTEGER*, HRESULT)
    get_desc1 : Proc(IDXGIAdapter2*, DXGI_ADAPTER_DESC1*, HRESULT)
    get_desc2 : Proc(IDXGIAdapter2*, DXGI_ADAPTER_DESC2*, HRESULT)
  end

  IDXGIAdapter2_GUID = "0aa1ae0a-fa0e-4b84-8644-e05ff8e5acb5"
  IID_IDXGIAdapter2 = LibC::GUID.new(0xaa1ae0a_u32, 0xfa0e_u16, 0x4b84_u16, StaticArray[0x86_u8, 0x44_u8, 0xe0_u8, 0x5f_u8, 0xf8_u8, 0xe5_u8, 0xac_u8, 0xb5_u8])
  struct IDXGIAdapter2
    lpVtbl : IDXGIAdapter2VTbl*
  end

  struct IDXGIOutput1VTbl
    query_interface : Proc(IDXGIOutput1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput1*, UInt32)
    release : Proc(IDXGIOutput1*, UInt32)
    set_private_data : Proc(IDXGIOutput1*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput1*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput1*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput1*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput1*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput1*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput1*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput1*, HRESULT)
    take_ownership : Proc(IDXGIOutput1*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput1*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput1*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput1*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput1*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput1*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput1*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput1*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_display_mode_list1 : Proc(IDXGIOutput1*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC1*, HRESULT)
    find_closest_matching_mode1 : Proc(IDXGIOutput1*, DXGI_MODE_DESC1*, DXGI_MODE_DESC1*, IUnknown, HRESULT)
    get_display_surface_data1 : Proc(IDXGIOutput1*, IDXGIResource, HRESULT)
    duplicate_output : Proc(IDXGIOutput1*, IUnknown, IDXGIOutputDuplication*, HRESULT)
  end

  IDXGIOutput1_GUID = "00cddea8-939b-4b83-a340-a685226666cc"
  IID_IDXGIOutput1 = LibC::GUID.new(0xcddea8_u32, 0x939b_u16, 0x4b83_u16, StaticArray[0xa3_u8, 0x40_u8, 0xa6_u8, 0x85_u8, 0x22_u8, 0x66_u8, 0x66_u8, 0xcc_u8])
  struct IDXGIOutput1
    lpVtbl : IDXGIOutput1VTbl*
  end

  struct IDXGIDevice3VTbl
    query_interface : Proc(IDXGIDevice3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDevice3*, UInt32)
    release : Proc(IDXGIDevice3*, UInt32)
    set_private_data : Proc(IDXGIDevice3*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIDevice3*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIDevice3*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIDevice3*, Guid*, Void**, HRESULT)
    get_adapter : Proc(IDXGIDevice3*, IDXGIAdapter*, HRESULT)
    create_surface : Proc(IDXGIDevice3*, DXGI_SURFACE_DESC*, UInt32, UInt32, DXGI_SHARED_RESOURCE*, IDXGISurface*, HRESULT)
    query_resource_residency : Proc(IDXGIDevice3*, IUnknown*, DXGI_RESIDENCY*, UInt32, HRESULT)
    set_gpu_thread_priority : Proc(IDXGIDevice3*, Int32, HRESULT)
    get_gpu_thread_priority : Proc(IDXGIDevice3*, Int32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGIDevice3*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGIDevice3*, UInt32*, HRESULT)
    offer_resources : Proc(IDXGIDevice3*, UInt32, IDXGIResource*, DXGI_OFFER_RESOURCE_PRIORITY, HRESULT)
    reclaim_resources : Proc(IDXGIDevice3*, UInt32, IDXGIResource*, LibC::BOOL*, HRESULT)
    enqueue_set_event : Proc(IDXGIDevice3*, LibC::HANDLE, HRESULT)
    trim : Proc(IDXGIDevice3*, Void)
  end

  IDXGIDevice3_GUID = "6007896c-3244-4afd-bf18-a6d3beda5023"
  IID_IDXGIDevice3 = LibC::GUID.new(0x6007896c_u32, 0x3244_u16, 0x4afd_u16, StaticArray[0xbf_u8, 0x18_u8, 0xa6_u8, 0xd3_u8, 0xbe_u8, 0xda_u8, 0x50_u8, 0x23_u8])
  struct IDXGIDevice3
    lpVtbl : IDXGIDevice3VTbl*
  end

  struct IDXGISwapChain2VTbl
    query_interface : Proc(IDXGISwapChain2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISwapChain2*, UInt32)
    release : Proc(IDXGISwapChain2*, UInt32)
    set_private_data : Proc(IDXGISwapChain2*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISwapChain2*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISwapChain2*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISwapChain2*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISwapChain2*, Guid*, Void**, HRESULT)
    present : Proc(IDXGISwapChain2*, UInt32, UInt32, HRESULT)
    get_buffer : Proc(IDXGISwapChain2*, UInt32, Guid*, Void**, HRESULT)
    set_fullscreen_state : Proc(IDXGISwapChain2*, LibC::BOOL, IDXGIOutput, HRESULT)
    get_fullscreen_state : Proc(IDXGISwapChain2*, LibC::BOOL*, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGISwapChain2*, DXGI_SWAP_CHAIN_DESC*, HRESULT)
    resize_buffers : Proc(IDXGISwapChain2*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, HRESULT)
    resize_target : Proc(IDXGISwapChain2*, DXGI_MODE_DESC*, HRESULT)
    get_containing_output : Proc(IDXGISwapChain2*, IDXGIOutput*, HRESULT)
    get_frame_statistics : Proc(IDXGISwapChain2*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_last_present_count : Proc(IDXGISwapChain2*, UInt32*, HRESULT)
    get_desc1 : Proc(IDXGISwapChain2*, DXGI_SWAP_CHAIN_DESC1*, HRESULT)
    get_fullscreen_desc : Proc(IDXGISwapChain2*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, HRESULT)
    get_hwnd : Proc(IDXGISwapChain2*, HANDLE*, HRESULT)
    get_core_window : Proc(IDXGISwapChain2*, Guid*, Void**, HRESULT)
    present1 : Proc(IDXGISwapChain2*, UInt32, UInt32, DXGI_PRESENT_PARAMETERS*, HRESULT)
    is_temporary_mono_supported : Proc(IDXGISwapChain2*, LibC::BOOL)
    get_restrict_to_output : Proc(IDXGISwapChain2*, IDXGIOutput*, HRESULT)
    set_background_color : Proc(IDXGISwapChain2*, DXGI_RGBA*, HRESULT)
    get_background_color : Proc(IDXGISwapChain2*, DXGI_RGBA*, HRESULT)
    set_rotation : Proc(IDXGISwapChain2*, DXGI_MODE_ROTATION, HRESULT)
    get_rotation : Proc(IDXGISwapChain2*, DXGI_MODE_ROTATION*, HRESULT)
    set_source_size : Proc(IDXGISwapChain2*, UInt32, UInt32, HRESULT)
    get_source_size : Proc(IDXGISwapChain2*, UInt32*, UInt32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGISwapChain2*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGISwapChain2*, UInt32*, HRESULT)
    get_frame_latency_waitable_object : Proc(IDXGISwapChain2*, LibC::HANDLE)
    set_matrix_transform : Proc(IDXGISwapChain2*, DXGI_MATRIX_3X2_F*, HRESULT)
    get_matrix_transform : Proc(IDXGISwapChain2*, DXGI_MATRIX_3X2_F*, HRESULT)
  end

  IDXGISwapChain2_GUID = "a8be2ac4-199f-4946-b331-79599fb98de7"
  IID_IDXGISwapChain2 = LibC::GUID.new(0xa8be2ac4_u32, 0x199f_u16, 0x4946_u16, StaticArray[0xb3_u8, 0x31_u8, 0x79_u8, 0x59_u8, 0x9f_u8, 0xb9_u8, 0x8d_u8, 0xe7_u8])
  struct IDXGISwapChain2
    lpVtbl : IDXGISwapChain2VTbl*
  end

  struct IDXGIOutput2VTbl
    query_interface : Proc(IDXGIOutput2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput2*, UInt32)
    release : Proc(IDXGIOutput2*, UInt32)
    set_private_data : Proc(IDXGIOutput2*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput2*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput2*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput2*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput2*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput2*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput2*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput2*, HRESULT)
    take_ownership : Proc(IDXGIOutput2*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput2*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput2*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput2*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput2*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput2*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput2*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput2*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_display_mode_list1 : Proc(IDXGIOutput2*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC1*, HRESULT)
    find_closest_matching_mode1 : Proc(IDXGIOutput2*, DXGI_MODE_DESC1*, DXGI_MODE_DESC1*, IUnknown, HRESULT)
    get_display_surface_data1 : Proc(IDXGIOutput2*, IDXGIResource, HRESULT)
    duplicate_output : Proc(IDXGIOutput2*, IUnknown, IDXGIOutputDuplication*, HRESULT)
    supports_overlays : Proc(IDXGIOutput2*, LibC::BOOL)
  end

  IDXGIOutput2_GUID = "595e39d1-2724-4663-99b1-da969de28364"
  IID_IDXGIOutput2 = LibC::GUID.new(0x595e39d1_u32, 0x2724_u16, 0x4663_u16, StaticArray[0x99_u8, 0xb1_u8, 0xda_u8, 0x96_u8, 0x9d_u8, 0xe2_u8, 0x83_u8, 0x64_u8])
  struct IDXGIOutput2
    lpVtbl : IDXGIOutput2VTbl*
  end

  struct IDXGIFactory3VTbl
    query_interface : Proc(IDXGIFactory3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory3*, UInt32)
    release : Proc(IDXGIFactory3*, UInt32)
    set_private_data : Proc(IDXGIFactory3*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory3*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory3*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory3*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory3*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory3*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory3*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory3*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory3*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory3*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory3*, LibC::BOOL)
    is_windowed_stereo_enabled : Proc(IDXGIFactory3*, LibC::BOOL)
    create_swap_chain_for_hwnd : Proc(IDXGIFactory3*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_swap_chain_for_core_window : Proc(IDXGIFactory3*, IUnknown, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_shared_resource_adapter_luid : Proc(IDXGIFactory3*, LibC::HANDLE, LUID*, HRESULT)
    register_stereo_status_window : Proc(IDXGIFactory3*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_stereo_status_event : Proc(IDXGIFactory3*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_stereo_status : Proc(IDXGIFactory3*, UInt32, Void)
    register_occlusion_status_window : Proc(IDXGIFactory3*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_occlusion_status_event : Proc(IDXGIFactory3*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_occlusion_status : Proc(IDXGIFactory3*, UInt32, Void)
    create_swap_chain_for_composition : Proc(IDXGIFactory3*, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_creation_flags : Proc(IDXGIFactory3*, UInt32)
  end

  IDXGIFactory3_GUID = "25483823-cd46-4c7d-86ca-47aa95b837bd"
  IID_IDXGIFactory3 = LibC::GUID.new(0x25483823_u32, 0xcd46_u16, 0x4c7d_u16, StaticArray[0x86_u8, 0xca_u8, 0x47_u8, 0xaa_u8, 0x95_u8, 0xb8_u8, 0x37_u8, 0xbd_u8])
  struct IDXGIFactory3
    lpVtbl : IDXGIFactory3VTbl*
  end

  struct IDXGIDecodeSwapChainVTbl
    query_interface : Proc(IDXGIDecodeSwapChain*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDecodeSwapChain*, UInt32)
    release : Proc(IDXGIDecodeSwapChain*, UInt32)
    present_buffer : Proc(IDXGIDecodeSwapChain*, UInt32, UInt32, UInt32, HRESULT)
    set_source_rect : Proc(IDXGIDecodeSwapChain*, RECT*, HRESULT)
    set_target_rect : Proc(IDXGIDecodeSwapChain*, RECT*, HRESULT)
    set_dest_size : Proc(IDXGIDecodeSwapChain*, UInt32, UInt32, HRESULT)
    get_source_rect : Proc(IDXGIDecodeSwapChain*, RECT*, HRESULT)
    get_target_rect : Proc(IDXGIDecodeSwapChain*, RECT*, HRESULT)
    get_dest_size : Proc(IDXGIDecodeSwapChain*, UInt32*, UInt32*, HRESULT)
    set_color_space : Proc(IDXGIDecodeSwapChain*, DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS, HRESULT)
    get_color_space : Proc(IDXGIDecodeSwapChain*, DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS)
  end

  IDXGIDecodeSwapChain_GUID = "2633066b-4514-4c7a-8fd8-12ea98059d18"
  IID_IDXGIDecodeSwapChain = LibC::GUID.new(0x2633066b_u32, 0x4514_u16, 0x4c7a_u16, StaticArray[0x8f_u8, 0xd8_u8, 0x12_u8, 0xea_u8, 0x98_u8, 0x5_u8, 0x9d_u8, 0x18_u8])
  struct IDXGIDecodeSwapChain
    lpVtbl : IDXGIDecodeSwapChainVTbl*
  end

  struct IDXGIFactoryMediaVTbl
    query_interface : Proc(IDXGIFactoryMedia*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactoryMedia*, UInt32)
    release : Proc(IDXGIFactoryMedia*, UInt32)
    create_swap_chain_for_composition_surface_handle : Proc(IDXGIFactoryMedia*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_decode_swap_chain_for_composition_surface_handle : Proc(IDXGIFactoryMedia*, IUnknown, LibC::HANDLE, DXGI_DECODE_SWAP_CHAIN_DESC*, IDXGIResource, IDXGIOutput, IDXGIDecodeSwapChain*, HRESULT)
  end

  IDXGIFactoryMedia_GUID = "41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12"
  IID_IDXGIFactoryMedia = LibC::GUID.new(0x41e7d1f2_u32, 0xa591_u16, 0x4f7b_u16, StaticArray[0xa2_u8, 0xe5_u8, 0xfa_u8, 0x9c_u8, 0x84_u8, 0x3e_u8, 0x1c_u8, 0x12_u8])
  struct IDXGIFactoryMedia
    lpVtbl : IDXGIFactoryMediaVTbl*
  end

  struct IDXGISwapChainMediaVTbl
    query_interface : Proc(IDXGISwapChainMedia*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISwapChainMedia*, UInt32)
    release : Proc(IDXGISwapChainMedia*, UInt32)
    get_frame_statistics_media : Proc(IDXGISwapChainMedia*, DXGI_FRAME_STATISTICS_MEDIA*, HRESULT)
    set_present_duration : Proc(IDXGISwapChainMedia*, UInt32, HRESULT)
    check_present_duration_support : Proc(IDXGISwapChainMedia*, UInt32, UInt32*, UInt32*, HRESULT)
  end

  IDXGISwapChainMedia_GUID = "dd95b90b-f05f-4f6a-bd65-25bfb264bd84"
  IID_IDXGISwapChainMedia = LibC::GUID.new(0xdd95b90b_u32, 0xf05f_u16, 0x4f6a_u16, StaticArray[0xbd_u8, 0x65_u8, 0x25_u8, 0xbf_u8, 0xb2_u8, 0x64_u8, 0xbd_u8, 0x84_u8])
  struct IDXGISwapChainMedia
    lpVtbl : IDXGISwapChainMediaVTbl*
  end

  struct IDXGIOutput3VTbl
    query_interface : Proc(IDXGIOutput3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput3*, UInt32)
    release : Proc(IDXGIOutput3*, UInt32)
    set_private_data : Proc(IDXGIOutput3*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput3*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput3*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput3*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput3*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput3*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput3*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput3*, HRESULT)
    take_ownership : Proc(IDXGIOutput3*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput3*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput3*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput3*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput3*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput3*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput3*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput3*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_display_mode_list1 : Proc(IDXGIOutput3*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC1*, HRESULT)
    find_closest_matching_mode1 : Proc(IDXGIOutput3*, DXGI_MODE_DESC1*, DXGI_MODE_DESC1*, IUnknown, HRESULT)
    get_display_surface_data1 : Proc(IDXGIOutput3*, IDXGIResource, HRESULT)
    duplicate_output : Proc(IDXGIOutput3*, IUnknown, IDXGIOutputDuplication*, HRESULT)
    supports_overlays : Proc(IDXGIOutput3*, LibC::BOOL)
    check_overlay_support : Proc(IDXGIOutput3*, DXGI_FORMAT, IUnknown, UInt32*, HRESULT)
  end

  IDXGIOutput3_GUID = "8a6bb301-7e7e-41f4-a8e0-5b32f7f99b18"
  IID_IDXGIOutput3 = LibC::GUID.new(0x8a6bb301_u32, 0x7e7e_u16, 0x41f4_u16, StaticArray[0xa8_u8, 0xe0_u8, 0x5b_u8, 0x32_u8, 0xf7_u8, 0xf9_u8, 0x9b_u8, 0x18_u8])
  struct IDXGIOutput3
    lpVtbl : IDXGIOutput3VTbl*
  end

  struct IDXGISwapChain3VTbl
    query_interface : Proc(IDXGISwapChain3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISwapChain3*, UInt32)
    release : Proc(IDXGISwapChain3*, UInt32)
    set_private_data : Proc(IDXGISwapChain3*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISwapChain3*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISwapChain3*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISwapChain3*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISwapChain3*, Guid*, Void**, HRESULT)
    present : Proc(IDXGISwapChain3*, UInt32, UInt32, HRESULT)
    get_buffer : Proc(IDXGISwapChain3*, UInt32, Guid*, Void**, HRESULT)
    set_fullscreen_state : Proc(IDXGISwapChain3*, LibC::BOOL, IDXGIOutput, HRESULT)
    get_fullscreen_state : Proc(IDXGISwapChain3*, LibC::BOOL*, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGISwapChain3*, DXGI_SWAP_CHAIN_DESC*, HRESULT)
    resize_buffers : Proc(IDXGISwapChain3*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, HRESULT)
    resize_target : Proc(IDXGISwapChain3*, DXGI_MODE_DESC*, HRESULT)
    get_containing_output : Proc(IDXGISwapChain3*, IDXGIOutput*, HRESULT)
    get_frame_statistics : Proc(IDXGISwapChain3*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_last_present_count : Proc(IDXGISwapChain3*, UInt32*, HRESULT)
    get_desc1 : Proc(IDXGISwapChain3*, DXGI_SWAP_CHAIN_DESC1*, HRESULT)
    get_fullscreen_desc : Proc(IDXGISwapChain3*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, HRESULT)
    get_hwnd : Proc(IDXGISwapChain3*, HANDLE*, HRESULT)
    get_core_window : Proc(IDXGISwapChain3*, Guid*, Void**, HRESULT)
    present1 : Proc(IDXGISwapChain3*, UInt32, UInt32, DXGI_PRESENT_PARAMETERS*, HRESULT)
    is_temporary_mono_supported : Proc(IDXGISwapChain3*, LibC::BOOL)
    get_restrict_to_output : Proc(IDXGISwapChain3*, IDXGIOutput*, HRESULT)
    set_background_color : Proc(IDXGISwapChain3*, DXGI_RGBA*, HRESULT)
    get_background_color : Proc(IDXGISwapChain3*, DXGI_RGBA*, HRESULT)
    set_rotation : Proc(IDXGISwapChain3*, DXGI_MODE_ROTATION, HRESULT)
    get_rotation : Proc(IDXGISwapChain3*, DXGI_MODE_ROTATION*, HRESULT)
    set_source_size : Proc(IDXGISwapChain3*, UInt32, UInt32, HRESULT)
    get_source_size : Proc(IDXGISwapChain3*, UInt32*, UInt32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGISwapChain3*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGISwapChain3*, UInt32*, HRESULT)
    get_frame_latency_waitable_object : Proc(IDXGISwapChain3*, LibC::HANDLE)
    set_matrix_transform : Proc(IDXGISwapChain3*, DXGI_MATRIX_3X2_F*, HRESULT)
    get_matrix_transform : Proc(IDXGISwapChain3*, DXGI_MATRIX_3X2_F*, HRESULT)
    get_current_back_buffer_index : Proc(IDXGISwapChain3*, UInt32)
    check_color_space_support : Proc(IDXGISwapChain3*, DXGI_COLOR_SPACE_TYPE, UInt32*, HRESULT)
    set_color_space1 : Proc(IDXGISwapChain3*, DXGI_COLOR_SPACE_TYPE, HRESULT)
    resize_buffers1 : Proc(IDXGISwapChain3*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, UInt32*, IUnknown*, HRESULT)
  end

  IDXGISwapChain3_GUID = "94d99bdb-f1f8-4ab0-b236-7da0170edab1"
  IID_IDXGISwapChain3 = LibC::GUID.new(0x94d99bdb_u32, 0xf1f8_u16, 0x4ab0_u16, StaticArray[0xb2_u8, 0x36_u8, 0x7d_u8, 0xa0_u8, 0x17_u8, 0xe_u8, 0xda_u8, 0xb1_u8])
  struct IDXGISwapChain3
    lpVtbl : IDXGISwapChain3VTbl*
  end

  struct IDXGIOutput4VTbl
    query_interface : Proc(IDXGIOutput4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput4*, UInt32)
    release : Proc(IDXGIOutput4*, UInt32)
    set_private_data : Proc(IDXGIOutput4*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput4*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput4*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput4*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput4*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput4*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput4*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput4*, HRESULT)
    take_ownership : Proc(IDXGIOutput4*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput4*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput4*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput4*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput4*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput4*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput4*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput4*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_display_mode_list1 : Proc(IDXGIOutput4*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC1*, HRESULT)
    find_closest_matching_mode1 : Proc(IDXGIOutput4*, DXGI_MODE_DESC1*, DXGI_MODE_DESC1*, IUnknown, HRESULT)
    get_display_surface_data1 : Proc(IDXGIOutput4*, IDXGIResource, HRESULT)
    duplicate_output : Proc(IDXGIOutput4*, IUnknown, IDXGIOutputDuplication*, HRESULT)
    supports_overlays : Proc(IDXGIOutput4*, LibC::BOOL)
    check_overlay_support : Proc(IDXGIOutput4*, DXGI_FORMAT, IUnknown, UInt32*, HRESULT)
    check_overlay_color_space_support : Proc(IDXGIOutput4*, DXGI_FORMAT, DXGI_COLOR_SPACE_TYPE, IUnknown, UInt32*, HRESULT)
  end

  IDXGIOutput4_GUID = "dc7dca35-2196-414d-9f53-617884032a60"
  IID_IDXGIOutput4 = LibC::GUID.new(0xdc7dca35_u32, 0x2196_u16, 0x414d_u16, StaticArray[0x9f_u8, 0x53_u8, 0x61_u8, 0x78_u8, 0x84_u8, 0x3_u8, 0x2a_u8, 0x60_u8])
  struct IDXGIOutput4
    lpVtbl : IDXGIOutput4VTbl*
  end

  struct IDXGIFactory4VTbl
    query_interface : Proc(IDXGIFactory4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory4*, UInt32)
    release : Proc(IDXGIFactory4*, UInt32)
    set_private_data : Proc(IDXGIFactory4*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory4*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory4*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory4*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory4*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory4*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory4*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory4*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory4*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory4*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory4*, LibC::BOOL)
    is_windowed_stereo_enabled : Proc(IDXGIFactory4*, LibC::BOOL)
    create_swap_chain_for_hwnd : Proc(IDXGIFactory4*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_swap_chain_for_core_window : Proc(IDXGIFactory4*, IUnknown, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_shared_resource_adapter_luid : Proc(IDXGIFactory4*, LibC::HANDLE, LUID*, HRESULT)
    register_stereo_status_window : Proc(IDXGIFactory4*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_stereo_status_event : Proc(IDXGIFactory4*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_stereo_status : Proc(IDXGIFactory4*, UInt32, Void)
    register_occlusion_status_window : Proc(IDXGIFactory4*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_occlusion_status_event : Proc(IDXGIFactory4*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_occlusion_status : Proc(IDXGIFactory4*, UInt32, Void)
    create_swap_chain_for_composition : Proc(IDXGIFactory4*, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_creation_flags : Proc(IDXGIFactory4*, UInt32)
    enum_adapter_by_luid : Proc(IDXGIFactory4*, LUID, Guid*, Void**, HRESULT)
    enum_warp_adapter : Proc(IDXGIFactory4*, Guid*, Void**, HRESULT)
  end

  IDXGIFactory4_GUID = "1bc6ea02-ef36-464f-bf0c-21ca39e5168a"
  IID_IDXGIFactory4 = LibC::GUID.new(0x1bc6ea02_u32, 0xef36_u16, 0x464f_u16, StaticArray[0xbf_u8, 0xc_u8, 0x21_u8, 0xca_u8, 0x39_u8, 0xe5_u8, 0x16_u8, 0x8a_u8])
  struct IDXGIFactory4
    lpVtbl : IDXGIFactory4VTbl*
  end

  struct IDXGIAdapter3VTbl
    query_interface : Proc(IDXGIAdapter3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIAdapter3*, UInt32)
    release : Proc(IDXGIAdapter3*, UInt32)
    set_private_data : Proc(IDXGIAdapter3*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIAdapter3*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIAdapter3*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIAdapter3*, Guid*, Void**, HRESULT)
    enum_outputs : Proc(IDXGIAdapter3*, UInt32, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGIAdapter3*, DXGI_ADAPTER_DESC*, HRESULT)
    check_interface_support : Proc(IDXGIAdapter3*, Guid*, LARGE_INTEGER*, HRESULT)
    get_desc1 : Proc(IDXGIAdapter3*, DXGI_ADAPTER_DESC1*, HRESULT)
    get_desc2 : Proc(IDXGIAdapter3*, DXGI_ADAPTER_DESC2*, HRESULT)
    register_hardware_content_protection_teardown_status_event : Proc(IDXGIAdapter3*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_hardware_content_protection_teardown_status : Proc(IDXGIAdapter3*, UInt32, Void)
    query_video_memory_info : Proc(IDXGIAdapter3*, UInt32, DXGI_MEMORY_SEGMENT_GROUP, DXGI_QUERY_VIDEO_MEMORY_INFO*, HRESULT)
    set_video_memory_reservation : Proc(IDXGIAdapter3*, UInt32, DXGI_MEMORY_SEGMENT_GROUP, UInt64, HRESULT)
    register_video_memory_budget_change_notification_event : Proc(IDXGIAdapter3*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_video_memory_budget_change_notification : Proc(IDXGIAdapter3*, UInt32, Void)
  end

  IDXGIAdapter3_GUID = "645967a4-1392-4310-a798-8053ce3e93fd"
  IID_IDXGIAdapter3 = LibC::GUID.new(0x645967a4_u32, 0x1392_u16, 0x4310_u16, StaticArray[0xa7_u8, 0x98_u8, 0x80_u8, 0x53_u8, 0xce_u8, 0x3e_u8, 0x93_u8, 0xfd_u8])
  struct IDXGIAdapter3
    lpVtbl : IDXGIAdapter3VTbl*
  end

  struct IDXGIOutput5VTbl
    query_interface : Proc(IDXGIOutput5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput5*, UInt32)
    release : Proc(IDXGIOutput5*, UInt32)
    set_private_data : Proc(IDXGIOutput5*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput5*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput5*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput5*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput5*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput5*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput5*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput5*, HRESULT)
    take_ownership : Proc(IDXGIOutput5*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput5*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput5*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput5*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput5*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput5*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput5*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput5*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_display_mode_list1 : Proc(IDXGIOutput5*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC1*, HRESULT)
    find_closest_matching_mode1 : Proc(IDXGIOutput5*, DXGI_MODE_DESC1*, DXGI_MODE_DESC1*, IUnknown, HRESULT)
    get_display_surface_data1 : Proc(IDXGIOutput5*, IDXGIResource, HRESULT)
    duplicate_output : Proc(IDXGIOutput5*, IUnknown, IDXGIOutputDuplication*, HRESULT)
    supports_overlays : Proc(IDXGIOutput5*, LibC::BOOL)
    check_overlay_support : Proc(IDXGIOutput5*, DXGI_FORMAT, IUnknown, UInt32*, HRESULT)
    check_overlay_color_space_support : Proc(IDXGIOutput5*, DXGI_FORMAT, DXGI_COLOR_SPACE_TYPE, IUnknown, UInt32*, HRESULT)
    duplicate_output1 : Proc(IDXGIOutput5*, IUnknown, UInt32, UInt32, DXGI_FORMAT*, IDXGIOutputDuplication*, HRESULT)
  end

  IDXGIOutput5_GUID = "80a07424-ab52-42eb-833c-0c42fd282d98"
  IID_IDXGIOutput5 = LibC::GUID.new(0x80a07424_u32, 0xab52_u16, 0x42eb_u16, StaticArray[0x83_u8, 0x3c_u8, 0xc_u8, 0x42_u8, 0xfd_u8, 0x28_u8, 0x2d_u8, 0x98_u8])
  struct IDXGIOutput5
    lpVtbl : IDXGIOutput5VTbl*
  end

  struct IDXGISwapChain4VTbl
    query_interface : Proc(IDXGISwapChain4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGISwapChain4*, UInt32)
    release : Proc(IDXGISwapChain4*, UInt32)
    set_private_data : Proc(IDXGISwapChain4*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGISwapChain4*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGISwapChain4*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGISwapChain4*, Guid*, Void**, HRESULT)
    get_device : Proc(IDXGISwapChain4*, Guid*, Void**, HRESULT)
    present : Proc(IDXGISwapChain4*, UInt32, UInt32, HRESULT)
    get_buffer : Proc(IDXGISwapChain4*, UInt32, Guid*, Void**, HRESULT)
    set_fullscreen_state : Proc(IDXGISwapChain4*, LibC::BOOL, IDXGIOutput, HRESULT)
    get_fullscreen_state : Proc(IDXGISwapChain4*, LibC::BOOL*, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGISwapChain4*, DXGI_SWAP_CHAIN_DESC*, HRESULT)
    resize_buffers : Proc(IDXGISwapChain4*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, HRESULT)
    resize_target : Proc(IDXGISwapChain4*, DXGI_MODE_DESC*, HRESULT)
    get_containing_output : Proc(IDXGISwapChain4*, IDXGIOutput*, HRESULT)
    get_frame_statistics : Proc(IDXGISwapChain4*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_last_present_count : Proc(IDXGISwapChain4*, UInt32*, HRESULT)
    get_desc1 : Proc(IDXGISwapChain4*, DXGI_SWAP_CHAIN_DESC1*, HRESULT)
    get_fullscreen_desc : Proc(IDXGISwapChain4*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, HRESULT)
    get_hwnd : Proc(IDXGISwapChain4*, HANDLE*, HRESULT)
    get_core_window : Proc(IDXGISwapChain4*, Guid*, Void**, HRESULT)
    present1 : Proc(IDXGISwapChain4*, UInt32, UInt32, DXGI_PRESENT_PARAMETERS*, HRESULT)
    is_temporary_mono_supported : Proc(IDXGISwapChain4*, LibC::BOOL)
    get_restrict_to_output : Proc(IDXGISwapChain4*, IDXGIOutput*, HRESULT)
    set_background_color : Proc(IDXGISwapChain4*, DXGI_RGBA*, HRESULT)
    get_background_color : Proc(IDXGISwapChain4*, DXGI_RGBA*, HRESULT)
    set_rotation : Proc(IDXGISwapChain4*, DXGI_MODE_ROTATION, HRESULT)
    get_rotation : Proc(IDXGISwapChain4*, DXGI_MODE_ROTATION*, HRESULT)
    set_source_size : Proc(IDXGISwapChain4*, UInt32, UInt32, HRESULT)
    get_source_size : Proc(IDXGISwapChain4*, UInt32*, UInt32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGISwapChain4*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGISwapChain4*, UInt32*, HRESULT)
    get_frame_latency_waitable_object : Proc(IDXGISwapChain4*, LibC::HANDLE)
    set_matrix_transform : Proc(IDXGISwapChain4*, DXGI_MATRIX_3X2_F*, HRESULT)
    get_matrix_transform : Proc(IDXGISwapChain4*, DXGI_MATRIX_3X2_F*, HRESULT)
    get_current_back_buffer_index : Proc(IDXGISwapChain4*, UInt32)
    check_color_space_support : Proc(IDXGISwapChain4*, DXGI_COLOR_SPACE_TYPE, UInt32*, HRESULT)
    set_color_space1 : Proc(IDXGISwapChain4*, DXGI_COLOR_SPACE_TYPE, HRESULT)
    resize_buffers1 : Proc(IDXGISwapChain4*, UInt32, UInt32, UInt32, DXGI_FORMAT, UInt32, UInt32*, IUnknown*, HRESULT)
    set_hdr_meta_data : Proc(IDXGISwapChain4*, DXGI_HDR_METADATA_TYPE, UInt32, Void*, HRESULT)
  end

  IDXGISwapChain4_GUID = "3d585d5a-bd4a-489e-b1f4-3dbcb6452ffb"
  IID_IDXGISwapChain4 = LibC::GUID.new(0x3d585d5a_u32, 0xbd4a_u16, 0x489e_u16, StaticArray[0xb1_u8, 0xf4_u8, 0x3d_u8, 0xbc_u8, 0xb6_u8, 0x45_u8, 0x2f_u8, 0xfb_u8])
  struct IDXGISwapChain4
    lpVtbl : IDXGISwapChain4VTbl*
  end

  struct IDXGIDevice4VTbl
    query_interface : Proc(IDXGIDevice4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDevice4*, UInt32)
    release : Proc(IDXGIDevice4*, UInt32)
    set_private_data : Proc(IDXGIDevice4*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIDevice4*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIDevice4*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIDevice4*, Guid*, Void**, HRESULT)
    get_adapter : Proc(IDXGIDevice4*, IDXGIAdapter*, HRESULT)
    create_surface : Proc(IDXGIDevice4*, DXGI_SURFACE_DESC*, UInt32, UInt32, DXGI_SHARED_RESOURCE*, IDXGISurface*, HRESULT)
    query_resource_residency : Proc(IDXGIDevice4*, IUnknown*, DXGI_RESIDENCY*, UInt32, HRESULT)
    set_gpu_thread_priority : Proc(IDXGIDevice4*, Int32, HRESULT)
    get_gpu_thread_priority : Proc(IDXGIDevice4*, Int32*, HRESULT)
    set_maximum_frame_latency : Proc(IDXGIDevice4*, UInt32, HRESULT)
    get_maximum_frame_latency : Proc(IDXGIDevice4*, UInt32*, HRESULT)
    offer_resources : Proc(IDXGIDevice4*, UInt32, IDXGIResource*, DXGI_OFFER_RESOURCE_PRIORITY, HRESULT)
    reclaim_resources : Proc(IDXGIDevice4*, UInt32, IDXGIResource*, LibC::BOOL*, HRESULT)
    enqueue_set_event : Proc(IDXGIDevice4*, LibC::HANDLE, HRESULT)
    trim : Proc(IDXGIDevice4*, Void)
    offer_resources1 : Proc(IDXGIDevice4*, UInt32, IDXGIResource*, DXGI_OFFER_RESOURCE_PRIORITY, UInt32, HRESULT)
    reclaim_resources1 : Proc(IDXGIDevice4*, UInt32, IDXGIResource*, DXGI_RECLAIM_RESOURCE_RESULTS*, HRESULT)
  end

  IDXGIDevice4_GUID = "95b4f95f-d8da-4ca4-9ee6-3b76d5968a10"
  IID_IDXGIDevice4 = LibC::GUID.new(0x95b4f95f_u32, 0xd8da_u16, 0x4ca4_u16, StaticArray[0x9e_u8, 0xe6_u8, 0x3b_u8, 0x76_u8, 0xd5_u8, 0x96_u8, 0x8a_u8, 0x10_u8])
  struct IDXGIDevice4
    lpVtbl : IDXGIDevice4VTbl*
  end

  struct IDXGIFactory5VTbl
    query_interface : Proc(IDXGIFactory5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory5*, UInt32)
    release : Proc(IDXGIFactory5*, UInt32)
    set_private_data : Proc(IDXGIFactory5*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory5*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory5*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory5*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory5*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory5*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory5*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory5*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory5*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory5*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory5*, LibC::BOOL)
    is_windowed_stereo_enabled : Proc(IDXGIFactory5*, LibC::BOOL)
    create_swap_chain_for_hwnd : Proc(IDXGIFactory5*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_swap_chain_for_core_window : Proc(IDXGIFactory5*, IUnknown, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_shared_resource_adapter_luid : Proc(IDXGIFactory5*, LibC::HANDLE, LUID*, HRESULT)
    register_stereo_status_window : Proc(IDXGIFactory5*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_stereo_status_event : Proc(IDXGIFactory5*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_stereo_status : Proc(IDXGIFactory5*, UInt32, Void)
    register_occlusion_status_window : Proc(IDXGIFactory5*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_occlusion_status_event : Proc(IDXGIFactory5*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_occlusion_status : Proc(IDXGIFactory5*, UInt32, Void)
    create_swap_chain_for_composition : Proc(IDXGIFactory5*, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_creation_flags : Proc(IDXGIFactory5*, UInt32)
    enum_adapter_by_luid : Proc(IDXGIFactory5*, LUID, Guid*, Void**, HRESULT)
    enum_warp_adapter : Proc(IDXGIFactory5*, Guid*, Void**, HRESULT)
    check_feature_support : Proc(IDXGIFactory5*, DXGI_FEATURE, Void*, UInt32, HRESULT)
  end

  IDXGIFactory5_GUID = "7632e1f5-ee65-4dca-87fd-84cd75f8838d"
  IID_IDXGIFactory5 = LibC::GUID.new(0x7632e1f5_u32, 0xee65_u16, 0x4dca_u16, StaticArray[0x87_u8, 0xfd_u8, 0x84_u8, 0xcd_u8, 0x75_u8, 0xf8_u8, 0x83_u8, 0x8d_u8])
  struct IDXGIFactory5
    lpVtbl : IDXGIFactory5VTbl*
  end

  struct IDXGIAdapter4VTbl
    query_interface : Proc(IDXGIAdapter4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIAdapter4*, UInt32)
    release : Proc(IDXGIAdapter4*, UInt32)
    set_private_data : Proc(IDXGIAdapter4*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIAdapter4*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIAdapter4*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIAdapter4*, Guid*, Void**, HRESULT)
    enum_outputs : Proc(IDXGIAdapter4*, UInt32, IDXGIOutput*, HRESULT)
    get_desc : Proc(IDXGIAdapter4*, DXGI_ADAPTER_DESC*, HRESULT)
    check_interface_support : Proc(IDXGIAdapter4*, Guid*, LARGE_INTEGER*, HRESULT)
    get_desc1 : Proc(IDXGIAdapter4*, DXGI_ADAPTER_DESC1*, HRESULT)
    get_desc2 : Proc(IDXGIAdapter4*, DXGI_ADAPTER_DESC2*, HRESULT)
    register_hardware_content_protection_teardown_status_event : Proc(IDXGIAdapter4*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_hardware_content_protection_teardown_status : Proc(IDXGIAdapter4*, UInt32, Void)
    query_video_memory_info : Proc(IDXGIAdapter4*, UInt32, DXGI_MEMORY_SEGMENT_GROUP, DXGI_QUERY_VIDEO_MEMORY_INFO*, HRESULT)
    set_video_memory_reservation : Proc(IDXGIAdapter4*, UInt32, DXGI_MEMORY_SEGMENT_GROUP, UInt64, HRESULT)
    register_video_memory_budget_change_notification_event : Proc(IDXGIAdapter4*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_video_memory_budget_change_notification : Proc(IDXGIAdapter4*, UInt32, Void)
    get_desc3 : Proc(IDXGIAdapter4*, DXGI_ADAPTER_DESC3*, HRESULT)
  end

  IDXGIAdapter4_GUID = "3c8d99d1-4fbf-4181-a82c-af66bf7bd24e"
  IID_IDXGIAdapter4 = LibC::GUID.new(0x3c8d99d1_u32, 0x4fbf_u16, 0x4181_u16, StaticArray[0xa8_u8, 0x2c_u8, 0xaf_u8, 0x66_u8, 0xbf_u8, 0x7b_u8, 0xd2_u8, 0x4e_u8])
  struct IDXGIAdapter4
    lpVtbl : IDXGIAdapter4VTbl*
  end

  struct IDXGIOutput6VTbl
    query_interface : Proc(IDXGIOutput6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIOutput6*, UInt32)
    release : Proc(IDXGIOutput6*, UInt32)
    set_private_data : Proc(IDXGIOutput6*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIOutput6*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIOutput6*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIOutput6*, Guid*, Void**, HRESULT)
    get_desc : Proc(IDXGIOutput6*, DXGI_OUTPUT_DESC*, HRESULT)
    get_display_mode_list : Proc(IDXGIOutput6*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC*, HRESULT)
    find_closest_matching_mode : Proc(IDXGIOutput6*, DXGI_MODE_DESC*, DXGI_MODE_DESC*, IUnknown, HRESULT)
    wait_for_v_blank : Proc(IDXGIOutput6*, HRESULT)
    take_ownership : Proc(IDXGIOutput6*, IUnknown, LibC::BOOL, HRESULT)
    release_ownership : Proc(IDXGIOutput6*, Void)
    get_gamma_control_capabilities : Proc(IDXGIOutput6*, DXGI_GAMMA_CONTROL_CAPABILITIES*, HRESULT)
    set_gamma_control : Proc(IDXGIOutput6*, DXGI_GAMMA_CONTROL*, HRESULT)
    get_gamma_control : Proc(IDXGIOutput6*, DXGI_GAMMA_CONTROL*, HRESULT)
    set_display_surface : Proc(IDXGIOutput6*, IDXGISurface, HRESULT)
    get_display_surface_data : Proc(IDXGIOutput6*, IDXGISurface, HRESULT)
    get_frame_statistics : Proc(IDXGIOutput6*, DXGI_FRAME_STATISTICS*, HRESULT)
    get_display_mode_list1 : Proc(IDXGIOutput6*, DXGI_FORMAT, UInt32, UInt32*, DXGI_MODE_DESC1*, HRESULT)
    find_closest_matching_mode1 : Proc(IDXGIOutput6*, DXGI_MODE_DESC1*, DXGI_MODE_DESC1*, IUnknown, HRESULT)
    get_display_surface_data1 : Proc(IDXGIOutput6*, IDXGIResource, HRESULT)
    duplicate_output : Proc(IDXGIOutput6*, IUnknown, IDXGIOutputDuplication*, HRESULT)
    supports_overlays : Proc(IDXGIOutput6*, LibC::BOOL)
    check_overlay_support : Proc(IDXGIOutput6*, DXGI_FORMAT, IUnknown, UInt32*, HRESULT)
    check_overlay_color_space_support : Proc(IDXGIOutput6*, DXGI_FORMAT, DXGI_COLOR_SPACE_TYPE, IUnknown, UInt32*, HRESULT)
    duplicate_output1 : Proc(IDXGIOutput6*, IUnknown, UInt32, UInt32, DXGI_FORMAT*, IDXGIOutputDuplication*, HRESULT)
    get_desc1 : Proc(IDXGIOutput6*, DXGI_OUTPUT_DESC1*, HRESULT)
    check_hardware_composition_support : Proc(IDXGIOutput6*, UInt32*, HRESULT)
  end

  IDXGIOutput6_GUID = "068346e8-aaec-4b84-add7-137f513f77a1"
  IID_IDXGIOutput6 = LibC::GUID.new(0x68346e8_u32, 0xaaec_u16, 0x4b84_u16, StaticArray[0xad_u8, 0xd7_u8, 0x13_u8, 0x7f_u8, 0x51_u8, 0x3f_u8, 0x77_u8, 0xa1_u8])
  struct IDXGIOutput6
    lpVtbl : IDXGIOutput6VTbl*
  end

  struct IDXGIFactory6VTbl
    query_interface : Proc(IDXGIFactory6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory6*, UInt32)
    release : Proc(IDXGIFactory6*, UInt32)
    set_private_data : Proc(IDXGIFactory6*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory6*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory6*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory6*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory6*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory6*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory6*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory6*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory6*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory6*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory6*, LibC::BOOL)
    is_windowed_stereo_enabled : Proc(IDXGIFactory6*, LibC::BOOL)
    create_swap_chain_for_hwnd : Proc(IDXGIFactory6*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_swap_chain_for_core_window : Proc(IDXGIFactory6*, IUnknown, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_shared_resource_adapter_luid : Proc(IDXGIFactory6*, LibC::HANDLE, LUID*, HRESULT)
    register_stereo_status_window : Proc(IDXGIFactory6*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_stereo_status_event : Proc(IDXGIFactory6*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_stereo_status : Proc(IDXGIFactory6*, UInt32, Void)
    register_occlusion_status_window : Proc(IDXGIFactory6*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_occlusion_status_event : Proc(IDXGIFactory6*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_occlusion_status : Proc(IDXGIFactory6*, UInt32, Void)
    create_swap_chain_for_composition : Proc(IDXGIFactory6*, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_creation_flags : Proc(IDXGIFactory6*, UInt32)
    enum_adapter_by_luid : Proc(IDXGIFactory6*, LUID, Guid*, Void**, HRESULT)
    enum_warp_adapter : Proc(IDXGIFactory6*, Guid*, Void**, HRESULT)
    check_feature_support : Proc(IDXGIFactory6*, DXGI_FEATURE, Void*, UInt32, HRESULT)
    enum_adapter_by_gpu_preference : Proc(IDXGIFactory6*, UInt32, DXGI_GPU_PREFERENCE, Guid*, Void**, HRESULT)
  end

  IDXGIFactory6_GUID = "c1b6694f-ff09-44a9-b03c-77900a0a1d17"
  IID_IDXGIFactory6 = LibC::GUID.new(0xc1b6694f_u32, 0xff09_u16, 0x44a9_u16, StaticArray[0xb0_u8, 0x3c_u8, 0x77_u8, 0x90_u8, 0xa_u8, 0xa_u8, 0x1d_u8, 0x17_u8])
  struct IDXGIFactory6
    lpVtbl : IDXGIFactory6VTbl*
  end

  struct IDXGIFactory7VTbl
    query_interface : Proc(IDXGIFactory7*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIFactory7*, UInt32)
    release : Proc(IDXGIFactory7*, UInt32)
    set_private_data : Proc(IDXGIFactory7*, Guid*, UInt32, Void*, HRESULT)
    set_private_data_interface : Proc(IDXGIFactory7*, Guid*, IUnknown, HRESULT)
    get_private_data : Proc(IDXGIFactory7*, Guid*, UInt32*, Void*, HRESULT)
    get_parent : Proc(IDXGIFactory7*, Guid*, Void**, HRESULT)
    enum_adapters : Proc(IDXGIFactory7*, UInt32, IDXGIAdapter*, HRESULT)
    make_window_association : Proc(IDXGIFactory7*, LibC::HANDLE, UInt32, HRESULT)
    get_window_association : Proc(IDXGIFactory7*, HANDLE*, HRESULT)
    create_swap_chain : Proc(IDXGIFactory7*, IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, HRESULT)
    create_software_adapter : Proc(IDXGIFactory7*, HINSTANCE, IDXGIAdapter*, HRESULT)
    enum_adapters1 : Proc(IDXGIFactory7*, UInt32, IDXGIAdapter1*, HRESULT)
    is_current : Proc(IDXGIFactory7*, LibC::BOOL)
    is_windowed_stereo_enabled : Proc(IDXGIFactory7*, LibC::BOOL)
    create_swap_chain_for_hwnd : Proc(IDXGIFactory7*, IUnknown, LibC::HANDLE, DXGI_SWAP_CHAIN_DESC1*, DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    create_swap_chain_for_core_window : Proc(IDXGIFactory7*, IUnknown, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_shared_resource_adapter_luid : Proc(IDXGIFactory7*, LibC::HANDLE, LUID*, HRESULT)
    register_stereo_status_window : Proc(IDXGIFactory7*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_stereo_status_event : Proc(IDXGIFactory7*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_stereo_status : Proc(IDXGIFactory7*, UInt32, Void)
    register_occlusion_status_window : Proc(IDXGIFactory7*, LibC::HANDLE, UInt32, UInt32*, HRESULT)
    register_occlusion_status_event : Proc(IDXGIFactory7*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_occlusion_status : Proc(IDXGIFactory7*, UInt32, Void)
    create_swap_chain_for_composition : Proc(IDXGIFactory7*, IUnknown, DXGI_SWAP_CHAIN_DESC1*, IDXGIOutput, IDXGISwapChain1*, HRESULT)
    get_creation_flags : Proc(IDXGIFactory7*, UInt32)
    enum_adapter_by_luid : Proc(IDXGIFactory7*, LUID, Guid*, Void**, HRESULT)
    enum_warp_adapter : Proc(IDXGIFactory7*, Guid*, Void**, HRESULT)
    check_feature_support : Proc(IDXGIFactory7*, DXGI_FEATURE, Void*, UInt32, HRESULT)
    enum_adapter_by_gpu_preference : Proc(IDXGIFactory7*, UInt32, DXGI_GPU_PREFERENCE, Guid*, Void**, HRESULT)
    register_adapters_changed_event : Proc(IDXGIFactory7*, LibC::HANDLE, UInt32*, HRESULT)
    unregister_adapters_changed_event : Proc(IDXGIFactory7*, UInt32, HRESULT)
  end

  IDXGIFactory7_GUID = "a4966eed-76db-44da-84c1-ee9a7afb20a8"
  IID_IDXGIFactory7 = LibC::GUID.new(0xa4966eed_u32, 0x76db_u16, 0x44da_u16, StaticArray[0x84_u8, 0xc1_u8, 0xee_u8, 0x9a_u8, 0x7a_u8, 0xfb_u8, 0x20_u8, 0xa8_u8])
  struct IDXGIFactory7
    lpVtbl : IDXGIFactory7VTbl*
  end

  struct IDXGIInfoQueueVTbl
    query_interface : Proc(IDXGIInfoQueue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIInfoQueue*, UInt32)
    release : Proc(IDXGIInfoQueue*, UInt32)
    set_message_count_limit : Proc(IDXGIInfoQueue*, Guid, UInt64, HRESULT)
    clear_stored_messages : Proc(IDXGIInfoQueue*, Guid, Void)
    get_message : Proc(IDXGIInfoQueue*, Guid, UInt64, DXGI_INFO_QUEUE_MESSAGE*, LibC::UINT_PTR*, HRESULT)
    get_num_stored_messages_allowed_by_retrieval_filters : Proc(IDXGIInfoQueue*, Guid, UInt64)
    get_num_stored_messages : Proc(IDXGIInfoQueue*, Guid, UInt64)
    get_num_messages_discarded_by_message_count_limit : Proc(IDXGIInfoQueue*, Guid, UInt64)
    get_message_count_limit : Proc(IDXGIInfoQueue*, Guid, UInt64)
    get_num_messages_allowed_by_storage_filter : Proc(IDXGIInfoQueue*, Guid, UInt64)
    get_num_messages_denied_by_storage_filter : Proc(IDXGIInfoQueue*, Guid, UInt64)
    add_storage_filter_entries : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_FILTER*, HRESULT)
    get_storage_filter : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_FILTER*, LibC::UINT_PTR*, HRESULT)
    clear_storage_filter : Proc(IDXGIInfoQueue*, Guid, Void)
    push_empty_storage_filter : Proc(IDXGIInfoQueue*, Guid, HRESULT)
    push_deny_all_storage_filter : Proc(IDXGIInfoQueue*, Guid, HRESULT)
    push_copy_of_storage_filter : Proc(IDXGIInfoQueue*, Guid, HRESULT)
    push_storage_filter : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_FILTER*, HRESULT)
    pop_storage_filter : Proc(IDXGIInfoQueue*, Guid, Void)
    get_storage_filter_stack_size : Proc(IDXGIInfoQueue*, Guid, UInt32)
    add_retrieval_filter_entries : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_FILTER*, HRESULT)
    get_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_FILTER*, LibC::UINT_PTR*, HRESULT)
    clear_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, Void)
    push_empty_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, HRESULT)
    push_deny_all_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, HRESULT)
    push_copy_of_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, HRESULT)
    push_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_FILTER*, HRESULT)
    pop_retrieval_filter : Proc(IDXGIInfoQueue*, Guid, Void)
    get_retrieval_filter_stack_size : Proc(IDXGIInfoQueue*, Guid, UInt32)
    add_message : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Int32, PSTR, HRESULT)
    add_application_message : Proc(IDXGIInfoQueue*, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, PSTR, HRESULT)
    set_break_on_category : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, LibC::BOOL, HRESULT)
    set_break_on_severity : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, LibC::BOOL, HRESULT)
    set_break_on_id : Proc(IDXGIInfoQueue*, Guid, Int32, LibC::BOOL, HRESULT)
    get_break_on_category : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, LibC::BOOL)
    get_break_on_severity : Proc(IDXGIInfoQueue*, Guid, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, LibC::BOOL)
    get_break_on_id : Proc(IDXGIInfoQueue*, Guid, Int32, LibC::BOOL)
    set_mute_debug_output : Proc(IDXGIInfoQueue*, Guid, LibC::BOOL, Void)
    get_mute_debug_output : Proc(IDXGIInfoQueue*, Guid, LibC::BOOL)
  end

  IDXGIInfoQueue_GUID = "d67441c7-672a-476f-9e82-cd55b44949ce"
  IID_IDXGIInfoQueue = LibC::GUID.new(0xd67441c7_u32, 0x672a_u16, 0x476f_u16, StaticArray[0x9e_u8, 0x82_u8, 0xcd_u8, 0x55_u8, 0xb4_u8, 0x49_u8, 0x49_u8, 0xce_u8])
  struct IDXGIInfoQueue
    lpVtbl : IDXGIInfoQueueVTbl*
  end

  struct IDXGIDebugVTbl
    query_interface : Proc(IDXGIDebug*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDebug*, UInt32)
    release : Proc(IDXGIDebug*, UInt32)
    report_live_objects : Proc(IDXGIDebug*, Guid, DXGI_DEBUG_RLO_FLAGS, HRESULT)
  end

  IDXGIDebug_GUID = "119e7452-de9e-40fe-8806-88f90c12b441"
  IID_IDXGIDebug = LibC::GUID.new(0x119e7452_u32, 0xde9e_u16, 0x40fe_u16, StaticArray[0x88_u8, 0x6_u8, 0x88_u8, 0xf9_u8, 0xc_u8, 0x12_u8, 0xb4_u8, 0x41_u8])
  struct IDXGIDebug
    lpVtbl : IDXGIDebugVTbl*
  end

  struct IDXGIDebug1VTbl
    query_interface : Proc(IDXGIDebug1*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGIDebug1*, UInt32)
    release : Proc(IDXGIDebug1*, UInt32)
    report_live_objects : Proc(IDXGIDebug1*, Guid, DXGI_DEBUG_RLO_FLAGS, HRESULT)
    enable_leak_tracking_for_thread : Proc(IDXGIDebug1*, Void)
    disable_leak_tracking_for_thread : Proc(IDXGIDebug1*, Void)
    is_leak_tracking_enabled_for_thread : Proc(IDXGIDebug1*, LibC::BOOL)
  end

  IDXGIDebug1_GUID = "c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550"
  IID_IDXGIDebug1 = LibC::GUID.new(0xc5a05f0c_u32, 0x16f2_u16, 0x4adf_u16, StaticArray[0x9f_u8, 0x4d_u8, 0xa8_u8, 0xc4_u8, 0xd5_u8, 0x8a_u8, 0xc5_u8, 0x50_u8])
  struct IDXGIDebug1
    lpVtbl : IDXGIDebug1VTbl*
  end

  struct IDXGraphicsAnalysisVTbl
    query_interface : Proc(IDXGraphicsAnalysis*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDXGraphicsAnalysis*, UInt32)
    release : Proc(IDXGraphicsAnalysis*, UInt32)
    begin_capture : Proc(IDXGraphicsAnalysis*, Void)
    end_capture : Proc(IDXGraphicsAnalysis*, Void)
  end

  IDXGraphicsAnalysis_GUID = "9f251514-9d4d-4902-9d60-18988ab7d4b5"
  IID_IDXGraphicsAnalysis = LibC::GUID.new(0x9f251514_u32, 0x9d4d_u16, 0x4902_u16, StaticArray[0x9d_u8, 0x60_u8, 0x18_u8, 0x98_u8, 0x8a_u8, 0xb7_u8, 0xd4_u8, 0xb5_u8])
  struct IDXGraphicsAnalysis
    lpVtbl : IDXGraphicsAnalysisVTbl*
  end


  # Params # riid : Guid* [In],ppfactory : Void** [In]
  fun CreateDXGIFactory(riid : Guid*, ppfactory : Void**) : HRESULT

  # Params # riid : Guid* [In],ppfactory : Void** [In]
  fun CreateDXGIFactory1(riid : Guid*, ppfactory : Void**) : HRESULT

  # Params # flags : UInt32 [In],riid : Guid* [In],ppfactory : Void** [In]
  fun CreateDXGIFactory2(flags : UInt32, riid : Guid*, ppfactory : Void**) : HRESULT

  # Params # flags : UInt32 [In],riid : Guid* [In],pdebug : Void** [In]
  fun DXGIGetDebugInterface1(flags : UInt32, riid : Guid*, pdebug : Void**) : HRESULT

  # Params # 
  fun DXGIDeclareAdapterRemovalSupport : HRESULT
end