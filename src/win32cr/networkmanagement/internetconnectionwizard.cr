require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  ICW_MAX_ACCTNAME = 256_u32
  ICW_MAX_PASSWORD = 256_u32
  ICW_MAX_LOGONNAME = 256_u32
  ICW_MAX_SERVERNAME = 64_u32
  ICW_MAX_RASNAME = 256_u32
  ICW_MAX_EMAILNAME = 64_u32
  ICW_MAX_EMAILADDR = 128_u32
  ICW_CHECKSTATUS = 1_u32
  ICW_LAUNCHFULL = 256_u32
  ICW_LAUNCHMANUAL = 512_u32
  ICW_USE_SHELLNEXT = 1024_u32
  ICW_FULL_SMARTSTART = 2048_u32
  ICW_FULLPRESENT = 1_u32
  ICW_MANUALPRESENT = 2_u32
  ICW_ALREADYRUN = 4_u32
  ICW_LAUNCHEDFULL = 256_u32
  ICW_LAUNCHEDMANUAL = 512_u32
  ICW_USEDEFAULTS = 1_u32

  alias PFNCHECKCONNECTIONWIZARD = Proc(UInt32, UInt32*, UInt32)
  alias PFNSETSHELLNEXT = Proc(PSTR, UInt32)

end