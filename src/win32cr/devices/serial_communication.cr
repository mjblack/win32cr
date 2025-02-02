require "./../foundation.cr"

module Win32cr::Devices::SerialCommunication
  extend self
  alias HCOMDB = LibC::IntPtrT
  COMDB_MIN_PORTS_ARBITRATED = 256_u32
  COMDB_MAX_PORTS_ARBITRATED = 4096_u32
  CDB_REPORT_BITS = 0_u32
  CDB_REPORT_BYTES = 1_u32


  def comDBOpen(ph_com_db : LibC::IntPtrT*) : Int32
    C.ComDBOpen(ph_com_db)
  end

  def comDBClose(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB) : Int32
    C.ComDBClose(h_com_db)
  end

  def comDBGetCurrentPortUsage(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, buffer : UInt8*, buffer_size : UInt32, report_type : UInt32, max_ports_reported : UInt32*) : Int32
    C.ComDBGetCurrentPortUsage(h_com_db, buffer, buffer_size, report_type, max_ports_reported)
  end

  def comDBClaimNextFreePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32*) : Int32
    C.ComDBClaimNextFreePort(h_com_db, com_number)
  end

  def comDBClaimPort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32, force_claim : Win32cr::Foundation::BOOL, forced : Win32cr::Foundation::BOOL*) : Int32
    C.ComDBClaimPort(h_com_db, com_number, force_claim, forced)
  end

  def comDBReleasePort(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, com_number : UInt32) : Int32
    C.ComDBReleasePort(h_com_db, com_number)
  end

  def comDBResizeDatabase(h_com_db : Win32cr::Devices::SerialCommunication::HCOMDB, new_size : UInt32) : Int32
    C.ComDBResizeDatabase(h_com_db, new_size)
  end

  @[Link("msports")]
  lib C
    # :nodoc:
    fun ComDBOpen(ph_com_db : LibC::IntPtrT*) : Int32

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
end