require "c/heapapi"
require "../spec_helper"
require "../../src/win32cr/system/registry"

module Win32::System

  describe "Win32::System::Registry" do
    describe "Getting a registry key" do
      bios_name = {{ `C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "& {(Get-ItemProperty -Path HKLM:\\HARDWARE\\DESCRIPTION\\System -Name Identifier).Identifier}"`.chomp.stringify }}
      dwSize = 0_u32
      hr = LibWin32.RegGetValueW(LibWin32::HKEY_LOCAL_MACHINE,
        "HARDWARE\\DESCRIPTION\\System".to_utf16,
        "Identifier".to_utf16,
        LibWin32::RRF_RT::RRF_RT_ANY,
        nil,
        nil,
        pointerof(dwSize))

      it "hr for RegGetValueW to get size should be zero" do
        hr.should eq(0)
      end

      it "dwSize to get size should be greater than zero" do
        dwSize.should be > 0
      end

      pValue = LibC.HeapAlloc(LibC.GetProcessHeap, 0, dwSize)

      hr = LibWin32.RegGetValueW(LibWin32::HKEY_LOCAL_MACHINE,
        "HARDWARE\\DESCRIPTION\\System".to_utf16,
        "Identifier".to_utf16,
        LibWin32::RRF_RT::RRF_RT_ANY,
        nil,
        pValue,
        pointerof(dwSize))

      it "hr for RegGetValueW to get value should be zero" do
        hr.should eq(0)
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