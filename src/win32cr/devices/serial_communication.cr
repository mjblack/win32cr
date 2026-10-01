require "./../foundation.cr"

module Win32cr::Devices::SerialCommunication
  extend self
  alias HCOMDB = Void*
  alias PSERENUM_READPORT = Proc(Void*, UInt8)

  alias PSERENUM_WRITEPORT = Proc(Void*, UInt8, Void)

  DEVPKEY_DeviceInterface_Serial_UsbVendorId = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 2_u32)
  DEVPKEY_DeviceInterface_Serial_UsbProductId = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 3_u32)
  DEVPKEY_DeviceInterface_Serial_PortName = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x4c6bf15c_u32, 0x4c03_u16, 0x4aac_u16, StaticArray[0x91_u8, 0xf5_u8, 0x64_u8, 0xc0_u8, 0xf8_u8, 0x52_u8, 0xbc_u8, 0xf4_u8]), 4_u32)
  IOCTL_SERIAL_SET_BAUD_RATE = 1769476_u32
  IOCTL_SERIAL_SET_QUEUE_SIZE = 1769480_u32
  IOCTL_SERIAL_SET_LINE_CONTROL = 1769484_u32
  IOCTL_SERIAL_SET_BREAK_ON = 1769488_u32
  IOCTL_SERIAL_SET_BREAK_OFF = 1769492_u32
  IOCTL_SERIAL_IMMEDIATE_CHAR = 1769496_u32
  IOCTL_SERIAL_SET_TIMEOUTS = 1769500_u32
  IOCTL_SERIAL_GET_TIMEOUTS = 1769504_u32
  IOCTL_SERIAL_SET_DTR = 1769508_u32
  IOCTL_SERIAL_CLR_DTR = 1769512_u32
  IOCTL_SERIAL_RESET_DEVICE = 1769516_u32
  IOCTL_SERIAL_SET_RTS = 1769520_u32
  IOCTL_SERIAL_CLR_RTS = 1769524_u32
  IOCTL_SERIAL_SET_XOFF = 1769528_u32
  IOCTL_SERIAL_SET_XON = 1769532_u32
  IOCTL_SERIAL_GET_WAIT_MASK = 1769536_u32
  IOCTL_SERIAL_SET_WAIT_MASK = 1769540_u32
  IOCTL_SERIAL_WAIT_ON_MASK = 1769544_u32
  IOCTL_SERIAL_PURGE = 1769548_u32
  IOCTL_SERIAL_GET_BAUD_RATE = 1769552_u32
  IOCTL_SERIAL_GET_LINE_CONTROL = 1769556_u32
  IOCTL_SERIAL_GET_CHARS = 1769560_u32
  IOCTL_SERIAL_SET_CHARS = 1769564_u32
  IOCTL_SERIAL_GET_HANDFLOW = 1769568_u32
  IOCTL_SERIAL_SET_HANDFLOW = 1769572_u32
  IOCTL_SERIAL_GET_MODEMSTATUS = 1769576_u32
  IOCTL_SERIAL_GET_COMMSTATUS = 1769580_u32
  IOCTL_SERIAL_XOFF_COUNTER = 1769584_u32
  IOCTL_SERIAL_GET_PROPERTIES = 1769588_u32
  IOCTL_SERIAL_GET_DTRRTS = 1769592_u32
  IOCTL_SERIAL_CONFIG_SIZE = 1769600_u32
  IOCTL_SERIAL_GET_COMMCONFIG = 1769604_u32
  IOCTL_SERIAL_SET_COMMCONFIG = 1769608_u32
  IOCTL_SERIAL_GET_STATS = 1769612_u32
  IOCTL_SERIAL_CLEAR_STATS = 1769616_u32
  IOCTL_SERIAL_GET_MODEM_CONTROL = 1769620_u32
  IOCTL_SERIAL_SET_MODEM_CONTROL = 1769624_u32
  IOCTL_SERIAL_SET_FIFO_CONTROL = 1769628_u32
  IOCTL_SERIAL_APPLY_DEFAULT_CONFIGURATION = 1769632_u32
  IOCTL_SERIAL_SET_INTERVAL_TIMER_RESOLUTION = 1769636_u32
  IOCTL_SERIAL_INTERNAL_DO_WAIT_WAKE = 1769476_u32
  IOCTL_SERIAL_INTERNAL_CANCEL_WAIT_WAKE = 1769480_u32
  IOCTL_SERIAL_INTERNAL_BASIC_SETTINGS = 1769484_u32
  IOCTL_SERIAL_INTERNAL_RESTORE_SETTINGS = 1769488_u32
  SERIAL_EV_RXCHAR = 1_u32
  SERIAL_EV_RXFLAG = 2_u32
  SERIAL_EV_TXEMPTY = 4_u32
  SERIAL_EV_CTS = 8_u32
  SERIAL_EV_DSR = 16_u32
  SERIAL_EV_RLSD = 32_u32
  SERIAL_EV_BREAK = 64_u32
  SERIAL_EV_ERR = 128_u32
  SERIAL_EV_RING = 256_u32
  SERIAL_EV_PERR = 512_u32
  SERIAL_EV_RX80FULL = 1024_u32
  SERIAL_EV_EVENT1 = 2048_u32
  SERIAL_EV_EVENT2 = 4096_u32
  SERIAL_PURGE_TXABORT = 1_u32
  SERIAL_PURGE_RXABORT = 2_u32
  SERIAL_PURGE_TXCLEAR = 4_u32
  SERIAL_PURGE_RXCLEAR = 8_u32
  STOP_BIT_1 = 0_u32
  STOP_BITS_1_5 = 1_u32
  STOP_BITS_2 = 2_u32
  NO_PARITY = 0_u32
  ODD_PARITY = 1_u32
  EVEN_PARITY = 2_u32
  MARK_PARITY = 3_u32
  SPACE_PARITY = 4_u32
  SERIAL_LSRMST_ESCAPE = 0_u16
  SERIAL_LSRMST_LSR_DATA = 1_u16
  SERIAL_LSRMST_LSR_NODATA = 2_u16
  SERIAL_LSRMST_MST = 3_u16
  IOCTL_INTERNAL_SERENUM_REMOVE_SELF = 3604999_u32
  COMDB_MIN_PORTS_ARBITRATED = 256_u32
  COMDB_MAX_PORTS_ARBITRATED = 4096_u32
  CDB_REPORT_BITS = 0_u32
  CDB_REPORT_BYTES = 1_u32

  enum SERENUM_PORTION
    SerenumFirstHalf = 0_i32
    SerenumSecondHalf = 1_i32
    SerenumWhole = 2_i32
  end

  @[Extern]
  struct SERIALPERF_STATS
    property received_count : UInt32
    property transmitted_count : UInt32
    property frame_error_count : UInt32
    property serial_overrun_error_count : UInt32
    property buffer_overrun_error_count : UInt32
    property parity_error_count : UInt32
    def initialize(@received_count : UInt32, @transmitted_count : UInt32, @frame_error_count : UInt32, @serial_overrun_error_count : UInt32, @buffer_overrun_error_count : UInt32, @parity_error_count : UInt32)
    end
  end

  @[Extern]
  struct SERIALCONFIG
    property size : UInt32
    property version : UInt16
    property sub_type : UInt32
    property prov_offset : UInt32
    property provider_size : UInt32
    property provider_data : UInt16[1]
    def initialize(@size : UInt32, @version : UInt16, @sub_type : UInt32, @prov_offset : UInt32, @provider_size : UInt32, @provider_data : UInt16[1])
    end
  end

  @[Extern]
  struct SERIAL_LINE_CONTROL
    property stop_bits : UInt8
    property parity : UInt8
    property word_length : UInt8
    def initialize(@stop_bits : UInt8, @parity : UInt8, @word_length : UInt8)
    end
  end

  @[Extern]
  struct SERIAL_TIMEOUTS
    property read_interval_timeout : UInt32
    property read_total_timeout_multiplier : UInt32
    property read_total_timeout_constant : UInt32
    property write_total_timeout_multiplier : UInt32
    property write_total_timeout_constant : UInt32
    def initialize(@read_interval_timeout : UInt32, @read_total_timeout_multiplier : UInt32, @read_total_timeout_constant : UInt32, @write_total_timeout_multiplier : UInt32, @write_total_timeout_constant : UInt32)
    end
  end

  @[Extern]
  struct SERIAL_QUEUE_SIZE
    property in_size : UInt32
    property out_size : UInt32
    def initialize(@in_size : UInt32, @out_size : UInt32)
    end
  end

  @[Extern]
  struct SERIAL_BAUD_RATE
    property baud_rate : UInt32
    def initialize(@baud_rate : UInt32)
    end
  end

  @[Extern]
  struct SERIAL_CHARS
    property eof_char : UInt8
    property error_char : UInt8
    property break_char : UInt8
    property event_char : UInt8
    property xon_char : UInt8
    property xoff_char : UInt8
    def initialize(@eof_char : UInt8, @error_char : UInt8, @break_char : UInt8, @event_char : UInt8, @xon_char : UInt8, @xoff_char : UInt8)
    end
  end

  @[Extern]
  struct SERIAL_HANDFLOW
    property control_hand_shake : UInt32
    property flow_replace : UInt32
    property xon_limit : Int32
    property xoff_limit : Int32
    def initialize(@control_hand_shake : UInt32, @flow_replace : UInt32, @xon_limit : Int32, @xoff_limit : Int32)
    end
  end

  @[Extern]
  struct SERIAL_BASIC_SETTINGS
    property timeouts : Win32cr::Devices::SerialCommunication::SERIAL_TIMEOUTS
    property hand_flow : Win32cr::Devices::SerialCommunication::SERIAL_HANDFLOW
    property rx_fifo : UInt32
    property tx_fifo : UInt32
    def initialize(@timeouts : Win32cr::Devices::SerialCommunication::SERIAL_TIMEOUTS, @hand_flow : Win32cr::Devices::SerialCommunication::SERIAL_HANDFLOW, @rx_fifo : UInt32, @tx_fifo : UInt32)
    end
  end

  @[Extern]
  struct SERIAL_STATUS
    property errors : UInt32
    property hold_reasons : UInt32
    property amount_in_in_queue : UInt32
    property amount_in_out_queue : UInt32
    property eof_received : Win32cr::Foundation::BOOLEAN
    property wait_for_immediate : Win32cr::Foundation::BOOLEAN
    def initialize(@errors : UInt32, @hold_reasons : UInt32, @amount_in_in_queue : UInt32, @amount_in_out_queue : UInt32, @eof_received : Win32cr::Foundation::BOOLEAN, @wait_for_immediate : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SERIAL_XOFF_COUNTER
    property timeout : UInt32
    property counter : Int32
    property xoff_char : UInt8
    def initialize(@timeout : UInt32, @counter : Int32, @xoff_char : UInt8)
    end
  end

  @[Extern]
  struct SERIAL_COMMPROP
    property packet_length : UInt16
    property packet_version : UInt16
    property service_mask : UInt32
    property reserved1 : UInt32
    property max_tx_queue : UInt32
    property max_rx_queue : UInt32
    property max_baud : UInt32
    property prov_sub_type : UInt32
    property prov_capabilities : UInt32
    property settable_params : UInt32
    property settable_baud : UInt32
    property settable_data : UInt16
    property settable_stop_parity : UInt16
    property current_tx_queue : UInt32
    property current_rx_queue : UInt32
    property prov_spec1 : UInt32
    property prov_spec2 : UInt32
    property prov_char : UInt16[1]
    def initialize(@packet_length : UInt16, @packet_version : UInt16, @service_mask : UInt32, @reserved1 : UInt32, @max_tx_queue : UInt32, @max_rx_queue : UInt32, @max_baud : UInt32, @prov_sub_type : UInt32, @prov_capabilities : UInt32, @settable_params : UInt32, @settable_baud : UInt32, @settable_data : UInt16, @settable_stop_parity : UInt16, @current_tx_queue : UInt32, @current_rx_queue : UInt32, @prov_spec1 : UInt32, @prov_spec2 : UInt32, @prov_char : UInt16[1])
    end
  end

  @[Extern]
  struct SERENUM_PORT_DESC
    property size : UInt32
    property port_handle : Void*
    property port_address : Int64
    property reserved : UInt16[1]
    def initialize(@size : UInt32, @port_handle : Void*, @port_address : Int64, @reserved : UInt16[1])
    end
  end

  @[Extern]
  struct SERENUM_PORT_PARAMETERS
    property size : UInt32
    property read_accessor : Win32cr::Devices::SerialCommunication::PSERENUM_READPORT
    property write_accessor : Win32cr::Devices::SerialCommunication::PSERENUM_WRITEPORT
    property ser_port_address : Void*
    property hardware_handle : Void*
    property portion : Win32cr::Devices::SerialCommunication::SERENUM_PORTION
    property number_axis : UInt16
    property reserved : UInt16[3]
    def initialize(@size : UInt32, @read_accessor : Win32cr::Devices::SerialCommunication::PSERENUM_READPORT, @write_accessor : Win32cr::Devices::SerialCommunication::PSERENUM_WRITEPORT, @ser_port_address : Void*, @hardware_handle : Void*, @portion : Win32cr::Devices::SerialCommunication::SERENUM_PORTION, @number_axis : UInt16, @reserved : UInt16[3])
    end
  end

  def comDBOpen(ph_com_db : Win32cr::Devices::SerialCommunication::HCOMDB*) : Int32
    {% if !flag?(:docs) %}
    C.ComDBOpen(ph_com_db)
    {% end %}
  end

  def comDBClose(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB) : Int32
    {% if !flag?(:docs) %}
    C.ComDBClose(h_com_db)
    {% end %}
  end

  def comDBGetCurrentPortUsage(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, buffer : UInt8*, buffer_size : UInt32, report_type : UInt32, max_ports_reported : UInt32*) : Int32
    {% if !flag?(:docs) %}
    C.ComDBGetCurrentPortUsage(h_com_db, buffer, buffer_size, report_type, max_ports_reported)
    {% end %}
  end

  def comDBClaimNextFreePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32*) : Int32
    {% if !flag?(:docs) %}
    C.ComDBClaimNextFreePort(h_com_db, com_number)
    {% end %}
  end

  def comDBClaimPort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32, force_claim : Win32cr::Foundation::BOOL, forced : Win32cr::Foundation::BOOL*) : Int32
    {% if !flag?(:docs) %}
    C.ComDBClaimPort(h_com_db, com_number, force_claim, forced)
    {% end %}
  end

  def comDBReleasePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.ComDBReleasePort(h_com_db, com_number)
    {% end %}
  end

  def comDBResizeDatabase(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, new_size : UInt32) : Int32
    {% if !flag?(:docs) %}
    C.ComDBResizeDatabase(h_com_db, new_size)
    {% end %}
  end

  @[Link("msports")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun ComDBOpen(ph_com_db : Win32cr::Devices::SerialCommunication::HCOMDB*) : Int32

    # :nodoc:
    fun ComDBClose(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB) : Int32

    # :nodoc:
    fun ComDBGetCurrentPortUsage(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, buffer : UInt8*, buffer_size : UInt32, report_type : UInt32, max_ports_reported : UInt32*) : Int32

    # :nodoc:
    fun ComDBClaimNextFreePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32*) : Int32

    # :nodoc:
    fun ComDBClaimPort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32, force_claim : Win32cr::Foundation::BOOL, forced : Win32cr::Foundation::BOOL*) : Int32

    # :nodoc:
    fun ComDBReleasePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32) : Int32

    # :nodoc:
    fun ComDBResizeDatabase(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, new_size : UInt32) : Int32

  end
  {% end %}
end