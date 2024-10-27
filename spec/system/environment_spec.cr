require "../spec_helper"
require "../../src/win32cr/system/environment"

module Win32::System
  describe "Win32::System::Environment" do
    var_value = "Environment"


    describe "Setting environment variable" do
      result = LibC.SetEnvironmentVariableW("CrystalSpec".to_utf16, var_value.to_utf16)

      it "result should be greater than zero" do
        result.should be > 0
      end
    end

    describe "Reading environment variable" do
      size = LibC.GetEnvironmentVariableW("CrystalSpec".to_utf16, nil, 0)
      lpwch = Pointer(UInt16).malloc(size)
      LibC.GetEnvironmentVariableW("CrystalSpec".to_utf16, lpwch, size)
      str = String.from_utf16(lpwch).first

      it "string should be the previously set variable" do
        str.should contain(var_value)
      end
    end

    describe "Expanding variable" do
      size = Win32cr::System::Environment::C.ExpandEnvironmentStringsW("%CrystalSpec%".to_utf16, nil, 0)
      lpwch = Pointer(UInt16).malloc(size)
      Win32cr::System::Environment::C.ExpandEnvironmentStringsW("%CrystalSpec%".to_utf16, lpwch, size)
      str = String.from_utf16(lpwch).first

      it "string expanded should be the previously set variable" do
        str.should contain(var_value)
      end
    end
  end
end
