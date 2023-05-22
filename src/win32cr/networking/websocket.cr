require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:websocket.dll")]
lib LibWin32
  alias WEB_SOCKET_HANDLE = LibC::IntPtrT

  WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 123_u32


  enum WEB_SOCKET_CLOSE_STATUS : Int32
    WEB_SOCKET_SUCCESS_CLOSE_STATUS = 1000
    WEB_SOCKET_ENDPOINT_UNAVAILABLE_CLOSE_STATUS = 1001
    WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS = 1002
    WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS = 1003
    WEB_SOCKET_EMPTY_CLOSE_STATUS = 1005
    WEB_SOCKET_ABORTED_CLOSE_STATUS = 1006
    WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS = 1007
    WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS = 1008
    WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS = 1009
    WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 1010
    WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS = 1011
    WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 1015
  end

  enum WEB_SOCKET_PROPERTY_TYPE : Int32
    WEB_SOCKET_RECEIVE_BUFFER_SIZE_PROPERTY_TYPE = 0
    WEB_SOCKET_SEND_BUFFER_SIZE_PROPERTY_TYPE = 1
    WEB_SOCKET_DISABLE_MASKING_PROPERTY_TYPE = 2
    WEB_SOCKET_ALLOCATED_BUFFER_PROPERTY_TYPE = 3
    WEB_SOCKET_DISABLE_UTF8_VERIFICATION_PROPERTY_TYPE = 4
    WEB_SOCKET_KEEPALIVE_INTERVAL_PROPERTY_TYPE = 5
    WEB_SOCKET_SUPPORTED_VERSIONS_PROPERTY_TYPE = 6
  end

  enum WEB_SOCKET_ACTION_QUEUE : Int32
    WEB_SOCKET_SEND_ACTION_QUEUE = 1
    WEB_SOCKET_RECEIVE_ACTION_QUEUE = 2
    WEB_SOCKET_ALL_ACTION_QUEUE = 3
  end

  enum WEB_SOCKET_BUFFER_TYPE : Int32
    WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE = -2147483648
    WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE = -2147483647
    WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE = -2147483646
    WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE = -2147483645
    WEB_SOCKET_CLOSE_BUFFER_TYPE = -2147483644
    WEB_SOCKET_PING_PONG_BUFFER_TYPE = -2147483643
    WEB_SOCKET_UNSOLICITED_PONG_BUFFER_TYPE = -2147483642
  end

  enum WEB_SOCKET_ACTION : Int32
    WEB_SOCKET_NO_ACTION = 0
    WEB_SOCKET_SEND_TO_NETWORK_ACTION = 1
    WEB_SOCKET_INDICATE_SEND_COMPLETE_ACTION = 2
    WEB_SOCKET_RECEIVE_FROM_NETWORK_ACTION = 3
    WEB_SOCKET_INDICATE_RECEIVE_COMPLETE_ACTION = 4
  end

union WEB_SOCKET_BUFFER
  data : WEB_SOCKET_BUFFER_Data_e__Struct
  close_status : WEB_SOCKET_BUFFER_CloseStatus_e__Struct
