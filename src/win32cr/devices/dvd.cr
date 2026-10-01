require "./../foundation.cr"

module Win32cr::Devices::Dvd
  extend self
  IOCTL_DVD_BASE = 51_i32
  IOCTL_DVD_START_SESSION = 3362816_u32
  IOCTL_DVD_READ_KEY = 3362820_u32
  IOCTL_DVD_SEND_KEY = 3362824_u32
  IOCTL_DVD_END_SESSION = 3362828_u32
  IOCTL_DVD_SET_READ_AHEAD = 3362832_u32
  IOCTL_DVD_GET_REGION = 3362836_u32
  IOCTL_DVD_SEND_KEY2 = 3395608_u32
  IOCTL_AACS_READ_MEDIA_KEY_BLOCK_SIZE = 3363008_u32
  IOCTL_AACS_READ_MEDIA_KEY_BLOCK = 3363012_u32
  IOCTL_AACS_START_SESSION = 3363016_u32
  IOCTL_AACS_END_SESSION = 3363020_u32
  IOCTL_AACS_SEND_CERTIFICATE = 3363024_u32
  IOCTL_AACS_GET_CERTIFICATE = 3363028_u32
  IOCTL_AACS_GET_CHALLENGE_KEY = 3363032_u32
  IOCTL_AACS_SEND_CHALLENGE_KEY = 3363036_u32
  IOCTL_AACS_READ_VOLUME_ID = 3363040_u32
  IOCTL_AACS_READ_SERIAL_NUMBER = 3363044_u32
  IOCTL_AACS_READ_MEDIA_ID = 3363048_u32
  IOCTL_AACS_READ_BINDING_NONCE = 3363052_u32
  IOCTL_AACS_GENERATE_BINDING_NONCE = 3395824_u32
  IOCTL_DVD_READ_STRUCTURE = 3363136_u32
  IOCTL_STORAGE_SET_READ_AHEAD = 2966528_u32
  DVD_CGMS_RESERVED_MASK = 120_u32
  DVD_CGMS_COPY_PROTECT_MASK = 24_u32
  DVD_CGMS_COPY_PERMITTED = 0_u32
  DVD_CGMS_COPY_ONCE = 16_u32
  DVD_CGMS_NO_COPY = 24_u32
  DVD_COPYRIGHT_MASK = 64_u32
  DVD_NOT_COPYRIGHTED = 0_u32
  DVD_COPYRIGHTED = 64_u32
  DVD_SECTOR_PROTECT_MASK = 32_u32
  DVD_SECTOR_NOT_PROTECTED = 0_u32
  DVD_SECTOR_PROTECTED = 32_u32

  enum DVD_KEY_TYPE
    DvdChallengeKey = 1_i32
    DvdBusKey1 = 2_i32
    DvdBusKey2 = 3_i32
    DvdTitleKey = 4_i32
    DvdAsf = 5_i32
    DvdSetRpcKey = 6_i32
    DvdGetRpcKey = 8_i32
    DvdDiskKey = 128_i32
    DvdInvalidateAGID = 63_i32
  end
  enum DVD_STRUCTURE_FORMAT
    DvdPhysicalDescriptor = 0_i32
    DvdCopyrightDescriptor = 1_i32
    DvdDiskKeyDescriptor = 2_i32
    DvdBCADescriptor = 3_i32
    DvdManufacturerDescriptor = 4_i32
    DvdMaxDescriptor = 5_i32
  end
  enum DISC_CONTROL_BLOCK_TYPE
    FormattingDiscControlBlock = 1178878720_i32
    WriteInhibitDiscControlBlock = 1464091392_i32
    SessionInfoDiscControlBlock = 1396982528_i32
    DiscControlBlockList = -1_i32
  end

  @[Extern]
  struct DVD_COPY_PROTECT_KEY
    property key_length : UInt32
    property session_id : UInt32
    property key_type : Win32cr::Devices::Dvd::DVD_KEY_TYPE
    property key_flags : UInt32
    property parameters : Parameters_e__Union_
    property key_data : UInt8[1]

    # Nested Type Parameters_e__Union_
    @[Extern(union: true)]
    struct Parameters_e__Union_
    property file_handle : Win32cr::Foundation::HANDLE
    property title_offset : Int64
    def initialize(@file_handle : Win32cr::Foundation::HANDLE, @title_offset : Int64)
    end
    end

    def initialize(@key_length : UInt32, @session_id : UInt32, @key_type : Win32cr::Devices::Dvd::DVD_KEY_TYPE, @key_flags : UInt32, @parameters : Parameters_e__Union_, @key_data : UInt8[1])
    end
  end

  @[Extern]
  struct STORAGE_SET_READ_AHEAD
    property trigger_address : Int64
    property target_address : Int64
    def initialize(@trigger_address : Int64, @target_address : Int64)
    end
  end

  @[Extern]
  struct DVD_READ_STRUCTURE
    property block_byte_offset : Int64
    property format : Win32cr::Devices::Dvd::DVD_STRUCTURE_FORMAT
    property session_id : UInt32
    property layer_number : UInt8
    def initialize(@block_byte_offset : Int64, @format : Win32cr::Devices::Dvd::DVD_STRUCTURE_FORMAT, @session_id : UInt32, @layer_number : UInt8)
    end
  end

  @[Extern]
  struct DVD_DESCRIPTOR_HEADER
    property length : UInt16
    property reserved : UInt8[2]
    property data : UInt8[1]
    def initialize(@length : UInt16, @reserved : UInt8[2], @data : UInt8[1])
    end
  end

  @[Extern]
  struct DVD_LAYER_DESCRIPTOR
    property _bitfield1 : UInt8
    property _bitfield2 : UInt8
    property _bitfield3 : UInt8
    property _bitfield4 : UInt8
    property starting_data_sector : UInt32
    property end_data_sector : UInt32
    property end_layer_zero_sector : UInt32
    property _bitfield5 : UInt8
    def initialize(@_bitfield1 : UInt8, @_bitfield2 : UInt8, @_bitfield3 : UInt8, @_bitfield4 : UInt8, @starting_data_sector : UInt32, @end_data_sector : UInt32, @end_layer_zero_sector : UInt32, @_bitfield5 : UInt8)
    end
  end

  @[Extern]
  struct DVD_FULL_LAYER_DESCRIPTOR
    property commonHeader : Win32cr::Devices::Dvd::DVD_LAYER_DESCRIPTOR
    property media_specific : UInt8[2031]
    def initialize(@commonHeader : Win32cr::Devices::Dvd::DVD_LAYER_DESCRIPTOR, @media_specific : UInt8[2031])
    end
  end

  @[Extern]
  struct DVD_COPYRIGHT_DESCRIPTOR
    property copyright_protection_type : UInt8
    property region_management_information : UInt8
    property reserved : UInt16
    def initialize(@copyright_protection_type : UInt8, @region_management_information : UInt8, @reserved : UInt16)
    end
  end

  @[Extern]
  struct DVD_DISK_KEY_DESCRIPTOR
    property disk_key_data : UInt8[2048]
    def initialize(@disk_key_data : UInt8[2048])
    end
  end

  @[Extern]
  struct DVD_BCA_DESCRIPTOR
    property bca_information : UInt8[1]
    def initialize(@bca_information : UInt8[1])
    end
  end

  @[Extern]
  struct DVD_MANUFACTURER_DESCRIPTOR
    property manufacturing_information : UInt8[2048]
    def initialize(@manufacturing_information : UInt8[2048])
    end
  end

  @[Extern]
  struct DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR
    property anonymous : Anonymous_e__Union_
    property reserved0 : UInt8[3]

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property dvdrom : Dvdrom_e__Struct_
    property dvd_recordable_version1 : DvdRecordable_Version1_e__Struct_
    property dvdram : Dvdram_e__Struct_
    property dvd_recordable : DvdRecordable_e__Struct_
    property cpr_mai : UInt8

      # Nested Type Dvdrom_e__Struct_
      @[Extern]
      struct Dvdrom_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end


      # Nested Type DvdRecordable_Version1_e__Struct_
      @[Extern]
      struct DvdRecordable_Version1_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end


      # Nested Type Dvdram_e__Struct_
      @[Extern]
      struct Dvdram_e__Struct_
    property reserved0003 : UInt8
    def initialize(@reserved0003 : UInt8)
    end
      end


      # Nested Type DvdRecordable_e__Struct_
      @[Extern]
      struct DvdRecordable_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end

    def initialize(@dvdrom : Dvdrom_e__Struct_, @dvd_recordable_version1 : DvdRecordable_Version1_e__Struct_, @dvdram : Dvdram_e__Struct_, @dvd_recordable : DvdRecordable_e__Struct_, @cpr_mai : UInt8)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @reserved0 : UInt8[3])
    end
  end

  @[Extern]
  struct DVD_RAM_MEDIUM_STATUS
    property _bitfield : UInt8
    property disc_type_identification : UInt8
    property reserved2 : UInt8
    property media_specific_write_inhibit_information : UInt8
    def initialize(@_bitfield : UInt8, @disc_type_identification : UInt8, @reserved2 : UInt8, @media_specific_write_inhibit_information : UInt8)
    end
  end

  @[Extern]
  struct DVD_RAM_SPARE_AREA_INFORMATION
    property free_primary_spare_sectors : UInt8[4]
    property free_supplemental_spare_sectors : UInt8[4]
    property allocated_supplemental_spare_sectors : UInt8[4]
    def initialize(@free_primary_spare_sectors : UInt8[4], @free_supplemental_spare_sectors : UInt8[4], @allocated_supplemental_spare_sectors : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_RAM_RECORDING_TYPE
    property _bitfield : UInt8
    property reserved2 : UInt8[3]
    def initialize(@_bitfield : UInt8, @reserved2 : UInt8[3])
    end
  end

  @[Extern]
  struct DVD_RECORDING_MANAGEMENT_AREA_DATA
    property last_recorded_rma_sector_number : UInt8[4]
    property rmd_bytes : UInt8[1]
    def initialize(@last_recorded_rma_sector_number : UInt8[4], @rmd_bytes : UInt8[1])
    end
  end

  @[Extern]
  struct DVD_PRERECORDED_INFORMATION
    property field_id_1 : UInt8
    property disc_application_code : UInt8
    property disc_physical_code : UInt8
    property last_address_of_data_recordable_area : UInt8[3]
    property _bitfield : UInt8
    property reserved0 : UInt8
    property field_id_2 : UInt8
    property opc_suggested_code : UInt8
    property wavelength_code : UInt8
    property write_strategy_code : UInt8[4]
    property reserved2 : UInt8
    property field_id_3 : UInt8
    property manufacturer_id_3 : UInt8[6]
    property reserved3 : UInt8
    property field_id_4 : UInt8
    property manufacturer_id_4 : UInt8[6]
    property reserved4 : UInt8
    property field_id_5 : UInt8
    property manufacturer_id_5 : UInt8[6]
    property reserved5 : UInt8
    property reserved99 : UInt8[24]
    def initialize(@field_id_1 : UInt8, @disc_application_code : UInt8, @disc_physical_code : UInt8, @last_address_of_data_recordable_area : UInt8[3], @_bitfield : UInt8, @reserved0 : UInt8, @field_id_2 : UInt8, @opc_suggested_code : UInt8, @wavelength_code : UInt8, @write_strategy_code : UInt8[4], @reserved2 : UInt8, @field_id_3 : UInt8, @manufacturer_id_3 : UInt8[6], @reserved3 : UInt8, @field_id_4 : UInt8, @manufacturer_id_4 : UInt8[6], @reserved4 : UInt8, @field_id_5 : UInt8, @manufacturer_id_5 : UInt8[6], @reserved5 : UInt8, @reserved99 : UInt8[24])
    end
  end

  @[Extern]
  struct DVD_UNIQUE_DISC_IDENTIFIER
    property reserved0 : UInt8[2]
    property random_number : UInt8[2]
    property year : UInt8[4]
    property month : UInt8[2]
    property day : UInt8[2]
    property hour : UInt8[2]
    property minute : UInt8[2]
    property second : UInt8[2]
    def initialize(@reserved0 : UInt8[2], @random_number : UInt8[2], @year : UInt8[4], @month : UInt8[2], @day : UInt8[2], @hour : UInt8[2], @minute : UInt8[2], @second : UInt8[2])
    end
  end

  @[Extern]
  struct HD_DVD_R_MEDIUM_STATUS
    property _bitfield : UInt8
    property number_of_remaining_rm_ds_in_rdz : UInt8
    property number_of_remaining_rm_ds_in_current_rmz : UInt8[2]
    def initialize(@_bitfield : UInt8, @number_of_remaining_rm_ds_in_rdz : UInt8, @number_of_remaining_rm_ds_in_current_rmz : UInt8[2])
    end
  end

  @[Extern]
  struct DVD_DUAL_LAYER_RECORDING_INFORMATION
    property _bitfield : UInt8
    property reserved1 : UInt8[3]
    property layer0_sectors : UInt8[4]
    def initialize(@_bitfield : UInt8, @reserved1 : UInt8[3], @layer0_sectors : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_DUAL_LAYER_MIDDLE_ZONE_START_ADDRESS
    property _bitfield : UInt8
    property reserved1 : UInt8[3]
    property shifted_middle_area_start_address : UInt8[4]
    def initialize(@_bitfield : UInt8, @reserved1 : UInt8[3], @shifted_middle_area_start_address : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_DUAL_LAYER_JUMP_INTERVAL_SIZE
    property reserved1 : UInt8[4]
    property jump_interval_size : UInt8[4]
    def initialize(@reserved1 : UInt8[4], @jump_interval_size : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_DUAL_LAYER_MANUAL_LAYER_JUMP
    property reserved1 : UInt8[4]
    property manual_jump_layer_address : UInt8[4]
    def initialize(@reserved1 : UInt8[4], @manual_jump_layer_address : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_DUAL_LAYER_REMAPPING_INFORMATION
    property reserved1 : UInt8[4]
    property remapping_address : UInt8[4]
    def initialize(@reserved1 : UInt8[4], @remapping_address : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_DISC_CONTROL_BLOCK_HEADER
    property content_descriptor : UInt8[4]
    property prohibited_actions : ProhibitedActions_e__Union_
    property vendor_id : UInt8[32]

    # Nested Type ProhibitedActions_e__Union_
    @[Extern(union: true)]
    struct ProhibitedActions_e__Union_
    property anonymous : Anonymous_e__Struct_
    property as_byte : UInt8[4]

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property reserved_do_not_use_use_as_byte_instead_0 : UInt8[3]
    property _bitfield : UInt8
    def initialize(@reserved_do_not_use_use_as_byte_instead_0 : UInt8[3], @_bitfield : UInt8)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_byte : UInt8[4])
    end
    end

    def initialize(@content_descriptor : UInt8[4], @prohibited_actions : ProhibitedActions_e__Union_, @vendor_id : UInt8[32])
    end
  end

  @[Extern]
  struct DVD_DISC_CONTROL_BLOCK_WRITE_INHIBIT
    property header : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_HEADER
    property update_count : UInt8[4]
    property write_protect_actions : WriteProtectActions_e__Union_
    property reserved0 : UInt8[16]
    property update_password : UInt8[32]
    property reserved1 : UInt8[32672]

    # Nested Type WriteProtectActions_e__Union_
    @[Extern(union: true)]
    struct WriteProtectActions_e__Union_
    property anonymous : Anonymous_e__Struct_
    property as_byte : UInt8[4]

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property reserved_do_not_use_use_as_byte_instead_0 : UInt8[3]
    property _bitfield : UInt8
    def initialize(@reserved_do_not_use_use_as_byte_instead_0 : UInt8[3], @_bitfield : UInt8)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_byte : UInt8[4])
    end
    end

    def initialize(@header : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_HEADER, @update_count : UInt8[4], @write_protect_actions : WriteProtectActions_e__Union_, @reserved0 : UInt8[16], @update_password : UInt8[32], @reserved1 : UInt8[32672])
    end
  end

  @[Extern]
  struct DVD_DISC_CONTROL_BLOCK_SESSION_ITEM
    property as_byte : UInt8[16]
    def initialize(@as_byte : UInt8[16])
    end
  end

  @[Extern]
  struct DVD_DISC_CONTROL_BLOCK_SESSION
    property header : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_HEADER
    property session_number : UInt8[2]
    property reserved0 : UInt8[22]
    property disc_id : UInt8[32]
    property reserved1 : UInt8[32]
    property session_item : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_SESSION_ITEM[504]
    property reserved2 : UInt8[24576]
    def initialize(@header : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_HEADER, @session_number : UInt8[2], @reserved0 : UInt8[22], @disc_id : UInt8[32], @reserved1 : UInt8[32], @session_item : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_SESSION_ITEM[504], @reserved2 : UInt8[24576])
    end
  end

  @[Extern]
  struct DVD_DISC_CONTROL_BLOCK_LIST_DCB
    property dcb_identifier : UInt8[4]
    def initialize(@dcb_identifier : UInt8[4])
    end
  end

  @[Extern]
  struct DVD_DISC_CONTROL_BLOCK_LIST
    property header : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_HEADER
    property reserved0 : UInt8
    property readabld_dc_bs : UInt8
    property reserved1 : UInt8
    property writable_dc_bs : UInt8
    property dcbs : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_LIST_DCB[1]
    def initialize(@header : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_HEADER, @reserved0 : UInt8, @readabld_dc_bs : UInt8, @reserved1 : UInt8, @writable_dc_bs : UInt8, @dcbs : Win32cr::Devices::Dvd::DVD_DISC_CONTROL_BLOCK_LIST_DCB[1])
    end
  end

  @[Extern]
  struct DVD_WRITE_PROTECTION_STATUS
    property _bitfield : UInt8
    property reserved1 : UInt8[3]
    def initialize(@_bitfield : UInt8, @reserved1 : UInt8[3])
    end
  end

  @[Extern]
  struct DVD_LIST_OF_RECOGNIZED_FORMAT_LAYERS
    property type_code_of_format_layer : UInt8[2]
    def initialize(@type_code_of_format_layer : UInt8[2])
    end
  end

  @[Extern]
  struct DVD_LIST_OF_RECOGNIZED_FORMAT_LAYERS_TYPE_CODE
    property number_of_recognized_format_layers : UInt8
    property _bitfield : UInt8
    def initialize(@number_of_recognized_format_layers : UInt8, @_bitfield : UInt8)
    end
  end

  @[Extern]
  struct DVD_STRUCTURE_LIST_ENTRY
    property format_code : UInt8
    property _bitfield : UInt8
    property format_length : UInt8[2]
    def initialize(@format_code : UInt8, @_bitfield : UInt8, @format_length : UInt8[2])
    end
  end

  @[Extern]
  struct DVD_BD_SPARE_AREA_INFORMATION
    property reserved1 : UInt8[4]
    property number_of_free_spare_blocks : UInt8[4]
    property number_of_allocated_spare_blocks : UInt8[4]
    def initialize(@reserved1 : UInt8[4], @number_of_free_spare_blocks : UInt8[4], @number_of_allocated_spare_blocks : UInt8[4])
    end
  end

  @[Extern]
  struct BD_PAC_HEADER
    property pac_id : UInt8[3]
    property pac_format_number : UInt8
    property pac_update_count : UInt8[4]
    property unknown_pac_rules : UInt8[4]
    property unkown_pac_entire_disc_flag : UInt8
    property reserved1 : UInt8[2]
    property number_of_segments : UInt8
    property segments : UInt8[256]
    property reserved2 : UInt8[112]
    def initialize(@pac_id : UInt8[3], @pac_format_number : UInt8, @pac_update_count : UInt8[4], @unknown_pac_rules : UInt8[4], @unkown_pac_entire_disc_flag : UInt8, @reserved1 : UInt8[2], @number_of_segments : UInt8, @segments : UInt8[256], @reserved2 : UInt8[112])
    end
  end

  @[Extern]
  struct BD_DISC_WRITE_PROTECT_PAC
    property header : Win32cr::Devices::Dvd::BD_PAC_HEADER
    property known_pac_entire_disc_flags : UInt8
    property reserved1 : UInt8[3]
    property write_protect_control_byte : UInt8
    property reserved2 : UInt8[7]
    property write_protect_password : UInt8[32]
    def initialize(@header : Win32cr::Devices::Dvd::BD_PAC_HEADER, @known_pac_entire_disc_flags : UInt8, @reserved1 : UInt8[3], @write_protect_control_byte : UInt8, @reserved2 : UInt8[7], @write_protect_password : UInt8[32])
    end
  end

  @[Extern]
  struct DVD_RPC_KEY
    property _bitfield : UInt8
    property region_mask : UInt8
    property rpc_scheme : UInt8
    property reserved02 : UInt8
    def initialize(@_bitfield : UInt8, @region_mask : UInt8, @rpc_scheme : UInt8, @reserved02 : UInt8)
    end
  end

  @[Extern]
  struct DVD_SET_RPC_KEY
    property preferred_drive_region_code : UInt8
    property reserved : UInt8[3]
    def initialize(@preferred_drive_region_code : UInt8, @reserved : UInt8[3])
    end
  end

  @[Extern]
  struct DVD_ASF
    property reserved0 : UInt8[3]
    property _bitfield : UInt8
    def initialize(@reserved0 : UInt8[3], @_bitfield : UInt8)
    end
  end

  @[Extern]
  struct DVD_REGION
    property copy_system : UInt8
    property region_data : UInt8
    property system_region : UInt8
    property reset_count : UInt8
    def initialize(@copy_system : UInt8, @region_data : UInt8, @system_region : UInt8, @reset_count : UInt8)
    end
  end

  @[Extern]
  struct AACS_CERTIFICATE
    property nonce : UInt8[20]
    property certificate : UInt8[92]
    def initialize(@nonce : UInt8[20], @certificate : UInt8[92])
    end
  end

  @[Extern]
  struct AACS_CHALLENGE_KEY
    property elliptic_curve_point : UInt8[40]
    property signature : UInt8[40]
    def initialize(@elliptic_curve_point : UInt8[40], @signature : UInt8[40])
    end
  end

  @[Extern]
  struct AACS_VOLUME_ID
    property volume_id : UInt8[16]
    property mac : UInt8[16]
    def initialize(@volume_id : UInt8[16], @mac : UInt8[16])
    end
  end

  @[Extern]
  struct AACS_SERIAL_NUMBER
    property prerecorded_serial_number : UInt8[16]
    property mac : UInt8[16]
    def initialize(@prerecorded_serial_number : UInt8[16], @mac : UInt8[16])
    end
  end

  @[Extern]
  struct AACS_MEDIA_ID
    property media_id : UInt8[16]
    property mac : UInt8[16]
    def initialize(@media_id : UInt8[16], @mac : UInt8[16])
    end
  end

  @[Extern]
  struct AACS_SEND_CERTIFICATE
    property session_id : UInt32
    property certificate : Win32cr::Devices::Dvd::AACS_CERTIFICATE
    def initialize(@session_id : UInt32, @certificate : Win32cr::Devices::Dvd::AACS_CERTIFICATE)
    end
  end

  @[Extern]
  struct AACS_SEND_CHALLENGE_KEY
    property session_id : UInt32
    property challenge_key : Win32cr::Devices::Dvd::AACS_CHALLENGE_KEY
    def initialize(@session_id : UInt32, @challenge_key : Win32cr::Devices::Dvd::AACS_CHALLENGE_KEY)
    end
  end

  @[Extern]
  struct AACS_BINDING_NONCE
    property binding_nonce : UInt8[16]
    property mac : UInt8[16]
    def initialize(@binding_nonce : UInt8[16], @mac : UInt8[16])
    end
  end

  @[Extern]
  struct AACS_READ_BINDING_NONCE
    property session_id : UInt32
    property number_of_sectors : UInt32
    property start_lba : UInt64
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property handle : Win32cr::Foundation::HANDLE
    property force_structure_length_to_match64bit : UInt64
    def initialize(@handle : Win32cr::Foundation::HANDLE, @force_structure_length_to_match64bit : UInt64)
    end
    end

    def initialize(@session_id : UInt32, @number_of_sectors : UInt32, @start_lba : UInt64, @anonymous : Anonymous_e__Union_)
    end
  end

end