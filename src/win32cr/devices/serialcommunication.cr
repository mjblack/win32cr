require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:msports.dll")]
{% else %}
@[Link("msports")]
{% end %}
lib LibWin32
  alias HCOMDB = LibC::IntPtrT

  COMDB_MIN_PORTS_ARBITRATED = 256_u32
  COMDB_MAX_PORTS_ARBITRATED = 4096_u32
  CDB_REPORT_BITS = 0_u32
  CDB_REPORT_BYTES = 1_u32


  # Params # phcomdb : LibC::IntPtrT* [In]
  fun ComDBOpen(phcomdb : LibC::IntPtrT*) : Int32

  # Params # hcomdb : HCOMDB [In]
  fun ComDBClose(hcomdb : HCOMDB) : Int32

  # Params # hcomdb : HCOMDB [In],buffer : UInt8* [In],buffersize : UInt32 [In],reporttype : UInt32 [In],maxportsreported : UInt32* [In]
  fun ComDBGetCurrentPortUsage(hcomdb : HCOMDB, buffer : UInt8*, buffersize : UInt32, reporttype : UInt32, maxportsreported : UInt32*) : Int32

  # Params # hcomdb : HCOMDB [In],comnumber : UInt32* [In]
  fun ComDBClaimNextFreePort(hcomdb : HCOMDB, comnumber : UInt32*) : Int32

  # Params # hcomdb : HCOMDB [In],comnumber : UInt32 [In],forceclaim : LibC::BOOL [In],forced : LibC::BOOL* [In]
  fun ComDBClaimPort(hcomdb : HCOMDB, comnumber : UInt32, forceclaim : LibC::BOOL, forced : LibC::BOOL*) : Int32

  # Params # hcomdb : HCOMDB [In],comnumber : UInt32 [In]
  fun ComDBReleasePort(hcomdb : HCOMDB, comnumber : UInt32) : Int32

  # Params # hcomdb : HCOMDB [In],newsize : UInt32 [In]
  fun ComDBResizeDatabase(hcomdb : HCOMDB, newsize : UInt32) : Int32
end
