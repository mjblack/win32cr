# Conversions between the types this library declares and the types Crystal's
# standard library uses for the same Win32 functions.
#
# Functions that `lib LibC` already declares cannot be declared again with
# different types, so their wrappers forward to LibC. The two sides spell
# the same C types differently (`Win32cr::Foundation::FILETIME*`
# vs `LibC::FILETIME*`, a Flags enum vs `DWORD`, `HKEY` vs the opaque
# `LibC::HKEY`), and these helpers reconcile them. Every conversion is a
# reinterpretation of a layout-identical value; nothing is validated.
module Win32cr::LibCBridge
  extend self

  # Converts a wrapper argument to the type LibC's declaration expects.
  # Integers and enums are left to the implicit conversions Crystal applies
  # to lib calls; everything else is cast.
  @[AlwaysInline]
  def arg(value : V, type : T.class) forall V, T
    {% if V == T %}
      value
    {% elsif T < Pointer %}
      {% if V < Pointer %}
        value.as(T)
      {% elsif V < Int %}
        T.new(value.to_u64!)
      {% else %}
        value
      {% end %}
    {% elsif T < Int %}
      {% if V < Enum %}
        T.new!(value.value)
      {% elsif V < Int %}
        T.new!(value)
      {% elsif V < Pointer %}
        T.new!(value.address)
      {% else %}
        value
      {% end %}
    {% elsif T < Enum %}
      {% if V < Enum %}
        T.new(typeof(T.new(0).value).new!(value.value))
      {% elsif V < Int %}
        T.new(typeof(T.new(0).value).new!(value))
      {% else %}
        value
      {% end %}
    {% elsif T < Proc %}
      {% if V < Proc %}
        value.unsafe_as(T)
      {% else %}
        value
      {% end %}
    {% elsif T < Float || T < Bool || T == Nil %}
      value
    {% elsif V < Pointer %}
      # Opaque pointer typedefs such as `LibC::HKEY` (`type HKEY = Void*`).
      value.as(T)
    {% elsif V < Int || V < Float || V < Bool || V < Enum || V < Proc || V == Nil %}
      value
    {% else %}
      # Struct or union passed by value.
      value.unsafe_as(T)
    {% end %}
  end

  # Converts LibC's return value to the wrapper's declared type.
  @[AlwaysInline]
  def ret(value : V, type : T.class) : T forall V, T
    {% if V == T %}
      value
    {% elsif T < Enum %}
      {% if V < Enum %}
        T.new(typeof(T.new(0).value).new!(value.value))
      {% else %}
        T.new(typeof(T.new(0).value).new!(value))
      {% end %}
    {% elsif T < Int %}
      {% if V < Enum %}
        T.new!(value.value)
      {% elsif V < Int %}
        T.new!(value)
      {% elsif V < Pointer %}
        T.new!(value.address)
      {% else %}
        value
      {% end %}
    {% elsif T < Pointer %}
      {% if V < Int %}
        T.new(value.to_u64!)
      {% else %}
        value.as(T)
      {% end %}
    {% elsif T < Proc %}
      value.unsafe_as(T)
    {% elsif T < Float || T < Bool || T == Nil %}
      value
    {% elsif V < Pointer %}
      value.as(T)
    {% else %}
      value.unsafe_as(T)
    {% end %}
  end
end
