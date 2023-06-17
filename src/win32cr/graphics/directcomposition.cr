require "../foundation.cr"
require "../graphics/dxgi/common.cr"
require "../system/com.cr"
require "../graphics/direct2d/common.cr"
require "../graphics/direct3d.cr"
require "../graphics.cr"
require "../graphics/dxgi.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dcomp.dll")]
{% else %}
@[Link("dcomp")]
{% end %}
lib LibWin32
  COMPOSITIONOBJECT_READ = 1_i32
  COMPOSITIONOBJECT_WRITE = 2_i32
  DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS = 32_u32
  COMPOSITION_STATS_MAX_TARGETS = 256_u32


  enum DCOMPOSITION_BITMAP_INTERPOLATION_MODE : Int32
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR = 1
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_BORDER_MODE : Int32
    DCOMPOSITION_BORDER_MODE_SOFT = 0
    DCOMPOSITION_BORDER_MODE_HARD = 1
    DCOMPOSITION_BORDER_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_COMPOSITE_MODE : Int32
    DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER = 0
    DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT = 1
    DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND = 2
    DCOMPOSITION_COMPOSITE_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_BACKFACE_VISIBILITY : Int32
    DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE = 0
    DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN = 1
    DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT = -1
  end

  enum DCOMPOSITION_OPACITY_MODE : Int32
    DCOMPOSITION_OPACITY_MODE_LAYER = 0
    DCOMPOSITION_OPACITY_MODE_MULTIPLY = 1
    DCOMPOSITION_OPACITY_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_DEPTH_MODE : Int32
    DCOMPOSITION_DEPTH_MODE_TREE = 0
    DCOMPOSITION_DEPTH_MODE_SPATIAL = 1
    DCOMPOSITION_DEPTH_MODE_SORTED = 3
    DCOMPOSITION_DEPTH_MODE_INHERIT = -1
  end

  enum COMPOSITION_FRAME_ID_TYPE : Int32
    COMPOSITION_FRAME_ID_CREATED = 0
    COMPOSITION_FRAME_ID_CONFIRMED = 1
    COMPOSITION_FRAME_ID_COMPLETED = 2
  end

  struct DCOMPOSITION_FRAME_STATISTICS
    last_frame_time : LARGE_INTEGER
    current_composition_rate : DXGI_RATIONAL
    current_time : LARGE_INTEGER
    time_frequency : LARGE_INTEGER
    next_estimated_frame_time : LARGE_INTEGER
  end
  struct COMPOSITION_FRAME_STATS
    start_time : UInt64
    target_time : UInt64
    frame_period : UInt64
  end
  struct COMPOSITION_TARGET_ID
    display_adapter_luid : LUID
    render_adapter_luid : LUID
    vid_pn_source_id : UInt32
    vid_pn_target_id : UInt32
    unique_id : UInt32
  end
  struct COMPOSITION_STATS
    present_count : UInt32
    refresh_count : UInt32
    virtual_refresh_count : UInt32
    time : UInt64
  end
  struct COMPOSITION_TARGET_STATS
    outstanding_presents : UInt32
    present_time : UInt64
    vblank_duration : UInt64
    presented_stats : COMPOSITION_STATS
    completed_stats : COMPOSITION_STATS
  end
  struct DCompositionInkTrailPoint
    x : Float32
    y : Float32
    radius : Float32
  end


  struct IDCompositionAnimationVTbl
    query_interface : Proc(IDCompositionAnimation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionAnimation*, UInt32)
    release : Proc(IDCompositionAnimation*, UInt32)
    reset : Proc(IDCompositionAnimation*, HRESULT)
    set_absolute_begin_time : Proc(IDCompositionAnimation*, LARGE_INTEGER, HRESULT)
    add_cubic : Proc(IDCompositionAnimation*, Float64, Float32, Float32, Float32, Float32, HRESULT)
    add_sinusoidal : Proc(IDCompositionAnimation*, Float64, Float32, Float32, Float32, Float32, HRESULT)
    add_repeat : Proc(IDCompositionAnimation*, Float64, Float64, HRESULT)
    rend : Proc(IDCompositionAnimation*, Float64, Float32, HRESULT)
  end

  IDCompositionAnimation_GUID = "cbfd91d9-51b2-45e4-b3de-d19ccfb863c5"
  IID_IDCompositionAnimation = LibC::GUID.new(0xcbfd91d9_u32, 0x51b2_u16, 0x45e4_u16, StaticArray[0xb3_u8, 0xde_u8, 0xd1_u8, 0x9c_u8, 0xcf_u8, 0xb8_u8, 0x63_u8, 0xc5_u8])
  struct IDCompositionAnimation
    lpVtbl : IDCompositionAnimationVTbl*
  end

  struct IDCompositionDeviceVTbl
    query_interface : Proc(IDCompositionDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDevice*, UInt32)
    release : Proc(IDCompositionDevice*, UInt32)
    commit : Proc(IDCompositionDevice*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDevice*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDevice*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_target_for_hwnd : Proc(IDCompositionDevice*, LibC::HANDLE, LibC::BOOL, IDCompositionTarget*, HRESULT)
    create_visual : Proc(IDCompositionDevice*, IDCompositionVisual*, HRESULT)
    create_surface : Proc(IDCompositionDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_surface_from_handle : Proc(IDCompositionDevice*, LibC::HANDLE, IUnknown*, HRESULT)
    create_surface_from_hwnd : Proc(IDCompositionDevice*, LibC::HANDLE, IUnknown*, HRESULT)
    create_translate_transform : Proc(IDCompositionDevice*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDevice*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDevice*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDevice*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDevice*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDevice*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDevice*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDevice*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDevice*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDevice*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDevice*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDevice*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDevice*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDevice*, IDCompositionAnimation*, HRESULT)
    check_device_state : Proc(IDCompositionDevice*, LibC::BOOL*, HRESULT)
  end

  IDCompositionDevice_GUID = "c37ea93a-e7aa-450d-b16f-9746cb0407f3"
  IID_IDCompositionDevice = LibC::GUID.new(0xc37ea93a_u32, 0xe7aa_u16, 0x450d_u16, StaticArray[0xb1_u8, 0x6f_u8, 0x97_u8, 0x46_u8, 0xcb_u8, 0x4_u8, 0x7_u8, 0xf3_u8])
  struct IDCompositionDevice
    lpVtbl : IDCompositionDeviceVTbl*
  end

  struct IDCompositionTargetVTbl
    query_interface : Proc(IDCompositionTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTarget*, UInt32)
    release : Proc(IDCompositionTarget*, UInt32)
    set_root : Proc(IDCompositionTarget*, IDCompositionVisual, HRESULT)
  end

  IDCompositionTarget_GUID = "eacdd04c-117e-4e17-88f4-d1b12b0e3d89"
  IID_IDCompositionTarget = LibC::GUID.new(0xeacdd04c_u32, 0x117e_u16, 0x4e17_u16, StaticArray[0x88_u8, 0xf4_u8, 0xd1_u8, 0xb1_u8, 0x2b_u8, 0xe_u8, 0x3d_u8, 0x89_u8])
  struct IDCompositionTarget
    lpVtbl : IDCompositionTargetVTbl*
  end

  struct IDCompositionVisualVTbl
    query_interface : Proc(IDCompositionVisual*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisual*, UInt32)
    release : Proc(IDCompositionVisual*, UInt32)
    set_offset_x : Proc(IDCompositionVisual*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisual*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisual*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisual*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisual*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisual*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisual*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisual*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisual*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisual*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisual*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisual*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisual*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisual*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisual*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisual*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
  end

  IDCompositionVisual_GUID = "4d93059d-097b-4651-9a60-f0f25116e2f3"
  IID_IDCompositionVisual = LibC::GUID.new(0x4d93059d_u32, 0x97b_u16, 0x4651_u16, StaticArray[0x9a_u8, 0x60_u8, 0xf0_u8, 0xf2_u8, 0x51_u8, 0x16_u8, 0xe2_u8, 0xf3_u8])
  struct IDCompositionVisual
    lpVtbl : IDCompositionVisualVTbl*
  end

  struct IDCompositionEffectVTbl
    query_interface : Proc(IDCompositionEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionEffect*, UInt32)
    release : Proc(IDCompositionEffect*, UInt32)
  end

  IDCompositionEffect_GUID = "ec81b08f-bfcb-4e8d-b193-a915587999e8"
  IID_IDCompositionEffect = LibC::GUID.new(0xec81b08f_u32, 0xbfcb_u16, 0x4e8d_u16, StaticArray[0xb1_u8, 0x93_u8, 0xa9_u8, 0x15_u8, 0x58_u8, 0x79_u8, 0x99_u8, 0xe8_u8])
  struct IDCompositionEffect
    lpVtbl : IDCompositionEffectVTbl*
  end

  struct IDCompositionTransform3DVTbl
    query_interface : Proc(IDCompositionTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTransform3D*, UInt32)
    release : Proc(IDCompositionTransform3D*, UInt32)
  end

  IDCompositionTransform3D_GUID = "71185722-246b-41f2-aad1-0443f7f4bfc2"
  IID_IDCompositionTransform3D = LibC::GUID.new(0x71185722_u32, 0x246b_u16, 0x41f2_u16, StaticArray[0xaa_u8, 0xd1_u8, 0x4_u8, 0x43_u8, 0xf7_u8, 0xf4_u8, 0xbf_u8, 0xc2_u8])
  struct IDCompositionTransform3D
    lpVtbl : IDCompositionTransform3DVTbl*
  end

  struct IDCompositionTransformVTbl
    query_interface : Proc(IDCompositionTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTransform*, UInt32)
    release : Proc(IDCompositionTransform*, UInt32)
  end

  IDCompositionTransform_GUID = "fd55faa7-37e0-4c20-95d2-9be45bc33f55"
  IID_IDCompositionTransform = LibC::GUID.new(0xfd55faa7_u32, 0x37e0_u16, 0x4c20_u16, StaticArray[0x95_u8, 0xd2_u8, 0x9b_u8, 0xe4_u8, 0x5b_u8, 0xc3_u8, 0x3f_u8, 0x55_u8])
  struct IDCompositionTransform
    lpVtbl : IDCompositionTransformVTbl*
  end

  struct IDCompositionTranslateTransformVTbl
    query_interface : Proc(IDCompositionTranslateTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTranslateTransform*, UInt32)
    release : Proc(IDCompositionTranslateTransform*, UInt32)
    set_offset_x : Proc(IDCompositionTranslateTransform*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionTranslateTransform*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionTranslateTransform*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionTranslateTransform*, Float32, HRESULT)
  end

  IDCompositionTranslateTransform_GUID = "06791122-c6f0-417d-8323-269e987f5954"
  IID_IDCompositionTranslateTransform = LibC::GUID.new(0x6791122_u32, 0xc6f0_u16, 0x417d_u16, StaticArray[0x83_u8, 0x23_u8, 0x26_u8, 0x9e_u8, 0x98_u8, 0x7f_u8, 0x59_u8, 0x54_u8])
  struct IDCompositionTranslateTransform
    lpVtbl : IDCompositionTranslateTransformVTbl*
  end

  struct IDCompositionScaleTransformVTbl
    query_interface : Proc(IDCompositionScaleTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionScaleTransform*, UInt32)
    release : Proc(IDCompositionScaleTransform*, UInt32)
    set_scale_x : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_scale_x2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
    set_scale_y : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_scale_y2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
  end

  IDCompositionScaleTransform_GUID = "71fde914-40ef-45ef-bd51-68b037c339f9"
  IID_IDCompositionScaleTransform = LibC::GUID.new(0x71fde914_u32, 0x40ef_u16, 0x45ef_u16, StaticArray[0xbd_u8, 0x51_u8, 0x68_u8, 0xb0_u8, 0x37_u8, 0xc3_u8, 0x39_u8, 0xf9_u8])
  struct IDCompositionScaleTransform
    lpVtbl : IDCompositionScaleTransformVTbl*
  end

  struct IDCompositionRotateTransformVTbl
    query_interface : Proc(IDCompositionRotateTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionRotateTransform*, UInt32)
    release : Proc(IDCompositionRotateTransform*, UInt32)
    set_angle : Proc(IDCompositionRotateTransform*, IDCompositionAnimation, HRESULT)
    set_angle2 : Proc(IDCompositionRotateTransform*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionRotateTransform*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionRotateTransform*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionRotateTransform*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionRotateTransform*, Float32, HRESULT)
  end

  IDCompositionRotateTransform_GUID = "641ed83c-ae96-46c5-90dc-32774cc5c6d5"
  IID_IDCompositionRotateTransform = LibC::GUID.new(0x641ed83c_u32, 0xae96_u16, 0x46c5_u16, StaticArray[0x90_u8, 0xdc_u8, 0x32_u8, 0x77_u8, 0x4c_u8, 0xc5_u8, 0xc6_u8, 0xd5_u8])
  struct IDCompositionRotateTransform
    lpVtbl : IDCompositionRotateTransformVTbl*
  end

  struct IDCompositionSkewTransformVTbl
    query_interface : Proc(IDCompositionSkewTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSkewTransform*, UInt32)
    release : Proc(IDCompositionSkewTransform*, UInt32)
    set_angle_x : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_angle_x2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
    set_angle_y : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_angle_y2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
  end

  IDCompositionSkewTransform_GUID = "e57aa735-dcdb-4c72-9c61-0591f58889ee"
  IID_IDCompositionSkewTransform = LibC::GUID.new(0xe57aa735_u32, 0xdcdb_u16, 0x4c72_u16, StaticArray[0x9c_u8, 0x61_u8, 0x5_u8, 0x91_u8, 0xf5_u8, 0x88_u8, 0x89_u8, 0xee_u8])
  struct IDCompositionSkewTransform
    lpVtbl : IDCompositionSkewTransformVTbl*
  end

  struct IDCompositionMatrixTransformVTbl
    query_interface : Proc(IDCompositionMatrixTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionMatrixTransform*, UInt32)
    release : Proc(IDCompositionMatrixTransform*, UInt32)
    set_matrix : Proc(IDCompositionMatrixTransform*, D2D_MATRIX_3X2_F*, HRESULT)
    set_matrix_element : Proc(IDCompositionMatrixTransform*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_matrix_element2 : Proc(IDCompositionMatrixTransform*, Int32, Int32, Float32, HRESULT)
  end

  IDCompositionMatrixTransform_GUID = "16cdff07-c503-419c-83f2-0965c7af1fa6"
  IID_IDCompositionMatrixTransform = LibC::GUID.new(0x16cdff07_u32, 0xc503_u16, 0x419c_u16, StaticArray[0x83_u8, 0xf2_u8, 0x9_u8, 0x65_u8, 0xc7_u8, 0xaf_u8, 0x1f_u8, 0xa6_u8])
  struct IDCompositionMatrixTransform
    lpVtbl : IDCompositionMatrixTransformVTbl*
  end

  struct IDCompositionEffectGroupVTbl
    query_interface : Proc(IDCompositionEffectGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionEffectGroup*, UInt32)
    release : Proc(IDCompositionEffectGroup*, UInt32)
    set_opacity : Proc(IDCompositionEffectGroup*, IDCompositionAnimation, HRESULT)
    set_opacity2 : Proc(IDCompositionEffectGroup*, Float32, HRESULT)
    set_transform3_d : Proc(IDCompositionEffectGroup*, IDCompositionTransform3D, HRESULT)
  end

  IDCompositionEffectGroup_GUID = "a7929a74-e6b2-4bd6-8b95-4040119ca34d"
  IID_IDCompositionEffectGroup = LibC::GUID.new(0xa7929a74_u32, 0xe6b2_u16, 0x4bd6_u16, StaticArray[0x8b_u8, 0x95_u8, 0x40_u8, 0x40_u8, 0x11_u8, 0x9c_u8, 0xa3_u8, 0x4d_u8])
  struct IDCompositionEffectGroup
    lpVtbl : IDCompositionEffectGroupVTbl*
  end

  struct IDCompositionTranslateTransform3DVTbl
    query_interface : Proc(IDCompositionTranslateTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTranslateTransform3D*, UInt32)
    release : Proc(IDCompositionTranslateTransform3D*, UInt32)
    set_offset_x : Proc(IDCompositionTranslateTransform3D*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionTranslateTransform3D*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionTranslateTransform3D*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionTranslateTransform3D*, Float32, HRESULT)
    set_offset_z : Proc(IDCompositionTranslateTransform3D*, IDCompositionAnimation, HRESULT)
    set_offset_z2 : Proc(IDCompositionTranslateTransform3D*, Float32, HRESULT)
  end

  IDCompositionTranslateTransform3D_GUID = "91636d4b-9ba1-4532-aaf7-e3344994d788"
  IID_IDCompositionTranslateTransform3D = LibC::GUID.new(0x91636d4b_u32, 0x9ba1_u16, 0x4532_u16, StaticArray[0xaa_u8, 0xf7_u8, 0xe3_u8, 0x34_u8, 0x49_u8, 0x94_u8, 0xd7_u8, 0x88_u8])
  struct IDCompositionTranslateTransform3D
    lpVtbl : IDCompositionTranslateTransform3DVTbl*
  end

  struct IDCompositionScaleTransform3DVTbl
    query_interface : Proc(IDCompositionScaleTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionScaleTransform3D*, UInt32)
    release : Proc(IDCompositionScaleTransform3D*, UInt32)
    set_scale_x : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_scale_x2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_scale_y : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_scale_y2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_scale_z : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_scale_z2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_center_z : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_z2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
  end

  IDCompositionScaleTransform3D_GUID = "2a9e9ead-364b-4b15-a7c4-a1997f78b389"
  IID_IDCompositionScaleTransform3D = LibC::GUID.new(0x2a9e9ead_u32, 0x364b_u16, 0x4b15_u16, StaticArray[0xa7_u8, 0xc4_u8, 0xa1_u8, 0x99_u8, 0x7f_u8, 0x78_u8, 0xb3_u8, 0x89_u8])
  struct IDCompositionScaleTransform3D
    lpVtbl : IDCompositionScaleTransform3DVTbl*
  end

  struct IDCompositionRotateTransform3DVTbl
    query_interface : Proc(IDCompositionRotateTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionRotateTransform3D*, UInt32)
    release : Proc(IDCompositionRotateTransform3D*, UInt32)
    set_angle : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_angle2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_axis_x : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_axis_x2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_axis_y : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_axis_y2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_axis_z : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_axis_z2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_center_z : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_z2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
  end

  IDCompositionRotateTransform3D_GUID = "d8f5b23f-d429-4a91-b55a-d2f45fd75b18"
  IID_IDCompositionRotateTransform3D = LibC::GUID.new(0xd8f5b23f_u32, 0xd429_u16, 0x4a91_u16, StaticArray[0xb5_u8, 0x5a_u8, 0xd2_u8, 0xf4_u8, 0x5f_u8, 0xd7_u8, 0x5b_u8, 0x18_u8])
  struct IDCompositionRotateTransform3D
    lpVtbl : IDCompositionRotateTransform3DVTbl*
  end

  struct IDCompositionMatrixTransform3DVTbl
    query_interface : Proc(IDCompositionMatrixTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionMatrixTransform3D*, UInt32)
    release : Proc(IDCompositionMatrixTransform3D*, UInt32)
    set_matrix : Proc(IDCompositionMatrixTransform3D*, D3DMATRIX*, HRESULT)
    set_matrix_element : Proc(IDCompositionMatrixTransform3D*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_matrix_element2 : Proc(IDCompositionMatrixTransform3D*, Int32, Int32, Float32, HRESULT)
  end

  IDCompositionMatrixTransform3D_GUID = "4b3363f0-643b-41b7-b6e0-ccf22d34467c"
  IID_IDCompositionMatrixTransform3D = LibC::GUID.new(0x4b3363f0_u32, 0x643b_u16, 0x41b7_u16, StaticArray[0xb6_u8, 0xe0_u8, 0xcc_u8, 0xf2_u8, 0x2d_u8, 0x34_u8, 0x46_u8, 0x7c_u8])
  struct IDCompositionMatrixTransform3D
    lpVtbl : IDCompositionMatrixTransform3DVTbl*
  end

  struct IDCompositionClipVTbl
    query_interface : Proc(IDCompositionClip*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionClip*, UInt32)
    release : Proc(IDCompositionClip*, UInt32)
  end

  IDCompositionClip_GUID = "64ac3703-9d3f-45ec-a109-7cac0e7a13a7"
  IID_IDCompositionClip = LibC::GUID.new(0x64ac3703_u32, 0x9d3f_u16, 0x45ec_u16, StaticArray[0xa1_u8, 0x9_u8, 0x7c_u8, 0xac_u8, 0xe_u8, 0x7a_u8, 0x13_u8, 0xa7_u8])
  struct IDCompositionClip
    lpVtbl : IDCompositionClipVTbl*
  end

  struct IDCompositionRectangleClipVTbl
    query_interface : Proc(IDCompositionRectangleClip*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionRectangleClip*, UInt32)
    release : Proc(IDCompositionRectangleClip*, UInt32)
    set_left : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_left2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_right : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_right2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_left_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_left_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_left_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_left_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_right_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_right_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_right_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_right_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_left_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_left_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_left_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_left_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_right_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_right_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_right_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_right_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
  end

  IDCompositionRectangleClip_GUID = "9842ad7d-d9cf-4908-aed7-48b51da5e7c2"
  IID_IDCompositionRectangleClip = LibC::GUID.new(0x9842ad7d_u32, 0xd9cf_u16, 0x4908_u16, StaticArray[0xae_u8, 0xd7_u8, 0x48_u8, 0xb5_u8, 0x1d_u8, 0xa5_u8, 0xe7_u8, 0xc2_u8])
  struct IDCompositionRectangleClip
    lpVtbl : IDCompositionRectangleClipVTbl*
  end

  struct IDCompositionSurfaceVTbl
    query_interface : Proc(IDCompositionSurface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSurface*, UInt32)
    release : Proc(IDCompositionSurface*, UInt32)
    begin_draw : Proc(IDCompositionSurface*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(IDCompositionSurface*, HRESULT)
    suspend_draw : Proc(IDCompositionSurface*, HRESULT)
    resume_draw : Proc(IDCompositionSurface*, HRESULT)
    scroll : Proc(IDCompositionSurface*, RECT*, RECT*, Int32, Int32, HRESULT)
  end

  IDCompositionSurface_GUID = "bb8a4953-2c99-4f5a-96f5-4819027fa3ac"
  IID_IDCompositionSurface = LibC::GUID.new(0xbb8a4953_u32, 0x2c99_u16, 0x4f5a_u16, StaticArray[0x96_u8, 0xf5_u8, 0x48_u8, 0x19_u8, 0x2_u8, 0x7f_u8, 0xa3_u8, 0xac_u8])
  struct IDCompositionSurface
    lpVtbl : IDCompositionSurfaceVTbl*
  end

  struct IDCompositionVirtualSurfaceVTbl
    query_interface : Proc(IDCompositionVirtualSurface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVirtualSurface*, UInt32)
    release : Proc(IDCompositionVirtualSurface*, UInt32)
    begin_draw : Proc(IDCompositionVirtualSurface*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(IDCompositionVirtualSurface*, HRESULT)
    suspend_draw : Proc(IDCompositionVirtualSurface*, HRESULT)
    resume_draw : Proc(IDCompositionVirtualSurface*, HRESULT)
    scroll : Proc(IDCompositionVirtualSurface*, RECT*, RECT*, Int32, Int32, HRESULT)
    resize : Proc(IDCompositionVirtualSurface*, UInt32, UInt32, HRESULT)
    trim : Proc(IDCompositionVirtualSurface*, RECT*, UInt32, HRESULT)
  end

  IDCompositionVirtualSurface_GUID = "ae471c51-5f53-4a24-8d3e-d0c39c30b3f0"
  IID_IDCompositionVirtualSurface = LibC::GUID.new(0xae471c51_u32, 0x5f53_u16, 0x4a24_u16, StaticArray[0x8d_u8, 0x3e_u8, 0xd0_u8, 0xc3_u8, 0x9c_u8, 0x30_u8, 0xb3_u8, 0xf0_u8])
  struct IDCompositionVirtualSurface
    lpVtbl : IDCompositionVirtualSurfaceVTbl*
  end

  struct IDCompositionDevice2VTbl
    query_interface : Proc(IDCompositionDevice2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDevice2*, UInt32)
    release : Proc(IDCompositionDevice2*, UInt32)
    commit : Proc(IDCompositionDevice2*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDevice2*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDevice2*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_visual : Proc(IDCompositionDevice2*, IDCompositionVisual2*, HRESULT)
    create_surface_factory : Proc(IDCompositionDevice2*, IUnknown, IDCompositionSurfaceFactory*, HRESULT)
    create_surface : Proc(IDCompositionDevice2*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDevice2*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_translate_transform : Proc(IDCompositionDevice2*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDevice2*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDevice2*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDevice2*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDevice2*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDevice2*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDevice2*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDevice2*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDevice2*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDevice2*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDevice2*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDevice2*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDevice2*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDevice2*, IDCompositionAnimation*, HRESULT)
  end

  IDCompositionDevice2_GUID = "75f6468d-1b8e-447c-9bc6-75fea80b5b25"
  IID_IDCompositionDevice2 = LibC::GUID.new(0x75f6468d_u32, 0x1b8e_u16, 0x447c_u16, StaticArray[0x9b_u8, 0xc6_u8, 0x75_u8, 0xfe_u8, 0xa8_u8, 0xb_u8, 0x5b_u8, 0x25_u8])
  struct IDCompositionDevice2
    lpVtbl : IDCompositionDevice2VTbl*
  end

  struct IDCompositionDesktopDeviceVTbl
    query_interface : Proc(IDCompositionDesktopDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDesktopDevice*, UInt32)
    release : Proc(IDCompositionDesktopDevice*, UInt32)
    commit : Proc(IDCompositionDesktopDevice*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDesktopDevice*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDesktopDevice*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_visual : Proc(IDCompositionDesktopDevice*, IDCompositionVisual2*, HRESULT)
    create_surface_factory : Proc(IDCompositionDesktopDevice*, IUnknown, IDCompositionSurfaceFactory*, HRESULT)
    create_surface : Proc(IDCompositionDesktopDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDesktopDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_translate_transform : Proc(IDCompositionDesktopDevice*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDesktopDevice*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDesktopDevice*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDesktopDevice*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDesktopDevice*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDesktopDevice*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDesktopDevice*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDesktopDevice*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDesktopDevice*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDesktopDevice*, IDCompositionAnimation*, HRESULT)
    create_target_for_hwnd : Proc(IDCompositionDesktopDevice*, LibC::HANDLE, LibC::BOOL, IDCompositionTarget*, HRESULT)
    create_surface_from_handle : Proc(IDCompositionDesktopDevice*, LibC::HANDLE, IUnknown*, HRESULT)
    create_surface_from_hwnd : Proc(IDCompositionDesktopDevice*, LibC::HANDLE, IUnknown*, HRESULT)
  end

  IDCompositionDesktopDevice_GUID = "5f4633fe-1e08-4cb8-8c75-ce24333f5602"
  IID_IDCompositionDesktopDevice = LibC::GUID.new(0x5f4633fe_u32, 0x1e08_u16, 0x4cb8_u16, StaticArray[0x8c_u8, 0x75_u8, 0xce_u8, 0x24_u8, 0x33_u8, 0x3f_u8, 0x56_u8, 0x2_u8])
  struct IDCompositionDesktopDevice
    lpVtbl : IDCompositionDesktopDeviceVTbl*
  end

  struct IDCompositionDeviceDebugVTbl
    query_interface : Proc(IDCompositionDeviceDebug*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDeviceDebug*, UInt32)
    release : Proc(IDCompositionDeviceDebug*, UInt32)
    enable_debug_counters : Proc(IDCompositionDeviceDebug*, HRESULT)
    disable_debug_counters : Proc(IDCompositionDeviceDebug*, HRESULT)
  end

  IDCompositionDeviceDebug_GUID = "a1a3c64a-224f-4a81-9773-4f03a89d3c6c"
  IID_IDCompositionDeviceDebug = LibC::GUID.new(0xa1a3c64a_u32, 0x224f_u16, 0x4a81_u16, StaticArray[0x97_u8, 0x73_u8, 0x4f_u8, 0x3_u8, 0xa8_u8, 0x9d_u8, 0x3c_u8, 0x6c_u8])
  struct IDCompositionDeviceDebug
    lpVtbl : IDCompositionDeviceDebugVTbl*
  end

  struct IDCompositionSurfaceFactoryVTbl
    query_interface : Proc(IDCompositionSurfaceFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSurfaceFactory*, UInt32)
    release : Proc(IDCompositionSurfaceFactory*, UInt32)
    create_surface : Proc(IDCompositionSurfaceFactory*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionSurfaceFactory*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
  end

  IDCompositionSurfaceFactory_GUID = "e334bc12-3937-4e02-85eb-fcf4eb30d2c8"
  IID_IDCompositionSurfaceFactory = LibC::GUID.new(0xe334bc12_u32, 0x3937_u16, 0x4e02_u16, StaticArray[0x85_u8, 0xeb_u8, 0xfc_u8, 0xf4_u8, 0xeb_u8, 0x30_u8, 0xd2_u8, 0xc8_u8])
  struct IDCompositionSurfaceFactory
    lpVtbl : IDCompositionSurfaceFactoryVTbl*
  end

  struct IDCompositionVisual2VTbl
    query_interface : Proc(IDCompositionVisual2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisual2*, UInt32)
    release : Proc(IDCompositionVisual2*, UInt32)
    set_offset_x : Proc(IDCompositionVisual2*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisual2*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisual2*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisual2*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisual2*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisual2*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisual2*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisual2*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisual2*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisual2*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisual2*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisual2*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisual2*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisual2*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
    set_opacity_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_OPACITY_MODE, HRESULT)
    set_back_face_visibility : Proc(IDCompositionVisual2*, DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)
  end

  IDCompositionVisual2_GUID = "e8de1639-4331-4b26-bc5f-6a321d347a85"
  IID_IDCompositionVisual2 = LibC::GUID.new(0xe8de1639_u32, 0x4331_u16, 0x4b26_u16, StaticArray[0xbc_u8, 0x5f_u8, 0x6a_u8, 0x32_u8, 0x1d_u8, 0x34_u8, 0x7a_u8, 0x85_u8])
  struct IDCompositionVisual2
    lpVtbl : IDCompositionVisual2VTbl*
  end

  struct IDCompositionVisualDebugVTbl
    query_interface : Proc(IDCompositionVisualDebug*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisualDebug*, UInt32)
    release : Proc(IDCompositionVisualDebug*, UInt32)
    set_offset_x : Proc(IDCompositionVisualDebug*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisualDebug*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisualDebug*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisualDebug*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisualDebug*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisualDebug*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisualDebug*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisualDebug*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisualDebug*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisualDebug*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisualDebug*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisualDebug*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisualDebug*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisualDebug*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
    set_opacity_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_OPACITY_MODE, HRESULT)
    set_back_face_visibility : Proc(IDCompositionVisualDebug*, DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)
    enable_heat_map : Proc(IDCompositionVisualDebug*, D2D1_COLOR_F*, HRESULT)
    disable_heat_map : Proc(IDCompositionVisualDebug*, HRESULT)
    enable_redraw_regions : Proc(IDCompositionVisualDebug*, HRESULT)
    disable_redraw_regions : Proc(IDCompositionVisualDebug*, HRESULT)
  end

  IDCompositionVisualDebug_GUID = "fed2b808-5eb4-43a0-aea3-35f65280f91b"
  IID_IDCompositionVisualDebug = LibC::GUID.new(0xfed2b808_u32, 0x5eb4_u16, 0x43a0_u16, StaticArray[0xae_u8, 0xa3_u8, 0x35_u8, 0xf6_u8, 0x52_u8, 0x80_u8, 0xf9_u8, 0x1b_u8])
  struct IDCompositionVisualDebug
    lpVtbl : IDCompositionVisualDebugVTbl*
  end

  struct IDCompositionVisual3VTbl
    query_interface : Proc(IDCompositionVisual3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisual3*, UInt32)
    release : Proc(IDCompositionVisual3*, UInt32)
    set_offset_x : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisual3*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisual3*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisual3*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisual3*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisual3*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisual3*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisual3*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisual3*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisual3*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisual3*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
    set_opacity_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_OPACITY_MODE, HRESULT)
    set_back_face_visibility : Proc(IDCompositionVisual3*, DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)
    enable_heat_map : Proc(IDCompositionVisual3*, D2D1_COLOR_F*, HRESULT)
    disable_heat_map : Proc(IDCompositionVisual3*, HRESULT)
    enable_redraw_regions : Proc(IDCompositionVisual3*, HRESULT)
    disable_redraw_regions : Proc(IDCompositionVisual3*, HRESULT)
    set_depth_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_DEPTH_MODE, HRESULT)
    set_offset_z : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_offset_z2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_opacity : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_opacity2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_transform3 : Proc(IDCompositionVisual3*, IDCompositionTransform3D, HRESULT)
    set_transform22 : Proc(IDCompositionVisual3*, D2D_MATRIX_4X4_F*, HRESULT)
    set_visible : Proc(IDCompositionVisual3*, LibC::BOOL, HRESULT)
  end

  IDCompositionVisual3_GUID = "2775f462-b6c1-4015-b0be-b3e7d6a4976d"
  IID_IDCompositionVisual3 = LibC::GUID.new(0x2775f462_u32, 0xb6c1_u16, 0x4015_u16, StaticArray[0xb0_u8, 0xbe_u8, 0xb3_u8, 0xe7_u8, 0xd6_u8, 0xa4_u8, 0x97_u8, 0x6d_u8])
  struct IDCompositionVisual3
    lpVtbl : IDCompositionVisual3VTbl*
  end

  struct IDCompositionDevice3VTbl
    query_interface : Proc(IDCompositionDevice3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDevice3*, UInt32)
    release : Proc(IDCompositionDevice3*, UInt32)
    commit : Proc(IDCompositionDevice3*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDevice3*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDevice3*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_visual : Proc(IDCompositionDevice3*, IDCompositionVisual2*, HRESULT)
    create_surface_factory : Proc(IDCompositionDevice3*, IUnknown, IDCompositionSurfaceFactory*, HRESULT)
    create_surface : Proc(IDCompositionDevice3*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDevice3*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_translate_transform : Proc(IDCompositionDevice3*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDevice3*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDevice3*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDevice3*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDevice3*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDevice3*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDevice3*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDevice3*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDevice3*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDevice3*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDevice3*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDevice3*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDevice3*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDevice3*, IDCompositionAnimation*, HRESULT)
    create_gaussian_blur_effect : Proc(IDCompositionDevice3*, IDCompositionGaussianBlurEffect*, HRESULT)
    create_brightness_effect : Proc(IDCompositionDevice3*, IDCompositionBrightnessEffect*, HRESULT)
    create_color_matrix_effect : Proc(IDCompositionDevice3*, IDCompositionColorMatrixEffect*, HRESULT)
    create_shadow_effect : Proc(IDCompositionDevice3*, IDCompositionShadowEffect*, HRESULT)
    create_hue_rotation_effect : Proc(IDCompositionDevice3*, IDCompositionHueRotationEffect*, HRESULT)
    create_saturation_effect : Proc(IDCompositionDevice3*, IDCompositionSaturationEffect*, HRESULT)
    create_turbulence_effect : Proc(IDCompositionDevice3*, IDCompositionTurbulenceEffect*, HRESULT)
    create_linear_transfer_effect : Proc(IDCompositionDevice3*, IDCompositionLinearTransferEffect*, HRESULT)
    create_table_transfer_effect : Proc(IDCompositionDevice3*, IDCompositionTableTransferEffect*, HRESULT)
    create_composite_effect : Proc(IDCompositionDevice3*, IDCompositionCompositeEffect*, HRESULT)
    create_blend_effect : Proc(IDCompositionDevice3*, IDCompositionBlendEffect*, HRESULT)
    create_arithmetic_composite_effect : Proc(IDCompositionDevice3*, IDCompositionArithmeticCompositeEffect*, HRESULT)
    create_affine_transform2_d_effect : Proc(IDCompositionDevice3*, IDCompositionAffineTransform2DEffect*, HRESULT)
  end

  IDCompositionDevice3_GUID = "0987cb06-f916-48bf-8d35-ce7641781bd9"
  IID_IDCompositionDevice3 = LibC::GUID.new(0x987cb06_u32, 0xf916_u16, 0x48bf_u16, StaticArray[0x8d_u8, 0x35_u8, 0xce_u8, 0x76_u8, 0x41_u8, 0x78_u8, 0x1b_u8, 0xd9_u8])
  struct IDCompositionDevice3
    lpVtbl : IDCompositionDevice3VTbl*
  end

  struct IDCompositionFilterEffectVTbl
    query_interface : Proc(IDCompositionFilterEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionFilterEffect*, UInt32)
    release : Proc(IDCompositionFilterEffect*, UInt32)
    set_input : Proc(IDCompositionFilterEffect*, UInt32, IUnknown, UInt32, HRESULT)
  end

  IDCompositionFilterEffect_GUID = "30c421d5-8cb2-4e9f-b133-37be270d4ac2"
  IID_IDCompositionFilterEffect = LibC::GUID.new(0x30c421d5_u32, 0x8cb2_u16, 0x4e9f_u16, StaticArray[0xb1_u8, 0x33_u8, 0x37_u8, 0xbe_u8, 0x27_u8, 0xd_u8, 0x4a_u8, 0xc2_u8])
  struct IDCompositionFilterEffect
    lpVtbl : IDCompositionFilterEffectVTbl*
  end

  struct IDCompositionGaussianBlurEffectVTbl
    query_interface : Proc(IDCompositionGaussianBlurEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionGaussianBlurEffect*, UInt32)
    release : Proc(IDCompositionGaussianBlurEffect*, UInt32)
    set_input : Proc(IDCompositionGaussianBlurEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_standard_deviation : Proc(IDCompositionGaussianBlurEffect*, IDCompositionAnimation, HRESULT)
    set_standard_deviation2 : Proc(IDCompositionGaussianBlurEffect*, Float32, HRESULT)
    set_border_mode : Proc(IDCompositionGaussianBlurEffect*, D2D1_BORDER_MODE, HRESULT)
  end

  IDCompositionGaussianBlurEffect_GUID = "45d4d0b7-1bd4-454e-8894-2bfa68443033"
  IID_IDCompositionGaussianBlurEffect = LibC::GUID.new(0x45d4d0b7_u32, 0x1bd4_u16, 0x454e_u16, StaticArray[0x88_u8, 0x94_u8, 0x2b_u8, 0xfa_u8, 0x68_u8, 0x44_u8, 0x30_u8, 0x33_u8])
  struct IDCompositionGaussianBlurEffect
    lpVtbl : IDCompositionGaussianBlurEffectVTbl*
  end

  struct IDCompositionBrightnessEffectVTbl
    query_interface : Proc(IDCompositionBrightnessEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionBrightnessEffect*, UInt32)
    release : Proc(IDCompositionBrightnessEffect*, UInt32)
    set_input : Proc(IDCompositionBrightnessEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_white_point : Proc(IDCompositionBrightnessEffect*, D2D_VECTOR_2F*, HRESULT)
    set_black_point : Proc(IDCompositionBrightnessEffect*, D2D_VECTOR_2F*, HRESULT)
    set_white_point_x : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_white_point_x2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
    set_white_point_y : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_white_point_y2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
    set_black_point_x : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_black_point_x2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
    set_black_point_y : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_black_point_y2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
  end

  IDCompositionBrightnessEffect_GUID = "6027496e-cb3a-49ab-934f-d798da4f7da6"
  IID_IDCompositionBrightnessEffect = LibC::GUID.new(0x6027496e_u32, 0xcb3a_u16, 0x49ab_u16, StaticArray[0x93_u8, 0x4f_u8, 0xd7_u8, 0x98_u8, 0xda_u8, 0x4f_u8, 0x7d_u8, 0xa6_u8])
  struct IDCompositionBrightnessEffect
    lpVtbl : IDCompositionBrightnessEffectVTbl*
  end

  struct IDCompositionColorMatrixEffectVTbl
    query_interface : Proc(IDCompositionColorMatrixEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionColorMatrixEffect*, UInt32)
    release : Proc(IDCompositionColorMatrixEffect*, UInt32)
    set_input : Proc(IDCompositionColorMatrixEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_matrix : Proc(IDCompositionColorMatrixEffect*, D2D_MATRIX_5X4_F*, HRESULT)
    set_matrix_element : Proc(IDCompositionColorMatrixEffect*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_matrix_element2 : Proc(IDCompositionColorMatrixEffect*, Int32, Int32, Float32, HRESULT)
    set_alpha_mode : Proc(IDCompositionColorMatrixEffect*, D2D1_COLORMATRIX_ALPHA_MODE, HRESULT)
    set_clamp_output : Proc(IDCompositionColorMatrixEffect*, LibC::BOOL, HRESULT)
  end

  IDCompositionColorMatrixEffect_GUID = "c1170a22-3ce2-4966-90d4-55408bfc84c4"
  IID_IDCompositionColorMatrixEffect = LibC::GUID.new(0xc1170a22_u32, 0x3ce2_u16, 0x4966_u16, StaticArray[0x90_u8, 0xd4_u8, 0x55_u8, 0x40_u8, 0x8b_u8, 0xfc_u8, 0x84_u8, 0xc4_u8])
  struct IDCompositionColorMatrixEffect
    lpVtbl : IDCompositionColorMatrixEffectVTbl*
  end

  struct IDCompositionShadowEffectVTbl
    query_interface : Proc(IDCompositionShadowEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionShadowEffect*, UInt32)
    release : Proc(IDCompositionShadowEffect*, UInt32)
    set_input : Proc(IDCompositionShadowEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_standard_deviation : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_standard_deviation2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_color : Proc(IDCompositionShadowEffect*, D2D_VECTOR_4F*, HRESULT)
    set_red : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_red2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_green : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_green2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_blue : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_blue2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_alpha : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_alpha2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
  end

  IDCompositionShadowEffect_GUID = "4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879"
  IID_IDCompositionShadowEffect = LibC::GUID.new(0x4ad18ac0_u32, 0xcfd2_u16, 0x4c2f_u16, StaticArray[0xbb_u8, 0x62_u8, 0x96_u8, 0xe5_u8, 0x4f_u8, 0xdb_u8, 0x68_u8, 0x79_u8])
  struct IDCompositionShadowEffect
    lpVtbl : IDCompositionShadowEffectVTbl*
  end

  struct IDCompositionHueRotationEffectVTbl
    query_interface : Proc(IDCompositionHueRotationEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionHueRotationEffect*, UInt32)
    release : Proc(IDCompositionHueRotationEffect*, UInt32)
    set_input : Proc(IDCompositionHueRotationEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_angle : Proc(IDCompositionHueRotationEffect*, IDCompositionAnimation, HRESULT)
    set_angle2 : Proc(IDCompositionHueRotationEffect*, Float32, HRESULT)
  end

  IDCompositionHueRotationEffect_GUID = "6db9f920-0770-4781-b0c6-381912f9d167"
  IID_IDCompositionHueRotationEffect = LibC::GUID.new(0x6db9f920_u32, 0x770_u16, 0x4781_u16, StaticArray[0xb0_u8, 0xc6_u8, 0x38_u8, 0x19_u8, 0x12_u8, 0xf9_u8, 0xd1_u8, 0x67_u8])
  struct IDCompositionHueRotationEffect
    lpVtbl : IDCompositionHueRotationEffectVTbl*
  end

  struct IDCompositionSaturationEffectVTbl
    query_interface : Proc(IDCompositionSaturationEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSaturationEffect*, UInt32)
    release : Proc(IDCompositionSaturationEffect*, UInt32)
    set_input : Proc(IDCompositionSaturationEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_saturation : Proc(IDCompositionSaturationEffect*, IDCompositionAnimation, HRESULT)
    set_saturation2 : Proc(IDCompositionSaturationEffect*, Float32, HRESULT)
  end

  IDCompositionSaturationEffect_GUID = "a08debda-3258-4fa4-9f16-9174d3fe93b1"
  IID_IDCompositionSaturationEffect = LibC::GUID.new(0xa08debda_u32, 0x3258_u16, 0x4fa4_u16, StaticArray[0x9f_u8, 0x16_u8, 0x91_u8, 0x74_u8, 0xd3_u8, 0xfe_u8, 0x93_u8, 0xb1_u8])
  struct IDCompositionSaturationEffect
    lpVtbl : IDCompositionSaturationEffectVTbl*
  end

  struct IDCompositionTurbulenceEffectVTbl
    query_interface : Proc(IDCompositionTurbulenceEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTurbulenceEffect*, UInt32)
    release : Proc(IDCompositionTurbulenceEffect*, UInt32)
    set_input : Proc(IDCompositionTurbulenceEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_offset : Proc(IDCompositionTurbulenceEffect*, D2D_VECTOR_2F*, HRESULT)
    set_base_frequency : Proc(IDCompositionTurbulenceEffect*, D2D_VECTOR_2F*, HRESULT)
    set_size : Proc(IDCompositionTurbulenceEffect*, D2D_VECTOR_2F*, HRESULT)
    set_num_octaves : Proc(IDCompositionTurbulenceEffect*, UInt32, HRESULT)
    set_seed : Proc(IDCompositionTurbulenceEffect*, UInt32, HRESULT)
    set_noise : Proc(IDCompositionTurbulenceEffect*, D2D1_TURBULENCE_NOISE, HRESULT)
    set_stitchable : Proc(IDCompositionTurbulenceEffect*, LibC::BOOL, HRESULT)
  end

  IDCompositionTurbulenceEffect_GUID = "a6a55bda-c09c-49f3-9193-a41922c89715"
  IID_IDCompositionTurbulenceEffect = LibC::GUID.new(0xa6a55bda_u32, 0xc09c_u16, 0x49f3_u16, StaticArray[0x91_u8, 0x93_u8, 0xa4_u8, 0x19_u8, 0x22_u8, 0xc8_u8, 0x97_u8, 0x15_u8])
  struct IDCompositionTurbulenceEffect
    lpVtbl : IDCompositionTurbulenceEffectVTbl*
  end

  struct IDCompositionLinearTransferEffectVTbl
    query_interface : Proc(IDCompositionLinearTransferEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionLinearTransferEffect*, UInt32)
    release : Proc(IDCompositionLinearTransferEffect*, UInt32)
    set_input : Proc(IDCompositionLinearTransferEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_red_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_red_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_red_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_red_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_red_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_green_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_green_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_green_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_green_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_green_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_blue_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_blue_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_blue_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_blue_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_blue_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_alpha_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_alpha_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_alpha_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_alpha_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_alpha_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_clamp_output : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
  end

  IDCompositionLinearTransferEffect_GUID = "4305ee5b-c4a0-4c88-9385-67124e017683"
  IID_IDCompositionLinearTransferEffect = LibC::GUID.new(0x4305ee5b_u32, 0xc4a0_u16, 0x4c88_u16, StaticArray[0x93_u8, 0x85_u8, 0x67_u8, 0x12_u8, 0x4e_u8, 0x1_u8, 0x76_u8, 0x83_u8])
  struct IDCompositionLinearTransferEffect
    lpVtbl : IDCompositionLinearTransferEffectVTbl*
  end

  struct IDCompositionTableTransferEffectVTbl
    query_interface : Proc(IDCompositionTableTransferEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTableTransferEffect*, UInt32)
    release : Proc(IDCompositionTableTransferEffect*, UInt32)
    set_input : Proc(IDCompositionTableTransferEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_red_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_green_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_blue_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_alpha_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_red_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_green_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_blue_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_alpha_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_clamp_output : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_red_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_red_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
    set_green_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_green_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
    set_blue_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_blue_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
    set_alpha_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_alpha_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
  end

  IDCompositionTableTransferEffect_GUID = "9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd"
  IID_IDCompositionTableTransferEffect = LibC::GUID.new(0x9b7e82e2_u32, 0x69c5_u16, 0x4eb4_u16, StaticArray[0xa5_u8, 0xf5_u8, 0xa7_u8, 0x3_u8, 0x3f_u8, 0x51_u8, 0x32_u8, 0xcd_u8])
  struct IDCompositionTableTransferEffect
    lpVtbl : IDCompositionTableTransferEffectVTbl*
  end

  struct IDCompositionCompositeEffectVTbl
    query_interface : Proc(IDCompositionCompositeEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionCompositeEffect*, UInt32)
    release : Proc(IDCompositionCompositeEffect*, UInt32)
    set_input : Proc(IDCompositionCompositeEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_mode : Proc(IDCompositionCompositeEffect*, D2D1_COMPOSITE_MODE, HRESULT)
  end

  IDCompositionCompositeEffect_GUID = "576616c0-a231-494d-a38d-00fd5ec4db46"
  IID_IDCompositionCompositeEffect = LibC::GUID.new(0x576616c0_u32, 0xa231_u16, 0x494d_u16, StaticArray[0xa3_u8, 0x8d_u8, 0x0_u8, 0xfd_u8, 0x5e_u8, 0xc4_u8, 0xdb_u8, 0x46_u8])
  struct IDCompositionCompositeEffect
    lpVtbl : IDCompositionCompositeEffectVTbl*
  end

  struct IDCompositionBlendEffectVTbl
    query_interface : Proc(IDCompositionBlendEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionBlendEffect*, UInt32)
    release : Proc(IDCompositionBlendEffect*, UInt32)
    set_input : Proc(IDCompositionBlendEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_mode : Proc(IDCompositionBlendEffect*, D2D1_BLEND_MODE, HRESULT)
  end

  IDCompositionBlendEffect_GUID = "33ecdc0a-578a-4a11-9c14-0cb90517f9c5"
  IID_IDCompositionBlendEffect = LibC::GUID.new(0x33ecdc0a_u32, 0x578a_u16, 0x4a11_u16, StaticArray[0x9c_u8, 0x14_u8, 0xc_u8, 0xb9_u8, 0x5_u8, 0x17_u8, 0xf9_u8, 0xc5_u8])
  struct IDCompositionBlendEffect
    lpVtbl : IDCompositionBlendEffectVTbl*
  end

  struct IDCompositionArithmeticCompositeEffectVTbl
    query_interface : Proc(IDCompositionArithmeticCompositeEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionArithmeticCompositeEffect*, UInt32)
    release : Proc(IDCompositionArithmeticCompositeEffect*, UInt32)
    set_input : Proc(IDCompositionArithmeticCompositeEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_coefficients : Proc(IDCompositionArithmeticCompositeEffect*, D2D_VECTOR_4F*, HRESULT)
    set_clamp_output : Proc(IDCompositionArithmeticCompositeEffect*, LibC::BOOL, HRESULT)
    set_coefficient1 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient12 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
    set_coefficient2 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient22 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
    set_coefficient3 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient32 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
    set_coefficient4 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient42 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
  end

  IDCompositionArithmeticCompositeEffect_GUID = "3b67dfa8-e3dd-4e61-b640-46c2f3d739dc"
  IID_IDCompositionArithmeticCompositeEffect = LibC::GUID.new(0x3b67dfa8_u32, 0xe3dd_u16, 0x4e61_u16, StaticArray[0xb6_u8, 0x40_u8, 0x46_u8, 0xc2_u8, 0xf3_u8, 0xd7_u8, 0x39_u8, 0xdc_u8])
  struct IDCompositionArithmeticCompositeEffect
    lpVtbl : IDCompositionArithmeticCompositeEffectVTbl*
  end

  struct IDCompositionAffineTransform2DEffectVTbl
    query_interface : Proc(IDCompositionAffineTransform2DEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionAffineTransform2DEffect*, UInt32)
    release : Proc(IDCompositionAffineTransform2DEffect*, UInt32)
    set_input : Proc(IDCompositionAffineTransform2DEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_interpolation_mode : Proc(IDCompositionAffineTransform2DEffect*, D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionAffineTransform2DEffect*, D2D1_BORDER_MODE, HRESULT)
    set_transform_matrix : Proc(IDCompositionAffineTransform2DEffect*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_matrix_element : Proc(IDCompositionAffineTransform2DEffect*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_transform_matrix_element2 : Proc(IDCompositionAffineTransform2DEffect*, Int32, Int32, Float32, HRESULT)
    set_sharpness : Proc(IDCompositionAffineTransform2DEffect*, IDCompositionAnimation, HRESULT)
    set_sharpness2 : Proc(IDCompositionAffineTransform2DEffect*, Float32, HRESULT)
  end

  IDCompositionAffineTransform2DEffect_GUID = "0b74b9e8-cdd6-492f-bbbc-5ed32157026d"
  IID_IDCompositionAffineTransform2DEffect = LibC::GUID.new(0xb74b9e8_u32, 0xcdd6_u16, 0x492f_u16, StaticArray[0xbb_u8, 0xbc_u8, 0x5e_u8, 0xd3_u8, 0x21_u8, 0x57_u8, 0x2_u8, 0x6d_u8])
  struct IDCompositionAffineTransform2DEffect
    lpVtbl : IDCompositionAffineTransform2DEffectVTbl*
  end

  struct IDCompositionDelegatedInkTrailVTbl
    query_interface : Proc(IDCompositionDelegatedInkTrail*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDelegatedInkTrail*, UInt32)
    release : Proc(IDCompositionDelegatedInkTrail*, UInt32)
    add_trail_points : Proc(IDCompositionDelegatedInkTrail*, DCompositionInkTrailPoint*, UInt32, UInt32*, HRESULT)
    add_trail_points_with_prediction : Proc(IDCompositionDelegatedInkTrail*, DCompositionInkTrailPoint*, UInt32, DCompositionInkTrailPoint*, UInt32, UInt32*, HRESULT)
    remove_trail_points : Proc(IDCompositionDelegatedInkTrail*, UInt32, HRESULT)
    start_new_trail : Proc(IDCompositionDelegatedInkTrail*, D2D1_COLOR_F*, HRESULT)
  end

  IDCompositionDelegatedInkTrail_GUID = "c2448e9b-547d-4057-8cf5-8144ede1c2da"
  IID_IDCompositionDelegatedInkTrail = LibC::GUID.new(0xc2448e9b_u32, 0x547d_u16, 0x4057_u16, StaticArray[0x8c_u8, 0xf5_u8, 0x81_u8, 0x44_u8, 0xed_u8, 0xe1_u8, 0xc2_u8, 0xda_u8])
  struct IDCompositionDelegatedInkTrail
    lpVtbl : IDCompositionDelegatedInkTrailVTbl*
  end

  struct IDCompositionInkTrailDeviceVTbl
    query_interface : Proc(IDCompositionInkTrailDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionInkTrailDevice*, UInt32)
    release : Proc(IDCompositionInkTrailDevice*, UInt32)
    create_delegated_ink_trail : Proc(IDCompositionInkTrailDevice*, IDCompositionDelegatedInkTrail*, HRESULT)
    create_delegated_ink_trail_for_swap_chain : Proc(IDCompositionInkTrailDevice*, IUnknown, IDCompositionDelegatedInkTrail*, HRESULT)
  end

  IDCompositionInkTrailDevice_GUID = "df0c7cec-cdeb-4d4a-b91c-721bf22f4e6c"
  IID_IDCompositionInkTrailDevice = LibC::GUID.new(0xdf0c7cec_u32, 0xcdeb_u16, 0x4d4a_u16, StaticArray[0xb9_u8, 0x1c_u8, 0x72_u8, 0x1b_u8, 0xf2_u8, 0x2f_u8, 0x4e_u8, 0x6c_u8])
  struct IDCompositionInkTrailDevice
    lpVtbl : IDCompositionInkTrailDeviceVTbl*
  end


  # Params # dxgidevice : IDXGIDevice [In],iid : Guid* [In],dcompositiondevice : Void** [In]
  fun DCompositionCreateDevice(dxgidevice : IDXGIDevice, iid : Guid*, dcompositiondevice : Void**) : HRESULT

  # Params # renderingdevice : IUnknown [In],iid : Guid* [In],dcompositiondevice : Void** [In]
  fun DCompositionCreateDevice2(renderingdevice : IUnknown, iid : Guid*, dcompositiondevice : Void**) : HRESULT

  # Params # renderingdevice : IUnknown [In],iid : Guid* [In],dcompositiondevice : Void** [In]
  fun DCompositionCreateDevice3(renderingdevice : IUnknown, iid : Guid*, dcompositiondevice : Void**) : HRESULT

  # Params # desiredaccess : UInt32 [In],securityattributes : SECURITY_ATTRIBUTES* [In],surfacehandle : LibC::HANDLE* [In]
  fun DCompositionCreateSurfaceHandle(desiredaccess : UInt32, securityattributes : SECURITY_ATTRIBUTES*, surfacehandle : LibC::HANDLE*) : HRESULT

  # Params # visual : IDCompositionVisual [In],hwnd : LibC::HANDLE [In],enable : LibC::BOOL [In]
  fun DCompositionAttachMouseWheelToHwnd(visual : IDCompositionVisual, hwnd : LibC::HANDLE, enable : LibC::BOOL) : HRESULT

  # Params # visual : IDCompositionVisual [In],hwnd : LibC::HANDLE [In],enable : LibC::BOOL [In]
  fun DCompositionAttachMouseDragToHwnd(visual : IDCompositionVisual, hwnd : LibC::HANDLE, enable : LibC::BOOL) : HRESULT

  # Params # frameidtype : COMPOSITION_FRAME_ID_TYPE [In],frameid : UInt64* [In]
  fun DCompositionGetFrameId(frameidtype : COMPOSITION_FRAME_ID_TYPE, frameid : UInt64*) : HRESULT

  # Params # frameid : UInt64 [In],framestats : COMPOSITION_FRAME_STATS* [In],targetidcount : UInt32 [In],targetids : COMPOSITION_TARGET_ID* [In],actualtargetidcount : UInt32* [In]
  fun DCompositionGetStatistics(frameid : UInt64, framestats : COMPOSITION_FRAME_STATS*, targetidcount : UInt32, targetids : COMPOSITION_TARGET_ID*, actualtargetidcount : UInt32*) : HRESULT

  # Params # frameid : UInt64 [In],targetid : COMPOSITION_TARGET_ID* [In],targetstats : COMPOSITION_TARGET_STATS* [In]
  fun DCompositionGetTargetStatistics(frameid : UInt64, targetid : COMPOSITION_TARGET_ID*, targetstats : COMPOSITION_TARGET_STATS*) : HRESULT

  # Params # enable : LibC::BOOL [In]
  fun DCompositionBoostCompositorClock(enable : LibC::BOOL) : HRESULT

  # Params # count : UInt32 [In],handles : LibC::HANDLE* [In],timeoutinms : UInt32 [In]
  fun DCompositionWaitForCompositorClock(count : UInt32, handles : LibC::HANDLE*, timeoutinms : UInt32) : UInt32
end