module Win32cr
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

    def self.new(clsid : LibC::GUID, iid : LibC::GUID, clsctx : Win32cr::System::Com::CLSCTX = Win32cr::System::Com::CLSCTX::CLSCTX_ALL)
      result = Win32cr::System::Com::C.CoCreateInstance(pointerof(clsid), nil, clsctx, pointerof(iid), out ptr)
      unless result == Win32cr::Foundation::S_OK
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
end