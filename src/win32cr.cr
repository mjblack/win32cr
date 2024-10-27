require "./win32cr/com_ptr"

module Win32cr
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end

struct LibC::GUID
  def to_s
    sprintf("%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X", @data1, @data2, @data3, @data4[0], @data4[1], @data4[2], @data4[3], @data4[4], @data4[5], @data4[6], @data4[7])
  end
  def to_clsid
    sprintf("{%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}", @data1, @data2, @data3, @data4[0], @data4[1], @data4[2], @data4[3], @data4[4], @data4[5], @data4[6], @data4[7])
  end
end