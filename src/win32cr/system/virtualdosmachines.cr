require "../system/kernel.cr"
require "../foundation.cr"
require "../system/diagnostics/debug.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  VDMCONTEXT_i386 = 65536_u32
  VDMCONTEXT_i486 = 65536_u32
  VDM_KGDT_R3_CODE = 24_u32
  VDM_MAXIMUM_SUPPORTED_EXTENSION = 512_u32
  V86FLAGS_CARRY = 1_u32
  V86FLAGS_PARITY = 4_u32
  V86FLAGS_AUXCARRY = 16_u32
  V86FLAGS_ZERO = 64_u32
  V86FLAGS_SIGN = 128_u32
  V86FLAGS_TRACE = 256_u32
  V86FLAGS_INTERRUPT = 512_u32
  V86FLAGS_DIRECTION = 1024_u32
  V86FLAGS_OVERFLOW = 2048_u32
  V86FLAGS_IOPL = 12288_u32
  V86FLAGS_IOPL_BITS = 18_u32
  V86FLAGS_RESUME = 65536_u32
  V86FLAGS_V86 = 131072_u32
  V86FLAGS_ALIGNMENT = 262144_u32
  STATUS_VDM_EVENT = 1073741829_i32
  DBG_SEGLOAD = 0_u32
  DBG_SEGMOVE = 1_u32
  DBG_SEGFREE = 2_u32
  DBG_MODLOAD = 3_u32
  DBG_MODFREE = 4_u32
  DBG_SINGLESTEP = 5_u32
  DBG_BREAK = 6_u32
  DBG_GPFAULT = 7_u32
  DBG_DIVOVERFLOW = 8_u32
  DBG_INSTRFAULT = 9_u32
  DBG_TASKSTART = 10_u32
  DBG_TASKSTOP = 11_u32
  DBG_DLLSTART = 12_u32
  DBG_DLLSTOP = 13_u32
  DBG_ATTACH = 14_u32
  DBG_TOOLHELP = 15_u32
  DBG_STACKFAULT = 16_u32
  DBG_WOWINIT = 17_u32
  DBG_TEMPBP = 18_u32
  DBG_MODMOVE = 19_u32
  DBG_INIT = 20_u32
  DBG_GPFAULT2 = 21_u32
  VDMEVENT_NEEDS_INTERACTIVE = 32768_u32
  VDMEVENT_VERBOSE = 16384_u32
  VDMEVENT_PE = 8192_u32
  VDMEVENT_ALLFLAGS = 57344_u32
  VDMEVENT_V86 = 1_u32
  VDMEVENT_PM16 = 2_u32
  MAX_MODULE_NAME = 9_u32
  MAX_PATH16 = 255_u32
  SN_CODE = 0_u32
  SN_DATA = 1_u32
  SN_V86 = 2_u32
  GLOBAL_ALL = 0_u32
  GLOBAL_LRU = 1_u32
  GLOBAL_FREE = 2_u32
  GT_UNKNOWN = 0_u32
  GT_DGROUP = 1_u32
  GT_DATA = 2_u32
  GT_CODE = 3_u32
  GT_TASK = 4_u32
  GT_RESOURCE = 5_u32
  GT_MODULE = 6_u32
  GT_FREE = 7_u32
  GT_INTERNAL = 8_u32
  GT_SENTINEL = 9_u32
  GT_BURGERMASTER = 10_u32
  GD_USERDEFINED = 0_u32
  GD_CURSORCOMPONENT = 1_u32
  GD_BITMAP = 2_u32
  GD_ICONCOMPONENT = 3_u32
  GD_MENU = 4_u32
  GD_DIALOG = 5_u32
  GD_STRING = 6_u32
  GD_FONTDIR = 7_u32
  GD_FONT = 8_u32
  GD_ACCELERATORS = 9_u32
  GD_RCDATA = 10_u32
  GD_ERRTABLE = 11_u32
  GD_CURSOR = 12_u32
  GD_ICON = 14_u32
  GD_NAMETABLE = 15_u32
  GD_MAX_RESOURCE = 15_u32
  VDMDBG_BREAK_DOSTASK = 1_u32
  VDMDBG_BREAK_WOWTASK = 2_u32
  VDMDBG_BREAK_LOADDLL = 4_u32
  VDMDBG_BREAK_EXCEPTIONS = 8_u32
  VDMDBG_BREAK_DEBUGGER = 16_u32
  VDMDBG_TRACE_HISTORY = 128_u32
  VDMDBG_BREAK_DIVIDEBYZERO = 256_u32
  VDMDBG_INITIAL_FLAGS = 256_u32
  VDMDBG_MAX_SYMBOL_BUFFER = 256_u32
  VDMADDR_V86 = 2_u32
  VDMADDR_PM16 = 4_u32
  VDMADDR_PM32 = 16_u32

  alias DEBUGEVENTPROC = Proc(DEBUG_EVENT*, Void*, UInt32)
  alias PROCESSENUMPROC = Proc(UInt32, UInt32, LPARAM, LibC::BOOL)
  alias TASKENUMPROC = Proc(UInt32, UInt16, UInt16, LPARAM, LibC::BOOL)
  alias TASKENUMPROCEX = Proc(UInt32, UInt16, UInt16, Int8*, Int8*, LPARAM, LibC::BOOL)
  alias VDMPROCESSEXCEPTIONPROC = Proc(DEBUG_EVENT*, LibC::BOOL)
  alias VDMGETTHREADSELECTORENTRYPROC = Proc(LibC::HANDLE, LibC::HANDLE, UInt32, VDMLDT_ENTRY*, LibC::BOOL)
  alias VDMGETPOINTERPROC = Proc(LibC::HANDLE, LibC::HANDLE, UInt16, UInt32, LibC::BOOL, UInt32)
  alias VDMGETCONTEXTPROC = Proc(LibC::HANDLE, LibC::HANDLE, VDMCONTEXT*, LibC::BOOL)
  alias VDMSETCONTEXTPROC = Proc(LibC::HANDLE, LibC::HANDLE, VDMCONTEXT*, LibC::BOOL)
  alias VDMKILLWOWPROC = Proc(LibC::BOOL)
  alias VDMDETECTWOWPROC = Proc(LibC::BOOL)
  alias VDMBREAKTHREADPROC = Proc(LibC::HANDLE, LibC::BOOL)
  alias VDMGETSELECTORMODULEPROC = Proc(LibC::HANDLE, LibC::HANDLE, UInt16, UInt32*, PSTR, UInt32, PSTR, UInt32, LibC::BOOL)
  alias VDMGETMODULESELECTORPROC = Proc(LibC::HANDLE, LibC::HANDLE, UInt32, PSTR, UInt16*, LibC::BOOL)
  alias VDMMODULEFIRSTPROC = Proc(LibC::HANDLE, LibC::HANDLE, MODULEENTRY*, DEBUGEVENTPROC, Void*, LibC::BOOL)
  alias VDMMODULENEXTPROC = Proc(LibC::HANDLE, LibC::HANDLE, MODULEENTRY*, DEBUGEVENTPROC, Void*, LibC::BOOL)
  alias VDMGLOBALFIRSTPROC = Proc(LibC::HANDLE, LibC::HANDLE, GLOBALENTRY*, UInt16, DEBUGEVENTPROC, Void*, LibC::BOOL)
  alias VDMGLOBALNEXTPROC = Proc(LibC::HANDLE, LibC::HANDLE, GLOBALENTRY*, UInt16, DEBUGEVENTPROC, Void*, LibC::BOOL)
  alias VDMENUMPROCESSWOWPROC = Proc(PROCESSENUMPROC, LPARAM, Int32)
  alias VDMENUMTASKWOWPROC = Proc(UInt32, TASKENUMPROC, LPARAM, Int32)
  alias VDMENUMTASKWOWEXPROC = Proc(UInt32, TASKENUMPROCEX, LPARAM, Int32)
  alias VDMTERMINATETASKINWOWPROC = Proc(UInt32, UInt16, LibC::BOOL)
  alias VDMSTARTTASKINWOWPROC = Proc(UInt32, PSTR, UInt16, LibC::BOOL)
  alias VDMGETDBGFLAGSPROC = Proc(LibC::HANDLE, UInt32)
  alias VDMSETDBGFLAGSPROC = Proc(LibC::HANDLE, UInt32, LibC::BOOL)
  alias VDMISMODULELOADEDPROC = Proc(PSTR, LibC::BOOL)
  alias VDMGETSEGMENTINFOPROC = Proc(UInt16, UInt32, LibC::BOOL, VDM_SEGINFO, LibC::BOOL)
  alias VDMGETSYMBOLPROC = Proc(PSTR, UInt16, UInt32, LibC::BOOL, LibC::BOOL, UInt8*, UInt32*, LibC::BOOL)
  alias VDMGETADDREXPRESSIONPROC = Proc(PSTR, PSTR, UInt16*, UInt32*, UInt16*, LibC::BOOL)

  union VDMLDT_ENTRY_HighWord_e__Union
    bytes : VDMLDT_ENTRY_HighWord_e__Union_Bytes_e__Struct
    bits : VDMLDT_ENTRY_HighWord_e__Union_Bits_e__Struct
  end

  struct VDMCONTEXT
    context_flags : UInt32
    dr0 : UInt32
    dr1 : UInt32
    dr2 : UInt32
    dr3 : UInt32
    dr6 : UInt32
    dr7 : UInt32
    float_save : FLOATING_SAVE_AREA
    seg_gs : UInt32
    seg_fs : UInt32
    seg_es : UInt32
    seg_ds : UInt32
    edi : UInt32
    esi : UInt32
    ebx : UInt32
    edx : UInt32
    ecx : UInt32
    eax : UInt32
    ebp : UInt32
    eip : UInt32
    seg_cs : UInt32
    e_flags : UInt32
    esp : UInt32
    seg_ss : UInt32
    extended_registers : UInt8[512]*
  end
  struct VDMLDT_ENTRY
    limit_low : UInt16
    base_low : UInt16
    high_word : VDMLDT_ENTRY_HighWord_e__Union
  end
  struct VDMLDT_ENTRY_HighWord_e__Union_Bits_e__Struct
    _bitfield : UInt32
  end
  struct VDMLDT_ENTRY_HighWord_e__Union_Bytes_e__Struct
    base_mid : UInt8
    flags1 : UInt8
    flags2 : UInt8
    base_hi : UInt8
  end
  struct VDMCONTEXT_WITHOUT_XSAVE
    context_flags : UInt32
    dr0 : UInt32
    dr1 : UInt32
    dr2 : UInt32
    dr3 : UInt32
    dr6 : UInt32
    dr7 : UInt32
    float_save : FLOATING_SAVE_AREA
    seg_gs : UInt32
    seg_fs : UInt32
    seg_es : UInt32
    seg_ds : UInt32
    edi : UInt32
    esi : UInt32
    ebx : UInt32
    edx : UInt32
    ecx : UInt32
    eax : UInt32
    ebp : UInt32
    eip : UInt32
    seg_cs : UInt32
    e_flags : UInt32
    esp : UInt32
    seg_ss : UInt32
  end
  struct SEGMENT_NOTE
    selector1 : UInt16
    selector2 : UInt16
    segment : UInt16
    module : CHAR[10]*
    file_name : CHAR[256]*
    type : UInt16
    length : UInt32
  end
  struct IMAGE_NOTE
    module : CHAR[10]*
    file_name : CHAR[256]*
    h_module : UInt16
    h_task : UInt16
  end
  struct MODULEENTRY
    dw_size : UInt32
    sz_module : CHAR[10]*
    h_module : LibC::HANDLE
    wc_usage : UInt16
    sz_exe_path : CHAR[256]*
    w_next : UInt16
  end
  struct TEMP_BP_NOTE
    seg : UInt16
    offset : UInt32
    b_pm : LibC::BOOL
  end
  struct VDM_SEGINFO
    selector : UInt16
    seg_number : UInt16
    length : UInt32
    type : UInt16
    module_name : CHAR[9]*
    file_name : CHAR[255]*
  end
  struct GLOBALENTRY
    dw_size : UInt32
    dw_address : UInt32
    dw_block_size : UInt32
    h_block : LibC::HANDLE
    wc_lock : UInt16
    wc_page_lock : UInt16
    w_flags : UInt16
    w_heap_present : LibC::BOOL
    h_owner : LibC::HANDLE
    w_type : UInt16
    w_data : UInt16
    dw_next : UInt32
    dw_next_alt : UInt32
  end

end
