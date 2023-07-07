lib LibWin32
  alias Guid = LibC::GUID
  alias UIntPtr = LibC::UINT_PTR
end

struct LibC::GUID
  def to_s
    sprintf("%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X", @data1, @data2, @data3, @data4[0], @data4[1], @data4[2], @data4[3], @data4[4], @data4[5], @data4[6], @data4[7])
  end
  def to_clsid
    sprintf("{%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}", @data1, @data2, @data3, @data4[0], @data4[1], @data4[2], @data4[3], @data4[4], @data4[5], @data4[6], @data4[7])
  end
end

module Win32cr
  VERSION = "0.3.0"
end

class ComPtr(T)
  @ptr : Pointer(T)

  def initialize(@ptr : T*)

  end

  def address
    @ptr.address
  end

  def to_unsafe
    @ptr
  end

  def release
    if @ptr
      @ptr.value.release(@ptr)
    end
  end

  def finalize
    release
  end

  def self.new(clsid : LibWin32::Guid, iid : LibWin32::Guid, clsctx : LibWin32::CLSCTX = LibWin32::CLSCTX::CLSCTX_ALL)
    result = LibWin32.CoCreateInstance(pointerof(clsid), nil, clsctx, pointerof(iid), out ptr)
    unless result == LibWin32::S_OK
      raise RuntimeError.new "Failed to create COM instance. (error #{result})"
    end
    new(ptr.as(Pointer(T)))
  end

  macro method_missing(method)
    \{% begin %}
    \{% unless m = T.instance.methods.find(&.name. == {{method.name.stringify}}) %}
      \{% raise "No method named #{{{method.name.stringify}}} in #{T.name.stringify}" %}
    \{% end %}
      @ptr.value.{{method.name}}(@ptr, {{method.args.splat}})
    \{% end %}
  end
end