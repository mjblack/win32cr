require "./media/multimedia.cr"
require "./system/com.cr"
require "./foundation.cr"

module Win32cr::Media
  alias HTASK = LibC::IntPtrT
  alias LPDRVCALLBACK = Proc(Win32cr::Media::Multimedia::HDRVR, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Void)*

  alias LPTIMECALLBACK = Proc(UInt32, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Void)*

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

  @[Flags]
  enum TIMECODE_SAMPLE_FLAGS : UInt32
    ED_DEVCAP_TIMECODE_READ = 4121_u32
    ED_DEVCAP_ATN_READ = 5047_u32
    ED_DEVCAP_RTC_READ = 5050_u32
  end

  @[Extern]
  record MMTIME,
    wType : UInt32,
    u : U_e__union do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      ms : UInt32,
      sample : UInt32,
      cb : UInt32,
      ticks : UInt32,
      smpte : Smpte_e__struct,
      midi : Midi_e__struct do

      # Nested Type Smpte_e__struct
      @[Extern]
      record Smpte_e__struct,
        hour : UInt8,
        min : UInt8,
        sec : UInt8,
        frame : UInt8,
        fps : UInt8,
        dummy : UInt8,
        pad : UInt8[2]


      # Nested Type Midi_e__struct
      @[Extern]
      record Midi_e__struct,
        songptrpos : UInt32

    end

  end

  @[Extern]
  record TIMECAPS,
    wPeriodMin : UInt32,
    wPeriodMax : UInt32

  @[Extern(union: true)]
  record TIMECODE,
    anonymous : Anonymous_e__Struct,
    qw : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      wFrameRate : UInt16,
      wFrameFract : UInt16,
      dwFrames : UInt32

  end

  @[Extern]
  record TIMECODE_SAMPLE,
    qwTick : Int64,
    timecode : Win32cr::Media::TIMECODE,
    dwUser : UInt32,
    dwFlags : Win32cr::Media::TIMECODE_SAMPLE_FLAGS

  @[Extern]
  record IReferenceClockVtbl,
    query_interface : Proc(IReferenceClock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceClock*, UInt32),
    release : Proc(IReferenceClock*, UInt32),
    get_time : Proc(IReferenceClock*, Int64*, Win32cr::Foundation::HRESULT),
    advise_time : Proc(IReferenceClock*, Int64, Int64, Win32cr::Foundation::HANDLE, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    advise_periodic : Proc(IReferenceClock*, Int64, Int64, Win32cr::Foundation::HANDLE, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IReferenceClock*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("56a86897-0ad4-11ce-b03a-0020af0ba770")]
  record IReferenceClock, lpVtbl : IReferenceClockVtbl* do
    GUID = LibC::GUID.new(0x56a86897_u32, 0xad4_u16, 0x11ce_u16, StaticArray[0xb0_u8, 0x3a_u8, 0x0_u8, 0x20_u8, 0xaf_u8, 0xb_u8, 0xa7_u8, 0x70_u8])
    def query_interface(this : IReferenceClock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceClock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceClock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_time(this : IReferenceClock*, pTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time.call(this, pTime)
    end
    def advise_time(this : IReferenceClock*, baseTime : Int64, streamTime : Int64, hEvent : Win32cr::Foundation::HANDLE, pdwAdviseCookie : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_time.call(this, baseTime, streamTime, hEvent, pdwAdviseCookie)
    end
    def advise_periodic(this : IReferenceClock*, startTime : Int64, periodTime : Int64, hSemaphore : Win32cr::Foundation::HANDLE, pdwAdviseCookie : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_periodic.call(this, startTime, periodTime, hSemaphore, pdwAdviseCookie)
    end
    def unadvise(this : IReferenceClock*, dwAdviseCookie : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwAdviseCookie)
    end

  end

  @[Extern]
  record IReferenceClockTimerControlVtbl,
    query_interface : Proc(IReferenceClockTimerControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceClockTimerControl*, UInt32),
    release : Proc(IReferenceClockTimerControl*, UInt32),
    set_default_timer_resolution : Proc(IReferenceClockTimerControl*, Int64, Win32cr::Foundation::HRESULT),
    get_default_timer_resolution : Proc(IReferenceClockTimerControl*, Int64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ebec459c-2eca-4d42-a8af-30df557614b8")]
  record IReferenceClockTimerControl, lpVtbl : IReferenceClockTimerControlVtbl* do
    GUID = LibC::GUID.new(0xebec459c_u32, 0x2eca_u16, 0x4d42_u16, StaticArray[0xa8_u8, 0xaf_u8, 0x30_u8, 0xdf_u8, 0x55_u8, 0x76_u8, 0x14_u8, 0xb8_u8])
    def query_interface(this : IReferenceClockTimerControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceClockTimerControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceClockTimerControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_default_timer_resolution(this : IReferenceClockTimerControl*, timerResolution : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_timer_resolution.call(this, timerResolution)
    end
    def get_default_timer_resolution(this : IReferenceClockTimerControl*, pTimerResolution : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_timer_resolution.call(this, pTimerResolution)
    end

  end

  @[Extern]
  record IReferenceClock2Vtbl,
    query_interface : Proc(IReferenceClock2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReferenceClock2*, UInt32),
    release : Proc(IReferenceClock2*, UInt32),
    get_time : Proc(IReferenceClock2*, Int64*, Win32cr::Foundation::HRESULT),
    advise_time : Proc(IReferenceClock2*, Int64, Int64, Win32cr::Foundation::HANDLE, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    advise_periodic : Proc(IReferenceClock2*, Int64, Int64, Win32cr::Foundation::HANDLE, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IReferenceClock2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("36b73885-c2c8-11cf-8b46-00805f6cef60")]
  record IReferenceClock2, lpVtbl : IReferenceClock2Vtbl* do
    GUID = LibC::GUID.new(0x36b73885_u32, 0xc2c8_u16, 0x11cf_u16, StaticArray[0x8b_u8, 0x46_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x6c_u8, 0xef_u8, 0x60_u8])
    def query_interface(this : IReferenceClock2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReferenceClock2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReferenceClock2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_time(this : IReferenceClock2*, pTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time.call(this, pTime)
    end
    def advise_time(this : IReferenceClock2*, baseTime : Int64, streamTime : Int64, hEvent : Win32cr::Foundation::HANDLE, pdwAdviseCookie : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_time.call(this, baseTime, streamTime, hEvent, pdwAdviseCookie)
    end
    def advise_periodic(this : IReferenceClock2*, startTime : Int64, periodTime : Int64, hSemaphore : Win32cr::Foundation::HANDLE, pdwAdviseCookie : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_periodic.call(this, startTime, periodTime, hSemaphore, pdwAdviseCookie)
    end
    def unadvise(this : IReferenceClock2*, dwAdviseCookie : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, dwAdviseCookie)
    end

  end

  @[Link("winmm")]
  lib C
    fun timeGetSystemTime(pmmt : Win32cr::Media::MMTIME*, cbmmt : UInt32) : UInt32

    fun timeGetTime : UInt32

    fun timeGetDevCaps(ptc : Win32cr::Media::TIMECAPS*, cbtc : UInt32) : UInt32

    fun timeBeginPeriod(uPeriod : UInt32) : UInt32

    fun timeEndPeriod(uPeriod : UInt32) : UInt32

    fun timeSetEvent(uDelay : UInt32, uResolution : UInt32, fptc : Win32cr::Media::LPTIMECALLBACK, dwUser : LibC::UIntPtrT, fuEvent : UInt32) : UInt32

    fun timeKillEvent(uTimerID : UInt32) : UInt32

  end
end