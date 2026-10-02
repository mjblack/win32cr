require "./../foundation.cr"
require "./../system/com.cr"
require "./../system/variant.cr"

module Win32cr::Networking::DeliveryOptimization
  extend self
  DecryptionInfo_KeyData = "KeyData"
  DecryptionInfo_EncryptionBufferSize = "EncryptionBufferSize"
  DecryptionInfo_AlgorithmName = "AlgorithmName"
  DecryptionInfo_ChainingMode = "ChainingMode"
  IntegrityCheckInfo_PiecesHashFileUrl = "PiecesHashFileUrl"
  IntegrityCheckInfo_PiecesHashFileDigest = "PiecesHashFileDigest"
  IntegrityCheckInfo_PiecesHashFileDigestAlgorithm = "PiecesHashFileDigestAlgorithm"
  IntegrityCheckInfo_HashOfHashes = "HashOfHashes"
  LIBID_DeliveryOptimization = LibC::GUID.new(0x5b99fa76_u32, 0x721c_u16, 0x423c_u16, StaticArray[0xad_u8, 0xac_u8, 0x56_u8, 0xd0_u8, 0x3c_u8, 0x8a_u8, 0x80_u8, 0x7_u8])

  CLSID_DeliveryOptimization = LibC::GUID.new(0x5b99fa76_u32, 0x721c_u16, 0x423c_u16, StaticArray[0xad_u8, 0xac_u8, 0x56_u8, 0xd0_u8, 0x3c_u8, 0x8a_u8, 0x80_u8, 0x7_u8])

  enum DODownloadState
    DODownloadState_Created = 0_i32
    DODownloadState_Transferring = 1_i32
    DODownloadState_Transferred = 2_i32
    DODownloadState_Finalized = 3_i32
    DODownloadState_Aborted = 4_i32
    DODownloadState_Paused = 5_i32
  end
  enum DODownloadCostPolicy
    DODownloadCostPolicy_Always = 0_i32
    DODownloadCostPolicy_Unrestricted = 1_i32
    DODownloadCostPolicy_Standard = 2_i32
    DODownloadCostPolicy_NoRoaming = 3_i32
    DODownloadCostPolicy_NoSurcharge = 4_i32
    DODownloadCostPolicy_NoCellular = 5_i32
  end
  enum DODownloadProperty
    DODownloadProperty_Id = 0_i32
    DODownloadProperty_Uri = 1_i32
    DODownloadProperty_ContentId = 2_i32
    DODownloadProperty_DisplayName = 3_i32
    DODownloadProperty_LocalPath = 4_i32
    DODownloadProperty_HttpCustomHeaders = 5_i32
    DODownloadProperty_CostPolicy = 6_i32
    DODownloadProperty_SecurityFlags = 7_i32
    DODownloadProperty_CallbackFreqPercent = 8_i32
    DODownloadProperty_CallbackFreqSeconds = 9_i32
    DODownloadProperty_NoProgressTimeoutSeconds = 10_i32
    DODownloadProperty_ForegroundPriority = 11_i32
    DODownloadProperty_BlockingMode = 12_i32
    DODownloadProperty_CallbackInterface = 13_i32
    DODownloadProperty_StreamInterface = 14_i32
    DODownloadProperty_SecurityContext = 15_i32
    DODownloadProperty_NetworkToken = 16_i32
    DODownloadProperty_CorrelationVector = 17_i32
    DODownloadProperty_DecryptionInfo = 18_i32
    DODownloadProperty_IntegrityCheckInfo = 19_i32
    DODownloadProperty_IntegrityCheckMandatory = 20_i32
    DODownloadProperty_TotalSizeBytes = 21_i32
    DODownloadProperty_DisallowOnCellular = 22_i32
    DODownloadProperty_HttpCustomAuthHeaders = 23_i32
    DODownloadProperty_HttpAllowSecureToNonSecureRedirect = 24_i32
    DODownloadProperty_NonVolatile = 25_i32
    DODownloadProperty_HttpRedirectionTarget = 26_i32
    DODownloadProperty_HttpResponseHeaders = 27_i32
    DODownloadProperty_HttpServerIPAddress = 28_i32
    DODownloadProperty_HttpStatusCode = 29_i32
  end

  @[Extern]
  struct DO_DOWNLOAD_RANGE
    property offset : UInt64
    property length : UInt64
    def initialize(@offset : UInt64, @length : UInt64)
    end
  end

  @[Extern]
  struct DO_DOWNLOAD_RANGES_INFO
    property range_count : UInt32
    property ranges : Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_RANGE[1]
    def initialize(@range_count : UInt32, @ranges : Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_RANGE[1])
    end
  end

  @[Extern]
  struct DO_DOWNLOAD_STATUS
    property bytes_total : UInt64
    property bytes_transferred : UInt64
    property state : Win32cr::Networking::DeliveryOptimization::DODownloadState
    property error : Win32cr::Foundation::HRESULT
    property extended_error : Win32cr::Foundation::HRESULT
    def initialize(@bytes_total : UInt64, @bytes_transferred : UInt64, @state : Win32cr::Networking::DeliveryOptimization::DODownloadState, @error : Win32cr::Foundation::HRESULT, @extended_error : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct DO_DOWNLOAD_ENUM_CATEGORY
    property property : Win32cr::Networking::DeliveryOptimization::DODownloadProperty
    property value : Win32cr::Foundation::PWSTR
    def initialize(@property : Win32cr::Networking::DeliveryOptimization::DODownloadProperty, @value : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]

  record IDODownloadVtable,
    query_interface : Proc(IDODownload*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDODownload*, UInt32),
    release : Proc(IDODownload*, UInt32),
    start : Proc(IDODownload*, Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_RANGES_INFO*, Win32cr::Foundation::HRESULT),
    pause : Proc(IDODownload*, Win32cr::Foundation::HRESULT),
    abort : Proc(IDODownload*, Win32cr::Foundation::HRESULT),
    finalize__ : Proc(IDODownload*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IDODownload*, Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_STATUS*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IDODownload*, Win32cr::Networking::DeliveryOptimization::DODownloadProperty, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IDODownload*, Win32cr::Networking::DeliveryOptimization::DODownloadProperty, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDODownload, lpVtbl : IDODownloadVtable* do
    GUID = LibC::GUID.new(0xfbbd7fc0_u32, 0xc147_u16, 0x4727_u16, StaticArray[0xa3_u8, 0x8d_u8, 0x82_u8, 0x7e_u8, 0xf0_u8, 0x71_u8, 0xee_u8, 0x77_u8])
    def query_interface(this : IDODownload*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDODownload*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDODownload*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IDODownload*, ranges : Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_RANGES_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, ranges)
    end
    def pause(this : IDODownload*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def abort(this : IDODownload*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def finalize__(this : IDODownload*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalize__.call(this)
    end
    def get_status(this : IDODownload*, status : Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def get_property(this : IDODownload*, propId : Win32cr::Networking::DeliveryOptimization::DODownloadProperty, propVal : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, propId, propVal)
    end
    def set_property(this : IDODownload*, propId : Win32cr::Networking::DeliveryOptimization::DODownloadProperty, propVal : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, propId, propVal)
    end

  end

  @[Extern]

  record IDODownloadStatusCallbackVtable,
    query_interface : Proc(IDODownloadStatusCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDODownloadStatusCallback*, UInt32),
    release : Proc(IDODownloadStatusCallback*, UInt32),
    on_status_change : Proc(IDODownloadStatusCallback*, Void*, Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDODownloadStatusCallback, lpVtbl : IDODownloadStatusCallbackVtable* do
    GUID = LibC::GUID.new(0xd166e8e3_u32, 0xa90e_u16, 0x4392_u16, StaticArray[0x8e_u8, 0x87_u8, 0x5_u8, 0xe9_u8, 0x96_u8, 0xd3_u8, 0x74_u8, 0x7d_u8])
    def query_interface(this : IDODownloadStatusCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDODownloadStatusCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDODownloadStatusCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_status_change(this : IDODownloadStatusCallback*, download : Void*, status : Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, download, status)
    end

  end

  @[Extern]

  record IDOManagerVtable,
    query_interface : Proc(IDOManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDOManager*, UInt32),
    release : Proc(IDOManager*, UInt32),
    create_download : Proc(IDOManager*, Void**, Win32cr::Foundation::HRESULT),
    enum_downloads : Proc(IDOManager*, Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_ENUM_CATEGORY*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDOManager, lpVtbl : IDOManagerVtable* do
    GUID = LibC::GUID.new(0x400e2d4a_u32, 0x1431_u16, 0x4c1a_u16, StaticArray[0xa7_u8, 0x48_u8, 0x39_u8, 0xca_u8, 0x47_u8, 0x2c_u8, 0xfd_u8, 0xb1_u8])
    def query_interface(this : IDOManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDOManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDOManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_download(this : IDOManager*, download : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_download.call(this, download)
    end
    def enum_downloads(this : IDOManager*, category : Win32cr::Networking::DeliveryOptimization::DO_DOWNLOAD_ENUM_CATEGORY*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_downloads.call(this, category, ppEnum)
    end

  end

end