require "../spec_helper"
require "../../src/win32cr/system/environment"

module Win32::System
  describe "Win32::System::Environment" do
    var_value = "Environment"
    null_ptr = Pointer(Void).null

    describe "Setting environment variable" do
      result = LibC.SetEnvironmentVariableW(pwstr("CrystalSpec"), pwstr(var_value))

      it "result should be greater than zero" do
        result.should be > 0
      end
    end

    describe "Reading environment variable" do
      size = LibC.GetEnvironmentVariableW(pwstr("CrystalSpec"), nil, 0)
      lpwch = Pointer(UInt16).malloc(size)
      LibC.GetEnvironmentVariableW(pwstr("CrystalSpec"), lpwch, size)
      str = String.from_utf16(lpwch).first

      it "string should be the previously set variable" do
        str.should contain(var_value)
      end
    end

    describe "Expanding variable" do
      lpDst = Pointer(UInt16).malloc(sizeof(UInt16))
      size = SysEnv.expandEnvironmentStringsW(pwstr("%CrystalSpec%"), lpDst, 0_u32)
      lpwch = Pointer(UInt16).malloc(size)
      SysEnv.expandEnvironmentStringsW(pwstr("%CrystalSpec%"), lpwch, size)
      str = String.from_utf16(lpwch).first

      it "string expanded should be the previously set variable" do
        str.should contain(var_value)
      end
    end
  end
end
