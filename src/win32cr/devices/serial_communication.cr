require "./../foundation.cr"

module Win32cr::Devices::SerialCommunication
  alias HCOMDB = LibC::IntPtrT
  COMDB_MIN_PORTS_ARBITRATED = 256_u32
  COMDB_MAX_PORTS_ARBITRATED = 4096_u32
  CDB_REPORT_BITS = 0_u32
  CDB_REPORT_BYTES = 1_u32


  @[Link("msports")]
  lib C
    fun ComDBOpen(ph_com_db : LibC::IntPtrT*) : Int32

    fun ComDBClose(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB) : Int32

    fun ComDBGetCurrentPortUsage(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, buffer : UInt8*, buffer_size : UInt32, report_type : UInt32, max_ports_reported : UInt32*) : Int32

    fun ComDBClaimNextFreePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32*) : Int32

    fun ComDBClaimPort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32, force_claim : Win32cr::Foundation::BOOL, forced : Win32cr::Foundation::BOOL*) : Int32

    fun ComDBReleasePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32) : Int32

    fun ComDBResizeDatabase(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, new_size : UInt32) : Int32

  end
end