## Custom Macros and top level methods go here!
## WinMD will not overwrite this file.

# Converts a string to a pointer to a null-terminated wide string pointer.
macro pwstr(str)
  {{str}}.to_utf16.to_unsafe
end

# Returns the low-order `WORD` from a `UInt64`.
def loword(i : UInt32) : UInt16
  val = (i & 0xffff).to_u16
  val
end

# Returns the low-order `WORD` from a `Int64`.
def loword(i : Int32) : UInt16
  val = (i.to_u32 & 0xffff).to_u16
  val
end

# Returns the low-order `WORD` from a `UInt64` pointer.
def loword(i : UInt32*) : UInt16
  val = (i.value & 0xffff).to_u16
  val
end

# Returns the low-order `WORD` from a `Int64` pointer.
def loword(i : Int32*) : UInt16
  val = (i.value.to_u32 & 0xffff).to_u16
  val
end

# Returns the high-order `WORD` from a `UInt32`.
def hiword(i : UInt32) : UInt16
  val = ((i >> 16) & 0xFFFF).to_u16
  val
end

# Returns the high-order `WORD` from a `Int32`.
def hiword(i : Int32) : UInt16
  val = ((i.to_u32 >> 16) & 0xFFFF).to_u16
  val
end

# Returns the high-order `WORD` from a `UInt32` pointer.
def hiword(i : UInt32*) : UInt16
  val = ((i.value >> 16) & 0xFFFF).to_u16
  val
end

# Returns the high-order `WORD` from a `Int32` pointer.
def hiword(i : Int32*) : UInt16
  val = ((i.value.to_u32 >> 16) & 0xFFFF).to_u16
  val
end