end

  struct WEB_SOCKET_PROPERTY
    type : WEB_SOCKET_PROPERTY_TYPE
    pv_value : Void*
    ul_value_size : UInt32
  end
  struct WEB_SOCKET_HTTP_HEADER
    pc_name : PSTR
    ul_name_length : UInt32
    pc_value : PSTR
    ul_value_length : UInt32
  end
  struct WEB_SOCKET_BUFFER_Data_e__Struct
    pb_buffer : UInt8*
    ul_buffer_length : UInt32
  end
  struct WEB_SOCKET_BUFFER_CloseStatus_e__Struct
    pb_reason : UInt8*
    ul_reason_length : UInt32
    us_status : UInt16
  end


  # Params # pproperties : WEB_SOCKET_PROPERTY* [In],ulpropertycount : UInt32 [In],phwebsocket : WEB_SOCKET_HANDLE* [In]
  fun WebSocketCreateClientHandle(pproperties : WEB_SOCKET_PROPERTY*, ulpropertycount : UInt32, phwebsocket : WEB_SOCKET_HANDLE*) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],pszsubprotocols : PSTR* [In],ulsubprotocolcount : UInt32 [In],pszextensions : PSTR* [In],ulextensioncount : UInt32 [In],pinitialheaders : WEB_SOCKET_HTTP_HEADER* [In],ulinitialheadercount : UInt32 [In],padditionalheaders : WEB_SOCKET_HTTP_HEADER** [In],puladditionalheadercount : UInt32* [In]
  fun WebSocketBeginClientHandshake(hwebsocket : WEB_SOCKET_HANDLE, pszsubprotocols : PSTR*, ulsubprotocolcount : UInt32, pszextensions : PSTR*, ulextensioncount : UInt32, pinitialheaders : WEB_SOCKET_HTTP_HEADER*, ulinitialheadercount : UInt32, padditionalheaders : WEB_SOCKET_HTTP_HEADER**, puladditionalheadercount : UInt32*) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],presponseheaders : WEB_SOCKET_HTTP_HEADER* [In],ulreponseheadercount : UInt32 [In],pulselectedextensions : UInt32* [In],pulselectedextensioncount : UInt32* [In],pulselectedsubprotocol : UInt32* [In]
  fun WebSocketEndClientHandshake(hwebsocket : WEB_SOCKET_HANDLE, presponseheaders : WEB_SOCKET_HTTP_HEADER*, ulreponseheadercount : UInt32, pulselectedextensions : UInt32*, pulselectedextensioncount : UInt32*, pulselectedsubprotocol : UInt32*) : HRESULT

  # Params # pproperties : WEB_SOCKET_PROPERTY* [In],ulpropertycount : UInt32 [In],phwebsocket : WEB_SOCKET_HANDLE* [In]
  fun WebSocketCreateServerHandle(pproperties : WEB_SOCKET_PROPERTY*, ulpropertycount : UInt32, phwebsocket : WEB_SOCKET_HANDLE*) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],pszsubprotocolselected : PSTR [In],pszextensionselected : PSTR* [In],ulextensionselectedcount : UInt32 [In],prequestheaders : WEB_SOCKET_HTTP_HEADER* [In],ulrequestheadercount : UInt32 [In],presponseheaders : WEB_SOCKET_HTTP_HEADER** [In],pulresponseheadercount : UInt32* [In]
  fun WebSocketBeginServerHandshake(hwebsocket : WEB_SOCKET_HANDLE, pszsubprotocolselected : PSTR, pszextensionselected : PSTR*, ulextensionselectedcount : UInt32, prequestheaders : WEB_SOCKET_HTTP_HEADER*, ulrequestheadercount : UInt32, presponseheaders : WEB_SOCKET_HTTP_HEADER**, pulresponseheadercount : UInt32*) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In]
  fun WebSocketEndServerHandshake(hwebsocket : WEB_SOCKET_HANDLE) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],buffertype : WEB_SOCKET_BUFFER_TYPE [In],pbuffer : WEB_SOCKET_BUFFER* [In],context : Void* [In]
  fun WebSocketSend(hwebsocket : WEB_SOCKET_HANDLE, buffertype : WEB_SOCKET_BUFFER_TYPE, pbuffer : WEB_SOCKET_BUFFER*, context : Void*) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],pbuffer : WEB_SOCKET_BUFFER* [In],pvcontext : Void* [In]
  fun WebSocketReceive(hwebsocket : WEB_SOCKET_HANDLE, pbuffer : WEB_SOCKET_BUFFER*, pvcontext : Void*) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],eactionqueue : WEB_SOCKET_ACTION_QUEUE [In],pdatabuffers : WEB_SOCKET_BUFFER* [In],puldatabuffercount : UInt32* [In],paction : WEB_SOCKET_ACTION* [In],pbuffertype : WEB_SOCKET_BUFFER_TYPE* [In],pvapplicationcontext : Void** [In],pvactioncontext : Void** [In]
  fun WebSocketGetAction(hwebsocket : WEB_SOCKET_HANDLE, eactionqueue : WEB_SOCKET_ACTION_QUEUE, pdatabuffers : WEB_SOCKET_BUFFER*, puldatabuffercount : UInt32*, paction : WEB_SOCKET_ACTION*, pbuffertype : WEB_SOCKET_BUFFER_TYPE*, pvapplicationcontext : Void**, pvactioncontext : Void**) : HRESULT

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In],pvactioncontext : Void* [In],ulbytestransferred : UInt32 [In]
  fun WebSocketCompleteAction(hwebsocket : WEB_SOCKET_HANDLE, pvactioncontext : Void*, ulbytestransferred : UInt32)

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In]
  fun WebSocketAbortHandle(hwebsocket : WEB_SOCKET_HANDLE)

  # Params # hwebsocket : WEB_SOCKET_HANDLE [In]
  fun WebSocketDeleteHandle(hwebsocket : WEB_SOCKET_HANDLE)

  # Params # etype : WEB_SOCKET_PROPERTY_TYPE [In],pvvalue : Void* [In],ulsize : UInt32* [In]
  fun WebSocketGetGlobalProperty(etype : WEB_SOCKET_PROPERTY_TYPE, pvvalue : Void*, ulsize : UInt32*) : HRESULT
end
