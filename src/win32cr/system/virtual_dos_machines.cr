require "./kernel.cr"
require "./../foundation.cr"
require "./diagnostics/debug.cr"

module Win32cr::System::VirtualDosMachines
  extend self
  alias DEBUGEVENTPROC = Proc(Win32cr::System::Diagnostics::Debug::DEBUG_EVENT*, Void*, UInt32)

  alias PROCESSENUMPROC = Proc(UInt32, UInt32, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias TASKENUMPROC = Proc(UInt32, UInt16, UInt16, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias TASKENUMPROCEX = Proc(UInt32, UInt16, UInt16, Int8*, Int8*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL)

  alias VDMPROCESSEXCEPTIONPROC = Proc(Win32cr::System::Diagnostics::Debug::DEBUG_EVENT*, Win32cr::Foundation::BOOL)

  {% if flag?(:x86_64) || flag?(:arm) %}
  alias VDMGETTHREADSELECTORENTRYPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt32, Win32cr::System::VirtualDosMachines::VDMLDT_ENTRY*, Win32cr::Foundation::BOOL)
  {% end %}

  alias VDMGETPOINTERPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt16, UInt32, Win32cr::Foundation::BOOL, UInt32)

  {% if flag?(:x86_64) || flag?(:arm) %}
  alias VDMGETCONTEXTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::VirtualDosMachines::VDMCONTEXT*, Win32cr::Foundation::BOOL)
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  alias VDMSETCONTEXTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::VirtualDosMachines::VDMCONTEXT*, Win32cr::Foundation::BOOL)
  {% end %}

  alias VDMKILLWOWPROC = Proc(Win32cr::Foundation::BOOL)

  alias VDMDETECTWOWPROC = Proc(Win32cr::Foundation::BOOL)

  alias VDMBREAKTHREADPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)

  alias VDMGETSELECTORMODULEPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt16, UInt32*, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::BOOL)

  alias VDMGETMODULESELECTORPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::PSTR, UInt16*, Win32cr::Foundation::BOOL)

  alias VDMMODULEFIRSTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::VirtualDosMachines::MODULEENTRY*, Win32cr::System::VirtualDosMachines::DEBUGEVENTPROC, Void*, Win32cr::Foundation::BOOL)

  alias VDMMODULENEXTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::VirtualDosMachines::MODULEENTRY*, Win32cr::System::VirtualDosMachines::DEBUGEVENTPROC, Void*, Win32cr::Foundation::BOOL)

  alias VDMGLOBALFIRSTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::VirtualDosMachines::GLOBALENTRY*, UInt16, Win32cr::System::VirtualDosMachines::DEBUGEVENTPROC, Void*, Win32cr::Foundation::BOOL)

  alias VDMGLOBALNEXTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::VirtualDosMachines::GLOBALENTRY*, UInt16, Win32cr::System::VirtualDosMachines::DEBUGEVENTPROC, Void*, Win32cr::Foundation::BOOL)

  alias VDMENUMPROCESSWOWPROC = Proc(Win32cr::System::VirtualDosMachines::PROCESSENUMPROC, Win32cr::Foundation::LPARAM, Int32)

  alias VDMENUMTASKWOWPROC = Proc(UInt32, Win32cr::System::VirtualDosMachines::TASKENUMPROC, Win32cr::Foundation::LPARAM, Int32)

  alias VDMENUMTASKWOWEXPROC = Proc(UInt32, Win32cr::System::VirtualDosMachines::TASKENUMPROCEX, Win32cr::Foundation::LPARAM, Int32)

  alias VDMTERMINATETASKINWOWPROC = Proc(UInt32, UInt16, Win32cr::Foundation::BOOL)

  alias VDMSTARTTASKINWOWPROC = Proc(UInt32, Win32cr::Foundation::PSTR, UInt16, Win32cr::Foundation::BOOL)

  alias VDMGETDBGFLAGSPROC = Proc(Win32cr::Foundation::HANDLE, UInt32)

  alias VDMSETDBGFLAGSPROC = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::BOOL)

  alias VDMISMODULELOADEDPROC = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::BOOL)

  alias VDMGETSEGMENTINFOPROC = Proc(UInt16, UInt32, Win32cr::Foundation::BOOL, Win32cr::System::VirtualDosMachines::VDM_SEGINFO, Win32cr::Foundation::BOOL)

  alias VDMGETSYMBOLPROC = Proc(Win32cr::Foundation::PSTR, UInt16, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, UInt8*, UInt32*, Win32cr::Foundation::BOOL)

  alias VDMGETADDREXPRESSIONPROC = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt16*, UInt32*, UInt16*, Win32cr::Foundation::BOOL)

  {% if flag?(:i386) %}
  alias VDMGETTHREADSELECTORENTRYPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, UInt32, Win32cr::System::Diagnostics::Debug::LDT_ENTRY*, Win32cr::Foundation::BOOL)
  {% end %}

  {% if flag?(:i386) %}
  alias VDMGETCONTEXTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::Diagnostics::Debug::CONTEXT*, Win32cr::Foundation::BOOL)
  {% end %}

  {% if flag?(:i386) %}
  alias VDMSETCONTEXTPROC = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::System::Diagnostics::Debug::CONTEXT*, Win32cr::Foundation::BOOL)
  {% end %}

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


  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct VDMCONTEXT
    property context_flags : UInt32
    property dr0 : UInt32
    property dr1 : UInt32
    property dr2 : UInt32
    property dr3 : UInt32
    property dr6 : UInt32
    property dr7 : UInt32
    property float_save : Win32cr::System::Kernel::FLOATING_SAVE_AREA
    property seg_gs : UInt32
    property seg_fs : UInt32
    property seg_es : UInt32
    property seg_ds : UInt32
    property edi : UInt32
    property esi : UInt32
    property ebx : UInt32
    property edx : UInt32
    property ecx : UInt32
    property eax : UInt32
    property ebp : UInt32
    property eip : UInt32
    property seg_cs : UInt32
    property e_flags : UInt32
    property esp : UInt32
    property seg_ss : UInt32
    property extended_registers : UInt8[512]
    def initialize(@context_flags : UInt32, @dr0 : UInt32, @dr1 : UInt32, @dr2 : UInt32, @dr3 : UInt32, @dr6 : UInt32, @dr7 : UInt32, @float_save : Win32cr::System::Kernel::FLOATING_SAVE_AREA, @seg_gs : UInt32, @seg_fs : UInt32, @seg_es : UInt32, @seg_ds : UInt32, @edi : UInt32, @esi : UInt32, @ebx : UInt32, @edx : UInt32, @ecx : UInt32, @eax : UInt32, @ebp : UInt32, @eip : UInt32, @seg_cs : UInt32, @e_flags : UInt32, @esp : UInt32, @seg_ss : UInt32, @extended_registers : UInt8[512])
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct VDMLDT_ENTRY
    property limit_low : UInt16
    property base_low : UInt16
    property high_word : HighWord_e__Union_

    # Nested Type HighWord_e__Union_
    @[Extern(union: true)]
    struct HighWord_e__Union_
    property bytes : Bytes_e__Struct_
    property bits : Bits_e__Struct_

      # Nested Type Bits_e__Struct_
      @[Extern]
      struct Bits_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end


      # Nested Type Bytes_e__Struct_
      @[Extern]
      struct Bytes_e__Struct_
    property base_mid : UInt8
    property flags1 : UInt8
    property flags2 : UInt8
    property base_hi : UInt8
    def initialize(@base_mid : UInt8, @flags1 : UInt8, @flags2 : UInt8, @base_hi : UInt8)
    end
      end

    def initialize(@bytes : Bytes_e__Struct_, @bits : Bits_e__Struct_)
    end
    end

    def initialize(@limit_low : UInt16, @base_low : UInt16, @high_word : HighWord_e__Union_)
    end
  end
  {% end %}

  @[Extern]
  struct VDMCONTEXT_WITHOUT_XSAVE
    property context_flags : UInt32
    property dr0 : UInt32
    property dr1 : UInt32
    property dr2 : UInt32
    property dr3 : UInt32
    property dr6 : UInt32
    property dr7 : UInt32
    property float_save : Win32cr::System::Kernel::FLOATING_SAVE_AREA
    property seg_gs : UInt32
    property seg_fs : UInt32
    property seg_es : UInt32
    property seg_ds : UInt32
    property edi : UInt32
    property esi : UInt32
    property ebx : UInt32
    property edx : UInt32
    property ecx : UInt32
    property eax : UInt32
    property ebp : UInt32
    property eip : UInt32
    property seg_cs : UInt32
    property e_flags : UInt32
    property esp : UInt32
    property seg_ss : UInt32
    def initialize(@context_flags : UInt32, @dr0 : UInt32, @dr1 : UInt32, @dr2 : UInt32, @dr3 : UInt32, @dr6 : UInt32, @dr7 : UInt32, @float_save : Win32cr::System::Kernel::FLOATING_SAVE_AREA, @seg_gs : UInt32, @seg_fs : UInt32, @seg_es : UInt32, @seg_ds : UInt32, @edi : UInt32, @esi : UInt32, @ebx : UInt32, @edx : UInt32, @ecx : UInt32, @eax : UInt32, @ebp : UInt32, @eip : UInt32, @seg_cs : UInt32, @e_flags : UInt32, @esp : UInt32, @seg_ss : UInt32)
    end
  end

  @[Extern]
  struct SEGMENT_NOTE
    property selector1 : UInt16
    property selector2 : UInt16
    property segment : UInt16
    property module__ : Win32cr::Foundation::CHAR[10]
    property file_name : Win32cr::Foundation::CHAR[256]
    property type__ : UInt16
    property length : UInt32
    def initialize(@selector1 : UInt16, @selector2 : UInt16, @segment : UInt16, @module__ : Win32cr::Foundation::CHAR[10], @file_name : Win32cr::Foundation::CHAR[256], @type__ : UInt16, @length : UInt32)
    end
  end

  @[Extern]
  struct IMAGE_NOTE
    property module__ : Win32cr::Foundation::CHAR[10]
    property file_name : Win32cr::Foundation::CHAR[256]
    property hModule : UInt16
    property hTask : UInt16
    def initialize(@module__ : Win32cr::Foundation::CHAR[10], @file_name : Win32cr::Foundation::CHAR[256], @hModule : UInt16, @hTask : UInt16)
    end
  end

  @[Extern]
  struct MODULEENTRY
    property dwSize : UInt32
    property szModule : Win32cr::Foundation::CHAR[10]
    property hModule : Win32cr::Foundation::HANDLE
    property wcUsage : UInt16
    property szExePath : Win32cr::Foundation::CHAR[256]
    property wNext : UInt16
    def initialize(@dwSize : UInt32, @szModule : Win32cr::Foundation::CHAR[10], @hModule : Win32cr::Foundation::HANDLE, @wcUsage : UInt16, @szExePath : Win32cr::Foundation::CHAR[256], @wNext : UInt16)
    end
  end

  @[Extern]
  struct TEMP_BP_NOTE
    property seg : UInt16
    property offset : UInt32
    property bPM : Win32cr::Foundation::BOOL
    def initialize(@seg : UInt16, @offset : UInt32, @bPM : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct VDM_SEGINFO
    property selector : UInt16
    property seg_number : UInt16
    property length : UInt32
    property type__ : UInt16
    property module_name : Win32cr::Foundation::CHAR[9]
    property file_name : Win32cr::Foundation::CHAR[255]
    def initialize(@selector : UInt16, @seg_number : UInt16, @length : UInt32, @type__ : UInt16, @module_name : Win32cr::Foundation::CHAR[9], @file_name : Win32cr::Foundation::CHAR[255])
    end
  end

  @[Extern]
  struct GLOBALENTRY
    property dwSize : UInt32
    property dwAddress : UInt32
    property dwBlockSize : UInt32
    property hBlock : Win32cr::Foundation::HANDLE
    property wcLock : UInt16
    property wcPageLock : UInt16
    property wFlags : UInt16
    property wHeapPresent : Win32cr::Foundation::BOOL
    property hOwner : Win32cr::Foundation::HANDLE
    property wType : UInt16
    property wData : UInt16
    property dwNext : UInt32
    property dwNextAlt : UInt32
    def initialize(@dwSize : UInt32, @dwAddress : UInt32, @dwBlockSize : UInt32, @hBlock : Win32cr::Foundation::HANDLE, @wcLock : UInt16, @wcPageLock : UInt16, @wFlags : UInt16, @wHeapPresent : Win32cr::Foundation::BOOL, @hOwner : Win32cr::Foundation::HANDLE, @wType : UInt16, @wData : UInt16, @dwNext : UInt32, @dwNextAlt : UInt32)
    end
  end

end