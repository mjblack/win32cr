require "./../foundation.cr"
require "./../networking/win_sock.cr"
require "./power.cr"
require "./host_compute_system.cr"

module Win32cr::System::Hypervisor
  extend self
  alias WHV_PARTITION_HANDLE = LibC::IntPtrT
  {% if flag?(:x86_64) %}
  alias WHV_EMULATOR_IO_PORT_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_EMULATOR_IO_ACCESS_INFO*, Win32cr::Foundation::HRESULT)
  {% end %}

  {% if flag?(:x86_64) %}
  alias WHV_EMULATOR_MEMORY_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_ACCESS_INFO*, Win32cr::Foundation::HRESULT)
  {% end %}

  {% if flag?(:x86_64) %}
  alias WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, UInt32, Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*, Win32cr::Foundation::HRESULT)
  {% end %}

  {% if flag?(:x86_64) %}
  alias WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, UInt32, Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*, Win32cr::Foundation::HRESULT)
  {% end %}

  {% if flag?(:x86_64) %}
  alias WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK = Proc(Void*, UInt64, Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE*, UInt64*, Win32cr::Foundation::HRESULT)
  {% end %}

  alias HDV_PCI_DEVICE_INITIALIZE = Proc(Void*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_TEARDOWN = Proc(Void*, Void)

  alias HDV_PCI_DEVICE_SET_CONFIGURATION = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_GET_DETAILS = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_PNP_ID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_START = Proc(Void*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_STOP = Proc(Void*, Void)

  alias HDV_PCI_READ_CONFIG_SPACE = Proc(Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_WRITE_CONFIG_SPACE = Proc(Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_READ_INTERCEPTED_MEMORY = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_WRITE_INTERCEPTED_MEMORY = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, Win32cr::Foundation::HRESULT)

  alias GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK = Proc(Win32cr::Foundation::PSTR, Void)

  alias FOUND_IMAGE_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::DOS_IMAGE_INFO*, Win32cr::Foundation::BOOL)

  HVSOCKET_CONNECT_TIMEOUT = 1_u32
  HVSOCKET_CONNECT_TIMEOUT_MAX = 300000_u32
  HVSOCKET_CONNECTED_SUSPEND = 4_u32
  HVSOCKET_HIGH_VTL = 8_u32
  HV_PROTOCOL_RAW = 1_u32
  HVSOCKET_ADDRESS_FLAG_PASSTHRU = 1_u32
  WHV_EXTENDED_VM_EXITS_RESERVED_BITFIELD_COUNT = 49_u32
  WHV_PROCESSOR_FEATURES_BANKS_COUNT = 2_u32
  WHV_SYNTHETIC_PROCESSOR_FEATURES_RESERVED_BITFIELD_COUNT = 17_u32
  WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_COUNT = 1_u32
  WHV_VTL_ALL = 15_u32
  WHV_READ_WRITE_GPA_RANGE_MAX_SIZE = 16_u32
  WHV_HYPERCALL_CONTEXT_MAX_XMM_REGISTERS = 6_u32
  WHV_ARM64_GLOBAL_INTERRUPT_CONTROLLER_STATE_VERSION_CURRENT = 1_u32
  WHV_ARM64_INTERRUPT_CONTROLLER_STATE_VERSION_CURRENT = 1_u32
  WHV_MAX_DEVICE_ID_SIZE_IN_CHARS = 200_u32
  WHV_VPCI_TYPE0_BAR_COUNT = 6_u32
  WHV_ANY_VP = 4294967295_u32
  WHV_SYNIC_MESSAGE_SIZE = 256_u32
  VM_GENCOUNTER_SYMBOLIC_LINK_NAME = "\\VmGenerationCounter"
  IOCTL_VMGENCOUNTER_READ = 3325956_u32
  HDV_PCI_BAR_COUNT = 6_u32
  HV_GUID_ZERO = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
  HV_GUID_BROADCAST = LibC::GUID.new(0xffffffff_u32, 0xffff_u16, 0xffff_u16, StaticArray[0xff_u8, 0xff_u8, 0xff_u8, 0xff_u8, 0xff_u8, 0xff_u8, 0xff_u8, 0xff_u8])
  HV_GUID_CHILDREN = LibC::GUID.new(0x90db8b89_u32, 0xd35_u16, 0x4f79_u16, StaticArray[0x8c_u8, 0xe9_u8, 0x49_u8, 0xea_u8, 0xa_u8, 0xc8_u8, 0xb7_u8, 0xcd_u8])
  HV_GUID_LOOPBACK = LibC::GUID.new(0xe0e16197_u32, 0xdd56_u16, 0x4a10_u16, StaticArray[0x91_u8, 0x95_u8, 0x5e_u8, 0xe7_u8, 0xa1_u8, 0x55_u8, 0xa8_u8, 0x38_u8])
  HV_GUID_PARENT = LibC::GUID.new(0xa42e7cda_u32, 0xd03f_u16, 0x480c_u16, StaticArray[0x9c_u8, 0xc2_u8, 0xa4_u8, 0xde_u8, 0x20_u8, 0xab_u8, 0xb8_u8, 0x78_u8])
  HV_GUID_SILOHOST = LibC::GUID.new(0x36bd0c5c_u32, 0x7276_u16, 0x4223_u16, StaticArray[0x88_u8, 0xba_u8, 0x7d_u8, 0x3_u8, 0xb6_u8, 0x54_u8, 0xc5_u8, 0x68_u8])
  HV_GUID_VSOCK_TEMPLATE = LibC::GUID.new(0x0_u32, 0xfacb_u16, 0x11e6_u16, StaticArray[0xbd_u8, 0x58_u8, 0x64_u8, 0x0_u8, 0x6a_u8, 0x79_u8, 0x86_u8, 0xd3_u8])
  GUID_DEVINTERFACE_VM_GENCOUNTER = LibC::GUID.new(0x3ff2c92b_u32, 0x6598_u16, 0x4e60_u16, StaticArray[0x8e_u8, 0x1c_u8, 0xc_u8, 0xcf_u8, 0x49_u8, 0x27_u8, 0xe3_u8, 0x19_u8])

  enum WHV_REGISTER_NAME
    WHvArm64RegisterX0 = 131072_i32
    WHvArm64RegisterX1 = 131073_i32
    WHvArm64RegisterX2 = 131074_i32
    WHvArm64RegisterX3 = 131075_i32
    WHvArm64RegisterX4 = 131076_i32
    WHvArm64RegisterX5 = 131077_i32
    WHvArm64RegisterX6 = 131078_i32
    WHvArm64RegisterX7 = 131079_i32
    WHvArm64RegisterX8 = 131080_i32
    WHvArm64RegisterX9 = 131081_i32
    WHvArm64RegisterX10 = 131082_i32
    WHvArm64RegisterX11 = 131083_i32
    WHvArm64RegisterX12 = 131084_i32
    WHvArm64RegisterX13 = 131085_i32
    WHvArm64RegisterX14 = 131086_i32
    WHvArm64RegisterX15 = 131087_i32
    WHvArm64RegisterX16 = 131088_i32
    WHvArm64RegisterX17 = 131089_i32
    WHvArm64RegisterX18 = 131090_i32
    WHvArm64RegisterX19 = 131091_i32
    WHvArm64RegisterX20 = 131092_i32
    WHvArm64RegisterX21 = 131093_i32
    WHvArm64RegisterX22 = 131094_i32
    WHvArm64RegisterX23 = 131095_i32
    WHvArm64RegisterX24 = 131096_i32
    WHvArm64RegisterX25 = 131097_i32
    WHvArm64RegisterX26 = 131098_i32
    WHvArm64RegisterX27 = 131099_i32
    WHvArm64RegisterX28 = 131100_i32
    WHvArm64RegisterFp = 131101_i32
    WHvArm64RegisterLr = 131102_i32
    WHvArm64RegisterPc = 131106_i32
    WHvArm64RegisterQ0 = 196608_i32
    WHvArm64RegisterQ1 = 196609_i32
    WHvArm64RegisterQ2 = 196610_i32
    WHvArm64RegisterQ3 = 196611_i32
    WHvArm64RegisterQ4 = 196612_i32
    WHvArm64RegisterQ5 = 196613_i32
    WHvArm64RegisterQ6 = 196614_i32
    WHvArm64RegisterQ7 = 196615_i32
    WHvArm64RegisterQ8 = 196616_i32
    WHvArm64RegisterQ9 = 196617_i32
    WHvArm64RegisterQ10 = 196618_i32
    WHvArm64RegisterQ11 = 196619_i32
    WHvArm64RegisterQ12 = 196620_i32
    WHvArm64RegisterQ13 = 196621_i32
    WHvArm64RegisterQ14 = 196622_i32
    WHvArm64RegisterQ15 = 196623_i32
    WHvArm64RegisterQ16 = 196624_i32
    WHvArm64RegisterQ17 = 196625_i32
    WHvArm64RegisterQ18 = 196626_i32
    WHvArm64RegisterQ19 = 196627_i32
    WHvArm64RegisterQ20 = 196628_i32
    WHvArm64RegisterQ21 = 196629_i32
    WHvArm64RegisterQ22 = 196630_i32
    WHvArm64RegisterQ23 = 196631_i32
    WHvArm64RegisterQ24 = 196632_i32
    WHvArm64RegisterQ25 = 196633_i32
    WHvArm64RegisterQ26 = 196634_i32
    WHvArm64RegisterQ27 = 196635_i32
    WHvArm64RegisterQ28 = 196636_i32
    WHvArm64RegisterQ29 = 196637_i32
    WHvArm64RegisterQ30 = 196638_i32
    WHvArm64RegisterQ31 = 196639_i32
    WHvArm64RegisterPstate = 131107_i32
    WHvArm64RegisterElrEl1 = 262165_i32
    WHvArm64RegisterFpcr = 262162_i32
    WHvArm64RegisterFpsr = 262163_i32
    WHvArm64RegisterSp = 131103_i32
    WHvArm64RegisterSpEl0 = 131104_i32
    WHvArm64RegisterSpEl1 = 131105_i32
    WHvArm64RegisterSpsrEl1 = 262164_i32
    WHvArm64RegisterIdMidrEl1 = 139264_i32
    WHvArm64RegisterIdRes01El1 = 139265_i32
    WHvArm64RegisterIdRes02El1 = 139266_i32
    WHvArm64RegisterIdRes03El1 = 139267_i32
    WHvArm64RegisterIdRes04El1 = 139268_i32
    WHvArm64RegisterIdMpidrEl1 = 139269_i32
    WHvArm64RegisterIdRevidrEl1 = 139270_i32
    WHvArm64RegisterIdRes07El1 = 139271_i32
    WHvArm64RegisterIdPfr0El1 = 139272_i32
    WHvArm64RegisterIdPfr1El1 = 139273_i32
    WHvArm64RegisterIdDfr0El1 = 139274_i32
    WHvArm64RegisterIdRes13El1 = 139275_i32
    WHvArm64RegisterIdMmfr0El1 = 139276_i32
    WHvArm64RegisterIdMmfr1El1 = 139277_i32
    WHvArm64RegisterIdMmfr2El1 = 139278_i32
    WHvArm64RegisterIdMmfr3El1 = 139279_i32
    WHvArm64RegisterIdIsar0El1 = 139280_i32
    WHvArm64RegisterIdIsar1El1 = 139281_i32
    WHvArm64RegisterIdIsar2El1 = 139282_i32
    WHvArm64RegisterIdIsar3El1 = 139283_i32
    WHvArm64RegisterIdIsar4El1 = 139284_i32
    WHvArm64RegisterIdIsar5El1 = 139285_i32
    WHvArm64RegisterIdRes26El1 = 139286_i32
    WHvArm64RegisterIdRes27El1 = 139287_i32
    WHvArm64RegisterIdMvfr0El1 = 139288_i32
    WHvArm64RegisterIdMvfr1El1 = 139289_i32
    WHvArm64RegisterIdMvfr2El1 = 139290_i32
    WHvArm64RegisterIdRes33El1 = 139291_i32
    WHvArm64RegisterIdPfr2El1 = 139292_i32
    WHvArm64RegisterIdRes35El1 = 139293_i32
    WHvArm64RegisterIdRes36El1 = 139294_i32
    WHvArm64RegisterIdRes37El1 = 139295_i32
    WHvArm64RegisterIdAa64Pfr0El1 = 139296_i32
    WHvArm64RegisterIdAa64Pfr1El1 = 139297_i32
    WHvArm64RegisterIdAa64Pfr2El1 = 139298_i32
    WHvArm64RegisterIdRes43El1 = 139299_i32
    WHvArm64RegisterIdAa64Zfr0El1 = 139300_i32
    WHvArm64RegisterIdAa64Smfr0El1 = 139301_i32
    WHvArm64RegisterIdRes46El1 = 139302_i32
    WHvArm64RegisterIdRes47El1 = 139303_i32
    WHvArm64RegisterIdAa64Dfr0El1 = 139304_i32
    WHvArm64RegisterIdAa64Dfr1El1 = 139305_i32
    WHvArm64RegisterIdRes52El1 = 139306_i32
    WHvArm64RegisterIdRes53El1 = 139307_i32
    WHvArm64RegisterIdRes54El1 = 139308_i32
    WHvArm64RegisterIdRes55El1 = 139309_i32
    WHvArm64RegisterIdRes56El1 = 139310_i32
    WHvArm64RegisterIdRes57El1 = 139311_i32
    WHvArm64RegisterIdAa64Isar0El1 = 139312_i32
    WHvArm64RegisterIdAa64Isar1El1 = 139313_i32
    WHvArm64RegisterIdAa64Isar2El1 = 139314_i32
    WHvArm64RegisterIdRes63El1 = 139315_i32
    WHvArm64RegisterIdRes64El1 = 139316_i32
    WHvArm64RegisterIdRes65El1 = 139317_i32
    WHvArm64RegisterIdRes66El1 = 139318_i32
    WHvArm64RegisterIdRes67El1 = 139319_i32
    WHvArm64RegisterIdAa64Mmfr0El1 = 139320_i32
    WHvArm64RegisterIdAa64Mmfr1El1 = 139321_i32
    WHvArm64RegisterIdAa64Mmfr2El1 = 139322_i32
    WHvArm64RegisterIdAa64Mmfr3El1 = 139323_i32
    WHvArm64RegisterIdAa64Mmfr4El1 = 139324_i32
    WHvArm64RegisterIdRes75El1 = 139325_i32
    WHvArm64RegisterIdRes76El1 = 139326_i32
    WHvArm64RegisterIdRes77El1 = 139327_i32
    WHvArm64RegisterIdRes80El1 = 139328_i32
    WHvArm64RegisterIdRes81El1 = 139329_i32
    WHvArm64RegisterIdRes82El1 = 139330_i32
    WHvArm64RegisterIdRes83El1 = 139331_i32
    WHvArm64RegisterIdRes84El1 = 139332_i32
    WHvArm64RegisterIdRes85El1 = 139333_i32
    WHvArm64RegisterIdRes86El1 = 139334_i32
    WHvArm64RegisterIdRes87El1 = 139335_i32
    WHvArm64RegisterIdRes90El1 = 139336_i32
    WHvArm64RegisterIdRes91El1 = 139337_i32
    WHvArm64RegisterIdRes92El1 = 139338_i32
    WHvArm64RegisterIdRes93El1 = 139339_i32
    WHvArm64RegisterIdRes94El1 = 139340_i32
    WHvArm64RegisterIdRes95El1 = 139341_i32
    WHvArm64RegisterIdRes96El1 = 139342_i32
    WHvArm64RegisterIdRes97El1 = 139343_i32
    WHvArm64RegisterIdRes100El1 = 139344_i32
    WHvArm64RegisterIdRes101El1 = 139345_i32
    WHvArm64RegisterIdRes102El1 = 139346_i32
    WHvArm64RegisterIdRes103El1 = 139347_i32
    WHvArm64RegisterIdRes104El1 = 139348_i32
    WHvArm64RegisterIdRes105El1 = 139349_i32
    WHvArm64RegisterIdRes106El1 = 139350_i32
    WHvArm64RegisterIdRes107El1 = 139351_i32
    WHvArm64RegisterIdRes110El1 = 139352_i32
    WHvArm64RegisterIdRes111El1 = 139353_i32
    WHvArm64RegisterIdRes112El1 = 139354_i32
    WHvArm64RegisterIdRes113El1 = 139355_i32
    WHvArm64RegisterIdRes114El1 = 139356_i32
    WHvArm64RegisterIdRes115El1 = 139357_i32
    WHvArm64RegisterIdRes116El1 = 139358_i32
    WHvArm64RegisterIdRes117El1 = 139359_i32
    WHvArm64RegisterIdRes120El1 = 139360_i32
    WHvArm64RegisterIdRes121El1 = 139361_i32
    WHvArm64RegisterIdRes122El1 = 139362_i32
    WHvArm64RegisterIdRes123El1 = 139363_i32
    WHvArm64RegisterIdRes124El1 = 139364_i32
    WHvArm64RegisterIdRes125El1 = 139365_i32
    WHvArm64RegisterIdRes126El1 = 139366_i32
    WHvArm64RegisterIdRes127El1 = 139367_i32
    WHvArm64RegisterIdRes130El1 = 139368_i32
    WHvArm64RegisterIdRes131El1 = 139369_i32
    WHvArm64RegisterIdRes132El1 = 139370_i32
    WHvArm64RegisterIdRes133El1 = 139371_i32
    WHvArm64RegisterIdRes134El1 = 139372_i32
    WHvArm64RegisterIdRes135El1 = 139373_i32
    WHvArm64RegisterIdRes136El1 = 139374_i32
    WHvArm64RegisterIdRes137El1 = 139375_i32
    WHvArm64RegisterIdRes140El1 = 139376_i32
    WHvArm64RegisterIdRes141El1 = 139377_i32
    WHvArm64RegisterIdRes142El1 = 139378_i32
    WHvArm64RegisterIdRes143El1 = 139379_i32
    WHvArm64RegisterIdRes144El1 = 139380_i32
    WHvArm64RegisterIdRes145El1 = 139381_i32
    WHvArm64RegisterIdRes146El1 = 139382_i32
    WHvArm64RegisterIdRes147El1 = 139383_i32
    WHvArm64RegisterIdRes150El1 = 139384_i32
    WHvArm64RegisterIdRes151El1 = 139385_i32
    WHvArm64RegisterIdRes152El1 = 139386_i32
    WHvArm64RegisterIdRes153El1 = 139387_i32
    WHvArm64RegisterIdRes154El1 = 139388_i32
    WHvArm64RegisterIdRes155El1 = 139389_i32
    WHvArm64RegisterIdRes156El1 = 139390_i32
    WHvArm64RegisterIdRes157El1 = 139391_i32
    WHvArm64RegisterActlrEl1 = 262147_i32
    WHvArm64RegisterApdAKeyHiEl1 = 262182_i32
    WHvArm64RegisterApdAKeyLoEl1 = 262183_i32
    WHvArm64RegisterApdBKeyHiEl1 = 262184_i32
    WHvArm64RegisterApdBKeyLoEl1 = 262185_i32
    WHvArm64RegisterApgAKeyHiEl1 = 262186_i32
    WHvArm64RegisterApgAKeyLoEl1 = 262187_i32
    WHvArm64RegisterApiAKeyHiEl1 = 262188_i32
    WHvArm64RegisterApiAKeyLoEl1 = 262189_i32
    WHvArm64RegisterApiBKeyHiEl1 = 262190_i32
    WHvArm64RegisterApiBKeyLoEl1 = 262191_i32
    WHvArm64RegisterContextidrEl1 = 262157_i32
    WHvArm64RegisterCpacrEl1 = 262148_i32
    WHvArm64RegisterCsselrEl1 = 262197_i32
    WHvArm64RegisterEsrEl1 = 262152_i32
    WHvArm64RegisterFarEl1 = 262153_i32
    WHvArm64RegisterMairEl1 = 262155_i32
    WHvArm64RegisterMidrEl1 = 262225_i32
    WHvArm64RegisterMpidrEl1 = 262145_i32
    WHvArm64RegisterParEl1 = 262154_i32
    WHvArm64RegisterSctlrEl1 = 262146_i32
    WHvArm64RegisterSmcrEl1 = 262237_i32
    WHvArm64RegisterSmidrEl1 = 262239_i32
    WHvArm64RegisterSmpriEl1 = 262240_i32
    WHvArm64RegisterSvcr = 262274_i32
    WHvArm64RegisterTcrEl1 = 262151_i32
    WHvArm64RegisterTpidr2El0 = 262246_i32
    WHvArm64RegisterTpidrEl0 = 262161_i32
    WHvArm64RegisterTpidrEl1 = 262158_i32
    WHvArm64RegisterTpidrroEl0 = 262160_i32
    WHvArm64RegisterTtbr0El1 = 262149_i32
    WHvArm64RegisterTtbr1El1 = 262150_i32
    WHvArm64RegisterVbarEl1 = 262156_i32
    WHvArm64RegisterZcrEl1 = 262257_i32
    WHvArm64RegisterDbgbcr0El1 = 327680_i32
    WHvArm64RegisterDbgbcr1El1 = 327681_i32
    WHvArm64RegisterDbgbcr2El1 = 327682_i32
    WHvArm64RegisterDbgbcr3El1 = 327683_i32
    WHvArm64RegisterDbgbcr4El1 = 327684_i32
    WHvArm64RegisterDbgbcr5El1 = 327685_i32
    WHvArm64RegisterDbgbcr6El1 = 327686_i32
    WHvArm64RegisterDbgbcr7El1 = 327687_i32
    WHvArm64RegisterDbgbcr8El1 = 327688_i32
    WHvArm64RegisterDbgbcr9El1 = 327689_i32
    WHvArm64RegisterDbgbcr10El1 = 327690_i32
    WHvArm64RegisterDbgbcr11El1 = 327691_i32
    WHvArm64RegisterDbgbcr12El1 = 327692_i32
    WHvArm64RegisterDbgbcr13El1 = 327693_i32
    WHvArm64RegisterDbgbcr14El1 = 327694_i32
    WHvArm64RegisterDbgbcr15El1 = 327695_i32
    WHvArm64RegisterDbgbvr0El1 = 327712_i32
    WHvArm64RegisterDbgbvr1El1 = 327713_i32
    WHvArm64RegisterDbgbvr2El1 = 327714_i32
    WHvArm64RegisterDbgbvr3El1 = 327715_i32
    WHvArm64RegisterDbgbvr4El1 = 327716_i32
    WHvArm64RegisterDbgbvr5El1 = 327717_i32
    WHvArm64RegisterDbgbvr6El1 = 327718_i32
    WHvArm64RegisterDbgbvr7El1 = 327719_i32
    WHvArm64RegisterDbgbvr8El1 = 327720_i32
    WHvArm64RegisterDbgbvr9El1 = 327721_i32
    WHvArm64RegisterDbgbvr10El1 = 327722_i32
    WHvArm64RegisterDbgbvr11El1 = 327723_i32
    WHvArm64RegisterDbgbvr12El1 = 327724_i32
    WHvArm64RegisterDbgbvr13El1 = 327725_i32
    WHvArm64RegisterDbgbvr14El1 = 327726_i32
    WHvArm64RegisterDbgbvr15El1 = 327727_i32
    WHvArm64RegisterDbgprcrEl1 = 327749_i32
    WHvArm64RegisterDbgwcr0El1 = 327696_i32
    WHvArm64RegisterDbgwcr1El1 = 327697_i32
    WHvArm64RegisterDbgwcr2El1 = 327698_i32
    WHvArm64RegisterDbgwcr3El1 = 327699_i32
    WHvArm64RegisterDbgwcr4El1 = 327700_i32
    WHvArm64RegisterDbgwcr5El1 = 327701_i32
    WHvArm64RegisterDbgwcr6El1 = 327702_i32
    WHvArm64RegisterDbgwcr7El1 = 327703_i32
    WHvArm64RegisterDbgwcr8El1 = 327704_i32
    WHvArm64RegisterDbgwcr9El1 = 327705_i32
    WHvArm64RegisterDbgwcr10El1 = 327706_i32
    WHvArm64RegisterDbgwcr11El1 = 327707_i32
    WHvArm64RegisterDbgwcr12El1 = 327708_i32
    WHvArm64RegisterDbgwcr13El1 = 327709_i32
    WHvArm64RegisterDbgwcr14El1 = 327710_i32
    WHvArm64RegisterDbgwcr15El1 = 327711_i32
    WHvArm64RegisterDbgwvr0El1 = 327728_i32
    WHvArm64RegisterDbgwvr1El1 = 327729_i32
    WHvArm64RegisterDbgwvr2El1 = 327730_i32
    WHvArm64RegisterDbgwvr3El1 = 327731_i32
    WHvArm64RegisterDbgwvr4El1 = 327732_i32
    WHvArm64RegisterDbgwvr5El1 = 327733_i32
    WHvArm64RegisterDbgwvr6El1 = 327734_i32
    WHvArm64RegisterDbgwvr7El1 = 327735_i32
    WHvArm64RegisterDbgwvr8El1 = 327736_i32
    WHvArm64RegisterDbgwvr9El1 = 327737_i32
    WHvArm64RegisterDbgwvr10El1 = 327738_i32
    WHvArm64RegisterDbgwvr11El1 = 327739_i32
    WHvArm64RegisterDbgwvr12El1 = 327740_i32
    WHvArm64RegisterDbgwvr13El1 = 327741_i32
    WHvArm64RegisterDbgwvr14El1 = 327742_i32
    WHvArm64RegisterDbgwvr15El1 = 327743_i32
    WHvArm64RegisterMdrarEl1 = 327756_i32
    WHvArm64RegisterMdscrEl1 = 327757_i32
    WHvArm64RegisterOsdlrEl1 = 327758_i32
    WHvArm64RegisterOslarEl1 = 327762_i32
    WHvArm64RegisterOslsrEl1 = 327763_i32
    WHvArm64RegisterPmccfiltrEl0 = 335872_i32
    WHvArm64RegisterPmccntrEl0 = 335873_i32
    WHvArm64RegisterPmceid0El0 = 335874_i32
    WHvArm64RegisterPmceid1El0 = 335875_i32
    WHvArm64RegisterPmcntenclrEl0 = 335876_i32
    WHvArm64RegisterPmcntensetEl0 = 335877_i32
    WHvArm64RegisterPmcrEl0 = 335878_i32
    WHvArm64RegisterPmevcntr0El0 = 335879_i32
    WHvArm64RegisterPmevcntr1El0 = 335880_i32
    WHvArm64RegisterPmevcntr2El0 = 335881_i32
    WHvArm64RegisterPmevcntr3El0 = 335882_i32
    WHvArm64RegisterPmevcntr4El0 = 335883_i32
    WHvArm64RegisterPmevcntr5El0 = 335884_i32
    WHvArm64RegisterPmevcntr6El0 = 335885_i32
    WHvArm64RegisterPmevcntr7El0 = 335886_i32
    WHvArm64RegisterPmevcntr8El0 = 335887_i32
    WHvArm64RegisterPmevcntr9El0 = 335888_i32
    WHvArm64RegisterPmevcntr10El0 = 335889_i32
    WHvArm64RegisterPmevcntr11El0 = 335890_i32
    WHvArm64RegisterPmevcntr12El0 = 335891_i32
    WHvArm64RegisterPmevcntr13El0 = 335892_i32
    WHvArm64RegisterPmevcntr14El0 = 335893_i32
    WHvArm64RegisterPmevcntr15El0 = 335894_i32
    WHvArm64RegisterPmevcntr16El0 = 335895_i32
    WHvArm64RegisterPmevcntr17El0 = 335896_i32
    WHvArm64RegisterPmevcntr18El0 = 335897_i32
    WHvArm64RegisterPmevcntr19El0 = 335898_i32
    WHvArm64RegisterPmevcntr20El0 = 335899_i32
    WHvArm64RegisterPmevcntr21El0 = 335900_i32
    WHvArm64RegisterPmevcntr22El0 = 335901_i32
    WHvArm64RegisterPmevcntr23El0 = 335902_i32
    WHvArm64RegisterPmevcntr24El0 = 335903_i32
    WHvArm64RegisterPmevcntr25El0 = 335904_i32
    WHvArm64RegisterPmevcntr26El0 = 335905_i32
    WHvArm64RegisterPmevcntr27El0 = 335906_i32
    WHvArm64RegisterPmevcntr28El0 = 335907_i32
    WHvArm64RegisterPmevcntr29El0 = 335908_i32
    WHvArm64RegisterPmevcntr30El0 = 335909_i32
    WHvArm64RegisterPmevtyper0El0 = 335910_i32
    WHvArm64RegisterPmevtyper1El0 = 335911_i32
    WHvArm64RegisterPmevtyper2El0 = 335912_i32
    WHvArm64RegisterPmevtyper3El0 = 335913_i32
    WHvArm64RegisterPmevtyper4El0 = 335914_i32
    WHvArm64RegisterPmevtyper5El0 = 335915_i32
    WHvArm64RegisterPmevtyper6El0 = 335916_i32
    WHvArm64RegisterPmevtyper7El0 = 335917_i32
    WHvArm64RegisterPmevtyper8El0 = 335918_i32
    WHvArm64RegisterPmevtyper9El0 = 335919_i32
    WHvArm64RegisterPmevtyper10El0 = 335920_i32
    WHvArm64RegisterPmevtyper11El0 = 335921_i32
    WHvArm64RegisterPmevtyper12El0 = 335922_i32
    WHvArm64RegisterPmevtyper13El0 = 335923_i32
    WHvArm64RegisterPmevtyper14El0 = 335924_i32
    WHvArm64RegisterPmevtyper15El0 = 335925_i32
    WHvArm64RegisterPmevtyper16El0 = 335926_i32
    WHvArm64RegisterPmevtyper17El0 = 335927_i32
    WHvArm64RegisterPmevtyper18El0 = 335928_i32
    WHvArm64RegisterPmevtyper19El0 = 335929_i32
    WHvArm64RegisterPmevtyper20El0 = 335930_i32
    WHvArm64RegisterPmevtyper21El0 = 335931_i32
    WHvArm64RegisterPmevtyper22El0 = 335932_i32
    WHvArm64RegisterPmevtyper23El0 = 335933_i32
    WHvArm64RegisterPmevtyper24El0 = 335934_i32
    WHvArm64RegisterPmevtyper25El0 = 335935_i32
    WHvArm64RegisterPmevtyper26El0 = 335936_i32
    WHvArm64RegisterPmevtyper27El0 = 335937_i32
    WHvArm64RegisterPmevtyper28El0 = 335938_i32
    WHvArm64RegisterPmevtyper29El0 = 335939_i32
    WHvArm64RegisterPmevtyper30El0 = 335940_i32
    WHvArm64RegisterPmintenclrEl1 = 335941_i32
    WHvArm64RegisterPmintensetEl1 = 335942_i32
    WHvArm64RegisterPmovsclrEl0 = 335944_i32
    WHvArm64RegisterPmovssetEl0 = 335945_i32
    WHvArm64RegisterPmselrEl0 = 335946_i32
    WHvArm64RegisterPmuserenrEl0 = 335948_i32
    WHvArm64RegisterCntkctlEl1 = 360456_i32
    WHvArm64RegisterCntvCtlEl0 = 360462_i32
    WHvArm64RegisterCntvCvalEl0 = 360463_i32
    WHvArm64RegisterCntvctEl0 = 360465_i32
    WHvArm64RegisterGicrBaseGpa = 405504_i32
    WHvRegisterSint0 = 655360_i32
    WHvRegisterSint1 = 655361_i32
    WHvRegisterSint2 = 655362_i32
    WHvRegisterSint3 = 655363_i32
    WHvRegisterSint4 = 655364_i32
    WHvRegisterSint5 = 655365_i32
    WHvRegisterSint6 = 655366_i32
    WHvRegisterSint7 = 655367_i32
    WHvRegisterSint8 = 655368_i32
    WHvRegisterSint9 = 655369_i32
    WHvRegisterSint10 = 655370_i32
    WHvRegisterSint11 = 655371_i32
    WHvRegisterSint12 = 655372_i32
    WHvRegisterSint13 = 655373_i32
    WHvRegisterSint14 = 655374_i32
    WHvRegisterSint15 = 655375_i32
    WHvRegisterScontrol = 655376_i32
    WHvRegisterSversion = 655377_i32
    WHvRegisterSifp = 655378_i32
    WHvRegisterSipp = 655379_i32
    WHvRegisterEom = 655380_i32
    WHvRegisterHypervisorVersion = 256_i32
    WHvRegisterPrivilegesAndFeaturesInfo = 512_i32
    WHvRegisterFeaturesInfo = 513_i32
    WHvRegisterImplementationLimitsInfo = 514_i32
    WHvRegisterHardwareFeaturesInfo = 515_i32
    WHvRegisterCpuManagementFeaturesInfo = 516_i32
    WHvRegisterPasidFeaturesInfo = 517_i32
    WHvRegisterGuestCrashP0 = 528_i32
    WHvRegisterGuestCrashP1 = 529_i32
    WHvRegisterGuestCrashP2 = 530_i32
    WHvRegisterGuestCrashP3 = 531_i32
    WHvRegisterGuestCrashP4 = 532_i32
    WHvRegisterGuestCrashCtl = 533_i32
    WHvRegisterVpRuntime = 589824_i32
    WHvRegisterGuestOsId = 589826_i32
    WHvRegisterVpAssistPage = 589843_i32
    WHvArm64RegisterPartitionInfoPage = 589845_i32
    WHvRegisterReferenceTsc = 589847_i32
    WHvRegisterReferenceTscSequence = 589850_i32
    WHvRegisterPendingEvent0 = 65540_i32
    WHvRegisterPendingEvent1 = 65541_i32
    WHvRegisterDeliverabilityNotifications = 65542_i32
    WHvRegisterInternalActivityState = 4_i32
    WHvRegisterPendingEvent2 = 65544_i32
    WHvRegisterPendingEvent3 = 65545_i32
  end
  enum WHV_ARM64_PENDING_EVENT_TYPE
    WHvArm64PendingEventException = 0_i32
    WHvArm64PendingEventSyntheticException = 1_i32
  end
  enum WHV_ARM64_SYNTHETIC_EXCEPTION_TYPE
    WHvArm64SyntheticExceptionTypeSmc = 0_i32
    WHvArm64SyntheticExceptionTypeSecure = 1_i32
    WHvArm64SyntheticExceptionTypeCrashdump = 2_i32
    WHvArm64SyntheticExceptionTypeVirtualizationFault = 3_i32
    WHvArm64SyntheticExceptionTypeMax = 64_i32
  end
  enum WHV_CAPABILITY_CODE
    WHvCapabilityCodeHypervisorPresent = 0_i32
    WHvCapabilityCodeFeatures = 1_i32
    WHvCapabilityCodeExtendedVmExits = 2_i32
    WHvCapabilityCodeGpaRangePopulateFlags = 5_i32
    WHvCapabilityCodeSchedulerFeatures = 6_i32
    WHvCapabilityCodeProcessorVendor = 4096_i32
    WHvCapabilityCodeProcessorFeatures = 4097_i32
    WHvCapabilityCodeProcessorClFlushSize = 4098_i32
    WHvCapabilityCodeProcessorClockFrequency = 4100_i32
    WHvCapabilityCodeProcessorFeaturesBanks = 4102_i32
    WHvCapabilityCodeProcessorFrequencyCap = 4103_i32
    WHvCapabilityCodeSyntheticProcessorFeaturesBanks = 4104_i32
    WHvCapabilityCodePhysicalAddressWidth = 4106_i32
    WHvCapabilityCodeGicLpiIntIdBits = 8209_i32
    WHvCapabilityCodeMaxSveVectorLength = 8210_i32
    WHvCapabilityCodeMaxSmeStreamingVectorLength = 8211_i32
  end
  enum WHV_PARTITION_PROPERTY_CODE
    WHvPartitionPropertyCodeExtendedVmExits = 1_i32
    WHvPartitionPropertyCodeSeparateSecurityDomain = 3_i32
    WHvPartitionPropertyCodeNestedVirtualization = 4_i32
    WHvPartitionPropertyCodePrimaryNumaNode = 6_i32
    WHvPartitionPropertyCodeCpuReserve = 7_i32
    WHvPartitionPropertyCodeCpuCap = 8_i32
    WHvPartitionPropertyCodeCpuWeight = 9_i32
    WHvPartitionPropertyCodeCpuGroupId = 10_i32
    WHvPartitionPropertyCodeProcessorFrequencyCap = 11_i32
    WHvPartitionPropertyCodeAllowDeviceAssignment = 12_i32
    WHvPartitionPropertyCodeDisableSmt = 13_i32
    WHvPartitionPropertyCodeProcessorFeatures = 4097_i32
    WHvPartitionPropertyCodeProcessorClFlushSize = 4098_i32
    WHvPartitionPropertyCodeProcessorClockFrequency = 4103_i32
    WHvPartitionPropertyCodeProcessorFeaturesBanks = 4106_i32
    WHvPartitionPropertyCodeReferenceTime = 4107_i32
    WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks = 4108_i32
    WHvPartitionPropertyCodePhysicalAddressWidth = 4113_i32
    WHvPartitionPropertyCodeArm64IcParameters = 4114_i32
    WHvPartitionPropertyCodeProcessorCount = 8191_i32
  end
  @[Flags]
  enum WHV_TRANSLATE_GVA_FLAGS
    WHvTranslateGvaFlagNone = 0_i32
    WHvTranslateGvaFlagValidateRead = 1_i32
    WHvTranslateGvaFlagValidateWrite = 2_i32
    WHvTranslateGvaFlagValidateExecute = 4_i32
    WHvTranslateGvaFlagSetPageTableBits = 16_i32
  end
  enum WHV_CACHE_TYPE
    WHvCacheTypeUncached = 0_i32
    WHvCacheTypeWriteCombining = 1_i32
    WHvCacheTypeWriteThrough = 4_i32
    WHvCacheTypeWriteBack = 6_i32
  end
  enum WHV_ARM64_IC_EMULATION_MODE
    WHvArm64IcEmulationModeNone = 0_i32
    WHvArm64IcEmulationModeGicV3 = 1_i32
  end
  enum WHV_RUN_VP_EXIT_REASON
    WHvRunVpExitReasonNone = 0_i32
    WHvRunVpExitReasonUnmappedGpa = -2147483648_i32
    WHvRunVpExitReasonGpaIntercept = -2147483647_i32
    WHvRunVpExitReasonUnrecoverableException = -2147483615_i32
    WHvRunVpExitReasonInvalidVpRegisterValue = -2147483616_i32
    WHvRunVpExitReasonUnsupportedFeature = -2147483614_i32
    WHvRunVpExitReasonSynicSintDeliverable = -2147483550_i32
    WHvMessageTypeRegisterIntercept = -2147418106_i32
    WHvRunVpExitReasonArm64Reset = -2147418100_i32
    WHvRunVpExitReasonHypercall = -2147483568_i32
    WHvRunVpExitReasonCanceled = -1_i32
  end
  enum WHV_ARM64_RESET_TYPE
    WHvArm64ResetTypePowerOff = 0_i32
    WHvArm64ResetTypeReboot = 1_i32
  end
  enum WHV_INTERRUPT_TYPE
    WHvArm64InterruptTypeFixed = 0_i32
    WHvArm64InterruptTypeMaximum = 8_i32
  end
  enum WHV_PROCESSOR_COUNTER_SET
    WHvProcessorCounterSetRuntime = 0_i32
    WHvProcessorCounterSetIntercepts = 1_i32
    WHvProcessorCounterSetEvents = 2_i32
    WHvProcessorCounterSetSyntheticFeatures = 4_i32
  end
  enum WHV_VIRTUAL_PROCESSOR_STATE_TYPE
    WHvVirtualProcessorStateTypeInterruptControllerState = -2147483648_i32
    WHvVirtualProcessorStateTypeSynicMessagePage = -2147483646_i32
    WHvVirtualProcessorStateTypeSynicEventFlagPage = -2147483645_i32
    WHvVirtualProcessorStateTypeSynicTimerState = 4_i32
    WHvVirtualProcessorStateTypeGlobalInterruptState = -1073741818_i32
    WHvVirtualProcessorStateTypeSveState = -2147483641_i32
    WHvVirtualProcessorStateTypeSmeState = -2147483640_i32
  end
  enum WHV_TRIGGER_TYPE
    WHvTriggerTypeSynicEvent = 1_i32
    WHvTriggerTypeDeviceInterrupt = 2_i32
  end
  enum WHV_REGISTER_NAME
    WHvX64RegisterRax = 0_i32
    WHvX64RegisterRcx = 1_i32
    WHvX64RegisterRdx = 2_i32
    WHvX64RegisterRbx = 3_i32
    WHvX64RegisterRsp = 4_i32
    WHvX64RegisterRbp = 5_i32
    WHvX64RegisterRsi = 6_i32
    WHvX64RegisterRdi = 7_i32
    WHvX64RegisterR8 = 8_i32
    WHvX64RegisterR9 = 9_i32
    WHvX64RegisterR10 = 10_i32
    WHvX64RegisterR11 = 11_i32
    WHvX64RegisterR12 = 12_i32
    WHvX64RegisterR13 = 13_i32
    WHvX64RegisterR14 = 14_i32
    WHvX64RegisterR15 = 15_i32
    WHvX64RegisterRip = 16_i32
    WHvX64RegisterRflags = 17_i32
    WHvX64RegisterEs = 18_i32
    WHvX64RegisterCs = 19_i32
    WHvX64RegisterSs = 20_i32
    WHvX64RegisterDs = 21_i32
    WHvX64RegisterFs = 22_i32
    WHvX64RegisterGs = 23_i32
    WHvX64RegisterLdtr = 24_i32
    WHvX64RegisterTr = 25_i32
    WHvX64RegisterIdtr = 26_i32
    WHvX64RegisterGdtr = 27_i32
    WHvX64RegisterCr0 = 28_i32
    WHvX64RegisterCr2 = 29_i32
    WHvX64RegisterCr3 = 30_i32
    WHvX64RegisterCr4 = 31_i32
    WHvX64RegisterCr8 = 32_i32
    WHvX64RegisterDr0 = 33_i32
    WHvX64RegisterDr1 = 34_i32
    WHvX64RegisterDr2 = 35_i32
    WHvX64RegisterDr3 = 36_i32
    WHvX64RegisterDr6 = 37_i32
    WHvX64RegisterDr7 = 38_i32
    WHvX64RegisterXCr0 = 39_i32
    WHvX64RegisterVirtualCr0 = 40_i32
    WHvX64RegisterVirtualCr3 = 41_i32
    WHvX64RegisterVirtualCr4 = 42_i32
    WHvX64RegisterVirtualCr8 = 43_i32
    WHvX64RegisterXmm0 = 4096_i32
    WHvX64RegisterXmm1 = 4097_i32
    WHvX64RegisterXmm2 = 4098_i32
    WHvX64RegisterXmm3 = 4099_i32
    WHvX64RegisterXmm4 = 4100_i32
    WHvX64RegisterXmm5 = 4101_i32
    WHvX64RegisterXmm6 = 4102_i32
    WHvX64RegisterXmm7 = 4103_i32
    WHvX64RegisterXmm8 = 4104_i32
    WHvX64RegisterXmm9 = 4105_i32
    WHvX64RegisterXmm10 = 4106_i32
    WHvX64RegisterXmm11 = 4107_i32
    WHvX64RegisterXmm12 = 4108_i32
    WHvX64RegisterXmm13 = 4109_i32
    WHvX64RegisterXmm14 = 4110_i32
    WHvX64RegisterXmm15 = 4111_i32
    WHvX64RegisterFpMmx0 = 4112_i32
    WHvX64RegisterFpMmx1 = 4113_i32
    WHvX64RegisterFpMmx2 = 4114_i32
    WHvX64RegisterFpMmx3 = 4115_i32
    WHvX64RegisterFpMmx4 = 4116_i32
    WHvX64RegisterFpMmx5 = 4117_i32
    WHvX64RegisterFpMmx6 = 4118_i32
    WHvX64RegisterFpMmx7 = 4119_i32
    WHvX64RegisterFpControlStatus = 4120_i32
    WHvX64RegisterXmmControlStatus = 4121_i32
    WHvX64RegisterTsc = 8192_i32
    WHvX64RegisterEfer = 8193_i32
    WHvX64RegisterKernelGsBase = 8194_i32
    WHvX64RegisterApicBase = 8195_i32
    WHvX64RegisterPat = 8196_i32
    WHvX64RegisterSysenterCs = 8197_i32
    WHvX64RegisterSysenterEip = 8198_i32
    WHvX64RegisterSysenterEsp = 8199_i32
    WHvX64RegisterStar = 8200_i32
    WHvX64RegisterLstar = 8201_i32
    WHvX64RegisterCstar = 8202_i32
    WHvX64RegisterSfmask = 8203_i32
    WHvX64RegisterInitialApicId = 8204_i32
    WHvX64RegisterMsrMtrrCap = 8205_i32
    WHvX64RegisterMsrMtrrDefType = 8206_i32
    WHvX64RegisterMsrMtrrPhysBase0 = 8208_i32
    WHvX64RegisterMsrMtrrPhysBase1 = 8209_i32
    WHvX64RegisterMsrMtrrPhysBase2 = 8210_i32
    WHvX64RegisterMsrMtrrPhysBase3 = 8211_i32
    WHvX64RegisterMsrMtrrPhysBase4 = 8212_i32
    WHvX64RegisterMsrMtrrPhysBase5 = 8213_i32
    WHvX64RegisterMsrMtrrPhysBase6 = 8214_i32
    WHvX64RegisterMsrMtrrPhysBase7 = 8215_i32
    WHvX64RegisterMsrMtrrPhysBase8 = 8216_i32
    WHvX64RegisterMsrMtrrPhysBase9 = 8217_i32
    WHvX64RegisterMsrMtrrPhysBaseA = 8218_i32
    WHvX64RegisterMsrMtrrPhysBaseB = 8219_i32
    WHvX64RegisterMsrMtrrPhysBaseC = 8220_i32
    WHvX64RegisterMsrMtrrPhysBaseD = 8221_i32
    WHvX64RegisterMsrMtrrPhysBaseE = 8222_i32
    WHvX64RegisterMsrMtrrPhysBaseF = 8223_i32
    WHvX64RegisterMsrMtrrPhysMask0 = 8256_i32
    WHvX64RegisterMsrMtrrPhysMask1 = 8257_i32
    WHvX64RegisterMsrMtrrPhysMask2 = 8258_i32
    WHvX64RegisterMsrMtrrPhysMask3 = 8259_i32
    WHvX64RegisterMsrMtrrPhysMask4 = 8260_i32
    WHvX64RegisterMsrMtrrPhysMask5 = 8261_i32
    WHvX64RegisterMsrMtrrPhysMask6 = 8262_i32
    WHvX64RegisterMsrMtrrPhysMask7 = 8263_i32
    WHvX64RegisterMsrMtrrPhysMask8 = 8264_i32
    WHvX64RegisterMsrMtrrPhysMask9 = 8265_i32
    WHvX64RegisterMsrMtrrPhysMaskA = 8266_i32
    WHvX64RegisterMsrMtrrPhysMaskB = 8267_i32
    WHvX64RegisterMsrMtrrPhysMaskC = 8268_i32
    WHvX64RegisterMsrMtrrPhysMaskD = 8269_i32
    WHvX64RegisterMsrMtrrPhysMaskE = 8270_i32
    WHvX64RegisterMsrMtrrPhysMaskF = 8271_i32
    WHvX64RegisterMsrMtrrFix64k00000 = 8304_i32
    WHvX64RegisterMsrMtrrFix16k80000 = 8305_i32
    WHvX64RegisterMsrMtrrFix16kA0000 = 8306_i32
    WHvX64RegisterMsrMtrrFix4kC0000 = 8307_i32
    WHvX64RegisterMsrMtrrFix4kC8000 = 8308_i32
    WHvX64RegisterMsrMtrrFix4kD0000 = 8309_i32
    WHvX64RegisterMsrMtrrFix4kD8000 = 8310_i32
    WHvX64RegisterMsrMtrrFix4kE0000 = 8311_i32
    WHvX64RegisterMsrMtrrFix4kE8000 = 8312_i32
    WHvX64RegisterMsrMtrrFix4kF0000 = 8313_i32
    WHvX64RegisterMsrMtrrFix4kF8000 = 8314_i32
    WHvX64RegisterTscAux = 8315_i32
    WHvX64RegisterBndcfgs = 8316_i32
    WHvX64RegisterMCount = 8318_i32
    WHvX64RegisterACount = 8319_i32
    WHvX64RegisterSpecCtrl = 8324_i32
    WHvX64RegisterPredCmd = 8325_i32
    WHvX64RegisterTscVirtualOffset = 8327_i32
    WHvX64RegisterTsxCtrl = 8328_i32
    WHvX64RegisterXss = 8331_i32
    WHvX64RegisterUCet = 8332_i32
    WHvX64RegisterSCet = 8333_i32
    WHvX64RegisterSsp = 8334_i32
    WHvX64RegisterPl0Ssp = 8335_i32
    WHvX64RegisterPl1Ssp = 8336_i32
    WHvX64RegisterPl2Ssp = 8337_i32
    WHvX64RegisterPl3Ssp = 8338_i32
    WHvX64RegisterInterruptSspTableAddr = 8339_i32
    WHvX64RegisterTscDeadline = 8341_i32
    WHvX64RegisterTscAdjust = 8342_i32
    WHvX64RegisterUmwaitControl = 8344_i32
    WHvX64RegisterXfd = 8345_i32
    WHvX64RegisterXfdErr = 8346_i32
    WHvX64RegisterMsrIa32MiscEnable = 8352_i32
    WHvX64RegisterIa32FeatureControl = 8353_i32
    WHvX64RegisterIa32VmxBasic = 8354_i32
    WHvX64RegisterIa32VmxPinbasedCtls = 8355_i32
    WHvX64RegisterIa32VmxProcbasedCtls = 8356_i32
    WHvX64RegisterIa32VmxExitCtls = 8357_i32
    WHvX64RegisterIa32VmxEntryCtls = 8358_i32
    WHvX64RegisterIa32VmxMisc = 8359_i32
    WHvX64RegisterIa32VmxCr0Fixed0 = 8360_i32
    WHvX64RegisterIa32VmxCr0Fixed1 = 8361_i32
    WHvX64RegisterIa32VmxCr4Fixed0 = 8362_i32
    WHvX64RegisterIa32VmxCr4Fixed1 = 8363_i32
    WHvX64RegisterIa32VmxVmcsEnum = 8364_i32
    WHvX64RegisterIa32VmxProcbasedCtls2 = 8365_i32
    WHvX64RegisterIa32VmxEptVpidCap = 8366_i32
    WHvX64RegisterIa32VmxTruePinbasedCtls = 8367_i32
    WHvX64RegisterIa32VmxTrueProcbasedCtls = 8368_i32
    WHvX64RegisterIa32VmxTrueExitCtls = 8369_i32
    WHvX64RegisterIa32VmxTrueEntryCtls = 8370_i32
    WHvX64RegisterAmdVmHsavePa = 8371_i32
    WHvX64RegisterAmdVmCr = 8372_i32
    WHvX64RegisterApicId = 12290_i32
    WHvX64RegisterApicVersion = 12291_i32
    WHvX64RegisterApicTpr = 12296_i32
    WHvX64RegisterApicPpr = 12298_i32
    WHvX64RegisterApicEoi = 12299_i32
    WHvX64RegisterApicLdr = 12301_i32
    WHvX64RegisterApicSpurious = 12303_i32
    WHvX64RegisterApicIsr0 = 12304_i32
    WHvX64RegisterApicIsr1 = 12305_i32
    WHvX64RegisterApicIsr2 = 12306_i32
    WHvX64RegisterApicIsr3 = 12307_i32
    WHvX64RegisterApicIsr4 = 12308_i32
    WHvX64RegisterApicIsr5 = 12309_i32
    WHvX64RegisterApicIsr6 = 12310_i32
    WHvX64RegisterApicIsr7 = 12311_i32
    WHvX64RegisterApicTmr0 = 12312_i32
    WHvX64RegisterApicTmr1 = 12313_i32
    WHvX64RegisterApicTmr2 = 12314_i32
    WHvX64RegisterApicTmr3 = 12315_i32
    WHvX64RegisterApicTmr4 = 12316_i32
    WHvX64RegisterApicTmr5 = 12317_i32
    WHvX64RegisterApicTmr6 = 12318_i32
    WHvX64RegisterApicTmr7 = 12319_i32
    WHvX64RegisterApicIrr0 = 12320_i32
    WHvX64RegisterApicIrr1 = 12321_i32
    WHvX64RegisterApicIrr2 = 12322_i32
    WHvX64RegisterApicIrr3 = 12323_i32
    WHvX64RegisterApicIrr4 = 12324_i32
    WHvX64RegisterApicIrr5 = 12325_i32
    WHvX64RegisterApicIrr6 = 12326_i32
    WHvX64RegisterApicIrr7 = 12327_i32
    WHvX64RegisterApicEse = 12328_i32
    WHvX64RegisterApicIcr = 12336_i32
    WHvX64RegisterApicLvtTimer = 12338_i32
    WHvX64RegisterApicLvtThermal = 12339_i32
    WHvX64RegisterApicLvtPerfmon = 12340_i32
    WHvX64RegisterApicLvtLint0 = 12341_i32
    WHvX64RegisterApicLvtLint1 = 12342_i32
    WHvX64RegisterApicLvtError = 12343_i32
    WHvX64RegisterApicInitCount = 12344_i32
    WHvX64RegisterApicCurrentCount = 12345_i32
    WHvX64RegisterApicDivide = 12350_i32
    WHvX64RegisterApicSelfIpi = 12351_i32
    WHvRegisterSint0 = 16384_i32
    WHvRegisterSint1 = 16385_i32
    WHvRegisterSint2 = 16386_i32
    WHvRegisterSint3 = 16387_i32
    WHvRegisterSint4 = 16388_i32
    WHvRegisterSint5 = 16389_i32
    WHvRegisterSint6 = 16390_i32
    WHvRegisterSint7 = 16391_i32
    WHvRegisterSint8 = 16392_i32
    WHvRegisterSint9 = 16393_i32
    WHvRegisterSint10 = 16394_i32
    WHvRegisterSint11 = 16395_i32
    WHvRegisterSint12 = 16396_i32
    WHvRegisterSint13 = 16397_i32
    WHvRegisterSint14 = 16398_i32
    WHvRegisterSint15 = 16399_i32
    WHvRegisterScontrol = 16400_i32
    WHvRegisterSversion = 16401_i32
    WHvRegisterSiefp = 16402_i32
    WHvRegisterSimp = 16403_i32
    WHvRegisterEom = 16404_i32
    WHvRegisterVpRuntime = 20480_i32
    WHvX64RegisterHypercall = 20481_i32
    WHvRegisterGuestOsId = 20482_i32
    WHvRegisterVpAssistPage = 20499_i32
    WHvRegisterReferenceTsc = 20503_i32
    WHvRegisterReferenceTscSequence = 20506_i32
    WHvX64RegisterNestedGuestState = 20560_i32
    WHvX64RegisterNestedCurrentVmGpa = 20561_i32
    WHvX64RegisterNestedVmxInvEpt = 20562_i32
    WHvX64RegisterNestedVmxInvVpid = 20563_i32
    WHvRegisterPendingInterruption = -2147483648_i32
    WHvRegisterInterruptState = -2147483647_i32
    WHvRegisterPendingEvent = -2147483646_i32
    WHvRegisterPendingEvent1 = -2147483645_i32
    WHvX64RegisterDeliverabilityNotifications = -2147483644_i32
    WHvRegisterDeliverabilityNotifications = -2147483644_i32
    WHvRegisterInternalActivityState = -2147483643_i32
    WHvX64RegisterPendingDebugException = -2147483642_i32
    WHvRegisterPendingEvent2 = -2147483641_i32
    WHvRegisterPendingEvent3 = -2147483640_i32
  end
  enum WHV_X64_PENDING_EVENT_TYPE
    WHvX64PendingEventException = 0_i32
    WHvX64PendingEventExtInt = 5_i32
    WHvX64PendingEventSvmNestedExit = 7_i32
    WHvX64PendingEventVmxNestedExit = 8_i32
  end
  enum WHV_CAPABILITY_CODE
    WHvCapabilityCodeHypervisorPresent = 0_i32
    WHvCapabilityCodeFeatures = 1_i32
    WHvCapabilityCodeExtendedVmExits = 2_i32
    WHvCapabilityCodeExceptionExitBitmap = 3_i32
    WHvCapabilityCodeX64MsrExitBitmap = 4_i32
    WHvCapabilityCodeGpaRangePopulateFlags = 5_i32
    WHvCapabilityCodeSchedulerFeatures = 6_i32
    WHvCapabilityCodeProcessorVendor = 4096_i32
    WHvCapabilityCodeProcessorFeatures = 4097_i32
    WHvCapabilityCodeProcessorClFlushSize = 4098_i32
    WHvCapabilityCodeProcessorXsaveFeatures = 4099_i32
    WHvCapabilityCodeProcessorClockFrequency = 4100_i32
    WHvCapabilityCodeInterruptClockFrequency = 4101_i32
    WHvCapabilityCodeProcessorFeaturesBanks = 4102_i32
    WHvCapabilityCodeProcessorFrequencyCap = 4103_i32
    WHvCapabilityCodeSyntheticProcessorFeaturesBanks = 4104_i32
    WHvCapabilityCodeProcessorPerfmonFeatures = 4105_i32
    WHvCapabilityCodePhysicalAddressWidth = 4106_i32
    WHvCapabilityCodeVmxBasic = 8192_i32
    WHvCapabilityCodeVmxPinbasedCtls = 8193_i32
    WHvCapabilityCodeVmxProcbasedCtls = 8194_i32
    WHvCapabilityCodeVmxExitCtls = 8195_i32
    WHvCapabilityCodeVmxEntryCtls = 8196_i32
    WHvCapabilityCodeVmxMisc = 8197_i32
    WHvCapabilityCodeVmxCr0Fixed0 = 8198_i32
    WHvCapabilityCodeVmxCr0Fixed1 = 8199_i32
    WHvCapabilityCodeVmxCr4Fixed0 = 8200_i32
    WHvCapabilityCodeVmxCr4Fixed1 = 8201_i32
    WHvCapabilityCodeVmxVmcsEnum = 8202_i32
    WHvCapabilityCodeVmxProcbasedCtls2 = 8203_i32
    WHvCapabilityCodeVmxEptVpidCap = 8204_i32
    WHvCapabilityCodeVmxTruePinbasedCtls = 8205_i32
    WHvCapabilityCodeVmxTrueProcbasedCtls = 8206_i32
    WHvCapabilityCodeVmxTrueExitCtls = 8207_i32
    WHvCapabilityCodeVmxTrueEntryCtls = 8208_i32
  end
  enum WHV_PROCESSOR_VENDOR
    WHvProcessorVendorAmd = 0_i32
    WHvProcessorVendorIntel = 1_i32
    WHvProcessorVendorHygon = 2_i32
    WHvProcessorVendorArm = 16_i32
  end
  enum WHV_PARTITION_PROPERTY_CODE
    WHvPartitionPropertyCodeExtendedVmExits = 1_i32
    WHvPartitionPropertyCodeExceptionExitBitmap = 2_i32
    WHvPartitionPropertyCodeSeparateSecurityDomain = 3_i32
    WHvPartitionPropertyCodeNestedVirtualization = 4_i32
    WHvPartitionPropertyCodeX64MsrExitBitmap = 5_i32
    WHvPartitionPropertyCodePrimaryNumaNode = 6_i32
    WHvPartitionPropertyCodeCpuReserve = 7_i32
    WHvPartitionPropertyCodeCpuCap = 8_i32
    WHvPartitionPropertyCodeCpuWeight = 9_i32
    WHvPartitionPropertyCodeCpuGroupId = 10_i32
    WHvPartitionPropertyCodeProcessorFrequencyCap = 11_i32
    WHvPartitionPropertyCodeAllowDeviceAssignment = 12_i32
    WHvPartitionPropertyCodeDisableSmt = 13_i32
    WHvPartitionPropertyCodeProcessorFeatures = 4097_i32
    WHvPartitionPropertyCodeProcessorClFlushSize = 4098_i32
    WHvPartitionPropertyCodeCpuidExitList = 4099_i32
    WHvPartitionPropertyCodeCpuidResultList = 4100_i32
    WHvPartitionPropertyCodeLocalApicEmulationMode = 4101_i32
    WHvPartitionPropertyCodeProcessorXsaveFeatures = 4102_i32
    WHvPartitionPropertyCodeProcessorClockFrequency = 4103_i32
    WHvPartitionPropertyCodeInterruptClockFrequency = 4104_i32
    WHvPartitionPropertyCodeApicRemoteReadSupport = 4105_i32
    WHvPartitionPropertyCodeProcessorFeaturesBanks = 4106_i32
    WHvPartitionPropertyCodeReferenceTime = 4107_i32
    WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks = 4108_i32
    WHvPartitionPropertyCodeCpuidResultList2 = 4109_i32
    WHvPartitionPropertyCodeProcessorPerfmonFeatures = 4110_i32
    WHvPartitionPropertyCodeMsrActionList = 4111_i32
    WHvPartitionPropertyCodeUnimplementedMsrAction = 4112_i32
    WHvPartitionPropertyCodePhysicalAddressWidth = 4113_i32
    WHvPartitionPropertyCodeProcessorCount = 8191_i32
  end
  @[Flags]
  enum WHV_MAP_GPA_RANGE_FLAGS
    WHvMapGpaRangeFlagNone = 0_i32
    WHvMapGpaRangeFlagRead = 1_i32
    WHvMapGpaRangeFlagWrite = 2_i32
    WHvMapGpaRangeFlagExecute = 4_i32
    WHvMapGpaRangeFlagTrackDirtyPages = 8_i32
  end
  @[Flags]
  enum WHV_TRANSLATE_GVA_FLAGS
    WHvTranslateGvaFlagNone = 0_i32
    WHvTranslateGvaFlagValidateRead = 1_i32
    WHvTranslateGvaFlagValidateWrite = 2_i32
    WHvTranslateGvaFlagValidateExecute = 4_i32
    WHvTranslateGvaFlagPrivilegeExempt = 8_i32
    WHvTranslateGvaFlagSetPageTableBits = 16_i32
    WHvTranslateGvaFlagEnforceSmap = 256_i32
    WHvTranslateGvaFlagOverrideSmap = 512_i32
  end
  enum WHV_TRANSLATE_GVA_RESULT_CODE
    WHvTranslateGvaResultSuccess = 0_i32
    WHvTranslateGvaResultPageNotPresent = 1_i32
    WHvTranslateGvaResultPrivilegeViolation = 2_i32
    WHvTranslateGvaResultInvalidPageTableFlags = 3_i32
    WHvTranslateGvaResultGpaUnmapped = 4_i32
    WHvTranslateGvaResultGpaNoReadAccess = 5_i32
    WHvTranslateGvaResultGpaNoWriteAccess = 6_i32
    WHvTranslateGvaResultGpaIllegalOverlayAccess = 7_i32
    WHvTranslateGvaResultIntercept = 8_i32
  end
  enum WHV_MEMORY_ACCESS_TYPE
    WHvMemoryAccessRead = 0_i32
    WHvMemoryAccessWrite = 1_i32
    WHvMemoryAccessExecute = 2_i32
  end
  enum WHV_CACHE_TYPE
    WHvCacheTypeUncached = 0_i32
    WHvCacheTypeWriteCombining = 1_i32
    WHvCacheTypeWriteThrough = 4_i32
    WHvCacheTypeWriteProtected = 5_i32
    WHvCacheTypeWriteBack = 6_i32
  end
  @[Flags]
  enum WHV_X64_CPUID_RESULT2_FLAGS
    WHvX64CpuidResult2FlagSubleafSpecific = 1_i32
    WHvX64CpuidResult2FlagVpSpecific = 2_i32
  end
  enum WHV_MSR_ACTION
    WHvMsrActionArchitectureDefault = 0_i32
    WHvMsrActionIgnoreWriteReadZero = 1_i32
    WHvMsrActionExit = 2_i32
  end
  enum WHV_EXCEPTION_TYPE
    WHvX64ExceptionTypeDivideErrorFault = 0_i32
    WHvX64ExceptionTypeDebugTrapOrFault = 1_i32
    WHvX64ExceptionTypeBreakpointTrap = 3_i32
    WHvX64ExceptionTypeOverflowTrap = 4_i32
    WHvX64ExceptionTypeBoundRangeFault = 5_i32
    WHvX64ExceptionTypeInvalidOpcodeFault = 6_i32
    WHvX64ExceptionTypeDeviceNotAvailableFault = 7_i32
    WHvX64ExceptionTypeDoubleFaultAbort = 8_i32
    WHvX64ExceptionTypeInvalidTaskStateSegmentFault = 10_i32
    WHvX64ExceptionTypeSegmentNotPresentFault = 11_i32
    WHvX64ExceptionTypeStackFault = 12_i32
    WHvX64ExceptionTypeGeneralProtectionFault = 13_i32
    WHvX64ExceptionTypePageFault = 14_i32
    WHvX64ExceptionTypeFloatingPointErrorFault = 16_i32
    WHvX64ExceptionTypeAlignmentCheckFault = 17_i32
    WHvX64ExceptionTypeMachineCheckAbort = 18_i32
    WHvX64ExceptionTypeSimdFloatingPointFault = 19_i32
    WHvX64ExceptionTypeControlProtectionFault = 21_i32
  end
  enum WHV_X64_LOCAL_APIC_EMULATION_MODE
    WHvX64LocalApicEmulationModeNone = 0_i32
    WHvX64LocalApicEmulationModeXApic = 1_i32
    WHvX64LocalApicEmulationModeX2Apic = 2_i32
  end
  enum WHV_RUN_VP_EXIT_REASON
    WHvRunVpExitReasonNone = 0_i32
    WHvRunVpExitReasonMemoryAccess = 1_i32
    WHvRunVpExitReasonX64IoPortAccess = 2_i32
    WHvRunVpExitReasonUnrecoverableException = 4_i32
    WHvRunVpExitReasonInvalidVpRegisterValue = 5_i32
    WHvRunVpExitReasonUnsupportedFeature = 6_i32
    WHvRunVpExitReasonX64InterruptWindow = 7_i32
    WHvRunVpExitReasonX64Halt = 8_i32
    WHvRunVpExitReasonX64ApicEoi = 9_i32
    WHvRunVpExitReasonSynicSintDeliverable = 10_i32
    WHvRunVpExitReasonX64MsrAccess = 4096_i32
    WHvRunVpExitReasonX64Cpuid = 4097_i32
    WHvRunVpExitReasonException = 4098_i32
    WHvRunVpExitReasonX64Rdtsc = 4099_i32
    WHvRunVpExitReasonX64ApicSmiTrap = 4100_i32
    WHvRunVpExitReasonHypercall = 4101_i32
    WHvRunVpExitReasonX64ApicInitSipiTrap = 4102_i32
    WHvRunVpExitReasonX64ApicWriteTrap = 4103_i32
    WHvRunVpExitReasonCanceled = 8193_i32
  end
  enum WHV_X64_UNSUPPORTED_FEATURE_CODE
    WHvUnsupportedFeatureIntercept = 1_i32
    WHvUnsupportedFeatureTaskSwitchTss = 2_i32
  end
  enum WHV_RUN_VP_CANCEL_REASON
    WHvRunVpCancelReasonUser = 0_i32
  end
  enum WHV_X64_PENDING_INTERRUPTION_TYPE
    WHvX64PendingInterrupt = 0_i32
    WHvX64PendingNmi = 2_i32
    WHvX64PendingException = 3_i32
  end
  enum WHV_X64_APIC_WRITE_TYPE
    WHvX64ApicWriteTypeLdr = 208_i32
    WHvX64ApicWriteTypeDfr = 224_i32
    WHvX64ApicWriteTypeSvr = 240_i32
    WHvX64ApicWriteTypeLint0 = 848_i32
    WHvX64ApicWriteTypeLint1 = 864_i32
  end
  enum WHV_INTERRUPT_TYPE
    WHvX64InterruptTypeFixed = 0_i32
    WHvX64InterruptTypeLowestPriority = 1_i32
    WHvX64InterruptTypeNmi = 4_i32
    WHvX64InterruptTypeInit = 5_i32
    WHvX64InterruptTypeSipi = 6_i32
    WHvX64InterruptTypeLocalInt1 = 9_i32
  end
  enum WHV_INTERRUPT_DESTINATION_MODE
    WHvX64InterruptDestinationModePhysical = 0_i32
    WHvX64InterruptDestinationModeLogical = 1_i32
  end
  enum WHV_INTERRUPT_TRIGGER_MODE
    WHvX64InterruptTriggerModeEdge = 0_i32
    WHvX64InterruptTriggerModeLevel = 1_i32
  end
  enum WHV_PARTITION_COUNTER_SET
    WHvPartitionCounterSetMemory = 0_i32
  end
  enum WHV_PROCESSOR_COUNTER_SET
    WHvProcessorCounterSetRuntime = 0_i32
    WHvProcessorCounterSetIntercepts = 1_i32
    WHvProcessorCounterSetEvents = 2_i32
    WHvProcessorCounterSetApic = 3_i32
    WHvProcessorCounterSetSyntheticFeatures = 4_i32
  end
  enum WHV_ADVISE_GPA_RANGE_CODE
    WHvAdviseGpaRangeCodePopulate = 0_i32
    WHvAdviseGpaRangeCodePin = 1_i32
    WHvAdviseGpaRangeCodeUnpin = 2_i32
  end
  enum WHV_VIRTUAL_PROCESSOR_STATE_TYPE
    WHvVirtualProcessorStateTypeSynicMessagePage = 0_i32
    WHvVirtualProcessorStateTypeSynicEventFlagPage = 1_i32
    WHvVirtualProcessorStateTypeSynicTimerState = 2_i32
    WHvVirtualProcessorStateTypeInterruptControllerState2 = 4096_i32
    WHvVirtualProcessorStateTypeXsaveState = 4097_i32
    WHvVirtualProcessorStateTypeNestedState = 4098_i32
  end
  enum WHV_NESTED_STATE_TYPE
    WHvNestedStateTypeVmx = 0_i32
    WHvNestedStateTypeSvm = 1_i32
  end
  @[Flags]
  enum WHV_ALLOCATE_VPCI_RESOURCE_FLAGS
    WHvAllocateVpciResourceFlagNone = 0_i32
    WHvAllocateVpciResourceFlagAllowDirectP2P = 1_i32
  end
  enum WHV_VPCI_DEVICE_NOTIFICATION_TYPE
    WHvVpciDeviceNotificationUndefined = 0_i32
    WHvVpciDeviceNotificationMmioRemapping = 1_i32
    WHvVpciDeviceNotificationSurpriseRemoval = 2_i32
  end
  @[Flags]
  enum WHV_CREATE_VPCI_DEVICE_FLAGS
    WHvCreateVpciDeviceFlagNone = 0_i32
    WHvCreateVpciDeviceFlagPhysicallyBacked = 1_i32
    WHvCreateVpciDeviceFlagUseLogicalInterrupts = 2_i32
  end
  enum WHV_VPCI_DEVICE_PROPERTY_CODE
    WHvVpciDevicePropertyCodeUndefined = 0_i32
    WHvVpciDevicePropertyCodeHardwareIDs = 1_i32
    WHvVpciDevicePropertyCodeProbedBARs = 2_i32
  end
  @[Flags]
  enum WHV_VPCI_MMIO_RANGE_FLAGS
    WHvVpciMmioRangeFlagReadAccess = 1_i32
    WHvVpciMmioRangeFlagWriteAccess = 2_i32
  end
  enum WHV_VPCI_DEVICE_REGISTER_SPACE
    WHvVpciConfigSpace = -1_i32
    WHvVpciBar0 = 0_i32
    WHvVpciBar1 = 1_i32
    WHvVpciBar2 = 2_i32
    WHvVpciBar3 = 3_i32
    WHvVpciBar4 = 4_i32
    WHvVpciBar5 = 5_i32
  end
  @[Flags]
  enum WHV_VPCI_INTERRUPT_TARGET_FLAGS
    WHvVpciInterruptTargetFlagNone = 0_i32
    WHvVpciInterruptTargetFlagMulticast = 1_i32
  end
  enum WHV_TRIGGER_TYPE
    WHvTriggerTypeInterrupt = 0_i32
    WHvTriggerTypeSynicEvent = 1_i32
    WHvTriggerTypeDeviceInterrupt = 2_i32
  end
  enum WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE
    WHvVirtualProcessorPropertyCodeNumaNode = 0_i32
  end
  enum WHV_NOTIFICATION_PORT_TYPE
    WHvNotificationPortTypeEvent = 2_i32
    WHvNotificationPortTypeDoorbell = 4_i32
  end
  enum WHV_NOTIFICATION_PORT_PROPERTY_CODE
    WHvNotificationPortPropertyPreferredTargetVp = 1_i32
    WHvNotificationPortPropertyPreferredTargetDuration = 5_i32
  end
  enum HDV_DEVICE_TYPE
    HdvDeviceTypeUndefined = 0_i32
    HdvDeviceTypePCI = 1_i32
  end
  @[Flags]
  enum HDV_DEVICE_HOST_FLAGS
    HdvDeviceHostFlagNone = 0_i32
    HdvDeviceHostFlagInitializeComSecurity = 1_i32
  end
  enum HDV_PCI_BAR_SELECTOR
    HDV_PCI_BAR0 = 0_i32
    HDV_PCI_BAR1 = 1_i32
    HDV_PCI_BAR2 = 2_i32
    HDV_PCI_BAR3 = 3_i32
    HDV_PCI_BAR4 = 4_i32
    HDV_PCI_BAR5 = 5_i32
  end
  enum HDV_DOORBELL_FLAGS
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY = 0_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE = 1_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD = 2_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD = 3_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD = 4_i32
    HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE = -2147483648_i32
  end
  @[Flags]
  enum HDV_MMIO_MAPPING_FLAGS
    HdvMmioMappingFlagNone = 0_i32
    HdvMmioMappingFlagWriteable = 1_i32
    HdvMmioMappingFlagExecutable = 2_i32
  end
  enum HDV_PCI_INTERFACE_VERSION
    HdvPciDeviceInterfaceVersionInvalid = 0_i32
    HdvPciDeviceInterfaceVersion1 = 1_i32
  end
  enum PAGING_MODE
    Paging_Invalid = 0_i32
    Paging_NonPaged = 1_i32
    Paging_32Bit = 2_i32
    Paging_Pae = 3_i32
    Paging_Long = 4_i32
    Paging_Armv8 = 5_i32
  end
  enum VIRTUAL_PROCESSOR_ARCH
    Arch_Unknown = 0_i32
    Arch_x86 = 1_i32
    Arch_x64 = 2_i32
    Arch_Armv8 = 3_i32
  end
  enum VIRTUAL_PROCESSOR_VENDOR
    ProcessorVendor_Unknown = 0_i32
    ProcessorVendor_Amd = 1_i32
    ProcessorVendor_Intel = 2_i32
    ProcessorVendor_Hygon = 3_i32
    ProcessorVendor_Arm = 4_i32
  end
  enum GUEST_OS_VENDOR
    GuestOsVendorUndefined = 0_i32
    GuestOsVendorMicrosoft = 1_i32
    GuestOsVendorHPE = 2_i32
    GuestOsVendorLANCOM = 512_i32
  end
  enum GUEST_OS_MICROSOFT_IDS
    GuestOsMicrosoftUndefined = 0_i32
    GuestOsMicrosoftMSDOS = 1_i32
    GuestOsMicrosoftWindows3x = 2_i32
    GuestOsMicrosoftWindows9x = 3_i32
    GuestOsMicrosoftWindowsNT = 4_i32
    GuestOsMicrosoftWindowsCE = 5_i32
  end
  enum GUEST_OS_OPENSOURCE_IDS
    GuestOsOpenSourceUndefined = 0_i32
    GuestOsOpenSourceLinux = 1_i32
    GuestOsOpenSourceFreeBSD = 2_i32
    GuestOsOpenSourceXen = 3_i32
    GuestOsOpenSourceIllumos = 4_i32
  end
  enum REGISTER_ID
    X64_RegisterRax = 0_i32
    X64_RegisterRcx = 1_i32
    X64_RegisterRdx = 2_i32
    X64_RegisterRbx = 3_i32
    X64_RegisterRsp = 4_i32
    X64_RegisterRbp = 5_i32
    X64_RegisterRsi = 6_i32
    X64_RegisterRdi = 7_i32
    X64_RegisterR8 = 8_i32
    X64_RegisterR9 = 9_i32
    X64_RegisterR10 = 10_i32
    X64_RegisterR11 = 11_i32
    X64_RegisterR12 = 12_i32
    X64_RegisterR13 = 13_i32
    X64_RegisterR14 = 14_i32
    X64_RegisterR15 = 15_i32
    X64_RegisterRip = 16_i32
    X64_RegisterRFlags = 17_i32
    X64_RegisterXmm0 = 18_i32
    X64_RegisterXmm1 = 19_i32
    X64_RegisterXmm2 = 20_i32
    X64_RegisterXmm3 = 21_i32
    X64_RegisterXmm4 = 22_i32
    X64_RegisterXmm5 = 23_i32
    X64_RegisterXmm6 = 24_i32
    X64_RegisterXmm7 = 25_i32
    X64_RegisterXmm8 = 26_i32
    X64_RegisterXmm9 = 27_i32
    X64_RegisterXmm10 = 28_i32
    X64_RegisterXmm11 = 29_i32
    X64_RegisterXmm12 = 30_i32
    X64_RegisterXmm13 = 31_i32
    X64_RegisterXmm14 = 32_i32
    X64_RegisterXmm15 = 33_i32
    X64_RegisterFpMmx0 = 34_i32
    X64_RegisterFpMmx1 = 35_i32
    X64_RegisterFpMmx2 = 36_i32
    X64_RegisterFpMmx3 = 37_i32
    X64_RegisterFpMmx4 = 38_i32
    X64_RegisterFpMmx5 = 39_i32
    X64_RegisterFpMmx6 = 40_i32
    X64_RegisterFpMmx7 = 41_i32
    X64_RegisterFpControlStatus = 42_i32
    X64_RegisterXmmControlStatus = 43_i32
    X64_RegisterCr0 = 44_i32
    X64_RegisterCr2 = 45_i32
    X64_RegisterCr3 = 46_i32
    X64_RegisterCr4 = 47_i32
    X64_RegisterCr8 = 48_i32
    X64_RegisterEfer = 49_i32
    X64_RegisterDr0 = 50_i32
    X64_RegisterDr1 = 51_i32
    X64_RegisterDr2 = 52_i32
    X64_RegisterDr3 = 53_i32
    X64_RegisterDr6 = 54_i32
    X64_RegisterDr7 = 55_i32
    X64_RegisterEs = 56_i32
    X64_RegisterCs = 57_i32
    X64_RegisterSs = 58_i32
    X64_RegisterDs = 59_i32
    X64_RegisterFs = 60_i32
    X64_RegisterGs = 61_i32
    X64_RegisterLdtr = 62_i32
    X64_RegisterTr = 63_i32
    X64_RegisterIdtr = 64_i32
    X64_RegisterGdtr = 65_i32
    X64_RegisterMax = 66_i32
    ARM64_RegisterX0 = 67_i32
    ARM64_RegisterX1 = 68_i32
    ARM64_RegisterX2 = 69_i32
    ARM64_RegisterX3 = 70_i32
    ARM64_RegisterX4 = 71_i32
    ARM64_RegisterX5 = 72_i32
    ARM64_RegisterX6 = 73_i32
    ARM64_RegisterX7 = 74_i32
    ARM64_RegisterX8 = 75_i32
    ARM64_RegisterX9 = 76_i32
    ARM64_RegisterX10 = 77_i32
    ARM64_RegisterX11 = 78_i32
    ARM64_RegisterX12 = 79_i32
    ARM64_RegisterX13 = 80_i32
    ARM64_RegisterX14 = 81_i32
    ARM64_RegisterX15 = 82_i32
    ARM64_RegisterX16 = 83_i32
    ARM64_RegisterX17 = 84_i32
    ARM64_RegisterX18 = 85_i32
    ARM64_RegisterX19 = 86_i32
    ARM64_RegisterX20 = 87_i32
    ARM64_RegisterX21 = 88_i32
    ARM64_RegisterX22 = 89_i32
    ARM64_RegisterX23 = 90_i32
    ARM64_RegisterX24 = 91_i32
    ARM64_RegisterX25 = 92_i32
    ARM64_RegisterX26 = 93_i32
    ARM64_RegisterX27 = 94_i32
    ARM64_RegisterX28 = 95_i32
    ARM64_RegisterXFp = 96_i32
    ARM64_RegisterXLr = 97_i32
    ARM64_RegisterPc = 98_i32
    ARM64_RegisterSpEl0 = 99_i32
    ARM64_RegisterSpEl1 = 100_i32
    ARM64_RegisterCpsr = 101_i32
    ARM64_RegisterQ0 = 102_i32
    ARM64_RegisterQ1 = 103_i32
    ARM64_RegisterQ2 = 104_i32
    ARM64_RegisterQ3 = 105_i32
    ARM64_RegisterQ4 = 106_i32
    ARM64_RegisterQ5 = 107_i32
    ARM64_RegisterQ6 = 108_i32
    ARM64_RegisterQ7 = 109_i32
    ARM64_RegisterQ8 = 110_i32
    ARM64_RegisterQ9 = 111_i32
    ARM64_RegisterQ10 = 112_i32
    ARM64_RegisterQ11 = 113_i32
    ARM64_RegisterQ12 = 114_i32
    ARM64_RegisterQ13 = 115_i32
    ARM64_RegisterQ14 = 116_i32
    ARM64_RegisterQ15 = 117_i32
    ARM64_RegisterQ16 = 118_i32
    ARM64_RegisterQ17 = 119_i32
    ARM64_RegisterQ18 = 120_i32
    ARM64_RegisterQ19 = 121_i32
    ARM64_RegisterQ20 = 122_i32
    ARM64_RegisterQ21 = 123_i32
    ARM64_RegisterQ22 = 124_i32
    ARM64_RegisterQ23 = 125_i32
    ARM64_RegisterQ24 = 126_i32
    ARM64_RegisterQ25 = 127_i32
    ARM64_RegisterQ26 = 128_i32
    ARM64_RegisterQ27 = 129_i32
    ARM64_RegisterQ28 = 130_i32
    ARM64_RegisterQ29 = 131_i32
    ARM64_RegisterQ30 = 132_i32
    ARM64_RegisterQ31 = 133_i32
    ARM64_RegisterFpStatus = 134_i32
    ARM64_RegisterFpControl = 135_i32
    ARM64_RegisterEsrEl1 = 136_i32
    ARM64_RegisterSpsrEl1 = 137_i32
    ARM64_RegisterFarEl1 = 138_i32
    ARM64_RegisterParEl1 = 139_i32
    ARM64_RegisterElrEl1 = 140_i32
    ARM64_RegisterTtbr0El1 = 141_i32
    ARM64_RegisterTtbr1El1 = 142_i32
    ARM64_RegisterVbarEl1 = 143_i32
    ARM64_RegisterSctlrEl1 = 144_i32
    ARM64_RegisterActlrEl1 = 145_i32
    ARM64_RegisterTcrEl1 = 146_i32
    ARM64_RegisterMairEl1 = 147_i32
    ARM64_RegisterAmairEl1 = 148_i32
    ARM64_RegisterTpidrEl0 = 149_i32
    ARM64_RegisterTpidrroEl0 = 150_i32
    ARM64_RegisterTpidrEl1 = 151_i32
    ARM64_RegisterContextIdrEl1 = 152_i32
    ARM64_RegisterCpacrEl1 = 153_i32
    ARM64_RegisterCsselrEl1 = 154_i32
    ARM64_RegisterCntkctlEl1 = 155_i32
    ARM64_RegisterCntvCvalEl0 = 156_i32
    ARM64_RegisterCntvCtlEl0 = 157_i32
    ARM64_RegisterMax = 158_i32
  end

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ARM64_PENDING_EXCEPTION_EVENT
    property as_uint64 : UInt64[3]
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    property reserved1 : UInt8
    property reserved2 : UInt16
    property reserved3 : UInt32
    property esr_elx : UInt64
    property far_elx : UInt64
    def initialize(@_bitfield : UInt8, @reserved1 : UInt8, @reserved2 : UInt16, @reserved3 : UInt32, @esr_elx : UInt64, @far_elx : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64[3], @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ARM64_PENDING_SYNTHETIC_EXCEPTION_EVENT
    property as_uint64 : UInt64[2]
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    property reserved1 : UInt8
    property reserved2 : UInt16
    property exception_type : UInt32
    property context : UInt64
    def initialize(@_bitfield : UInt8, @reserved1 : UInt8, @reserved2 : UInt16, @exception_type : UInt32, @context : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64[2], @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ARM64_PENDING_EVENT
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_
    property exception : Win32cr::System::Hypervisor::WHV_ARM64_PENDING_EXCEPTION_EVENT
    property synthetic_exception : Win32cr::System::Hypervisor::WHV_ARM64_PENDING_SYNTHETIC_EXCEPTION_EVENT

    # Nested Type Anonymous1_e__Struct_
    @[Extern]
    struct Anonymous1_e__Struct_
    property reg0 : Win32cr::System::Hypervisor::WHV_UINT128
    property reg1 : Win32cr::System::Hypervisor::WHV_UINT128
    def initialize(@reg0 : Win32cr::System::Hypervisor::WHV_UINT128, @reg1 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
    end


    # Nested Type Anonymous2_e__Struct_
    @[Extern]
    struct Anonymous2_e__Struct_
    property _bitfield : UInt8
    property event_data : UInt8[15]
    def initialize(@_bitfield : UInt8, @event_data : UInt8[15])
    end
    end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_, @exception : Win32cr::System::Hypervisor::WHV_ARM64_PENDING_EXCEPTION_EVENT, @synthetic_exception : Win32cr::System::Hypervisor::WHV_ARM64_PENDING_SYNTHETIC_EXCEPTION_EVENT)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_REGISTER_VALUE
    property reg128 : Win32cr::System::Hypervisor::WHV_UINT128
    property reg64 : UInt64
    property reg32 : UInt32
    property reg16 : UInt16
    property reg8 : UInt8
    property internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER
    property deliverability_notifications : Win32cr::System::Hypervisor::WHV_DELIVERABILITY_NOTIFICATIONS_REGISTER
    def initialize(@reg128 : Win32cr::System::Hypervisor::WHV_UINT128, @reg64 : UInt64, @reg32 : UInt32, @reg16 : UInt16, @reg8 : UInt8, @internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER, @deliverability_notifications : Win32cr::System::Hypervisor::WHV_DELIVERABILITY_NOTIFICATIONS_REGISTER)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ARM64_PROCESSOR_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ARM64_PROCESSOR_FEATURES1
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_INITIAL_VP_CONTEXT
    property pc : UInt64
    property sp_e_lh : UInt64
    property sctlr_el1 : UInt64
    property mair_el1 : UInt64
    property tcr_el1 : UInt64
    property vbar_el1 : UInt64
    property ttbr0_el1 : UInt64
    property ttbr1_el1 : UInt64
    property x18 : UInt64
    def initialize(@pc : UInt64, @sp_e_lh : UInt64, @sctlr_el1 : UInt64, @mair_el1 : UInt64, @tcr_el1 : UInt64, @vbar_el1 : UInt64, @ttbr0_el1 : UInt64, @ttbr1_el1 : UInt64, @x18 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_CAPABILITY
    property hypervisor_present : Win32cr::Foundation::BOOL
    property features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES
    property extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS
    property processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR
    property processor_features : Win32cr::System::Hypervisor::WHV_ARM64_PROCESSOR_FEATURES
    property synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property processor_cl_flush_size : UInt8
    property processor_clock_frequency : UInt64
    property processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS
    property gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    property scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES
    property physical_address_width : UInt32
    property nested_feature_register : UInt64
    property gic_lpi_int_id_bits : UInt32
    property max_sve_vector_length : UInt32
    property max_sme_streaming_vector_length : UInt32
    def initialize(@hypervisor_present : Win32cr::Foundation::BOOL, @features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES, @extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS, @processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR, @processor_features : Win32cr::System::Hypervisor::WHV_ARM64_PROCESSOR_FEATURES, @synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, @processor_cl_flush_size : UInt8, @processor_clock_frequency : UInt64, @processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS, @gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS, @processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP, @scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES, @physical_address_width : UInt32, @nested_feature_register : UInt64, @gic_lpi_int_id_bits : UInt32, @max_sve_vector_length : UInt32, @max_sme_streaming_vector_length : UInt32)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_IC_GIC_V3_PARAMETERS
    property gicd_base_address : UInt64
    property gits_translater_base_address : UInt64
    property reserved : UInt32
    property gic_lpi_int_id_bits : UInt32
    property gic_ppi_overflow_interrupt_from_cntv : UInt32
    property gic_ppi_performance_monitors_interrupt : UInt32
    property reserved1 : UInt32[6]
    def initialize(@gicd_base_address : UInt64, @gits_translater_base_address : UInt64, @reserved : UInt32, @gic_lpi_int_id_bits : UInt32, @gic_ppi_overflow_interrupt_from_cntv : UInt32, @gic_ppi_performance_monitors_interrupt : UInt32, @reserved1 : UInt32[6])
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_IC_PARAMETERS
    property emulation_mode : Win32cr::System::Hypervisor::WHV_ARM64_IC_EMULATION_MODE
    property reserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property gic_v3_parameters : Win32cr::System::Hypervisor::WHV_ARM64_IC_GIC_V3_PARAMETERS
    def initialize(@gic_v3_parameters : Win32cr::System::Hypervisor::WHV_ARM64_IC_GIC_V3_PARAMETERS)
    end
    end

    def initialize(@emulation_mode : Win32cr::System::Hypervisor::WHV_ARM64_IC_EMULATION_MODE, @reserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_PARTITION_PROPERTY
    property extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS
    property processor_features : Win32cr::System::Hypervisor::WHV_ARM64_PROCESSOR_FEATURES
    property synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property processor_cl_flush_size : UInt8
    property processor_count : UInt32
    property separate_security_domain : Win32cr::Foundation::BOOL
    property nested_virtualization : Win32cr::Foundation::BOOL
    property processor_clock_frequency : UInt64
    property processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS
    property reference_time : UInt64
    property primary_numa_node : UInt16
    property cpu_reserve : UInt32
    property cpu_cap : UInt32
    property cpu_weight : UInt32
    property cpu_group_id : UInt64
    property processor_frequency_cap : UInt32
    property allow_device_assignment : Win32cr::Foundation::BOOL
    property disable_smt : Win32cr::Foundation::BOOL
    property physical_address_width : UInt32
    property arm64_ic_parameters : Win32cr::System::Hypervisor::WHV_ARM64_IC_PARAMETERS
    def initialize(@extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS, @processor_features : Win32cr::System::Hypervisor::WHV_ARM64_PROCESSOR_FEATURES, @synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, @processor_cl_flush_size : UInt8, @processor_count : UInt32, @separate_security_domain : Win32cr::Foundation::BOOL, @nested_virtualization : Win32cr::Foundation::BOOL, @processor_clock_frequency : UInt64, @processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS, @reference_time : UInt64, @primary_numa_node : UInt16, @cpu_reserve : UInt32, @cpu_cap : UInt32, @cpu_weight : UInt32, @cpu_group_id : UInt64, @processor_frequency_cap : UInt32, @allow_device_assignment : Win32cr::Foundation::BOOL, @disable_smt : Win32cr::Foundation::BOOL, @physical_address_width : UInt32, @arm64_ic_parameters : Win32cr::System::Hypervisor::WHV_ARM64_IC_PARAMETERS)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_VP_EXECUTION_STATE
    property as_uint16 : UInt16
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
    end

    def initialize(@as_uint16 : UInt16, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_INTERCEPT_MESSAGE_HEADER
    property vp_index : UInt32
    property instruction_length : UInt8
    property intercept_access_type : UInt8
    property execution_state : Win32cr::System::Hypervisor::WHV_VP_EXECUTION_STATE
    property pc : UInt64
    property cpsr : UInt64
    def initialize(@vp_index : UInt32, @instruction_length : UInt8, @intercept_access_type : UInt8, @execution_state : Win32cr::System::Hypervisor::WHV_VP_EXECUTION_STATE, @pc : UInt64, @cpsr : UInt64)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_MEMORY_ACCESS_INFO
    property as_uint8 : UInt8
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@as_uint8 : UInt8, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_MEMORY_ACCESS_CONTEXT
    property header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER
    property reserved0 : UInt32
    property instruction_byte_count : UInt8
    property access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO
    property reserved1 : UInt16
    property instruction_bytes : UInt8[4]
    property reserved2 : UInt32
    property gva : UInt64
    property gpa : UInt64
    property syndrome : UInt64
    def initialize(@header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER, @reserved0 : UInt32, @instruction_byte_count : UInt8, @access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO, @reserved1 : UInt16, @instruction_bytes : UInt8[4], @reserved2 : UInt32, @gva : UInt64, @gpa : UInt64, @syndrome : UInt64)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_UNRECOVERABLE_EXCEPTION_CONTEXT
    property header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER
    def initialize(@header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_INVALID_VP_REGISTER_CONTEXT
    property vp_index : UInt32
    property reserved : UInt32
    def initialize(@vp_index : UInt32, @reserved : UInt32)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    property header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER
    property deliverable_sints : UInt16
    property reserved1 : UInt16
    property reserved2 : UInt32
    def initialize(@header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER, @deliverable_sints : UInt16, @reserved1 : UInt16, @reserved2 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_REGISTER_ACCESS_INFO
    property source_value : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE
    property destination_register : Win32cr::System::Hypervisor::WHV_REGISTER_NAME
    def initialize(@source_value : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE, @destination_register : Win32cr::System::Hypervisor::WHV_REGISTER_NAME)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_REGISTER_CONTEXT
    property header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER
    property anonymous : Anonymous_e__Struct_
    property reserved8 : UInt8
    property reserved16 : UInt16
    property register_name : Win32cr::System::Hypervisor::WHV_REGISTER_NAME
    property access_info : Win32cr::System::Hypervisor::WHV_REGISTER_ACCESS_INFO

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER, @anonymous : Anonymous_e__Struct_, @reserved8 : UInt8, @reserved16 : UInt16, @register_name : Win32cr::System::Hypervisor::WHV_REGISTER_NAME, @access_info : Win32cr::System::Hypervisor::WHV_REGISTER_ACCESS_INFO)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_RESET_CONTEXT
    property header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER
    property reset_type : Win32cr::System::Hypervisor::WHV_ARM64_RESET_TYPE
    property reserved : UInt32
    def initialize(@header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER, @reset_type : Win32cr::System::Hypervisor::WHV_ARM64_RESET_TYPE, @reserved : UInt32)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_HYPERCALL_CONTEXT
    property header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER
    property immediate : UInt16
    property reserved1 : UInt16
    property reserved2 : UInt32
    property x : UInt64[18]
    def initialize(@header : Win32cr::System::Hypervisor::WHV_INTERCEPT_MESSAGE_HEADER, @immediate : UInt16, @reserved1 : UInt16, @reserved2 : UInt32, @x : UInt64[18])
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_RUN_VP_EXIT_CONTEXT
    property exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON
    property reserved : UInt32
    property reserved1 : UInt64
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT
    property cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT
    property hypercall : Win32cr::System::Hypervisor::WHV_ARM64_HYPERCALL_CONTEXT
    property synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    property unrecoverable_exception : Win32cr::System::Hypervisor::WHV_UNRECOVERABLE_EXCEPTION_CONTEXT
    property invalid_vp_register : Win32cr::System::Hypervisor::WHV_INVALID_VP_REGISTER_CONTEXT
    property register : Win32cr::System::Hypervisor::WHV_REGISTER_CONTEXT
    property arm64_reset : Win32cr::System::Hypervisor::WHV_ARM64_RESET_CONTEXT
    property as_uint64 : UInt64[32]
    def initialize(@memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT, @cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT, @hypercall : Win32cr::System::Hypervisor::WHV_ARM64_HYPERCALL_CONTEXT, @synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT, @unrecoverable_exception : Win32cr::System::Hypervisor::WHV_UNRECOVERABLE_EXCEPTION_CONTEXT, @invalid_vp_register : Win32cr::System::Hypervisor::WHV_INVALID_VP_REGISTER_CONTEXT, @register : Win32cr::System::Hypervisor::WHV_REGISTER_CONTEXT, @arm64_reset : Win32cr::System::Hypervisor::WHV_ARM64_RESET_CONTEXT, @as_uint64 : UInt64[32])
    end
    end

    def initialize(@exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON, @reserved : UInt32, @reserved1 : UInt64, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_INTERRUPT_CONTROL2
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property interrupt_type : Win32cr::System::Hypervisor::WHV_INTERRUPT_TYPE
    property _bitfield : UInt32
    def initialize(@interrupt_type : Win32cr::System::Hypervisor::WHV_INTERRUPT_TYPE, @_bitfield : UInt32)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_INTERRUPT_CONTROL
    property target_partition : UInt64
    property interrupt_control : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL2
    property destination_address : UInt64
    property requested_vector : UInt32
    property target_vtl : UInt8
    property reserved_z0 : UInt8
    property reserved_z1 : UInt16
    def initialize(@target_partition : UInt64, @interrupt_control : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL2, @destination_address : UInt64, @requested_vector : UInt32, @target_vtl : UInt8, @reserved_z0 : UInt8, @reserved_z1 : UInt16)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_PROCESSOR_INTERCEPT_COUNTERS
    property other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property reserved : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER[10]
    def initialize(@other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @reserved : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER[10])
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_INTERRUPT_STATE
    property anonymous : Anonymous_e__Struct_
    property gicr_ipriorityr_configured : UInt8
    property gicr_ipriorityr_active : UInt8
    property reserved1 : UInt8

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @gicr_ipriorityr_configured : UInt8, @gicr_ipriorityr_active : UInt8, @reserved1 : UInt8)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_GLOBAL_INTERRUPT_STATE
    property interrupt_id : UInt32
    property active_vp_index : UInt32
    property anonymous : Anonymous_e__Union_
    property interrupt_state : Win32cr::System::Hypervisor::WHV_ARM64_INTERRUPT_STATE

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property target_mpidr : UInt32
    property target_vp_index : UInt32
    def initialize(@target_mpidr : UInt32, @target_vp_index : UInt32)
    end
    end

    def initialize(@interrupt_id : UInt32, @active_vp_index : UInt32, @anonymous : Anonymous_e__Union_, @interrupt_state : Win32cr::System::Hypervisor::WHV_ARM64_INTERRUPT_STATE)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_GLOBAL_INTERRUPT_CONTROLLER_STATE
    property version : UInt8
    property gic_version : UInt8
    property reserved0 : UInt8[2]
    property num_interrupts : UInt32
    property gicd_ctlr_enable_grp1_a : UInt64
    property interrupts : Win32cr::System::Hypervisor::WHV_ARM64_GLOBAL_INTERRUPT_STATE[1]
    def initialize(@version : UInt8, @gic_version : UInt8, @reserved0 : UInt8[2], @num_interrupts : UInt32, @gicd_ctlr_enable_grp1_a : UInt64, @interrupts : Win32cr::System::Hypervisor::WHV_ARM64_GLOBAL_INTERRUPT_STATE[1])
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_LOCAL_INTERRUPT_CONTROLLER_STATE
    property version : UInt8
    property gic_version : UInt8
    property reserved0 : UInt8[6]
    property icc_igrpen1_el1 : UInt64
    property gicr_ctlr_enable_lpis : UInt64
    property icc_bpr1_el1 : UInt64
    property icc_pmr_el1 : UInt64
    property gicr_propbaser : UInt64
    property gicr_pendbaser : UInt64
    property ich_ap1_r_el2 : UInt32[4]
    property banked_interrupt_state : Win32cr::System::Hypervisor::WHV_ARM64_INTERRUPT_STATE[32]
    def initialize(@version : UInt8, @gic_version : UInt8, @reserved0 : UInt8[6], @icc_igrpen1_el1 : UInt64, @gicr_ctlr_enable_lpis : UInt64, @icc_bpr1_el1 : UInt64, @icc_pmr_el1 : UInt64, @gicr_propbaser : UInt64, @gicr_pendbaser : UInt64, @ich_ap1_r_el2 : UInt32[4], @banked_interrupt_state : Win32cr::System::Hypervisor::WHV_ARM64_INTERRUPT_STATE[32])
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_VP_STATE_SVE
    property version : UInt16
    property register_data_offset : UInt16
    property vector_length : UInt32
    property reserved0 : UInt64
    def initialize(@version : UInt16, @register_data_offset : UInt16, @vector_length : UInt32, @reserved0 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:arm) %}
  @[Extern]
  struct WHV_ARM64_VP_STATE_SME
    property version : UInt16
    property register_data_offset : UInt16
    property streaming_vector_length : UInt32
    property reserved0 : UInt64
    def initialize(@version : UInt16, @register_data_offset : UInt16, @streaming_vector_length : UInt32, @reserved0 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_UINT128
    property anonymous : Anonymous_e__Struct_
    property dword : UInt32[4]

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property low64 : UInt64
    property high64 : UInt64
    def initialize(@low64 : UInt64, @high64 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @dword : UInt32[4])
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_FP_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property mantissa : UInt64
    property _bitfield : UInt64
    def initialize(@mantissa : UInt64, @_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_FP_CONTROL_STATUS_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property fp_control : UInt16
    property fp_status : UInt16
    property fp_tag : UInt8
    property reserved : UInt8
    property last_fp_op : UInt16
    property anonymous : Anonymous_e__Union_

      # Nested Type Anonymous_e__Union_
      @[Extern(union: true)]
      struct Anonymous_e__Union_
    property last_fp_rip : UInt64
    property anonymous : Anonymous_e__Struct_

        # Nested Type Anonymous_e__Struct_
        @[Extern]
        struct Anonymous_e__Struct_
    property last_fp_eip : UInt32
    property last_fp_cs : UInt16
    property reserved2 : UInt16
    def initialize(@last_fp_eip : UInt32, @last_fp_cs : UInt16, @reserved2 : UInt16)
    end
        end

    def initialize(@last_fp_rip : UInt64, @anonymous : Anonymous_e__Struct_)
    end
      end

    def initialize(@fp_control : UInt16, @fp_status : UInt16, @fp_tag : UInt8, @reserved : UInt8, @last_fp_op : UInt16, @anonymous : Anonymous_e__Union_)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_XMM_CONTROL_STATUS_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property anonymous : Anonymous_e__Union_
    property xmm_status_control : UInt32
    property xmm_status_control_mask : UInt32

      # Nested Type Anonymous_e__Union_
      @[Extern(union: true)]
      struct Anonymous_e__Union_
    property last_fp_rdp : UInt64
    property anonymous : Anonymous_e__Struct_

        # Nested Type Anonymous_e__Struct_
        @[Extern]
        struct Anonymous_e__Struct_
    property last_fp_dp : UInt32
    property last_fp_ds : UInt16
    property reserved : UInt16
    def initialize(@last_fp_dp : UInt32, @last_fp_ds : UInt16, @reserved : UInt16)
    end
        end

    def initialize(@last_fp_rdp : UInt64, @anonymous : Anonymous_e__Struct_)
    end
      end

    def initialize(@anonymous : Anonymous_e__Union_, @xmm_status_control : UInt32, @xmm_status_control_mask : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_SEGMENT_REGISTER
    property base : UInt64
    property limit : UInt32
    property selector : UInt16
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property attributes : UInt16

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @attributes : UInt16)
    end
    end

    def initialize(@base : UInt64, @limit : UInt32, @selector : UInt16, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_TABLE_REGISTER
    property pad : UInt16[3]
    property limit : UInt16
    property base : UInt64
    def initialize(@pad : UInt16[3], @limit : UInt16, @base : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_INTERRUPT_STATE_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_INTERRUPTION_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    property error_code : UInt32
    def initialize(@_bitfield : UInt32, @error_code : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_EXCEPTION_EVENT
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    property error_code : UInt32
    property exception_parameter : UInt64
    def initialize(@_bitfield : UInt32, @error_code : UInt32, @exception_parameter : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_EXT_INT_EVENT
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    property reserved2 : UInt64
    def initialize(@_bitfield : UInt64, @reserved2 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT0
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    property exit_code : UInt64
    def initialize(@_bitfield : UInt64, @exit_code : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT1
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property exit_info1 : UInt64
    property exit_info2 : UInt64
    def initialize(@exit_info1 : UInt64, @exit_info2 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT2
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property next_rip : UInt64
    property instruction_bytes_fetched_count : UInt8
    property instruction_bytes : UInt8[7]
    def initialize(@next_rip : UInt64, @instruction_bytes_fetched_count : UInt8, @instruction_bytes : UInt8[7])
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT3
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property instruction_bytes : UInt8[8]
    property reserved2 : UInt64
    def initialize(@instruction_bytes : UInt8[8], @reserved2 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT0
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    property exit_reason : UInt32
    property exit_qualification : UInt64
    def initialize(@_bitfield : UInt32, @exit_reason : UInt32, @exit_qualification : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT1
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property instruction_length : UInt32
    property instruction_info : UInt32
    property exit_interruption_info : UInt32
    property exit_exception_error_code : UInt32
    def initialize(@instruction_length : UInt32, @instruction_info : UInt32, @exit_interruption_info : UInt32, @exit_exception_error_code : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT2
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property guest_linear_address : UInt64
    property guest_physical_address : UInt64
    def initialize(@guest_linear_address : UInt64, @guest_physical_address : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT3
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property msr_data : UInt64
    def initialize(@msr_data : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_NESTED_INVEPT_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property type__ : UInt8
    property reserved : UInt8[7]
    property eptp : UInt64
    def initialize(@type__ : UInt8, @reserved : UInt8[7], @eptp : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_NESTED_INVVPID_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property type__ : UInt8
    property reserved : UInt8[3]
    property vpid : UInt32
    property linear_address : UInt64
    def initialize(@type__ : UInt8, @reserved : UInt8[3], @vpid : UInt32, @linear_address : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_NESTED_GUEST_STATE
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    property reserved1 : UInt64
    def initialize(@_bitfield : UInt64, @reserved1 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_DELIVERABILITY_NOTIFICATIONS_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_INTERNAL_ACTIVITY_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PENDING_DEBUG_EXCEPTION
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_REGISTER_VALUE
    property reg128 : Win32cr::System::Hypervisor::WHV_UINT128
    property reg64 : UInt64
    property reg32 : UInt32
    property reg16 : UInt16
    property reg8 : UInt8
    property internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER
    property deliverability_notifications : Win32cr::System::Hypervisor::WHV_DELIVERABILITY_NOTIFICATIONS_REGISTER
    property fp : Win32cr::System::Hypervisor::WHV_X64_FP_REGISTER
    property fp_control_status : Win32cr::System::Hypervisor::WHV_X64_FP_CONTROL_STATUS_REGISTER
    property xmm_control_status : Win32cr::System::Hypervisor::WHV_X64_XMM_CONTROL_STATUS_REGISTER
    property segment : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property table : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER
    property interrupt_state : Win32cr::System::Hypervisor::WHV_X64_INTERRUPT_STATE_REGISTER
    property pending_interruption : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_REGISTER
    property exception_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXCEPTION_EVENT
    property ext_int_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXT_INT_EVENT
    property pending_debug_exception : Win32cr::System::Hypervisor::WHV_X64_PENDING_DEBUG_EXCEPTION
    property nested_state : Win32cr::System::Hypervisor::WHV_X64_NESTED_GUEST_STATE
    property inv_ept : Win32cr::System::Hypervisor::WHV_X64_NESTED_INVEPT_REGISTER
    property inv_vpid : Win32cr::System::Hypervisor::WHV_X64_NESTED_INVVPID_REGISTER
    property svm_nested_exit0 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT0
    property svm_nested_exit1 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT1
    property svm_nested_exit2 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT2
    property svm_nested_exit3 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT3
    property vmx_nested_exit0 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT0
    property vmx_nested_exit1 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT1
    property vmx_nested_exit2 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT2
    property vmx_nested_exit3 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT3
    def initialize(@reg128 : Win32cr::System::Hypervisor::WHV_UINT128, @reg64 : UInt64, @reg32 : UInt32, @reg16 : UInt16, @reg8 : UInt8, @internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER, @deliverability_notifications : Win32cr::System::Hypervisor::WHV_DELIVERABILITY_NOTIFICATIONS_REGISTER, @fp : Win32cr::System::Hypervisor::WHV_X64_FP_REGISTER, @fp_control_status : Win32cr::System::Hypervisor::WHV_X64_FP_CONTROL_STATUS_REGISTER, @xmm_control_status : Win32cr::System::Hypervisor::WHV_X64_XMM_CONTROL_STATUS_REGISTER, @segment : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @table : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER, @interrupt_state : Win32cr::System::Hypervisor::WHV_X64_INTERRUPT_STATE_REGISTER, @pending_interruption : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_REGISTER, @exception_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXCEPTION_EVENT, @ext_int_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXT_INT_EVENT, @pending_debug_exception : Win32cr::System::Hypervisor::WHV_X64_PENDING_DEBUG_EXCEPTION, @nested_state : Win32cr::System::Hypervisor::WHV_X64_NESTED_GUEST_STATE, @inv_ept : Win32cr::System::Hypervisor::WHV_X64_NESTED_INVEPT_REGISTER, @inv_vpid : Win32cr::System::Hypervisor::WHV_X64_NESTED_INVVPID_REGISTER, @svm_nested_exit0 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT0, @svm_nested_exit1 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT1, @svm_nested_exit2 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT2, @svm_nested_exit3 : Win32cr::System::Hypervisor::WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT3, @vmx_nested_exit0 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT0, @vmx_nested_exit1 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT1, @vmx_nested_exit2 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT2, @vmx_nested_exit3 : Win32cr::System::Hypervisor::WHV_X64_PENDING_VMX_NESTED_EXIT_EVENT3)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_CAPABILITY_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_EXTENDED_VM_EXITS
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PROCESSOR_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_PROCESSOR_FEATURES1
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_PROCESSOR_FEATURES_BANKS
    property banks_count : UInt32
    property reserved0 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64[2]

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property bank0 : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES
    property bank1 : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES1
    def initialize(@bank0 : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES, @bank1 : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES1)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64[2])
    end
    end

    def initialize(@banks_count : UInt32, @reserved0 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property banks_count : UInt32
    property reserved0 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64[1]

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property bank0 : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES
    def initialize(@bank0 : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64[1])
    end
    end

    def initialize(@banks_count : UInt32, @reserved0 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_INPUT_VTL
    property as_uint8 : UInt8
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@as_uint8 : UInt8, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ENABLE_PARTITION_VTL_FLAGS
    property as_uint8 : UInt8
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@as_uint8 : UInt8, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_DISABLE_PARTITION_VTL_FLAGS
    property as_uint8 : UInt8
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@as_uint8 : UInt8, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_INITIAL_VP_CONTEXT
    property rip : UInt64
    property rsp : UInt64
    property rflags : UInt64
    property cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property fs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property gs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property ss : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property tr : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property ldtr : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property idtr : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER
    property gdtr : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER
    property efer : UInt64
    property cr0 : UInt64
    property cr3 : UInt64
    property cr4 : UInt64
    property msr_cr_pat : UInt64
    def initialize(@rip : UInt64, @rsp : UInt64, @rflags : UInt64, @cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @fs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @gs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @ss : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @tr : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @ldtr : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @idtr : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER, @gdtr : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER, @efer : UInt64, @cr0 : UInt64, @cr3 : UInt64, @cr4 : UInt64, @msr_cr_pat : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_DISABLE_VP_VTL_FLAGS
    property as_uint8 : UInt8
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
    end

    def initialize(@as_uint8 : UInt8, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_PROCESSOR_XSAVE_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_PROCESSOR_PERFMON_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_MSR_EXIT_BITMAP
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_TRANSLATE_GVA_2_FLAGS
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_TRANSLATE_GVA_RESULT
    property result_code : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE
    property reserved : UInt32
    def initialize(@result_code : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE, @reserved : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_MEMORY_RANGE_ENTRY
    property guest_address : UInt64
    property size_in_bytes : UInt64
    def initialize(@guest_address : UInt64, @size_in_bytes : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property as_uint32 : UInt32
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@as_uint32 : UInt32, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_ADVISE_GPA_RANGE_POPULATE
    property flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property access_type : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_TYPE
    def initialize(@flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS, @access_type : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_TYPE)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ADVISE_GPA_RANGE
    property populate : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE
    def initialize(@populate : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_ACCESS_GPA_CONTROLS
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property cache_type : Win32cr::System::Hypervisor::WHV_CACHE_TYPE
    property input_vtl : Win32cr::System::Hypervisor::WHV_INPUT_VTL
    property reserved : UInt8
    property reserved1 : UInt16
    def initialize(@cache_type : Win32cr::System::Hypervisor::WHV_CACHE_TYPE, @input_vtl : Win32cr::System::Hypervisor::WHV_INPUT_VTL, @reserved : UInt8, @reserved1 : UInt16)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    property _bitfield : UInt32
    property highest_frequency_mhz : UInt32
    property nominal_frequency_mhz : UInt32
    property lowest_frequency_mhz : UInt32
    property frequency_step_mhz : UInt32
    def initialize(@_bitfield : UInt32, @highest_frequency_mhz : UInt32, @nominal_frequency_mhz : UInt32, @lowest_frequency_mhz : UInt32, @frequency_step_mhz : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_SCHEDULER_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_CAPABILITY
    property hypervisor_present : Win32cr::Foundation::BOOL
    property features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES
    property extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS
    property processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR
    property processor_features : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES
    property synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property processor_cl_flush_size : UInt8
    property processor_clock_frequency : UInt64
    property processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS
    property gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    property scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES
    property physical_address_width : UInt32
    property nested_feature_register : UInt64
    property processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES
    property interrupt_clock_frequency : UInt64
    property processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES
    property x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP
    property exception_exit_bitmap : UInt64
    def initialize(@hypervisor_present : Win32cr::Foundation::BOOL, @features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES, @extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS, @processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR, @processor_features : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES, @synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, @processor_cl_flush_size : UInt8, @processor_clock_frequency : UInt64, @processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS, @gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS, @processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP, @scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES, @physical_address_width : UInt32, @nested_feature_register : UInt64, @processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES, @interrupt_clock_frequency : UInt64, @processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES, @x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP, @exception_exit_bitmap : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_CPUID_RESULT
    property function : UInt32
    property reserved : UInt32[3]
    property eax : UInt32
    property ebx : UInt32
    property ecx : UInt32
    property edx : UInt32
    def initialize(@function : UInt32, @reserved : UInt32[3], @eax : UInt32, @ebx : UInt32, @ecx : UInt32, @edx : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_CPUID_OUTPUT
    property eax : UInt32
    property ebx : UInt32
    property ecx : UInt32
    property edx : UInt32
    def initialize(@eax : UInt32, @ebx : UInt32, @ecx : UInt32, @edx : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_CPUID_RESULT2
    property function : UInt32
    property index : UInt32
    property vp_index : UInt32
    property flags : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2_FLAGS
    property output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT
    property mask : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT
    def initialize(@function : UInt32, @index : UInt32, @vp_index : UInt32, @flags : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2_FLAGS, @output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT, @mask : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_MSR_ACTION_ENTRY
    property index : UInt32
    property read_action : UInt8
    property write_action : UInt8
    property reserved : UInt16
    def initialize(@index : UInt32, @read_action : UInt8, @write_action : UInt8, @reserved : UInt16)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_PARTITION_PROPERTY
    property extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS
    property processor_features : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES
    property synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property processor_cl_flush_size : UInt8
    property processor_count : UInt32
    property separate_security_domain : Win32cr::Foundation::BOOL
    property nested_virtualization : Win32cr::Foundation::BOOL
    property processor_clock_frequency : UInt64
    property processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS
    property reference_time : UInt64
    property primary_numa_node : UInt16
    property cpu_reserve : UInt32
    property cpu_cap : UInt32
    property cpu_weight : UInt32
    property cpu_group_id : UInt64
    property processor_frequency_cap : UInt32
    property allow_device_assignment : Win32cr::Foundation::BOOL
    property disable_smt : Win32cr::Foundation::BOOL
    property physical_address_width : UInt32
    property processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES
    property cpuid_exit_list : UInt32[1]
    property exception_exit_bitmap : UInt64
    property apic_remote_read : Win32cr::Foundation::BOOL
    property x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP
    property processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES
    property interrupt_clock_frequency : UInt64
    property cpuid_result_list : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT[1]
    property cpuid_result_list2 : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2[1]
    property msr_action_list : Win32cr::System::Hypervisor::WHV_MSR_ACTION_ENTRY[1]
    property unimplemented_msr_action : Win32cr::System::Hypervisor::WHV_MSR_ACTION
    property local_apic_emulation_mode : Win32cr::System::Hypervisor::WHV_X64_LOCAL_APIC_EMULATION_MODE
    def initialize(@extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS, @processor_features : Win32cr::System::Hypervisor::WHV_X64_PROCESSOR_FEATURES, @synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, @processor_cl_flush_size : UInt8, @processor_count : UInt32, @separate_security_domain : Win32cr::Foundation::BOOL, @nested_virtualization : Win32cr::Foundation::BOOL, @processor_clock_frequency : UInt64, @processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS, @reference_time : UInt64, @primary_numa_node : UInt16, @cpu_reserve : UInt32, @cpu_cap : UInt32, @cpu_weight : UInt32, @cpu_group_id : UInt64, @processor_frequency_cap : UInt32, @allow_device_assignment : Win32cr::Foundation::BOOL, @disable_smt : Win32cr::Foundation::BOOL, @physical_address_width : UInt32, @processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES, @cpuid_exit_list : UInt32[1], @exception_exit_bitmap : UInt64, @apic_remote_read : Win32cr::Foundation::BOOL, @x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP, @processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES, @interrupt_clock_frequency : UInt64, @cpuid_result_list : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT[1], @cpuid_result_list2 : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2[1], @msr_action_list : Win32cr::System::Hypervisor::WHV_MSR_ACTION_ENTRY[1], @unimplemented_msr_action : Win32cr::System::Hypervisor::WHV_MSR_ACTION, @local_apic_emulation_mode : Win32cr::System::Hypervisor::WHV_X64_LOCAL_APIC_EMULATION_MODE)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_VP_EXECUTION_STATE
    property anonymous : Anonymous_e__Struct_
    property as_uint16 : UInt16

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint16 : UInt16)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_VP_EXIT_CONTEXT
    property execution_state : Win32cr::System::Hypervisor::WHV_X64_VP_EXECUTION_STATE
    property _bitfield : UInt8
    property reserved : UInt8
    property reserved2 : UInt32
    property cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property rip : UInt64
    property rflags : UInt64
    def initialize(@execution_state : Win32cr::System::Hypervisor::WHV_X64_VP_EXECUTION_STATE, @_bitfield : UInt8, @reserved : UInt8, @reserved2 : UInt32, @cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @rip : UInt64, @rflags : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    property deliverable_sints : UInt16
    property reserved1 : UInt16
    property reserved2 : UInt32
    def initialize(@deliverable_sints : UInt16, @reserved1 : UInt16, @reserved2 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_MEMORY_ACCESS_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_MEMORY_ACCESS_CONTEXT
    property instruction_byte_count : UInt8
    property reserved : UInt8[3]
    property instruction_bytes : UInt8[16]
    property access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO
    property gpa : UInt64
    property gva : UInt64
    def initialize(@instruction_byte_count : UInt8, @reserved : UInt8[3], @instruction_bytes : UInt8[16], @access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO, @gpa : UInt64, @gva : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_IO_PORT_ACCESS_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_IO_PORT_ACCESS_CONTEXT
    property instruction_byte_count : UInt8
    property reserved : UInt8[3]
    property instruction_bytes : UInt8[16]
    property access_info : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_INFO
    property port_number : UInt16
    property reserved2 : UInt16[3]
    property rax : UInt64
    property rcx : UInt64
    property rsi : UInt64
    property rdi : UInt64
    property ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    def initialize(@instruction_byte_count : UInt8, @reserved : UInt8[3], @instruction_bytes : UInt8[16], @access_info : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_INFO, @port_number : UInt16, @reserved2 : UInt16[3], @rax : UInt64, @rcx : UInt64, @rsi : UInt64, @rdi : UInt64, @ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_MSR_ACCESS_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_MSR_ACCESS_CONTEXT
    property access_info : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_INFO
    property msr_number : UInt32
    property rax : UInt64
    property rdx : UInt64
    def initialize(@access_info : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_INFO, @msr_number : UInt32, @rax : UInt64, @rdx : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_CPUID_ACCESS_CONTEXT
    property rax : UInt64
    property rcx : UInt64
    property rdx : UInt64
    property rbx : UInt64
    property default_result_rax : UInt64
    property default_result_rcx : UInt64
    property default_result_rdx : UInt64
    property default_result_rbx : UInt64
    def initialize(@rax : UInt64, @rcx : UInt64, @rdx : UInt64, @rbx : UInt64, @default_result_rax : UInt64, @default_result_rcx : UInt64, @default_result_rdx : UInt64, @default_result_rbx : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_VP_EXCEPTION_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_VP_EXCEPTION_CONTEXT
    property instruction_byte_count : UInt8
    property reserved : UInt8[3]
    property instruction_bytes : UInt8[16]
    property exception_info : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_INFO
    property exception_type : UInt8
    property reserved2 : UInt8[3]
    property error_code : UInt32
    property exception_parameter : UInt64
    def initialize(@instruction_byte_count : UInt8, @reserved : UInt8[3], @instruction_bytes : UInt8[16], @exception_info : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_INFO, @exception_type : UInt8, @reserved2 : UInt8[3], @error_code : UInt32, @exception_parameter : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
    property feature_code : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CODE
    property reserved : UInt32
    property feature_parameter : UInt64
    def initialize(@feature_code : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CODE, @reserved : UInt32, @feature_parameter : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_RUN_VP_CANCELED_CONTEXT
    property cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCEL_REASON
    def initialize(@cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCEL_REASON)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
    property deliverable_type : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_TYPE
    def initialize(@deliverable_type : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_TYPE)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_APIC_EOI_CONTEXT
    property interrupt_vector : UInt32
    def initialize(@interrupt_vector : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_X64_RDTSC_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_RDTSC_CONTEXT
    property tsc_aux : UInt64
    property virtual_offset : UInt64
    property tsc : UInt64
    property reference_time : UInt64
    property rdtsc_info : Win32cr::System::Hypervisor::WHV_X64_RDTSC_INFO
    def initialize(@tsc_aux : UInt64, @virtual_offset : UInt64, @tsc : UInt64, @reference_time : UInt64, @rdtsc_info : Win32cr::System::Hypervisor::WHV_X64_RDTSC_INFO)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_APIC_SMI_CONTEXT
    property apic_icr : UInt64
    def initialize(@apic_icr : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_HYPERCALL_CONTEXT
    property rax : UInt64
    property rbx : UInt64
    property rcx : UInt64
    property rdx : UInt64
    property r8 : UInt64
    property rsi : UInt64
    property rdi : UInt64
    property reserved0 : UInt64
    property xmm_registers : Win32cr::System::Hypervisor::WHV_UINT128[6]
    property reserved1 : UInt64[2]
    def initialize(@rax : UInt64, @rbx : UInt64, @rcx : UInt64, @rdx : UInt64, @r8 : UInt64, @rsi : UInt64, @rdi : UInt64, @reserved0 : UInt64, @xmm_registers : Win32cr::System::Hypervisor::WHV_UINT128[6], @reserved1 : UInt64[2])
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_APIC_INIT_SIPI_CONTEXT
    property apic_icr : UInt64
    def initialize(@apic_icr : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_X64_APIC_WRITE_CONTEXT
    property type__ : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_TYPE
    property reserved : UInt32
    property write_value : UInt64
    def initialize(@type__ : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_TYPE, @reserved : UInt32, @write_value : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_RUN_VP_EXIT_CONTEXT
    property exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON
    property reserved : UInt32
    property vp_context : Win32cr::System::Hypervisor::WHV_X64_VP_EXIT_CONTEXT
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT
    property cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT
    property hypercall : Win32cr::System::Hypervisor::WHV_X64_HYPERCALL_CONTEXT
    property synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    property io_port_access : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT
    property msr_access : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_CONTEXT
    property cpuid_access : Win32cr::System::Hypervisor::WHV_X64_CPUID_ACCESS_CONTEXT
    property vp_exception : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_CONTEXT
    property interrupt_window : Win32cr::System::Hypervisor::WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
    property unsupported_feature : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
    property apic_eoi : Win32cr::System::Hypervisor::WHV_X64_APIC_EOI_CONTEXT
    property read_tsc : Win32cr::System::Hypervisor::WHV_X64_RDTSC_CONTEXT
    property apic_smi : Win32cr::System::Hypervisor::WHV_X64_APIC_SMI_CONTEXT
    property apic_init_sipi : Win32cr::System::Hypervisor::WHV_X64_APIC_INIT_SIPI_CONTEXT
    property apic_write : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_CONTEXT
    property as_uint64 : UInt64[22]
    def initialize(@memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT, @cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT, @hypercall : Win32cr::System::Hypervisor::WHV_X64_HYPERCALL_CONTEXT, @synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT, @io_port_access : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT, @msr_access : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_CONTEXT, @cpuid_access : Win32cr::System::Hypervisor::WHV_X64_CPUID_ACCESS_CONTEXT, @vp_exception : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_CONTEXT, @interrupt_window : Win32cr::System::Hypervisor::WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT, @unsupported_feature : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CONTEXT, @apic_eoi : Win32cr::System::Hypervisor::WHV_X64_APIC_EOI_CONTEXT, @read_tsc : Win32cr::System::Hypervisor::WHV_X64_RDTSC_CONTEXT, @apic_smi : Win32cr::System::Hypervisor::WHV_X64_APIC_SMI_CONTEXT, @apic_init_sipi : Win32cr::System::Hypervisor::WHV_X64_APIC_INIT_SIPI_CONTEXT, @apic_write : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_CONTEXT, @as_uint64 : UInt64[22])
    end
    end

    def initialize(@exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON, @reserved : UInt32, @vp_context : Win32cr::System::Hypervisor::WHV_X64_VP_EXIT_CONTEXT, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_INTERRUPT_CONTROL
    property _bitfield : UInt64
    property destination : UInt32
    property vector : UInt32
    def initialize(@_bitfield : UInt64, @destination : UInt32, @vector : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_DOORBELL_MATCH_DATA
    property guest_address : UInt64
    property value : UInt64
    property length : UInt32
    property _bitfield : UInt32
    def initialize(@guest_address : UInt64, @value : UInt64, @length : UInt32, @_bitfield : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_PARTITION_MEMORY_COUNTERS
    property mapped4_k_page_count : UInt64
    property mapped2_m_page_count : UInt64
    property mapped1_g_page_count : UInt64
    def initialize(@mapped4_k_page_count : UInt64, @mapped2_m_page_count : UInt64, @mapped1_g_page_count : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_PROCESSOR_RUNTIME_COUNTERS
    property total_runtime100ns : UInt64
    property hypervisor_runtime100ns : UInt64
    def initialize(@total_runtime100ns : UInt64, @hypervisor_runtime100ns : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_PROCESSOR_INTERCEPT_COUNTER
    property count : UInt64
    property time100ns : UInt64
    def initialize(@count : UInt64, @time100ns : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_PROCESSOR_INTERCEPT_COUNTERS
    property page_invalidations : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property control_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property io_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property halt_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property cpuid_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property msr_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property emulated_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property debug_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property rdpmc_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    def initialize(@page_invalidations : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @control_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @io_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @halt_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @cpuid_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @msr_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @emulated_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @debug_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @rdpmc_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_PROCESSOR_EVENT_COUNTERS
    property page_fault_count : UInt64
    property exception_count : UInt64
    property interrupt_count : UInt64
    def initialize(@page_fault_count : UInt64, @exception_count : UInt64, @interrupt_count : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_PROCESSOR_APIC_COUNTERS
    property mmio_access_count : UInt64
    property eoi_access_count : UInt64
    property tpr_access_count : UInt64
    property sent_ipi_count : UInt64
    property self_ipi_count : UInt64
    def initialize(@mmio_access_count : UInt64, @eoi_access_count : UInt64, @tpr_access_count : UInt64, @sent_ipi_count : UInt64, @self_ipi_count : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_PROCESSOR_SYNTHETIC_FEATURES_COUNTERS
    property synthetic_interrupts_count : UInt64
    property long_spin_wait_hypercalls_count : UInt64
    property other_hypercalls_count : UInt64
    property synthetic_interrupt_hypercalls_count : UInt64
    property virtual_interrupt_hypercalls_count : UInt64
    property virtual_mmu_hypercalls_count : UInt64
    def initialize(@synthetic_interrupts_count : UInt64, @long_spin_wait_hypercalls_count : UInt64, @other_hypercalls_count : UInt64, @synthetic_interrupt_hypercalls_count : UInt64, @virtual_interrupt_hypercalls_count : UInt64, @virtual_mmu_hypercalls_count : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_VTL_PERMISSION_SET
    property as_uint32 : UInt32
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property vtl_permission_from1 : UInt16[2]
    def initialize(@vtl_permission_from1 : UInt16[2])
    end
    end

    def initialize(@as_uint32 : UInt32, @anonymous : Anonymous_e__Struct_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_NESTED_ENLIGHTENMENTS_CONTROL
    property features : Features_e__Union_
    property hypercall_controls : HypercallControls_e__Union_

    # Nested Type Features_e__Union_
    @[Extern(union: true)]
    struct Features_e__Union_
    property as_uint32 : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@as_uint32 : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type HypercallControls_e__Union_
    @[Extern(union: true)]
    struct HypercallControls_e__Union_
    property as_uint32 : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@as_uint32 : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@features : Features_e__Union_, @hypercall_controls : HypercallControls_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_X64_VMX_NESTED_STATE
    property vendor : Win32cr::System::Hypervisor::WHV_NESTED_STATE_TYPE
    property flags : Flags_e__Struct_
    property nested_enlightenments_control : Win32cr::System::Hypervisor::WHV_NESTED_ENLIGHTENMENTS_CONTROL
    property pdpt : UInt64[4]
    property vmxon_region_gpa : UInt64
    property vmcs_gpa : UInt64
    property current_enlightened_vmcs : UInt64
    property virtual_apic_regs : VirtualApicRegs_e__Struct_
    property reserved : UInt8[3944]
    property vmcs_bytes : UInt8[4096]

    # Nested Type Flags_e__Struct_
    @[Extern]
    struct Flags_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end


    # Nested Type VirtualApicRegs_e__Struct_
    @[Extern]
    struct VirtualApicRegs_e__Struct_
    property tpr : UInt32
    property ppr : UInt32
    property isr : UInt32[8]
    property irr : UInt32[8]
    property icr_low : UInt32
    property icr_high : UInt32
    def initialize(@tpr : UInt32, @ppr : UInt32, @isr : UInt32[8], @irr : UInt32[8], @icr_low : UInt32, @icr_high : UInt32)
    end
    end

    def initialize(@vendor : Win32cr::System::Hypervisor::WHV_NESTED_STATE_TYPE, @flags : Flags_e__Struct_, @nested_enlightenments_control : Win32cr::System::Hypervisor::WHV_NESTED_ENLIGHTENMENTS_CONTROL, @pdpt : UInt64[4], @vmxon_region_gpa : UInt64, @vmcs_gpa : UInt64, @current_enlightened_vmcs : UInt64, @virtual_apic_regs : VirtualApicRegs_e__Struct_, @reserved : UInt8[3944], @vmcs_bytes : UInt8[4096])
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_SVM_VMCB_SELECTOR
    property selector : UInt16
    property attrib : UInt16
    property limit : UInt32
    property base : UInt64
    def initialize(@selector : UInt16, @attrib : UInt16, @limit : UInt32, @base : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_SVM_NESTED_HOST_STATE
    property rip : UInt64
    property rsp : UInt64
    property rflags : UInt64
    property rax : UInt64
    property es : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR
    property cs : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR
    property ss : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR
    property ds : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR
    property gdtr : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR
    property idtr : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR
    property efer : UInt64
    property cr0 : UInt64
    property cr3 : UInt64
    property cr4 : UInt64
    property virtual_tpr : UInt64
    property reserved : UInt64[6]
    def initialize(@rip : UInt64, @rsp : UInt64, @rflags : UInt64, @rax : UInt64, @es : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR, @cs : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR, @ss : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR, @ds : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR, @gdtr : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR, @idtr : Win32cr::System::Hypervisor::WHV_SVM_VMCB_SELECTOR, @efer : UInt64, @cr0 : UInt64, @cr3 : UInt64, @cr4 : UInt64, @virtual_tpr : UInt64, @reserved : UInt64[6])
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_X64_SVM_NESTED_STATE
    property vendor : Win32cr::System::Hypervisor::WHV_NESTED_STATE_TYPE
    property flags : Flags_e__Struct_
    property nested_enlightenments_control : Win32cr::System::Hypervisor::WHV_NESTED_ENLIGHTENMENTS_CONTROL
    property host_save_gpa : UInt64
    property vm_control_msr : UInt64
    property virtual_tsc_ratio_msr : UInt64
    property vmcb_gpa : UInt64
    property host_state : Win32cr::System::Hypervisor::WHV_SVM_NESTED_HOST_STATE
    property reserved : UInt8[3832]
    property vmcb_bytes : UInt8[4096]

    # Nested Type Flags_e__Struct_
    @[Extern]
    struct Flags_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@vendor : Win32cr::System::Hypervisor::WHV_NESTED_STATE_TYPE, @flags : Flags_e__Struct_, @nested_enlightenments_control : Win32cr::System::Hypervisor::WHV_NESTED_ENLIGHTENMENTS_CONTROL, @host_save_gpa : UInt64, @vm_control_msr : UInt64, @virtual_tsc_ratio_msr : UInt64, @vmcb_gpa : UInt64, @host_state : Win32cr::System::Hypervisor::WHV_SVM_NESTED_HOST_STATE, @reserved : UInt8[3832], @vmcb_bytes : UInt8[4096])
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct WHV_X64_NESTED_STATE
    property vmx : Win32cr::System::Hypervisor::WHV_X64_VMX_NESTED_STATE
    property svm : Win32cr::System::Hypervisor::WHV_X64_SVM_NESTED_STATE
    def initialize(@vmx : Win32cr::System::Hypervisor::WHV_X64_VMX_NESTED_STATE, @svm : Win32cr::System::Hypervisor::WHV_X64_SVM_NESTED_STATE)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_SYNIC_EVENT_PARAMETERS
    property vp_index : UInt32
    property target_sint : UInt8
    property target_vtl : UInt8
    property flag_number : UInt16
    def initialize(@vp_index : UInt32, @target_sint : UInt8, @target_vtl : UInt8, @flag_number : UInt16)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_SRIOV_RESOURCE_DESCRIPTOR
    property pnp_instance_id : UInt16[200]
    property virtual_function_id : Win32cr::Foundation::LUID
    property virtual_function_index : UInt16
    property reserved : UInt16
    def initialize(@pnp_instance_id : UInt16[200], @virtual_function_id : Win32cr::Foundation::LUID, @virtual_function_index : UInt16, @reserved : UInt16)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VPCI_DEVICE_NOTIFICATION
    property notification_type : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION_TYPE
    property reserved1 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property reserved2 : UInt64
    def initialize(@reserved2 : UInt64)
    end
    end

    def initialize(@notification_type : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION_TYPE, @reserved1 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VPCI_HARDWARE_IDS
    property vendor_id : UInt16
    property device_id : UInt16
    property revision_id : UInt8
    property prog_if : UInt8
    property sub_class : UInt8
    property base_class : UInt8
    property sub_vendor_id : UInt16
    property sub_system_id : UInt16
    def initialize(@vendor_id : UInt16, @device_id : UInt16, @revision_id : UInt8, @prog_if : UInt8, @sub_class : UInt8, @base_class : UInt8, @sub_vendor_id : UInt16, @sub_system_id : UInt16)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VPCI_PROBED_BARS
    property value : UInt32[6]
    def initialize(@value : UInt32[6])
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VPCI_MMIO_MAPPING
    property location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE
    property flags : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_RANGE_FLAGS
    property size_in_bytes : UInt64
    property offset_in_bytes : UInt64
    property virtual_address : Void*
    def initialize(@location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE, @flags : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_RANGE_FLAGS, @size_in_bytes : UInt64, @offset_in_bytes : UInt64, @virtual_address : Void*)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VPCI_DEVICE_REGISTER
    property location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE
    property size_in_bytes : UInt32
    property offset_in_bytes : UInt64
    def initialize(@location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE, @size_in_bytes : UInt32, @offset_in_bytes : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VPCI_INTERRUPT_TARGET
    property vector : UInt32
    property flags : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET_FLAGS
    property processor_count : UInt32
    property processors : UInt32[1]
    def initialize(@vector : UInt32, @flags : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET_FLAGS, @processor_count : UInt32, @processors : UInt32[1])
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_TRIGGER_PARAMETERS
    property trigger_type : Win32cr::System::Hypervisor::WHV_TRIGGER_TYPE
    property reserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL
    property synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS
    property device_interrupt : DeviceInterrupt_e__Struct_

      # Nested Type DeviceInterrupt_e__Struct_
      @[Extern]
      struct DeviceInterrupt_e__Struct_
    property logical_device_id : UInt64
    property msi_address : UInt64
    property msi_data : UInt32
    property reserved : UInt32
    def initialize(@logical_device_id : UInt64, @msi_address : UInt64, @msi_data : UInt32, @reserved : UInt32)
    end
      end

    def initialize(@interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL, @synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, @device_interrupt : DeviceInterrupt_e__Struct_)
    end
    end

    def initialize(@trigger_type : Win32cr::System::Hypervisor::WHV_TRIGGER_TYPE, @reserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_VIRTUAL_PROCESSOR_PROPERTY
    property property_code : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE
    property reserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property numa_node : UInt16
    property padding : UInt64
    def initialize(@numa_node : UInt16, @padding : UInt64)
    end
    end

    def initialize(@property_code : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE, @reserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct WHV_NOTIFICATION_PORT_PARAMETERS
    property notification_port_type : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_TYPE
    property reserved : UInt16
    property reserved1 : UInt8
    property connection_vtl : UInt8
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property doorbell : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA
    property event : Event_e__Struct_

      # Nested Type Event_e__Struct_
      @[Extern]
      struct Event_e__Struct_
    property connection_id : UInt32
    def initialize(@connection_id : UInt32)
    end
      end

    def initialize(@doorbell : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA, @event : Event_e__Struct_)
    end
    end

    def initialize(@notification_port_type : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_TYPE, @reserved : UInt16, @reserved1 : UInt8, @connection_vtl : UInt8, @anonymous : Anonymous_e__Union_)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern(union: true)]
  struct WHV_EMULATOR_STATUS
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_EMULATOR_MEMORY_ACCESS_INFO
    property gpa_address : UInt64
    property direction : UInt8
    property access_size : UInt8
    property data : UInt8[8]
    def initialize(@gpa_address : UInt64, @direction : UInt8, @access_size : UInt8, @data : UInt8[8])
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_EMULATOR_IO_ACCESS_INFO
    property direction : UInt8
    property port : UInt16
    property access_size : UInt16
    property data : UInt32
    def initialize(@direction : UInt8, @port : UInt16, @access_size : UInt16, @data : UInt32)
    end
  end
  {% end %}

  {% if flag?(:x86_64) %}
  @[Extern]
  struct WHV_EMULATOR_CALLBACKS
    property size : UInt32
    property reserved : UInt32
    property w_hv_emulator_io_port_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_IO_PORT_CALLBACK
    property w_hv_emulator_memory_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_CALLBACK
    property w_hv_emulator_get_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK
    property w_hv_emulator_set_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK
    property w_hv_emulator_translate_gva_page : Win32cr::System::Hypervisor::WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK
    def initialize(@size : UInt32, @reserved : UInt32, @w_hv_emulator_io_port_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_IO_PORT_CALLBACK, @w_hv_emulator_memory_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_CALLBACK, @w_hv_emulator_get_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK, @w_hv_emulator_set_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK, @w_hv_emulator_translate_gva_page : Win32cr::System::Hypervisor::WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK)
    end
  end
  {% end %}

  @[Extern]
  struct SOCKADDR_HV
    property family : Win32cr::Networking::WinSock::ADDRESS_FAMILY
    property reserved : UInt16
    property vm_id : LibC::GUID
    property service_id : LibC::GUID
    def initialize(@family : Win32cr::Networking::WinSock::ADDRESS_FAMILY, @reserved : UInt16, @vm_id : LibC::GUID, @service_id : LibC::GUID)
    end
  end

  @[Extern]
  struct HVSOCKET_ADDRESS_INFO
    property system_id : LibC::GUID
    property virtual_machine_id : LibC::GUID
    property silo_id : LibC::GUID
    property flags : UInt32
    def initialize(@system_id : LibC::GUID, @virtual_machine_id : LibC::GUID, @silo_id : LibC::GUID, @flags : UInt32)
    end
  end

  @[Extern]
  struct VM_GENCOUNTER
    property generation_count : UInt64
    property generation_count_high : UInt64
    def initialize(@generation_count : UInt64, @generation_count_high : UInt64)
    end
  end

  @[Extern]
  struct HDV_PCI_PNP_ID
    property vendor_id : UInt16
    property device_id : UInt16
    property revision_id : UInt8
    property prog_if : UInt8
    property sub_class : UInt8
    property base_class : UInt8
    property sub_vendor_id : UInt16
    property sub_system_id : UInt16
    def initialize(@vendor_id : UInt16, @device_id : UInt16, @revision_id : UInt8, @prog_if : UInt8, @sub_class : UInt8, @base_class : UInt8, @sub_vendor_id : UInt16, @sub_system_id : UInt16)
    end
  end

  @[Extern]
  struct HDV_PCI_DEVICE_INTERFACE
    property version : Win32cr::System::Hypervisor::HDV_PCI_INTERFACE_VERSION
    property initialize__ : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_INITIALIZE
    property teardown : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_TEARDOWN
    property set_configuration : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_SET_CONFIGURATION
    property get_details : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_GET_DETAILS
    property start : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_START
    property stop : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_STOP
    property read_config_space : Win32cr::System::Hypervisor::HDV_PCI_READ_CONFIG_SPACE
    property write_config_space : Win32cr::System::Hypervisor::HDV_PCI_WRITE_CONFIG_SPACE
    property read_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_READ_INTERCEPTED_MEMORY
    property write_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_WRITE_INTERCEPTED_MEMORY
    def initialize(@version : Win32cr::System::Hypervisor::HDV_PCI_INTERFACE_VERSION, @initialize__ : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_INITIALIZE, @teardown : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_TEARDOWN, @set_configuration : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_SET_CONFIGURATION, @get_details : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_GET_DETAILS, @start : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_START, @stop : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_STOP, @read_config_space : Win32cr::System::Hypervisor::HDV_PCI_READ_CONFIG_SPACE, @write_config_space : Win32cr::System::Hypervisor::HDV_PCI_WRITE_CONFIG_SPACE, @read_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_READ_INTERCEPTED_MEMORY, @write_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_WRITE_INTERCEPTED_MEMORY)
    end
  end

  @[Extern]
  struct GPA_MEMORY_CHUNK
    property guest_physical_start_page_index : UInt64
    property page_count : UInt64
    def initialize(@guest_physical_start_page_index : UInt64, @page_count : UInt64)
    end
  end

  @[Extern(union: true)]
  struct GUEST_OS_INFO
    property as_uint64 : UInt64
    property closed_source : ClosedSource_e__Struct_
    property open_source : OpenSource_e__Struct_

    # Nested Type ClosedSource_e__Struct_
    @[Extern]
    struct ClosedSource_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end


    # Nested Type OpenSource_e__Struct_
    @[Extern]
    struct OpenSource_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64, @closed_source : ClosedSource_e__Struct_, @open_source : OpenSource_e__Struct_)
    end
  end

  @[Extern(union: true)]
  struct VIRTUAL_PROCESSOR_REGISTER
    property reg64 : UInt64
    property reg32 : UInt32
    property reg16 : UInt16
    property reg8 : UInt8
    property reg128 : Reg128_e__Struct_
    property x64 : X64_e__Union_

    # Nested Type Reg128_e__Struct_
    @[Extern]
    struct Reg128_e__Struct_
    property low64 : UInt64
    property high64 : UInt64
    def initialize(@low64 : UInt64, @high64 : UInt64)
    end
    end


    # Nested Type X64_e__Union_
    @[Extern(union: true)]
    struct X64_e__Union_
    property segment : Segment_e__Struct_
    property table : Table_e__Struct_
    property fp_control_status : FpControlStatus_e__Struct_
    property xmm_control_status : XmmControlStatus_e__Struct_

      # Nested Type Segment_e__Struct_
      @[Extern]
      struct Segment_e__Struct_
    property base : UInt64
    property limit : UInt32
    property selector : UInt16
    property anonymous : Anonymous_e__Union_

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property attributes : UInt16
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
          end

    def initialize(@attributes : UInt16, @anonymous : Anonymous_e__Struct_)
    end
        end

    def initialize(@base : UInt64, @limit : UInt32, @selector : UInt16, @anonymous : Anonymous_e__Union_)
    end
      end


      # Nested Type Table_e__Struct_
      @[Extern]
      struct Table_e__Struct_
    property limit : UInt16
    property base : UInt64
    def initialize(@limit : UInt16, @base : UInt64)
    end
      end


      # Nested Type FpControlStatus_e__Struct_
      @[Extern]
      struct FpControlStatus_e__Struct_
    property fp_control : UInt16
    property fp_status : UInt16
    property fp_tag : UInt8
    property reserved : UInt8
    property last_fp_op : UInt16
    property anonymous : Anonymous_e__Union_

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property last_fp_rip : UInt64
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property last_fp_eip : UInt32
    property last_fp_cs : UInt16
    def initialize(@last_fp_eip : UInt32, @last_fp_cs : UInt16)
    end
          end

    def initialize(@last_fp_rip : UInt64, @anonymous : Anonymous_e__Struct_)
    end
        end

    def initialize(@fp_control : UInt16, @fp_status : UInt16, @fp_tag : UInt8, @reserved : UInt8, @last_fp_op : UInt16, @anonymous : Anonymous_e__Union_)
    end
      end


      # Nested Type XmmControlStatus_e__Struct_
      @[Extern]
      struct XmmControlStatus_e__Struct_
    property anonymous : Anonymous_e__Union_
    property xmm_status_control : UInt32
    property xmm_status_control_mask : UInt32

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property last_fp_rdp : UInt64
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property last_fp_dp : UInt32
    property last_fp_ds : UInt16
    def initialize(@last_fp_dp : UInt32, @last_fp_ds : UInt16)
    end
          end

    def initialize(@last_fp_rdp : UInt64, @anonymous : Anonymous_e__Struct_)
    end
        end

    def initialize(@anonymous : Anonymous_e__Union_, @xmm_status_control : UInt32, @xmm_status_control_mask : UInt32)
    end
      end

    def initialize(@segment : Segment_e__Struct_, @table : Table_e__Struct_, @fp_control_status : FpControlStatus_e__Struct_, @xmm_control_status : XmmControlStatus_e__Struct_)
    end
    end

    def initialize(@reg64 : UInt64, @reg32 : UInt32, @reg16 : UInt16, @reg8 : UInt8, @reg128 : Reg128_e__Struct_, @x64 : X64_e__Union_)
    end
  end

  @[Extern]
  struct DOS_IMAGE_INFO
    property pdb_name : Win32cr::Foundation::PSTR
    property image_base_address : UInt64
    property image_size : UInt32
    property timestamp : UInt32
    def initialize(@pdb_name : Win32cr::Foundation::PSTR, @image_base_address : UInt64, @image_size : UInt32, @timestamp : UInt32)
    end
  end

  @[Extern]
  struct MODULE_INFO
    property process_image_name : Win32cr::Foundation::PSTR
    property image : Win32cr::System::Hypervisor::DOS_IMAGE_INFO
    def initialize(@process_image_name : Win32cr::Foundation::PSTR, @image : Win32cr::System::Hypervisor::DOS_IMAGE_INFO)
    end
  end

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetCapability(capability_code : Win32cr::System::Hypervisor::WHV_CAPABILITY_CODE, capability_buffer : Void*, capability_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetCapability(capability_code, capability_buffer, capability_buffer_size_in_bytes, written_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCreatePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCreatePartition(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSetupPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetupPartition(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvResetPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvResetPartition(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvDeletePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvDeletePartition(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetPartitionProperty(partition, property_code, property_buffer, property_buffer_size_in_bytes, written_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetPartitionProperty(partition, property_code, property_buffer, property_buffer_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSuspendPartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSuspendPartitionTime(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvResumePartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvResumePartitionTime(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvMapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvMapGpaRange(partition, source_address, guest_address, size_in_bytes, flags)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvMapGpaRange2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, process : Win32cr::Foundation::HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvMapGpaRange2(partition, process, source_address, guest_address, size_in_bytes, flags)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvUnmapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, size_in_bytes : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvUnmapGpaRange(partition, guest_address, size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvTranslateGva(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, gva : UInt64, translate_flags : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, translation_result : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT*, gpa : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvTranslateGva(partition, vp_index, gva, translate_flags, translation_result, gpa)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCreateVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCreateVirtualProcessor(partition, vp_index, flags)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCreateVirtualProcessor2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, properties : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY*, property_count : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCreateVirtualProcessor2(partition, vp_index, properties, property_count)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvDeleteVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvDeleteVirtualProcessor(partition, vp_index)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, exit_context : Void*, exit_context_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvRunVirtualProcessor(partition, vp_index, exit_context, exit_context_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCancelRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCancelRunVirtualProcessor(partition, vp_index, flags)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorRegisters(partition, vp_index, register_names, register_count, register_values)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetVirtualProcessorRegisters(partition, vp_index, register_names, register_count, register_values)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvGetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorInterruptControllerState(partition, vp_index, state, state_size, written_size)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvSetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetVirtualProcessorInterruptControllerState(partition, vp_index, state, state_size)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvRequestInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL*, interrupt_control_size : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvRequestInterrupt(partition, interrupt, interrupt_control_size)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvGetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorXsaveState(partition, vp_index, buffer, buffer_size_in_bytes, bytes_written)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvSetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetVirtualProcessorXsaveState(partition, vp_index, buffer, buffer_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvQueryGpaRangeDirtyBitmap(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, range_size_in_bytes : UInt64, bitmap : UInt64*, bitmap_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvQueryGpaRangeDirtyBitmap(partition, guest_address, range_size_in_bytes, bitmap, bitmap_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetPartitionCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, counter_set : Win32cr::System::Hypervisor::WHV_PARTITION_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetPartitionCounters(partition, counter_set, buffer, buffer_size_in_bytes, bytes_written)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetVirtualProcessorCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, counter_set : Win32cr::System::Hypervisor::WHV_PROCESSOR_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorCounters(partition, vp_index, counter_set, buffer, buffer_size_in_bytes, bytes_written)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvGetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorInterruptControllerState2(partition, vp_index, state, state_size, written_size)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvSetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetVirtualProcessorInterruptControllerState2(partition, vp_index, state, state_size)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvRegisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*, event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvRegisterPartitionDoorbellEvent(partition, match_data, event_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvUnregisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvUnregisterPartitionDoorbellEvent(partition, match_data)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvAdviseGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, gpa_ranges : Win32cr::System::Hypervisor::WHV_MEMORY_RANGE_ENTRY*, gpa_ranges_count : UInt32, advice : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_CODE, advice_buffer : Void*, advice_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvAdviseGpaRange(partition, gpa_ranges, gpa_ranges_count, advice, advice_buffer, advice_buffer_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvReadGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvReadGpaRange(partition, vp_index, guest_address, controls, data, data_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvWriteGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvWriteGpaRange(partition, vp_index, guest_address, controls, data, data_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSignalVirtualProcessorSynicEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, newly_signaled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSignalVirtualProcessorSynicEvent(partition, synic_event, newly_signaled)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorState(partition, vp_index, state_type, buffer, buffer_size_in_bytes, bytes_written)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetVirtualProcessorState(partition, vp_index, state_type, buffer, buffer_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvAllocateVpciResource(provider_id : LibC::GUID*, flags : Win32cr::System::Hypervisor::WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, resource_descriptor : Void*, resource_descriptor_size_in_bytes : UInt32, vpci_resource : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvAllocateVpciResource(provider_id, flags, resource_descriptor, resource_descriptor_size_in_bytes, vpci_resource)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCreateVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, vpci_resource : Win32cr::Foundation::HANDLE, flags : Win32cr::System::Hypervisor::WHV_CREATE_VPCI_DEVICE_FLAGS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCreateVpciDevice(partition, logical_device_id, vpci_resource, flags, notification_event_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvDeleteVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvDeleteVpciDevice(partition, logical_device_id)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetVpciDeviceProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, property_code : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVpciDeviceProperty(partition, logical_device_id, property_code, property_buffer, property_buffer_size_in_bytes, written_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetVpciDeviceNotification(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, notification : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION*, notification_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVpciDeviceNotification(partition, logical_device_id, notification, notification_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvMapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, mapping_count : UInt32*, mappings : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_MAPPING**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvMapVpciDeviceMmioRanges(partition, logical_device_id, mapping_count, mappings)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvUnmapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvUnmapVpciDeviceMmioRanges(partition, logical_device_id)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSetVpciDevicePowerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, power_state : Win32cr::System::Power::DEVICE_POWER_STATE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetVpciDevicePowerState(partition, logical_device_id, power_state)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvReadVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvReadVpciDeviceRegister(partition, logical_device_id, register, data)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvWriteVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvWriteVpciDeviceRegister(partition, logical_device_id, register, data)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvMapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, message_count : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, msi_address : UInt64*, msi_data : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvMapVpciDeviceInterrupt(partition, logical_device_id, index, message_count, target, msi_address, msi_data)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvUnmapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvUnmapVpciDeviceInterrupt(partition, logical_device_id, index)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvRetargetVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvRetargetVpciDeviceInterrupt(partition, logical_device_id, msi_address, msi_data, target)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvRequestVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvRequestVpciDeviceInterrupt(partition, logical_device_id, msi_address, msi_data)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvGetVpciDeviceInterruptTarget(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, multi_message_number : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, target_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVpciDeviceInterruptTarget(partition, logical_device_id, index, multi_message_number, target, target_size_in_bytes, bytes_written)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCreateTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void**, event_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCreateTrigger(partition, parameters, trigger_handle, event_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvUpdateTriggerParameters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvUpdateTriggerParameters(partition, parameters, trigger_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvDeleteTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, trigger_handle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvDeleteTrigger(partition, trigger_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCreateNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PARAMETERS*, event_handle : Win32cr::Foundation::HANDLE, port_handle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCreateNotificationPort(partition, parameters, event_handle, port_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvSetNotificationPortProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*, property_code : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PROPERTY_CODE, property_value : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvSetNotificationPortProperty(partition, port_handle, property_code, property_value)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvDeleteNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvDeleteNotificationPort(partition, port_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvPostVirtualProcessorSynicMessage(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, sint_index : UInt32, message : Void*, message_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvPostVirtualProcessorSynicMessage(partition, vp_index, sint_index, message, message_size_in_bytes)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvGetVirtualProcessorCpuidOutput(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, eax : UInt32, ecx : UInt32, cpuid_output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetVirtualProcessorCpuidOutput(partition, vp_index, eax, ecx, cpuid_output)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvGetInterruptTargetVpSet(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, destination : UInt64, destination_mode : Win32cr::System::Hypervisor::WHV_INTERRUPT_DESTINATION_MODE, target_vps : UInt32*, vp_count : UInt32, target_vp_count : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvGetInterruptTargetVpSet(partition, destination, destination_mode, target_vps, vp_count, target_vp_count)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvStartPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, migration_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvStartPartitionMigration(partition, migration_handle)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCancelPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCancelPartitionMigration(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvCompletePartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvCompletePartitionMigration(partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) || flag?(:arm) %}
  def wHvAcceptPartitionMigration(migration_handle : Win32cr::Foundation::HANDLE, partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvAcceptPartitionMigration(migration_handle, partition)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvEmulatorCreateEmulator(callbacks : Win32cr::System::Hypervisor::WHV_EMULATOR_CALLBACKS*, emulator : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvEmulatorCreateEmulator(callbacks, emulator)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvEmulatorDestroyEmulator(emulator : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvEmulatorDestroyEmulator(emulator)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvEmulatorTryIoEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_X64_VP_EXIT_CONTEXT*, io_instruction_context : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvEmulatorTryIoEmulation(emulator, context, vp_context, io_instruction_context, emulator_return_status)
    {% end %}
  end
{% end %}

{% if flag?(:x86_64) %}
  def wHvEmulatorTryMmioEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_X64_VP_EXIT_CONTEXT*, mmio_instruction_context : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WHvEmulatorTryMmioEmulation(emulator, context, vp_context, mmio_instruction_context, emulator_return_status)
    {% end %}
  end
{% end %}

  def hdvInitializeDeviceHost(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvInitializeDeviceHost(computeSystem, deviceHostHandle)
    {% end %}
  end

  def hdvInitializeDeviceHostEx(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, flags : Win32cr::System::Hypervisor::HDV_DEVICE_HOST_FLAGS, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvInitializeDeviceHostEx(computeSystem, flags, deviceHostHandle)
    {% end %}
  end

  def hdvTeardownDeviceHost(deviceHostHandle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvTeardownDeviceHost(deviceHostHandle)
    {% end %}
  end

  def hdvCreateDeviceInstance(deviceHostHandle : Void*, deviceType : Win32cr::System::Hypervisor::HDV_DEVICE_TYPE, deviceClassId : LibC::GUID*, deviceInstanceId : LibC::GUID*, deviceInterface : Void*, deviceContext : Void*, deviceHandle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvCreateDeviceInstance(deviceHostHandle, deviceType, deviceClassId, deviceInstanceId, deviceInterface, deviceContext, deviceHandle)
    {% end %}
  end

  def hdvReadGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvReadGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer)
    {% end %}
  end

  def hdvWriteGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvWriteGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer)
    {% end %}
  end

  def hdvCreateGuestMemoryAperture(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, writeProtected : Win32cr::Foundation::BOOL, mappedAddress : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvCreateGuestMemoryAperture(requestor, guestPhysicalAddress, byteCount, writeProtected, mappedAddress)
    {% end %}
  end

  def hdvDestroyGuestMemoryAperture(requestor : Void*, mappedAddress : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvDestroyGuestMemoryAperture(requestor, mappedAddress)
    {% end %}
  end

  def hdvDeliverGuestInterrupt(requestor : Void*, msiAddress : UInt64, msiData : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvDeliverGuestInterrupt(requestor, msiAddress, msiData)
    {% end %}
  end

  def hdvRegisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64, doorbell_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvRegisterDoorbell(requestor, bar_index, bar_offset, trigger_value, flags, doorbell_event)
    {% end %}
  end

  def hdvUnregisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvUnregisterDoorbell(requestor, bar_index, bar_offset, trigger_value, flags)
    {% end %}
  end

  def hdvCreateSectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64, lengthInPages : UInt64, mapping_flags : Win32cr::System::Hypervisor::HDV_MMIO_MAPPING_FLAGS, sectionHandle : Win32cr::Foundation::HANDLE, sectionOffsetInPages : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvCreateSectionBackedMmioRange(requestor, barIndex, offsetInPages, lengthInPages, mapping_flags, sectionHandle, sectionOffsetInPages)
    {% end %}
  end

  def hdvDestroySectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.HdvDestroySectionBackedMmioRange(requestor, barIndex, offsetInPages)
    {% end %}
  end

  def locateSavedStateFiles(vmName : Win32cr::Foundation::PWSTR, snapshotName : Win32cr::Foundation::PWSTR, binPath : Win32cr::Foundation::PWSTR*, vsvPath : Win32cr::Foundation::PWSTR*, vmrsPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LocateSavedStateFiles(vmName, snapshotName, binPath, vsvPath, vmrsPath)
    {% end %}
  end

  def loadSavedStateFile(vmrsFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadSavedStateFile(vmrsFile, vmSavedStateDumpHandle)
    {% end %}
  end

  def applyPendingSavedStateFileReplayLog(vmrsFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ApplyPendingSavedStateFileReplayLog(vmrsFile)
    {% end %}
  end

  def loadSavedStateFiles(binFile : Win32cr::Foundation::PWSTR, vsvFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadSavedStateFiles(binFile, vsvFile, vmSavedStateDumpHandle)
    {% end %}
  end

  def releaseSavedStateFiles(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReleaseSavedStateFiles(vmSavedStateDumpHandle)
    {% end %}
  end

  def getGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle, virtualTrustLevels)
    {% end %}
  end

  def getGuestOsInfo(vmSavedStateDumpHandle : Void*, virtualTrustLevel : UInt8, guestOsInfo : Win32cr::System::Hypervisor::GUEST_OS_INFO*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetGuestOsInfo(vmSavedStateDumpHandle, virtualTrustLevel, guestOsInfo)
    {% end %}
  end

  def getVpCount(vmSavedStateDumpHandle : Void*, vpCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetVpCount(vmSavedStateDumpHandle, vpCount)
    {% end %}
  end

  def getArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetArchitecture(vmSavedStateDumpHandle, vpId, architecture)
    {% end %}
  end

  def forceArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ForceArchitecture(vmSavedStateDumpHandle, vpId, architecture)
    {% end %}
  end

  def getActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel)
    {% end %}
  end

  def getEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle, vpId, virtualTrustLevels)
    {% end %}
  end

  def forceActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel)
    {% end %}
  end

  def isActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle : Void*, vpId : UInt32, activeVirtualTrustLevelEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle, vpId, activeVirtualTrustLevelEnabled)
    {% end %}
  end

  def isNestedVirtualizationEnabled(vmSavedStateDumpHandle : Void*, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.IsNestedVirtualizationEnabled(vmSavedStateDumpHandle, enabled)
    {% end %}
  end

  def getNestedVirtualizationMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetNestedVirtualizationMode(vmSavedStateDumpHandle, vpId, enabled)
    {% end %}
  end

  def forceNestedHostMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, hostMode : Win32cr::Foundation::BOOL, oldMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ForceNestedHostMode(vmSavedStateDumpHandle, vpId, hostMode, oldMode)
    {% end %}
  end

  def inKernelSpace(vmSavedStateDumpHandle : Void*, vpId : UInt32, inKernelSpace : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.InKernelSpace(vmSavedStateDumpHandle, vpId, inKernelSpace)
    {% end %}
  end

  def getRegisterValue(vmSavedStateDumpHandle : Void*, vpId : UInt32, registerId : UInt32, registerValue : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_REGISTER*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetRegisterValue(vmSavedStateDumpHandle, vpId, registerId, registerValue)
    {% end %}
  end

  def getPagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetPagingMode(vmSavedStateDumpHandle, vpId, pagingMode)
    {% end %}
  end

  def forcePagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ForcePagingMode(vmSavedStateDumpHandle, vpId, pagingMode)
    {% end %}
  end

  def readGuestPhysicalAddress(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReadGuestPhysicalAddress(vmSavedStateDumpHandle, physicalAddress, buffer, bufferSize, bytesRead)
    {% end %}
  end

  def guestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, physicalAddress : UInt64*, unmappedRegionSize : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle, vpId, virtualAddress, physicalAddress, unmappedRegionSize)
    {% end %}
  end

  def getGuestPhysicalMemoryChunks(vmSavedStateDumpHandle : Void*, memoryChunkPageSize : UInt64*, memoryChunks : Win32cr::System::Hypervisor::GPA_MEMORY_CHUNK*, memoryChunkCount : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle, memoryChunkPageSize, memoryChunks, memoryChunkCount)
    {% end %}
  end

  def guestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, rawSavedMemoryOffset : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle, physicalAddress, rawSavedMemoryOffset)
    {% end %}
  end

  def readGuestRawSavedMemory(vmSavedStateDumpHandle : Void*, rawSavedMemoryOffset : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReadGuestRawSavedMemory(vmSavedStateDumpHandle, rawSavedMemoryOffset, buffer, bufferSize, bytesRead)
    {% end %}
  end

  def getGuestRawSavedMemorySize(vmSavedStateDumpHandle : Void*, guestRawSavedMemorySize : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetGuestRawSavedMemorySize(vmSavedStateDumpHandle, guestRawSavedMemorySize)
    {% end %}
  end

  def setMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.SetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit)
    {% end %}
  end

  def getMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit)
    {% end %}
  end

  def applyGuestMemoryFix(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, fixBuffer : Void*, fixBufferSize : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ApplyGuestMemoryFix(vmSavedStateDumpHandle, vpId, virtualAddress, fixBuffer, fixBufferSize)
    {% end %}
  end

  def loadSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*, userSymbols : Win32cr::Foundation::PWSTR, force : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadSavedStateSymbolProvider(vmSavedStateDumpHandle, userSymbols, force)
    {% end %}
  end

  def releaseSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle)
    {% end %}
  end

  def getSavedStateSymbolProviderHandle(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle)
    {% end %}
  end

  def setSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle : Void*, callback : Win32cr::System::Hypervisor::GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle, callback)
    {% end %}
  end

  def loadSavedStateModuleSymbols(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadSavedStateModuleSymbols(vmSavedStateDumpHandle, imageName, moduleName, baseAddress, sizeOfBase)
    {% end %}
  end

  def loadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, imageTimestamp : UInt32, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle, imageName, imageTimestamp, moduleName, baseAddress, sizeOfBase)
    {% end %}
  end

  def resolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, virtualAddress : UInt64*, size : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle, vpId, globalName, virtualAddress, size)
    {% end %}
  end

  def readSavedStateGlobalVariable(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, buffer : Void*, bufferSize : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ReadSavedStateGlobalVariable(vmSavedStateDumpHandle, vpId, globalName, buffer, bufferSize)
    {% end %}
  end

  def getSavedStateSymbolTypeSize(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, size : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle, vpId, typeName, size)
    {% end %}
  end

  def findSavedStateSymbolFieldInType(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, fieldName : Win32cr::Foundation::PWSTR, offset : UInt32*, found : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle, vpId, typeName, fieldName, offset, found)
    {% end %}
  end

  def getSavedStateSymbolFieldInfo(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, typeFieldInfoMap : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle, vpId, typeName, typeFieldInfoMap)
    {% end %}
  end

  def scanMemoryForDosImages(vmSavedStateDumpHandle : Void*, vpId : UInt32, startAddress : UInt64, endAddress : UInt64, callbackContext : Void*, foundImageCallback : Win32cr::System::Hypervisor::FOUND_IMAGE_CALLBACK, standaloneAddress : UInt64*, standaloneAddressCount : UInt32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ScanMemoryForDosImages(vmSavedStateDumpHandle, vpId, startAddress, endAddress, callbackContext, foundImageCallback, standaloneAddress, standaloneAddressCount)
    {% end %}
  end

  def callStackUnwind(vmSavedStateDumpHandle : Void*, vpId : UInt32, imageInfo : Win32cr::System::Hypervisor::MODULE_INFO*, imageInfoCount : UInt32, frameCount : UInt32, callStack : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CallStackUnwind(vmSavedStateDumpHandle, vpId, imageInfo, imageInfoCount, frameCount, callStack)
    {% end %}
  end

  @[Link("winhvplatform")]
  @[Link("winhvemulation")]
  @[Link("vmdevicehost")]
  @[Link("vmsavedstatedumpprovider")]
  {% if !flag?(:docs) %}
  lib C
    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetCapability(capability_code : Win32cr::System::Hypervisor::WHV_CAPABILITY_CODE, capability_buffer : Void*, capability_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCreatePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSetupPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvResetPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvDeletePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSuspendPartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvResumePartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvMapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvMapGpaRange2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, process : Win32cr::Foundation::HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvUnmapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, size_in_bytes : UInt64) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvTranslateGva(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, gva : UInt64, translate_flags : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, translation_result : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT*, gpa : UInt64*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCreateVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCreateVirtualProcessor2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, properties : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY*, property_count : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvDeleteVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, exit_context : Void*, exit_context_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCancelRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvGetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvSetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvRequestInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL*, interrupt_control_size : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvGetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvSetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvQueryGpaRangeDirtyBitmap(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, range_size_in_bytes : UInt64, bitmap : UInt64*, bitmap_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetPartitionCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, counter_set : Win32cr::System::Hypervisor::WHV_PARTITION_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetVirtualProcessorCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, counter_set : Win32cr::System::Hypervisor::WHV_PROCESSOR_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvGetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvSetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvRegisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*, event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvUnregisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvAdviseGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, gpa_ranges : Win32cr::System::Hypervisor::WHV_MEMORY_RANGE_ENTRY*, gpa_ranges_count : UInt32, advice : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_CODE, advice_buffer : Void*, advice_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvReadGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvWriteGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSignalVirtualProcessorSynicEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, newly_signaled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvAllocateVpciResource(provider_id : LibC::GUID*, flags : Win32cr::System::Hypervisor::WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, resource_descriptor : Void*, resource_descriptor_size_in_bytes : UInt32, vpci_resource : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCreateVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, vpci_resource : Win32cr::Foundation::HANDLE, flags : Win32cr::System::Hypervisor::WHV_CREATE_VPCI_DEVICE_FLAGS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvDeleteVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetVpciDeviceProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, property_code : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetVpciDeviceNotification(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, notification : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION*, notification_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvMapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, mapping_count : UInt32*, mappings : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_MAPPING**) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvUnmapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSetVpciDevicePowerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, power_state : Win32cr::System::Power::DEVICE_POWER_STATE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvReadVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvWriteVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvMapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, message_count : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, msi_address : UInt64*, msi_data : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvUnmapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvRetargetVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvRequestVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvGetVpciDeviceInterruptTarget(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, multi_message_number : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, target_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCreateTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void**, event_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvUpdateTriggerParameters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvDeleteTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, trigger_handle : Void*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCreateNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PARAMETERS*, event_handle : Win32cr::Foundation::HANDLE, port_handle : Void**) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvSetNotificationPortProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*, property_code : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PROPERTY_CODE, property_value : UInt64) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvDeleteNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvPostVirtualProcessorSynicMessage(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, sint_index : UInt32, message : Void*, message_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvGetVirtualProcessorCpuidOutput(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, eax : UInt32, ecx : UInt32, cpuid_output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvGetInterruptTargetVpSet(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, destination : UInt64, destination_mode : Win32cr::System::Hypervisor::WHV_INTERRUPT_DESTINATION_MODE, target_vps : UInt32*, vp_count : UInt32, target_vp_count : UInt32*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvStartPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, migration_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCancelPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvCompletePartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) || flag?(:arm) %}
    # :nodoc:
    fun WHvAcceptPartitionMigration(migration_handle : Win32cr::Foundation::HANDLE, partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvEmulatorCreateEmulator(callbacks : Win32cr::System::Hypervisor::WHV_EMULATOR_CALLBACKS*, emulator : Void**) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvEmulatorDestroyEmulator(emulator : Void*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvEmulatorTryIoEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_X64_VP_EXIT_CONTEXT*, io_instruction_context : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT
    {% end %}

    {% if flag?(:x86_64) %}
    # :nodoc:
    fun WHvEmulatorTryMmioEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_X64_VP_EXIT_CONTEXT*, mmio_instruction_context : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT
    {% end %}

    # :nodoc:
    fun HdvInitializeDeviceHost(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvInitializeDeviceHostEx(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, flags : Win32cr::System::Hypervisor::HDV_DEVICE_HOST_FLAGS, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvTeardownDeviceHost(deviceHostHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvCreateDeviceInstance(deviceHostHandle : Void*, deviceType : Win32cr::System::Hypervisor::HDV_DEVICE_TYPE, deviceClassId : LibC::GUID*, deviceInstanceId : LibC::GUID*, deviceInterface : Void*, deviceContext : Void*, deviceHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvReadGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvWriteGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvCreateGuestMemoryAperture(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, writeProtected : Win32cr::Foundation::BOOL, mappedAddress : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvDestroyGuestMemoryAperture(requestor : Void*, mappedAddress : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvDeliverGuestInterrupt(requestor : Void*, msiAddress : UInt64, msiData : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvRegisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64, doorbell_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvUnregisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvCreateSectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64, lengthInPages : UInt64, mapping_flags : Win32cr::System::Hypervisor::HDV_MMIO_MAPPING_FLAGS, sectionHandle : Win32cr::Foundation::HANDLE, sectionOffsetInPages : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvDestroySectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LocateSavedStateFiles(vmName : Win32cr::Foundation::PWSTR, snapshotName : Win32cr::Foundation::PWSTR, binPath : Win32cr::Foundation::PWSTR*, vsvPath : Win32cr::Foundation::PWSTR*, vmrsPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateFile(vmrsFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplyPendingSavedStateFileReplayLog(vmrsFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateFiles(binFile : Win32cr::Foundation::PWSTR, vsvFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReleaseSavedStateFiles(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestOsInfo(vmSavedStateDumpHandle : Void*, virtualTrustLevel : UInt8, guestOsInfo : Win32cr::System::Hypervisor::GUEST_OS_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVpCount(vmSavedStateDumpHandle : Void*, vpCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForceArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle : Void*, vpId : UInt32, activeVirtualTrustLevelEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsNestedVirtualizationEnabled(vmSavedStateDumpHandle : Void*, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetNestedVirtualizationMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForceNestedHostMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, hostMode : Win32cr::Foundation::BOOL, oldMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InKernelSpace(vmSavedStateDumpHandle : Void*, vpId : UInt32, inKernelSpace : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetRegisterValue(vmSavedStateDumpHandle : Void*, vpId : UInt32, registerId : UInt32, registerValue : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_REGISTER*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetPagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForcePagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadGuestPhysicalAddress(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, physicalAddress : UInt64*, unmappedRegionSize : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle : Void*, memoryChunkPageSize : UInt64*, memoryChunks : Win32cr::System::Hypervisor::GPA_MEMORY_CHUNK*, memoryChunkCount : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, rawSavedMemoryOffset : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadGuestRawSavedMemory(vmSavedStateDumpHandle : Void*, rawSavedMemoryOffset : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestRawSavedMemorySize(vmSavedStateDumpHandle : Void*, guestRawSavedMemorySize : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplyGuestMemoryFix(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, fixBuffer : Void*, fixBufferSize : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*, userSymbols : Win32cr::Foundation::PWSTR, force : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle : Void*, callback : Win32cr::System::Hypervisor::GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateModuleSymbols(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, imageTimestamp : UInt32, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, virtualAddress : UInt64*, size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadSavedStateGlobalVariable(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, buffer : Void*, bufferSize : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, fieldName : Win32cr::Foundation::PWSTR, offset : UInt32*, found : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, typeFieldInfoMap : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ScanMemoryForDosImages(vmSavedStateDumpHandle : Void*, vpId : UInt32, startAddress : UInt64, endAddress : UInt64, callbackContext : Void*, foundImageCallback : Win32cr::System::Hypervisor::FOUND_IMAGE_CALLBACK, standaloneAddress : UInt64*, standaloneAddressCount : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CallStackUnwind(vmSavedStateDumpHandle : Void*, vpId : UInt32, imageInfo : Win32cr::System::Hypervisor::MODULE_INFO*, imageInfoCount : UInt32, frameCount : UInt32, callStack : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end