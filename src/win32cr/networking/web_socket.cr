require "./../foundation.cr"

module Win32cr::Networking::WebSocket
  alias WEB_SOCKET_HANDLE = LibC::IntPtrT
  WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 123_u32

  enum WEB_SOCKET_CLOSE_STATUS
    WEB_SOCKET_SUCCESS_CLOSE_STATUS = 1000_i32
    WEB_SOCKET_ENDPOINT_UNAVAILABLE_CLOSE_STATUS = 1001_i32
    WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS = 1002_i32
    WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS = 1003_i32
    WEB_SOCKET_EMPTY_CLOSE_STATUS = 1005_i32
    WEB_SOCKET_ABORTED_CLOSE_STATUS = 1006_i32
    WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS = 1007_i32
    WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS = 1008_i32
    WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS = 1009_i32
    WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 1010_i32
    WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS = 1011_i32
    WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 1015_i32
  end
  enum WEB_SOCKET_PROPERTY_TYPE
    WEB_SOCKET_RECEIVE_BUFFER_SIZE_PROPERTY_TYPE = 0_i32
    WEB_SOCKET_SEND_BUFFER_SIZE_PROPERTY_TYPE = 1_i32
    WEB_SOCKET_DISABLE_MASKING_PROPERTY_TYPE = 2_i32
    WEB_SOCKET_ALLOCATED_BUFFER_PROPERTY_TYPE = 3_i32
    WEB_SOCKET_DISABLE_UTF8_VERIFICATION_PROPERTY_TYPE = 4_i32
    WEB_SOCKET_KEEPALIVE_INTERVAL_PROPERTY_TYPE = 5_i32
    WEB_SOCKET_SUPPORTED_VERSIONS_PROPERTY_TYPE = 6_i32
  end
  enum WEB_SOCKET_ACTION_QUEUE
    WEB_SOCKET_SEND_ACTION_QUEUE = 1_i32
    WEB_SOCKET_RECEIVE_ACTION_QUEUE = 2_i32
    WEB_SOCKET_ALL_ACTION_QUEUE = 3_i32
  end
  enum WEB_SOCKET_BUFFER_TYPE
    WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE = -2147483648_i32
    WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE = -2147483647_i32
    WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE = -2147483646_i32
    WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE = -2147483645_i32
    WEB_SOCKET_CLOSE_BUFFER_TYPE = -2147483644_i32
    WEB_SOCKET_PING_PONG_BUFFER_TYPE = -2147483643_i32
    WEB_SOCKET_UNSOLICITED_PONG_BUFFER_TYPE = -2147483642_i32
  end
  enum WEB_SOCKET_ACTION
    WEB_SOCKET_NO_ACTION = 0_i32
    WEB_SOCKET_SEND_TO_NETWORK_ACTION = 1_i32
    WEB_SOCKET_INDICATE_SEND_COMPLETE_ACTION = 2_i32
    WEB_SOCKET_RECEIVE_FROM_NETWORK_ACTION = 3_i32
    WEB_SOCKET_INDICATE_RECEIVE_COMPLETE_ACTION = 4_i32
  end

  @[Extern]
  struct WEB_SOCKET_PROPERTY
    property type__ : Win32cr::Networking::WebSocket::WEB_SOCKET_PROPERTY_TYPE
    property pvValue : Void*
    property ulValueSize : UInt32
    def initialize(@type__ : Win32cr::Networking::WebSocket::WEB_SOCKET_PROPERTY_TYPE, @pvValue : Void*, @ulValueSize : UInt32)
    end
  end

  @[Extern]
  struct WEB_SOCKET_HTTP_HEADER
    property pcName : Win32cr::Foundation::PSTR
    property ulNameLength : UInt32
    property pcValue : Win32cr::Foundation::PSTR
    property ulValueLength : UInt32
    def initialize(@pcName : Win32cr::Foundation::PSTR, @ulNameLength : UInt32, @pcValue : Win32cr::Foundation::PSTR, @ulValueLength : UInt32)
    end
  end

  @[Extern(union: true)]
  struct WEB_SOCKET_BUFFER
    property data : Data_e__Struct_
    property close_status : CloseStatus_e__Struct_

    # Nested Type Data_e__Struct_
    @[Extern]
    struct Data_e__Struct_
    property pbBuffer : UInt8*
    property ulBufferLength : UInt32
    def initialize(@pbBuffer : UInt8*, @ulBufferLength : UInt32)
    end
    end


    # Nested Type CloseStatus_e__Struct_
    @[Extern]
    struct CloseStatus_e__Struct_
    property pbReason : UInt8*
    property ulReasonLength : UInt32
    property usStatus : UInt16
    def initialize(@pbReason : UInt8*, @ulReasonLength : UInt32, @usStatus : UInt16)
    end
    end

    def initialize(@data : Data_e__Struct_, @close_status : CloseStatus_e__Struct_)
    end
  end

  @[Link("websocket")]
  lib C
    fun WebSocketCreateClientHandle(pProperties : Win32cr::Networking::WebSocket::WEB_SOCKET_PROPERTY*, ulPropertyCount : UInt32, phWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE*) : Win32cr::Foundation::HRESULT

    fun WebSocketBeginClientHandshake(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, pszSubprotocols : Win32cr::Foundation::PSTR*, ulSubprotocolCount : UInt32, pszExtensions : Win32cr::Foundation::PSTR*, ulExtensionCount : UInt32, pInitialHeaders : Win32cr::Networking::WebSocket::WEB_SOCKET_HTTP_HEADER*, ulInitialHeaderCount : UInt32, pAdditionalHeaders : Win32cr::Networking::WebSocket::WEB_SOCKET_HTTP_HEADER**, pulAdditionalHeaderCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun WebSocketEndClientHandshake(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, pResponseHeaders : Win32cr::Networking::WebSocket::WEB_SOCKET_HTTP_HEADER*, ulReponseHeaderCount : UInt32, pulSelectedExtensions : UInt32*, pulSelectedExtensionCount : UInt32*, pulSelectedSubprotocol : UInt32*) : Win32cr::Foundation::HRESULT

    fun WebSocketCreateServerHandle(pProperties : Win32cr::Networking::WebSocket::WEB_SOCKET_PROPERTY*, ulPropertyCount : UInt32, phWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE*) : Win32cr::Foundation::HRESULT

    fun WebSocketBeginServerHandshake(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, pszSubprotocolSelected : Win32cr::Foundation::PSTR, pszExtensionSelected : Win32cr::Foundation::PSTR*, ulExtensionSelectedCount : UInt32, pRequestHeaders : Win32cr::Networking::WebSocket::WEB_SOCKET_HTTP_HEADER*, ulRequestHeaderCount : UInt32, pResponseHeaders : Win32cr::Networking::WebSocket::WEB_SOCKET_HTTP_HEADER**, pulResponseHeaderCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun WebSocketEndServerHandshake(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE) : Win32cr::Foundation::HRESULT

    fun WebSocketSend(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, buffer_type : Win32cr::Networking::WebSocket::WEB_SOCKET_BUFFER_TYPE, pBuffer : Win32cr::Networking::WebSocket::WEB_SOCKET_BUFFER*, context : Void*) : Win32cr::Foundation::HRESULT

    fun WebSocketReceive(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, pBuffer : Win32cr::Networking::WebSocket::WEB_SOCKET_BUFFER*, pvContext : Void*) : Win32cr::Foundation::HRESULT

    fun WebSocketGetAction(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, eActionQueue : Win32cr::Networking::WebSocket::WEB_SOCKET_ACTION_QUEUE, pDataBuffers : Win32cr::Networking::WebSocket::WEB_SOCKET_BUFFER*, pulDataBufferCount : UInt32*, pAction : Win32cr::Networking::WebSocket::WEB_SOCKET_ACTION*, pBufferType : Win32cr::Networking::WebSocket::WEB_SOCKET_BUFFER_TYPE*, pvApplicationContext : Void**, pvActionContext : Void**) : Win32cr::Foundation::HRESULT

    fun WebSocketCompleteAction(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE, pvActionContext : Void*, ulBytesTransferred : UInt32) : Void

    fun WebSocketAbortHandle(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE) : Void

    fun WebSocketDeleteHandle(hWebSocket : Win32cr::Networking::WebSocket::WEB_SOCKET_HANDLE) : Void

    fun WebSocketGetGlobalProperty(eType : Win32cr::Networking::WebSocket::WEB_SOCKET_PROPERTY_TYPE, pvValue : Void*, ulSize : UInt32*) : Win32cr::Foundation::HRESULT

  end
end