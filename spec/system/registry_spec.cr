require "c/heapapi"
require "../spec_helper"
require "../../src/win32cr/system/registry"

module Win32::System

  describe "Win32::System::Registry" do
    describe "Getting a registry key" do
      bios_name = {{ `C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "& {(Get-ItemProperty -Path HKLM:\\HARDWARE\\DESCRIPTION\\System -Name Identifier).Identifier}"`.chomp.stringify }}
      dwSize = 0_u32
      hr = SysReg.regGetValueW(SysReg::HKEY_LOCAL_MACHINE.to_i64,
        pwstr("HARDWARE\\DESCRIPTION\\System"),
        pwstr("Identifier"),
        SysReg::RRF_RT::RRF_RT_ANY,
        Pointer(UInt32).null,
        Pointer(Void).null,
        pointerof(dwSize))

      it "hr for RegGetValueW to get size should be zero" do
        hr.should eq(Fd::WIN32_ERROR::NO_ERROR)
      end

      it "dwSize to get size should be greater than zero" do
        dwSize.should be > 0
      end

      pValue = LibC.HeapAlloc(LibC.GetProcessHeap, 0, dwSize)

      hr = SysReg.regGetValueW(SysReg::HKEY_LOCAL_MACHINE.to_i64,
        pwstr("HARDWARE\\DESCRIPTION\\System"),
        pwstr("Identifier"),
        SysReg::RRF_RT::RRF_RT_ANY,
        Pointer(UInt32).null,
        pValue,
        pointerof(dwSize))

      it "hr for RegGetValueW to get value should be zero" do
        hr.should eq(Fd::WIN32_ERROR::NO_ERROR)
      end

      it "dwSize to get value should be greater than zero" do
        dwSize.should be > 0
      end

      str = String.from_utf16(pValue.as(Pointer(UInt16))).first

      it "reg value data should be the same size as bios_name" do
        str.size.should eq(bios_name.size)
      end

      it "Reg value should be the same as bios name" do
        str.should eq(bios_name)
      end
    end
  end
end
