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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reset : UInt64
    set_absolute_begin_time : UInt64
    add_cubic : UInt64
    add_sinusoidal : UInt64
    add_repeat : UInt64
    end_ : UInt64
  end

  IDCompositionAnimation_GUID = "cbfd91d9-51b2-45e4-b3de-d19ccfb863c5"
  IID_IDCompositionAnimation = LibC::GUID.new(0xcbfd91d9_u32, 0x51b2_u16, 0x45e4_u16, StaticArray[0xb3_u8, 0xde_u8, 0xd1_u8, 0x9c_u8, 0xcf_u8, 0xb8_u8, 0x63_u8, 0xc5_u8])
  struct IDCompositionAnimation
    lpVtbl : IDCompositionAnimationVTbl*
  end

  struct IDCompositionDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    wait_for_commit_completion : UInt64
    get_frame_statistics : UInt64
    create_target_for_hwnd : UInt64
    create_visual : UInt64
    create_surface : UInt64
    create_virtual_surface : UInt64
    create_surface_from_handle : UInt64
    create_surface_from_hwnd : UInt64
    create_translate_transform : UInt64
    create_scale_transform : UInt64
    create_rotate_transform : UInt64
    create_skew_transform : UInt64
    create_matrix_transform : UInt64
    create_transform_group : UInt64
    create_translate_transform3_d : UInt64
    create_scale_transform3_d : UInt64
    create_rotate_transform3_d : UInt64
    create_matrix_transform3_d : UInt64
    create_transform3_d_group : UInt64
    create_effect_group : UInt64
    create_rectangle_clip : UInt64
    create_animation : UInt64
    check_device_state : UInt64
  end

  IDCompositionDevice_GUID = "c37ea93a-e7aa-450d-b16f-9746cb0407f3"
  IID_IDCompositionDevice = LibC::GUID.new(0xc37ea93a_u32, 0xe7aa_u16, 0x450d_u16, StaticArray[0xb1_u8, 0x6f_u8, 0x97_u8, 0x46_u8, 0xcb_u8, 0x4_u8, 0x7_u8, 0xf3_u8])
  struct IDCompositionDevice
    lpVtbl : IDCompositionDeviceVTbl*
  end

  struct IDCompositionTargetVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_root : UInt64
  end

  IDCompositionTarget_GUID = "eacdd04c-117e-4e17-88f4-d1b12b0e3d89"
  IID_IDCompositionTarget = LibC::GUID.new(0xeacdd04c_u32, 0x117e_u16, 0x4e17_u16, StaticArray[0x88_u8, 0xf4_u8, 0xd1_u8, 0xb1_u8, 0x2b_u8, 0xe_u8, 0x3d_u8, 0x89_u8])
  struct IDCompositionTarget
    lpVtbl : IDCompositionTargetVTbl*
  end

  struct IDCompositionVisualVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_offset_x : UInt64
    set_offset_x2 : UInt64
    set_offset_y : UInt64
    set_offset_y2 : UInt64
    set_transform : UInt64
    set_transform2 : UInt64
    set_transform_parent : UInt64
    set_effect : UInt64
    set_bitmap_interpolation_mode : UInt64
    set_border_mode : UInt64
    set_clip : UInt64
    set_clip2 : UInt64
    set_content : UInt64
    add_visual : UInt64
    remove_visual : UInt64
    remove_all_visuals : UInt64
    set_composite_mode : UInt64
  end

  IDCompositionVisual_GUID = "4d93059d-097b-4651-9a60-f0f25116e2f3"
  IID_IDCompositionVisual = LibC::GUID.new(0x4d93059d_u32, 0x97b_u16, 0x4651_u16, StaticArray[0x9a_u8, 0x60_u8, 0xf0_u8, 0xf2_u8, 0x51_u8, 0x16_u8, 0xe2_u8, 0xf3_u8])
  struct IDCompositionVisual
    lpVtbl : IDCompositionVisualVTbl*
  end

  struct IDCompositionEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IDCompositionEffect_GUID = "ec81b08f-bfcb-4e8d-b193-a915587999e8"
  IID_IDCompositionEffect = LibC::GUID.new(0xec81b08f_u32, 0xbfcb_u16, 0x4e8d_u16, StaticArray[0xb1_u8, 0x93_u8, 0xa9_u8, 0x15_u8, 0x58_u8, 0x79_u8, 0x99_u8, 0xe8_u8])
  struct IDCompositionEffect
    lpVtbl : IDCompositionEffectVTbl*
  end

  struct IDCompositionTransform3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IDCompositionTransform3D_GUID = "71185722-246b-41f2-aad1-0443f7f4bfc2"
  IID_IDCompositionTransform3D = LibC::GUID.new(0x71185722_u32, 0x246b_u16, 0x41f2_u16, StaticArray[0xaa_u8, 0xd1_u8, 0x4_u8, 0x43_u8, 0xf7_u8, 0xf4_u8, 0xbf_u8, 0xc2_u8])
  struct IDCompositionTransform3D
    lpVtbl : IDCompositionTransform3DVTbl*
  end

  struct IDCompositionTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IDCompositionTransform_GUID = "fd55faa7-37e0-4c20-95d2-9be45bc33f55"
  IID_IDCompositionTransform = LibC::GUID.new(0xfd55faa7_u32, 0x37e0_u16, 0x4c20_u16, StaticArray[0x95_u8, 0xd2_u8, 0x9b_u8, 0xe4_u8, 0x5b_u8, 0xc3_u8, 0x3f_u8, 0x55_u8])
  struct IDCompositionTransform
    lpVtbl : IDCompositionTransformVTbl*
  end

  struct IDCompositionTranslateTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_offset_x : UInt64
    set_offset_x2 : UInt64
    set_offset_y : UInt64
    set_offset_y2 : UInt64
  end

  IDCompositionTranslateTransform_GUID = "06791122-c6f0-417d-8323-269e987f5954"
  IID_IDCompositionTranslateTransform = LibC::GUID.new(0x6791122_u32, 0xc6f0_u16, 0x417d_u16, StaticArray[0x83_u8, 0x23_u8, 0x26_u8, 0x9e_u8, 0x98_u8, 0x7f_u8, 0x59_u8, 0x54_u8])
  struct IDCompositionTranslateTransform
    lpVtbl : IDCompositionTranslateTransformVTbl*
  end

  struct IDCompositionScaleTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_scale_x : UInt64
    set_scale_x2 : UInt64
    set_scale_y : UInt64
    set_scale_y2 : UInt64
    set_center_x : UInt64
    set_center_x2 : UInt64
    set_center_y : UInt64
    set_center_y2 : UInt64
  end

  IDCompositionScaleTransform_GUID = "71fde914-40ef-45ef-bd51-68b037c339f9"
  IID_IDCompositionScaleTransform = LibC::GUID.new(0x71fde914_u32, 0x40ef_u16, 0x45ef_u16, StaticArray[0xbd_u8, 0x51_u8, 0x68_u8, 0xb0_u8, 0x37_u8, 0xc3_u8, 0x39_u8, 0xf9_u8])
  struct IDCompositionScaleTransform
    lpVtbl : IDCompositionScaleTransformVTbl*
  end

  struct IDCompositionRotateTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_angle : UInt64
    set_angle2 : UInt64
    set_center_x : UInt64
    set_center_x2 : UInt64
    set_center_y : UInt64
    set_center_y2 : UInt64
  end

  IDCompositionRotateTransform_GUID = "641ed83c-ae96-46c5-90dc-32774cc5c6d5"
  IID_IDCompositionRotateTransform = LibC::GUID.new(0x641ed83c_u32, 0xae96_u16, 0x46c5_u16, StaticArray[0x90_u8, 0xdc_u8, 0x32_u8, 0x77_u8, 0x4c_u8, 0xc5_u8, 0xc6_u8, 0xd5_u8])
  struct IDCompositionRotateTransform
    lpVtbl : IDCompositionRotateTransformVTbl*
  end

  struct IDCompositionSkewTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_angle_x : UInt64
    set_angle_x2 : UInt64
    set_angle_y : UInt64
    set_angle_y2 : UInt64
    set_center_x : UInt64
    set_center_x2 : UInt64
    set_center_y : UInt64
    set_center_y2 : UInt64
  end

  IDCompositionSkewTransform_GUID = "e57aa735-dcdb-4c72-9c61-0591f58889ee"
  IID_IDCompositionSkewTransform = LibC::GUID.new(0xe57aa735_u32, 0xdcdb_u16, 0x4c72_u16, StaticArray[0x9c_u8, 0x61_u8, 0x5_u8, 0x91_u8, 0xf5_u8, 0x88_u8, 0x89_u8, 0xee_u8])
  struct IDCompositionSkewTransform
    lpVtbl : IDCompositionSkewTransformVTbl*
  end

  struct IDCompositionMatrixTransformVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_matrix : UInt64
    set_matrix_element : UInt64
    set_matrix_element2 : UInt64
  end

  IDCompositionMatrixTransform_GUID = "16cdff07-c503-419c-83f2-0965c7af1fa6"
  IID_IDCompositionMatrixTransform = LibC::GUID.new(0x16cdff07_u32, 0xc503_u16, 0x419c_u16, StaticArray[0x83_u8, 0xf2_u8, 0x9_u8, 0x65_u8, 0xc7_u8, 0xaf_u8, 0x1f_u8, 0xa6_u8])
  struct IDCompositionMatrixTransform
    lpVtbl : IDCompositionMatrixTransformVTbl*
  end

  struct IDCompositionEffectGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_opacity : UInt64
    set_opacity2 : UInt64
    set_transform3_d : UInt64
  end

  IDCompositionEffectGroup_GUID = "a7929a74-e6b2-4bd6-8b95-4040119ca34d"
  IID_IDCompositionEffectGroup = LibC::GUID.new(0xa7929a74_u32, 0xe6b2_u16, 0x4bd6_u16, StaticArray[0x8b_u8, 0x95_u8, 0x40_u8, 0x40_u8, 0x11_u8, 0x9c_u8, 0xa3_u8, 0x4d_u8])
  struct IDCompositionEffectGroup
    lpVtbl : IDCompositionEffectGroupVTbl*
  end

  struct IDCompositionTranslateTransform3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_offset_x : UInt64
    set_offset_x2 : UInt64
    set_offset_y : UInt64
    set_offset_y2 : UInt64
    set_offset_z : UInt64
    set_offset_z2 : UInt64
  end

  IDCompositionTranslateTransform3D_GUID = "91636d4b-9ba1-4532-aaf7-e3344994d788"
  IID_IDCompositionTranslateTransform3D = LibC::GUID.new(0x91636d4b_u32, 0x9ba1_u16, 0x4532_u16, StaticArray[0xaa_u8, 0xf7_u8, 0xe3_u8, 0x34_u8, 0x49_u8, 0x94_u8, 0xd7_u8, 0x88_u8])
  struct IDCompositionTranslateTransform3D
    lpVtbl : IDCompositionTranslateTransform3DVTbl*
  end

  struct IDCompositionScaleTransform3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_scale_x : UInt64
    set_scale_x2 : UInt64
    set_scale_y : UInt64
    set_scale_y2 : UInt64
    set_scale_z : UInt64
    set_scale_z2 : UInt64
    set_center_x : UInt64
    set_center_x2 : UInt64
    set_center_y : UInt64
    set_center_y2 : UInt64
    set_center_z : UInt64
    set_center_z2 : UInt64
  end

  IDCompositionScaleTransform3D_GUID = "2a9e9ead-364b-4b15-a7c4-a1997f78b389"
  IID_IDCompositionScaleTransform3D = LibC::GUID.new(0x2a9e9ead_u32, 0x364b_u16, 0x4b15_u16, StaticArray[0xa7_u8, 0xc4_u8, 0xa1_u8, 0x99_u8, 0x7f_u8, 0x78_u8, 0xb3_u8, 0x89_u8])
  struct IDCompositionScaleTransform3D
    lpVtbl : IDCompositionScaleTransform3DVTbl*
  end

  struct IDCompositionRotateTransform3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_angle : UInt64
    set_angle2 : UInt64
    set_axis_x : UInt64
    set_axis_x2 : UInt64
    set_axis_y : UInt64
    set_axis_y2 : UInt64
    set_axis_z : UInt64
    set_axis_z2 : UInt64
    set_center_x : UInt64
    set_center_x2 : UInt64
    set_center_y : UInt64
    set_center_y2 : UInt64
    set_center_z : UInt64
    set_center_z2 : UInt64
  end

  IDCompositionRotateTransform3D_GUID = "d8f5b23f-d429-4a91-b55a-d2f45fd75b18"
  IID_IDCompositionRotateTransform3D = LibC::GUID.new(0xd8f5b23f_u32, 0xd429_u16, 0x4a91_u16, StaticArray[0xb5_u8, 0x5a_u8, 0xd2_u8, 0xf4_u8, 0x5f_u8, 0xd7_u8, 0x5b_u8, 0x18_u8])
  struct IDCompositionRotateTransform3D
    lpVtbl : IDCompositionRotateTransform3DVTbl*
  end

  struct IDCompositionMatrixTransform3DVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_matrix : UInt64
    set_matrix_element : UInt64
    set_matrix_element2 : UInt64
  end

  IDCompositionMatrixTransform3D_GUID = "4b3363f0-643b-41b7-b6e0-ccf22d34467c"
  IID_IDCompositionMatrixTransform3D = LibC::GUID.new(0x4b3363f0_u32, 0x643b_u16, 0x41b7_u16, StaticArray[0xb6_u8, 0xe0_u8, 0xcc_u8, 0xf2_u8, 0x2d_u8, 0x34_u8, 0x46_u8, 0x7c_u8])
  struct IDCompositionMatrixTransform3D
    lpVtbl : IDCompositionMatrixTransform3DVTbl*
  end

  struct IDCompositionClipVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IDCompositionClip_GUID = "64ac3703-9d3f-45ec-a109-7cac0e7a13a7"
  IID_IDCompositionClip = LibC::GUID.new(0x64ac3703_u32, 0x9d3f_u16, 0x45ec_u16, StaticArray[0xa1_u8, 0x9_u8, 0x7c_u8, 0xac_u8, 0xe_u8, 0x7a_u8, 0x13_u8, 0xa7_u8])
  struct IDCompositionClip
    lpVtbl : IDCompositionClipVTbl*
  end

  struct IDCompositionRectangleClipVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_left : UInt64
    set_left2 : UInt64
    set_top : UInt64
    set_top2 : UInt64
    set_right : UInt64
    set_right2 : UInt64
    set_bottom : UInt64
    set_bottom2 : UInt64
    set_top_left_radius_x : UInt64
    set_top_left_radius_x2 : UInt64
    set_top_left_radius_y : UInt64
    set_top_left_radius_y2 : UInt64
    set_top_right_radius_x : UInt64
    set_top_right_radius_x2 : UInt64
    set_top_right_radius_y : UInt64
    set_top_right_radius_y2 : UInt64
    set_bottom_left_radius_x : UInt64
    set_bottom_left_radius_x2 : UInt64
    set_bottom_left_radius_y : UInt64
    set_bottom_left_radius_y2 : UInt64
    set_bottom_right_radius_x : UInt64
    set_bottom_right_radius_x2 : UInt64
    set_bottom_right_radius_y : UInt64
    set_bottom_right_radius_y2 : UInt64
  end

  IDCompositionRectangleClip_GUID = "9842ad7d-d9cf-4908-aed7-48b51da5e7c2"
  IID_IDCompositionRectangleClip = LibC::GUID.new(0x9842ad7d_u32, 0xd9cf_u16, 0x4908_u16, StaticArray[0xae_u8, 0xd7_u8, 0x48_u8, 0xb5_u8, 0x1d_u8, 0xa5_u8, 0xe7_u8, 0xc2_u8])
  struct IDCompositionRectangleClip
    lpVtbl : IDCompositionRectangleClipVTbl*
  end

  struct IDCompositionSurfaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_draw : UInt64
    end_draw : UInt64
    suspend_draw : UInt64
    resume_draw : UInt64
    scroll : UInt64
  end

  IDCompositionSurface_GUID = "bb8a4953-2c99-4f5a-96f5-4819027fa3ac"
  IID_IDCompositionSurface = LibC::GUID.new(0xbb8a4953_u32, 0x2c99_u16, 0x4f5a_u16, StaticArray[0x96_u8, 0xf5_u8, 0x48_u8, 0x19_u8, 0x2_u8, 0x7f_u8, 0xa3_u8, 0xac_u8])
  struct IDCompositionSurface
    lpVtbl : IDCompositionSurfaceVTbl*
  end

  struct IDCompositionVirtualSurfaceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_draw : UInt64
    end_draw : UInt64
    suspend_draw : UInt64
    resume_draw : UInt64
    scroll : UInt64
    resize : UInt64
    trim : UInt64
  end

  IDCompositionVirtualSurface_GUID = "ae471c51-5f53-4a24-8d3e-d0c39c30b3f0"
  IID_IDCompositionVirtualSurface = LibC::GUID.new(0xae471c51_u32, 0x5f53_u16, 0x4a24_u16, StaticArray[0x8d_u8, 0x3e_u8, 0xd0_u8, 0xc3_u8, 0x9c_u8, 0x30_u8, 0xb3_u8, 0xf0_u8])
  struct IDCompositionVirtualSurface
    lpVtbl : IDCompositionVirtualSurfaceVTbl*
  end

  struct IDCompositionDevice2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    wait_for_commit_completion : UInt64
    get_frame_statistics : UInt64
    create_visual : UInt64
    create_surface_factory : UInt64
    create_surface : UInt64
    create_virtual_surface : UInt64
    create_translate_transform : UInt64
    create_scale_transform : UInt64
    create_rotate_transform : UInt64
    create_skew_transform : UInt64
    create_matrix_transform : UInt64
    create_transform_group : UInt64
    create_translate_transform3_d : UInt64
    create_scale_transform3_d : UInt64
    create_rotate_transform3_d : UInt64
    create_matrix_transform3_d : UInt64
    create_transform3_d_group : UInt64
    create_effect_group : UInt64
    create_rectangle_clip : UInt64
    create_animation : UInt64
  end

  IDCompositionDevice2_GUID = "75f6468d-1b8e-447c-9bc6-75fea80b5b25"
  IID_IDCompositionDevice2 = LibC::GUID.new(0x75f6468d_u32, 0x1b8e_u16, 0x447c_u16, StaticArray[0x9b_u8, 0xc6_u8, 0x75_u8, 0xfe_u8, 0xa8_u8, 0xb_u8, 0x5b_u8, 0x25_u8])
  struct IDCompositionDevice2
    lpVtbl : IDCompositionDevice2VTbl*
  end

  struct IDCompositionDesktopDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    wait_for_commit_completion : UInt64
    get_frame_statistics : UInt64
    create_visual : UInt64
    create_surface_factory : UInt64
    create_surface : UInt64
    create_virtual_surface : UInt64
    create_translate_transform : UInt64
    create_scale_transform : UInt64
    create_rotate_transform : UInt64
    create_skew_transform : UInt64
    create_matrix_transform : UInt64
    create_transform_group : UInt64
    create_translate_transform3_d : UInt64
    create_scale_transform3_d : UInt64
    create_rotate_transform3_d : UInt64
    create_matrix_transform3_d : UInt64
    create_transform3_d_group : UInt64
    create_effect_group : UInt64
    create_rectangle_clip : UInt64
    create_animation : UInt64
    create_target_for_hwnd : UInt64
    create_surface_from_handle : UInt64
    create_surface_from_hwnd : UInt64
  end

  IDCompositionDesktopDevice_GUID = "5f4633fe-1e08-4cb8-8c75-ce24333f5602"
  IID_IDCompositionDesktopDevice = LibC::GUID.new(0x5f4633fe_u32, 0x1e08_u16, 0x4cb8_u16, StaticArray[0x8c_u8, 0x75_u8, 0xce_u8, 0x24_u8, 0x33_u8, 0x3f_u8, 0x56_u8, 0x2_u8])
  struct IDCompositionDesktopDevice
    lpVtbl : IDCompositionDesktopDeviceVTbl*
  end

  struct IDCompositionDeviceDebugVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable_debug_counters : UInt64
    disable_debug_counters : UInt64
  end

  IDCompositionDeviceDebug_GUID = "a1a3c64a-224f-4a81-9773-4f03a89d3c6c"
  IID_IDCompositionDeviceDebug = LibC::GUID.new(0xa1a3c64a_u32, 0x224f_u16, 0x4a81_u16, StaticArray[0x97_u8, 0x73_u8, 0x4f_u8, 0x3_u8, 0xa8_u8, 0x9d_u8, 0x3c_u8, 0x6c_u8])
  struct IDCompositionDeviceDebug
    lpVtbl : IDCompositionDeviceDebugVTbl*
  end

  struct IDCompositionSurfaceFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_surface : UInt64
    create_virtual_surface : UInt64
  end

  IDCompositionSurfaceFactory_GUID = "e334bc12-3937-4e02-85eb-fcf4eb30d2c8"
  IID_IDCompositionSurfaceFactory = LibC::GUID.new(0xe334bc12_u32, 0x3937_u16, 0x4e02_u16, StaticArray[0x85_u8, 0xeb_u8, 0xfc_u8, 0xf4_u8, 0xeb_u8, 0x30_u8, 0xd2_u8, 0xc8_u8])
  struct IDCompositionSurfaceFactory
    lpVtbl : IDCompositionSurfaceFactoryVTbl*
  end

  struct IDCompositionVisual2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_offset_x : UInt64
    set_offset_x2 : UInt64
    set_offset_y : UInt64
    set_offset_y2 : UInt64
    set_transform : UInt64
    set_transform2 : UInt64
    set_transform_parent : UInt64
    set_effect : UInt64
    set_bitmap_interpolation_mode : UInt64
    set_border_mode : UInt64
    set_clip : UInt64
    set_clip2 : UInt64
    set_content : UInt64
    add_visual : UInt64
    remove_visual : UInt64
    remove_all_visuals : UInt64
    set_composite_mode : UInt64
    set_opacity_mode : UInt64
    set_back_face_visibility : UInt64
  end

  IDCompositionVisual2_GUID = "e8de1639-4331-4b26-bc5f-6a321d347a85"
  IID_IDCompositionVisual2 = LibC::GUID.new(0xe8de1639_u32, 0x4331_u16, 0x4b26_u16, StaticArray[0xbc_u8, 0x5f_u8, 0x6a_u8, 0x32_u8, 0x1d_u8, 0x34_u8, 0x7a_u8, 0x85_u8])
  struct IDCompositionVisual2
    lpVtbl : IDCompositionVisual2VTbl*
  end

  struct IDCompositionVisualDebugVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_offset_x : UInt64
    set_offset_x2 : UInt64
    set_offset_y : UInt64
    set_offset_y2 : UInt64
    set_transform : UInt64
    set_transform2 : UInt64
    set_transform_parent : UInt64
    set_effect : UInt64
    set_bitmap_interpolation_mode : UInt64
    set_border_mode : UInt64
    set_clip : UInt64
    set_clip2 : UInt64
    set_content : UInt64
    add_visual : UInt64
    remove_visual : UInt64
    remove_all_visuals : UInt64
    set_composite_mode : UInt64
    set_opacity_mode : UInt64
    set_back_face_visibility : UInt64
    enable_heat_map : UInt64
    disable_heat_map : UInt64
    enable_redraw_regions : UInt64
    disable_redraw_regions : UInt64
  end

  IDCompositionVisualDebug_GUID = "fed2b808-5eb4-43a0-aea3-35f65280f91b"
  IID_IDCompositionVisualDebug = LibC::GUID.new(0xfed2b808_u32, 0x5eb4_u16, 0x43a0_u16, StaticArray[0xae_u8, 0xa3_u8, 0x35_u8, 0xf6_u8, 0x52_u8, 0x80_u8, 0xf9_u8, 0x1b_u8])
  struct IDCompositionVisualDebug
    lpVtbl : IDCompositionVisualDebugVTbl*
  end

  struct IDCompositionVisual3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_offset_x : UInt64
    set_offset_x2 : UInt64
    set_offset_y : UInt64
    set_offset_y2 : UInt64
    set_transform : UInt64
    set_transform2 : UInt64
    set_transform_parent : UInt64
    set_effect : UInt64
    set_bitmap_interpolation_mode : UInt64
    set_border_mode : UInt64
    set_clip : UInt64
    set_clip2 : UInt64
    set_content : UInt64
    add_visual : UInt64
    remove_visual : UInt64
    remove_all_visuals : UInt64
    set_composite_mode : UInt64
    set_opacity_mode : UInt64
    set_back_face_visibility : UInt64
    enable_heat_map : UInt64
    disable_heat_map : UInt64
    enable_redraw_regions : UInt64
    disable_redraw_regions : UInt64
    set_depth_mode : UInt64
    set_offset_z : UInt64
    set_offset_z2 : UInt64
    set_opacity : UInt64
    set_opacity2 : UInt64
    set_transform3 : UInt64
    set_transform22 : UInt64
    set_visible : UInt64
  end

  IDCompositionVisual3_GUID = "2775f462-b6c1-4015-b0be-b3e7d6a4976d"
  IID_IDCompositionVisual3 = LibC::GUID.new(0x2775f462_u32, 0xb6c1_u16, 0x4015_u16, StaticArray[0xb0_u8, 0xbe_u8, 0xb3_u8, 0xe7_u8, 0xd6_u8, 0xa4_u8, 0x97_u8, 0x6d_u8])
  struct IDCompositionVisual3
    lpVtbl : IDCompositionVisual3VTbl*
  end

  struct IDCompositionDevice3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    wait_for_commit_completion : UInt64
    get_frame_statistics : UInt64
    create_visual : UInt64
    create_surface_factory : UInt64
    create_surface : UInt64
    create_virtual_surface : UInt64
    create_translate_transform : UInt64
    create_scale_transform : UInt64
    create_rotate_transform : UInt64
    create_skew_transform : UInt64
    create_matrix_transform : UInt64
    create_transform_group : UInt64
    create_translate_transform3_d : UInt64
    create_scale_transform3_d : UInt64
    create_rotate_transform3_d : UInt64
    create_matrix_transform3_d : UInt64
    create_transform3_d_group : UInt64
    create_effect_group : UInt64
    create_rectangle_clip : UInt64
    create_animation : UInt64
    create_gaussian_blur_effect : UInt64
    create_brightness_effect : UInt64
    create_color_matrix_effect : UInt64
    create_shadow_effect : UInt64
    create_hue_rotation_effect : UInt64
    create_saturation_effect : UInt64
    create_turbulence_effect : UInt64
    create_linear_transfer_effect : UInt64
    create_table_transfer_effect : UInt64
    create_composite_effect : UInt64
    create_blend_effect : UInt64
    create_arithmetic_composite_effect : UInt64
    create_affine_transform2_d_effect : UInt64
  end

  IDCompositionDevice3_GUID = "0987cb06-f916-48bf-8d35-ce7641781bd9"
  IID_IDCompositionDevice3 = LibC::GUID.new(0x987cb06_u32, 0xf916_u16, 0x48bf_u16, StaticArray[0x8d_u8, 0x35_u8, 0xce_u8, 0x76_u8, 0x41_u8, 0x78_u8, 0x1b_u8, 0xd9_u8])
  struct IDCompositionDevice3
    lpVtbl : IDCompositionDevice3VTbl*
  end

  struct IDCompositionFilterEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
  end

  IDCompositionFilterEffect_GUID = "30c421d5-8cb2-4e9f-b133-37be270d4ac2"
  IID_IDCompositionFilterEffect = LibC::GUID.new(0x30c421d5_u32, 0x8cb2_u16, 0x4e9f_u16, StaticArray[0xb1_u8, 0x33_u8, 0x37_u8, 0xbe_u8, 0x27_u8, 0xd_u8, 0x4a_u8, 0xc2_u8])
  struct IDCompositionFilterEffect
    lpVtbl : IDCompositionFilterEffectVTbl*
  end

  struct IDCompositionGaussianBlurEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_standard_deviation : UInt64
    set_standard_deviation2 : UInt64
    set_border_mode : UInt64
  end

  IDCompositionGaussianBlurEffect_GUID = "45d4d0b7-1bd4-454e-8894-2bfa68443033"
  IID_IDCompositionGaussianBlurEffect = LibC::GUID.new(0x45d4d0b7_u32, 0x1bd4_u16, 0x454e_u16, StaticArray[0x88_u8, 0x94_u8, 0x2b_u8, 0xfa_u8, 0x68_u8, 0x44_u8, 0x30_u8, 0x33_u8])
  struct IDCompositionGaussianBlurEffect
    lpVtbl : IDCompositionGaussianBlurEffectVTbl*
  end

  struct IDCompositionBrightnessEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_white_point : UInt64
    set_black_point : UInt64
    set_white_point_x : UInt64
    set_white_point_x2 : UInt64
    set_white_point_y : UInt64
    set_white_point_y2 : UInt64
    set_black_point_x : UInt64
    set_black_point_x2 : UInt64
    set_black_point_y : UInt64
    set_black_point_y2 : UInt64
  end

  IDCompositionBrightnessEffect_GUID = "6027496e-cb3a-49ab-934f-d798da4f7da6"
  IID_IDCompositionBrightnessEffect = LibC::GUID.new(0x6027496e_u32, 0xcb3a_u16, 0x49ab_u16, StaticArray[0x93_u8, 0x4f_u8, 0xd7_u8, 0x98_u8, 0xda_u8, 0x4f_u8, 0x7d_u8, 0xa6_u8])
  struct IDCompositionBrightnessEffect
    lpVtbl : IDCompositionBrightnessEffectVTbl*
  end

  struct IDCompositionColorMatrixEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_matrix : UInt64
    set_matrix_element : UInt64
    set_matrix_element2 : UInt64
    set_alpha_mode : UInt64
    set_clamp_output : UInt64
  end

  IDCompositionColorMatrixEffect_GUID = "c1170a22-3ce2-4966-90d4-55408bfc84c4"
  IID_IDCompositionColorMatrixEffect = LibC::GUID.new(0xc1170a22_u32, 0x3ce2_u16, 0x4966_u16, StaticArray[0x90_u8, 0xd4_u8, 0x55_u8, 0x40_u8, 0x8b_u8, 0xfc_u8, 0x84_u8, 0xc4_u8])
  struct IDCompositionColorMatrixEffect
    lpVtbl : IDCompositionColorMatrixEffectVTbl*
  end

  struct IDCompositionShadowEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_standard_deviation : UInt64
    set_standard_deviation2 : UInt64
    set_color : UInt64
    set_red : UInt64
    set_red2 : UInt64
    set_green : UInt64
    set_green2 : UInt64
    set_blue : UInt64
    set_blue2 : UInt64
    set_alpha : UInt64
    set_alpha2 : UInt64
  end

  IDCompositionShadowEffect_GUID = "4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879"
  IID_IDCompositionShadowEffect = LibC::GUID.new(0x4ad18ac0_u32, 0xcfd2_u16, 0x4c2f_u16, StaticArray[0xbb_u8, 0x62_u8, 0x96_u8, 0xe5_u8, 0x4f_u8, 0xdb_u8, 0x68_u8, 0x79_u8])
  struct IDCompositionShadowEffect
    lpVtbl : IDCompositionShadowEffectVTbl*
  end

  struct IDCompositionHueRotationEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_angle : UInt64
    set_angle2 : UInt64
  end

  IDCompositionHueRotationEffect_GUID = "6db9f920-0770-4781-b0c6-381912f9d167"
  IID_IDCompositionHueRotationEffect = LibC::GUID.new(0x6db9f920_u32, 0x770_u16, 0x4781_u16, StaticArray[0xb0_u8, 0xc6_u8, 0x38_u8, 0x19_u8, 0x12_u8, 0xf9_u8, 0xd1_u8, 0x67_u8])
  struct IDCompositionHueRotationEffect
    lpVtbl : IDCompositionHueRotationEffectVTbl*
  end

  struct IDCompositionSaturationEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_saturation : UInt64
    set_saturation2 : UInt64
  end

  IDCompositionSaturationEffect_GUID = "a08debda-3258-4fa4-9f16-9174d3fe93b1"
  IID_IDCompositionSaturationEffect = LibC::GUID.new(0xa08debda_u32, 0x3258_u16, 0x4fa4_u16, StaticArray[0x9f_u8, 0x16_u8, 0x91_u8, 0x74_u8, 0xd3_u8, 0xfe_u8, 0x93_u8, 0xb1_u8])
  struct IDCompositionSaturationEffect
    lpVtbl : IDCompositionSaturationEffectVTbl*
  end

  struct IDCompositionTurbulenceEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_offset : UInt64
    set_base_frequency : UInt64
    set_size : UInt64
    set_num_octaves : UInt64
    set_seed : UInt64
    set_noise : UInt64
    set_stitchable : UInt64
  end

  IDCompositionTurbulenceEffect_GUID = "a6a55bda-c09c-49f3-9193-a41922c89715"
  IID_IDCompositionTurbulenceEffect = LibC::GUID.new(0xa6a55bda_u32, 0xc09c_u16, 0x49f3_u16, StaticArray[0x91_u8, 0x93_u8, 0xa4_u8, 0x19_u8, 0x22_u8, 0xc8_u8, 0x97_u8, 0x15_u8])
  struct IDCompositionTurbulenceEffect
    lpVtbl : IDCompositionTurbulenceEffectVTbl*
  end

  struct IDCompositionLinearTransferEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_red_y_intercept : UInt64
    set_red_y_intercept2 : UInt64
    set_red_slope : UInt64
    set_red_slope2 : UInt64
    set_red_disable : UInt64
    set_green_y_intercept : UInt64
    set_green_y_intercept2 : UInt64
    set_green_slope : UInt64
    set_green_slope2 : UInt64
    set_green_disable : UInt64
    set_blue_y_intercept : UInt64
    set_blue_y_intercept2 : UInt64
    set_blue_slope : UInt64
    set_blue_slope2 : UInt64
    set_blue_disable : UInt64
    set_alpha_y_intercept : UInt64
    set_alpha_y_intercept2 : UInt64
    set_alpha_slope : UInt64
    set_alpha_slope2 : UInt64
    set_alpha_disable : UInt64
    set_clamp_output : UInt64
  end

  IDCompositionLinearTransferEffect_GUID = "4305ee5b-c4a0-4c88-9385-67124e017683"
  IID_IDCompositionLinearTransferEffect = LibC::GUID.new(0x4305ee5b_u32, 0xc4a0_u16, 0x4c88_u16, StaticArray[0x93_u8, 0x85_u8, 0x67_u8, 0x12_u8, 0x4e_u8, 0x1_u8, 0x76_u8, 0x83_u8])
  struct IDCompositionLinearTransferEffect
    lpVtbl : IDCompositionLinearTransferEffectVTbl*
  end

  struct IDCompositionTableTransferEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_red_table : UInt64
    set_green_table : UInt64
    set_blue_table : UInt64
    set_alpha_table : UInt64
    set_red_disable : UInt64
    set_green_disable : UInt64
    set_blue_disable : UInt64
    set_alpha_disable : UInt64
    set_clamp_output : UInt64
    set_red_table_value : UInt64
    set_red_table_value2 : UInt64
    set_green_table_value : UInt64
    set_green_table_value2 : UInt64
    set_blue_table_value : UInt64
    set_blue_table_value2 : UInt64
    set_alpha_table_value : UInt64
    set_alpha_table_value2 : UInt64
  end

  IDCompositionTableTransferEffect_GUID = "9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd"
  IID_IDCompositionTableTransferEffect = LibC::GUID.new(0x9b7e82e2_u32, 0x69c5_u16, 0x4eb4_u16, StaticArray[0xa5_u8, 0xf5_u8, 0xa7_u8, 0x3_u8, 0x3f_u8, 0x51_u8, 0x32_u8, 0xcd_u8])
  struct IDCompositionTableTransferEffect
    lpVtbl : IDCompositionTableTransferEffectVTbl*
  end

  struct IDCompositionCompositeEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_mode : UInt64
  end

  IDCompositionCompositeEffect_GUID = "576616c0-a231-494d-a38d-00fd5ec4db46"
  IID_IDCompositionCompositeEffect = LibC::GUID.new(0x576616c0_u32, 0xa231_u16, 0x494d_u16, StaticArray[0xa3_u8, 0x8d_u8, 0x0_u8, 0xfd_u8, 0x5e_u8, 0xc4_u8, 0xdb_u8, 0x46_u8])
  struct IDCompositionCompositeEffect
    lpVtbl : IDCompositionCompositeEffectVTbl*
  end

  struct IDCompositionBlendEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_mode : UInt64
  end

  IDCompositionBlendEffect_GUID = "33ecdc0a-578a-4a11-9c14-0cb90517f9c5"
  IID_IDCompositionBlendEffect = LibC::GUID.new(0x33ecdc0a_u32, 0x578a_u16, 0x4a11_u16, StaticArray[0x9c_u8, 0x14_u8, 0xc_u8, 0xb9_u8, 0x5_u8, 0x17_u8, 0xf9_u8, 0xc5_u8])
  struct IDCompositionBlendEffect
    lpVtbl : IDCompositionBlendEffectVTbl*
  end

  struct IDCompositionArithmeticCompositeEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_coefficients : UInt64
    set_clamp_output : UInt64
    set_coefficient1 : UInt64
    set_coefficient12 : UInt64
    set_coefficient2 : UInt64
    set_coefficient22 : UInt64
    set_coefficient3 : UInt64
    set_coefficient32 : UInt64
    set_coefficient4 : UInt64
    set_coefficient42 : UInt64
  end

  IDCompositionArithmeticCompositeEffect_GUID = "3b67dfa8-e3dd-4e61-b640-46c2f3d739dc"
  IID_IDCompositionArithmeticCompositeEffect = LibC::GUID.new(0x3b67dfa8_u32, 0xe3dd_u16, 0x4e61_u16, StaticArray[0xb6_u8, 0x40_u8, 0x46_u8, 0xc2_u8, 0xf3_u8, 0xd7_u8, 0x39_u8, 0xdc_u8])
  struct IDCompositionArithmeticCompositeEffect
    lpVtbl : IDCompositionArithmeticCompositeEffectVTbl*
  end

  struct IDCompositionAffineTransform2DEffectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_input : UInt64
    set_interpolation_mode : UInt64
    set_border_mode : UInt64
    set_transform_matrix : UInt64
    set_transform_matrix_element : UInt64
    set_transform_matrix_element2 : UInt64
    set_sharpness : UInt64
    set_sharpness2 : UInt64
  end

  IDCompositionAffineTransform2DEffect_GUID = "0b74b9e8-cdd6-492f-bbbc-5ed32157026d"
  IID_IDCompositionAffineTransform2DEffect = LibC::GUID.new(0xb74b9e8_u32, 0xcdd6_u16, 0x492f_u16, StaticArray[0xbb_u8, 0xbc_u8, 0x5e_u8, 0xd3_u8, 0x21_u8, 0x57_u8, 0x2_u8, 0x6d_u8])
  struct IDCompositionAffineTransform2DEffect
    lpVtbl : IDCompositionAffineTransform2DEffectVTbl*
  end

  struct IDCompositionDelegatedInkTrailVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_trail_points : UInt64
    add_trail_points_with_prediction : UInt64
    remove_trail_points : UInt64
    start_new_trail : UInt64
  end

  IDCompositionDelegatedInkTrail_GUID = "c2448e9b-547d-4057-8cf5-8144ede1c2da"
  IID_IDCompositionDelegatedInkTrail = LibC::GUID.new(0xc2448e9b_u32, 0x547d_u16, 0x4057_u16, StaticArray[0x8c_u8, 0xf5_u8, 0x81_u8, 0x44_u8, 0xed_u8, 0xe1_u8, 0xc2_u8, 0xda_u8])
  struct IDCompositionDelegatedInkTrail
    lpVtbl : IDCompositionDelegatedInkTrailVTbl*
  end

  struct IDCompositionInkTrailDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_delegated_ink_trail : UInt64
    create_delegated_ink_trail_for_swap_chain : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def set_absolute_begin_time(begintime : LARGE_INTEGER) : HRESULT
    @lpVtbl.value.set_absolute_begin_time.unsafe_as(Proc(LARGE_INTEGER, HRESULT)).call(begintime)
  end
  def add_cubic(beginoffset : Float64, constantcoefficient : Float32, linearcoefficient : Float32, quadraticcoefficient : Float32, cubiccoefficient : Float32) : HRESULT
    @lpVtbl.value.add_cubic.unsafe_as(Proc(Float64, Float32, Float32, Float32, Float32, HRESULT)).call(beginoffset, constantcoefficient, linearcoefficient, quadraticcoefficient, cubiccoefficient)
  end
  def add_sinusoidal(beginoffset : Float64, bias : Float32, amplitude : Float32, frequency : Float32, phase : Float32) : HRESULT
    @lpVtbl.value.add_sinusoidal.unsafe_as(Proc(Float64, Float32, Float32, Float32, Float32, HRESULT)).call(beginoffset, bias, amplitude, frequency, phase)
  end
  def add_repeat(beginoffset : Float64, durationtorepeat : Float64) : HRESULT
    @lpVtbl.value.add_repeat.unsafe_as(Proc(Float64, Float64, HRESULT)).call(beginoffset, durationtorepeat)
  end
  def end_(endoffset : Float64, endvalue : Float32) : HRESULT
    @lpVtbl.value.end_.unsafe_as(Proc(Float64, Float32, HRESULT)).call(endoffset, endvalue)
  end
