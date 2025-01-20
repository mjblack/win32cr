require "../../src/win32cr"
require "../../src/win32cr/system/com"

Win32cr::System::Com::C.CoGetMalloc(1, out imalloc)
ptr = imalloc.value.alloc(100_u64)
puts imalloc.value.get_size(ptr)
imalloc.value.free(ptr)