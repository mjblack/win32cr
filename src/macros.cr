## Custom Macros and top level methods go here!
## WinMD will not overwrite this file.

macro pwstr(str)
  {{str}}.to_utf16.to_unsafe
end

def loword(i : UInt64) : UInt16
  val = (i & 0xffff).to_u16
  val
end

def loword(i : Int64) : UInt16
  val = (i.to_u64 & 0xffff).to_u16
  val
end

def hiword(i : UInt32*) : UInt16
  val = ((i.value >> 16) & 0xFFFF).to_u16
  val
end

def hiword(i : Int64*) : UInt16
  val = ((i.value.to_u64 >> 16) & 0xFFFF).to_u16
  val
end
