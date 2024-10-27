require "../src/win32cr/system/pipes"

STDOUT.puts("Press enter...")
STDIN.gets
MAX_BUF = 4096
# writeSide = Pointer(Win32cr::Foundation::HANDLE).malloc(sizeof(Win32cr::Foundation::HANDLE))
writeSide = Pointer(Void).null
puts writeSide.inspect
# readSide = Pointer(Win32cr::Foundation::HANDLE).malloc(sizeof(Win32cr::Foundation::HANDLE))
readSide = Pointer(Void).null
puts readSide.inspect
teststr = "test string"
dwWritten = 0_u32
dwRead = 0_u32
chbuf = Pointer(UInt8).malloc(MAX_BUF)
result = Win32cr::System::Pipes::C.CreatePipe(pointerof(readSide), pointerof(writeSide), nil, 0)
sleep 120
puts "Result is #{result}"
unless result > 0
  puts LibC.GetLastError
end

result = LibC.WriteFile(writeSide, teststr.to_unsafe, teststr.size, pointerof(dwWritten), nil)
puts "Result is #{result}"
unless result > 0
    puts LibC.GetLastError
end
result = LibC.ReadFile(readSide, chbuf, MAX_BUF, pointerof(dwRead), nil)
puts "Result is #{result}"
unless result > 0
    puts LibC.GetLastError
end
result = LibC.CloseHandle(writeSide)
puts "Result is #{result}"
unless result > 0
    puts LibC.GetLastError
end
result = LibC.CloseHandle(readSide)
puts "Result is #{result}"
unless result > 0
    puts LibC.GetLastError
end