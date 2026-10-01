require "../../src/win32cr"
require "../../src/win32cr/system/com"

alias Com = Win32cr::System::Com

# CoGetMalloc hands back the COM allocator as an opaque interface pointer.
malloc = Pointer(Void).null
Com.coGetMalloc(1_u32, pointerof(malloc))
imalloc = malloc.as(Com::IMalloc*)

# Vtable methods take the interface pointer as their first argument.
ptr = imalloc.value.alloc(imalloc, 100_u64)
puts imalloc.value.get_size(imalloc, ptr)
imalloc.value.free(imalloc, ptr)
imalloc.value.release(imalloc)
