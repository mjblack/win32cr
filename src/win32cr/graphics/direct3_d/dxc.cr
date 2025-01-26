require "./../../foundation.cr"
require "./../../system/com.cr"

module Win32cr::Graphics::Direct3D::Dxc
  alias DxcCreateInstanceProc = Proc(LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)

  alias DxcCreateInstance2Proc = Proc(Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)

  DXC_HASHFLAG_INCLUDES_SOURCE = 1_u32
  DXC_ARG_DEBUG = "-Zi"
  DXC_ARG_SKIP_VALIDATION = "-Vd"
  DXC_ARG_SKIP_OPTIMIZATIONS = "-Od"
  DXC_ARG_PACK_MATRIX_ROW_MAJOR = "-Zpr"
  DXC_ARG_PACK_MATRIX_COLUMN_MAJOR = "-Zpc"
  DXC_ARG_AVOID_FLOW_CONTROL = "-Gfa"
  DXC_ARG_PREFER_FLOW_CONTROL = "-Gfp"
  DXC_ARG_ENABLE_STRICTNESS = "-Ges"
  DXC_ARG_ENABLE_BACKWARDS_COMPATIBILITY = "-Gec"
  DXC_ARG_IEEE_STRICTNESS = "-Gis"
  DXC_ARG_OPTIMIZATION_LEVEL0 = "-O0"
  DXC_ARG_OPTIMIZATION_LEVEL1 = "-O1"
  DXC_ARG_OPTIMIZATION_LEVEL2 = "-O2"
  DXC_ARG_OPTIMIZATION_LEVEL3 = "-O3"
  DXC_ARG_WARNINGS_ARE_ERRORS = "-WX"
  DXC_ARG_RESOURCES_MAY_ALIAS = "-res_may_alias"
  DXC_ARG_ALL_RESOURCES_BOUND = "-all_resources_bound"
  DXC_ARG_DEBUG_NAME_FOR_SOURCE = "-Zss"
  DXC_ARG_DEBUG_NAME_FOR_BINARY = "-Zsb"
  DXC_EXTRA_OUTPUT_NAME_STDOUT = "*stdout*"
  DXC_EXTRA_OUTPUT_NAME_STDERR = "*stderr*"
  DxcValidatorFlags_Default = 0_u32
  DxcValidatorFlags_InPlaceEdit = 1_u32
  DxcValidatorFlags_RootSignatureOnly = 2_u32
  DxcValidatorFlags_ModuleOnly = 4_u32
  DxcValidatorFlags_ValidMask = 7_u32
  DxcVersionInfoFlags_None = 0_u32
  DxcVersionInfoFlags_Debug = 1_u32
  DxcVersionInfoFlags_Internal = 2_u32
  CLSID_DxcCompiler = "73e22d93-e6ce-47f3-b5bf-f0664f39c1b0"
  CLSID_DxcLinker = "ef6a8087-b0ea-4d56-9e45-d07e1a8b7806"
  CLSID_DxcDiaDataSource = "cd1f6b73-2ab0-484d-8edc-ebe7a43ca09f"
  CLSID_DxcCompilerArgs = "3e56ae82-224d-470f-a1a1-fe3016ee9f9d"
  CLSID_DxcLibrary = "6245d6af-66e0-48fd-80b4-4d271796748c"
  CLSID_DxcValidator = "8ca3e215-f728-4cf3-8cdd-88af917587a1"
  CLSID_DxcAssembler = "d728db68-f903-4f80-94cd-dccf76ec7151"
  CLSID_DxcContainerReflection = "b9f54489-55b8-400c-ba3a-1675e4728b91"
  CLSID_DxcOptimizer = "ae2cd79f-cc22-453f-9b6b-b124e7a5204c"
  CLSID_DxcContainerBuilder = "94134294-411f-4574-b4d0-8741e25240d2"
  CLSID_DxcPdbUtils = "54621dfb-f2ce-457e-ae8c-ec355faeec7c"

  enum DXC_CP : UInt32
    DXC_CP_ACP = 0_u32
    DXC_CP_UTF16 = 1200_u32
    DXC_CP_UTF8 = 65001_u32
  end
  enum DXC_OUT_KIND
    DXC_OUT_NONE = 0_i32
    DXC_OUT_OBJECT = 1_i32
    DXC_OUT_ERRORS = 2_i32
    DXC_OUT_PDB = 3_i32
    DXC_OUT_SHADER_HASH = 4_i32
    DXC_OUT_DISASSEMBLY = 5_i32
    DXC_OUT_HLSL = 6_i32
    DXC_OUT_TEXT = 7_i32
    DXC_OUT_REFLECTION = 8_i32
    DXC_OUT_ROOT_SIGNATURE = 9_i32
    DXC_OUT_EXTRA_OUTPUTS = 10_i32
    DXC_OUT_FORCE_DWORD = -1_i32
  end

  @[Extern]
  struct DxcShaderHash
    property flags : UInt32
    property hash_digest : UInt8[16]
    def initialize(@flags : UInt32, @hash_digest : UInt8[16])
    end
  end

  @[Extern]
  struct DxcBuffer
    property ptr : Void*
    property size : LibC::UIntPtrT
    property encoding : UInt32
    def initialize(@ptr : Void*, @size : LibC::UIntPtrT, @encoding : UInt32)
    end
  end

  @[Extern]
  struct DxcDefine
    property name : Win32cr::Foundation::PWSTR
    property value : Win32cr::Foundation::PWSTR
    def initialize(@name : Win32cr::Foundation::PWSTR, @value : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DxcArgPair
    property pName : Win32cr::Foundation::PWSTR
    property pValue : Win32cr::Foundation::PWSTR
    def initialize(@pName : Win32cr::Foundation::PWSTR, @pValue : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  record IDxcBlobVtbl,
    query_interface : Proc(IDxcBlob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcBlob*, UInt32),
    release : Proc(IDxcBlob*, UInt32),
    get_buffer_pointer : Proc(IDxcBlob*, Void*),
    get_buffer_size : Proc(IDxcBlob*, LibC::UIntPtrT)


  @[Extern]
  record IDxcBlob, lpVtbl : IDxcBlobVtbl* do
    GUID = LibC::GUID.new(0x8ba5fb08_u32, 0x5195_u16, 0x40e2_u16, StaticArray[0xac_u8, 0x58_u8, 0xd_u8, 0x98_u8, 0x9c_u8, 0x3a_u8, 0x1_u8, 0x2_u8])
    def query_interface(this : IDxcBlob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcBlob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcBlob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer_pointer(this : IDxcBlob*) : Void*
      @lpVtbl.try &.value.get_buffer_pointer.call(this)
    end
    def get_buffer_size(this : IDxcBlob*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_buffer_size.call(this)
    end

  end

  @[Extern]
  record IDxcBlobEncodingVtbl,
    query_interface : Proc(IDxcBlobEncoding*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcBlobEncoding*, UInt32),
    release : Proc(IDxcBlobEncoding*, UInt32),
    get_buffer_pointer : Proc(IDxcBlobEncoding*, Void*),
    get_buffer_size : Proc(IDxcBlobEncoding*, LibC::UIntPtrT),
    get_encoding : Proc(IDxcBlobEncoding*, Win32cr::Foundation::BOOL*, Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcBlobEncoding, lpVtbl : IDxcBlobEncodingVtbl* do
    GUID = LibC::GUID.new(0x7241d424_u32, 0x2646_u16, 0x4191_u16, StaticArray[0x97_u8, 0xc0_u8, 0x98_u8, 0xe9_u8, 0x6e_u8, 0x42_u8, 0xfc_u8, 0x68_u8])
    def query_interface(this : IDxcBlobEncoding*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcBlobEncoding*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcBlobEncoding*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer_pointer(this : IDxcBlobEncoding*) : Void*
      @lpVtbl.try &.value.get_buffer_pointer.call(this)
    end
    def get_buffer_size(this : IDxcBlobEncoding*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_buffer_size.call(this)
    end
    def get_encoding(this : IDxcBlobEncoding*, pKnown : Win32cr::Foundation::BOOL*, pCodePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encoding.call(this, pKnown, pCodePage)
    end

  end

  @[Extern]
  record IDxcBlobUtf16Vtbl,
    query_interface : Proc(IDxcBlobUtf16*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcBlobUtf16*, UInt32),
    release : Proc(IDxcBlobUtf16*, UInt32),
    get_buffer_pointer : Proc(IDxcBlobUtf16*, Void*),
    get_buffer_size : Proc(IDxcBlobUtf16*, LibC::UIntPtrT),
    get_encoding : Proc(IDxcBlobUtf16*, Win32cr::Foundation::BOOL*, Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, Win32cr::Foundation::HRESULT),
    get_string_pointer : Proc(IDxcBlobUtf16*, Win32cr::Foundation::PWSTR),
    get_string_length : Proc(IDxcBlobUtf16*, LibC::UIntPtrT)


  @[Extern]
  record IDxcBlobUtf16, lpVtbl : IDxcBlobUtf16Vtbl* do
    GUID = LibC::GUID.new(0xa3f84eab_u32, 0xfaa_u16, 0x497e_u16, StaticArray[0xa3_u8, 0x9c_u8, 0xee_u8, 0x6e_u8, 0xd6_u8, 0xb_u8, 0x2d_u8, 0x84_u8])
    def query_interface(this : IDxcBlobUtf16*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcBlobUtf16*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcBlobUtf16*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer_pointer(this : IDxcBlobUtf16*) : Void*
      @lpVtbl.try &.value.get_buffer_pointer.call(this)
    end
    def get_buffer_size(this : IDxcBlobUtf16*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_buffer_size.call(this)
    end
    def get_encoding(this : IDxcBlobUtf16*, pKnown : Win32cr::Foundation::BOOL*, pCodePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encoding.call(this, pKnown, pCodePage)
    end
    def get_string_pointer(this : IDxcBlobUtf16*) : Win32cr::Foundation::PWSTR
      @lpVtbl.try &.value.get_string_pointer.call(this)
    end
    def get_string_length(this : IDxcBlobUtf16*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_string_length.call(this)
    end

  end

  @[Extern]
  record IDxcBlobUtf8Vtbl,
    query_interface : Proc(IDxcBlobUtf8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcBlobUtf8*, UInt32),
    release : Proc(IDxcBlobUtf8*, UInt32),
    get_buffer_pointer : Proc(IDxcBlobUtf8*, Void*),
    get_buffer_size : Proc(IDxcBlobUtf8*, LibC::UIntPtrT),
    get_encoding : Proc(IDxcBlobUtf8*, Win32cr::Foundation::BOOL*, Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, Win32cr::Foundation::HRESULT),
    get_string_pointer : Proc(IDxcBlobUtf8*, Win32cr::Foundation::PSTR),
    get_string_length : Proc(IDxcBlobUtf8*, LibC::UIntPtrT)


  @[Extern]
  record IDxcBlobUtf8, lpVtbl : IDxcBlobUtf8Vtbl* do
    GUID = LibC::GUID.new(0x3da636c9_u32, 0xba71_u16, 0x4024_u16, StaticArray[0xa3_u8, 0x1_u8, 0x30_u8, 0xcb_u8, 0xf1_u8, 0x25_u8, 0x30_u8, 0x5b_u8])
    def query_interface(this : IDxcBlobUtf8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcBlobUtf8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcBlobUtf8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffer_pointer(this : IDxcBlobUtf8*) : Void*
      @lpVtbl.try &.value.get_buffer_pointer.call(this)
    end
    def get_buffer_size(this : IDxcBlobUtf8*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_buffer_size.call(this)
    end
    def get_encoding(this : IDxcBlobUtf8*, pKnown : Win32cr::Foundation::BOOL*, pCodePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_encoding.call(this, pKnown, pCodePage)
    end
    def get_string_pointer(this : IDxcBlobUtf8*) : Win32cr::Foundation::PSTR
      @lpVtbl.try &.value.get_string_pointer.call(this)
    end
    def get_string_length(this : IDxcBlobUtf8*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_string_length.call(this)
    end

  end

  @[Extern]
  record IDxcIncludeHandlerVtbl,
    query_interface : Proc(IDxcIncludeHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcIncludeHandler*, UInt32),
    release : Proc(IDxcIncludeHandler*, UInt32),
    load_source : Proc(IDxcIncludeHandler*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcIncludeHandler, lpVtbl : IDxcIncludeHandlerVtbl* do
    GUID = LibC::GUID.new(0x7f61fc7d_u32, 0x950d_u16, 0x467f_u16, StaticArray[0xb3_u8, 0xe3_u8, 0x3c_u8, 0x2_u8, 0xfb_u8, 0x49_u8, 0x18_u8, 0x7c_u8])
    def query_interface(this : IDxcIncludeHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcIncludeHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcIncludeHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_source(this : IDxcIncludeHandler*, pFilename : Win32cr::Foundation::PWSTR, ppIncludeSource : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_source.call(this, pFilename, ppIncludeSource)
    end

  end

  @[Extern]
  record IDxcCompilerArgsVtbl,
    query_interface : Proc(IDxcCompilerArgs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcCompilerArgs*, UInt32),
    release : Proc(IDxcCompilerArgs*, UInt32),
    get_arguments : Proc(IDxcCompilerArgs*, Win32cr::Foundation::PWSTR*),
    get_count : Proc(IDxcCompilerArgs*, UInt32),
    add_arguments : Proc(IDxcCompilerArgs*, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::HRESULT),
    add_arguments_utf8 : Proc(IDxcCompilerArgs*, Win32cr::Foundation::PSTR*, UInt32, Win32cr::Foundation::HRESULT),
    add_defines : Proc(IDxcCompilerArgs*, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcCompilerArgs, lpVtbl : IDxcCompilerArgsVtbl* do
    GUID = LibC::GUID.new(0x73effe2a_u32, 0x70dc_u16, 0x45f8_u16, StaticArray[0x96_u8, 0x90_u8, 0xef_u8, 0xf6_u8, 0x4c_u8, 0x2_u8, 0x42_u8, 0x9d_u8])
    def query_interface(this : IDxcCompilerArgs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcCompilerArgs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcCompilerArgs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_arguments(this : IDxcCompilerArgs*) : Win32cr::Foundation::PWSTR*
      @lpVtbl.try &.value.get_arguments.call(this)
    end
    def get_count(this : IDxcCompilerArgs*) : UInt32
      @lpVtbl.try &.value.get_count.call(this)
    end
    def add_arguments(this : IDxcCompilerArgs*, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_arguments.call(this, pArguments, argCount)
    end
    def add_arguments_utf8(this : IDxcCompilerArgs*, pArguments : Win32cr::Foundation::PSTR*, argCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_arguments_utf8.call(this, pArguments, argCount)
    end
    def add_defines(this : IDxcCompilerArgs*, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_defines.call(this, pDefines, defineCount)
    end

  end

  @[Extern]
  record IDxcLibraryVtbl,
    query_interface : Proc(IDxcLibrary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcLibrary*, UInt32),
    release : Proc(IDxcLibrary*, UInt32),
    set_malloc : Proc(IDxcLibrary*, Void*, Win32cr::Foundation::HRESULT),
    create_blob_from_blob : Proc(IDxcLibrary*, Void*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_blob_from_file : Proc(IDxcLibrary*, Win32cr::Foundation::PWSTR, Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, Void**, Win32cr::Foundation::HRESULT),
    create_blob_with_encoding_from_pinned : Proc(IDxcLibrary*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_CP, Void**, Win32cr::Foundation::HRESULT),
    create_blob_with_encoding_on_heap_copy : Proc(IDxcLibrary*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_CP, Void**, Win32cr::Foundation::HRESULT),
    create_blob_with_encoding_on_malloc : Proc(IDxcLibrary*, Void*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_CP, Void**, Win32cr::Foundation::HRESULT),
    create_include_handler : Proc(IDxcLibrary*, Void**, Win32cr::Foundation::HRESULT),
    create_stream_from_blob_read_only : Proc(IDxcLibrary*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_blob_as_utf8 : Proc(IDxcLibrary*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_blob_as_utf16 : Proc(IDxcLibrary*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcLibrary, lpVtbl : IDxcLibraryVtbl* do
    GUID = LibC::GUID.new(0xe5204dc7_u32, 0xd18c_u16, 0x4c3c_u16, StaticArray[0xbd_u8, 0xfb_u8, 0x85_u8, 0x16_u8, 0x73_u8, 0x98_u8, 0xf_u8, 0xe7_u8])
    def query_interface(this : IDxcLibrary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcLibrary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcLibrary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_malloc(this : IDxcLibrary*, pMalloc : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_malloc.call(this, pMalloc)
    end
    def create_blob_from_blob(this : IDxcLibrary*, pBlob : Void*, offset : UInt32, length : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_from_blob.call(this, pBlob, offset, length, ppResult)
    end
    def create_blob_from_file(this : IDxcLibrary*, pFileName : Win32cr::Foundation::PWSTR, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_from_file.call(this, pFileName, codePage, pBlobEncoding)
    end
    def create_blob_with_encoding_from_pinned(this : IDxcLibrary*, pText : Void*, size : UInt32, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_with_encoding_from_pinned.call(this, pText, size, codePage, pBlobEncoding)
    end
    def create_blob_with_encoding_on_heap_copy(this : IDxcLibrary*, pText : Void*, size : UInt32, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_with_encoding_on_heap_copy.call(this, pText, size, codePage, pBlobEncoding)
    end
    def create_blob_with_encoding_on_malloc(this : IDxcLibrary*, pText : Void*, pIMalloc : Void*, size : UInt32, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_with_encoding_on_malloc.call(this, pText, pIMalloc, size, codePage, pBlobEncoding)
    end
    def create_include_handler(this : IDxcLibrary*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_include_handler.call(this, ppResult)
    end
    def create_stream_from_blob_read_only(this : IDxcLibrary*, pBlob : Void*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_stream_from_blob_read_only.call(this, pBlob, ppStream)
    end
    def get_blob_as_utf8(this : IDxcLibrary*, pBlob : Void*, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob_as_utf8.call(this, pBlob, pBlobEncoding)
    end
    def get_blob_as_utf16(this : IDxcLibrary*, pBlob : Void*, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob_as_utf16.call(this, pBlob, pBlobEncoding)
    end

  end

  @[Extern]
  record IDxcOperationResultVtbl,
    query_interface : Proc(IDxcOperationResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcOperationResult*, UInt32),
    release : Proc(IDxcOperationResult*, UInt32),
    get_status : Proc(IDxcOperationResult*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_result : Proc(IDxcOperationResult*, Void**, Win32cr::Foundation::HRESULT),
    get_error_buffer : Proc(IDxcOperationResult*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcOperationResult, lpVtbl : IDxcOperationResultVtbl* do
    GUID = LibC::GUID.new(0xcedb484a_u32, 0xd4e9_u16, 0x445a_u16, StaticArray[0xb9_u8, 0x91_u8, 0xca_u8, 0x21_u8, 0xca_u8, 0x15_u8, 0x7d_u8, 0xc2_u8])
    def query_interface(this : IDxcOperationResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcOperationResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcOperationResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_status(this : IDxcOperationResult*, pStatus : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus)
    end
    def get_result(this : IDxcOperationResult*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result.call(this, ppResult)
    end
    def get_error_buffer(this : IDxcOperationResult*, ppErrors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_buffer.call(this, ppErrors)
    end

  end

  @[Extern]
  record IDxcCompilerVtbl,
    query_interface : Proc(IDxcCompiler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcCompiler*, UInt32),
    release : Proc(IDxcCompiler*, UInt32),
    compile : Proc(IDxcCompiler*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    preprocess : Proc(IDxcCompiler*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    disassemble : Proc(IDxcCompiler*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcCompiler, lpVtbl : IDxcCompilerVtbl* do
    GUID = LibC::GUID.new(0x8c210bf3_u32, 0x11f_u16, 0x4422_u16, StaticArray[0x8d_u8, 0x70_u8, 0x6f_u8, 0x9a_u8, 0xcb_u8, 0x8d_u8, 0xb6_u8, 0x17_u8])
    def query_interface(this : IDxcCompiler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcCompiler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcCompiler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compile(this : IDxcCompiler*, pSource : Void*, pSourceName : Win32cr::Foundation::PWSTR, pEntryPoint : Win32cr::Foundation::PWSTR, pTargetProfile : Win32cr::Foundation::PWSTR, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32, pIncludeHandler : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile.call(this, pSource, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult)
    end
    def preprocess(this : IDxcCompiler*, pSource : Void*, pSourceName : Win32cr::Foundation::PWSTR, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32, pIncludeHandler : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preprocess.call(this, pSource, pSourceName, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult)
    end
    def disassemble(this : IDxcCompiler*, pSource : Void*, ppDisassembly : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disassemble.call(this, pSource, ppDisassembly)
    end

  end

  @[Extern]
  record IDxcCompiler2Vtbl,
    query_interface : Proc(IDxcCompiler2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcCompiler2*, UInt32),
    release : Proc(IDxcCompiler2*, UInt32),
    compile : Proc(IDxcCompiler2*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    preprocess : Proc(IDxcCompiler2*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    disassemble : Proc(IDxcCompiler2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    compile_with_debug : Proc(IDxcCompiler2*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Void*, Void**, Win32cr::Foundation::PWSTR*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcCompiler2, lpVtbl : IDxcCompiler2Vtbl* do
    GUID = LibC::GUID.new(0xa005a9d9_u32, 0xb8bb_u16, 0x4594_u16, StaticArray[0xb5_u8, 0xc9_u8, 0xe_u8, 0x63_u8, 0x3b_u8, 0xec_u8, 0x4d_u8, 0x37_u8])
    def query_interface(this : IDxcCompiler2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcCompiler2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcCompiler2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compile(this : IDxcCompiler2*, pSource : Void*, pSourceName : Win32cr::Foundation::PWSTR, pEntryPoint : Win32cr::Foundation::PWSTR, pTargetProfile : Win32cr::Foundation::PWSTR, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32, pIncludeHandler : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile.call(this, pSource, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult)
    end
    def preprocess(this : IDxcCompiler2*, pSource : Void*, pSourceName : Win32cr::Foundation::PWSTR, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32, pIncludeHandler : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preprocess.call(this, pSource, pSourceName, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult)
    end
    def disassemble(this : IDxcCompiler2*, pSource : Void*, ppDisassembly : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disassemble.call(this, pSource, ppDisassembly)
    end
    def compile_with_debug(this : IDxcCompiler2*, pSource : Void*, pSourceName : Win32cr::Foundation::PWSTR, pEntryPoint : Win32cr::Foundation::PWSTR, pTargetProfile : Win32cr::Foundation::PWSTR, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32, pIncludeHandler : Void*, ppResult : Void**, ppDebugBlobName : Win32cr::Foundation::PWSTR*, ppDebugBlob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile_with_debug.call(this, pSource, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, pIncludeHandler, ppResult, ppDebugBlobName, ppDebugBlob)
    end

  end

  @[Extern]
  record IDxcLinkerVtbl,
    query_interface : Proc(IDxcLinker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcLinker*, UInt32),
    release : Proc(IDxcLinker*, UInt32),
    register_library : Proc(IDxcLinker*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    link : Proc(IDxcLinker*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::PWSTR*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcLinker, lpVtbl : IDxcLinkerVtbl* do
    GUID = LibC::GUID.new(0xf1b5be2a_u32, 0x62dd_u16, 0x4327_u16, StaticArray[0xa1_u8, 0xc2_u8, 0x42_u8, 0xac_u8, 0x1e_u8, 0x1e_u8, 0x78_u8, 0xe6_u8])
    def query_interface(this : IDxcLinker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcLinker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcLinker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_library(this : IDxcLinker*, pLibName : Win32cr::Foundation::PWSTR, pLib : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_library.call(this, pLibName, pLib)
    end
    def link(this : IDxcLinker*, pEntryName : Win32cr::Foundation::PWSTR, pTargetProfile : Win32cr::Foundation::PWSTR, pLibNames : Win32cr::Foundation::PWSTR*, libCount : UInt32, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.link.call(this, pEntryName, pTargetProfile, pLibNames, libCount, pArguments, argCount, ppResult)
    end

  end

  @[Extern]
  record IDxcUtilsVtbl,
    query_interface : Proc(IDxcUtils*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcUtils*, UInt32),
    release : Proc(IDxcUtils*, UInt32),
    create_blob_from_blob : Proc(IDxcUtils*, Void*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_blob_from_pinned : Proc(IDxcUtils*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_CP, Void**, Win32cr::Foundation::HRESULT),
    move_to_blob : Proc(IDxcUtils*, Void*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_CP, Void**, Win32cr::Foundation::HRESULT),
    create_blob : Proc(IDxcUtils*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_CP, Void**, Win32cr::Foundation::HRESULT),
    load_file : Proc(IDxcUtils*, Win32cr::Foundation::PWSTR, Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, Void**, Win32cr::Foundation::HRESULT),
    create_read_only_stream_from_blob : Proc(IDxcUtils*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_default_include_handler : Proc(IDxcUtils*, Void**, Win32cr::Foundation::HRESULT),
    get_blob_as_utf8 : Proc(IDxcUtils*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_blob_as_utf16 : Proc(IDxcUtils*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_dxil_container_part : Proc(IDxcUtils*, Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    create_reflection : Proc(IDxcUtils*, Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    build_arguments : Proc(IDxcUtils*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_pdb_contents : Proc(IDxcUtils*, Void*, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcUtils, lpVtbl : IDxcUtilsVtbl* do
    GUID = LibC::GUID.new(0x4605c4cb_u32, 0x2019_u16, 0x492a_u16, StaticArray[0xad_u8, 0xa4_u8, 0x65_u8, 0xf2_u8, 0xb_u8, 0xb7_u8, 0xd6_u8, 0x7f_u8])
    def query_interface(this : IDxcUtils*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcUtils*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcUtils*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_blob_from_blob(this : IDxcUtils*, pBlob : Void*, offset : UInt32, length : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_from_blob.call(this, pBlob, offset, length, ppResult)
    end
    def create_blob_from_pinned(this : IDxcUtils*, pData : Void*, size : UInt32, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob_from_pinned.call(this, pData, size, codePage, pBlobEncoding)
    end
    def move_to_blob(this : IDxcUtils*, pData : Void*, pIMalloc : Void*, size : UInt32, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_blob.call(this, pData, pIMalloc, size, codePage, pBlobEncoding)
    end
    def create_blob(this : IDxcUtils*, pData : Void*, size : UInt32, codePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blob.call(this, pData, size, codePage, pBlobEncoding)
    end
    def load_file(this : IDxcUtils*, pFileName : Win32cr::Foundation::PWSTR, pCodePage : Win32cr::Graphics::Direct3D::Dxc::DXC_CP*, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_file.call(this, pFileName, pCodePage, pBlobEncoding)
    end
    def create_read_only_stream_from_blob(this : IDxcUtils*, pBlob : Void*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_read_only_stream_from_blob.call(this, pBlob, ppStream)
    end
    def create_default_include_handler(this : IDxcUtils*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_default_include_handler.call(this, ppResult)
    end
    def get_blob_as_utf8(this : IDxcUtils*, pBlob : Void*, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob_as_utf8.call(this, pBlob, pBlobEncoding)
    end
    def get_blob_as_utf16(this : IDxcUtils*, pBlob : Void*, pBlobEncoding : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_blob_as_utf16.call(this, pBlob, pBlobEncoding)
    end
    def get_dxil_container_part(this : IDxcUtils*, pShader : Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, dxc_part : UInt32, ppPartData : Void**, pPartSizeInBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dxil_container_part.call(this, pShader, dxc_part, ppPartData, pPartSizeInBytes)
    end
    def create_reflection(this : IDxcUtils*, pData : Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, iid : LibC::GUID*, ppvReflection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_reflection.call(this, pData, iid, ppvReflection)
    end
    def build_arguments(this : IDxcUtils*, pSourceName : Win32cr::Foundation::PWSTR, pEntryPoint : Win32cr::Foundation::PWSTR, pTargetProfile : Win32cr::Foundation::PWSTR, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pDefines : Win32cr::Graphics::Direct3D::Dxc::DxcDefine*, defineCount : UInt32, ppArgs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_arguments.call(this, pSourceName, pEntryPoint, pTargetProfile, pArguments, argCount, pDefines, defineCount, ppArgs)
    end
    def get_pdb_contents(this : IDxcUtils*, pPDBBlob : Void*, ppHash : Void**, ppContainer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pdb_contents.call(this, pPDBBlob, ppHash, ppContainer)
    end

  end

  @[Extern]
  record IDxcResultVtbl,
    query_interface : Proc(IDxcResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcResult*, UInt32),
    release : Proc(IDxcResult*, UInt32),
    get_status : Proc(IDxcResult*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_result : Proc(IDxcResult*, Void**, Win32cr::Foundation::HRESULT),
    get_error_buffer : Proc(IDxcResult*, Void**, Win32cr::Foundation::HRESULT),
    has_output : Proc(IDxcResult*, Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND, Win32cr::Foundation::BOOL),
    get_output : Proc(IDxcResult*, Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND, LibC::GUID*, Void**, Void**, Win32cr::Foundation::HRESULT),
    get_num_outputs : Proc(IDxcResult*, UInt32),
    get_output_by_index : Proc(IDxcResult*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND),
    primary_output : Proc(IDxcResult*, Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND)


  @[Extern]
  record IDxcResult, lpVtbl : IDxcResultVtbl* do
    GUID = LibC::GUID.new(0x58346cda_u32, 0xdde7_u16, 0x4497_u16, StaticArray[0x94_u8, 0x61_u8, 0x6f_u8, 0x87_u8, 0xaf_u8, 0x5e_u8, 0x6_u8, 0x59_u8])
    def query_interface(this : IDxcResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_status(this : IDxcResult*, pStatus : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus)
    end
    def get_result(this : IDxcResult*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_result.call(this, ppResult)
    end
    def get_error_buffer(this : IDxcResult*, ppErrors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_buffer.call(this, ppErrors)
    end
    def has_output(this : IDxcResult*, dxcOutKind : Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.has_output.call(this, dxcOutKind)
    end
    def get_output(this : IDxcResult*, dxcOutKind : Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND, iid : LibC::GUID*, ppvObject : Void**, ppOutputName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output.call(this, dxcOutKind, iid, ppvObject, ppOutputName)
    end
    def get_num_outputs(this : IDxcResult*) : UInt32
      @lpVtbl.try &.value.get_num_outputs.call(this)
    end
    def get_output_by_index(this : IDxcResult*, index : UInt32) : Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND
      @lpVtbl.try &.value.get_output_by_index.call(this, index)
    end
    def primary_output(this : IDxcResult*) : Win32cr::Graphics::Direct3D::Dxc::DXC_OUT_KIND
      @lpVtbl.try &.value.primary_output.call(this)
    end

  end

  @[Extern]
  record IDxcExtraOutputsVtbl,
    query_interface : Proc(IDxcExtraOutputs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcExtraOutputs*, UInt32),
    release : Proc(IDxcExtraOutputs*, UInt32),
    get_output_count : Proc(IDxcExtraOutputs*, UInt32),
    get_output : Proc(IDxcExtraOutputs*, UInt32, LibC::GUID*, Void**, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcExtraOutputs, lpVtbl : IDxcExtraOutputsVtbl* do
    GUID = LibC::GUID.new(0x319b37a2_u32, 0xa5c2_u16, 0x494a_u16, StaticArray[0xa5_u8, 0xde_u8, 0x48_u8, 0x1_u8, 0xb2_u8, 0xfa_u8, 0xf9_u8, 0x89_u8])
    def query_interface(this : IDxcExtraOutputs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcExtraOutputs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcExtraOutputs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_output_count(this : IDxcExtraOutputs*) : UInt32
      @lpVtbl.try &.value.get_output_count.call(this)
    end
    def get_output(this : IDxcExtraOutputs*, uIndex : UInt32, iid : LibC::GUID*, ppvObject : Void**, ppOutputType : Void**, ppOutputName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output.call(this, uIndex, iid, ppvObject, ppOutputType, ppOutputName)
    end

  end

  @[Extern]
  record IDxcCompiler3Vtbl,
    query_interface : Proc(IDxcCompiler3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcCompiler3*, UInt32),
    release : Proc(IDxcCompiler3*, UInt32),
    compile : Proc(IDxcCompiler3*, Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, Win32cr::Foundation::PWSTR*, UInt32, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    disassemble : Proc(IDxcCompiler3*, Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcCompiler3, lpVtbl : IDxcCompiler3Vtbl* do
    GUID = LibC::GUID.new(0x228b4687_u32, 0x5a6a_u16, 0x4730_u16, StaticArray[0x90_u8, 0xc_u8, 0x97_u8, 0x2_u8, 0xb2_u8, 0x20_u8, 0x3f_u8, 0x54_u8])
    def query_interface(this : IDxcCompiler3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcCompiler3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcCompiler3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compile(this : IDxcCompiler3*, pSource : Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, pArguments : Win32cr::Foundation::PWSTR*, argCount : UInt32, pIncludeHandler : Void*, riid : LibC::GUID*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile.call(this, pSource, pArguments, argCount, pIncludeHandler, riid, ppResult)
    end
    def disassemble(this : IDxcCompiler3*, pObject : Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, riid : LibC::GUID*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disassemble.call(this, pObject, riid, ppResult)
    end

  end

  @[Extern]
  record IDxcValidatorVtbl,
    query_interface : Proc(IDxcValidator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcValidator*, UInt32),
    release : Proc(IDxcValidator*, UInt32),
    validate : Proc(IDxcValidator*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcValidator, lpVtbl : IDxcValidatorVtbl* do
    GUID = LibC::GUID.new(0xa6e82bd2_u32, 0x1fd7_u16, 0x4826_u16, StaticArray[0x98_u8, 0x11_u8, 0x28_u8, 0x57_u8, 0xe7_u8, 0x97_u8, 0xf4_u8, 0x9a_u8])
    def query_interface(this : IDxcValidator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcValidator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcValidator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def validate(this : IDxcValidator*, pShader : Void*, flags : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate.call(this, pShader, flags, ppResult)
    end

  end

  @[Extern]
  record IDxcValidator2Vtbl,
    query_interface : Proc(IDxcValidator2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcValidator2*, UInt32),
    release : Proc(IDxcValidator2*, UInt32),
    validate : Proc(IDxcValidator2*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    validate_with_debug : Proc(IDxcValidator2*, Void*, UInt32, Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcValidator2, lpVtbl : IDxcValidator2Vtbl* do
    GUID = LibC::GUID.new(0x458e1fd1_u32, 0xb1b2_u16, 0x4750_u16, StaticArray[0xa6_u8, 0xe1_u8, 0x9c_u8, 0x10_u8, 0xf0_u8, 0x3b_u8, 0xed_u8, 0x92_u8])
    def query_interface(this : IDxcValidator2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcValidator2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcValidator2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def validate(this : IDxcValidator2*, pShader : Void*, flags : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate.call(this, pShader, flags, ppResult)
    end
    def validate_with_debug(this : IDxcValidator2*, pShader : Void*, flags : UInt32, pOptDebugBitcode : Win32cr::Graphics::Direct3D::Dxc::DxcBuffer*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.validate_with_debug.call(this, pShader, flags, pOptDebugBitcode, ppResult)
    end

  end

  @[Extern]
  record IDxcContainerBuilderVtbl,
    query_interface : Proc(IDxcContainerBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcContainerBuilder*, UInt32),
    release : Proc(IDxcContainerBuilder*, UInt32),
    load : Proc(IDxcContainerBuilder*, Void*, Win32cr::Foundation::HRESULT),
    add_part : Proc(IDxcContainerBuilder*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_part : Proc(IDxcContainerBuilder*, UInt32, Win32cr::Foundation::HRESULT),
    serialize_container : Proc(IDxcContainerBuilder*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcContainerBuilder, lpVtbl : IDxcContainerBuilderVtbl* do
    GUID = LibC::GUID.new(0x334b1f50_u32, 0x2292_u16, 0x4b35_u16, StaticArray[0x99_u8, 0xa1_u8, 0x25_u8, 0x58_u8, 0x8d_u8, 0x8c_u8, 0x17_u8, 0xfe_u8])
    def query_interface(this : IDxcContainerBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcContainerBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcContainerBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load(this : IDxcContainerBuilder*, pDxilContainerHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pDxilContainerHeader)
    end
    def add_part(this : IDxcContainerBuilder*, fourCC : UInt32, pSource : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_part.call(this, fourCC, pSource)
    end
    def remove_part(this : IDxcContainerBuilder*, fourCC : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_part.call(this, fourCC)
    end
    def serialize_container(this : IDxcContainerBuilder*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize_container.call(this, ppResult)
    end

  end

  @[Extern]
  record IDxcAssemblerVtbl,
    query_interface : Proc(IDxcAssembler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcAssembler*, UInt32),
    release : Proc(IDxcAssembler*, UInt32),
    assemble_to_container : Proc(IDxcAssembler*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcAssembler, lpVtbl : IDxcAssemblerVtbl* do
    GUID = LibC::GUID.new(0x91f7a26_u32, 0x1c1f_u16, 0x4948_u16, StaticArray[0x90_u8, 0x4b_u8, 0xe6_u8, 0xe3_u8, 0xa8_u8, 0xa7_u8, 0x71_u8, 0xd5_u8])
    def query_interface(this : IDxcAssembler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcAssembler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcAssembler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def assemble_to_container(this : IDxcAssembler*, pShader : Void*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assemble_to_container.call(this, pShader, ppResult)
    end

  end

  @[Extern]
  record IDxcContainerReflectionVtbl,
    query_interface : Proc(IDxcContainerReflection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcContainerReflection*, UInt32),
    release : Proc(IDxcContainerReflection*, UInt32),
    load : Proc(IDxcContainerReflection*, Void*, Win32cr::Foundation::HRESULT),
    get_part_count : Proc(IDxcContainerReflection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_part_kind : Proc(IDxcContainerReflection*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_part_content : Proc(IDxcContainerReflection*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    find_first_part_kind : Proc(IDxcContainerReflection*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_part_reflection : Proc(IDxcContainerReflection*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcContainerReflection, lpVtbl : IDxcContainerReflectionVtbl* do
    GUID = LibC::GUID.new(0xd2c21b26_u32, 0x8350_u16, 0x4bdc_u16, StaticArray[0x97_u8, 0x6a_u8, 0x33_u8, 0x1c_u8, 0xe6_u8, 0xf4_u8, 0xc5_u8, 0x4c_u8])
    def query_interface(this : IDxcContainerReflection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcContainerReflection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcContainerReflection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load(this : IDxcContainerReflection*, pContainer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pContainer)
    end
    def get_part_count(this : IDxcContainerReflection*, pResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_count.call(this, pResult)
    end
    def get_part_kind(this : IDxcContainerReflection*, idx : UInt32, pResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_kind.call(this, idx, pResult)
    end
    def get_part_content(this : IDxcContainerReflection*, idx : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_content.call(this, idx, ppResult)
    end
    def find_first_part_kind(this : IDxcContainerReflection*, kind : UInt32, pResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_part_kind.call(this, kind, pResult)
    end
    def get_part_reflection(this : IDxcContainerReflection*, idx : UInt32, iid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_part_reflection.call(this, idx, iid, ppvObject)
    end

  end

  @[Extern]
  record IDxcOptimizerPassVtbl,
    query_interface : Proc(IDxcOptimizerPass*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcOptimizerPass*, UInt32),
    release : Proc(IDxcOptimizerPass*, UInt32),
    get_option_name : Proc(IDxcOptimizerPass*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_description : Proc(IDxcOptimizerPass*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_option_arg_count : Proc(IDxcOptimizerPass*, UInt32*, Win32cr::Foundation::HRESULT),
    get_option_arg_name : Proc(IDxcOptimizerPass*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_option_arg_description : Proc(IDxcOptimizerPass*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcOptimizerPass, lpVtbl : IDxcOptimizerPassVtbl* do
    GUID = LibC::GUID.new(0xae2cd79f_u32, 0xcc22_u16, 0x453f_u16, StaticArray[0x9b_u8, 0x6b_u8, 0xb1_u8, 0x24_u8, 0xe7_u8, 0xa5_u8, 0x20_u8, 0x4c_u8])
    def query_interface(this : IDxcOptimizerPass*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcOptimizerPass*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcOptimizerPass*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_option_name(this : IDxcOptimizerPass*, ppResult : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_option_name.call(this, ppResult)
    end
    def get_description(this : IDxcOptimizerPass*, ppResult : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, ppResult)
    end
    def get_option_arg_count(this : IDxcOptimizerPass*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_option_arg_count.call(this, pCount)
    end
    def get_option_arg_name(this : IDxcOptimizerPass*, argIndex : UInt32, ppResult : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_option_arg_name.call(this, argIndex, ppResult)
    end
    def get_option_arg_description(this : IDxcOptimizerPass*, argIndex : UInt32, ppResult : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_option_arg_description.call(this, argIndex, ppResult)
    end

  end

  @[Extern]
  record IDxcOptimizerVtbl,
    query_interface : Proc(IDxcOptimizer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcOptimizer*, UInt32),
    release : Proc(IDxcOptimizer*, UInt32),
    get_available_pass_count : Proc(IDxcOptimizer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_available_pass : Proc(IDxcOptimizer*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    run_optimizer : Proc(IDxcOptimizer*, Void*, Win32cr::Foundation::PWSTR*, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcOptimizer, lpVtbl : IDxcOptimizerVtbl* do
    GUID = LibC::GUID.new(0x25740e2e_u32, 0x9cba_u16, 0x401b_u16, StaticArray[0x91_u8, 0x19_u8, 0x4f_u8, 0xb4_u8, 0x2f_u8, 0x39_u8, 0xf2_u8, 0x70_u8])
    def query_interface(this : IDxcOptimizer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcOptimizer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcOptimizer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_available_pass_count(this : IDxcOptimizer*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_pass_count.call(this, pCount)
    end
    def get_available_pass(this : IDxcOptimizer*, index : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_pass.call(this, index, ppResult)
    end
    def run_optimizer(this : IDxcOptimizer*, pBlob : Void*, ppOptions : Win32cr::Foundation::PWSTR*, optionCount : UInt32, pOutputModule : Void**, ppOutputText : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_optimizer.call(this, pBlob, ppOptions, optionCount, pOutputModule, ppOutputText)
    end

  end

  @[Extern]
  record IDxcVersionInfoVtbl,
    query_interface : Proc(IDxcVersionInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcVersionInfo*, UInt32),
    release : Proc(IDxcVersionInfo*, UInt32),
    get_version : Proc(IDxcVersionInfo*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IDxcVersionInfo*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcVersionInfo, lpVtbl : IDxcVersionInfoVtbl* do
    GUID = LibC::GUID.new(0xb04f5b50_u32, 0x2059_u16, 0x4f12_u16, StaticArray[0xa8_u8, 0xff_u8, 0xa1_u8, 0xe0_u8, 0xcd_u8, 0xe1_u8, 0xcc_u8, 0x7e_u8])
    def query_interface(this : IDxcVersionInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcVersionInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcVersionInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version(this : IDxcVersionInfo*, pMajor : UInt32*, pMinor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pMajor, pMinor)
    end
    def get_flags(this : IDxcVersionInfo*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pFlags)
    end

  end

  @[Extern]
  record IDxcVersionInfo2Vtbl,
    query_interface : Proc(IDxcVersionInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcVersionInfo2*, UInt32),
    release : Proc(IDxcVersionInfo2*, UInt32),
    get_version : Proc(IDxcVersionInfo2*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IDxcVersionInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_commit_info : Proc(IDxcVersionInfo2*, UInt32*, Int8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcVersionInfo2, lpVtbl : IDxcVersionInfo2Vtbl* do
    GUID = LibC::GUID.new(0xfb6904c4_u32, 0x42f0_u16, 0x4b62_u16, StaticArray[0x9c_u8, 0x46_u8, 0x98_u8, 0x3a_u8, 0xf7_u8, 0xda_u8, 0x7c_u8, 0x83_u8])
    def query_interface(this : IDxcVersionInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcVersionInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcVersionInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version(this : IDxcVersionInfo2*, pMajor : UInt32*, pMinor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pMajor, pMinor)
    end
    def get_flags(this : IDxcVersionInfo2*, pFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pFlags)
    end
    def get_commit_info(this : IDxcVersionInfo2*, pCommitCount : UInt32*, pCommitHash : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_commit_info.call(this, pCommitCount, pCommitHash)
    end

  end

  @[Extern]
  record IDxcVersionInfo3Vtbl,
    query_interface : Proc(IDxcVersionInfo3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcVersionInfo3*, UInt32),
    release : Proc(IDxcVersionInfo3*, UInt32),
    get_custom_version_string : Proc(IDxcVersionInfo3*, Int8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcVersionInfo3, lpVtbl : IDxcVersionInfo3Vtbl* do
    GUID = LibC::GUID.new(0x5e13e843_u32, 0x9d25_u16, 0x473c_u16, StaticArray[0x9a_u8, 0xd2_u8, 0x3_u8, 0xb2_u8, 0xd0_u8, 0xb4_u8, 0x4b_u8, 0x1e_u8])
    def query_interface(this : IDxcVersionInfo3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcVersionInfo3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcVersionInfo3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_custom_version_string(this : IDxcVersionInfo3*, pVersionString : Int8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_custom_version_string.call(this, pVersionString)
    end

  end

  @[Extern]
  record IDxcPdbUtilsVtbl,
    query_interface : Proc(IDxcPdbUtils*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDxcPdbUtils*, UInt32),
    release : Proc(IDxcPdbUtils*, UInt32),
    load : Proc(IDxcPdbUtils*, Void*, Win32cr::Foundation::HRESULT),
    get_source_count : Proc(IDxcPdbUtils*, UInt32*, Win32cr::Foundation::HRESULT),
    get_source : Proc(IDxcPdbUtils*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_source_name : Proc(IDxcPdbUtils*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_flag_count : Proc(IDxcPdbUtils*, UInt32*, Win32cr::Foundation::HRESULT),
    get_flag : Proc(IDxcPdbUtils*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_arg_count : Proc(IDxcPdbUtils*, UInt32*, Win32cr::Foundation::HRESULT),
    get_arg : Proc(IDxcPdbUtils*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_arg_pair_count : Proc(IDxcPdbUtils*, UInt32*, Win32cr::Foundation::HRESULT),
    get_arg_pair : Proc(IDxcPdbUtils*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_define_count : Proc(IDxcPdbUtils*, UInt32*, Win32cr::Foundation::HRESULT),
    get_define : Proc(IDxcPdbUtils*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_target_profile : Proc(IDxcPdbUtils*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_entry_point : Proc(IDxcPdbUtils*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_main_file_name : Proc(IDxcPdbUtils*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_hash : Proc(IDxcPdbUtils*, Void**, Win32cr::Foundation::HRESULT),
    get_name : Proc(IDxcPdbUtils*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    is_full_pdb : Proc(IDxcPdbUtils*, Win32cr::Foundation::BOOL),
    get_full_pdb : Proc(IDxcPdbUtils*, Void**, Win32cr::Foundation::HRESULT),
    get_version_info : Proc(IDxcPdbUtils*, Void**, Win32cr::Foundation::HRESULT),
    set_compiler : Proc(IDxcPdbUtils*, Void*, Win32cr::Foundation::HRESULT),
    compile_for_full_pdb : Proc(IDxcPdbUtils*, Void**, Win32cr::Foundation::HRESULT),
    override_args : Proc(IDxcPdbUtils*, Win32cr::Graphics::Direct3D::Dxc::DxcArgPair*, UInt32, Win32cr::Foundation::HRESULT),
    override_root_signature : Proc(IDxcPdbUtils*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDxcPdbUtils, lpVtbl : IDxcPdbUtilsVtbl* do
    GUID = LibC::GUID.new(0xe6c9647e_u32, 0x9d6a_u16, 0x4c3b_u16, StaticArray[0xb9_u8, 0x4c_u8, 0x52_u8, 0x4b_u8, 0x5a_u8, 0x6c_u8, 0x34_u8, 0x3d_u8])
    def query_interface(this : IDxcPdbUtils*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDxcPdbUtils*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDxcPdbUtils*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load(this : IDxcPdbUtils*, pPdbOrDxil : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pPdbOrDxil)
    end
    def get_source_count(this : IDxcPdbUtils*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_count.call(this, pCount)
    end
    def get_source(this : IDxcPdbUtils*, uIndex : UInt32, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source.call(this, uIndex, ppResult)
    end
    def get_source_name(this : IDxcPdbUtils*, uIndex : UInt32, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_source_name.call(this, uIndex, pResult)
    end
    def get_flag_count(this : IDxcPdbUtils*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flag_count.call(this, pCount)
    end
    def get_flag(this : IDxcPdbUtils*, uIndex : UInt32, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flag.call(this, uIndex, pResult)
    end
    def get_arg_count(this : IDxcPdbUtils*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_arg_count.call(this, pCount)
    end
    def get_arg(this : IDxcPdbUtils*, uIndex : UInt32, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_arg.call(this, uIndex, pResult)
    end
    def get_arg_pair_count(this : IDxcPdbUtils*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_arg_pair_count.call(this, pCount)
    end
    def get_arg_pair(this : IDxcPdbUtils*, uIndex : UInt32, pName : Win32cr::Foundation::BSTR*, pValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_arg_pair.call(this, uIndex, pName, pValue)
    end
    def get_define_count(this : IDxcPdbUtils*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_define_count.call(this, pCount)
    end
    def get_define(this : IDxcPdbUtils*, uIndex : UInt32, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_define.call(this, uIndex, pResult)
    end
    def get_target_profile(this : IDxcPdbUtils*, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_profile.call(this, pResult)
    end
    def get_entry_point(this : IDxcPdbUtils*, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_entry_point.call(this, pResult)
    end
    def get_main_file_name(this : IDxcPdbUtils*, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_main_file_name.call(this, pResult)
    end
    def get_hash(this : IDxcPdbUtils*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash.call(this, ppResult)
    end
    def get_name(this : IDxcPdbUtils*, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pResult)
    end
    def is_full_pdb(this : IDxcPdbUtils*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_full_pdb.call(this)
    end
    def get_full_pdb(this : IDxcPdbUtils*, ppFullPDB : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_full_pdb.call(this, ppFullPDB)
    end
    def get_version_info(this : IDxcPdbUtils*, ppVersionInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version_info.call(this, ppVersionInfo)
    end
    def set_compiler(this : IDxcPdbUtils*, pCompiler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_compiler.call(this, pCompiler)
    end
    def compile_for_full_pdb(this : IDxcPdbUtils*, ppResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compile_for_full_pdb.call(this, ppResult)
    end
    def override_args(this : IDxcPdbUtils*, pArgPairs : Win32cr::Graphics::Direct3D::Dxc::DxcArgPair*, uNumArgPairs : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.override_args.call(this, pArgPairs, uNumArgPairs)
    end
    def override_root_signature(this : IDxcPdbUtils*, pRootSignature : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.override_root_signature.call(this, pRootSignature)
    end

  end

  @[Link("dxcompiler")]
  lib C
    fun DxcCreateInstance(rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun DxcCreateInstance2(pMalloc : Void*, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

  end
end