end
struct LibWin32::IDCompositionDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_commit_completion : HRESULT
    @lpVtbl.value.wait_for_commit_completion.unsafe_as(Proc(HRESULT)).call
  end
  def get_frame_statistics(statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.unsafe_as(Proc(DCOMPOSITION_FRAME_STATISTICS*, HRESULT)).call(statistics)
  end
  def create_target_for_hwnd(hwnd : LibC::HANDLE, topmost : LibC::BOOL, target : IDCompositionTarget*) : HRESULT
    @lpVtbl.value.create_target_for_hwnd.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, IDCompositionTarget*, HRESULT)).call(hwnd, topmost, target)
  end
  def create_visual(visual : IDCompositionVisual*) : HRESULT
    @lpVtbl.value.create_visual.unsafe_as(Proc(IDCompositionVisual*, HRESULT)).call(visual)
  end
  def create_surface(width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)).call(width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)).call(initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_surface_from_handle(handle : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_handle.unsafe_as(Proc(LibC::HANDLE, IUnknown*, HRESULT)).call(handle, surface)
  end
  def create_surface_from_hwnd(hwnd : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_hwnd.unsafe_as(Proc(LibC::HANDLE, IUnknown*, HRESULT)).call(hwnd, surface)
  end
  def create_translate_transform(translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.unsafe_as(Proc(IDCompositionTranslateTransform*, HRESULT)).call(translatetransform)
  end
  def create_scale_transform(scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.unsafe_as(Proc(IDCompositionScaleTransform*, HRESULT)).call(scaletransform)
  end
  def create_rotate_transform(rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.unsafe_as(Proc(IDCompositionRotateTransform*, HRESULT)).call(rotatetransform)
  end
  def create_skew_transform(skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.unsafe_as(Proc(IDCompositionSkewTransform*, HRESULT)).call(skewtransform)
  end
  def create_matrix_transform(matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.unsafe_as(Proc(IDCompositionMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def create_transform_group(transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.unsafe_as(Proc(IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)).call(transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.unsafe_as(Proc(IDCompositionTranslateTransform3D*, HRESULT)).call(translatetransform3d)
  end
  def create_scale_transform3_d(scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.unsafe_as(Proc(IDCompositionScaleTransform3D*, HRESULT)).call(scaletransform3d)
  end
  def create_rotate_transform3_d(rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.unsafe_as(Proc(IDCompositionRotateTransform3D*, HRESULT)).call(rotatetransform3d)
  end
  def create_matrix_transform3_d(matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.unsafe_as(Proc(IDCompositionMatrixTransform3D*, HRESULT)).call(matrixtransform3d)
  end
  def create_transform3_d_group(transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.unsafe_as(Proc(IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)).call(transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.unsafe_as(Proc(IDCompositionEffectGroup*, HRESULT)).call(effectgroup)
  end
  def create_rectangle_clip(clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.unsafe_as(Proc(IDCompositionRectangleClip*, HRESULT)).call(clip)
  end
  def create_animation(animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.unsafe_as(Proc(IDCompositionAnimation*, HRESULT)).call(animation)
  end
  def check_device_state(pfvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_device_state.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfvalid)
  end
end
struct LibWin32::IDCompositionTarget
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_root(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_root.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
end
struct LibWin32::IDCompositionVisual
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_offset_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_x2(offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.unsafe_as(Proc(Float32, HRESULT)).call(offsetx)
  end
  def set_offset_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_y2(offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.unsafe_as(Proc(Float32, HRESULT)).call(offsety)
  end
  def set_transform(transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.unsafe_as(Proc(IDCompositionTransform, HRESULT)).call(transform)
  end
  def set_transform2(matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.unsafe_as(Proc(D2D_MATRIX_3X2_F*, HRESULT)).call(matrix)
  end
  def set_transform_parent(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def set_effect(effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.unsafe_as(Proc(IDCompositionEffect, HRESULT)).call(effect)
  end
  def set_bitmap_interpolation_mode(interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.unsafe_as(Proc(DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)).call(interpolationmode)
  end
  def set_border_mode(bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.unsafe_as(Proc(DCOMPOSITION_BORDER_MODE, HRESULT)).call(bordermode)
  end
  def set_clip(clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.unsafe_as(Proc(IDCompositionClip, HRESULT)).call(clip)
  end
  def set_clip2(rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.unsafe_as(Proc(D2D_RECT_F*, HRESULT)).call(rect)
  end
  def set_content(content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IUnknown, HRESULT)).call(content)
  end
  def add_visual(visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.unsafe_as(Proc(IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)).call(visual, insertabove, referencevisual)
  end
  def remove_visual(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def remove_all_visuals : HRESULT
    @lpVtbl.value.remove_all_visuals.unsafe_as(Proc(HRESULT)).call
  end
  def set_composite_mode(compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.unsafe_as(Proc(DCOMPOSITION_COMPOSITE_MODE, HRESULT)).call(compositemode)
  end
end
struct LibWin32::IDCompositionEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IDCompositionTransform3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IDCompositionTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IDCompositionTranslateTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_offset_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_x2(offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.unsafe_as(Proc(Float32, HRESULT)).call(offsetx)
  end
  def set_offset_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_y2(offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.unsafe_as(Proc(Float32, HRESULT)).call(offsety)
  end
end
struct LibWin32::IDCompositionScaleTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_scale_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_scale_x2(scalex : Float32) : HRESULT
    @lpVtbl.value.set_scale_x2.unsafe_as(Proc(Float32, HRESULT)).call(scalex)
  end
  def set_scale_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_scale_y2(scaley : Float32) : HRESULT
    @lpVtbl.value.set_scale_y2.unsafe_as(Proc(Float32, HRESULT)).call(scaley)
  end
  def set_center_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_x2(centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.unsafe_as(Proc(Float32, HRESULT)).call(centerx)
  end
  def set_center_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_y2(centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.unsafe_as(Proc(Float32, HRESULT)).call(centery)
  end
end
struct LibWin32::IDCompositionRotateTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_angle(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_angle2(angle : Float32) : HRESULT
    @lpVtbl.value.set_angle2.unsafe_as(Proc(Float32, HRESULT)).call(angle)
  end
  def set_center_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_x2(centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.unsafe_as(Proc(Float32, HRESULT)).call(centerx)
  end
  def set_center_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_y2(centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.unsafe_as(Proc(Float32, HRESULT)).call(centery)
  end
end
struct LibWin32::IDCompositionSkewTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_angle_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_angle_x2(anglex : Float32) : HRESULT
    @lpVtbl.value.set_angle_x2.unsafe_as(Proc(Float32, HRESULT)).call(anglex)
  end
  def set_angle_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_angle_y2(angley : Float32) : HRESULT
    @lpVtbl.value.set_angle_y2.unsafe_as(Proc(Float32, HRESULT)).call(angley)
  end
  def set_center_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_x2(centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.unsafe_as(Proc(Float32, HRESULT)).call(centerx)
  end
  def set_center_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_y2(centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.unsafe_as(Proc(Float32, HRESULT)).call(centery)
  end
end
struct LibWin32::IDCompositionMatrixTransform
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_matrix(matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_matrix.unsafe_as(Proc(D2D_MATRIX_3X2_F*, HRESULT)).call(matrix)
  end
  def set_matrix_element(row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_matrix_element.unsafe_as(Proc(Int32, Int32, IDCompositionAnimation, HRESULT)).call(row, column, animation)
  end
  def set_matrix_element2(row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_matrix_element2.unsafe_as(Proc(Int32, Int32, Float32, HRESULT)).call(row, column, value)
  end
end
struct LibWin32::IDCompositionEffectGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_opacity(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_opacity2(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity2.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def set_transform3_d(transform3d : IDCompositionTransform3D) : HRESULT
    @lpVtbl.value.set_transform3_d.unsafe_as(Proc(IDCompositionTransform3D, HRESULT)).call(transform3d)
  end
end
struct LibWin32::IDCompositionTranslateTransform3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_offset_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_x2(offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.unsafe_as(Proc(Float32, HRESULT)).call(offsetx)
  end
  def set_offset_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_y2(offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.unsafe_as(Proc(Float32, HRESULT)).call(offsety)
  end
  def set_offset_z(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_z.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_z2(offsetz : Float32) : HRESULT
    @lpVtbl.value.set_offset_z2.unsafe_as(Proc(Float32, HRESULT)).call(offsetz)
  end
end
struct LibWin32::IDCompositionScaleTransform3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_scale_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_scale_x2(scalex : Float32) : HRESULT
    @lpVtbl.value.set_scale_x2.unsafe_as(Proc(Float32, HRESULT)).call(scalex)
  end
  def set_scale_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_scale_y2(scaley : Float32) : HRESULT
    @lpVtbl.value.set_scale_y2.unsafe_as(Proc(Float32, HRESULT)).call(scaley)
  end
  def set_scale_z(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_scale_z.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_scale_z2(scalez : Float32) : HRESULT
    @lpVtbl.value.set_scale_z2.unsafe_as(Proc(Float32, HRESULT)).call(scalez)
  end
  def set_center_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_x2(centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.unsafe_as(Proc(Float32, HRESULT)).call(centerx)
  end
  def set_center_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_y2(centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.unsafe_as(Proc(Float32, HRESULT)).call(centery)
  end
  def set_center_z(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_z.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_z2(centerz : Float32) : HRESULT
    @lpVtbl.value.set_center_z2.unsafe_as(Proc(Float32, HRESULT)).call(centerz)
  end
end
struct LibWin32::IDCompositionRotateTransform3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_angle(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_angle2(angle : Float32) : HRESULT
    @lpVtbl.value.set_angle2.unsafe_as(Proc(Float32, HRESULT)).call(angle)
  end
  def set_axis_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_axis_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_axis_x2(axisx : Float32) : HRESULT
    @lpVtbl.value.set_axis_x2.unsafe_as(Proc(Float32, HRESULT)).call(axisx)
  end
  def set_axis_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_axis_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_axis_y2(axisy : Float32) : HRESULT
    @lpVtbl.value.set_axis_y2.unsafe_as(Proc(Float32, HRESULT)).call(axisy)
  end
  def set_axis_z(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_axis_z.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_axis_z2(axisz : Float32) : HRESULT
    @lpVtbl.value.set_axis_z2.unsafe_as(Proc(Float32, HRESULT)).call(axisz)
  end
  def set_center_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_x2(centerx : Float32) : HRESULT
    @lpVtbl.value.set_center_x2.unsafe_as(Proc(Float32, HRESULT)).call(centerx)
  end
  def set_center_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_y2(centery : Float32) : HRESULT
    @lpVtbl.value.set_center_y2.unsafe_as(Proc(Float32, HRESULT)).call(centery)
  end
  def set_center_z(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_center_z.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_center_z2(centerz : Float32) : HRESULT
    @lpVtbl.value.set_center_z2.unsafe_as(Proc(Float32, HRESULT)).call(centerz)
  end
end
struct LibWin32::IDCompositionMatrixTransform3D
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_matrix(matrix : D3DMATRIX*) : HRESULT
    @lpVtbl.value.set_matrix.unsafe_as(Proc(D3DMATRIX*, HRESULT)).call(matrix)
  end
  def set_matrix_element(row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_matrix_element.unsafe_as(Proc(Int32, Int32, IDCompositionAnimation, HRESULT)).call(row, column, animation)
  end
  def set_matrix_element2(row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_matrix_element2.unsafe_as(Proc(Int32, Int32, Float32, HRESULT)).call(row, column, value)
  end
end
struct LibWin32::IDCompositionClip
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IDCompositionRectangleClip
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_left(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_left.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_left2(left : Float32) : HRESULT
    @lpVtbl.value.set_left2.unsafe_as(Proc(Float32, HRESULT)).call(left)
  end
  def set_top(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_top2(top : Float32) : HRESULT
    @lpVtbl.value.set_top2.unsafe_as(Proc(Float32, HRESULT)).call(top)
  end
  def set_right(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_right.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_right2(right : Float32) : HRESULT
    @lpVtbl.value.set_right2.unsafe_as(Proc(Float32, HRESULT)).call(right)
  end
  def set_bottom(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_bottom2(bottom : Float32) : HRESULT
    @lpVtbl.value.set_bottom2.unsafe_as(Proc(Float32, HRESULT)).call(bottom)
  end
  def set_top_left_radius_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_left_radius_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_top_left_radius_x2(radius : Float32) : HRESULT
    @lpVtbl.value.set_top_left_radius_x2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_top_left_radius_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_left_radius_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_top_left_radius_y2(radius : Float32) : HRESULT
    @lpVtbl.value.set_top_left_radius_y2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_top_right_radius_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_right_radius_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_top_right_radius_x2(radius : Float32) : HRESULT
    @lpVtbl.value.set_top_right_radius_x2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_top_right_radius_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_top_right_radius_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_top_right_radius_y2(radius : Float32) : HRESULT
    @lpVtbl.value.set_top_right_radius_y2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_bottom_left_radius_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_bottom_left_radius_x2(radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_x2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_bottom_left_radius_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_bottom_left_radius_y2(radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_left_radius_y2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_bottom_right_radius_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_bottom_right_radius_x2(radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_x2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
  def set_bottom_right_radius_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_bottom_right_radius_y2(radius : Float32) : HRESULT
    @lpVtbl.value.set_bottom_right_radius_y2.unsafe_as(Proc(Float32, HRESULT)).call(radius)
  end
end
struct LibWin32::IDCompositionSurface
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_draw(updaterect : RECT*, iid : Guid*, updateobject : Void**, updateoffset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT*, Guid*, Void**, POINT*, HRESULT)).call(updaterect, iid, updateobject, updateoffset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
  def suspend_draw : HRESULT
    @lpVtbl.value.suspend_draw.unsafe_as(Proc(HRESULT)).call
  end
  def resume_draw : HRESULT
    @lpVtbl.value.resume_draw.unsafe_as(Proc(HRESULT)).call
  end
  def scroll(scrollrect : RECT*, cliprect : RECT*, offsetx : Int32, offsety : Int32) : HRESULT
    @lpVtbl.value.scroll.unsafe_as(Proc(RECT*, RECT*, Int32, Int32, HRESULT)).call(scrollrect, cliprect, offsetx, offsety)
  end
end
struct LibWin32::IDCompositionVirtualSurface
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_draw(updaterect : RECT*, iid : Guid*, updateobject : Void**, updateoffset : POINT*) : HRESULT
    @lpVtbl.value.begin_draw.unsafe_as(Proc(RECT*, Guid*, Void**, POINT*, HRESULT)).call(updaterect, iid, updateobject, updateoffset)
  end
  def end_draw : HRESULT
    @lpVtbl.value.end_draw.unsafe_as(Proc(HRESULT)).call
  end
  def suspend_draw : HRESULT
    @lpVtbl.value.suspend_draw.unsafe_as(Proc(HRESULT)).call
  end
  def resume_draw : HRESULT
    @lpVtbl.value.resume_draw.unsafe_as(Proc(HRESULT)).call
  end
  def scroll(scrollrect : RECT*, cliprect : RECT*, offsetx : Int32, offsety : Int32) : HRESULT
    @lpVtbl.value.scroll.unsafe_as(Proc(RECT*, RECT*, Int32, Int32, HRESULT)).call(scrollrect, cliprect, offsetx, offsety)
  end
  def resize(width : UInt32, height : UInt32) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(width, height)
  end
  def trim(rectangles : RECT*, count : UInt32) : HRESULT
    @lpVtbl.value.trim.unsafe_as(Proc(RECT*, UInt32, HRESULT)).call(rectangles, count)
  end
end
struct LibWin32::IDCompositionDevice2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_commit_completion : HRESULT
    @lpVtbl.value.wait_for_commit_completion.unsafe_as(Proc(HRESULT)).call
  end
  def get_frame_statistics(statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.unsafe_as(Proc(DCOMPOSITION_FRAME_STATISTICS*, HRESULT)).call(statistics)
  end
  def create_visual(visual : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.create_visual.unsafe_as(Proc(IDCompositionVisual2*, HRESULT)).call(visual)
  end
  def create_surface_factory(renderingdevice : IUnknown, surfacefactory : IDCompositionSurfaceFactory*) : HRESULT
    @lpVtbl.value.create_surface_factory.unsafe_as(Proc(IUnknown, IDCompositionSurfaceFactory*, HRESULT)).call(renderingdevice, surfacefactory)
  end
  def create_surface(width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)).call(width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)).call(initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_translate_transform(translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.unsafe_as(Proc(IDCompositionTranslateTransform*, HRESULT)).call(translatetransform)
  end
  def create_scale_transform(scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.unsafe_as(Proc(IDCompositionScaleTransform*, HRESULT)).call(scaletransform)
  end
  def create_rotate_transform(rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.unsafe_as(Proc(IDCompositionRotateTransform*, HRESULT)).call(rotatetransform)
  end
  def create_skew_transform(skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.unsafe_as(Proc(IDCompositionSkewTransform*, HRESULT)).call(skewtransform)
  end
  def create_matrix_transform(matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.unsafe_as(Proc(IDCompositionMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def create_transform_group(transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.unsafe_as(Proc(IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)).call(transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.unsafe_as(Proc(IDCompositionTranslateTransform3D*, HRESULT)).call(translatetransform3d)
  end
  def create_scale_transform3_d(scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.unsafe_as(Proc(IDCompositionScaleTransform3D*, HRESULT)).call(scaletransform3d)
  end
  def create_rotate_transform3_d(rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.unsafe_as(Proc(IDCompositionRotateTransform3D*, HRESULT)).call(rotatetransform3d)
  end
  def create_matrix_transform3_d(matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.unsafe_as(Proc(IDCompositionMatrixTransform3D*, HRESULT)).call(matrixtransform3d)
  end
  def create_transform3_d_group(transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.unsafe_as(Proc(IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)).call(transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.unsafe_as(Proc(IDCompositionEffectGroup*, HRESULT)).call(effectgroup)
  end
  def create_rectangle_clip(clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.unsafe_as(Proc(IDCompositionRectangleClip*, HRESULT)).call(clip)
  end
  def create_animation(animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.unsafe_as(Proc(IDCompositionAnimation*, HRESULT)).call(animation)
  end
end
struct LibWin32::IDCompositionDesktopDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_commit_completion : HRESULT
    @lpVtbl.value.wait_for_commit_completion.unsafe_as(Proc(HRESULT)).call
  end
  def get_frame_statistics(statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.unsafe_as(Proc(DCOMPOSITION_FRAME_STATISTICS*, HRESULT)).call(statistics)
  end
  def create_visual(visual : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.create_visual.unsafe_as(Proc(IDCompositionVisual2*, HRESULT)).call(visual)
  end
  def create_surface_factory(renderingdevice : IUnknown, surfacefactory : IDCompositionSurfaceFactory*) : HRESULT
    @lpVtbl.value.create_surface_factory.unsafe_as(Proc(IUnknown, IDCompositionSurfaceFactory*, HRESULT)).call(renderingdevice, surfacefactory)
  end
  def create_surface(width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)).call(width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)).call(initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_translate_transform(translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.unsafe_as(Proc(IDCompositionTranslateTransform*, HRESULT)).call(translatetransform)
  end
  def create_scale_transform(scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.unsafe_as(Proc(IDCompositionScaleTransform*, HRESULT)).call(scaletransform)
  end
  def create_rotate_transform(rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.unsafe_as(Proc(IDCompositionRotateTransform*, HRESULT)).call(rotatetransform)
  end
  def create_skew_transform(skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.unsafe_as(Proc(IDCompositionSkewTransform*, HRESULT)).call(skewtransform)
  end
  def create_matrix_transform(matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.unsafe_as(Proc(IDCompositionMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def create_transform_group(transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.unsafe_as(Proc(IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)).call(transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.unsafe_as(Proc(IDCompositionTranslateTransform3D*, HRESULT)).call(translatetransform3d)
  end
  def create_scale_transform3_d(scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.unsafe_as(Proc(IDCompositionScaleTransform3D*, HRESULT)).call(scaletransform3d)
  end
  def create_rotate_transform3_d(rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.unsafe_as(Proc(IDCompositionRotateTransform3D*, HRESULT)).call(rotatetransform3d)
  end
  def create_matrix_transform3_d(matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.unsafe_as(Proc(IDCompositionMatrixTransform3D*, HRESULT)).call(matrixtransform3d)
  end
  def create_transform3_d_group(transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.unsafe_as(Proc(IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)).call(transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.unsafe_as(Proc(IDCompositionEffectGroup*, HRESULT)).call(effectgroup)
  end
  def create_rectangle_clip(clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.unsafe_as(Proc(IDCompositionRectangleClip*, HRESULT)).call(clip)
  end
  def create_animation(animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.unsafe_as(Proc(IDCompositionAnimation*, HRESULT)).call(animation)
  end
  def create_target_for_hwnd(hwnd : LibC::HANDLE, topmost : LibC::BOOL, target : IDCompositionTarget*) : HRESULT
    @lpVtbl.value.create_target_for_hwnd.unsafe_as(Proc(LibC::HANDLE, LibC::BOOL, IDCompositionTarget*, HRESULT)).call(hwnd, topmost, target)
  end
  def create_surface_from_handle(handle : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_handle.unsafe_as(Proc(LibC::HANDLE, IUnknown*, HRESULT)).call(handle, surface)
  end
  def create_surface_from_hwnd(hwnd : LibC::HANDLE, surface : IUnknown*) : HRESULT
    @lpVtbl.value.create_surface_from_hwnd.unsafe_as(Proc(LibC::HANDLE, IUnknown*, HRESULT)).call(hwnd, surface)
  end
end
struct LibWin32::IDCompositionDeviceDebug
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable_debug_counters : HRESULT
    @lpVtbl.value.enable_debug_counters.unsafe_as(Proc(HRESULT)).call
  end
  def disable_debug_counters : HRESULT
    @lpVtbl.value.disable_debug_counters.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDCompositionSurfaceFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_surface(width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)).call(width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)).call(initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
end
struct LibWin32::IDCompositionVisual2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_offset_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_x2(offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.unsafe_as(Proc(Float32, HRESULT)).call(offsetx)
  end
  def set_offset_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_y2(offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.unsafe_as(Proc(Float32, HRESULT)).call(offsety)
  end
  def set_transform(transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.unsafe_as(Proc(IDCompositionTransform, HRESULT)).call(transform)
  end
  def set_transform2(matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.unsafe_as(Proc(D2D_MATRIX_3X2_F*, HRESULT)).call(matrix)
  end
  def set_transform_parent(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def set_effect(effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.unsafe_as(Proc(IDCompositionEffect, HRESULT)).call(effect)
  end
  def set_bitmap_interpolation_mode(interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.unsafe_as(Proc(DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)).call(interpolationmode)
  end
  def set_border_mode(bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.unsafe_as(Proc(DCOMPOSITION_BORDER_MODE, HRESULT)).call(bordermode)
  end
  def set_clip(clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.unsafe_as(Proc(IDCompositionClip, HRESULT)).call(clip)
  end
  def set_clip2(rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.unsafe_as(Proc(D2D_RECT_F*, HRESULT)).call(rect)
  end
  def set_content(content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IUnknown, HRESULT)).call(content)
  end
  def add_visual(visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.unsafe_as(Proc(IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)).call(visual, insertabove, referencevisual)
  end
  def remove_visual(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def remove_all_visuals : HRESULT
    @lpVtbl.value.remove_all_visuals.unsafe_as(Proc(HRESULT)).call
  end
  def set_composite_mode(compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.unsafe_as(Proc(DCOMPOSITION_COMPOSITE_MODE, HRESULT)).call(compositemode)
  end
  def set_opacity_mode(mode : DCOMPOSITION_OPACITY_MODE) : HRESULT
    @lpVtbl.value.set_opacity_mode.unsafe_as(Proc(DCOMPOSITION_OPACITY_MODE, HRESULT)).call(mode)
  end
  def set_back_face_visibility(visibility : DCOMPOSITION_BACKFACE_VISIBILITY) : HRESULT
    @lpVtbl.value.set_back_face_visibility.unsafe_as(Proc(DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)).call(visibility)
  end
end
struct LibWin32::IDCompositionVisualDebug
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_offset_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_x2(offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.unsafe_as(Proc(Float32, HRESULT)).call(offsetx)
  end
  def set_offset_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_y2(offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.unsafe_as(Proc(Float32, HRESULT)).call(offsety)
  end
  def set_transform(transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.unsafe_as(Proc(IDCompositionTransform, HRESULT)).call(transform)
  end
  def set_transform2(matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.unsafe_as(Proc(D2D_MATRIX_3X2_F*, HRESULT)).call(matrix)
  end
  def set_transform_parent(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def set_effect(effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.unsafe_as(Proc(IDCompositionEffect, HRESULT)).call(effect)
  end
  def set_bitmap_interpolation_mode(interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.unsafe_as(Proc(DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)).call(interpolationmode)
  end
  def set_border_mode(bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.unsafe_as(Proc(DCOMPOSITION_BORDER_MODE, HRESULT)).call(bordermode)
  end
  def set_clip(clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.unsafe_as(Proc(IDCompositionClip, HRESULT)).call(clip)
  end
  def set_clip2(rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.unsafe_as(Proc(D2D_RECT_F*, HRESULT)).call(rect)
  end
  def set_content(content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IUnknown, HRESULT)).call(content)
  end
  def add_visual(visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.unsafe_as(Proc(IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)).call(visual, insertabove, referencevisual)
  end
  def remove_visual(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def remove_all_visuals : HRESULT
    @lpVtbl.value.remove_all_visuals.unsafe_as(Proc(HRESULT)).call
  end
  def set_composite_mode(compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.unsafe_as(Proc(DCOMPOSITION_COMPOSITE_MODE, HRESULT)).call(compositemode)
  end
  def set_opacity_mode(mode : DCOMPOSITION_OPACITY_MODE) : HRESULT
    @lpVtbl.value.set_opacity_mode.unsafe_as(Proc(DCOMPOSITION_OPACITY_MODE, HRESULT)).call(mode)
  end
  def set_back_face_visibility(visibility : DCOMPOSITION_BACKFACE_VISIBILITY) : HRESULT
    @lpVtbl.value.set_back_face_visibility.unsafe_as(Proc(DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)).call(visibility)
  end
  def enable_heat_map(color : D2D1_COLOR_F*) : HRESULT
    @lpVtbl.value.enable_heat_map.unsafe_as(Proc(D2D1_COLOR_F*, HRESULT)).call(color)
  end
  def disable_heat_map : HRESULT
    @lpVtbl.value.disable_heat_map.unsafe_as(Proc(HRESULT)).call
  end
  def enable_redraw_regions : HRESULT
    @lpVtbl.value.enable_redraw_regions.unsafe_as(Proc(HRESULT)).call
  end
  def disable_redraw_regions : HRESULT
    @lpVtbl.value.disable_redraw_regions.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDCompositionVisual3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_offset_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_x2(offsetx : Float32) : HRESULT
    @lpVtbl.value.set_offset_x2.unsafe_as(Proc(Float32, HRESULT)).call(offsetx)
  end
  def set_offset_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_y2(offsety : Float32) : HRESULT
    @lpVtbl.value.set_offset_y2.unsafe_as(Proc(Float32, HRESULT)).call(offsety)
  end
  def set_transform(transform : IDCompositionTransform) : HRESULT
    @lpVtbl.value.set_transform.unsafe_as(Proc(IDCompositionTransform, HRESULT)).call(transform)
  end
  def set_transform2(matrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform2.unsafe_as(Proc(D2D_MATRIX_3X2_F*, HRESULT)).call(matrix)
  end
  def set_transform_parent(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.set_transform_parent.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def set_effect(effect : IDCompositionEffect) : HRESULT
    @lpVtbl.value.set_effect.unsafe_as(Proc(IDCompositionEffect, HRESULT)).call(effect)
  end
  def set_bitmap_interpolation_mode(interpolationmode : DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_bitmap_interpolation_mode.unsafe_as(Proc(DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)).call(interpolationmode)
  end
  def set_border_mode(bordermode : DCOMPOSITION_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.unsafe_as(Proc(DCOMPOSITION_BORDER_MODE, HRESULT)).call(bordermode)
  end
  def set_clip(clip : IDCompositionClip) : HRESULT
    @lpVtbl.value.set_clip.unsafe_as(Proc(IDCompositionClip, HRESULT)).call(clip)
  end
  def set_clip2(rect : D2D_RECT_F*) : HRESULT
    @lpVtbl.value.set_clip2.unsafe_as(Proc(D2D_RECT_F*, HRESULT)).call(rect)
  end
  def set_content(content : IUnknown) : HRESULT
    @lpVtbl.value.set_content.unsafe_as(Proc(IUnknown, HRESULT)).call(content)
  end
  def add_visual(visual : IDCompositionVisual, insertabove : LibC::BOOL, referencevisual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.add_visual.unsafe_as(Proc(IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)).call(visual, insertabove, referencevisual)
  end
  def remove_visual(visual : IDCompositionVisual) : HRESULT
    @lpVtbl.value.remove_visual.unsafe_as(Proc(IDCompositionVisual, HRESULT)).call(visual)
  end
  def remove_all_visuals : HRESULT
    @lpVtbl.value.remove_all_visuals.unsafe_as(Proc(HRESULT)).call
  end
  def set_composite_mode(compositemode : DCOMPOSITION_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_composite_mode.unsafe_as(Proc(DCOMPOSITION_COMPOSITE_MODE, HRESULT)).call(compositemode)
  end
  def set_opacity_mode(mode : DCOMPOSITION_OPACITY_MODE) : HRESULT
    @lpVtbl.value.set_opacity_mode.unsafe_as(Proc(DCOMPOSITION_OPACITY_MODE, HRESULT)).call(mode)
  end
  def set_back_face_visibility(visibility : DCOMPOSITION_BACKFACE_VISIBILITY) : HRESULT
    @lpVtbl.value.set_back_face_visibility.unsafe_as(Proc(DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)).call(visibility)
  end
  def enable_heat_map(color : D2D1_COLOR_F*) : HRESULT
    @lpVtbl.value.enable_heat_map.unsafe_as(Proc(D2D1_COLOR_F*, HRESULT)).call(color)
  end
  def disable_heat_map : HRESULT
    @lpVtbl.value.disable_heat_map.unsafe_as(Proc(HRESULT)).call
  end
  def enable_redraw_regions : HRESULT
    @lpVtbl.value.enable_redraw_regions.unsafe_as(Proc(HRESULT)).call
  end
  def disable_redraw_regions : HRESULT
    @lpVtbl.value.disable_redraw_regions.unsafe_as(Proc(HRESULT)).call
  end
  def set_depth_mode(mode : DCOMPOSITION_DEPTH_MODE) : HRESULT
    @lpVtbl.value.set_depth_mode.unsafe_as(Proc(DCOMPOSITION_DEPTH_MODE, HRESULT)).call(mode)
  end
  def set_offset_z(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_offset_z.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_offset_z2(offsetz : Float32) : HRESULT
    @lpVtbl.value.set_offset_z2.unsafe_as(Proc(Float32, HRESULT)).call(offsetz)
  end
  def set_opacity(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_opacity.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_opacity2(opacity : Float32) : HRESULT
    @lpVtbl.value.set_opacity2.unsafe_as(Proc(Float32, HRESULT)).call(opacity)
  end
  def set_transform3(transform : IDCompositionTransform3D) : HRESULT
    @lpVtbl.value.set_transform3.unsafe_as(Proc(IDCompositionTransform3D, HRESULT)).call(transform)
  end
  def set_transform22(matrix : D2D_MATRIX_4X4_F*) : HRESULT
    @lpVtbl.value.set_transform22.unsafe_as(Proc(D2D_MATRIX_4X4_F*, HRESULT)).call(matrix)
  end
  def set_visible(visible : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_visible.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(visible)
  end
end
struct LibWin32::IDCompositionDevice3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_commit_completion : HRESULT
    @lpVtbl.value.wait_for_commit_completion.unsafe_as(Proc(HRESULT)).call
  end
  def get_frame_statistics(statistics : DCOMPOSITION_FRAME_STATISTICS*) : HRESULT
    @lpVtbl.value.get_frame_statistics.unsafe_as(Proc(DCOMPOSITION_FRAME_STATISTICS*, HRESULT)).call(statistics)
  end
  def create_visual(visual : IDCompositionVisual2*) : HRESULT
    @lpVtbl.value.create_visual.unsafe_as(Proc(IDCompositionVisual2*, HRESULT)).call(visual)
  end
  def create_surface_factory(renderingdevice : IUnknown, surfacefactory : IDCompositionSurfaceFactory*) : HRESULT
    @lpVtbl.value.create_surface_factory.unsafe_as(Proc(IUnknown, IDCompositionSurfaceFactory*, HRESULT)).call(renderingdevice, surfacefactory)
  end
  def create_surface(width : UInt32, height : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, surface : IDCompositionSurface*) : HRESULT
    @lpVtbl.value.create_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)).call(width, height, pixelformat, alphamode, surface)
  end
  def create_virtual_surface(initialwidth : UInt32, initialheight : UInt32, pixelformat : DXGI_FORMAT, alphamode : DXGI_ALPHA_MODE, virtualsurface : IDCompositionVirtualSurface*) : HRESULT
    @lpVtbl.value.create_virtual_surface.unsafe_as(Proc(UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)).call(initialwidth, initialheight, pixelformat, alphamode, virtualsurface)
  end
  def create_translate_transform(translatetransform : IDCompositionTranslateTransform*) : HRESULT
    @lpVtbl.value.create_translate_transform.unsafe_as(Proc(IDCompositionTranslateTransform*, HRESULT)).call(translatetransform)
  end
  def create_scale_transform(scaletransform : IDCompositionScaleTransform*) : HRESULT
    @lpVtbl.value.create_scale_transform.unsafe_as(Proc(IDCompositionScaleTransform*, HRESULT)).call(scaletransform)
  end
  def create_rotate_transform(rotatetransform : IDCompositionRotateTransform*) : HRESULT
    @lpVtbl.value.create_rotate_transform.unsafe_as(Proc(IDCompositionRotateTransform*, HRESULT)).call(rotatetransform)
  end
  def create_skew_transform(skewtransform : IDCompositionSkewTransform*) : HRESULT
    @lpVtbl.value.create_skew_transform.unsafe_as(Proc(IDCompositionSkewTransform*, HRESULT)).call(skewtransform)
  end
  def create_matrix_transform(matrixtransform : IDCompositionMatrixTransform*) : HRESULT
    @lpVtbl.value.create_matrix_transform.unsafe_as(Proc(IDCompositionMatrixTransform*, HRESULT)).call(matrixtransform)
  end
  def create_transform_group(transforms : IDCompositionTransform*, elements : UInt32, transformgroup : IDCompositionTransform*) : HRESULT
    @lpVtbl.value.create_transform_group.unsafe_as(Proc(IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)).call(transforms, elements, transformgroup)
  end
  def create_translate_transform3_d(translatetransform3d : IDCompositionTranslateTransform3D*) : HRESULT
    @lpVtbl.value.create_translate_transform3_d.unsafe_as(Proc(IDCompositionTranslateTransform3D*, HRESULT)).call(translatetransform3d)
  end
  def create_scale_transform3_d(scaletransform3d : IDCompositionScaleTransform3D*) : HRESULT
    @lpVtbl.value.create_scale_transform3_d.unsafe_as(Proc(IDCompositionScaleTransform3D*, HRESULT)).call(scaletransform3d)
  end
  def create_rotate_transform3_d(rotatetransform3d : IDCompositionRotateTransform3D*) : HRESULT
    @lpVtbl.value.create_rotate_transform3_d.unsafe_as(Proc(IDCompositionRotateTransform3D*, HRESULT)).call(rotatetransform3d)
  end
  def create_matrix_transform3_d(matrixtransform3d : IDCompositionMatrixTransform3D*) : HRESULT
    @lpVtbl.value.create_matrix_transform3_d.unsafe_as(Proc(IDCompositionMatrixTransform3D*, HRESULT)).call(matrixtransform3d)
  end
  def create_transform3_d_group(transforms3d : IDCompositionTransform3D*, elements : UInt32, transform3dgroup : IDCompositionTransform3D*) : HRESULT
    @lpVtbl.value.create_transform3_d_group.unsafe_as(Proc(IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)).call(transforms3d, elements, transform3dgroup)
  end
  def create_effect_group(effectgroup : IDCompositionEffectGroup*) : HRESULT
    @lpVtbl.value.create_effect_group.unsafe_as(Proc(IDCompositionEffectGroup*, HRESULT)).call(effectgroup)
  end
  def create_rectangle_clip(clip : IDCompositionRectangleClip*) : HRESULT
    @lpVtbl.value.create_rectangle_clip.unsafe_as(Proc(IDCompositionRectangleClip*, HRESULT)).call(clip)
  end
  def create_animation(animation : IDCompositionAnimation*) : HRESULT
    @lpVtbl.value.create_animation.unsafe_as(Proc(IDCompositionAnimation*, HRESULT)).call(animation)
  end
  def create_gaussian_blur_effect(gaussianblureffect : IDCompositionGaussianBlurEffect*) : HRESULT
    @lpVtbl.value.create_gaussian_blur_effect.unsafe_as(Proc(IDCompositionGaussianBlurEffect*, HRESULT)).call(gaussianblureffect)
  end
  def create_brightness_effect(brightnesseffect : IDCompositionBrightnessEffect*) : HRESULT
    @lpVtbl.value.create_brightness_effect.unsafe_as(Proc(IDCompositionBrightnessEffect*, HRESULT)).call(brightnesseffect)
  end
  def create_color_matrix_effect(colormatrixeffect : IDCompositionColorMatrixEffect*) : HRESULT
    @lpVtbl.value.create_color_matrix_effect.unsafe_as(Proc(IDCompositionColorMatrixEffect*, HRESULT)).call(colormatrixeffect)
  end
  def create_shadow_effect(shadoweffect : IDCompositionShadowEffect*) : HRESULT
    @lpVtbl.value.create_shadow_effect.unsafe_as(Proc(IDCompositionShadowEffect*, HRESULT)).call(shadoweffect)
  end
  def create_hue_rotation_effect(huerotationeffect : IDCompositionHueRotationEffect*) : HRESULT
    @lpVtbl.value.create_hue_rotation_effect.unsafe_as(Proc(IDCompositionHueRotationEffect*, HRESULT)).call(huerotationeffect)
  end
  def create_saturation_effect(saturationeffect : IDCompositionSaturationEffect*) : HRESULT
    @lpVtbl.value.create_saturation_effect.unsafe_as(Proc(IDCompositionSaturationEffect*, HRESULT)).call(saturationeffect)
  end
  def create_turbulence_effect(turbulenceeffect : IDCompositionTurbulenceEffect*) : HRESULT
    @lpVtbl.value.create_turbulence_effect.unsafe_as(Proc(IDCompositionTurbulenceEffect*, HRESULT)).call(turbulenceeffect)
  end
  def create_linear_transfer_effect(lineartransfereffect : IDCompositionLinearTransferEffect*) : HRESULT
    @lpVtbl.value.create_linear_transfer_effect.unsafe_as(Proc(IDCompositionLinearTransferEffect*, HRESULT)).call(lineartransfereffect)
  end
  def create_table_transfer_effect(tabletransfereffect : IDCompositionTableTransferEffect*) : HRESULT
    @lpVtbl.value.create_table_transfer_effect.unsafe_as(Proc(IDCompositionTableTransferEffect*, HRESULT)).call(tabletransfereffect)
  end
  def create_composite_effect(compositeeffect : IDCompositionCompositeEffect*) : HRESULT
    @lpVtbl.value.create_composite_effect.unsafe_as(Proc(IDCompositionCompositeEffect*, HRESULT)).call(compositeeffect)
  end
  def create_blend_effect(blendeffect : IDCompositionBlendEffect*) : HRESULT
    @lpVtbl.value.create_blend_effect.unsafe_as(Proc(IDCompositionBlendEffect*, HRESULT)).call(blendeffect)
  end
  def create_arithmetic_composite_effect(arithmeticcompositeeffect : IDCompositionArithmeticCompositeEffect*) : HRESULT
    @lpVtbl.value.create_arithmetic_composite_effect.unsafe_as(Proc(IDCompositionArithmeticCompositeEffect*, HRESULT)).call(arithmeticcompositeeffect)
  end
  def create_affine_transform2_d_effect(affinetransform2deffect : IDCompositionAffineTransform2DEffect*) : HRESULT
    @lpVtbl.value.create_affine_transform2_d_effect.unsafe_as(Proc(IDCompositionAffineTransform2DEffect*, HRESULT)).call(affinetransform2deffect)
  end
end
struct LibWin32::IDCompositionFilterEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
end
struct LibWin32::IDCompositionGaussianBlurEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_standard_deviation(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_standard_deviation.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_standard_deviation2(amount : Float32) : HRESULT
    @lpVtbl.value.set_standard_deviation2.unsafe_as(Proc(Float32, HRESULT)).call(amount)
  end
  def set_border_mode(mode : D2D1_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.unsafe_as(Proc(D2D1_BORDER_MODE, HRESULT)).call(mode)
  end
end
struct LibWin32::IDCompositionBrightnessEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_white_point(whitepoint : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_white_point.unsafe_as(Proc(D2D_VECTOR_2F*, HRESULT)).call(whitepoint)
  end
  def set_black_point(blackpoint : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_black_point.unsafe_as(Proc(D2D_VECTOR_2F*, HRESULT)).call(blackpoint)
  end
  def set_white_point_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_white_point_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_white_point_x2(whitepointx : Float32) : HRESULT
    @lpVtbl.value.set_white_point_x2.unsafe_as(Proc(Float32, HRESULT)).call(whitepointx)
  end
  def set_white_point_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_white_point_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_white_point_y2(whitepointy : Float32) : HRESULT
    @lpVtbl.value.set_white_point_y2.unsafe_as(Proc(Float32, HRESULT)).call(whitepointy)
  end
  def set_black_point_x(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_black_point_x.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_black_point_x2(blackpointx : Float32) : HRESULT
    @lpVtbl.value.set_black_point_x2.unsafe_as(Proc(Float32, HRESULT)).call(blackpointx)
  end
  def set_black_point_y(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_black_point_y.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_black_point_y2(blackpointy : Float32) : HRESULT
    @lpVtbl.value.set_black_point_y2.unsafe_as(Proc(Float32, HRESULT)).call(blackpointy)
  end
end
struct LibWin32::IDCompositionColorMatrixEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_matrix(matrix : D2D_MATRIX_5X4_F*) : HRESULT
    @lpVtbl.value.set_matrix.unsafe_as(Proc(D2D_MATRIX_5X4_F*, HRESULT)).call(matrix)
  end
  def set_matrix_element(row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_matrix_element.unsafe_as(Proc(Int32, Int32, IDCompositionAnimation, HRESULT)).call(row, column, animation)
  end
  def set_matrix_element2(row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_matrix_element2.unsafe_as(Proc(Int32, Int32, Float32, HRESULT)).call(row, column, value)
  end
  def set_alpha_mode(mode : D2D1_COLORMATRIX_ALPHA_MODE) : HRESULT
    @lpVtbl.value.set_alpha_mode.unsafe_as(Proc(D2D1_COLORMATRIX_ALPHA_MODE, HRESULT)).call(mode)
  end
  def set_clamp_output(clamp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(clamp)
  end
end
struct LibWin32::IDCompositionShadowEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_standard_deviation(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_standard_deviation.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_standard_deviation2(amount : Float32) : HRESULT
    @lpVtbl.value.set_standard_deviation2.unsafe_as(Proc(Float32, HRESULT)).call(amount)
  end
  def set_color(color : D2D_VECTOR_4F*) : HRESULT
    @lpVtbl.value.set_color.unsafe_as(Proc(D2D_VECTOR_4F*, HRESULT)).call(color)
  end
  def set_red(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_red2(amount : Float32) : HRESULT
    @lpVtbl.value.set_red2.unsafe_as(Proc(Float32, HRESULT)).call(amount)
  end
  def set_green(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_green2(amount : Float32) : HRESULT
    @lpVtbl.value.set_green2.unsafe_as(Proc(Float32, HRESULT)).call(amount)
  end
  def set_blue(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_blue2(amount : Float32) : HRESULT
    @lpVtbl.value.set_blue2.unsafe_as(Proc(Float32, HRESULT)).call(amount)
  end
  def set_alpha(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_alpha2(amount : Float32) : HRESULT
    @lpVtbl.value.set_alpha2.unsafe_as(Proc(Float32, HRESULT)).call(amount)
  end
end
struct LibWin32::IDCompositionHueRotationEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_angle(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_angle.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_angle2(amountdegrees : Float32) : HRESULT
    @lpVtbl.value.set_angle2.unsafe_as(Proc(Float32, HRESULT)).call(amountdegrees)
  end
end
struct LibWin32::IDCompositionSaturationEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_saturation(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_saturation.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_saturation2(ratio : Float32) : HRESULT
    @lpVtbl.value.set_saturation2.unsafe_as(Proc(Float32, HRESULT)).call(ratio)
  end
end
struct LibWin32::IDCompositionTurbulenceEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_offset(offset : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_offset.unsafe_as(Proc(D2D_VECTOR_2F*, HRESULT)).call(offset)
  end
  def set_base_frequency(frequency : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_base_frequency.unsafe_as(Proc(D2D_VECTOR_2F*, HRESULT)).call(frequency)
  end
  def set_size(size : D2D_VECTOR_2F*) : HRESULT
    @lpVtbl.value.set_size.unsafe_as(Proc(D2D_VECTOR_2F*, HRESULT)).call(size)
  end
  def set_num_octaves(numoctaves : UInt32) : HRESULT
    @lpVtbl.value.set_num_octaves.unsafe_as(Proc(UInt32, HRESULT)).call(numoctaves)
  end
  def set_seed(seed : UInt32) : HRESULT
    @lpVtbl.value.set_seed.unsafe_as(Proc(UInt32, HRESULT)).call(seed)
  end
  def set_noise(noise : D2D1_TURBULENCE_NOISE) : HRESULT
    @lpVtbl.value.set_noise.unsafe_as(Proc(D2D1_TURBULENCE_NOISE, HRESULT)).call(noise)
  end
  def set_stitchable(stitchable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_stitchable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(stitchable)
  end
end
struct LibWin32::IDCompositionLinearTransferEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_red_y_intercept(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red_y_intercept.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_red_y_intercept2(redyintercept : Float32) : HRESULT
    @lpVtbl.value.set_red_y_intercept2.unsafe_as(Proc(Float32, HRESULT)).call(redyintercept)
  end
  def set_red_slope(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red_slope.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_red_slope2(redslope : Float32) : HRESULT
    @lpVtbl.value.set_red_slope2.unsafe_as(Proc(Float32, HRESULT)).call(redslope)
  end
  def set_red_disable(reddisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_red_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(reddisable)
  end
  def set_green_y_intercept(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green_y_intercept.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_green_y_intercept2(greenyintercept : Float32) : HRESULT
    @lpVtbl.value.set_green_y_intercept2.unsafe_as(Proc(Float32, HRESULT)).call(greenyintercept)
  end
  def set_green_slope(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green_slope.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_green_slope2(greenslope : Float32) : HRESULT
    @lpVtbl.value.set_green_slope2.unsafe_as(Proc(Float32, HRESULT)).call(greenslope)
  end
  def set_green_disable(greendisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_green_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(greendisable)
  end
  def set_blue_y_intercept(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue_y_intercept.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_blue_y_intercept2(blueyintercept : Float32) : HRESULT
    @lpVtbl.value.set_blue_y_intercept2.unsafe_as(Proc(Float32, HRESULT)).call(blueyintercept)
  end
  def set_blue_slope(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue_slope.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_blue_slope2(blueslope : Float32) : HRESULT
    @lpVtbl.value.set_blue_slope2.unsafe_as(Proc(Float32, HRESULT)).call(blueslope)
  end
  def set_blue_disable(bluedisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_blue_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bluedisable)
  end
  def set_alpha_y_intercept(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha_y_intercept.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_alpha_y_intercept2(alphayintercept : Float32) : HRESULT
    @lpVtbl.value.set_alpha_y_intercept2.unsafe_as(Proc(Float32, HRESULT)).call(alphayintercept)
  end
  def set_alpha_slope(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha_slope.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_alpha_slope2(alphaslope : Float32) : HRESULT
    @lpVtbl.value.set_alpha_slope2.unsafe_as(Proc(Float32, HRESULT)).call(alphaslope)
  end
  def set_alpha_disable(alphadisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_alpha_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(alphadisable)
  end
  def set_clamp_output(clampoutput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(clampoutput)
  end
end
struct LibWin32::IDCompositionTableTransferEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_red_table(tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_red_table.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(tablevalues, count)
  end
  def set_green_table(tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_green_table.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(tablevalues, count)
  end
  def set_blue_table(tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_blue_table.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(tablevalues, count)
  end
  def set_alpha_table(tablevalues : Float32*, count : UInt32) : HRESULT
    @lpVtbl.value.set_alpha_table.unsafe_as(Proc(Float32*, UInt32, HRESULT)).call(tablevalues, count)
  end
  def set_red_disable(reddisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_red_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(reddisable)
  end
  def set_green_disable(greendisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_green_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(greendisable)
  end
  def set_blue_disable(bluedisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_blue_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bluedisable)
  end
  def set_alpha_disable(alphadisable : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_alpha_disable.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(alphadisable)
  end
  def set_clamp_output(clampoutput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(clampoutput)
  end
  def set_red_table_value(index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_red_table_value.unsafe_as(Proc(UInt32, IDCompositionAnimation, HRESULT)).call(index, animation)
  end
  def set_red_table_value2(index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_red_table_value2.unsafe_as(Proc(UInt32, Float32, HRESULT)).call(index, value)
  end
  def set_green_table_value(index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_green_table_value.unsafe_as(Proc(UInt32, IDCompositionAnimation, HRESULT)).call(index, animation)
  end
  def set_green_table_value2(index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_green_table_value2.unsafe_as(Proc(UInt32, Float32, HRESULT)).call(index, value)
  end
  def set_blue_table_value(index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_blue_table_value.unsafe_as(Proc(UInt32, IDCompositionAnimation, HRESULT)).call(index, animation)
  end
  def set_blue_table_value2(index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_blue_table_value2.unsafe_as(Proc(UInt32, Float32, HRESULT)).call(index, value)
  end
  def set_alpha_table_value(index : UInt32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_alpha_table_value.unsafe_as(Proc(UInt32, IDCompositionAnimation, HRESULT)).call(index, animation)
  end
  def set_alpha_table_value2(index : UInt32, value : Float32) : HRESULT
    @lpVtbl.value.set_alpha_table_value2.unsafe_as(Proc(UInt32, Float32, HRESULT)).call(index, value)
  end
end
struct LibWin32::IDCompositionCompositeEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_mode(mode : D2D1_COMPOSITE_MODE) : HRESULT
    @lpVtbl.value.set_mode.unsafe_as(Proc(D2D1_COMPOSITE_MODE, HRESULT)).call(mode)
  end
end
struct LibWin32::IDCompositionBlendEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_mode(mode : D2D1_BLEND_MODE) : HRESULT
    @lpVtbl.value.set_mode.unsafe_as(Proc(D2D1_BLEND_MODE, HRESULT)).call(mode)
  end
end
struct LibWin32::IDCompositionArithmeticCompositeEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_coefficients(coefficients : D2D_VECTOR_4F*) : HRESULT
    @lpVtbl.value.set_coefficients.unsafe_as(Proc(D2D_VECTOR_4F*, HRESULT)).call(coefficients)
  end
  def set_clamp_output(clampoutput : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_clamp_output.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(clampoutput)
  end
  def set_coefficient1(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient1.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_coefficient12(coeffcient1 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient12.unsafe_as(Proc(Float32, HRESULT)).call(coeffcient1)
  end
  def set_coefficient2(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient2.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_coefficient22(coefficient2 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient22.unsafe_as(Proc(Float32, HRESULT)).call(coefficient2)
  end
  def set_coefficient3(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient3.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_coefficient32(coefficient3 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient32.unsafe_as(Proc(Float32, HRESULT)).call(coefficient3)
  end
  def set_coefficient4(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_coefficient4.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_coefficient42(coefficient4 : Float32) : HRESULT
    @lpVtbl.value.set_coefficient42.unsafe_as(Proc(Float32, HRESULT)).call(coefficient4)
  end
end
struct LibWin32::IDCompositionAffineTransform2DEffect
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_input(index : UInt32, input : IUnknown, flags : UInt32) : HRESULT
    @lpVtbl.value.set_input.unsafe_as(Proc(UInt32, IUnknown, UInt32, HRESULT)).call(index, input, flags)
  end
  def set_interpolation_mode(interpolationmode : D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE) : HRESULT
    @lpVtbl.value.set_interpolation_mode.unsafe_as(Proc(D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, HRESULT)).call(interpolationmode)
  end
  def set_border_mode(bordermode : D2D1_BORDER_MODE) : HRESULT
    @lpVtbl.value.set_border_mode.unsafe_as(Proc(D2D1_BORDER_MODE, HRESULT)).call(bordermode)
  end
  def set_transform_matrix(transformmatrix : D2D_MATRIX_3X2_F*) : HRESULT
    @lpVtbl.value.set_transform_matrix.unsafe_as(Proc(D2D_MATRIX_3X2_F*, HRESULT)).call(transformmatrix)
  end
  def set_transform_matrix_element(row : Int32, column : Int32, animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_transform_matrix_element.unsafe_as(Proc(Int32, Int32, IDCompositionAnimation, HRESULT)).call(row, column, animation)
  end
  def set_transform_matrix_element2(row : Int32, column : Int32, value : Float32) : HRESULT
    @lpVtbl.value.set_transform_matrix_element2.unsafe_as(Proc(Int32, Int32, Float32, HRESULT)).call(row, column, value)
  end
  def set_sharpness(animation : IDCompositionAnimation) : HRESULT
    @lpVtbl.value.set_sharpness.unsafe_as(Proc(IDCompositionAnimation, HRESULT)).call(animation)
  end
  def set_sharpness2(sharpness : Float32) : HRESULT
    @lpVtbl.value.set_sharpness2.unsafe_as(Proc(Float32, HRESULT)).call(sharpness)
  end
end
struct LibWin32::IDCompositionDelegatedInkTrail
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_trail_points(inkpoints : DCompositionInkTrailPoint*, inkpointscount : UInt32, generationid : UInt32*) : HRESULT
    @lpVtbl.value.add_trail_points.unsafe_as(Proc(DCompositionInkTrailPoint*, UInt32, UInt32*, HRESULT)).call(inkpoints, inkpointscount, generationid)
  end
  def add_trail_points_with_prediction(inkpoints : DCompositionInkTrailPoint*, inkpointscount : UInt32, predictedinkpoints : DCompositionInkTrailPoint*, predictedinkpointscount : UInt32, generationid : UInt32*) : HRESULT
    @lpVtbl.value.add_trail_points_with_prediction.unsafe_as(Proc(DCompositionInkTrailPoint*, UInt32, DCompositionInkTrailPoint*, UInt32, UInt32*, HRESULT)).call(inkpoints, inkpointscount, predictedinkpoints, predictedinkpointscount, generationid)
  end
  def remove_trail_points(generationid : UInt32) : HRESULT
    @lpVtbl.value.remove_trail_points.unsafe_as(Proc(UInt32, HRESULT)).call(generationid)
  end
  def start_new_trail(color : D2D1_COLOR_F*) : HRESULT
    @lpVtbl.value.start_new_trail.unsafe_as(Proc(D2D1_COLOR_F*, HRESULT)).call(color)
  end
end
struct LibWin32::IDCompositionInkTrailDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_delegated_ink_trail(inktrail : IDCompositionDelegatedInkTrail*) : HRESULT
    @lpVtbl.value.create_delegated_ink_trail.unsafe_as(Proc(IDCompositionDelegatedInkTrail*, HRESULT)).call(inktrail)
  end
  def create_delegated_ink_trail_for_swap_chain(swapchain : IUnknown, inktrail : IDCompositionDelegatedInkTrail*) : HRESULT
    @lpVtbl.value.create_delegated_ink_trail_for_swap_chain.unsafe_as(Proc(IUnknown, IDCompositionDelegatedInkTrail*, HRESULT)).call(swapchain, inktrail)
  end
end
