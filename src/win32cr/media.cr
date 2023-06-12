require "./media/multimedia.cr"
require "./system/com.cr"
require "./foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:winmm.dll")]
{% else %}
@[Link("winmm")]
{% end %}
lib LibWin32
  alias HTASK = LibC::IntPtrT

  TIMERR_NOERROR = 0_u32
  TIMERR_NOCANDO = 97_u32
  TIMERR_STRUCT = 129_u32
  MAXPNAMELEN = 32_u32
  MAXERRORLENGTH = 256_u32
  MM_MICROSOFT = 1_u32
  MM_MIDI_MAPPER = 1_u32
  MM_WAVE_MAPPER = 2_u32
  MM_SNDBLST_MIDIOUT = 3_u32
  MM_SNDBLST_MIDIIN = 4_u32
  MM_SNDBLST_SYNTH = 5_u32
  MM_SNDBLST_WAVEOUT = 6_u32
  MM_SNDBLST_WAVEIN = 7_u32
  MM_ADLIB = 9_u32
  MM_MPU401_MIDIOUT = 10_u32
  MM_MPU401_MIDIIN = 11_u32
  MM_PC_JOYSTICK = 12_u32
  TIME_MS = 1_u32
  TIME_SAMPLES = 2_u32
  TIME_BYTES = 4_u32
  TIME_SMPTE = 8_u32
  TIME_MIDI = 16_u32
  TIME_TICKS = 32_u32
  MM_JOY1MOVE = 928_u32
  MM_JOY2MOVE = 929_u32
  MM_JOY1ZMOVE = 930_u32
  MM_JOY2ZMOVE = 931_u32
  MM_JOY1BUTTONDOWN = 949_u32
  MM_JOY2BUTTONDOWN = 950_u32
  MM_JOY1BUTTONUP = 951_u32
  MM_JOY2BUTTONUP = 952_u32
  MM_MCINOTIFY = 953_u32
  MM_WOM_OPEN = 955_u32
  MM_WOM_CLOSE = 956_u32
  MM_WOM_DONE = 957_u32
  MM_WIM_OPEN = 958_u32
  MM_WIM_CLOSE = 959_u32
  MM_WIM_DATA = 960_u32
  MM_MIM_OPEN = 961_u32
  MM_MIM_CLOSE = 962_u32
  MM_MIM_DATA = 963_u32
  MM_MIM_LONGDATA = 964_u32
  MM_MIM_ERROR = 965_u32
  MM_MIM_LONGERROR = 966_u32
  MM_MOM_OPEN = 967_u32
  MM_MOM_CLOSE = 968_u32
  MM_MOM_DONE = 969_u32
  MM_DRVM_OPEN = 976_u32
  MM_DRVM_CLOSE = 977_u32
  MM_DRVM_DATA = 978_u32
  MM_DRVM_ERROR = 979_u32
  MM_STREAM_OPEN = 980_u32
  MM_STREAM_CLOSE = 981_u32
  MM_STREAM_DONE = 982_u32
  MM_STREAM_ERROR = 983_u32
  MM_MOM_POSITIONCB = 970_u32
  MM_MCISIGNAL = 971_u32
  MM_MIM_MOREDATA = 972_u32
  MM_MIXM_LINE_CHANGE = 976_u32
  MM_MIXM_CONTROL_CHANGE = 977_u32
  MMSYSERR_BASE = 0_u32
  WAVERR_BASE = 32_u32
  MIDIERR_BASE = 64_u32
  TIMERR_BASE = 96_u32
  JOYERR_BASE = 160_u32
  MCIERR_BASE = 256_u32
  MIXERR_BASE = 1024_u32
  MCI_STRING_OFFSET = 512_u32
  MCI_VD_OFFSET = 1024_u32
  MCI_CD_OFFSET = 1088_u32
  MCI_WAVE_OFFSET = 1152_u32
  MCI_SEQ_OFFSET = 1216_u32
  MMSYSERR_NOERROR = 0_u32
  MMSYSERR_ERROR = 1_u32
  MMSYSERR_BADDEVICEID = 2_u32
  MMSYSERR_NOTENABLED = 3_u32
  MMSYSERR_ALLOCATED = 4_u32
  MMSYSERR_INVALHANDLE = 5_u32
  MMSYSERR_NODRIVER = 6_u32
  MMSYSERR_NOMEM = 7_u32
  MMSYSERR_NOTSUPPORTED = 8_u32
  MMSYSERR_BADERRNUM = 9_u32
  MMSYSERR_INVALFLAG = 10_u32
  MMSYSERR_INVALPARAM = 11_u32
  MMSYSERR_HANDLEBUSY = 12_u32
  MMSYSERR_INVALIDALIAS = 13_u32
  MMSYSERR_BADDB = 14_u32
  MMSYSERR_KEYNOTFOUND = 15_u32
  MMSYSERR_READERROR = 16_u32
  MMSYSERR_WRITEERROR = 17_u32
  MMSYSERR_DELETEERROR = 18_u32
  MMSYSERR_VALNOTFOUND = 19_u32
  MMSYSERR_NODRIVERCB = 20_u32
  MMSYSERR_MOREDATA = 21_u32
  MMSYSERR_LASTERROR = 21_u32
  TIME_ONESHOT = 0_u32
  TIME_PERIODIC = 1_u32
  TIME_CALLBACK_FUNCTION = 0_u32
  TIME_CALLBACK_EVENT_SET = 16_u32
  TIME_CALLBACK_EVENT_PULSE = 32_u32
  TIME_KILL_SYNCHRONOUS = 256_u32

  alias LPDRVCALLBACK = Proc(HDRVR, UInt32, LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, Void)
  alias LPTIMECALLBACK = Proc(UInt32, UInt32, LibC::UINT_PTR, LibC::UINT_PTR, LibC::UINT_PTR, Void)


  enum TIMECODE_SAMPLE_FLAGS : UInt32
    ED_DEVCAP_TIMECODE_READ = 4121
    ED_DEVCAP_ATN_READ = 5047
    ED_DEVCAP_RTC_READ = 5050
  end

  union MMTIME_u_e__Union
    ms : UInt32
    sample : UInt32
    cb : UInt32
    ticks : UInt32
    smpte : MMTIME_u_e__Union_smpte_e__Struct
    midi : MMTIME_u_e__Union_midi_e__Struct
  end
  union TIMECODE
    anonymous : TIMECODE_Anonymous_e__Struct
    qw : UInt64
  end

  struct MMTIME
    w_type : UInt32
    u : MMTIME_u_e__Union
  end
  struct MMTIME_u_e__Union_smpte_e__Struct
    hour : UInt8
    min : UInt8
    sec : UInt8
    frame : UInt8
    fps : UInt8
    dummy : UInt8
    pad : UInt8[2]*
  end
  struct MMTIME_u_e__Union_midi_e__Struct
    songptrpos : UInt32
  end
  struct TIMECAPS
    w_period_min : UInt32
    w_period_max : UInt32
  end
  struct TIMECODE_Anonymous_e__Struct
    w_frame_rate : UInt16
    w_frame_fract : UInt16
    dw_frames : UInt32
  end
  struct TIMECODE_SAMPLE
    qw_tick : Int64
    timecode : TIMECODE
    dw_user : UInt32
    dw_flags : TIMECODE_SAMPLE_FLAGS
  end


  struct IReferenceClockVTbl
    query_interface : Proc(IReferenceClock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceClock*, UInt32)
    release : Proc(IReferenceClock*, UInt32)
    get_time : Proc(IReferenceClock*, Int64*, HRESULT)
    advise_time : Proc(IReferenceClock*, Int64, Int64, LibC::HANDLE, LibC::UINT_PTR*, HRESULT)
    advise_periodic : Proc(IReferenceClock*, Int64, Int64, LibC::HANDLE, LibC::UINT_PTR*, HRESULT)
    unadvise : Proc(IReferenceClock*, LibC::UINT_PTR, HRESULT)
  end

  IReferenceClock_GUID = LibC::GUID.new("56a86897-0ad4-11ce-b03a-0020af0ba770")
  CLSID_IReferenceClock = "56a86897-0ad4-11ce-b03a-0020af0ba770"
  struct IReferenceClock
    lpVtbl : IReferenceClockVTbl*
  end

  struct IReferenceClockTimerControlVTbl
    query_interface : Proc(IReferenceClockTimerControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceClockTimerControl*, UInt32)
    release : Proc(IReferenceClockTimerControl*, UInt32)
    set_default_timer_resolution : Proc(IReferenceClockTimerControl*, Int64, HRESULT)
    get_default_timer_resolution : Proc(IReferenceClockTimerControl*, Int64*, HRESULT)
  end

  IReferenceClockTimerControl_GUID = LibC::GUID.new("ebec459c-2eca-4d42-a8af-30df557614b8")
  CLSID_IReferenceClockTimerControl = "ebec459c-2eca-4d42-a8af-30df557614b8"
  struct IReferenceClockTimerControl
    lpVtbl : IReferenceClockTimerControlVTbl*
  end

  struct IReferenceClock2VTbl
    query_interface : Proc(IReferenceClock2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReferenceClock2*, UInt32)
    release : Proc(IReferenceClock2*, UInt32)
    get_time : Proc(IReferenceClock2*, Int64*, HRESULT)
    advise_time : Proc(IReferenceClock2*, Int64, Int64, LibC::HANDLE, LibC::UINT_PTR*, HRESULT)
    advise_periodic : Proc(IReferenceClock2*, Int64, Int64, LibC::HANDLE, LibC::UINT_PTR*, HRESULT)
    unadvise : Proc(IReferenceClock2*, LibC::UINT_PTR, HRESULT)
  end

  IReferenceClock2_GUID = LibC::GUID.new("36b73885-c2c8-11cf-8b46-00805f6cef60")
  CLSID_IReferenceClock2 = "36b73885-c2c8-11cf-8b46-00805f6cef60"
  struct IReferenceClock2
    lpVtbl : IReferenceClock2VTbl*
  end


  # Params # pmmt : MMTIME* [In],cbmmt : UInt32 [In]
  fun timeGetSystemTime(pmmt : MMTIME*, cbmmt : UInt32) : UInt32

  # Params # 
  fun timeGetTime : UInt32

  # Params # ptc : TIMECAPS* [In],cbtc : UInt32 [In]
  fun timeGetDevCaps(ptc : TIMECAPS*, cbtc : UInt32) : UInt32

  # Params # uperiod : UInt32 [In]
  fun timeBeginPeriod(uperiod : UInt32) : UInt32

  # Params # uperiod : UInt32 [In]
  fun timeEndPeriod(uperiod : UInt32) : UInt32

  # Params # udelay : UInt32 [In],uresolution : UInt32 [In],fptc : LPTIMECALLBACK [In],dwuser : LibC::UINT_PTR [In],fuevent : UInt32 [In]
  fun timeSetEvent(udelay : UInt32, uresolution : UInt32, fptc : LPTIMECALLBACK, dwuser : LibC::UINT_PTR, fuevent : UInt32) : UInt32

  # Params # utimerid : UInt32 [In]
  fun timeKillEvent(utimerid : UInt32) : UInt32
end
