require "../../foundation.cr"
require "../../graphics/direct3d.cr"
require "../../graphics/direct3d11.cr"
require "../../graphics/direct3d10.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:d3dcompiler_47.dll")]
{% else %}
@[Link("d3dcompiler_47")]
{% end %}
lib LibWin32
  D3D_COMPILER_VERSION = 47_u32
  D3DCOMPILE_DEBUG = 1_u32
  D3DCOMPILE_SKIP_VALIDATION = 2_u32
  D3DCOMPILE_SKIP_OPTIMIZATION = 4_u32
  D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = 8_u32
  D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = 16_u32
  D3DCOMPILE_PARTIAL_PRECISION = 32_u32
  D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = 64_u32
  D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = 128_u32
  D3DCOMPILE_NO_PRESHADER = 256_u32
  D3DCOMPILE_AVOID_FLOW_CONTROL = 512_u32
  D3DCOMPILE_PREFER_FLOW_CONTROL = 1024_u32
  D3DCOMPILE_ENABLE_STRICTNESS = 2048_u32
  D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = 4096_u32
  D3DCOMPILE_IEEE_STRICTNESS = 8192_u32
  D3DCOMPILE_OPTIMIZATION_LEVEL0 = 16384_u32
  D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0_u32
  D3DCOMPILE_OPTIMIZATION_LEVEL3 = 32768_u32
  D3DCOMPILE_RESERVED16 = 65536_u32
  D3DCOMPILE_RESERVED17 = 131072_u32
  D3DCOMPILE_WARNINGS_ARE_ERRORS = 262144_u32
  D3DCOMPILE_RESOURCES_MAY_ALIAS = 524288_u32
  D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = 1048576_u32
  D3DCOMPILE_ALL_RESOURCES_BOUND = 2097152_u32
  D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = 4194304_u32
  D3DCOMPILE_DEBUG_NAME_FOR_BINARY = 8388608_u32
  D3DCOMPILE_EFFECT_CHILD_EFFECT = 1_u32
  D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = 2_u32
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0_u32
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = 16_u32
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = 32_u32
  D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS = 1_u32
  D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS = 2_u32
  D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH = 4_u32
  D3D_DISASM_ENABLE_COLOR_CODE = 1_u32
  D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = 2_u32
  D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 4_u32
  D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = 8_u32
  D3D_DISASM_DISABLE_DEBUG_INFO = 16_u32
  D3D_DISASM_ENABLE_INSTRUCTION_OFFSET = 32_u32
  D3D_DISASM_INSTRUCTION_ONLY = 64_u32
  D3D_DISASM_PRINT_HEX_LITERALS = 128_u32
  D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 1_u32
  D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = 1_u32

  alias Pd3dcompile = Proc(Void*, LibC::UINT_PTR, PSTR, D3D_SHADER_MACRO*, ID3DInclude, PSTR, PSTR, UInt32, UInt32, ID3DBlob*, ID3DBlob*, HRESULT)
  alias Pd3dpreprocess = Proc(Void*, LibC::UINT_PTR, PSTR, D3D_SHADER_MACRO*, ID3DInclude, ID3DBlob*, ID3DBlob*, HRESULT)
  alias Pd3ddisassemble = Proc(Void*, LibC::UINT_PTR, UInt32, PSTR, ID3DBlob*, HRESULT)


  enum D3DCOMPILER_STRIP_FLAGS : Int32
    D3DCOMPILER_STRIP_REFLECTION_DATA = 1
    D3DCOMPILER_STRIP_DEBUG_INFO = 2
    D3DCOMPILER_STRIP_TEST_BLOBS = 4
    D3DCOMPILER_STRIP_PRIVATE_DATA = 8
    D3DCOMPILER_STRIP_ROOT_SIGNATURE = 16
    D3DCOMPILER_STRIP_FORCE_DWORD = 2147483647
  end

  enum D3D_BLOB_PART : Int32
    D3D_BLOB_INPUT_SIGNATURE_BLOB = 0
    D3D_BLOB_OUTPUT_SIGNATURE_BLOB = 1
    D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB = 2
    D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB = 3
    D3D_BLOB_ALL_SIGNATURE_BLOB = 4
    D3D_BLOB_DEBUG_INFO = 5
    D3D_BLOB_LEGACY_SHADER = 6
    D3D_BLOB_XNA_PREPASS_SHADER = 7
    D3D_BLOB_XNA_SHADER = 8
    D3D_BLOB_PDB = 9
    D3D_BLOB_PRIVATE_DATA = 10
    D3D_BLOB_ROOT_SIGNATURE = 11
    D3D_BLOB_DEBUG_NAME = 12
    D3D_BLOB_TEST_ALTERNATE_SHADER = 32768
    D3D_BLOB_TEST_COMPILE_DETAILS = 32769
    D3D_BLOB_TEST_COMPILE_PERF = 32770
    D3D_BLOB_TEST_COMPILE_REPORT = 32771
  end

  struct D3D_SHADER_DATA
    p_bytecode : Void*
    bytecode_length : LibC::UINT_PTR
  end


  # Params # pfilename : LibC::LPWSTR [In],ppcontents : ID3DBlob* [In]
  fun D3DReadFileToBlob(pfilename : LibC::LPWSTR, ppcontents : ID3DBlob*) : HRESULT

  # Params # pblob : ID3DBlob [In],pfilename : LibC::LPWSTR [In],boverwrite : LibC::BOOL [In]
  fun D3DWriteBlobToFile(pblob : ID3DBlob, pfilename : LibC::LPWSTR, boverwrite : LibC::BOOL) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],psourcename : PSTR [In],pdefines : D3D_SHADER_MACRO* [In],pinclude : ID3DInclude [In],pentrypoint : PSTR [In],ptarget : PSTR [In],flags1 : UInt32 [In],flags2 : UInt32 [In],ppcode : ID3DBlob* [In],pperrormsgs : ID3DBlob* [In]
  fun D3DCompile(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, psourcename : PSTR, pdefines : D3D_SHADER_MACRO*, pinclude : ID3DInclude, pentrypoint : PSTR, ptarget : PSTR, flags1 : UInt32, flags2 : UInt32, ppcode : ID3DBlob*, pperrormsgs : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],psourcename : PSTR [In],pdefines : D3D_SHADER_MACRO* [In],pinclude : ID3DInclude [In],pentrypoint : PSTR [In],ptarget : PSTR [In],flags1 : UInt32 [In],flags2 : UInt32 [In],secondarydataflags : UInt32 [In],psecondarydata : Void* [In],secondarydatasize : LibC::UINT_PTR [In],ppcode : ID3DBlob* [In],pperrormsgs : ID3DBlob* [In]
  fun D3DCompile2(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, psourcename : PSTR, pdefines : D3D_SHADER_MACRO*, pinclude : ID3DInclude, pentrypoint : PSTR, ptarget : PSTR, flags1 : UInt32, flags2 : UInt32, secondarydataflags : UInt32, psecondarydata : Void*, secondarydatasize : LibC::UINT_PTR, ppcode : ID3DBlob*, pperrormsgs : ID3DBlob*) : HRESULT

  # Params # pfilename : LibC::LPWSTR [In],pdefines : D3D_SHADER_MACRO* [In],pinclude : ID3DInclude [In],pentrypoint : PSTR [In],ptarget : PSTR [In],flags1 : UInt32 [In],flags2 : UInt32 [In],ppcode : ID3DBlob* [In],pperrormsgs : ID3DBlob* [In]
  fun D3DCompileFromFile(pfilename : LibC::LPWSTR, pdefines : D3D_SHADER_MACRO*, pinclude : ID3DInclude, pentrypoint : PSTR, ptarget : PSTR, flags1 : UInt32, flags2 : UInt32, ppcode : ID3DBlob*, pperrormsgs : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],psourcename : PSTR [In],pdefines : D3D_SHADER_MACRO* [In],pinclude : ID3DInclude [In],ppcodetext : ID3DBlob* [In],pperrormsgs : ID3DBlob* [In]
  fun D3DPreprocess(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, psourcename : PSTR, pdefines : D3D_SHADER_MACRO*, pinclude : ID3DInclude, ppcodetext : ID3DBlob*, pperrormsgs : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],ppdebuginfo : ID3DBlob* [In]
  fun D3DGetDebugInfo(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, ppdebuginfo : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],pinterface : Guid* [In],ppreflector : Void** [In]
  fun D3DReflect(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, pinterface : Guid*, ppreflector : Void**) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],riid : Guid* [In],ppreflector : Void** [In]
  fun D3DReflectLibrary(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, riid : Guid*, ppreflector : Void**) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],flags : UInt32 [In],szcomments : PSTR [In],ppdisassembly : ID3DBlob* [In]
  fun D3DDisassemble(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, flags : UInt32, szcomments : PSTR, ppdisassembly : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],flags : UInt32 [In],szcomments : PSTR [In],startbyteoffset : LibC::UINT_PTR [In],numinsts : LibC::UINT_PTR [In],pfinishbyteoffset : LibC::UINT_PTR* [In],ppdisassembly : ID3DBlob* [In]
  fun D3DDisassembleRegion(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, flags : UInt32, szcomments : PSTR, startbyteoffset : LibC::UINT_PTR, numinsts : LibC::UINT_PTR, pfinishbyteoffset : LibC::UINT_PTR*, ppdisassembly : ID3DBlob*) : HRESULT

  # Params # pplinker : ID3D11Linker* [In]
  fun D3DCreateLinker(pplinker : ID3D11Linker*) : HRESULT

  # Params # psrcdata : Void* [In],cbsrcdatasize : LibC::UINT_PTR [In],ppmodule : ID3D11Module* [In]
  fun D3DLoadModule(psrcdata : Void*, cbsrcdatasize : LibC::UINT_PTR, ppmodule : ID3D11Module*) : HRESULT

  # Params # uflags : UInt32 [In],ppfunctionlinkinggraph : ID3D11FunctionLinkingGraph* [In]
  fun D3DCreateFunctionLinkingGraph(uflags : UInt32, ppfunctionlinkinggraph : ID3D11FunctionLinkingGraph*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],flags : UInt32 [In],startinstindex : LibC::UINT_PTR [In],numinsts : LibC::UINT_PTR [In],poffsets : LibC::UINT_PTR* [In],ptotalinsts : LibC::UINT_PTR* [In]
  fun D3DGetTraceInstructionOffsets(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, flags : UInt32, startinstindex : LibC::UINT_PTR, numinsts : LibC::UINT_PTR, poffsets : LibC::UINT_PTR*, ptotalinsts : LibC::UINT_PTR*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],ppsignatureblob : ID3DBlob* [In]
  fun D3DGetInputSignatureBlob(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, ppsignatureblob : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],ppsignatureblob : ID3DBlob* [In]
  fun D3DGetOutputSignatureBlob(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, ppsignatureblob : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],ppsignatureblob : ID3DBlob* [In]
  fun D3DGetInputAndOutputSignatureBlob(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, ppsignatureblob : ID3DBlob*) : HRESULT

  # Params # pshaderbytecode : Void* [In],bytecodelength : LibC::UINT_PTR [In],ustripflags : UInt32 [In],ppstrippedblob : ID3DBlob* [In]
  fun D3DStripShader(pshaderbytecode : Void*, bytecodelength : LibC::UINT_PTR, ustripflags : UInt32, ppstrippedblob : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],part : D3D_BLOB_PART [In],flags : UInt32 [In],pppart : ID3DBlob* [In]
  fun D3DGetBlobPart(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, part : D3D_BLOB_PART, flags : UInt32, pppart : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],part : D3D_BLOB_PART [In],flags : UInt32 [In],ppart : Void* [In],partsize : LibC::UINT_PTR [In],ppnewshader : ID3DBlob* [In]
  fun D3DSetBlobPart(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, part : D3D_BLOB_PART, flags : UInt32, ppart : Void*, partsize : LibC::UINT_PTR, ppnewshader : ID3DBlob*) : HRESULT

  # Params # size : LibC::UINT_PTR [In],ppblob : ID3DBlob* [In]
  fun D3DCreateBlob(size : LibC::UINT_PTR, ppblob : ID3DBlob*) : HRESULT

  # Params # unumshaders : UInt32 [In],pshaderdata : D3D_SHADER_DATA* [In],uflags : UInt32 [In],ppcompresseddata : ID3DBlob* [In]
  fun D3DCompressShaders(unumshaders : UInt32, pshaderdata : D3D_SHADER_DATA*, uflags : UInt32, ppcompresseddata : ID3DBlob*) : HRESULT

  # Params # psrcdata : Void* [In],srcdatasize : LibC::UINT_PTR [In],unumshaders : UInt32 [In],ustartindex : UInt32 [In],pindices : UInt32* [In],uflags : UInt32 [In],ppshaders : ID3DBlob* [In],ptotalshaders : UInt32* [In]
  fun D3DDecompressShaders(psrcdata : Void*, srcdatasize : LibC::UINT_PTR, unumshaders : UInt32, ustartindex : UInt32, pindices : UInt32*, uflags : UInt32, ppshaders : ID3DBlob*, ptotalshaders : UInt32*) : HRESULT

  # Params # peffect : ID3D10Effect [In],flags : UInt32 [In],ppdisassembly : ID3DBlob* [In]
  fun D3DDisassemble10Effect(peffect : ID3D10Effect, flags : UInt32, ppdisassembly : ID3DBlob*) : HRESULT
end
