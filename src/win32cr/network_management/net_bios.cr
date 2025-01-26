require "./../foundation.cr"

module Win32cr::NetworkManagement::NetBios
  NCBNAMSZ = 16_u32
  MAX_LANA = 254_u32
  NAME_FLAGS_MASK = 135_u32
  GROUP_NAME = 128_u32
  UNIQUE_NAME = 0_u32
  REGISTERING = 0_u32
  REGISTERED = 4_u32
  DEREGISTERED = 5_u32
  DUPLICATE = 6_u32
  DUPLICATE_DEREG = 7_u32
  LISTEN_OUTSTANDING = 1_u32
  CALL_PENDING = 2_u32
  SESSION_ESTABLISHED = 3_u32
  HANGUP_PENDING = 4_u32
  HANGUP_COMPLETE = 5_u32
  SESSION_ABORTED = 6_u32
  ALL_TRANSPORTS = "M\u0000\u0000\u0000"
  MS_NBF = "MNBF"
  NCBCALL = 16_u32
  NCBLISTEN = 17_u32
  NCBHANGUP = 18_u32
  NCBSEND = 20_u32
  NCBRECV = 21_u32
  NCBRECVANY = 22_u32
  NCBCHAINSEND = 23_u32
  NCBDGSEND = 32_u32
  NCBDGRECV = 33_u32
  NCBDGSENDBC = 34_u32
  NCBDGRECVBC = 35_u32
  NCBADDNAME = 48_u32
  NCBDELNAME = 49_u32
  NCBRESET = 50_u32
  NCBASTAT = 51_u32
  NCBSSTAT = 52_u32
  NCBCANCEL = 53_u32
  NCBADDGRNAME = 54_u32
  NCBENUM = 55_u32
  NCBUNLINK = 112_u32
  NCBSENDNA = 113_u32
  NCBCHAINSENDNA = 114_u32
  NCBLANSTALERT = 115_u32
  NCBACTION = 119_u32
  NCBFINDNAME = 120_u32
  NCBTRACE = 121_u32
  ASYNCH = 128_u32
  NRC_GOODRET = 0_u32
  NRC_BUFLEN = 1_u32
  NRC_ILLCMD = 3_u32
  NRC_CMDTMO = 5_u32
  NRC_INCOMP = 6_u32
  NRC_BADDR = 7_u32
  NRC_SNUMOUT = 8_u32
  NRC_NORES = 9_u32
  NRC_SCLOSED = 10_u32
  NRC_CMDCAN = 11_u32
  NRC_DUPNAME = 13_u32
  NRC_NAMTFUL = 14_u32
  NRC_ACTSES = 15_u32
  NRC_LOCTFUL = 17_u32
  NRC_REMTFUL = 18_u32
  NRC_ILLNN = 19_u32
  NRC_NOCALL = 20_u32
  NRC_NOWILD = 21_u32
  NRC_INUSE = 22_u32
  NRC_NAMERR = 23_u32
  NRC_SABORT = 24_u32
  NRC_NAMCONF = 25_u32
  NRC_IFBUSY = 33_u32
  NRC_TOOMANY = 34_u32
  NRC_BRIDGE = 35_u32
  NRC_CANOCCR = 36_u32
  NRC_CANCEL = 38_u32
  NRC_DUPENV = 48_u32
  NRC_ENVNOTDEF = 52_u32
  NRC_OSRESNOTAV = 53_u32
  NRC_MAXAPPS = 54_u32
  NRC_NOSAPS = 55_u32
  NRC_NORESOURCES = 56_u32
  NRC_INVADDRESS = 57_u32
  NRC_INVDDID = 59_u32
  NRC_LOCKFAIL = 60_u32
  NRC_OPENERR = 63_u32
  NRC_SYSTEM = 64_u32
  NRC_PENDING = 255_u32


  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct NCB
    property ncb_command : UInt8
    property ncb_retcode : UInt8
    property ncb_lsn : UInt8
    property ncb_num : UInt8
    property ncb_buffer : UInt8*
    property ncb_length : UInt16
    property ncb_callname : UInt8[16]
    property ncb_name : UInt8[16]
    property ncb_rto : UInt8
    property ncb_sto : UInt8
    property ncb_post : LibC::IntPtrT
    property ncb_lana_num : UInt8
    property ncb_cmd_cplt : UInt8
    property ncb_reserve : UInt8[18]
    property ncb_event : Win32cr::Foundation::HANDLE
    def initialize(@ncb_command : UInt8, @ncb_retcode : UInt8, @ncb_lsn : UInt8, @ncb_num : UInt8, @ncb_buffer : UInt8*, @ncb_length : UInt16, @ncb_callname : UInt8[16], @ncb_name : UInt8[16], @ncb_rto : UInt8, @ncb_sto : UInt8, @ncb_post : LibC::IntPtrT, @ncb_lana_num : UInt8, @ncb_cmd_cplt : UInt8, @ncb_reserve : UInt8[18], @ncb_event : Win32cr::Foundation::HANDLE)
    end
  end
  {% end %}

  @[Extern]
  struct ADAPTER_STATUS
    property adapter_address : UInt8[6]
    property rev_major : UInt8
    property reserved0 : UInt8
    property adapter_type : UInt8
    property rev_minor : UInt8
    property duration : UInt16
    property frmr_recv : UInt16
    property frmr_xmit : UInt16
    property iframe_recv_err : UInt16
    property xmit_aborts : UInt16
    property xmit_success : UInt32
    property recv_success : UInt32
    property iframe_xmit_err : UInt16
    property recv_buff_unavail : UInt16
    property t1_timeouts : UInt16
    property ti_timeouts : UInt16
    property reserved1 : UInt32
    property free_ncbs : UInt16
    property max_cfg_ncbs : UInt16
    property max_ncbs : UInt16
    property xmit_buf_unavail : UInt16
    property max_dgram_size : UInt16
    property pending_sess : UInt16
    property max_cfg_sess : UInt16
    property max_sess : UInt16
    property max_sess_pkt_size : UInt16
    property name_count : UInt16
    def initialize(@adapter_address : UInt8[6], @rev_major : UInt8, @reserved0 : UInt8, @adapter_type : UInt8, @rev_minor : UInt8, @duration : UInt16, @frmr_recv : UInt16, @frmr_xmit : UInt16, @iframe_recv_err : UInt16, @xmit_aborts : UInt16, @xmit_success : UInt32, @recv_success : UInt32, @iframe_xmit_err : UInt16, @recv_buff_unavail : UInt16, @t1_timeouts : UInt16, @ti_timeouts : UInt16, @reserved1 : UInt32, @free_ncbs : UInt16, @max_cfg_ncbs : UInt16, @max_ncbs : UInt16, @xmit_buf_unavail : UInt16, @max_dgram_size : UInt16, @pending_sess : UInt16, @max_cfg_sess : UInt16, @max_sess : UInt16, @max_sess_pkt_size : UInt16, @name_count : UInt16)
    end
  end

  @[Extern]
  struct NAME_BUFFER
    property name : UInt8[16]
    property name_num : UInt8
    property name_flags : UInt8
    def initialize(@name : UInt8[16], @name_num : UInt8, @name_flags : UInt8)
    end
  end

  @[Extern]
  struct SESSION_HEADER
    property sess_name : UInt8
    property num_sess : UInt8
    property rcv_dg_outstanding : UInt8
    property rcv_any_outstanding : UInt8
    def initialize(@sess_name : UInt8, @num_sess : UInt8, @rcv_dg_outstanding : UInt8, @rcv_any_outstanding : UInt8)
    end
  end

  @[Extern]
  struct SESSION_BUFFER
    property lsn : UInt8
    property state : UInt8
    property local_name : UInt8[16]
    property remote_name : UInt8[16]
    property rcvs_outstanding : UInt8
    property sends_outstanding : UInt8
    def initialize(@lsn : UInt8, @state : UInt8, @local_name : UInt8[16], @remote_name : UInt8[16], @rcvs_outstanding : UInt8, @sends_outstanding : UInt8)
    end
  end

  @[Extern]
  struct LANA_ENUM
    property length : UInt8
    property lana : UInt8[255]
    def initialize(@length : UInt8, @lana : UInt8[255])
    end
  end

  @[Extern]
  struct FIND_NAME_HEADER
    property node_count : UInt16
    property reserved : UInt8
    property unique_group : UInt8
    def initialize(@node_count : UInt16, @reserved : UInt8, @unique_group : UInt8)
    end
  end

  @[Extern]
  struct FIND_NAME_BUFFER
    property length : UInt8
    property access_control : UInt8
    property frame_control : UInt8
    property destination_addr : UInt8[6]
    property source_addr : UInt8[6]
    property routing_info : UInt8[18]
    def initialize(@length : UInt8, @access_control : UInt8, @frame_control : UInt8, @destination_addr : UInt8[6], @source_addr : UInt8[6], @routing_info : UInt8[18])
    end
  end

  @[Extern]
  struct ACTION_HEADER
    property transport_id : UInt32
    property action_code : UInt16
    property reserved : UInt16
    def initialize(@transport_id : UInt32, @action_code : UInt16, @reserved : UInt16)
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct NCB
    property ncb_command : UInt8
    property ncb_retcode : UInt8
    property ncb_lsn : UInt8
    property ncb_num : UInt8
    property ncb_buffer : UInt8*
    property ncb_length : UInt16
    property ncb_callname : UInt8[16]
    property ncb_name : UInt8[16]
    property ncb_rto : UInt8
    property ncb_sto : UInt8
    property ncb_post : LibC::IntPtrT
    property ncb_lana_num : UInt8
    property ncb_cmd_cplt : UInt8
    property ncb_reserve : UInt8[10]
    property ncb_event : Win32cr::Foundation::HANDLE
    def initialize(@ncb_command : UInt8, @ncb_retcode : UInt8, @ncb_lsn : UInt8, @ncb_num : UInt8, @ncb_buffer : UInt8*, @ncb_length : UInt16, @ncb_callname : UInt8[16], @ncb_name : UInt8[16], @ncb_rto : UInt8, @ncb_sto : UInt8, @ncb_post : LibC::IntPtrT, @ncb_lana_num : UInt8, @ncb_cmd_cplt : UInt8, @ncb_reserve : UInt8[10], @ncb_event : Win32cr::Foundation::HANDLE)
    end
  end
  {% end %}

  @[Link("netapi32")]
  lib C
    fun Netbios(pncb : Win32cr::NetworkManagement::NetBios::NCB*) : UInt8

  end
end