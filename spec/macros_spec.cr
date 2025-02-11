require "./spec_helper"
require "../src/macros"

describe "Win32cr Macros" do

  describe "pwstr" do
    str = "Example String"
    it "should take a string and create a UInt16 pointer" do
      pstr = pwstr(str)
      pstr.should be_a(Pointer(UInt16))
    end

    it "should have the value of 'Example String' in UInt16 pointer" do
      pstr = pwstr(str)
      val = String.from_utf16(pstr)[0] # `from_utf16` returns a tuple, first element should be the string
      val.should eq(str)
    end
  end

  describe "hiword" do
    value = 0x12345678
    pvalue = pointerof(value)

    it "returns the high-order WORD from a UInt32" do
      hiword(value.to_u32).should eq(4660_u16)
    end

    it "returns the high-order WORD from a Int32" do
      hiword(value.to_i32).should eq(4660_u16)
    end

    it "returns the high-order WORD from a UInt32 pointer" do
      hiword(pvalue).should eq(4660_u16)
    end

    it "returns the high-order WORD from a Int32 pointer" do
      hiword(pvalue).should eq(4660_u16)
    end
  end

  describe "loword" do
    value = 0x12345678
    pvalue = pointerof(value)

    it "returns the low-order WORD from a UInt32" do
      loword(value.to_u32).should eq(22136_u16)
    end

    it "returns the low-order WORD from a Int32" do
      loword(value.to_i32).should eq(22136_u16)
    end

    it "returns the low-order WORD from a UInt32 pointer" do
      loword(pvalue).should eq(22136_u16)
    end

    it "returns the low-order WORD from a Int32 pointer" do
      loword(pvalue).should eq(22136_u16)
    end
  end
end