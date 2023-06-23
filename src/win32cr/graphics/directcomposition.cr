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
    end_ : Proc(IDCompositionAnimation*, Float64, Float32, HRESULT)
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
struct LibWin32::IDCompositionAnimation
  def query_interface(this : IDCompositionAnimation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionAnimation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionAnimation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reset(this : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def set_absolute_begin_time(this : IDCompositionAnimation*, begintime : LARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_absolute_begin_time.call(this, begintime)
  end
  def add_cubic(this : IDCompositionAnimation*, beginoffset : Float64, constantcoefficient : Float32, linearcoefficient : Float32, quadraticcoefficient : Float32, cubiccoefficient : Float32) : HRESULT
    @lpVtbl.value.add_cubic.call(this, beginoffset, constantcoefficient, linearcoefficient, quadraticcoefficient, cubiccoefficient)
  end
  def add_sinusoidal(this : IDCompositionAnimation*, beginoffset : Float64, bias : Float32, amplitude : Float32, frequency : Float32, phase : Float32) : HRESULT
    @lpVtbl.value.add_sinusoidal.call(this, beginoffset, bias, amplitude, frequency, phase)
  end
  def add_repeat(this : IDCompositionAnimation*, beginoffset : Float64, durationtorepeat : Float64) : HRESULT
    @lpVtbl.value.add_repeat.call(this, beginoffset, durationtorepeat)
  end
  def end_(this : IDCompositionAnimation*, endoffset : Float64, endvalue : Float32) : HRESULT
    @lpVtbl.value.end_.call(this, endoffset, endvalue)
  end
end
struct LibWin32::IDCompositionDevice
  def query_interface(this : IDCompositionDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : IDCompositionDevice*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def wait_for_commit_completion(this : IDCompositionDevice*) : HRESULT
    @lpVtbl.value.wait_for_commit_completion.call(this)
  end
  def get_frame_statistics(this : IDCompositionDevice*, statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.call(this, statistics)
  end
  def create_target_for_hwnd(this : IDCompositionDevice*, hwnd : LibC::HANDLE, topmost : LibC::BOOL, target : IDCompositionTarget*) : HRESULT
    @lpVtbl.value.create_target_for_hwnd.call(this, hwnd, topmost, target)
  end
  def create_visual(this : IDCompositionDevice*, visual : IDCompositionVisual*) : HRESULT
    @lpVtbl.value.create_visual.call(this, visual)
  end
  def create_surface(this : IDCompositionDevice*, width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.call(this, width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(this : IDCompositionDevice*, initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.call(this, initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_surface_from_handle(this : IDCompositionDevice*, handle : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_handle.call(this, handle, surface)
  end
  def create_surface_from_hwnd(this : IDCompositionDevice*, hwnd : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_hwnd.call(this, hwnd, surface)
  end
  def create_translate_transform(this : IDCompositionDevice*, translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.call(this, translatetransform)
  end
  def create_scale_transform(this : IDCompositionDevice*, scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.call(this, scaletransform)
  end
  def create_rotate_transform(this : IDCompositionDevice*, rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.call(this, rotatetransform)
  end
  def create_skew_transform(this : IDCompositionDevice*, skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.call(this, skewtransform)
  end
  def create_matrix_transform(this : IDCompositionDevice*, matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.call(this, matrixtransform)
  end
  def create_transform_group(this : IDCompositionDevice*, transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.call(this, transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(this : IDCompositionDevice*, translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.call(this, translatetransform3d)
  end
  def create_scale_transform3_d(this : IDCompositionDevice*, scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.call(this, scaletransform3d)
  end
  def create_rotate_transform3_d(this : IDCompositionDevice*, rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.call(this, rotatetransform3d)
  end
  def create_matrix_transform3_d(this : IDCompositionDevice*, matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.call(this, matrixtransform3d)
  end
  def create_transform3_d_group(this : IDCompositionDevice*, transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.call(this, transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(this : IDCompositionDevice*, effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.call(this, effectgroup)
  end
  def create_rectangle_clip(this : IDCompositionDevice*, clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.call(this, clip)
  end
  def create_animation(this : IDCompositionDevice*, animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.call(this, animation)
  end
  def check_device_state(this : IDCompositionDevice*, pfvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_device_state.call(this, pfvalid)
  end
end
struct LibWin32::IDCompositionTarget
  def query_interface(this : IDCompositionTarget*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTarget*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTarget*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_root(this : IDCompositionTarget*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_root.call(this, visual)
  end
end
struct LibWin32::IDCompositionVisual
  def query_interface(this : IDCompositionVisual*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionVisual*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionVisual*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_offset_x(this : IDCompositionVisual*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.call(this, animation)
  end
  def set_offset_x2(this : IDCompositionVisual*, offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.call(this, offsetx)
  end
  def set_offset_y(this : IDCompositionVisual*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.call(this, animation)
  end
  def set_offset_y2(this : IDCompositionVisual*, offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.call(this, offsety)
  end
  def set_transform(this : IDCompositionVisual*, transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.call(this, transform)
  end
  def set_transform2(this : IDCompositionVisual*, matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.call(this, matrix)
  end
  def set_transform_parent(this : IDCompositionVisual*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.call(this, visual)
  end
  def set_effect(this : IDCompositionVisual*, effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.call(this, effect)
  end
  def set_bitmap_interpolation_mode(this : IDCompositionVisual*, interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.call(this, interpolationmode)
  end
  def set_border_mode(this : IDCompositionVisual*, bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.call(this, bordermode)
  end
  def set_clip(this : IDCompositionVisual*, clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.call(this, clip)
  end
  def set_clip2(this : IDCompositionVisual*, rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.call(this, rect)
  end
  def set_content(this : IDCompositionVisual*, content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.call(this, content)
  end
  def add_visual(this : IDCompositionVisual*, visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.call(this, visual, insertabove, referencevisual)
  end
  def remove_visual(this : IDCompositionVisual*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.call(this, visual)
  end
  def remove_all_visuals(this : IDCompositionVisual*) : HRESULT
    @lpVtbl.value.remove_all_visuals.call(this)
  end
  def set_composite_mode(this : IDCompositionVisual*, compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.call(this, compositemode)
  end
end
struct LibWin32::IDCompositionEffect
  def query_interface(this : IDCompositionEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IDCompositionTransform3D
  def query_interface(this : IDCompositionTransform3D*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTransform3D*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTransform3D*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IDCompositionTransform
  def query_interface(this : IDCompositionTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IDCompositionTranslateTransform
  def query_interface(this : IDCompositionTranslateTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTranslateTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTranslateTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_offset_x(this : IDCompositionTranslateTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.call(this, animation)
  end
  def set_offset_x2(this : IDCompositionTranslateTransform*, offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.call(this, offsetx)
  end
  def set_offset_y(this : IDCompositionTranslateTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.call(this, animation)
  end
  def set_offset_y2(this : IDCompositionTranslateTransform*, offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.call(this, offsety)
  end
end
struct LibWin32::IDCompositionScaleTransform
  def query_interface(this : IDCompositionScaleTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionScaleTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionScaleTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_scale_x(this : IDCompositionScaleTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_x.call(this, animation)
  end
  def set_scale_x2(this : IDCompositionScaleTransform*, scalex : Float32) : HRESULT
    @lpVtbl.value.set_scale_x2.call(this, scalex)
  end
  def set_scale_y(this : IDCompositionScaleTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_y.call(this, animation)
  end
  def set_scale_y2(this : IDCompositionScaleTransform*, scaley : Float32) : HRESULT
    @lpVtbl.value.set_scale_y2.call(this, scaley)
  end
  def set_center_x(this : IDCompositionScaleTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.call(this, animation)
  end
  def set_center_x2(this : IDCompositionScaleTransform*, centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.call(this, centerx)
  end
  def set_center_y(this : IDCompositionScaleTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.call(this, animation)
  end
  def set_center_y2(this : IDCompositionScaleTransform*, centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.call(this, centery)
  end
end
struct LibWin32::IDCompositionRotateTransform
  def query_interface(this : IDCompositionRotateTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionRotateTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionRotateTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_angle(this : IDCompositionRotateTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle.call(this, animation)
  end
  def set_angle2(this : IDCompositionRotateTransform*, angle : Float32) : HRESULT
    @lpVtbl.value.set_angle2.call(this, angle)
  end
  def set_center_x(this : IDCompositionRotateTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.call(this, animation)
  end
  def set_center_x2(this : IDCompositionRotateTransform*, centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.call(this, centerx)
  end
  def set_center_y(this : IDCompositionRotateTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.call(this, animation)
  end
  def set_center_y2(this : IDCompositionRotateTransform*, centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.call(this, centery)
  end
end
struct LibWin32::IDCompositionSkewTransform
  def query_interface(this : IDCompositionSkewTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionSkewTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionSkewTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_angle_x(this : IDCompositionSkewTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle_x.call(this, animation)
  end
  def set_angle_x2(this : IDCompositionSkewTransform*, anglex : Float32) : HRESULT
    @lpVtbl.value.set_angle_x2.call(this, anglex)
  end
  def set_angle_y(this : IDCompositionSkewTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle_y.call(this, animation)
  end
  def set_angle_y2(this : IDCompositionSkewTransform*, angley : Float32) : HRESULT
    @lpVtbl.value.set_angle_y2.call(this, angley)
  end
  def set_center_x(this : IDCompositionSkewTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.call(this, animation)
  end
  def set_center_x2(this : IDCompositionSkewTransform*, centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.call(this, centerx)
  end
  def set_center_y(this : IDCompositionSkewTransform*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.call(this, animation)
  end
  def set_center_y2(this : IDCompositionSkewTransform*, centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.call(this, centery)
  end
end
struct LibWin32::IDCompositionMatrixTransform
  def query_interface(this : IDCompositionMatrixTransform*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionMatrixTransform*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionMatrixTransform*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_matrix(this : IDCompositionMatrixTransform*, matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_matrix.call(this, matrix)
  end
  def set_matrix_element(this : IDCompositionMatrixTransform*, row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_matrix_element.call(this, row, column, animation)
  end
  def set_matrix_element2(this : IDCompositionMatrixTransform*, row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_matrix_element2.call(this, row, column, value)
  end
end
struct LibWin32::IDCompositionEffectGroup
  def query_interface(this : IDCompositionEffectGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionEffectGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionEffectGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_opacity(this : IDCompositionEffectGroup*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_opacity.call(this, animation)
  end
  def set_opacity2(this : IDCompositionEffectGroup*, opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity2.call(this, opacity)
  end
  def set_transform3_d(this : IDCompositionEffectGroup*, transform3d : IDCompositionTransform3D) : HRESULT
    @lpVtbl.value.set_transform3_d.call(this, transform3d)
  end
end
struct LibWin32::IDCompositionTranslateTransform3D
  def query_interface(this : IDCompositionTranslateTransform3D*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTranslateTransform3D*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTranslateTransform3D*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_offset_x(this : IDCompositionTranslateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.call(this, animation)
  end
  def set_offset_x2(this : IDCompositionTranslateTransform3D*, offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.call(this, offsetx)
  end
  def set_offset_y(this : IDCompositionTranslateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.call(this, animation)
  end
  def set_offset_y2(this : IDCompositionTranslateTransform3D*, offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.call(this, offsety)
  end
  def set_offset_z(this : IDCompositionTranslateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_z.call(this, animation)
  end
  def set_offset_z2(this : IDCompositionTranslateTransform3D*, offsetz : Float32) : HRESULT
    @lpVtbl.value.set_offset_z2.call(this, offsetz)
  end
end
struct LibWin32::IDCompositionScaleTransform3D
  def query_interface(this : IDCompositionScaleTransform3D*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionScaleTransform3D*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionScaleTransform3D*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_scale_x(this : IDCompositionScaleTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_x.call(this, animation)
  end
  def set_scale_x2(this : IDCompositionScaleTransform3D*, scalex : Float32) : HRESULT
    @lpVtbl.value.set_scale_x2.call(this, scalex)
  end
  def set_scale_y(this : IDCompositionScaleTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_y.call(this, animation)
  end
  def set_scale_y2(this : IDCompositionScaleTransform3D*, scaley : Float32) : HRESULT
    @lpVtbl.value.set_scale_y2.call(this, scaley)
  end
  def set_scale_z(this : IDCompositionScaleTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_z.call(this, animation)
  end
  def set_scale_z2(this : IDCompositionScaleTransform3D*, scalez : Float32) : HRESULT
    @lpVtbl.value.set_scale_z2.call(this, scalez)
  end
  def set_center_x(this : IDCompositionScaleTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.call(this, animation)
  end
  def set_center_x2(this : IDCompositionScaleTransform3D*, centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.call(this, centerx)
  end
  def set_center_y(this : IDCompositionScaleTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.call(this, animation)
  end
  def set_center_y2(this : IDCompositionScaleTransform3D*, centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.call(this, centery)
  end
  def set_center_z(this : IDCompositionScaleTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_z.call(this, animation)
  end
  def set_center_z2(this : IDCompositionScaleTransform3D*, centerz : Float32) : HRESULT
    @lpVtbl.value.set_center_z2.call(this, centerz)
  end
end
struct LibWin32::IDCompositionRotateTransform3D
  def query_interface(this : IDCompositionRotateTransform3D*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionRotateTransform3D*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionRotateTransform3D*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_angle(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle.call(this, animation)
  end
  def set_angle2(this : IDCompositionRotateTransform3D*, angle : Float32) : HRESULT
    @lpVtbl.value.set_angle2.call(this, angle)
  end
  def set_axis_x(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_axis_x.call(this, animation)
  end
  def set_axis_x2(this : IDCompositionRotateTransform3D*, axisx : Float32) : HRESULT
    @lpVtbl.value.set_axis_x2.call(this, axisx)
  end
  def set_axis_y(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_axis_y.call(this, animation)
  end
  def set_axis_y2(this : IDCompositionRotateTransform3D*, axisy : Float32) : HRESULT
    @lpVtbl.value.set_axis_y2.call(this, axisy)
  end
  def set_axis_z(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_axis_z.call(this, animation)
  end
  def set_axis_z2(this : IDCompositionRotateTransform3D*, axisz : Float32) : HRESULT
    @lpVtbl.value.set_axis_z2.call(this, axisz)
  end
  def set_center_x(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.call(this, animation)
  end
  def set_center_x2(this : IDCompositionRotateTransform3D*, centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.call(this, centerx)
  end
  def set_center_y(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.call(this, animation)
  end
  def set_center_y2(this : IDCompositionRotateTransform3D*, centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.call(this, centery)
  end
  def set_center_z(this : IDCompositionRotateTransform3D*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_z.call(this, animation)
  end
  def set_center_z2(this : IDCompositionRotateTransform3D*, centerz : Float32) : HRESULT
    @lpVtbl.value.set_center_z2.call(this, centerz)
  end
end
struct LibWin32::IDCompositionMatrixTransform3D
  def query_interface(this : IDCompositionMatrixTransform3D*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionMatrixTransform3D*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionMatrixTransform3D*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_matrix(this : IDCompositionMatrixTransform3D*, matrix : D3DMATRIX*) : HRESULT
    @lpVtbl.value.set_matrix.call(this, matrix)
  end
  def set_matrix_element(this : IDCompositionMatrixTransform3D*, row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_matrix_element.call(this, row, column, animation)
  end
  def set_matrix_element2(this : IDCompositionMatrixTransform3D*, row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_matrix_element2.call(this, row, column, value)
  end
end
struct LibWin32::IDCompositionClip
  def query_interface(this : IDCompositionClip*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionClip*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionClip*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IDCompositionRectangleClip
  def query_interface(this : IDCompositionRectangleClip*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionRectangleClip*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionRectangleClip*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_left(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_left.call(this, animation)
  end
  def set_left2(this : IDCompositionRectangleClip*, left : Float32) : HRESULT
    @lpVtbl.value.set_left2.call(this, left)
  end
  def set_top(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top.call(this, animation)
  end
  def set_top2(this : IDCompositionRectangleClip*, top : Float32) : HRESULT
    @lpVtbl.value.set_top2.call(this, top)
  end
  def set_right(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_right.call(this, animation)
  end
  def set_right2(this : IDCompositionRectangleClip*, right : Float32) : HRESULT
    @lpVtbl.value.set_right2.call(this, right)
  end
  def set_bottom(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom.call(this, animation)
  end
  def set_bottom2(this : IDCompositionRectangleClip*, bottom : Float32) : HRESULT
    @lpVtbl.value.set_bottom2.call(this, bottom)
  end
  def set_top_left_radius_x(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_left_radius_x.call(this, animation)
  end
  def set_top_left_radius_x2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_top_left_radius_x2.call(this, radius)
  end
  def set_top_left_radius_y(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_left_radius_y.call(this, animation)
  end
  def set_top_left_radius_y2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_top_left_radius_y2.call(this, radius)
  end
  def set_top_right_radius_x(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_right_radius_x.call(this, animation)
  end
  def set_top_right_radius_x2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_top_right_radius_x2.call(this, radius)
  end
  def set_top_right_radius_y(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_right_radius_y.call(this, animation)
  end
  def set_top_right_radius_y2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_top_right_radius_y2.call(this, radius)
  end
  def set_bottom_left_radius_x(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_x.call(this, animation)
  end
  def set_bottom_left_radius_x2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_x2.call(this, radius)
  end
  def set_bottom_left_radius_y(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_y.call(this, animation)
  end
  def set_bottom_left_radius_y2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_y2.call(this, radius)
  end
  def set_bottom_right_radius_x(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_x.call(this, animation)
  end
  def set_bottom_right_radius_x2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_x2.call(this, radius)
  end
  def set_bottom_right_radius_y(this : IDCompositionRectangleClip*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_y.call(this, animation)
  end
  def set_bottom_right_radius_y2(this : IDCompositionRectangleClip*, radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_y2.call(this, radius)
  end
end
struct LibWin32::IDCompositionSurface
  def query_interface(this : IDCompositionSurface*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionSurface*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionSurface*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_draw(this : IDCompositionSurface*, updaterect : RECT*, iid : Guid*, updateobject : Void**, updateoffset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.call(this, updaterect, iid, updateobject, updateoffset)
  end
  def end_draw(this : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.end_draw.call(this)
  end
  def suspend_draw(this : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.suspend_draw.call(this)
  end
  def resume_draw(this : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.resume_draw.call(this)
  end
  def scroll(this : IDCompositionSurface*, scrollrect : RECT*, cliprect : RECT*, offsetx : Int32, offsety : Int32) : HRESULT
    @lpVtbl.value.scroll.call(this, scrollrect, cliprect, offsetx, offsety)
  end
end
struct LibWin32::IDCompositionVirtualSurface
  def query_interface(this : IDCompositionVirtualSurface*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionVirtualSurface*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionVirtualSurface*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def begin_draw(this : IDCompositionVirtualSurface*, updaterect : RECT*, iid : Guid*, updateobject : Void**, updateoffset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.call(this, updaterect, iid, updateobject, updateoffset)
  end
  def end_draw(this : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.end_draw.call(this)
  end
  def suspend_draw(this : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.suspend_draw.call(this)
  end
  def resume_draw(this : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.resume_draw.call(this)
  end
  def scroll(this : IDCompositionVirtualSurface*, scrollrect : RECT*, cliprect : RECT*, offsetx : Int32, offsety : Int32) : HRESULT
    @lpVtbl.value.scroll.call(this, scrollrect, cliprect, offsetx, offsety)
  end
  def resize(this : IDCompositionVirtualSurface*, width : UInt32, height : UInt32) : HRESULT
    @lpVtbl.value.resize.call(this, width, height)
  end
  def trim(this : IDCompositionVirtualSurface*, rectangles : RECT*, count : UInt32) : HRESULT
    @lpVtbl.value.trim.call(this, rectangles, count)
  end
end
struct LibWin32::IDCompositionDevice2
  def query_interface(this : IDCompositionDevice2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionDevice2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionDevice2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : IDCompositionDevice2*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def wait_for_commit_completion(this : IDCompositionDevice2*) : HRESULT
    @lpVtbl.value.wait_for_commit_completion.call(this)
  end
  def get_frame_statistics(this : IDCompositionDevice2*, statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.call(this, statistics)
  end
  def create_visual(this : IDCompositionDevice2*, visual : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.create_visual.call(this, visual)
  end
  def create_surface_factory(this : IDCompositionDevice2*, renderingdevice : IUnknown, surfacefactory : IDCompositionSurfaceFactory*) : HRESULT
    @lpVtbl.value.create_surface_factory.call(this, renderingdevice, surfacefactory)
  end
  def create_surface(this : IDCompositionDevice2*, width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.call(this, width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(this : IDCompositionDevice2*, initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.call(this, initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_translate_transform(this : IDCompositionDevice2*, translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.call(this, translatetransform)
  end
  def create_scale_transform(this : IDCompositionDevice2*, scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.call(this, scaletransform)
  end
  def create_rotate_transform(this : IDCompositionDevice2*, rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.call(this, rotatetransform)
  end
  def create_skew_transform(this : IDCompositionDevice2*, skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.call(this, skewtransform)
  end
  def create_matrix_transform(this : IDCompositionDevice2*, matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.call(this, matrixtransform)
  end
  def create_transform_group(this : IDCompositionDevice2*, transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.call(this, transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(this : IDCompositionDevice2*, translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.call(this, translatetransform3d)
  end
  def create_scale_transform3_d(this : IDCompositionDevice2*, scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.call(this, scaletransform3d)
  end
  def create_rotate_transform3_d(this : IDCompositionDevice2*, rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.call(this, rotatetransform3d)
  end
  def create_matrix_transform3_d(this : IDCompositionDevice2*, matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.call(this, matrixtransform3d)
  end
  def create_transform3_d_group(this : IDCompositionDevice2*, transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.call(this, transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(this : IDCompositionDevice2*, effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.call(this, effectgroup)
  end
  def create_rectangle_clip(this : IDCompositionDevice2*, clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.call(this, clip)
  end
  def create_animation(this : IDCompositionDevice2*, animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.call(this, animation)
  end
end
struct LibWin32::IDCompositionDesktopDevice
  def query_interface(this : IDCompositionDesktopDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionDesktopDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionDesktopDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : IDCompositionDesktopDevice*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def wait_for_commit_completion(this : IDCompositionDesktopDevice*) : HRESULT
    @lpVtbl.value.wait_for_commit_completion.call(this)
  end
  def get_frame_statistics(this : IDCompositionDesktopDevice*, statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.call(this, statistics)
  end
  def create_visual(this : IDCompositionDesktopDevice*, visual : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.create_visual.call(this, visual)
  end
  def create_surface_factory(this : IDCompositionDesktopDevice*, renderingdevice : IUnknown, surfacefactory : IDCompositionSurfaceFactory*) : HRESULT
    @lpVtbl.value.create_surface_factory.call(this, renderingdevice, surfacefactory)
  end
  def create_surface(this : IDCompositionDesktopDevice*, width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.call(this, width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(this : IDCompositionDesktopDevice*, initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.call(this, initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_translate_transform(this : IDCompositionDesktopDevice*, translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.call(this, translatetransform)
  end
  def create_scale_transform(this : IDCompositionDesktopDevice*, scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.call(this, scaletransform)
  end
  def create_rotate_transform(this : IDCompositionDesktopDevice*, rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.call(this, rotatetransform)
  end
  def create_skew_transform(this : IDCompositionDesktopDevice*, skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.call(this, skewtransform)
  end
  def create_matrix_transform(this : IDCompositionDesktopDevice*, matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.call(this, matrixtransform)
  end
  def create_transform_group(this : IDCompositionDesktopDevice*, transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.call(this, transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(this : IDCompositionDesktopDevice*, translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.call(this, translatetransform3d)
  end
  def create_scale_transform3_d(this : IDCompositionDesktopDevice*, scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.call(this, scaletransform3d)
  end
  def create_rotate_transform3_d(this : IDCompositionDesktopDevice*, rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.call(this, rotatetransform3d)
  end
  def create_matrix_transform3_d(this : IDCompositionDesktopDevice*, matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.call(this, matrixtransform3d)
  end
  def create_transform3_d_group(this : IDCompositionDesktopDevice*, transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.call(this, transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(this : IDCompositionDesktopDevice*, effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.call(this, effectgroup)
  end
  def create_rectangle_clip(this : IDCompositionDesktopDevice*, clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.call(this, clip)
  end
  def create_animation(this : IDCompositionDesktopDevice*, animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.call(this, animation)
  end
  def create_target_for_hwnd(this : IDCompositionDesktopDevice*, hwnd : LibC::HANDLE, topmost : LibC::BOOL, target : IDCompositionTarget*) : HRESULT
    @lpVtbl.value.create_target_for_hwnd.call(this, hwnd, topmost, target)
  end
  def create_surface_from_handle(this : IDCompositionDesktopDevice*, handle : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_handle.call(this, handle, surface)
  end
  def create_surface_from_hwnd(this : IDCompositionDesktopDevice*, hwnd : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_hwnd.call(this, hwnd, surface)
  end
end
struct LibWin32::IDCompositionDeviceDebug
  def query_interface(this : IDCompositionDeviceDebug*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionDeviceDebug*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionDeviceDebug*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable_debug_counters(this : IDCompositionDeviceDebug*) : HRESULT
    @lpVtbl.value.enable_debug_counters.call(this)
  end
  def disable_debug_counters(this : IDCompositionDeviceDebug*) : HRESULT
    @lpVtbl.value.disable_debug_counters.call(this)
  end
end
struct LibWin32::IDCompositionSurfaceFactory
  def query_interface(this : IDCompositionSurfaceFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionSurfaceFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionSurfaceFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_surface(this : IDCompositionSurfaceFactory*, width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.call(this, width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(this : IDCompositionSurfaceFactory*, initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.call(this, initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
end
struct LibWin32::IDCompositionVisual2
  def query_interface(this : IDCompositionVisual2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionVisual2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionVisual2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_offset_x(this : IDCompositionVisual2*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.call(this, animation)
  end
  def set_offset_x2(this : IDCompositionVisual2*, offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.call(this, offsetx)
  end
  def set_offset_y(this : IDCompositionVisual2*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.call(this, animation)
  end
  def set_offset_y2(this : IDCompositionVisual2*, offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.call(this, offsety)
  end
  def set_transform(this : IDCompositionVisual2*, transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.call(this, transform)
  end
  def set_transform2(this : IDCompositionVisual2*, matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.call(this, matrix)
  end
  def set_transform_parent(this : IDCompositionVisual2*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.call(this, visual)
  end
  def set_effect(this : IDCompositionVisual2*, effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.call(this, effect)
  end
  def set_bitmap_interpolation_mode(this : IDCompositionVisual2*, interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.call(this, interpolationmode)
  end
  def set_border_mode(this : IDCompositionVisual2*, bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.call(this, bordermode)
  end
  def set_clip(this : IDCompositionVisual2*, clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.call(this, clip)
  end
  def set_clip2(this : IDCompositionVisual2*, rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.call(this, rect)
  end
  def set_content(this : IDCompositionVisual2*, content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.call(this, content)
  end
  def add_visual(this : IDCompositionVisual2*, visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.call(this, visual, insertabove, referencevisual)
  end
  def remove_visual(this : IDCompositionVisual2*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.call(this, visual)
  end
  def remove_all_visuals(this : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.remove_all_visuals.call(this)
  end
  def set_composite_mode(this : IDCompositionVisual2*, compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.call(this, compositemode)
  end
  def set_opacity_mode(this : IDCompositionVisual2*, mode : DCOMPOSITION_OPACITY_MODE) : HRESULT
    @lpVtbl.value.set_opacity_mode.call(this, mode)
  end
  def set_back_face_visibility(this : IDCompositionVisual2*, visibility : DCOMPOSITION_BACKFACE_VISIBILITY) : HRESULT
    @lpVtbl.value.set_back_face_visibility.call(this, visibility)
  end
end
struct LibWin32::IDCompositionVisualDebug
  def query_interface(this : IDCompositionVisualDebug*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionVisualDebug*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionVisualDebug*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_offset_x(this : IDCompositionVisualDebug*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.call(this, animation)
  end
  def set_offset_x2(this : IDCompositionVisualDebug*, offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.call(this, offsetx)
  end
  def set_offset_y(this : IDCompositionVisualDebug*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.call(this, animation)
  end
  def set_offset_y2(this : IDCompositionVisualDebug*, offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.call(this, offsety)
  end
  def set_transform(this : IDCompositionVisualDebug*, transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.call(this, transform)
  end
  def set_transform2(this : IDCompositionVisualDebug*, matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.call(this, matrix)
  end
  def set_transform_parent(this : IDCompositionVisualDebug*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.call(this, visual)
  end
  def set_effect(this : IDCompositionVisualDebug*, effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.call(this, effect)
  end
  def set_bitmap_interpolation_mode(this : IDCompositionVisualDebug*, interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.call(this, interpolationmode)
  end
  def set_border_mode(this : IDCompositionVisualDebug*, bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.call(this, bordermode)
  end
  def set_clip(this : IDCompositionVisualDebug*, clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.call(this, clip)
  end
  def set_clip2(this : IDCompositionVisualDebug*, rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.call(this, rect)
  end
  def set_content(this : IDCompositionVisualDebug*, content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.call(this, content)
  end
  def add_visual(this : IDCompositionVisualDebug*, visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.call(this, visual, insertabove, referencevisual)
  end
  def remove_visual(this : IDCompositionVisualDebug*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.call(this, visual)
  end
  def remove_all_visuals(this : IDCompositionVisualDebug*) : HRESULT
    @lpVtbl.value.remove_all_visuals.call(this)
  end
  def set_composite_mode(this : IDCompositionVisualDebug*, compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.call(this, compositemode)
  end
  def set_opacity_mode(this : IDCompositionVisualDebug*, mode : DCOMPOSITION_OPACITY_MODE) : HRESULT
    @lpVtbl.value.set_opacity_mode.call(this, mode)
  end
  def set_back_face_visibility(this : IDCompositionVisualDebug*, visibility : DCOMPOSITION_BACKFACE_VISIBILITY) : HRESULT
    @lpVtbl.value.set_back_face_visibility.call(this, visibility)
  end
  def enable_heat_map(this : IDCompositionVisualDebug*, color : D2D1_COLOR_F*) : HRESULT
    @lpVtbl.value.enable_heat_map.call(this, color)
  end
  def disable_heat_map(this : IDCompositionVisualDebug*) : HRESULT
    @lpVtbl.value.disable_heat_map.call(this)
  end
  def enable_redraw_regions(this : IDCompositionVisualDebug*) : HRESULT
    @lpVtbl.value.enable_redraw_regions.call(this)
  end
  def disable_redraw_regions(this : IDCompositionVisualDebug*) : HRESULT
    @lpVtbl.value.disable_redraw_regions.call(this)
  end
end
struct LibWin32::IDCompositionVisual3
  def query_interface(this : IDCompositionVisual3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionVisual3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionVisual3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_offset_x(this : IDCompositionVisual3*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.call(this, animation)
  end
  def set_offset_x2(this : IDCompositionVisual3*, offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.call(this, offsetx)
  end
  def set_offset_y(this : IDCompositionVisual3*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.call(this, animation)
  end
  def set_offset_y2(this : IDCompositionVisual3*, offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.call(this, offsety)
  end
  def set_transform(this : IDCompositionVisual3*, transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.call(this, transform)
  end
  def set_transform2(this : IDCompositionVisual3*, matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.call(this, matrix)
  end
  def set_transform_parent(this : IDCompositionVisual3*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.call(this, visual)
  end
  def set_effect(this : IDCompositionVisual3*, effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.call(this, effect)
  end
  def set_bitmap_interpolation_mode(this : IDCompositionVisual3*, interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.call(this, interpolationmode)
  end
  def set_border_mode(this : IDCompositionVisual3*, bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.call(this, bordermode)
  end
  def set_clip(this : IDCompositionVisual3*, clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.call(this, clip)
  end
  def set_clip2(this : IDCompositionVisual3*, rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.call(this, rect)
  end
  def set_content(this : IDCompositionVisual3*, content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.call(this, content)
  end
  def add_visual(this : IDCompositionVisual3*, visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.call(this, visual, insertabove, referencevisual)
  end
  def remove_visual(this : IDCompositionVisual3*, visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.call(this, visual)
  end
  def remove_all_visuals(this : IDCompositionVisual3*) : HRESULT
    @lpVtbl.value.remove_all_visuals.call(this)
  end
  def set_composite_mode(this : IDCompositionVisual3*, compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.call(this, compositemode)
  end
  def set_opacity_mode(this : IDCompositionVisual3*, mode : DCOMPOSITION_OPACITY_MODE) : HRESULT
    @lpVtbl.value.set_opacity_mode.call(this, mode)
  end
  def set_back_face_visibility(this : IDCompositionVisual3*, visibility : DCOMPOSITION_BACKFACE_VISIBILITY) : HRESULT
    @lpVtbl.value.set_back_face_visibility.call(this, visibility)
  end
  def enable_heat_map(this : IDCompositionVisual3*, color : D2D1_COLOR_F*) : HRESULT
    @lpVtbl.value.enable_heat_map.call(this, color)
  end
  def disable_heat_map(this : IDCompositionVisual3*) : HRESULT
    @lpVtbl.value.disable_heat_map.call(this)
  end
  def enable_redraw_regions(this : IDCompositionVisual3*) : HRESULT
    @lpVtbl.value.enable_redraw_regions.call(this)
  end
  def disable_redraw_regions(this : IDCompositionVisual3*) : HRESULT
    @lpVtbl.value.disable_redraw_regions.call(this)
  end
  def set_depth_mode(this : IDCompositionVisual3*, mode : DCOMPOSITION_DEPTH_MODE) : HRESULT
    @lpVtbl.value.set_depth_mode.call(this, mode)
  end
  def set_offset_z(this : IDCompositionVisual3*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_z.call(this, animation)
  end
  def set_offset_z2(this : IDCompositionVisual3*, offsetz : Float32) : HRESULT
    @lpVtbl.value.set_offset_z2.call(this, offsetz)
  end
  def set_opacity(this : IDCompositionVisual3*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_opacity.call(this, animation)
  end
  def set_opacity2(this : IDCompositionVisual3*, opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity2.call(this, opacity)
  end
  def set_transform3(this : IDCompositionVisual3*, transform : IDCompositionTransform3D) : HRESULT
    @lpVtbl.value.set_transform3.call(this, transform)
  end
  def set_transform22(this : IDCompositionVisual3*, matrix : D2D_MATRIX_4X4_F*) : HRESULT
    @lpVtbl.value.set_transform22.call(this, matrix)
  end
  def set_visible(this : IDCompositionVisual3*, visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_visible.call(this, visible)
  end
end
struct LibWin32::IDCompositionDevice3
  def query_interface(this : IDCompositionDevice3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionDevice3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionDevice3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : IDCompositionDevice3*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def wait_for_commit_completion(this : IDCompositionDevice3*) : HRESULT
    @lpVtbl.value.wait_for_commit_completion.call(this)
  end
  def get_frame_statistics(this : IDCompositionDevice3*, statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.call(this, statistics)
  end
  def create_visual(this : IDCompositionDevice3*, visual : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.create_visual.call(this, visual)
  end
  def create_surface_factory(this : IDCompositionDevice3*, renderingdevice : IUnknown, surfacefactory : IDCompositionSurfaceFactory*) : HRESULT
    @lpVtbl.value.create_surface_factory.call(this, renderingdevice, surfacefactory)
  end
  def create_surface(this : IDCompositionDevice3*, width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.call(this, width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(this : IDCompositionDevice3*, initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.call(this, initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_translate_transform(this : IDCompositionDevice3*, translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.call(this, translatetransform)
  end
  def create_scale_transform(this : IDCompositionDevice3*, scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.call(this, scaletransform)
  end
  def create_rotate_transform(this : IDCompositionDevice3*, rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.call(this, rotatetransform)
  end
  def create_skew_transform(this : IDCompositionDevice3*, skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.call(this, skewtransform)
  end
  def create_matrix_transform(this : IDCompositionDevice3*, matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.call(this, matrixtransform)
  end
  def create_transform_group(this : IDCompositionDevice3*, transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.call(this, transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(this : IDCompositionDevice3*, translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.call(this, translatetransform3d)
  end
  def create_scale_transform3_d(this : IDCompositionDevice3*, scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.call(this, scaletransform3d)
  end
  def create_rotate_transform3_d(this : IDCompositionDevice3*, rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.call(this, rotatetransform3d)
  end
  def create_matrix_transform3_d(this : IDCompositionDevice3*, matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.call(this, matrixtransform3d)
  end
  def create_transform3_d_group(this : IDCompositionDevice3*, transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.call(this, transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(this : IDCompositionDevice3*, effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.call(this, effectgroup)
  end
  def create_rectangle_clip(this : IDCompositionDevice3*, clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.call(this, clip)
  end
  def create_animation(this : IDCompositionDevice3*, animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.call(this, animation)
  end
  def create_gaussian_blur_effect(this : IDCompositionDevice3*, gaussianblureffect : IDCompositionGaussianBlurEffect*) : HRESULT
    @lpVtbl.value.create_gaussian_blur_effect.call(this, gaussianblureffect)
  end
  def create_brightness_effect(this : IDCompositionDevice3*, brightnesseffect : IDCompositionBrightnessEffect*) : HRESULT
    @lpVtbl.value.create_brightness_effect.call(this, brightnesseffect)
  end
  def create_color_matrix_effect(this : IDCompositionDevice3*, colormatrixeffect : IDCompositionColorMatrixEffect*) : HRESULT
    @lpVtbl.value.create_color_matrix_effect.call(this, colormatrixeffect)
  end
  def create_shadow_effect(this : IDCompositionDevice3*, shadoweffect : IDCompositionShadowEffect*) : HRESULT
    @lpVtbl.value.create_shadow_effect.call(this, shadoweffect)
  end
  def create_hue_rotation_effect(this : IDCompositionDevice3*, huerotationeffect : IDCompositionHueRotationEffect*) : HRESULT
    @lpVtbl.value.create_hue_rotation_effect.call(this, huerotationeffect)
  end
  def create_saturation_effect(this : IDCompositionDevice3*, saturationeffect : IDCompositionSaturationEffect*) : HRESULT
    @lpVtbl.value.create_saturation_effect.call(this, saturationeffect)
  end
  def create_turbulence_effect(this : IDCompositionDevice3*, turbulenceeffect : IDCompositionTurbulenceEffect*) : HRESULT
    @lpVtbl.value.create_turbulence_effect.call(this, turbulenceeffect)
  end
  def create_linear_transfer_effect(this : IDCompositionDevice3*, lineartransfereffect : IDCompositionLinearTransferEffect*) : HRESULT
    @lpVtbl.value.create_linear_transfer_effect.call(this, lineartransfereffect)
  end
  def create_table_transfer_effect(this : IDCompositionDevice3*, tabletransfereffect : IDCompositionTableTransferEffect*) : HRESULT
    @lpVtbl.value.create_table_transfer_effect.call(this, tabletransfereffect)
  end
  def create_composite_effect(this : IDCompositionDevice3*, compositeeffect : IDCompositionCompositeEffect*) : HRESULT
    @lpVtbl.value.create_composite_effect.call(this, compositeeffect)
  end
  def create_blend_effect(this : IDCompositionDevice3*, blendeffect : IDCompositionBlendEffect*) : HRESULT
    @lpVtbl.value.create_blend_effect.call(this, blendeffect)
  end
  def create_arithmetic_composite_effect(this : IDCompositionDevice3*, arithmeticcompositeeffect : IDCompositionArithmeticCompositeEffect*) : HRESULT
    @lpVtbl.value.create_arithmetic_composite_effect.call(this, arithmeticcompositeeffect)
  end
  def create_affine_transform2_d_effect(this : IDCompositionDevice3*, affinetransform2deffect : IDCompositionAffineTransform2DEffect*) : HRESULT
    @lpVtbl.value.create_affine_transform2_d_effect.call(this, affinetransform2deffect)
  end
end
struct LibWin32::IDCompositionFilterEffect
  def query_interface(this : IDCompositionFilterEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionFilterEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionFilterEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionFilterEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
end
struct LibWin32::IDCompositionGaussianBlurEffect
  def query_interface(this : IDCompositionGaussianBlurEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionGaussianBlurEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionGaussianBlurEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionGaussianBlurEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_standard_deviation(this : IDCompositionGaussianBlurEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_standard_deviation.call(this, animation)
  end
  def set_standard_deviation2(this : IDCompositionGaussianBlurEffect*, amount : Float32) : HRESULT
    @lpVtbl.value.set_standard_deviation2.call(this, amount)
  end
  def set_border_mode(this : IDCompositionGaussianBlurEffect*, mode : D2D1_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.call(this, mode)
  end
end
struct LibWin32::IDCompositionBrightnessEffect
  def query_interface(this : IDCompositionBrightnessEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionBrightnessEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionBrightnessEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionBrightnessEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_white_point(this : IDCompositionBrightnessEffect*, whitepoint : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_white_point.call(this, whitepoint)
  end
  def set_black_point(this : IDCompositionBrightnessEffect*, blackpoint : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_black_point.call(this, blackpoint)
  end
  def set_white_point_x(this : IDCompositionBrightnessEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_white_point_x.call(this, animation)
  end
  def set_white_point_x2(this : IDCompositionBrightnessEffect*, whitepointx : Float32) : HRESULT
    @lpVtbl.value.set_white_point_x2.call(this, whitepointx)
  end
  def set_white_point_y(this : IDCompositionBrightnessEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_white_point_y.call(this, animation)
  end
  def set_white_point_y2(this : IDCompositionBrightnessEffect*, whitepointy : Float32) : HRESULT
    @lpVtbl.value.set_white_point_y2.call(this, whitepointy)
  end
  def set_black_point_x(this : IDCompositionBrightnessEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_black_point_x.call(this, animation)
  end
  def set_black_point_x2(this : IDCompositionBrightnessEffect*, blackpointx : Float32) : HRESULT
    @lpVtbl.value.set_black_point_x2.call(this, blackpointx)
  end
  def set_black_point_y(this : IDCompositionBrightnessEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_black_point_y.call(this, animation)
  end
  def set_black_point_y2(this : IDCompositionBrightnessEffect*, blackpointy : Float32) : HRESULT
    @lpVtbl.value.set_black_point_y2.call(this, blackpointy)
  end
end
struct LibWin32::IDCompositionColorMatrixEffect
  def query_interface(this : IDCompositionColorMatrixEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionColorMatrixEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionColorMatrixEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionColorMatrixEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_matrix(this : IDCompositionColorMatrixEffect*, matrix : D2D_MATRIX_5X4_F*) : HRESULT
    @lpVtbl.value.set_matrix.call(this, matrix)
  end
  def set_matrix_element(this : IDCompositionColorMatrixEffect*, row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_matrix_element.call(this, row, column, animation)
  end
  def set_matrix_element2(this : IDCompositionColorMatrixEffect*, row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_matrix_element2.call(this, row, column, value)
  end
  def set_alpha_mode(this : IDCompositionColorMatrixEffect*, mode : D2D1_COLORMATRIX_ALPHA_MODE) : HRESULT
    @lpVtbl.value.set_alpha_mode.call(this, mode)
  end
  def set_clamp_output(this : IDCompositionColorMatrixEffect*, clamp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.call(this, clamp)
  end
end
struct LibWin32::IDCompositionShadowEffect
  def query_interface(this : IDCompositionShadowEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionShadowEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionShadowEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionShadowEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_standard_deviation(this : IDCompositionShadowEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_standard_deviation.call(this, animation)
  end
  def set_standard_deviation2(this : IDCompositionShadowEffect*, amount : Float32) : HRESULT
    @lpVtbl.value.set_standard_deviation2.call(this, amount)
  end
  def set_color(this : IDCompositionShadowEffect*, color : D2D_VECTOR_4F*) : HRESULT
    @lpVtbl.value.set_color.call(this, color)
  end
  def set_red(this : IDCompositionShadowEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red.call(this, animation)
  end
  def set_red2(this : IDCompositionShadowEffect*, amount : Float32) : HRESULT
    @lpVtbl.value.set_red2.call(this, amount)
  end
  def set_green(this : IDCompositionShadowEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green.call(this, animation)
  end
  def set_green2(this : IDCompositionShadowEffect*, amount : Float32) : HRESULT
    @lpVtbl.value.set_green2.call(this, amount)
  end
  def set_blue(this : IDCompositionShadowEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue.call(this, animation)
  end
  def set_blue2(this : IDCompositionShadowEffect*, amount : Float32) : HRESULT
    @lpVtbl.value.set_blue2.call(this, amount)
  end
  def set_alpha(this : IDCompositionShadowEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha.call(this, animation)
  end
  def set_alpha2(this : IDCompositionShadowEffect*, amount : Float32) : HRESULT
    @lpVtbl.value.set_alpha2.call(this, amount)
  end
end
struct LibWin32::IDCompositionHueRotationEffect
  def query_interface(this : IDCompositionHueRotationEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionHueRotationEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionHueRotationEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionHueRotationEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_angle(this : IDCompositionHueRotationEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle.call(this, animation)
  end
  def set_angle2(this : IDCompositionHueRotationEffect*, amountdegrees : Float32) : HRESULT
    @lpVtbl.value.set_angle2.call(this, amountdegrees)
  end
end
struct LibWin32::IDCompositionSaturationEffect
  def query_interface(this : IDCompositionSaturationEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionSaturationEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionSaturationEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionSaturationEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_saturation(this : IDCompositionSaturationEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_saturation.call(this, animation)
  end
  def set_saturation2(this : IDCompositionSaturationEffect*, ratio : Float32) : HRESULT
    @lpVtbl.value.set_saturation2.call(this, ratio)
  end
end
struct LibWin32::IDCompositionTurbulenceEffect
  def query_interface(this : IDCompositionTurbulenceEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTurbulenceEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTurbulenceEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionTurbulenceEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_offset(this : IDCompositionTurbulenceEffect*, offset : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_offset.call(this, offset)
  end
  def set_base_frequency(this : IDCompositionTurbulenceEffect*, frequency : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_base_frequency.call(this, frequency)
  end
  def set_size(this : IDCompositionTurbulenceEffect*, size : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_size.call(this, size)
  end
  def set_num_octaves(this : IDCompositionTurbulenceEffect*, numoctaves : UInt32) : HRESULT
    @lpVtbl.value.set_num_octaves.call(this, numoctaves)
  end
  def set_seed(this : IDCompositionTurbulenceEffect*, seed : UInt32) : HRESULT
    @lpVtbl.value.set_seed.call(this, seed)
  end
  def set_noise(this : IDCompositionTurbulenceEffect*, noise : D2D1_TURBULENCE_NOISE) : HRESULT
    @lpVtbl.value.set_noise.call(this, noise)
  end
  def set_stitchable(this : IDCompositionTurbulenceEffect*, stitchable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_stitchable.call(this, stitchable)
  end
end
struct LibWin32::IDCompositionLinearTransferEffect
  def query_interface(this : IDCompositionLinearTransferEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionLinearTransferEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionLinearTransferEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionLinearTransferEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_red_y_intercept(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red_y_intercept.call(this, animation)
  end
  def set_red_y_intercept2(this : IDCompositionLinearTransferEffect*, redyintercept : Float32) : HRESULT
    @lpVtbl.value.set_red_y_intercept2.call(this, redyintercept)
  end
  def set_red_slope(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red_slope.call(this, animation)
  end
  def set_red_slope2(this : IDCompositionLinearTransferEffect*, redslope : Float32) : HRESULT
    @lpVtbl.value.set_red_slope2.call(this, redslope)
  end
  def set_red_disable(this : IDCompositionLinearTransferEffect*, reddisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_red_disable.call(this, reddisable)
  end
  def set_green_y_intercept(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green_y_intercept.call(this, animation)
  end
  def set_green_y_intercept2(this : IDCompositionLinearTransferEffect*, greenyintercept : Float32) : HRESULT
    @lpVtbl.value.set_green_y_intercept2.call(this, greenyintercept)
  end
  def set_green_slope(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green_slope.call(this, animation)
  end
  def set_green_slope2(this : IDCompositionLinearTransferEffect*, greenslope : Float32) : HRESULT
    @lpVtbl.value.set_green_slope2.call(this, greenslope)
  end
  def set_green_disable(this : IDCompositionLinearTransferEffect*, greendisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_green_disable.call(this, greendisable)
  end
  def set_blue_y_intercept(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue_y_intercept.call(this, animation)
  end
  def set_blue_y_intercept2(this : IDCompositionLinearTransferEffect*, blueyintercept : Float32) : HRESULT
    @lpVtbl.value.set_blue_y_intercept2.call(this, blueyintercept)
  end
  def set_blue_slope(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue_slope.call(this, animation)
  end
  def set_blue_slope2(this : IDCompositionLinearTransferEffect*, blueslope : Float32) : HRESULT
    @lpVtbl.value.set_blue_slope2.call(this, blueslope)
  end
  def set_blue_disable(this : IDCompositionLinearTransferEffect*, bluedisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_blue_disable.call(this, bluedisable)
  end
  def set_alpha_y_intercept(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha_y_intercept.call(this, animation)
  end
  def set_alpha_y_intercept2(this : IDCompositionLinearTransferEffect*, alphayintercept : Float32) : HRESULT
    @lpVtbl.value.set_alpha_y_intercept2.call(this, alphayintercept)
  end
  def set_alpha_slope(this : IDCompositionLinearTransferEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha_slope.call(this, animation)
  end
  def set_alpha_slope2(this : IDCompositionLinearTransferEffect*, alphaslope : Float32) : HRESULT
    @lpVtbl.value.set_alpha_slope2.call(this, alphaslope)
  end
  def set_alpha_disable(this : IDCompositionLinearTransferEffect*, alphadisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_alpha_disable.call(this, alphadisable)
  end
  def set_clamp_output(this : IDCompositionLinearTransferEffect*, clampoutput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.call(this, clampoutput)
  end
end
struct LibWin32::IDCompositionTableTransferEffect
  def query_interface(this : IDCompositionTableTransferEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionTableTransferEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionTableTransferEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionTableTransferEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_red_table(this : IDCompositionTableTransferEffect*, tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_red_table.call(this, tablevalues, count)
  end
  def set_green_table(this : IDCompositionTableTransferEffect*, tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_green_table.call(this, tablevalues, count)
  end
  def set_blue_table(this : IDCompositionTableTransferEffect*, tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_blue_table.call(this, tablevalues, count)
  end
  def set_alpha_table(this : IDCompositionTableTransferEffect*, tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_alpha_table.call(this, tablevalues, count)
  end
  def set_red_disable(this : IDCompositionTableTransferEffect*, reddisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_red_disable.call(this, reddisable)
  end
  def set_green_disable(this : IDCompositionTableTransferEffect*, greendisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_green_disable.call(this, greendisable)
  end
  def set_blue_disable(this : IDCompositionTableTransferEffect*, bluedisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_blue_disable.call(this, bluedisable)
  end
  def set_alpha_disable(this : IDCompositionTableTransferEffect*, alphadisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_alpha_disable.call(this, alphadisable)
  end
  def set_clamp_output(this : IDCompositionTableTransferEffect*, clampoutput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.call(this, clampoutput)
  end
  def set_red_table_value(this : IDCompositionTableTransferEffect*, index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red_table_value.call(this, index, animation)
  end
  def set_red_table_value2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_red_table_value2.call(this, index, value)
  end
  def set_green_table_value(this : IDCompositionTableTransferEffect*, index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green_table_value.call(this, index, animation)
  end
  def set_green_table_value2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_green_table_value2.call(this, index, value)
  end
  def set_blue_table_value(this : IDCompositionTableTransferEffect*, index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue_table_value.call(this, index, animation)
  end
  def set_blue_table_value2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_blue_table_value2.call(this, index, value)
  end
  def set_alpha_table_value(this : IDCompositionTableTransferEffect*, index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha_table_value.call(this, index, animation)
  end
  def set_alpha_table_value2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_alpha_table_value2.call(this, index, value)
  end
end
struct LibWin32::IDCompositionCompositeEffect
  def query_interface(this : IDCompositionCompositeEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionCompositeEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionCompositeEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionCompositeEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_mode(this : IDCompositionCompositeEffect*, mode : D2D1_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_mode.call(this, mode)
  end
end
struct LibWin32::IDCompositionBlendEffect
  def query_interface(this : IDCompositionBlendEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionBlendEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionBlendEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionBlendEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_mode(this : IDCompositionBlendEffect*, mode : D2D1_BLEND_MODE) : HRESULT
    @lpVtbl.value.set_mode.call(this, mode)
  end
end
struct LibWin32::IDCompositionArithmeticCompositeEffect
  def query_interface(this : IDCompositionArithmeticCompositeEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionArithmeticCompositeEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionArithmeticCompositeEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionArithmeticCompositeEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_coefficients(this : IDCompositionArithmeticCompositeEffect*, coefficients : D2D_VECTOR_4F*) : HRESULT
    @lpVtbl.value.set_coefficients.call(this, coefficients)
  end
  def set_clamp_output(this : IDCompositionArithmeticCompositeEffect*, clampoutput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.call(this, clampoutput)
  end
  def set_coefficient1(this : IDCompositionArithmeticCompositeEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient1.call(this, animation)
  end
  def set_coefficient12(this : IDCompositionArithmeticCompositeEffect*, coeffcient1 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient12.call(this, coeffcient1)
  end
  def set_coefficient2(this : IDCompositionArithmeticCompositeEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient2.call(this, animation)
  end
  def set_coefficient22(this : IDCompositionArithmeticCompositeEffect*, coefficient2 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient22.call(this, coefficient2)
  end
  def set_coefficient3(this : IDCompositionArithmeticCompositeEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient3.call(this, animation)
  end
  def set_coefficient32(this : IDCompositionArithmeticCompositeEffect*, coefficient3 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient32.call(this, coefficient3)
  end
  def set_coefficient4(this : IDCompositionArithmeticCompositeEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient4.call(this, animation)
  end
  def set_coefficient42(this : IDCompositionArithmeticCompositeEffect*, coefficient4 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient42.call(this, coefficient4)
  end
end
struct LibWin32::IDCompositionAffineTransform2DEffect
  def query_interface(this : IDCompositionAffineTransform2DEffect*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionAffineTransform2DEffect*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionAffineTransform2DEffect*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_input(this : IDCompositionAffineTransform2DEffect*, index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.call(this, index, input, flags)
  end
  def set_interpolation_mode(this : IDCompositionAffineTransform2DEffect*, interpolationmode : D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_interpolation_mode.call(this, interpolationmode)
  end
  def set_border_mode(this : IDCompositionAffineTransform2DEffect*, bordermode : D2D1_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.call(this, bordermode)
  end
  def set_transform_matrix(this : IDCompositionAffineTransform2DEffect*, transformmatrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform_matrix.call(this, transformmatrix)
  end
  def set_transform_matrix_element(this : IDCompositionAffineTransform2DEffect*, row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_transform_matrix_element.call(this, row, column, animation)
  end
  def set_transform_matrix_element2(this : IDCompositionAffineTransform2DEffect*, row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_transform_matrix_element2.call(this, row, column, value)
  end
  def set_sharpness(this : IDCompositionAffineTransform2DEffect*, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_sharpness.call(this, animation)
  end
  def set_sharpness2(this : IDCompositionAffineTransform2DEffect*, sharpness : Float32) : HRESULT
    @lpVtbl.value.set_sharpness2.call(this, sharpness)
  end
end
struct LibWin32::IDCompositionDelegatedInkTrail
  def query_interface(this : IDCompositionDelegatedInkTrail*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionDelegatedInkTrail*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionDelegatedInkTrail*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_trail_points(this : IDCompositionDelegatedInkTrail*, inkpoints : DCompositionInkTrailPoint*, inkpointscount : UInt32, generationid : UInt32*) : HRESULT
    @lpVtbl.value.add_trail_points.call(this, inkpoints, inkpointscount, generationid)
  end
  def add_trail_points_with_prediction(this : IDCompositionDelegatedInkTrail*, inkpoints : DCompositionInkTrailPoint*, inkpointscount : UInt32, predictedinkpoints : DCompositionInkTrailPoint*, predictedinkpointscount : UInt32, generationid : UInt32*) : HRESULT
    @lpVtbl.value.add_trail_points_with_prediction.call(this, inkpoints, inkpointscount, predictedinkpoints, predictedinkpointscount, generationid)
  end
  def remove_trail_points(this : IDCompositionDelegatedInkTrail*, generationid : UInt32) : HRESULT
    @lpVtbl.value.remove_trail_points.call(this, generationid)
  end
  def start_new_trail(this : IDCompositionDelegatedInkTrail*, color : D2D1_COLOR_F*) : HRESULT
    @lpVtbl.value.start_new_trail.call(this, color)
  end
end
struct LibWin32::IDCompositionInkTrailDevice
  def query_interface(this : IDCompositionInkTrailDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDCompositionInkTrailDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDCompositionInkTrailDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_delegated_ink_trail(this : IDCompositionInkTrailDevice*, inktrail : IDCompositionDelegatedInkTrail*) : HRESULT
    @lpVtbl.value.create_delegated_ink_trail.call(this, inktrail)
  end
  def create_delegated_ink_trail_for_swap_chain(this : IDCompositionInkTrailDevice*, swapchain : IUnknown, inktrail : IDCompositionDelegatedInkTrail*) : HRESULT
    @lpVtbl.value.create_delegated_ink_trail_for_swap_chain.call(this, swapchain, inktrail)
  end
end
