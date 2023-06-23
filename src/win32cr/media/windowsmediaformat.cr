require "../system/com.cr"
require "../foundation.cr"
require "../media/directshow.cr"
require "../graphics/gdi.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wmvcore.dll")]
{% else %}
@[Link("wmvcore")]
{% end %}
lib LibWin32
  WMT_VIDEOIMAGE_SAMPLE_INPUT_FRAME = 1_u32
  WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME = 2_u32
  WMT_VIDEOIMAGE_SAMPLE_USES_CURRENT_INPUT_FRAME = 4_u32
  WMT_VIDEOIMAGE_SAMPLE_USES_PREVIOUS_INPUT_FRAME = 8_u32
  WMT_VIDEOIMAGE_SAMPLE_MOTION = 1_u32
  WMT_VIDEOIMAGE_SAMPLE_ROTATION = 2_u32
  WMT_VIDEOIMAGE_SAMPLE_BLENDING = 4_u32
  WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING = 8_u32
  WMT_VIDEOIMAGE_INTEGER_DENOMINATOR = 65536_i32
  WMT_VIDEOIMAGE_MAGIC_NUMBER = 491406834_u32
  WMT_VIDEOIMAGE_MAGIC_NUMBER_2 = 491406835_u32
  WMT_VIDEOIMAGE_TRANSITION_BOW_TIE = 11_u32
  WMT_VIDEOIMAGE_TRANSITION_CIRCLE = 12_u32
  WMT_VIDEOIMAGE_TRANSITION_CROSS_FADE = 13_u32
  WMT_VIDEOIMAGE_TRANSITION_DIAGONAL = 14_u32
  WMT_VIDEOIMAGE_TRANSITION_DIAMOND = 15_u32
  WMT_VIDEOIMAGE_TRANSITION_FADE_TO_COLOR = 16_u32
  WMT_VIDEOIMAGE_TRANSITION_FILLED_V = 17_u32
  WMT_VIDEOIMAGE_TRANSITION_FLIP = 18_u32
  WMT_VIDEOIMAGE_TRANSITION_INSET = 19_u32
  WMT_VIDEOIMAGE_TRANSITION_IRIS = 20_u32
  WMT_VIDEOIMAGE_TRANSITION_PAGE_ROLL = 21_u32
  WMT_VIDEOIMAGE_TRANSITION_RECTANGLE = 23_u32
  WMT_VIDEOIMAGE_TRANSITION_REVEAL = 24_u32
  WMT_VIDEOIMAGE_TRANSITION_SLIDE = 27_u32
  WMT_VIDEOIMAGE_TRANSITION_SPLIT = 29_u32
  WMT_VIDEOIMAGE_TRANSITION_STAR = 30_u32
  WMT_VIDEOIMAGE_TRANSITION_WHEEL = 31_u32
  WM_SampleExtension_ContentType_Size = 1_u32
  WM_SampleExtension_PixelAspectRatio_Size = 2_u32
  WM_SampleExtension_Timecode_Size = 14_u32
  WM_SampleExtension_SampleDuration_Size = 2_u32
  WM_SampleExtension_ChromaLocation_Size = 1_u32
  WM_SampleExtension_ColorSpaceInfo_Size = 3_u32
  WM_CT_REPEAT_FIRST_FIELD = 16_u32
  WM_CT_BOTTOM_FIELD_FIRST = 32_u32
  WM_CT_TOP_FIELD_FIRST = 64_u32
  WM_CT_INTERLACED = 128_u32
  WM_CL_INTERLACED420 = 0_u32
  WM_CL_PROGRESSIVE420 = 1_u32
  WM_MAX_VIDEO_STREAMS = 63_u32
  WM_MAX_STREAMS = 63_u32
  WMDRM_IMPORT_INIT_STRUCT_DEFINED = 1_u32
  DRM_OPL_TYPES = 1_u32
  G_dwwmspecialattributes = 20_u32
  G_wszwmduration = "Duration"
  G_wszwmbitrate = "Bitrate"
  G_wszwmseekable = "Seekable"
  G_wszwmstridable = "Stridable"
  G_wszwmbroadcast = "Broadcast"
  G_wszwmprotected = "Is_Protected"
  G_wszwmtrusted = "Is_Trusted"
  G_wszwmsignature_name = "Signature_Name"
  G_wszwmhasaudio = "HasAudio"
  G_wszwmhasimage = "HasImage"
  G_wszwmhasscript = "HasScript"
  G_wszwmhasvideo = "HasVideo"
  G_wszwmcurrentbitrate = "CurrentBitrate"
  G_wszwmoptimalbitrate = "OptimalBitrate"
  G_wszwmhasattachedimages = "HasAttachedImages"
  G_wszwmskipbackward = "Can_Skip_Backward"
  G_wszwmskipforward = "Can_Skip_Forward"
  G_wszwmnumberofframes = "NumberOfFrames"
  G_wszwmfilesize = "FileSize"
  G_wszwmhasarbitrarydatastream = "HasArbitraryDataStream"
  G_wszwmhasfiletransferstream = "HasFileTransferStream"
  G_wszwmcontainerformat = "WM/ContainerFormat"
  G_dwwmcontentattributes = 5_u32
  G_wszwmtitle = "Title"
  G_wszwmtitlesort = "TitleSort"
  G_wszwmauthor = "Author"
  G_wszwmauthorsort = "AuthorSort"
  G_wszwmdescription = "Description"
  G_wszwmrating = "Rating"
  G_wszwmcopyright = "Copyright"
  G_wszwmuse_drm = "Use_DRM"
  G_wszwmdrm_flags = "DRM_Flags"
  G_wszwmdrm_level = "DRM_Level"
  G_wszwmuse_advanced_drm = "Use_Advanced_DRM"
  G_wszwmdrm_keyseed = "DRM_KeySeed"
  G_wszwmdrm_keyid = "DRM_KeyID"
  G_wszwmdrm_contentid = "DRM_ContentID"
  G_wszwmdrm_sourceid = "DRM_SourceID"
  G_wszwmdrm_individualizedversion = "DRM_IndividualizedVersion"
  G_wszwmdrm_licenseacqurl = "DRM_LicenseAcqURL"
  G_wszwmdrm_v1licenseacqurl = "DRM_V1LicenseAcqURL"
  G_wszwmdrm_headersignprivkey = "DRM_HeaderSignPrivKey"
  G_wszwmdrm_lasignatureprivkey = "DRM_LASignaturePrivKey"
  G_wszwmdrm_lasignaturecert = "DRM_LASignatureCert"
  G_wszwmdrm_lasignaturelicsrvcert = "DRM_LASignatureLicSrvCert"
  G_wszwmdrm_lasignaturerootcert = "DRM_LASignatureRootCert"
  G_wszwmalbumtitle = "WM/AlbumTitle"
  G_wszwmalbumtitlesort = "WM/AlbumTitleSort"
  G_wszwmtrack = "WM/Track"
  G_wszwmpromotionurl = "WM/PromotionURL"
  G_wszwmalbumcoverurl = "WM/AlbumCoverURL"
  G_wszwmgenre = "WM/Genre"
  G_wszwmyear = "WM/Year"
  G_wszwmgenreid = "WM/GenreID"
  G_wszwmmcdi = "WM/MCDI"
  G_wszwmcomposer = "WM/Composer"
  G_wszwmcomposersort = "WM/ComposerSort"
  G_wszwmlyrics = "WM/Lyrics"
  G_wszwmtracknumber = "WM/TrackNumber"
  G_wszwmtoolname = "WM/ToolName"
  G_wszwmtoolversion = "WM/ToolVersion"
  G_wszwmisvbr = "IsVBR"
  G_wszwmalbumartist = "WM/AlbumArtist"
  G_wszwmalbumartistsort = "WM/AlbumArtistSort"
  G_wszwmbannerimagetype = "BannerImageType"
  G_wszwmbannerimagedata = "BannerImageData"
  G_wszwmbannerimageurl = "BannerImageURL"
  G_wszwmcopyrighturl = "CopyrightURL"
  G_wszwmaspectratiox = "AspectRatioX"
  G_wszwmaspectratioy = "AspectRatioY"
  G_wszasfleakybucketpairs = "ASFLeakyBucketPairs"
  G_dwwmnscattributes = 5_u32
  G_wszwmnscname = "NSC_Name"
  G_wszwmnscaddress = "NSC_Address"
  G_wszwmnscphone = "NSC_Phone"
  G_wszwmnscemail = "NSC_Email"
  G_wszwmnscdescription = "NSC_Description"
  G_wszwmwriter = "WM/Writer"
  G_wszwmconductor = "WM/Conductor"
  G_wszwmproducer = "WM/Producer"
  G_wszwmdirector = "WM/Director"
  G_wszwmcontentgroupdescription = "WM/ContentGroupDescription"
  G_wszwmsubtitle = "WM/SubTitle"
  G_wszwmpartofset = "WM/PartOfSet"
  G_wszwmprotectiontype = "WM/ProtectionType"
  G_wszwmvideoheight = "WM/VideoHeight"
  G_wszwmvideowidth = "WM/VideoWidth"
  G_wszwmvideoframerate = "WM/VideoFrameRate"
  G_wszwmmediaclassprimaryid = "WM/MediaClassPrimaryID"
  G_wszwmmediaclasssecondaryid = "WM/MediaClassSecondaryID"
  G_wszwmperiod = "WM/Period"
  G_wszwmcategory = "WM/Category"
  G_wszwmpicture = "WM/Picture"
  G_wszwmlyrics_synchronised = "WM/Lyrics_Synchronised"
  G_wszwmoriginallyricist = "WM/OriginalLyricist"
  G_wszwmoriginalartist = "WM/OriginalArtist"
  G_wszwmoriginalalbumtitle = "WM/OriginalAlbumTitle"
  G_wszwmoriginalreleaseyear = "WM/OriginalReleaseYear"
  G_wszwmoriginalfilename = "WM/OriginalFilename"
  G_wszwmpublisher = "WM/Publisher"
  G_wszwmencodedby = "WM/EncodedBy"
  G_wszwmencodingsettings = "WM/EncodingSettings"
  G_wszwmencodingtime = "WM/EncodingTime"
  G_wszwmauthorurl = "WM/AuthorURL"
  G_wszwmuserweburl = "WM/UserWebURL"
  G_wszwmaudiofileurl = "WM/AudioFileURL"
  G_wszwmaudiosourceurl = "WM/AudioSourceURL"
  G_wszwmlanguage = "WM/Language"
  G_wszwmparentalrating = "WM/ParentalRating"
  G_wszwmbeatsperminute = "WM/BeatsPerMinute"
  G_wszwminitialkey = "WM/InitialKey"
  G_wszwmmood = "WM/Mood"
  G_wszwmtext = "WM/Text"
  G_wszwmdvdid = "WM/DVDID"
  G_wszwmwmcontentid = "WM/WMContentID"
  G_wszwmwmcollectionid = "WM/WMCollectionID"
  G_wszwmwmcollectiongroupid = "WM/WMCollectionGroupID"
  G_wszwmuniquefileidentifier = "WM/UniqueFileIdentifier"
  G_wszwmmodifiedby = "WM/ModifiedBy"
  G_wszwmradiostationname = "WM/RadioStationName"
  G_wszwmradiostationowner = "WM/RadioStationOwner"
  G_wszwmplaylistdelay = "WM/PlaylistDelay"
  G_wszwmcodec = "WM/Codec"
  G_wszwmdrm = "WM/DRM"
  G_wszwmisrc = "WM/ISRC"
  G_wszwmprovider = "WM/Provider"
  G_wszwmproviderrating = "WM/ProviderRating"
  G_wszwmproviderstyle = "WM/ProviderStyle"
  G_wszwmcontentdistributor = "WM/ContentDistributor"
  G_wszwmsubscriptioncontentid = "WM/SubscriptionContentID"
  G_wszwmwmadrcpeakreference = "WM/WMADRCPeakReference"
  G_wszwmwmadrcpeaktarget = "WM/WMADRCPeakTarget"
  G_wszwmwmadrcaveragereference = "WM/WMADRCAverageReference"
  G_wszwmwmadrcaveragetarget = "WM/WMADRCAverageTarget"
  G_wszwmstreamtypeinfo = "WM/StreamTypeInfo"
  G_wszwmpeakbitrate = "WM/PeakBitrate"
  G_wszwmasfpacketcount = "WM/ASFPacketCount"
  G_wszwmasfsecurityobjectssize = "WM/ASFSecurityObjectsSize"
  G_wszwmshareduserrating = "WM/SharedUserRating"
  G_wszwmsubtitledescription = "WM/SubTitleDescription"
  G_wszwmmediacredits = "WM/MediaCredits"
  G_wszwmparentalratingreason = "WM/ParentalRatingReason"
  G_wszwmoriginalreleasetime = "WM/OriginalReleaseTime"
  G_wszwmmediastationcallsign = "WM/MediaStationCallSign"
  G_wszwmmediastationname = "WM/MediaStationName"
  G_wszwmmedianetworkaffiliation = "WM/MediaNetworkAffiliation"
  G_wszwmmediaoriginalchannel = "WM/MediaOriginalChannel"
  G_wszwmmediaoriginalbroadcastdatetime = "WM/MediaOriginalBroadcastDateTime"
  G_wszwmmediaisstereo = "WM/MediaIsStereo"
  G_wszwmvideoclosedcaptioning = "WM/VideoClosedCaptioning"
  G_wszwmmediaisrepeat = "WM/MediaIsRepeat"
  G_wszwmmediaislive = "WM/MediaIsLive"
  G_wszwmmediaistape = "WM/MediaIsTape"
  G_wszwmmediaisdelay = "WM/MediaIsDelay"
  G_wszwmmediaissubtitled = "WM/MediaIsSubtitled"
  G_wszwmmediaispremiere = "WM/MediaIsPremiere"
  G_wszwmmediaisfinale = "WM/MediaIsFinale"
  G_wszwmmediaissap = "WM/MediaIsSAP"
  G_wszwmprovidercopyright = "WM/ProviderCopyright"
  G_wszwmisan = "WM/ISAN"
  G_wszwmadid = "WM/ADID"
  G_wszwmwmshadowfilesourcefiletype = "WM/WMShadowFileSourceFileType"
  G_wszwmwmshadowfilesourcedrmtype = "WM/WMShadowFileSourceDRMType"
  G_wszwmwmcpdistributor = "WM/WMCPDistributor"
  G_wszwmwmcpdistributorid = "WM/WMCPDistributorID"
  G_wszwmseasonnumber = "WM/SeasonNumber"
  G_wszwmepisodenumber = "WM/EpisodeNumber"
  G_wszearlydatadelivery = "EarlyDataDelivery"
  G_wszjustintimedecode = "JustInTimeDecode"
  G_wszsingleoutputbuffer = "SingleOutputBuffer"
  G_wszsoftwarescaling = "SoftwareScaling"
  G_wszdeliveronreceive = "DeliverOnReceive"
  G_wszscrambledaudio = "ScrambledAudio"
  G_wszdedicateddeliverythread = "DedicatedDeliveryThread"
  G_wszenablediscreteoutput = "EnableDiscreteOutput"
  G_wszspeakerconfig = "SpeakerConfig"
  G_wszdynamicrangecontrol = "DynamicRangeControl"
  G_wszallowinterlacedoutput = "AllowInterlacedOutput"
  G_wszvideosampledurations = "VideoSampleDurations"
  G_wszstreamlanguage = "StreamLanguage"
  G_wszenablewmaprospdifoutput = "EnableWMAProSPDIFOutput"
  G_wszdeinterlacemode = "DeinterlaceMode"
  G_wszinitialpatternforinversetelecine = "InitialPatternForInverseTelecine"
  G_wszjpegcompressionquality = "JPEGCompressionQuality"
  G_wszwatermarkclsid = "WatermarkCLSID"
  G_wszwatermarkconfig = "WatermarkConfig"
  G_wszinterlacedcoding = "InterlacedCoding"
  G_wszfixedframerate = "FixedFrameRate"
  G_wszoriginalsourceformattag = "_SOURCEFORMATTAG"
  G_wszoriginalwaveformat = "_ORIGINALWAVEFORMAT"
  G_wszedl = "_EDL"
  G_wszcomplexity = "_COMPLEXITYEX"
  G_wszdecodercomplexityrequested = "_DECODERCOMPLEXITYPROFILE"
  G_wszreloadindexonseek = "ReloadIndexOnSeek"
  G_wszstreamnumindexobjects = "StreamNumIndexObjects"
  G_wszfailseekonerror = "FailSeekOnError"
  G_wszpermitseeksbeyondendofstream = "PermitSeeksBeyondEndOfStream"
  G_wszusepacketatseekpoint = "UsePacketAtSeekPoint"
  G_wszsourcebuffertime = "SourceBufferTime"
  G_wszsourcemaxbytesatonce = "SourceMaxBytesAtOnce"
  G_wszvbrenabled = "_VBRENABLED"
  G_wszvbrquality = "_VBRQUALITY"
  G_wszvbrbitratemax = "_RMAX"
  G_wszvbrbufferwindowmax = "_BMAX"
  G_wszvbrpeak = "VBR Peak"
  G_wszbufferaverage = "Buffer Average"
  G_wszcomplexitymax = "_COMPLEXITYEXMAX"
  G_wszcomplexityoffline = "_COMPLEXITYEXOFFLINE"
  G_wszcomplexitylive = "_COMPLEXITYEXLIVE"
  G_wszisvbrsupported = "_ISVBRSUPPORTED"
  G_wsznumpasses = "_PASSESUSED"
  G_wszmusicspeechclassmode = "MusicSpeechClassMode"
  G_wszmusicclassmode = "MusicClassMode"
  G_wszspeechclassmode = "SpeechClassMode"
  G_wszmixedclassmode = "MixedClassMode"
  G_wszspeechcaps = "SpeechFormatCap"
  G_wszpeakvalue = "PeakValue"
  G_wszaveragelevel = "AverageLevel"
  G_wszfold6to2channels3 = "Fold6To2Channels3"
  G_wszfoldtochannelstemplate = "Fold%luTo%luChannels%lu"
  G_wszdeviceconformancetemplate = "DeviceConformanceTemplate"
  G_wszenableframeinterpolation = "EnableFrameInterpolation"
  G_wszneedsprevioussample = "NeedsPreviousSample"
  G_wszwmiscompilation = "WM/IsCompilation"
  WMMEDIASUBTYPE_Base = "00000000-0000-0010-8000-00aa00389b71"
  WMMEDIATYPE_Video = "73646976-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_RGB1 = "e436eb78-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_RGB4 = "e436eb79-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_RGB8 = "e436eb7a-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_RGB565 = "e436eb7b-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_RGB555 = "e436eb7c-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_RGB24 = "e436eb7d-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_RGB32 = "e436eb7e-524f-11ce-9f53-0020af0ba770"
  WMMEDIASUBTYPE_I420 = "30323449-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_IYUV = "56555949-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_YV12 = "32315659-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_YUY2 = "32595559-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_P422 = "32323450-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_UYVY = "59565955-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_YVYU = "55595659-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_YVU9 = "39555659-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_VIDEOIMAGE = "1d4a45f2-e5f6-4b44-8388-f0ae5c0e0c37"
  WMMEDIASUBTYPE_MP43 = "3334504d-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_MP4S = "5334504d-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_M4S2 = "3253344d-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMV1 = "31564d57-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMV2 = "32564d57-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_MSS1 = "3153534d-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_MPEG2_VIDEO = "e06d8026-db46-11cf-b4d1-00805f6cbbea"
  WMMEDIATYPE_Audio = "73647561-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_PCM = "00000001-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_DRM = "00000009-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMAudioV9 = "00000162-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMAudio_Lossless = "00000163-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_MSS2 = "3253534d-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMSP1 = "0000000a-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMSP2 = "0000000b-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMV3 = "33564d57-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMVP = "50564d57-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WVP2 = "32505657-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMVA = "41564d57-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WVC1 = "31435657-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMAudioV8 = "00000161-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMAudioV7 = "00000161-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WMAudioV2 = "00000161-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_ACELPnet = "00000130-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_MP3 = "00000055-0000-0010-8000-00aa00389b71"
  WMMEDIASUBTYPE_WebStream = "776257d4-c627-41cb-8f81-7ac7ff1c40cc"
  WMMEDIATYPE_Script = "73636d64-0000-0010-8000-00aa00389b71"
  WMMEDIATYPE_Image = "34a50fd8-8aa5-4386-81fe-a0efe0488e31"
  WMMEDIATYPE_FileTransfer = "d9e47579-930e-4427-adfc-ad80f290e470"
  WMMEDIATYPE_Text = "9bba1ea7-5ab2-4829-ba57-0940209bcf3e"
  WMFORMAT_VideoInfo = "05589f80-c356-11ce-bf01-00aa0055595a"
  WMFORMAT_MPEG2Video = "e06d80e3-db46-11cf-b4d1-00805f6cbbea"
  WMFORMAT_WaveFormatEx = "05589f81-c356-11ce-bf01-00aa0055595a"
  WMFORMAT_Script = "5c8510f2-debe-4ca7-bba5-f07a104f8dff"
  WMFORMAT_WebStream = "da1e6b13-8359-4050-b398-388e965bf00c"
  WMSCRIPTTYPE_TwoStrings = "82f38a70-c29f-11d1-97ad-00a0c95ea850"
  WM_SampleExtensionGUID_OutputCleanPoint = "f72a3c6f-6eb4-4ebc-b192-09ad9759e828"
  WM_SampleExtensionGUID_Timecode = "399595ec-8667-4e2d-8fdb-98814ce76c1e"
  WM_SampleExtensionGUID_ChromaLocation = "4c5acca0-9276-4b2c-9e4c-a0edefdd217e"
  WM_SampleExtensionGUID_ColorSpaceInfo = "f79ada56-30eb-4f2b-9f7a-f24b139a1157"
  WM_SampleExtensionGUID_UserDataInfo = "732bb4fa-78be-4549-99bd-02db1a55b7a8"
  WM_SampleExtensionGUID_FileName = "e165ec0e-19ed-45d7-b4a7-25cbd1e28e9b"
  WM_SampleExtensionGUID_ContentType = "d590dc20-07bc-436c-9cf7-f3bbfbf1a4dc"
  WM_SampleExtensionGUID_PixelAspectRatio = "1b1ee554-f9ea-4bc8-821a-376b74e4c4b8"
  WM_SampleExtensionGUID_SampleDuration = "c6bd9450-867f-4907-83a3-c77921b733ad"
  WM_SampleExtensionGUID_SampleProtectionSalt = "5403deee-b9ee-438f-aa83-3804997e569d"
  CLSID_WMMUTEX_Language = "d6e22a00-35da-11d1-9034-00a0c90349be"
  CLSID_WMMUTEX_Bitrate = "d6e22a01-35da-11d1-9034-00a0c90349be"
  CLSID_WMMUTEX_Presentation = "d6e22a02-35da-11d1-9034-00a0c90349be"
  CLSID_WMMUTEX_Unknown = "d6e22a03-35da-11d1-9034-00a0c90349be"
  CLSID_WMBandwidthSharing_Exclusive = "af6060aa-5197-11d2-b6af-00c04fd908e9"
  CLSID_WMBandwidthSharing_Partial = "af6060ab-5197-11d2-b6af-00c04fd908e9"
  WMT_DMOCATEGORY_AUDIO_WATERMARK = "65221c5a-fa75-4b39-b50c-06c336b6a3ef"
  WMT_DMOCATEGORY_VIDEO_WATERMARK = "187cc922-8efc-4404-9daf-63f4830df1bc"
  CLSID_ClientNetManager = "cd12a3ce-9c42-11d2-beed-0060082f2054"


  enum AM_ASFWRITERCONFIG_PARAM : Int32
    AM_CONFIGASFWRITER_PARAM_AUTOINDEX = 1
    AM_CONFIGASFWRITER_PARAM_MULTIPASS = 2
    AM_CONFIGASFWRITER_PARAM_DONTCOMPRESS = 3
  end

  enum WEBSTREAM_SAMPLE_TYPE : Int32
    WEBSTREAM_SAMPLE_TYPE_FILE = 1
    WEBSTREAM_SAMPLE_TYPE_RENDER = 2
  end

  enum WM_SF_TYPE : Int32
    WM_SF_CLEANPOINT = 1
    WM_SF_DISCONTINUITY = 2
    WM_SF_DATALOSS = 4
  end

  enum WM_SFEX_TYPE : Int32
    WM_SFEX_NOTASYNCPOINT = 2
    WM_SFEX_DATALOSS = 4
  end

  enum WMT_STATUS : Int32
    WMT_ERROR = 0
    WMT_OPENED = 1
    WMT_BUFFERING_START = 2
    WMT_BUFFERING_STOP = 3
    WMT_EOF = 4
    WMT_END_OF_FILE = 4
    WMT_END_OF_SEGMENT = 5
    WMT_END_OF_STREAMING = 6
    WMT_LOCATING = 7
    WMT_CONNECTING = 8
    WMT_NO_RIGHTS = 9
    WMT_MISSING_CODEC = 10
    WMT_STARTED = 11
    WMT_STOPPED = 12
    WMT_CLOSED = 13
    WMT_STRIDING = 14
    WMT_TIMER = 15
    WMT_INDEX_PROGRESS = 16
    WMT_SAVEAS_START = 17
    WMT_SAVEAS_STOP = 18
    WMT_NEW_SOURCEFLAGS = 19
    WMT_NEW_METADATA = 20
    WMT_BACKUPRESTORE_BEGIN = 21
    WMT_SOURCE_SWITCH = 22
    WMT_ACQUIRE_LICENSE = 23
    WMT_INDIVIDUALIZE = 24
    WMT_NEEDS_INDIVIDUALIZATION = 25
    WMT_NO_RIGHTS_EX = 26
    WMT_BACKUPRESTORE_END = 27
    WMT_BACKUPRESTORE_CONNECTING = 28
    WMT_BACKUPRESTORE_DISCONNECTING = 29
    WMT_ERROR_WITHURL = 30
    WMT_RESTRICTED_LICENSE = 31
    WMT_CLIENT_CONNECT = 32
    WMT_CLIENT_DISCONNECT = 33
    WMT_NATIVE_OUTPUT_PROPS_CHANGED = 34
    WMT_RECONNECT_START = 35
    WMT_RECONNECT_END = 36
    WMT_CLIENT_CONNECT_EX = 37
    WMT_CLIENT_DISCONNECT_EX = 38
    WMT_SET_FEC_SPAN = 39
    WMT_PREROLL_READY = 40
    WMT_PREROLL_COMPLETE = 41
    WMT_CLIENT_PROPERTIES = 42
    WMT_LICENSEURL_SIGNATURE_STATE = 43
    WMT_INIT_PLAYLIST_BURN = 44
    WMT_TRANSCRYPTOR_INIT = 45
    WMT_TRANSCRYPTOR_SEEKED = 46
    WMT_TRANSCRYPTOR_READ = 47
    WMT_TRANSCRYPTOR_CLOSED = 48
    WMT_PROXIMITY_RESULT = 49
    WMT_PROXIMITY_COMPLETED = 50
    WMT_CONTENT_ENABLER = 51
  end

  enum WMT_STREAM_SELECTION : Int32
    WMT_OFF = 0
    WMT_CLEANPOINT_ONLY = 1
    WMT_ON = 2
  end

  enum WMT_IMAGE_TYPE : Int32
    WMT_IT_NONE = 0
    WMT_IT_BITMAP = 1
    WMT_IT_JPEG = 2
    WMT_IT_GIF = 3
  end

  enum WMT_ATTR_DATATYPE : Int32
    WMT_TYPE_DWORD = 0
    WMT_TYPE_STRING = 1
    WMT_TYPE_BINARY = 2
    WMT_TYPE_BOOL = 3
    WMT_TYPE_QWORD = 4
    WMT_TYPE_WORD = 5
    WMT_TYPE_GUID = 6
  end

  enum WMT_ATTR_IMAGETYPE : Int32
    WMT_IMAGETYPE_BITMAP = 1
    WMT_IMAGETYPE_JPEG = 2
    WMT_IMAGETYPE_GIF = 3
  end

  enum WMT_VERSION : Int32
    WMT_VER_4_0 = 262144
    WMT_VER_7_0 = 458752
    WMT_VER_8_0 = 524288
    WMT_VER_9_0 = 589824
  end

  enum WMT_STORAGE_FORMAT : Int32
    WMT_Storage_Format_MP3 = 0
    WMT_Storage_Format_V1 = 1
  end

  enum WMT_DRMLA_TRUST : Int32
    WMT_DRMLA_UNTRUSTED = 0
    WMT_DRMLA_TRUSTED = 1
    WMT_DRMLA_TAMPERED = 2
  end

  enum WMT_TRANSPORT_TYPE : Int32
    WMT_Transport_Type_Unreliable = 0
    WMT_Transport_Type_Reliable = 1
  end

  enum WMT_NET_PROTOCOL : Int32
    WMT_PROTOCOL_HTTP = 0
  end

  enum WMT_PLAY_MODE : Int32
    WMT_PLAY_MODE_AUTOSELECT = 0
    WMT_PLAY_MODE_LOCAL = 1
    WMT_PLAY_MODE_DOWNLOAD = 2
    WMT_PLAY_MODE_STREAMING = 3
  end

  enum WMT_PROXY_SETTINGS : Int32
    WMT_PROXY_SETTING_NONE = 0
    WMT_PROXY_SETTING_MANUAL = 1
    WMT_PROXY_SETTING_AUTO = 2
    WMT_PROXY_SETTING_BROWSER = 3
    WMT_PROXY_SETTING_MAX = 4
  end

  enum WMT_CODEC_INFO_TYPE : Int32
    WMT_CODECINFO_AUDIO = 0
    WMT_CODECINFO_VIDEO = 1
    WMT_CODECINFO_UNKNOWN = -1
  end

  enum WM_DM_INTERLACED_TYPE : Int32
    WM_DM_NOTINTERLACED = 0
    WM_DM_DEINTERLACE_NORMAL = 1
    WM_DM_DEINTERLACE_HALFSIZE = 2
    WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE = 3
    WM_DM_DEINTERLACE_INVERSETELECINE = 4
    WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE = 5
  end

  enum WM_DM_IT_FIRST_FRAME_COHERENCY : Int32
    WM_DM_IT_DISABLE_COHERENT_MODE = 0
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP = 1
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP = 2
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP = 3
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP = 4
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP = 5
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM = 6
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM = 7
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM = 8
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM = 9
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM = 10
  end

  enum WMT_OFFSET_FORMAT : Int32
    WMT_OFFSET_FORMAT_100NS = 0
    WMT_OFFSET_FORMAT_FRAME_NUMBERS = 1
    WMT_OFFSET_FORMAT_PLAYLIST_OFFSET = 2
    WMT_OFFSET_FORMAT_TIMECODE = 3
    WMT_OFFSET_FORMAT_100NS_APPROXIMATE = 4
  end

  enum WMT_INDEXER_TYPE : Int32
    WMT_IT_PRESENTATION_TIME = 0
    WMT_IT_FRAME_NUMBERS = 1
    WMT_IT_TIMECODE = 2
  end

  enum WMT_INDEX_TYPE : Int32
    WMT_IT_NEAREST_DATA_UNIT = 1
    WMT_IT_NEAREST_OBJECT = 2
    WMT_IT_NEAREST_CLEAN_POINT = 3
  end

  enum WMT_FILESINK_MODE : Int32
    WMT_FM_SINGLE_BUFFERS = 1
    WMT_FM_FILESINK_DATA_UNITS = 2
    WMT_FM_FILESINK_UNBUFFERED = 4
  end

  enum WMT_MUSICSPEECH_CLASS_MODE : Int32
    WMT_MS_CLASS_MUSIC = 0
    WMT_MS_CLASS_SPEECH = 1
    WMT_MS_CLASS_MIXED = 2
  end

  enum WMT_WATERMARK_ENTRY_TYPE : Int32
    WMT_WMETYPE_AUDIO = 1
    WMT_WMETYPE_VIDEO = 2
  end

  enum WM_PLAYBACK_DRC_LEVEL : Int32
    WM_PLAYBACK_DRC_HIGH = 0
    WM_PLAYBACK_DRC_MEDIUM = 1
    WM_PLAYBACK_DRC_LOW = 2
  end

  enum WMT_TIMECODE_FRAMERATE : Int32
    WMT_TIMECODE_FRAMERATE_30 = 0
    WMT_TIMECODE_FRAMERATE_30DROP = 1
    WMT_TIMECODE_FRAMERATE_25 = 2
    WMT_TIMECODE_FRAMERATE_24 = 3
  end

  enum WMT_CREDENTIAL_FLAGS : Int32
    WMT_CREDENTIAL_SAVE = 1
    WMT_CREDENTIAL_DONT_CACHE = 2
    WMT_CREDENTIAL_CLEAR_TEXT = 4
    WMT_CREDENTIAL_PROXY = 8
    WMT_CREDENTIAL_ENCRYPT = 16
  end

  enum WM_AETYPE : Int32
    WM_AETYPE_INCLUDE = 105
    WM_AETYPE_EXCLUDE = 101
  end

  enum WMT_RIGHTS : Int32
    WMT_RIGHT_PLAYBACK = 1
    WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE = 2
    WMT_RIGHT_COPY_TO_CD = 8
    WMT_RIGHT_COPY_TO_SDMI_DEVICE = 16
    WMT_RIGHT_ONE_TIME = 32
    WMT_RIGHT_SAVE_STREAM_PROTECTED = 64
    WMT_RIGHT_COPY = 128
    WMT_RIGHT_COLLABORATIVE_PLAY = 256
    WMT_RIGHT_SDMI_TRIGGER = 65536
    WMT_RIGHT_SDMI_NOMORECOPIES = 131072
  end

  enum NETSOURCE_URLCREDPOLICY_SETTINGS : Int32
    NETSOURCE_URLCREDPOLICY_SETTING_SILENTLOGONOK = 0
    NETSOURCE_URLCREDPOLICY_SETTING_MUSTPROMPTUSER = 1
    NETSOURCE_URLCREDPOLICY_SETTING_ANONYMOUSONLY = 2
  end

  struct AM_WMT_EVENT_DATA
    hr_status : HRESULT
    p_data : Void*
  end
  struct WM_STREAM_PRIORITY_RECORD
    w_stream_number : UInt16
    f_mandatory : LibC::BOOL
  end
  struct WM_WRITER_STATISTICS
    qw_sample_count : UInt64
    qw_byte_count : UInt64
    qw_dropped_sample_count : UInt64
    qw_dropped_byte_count : UInt64
    dw_current_bitrate : UInt32
    dw_average_bitrate : UInt32
    dw_expected_bitrate : UInt32
    dw_current_sample_rate : UInt32
    dw_average_sample_rate : UInt32
    dw_expected_sample_rate : UInt32
  end
  struct WM_WRITER_STATISTICS_EX
    dw_bitrate_plus_overhead : UInt32
    dw_current_sample_drop_rate_in_queue : UInt32
    dw_current_sample_drop_rate_in_codec : UInt32
    dw_current_sample_drop_rate_in_multiplexer : UInt32
    dw_total_sample_drops_in_queue : UInt32
    dw_total_sample_drops_in_codec : UInt32
    dw_total_sample_drops_in_multiplexer : UInt32
  end
  struct WM_READER_STATISTICS
    cb_size : UInt32
    dw_bandwidth : UInt32
    c_packets_received : UInt32
    c_packets_recovered : UInt32
    c_packets_lost : UInt32
    w_quality : UInt16
  end
  struct WM_READER_CLIENTINFO
    cb_size : UInt32
    wsz_lang : LibC::LPWSTR
    wsz_browser_user_agent : LibC::LPWSTR
    wsz_browser_web_page : LibC::LPWSTR
    qw_reserved : UInt64
    p_reserved : LPARAM*
    wsz_host_exe : LibC::LPWSTR
    qw_host_version : UInt64
    wsz_player_user_agent : LibC::LPWSTR
  end
  struct WM_CLIENT_PROPERTIES
    dw_ip_address : UInt32
    dw_port : UInt32
  end
  struct WM_CLIENT_PROPERTIES_EX
    cb_size : UInt32
    pwsz_ip_address : LibC::LPWSTR
    pwsz_port : LibC::LPWSTR
    pwsz_dns_name : LibC::LPWSTR
  end
  struct WM_PORT_NUMBER_RANGE
    w_port_begin : UInt16
    w_port_end : UInt16
  end
  struct WMT_BUFFER_SEGMENT
    p_buffer : INSSBuffer
    cb_offset : UInt32
    cb_length : UInt32
  end
  struct WMT_PAYLOAD_FRAGMENT
    dw_payload_index : UInt32
    segment_data : WMT_BUFFER_SEGMENT
  end
  struct WMT_FILESINK_DATA_UNIT
    packet_header_buffer : WMT_BUFFER_SEGMENT
    c_payloads : UInt32
    p_payload_header_buffers : WMT_BUFFER_SEGMENT*
    c_payload_data_fragments : UInt32
    p_payload_data_fragments : WMT_PAYLOAD_FRAGMENT*
  end
  struct WMT_WEBSTREAM_FORMAT
    cb_size : UInt16
    cb_sample_header_fixed_data : UInt16
    w_version : UInt16
    w_reserved : UInt16
  end
  struct WMT_WEBSTREAM_SAMPLE_HEADER
    cb_length : UInt16
    w_part : UInt16
    c_total_parts : UInt16
    w_sample_type : UInt16
    wsz_url : Char[0]*
  end
  struct WM_ADDRESS_ACCESSENTRY
    dw_ip_address : UInt32
    dw_mask : UInt32
  end
  struct WM_PICTURE
    pwsz_mime_type : LibC::LPWSTR
    b_picture_type : UInt8
    pwsz_description : LibC::LPWSTR
    dw_data_len : UInt32
    pb_data : UInt8*
  end
  struct WM_SYNCHRONISED_LYRICS
    b_time_stamp_format : UInt8
    b_content_type : UInt8
    pwsz_content_descriptor : LibC::LPWSTR
    dw_lyrics_len : UInt32
    pb_lyrics : UInt8*
  end
  struct WM_USER_WEB_URL
    pwsz_description : LibC::LPWSTR
    pwsz_url : LibC::LPWSTR
  end
  struct WM_USER_TEXT
    pwsz_description : LibC::LPWSTR
    pwsz_text : LibC::LPWSTR
  end
  struct WM_LEAKY_BUCKET_PAIR
    dw_bitrate : UInt32
    ms_buffer_window : UInt32
  end
  struct WM_STREAM_TYPE_INFO
    guid_major_type : Guid
    cb_format : UInt32
  end
  struct WMT_WATERMARK_ENTRY
    wmet_type : WMT_WATERMARK_ENTRY_TYPE
    clsid : Guid
    cb_display_name : UInt32
    pwsz_display_name : LibC::LPWSTR
  end
  struct WMT_VIDEOIMAGE_SAMPLE
    dw_magic : UInt32
    cb_struct : UInt32
    dw_control_flags : UInt32
    dw_input_flags_cur : UInt32
    l_cur_motion_xto_x : Int32
    l_cur_motion_yto_x : Int32
    l_cur_motion_xoffset : Int32
    l_cur_motion_xto_y : Int32
    l_cur_motion_yto_y : Int32
    l_cur_motion_yoffset : Int32
    l_cur_blend_coef1 : Int32
    l_cur_blend_coef2 : Int32
    dw_input_flags_prev : UInt32
    l_prev_motion_xto_x : Int32
    l_prev_motion_yto_x : Int32
    l_prev_motion_xoffset : Int32
    l_prev_motion_xto_y : Int32
    l_prev_motion_yto_y : Int32
    l_prev_motion_yoffset : Int32
    l_prev_blend_coef1 : Int32
    l_prev_blend_coef2 : Int32
  end
  struct WMT_VIDEOIMAGE_SAMPLE2
    dw_magic : UInt32
    dw_struct_size : UInt32
    dw_control_flags : UInt32
    dw_viewport_width : UInt32
    dw_viewport_height : UInt32
    dw_curr_image_width : UInt32
    dw_curr_image_height : UInt32
    f_curr_region_x0 : Float32
    f_curr_region_y0 : Float32
    f_curr_region_width : Float32
    f_curr_region_height : Float32
    f_curr_blend_coef : Float32
    dw_prev_image_width : UInt32
    dw_prev_image_height : UInt32
    f_prev_region_x0 : Float32
    f_prev_region_y0 : Float32
    f_prev_region_width : Float32
    f_prev_region_height : Float32
    f_prev_blend_coef : Float32
    dw_effect_type : UInt32
    dw_num_effect_paras : UInt32
    f_effect_para0 : Float32
    f_effect_para1 : Float32
    f_effect_para2 : Float32
    f_effect_para3 : Float32
    f_effect_para4 : Float32
    b_keep_prev_image : LibC::BOOL
  end
  struct WM_MEDIA_TYPE
    majortype : Guid
    subtype : Guid
    b_fixed_size_samples : LibC::BOOL
    b_temporal_compression : LibC::BOOL
    l_sample_size : UInt32
    formattype : Guid
    p_unk : IUnknown
    cb_format : UInt32
    pb_format : UInt8*
  end
  struct WMVIDEOINFOHEADER
    rc_source : RECT
    rc_target : RECT
    dw_bit_rate : UInt32
    dw_bit_error_rate : UInt32
    avg_time_per_frame : Int64
    bmi_header : BITMAPINFOHEADER
  end
  struct WMVIDEOINFOHEADER2
    rc_source : RECT
    rc_target : RECT
    dw_bit_rate : UInt32
    dw_bit_error_rate : UInt32
    avg_time_per_frame : Int64
    dw_interlace_flags : UInt32
    dw_copy_protect_flags : UInt32
    dw_pict_aspect_ratio_x : UInt32
    dw_pict_aspect_ratio_y : UInt32
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
    bmi_header : BITMAPINFOHEADER
  end
  struct WMMPEG2VIDEOINFO
    hdr : WMVIDEOINFOHEADER2
    dw_start_time_code : UInt32
    cb_sequence_header : UInt32
    dw_profile : UInt32
    dw_level : UInt32
    dw_flags : UInt32
    dw_sequence_header : UInt32[0]*
  end
  struct WMSCRIPTFORMAT
    script_type : Guid
  end
  struct WMT_COLORSPACEINFO_EXTENSION_DATA
    uc_color_primaries : UInt8
    uc_color_transfer_char : UInt8
    uc_color_matrix_coef : UInt8
  end
  struct WMT_TIMECODE_EXTENSION_DATA
    w_range : UInt16
    dw_timecode : UInt32
    dw_userbits : UInt32
    dw_am_flags : UInt32
  end
  struct DRM_VAL16
    val : UInt8[16]*
  end
  struct WMDRM_IMPORT_INIT_STRUCT
    dw_version : UInt32
    cb_encrypted_session_key_message : UInt32
    pb_encrypted_session_key_message : UInt8*
    cb_encrypted_key_message : UInt32
    pb_encrypted_key_message : UInt8*
  end
  struct DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS
    w_compressed_digital_video : UInt16
    w_uncompressed_digital_video : UInt16
    w_analog_video : UInt16
    w_compressed_digital_audio : UInt16
    w_uncompressed_digital_audio : UInt16
  end
  struct DRM_OPL_OUTPUT_IDS
    c_ids : UInt16
    rg_ids : Guid*
  end
  struct DRM_OUTPUT_PROTECTION
    guid_id : Guid
    b_config_data : UInt8
  end
  struct DRM_VIDEO_OUTPUT_PROTECTION_IDS
    c_entries : UInt16
    rg_vop : DRM_OUTPUT_PROTECTION*
  end
  struct DRM_PLAY_OPL
    min_opl : DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS
    opl_id_reserved : DRM_OPL_OUTPUT_IDS
    vopi : DRM_VIDEO_OUTPUT_PROTECTION_IDS
  end
  struct DRM_COPY_OPL
    w_minimum_copy_level : UInt16
    opl_id_includes : DRM_OPL_OUTPUT_IDS
    opl_id_excludes : DRM_OPL_OUTPUT_IDS
  end


  struct IAMWMBufferPassVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_notify : UInt64
  end

  IAMWMBufferPass_GUID = "6dd816d7-e740-4123-9e24-2444412644d8"
  IID_IAMWMBufferPass = LibC::GUID.new(0x6dd816d7_u32, 0xe740_u16, 0x4123_u16, StaticArray[0x9e_u8, 0x24_u8, 0x24_u8, 0x44_u8, 0x41_u8, 0x26_u8, 0x44_u8, 0xd8_u8])
  struct IAMWMBufferPass
    lpVtbl : IAMWMBufferPassVTbl*
  end

  struct IAMWMBufferPassCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    notify : UInt64
  end

  IAMWMBufferPassCallback_GUID = "b25b8372-d2d2-44b2-8653-1b8dae332489"
  IID_IAMWMBufferPassCallback = LibC::GUID.new(0xb25b8372_u32, 0xd2d2_u16, 0x44b2_u16, StaticArray[0x86_u8, 0x53_u8, 0x1b_u8, 0x8d_u8, 0xae_u8, 0x33_u8, 0x24_u8, 0x89_u8])
  struct IAMWMBufferPassCallback
    lpVtbl : IAMWMBufferPassCallbackVTbl*
  end

  struct INSSBufferVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    set_length : UInt64
    get_max_length : UInt64
    get_buffer : UInt64
    get_buffer_and_length : UInt64
  end

  INSSBuffer_GUID = "e1cd3524-03d7-11d2-9eed-006097d2d7cf"
  IID_INSSBuffer = LibC::GUID.new(0xe1cd3524_u32, 0x3d7_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xed_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd2_u8, 0xd7_u8, 0xcf_u8])
  struct INSSBuffer
    lpVtbl : INSSBufferVTbl*
  end

  struct INSSBuffer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    set_length : UInt64
    get_max_length : UInt64
    get_buffer : UInt64
    get_buffer_and_length : UInt64
    get_sample_properties : UInt64
    set_sample_properties : UInt64
  end

  INSSBuffer2_GUID = "4f528693-1035-43fe-b428-757561ad3a68"
  IID_INSSBuffer2 = LibC::GUID.new(0x4f528693_u32, 0x1035_u16, 0x43fe_u16, StaticArray[0xb4_u8, 0x28_u8, 0x75_u8, 0x75_u8, 0x61_u8, 0xad_u8, 0x3a_u8, 0x68_u8])
  struct INSSBuffer2
    lpVtbl : INSSBuffer2VTbl*
  end

  struct INSSBuffer3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    set_length : UInt64
    get_max_length : UInt64
    get_buffer : UInt64
    get_buffer_and_length : UInt64
    get_sample_properties : UInt64
    set_sample_properties : UInt64
    set_property : UInt64
    get_property : UInt64
  end

  INSSBuffer3_GUID = "c87ceaaf-75be-4bc4-84eb-ac2798507672"
  IID_INSSBuffer3 = LibC::GUID.new(0xc87ceaaf_u32, 0x75be_u16, 0x4bc4_u16, StaticArray[0x84_u8, 0xeb_u8, 0xac_u8, 0x27_u8, 0x98_u8, 0x50_u8, 0x76_u8, 0x72_u8])
  struct INSSBuffer3
    lpVtbl : INSSBuffer3VTbl*
  end

  struct INSSBuffer4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    set_length : UInt64
    get_max_length : UInt64
    get_buffer : UInt64
    get_buffer_and_length : UInt64
    get_sample_properties : UInt64
    set_sample_properties : UInt64
    set_property : UInt64
    get_property : UInt64
    get_property_count : UInt64
    get_property_by_index : UInt64
  end

  INSSBuffer4_GUID = "b6b8fd5a-32e2-49d4-a910-c26cc85465ed"
  IID_INSSBuffer4 = LibC::GUID.new(0xb6b8fd5a_u32, 0x32e2_u16, 0x49d4_u16, StaticArray[0xa9_u8, 0x10_u8, 0xc2_u8, 0x6c_u8, 0xc8_u8, 0x54_u8, 0x65_u8, 0xed_u8])
  struct INSSBuffer4
    lpVtbl : INSSBuffer4VTbl*
  end

  struct IWMSBufferAllocatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    allocate_buffer : UInt64
    allocate_page_size_buffer : UInt64
  end

  IWMSBufferAllocator_GUID = "61103ca4-2033-11d2-9ef1-006097d2d7cf"
  IID_IWMSBufferAllocator = LibC::GUID.new(0x61103ca4_u32, 0x2033_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xf1_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd2_u8, 0xd7_u8, 0xcf_u8])
  struct IWMSBufferAllocator
    lpVtbl : IWMSBufferAllocatorVTbl*
  end

  struct IWMMediaPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    get_media_type : UInt64
    set_media_type : UInt64
  end

  IWMMediaProps_GUID = "96406bce-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMMediaProps = LibC::GUID.new(0x96406bce_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMMediaProps
    lpVtbl : IWMMediaPropsVTbl*
  end

  struct IWMVideoMediaPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    get_media_type : UInt64
    set_media_type : UInt64
    get_max_key_frame_spacing : UInt64
    set_max_key_frame_spacing : UInt64
    get_quality : UInt64
    set_quality : UInt64
  end

  IWMVideoMediaProps_GUID = "96406bcf-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMVideoMediaProps = LibC::GUID.new(0x96406bcf_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMVideoMediaProps
    lpVtbl : IWMVideoMediaPropsVTbl*
  end

  struct IWMWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_profile_by_id : UInt64
    set_profile : UInt64
    set_output_filename : UInt64
    get_input_count : UInt64
    get_input_props : UInt64
    set_input_props : UInt64
    get_input_format_count : UInt64
    get_input_format : UInt64
    begin_writing : UInt64
    end_writing : UInt64
    allocate_sample : UInt64
    write_sample : UInt64
    flush : UInt64
  end

  IWMWriter_GUID = "96406bd4-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriter = LibC::GUID.new(0x96406bd4_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMWriter
    lpVtbl : IWMWriterVTbl*
  end

  struct IWMDRMWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    generate_key_seed : UInt64
    generate_key_id : UInt64
    generate_signing_key_pair : UInt64
    set_drm_attribute : UInt64
  end

  IWMDRMWriter_GUID = "d6ea5dd0-12a0-43f4-90ab-a3fd451e6a07"
  IID_IWMDRMWriter = LibC::GUID.new(0xd6ea5dd0_u32, 0x12a0_u16, 0x43f4_u16, StaticArray[0x90_u8, 0xab_u8, 0xa3_u8, 0xfd_u8, 0x45_u8, 0x1e_u8, 0x6a_u8, 0x7_u8])
  struct IWMDRMWriter
    lpVtbl : IWMDRMWriterVTbl*
  end

  struct IWMDRMWriter2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    generate_key_seed : UInt64
    generate_key_id : UInt64
    generate_signing_key_pair : UInt64
    set_drm_attribute : UInt64
    set_wmdrm_net_encryption : UInt64
  end

  IWMDRMWriter2_GUID = "38ee7a94-40e2-4e10-aa3f-33fd3210ed5b"
  IID_IWMDRMWriter2 = LibC::GUID.new(0x38ee7a94_u32, 0x40e2_u16, 0x4e10_u16, StaticArray[0xaa_u8, 0x3f_u8, 0x33_u8, 0xfd_u8, 0x32_u8, 0x10_u8, 0xed_u8, 0x5b_u8])
  struct IWMDRMWriter2
    lpVtbl : IWMDRMWriter2VTbl*
  end

  struct IWMDRMWriter3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    generate_key_seed : UInt64
    generate_key_id : UInt64
    generate_signing_key_pair : UInt64
    set_drm_attribute : UInt64
    set_wmdrm_net_encryption : UInt64
    set_protect_stream_samples : UInt64
  end

  IWMDRMWriter3_GUID = "a7184082-a4aa-4dde-ac9c-e75dbd1117ce"
  IID_IWMDRMWriter3 = LibC::GUID.new(0xa7184082_u32, 0xa4aa_u16, 0x4dde_u16, StaticArray[0xac_u8, 0x9c_u8, 0xe7_u8, 0x5d_u8, 0xbd_u8, 0x11_u8, 0x17_u8, 0xce_u8])
  struct IWMDRMWriter3
    lpVtbl : IWMDRMWriter3VTbl*
  end

  struct IWMInputMediaPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    get_media_type : UInt64
    set_media_type : UInt64
    get_connection_name : UInt64
    get_group_name : UInt64
  end

  IWMInputMediaProps_GUID = "96406bd5-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMInputMediaProps = LibC::GUID.new(0x96406bd5_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMInputMediaProps
    lpVtbl : IWMInputMediaPropsVTbl*
  end

  struct IWMPropertyVaultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_count : UInt64
    get_property_by_name : UInt64
    set_property : UInt64
    get_property_by_index : UInt64
    copy_properties_from : UInt64
    clear : UInt64
  end

  IWMPropertyVault_GUID = "72995a79-5090-42a4-9c8c-d9d0b6d34be5"
  IID_IWMPropertyVault = LibC::GUID.new(0x72995a79_u32, 0x5090_u16, 0x42a4_u16, StaticArray[0x9c_u8, 0x8c_u8, 0xd9_u8, 0xd0_u8, 0xb6_u8, 0xd3_u8, 0x4b_u8, 0xe5_u8])
  struct IWMPropertyVault
    lpVtbl : IWMPropertyVaultVTbl*
  end

  struct IWMIStreamPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property : UInt64
  end

  IWMIStreamProps_GUID = "6816dad3-2b4b-4c8e-8149-874c3483a753"
  IID_IWMIStreamProps = LibC::GUID.new(0x6816dad3_u32, 0x2b4b_u16, 0x4c8e_u16, StaticArray[0x81_u8, 0x49_u8, 0x87_u8, 0x4c_u8, 0x34_u8, 0x83_u8, 0xa7_u8, 0x53_u8])
  struct IWMIStreamProps
    lpVtbl : IWMIStreamPropsVTbl*
  end

  struct IWMReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    get_output_count : UInt64
    get_output_props : UInt64
    set_output_props : UInt64
    get_output_format_count : UInt64
    get_output_format : UInt64
    start : UInt64
    stop : UInt64
    pause : UInt64
    resume : UInt64
  end

  IWMReader_GUID = "96406bd6-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReader = LibC::GUID.new(0x96406bd6_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReader
    lpVtbl : IWMReaderVTbl*
  end

  struct IWMSyncReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    set_range : UInt64
    set_range_by_frame : UInt64
    get_next_sample : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_read_stream_samples : UInt64
    get_read_stream_samples : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    get_output_count : UInt64
    get_output_props : UInt64
    set_output_props : UInt64
    get_output_format_count : UInt64
    get_output_format : UInt64
    get_output_number_for_stream : UInt64
    get_stream_number_for_output : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    open_stream : UInt64
  end

  IWMSyncReader_GUID = "9397f121-7705-4dc9-b049-98b698188414"
  IID_IWMSyncReader = LibC::GUID.new(0x9397f121_u32, 0x7705_u16, 0x4dc9_u16, StaticArray[0xb0_u8, 0x49_u8, 0x98_u8, 0xb6_u8, 0x98_u8, 0x18_u8, 0x84_u8, 0x14_u8])
  struct IWMSyncReader
    lpVtbl : IWMSyncReaderVTbl*
  end

  struct IWMSyncReader2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    set_range : UInt64
    set_range_by_frame : UInt64
    get_next_sample : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_read_stream_samples : UInt64
    get_read_stream_samples : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    get_output_count : UInt64
    get_output_props : UInt64
    set_output_props : UInt64
    get_output_format_count : UInt64
    get_output_format : UInt64
    get_output_number_for_stream : UInt64
    get_stream_number_for_output : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    open_stream : UInt64
    set_range_by_timecode : UInt64
    set_range_by_frame_ex : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
  end

  IWMSyncReader2_GUID = "faed3d21-1b6b-4af7-8cb6-3e189bbc187b"
  IID_IWMSyncReader2 = LibC::GUID.new(0xfaed3d21_u32, 0x1b6b_u16, 0x4af7_u16, StaticArray[0x8c_u8, 0xb6_u8, 0x3e_u8, 0x18_u8, 0x9b_u8, 0xbc_u8, 0x18_u8, 0x7b_u8])
  struct IWMSyncReader2
    lpVtbl : IWMSyncReader2VTbl*
  end

  struct IWMOutputMediaPropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    get_media_type : UInt64
    set_media_type : UInt64
    get_stream_group_name : UInt64
    get_connection_name : UInt64
  end

  IWMOutputMediaProps_GUID = "96406bd7-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMOutputMediaProps = LibC::GUID.new(0x96406bd7_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMOutputMediaProps
    lpVtbl : IWMOutputMediaPropsVTbl*
  end

  struct IWMStatusCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_status : UInt64
  end

  IWMStatusCallback_GUID = "6d7cdc70-9888-11d3-8edc-00c04f6109cf"
  IID_IWMStatusCallback = LibC::GUID.new(0x6d7cdc70_u32, 0x9888_u16, 0x11d3_u16, StaticArray[0x8e_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x9_u8, 0xcf_u8])
  struct IWMStatusCallback
    lpVtbl : IWMStatusCallbackVTbl*
  end

  struct IWMReaderCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_status : UInt64
    on_sample : UInt64
  end

  IWMReaderCallback_GUID = "96406bd8-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderCallback = LibC::GUID.new(0x96406bd8_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReaderCallback
    lpVtbl : IWMReaderCallbackVTbl*
  end

  struct IWMCredentialCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    acquire_credentials : UInt64
  end

  IWMCredentialCallback_GUID = "342e0eb7-e651-450c-975b-2ace2c90c48e"
  IID_IWMCredentialCallback = LibC::GUID.new(0x342e0eb7_u32, 0xe651_u16, 0x450c_u16, StaticArray[0x97_u8, 0x5b_u8, 0x2a_u8, 0xce_u8, 0x2c_u8, 0x90_u8, 0xc4_u8, 0x8e_u8])
  struct IWMCredentialCallback
    lpVtbl : IWMCredentialCallbackVTbl*
  end

  struct IWMMetadataEditorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    flush : UInt64
  end

  IWMMetadataEditor_GUID = "96406bd9-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMMetadataEditor = LibC::GUID.new(0x96406bd9_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMMetadataEditor
    lpVtbl : IWMMetadataEditorVTbl*
  end

  struct IWMMetadataEditor2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    open : UInt64
    close : UInt64
    flush : UInt64
    open_ex : UInt64
  end

  IWMMetadataEditor2_GUID = "203cffe3-2e18-4fdf-b59d-6e71530534cf"
  IID_IWMMetadataEditor2 = LibC::GUID.new(0x203cffe3_u32, 0x2e18_u16, 0x4fdf_u16, StaticArray[0xb5_u8, 0x9d_u8, 0x6e_u8, 0x71_u8, 0x53_u8, 0x5_u8, 0x34_u8, 0xcf_u8])
  struct IWMMetadataEditor2
    lpVtbl : IWMMetadataEditor2VTbl*
  end

  struct IWMDRMEditorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_drm_property : UInt64
  end

  IWMDRMEditor_GUID = "ff130ebc-a6c3-42a6-b401-c3382c3e08b3"
  IID_IWMDRMEditor = LibC::GUID.new(0xff130ebc_u32, 0xa6c3_u16, 0x42a6_u16, StaticArray[0xb4_u8, 0x1_u8, 0xc3_u8, 0x38_u8, 0x2c_u8, 0x3e_u8, 0x8_u8, 0xb3_u8])
  struct IWMDRMEditor
    lpVtbl : IWMDRMEditorVTbl*
  end

  struct IWMHeaderInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_count : UInt64
    get_attribute_by_index : UInt64
    get_attribute_by_name : UInt64
    set_attribute : UInt64
    get_marker_count : UInt64
    get_marker : UInt64
    add_marker : UInt64
    remove_marker : UInt64
    get_script_count : UInt64
    get_script : UInt64
    add_script : UInt64
    remove_script : UInt64
  end

  IWMHeaderInfo_GUID = "96406bda-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMHeaderInfo = LibC::GUID.new(0x96406bda_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMHeaderInfo
    lpVtbl : IWMHeaderInfoVTbl*
  end

  struct IWMHeaderInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_count : UInt64
    get_attribute_by_index : UInt64
    get_attribute_by_name : UInt64
    set_attribute : UInt64
    get_marker_count : UInt64
    get_marker : UInt64
    add_marker : UInt64
    remove_marker : UInt64
    get_script_count : UInt64
    get_script : UInt64
    add_script : UInt64
    remove_script : UInt64
    get_codec_info_count : UInt64
    get_codec_info : UInt64
  end

  IWMHeaderInfo2_GUID = "15cf9781-454e-482e-b393-85fae487a810"
  IID_IWMHeaderInfo2 = LibC::GUID.new(0x15cf9781_u32, 0x454e_u16, 0x482e_u16, StaticArray[0xb3_u8, 0x93_u8, 0x85_u8, 0xfa_u8, 0xe4_u8, 0x87_u8, 0xa8_u8, 0x10_u8])
  struct IWMHeaderInfo2
    lpVtbl : IWMHeaderInfo2VTbl*
  end

  struct IWMHeaderInfo3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_attribute_count : UInt64
    get_attribute_by_index : UInt64
    get_attribute_by_name : UInt64
    set_attribute : UInt64
    get_marker_count : UInt64
    get_marker : UInt64
    add_marker : UInt64
    remove_marker : UInt64
    get_script_count : UInt64
    get_script : UInt64
    add_script : UInt64
    remove_script : UInt64
    get_codec_info_count : UInt64
    get_codec_info : UInt64
    get_attribute_count_ex : UInt64
    get_attribute_indices : UInt64
    get_attribute_by_index_ex : UInt64
    modify_attribute : UInt64
    add_attribute : UInt64
    delete_attribute : UInt64
    add_codec_info : UInt64
  end

  IWMHeaderInfo3_GUID = "15cc68e3-27cc-4ecd-b222-3f5d02d80bd5"
  IID_IWMHeaderInfo3 = LibC::GUID.new(0x15cc68e3_u32, 0x27cc_u16, 0x4ecd_u16, StaticArray[0xb2_u8, 0x22_u8, 0x3f_u8, 0x5d_u8, 0x2_u8, 0xd8_u8, 0xb_u8, 0xd5_u8])
  struct IWMHeaderInfo3
    lpVtbl : IWMHeaderInfo3VTbl*
  end

  struct IWMProfileManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_empty_profile : UInt64
    load_profile_by_id : UInt64
    load_profile_by_data : UInt64
    save_profile : UInt64
    get_system_profile_count : UInt64
    load_system_profile : UInt64
  end

  IWMProfileManager_GUID = "d16679f2-6ca0-472d-8d31-2f5d55aee155"
  IID_IWMProfileManager = LibC::GUID.new(0xd16679f2_u32, 0x6ca0_u16, 0x472d_u16, StaticArray[0x8d_u8, 0x31_u8, 0x2f_u8, 0x5d_u8, 0x55_u8, 0xae_u8, 0xe1_u8, 0x55_u8])
  struct IWMProfileManager
    lpVtbl : IWMProfileManagerVTbl*
  end

  struct IWMProfileManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_empty_profile : UInt64
    load_profile_by_id : UInt64
    load_profile_by_data : UInt64
    save_profile : UInt64
    get_system_profile_count : UInt64
    load_system_profile : UInt64
    get_system_profile_version : UInt64
    set_system_profile_version : UInt64
  end

  IWMProfileManager2_GUID = "7a924e51-73c1-494d-8019-23d37ed9b89a"
  IID_IWMProfileManager2 = LibC::GUID.new(0x7a924e51_u32, 0x73c1_u16, 0x494d_u16, StaticArray[0x80_u8, 0x19_u8, 0x23_u8, 0xd3_u8, 0x7e_u8, 0xd9_u8, 0xb8_u8, 0x9a_u8])
  struct IWMProfileManager2
    lpVtbl : IWMProfileManager2VTbl*
  end

  struct IWMProfileManagerLanguageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_user_language_id : UInt64
    set_user_language_id : UInt64
  end

  IWMProfileManagerLanguage_GUID = "ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454"
  IID_IWMProfileManagerLanguage = LibC::GUID.new(0xba4dcc78_u32, 0x7ee0_u16, 0x4ab8_u16, StaticArray[0xb2_u8, 0x7a_u8, 0xdb_u8, 0xce_u8, 0x8b_u8, 0xc5_u8, 0x14_u8, 0x54_u8])
  struct IWMProfileManagerLanguage
    lpVtbl : IWMProfileManagerLanguageVTbl*
  end

  struct IWMProfileVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_version : UInt64
    get_name : UInt64
    set_name : UInt64
    get_description : UInt64
    set_description : UInt64
    get_stream_count : UInt64
    get_stream : UInt64
    get_stream_by_number : UInt64
    remove_stream : UInt64
    remove_stream_by_number : UInt64
    add_stream : UInt64
    reconfig_stream : UInt64
    create_new_stream : UInt64
    get_mutual_exclusion_count : UInt64
    get_mutual_exclusion : UInt64
    remove_mutual_exclusion : UInt64
    add_mutual_exclusion : UInt64
    create_new_mutual_exclusion : UInt64
  end

  IWMProfile_GUID = "96406bdb-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMProfile = LibC::GUID.new(0x96406bdb_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMProfile
    lpVtbl : IWMProfileVTbl*
  end

  struct IWMProfile2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_version : UInt64
    get_name : UInt64
    set_name : UInt64
    get_description : UInt64
    set_description : UInt64
    get_stream_count : UInt64
    get_stream : UInt64
    get_stream_by_number : UInt64
    remove_stream : UInt64
    remove_stream_by_number : UInt64
    add_stream : UInt64
    reconfig_stream : UInt64
    create_new_stream : UInt64
    get_mutual_exclusion_count : UInt64
    get_mutual_exclusion : UInt64
    remove_mutual_exclusion : UInt64
    add_mutual_exclusion : UInt64
    create_new_mutual_exclusion : UInt64
    get_profile_id : UInt64
  end

  IWMProfile2_GUID = "07e72d33-d94e-4be7-8843-60ae5ff7e5f5"
  IID_IWMProfile2 = LibC::GUID.new(0x7e72d33_u32, 0xd94e_u16, 0x4be7_u16, StaticArray[0x88_u8, 0x43_u8, 0x60_u8, 0xae_u8, 0x5f_u8, 0xf7_u8, 0xe5_u8, 0xf5_u8])
  struct IWMProfile2
    lpVtbl : IWMProfile2VTbl*
  end

  struct IWMProfile3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_version : UInt64
    get_name : UInt64
    set_name : UInt64
    get_description : UInt64
    set_description : UInt64
    get_stream_count : UInt64
    get_stream : UInt64
    get_stream_by_number : UInt64
    remove_stream : UInt64
    remove_stream_by_number : UInt64
    add_stream : UInt64
    reconfig_stream : UInt64
    create_new_stream : UInt64
    get_mutual_exclusion_count : UInt64
    get_mutual_exclusion : UInt64
    remove_mutual_exclusion : UInt64
    add_mutual_exclusion : UInt64
    create_new_mutual_exclusion : UInt64
    get_profile_id : UInt64
    get_storage_format : UInt64
    set_storage_format : UInt64
    get_bandwidth_sharing_count : UInt64
    get_bandwidth_sharing : UInt64
    remove_bandwidth_sharing : UInt64
    add_bandwidth_sharing : UInt64
    create_new_bandwidth_sharing : UInt64
    get_stream_prioritization : UInt64
    set_stream_prioritization : UInt64
    remove_stream_prioritization : UInt64
    create_new_stream_prioritization : UInt64
    get_expected_packet_count : UInt64
  end

  IWMProfile3_GUID = "00ef96cc-a461-4546-8bcd-c9a28f0e06f5"
  IID_IWMProfile3 = LibC::GUID.new(0xef96cc_u32, 0xa461_u16, 0x4546_u16, StaticArray[0x8b_u8, 0xcd_u8, 0xc9_u8, 0xa2_u8, 0x8f_u8, 0xe_u8, 0x6_u8, 0xf5_u8])
  struct IWMProfile3
    lpVtbl : IWMProfile3VTbl*
  end

  struct IWMStreamConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_stream_type : UInt64
    get_stream_number : UInt64
    set_stream_number : UInt64
    get_stream_name : UInt64
    set_stream_name : UInt64
    get_connection_name : UInt64
    set_connection_name : UInt64
    get_bitrate : UInt64
    set_bitrate : UInt64
    get_buffer_window : UInt64
    set_buffer_window : UInt64
  end

  IWMStreamConfig_GUID = "96406bdc-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMStreamConfig = LibC::GUID.new(0x96406bdc_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMStreamConfig
    lpVtbl : IWMStreamConfigVTbl*
  end

  struct IWMStreamConfig2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_stream_type : UInt64
    get_stream_number : UInt64
    set_stream_number : UInt64
    get_stream_name : UInt64
    set_stream_name : UInt64
    get_connection_name : UInt64
    set_connection_name : UInt64
    get_bitrate : UInt64
    set_bitrate : UInt64
    get_buffer_window : UInt64
    set_buffer_window : UInt64
    get_transport_type : UInt64
    set_transport_type : UInt64
    add_data_unit_extension : UInt64
    get_data_unit_extension_count : UInt64
    get_data_unit_extension : UInt64
    remove_all_data_unit_extensions : UInt64
  end

  IWMStreamConfig2_GUID = "7688d8cb-fc0d-43bd-9459-5a8dec200cfa"
  IID_IWMStreamConfig2 = LibC::GUID.new(0x7688d8cb_u32, 0xfc0d_u16, 0x43bd_u16, StaticArray[0x94_u8, 0x59_u8, 0x5a_u8, 0x8d_u8, 0xec_u8, 0x20_u8, 0xc_u8, 0xfa_u8])
  struct IWMStreamConfig2
    lpVtbl : IWMStreamConfig2VTbl*
  end

  struct IWMStreamConfig3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_stream_type : UInt64
    get_stream_number : UInt64
    set_stream_number : UInt64
    get_stream_name : UInt64
    set_stream_name : UInt64
    get_connection_name : UInt64
    set_connection_name : UInt64
    get_bitrate : UInt64
    set_bitrate : UInt64
    get_buffer_window : UInt64
    set_buffer_window : UInt64
    get_transport_type : UInt64
    set_transport_type : UInt64
    add_data_unit_extension : UInt64
    get_data_unit_extension_count : UInt64
    get_data_unit_extension : UInt64
    remove_all_data_unit_extensions : UInt64
    get_language : UInt64
    set_language : UInt64
  end

  IWMStreamConfig3_GUID = "cb164104-3aa9-45a7-9ac9-4daee131d6e1"
  IID_IWMStreamConfig3 = LibC::GUID.new(0xcb164104_u32, 0x3aa9_u16, 0x45a7_u16, StaticArray[0x9a_u8, 0xc9_u8, 0x4d_u8, 0xae_u8, 0xe1_u8, 0x31_u8, 0xd6_u8, 0xe1_u8])
  struct IWMStreamConfig3
    lpVtbl : IWMStreamConfig3VTbl*
  end

  struct IWMPacketSizeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_max_packet_size : UInt64
    set_max_packet_size : UInt64
  end

  IWMPacketSize_GUID = "cdfb97ab-188f-40b3-b643-5b7903975c59"
  IID_IWMPacketSize = LibC::GUID.new(0xcdfb97ab_u32, 0x188f_u16, 0x40b3_u16, StaticArray[0xb6_u8, 0x43_u8, 0x5b_u8, 0x79_u8, 0x3_u8, 0x97_u8, 0x5c_u8, 0x59_u8])
  struct IWMPacketSize
    lpVtbl : IWMPacketSizeVTbl*
  end

  struct IWMPacketSize2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_max_packet_size : UInt64
    set_max_packet_size : UInt64
    get_min_packet_size : UInt64
    set_min_packet_size : UInt64
  end

  IWMPacketSize2_GUID = "8bfc2b9e-b646-4233-a877-1c6a079669dc"
  IID_IWMPacketSize2 = LibC::GUID.new(0x8bfc2b9e_u32, 0xb646_u16, 0x4233_u16, StaticArray[0xa8_u8, 0x77_u8, 0x1c_u8, 0x6a_u8, 0x7_u8, 0x96_u8, 0x69_u8, 0xdc_u8])
  struct IWMPacketSize2
    lpVtbl : IWMPacketSize2VTbl*
  end

  struct IWMStreamListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_streams : UInt64
    add_stream : UInt64
    remove_stream : UInt64
  end

  IWMStreamList_GUID = "96406bdd-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMStreamList = LibC::GUID.new(0x96406bdd_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMStreamList
    lpVtbl : IWMStreamListVTbl*
  end

  struct IWMMutualExclusionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_streams : UInt64
    add_stream : UInt64
    remove_stream : UInt64
    get_type : UInt64
    set_type : UInt64
  end

  IWMMutualExclusion_GUID = "96406bde-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMMutualExclusion = LibC::GUID.new(0x96406bde_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMMutualExclusion
    lpVtbl : IWMMutualExclusionVTbl*
  end

  struct IWMMutualExclusion2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_streams : UInt64
    add_stream : UInt64
    remove_stream : UInt64
    get_type : UInt64
    set_type : UInt64
    get_name : UInt64
    set_name : UInt64
    get_record_count : UInt64
    add_record : UInt64
    remove_record : UInt64
    get_record_name : UInt64
    set_record_name : UInt64
    get_streams_for_record : UInt64
    add_stream_for_record : UInt64
    remove_stream_for_record : UInt64
  end

  IWMMutualExclusion2_GUID = "0302b57d-89d1-4ba2-85c9-166f2c53eb91"
  IID_IWMMutualExclusion2 = LibC::GUID.new(0x302b57d_u32, 0x89d1_u16, 0x4ba2_u16, StaticArray[0x85_u8, 0xc9_u8, 0x16_u8, 0x6f_u8, 0x2c_u8, 0x53_u8, 0xeb_u8, 0x91_u8])
  struct IWMMutualExclusion2
    lpVtbl : IWMMutualExclusion2VTbl*
  end

  struct IWMBandwidthSharingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_streams : UInt64
    add_stream : UInt64
    remove_stream : UInt64
    get_type : UInt64
    set_type : UInt64
    get_bandwidth : UInt64
    set_bandwidth : UInt64
  end

  IWMBandwidthSharing_GUID = "ad694af1-f8d9-42f8-bc47-70311b0c4f9e"
  IID_IWMBandwidthSharing = LibC::GUID.new(0xad694af1_u32, 0xf8d9_u16, 0x42f8_u16, StaticArray[0xbc_u8, 0x47_u8, 0x70_u8, 0x31_u8, 0x1b_u8, 0xc_u8, 0x4f_u8, 0x9e_u8])
  struct IWMBandwidthSharing
    lpVtbl : IWMBandwidthSharingVTbl*
  end

  struct IWMStreamPrioritizationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_priority_records : UInt64
    set_priority_records : UInt64
  end

  IWMStreamPrioritization_GUID = "8c1c6090-f9a8-4748-8ec3-dd1108ba1e77"
  IID_IWMStreamPrioritization = LibC::GUID.new(0x8c1c6090_u32, 0xf9a8_u16, 0x4748_u16, StaticArray[0x8e_u8, 0xc3_u8, 0xdd_u8, 0x11_u8, 0x8_u8, 0xba_u8, 0x1e_u8, 0x77_u8])
  struct IWMStreamPrioritization
    lpVtbl : IWMStreamPrioritizationVTbl*
  end

  struct IWMWriterAdvancedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_sink_count : UInt64
    get_sink : UInt64
    add_sink : UInt64
    remove_sink : UInt64
    write_stream_sample : UInt64
    set_live_source : UInt64
    is_real_time : UInt64
    get_writer_time : UInt64
    get_statistics : UInt64
    set_sync_tolerance : UInt64
    get_sync_tolerance : UInt64
  end

  IWMWriterAdvanced_GUID = "96406be3-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterAdvanced = LibC::GUID.new(0x96406be3_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMWriterAdvanced
    lpVtbl : IWMWriterAdvancedVTbl*
  end

  struct IWMWriterAdvanced2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_sink_count : UInt64
    get_sink : UInt64
    add_sink : UInt64
    remove_sink : UInt64
    write_stream_sample : UInt64
    set_live_source : UInt64
    is_real_time : UInt64
    get_writer_time : UInt64
    get_statistics : UInt64
    set_sync_tolerance : UInt64
    get_sync_tolerance : UInt64
    get_input_setting : UInt64
    set_input_setting : UInt64
  end

  IWMWriterAdvanced2_GUID = "962dc1ec-c046-4db8-9cc7-26ceae500817"
  IID_IWMWriterAdvanced2 = LibC::GUID.new(0x962dc1ec_u32, 0xc046_u16, 0x4db8_u16, StaticArray[0x9c_u8, 0xc7_u8, 0x26_u8, 0xce_u8, 0xae_u8, 0x50_u8, 0x8_u8, 0x17_u8])
  struct IWMWriterAdvanced2
    lpVtbl : IWMWriterAdvanced2VTbl*
  end

  struct IWMWriterAdvanced3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_sink_count : UInt64
    get_sink : UInt64
    add_sink : UInt64
    remove_sink : UInt64
    write_stream_sample : UInt64
    set_live_source : UInt64
    is_real_time : UInt64
    get_writer_time : UInt64
    get_statistics : UInt64
    set_sync_tolerance : UInt64
    get_sync_tolerance : UInt64
    get_input_setting : UInt64
    set_input_setting : UInt64
    get_statistics_ex : UInt64
    set_non_blocking : UInt64
  end

  IWMWriterAdvanced3_GUID = "2cd6492d-7c37-4e76-9d3b-59261183a22e"
  IID_IWMWriterAdvanced3 = LibC::GUID.new(0x2cd6492d_u32, 0x7c37_u16, 0x4e76_u16, StaticArray[0x9d_u8, 0x3b_u8, 0x59_u8, 0x26_u8, 0x11_u8, 0x83_u8, 0xa2_u8, 0x2e_u8])
  struct IWMWriterAdvanced3
    lpVtbl : IWMWriterAdvanced3VTbl*
  end

  struct IWMWriterPreprocessVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_max_preprocessing_passes : UInt64
    set_num_preprocessing_passes : UInt64
    begin_preprocessing_pass : UInt64
    preprocess_sample : UInt64
    end_preprocessing_pass : UInt64
  end

  IWMWriterPreprocess_GUID = "fc54a285-38c4-45b5-aa23-85b9f7cb424b"
  IID_IWMWriterPreprocess = LibC::GUID.new(0xfc54a285_u32, 0x38c4_u16, 0x45b5_u16, StaticArray[0xaa_u8, 0x23_u8, 0x85_u8, 0xb9_u8, 0xf7_u8, 0xcb_u8, 0x42_u8, 0x4b_u8])
  struct IWMWriterPreprocess
    lpVtbl : IWMWriterPreprocessVTbl*
  end

  struct IWMWriterPostViewCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_status : UInt64
    on_post_view_sample : UInt64
    allocate_for_post_view : UInt64
  end

  IWMWriterPostViewCallback_GUID = "d9d6549d-a193-4f24-b308-03123d9b7f8d"
  IID_IWMWriterPostViewCallback = LibC::GUID.new(0xd9d6549d_u32, 0xa193_u16, 0x4f24_u16, StaticArray[0xb3_u8, 0x8_u8, 0x3_u8, 0x12_u8, 0x3d_u8, 0x9b_u8, 0x7f_u8, 0x8d_u8])
  struct IWMWriterPostViewCallback
    lpVtbl : IWMWriterPostViewCallbackVTbl*
  end

  struct IWMWriterPostViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_post_view_callback : UInt64
    set_receive_post_view_samples : UInt64
    get_receive_post_view_samples : UInt64
    get_post_view_props : UInt64
    set_post_view_props : UInt64
    get_post_view_format_count : UInt64
    get_post_view_format : UInt64
    set_allocate_for_post_view : UInt64
    get_allocate_for_post_view : UInt64
  end

  IWMWriterPostView_GUID = "81e20ce4-75ef-491a-8004-fc53c45bdc3e"
  IID_IWMWriterPostView = LibC::GUID.new(0x81e20ce4_u32, 0x75ef_u16, 0x491a_u16, StaticArray[0x80_u8, 0x4_u8, 0xfc_u8, 0x53_u8, 0xc4_u8, 0x5b_u8, 0xdc_u8, 0x3e_u8])
  struct IWMWriterPostView
    lpVtbl : IWMWriterPostViewVTbl*
  end

  struct IWMWriterSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_header : UInt64
    is_real_time : UInt64
    allocate_data_unit : UInt64
    on_data_unit : UInt64
    on_end_writing : UInt64
  end

  IWMWriterSink_GUID = "96406be4-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterSink = LibC::GUID.new(0x96406be4_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMWriterSink
    lpVtbl : IWMWriterSinkVTbl*
  end

  struct IWMRegisterCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise : UInt64
    unadvise : UInt64
  end

  IWMRegisterCallback_GUID = "cf4b1f99-4de2-4e49-a363-252740d99bc1"
  IID_IWMRegisterCallback = LibC::GUID.new(0xcf4b1f99_u32, 0x4de2_u16, 0x4e49_u16, StaticArray[0xa3_u8, 0x63_u8, 0x25_u8, 0x27_u8, 0x40_u8, 0xd9_u8, 0x9b_u8, 0xc1_u8])
  struct IWMRegisterCallback
    lpVtbl : IWMRegisterCallbackVTbl*
  end

  struct IWMWriterFileSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_header : UInt64
    is_real_time : UInt64
    allocate_data_unit : UInt64
    on_data_unit : UInt64
    on_end_writing : UInt64
    open : UInt64
  end

  IWMWriterFileSink_GUID = "96406be5-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterFileSink = LibC::GUID.new(0x96406be5_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMWriterFileSink
    lpVtbl : IWMWriterFileSinkVTbl*
  end

  struct IWMWriterFileSink2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_header : UInt64
    is_real_time : UInt64
    allocate_data_unit : UInt64
    on_data_unit : UInt64
    on_end_writing : UInt64
    open : UInt64
    start : UInt64
    stop : UInt64
    is_stopped : UInt64
    get_file_duration : UInt64
    get_file_size : UInt64
    close : UInt64
    is_closed : UInt64
  end

  IWMWriterFileSink2_GUID = "14282ba7-4aef-4205-8ce5-c229035a05bc"
  IID_IWMWriterFileSink2 = LibC::GUID.new(0x14282ba7_u32, 0x4aef_u16, 0x4205_u16, StaticArray[0x8c_u8, 0xe5_u8, 0xc2_u8, 0x29_u8, 0x3_u8, 0x5a_u8, 0x5_u8, 0xbc_u8])
  struct IWMWriterFileSink2
    lpVtbl : IWMWriterFileSink2VTbl*
  end

  struct IWMWriterFileSink3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_header : UInt64
    is_real_time : UInt64
    allocate_data_unit : UInt64
    on_data_unit : UInt64
    on_end_writing : UInt64
    open : UInt64
    start : UInt64
    stop : UInt64
    is_stopped : UInt64
    get_file_duration : UInt64
    get_file_size : UInt64
    close : UInt64
    is_closed : UInt64
    set_auto_indexing : UInt64
    get_auto_indexing : UInt64
    set_control_stream : UInt64
    get_mode : UInt64
    on_data_unit_ex : UInt64
    set_unbuffered_io : UInt64
    get_unbuffered_io : UInt64
    complete_operations : UInt64
  end

  IWMWriterFileSink3_GUID = "3fea4feb-2945-47a7-a1dd-c53a8fc4c45c"
  IID_IWMWriterFileSink3 = LibC::GUID.new(0x3fea4feb_u32, 0x2945_u16, 0x47a7_u16, StaticArray[0xa1_u8, 0xdd_u8, 0xc5_u8, 0x3a_u8, 0x8f_u8, 0xc4_u8, 0xc4_u8, 0x5c_u8])
  struct IWMWriterFileSink3
    lpVtbl : IWMWriterFileSink3VTbl*
  end

  struct IWMWriterNetworkSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_header : UInt64
    is_real_time : UInt64
    allocate_data_unit : UInt64
    on_data_unit : UInt64
    on_end_writing : UInt64
    set_maximum_clients : UInt64
    get_maximum_clients : UInt64
    set_network_protocol : UInt64
    get_network_protocol : UInt64
    get_host_url : UInt64
    open : UInt64
    disconnect : UInt64
    close : UInt64
  end

  IWMWriterNetworkSink_GUID = "96406be7-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterNetworkSink = LibC::GUID.new(0x96406be7_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMWriterNetworkSink
    lpVtbl : IWMWriterNetworkSinkVTbl*
  end

  struct IWMClientConnectionsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client_count : UInt64
    get_client_properties : UInt64
  end

  IWMClientConnections_GUID = "73c66010-a299-41df-b1f0-ccf03b09c1c6"
  IID_IWMClientConnections = LibC::GUID.new(0x73c66010_u32, 0xa299_u16, 0x41df_u16, StaticArray[0xb1_u8, 0xf0_u8, 0xcc_u8, 0xf0_u8, 0x3b_u8, 0x9_u8, 0xc1_u8, 0xc6_u8])
  struct IWMClientConnections
    lpVtbl : IWMClientConnectionsVTbl*
  end

  struct IWMClientConnections2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client_count : UInt64
    get_client_properties : UInt64
    get_client_info : UInt64
  end

  IWMClientConnections2_GUID = "4091571e-4701-4593-bb3d-d5f5f0c74246"
  IID_IWMClientConnections2 = LibC::GUID.new(0x4091571e_u32, 0x4701_u16, 0x4593_u16, StaticArray[0xbb_u8, 0x3d_u8, 0xd5_u8, 0xf5_u8, 0xf0_u8, 0xc7_u8, 0x42_u8, 0x46_u8])
  struct IWMClientConnections2
    lpVtbl : IWMClientConnections2VTbl*
  end

  struct IWMReaderAdvancedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_user_provided_clock : UInt64
    get_user_provided_clock : UInt64
    deliver_time : UInt64
    set_manual_stream_selection : UInt64
    get_manual_stream_selection : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_receive_selection_callbacks : UInt64
    get_receive_selection_callbacks : UInt64
    set_receive_stream_samples : UInt64
    get_receive_stream_samples : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
    get_statistics : UInt64
    set_client_info : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    notify_late_delivery : UInt64
  end

  IWMReaderAdvanced_GUID = "96406bea-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderAdvanced = LibC::GUID.new(0x96406bea_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReaderAdvanced
    lpVtbl : IWMReaderAdvancedVTbl*
  end

  struct IWMReaderAdvanced2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_user_provided_clock : UInt64
    get_user_provided_clock : UInt64
    deliver_time : UInt64
    set_manual_stream_selection : UInt64
    get_manual_stream_selection : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_receive_selection_callbacks : UInt64
    get_receive_selection_callbacks : UInt64
    set_receive_stream_samples : UInt64
    get_receive_stream_samples : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
    get_statistics : UInt64
    set_client_info : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    notify_late_delivery : UInt64
    set_play_mode : UInt64
    get_play_mode : UInt64
    get_buffer_progress : UInt64
    get_download_progress : UInt64
    get_save_as_progress : UInt64
    save_file_as : UInt64
    get_protocol_name : UInt64
    start_at_marker : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    preroll : UInt64
    set_log_client_id : UInt64
    get_log_client_id : UInt64
    stop_buffering : UInt64
    open_stream : UInt64
  end

  IWMReaderAdvanced2_GUID = "ae14a945-b90c-4d0d-9127-80d665f7d73e"
  IID_IWMReaderAdvanced2 = LibC::GUID.new(0xae14a945_u32, 0xb90c_u16, 0x4d0d_u16, StaticArray[0x91_u8, 0x27_u8, 0x80_u8, 0xd6_u8, 0x65_u8, 0xf7_u8, 0xd7_u8, 0x3e_u8])
  struct IWMReaderAdvanced2
    lpVtbl : IWMReaderAdvanced2VTbl*
  end

  struct IWMReaderAdvanced3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_user_provided_clock : UInt64
    get_user_provided_clock : UInt64
    deliver_time : UInt64
    set_manual_stream_selection : UInt64
    get_manual_stream_selection : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_receive_selection_callbacks : UInt64
    get_receive_selection_callbacks : UInt64
    set_receive_stream_samples : UInt64
    get_receive_stream_samples : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
    get_statistics : UInt64
    set_client_info : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    notify_late_delivery : UInt64
    set_play_mode : UInt64
    get_play_mode : UInt64
    get_buffer_progress : UInt64
    get_download_progress : UInt64
    get_save_as_progress : UInt64
    save_file_as : UInt64
    get_protocol_name : UInt64
    start_at_marker : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    preroll : UInt64
    set_log_client_id : UInt64
    get_log_client_id : UInt64
    stop_buffering : UInt64
    open_stream : UInt64
    stop_net_streaming : UInt64
    start_at_position : UInt64
  end

  IWMReaderAdvanced3_GUID = "5dc0674b-f04b-4a4e-9f2a-b1afde2c8100"
  IID_IWMReaderAdvanced3 = LibC::GUID.new(0x5dc0674b_u32, 0xf04b_u16, 0x4a4e_u16, StaticArray[0x9f_u8, 0x2a_u8, 0xb1_u8, 0xaf_u8, 0xde_u8, 0x2c_u8, 0x81_u8, 0x0_u8])
  struct IWMReaderAdvanced3
    lpVtbl : IWMReaderAdvanced3VTbl*
  end

  struct IWMReaderAdvanced4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_user_provided_clock : UInt64
    get_user_provided_clock : UInt64
    deliver_time : UInt64
    set_manual_stream_selection : UInt64
    get_manual_stream_selection : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_receive_selection_callbacks : UInt64
    get_receive_selection_callbacks : UInt64
    set_receive_stream_samples : UInt64
    get_receive_stream_samples : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
    get_statistics : UInt64
    set_client_info : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    notify_late_delivery : UInt64
    set_play_mode : UInt64
    get_play_mode : UInt64
    get_buffer_progress : UInt64
    get_download_progress : UInt64
    get_save_as_progress : UInt64
    save_file_as : UInt64
    get_protocol_name : UInt64
    start_at_marker : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    preroll : UInt64
    set_log_client_id : UInt64
    get_log_client_id : UInt64
    stop_buffering : UInt64
    open_stream : UInt64
    stop_net_streaming : UInt64
    start_at_position : UInt64
    get_language_count : UInt64
    get_language : UInt64
    get_max_speed_factor : UInt64
    is_using_fast_cache : UInt64
    add_log_param : UInt64
    send_log_params : UInt64
    can_save_file_as : UInt64
    cancel_save_file_as : UInt64
    get_url : UInt64
  end

  IWMReaderAdvanced4_GUID = "945a76a2-12ae-4d48-bd3c-cd1d90399b85"
  IID_IWMReaderAdvanced4 = LibC::GUID.new(0x945a76a2_u32, 0x12ae_u16, 0x4d48_u16, StaticArray[0xbd_u8, 0x3c_u8, 0xcd_u8, 0x1d_u8, 0x90_u8, 0x39_u8, 0x9b_u8, 0x85_u8])
  struct IWMReaderAdvanced4
    lpVtbl : IWMReaderAdvanced4VTbl*
  end

  struct IWMReaderAdvanced5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_user_provided_clock : UInt64
    get_user_provided_clock : UInt64
    deliver_time : UInt64
    set_manual_stream_selection : UInt64
    get_manual_stream_selection : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_receive_selection_callbacks : UInt64
    get_receive_selection_callbacks : UInt64
    set_receive_stream_samples : UInt64
    get_receive_stream_samples : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
    get_statistics : UInt64
    set_client_info : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    notify_late_delivery : UInt64
    set_play_mode : UInt64
    get_play_mode : UInt64
    get_buffer_progress : UInt64
    get_download_progress : UInt64
    get_save_as_progress : UInt64
    save_file_as : UInt64
    get_protocol_name : UInt64
    start_at_marker : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    preroll : UInt64
    set_log_client_id : UInt64
    get_log_client_id : UInt64
    stop_buffering : UInt64
    open_stream : UInt64
    stop_net_streaming : UInt64
    start_at_position : UInt64
    get_language_count : UInt64
    get_language : UInt64
    get_max_speed_factor : UInt64
    is_using_fast_cache : UInt64
    add_log_param : UInt64
    send_log_params : UInt64
    can_save_file_as : UInt64
    cancel_save_file_as : UInt64
    get_url : UInt64
    set_player_hook : UInt64
  end

  IWMReaderAdvanced5_GUID = "24c44db0-55d1-49ae-a5cc-f13815e36363"
  IID_IWMReaderAdvanced5 = LibC::GUID.new(0x24c44db0_u32, 0x55d1_u16, 0x49ae_u16, StaticArray[0xa5_u8, 0xcc_u8, 0xf1_u8, 0x38_u8, 0x15_u8, 0xe3_u8, 0x63_u8, 0x63_u8])
  struct IWMReaderAdvanced5
    lpVtbl : IWMReaderAdvanced5VTbl*
  end

  struct IWMReaderAdvanced6VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_user_provided_clock : UInt64
    get_user_provided_clock : UInt64
    deliver_time : UInt64
    set_manual_stream_selection : UInt64
    get_manual_stream_selection : UInt64
    set_streams_selected : UInt64
    get_stream_selected : UInt64
    set_receive_selection_callbacks : UInt64
    get_receive_selection_callbacks : UInt64
    set_receive_stream_samples : UInt64
    get_receive_stream_samples : UInt64
    set_allocate_for_output : UInt64
    get_allocate_for_output : UInt64
    set_allocate_for_stream : UInt64
    get_allocate_for_stream : UInt64
    get_statistics : UInt64
    set_client_info : UInt64
    get_max_output_sample_size : UInt64
    get_max_stream_sample_size : UInt64
    notify_late_delivery : UInt64
    set_play_mode : UInt64
    get_play_mode : UInt64
    get_buffer_progress : UInt64
    get_download_progress : UInt64
    get_save_as_progress : UInt64
    save_file_as : UInt64
    get_protocol_name : UInt64
    start_at_marker : UInt64
    get_output_setting : UInt64
    set_output_setting : UInt64
    preroll : UInt64
    set_log_client_id : UInt64
    get_log_client_id : UInt64
    stop_buffering : UInt64
    open_stream : UInt64
    stop_net_streaming : UInt64
    start_at_position : UInt64
    get_language_count : UInt64
    get_language : UInt64
    get_max_speed_factor : UInt64
    is_using_fast_cache : UInt64
    add_log_param : UInt64
    send_log_params : UInt64
    can_save_file_as : UInt64
    cancel_save_file_as : UInt64
    get_url : UInt64
    set_player_hook : UInt64
    set_protect_stream_samples : UInt64
  end

  IWMReaderAdvanced6_GUID = "18a2e7f8-428f-4acd-8a00-e64639bc93de"
  IID_IWMReaderAdvanced6 = LibC::GUID.new(0x18a2e7f8_u32, 0x428f_u16, 0x4acd_u16, StaticArray[0x8a_u8, 0x0_u8, 0xe6_u8, 0x46_u8, 0x39_u8, 0xbc_u8, 0x93_u8, 0xde_u8])
  struct IWMReaderAdvanced6
    lpVtbl : IWMReaderAdvanced6VTbl*
  end

  struct IWMPlayerHookVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    pre_decode : UInt64
  end

  IWMPlayerHook_GUID = "e5b7ca9a-0f1c-4f66-9002-74ec50d8b304"
  IID_IWMPlayerHook = LibC::GUID.new(0xe5b7ca9a_u32, 0xf1c_u16, 0x4f66_u16, StaticArray[0x90_u8, 0x2_u8, 0x74_u8, 0xec_u8, 0x50_u8, 0xd8_u8, 0xb3_u8, 0x4_u8])
  struct IWMPlayerHook
    lpVtbl : IWMPlayerHookVTbl*
  end

  struct IWMReaderAllocatorExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    allocate_for_stream_ex : UInt64
    allocate_for_output_ex : UInt64
  end

  IWMReaderAllocatorEx_GUID = "9f762fa7-a22e-428d-93c9-ac82f3aafe5a"
  IID_IWMReaderAllocatorEx = LibC::GUID.new(0x9f762fa7_u32, 0xa22e_u16, 0x428d_u16, StaticArray[0x93_u8, 0xc9_u8, 0xac_u8, 0x82_u8, 0xf3_u8, 0xaa_u8, 0xfe_u8, 0x5a_u8])
  struct IWMReaderAllocatorEx
    lpVtbl : IWMReaderAllocatorExVTbl*
  end

  struct IWMReaderTypeNegotiationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    try_output_props : UInt64
  end

  IWMReaderTypeNegotiation_GUID = "fdbe5592-81a1-41ea-93bd-735cad1adc05"
  IID_IWMReaderTypeNegotiation = LibC::GUID.new(0xfdbe5592_u32, 0x81a1_u16, 0x41ea_u16, StaticArray[0x93_u8, 0xbd_u8, 0x73_u8, 0x5c_u8, 0xad_u8, 0x1a_u8, 0xdc_u8, 0x5_u8])
  struct IWMReaderTypeNegotiation
    lpVtbl : IWMReaderTypeNegotiationVTbl*
  end

  struct IWMReaderCallbackAdvancedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_stream_sample : UInt64
    on_time : UInt64
    on_stream_selection : UInt64
    on_output_props_changed : UInt64
    allocate_for_stream : UInt64
    allocate_for_output : UInt64
  end

  IWMReaderCallbackAdvanced_GUID = "96406beb-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderCallbackAdvanced = LibC::GUID.new(0x96406beb_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReaderCallbackAdvanced
    lpVtbl : IWMReaderCallbackAdvancedVTbl*
  end

  struct IWMDRMReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    acquire_license : UInt64
    cancel_license_acquisition : UInt64
    individualize : UInt64
    cancel_individualization : UInt64
    monitor_license_acquisition : UInt64
    cancel_monitor_license_acquisition : UInt64
    set_drm_property : UInt64
    get_drm_property : UInt64
  end

  IWMDRMReader_GUID = "d2827540-3ee7-432c-b14c-dc17f085d3b3"
  IID_IWMDRMReader = LibC::GUID.new(0xd2827540_u32, 0x3ee7_u16, 0x432c_u16, StaticArray[0xb1_u8, 0x4c_u8, 0xdc_u8, 0x17_u8, 0xf0_u8, 0x85_u8, 0xd3_u8, 0xb3_u8])
  struct IWMDRMReader
    lpVtbl : IWMDRMReaderVTbl*
  end

  struct IWMDRMReader2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    acquire_license : UInt64
    cancel_license_acquisition : UInt64
    individualize : UInt64
    cancel_individualization : UInt64
    monitor_license_acquisition : UInt64
    cancel_monitor_license_acquisition : UInt64
    set_drm_property : UInt64
    get_drm_property : UInt64
    set_evaluate_output_level_licenses : UInt64
    get_play_output_levels : UInt64
    get_copy_output_levels : UInt64
    try_next_license : UInt64
  end

  IWMDRMReader2_GUID = "befe7a75-9f1d-4075-b9d9-a3c37bda49a0"
  IID_IWMDRMReader2 = LibC::GUID.new(0xbefe7a75_u32, 0x9f1d_u16, 0x4075_u16, StaticArray[0xb9_u8, 0xd9_u8, 0xa3_u8, 0xc3_u8, 0x7b_u8, 0xda_u8, 0x49_u8, 0xa0_u8])
  struct IWMDRMReader2
    lpVtbl : IWMDRMReader2VTbl*
  end

  struct IWMDRMReader3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    acquire_license : UInt64
    cancel_license_acquisition : UInt64
    individualize : UInt64
    cancel_individualization : UInt64
    monitor_license_acquisition : UInt64
    cancel_monitor_license_acquisition : UInt64
    set_drm_property : UInt64
    get_drm_property : UInt64
    set_evaluate_output_level_licenses : UInt64
    get_play_output_levels : UInt64
    get_copy_output_levels : UInt64
    try_next_license : UInt64
    get_inclusion_list : UInt64
  end

  IWMDRMReader3_GUID = "e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8"
  IID_IWMDRMReader3 = LibC::GUID.new(0xe08672de_u32, 0xf1e7_u16, 0x4ff4_u16, StaticArray[0xa0_u8, 0xa3_u8, 0xfc_u8, 0x4b_u8, 0x8_u8, 0xe4_u8, 0xca_u8, 0xf8_u8])
  struct IWMDRMReader3
    lpVtbl : IWMDRMReader3VTbl*
  end

  struct IWMReaderPlaylistBurnVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init_playlist_burn : UInt64
    get_init_results : UInt64
    cancel : UInt64
    end_playlist_burn : UInt64
  end

  IWMReaderPlaylistBurn_GUID = "f28c0300-9baa-4477-a846-1744d9cbf533"
  IID_IWMReaderPlaylistBurn = LibC::GUID.new(0xf28c0300_u32, 0x9baa_u16, 0x4477_u16, StaticArray[0xa8_u8, 0x46_u8, 0x17_u8, 0x44_u8, 0xd9_u8, 0xcb_u8, 0xf5_u8, 0x33_u8])
  struct IWMReaderPlaylistBurn
    lpVtbl : IWMReaderPlaylistBurnVTbl*
  end

  struct IWMReaderNetworkConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffering_time : UInt64
    set_buffering_time : UInt64
    get_udp_port_ranges : UInt64
    set_udp_port_ranges : UInt64
    get_proxy_settings : UInt64
    set_proxy_settings : UInt64
    get_proxy_host_name : UInt64
    set_proxy_host_name : UInt64
    get_proxy_port : UInt64
    set_proxy_port : UInt64
    get_proxy_exception_list : UInt64
    set_proxy_exception_list : UInt64
    get_proxy_bypass_for_local : UInt64
    set_proxy_bypass_for_local : UInt64
    get_force_rerun_auto_proxy_detection : UInt64
    set_force_rerun_auto_proxy_detection : UInt64
    get_enable_multicast : UInt64
    set_enable_multicast : UInt64
    get_enable_http : UInt64
    set_enable_http : UInt64
    get_enable_udp : UInt64
    set_enable_udp : UInt64
    get_enable_tcp : UInt64
    set_enable_tcp : UInt64
    reset_protocol_rollover : UInt64
    get_connection_bandwidth : UInt64
    set_connection_bandwidth : UInt64
    get_num_protocols_supported : UInt64
    get_supported_protocol_name : UInt64
    add_logging_url : UInt64
    get_logging_url : UInt64
    get_logging_url_count : UInt64
    reset_logging_url_list : UInt64
  end

  IWMReaderNetworkConfig_GUID = "96406bec-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderNetworkConfig = LibC::GUID.new(0x96406bec_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReaderNetworkConfig
    lpVtbl : IWMReaderNetworkConfigVTbl*
  end

  struct IWMReaderNetworkConfig2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffering_time : UInt64
    set_buffering_time : UInt64
    get_udp_port_ranges : UInt64
    set_udp_port_ranges : UInt64
    get_proxy_settings : UInt64
    set_proxy_settings : UInt64
    get_proxy_host_name : UInt64
    set_proxy_host_name : UInt64
    get_proxy_port : UInt64
    set_proxy_port : UInt64
    get_proxy_exception_list : UInt64
    set_proxy_exception_list : UInt64
    get_proxy_bypass_for_local : UInt64
    set_proxy_bypass_for_local : UInt64
    get_force_rerun_auto_proxy_detection : UInt64
    set_force_rerun_auto_proxy_detection : UInt64
    get_enable_multicast : UInt64
    set_enable_multicast : UInt64
    get_enable_http : UInt64
    set_enable_http : UInt64
    get_enable_udp : UInt64
    set_enable_udp : UInt64
    get_enable_tcp : UInt64
    set_enable_tcp : UInt64
    reset_protocol_rollover : UInt64
    get_connection_bandwidth : UInt64
    set_connection_bandwidth : UInt64
    get_num_protocols_supported : UInt64
    get_supported_protocol_name : UInt64
    add_logging_url : UInt64
    get_logging_url : UInt64
    get_logging_url_count : UInt64
    reset_logging_url_list : UInt64
    get_enable_content_caching : UInt64
    set_enable_content_caching : UInt64
    get_enable_fast_cache : UInt64
    set_enable_fast_cache : UInt64
    get_accelerated_streaming_duration : UInt64
    set_accelerated_streaming_duration : UInt64
    get_auto_reconnect_limit : UInt64
    set_auto_reconnect_limit : UInt64
    get_enable_resends : UInt64
    set_enable_resends : UInt64
    get_enable_thinning : UInt64
    set_enable_thinning : UInt64
    get_max_net_packet_size : UInt64
  end

  IWMReaderNetworkConfig2_GUID = "d979a853-042b-4050-8387-c939db22013f"
  IID_IWMReaderNetworkConfig2 = LibC::GUID.new(0xd979a853_u32, 0x42b_u16, 0x4050_u16, StaticArray[0x83_u8, 0x87_u8, 0xc9_u8, 0x39_u8, 0xdb_u8, 0x22_u8, 0x1_u8, 0x3f_u8])
  struct IWMReaderNetworkConfig2
    lpVtbl : IWMReaderNetworkConfig2VTbl*
  end

  struct IWMReaderStreamClockVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_time : UInt64
    set_timer : UInt64
    kill_timer : UInt64
  end

  IWMReaderStreamClock_GUID = "96406bed-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderStreamClock = LibC::GUID.new(0x96406bed_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReaderStreamClock
    lpVtbl : IWMReaderStreamClockVTbl*
  end

  struct IWMIndexerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_indexing : UInt64
    cancel : UInt64
  end

  IWMIndexer_GUID = "6d7cdc71-9888-11d3-8edc-00c04f6109cf"
  IID_IWMIndexer = LibC::GUID.new(0x6d7cdc71_u32, 0x9888_u16, 0x11d3_u16, StaticArray[0x8e_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x9_u8, 0xcf_u8])
  struct IWMIndexer
    lpVtbl : IWMIndexerVTbl*
  end

  struct IWMIndexer2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_indexing : UInt64
    cancel : UInt64
    configure : UInt64
  end

  IWMIndexer2_GUID = "b70f1e42-6255-4df0-a6b9-02b212d9e2bb"
  IID_IWMIndexer2 = LibC::GUID.new(0xb70f1e42_u32, 0x6255_u16, 0x4df0_u16, StaticArray[0xa6_u8, 0xb9_u8, 0x2_u8, 0xb2_u8, 0x12_u8, 0xd9_u8, 0xe2_u8, 0xbb_u8])
  struct IWMIndexer2
    lpVtbl : IWMIndexer2VTbl*
  end

  struct IWMLicenseBackupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    backup_licenses : UInt64
    cancel_license_backup : UInt64
  end

  IWMLicenseBackup_GUID = "05e5ac9f-3fb6-4508-bb43-a4067ba1ebe8"
  IID_IWMLicenseBackup = LibC::GUID.new(0x5e5ac9f_u32, 0x3fb6_u16, 0x4508_u16, StaticArray[0xbb_u8, 0x43_u8, 0xa4_u8, 0x6_u8, 0x7b_u8, 0xa1_u8, 0xeb_u8, 0xe8_u8])
  struct IWMLicenseBackup
    lpVtbl : IWMLicenseBackupVTbl*
  end

  struct IWMLicenseRestoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    restore_licenses : UInt64
    cancel_license_restore : UInt64
  end

  IWMLicenseRestore_GUID = "c70b6334-a22e-4efb-a245-15e65a004a13"
  IID_IWMLicenseRestore = LibC::GUID.new(0xc70b6334_u32, 0xa22e_u16, 0x4efb_u16, StaticArray[0xa2_u8, 0x45_u8, 0x15_u8, 0xe6_u8, 0x5a_u8, 0x0_u8, 0x4a_u8, 0x13_u8])
  struct IWMLicenseRestore
    lpVtbl : IWMLicenseRestoreVTbl*
  end

  struct IWMBackupRestorePropsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_prop_count : UInt64
    get_prop_by_index : UInt64
    get_prop_by_name : UInt64
    set_prop : UInt64
    remove_prop : UInt64
    remove_all_props : UInt64
  end

  IWMBackupRestoreProps_GUID = "3c8e0da6-996f-4ff3-a1af-4838f9377e2e"
  IID_IWMBackupRestoreProps = LibC::GUID.new(0x3c8e0da6_u32, 0x996f_u16, 0x4ff3_u16, StaticArray[0xa1_u8, 0xaf_u8, 0x48_u8, 0x38_u8, 0xf9_u8, 0x37_u8, 0x7e_u8, 0x2e_u8])
  struct IWMBackupRestoreProps
    lpVtbl : IWMBackupRestorePropsVTbl*
  end

  struct IWMCodecInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_codec_info_count : UInt64
    get_codec_format_count : UInt64
    get_codec_format : UInt64
  end

  IWMCodecInfo_GUID = "a970f41e-34de-4a98-b3ba-e4b3ca7528f0"
  IID_IWMCodecInfo = LibC::GUID.new(0xa970f41e_u32, 0x34de_u16, 0x4a98_u16, StaticArray[0xb3_u8, 0xba_u8, 0xe4_u8, 0xb3_u8, 0xca_u8, 0x75_u8, 0x28_u8, 0xf0_u8])
  struct IWMCodecInfo
    lpVtbl : IWMCodecInfoVTbl*
  end

  struct IWMCodecInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_codec_info_count : UInt64
    get_codec_format_count : UInt64
    get_codec_format : UInt64
    get_codec_name : UInt64
    get_codec_format_desc : UInt64
  end

  IWMCodecInfo2_GUID = "aa65e273-b686-4056-91ec-dd768d4df710"
  IID_IWMCodecInfo2 = LibC::GUID.new(0xaa65e273_u32, 0xb686_u16, 0x4056_u16, StaticArray[0x91_u8, 0xec_u8, 0xdd_u8, 0x76_u8, 0x8d_u8, 0x4d_u8, 0xf7_u8, 0x10_u8])
  struct IWMCodecInfo2
    lpVtbl : IWMCodecInfo2VTbl*
  end

  struct IWMCodecInfo3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_codec_info_count : UInt64
    get_codec_format_count : UInt64
    get_codec_format : UInt64
    get_codec_name : UInt64
    get_codec_format_desc : UInt64
    get_codec_format_prop : UInt64
    get_codec_prop : UInt64
    set_codec_enumeration_setting : UInt64
    get_codec_enumeration_setting : UInt64
  end

  IWMCodecInfo3_GUID = "7e51f487-4d93-4f98-8ab4-27d0565adc51"
  IID_IWMCodecInfo3 = LibC::GUID.new(0x7e51f487_u32, 0x4d93_u16, 0x4f98_u16, StaticArray[0x8a_u8, 0xb4_u8, 0x27_u8, 0xd0_u8, 0x56_u8, 0x5a_u8, 0xdc_u8, 0x51_u8])
  struct IWMCodecInfo3
    lpVtbl : IWMCodecInfo3VTbl*
  end

  struct IWMLanguageListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_language_count : UInt64
    get_language_details : UInt64
    add_language_by_rfc1766_string : UInt64
  end

  IWMLanguageList_GUID = "df683f00-2d49-4d8e-92b7-fb19f6a0dc57"
  IID_IWMLanguageList = LibC::GUID.new(0xdf683f00_u32, 0x2d49_u16, 0x4d8e_u16, StaticArray[0x92_u8, 0xb7_u8, 0xfb_u8, 0x19_u8, 0xf6_u8, 0xa0_u8, 0xdc_u8, 0x57_u8])
  struct IWMLanguageList
    lpVtbl : IWMLanguageListVTbl*
  end

  struct IWMWriterPushSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_header : UInt64
    is_real_time : UInt64
    allocate_data_unit : UInt64
    on_data_unit : UInt64
    on_end_writing : UInt64
    connect : UInt64
    disconnect : UInt64
    end_session : UInt64
  end

  IWMWriterPushSink_GUID = "dc10e6a5-072c-467d-bf57-6330a9dde12a"
  IID_IWMWriterPushSink = LibC::GUID.new(0xdc10e6a5_u32, 0x72c_u16, 0x467d_u16, StaticArray[0xbf_u8, 0x57_u8, 0x63_u8, 0x30_u8, 0xa9_u8, 0xdd_u8, 0xe1_u8, 0x2a_u8])
  struct IWMWriterPushSink
    lpVtbl : IWMWriterPushSinkVTbl*
  end

  struct IWMDeviceRegistrationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_device : UInt64
    unregister_device : UInt64
    get_registration_stats : UInt64
    get_first_registered_device : UInt64
    get_next_registered_device : UInt64
    get_registered_device_by_id : UInt64
  end

  IWMDeviceRegistration_GUID = "f6211f03-8d21-4e94-93e6-8510805f2d99"
  IID_IWMDeviceRegistration = LibC::GUID.new(0xf6211f03_u32, 0x8d21_u16, 0x4e94_u16, StaticArray[0x93_u8, 0xe6_u8, 0x85_u8, 0x10_u8, 0x80_u8, 0x5f_u8, 0x2d_u8, 0x99_u8])
  struct IWMDeviceRegistration
    lpVtbl : IWMDeviceRegistrationVTbl*
  end

  struct IWMRegisteredDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_device_serial_number : UInt64
    get_device_certificate : UInt64
    get_device_type : UInt64
    get_attribute_count : UInt64
    get_attribute_by_index : UInt64
    get_attribute_by_name : UInt64
    set_attribute_by_name : UInt64
    approve : UInt64
    is_valid : UInt64
    is_approved : UInt64
    is_wmdrm_compliant : UInt64
    is_opened : UInt64
    open : UInt64
    close : UInt64
  end

  IWMRegisteredDevice_GUID = "a4503bec-5508-4148-97ac-bfa75760a70d"
  IID_IWMRegisteredDevice = LibC::GUID.new(0xa4503bec_u32, 0x5508_u16, 0x4148_u16, StaticArray[0x97_u8, 0xac_u8, 0xbf_u8, 0xa7_u8, 0x57_u8, 0x60_u8, 0xa7_u8, 0xd_u8])
  struct IWMRegisteredDevice
    lpVtbl : IWMRegisteredDeviceVTbl*
  end

  struct IWMProximityDetectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_detection : UInt64
  end

  IWMProximityDetection_GUID = "6a9fd8ee-b651-4bf0-b849-7d4ece79a2b1"
  IID_IWMProximityDetection = LibC::GUID.new(0x6a9fd8ee_u32, 0xb651_u16, 0x4bf0_u16, StaticArray[0xb8_u8, 0x49_u8, 0x7d_u8, 0x4e_u8, 0xce_u8, 0x79_u8, 0xa2_u8, 0xb1_u8])
  struct IWMProximityDetection
    lpVtbl : IWMProximityDetectionVTbl*
  end

  struct IWMDRMMessageParserVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    parse_registration_req_msg : UInt64
    parse_license_request_msg : UInt64
  end

  IWMDRMMessageParser_GUID = "a73a0072-25a0-4c99-b4a5-ede8101a6c39"
  IID_IWMDRMMessageParser = LibC::GUID.new(0xa73a0072_u32, 0x25a0_u16, 0x4c99_u16, StaticArray[0xb4_u8, 0xa5_u8, 0xed_u8, 0xe8_u8, 0x10_u8, 0x1a_u8, 0x6c_u8, 0x39_u8])
  struct IWMDRMMessageParser
    lpVtbl : IWMDRMMessageParserVTbl*
  end

  struct IWMDRMTranscryptorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    seek : UInt64
    read : UInt64
    close : UInt64
  end

  IWMDRMTranscryptor_GUID = "69059850-6e6f-4bb2-806f-71863ddfc471"
  IID_IWMDRMTranscryptor = LibC::GUID.new(0x69059850_u32, 0x6e6f_u16, 0x4bb2_u16, StaticArray[0x80_u8, 0x6f_u8, 0x71_u8, 0x86_u8, 0x3d_u8, 0xdf_u8, 0xc4_u8, 0x71_u8])
  struct IWMDRMTranscryptor
    lpVtbl : IWMDRMTranscryptorVTbl*
  end

  struct IWMDRMTranscryptor2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    seek : UInt64
    read : UInt64
    close : UInt64
    seek_ex : UInt64
    zero_adjust_timestamps : UInt64
    get_seek_start_time : UInt64
    get_duration : UInt64
  end

  IWMDRMTranscryptor2_GUID = "e0da439f-d331-496a-bece-18e5bac5dd23"
  IID_IWMDRMTranscryptor2 = LibC::GUID.new(0xe0da439f_u32, 0xd331_u16, 0x496a_u16, StaticArray[0xbe_u8, 0xce_u8, 0x18_u8, 0xe5_u8, 0xba_u8, 0xc5_u8, 0xdd_u8, 0x23_u8])
  struct IWMDRMTranscryptor2
    lpVtbl : IWMDRMTranscryptor2VTbl*
  end

  struct IWMDRMTranscryptionManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_transcryptor : UInt64
  end

  IWMDRMTranscryptionManager_GUID = "b1a887b2-a4f0-407a-b02e-efbd23bbecdf"
  IID_IWMDRMTranscryptionManager = LibC::GUID.new(0xb1a887b2_u32, 0xa4f0_u16, 0x407a_u16, StaticArray[0xb0_u8, 0x2e_u8, 0xef_u8, 0xbd_u8, 0x23_u8, 0xbb_u8, 0xec_u8, 0xdf_u8])
  struct IWMDRMTranscryptionManager
    lpVtbl : IWMDRMTranscryptionManagerVTbl*
  end

  struct IWMWatermarkInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_watermark_entry_count : UInt64
    get_watermark_entry : UInt64
  end

  IWMWatermarkInfo_GUID = "6f497062-f2e2-4624-8ea7-9dd40d81fc8d"
  IID_IWMWatermarkInfo = LibC::GUID.new(0x6f497062_u32, 0xf2e2_u16, 0x4624_u16, StaticArray[0x8e_u8, 0xa7_u8, 0x9d_u8, 0xd4_u8, 0xd_u8, 0x81_u8, 0xfc_u8, 0x8d_u8])
  struct IWMWatermarkInfo
    lpVtbl : IWMWatermarkInfoVTbl*
  end

  struct IWMReaderAcceleratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_codec_interface : UInt64
    notify : UInt64
  end

  IWMReaderAccelerator_GUID = "bddc4d08-944d-4d52-a612-46c3fda07dd4"
  IID_IWMReaderAccelerator = LibC::GUID.new(0xbddc4d08_u32, 0x944d_u16, 0x4d52_u16, StaticArray[0xa6_u8, 0x12_u8, 0x46_u8, 0xc3_u8, 0xfd_u8, 0xa0_u8, 0x7d_u8, 0xd4_u8])
  struct IWMReaderAccelerator
    lpVtbl : IWMReaderAcceleratorVTbl*
  end

  struct IWMReaderTimecodeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_timecode_range_count : UInt64
    get_timecode_range_bounds : UInt64
  end

  IWMReaderTimecode_GUID = "f369e2f0-e081-4fe6-8450-b810b2f410d1"
  IID_IWMReaderTimecode = LibC::GUID.new(0xf369e2f0_u32, 0xe081_u16, 0x4fe6_u16, StaticArray[0x84_u8, 0x50_u8, 0xb8_u8, 0x10_u8, 0xb2_u8, 0xf4_u8, 0x10_u8, 0xd1_u8])
  struct IWMReaderTimecode
    lpVtbl : IWMReaderTimecodeVTbl*
  end

  struct IWMAddressAccessVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_access_entry_count : UInt64
    get_access_entry : UInt64
    add_access_entry : UInt64
    remove_access_entry : UInt64
  end

  IWMAddressAccess_GUID = "bb3c6389-1633-4e92-af14-9f3173ba39d0"
  IID_IWMAddressAccess = LibC::GUID.new(0xbb3c6389_u32, 0x1633_u16, 0x4e92_u16, StaticArray[0xaf_u8, 0x14_u8, 0x9f_u8, 0x31_u8, 0x73_u8, 0xba_u8, 0x39_u8, 0xd0_u8])
  struct IWMAddressAccess
    lpVtbl : IWMAddressAccessVTbl*
  end

  struct IWMAddressAccess2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_access_entry_count : UInt64
    get_access_entry : UInt64
    add_access_entry : UInt64
    remove_access_entry : UInt64
    get_access_entry_ex : UInt64
    add_access_entry_ex : UInt64
  end

  IWMAddressAccess2_GUID = "65a83fc2-3e98-4d4d-81b5-2a742886b33d"
  IID_IWMAddressAccess2 = LibC::GUID.new(0x65a83fc2_u32, 0x3e98_u16, 0x4d4d_u16, StaticArray[0x81_u8, 0xb5_u8, 0x2a_u8, 0x74_u8, 0x28_u8, 0x86_u8, 0xb3_u8, 0x3d_u8])
  struct IWMAddressAccess2
    lpVtbl : IWMAddressAccess2VTbl*
  end

  struct IWMImageInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_image_count : UInt64
    get_image : UInt64
  end

  IWMImageInfo_GUID = "9f0aa3b6-7267-4d89-88f2-ba915aa5c4c6"
  IID_IWMImageInfo = LibC::GUID.new(0x9f0aa3b6_u32, 0x7267_u16, 0x4d89_u16, StaticArray[0x88_u8, 0xf2_u8, 0xba_u8, 0x91_u8, 0x5a_u8, 0xa5_u8, 0xc4_u8, 0xc6_u8])
  struct IWMImageInfo
    lpVtbl : IWMImageInfoVTbl*
  end

  struct IWMLicenseRevocationAgentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_lrb_challenge : UInt64
    process_lrb : UInt64
  end

  IWMLicenseRevocationAgent_GUID = "6967f2c9-4e26-4b57-8894-799880f7ac7b"
  IID_IWMLicenseRevocationAgent = LibC::GUID.new(0x6967f2c9_u32, 0x4e26_u16, 0x4b57_u16, StaticArray[0x88_u8, 0x94_u8, 0x79_u8, 0x98_u8, 0x80_u8, 0xf7_u8, 0xac_u8, 0x7b_u8])
  struct IWMLicenseRevocationAgent
    lpVtbl : IWMLicenseRevocationAgentVTbl*
  end

  struct IWMAuthorizerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_cert_count : UInt64
    get_cert : UInt64
    get_shared_data : UInt64
  end

  IWMAuthorizer_GUID = "d9b67d36-a9ad-4eb4-baef-db284ef5504c"
  IID_IWMAuthorizer = LibC::GUID.new(0xd9b67d36_u32, 0xa9ad_u16, 0x4eb4_u16, StaticArray[0xba_u8, 0xef_u8, 0xdb_u8, 0x28_u8, 0x4e_u8, 0xf5_u8, 0x50_u8, 0x4c_u8])
  struct IWMAuthorizer
    lpVtbl : IWMAuthorizerVTbl*
  end

  struct IWMSecureChannelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_cert_count : UInt64
    get_cert : UInt64
    get_shared_data : UInt64
    wmsc_add_certificate : UInt64
    wmsc_add_signature : UInt64
    wmsc_connect : UInt64
    wmsc_is_connected : UInt64
    wmsc_disconnect : UInt64
    wmsc_get_valid_certificate : UInt64
    wmsc_encrypt : UInt64
    wmsc_decrypt : UInt64
    wmsc_lock : UInt64
    wmsc_unlock : UInt64
    wmsc_set_shared_data : UInt64
  end

  IWMSecureChannel_GUID = "2720598a-d0f2-4189-bd10-91c46ef0936f"
  IID_IWMSecureChannel = LibC::GUID.new(0x2720598a_u32, 0xd0f2_u16, 0x4189_u16, StaticArray[0xbd_u8, 0x10_u8, 0x91_u8, 0xc4_u8, 0x6e_u8, 0xf0_u8, 0x93_u8, 0x6f_u8])
  struct IWMSecureChannel
    lpVtbl : IWMSecureChannelVTbl*
  end

  struct IWMGetSecureChannelVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_peer_secure_channel_interface : UInt64
  end

  IWMGetSecureChannel_GUID = "94bc0598-c3d2-11d3-bedf-00c04f612986"
  IID_IWMGetSecureChannel = LibC::GUID.new(0x94bc0598_u32, 0xc3d2_u16, 0x11d3_u16, StaticArray[0xbe_u8, 0xdf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x29_u8, 0x86_u8])
  struct IWMGetSecureChannel
    lpVtbl : IWMGetSecureChannelVTbl*
  end

  struct INSNetSourceCreatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    create_net_source : UInt64
    get_net_source_properties : UInt64
    get_net_source_shared_namespace : UInt64
    get_net_source_admin_interface : UInt64
    get_num_protocols_supported : UInt64
    get_protocol_name : UInt64
    shutdown : UInt64
  end

  INSNetSourceCreator_GUID = "0c0e4080-9081-11d2-beec-0060082f2054"
  IID_INSNetSourceCreator = LibC::GUID.new(0xc0e4080_u32, 0x9081_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0xec_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x2f_u8, 0x20_u8, 0x54_u8])
  struct INSNetSourceCreator
    lpVtbl : INSNetSourceCreatorVTbl*
  end

  struct IWMPlayerTimestampHookVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    map_timestamp : UInt64
  end

  IWMPlayerTimestampHook_GUID = "28580dda-d98e-48d0-b7ae-69e473a02825"
  IID_IWMPlayerTimestampHook = LibC::GUID.new(0x28580dda_u32, 0xd98e_u16, 0x48d0_u16, StaticArray[0xb7_u8, 0xae_u8, 0x69_u8, 0xe4_u8, 0x73_u8, 0xa0_u8, 0x28_u8, 0x25_u8])
  struct IWMPlayerTimestampHook
    lpVtbl : IWMPlayerTimestampHookVTbl*
  end

  struct IWMCodecAMVideoAcceleratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_accelerator_interface : UInt64
    negotiate_connection : UInt64
    set_player_notify : UInt64
  end

  IWMCodecAMVideoAccelerator_GUID = "d98ee251-34e0-4a2d-9312-9b4c788d9fa1"
  IID_IWMCodecAMVideoAccelerator = LibC::GUID.new(0xd98ee251_u32, 0x34e0_u16, 0x4a2d_u16, StaticArray[0x93_u8, 0x12_u8, 0x9b_u8, 0x4c_u8, 0x78_u8, 0x8d_u8, 0x9f_u8, 0xa1_u8])
  struct IWMCodecAMVideoAccelerator
    lpVtbl : IWMCodecAMVideoAcceleratorVTbl*
  end

  struct IWMCodecVideoAcceleratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    negotiate_connection : UInt64
    set_player_notify : UInt64
  end

  IWMCodecVideoAccelerator_GUID = "990641b0-739f-4e94-a808-9888da8f75af"
  IID_IWMCodecVideoAccelerator = LibC::GUID.new(0x990641b0_u32, 0x739f_u16, 0x4e94_u16, StaticArray[0xa8_u8, 0x8_u8, 0x98_u8, 0x88_u8, 0xda_u8, 0x8f_u8, 0x75_u8, 0xaf_u8])
  struct IWMCodecVideoAccelerator
    lpVtbl : IWMCodecVideoAcceleratorVTbl*
  end

  struct IWMSInternalAdminNetSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_net_source_creator : UInt64
    set_credentials : UInt64
    get_credentials : UInt64
    delete_credentials : UInt64
    get_credential_flags : UInt64
    set_credential_flags : UInt64
    find_proxy_for_url : UInt64
    register_proxy_failure : UInt64
    shutdown_proxy_context : UInt64
    is_using_ie : UInt64
  end

  IWMSInternalAdminNetSource_GUID = "8bb23e5f-d127-4afb-8d02-ae5b66d54c78"
  IID_IWMSInternalAdminNetSource = LibC::GUID.new(0x8bb23e5f_u32, 0xd127_u16, 0x4afb_u16, StaticArray[0x8d_u8, 0x2_u8, 0xae_u8, 0x5b_u8, 0x66_u8, 0xd5_u8, 0x4c_u8, 0x78_u8])
  struct IWMSInternalAdminNetSource
    lpVtbl : IWMSInternalAdminNetSourceVTbl*
  end

  struct IWMSInternalAdminNetSource2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_credentials_ex : UInt64
    get_credentials_ex : UInt64
    delete_credentials_ex : UInt64
    find_proxy_for_url_ex : UInt64
  end

  IWMSInternalAdminNetSource2_GUID = "e74d58c3-cf77-4b51-af17-744687c43eae"
  IID_IWMSInternalAdminNetSource2 = LibC::GUID.new(0xe74d58c3_u32, 0xcf77_u16, 0x4b51_u16, StaticArray[0xaf_u8, 0x17_u8, 0x74_u8, 0x46_u8, 0x87_u8, 0xc4_u8, 0x3e_u8, 0xae_u8])
  struct IWMSInternalAdminNetSource2
    lpVtbl : IWMSInternalAdminNetSource2VTbl*
  end

  struct IWMSInternalAdminNetSource3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_credentials_ex : UInt64
    get_credentials_ex : UInt64
    delete_credentials_ex : UInt64
    find_proxy_for_url_ex : UInt64
    get_net_source_creator2 : UInt64
    find_proxy_for_url_ex2 : UInt64
    register_proxy_failure2 : UInt64
    shutdown_proxy_context2 : UInt64
    is_using_ie2 : UInt64
    set_credentials_ex2 : UInt64
    get_credentials_ex2 : UInt64
  end

  IWMSInternalAdminNetSource3_GUID = "6b63d08e-4590-44af-9eb3-57ff1e73bf80"
  IID_IWMSInternalAdminNetSource3 = LibC::GUID.new(0x6b63d08e_u32, 0x4590_u16, 0x44af_u16, StaticArray[0x9e_u8, 0xb3_u8, 0x57_u8, 0xff_u8, 0x1e_u8, 0x73_u8, 0xbf_u8, 0x80_u8])
  struct IWMSInternalAdminNetSource3
    lpVtbl : IWMSInternalAdminNetSource3VTbl*
  end


  # Params # pwszfilename : LibC::LPWSTR [In],pfisprotected : LibC::BOOL* [In]
  fun WMIsContentProtected(pwszfilename : LibC::LPWSTR, pfisprotected : LibC::BOOL*) : HRESULT

  # Params # punkcert : IUnknown [In],ppwriter : IWMWriter* [In]
  fun WMCreateWriter(punkcert : IUnknown, ppwriter : IWMWriter*) : HRESULT

  # Params # punkcert : IUnknown [In],dwrights : UInt32 [In],ppreader : IWMReader* [In]
  fun WMCreateReader(punkcert : IUnknown, dwrights : UInt32, ppreader : IWMReader*) : HRESULT

  # Params # punkcert : IUnknown [In],dwrights : UInt32 [In],ppsyncreader : IWMSyncReader* [In]
  fun WMCreateSyncReader(punkcert : IUnknown, dwrights : UInt32, ppsyncreader : IWMSyncReader*) : HRESULT

  # Params # ppeditor : IWMMetadataEditor* [In]
  fun WMCreateEditor(ppeditor : IWMMetadataEditor*) : HRESULT

  # Params # ppindexer : IWMIndexer* [In]
  fun WMCreateIndexer(ppindexer : IWMIndexer*) : HRESULT

  # Params # pcallback : IUnknown [In],ppbackup : IWMLicenseBackup* [In]
  fun WMCreateBackupRestorer(pcallback : IUnknown, ppbackup : IWMLicenseBackup*) : HRESULT

  # Params # ppprofilemanager : IWMProfileManager* [In]
  fun WMCreateProfileManager(ppprofilemanager : IWMProfileManager*) : HRESULT

  # Params # ppsink : IWMWriterFileSink* [In]
  fun WMCreateWriterFileSink(ppsink : IWMWriterFileSink*) : HRESULT

  # Params # ppsink : IWMWriterNetworkSink* [In]
  fun WMCreateWriterNetworkSink(ppsink : IWMWriterNetworkSink*) : HRESULT

  # Params # ppsink : IWMWriterPushSink* [In]
  fun WMCreateWriterPushSink(ppsink : IWMWriterPushSink*) : HRESULT
end
struct LibWin32::IAMWMBufferPass
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_notify(pcallback : IAMWMBufferPassCallback) : HRESULT
    @lpVtbl.value.set_notify.unsafe_as(Proc(IAMWMBufferPassCallback, HRESULT)).call(pcallback)
  end
end
struct LibWin32::IAMWMBufferPassCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def notify(pnssbuffer3 : INSSBuffer3, ppin : IPin, prtstart : Int64*, prtend : Int64*) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(INSSBuffer3, IPin, Int64*, Int64*, HRESULT)).call(pnssbuffer3, ppin, prtstart, prtend)
  end
end
struct LibWin32::INSSBuffer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def set_length(dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.unsafe_as(Proc(UInt32, HRESULT)).call(dwlength)
  end
  def get_max_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def get_buffer(ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, HRESULT)).call(ppdwbuffer)
  end
  def get_buffer_and_length(ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(ppdwbuffer, pdwlength)
  end
end
struct LibWin32::INSSBuffer2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def set_length(dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.unsafe_as(Proc(UInt32, HRESULT)).call(dwlength)
  end
  def get_max_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def get_buffer(ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, HRESULT)).call(ppdwbuffer)
  end
  def get_buffer_and_length(ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(ppdwbuffer, pdwlength)
  end
  def get_sample_properties(cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.get_sample_properties.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbproperties, pbproperties)
  end
  def set_sample_properties(cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.set_sample_properties.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbproperties, pbproperties)
  end
end
struct LibWin32::INSSBuffer3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def set_length(dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.unsafe_as(Proc(UInt32, HRESULT)).call(dwlength)
  end
  def get_max_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def get_buffer(ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, HRESULT)).call(ppdwbuffer)
  end
  def get_buffer_and_length(ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(ppdwbuffer, pdwlength)
  end
  def get_sample_properties(cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.get_sample_properties.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbproperties, pbproperties)
  end
  def set_sample_properties(cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.set_sample_properties.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbproperties, pbproperties)
  end
  def set_property(guidbufferproperty : Guid, pvbufferproperty : Void*, dwbufferpropertysize : UInt32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Guid, Void*, UInt32, HRESULT)).call(guidbufferproperty, pvbufferproperty, dwbufferpropertysize)
  end
  def get_property(guidbufferproperty : Guid, pvbufferproperty : Void*, pdwbufferpropertysize : UInt32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Guid, Void*, UInt32*, HRESULT)).call(guidbufferproperty, pvbufferproperty, pdwbufferpropertysize)
  end
end
struct LibWin32::INSSBuffer4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def set_length(dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.unsafe_as(Proc(UInt32, HRESULT)).call(dwlength)
  end
  def get_max_length(pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwlength)
  end
  def get_buffer(ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.unsafe_as(Proc(UInt8**, HRESULT)).call(ppdwbuffer)
  end
  def get_buffer_and_length(ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(ppdwbuffer, pdwlength)
  end
  def get_sample_properties(cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.get_sample_properties.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbproperties, pbproperties)
  end
  def set_sample_properties(cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.set_sample_properties.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(cbproperties, pbproperties)
  end
  def set_property(guidbufferproperty : Guid, pvbufferproperty : Void*, dwbufferpropertysize : UInt32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(Guid, Void*, UInt32, HRESULT)).call(guidbufferproperty, pvbufferproperty, dwbufferpropertysize)
  end
  def get_property(guidbufferproperty : Guid, pvbufferproperty : Void*, pdwbufferpropertysize : UInt32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Guid, Void*, UInt32*, HRESULT)).call(guidbufferproperty, pvbufferproperty, pdwbufferpropertysize)
  end
  def get_property_count(pcbufferproperties : UInt32*) : HRESULT
    @lpVtbl.value.get_property_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbufferproperties)
  end
  def get_property_by_index(dwbufferpropertyindex : UInt32, pguidbufferproperty : Guid*, pvbufferproperty : Void*, pdwbufferpropertysize : UInt32*) : HRESULT
    @lpVtbl.value.get_property_by_index.unsafe_as(Proc(UInt32, Guid*, Void*, UInt32*, HRESULT)).call(dwbufferpropertyindex, pguidbufferproperty, pvbufferproperty, pdwbufferpropertysize)
  end
end
struct LibWin32::IWMSBufferAllocator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def allocate_buffer(dwmaxbuffersize : UInt32, ppbuffer : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_buffer.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(dwmaxbuffersize, ppbuffer)
  end
  def allocate_page_size_buffer(dwmaxbuffersize : UInt32, ppbuffer : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_page_size_buffer.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(dwmaxbuffersize, ppbuffer)
  end
end
struct LibWin32::IWMMediaProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def get_media_type(ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, UInt32*, HRESULT)).call(ptype, pcbtype)
  end
  def set_media_type(ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, HRESULT)).call(ptype)
  end
end
struct LibWin32::IWMVideoMediaProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def get_media_type(ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, UInt32*, HRESULT)).call(ptype, pcbtype)
  end
  def set_media_type(ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, HRESULT)).call(ptype)
  end
  def get_max_key_frame_spacing(plltime : Int64*) : HRESULT
    @lpVtbl.value.get_max_key_frame_spacing.unsafe_as(Proc(Int64*, HRESULT)).call(plltime)
  end
  def set_max_key_frame_spacing(lltime : Int64) : HRESULT
    @lpVtbl.value.set_max_key_frame_spacing.unsafe_as(Proc(Int64, HRESULT)).call(lltime)
  end
  def get_quality(pdwquality : UInt32*) : HRESULT
    @lpVtbl.value.get_quality.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwquality)
  end
  def set_quality(dwquality : UInt32) : HRESULT
    @lpVtbl.value.set_quality.unsafe_as(Proc(UInt32, HRESULT)).call(dwquality)
  end
end
struct LibWin32::IWMWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_profile_by_id(guidprofile : Guid*) : HRESULT
    @lpVtbl.value.set_profile_by_id.unsafe_as(Proc(Guid*, HRESULT)).call(guidprofile)
  end
  def set_profile(pprofile : IWMProfile) : HRESULT
    @lpVtbl.value.set_profile.unsafe_as(Proc(IWMProfile, HRESULT)).call(pprofile)
  end
  def set_output_filename(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_output_filename.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def get_input_count(pcinputs : UInt32*) : HRESULT
    @lpVtbl.value.get_input_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcinputs)
  end
  def get_input_props(dwinputnum : UInt32, ppinput : IWMInputMediaProps*) : HRESULT
    @lpVtbl.value.get_input_props.unsafe_as(Proc(UInt32, IWMInputMediaProps*, HRESULT)).call(dwinputnum, ppinput)
  end
  def set_input_props(dwinputnum : UInt32, pinput : IWMInputMediaProps) : HRESULT
    @lpVtbl.value.set_input_props.unsafe_as(Proc(UInt32, IWMInputMediaProps, HRESULT)).call(dwinputnum, pinput)
  end
  def get_input_format_count(dwinputnumber : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_input_format_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwinputnumber, pcformats)
  end
  def get_input_format(dwinputnumber : UInt32, dwformatnumber : UInt32, pprops : IWMInputMediaProps*) : HRESULT
    @lpVtbl.value.get_input_format.unsafe_as(Proc(UInt32, UInt32, IWMInputMediaProps*, HRESULT)).call(dwinputnumber, dwformatnumber, pprops)
  end
  def begin_writing : HRESULT
    @lpVtbl.value.begin_writing.unsafe_as(Proc(HRESULT)).call
  end
  def end_writing : HRESULT
    @lpVtbl.value.end_writing.unsafe_as(Proc(HRESULT)).call
  end
  def allocate_sample(dwsamplesize : UInt32, ppsample : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_sample.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(dwsamplesize, ppsample)
  end
  def write_sample(dwinputnum : UInt32, cnssampletime : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_sample.unsafe_as(Proc(UInt32, UInt64, UInt32, INSSBuffer, HRESULT)).call(dwinputnum, cnssampletime, dwflags, psample)
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMDRMWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def generate_key_seed(pwszkeyseed : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_seed.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszkeyseed, pcwchlength)
  end
  def generate_key_id(pwszkeyid : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_id.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszkeyid, pcwchlength)
  end
  def generate_signing_key_pair(pwszprivkey : Char*, pcwchprivkeylength : UInt32*, pwszpubkey : Char*, pcwchpubkeylength : UInt32*) : HRESULT
    @lpVtbl.value.generate_signing_key_pair.unsafe_as(Proc(Char*, UInt32*, Char*, UInt32*, HRESULT)).call(pwszprivkey, pcwchprivkeylength, pwszpubkey, pcwchpubkeylength)
  end
  def set_drm_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(wstreamnum, pszname, type, pvalue, cblength)
  end
end
struct LibWin32::IWMDRMWriter2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def generate_key_seed(pwszkeyseed : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_seed.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszkeyseed, pcwchlength)
  end
  def generate_key_id(pwszkeyid : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_id.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszkeyid, pcwchlength)
  end
  def generate_signing_key_pair(pwszprivkey : Char*, pcwchprivkeylength : UInt32*, pwszpubkey : Char*, pcwchpubkeylength : UInt32*) : HRESULT
    @lpVtbl.value.generate_signing_key_pair.unsafe_as(Proc(Char*, UInt32*, Char*, UInt32*, HRESULT)).call(pwszprivkey, pcwchprivkeylength, pwszpubkey, pcwchpubkeylength)
  end
  def set_drm_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(wstreamnum, pszname, type, pvalue, cblength)
  end
  def set_wmdrm_net_encryption(fsamplesencrypted : LibC::BOOL, pbkeyid : UInt8*, cbkeyid : UInt32) : HRESULT
    @lpVtbl.value.set_wmdrm_net_encryption.unsafe_as(Proc(LibC::BOOL, UInt8*, UInt32, HRESULT)).call(fsamplesencrypted, pbkeyid, cbkeyid)
  end
end
struct LibWin32::IWMDRMWriter3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def generate_key_seed(pwszkeyseed : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_seed.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszkeyseed, pcwchlength)
  end
  def generate_key_id(pwszkeyid : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_id.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszkeyid, pcwchlength)
  end
  def generate_signing_key_pair(pwszprivkey : Char*, pcwchprivkeylength : UInt32*, pwszpubkey : Char*, pcwchpubkeylength : UInt32*) : HRESULT
    @lpVtbl.value.generate_signing_key_pair.unsafe_as(Proc(Char*, UInt32*, Char*, UInt32*, HRESULT)).call(pwszprivkey, pcwchprivkeylength, pwszpubkey, pcwchpubkeylength)
  end
  def set_drm_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(wstreamnum, pszname, type, pvalue, cblength)
  end
  def set_wmdrm_net_encryption(fsamplesencrypted : LibC::BOOL, pbkeyid : UInt8*, cbkeyid : UInt32) : HRESULT
    @lpVtbl.value.set_wmdrm_net_encryption.unsafe_as(Proc(LibC::BOOL, UInt8*, UInt32, HRESULT)).call(fsamplesencrypted, pbkeyid, cbkeyid)
  end
  def set_protect_stream_samples(pimportinitstruct : WMDRM_IMPORT_INIT_STRUCT*) : HRESULT
    @lpVtbl.value.set_protect_stream_samples.unsafe_as(Proc(WMDRM_IMPORT_INIT_STRUCT*, HRESULT)).call(pimportinitstruct)
  end
end
struct LibWin32::IWMInputMediaProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def get_media_type(ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, UInt32*, HRESULT)).call(ptype, pcbtype)
  end
  def set_media_type(ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, HRESULT)).call(ptype)
  end
  def get_connection_name(pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszname, pcchname)
  end
  def get_group_name(pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_group_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszname, pcchname)
  end
end
struct LibWin32::IWMPropertyVault
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_count(pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_property_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcount)
  end
  def get_property_by_name(pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_property_by_name.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)).call(pszname, ptype, pvalue, pdwsize)
  end
  def set_property(pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE, pvalue : UInt8*, dwsize : UInt32) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt32, HRESULT)).call(pszname, ptype, pvalue, dwsize)
  end
  def get_property_by_index(dwindex : UInt32, pszname : Char*, pdwnamelen : UInt32*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_property_by_index.unsafe_as(Proc(UInt32, Char*, UInt32*, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)).call(dwindex, pszname, pdwnamelen, ptype, pvalue, pdwsize)
  end
  def copy_properties_from(piwmpropertyvault : IWMPropertyVault) : HRESULT
    @lpVtbl.value.copy_properties_from.unsafe_as(Proc(IWMPropertyVault, HRESULT)).call(piwmpropertyvault)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMIStreamProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property(pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)).call(pszname, ptype, pvalue, pdwsize)
  end
end
struct LibWin32::IWMReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(pwszurl : LibC::LPWSTR, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, IWMReaderCallback, Void*, HRESULT)).call(pwszurl, pcallback, pvcontext)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def get_output_count(pcoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcoutputs)
  end
  def get_output_props(dwoutputnum : UInt32, ppoutput : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps*, HRESULT)).call(dwoutputnum, ppoutput)
  end
  def set_output_props(dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.set_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps, HRESULT)).call(dwoutputnum, poutput)
  end
  def get_output_format_count(dwoutputnumber : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_output_format_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutputnumber, pcformats)
  end
  def get_output_format(dwoutputnumber : UInt32, dwformatnumber : UInt32, ppprops : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_format.unsafe_as(Proc(UInt32, UInt32, IWMOutputMediaProps*, HRESULT)).call(dwoutputnumber, dwformatnumber, ppprops)
  end
  def start(cnsstart : UInt64, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt64, UInt64, Float32, Void*, HRESULT)).call(cnsstart, cnsduration, frate, pvcontext)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMSyncReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def set_range(cnsstarttime : UInt64, cnsduration : Int64) : HRESULT
    @lpVtbl.value.set_range.unsafe_as(Proc(UInt64, Int64, HRESULT)).call(cnsstarttime, cnsduration)
  end
  def set_range_by_frame(wstreamnum : UInt16, qwframenumber : UInt64, cframestoread : Int64) : HRESULT
    @lpVtbl.value.set_range_by_frame.unsafe_as(Proc(UInt16, UInt64, Int64, HRESULT)).call(wstreamnum, qwframenumber, cframestoread)
  end
  def get_next_sample(wstreamnum : UInt16, ppsample : INSSBuffer*, pcnssampletime : UInt64*, pcnsduration : UInt64*, pdwflags : UInt32*, pdwoutputnum : UInt32*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_next_sample.unsafe_as(Proc(UInt16, INSSBuffer*, UInt64*, UInt64*, UInt32*, UInt32*, UInt16*, HRESULT)).call(wstreamnum, ppsample, pcnssampletime, pcnsduration, pdwflags, pdwoutputnum, pwstreamnum)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_read_stream_samples(wstreamnum : UInt16, fcompressed : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_read_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fcompressed)
  end
  def get_read_stream_samples(wstreamnum : UInt16, pfcompressed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_read_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfcompressed)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def get_output_count(pcoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcoutputs)
  end
  def get_output_props(dwoutputnum : UInt32, ppoutput : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps*, HRESULT)).call(dwoutputnum, ppoutput)
  end
  def set_output_props(dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.set_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps, HRESULT)).call(dwoutputnum, poutput)
  end
  def get_output_format_count(dwoutputnum : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_output_format_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutputnum, pcformats)
  end
  def get_output_format(dwoutputnum : UInt32, dwformatnum : UInt32, ppprops : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_format.unsafe_as(Proc(UInt32, UInt32, IWMOutputMediaProps*, HRESULT)).call(dwoutputnum, dwformatnum, ppprops)
  end
  def get_output_number_for_stream(wstreamnum : UInt16, pdwoutputnum : UInt32*) : HRESULT
    @lpVtbl.value.get_output_number_for_stream.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstreamnum, pdwoutputnum)
  end
  def get_stream_number_for_output(dwoutputnum : UInt32, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number_for_output.unsafe_as(Proc(UInt32, UInt16*, HRESULT)).call(dwoutputnum, pwstreamnum)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def open_stream(pstream : IStream) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, HRESULT)).call(pstream)
  end
end
struct LibWin32::IWMSyncReader2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def set_range(cnsstarttime : UInt64, cnsduration : Int64) : HRESULT
    @lpVtbl.value.set_range.unsafe_as(Proc(UInt64, Int64, HRESULT)).call(cnsstarttime, cnsduration)
  end
  def set_range_by_frame(wstreamnum : UInt16, qwframenumber : UInt64, cframestoread : Int64) : HRESULT
    @lpVtbl.value.set_range_by_frame.unsafe_as(Proc(UInt16, UInt64, Int64, HRESULT)).call(wstreamnum, qwframenumber, cframestoread)
  end
  def get_next_sample(wstreamnum : UInt16, ppsample : INSSBuffer*, pcnssampletime : UInt64*, pcnsduration : UInt64*, pdwflags : UInt32*, pdwoutputnum : UInt32*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_next_sample.unsafe_as(Proc(UInt16, INSSBuffer*, UInt64*, UInt64*, UInt32*, UInt32*, UInt16*, HRESULT)).call(wstreamnum, ppsample, pcnssampletime, pcnsduration, pdwflags, pdwoutputnum, pwstreamnum)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_read_stream_samples(wstreamnum : UInt16, fcompressed : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_read_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fcompressed)
  end
  def get_read_stream_samples(wstreamnum : UInt16, pfcompressed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_read_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfcompressed)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def get_output_count(pcoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcoutputs)
  end
  def get_output_props(dwoutputnum : UInt32, ppoutput : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps*, HRESULT)).call(dwoutputnum, ppoutput)
  end
  def set_output_props(dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.set_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps, HRESULT)).call(dwoutputnum, poutput)
  end
  def get_output_format_count(dwoutputnum : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_output_format_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutputnum, pcformats)
  end
  def get_output_format(dwoutputnum : UInt32, dwformatnum : UInt32, ppprops : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_format.unsafe_as(Proc(UInt32, UInt32, IWMOutputMediaProps*, HRESULT)).call(dwoutputnum, dwformatnum, ppprops)
  end
  def get_output_number_for_stream(wstreamnum : UInt16, pdwoutputnum : UInt32*) : HRESULT
    @lpVtbl.value.get_output_number_for_stream.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstreamnum, pdwoutputnum)
  end
  def get_stream_number_for_output(dwoutputnum : UInt32, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number_for_output.unsafe_as(Proc(UInt32, UInt16*, HRESULT)).call(dwoutputnum, pwstreamnum)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def open_stream(pstream : IStream) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, HRESULT)).call(pstream)
  end
  def set_range_by_timecode(wstreamnum : UInt16, pstart : WMT_TIMECODE_EXTENSION_DATA*, pend : WMT_TIMECODE_EXTENSION_DATA*) : HRESULT
    @lpVtbl.value.set_range_by_timecode.unsafe_as(Proc(UInt16, WMT_TIMECODE_EXTENSION_DATA*, WMT_TIMECODE_EXTENSION_DATA*, HRESULT)).call(wstreamnum, pstart, pend)
  end
  def set_range_by_frame_ex(wstreamnum : UInt16, qwframenumber : UInt64, cframestoread : Int64, pcnsstarttime : UInt64*) : HRESULT
    @lpVtbl.value.set_range_by_frame_ex.unsafe_as(Proc(UInt16, UInt64, Int64, UInt64*, HRESULT)).call(wstreamnum, qwframenumber, cframestoread, pcnsstarttime)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, pallocator : IWMReaderAllocatorEx) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, IWMReaderAllocatorEx, HRESULT)).call(dwoutputnum, pallocator)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, ppallocator : IWMReaderAllocatorEx*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, IWMReaderAllocatorEx*, HRESULT)).call(dwoutputnum, ppallocator)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, pallocator : IWMReaderAllocatorEx) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, IWMReaderAllocatorEx, HRESULT)).call(wstreamnum, pallocator)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, ppallocator : IWMReaderAllocatorEx*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, IWMReaderAllocatorEx*, HRESULT)).call(dwsreamnum, ppallocator)
  end
end
struct LibWin32::IWMOutputMediaProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def get_media_type(ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, UInt32*, HRESULT)).call(ptype, pcbtype)
  end
  def set_media_type(ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.unsafe_as(Proc(WM_MEDIA_TYPE*, HRESULT)).call(ptype)
  end
  def get_stream_group_name(pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_group_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszname, pcchname)
  end
  def get_connection_name(pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszname, pcchname)
  end
end
struct LibWin32::IWMStatusCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_status(status : WMT_STATUS, hr : HRESULT, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_status.unsafe_as(Proc(WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)).call(status, hr, dwtype, pvalue, pvcontext)
  end
end
struct LibWin32::IWMReaderCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_status(status : WMT_STATUS, hr : HRESULT, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_status.unsafe_as(Proc(WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)).call(status, hr, dwtype, pvalue, pvcontext)
  end
  def on_sample(dwoutputnum : UInt32, cnssampletime : UInt64, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_sample.unsafe_as(Proc(UInt32, UInt64, UInt64, UInt32, INSSBuffer, Void*, HRESULT)).call(dwoutputnum, cnssampletime, cnssampleduration, dwflags, psample, pvcontext)
  end
end
struct LibWin32::IWMCredentialCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def acquire_credentials(pwszrealm : LibC::LPWSTR, pwszsite : LibC::LPWSTR, pwszuser : Char*, cchuser : UInt32, pwszpassword : Char*, cchpassword : UInt32, hrstatus : HRESULT, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.acquire_credentials.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Char*, UInt32, Char*, UInt32, HRESULT, UInt32*, HRESULT)).call(pwszrealm, pwszsite, pwszuser, cchuser, pwszpassword, cchpassword, hrstatus, pdwflags)
  end
end
struct LibWin32::IWMMetadataEditor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMMetadataEditor2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
  def open_ex(pwszfilename : LibC::LPWSTR, dwdesiredaccess : UInt32, dwsharemode : UInt32) : HRESULT
    @lpVtbl.value.open_ex.unsafe_as(Proc(LibC::LPWSTR, UInt32, UInt32, HRESULT)).call(pwszfilename, dwdesiredaccess, dwsharemode)
  end
end
struct LibWin32::IWMDRMEditor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_drm_property(pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstrname, pdwtype, pvalue, pcblength)
  end
end
struct LibWin32::IWMHeaderInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_count(wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count.unsafe_as(Proc(UInt16, UInt16*, HRESULT)).call(wstreamnum, pcattributes)
  end
  def get_attribute_by_index(windex : UInt16, pwstreamnum : UInt16*, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_index.unsafe_as(Proc(UInt16, UInt16*, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(windex, pwstreamnum, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_attribute_by_name(pwstreamnum : UInt16*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_name.unsafe_as(Proc(UInt16*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstreamnum, pszname, ptype, pvalue, pcblength)
  end
  def set_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(wstreamnum, pszname, type, pvalue, cblength)
  end
  def get_marker_count(pcmarkers : UInt16*) : HRESULT
    @lpVtbl.value.get_marker_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcmarkers)
  end
  def get_marker(windex : UInt16, pwszmarkername : Char*, pcchmarkernamelen : UInt16*, pcnsmarkertime : UInt64*) : HRESULT
    @lpVtbl.value.get_marker.unsafe_as(Proc(UInt16, Char*, UInt16*, UInt64*, HRESULT)).call(windex, pwszmarkername, pcchmarkernamelen, pcnsmarkertime)
  end
  def add_marker(pwszmarkername : LibC::LPWSTR, cnsmarkertime : UInt64) : HRESULT
    @lpVtbl.value.add_marker.unsafe_as(Proc(LibC::LPWSTR, UInt64, HRESULT)).call(pwszmarkername, cnsmarkertime)
  end
  def remove_marker(windex : UInt16) : HRESULT
    @lpVtbl.value.remove_marker.unsafe_as(Proc(UInt16, HRESULT)).call(windex)
  end
  def get_script_count(pcscripts : UInt16*) : HRESULT
    @lpVtbl.value.get_script_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcscripts)
  end
  def get_script(windex : UInt16, pwsztype : Char*, pcchtypelen : UInt16*, pwszcommand : Char*, pcchcommandlen : UInt16*, pcnsscripttime : UInt64*) : HRESULT
    @lpVtbl.value.get_script.unsafe_as(Proc(UInt16, Char*, UInt16*, Char*, UInt16*, UInt64*, HRESULT)).call(windex, pwsztype, pcchtypelen, pwszcommand, pcchcommandlen, pcnsscripttime)
  end
  def add_script(pwsztype : LibC::LPWSTR, pwszcommand : LibC::LPWSTR, cnsscripttime : UInt64) : HRESULT
    @lpVtbl.value.add_script.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt64, HRESULT)).call(pwsztype, pwszcommand, cnsscripttime)
  end
  def remove_script(windex : UInt16) : HRESULT
    @lpVtbl.value.remove_script.unsafe_as(Proc(UInt16, HRESULT)).call(windex)
  end
end
struct LibWin32::IWMHeaderInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_count(wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count.unsafe_as(Proc(UInt16, UInt16*, HRESULT)).call(wstreamnum, pcattributes)
  end
  def get_attribute_by_index(windex : UInt16, pwstreamnum : UInt16*, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_index.unsafe_as(Proc(UInt16, UInt16*, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(windex, pwstreamnum, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_attribute_by_name(pwstreamnum : UInt16*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_name.unsafe_as(Proc(UInt16*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstreamnum, pszname, ptype, pvalue, pcblength)
  end
  def set_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(wstreamnum, pszname, type, pvalue, cblength)
  end
  def get_marker_count(pcmarkers : UInt16*) : HRESULT
    @lpVtbl.value.get_marker_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcmarkers)
  end
  def get_marker(windex : UInt16, pwszmarkername : Char*, pcchmarkernamelen : UInt16*, pcnsmarkertime : UInt64*) : HRESULT
    @lpVtbl.value.get_marker.unsafe_as(Proc(UInt16, Char*, UInt16*, UInt64*, HRESULT)).call(windex, pwszmarkername, pcchmarkernamelen, pcnsmarkertime)
  end
  def add_marker(pwszmarkername : LibC::LPWSTR, cnsmarkertime : UInt64) : HRESULT
    @lpVtbl.value.add_marker.unsafe_as(Proc(LibC::LPWSTR, UInt64, HRESULT)).call(pwszmarkername, cnsmarkertime)
  end
  def remove_marker(windex : UInt16) : HRESULT
    @lpVtbl.value.remove_marker.unsafe_as(Proc(UInt16, HRESULT)).call(windex)
  end
  def get_script_count(pcscripts : UInt16*) : HRESULT
    @lpVtbl.value.get_script_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcscripts)
  end
  def get_script(windex : UInt16, pwsztype : Char*, pcchtypelen : UInt16*, pwszcommand : Char*, pcchcommandlen : UInt16*, pcnsscripttime : UInt64*) : HRESULT
    @lpVtbl.value.get_script.unsafe_as(Proc(UInt16, Char*, UInt16*, Char*, UInt16*, UInt64*, HRESULT)).call(windex, pwsztype, pcchtypelen, pwszcommand, pcchcommandlen, pcnsscripttime)
  end
  def add_script(pwsztype : LibC::LPWSTR, pwszcommand : LibC::LPWSTR, cnsscripttime : UInt64) : HRESULT
    @lpVtbl.value.add_script.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt64, HRESULT)).call(pwsztype, pwszcommand, cnsscripttime)
  end
  def remove_script(windex : UInt16) : HRESULT
    @lpVtbl.value.remove_script.unsafe_as(Proc(UInt16, HRESULT)).call(windex)
  end
  def get_codec_info_count(pccodecinfos : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pccodecinfos)
  end
  def get_codec_info(windex : UInt32, pcchname : UInt16*, pwszname : Char*, pcchdescription : UInt16*, pwszdescription : Char*, pcodectype : WMT_CODEC_INFO_TYPE*, pcbcodecinfo : UInt16*, pbcodecinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_codec_info.unsafe_as(Proc(UInt32, UInt16*, Char*, UInt16*, Char*, WMT_CODEC_INFO_TYPE*, UInt16*, UInt8*, HRESULT)).call(windex, pcchname, pwszname, pcchdescription, pwszdescription, pcodectype, pcbcodecinfo, pbcodecinfo)
  end
end
struct LibWin32::IWMHeaderInfo3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_attribute_count(wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count.unsafe_as(Proc(UInt16, UInt16*, HRESULT)).call(wstreamnum, pcattributes)
  end
  def get_attribute_by_index(windex : UInt16, pwstreamnum : UInt16*, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_index.unsafe_as(Proc(UInt16, UInt16*, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(windex, pwstreamnum, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_attribute_by_name(pwstreamnum : UInt16*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_name.unsafe_as(Proc(UInt16*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstreamnum, pszname, ptype, pvalue, pcblength)
  end
  def set_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(wstreamnum, pszname, type, pvalue, cblength)
  end
  def get_marker_count(pcmarkers : UInt16*) : HRESULT
    @lpVtbl.value.get_marker_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcmarkers)
  end
  def get_marker(windex : UInt16, pwszmarkername : Char*, pcchmarkernamelen : UInt16*, pcnsmarkertime : UInt64*) : HRESULT
    @lpVtbl.value.get_marker.unsafe_as(Proc(UInt16, Char*, UInt16*, UInt64*, HRESULT)).call(windex, pwszmarkername, pcchmarkernamelen, pcnsmarkertime)
  end
  def add_marker(pwszmarkername : LibC::LPWSTR, cnsmarkertime : UInt64) : HRESULT
    @lpVtbl.value.add_marker.unsafe_as(Proc(LibC::LPWSTR, UInt64, HRESULT)).call(pwszmarkername, cnsmarkertime)
  end
  def remove_marker(windex : UInt16) : HRESULT
    @lpVtbl.value.remove_marker.unsafe_as(Proc(UInt16, HRESULT)).call(windex)
  end
  def get_script_count(pcscripts : UInt16*) : HRESULT
    @lpVtbl.value.get_script_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcscripts)
  end
  def get_script(windex : UInt16, pwsztype : Char*, pcchtypelen : UInt16*, pwszcommand : Char*, pcchcommandlen : UInt16*, pcnsscripttime : UInt64*) : HRESULT
    @lpVtbl.value.get_script.unsafe_as(Proc(UInt16, Char*, UInt16*, Char*, UInt16*, UInt64*, HRESULT)).call(windex, pwsztype, pcchtypelen, pwszcommand, pcchcommandlen, pcnsscripttime)
  end
  def add_script(pwsztype : LibC::LPWSTR, pwszcommand : LibC::LPWSTR, cnsscripttime : UInt64) : HRESULT
    @lpVtbl.value.add_script.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, UInt64, HRESULT)).call(pwsztype, pwszcommand, cnsscripttime)
  end
  def remove_script(windex : UInt16) : HRESULT
    @lpVtbl.value.remove_script.unsafe_as(Proc(UInt16, HRESULT)).call(windex)
  end
  def get_codec_info_count(pccodecinfos : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pccodecinfos)
  end
  def get_codec_info(windex : UInt32, pcchname : UInt16*, pwszname : Char*, pcchdescription : UInt16*, pwszdescription : Char*, pcodectype : WMT_CODEC_INFO_TYPE*, pcbcodecinfo : UInt16*, pbcodecinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_codec_info.unsafe_as(Proc(UInt32, UInt16*, Char*, UInt16*, Char*, WMT_CODEC_INFO_TYPE*, UInt16*, UInt8*, HRESULT)).call(windex, pcchname, pwszname, pcchdescription, pwszdescription, pcodectype, pcbcodecinfo, pbcodecinfo)
  end
  def get_attribute_count_ex(wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count_ex.unsafe_as(Proc(UInt16, UInt16*, HRESULT)).call(wstreamnum, pcattributes)
  end
  def get_attribute_indices(wstreamnum : UInt16, pwszname : LibC::LPWSTR, pwlangindex : UInt16*, pwindices : UInt16*, pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_indices.unsafe_as(Proc(UInt16, LibC::LPWSTR, UInt16*, UInt16*, UInt16*, HRESULT)).call(wstreamnum, pwszname, pwlangindex, pwindices, pwcount)
  end
  def get_attribute_by_index_ex(wstreamnum : UInt16, windex : UInt16, pwszname : Char*, pwnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pwlangindex : UInt16*, pvalue : UInt8*, pdwdatalength : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_by_index_ex.unsafe_as(Proc(UInt16, UInt16, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt16*, UInt8*, UInt32*, HRESULT)).call(wstreamnum, windex, pwszname, pwnamelen, ptype, pwlangindex, pvalue, pdwdatalength)
  end
  def modify_attribute(wstreamnum : UInt16, windex : UInt16, type : WMT_ATTR_DATATYPE, wlangindex : UInt16, pvalue : UInt8*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.modify_attribute.unsafe_as(Proc(UInt16, UInt16, WMT_ATTR_DATATYPE, UInt16, UInt8*, UInt32, HRESULT)).call(wstreamnum, windex, type, wlangindex, pvalue, dwlength)
  end
  def add_attribute(wstreamnum : UInt16, pszname : LibC::LPWSTR, pwindex : UInt16*, type : WMT_ATTR_DATATYPE, wlangindex : UInt16, pvalue : UInt8*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.add_attribute.unsafe_as(Proc(UInt16, LibC::LPWSTR, UInt16*, WMT_ATTR_DATATYPE, UInt16, UInt8*, UInt32, HRESULT)).call(wstreamnum, pszname, pwindex, type, wlangindex, pvalue, dwlength)
  end
  def delete_attribute(wstreamnum : UInt16, windex : UInt16) : HRESULT
    @lpVtbl.value.delete_attribute.unsafe_as(Proc(UInt16, UInt16, HRESULT)).call(wstreamnum, windex)
  end
  def add_codec_info(pwszname : LibC::LPWSTR, pwszdescription : LibC::LPWSTR, codectype : WMT_CODEC_INFO_TYPE, cbcodecinfo : UInt16, pbcodecinfo : UInt8*) : HRESULT
    @lpVtbl.value.add_codec_info.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, WMT_CODEC_INFO_TYPE, UInt16, UInt8*, HRESULT)).call(pwszname, pwszdescription, codectype, cbcodecinfo, pbcodecinfo)
  end
end
struct LibWin32::IWMProfileManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_empty_profile(dwversion : WMT_VERSION, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.create_empty_profile.unsafe_as(Proc(WMT_VERSION, IWMProfile*, HRESULT)).call(dwversion, ppprofile)
  end
  def load_profile_by_id(guidprofile : Guid*, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_id.unsafe_as(Proc(Guid*, IWMProfile*, HRESULT)).call(guidprofile, ppprofile)
  end
  def load_profile_by_data(pwszprofile : LibC::LPWSTR, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_data.unsafe_as(Proc(LibC::LPWSTR, IWMProfile*, HRESULT)).call(pwszprofile, ppprofile)
  end
  def save_profile(piwmprofile : IWMProfile, pwszprofile : LibC::LPWSTR, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.save_profile.unsafe_as(Proc(IWMProfile, LibC::LPWSTR, UInt32*, HRESULT)).call(piwmprofile, pwszprofile, pdwlength)
  end
  def get_system_profile_count(pcprofiles : UInt32*) : HRESULT
    @lpVtbl.value.get_system_profile_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcprofiles)
  end
  def load_system_profile(dwprofileindex : UInt32, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_system_profile.unsafe_as(Proc(UInt32, IWMProfile*, HRESULT)).call(dwprofileindex, ppprofile)
  end
end
struct LibWin32::IWMProfileManager2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_empty_profile(dwversion : WMT_VERSION, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.create_empty_profile.unsafe_as(Proc(WMT_VERSION, IWMProfile*, HRESULT)).call(dwversion, ppprofile)
  end
  def load_profile_by_id(guidprofile : Guid*, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_id.unsafe_as(Proc(Guid*, IWMProfile*, HRESULT)).call(guidprofile, ppprofile)
  end
  def load_profile_by_data(pwszprofile : LibC::LPWSTR, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_data.unsafe_as(Proc(LibC::LPWSTR, IWMProfile*, HRESULT)).call(pwszprofile, ppprofile)
  end
  def save_profile(piwmprofile : IWMProfile, pwszprofile : LibC::LPWSTR, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.save_profile.unsafe_as(Proc(IWMProfile, LibC::LPWSTR, UInt32*, HRESULT)).call(piwmprofile, pwszprofile, pdwlength)
  end
  def get_system_profile_count(pcprofiles : UInt32*) : HRESULT
    @lpVtbl.value.get_system_profile_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcprofiles)
  end
  def load_system_profile(dwprofileindex : UInt32, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_system_profile.unsafe_as(Proc(UInt32, IWMProfile*, HRESULT)).call(dwprofileindex, ppprofile)
  end
  def get_system_profile_version(pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_system_profile_version.unsafe_as(Proc(WMT_VERSION*, HRESULT)).call(pdwversion)
  end
  def set_system_profile_version(dwversion : WMT_VERSION) : HRESULT
    @lpVtbl.value.set_system_profile_version.unsafe_as(Proc(WMT_VERSION, HRESULT)).call(dwversion)
  end
end
struct LibWin32::IWMProfileManagerLanguage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_user_language_id(wlangid : UInt16*) : HRESULT
    @lpVtbl.value.get_user_language_id.unsafe_as(Proc(UInt16*, HRESULT)).call(wlangid)
  end
  def set_user_language_id(wlangid : UInt16) : HRESULT
    @lpVtbl.value.set_user_language_id.unsafe_as(Proc(UInt16, HRESULT)).call(wlangid)
  end
end
struct LibWin32::IWMProfile
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_version(pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(WMT_VERSION*, HRESULT)).call(pdwversion)
  end
  def get_name(pwszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszname, pcchname)
  end
  def set_name(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def get_description(pwszdescription : Char*, pcchdescription : UInt32*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszdescription, pcchdescription)
  end
  def set_description(pwszdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszdescription)
  end
  def get_stream_count(pcstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcstreams)
  end
  def get_stream(dwstreamindex : UInt32, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(UInt32, IWMStreamConfig*, HRESULT)).call(dwstreamindex, ppconfig)
  end
  def get_stream_by_number(wstreamnum : UInt16, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream_by_number.unsafe_as(Proc(UInt16, IWMStreamConfig*, HRESULT)).call(wstreamnum, ppconfig)
  end
  def remove_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def remove_stream_by_number(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_by_number.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def add_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def reconfig_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.reconfig_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def create_new_stream(guidstreamtype : Guid*, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.create_new_stream.unsafe_as(Proc(Guid*, IWMStreamConfig*, HRESULT)).call(guidstreamtype, ppconfig)
  end
  def get_mutual_exclusion_count(pcme : UInt32*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcme)
  end
  def get_mutual_exclusion(dwmeindex : UInt32, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion.unsafe_as(Proc(UInt32, IWMMutualExclusion*, HRESULT)).call(dwmeindex, ppme)
  end
  def remove_mutual_exclusion(pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.remove_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion, HRESULT)).call(pme)
  end
  def add_mutual_exclusion(pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.add_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion, HRESULT)).call(pme)
  end
  def create_new_mutual_exclusion(ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.create_new_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion*, HRESULT)).call(ppme)
  end
end
struct LibWin32::IWMProfile2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_version(pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(WMT_VERSION*, HRESULT)).call(pdwversion)
  end
  def get_name(pwszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszname, pcchname)
  end
  def set_name(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def get_description(pwszdescription : Char*, pcchdescription : UInt32*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszdescription, pcchdescription)
  end
  def set_description(pwszdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszdescription)
  end
  def get_stream_count(pcstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcstreams)
  end
  def get_stream(dwstreamindex : UInt32, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(UInt32, IWMStreamConfig*, HRESULT)).call(dwstreamindex, ppconfig)
  end
  def get_stream_by_number(wstreamnum : UInt16, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream_by_number.unsafe_as(Proc(UInt16, IWMStreamConfig*, HRESULT)).call(wstreamnum, ppconfig)
  end
  def remove_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def remove_stream_by_number(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_by_number.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def add_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def reconfig_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.reconfig_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def create_new_stream(guidstreamtype : Guid*, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.create_new_stream.unsafe_as(Proc(Guid*, IWMStreamConfig*, HRESULT)).call(guidstreamtype, ppconfig)
  end
  def get_mutual_exclusion_count(pcme : UInt32*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcme)
  end
  def get_mutual_exclusion(dwmeindex : UInt32, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion.unsafe_as(Proc(UInt32, IWMMutualExclusion*, HRESULT)).call(dwmeindex, ppme)
  end
  def remove_mutual_exclusion(pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.remove_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion, HRESULT)).call(pme)
  end
  def add_mutual_exclusion(pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.add_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion, HRESULT)).call(pme)
  end
  def create_new_mutual_exclusion(ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.create_new_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion*, HRESULT)).call(ppme)
  end
  def get_profile_id(pguidid : Guid*) : HRESULT
    @lpVtbl.value.get_profile_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidid)
  end
end
struct LibWin32::IWMProfile3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_version(pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(WMT_VERSION*, HRESULT)).call(pdwversion)
  end
  def get_name(pwszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszname, pcchname)
  end
  def set_name(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def get_description(pwszdescription : Char*, pcchdescription : UInt32*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszdescription, pcchdescription)
  end
  def set_description(pwszdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszdescription)
  end
  def get_stream_count(pcstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcstreams)
  end
  def get_stream(dwstreamindex : UInt32, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream.unsafe_as(Proc(UInt32, IWMStreamConfig*, HRESULT)).call(dwstreamindex, ppconfig)
  end
  def get_stream_by_number(wstreamnum : UInt16, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream_by_number.unsafe_as(Proc(UInt16, IWMStreamConfig*, HRESULT)).call(wstreamnum, ppconfig)
  end
  def remove_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def remove_stream_by_number(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_by_number.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def add_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def reconfig_stream(pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.reconfig_stream.unsafe_as(Proc(IWMStreamConfig, HRESULT)).call(pconfig)
  end
  def create_new_stream(guidstreamtype : Guid*, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.create_new_stream.unsafe_as(Proc(Guid*, IWMStreamConfig*, HRESULT)).call(guidstreamtype, ppconfig)
  end
  def get_mutual_exclusion_count(pcme : UInt32*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcme)
  end
  def get_mutual_exclusion(dwmeindex : UInt32, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion.unsafe_as(Proc(UInt32, IWMMutualExclusion*, HRESULT)).call(dwmeindex, ppme)
  end
  def remove_mutual_exclusion(pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.remove_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion, HRESULT)).call(pme)
  end
  def add_mutual_exclusion(pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.add_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion, HRESULT)).call(pme)
  end
  def create_new_mutual_exclusion(ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.create_new_mutual_exclusion.unsafe_as(Proc(IWMMutualExclusion*, HRESULT)).call(ppme)
  end
  def get_profile_id(pguidid : Guid*) : HRESULT
    @lpVtbl.value.get_profile_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguidid)
  end
  def get_storage_format(pnstorageformat : WMT_STORAGE_FORMAT*) : HRESULT
    @lpVtbl.value.get_storage_format.unsafe_as(Proc(WMT_STORAGE_FORMAT*, HRESULT)).call(pnstorageformat)
  end
  def set_storage_format(nstorageformat : WMT_STORAGE_FORMAT) : HRESULT
    @lpVtbl.value.set_storage_format.unsafe_as(Proc(WMT_STORAGE_FORMAT, HRESULT)).call(nstorageformat)
  end
  def get_bandwidth_sharing_count(pcbs : UInt32*) : HRESULT
    @lpVtbl.value.get_bandwidth_sharing_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcbs)
  end
  def get_bandwidth_sharing(dwbsindex : UInt32, ppbs : IWMBandwidthSharing*) : HRESULT
    @lpVtbl.value.get_bandwidth_sharing.unsafe_as(Proc(UInt32, IWMBandwidthSharing*, HRESULT)).call(dwbsindex, ppbs)
  end
  def remove_bandwidth_sharing(pbs : IWMBandwidthSharing) : HRESULT
    @lpVtbl.value.remove_bandwidth_sharing.unsafe_as(Proc(IWMBandwidthSharing, HRESULT)).call(pbs)
  end
  def add_bandwidth_sharing(pbs : IWMBandwidthSharing) : HRESULT
    @lpVtbl.value.add_bandwidth_sharing.unsafe_as(Proc(IWMBandwidthSharing, HRESULT)).call(pbs)
  end
  def create_new_bandwidth_sharing(ppbs : IWMBandwidthSharing*) : HRESULT
    @lpVtbl.value.create_new_bandwidth_sharing.unsafe_as(Proc(IWMBandwidthSharing*, HRESULT)).call(ppbs)
  end
  def get_stream_prioritization(ppsp : IWMStreamPrioritization*) : HRESULT
    @lpVtbl.value.get_stream_prioritization.unsafe_as(Proc(IWMStreamPrioritization*, HRESULT)).call(ppsp)
  end
  def set_stream_prioritization(psp : IWMStreamPrioritization) : HRESULT
    @lpVtbl.value.set_stream_prioritization.unsafe_as(Proc(IWMStreamPrioritization, HRESULT)).call(psp)
  end
  def remove_stream_prioritization : HRESULT
    @lpVtbl.value.remove_stream_prioritization.unsafe_as(Proc(HRESULT)).call
  end
  def create_new_stream_prioritization(ppsp : IWMStreamPrioritization*) : HRESULT
    @lpVtbl.value.create_new_stream_prioritization.unsafe_as(Proc(IWMStreamPrioritization*, HRESULT)).call(ppsp)
  end
  def get_expected_packet_count(msduration : UInt64, pcpackets : UInt64*) : HRESULT
    @lpVtbl.value.get_expected_packet_count.unsafe_as(Proc(UInt64, UInt64*, HRESULT)).call(msduration, pcpackets)
  end
end
struct LibWin32::IWMStreamConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_stream_type(pguidstreamtype : Guid*) : HRESULT
    @lpVtbl.value.get_stream_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidstreamtype)
  end
  def get_stream_number(pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number.unsafe_as(Proc(UInt16*, HRESULT)).call(pwstreamnum)
  end
  def set_stream_number(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.set_stream_number.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def get_stream_name(pwszstreamname : Char*, pcchstreamname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszstreamname, pcchstreamname)
  end
  def set_stream_name(pwszstreamname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stream_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszstreamname)
  end
  def get_connection_name(pwszinputname : Char*, pcchinputname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszinputname, pcchinputname)
  end
  def set_connection_name(pwszinputname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_connection_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszinputname)
  end
  def get_bitrate(pdwbitrate : UInt32*) : HRESULT
    @lpVtbl.value.get_bitrate.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwbitrate)
  end
  def set_bitrate(pdwbitrate : UInt32) : HRESULT
    @lpVtbl.value.set_bitrate.unsafe_as(Proc(UInt32, HRESULT)).call(pdwbitrate)
  end
  def get_buffer_window(pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_window.unsafe_as(Proc(UInt32*, HRESULT)).call(pmsbufferwindow)
  end
  def set_buffer_window(msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_window.unsafe_as(Proc(UInt32, HRESULT)).call(msbufferwindow)
  end
end
struct LibWin32::IWMStreamConfig2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_stream_type(pguidstreamtype : Guid*) : HRESULT
    @lpVtbl.value.get_stream_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidstreamtype)
  end
  def get_stream_number(pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number.unsafe_as(Proc(UInt16*, HRESULT)).call(pwstreamnum)
  end
  def set_stream_number(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.set_stream_number.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def get_stream_name(pwszstreamname : Char*, pcchstreamname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszstreamname, pcchstreamname)
  end
  def set_stream_name(pwszstreamname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stream_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszstreamname)
  end
  def get_connection_name(pwszinputname : Char*, pcchinputname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszinputname, pcchinputname)
  end
  def set_connection_name(pwszinputname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_connection_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszinputname)
  end
  def get_bitrate(pdwbitrate : UInt32*) : HRESULT
    @lpVtbl.value.get_bitrate.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwbitrate)
  end
  def set_bitrate(pdwbitrate : UInt32) : HRESULT
    @lpVtbl.value.set_bitrate.unsafe_as(Proc(UInt32, HRESULT)).call(pdwbitrate)
  end
  def get_buffer_window(pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_window.unsafe_as(Proc(UInt32*, HRESULT)).call(pmsbufferwindow)
  end
  def set_buffer_window(msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_window.unsafe_as(Proc(UInt32, HRESULT)).call(msbufferwindow)
  end
  def get_transport_type(pntransporttype : WMT_TRANSPORT_TYPE*) : HRESULT
    @lpVtbl.value.get_transport_type.unsafe_as(Proc(WMT_TRANSPORT_TYPE*, HRESULT)).call(pntransporttype)
  end
  def set_transport_type(ntransporttype : WMT_TRANSPORT_TYPE) : HRESULT
    @lpVtbl.value.set_transport_type.unsafe_as(Proc(WMT_TRANSPORT_TYPE, HRESULT)).call(ntransporttype)
  end
  def add_data_unit_extension(guidextensionsystemid : Guid, cbextensiondatasize : UInt16, pbextensionsysteminfo : UInt8*, cbextensionsysteminfo : UInt32) : HRESULT
    @lpVtbl.value.add_data_unit_extension.unsafe_as(Proc(Guid, UInt16, UInt8*, UInt32, HRESULT)).call(guidextensionsystemid, cbextensiondatasize, pbextensionsysteminfo, cbextensionsysteminfo)
  end
  def get_data_unit_extension_count(pcdataunitextensions : UInt16*) : HRESULT
    @lpVtbl.value.get_data_unit_extension_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcdataunitextensions)
  end
  def get_data_unit_extension(wdataunitextensionnumber : UInt16, pguidextensionsystemid : Guid*, pcbextensiondatasize : UInt16*, pbextensionsysteminfo : UInt8*, pcbextensionsysteminfo : UInt32*) : HRESULT
    @lpVtbl.value.get_data_unit_extension.unsafe_as(Proc(UInt16, Guid*, UInt16*, UInt8*, UInt32*, HRESULT)).call(wdataunitextensionnumber, pguidextensionsystemid, pcbextensiondatasize, pbextensionsysteminfo, pcbextensionsysteminfo)
  end
  def remove_all_data_unit_extensions : HRESULT
    @lpVtbl.value.remove_all_data_unit_extensions.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMStreamConfig3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_stream_type(pguidstreamtype : Guid*) : HRESULT
    @lpVtbl.value.get_stream_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidstreamtype)
  end
  def get_stream_number(pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number.unsafe_as(Proc(UInt16*, HRESULT)).call(pwstreamnum)
  end
  def set_stream_number(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.set_stream_number.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def get_stream_name(pwszstreamname : Char*, pcchstreamname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszstreamname, pcchstreamname)
  end
  def set_stream_name(pwszstreamname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stream_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszstreamname)
  end
  def get_connection_name(pwszinputname : Char*, pcchinputname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszinputname, pcchinputname)
  end
  def set_connection_name(pwszinputname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_connection_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszinputname)
  end
  def get_bitrate(pdwbitrate : UInt32*) : HRESULT
    @lpVtbl.value.get_bitrate.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwbitrate)
  end
  def set_bitrate(pdwbitrate : UInt32) : HRESULT
    @lpVtbl.value.set_bitrate.unsafe_as(Proc(UInt32, HRESULT)).call(pdwbitrate)
  end
  def get_buffer_window(pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_window.unsafe_as(Proc(UInt32*, HRESULT)).call(pmsbufferwindow)
  end
  def set_buffer_window(msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_window.unsafe_as(Proc(UInt32, HRESULT)).call(msbufferwindow)
  end
  def get_transport_type(pntransporttype : WMT_TRANSPORT_TYPE*) : HRESULT
    @lpVtbl.value.get_transport_type.unsafe_as(Proc(WMT_TRANSPORT_TYPE*, HRESULT)).call(pntransporttype)
  end
  def set_transport_type(ntransporttype : WMT_TRANSPORT_TYPE) : HRESULT
    @lpVtbl.value.set_transport_type.unsafe_as(Proc(WMT_TRANSPORT_TYPE, HRESULT)).call(ntransporttype)
  end
  def add_data_unit_extension(guidextensionsystemid : Guid, cbextensiondatasize : UInt16, pbextensionsysteminfo : UInt8*, cbextensionsysteminfo : UInt32) : HRESULT
    @lpVtbl.value.add_data_unit_extension.unsafe_as(Proc(Guid, UInt16, UInt8*, UInt32, HRESULT)).call(guidextensionsystemid, cbextensiondatasize, pbextensionsysteminfo, cbextensionsysteminfo)
  end
  def get_data_unit_extension_count(pcdataunitextensions : UInt16*) : HRESULT
    @lpVtbl.value.get_data_unit_extension_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcdataunitextensions)
  end
  def get_data_unit_extension(wdataunitextensionnumber : UInt16, pguidextensionsystemid : Guid*, pcbextensiondatasize : UInt16*, pbextensionsysteminfo : UInt8*, pcbextensionsysteminfo : UInt32*) : HRESULT
    @lpVtbl.value.get_data_unit_extension.unsafe_as(Proc(UInt16, Guid*, UInt16*, UInt8*, UInt32*, HRESULT)).call(wdataunitextensionnumber, pguidextensionsystemid, pcbextensiondatasize, pbextensionsysteminfo, pcbextensionsysteminfo)
  end
  def remove_all_data_unit_extensions : HRESULT
    @lpVtbl.value.remove_all_data_unit_extensions.unsafe_as(Proc(HRESULT)).call
  end
  def get_language(pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszlanguagestring, pcchlanguagestringlength)
  end
  def set_language(pwszlanguagestring : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszlanguagestring)
  end
end
struct LibWin32::IWMPacketSize
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_max_packet_size(pdwmaxpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_packet_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxpacketsize)
  end
  def set_max_packet_size(dwmaxpacketsize : UInt32) : HRESULT
    @lpVtbl.value.set_max_packet_size.unsafe_as(Proc(UInt32, HRESULT)).call(dwmaxpacketsize)
  end
end
struct LibWin32::IWMPacketSize2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_max_packet_size(pdwmaxpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_packet_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxpacketsize)
  end
  def set_max_packet_size(dwmaxpacketsize : UInt32) : HRESULT
    @lpVtbl.value.set_max_packet_size.unsafe_as(Proc(UInt32, HRESULT)).call(dwmaxpacketsize)
  end
  def get_min_packet_size(pdwminpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_min_packet_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwminpacketsize)
  end
  def set_min_packet_size(dwminpacketsize : UInt32) : HRESULT
    @lpVtbl.value.set_min_packet_size.unsafe_as(Proc(UInt32, HRESULT)).call(dwminpacketsize)
  end
end
struct LibWin32::IWMStreamList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_streams(pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.unsafe_as(Proc(UInt16*, UInt16*, HRESULT)).call(pwstreamnumarray, pcstreams)
  end
  def add_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def remove_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
end
struct LibWin32::IWMMutualExclusion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_streams(pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.unsafe_as(Proc(UInt16*, UInt16*, HRESULT)).call(pwstreamnumarray, pcstreams)
  end
  def add_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def remove_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def set_type(guidtype : Guid*) : HRESULT
    @lpVtbl.value.set_type.unsafe_as(Proc(Guid*, HRESULT)).call(guidtype)
  end
end
struct LibWin32::IWMMutualExclusion2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_streams(pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.unsafe_as(Proc(UInt16*, UInt16*, HRESULT)).call(pwstreamnumarray, pcstreams)
  end
  def add_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def remove_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def set_type(guidtype : Guid*) : HRESULT
    @lpVtbl.value.set_type.unsafe_as(Proc(Guid*, HRESULT)).call(guidtype)
  end
  def get_name(pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(Char*, UInt16*, HRESULT)).call(pwszname, pcchname)
  end
  def set_name(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def get_record_count(pwrecordcount : UInt16*) : HRESULT
    @lpVtbl.value.get_record_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pwrecordcount)
  end
  def add_record : HRESULT
    @lpVtbl.value.add_record.unsafe_as(Proc(HRESULT)).call
  end
  def remove_record(wrecordnumber : UInt16) : HRESULT
    @lpVtbl.value.remove_record.unsafe_as(Proc(UInt16, HRESULT)).call(wrecordnumber)
  end
  def get_record_name(wrecordnumber : UInt16, pwszrecordname : Char*, pcchrecordname : UInt16*) : HRESULT
    @lpVtbl.value.get_record_name.unsafe_as(Proc(UInt16, Char*, UInt16*, HRESULT)).call(wrecordnumber, pwszrecordname, pcchrecordname)
  end
  def set_record_name(wrecordnumber : UInt16, pwszrecordname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_record_name.unsafe_as(Proc(UInt16, LibC::LPWSTR, HRESULT)).call(wrecordnumber, pwszrecordname)
  end
  def get_streams_for_record(wrecordnumber : UInt16, pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams_for_record.unsafe_as(Proc(UInt16, UInt16*, UInt16*, HRESULT)).call(wrecordnumber, pwstreamnumarray, pcstreams)
  end
  def add_stream_for_record(wrecordnumber : UInt16, wstreamnumber : UInt16) : HRESULT
    @lpVtbl.value.add_stream_for_record.unsafe_as(Proc(UInt16, UInt16, HRESULT)).call(wrecordnumber, wstreamnumber)
  end
  def remove_stream_for_record(wrecordnumber : UInt16, wstreamnumber : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_for_record.unsafe_as(Proc(UInt16, UInt16, HRESULT)).call(wrecordnumber, wstreamnumber)
  end
end
struct LibWin32::IWMBandwidthSharing
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_streams(pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.unsafe_as(Proc(UInt16*, UInt16*, HRESULT)).call(pwstreamnumarray, pcstreams)
  end
  def add_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def remove_stream(wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.unsafe_as(Proc(UInt16, HRESULT)).call(wstreamnum)
  end
  def get_type(pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguidtype)
  end
  def set_type(guidtype : Guid*) : HRESULT
    @lpVtbl.value.set_type.unsafe_as(Proc(Guid*, HRESULT)).call(guidtype)
  end
  def get_bandwidth(pdwbitrate : UInt32*, pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_bandwidth.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pdwbitrate, pmsbufferwindow)
  end
  def set_bandwidth(dwbitrate : UInt32, msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_bandwidth.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwbitrate, msbufferwindow)
  end
end
struct LibWin32::IWMStreamPrioritization
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_priority_records(precordarray : WM_STREAM_PRIORITY_RECORD*, pcrecords : UInt16*) : HRESULT
    @lpVtbl.value.get_priority_records.unsafe_as(Proc(WM_STREAM_PRIORITY_RECORD*, UInt16*, HRESULT)).call(precordarray, pcrecords)
  end
  def set_priority_records(precordarray : WM_STREAM_PRIORITY_RECORD*, crecords : UInt16) : HRESULT
    @lpVtbl.value.set_priority_records.unsafe_as(Proc(WM_STREAM_PRIORITY_RECORD*, UInt16, HRESULT)).call(precordarray, crecords)
  end
end
struct LibWin32::IWMWriterAdvanced
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_sink_count(pcsinks : UInt32*) : HRESULT
    @lpVtbl.value.get_sink_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsinks)
  end
  def get_sink(dwsinknum : UInt32, ppsink : IWMWriterSink*) : HRESULT
    @lpVtbl.value.get_sink.unsafe_as(Proc(UInt32, IWMWriterSink*, HRESULT)).call(dwsinknum, ppsink)
  end
  def add_sink(psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.add_sink.unsafe_as(Proc(IWMWriterSink, HRESULT)).call(psink)
  end
  def remove_sink(psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.remove_sink.unsafe_as(Proc(IWMWriterSink, HRESULT)).call(psink)
  end
  def write_stream_sample(wstreamnum : UInt16, cnssampletime : UInt64, mssamplesendtime : UInt32, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_stream_sample.unsafe_as(Proc(UInt16, UInt64, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)).call(wstreamnum, cnssampletime, mssamplesendtime, cnssampleduration, dwflags, psample)
  end
  def set_live_source(fislivesource : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_live_source.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fislivesource)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def get_writer_time(pcnscurrenttime : UInt64*) : HRESULT
    @lpVtbl.value.get_writer_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnscurrenttime)
  end
  def get_statistics(wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(UInt16, WM_WRITER_STATISTICS*, HRESULT)).call(wstreamnum, pstats)
  end
  def set_sync_tolerance(mswindow : UInt32) : HRESULT
    @lpVtbl.value.set_sync_tolerance.unsafe_as(Proc(UInt32, HRESULT)).call(mswindow)
  end
  def get_sync_tolerance(pmswindow : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_tolerance.unsafe_as(Proc(UInt32*, HRESULT)).call(pmswindow)
  end
end
struct LibWin32::IWMWriterAdvanced2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_sink_count(pcsinks : UInt32*) : HRESULT
    @lpVtbl.value.get_sink_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsinks)
  end
  def get_sink(dwsinknum : UInt32, ppsink : IWMWriterSink*) : HRESULT
    @lpVtbl.value.get_sink.unsafe_as(Proc(UInt32, IWMWriterSink*, HRESULT)).call(dwsinknum, ppsink)
  end
  def add_sink(psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.add_sink.unsafe_as(Proc(IWMWriterSink, HRESULT)).call(psink)
  end
  def remove_sink(psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.remove_sink.unsafe_as(Proc(IWMWriterSink, HRESULT)).call(psink)
  end
  def write_stream_sample(wstreamnum : UInt16, cnssampletime : UInt64, mssamplesendtime : UInt32, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_stream_sample.unsafe_as(Proc(UInt16, UInt64, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)).call(wstreamnum, cnssampletime, mssamplesendtime, cnssampleduration, dwflags, psample)
  end
  def set_live_source(fislivesource : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_live_source.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fislivesource)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def get_writer_time(pcnscurrenttime : UInt64*) : HRESULT
    @lpVtbl.value.get_writer_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnscurrenttime)
  end
  def get_statistics(wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(UInt16, WM_WRITER_STATISTICS*, HRESULT)).call(wstreamnum, pstats)
  end
  def set_sync_tolerance(mswindow : UInt32) : HRESULT
    @lpVtbl.value.set_sync_tolerance.unsafe_as(Proc(UInt32, HRESULT)).call(mswindow)
  end
  def get_sync_tolerance(pmswindow : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_tolerance.unsafe_as(Proc(UInt32*, HRESULT)).call(pmswindow)
  end
  def get_input_setting(dwinputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_input_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwinputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_input_setting(dwinputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_input_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwinputnum, pszname, type, pvalue, cblength)
  end
end
struct LibWin32::IWMWriterAdvanced3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_sink_count(pcsinks : UInt32*) : HRESULT
    @lpVtbl.value.get_sink_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcsinks)
  end
  def get_sink(dwsinknum : UInt32, ppsink : IWMWriterSink*) : HRESULT
    @lpVtbl.value.get_sink.unsafe_as(Proc(UInt32, IWMWriterSink*, HRESULT)).call(dwsinknum, ppsink)
  end
  def add_sink(psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.add_sink.unsafe_as(Proc(IWMWriterSink, HRESULT)).call(psink)
  end
  def remove_sink(psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.remove_sink.unsafe_as(Proc(IWMWriterSink, HRESULT)).call(psink)
  end
  def write_stream_sample(wstreamnum : UInt16, cnssampletime : UInt64, mssamplesendtime : UInt32, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_stream_sample.unsafe_as(Proc(UInt16, UInt64, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)).call(wstreamnum, cnssampletime, mssamplesendtime, cnssampleduration, dwflags, psample)
  end
  def set_live_source(fislivesource : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_live_source.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fislivesource)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def get_writer_time(pcnscurrenttime : UInt64*) : HRESULT
    @lpVtbl.value.get_writer_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnscurrenttime)
  end
  def get_statistics(wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(UInt16, WM_WRITER_STATISTICS*, HRESULT)).call(wstreamnum, pstats)
  end
  def set_sync_tolerance(mswindow : UInt32) : HRESULT
    @lpVtbl.value.set_sync_tolerance.unsafe_as(Proc(UInt32, HRESULT)).call(mswindow)
  end
  def get_sync_tolerance(pmswindow : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_tolerance.unsafe_as(Proc(UInt32*, HRESULT)).call(pmswindow)
  end
  def get_input_setting(dwinputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_input_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwinputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_input_setting(dwinputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_input_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwinputnum, pszname, type, pvalue, cblength)
  end
  def get_statistics_ex(wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS_EX*) : HRESULT
    @lpVtbl.value.get_statistics_ex.unsafe_as(Proc(UInt16, WM_WRITER_STATISTICS_EX*, HRESULT)).call(wstreamnum, pstats)
  end
  def set_non_blocking : HRESULT
    @lpVtbl.value.set_non_blocking.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMWriterPreprocess
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_max_preprocessing_passes(dwinputnum : UInt32, dwflags : UInt32, pdwmaxnumpasses : UInt32*) : HRESULT
    @lpVtbl.value.get_max_preprocessing_passes.unsafe_as(Proc(UInt32, UInt32, UInt32*, HRESULT)).call(dwinputnum, dwflags, pdwmaxnumpasses)
  end
  def set_num_preprocessing_passes(dwinputnum : UInt32, dwflags : UInt32, dwnumpasses : UInt32) : HRESULT
    @lpVtbl.value.set_num_preprocessing_passes.unsafe_as(Proc(UInt32, UInt32, UInt32, HRESULT)).call(dwinputnum, dwflags, dwnumpasses)
  end
  def begin_preprocessing_pass(dwinputnum : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.begin_preprocessing_pass.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwinputnum, dwflags)
  end
  def preprocess_sample(dwinputnum : UInt32, cnssampletime : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.preprocess_sample.unsafe_as(Proc(UInt32, UInt64, UInt32, INSSBuffer, HRESULT)).call(dwinputnum, cnssampletime, dwflags, psample)
  end
  def end_preprocessing_pass(dwinputnum : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.end_preprocessing_pass.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(dwinputnum, dwflags)
  end
end
struct LibWin32::IWMWriterPostViewCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_status(status : WMT_STATUS, hr : HRESULT, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_status.unsafe_as(Proc(WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)).call(status, hr, dwtype, pvalue, pvcontext)
  end
  def on_post_view_sample(wstreamnumber : UInt16, cnssampletime : UInt64, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_post_view_sample.unsafe_as(Proc(UInt16, UInt64, UInt64, UInt32, INSSBuffer, Void*, HRESULT)).call(wstreamnumber, cnssampletime, cnssampleduration, dwflags, psample, pvcontext)
  end
  def allocate_for_post_view(wstreamnum : UInt16, cbbuffer : UInt32, ppbuffer : INSSBuffer*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_post_view.unsafe_as(Proc(UInt16, UInt32, INSSBuffer*, Void*, HRESULT)).call(wstreamnum, cbbuffer, ppbuffer, pvcontext)
  end
end
struct LibWin32::IWMWriterPostView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_post_view_callback(pcallback : IWMWriterPostViewCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.set_post_view_callback.unsafe_as(Proc(IWMWriterPostViewCallback, Void*, HRESULT)).call(pcallback, pvcontext)
  end
  def set_receive_post_view_samples(wstreamnum : UInt16, freceivepostviewsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_post_view_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivepostviewsamples)
  end
  def get_receive_post_view_samples(wstreamnum : UInt16, pfreceivepostviewsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_post_view_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivepostviewsamples)
  end
  def get_post_view_props(wstreamnumber : UInt16, ppoutput : IWMMediaProps*) : HRESULT
    @lpVtbl.value.get_post_view_props.unsafe_as(Proc(UInt16, IWMMediaProps*, HRESULT)).call(wstreamnumber, ppoutput)
  end
  def set_post_view_props(wstreamnumber : UInt16, poutput : IWMMediaProps) : HRESULT
    @lpVtbl.value.set_post_view_props.unsafe_as(Proc(UInt16, IWMMediaProps, HRESULT)).call(wstreamnumber, poutput)
  end
  def get_post_view_format_count(wstreamnumber : UInt16, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_post_view_format_count.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstreamnumber, pcformats)
  end
  def get_post_view_format(wstreamnumber : UInt16, dwformatnumber : UInt32, ppprops : IWMMediaProps*) : HRESULT
    @lpVtbl.value.get_post_view_format.unsafe_as(Proc(UInt16, UInt32, IWMMediaProps*, HRESULT)).call(wstreamnumber, dwformatnumber, ppprops)
  end
  def set_allocate_for_post_view(wstreamnumber : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_post_view.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnumber, fallocate)
  end
  def get_allocate_for_post_view(wstreamnumber : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_post_view.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnumber, pfallocate)
  end
end
struct LibWin32::IWMWriterSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_header(pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pheader)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def allocate_data_unit(cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(cbdataunit, ppdataunit)
  end
  def on_data_unit(pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pdataunit)
  end
  def on_end_writing : HRESULT
    @lpVtbl.value.on_end_writing.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMRegisterCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise(pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.advise.unsafe_as(Proc(IWMStatusCallback, Void*, HRESULT)).call(pcallback, pvcontext)
  end
  def unadvise(pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.unadvise.unsafe_as(Proc(IWMStatusCallback, Void*, HRESULT)).call(pcallback, pvcontext)
  end
end
struct LibWin32::IWMWriterFileSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_header(pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pheader)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def allocate_data_unit(cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(cbdataunit, ppdataunit)
  end
  def on_data_unit(pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pdataunit)
  end
  def on_end_writing : HRESULT
    @lpVtbl.value.on_end_writing.unsafe_as(Proc(HRESULT)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
end
struct LibWin32::IWMWriterFileSink2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_header(pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pheader)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def allocate_data_unit(cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(cbdataunit, ppdataunit)
  end
  def on_data_unit(pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pdataunit)
  end
  def on_end_writing : HRESULT
    @lpVtbl.value.on_end_writing.unsafe_as(Proc(HRESULT)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def start(cnsstarttime : UInt64) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt64, HRESULT)).call(cnsstarttime)
  end
  def stop(cnsstoptime : UInt64) : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(UInt64, HRESULT)).call(cnsstoptime)
  end
  def is_stopped(pfstopped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_stopped.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfstopped)
  end
  def get_file_duration(pcnsduration : UInt64*) : HRESULT
    @lpVtbl.value.get_file_duration.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsduration)
  end
  def get_file_size(pcbfile : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(UInt64*, HRESULT)).call(pcbfile)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def is_closed(pfclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_closed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfclosed)
  end
end
struct LibWin32::IWMWriterFileSink3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_header(pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pheader)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def allocate_data_unit(cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(cbdataunit, ppdataunit)
  end
  def on_data_unit(pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pdataunit)
  end
  def on_end_writing : HRESULT
    @lpVtbl.value.on_end_writing.unsafe_as(Proc(HRESULT)).call
  end
  def open(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def start(cnsstarttime : UInt64) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(UInt64, HRESULT)).call(cnsstarttime)
  end
  def stop(cnsstoptime : UInt64) : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(UInt64, HRESULT)).call(cnsstoptime)
  end
  def is_stopped(pfstopped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_stopped.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfstopped)
  end
  def get_file_duration(pcnsduration : UInt64*) : HRESULT
    @lpVtbl.value.get_file_duration.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsduration)
  end
  def get_file_size(pcbfile : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(UInt64*, HRESULT)).call(pcbfile)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def is_closed(pfclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_closed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfclosed)
  end
  def set_auto_indexing(fdoautoindexing : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_auto_indexing.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fdoautoindexing)
  end
  def get_auto_indexing(pfautoindexing : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_indexing.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfautoindexing)
  end
  def set_control_stream(wstreamnumber : UInt16, fshouldcontrolstartandstop : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_control_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnumber, fshouldcontrolstartandstop)
  end
  def get_mode(pdwfilesinkmode : UInt32*) : HRESULT
    @lpVtbl.value.get_mode.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwfilesinkmode)
  end
  def on_data_unit_ex(pfilesinkdataunit : WMT_FILESINK_DATA_UNIT*) : HRESULT
    @lpVtbl.value.on_data_unit_ex.unsafe_as(Proc(WMT_FILESINK_DATA_UNIT*, HRESULT)).call(pfilesinkdataunit)
  end
  def set_unbuffered_io(funbufferedio : LibC::BOOL, frestrictmemusage : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_unbuffered_io.unsafe_as(Proc(LibC::BOOL, LibC::BOOL, HRESULT)).call(funbufferedio, frestrictmemusage)
  end
  def get_unbuffered_io(pfunbufferedio : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_unbuffered_io.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfunbufferedio)
  end
  def complete_operations : HRESULT
    @lpVtbl.value.complete_operations.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMWriterNetworkSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_header(pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pheader)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def allocate_data_unit(cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(cbdataunit, ppdataunit)
  end
  def on_data_unit(pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pdataunit)
  end
  def on_end_writing : HRESULT
    @lpVtbl.value.on_end_writing.unsafe_as(Proc(HRESULT)).call
  end
  def set_maximum_clients(dwmaxclients : UInt32) : HRESULT
    @lpVtbl.value.set_maximum_clients.unsafe_as(Proc(UInt32, HRESULT)).call(dwmaxclients)
  end
  def get_maximum_clients(pdwmaxclients : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_clients.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxclients)
  end
  def set_network_protocol(protocol : WMT_NET_PROTOCOL) : HRESULT
    @lpVtbl.value.set_network_protocol.unsafe_as(Proc(WMT_NET_PROTOCOL, HRESULT)).call(protocol)
  end
  def get_network_protocol(pprotocol : WMT_NET_PROTOCOL*) : HRESULT
    @lpVtbl.value.get_network_protocol.unsafe_as(Proc(WMT_NET_PROTOCOL*, HRESULT)).call(pprotocol)
  end
  def get_host_url(pwszurl : LibC::LPWSTR, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_host_url.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pwszurl, pcchurl)
  end
  def open(pdwportnum : UInt32*) : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwportnum)
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMClientConnections
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client_count(pcclients : UInt32*) : HRESULT
    @lpVtbl.value.get_client_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcclients)
  end
  def get_client_properties(dwclientnum : UInt32, pclientproperties : WM_CLIENT_PROPERTIES*) : HRESULT
    @lpVtbl.value.get_client_properties.unsafe_as(Proc(UInt32, WM_CLIENT_PROPERTIES*, HRESULT)).call(dwclientnum, pclientproperties)
  end
end
struct LibWin32::IWMClientConnections2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client_count(pcclients : UInt32*) : HRESULT
    @lpVtbl.value.get_client_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcclients)
  end
  def get_client_properties(dwclientnum : UInt32, pclientproperties : WM_CLIENT_PROPERTIES*) : HRESULT
    @lpVtbl.value.get_client_properties.unsafe_as(Proc(UInt32, WM_CLIENT_PROPERTIES*, HRESULT)).call(dwclientnum, pclientproperties)
  end
  def get_client_info(dwclientnum : UInt32, pwsznetworkaddress : Char*, pcchnetworkaddress : UInt32*, pwszport : Char*, pcchport : UInt32*, pwszdnsname : Char*, pcchdnsname : UInt32*) : HRESULT
    @lpVtbl.value.get_client_info.unsafe_as(Proc(UInt32, Char*, UInt32*, Char*, UInt32*, Char*, UInt32*, HRESULT)).call(dwclientnum, pwsznetworkaddress, pcchnetworkaddress, pwszport, pcchport, pwszdnsname, pcchdnsname)
  end
end
struct LibWin32::IWMReaderAdvanced
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_user_provided_clock(fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fuserclock)
  end
  def get_user_provided_clock(pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfuserclock)
  end
  def deliver_time(cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnstime)
  end
  def set_manual_stream_selection(fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fselection)
  end
  def get_manual_stream_selection(pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfselection)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fgetcallbacks)
  end
  def get_receive_selection_callbacks(pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfgetcallbacks)
  end
  def set_receive_stream_samples(wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(dwoutputnum, fallocate)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fallocate)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(dwsreamnum, pfallocate)
  end
  def get_statistics(pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(WM_READER_STATISTICS*, HRESULT)).call(pstatistics)
  end
  def set_client_info(pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.unsafe_as(Proc(WM_READER_CLIENTINFO*, HRESULT)).call(pclientinfo)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def notify_late_delivery(cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.unsafe_as(Proc(UInt64, HRESULT)).call(cnslateness)
  end
end
struct LibWin32::IWMReaderAdvanced2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_user_provided_clock(fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fuserclock)
  end
  def get_user_provided_clock(pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfuserclock)
  end
  def deliver_time(cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnstime)
  end
  def set_manual_stream_selection(fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fselection)
  end
  def get_manual_stream_selection(pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfselection)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fgetcallbacks)
  end
  def get_receive_selection_callbacks(pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfgetcallbacks)
  end
  def set_receive_stream_samples(wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(dwoutputnum, fallocate)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fallocate)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(dwsreamnum, pfallocate)
  end
  def get_statistics(pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(WM_READER_STATISTICS*, HRESULT)).call(pstatistics)
  end
  def set_client_info(pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.unsafe_as(Proc(WM_READER_CLIENTINFO*, HRESULT)).call(pclientinfo)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def notify_late_delivery(cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.unsafe_as(Proc(UInt64, HRESULT)).call(cnslateness)
  end
  def set_play_mode(mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.unsafe_as(Proc(WMT_PLAY_MODE, HRESULT)).call(mode)
  end
  def get_play_mode(pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.unsafe_as(Proc(WMT_PLAY_MODE*, HRESULT)).call(pmode)
  end
  def get_buffer_progress(pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.unsafe_as(Proc(UInt32*, UInt64*, HRESULT)).call(pdwpercent, pcnsbuffering)
  end
  def get_download_progress(pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.unsafe_as(Proc(UInt32*, UInt64*, UInt64*, HRESULT)).call(pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpercent)
  end
  def save_file_as(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def get_protocol_name(pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszprotocol, pcchprotocol)
  end
  def start_at_marker(wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.unsafe_as(Proc(UInt16, UInt64, Float32, Void*, HRESULT)).call(wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.unsafe_as(Proc(UInt64, UInt64, Float32, HRESULT)).call(cnsstart, cnsduration, frate)
  end
  def set_log_client_id(flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(flogclientid)
  end
  def get_log_client_id(pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflogclientid)
  end
  def stop_buffering : HRESULT
    @lpVtbl.value.stop_buffering.unsafe_as(Proc(HRESULT)).call
  end
  def open_stream(pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, IWMReaderCallback, Void*, HRESULT)).call(pstream, pcallback, pvcontext)
  end
end
struct LibWin32::IWMReaderAdvanced3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_user_provided_clock(fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fuserclock)
  end
  def get_user_provided_clock(pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfuserclock)
  end
  def deliver_time(cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnstime)
  end
  def set_manual_stream_selection(fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fselection)
  end
  def get_manual_stream_selection(pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfselection)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fgetcallbacks)
  end
  def get_receive_selection_callbacks(pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfgetcallbacks)
  end
  def set_receive_stream_samples(wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(dwoutputnum, fallocate)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fallocate)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(dwsreamnum, pfallocate)
  end
  def get_statistics(pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(WM_READER_STATISTICS*, HRESULT)).call(pstatistics)
  end
  def set_client_info(pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.unsafe_as(Proc(WM_READER_CLIENTINFO*, HRESULT)).call(pclientinfo)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def notify_late_delivery(cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.unsafe_as(Proc(UInt64, HRESULT)).call(cnslateness)
  end
  def set_play_mode(mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.unsafe_as(Proc(WMT_PLAY_MODE, HRESULT)).call(mode)
  end
  def get_play_mode(pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.unsafe_as(Proc(WMT_PLAY_MODE*, HRESULT)).call(pmode)
  end
  def get_buffer_progress(pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.unsafe_as(Proc(UInt32*, UInt64*, HRESULT)).call(pdwpercent, pcnsbuffering)
  end
  def get_download_progress(pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.unsafe_as(Proc(UInt32*, UInt64*, UInt64*, HRESULT)).call(pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpercent)
  end
  def save_file_as(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def get_protocol_name(pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszprotocol, pcchprotocol)
  end
  def start_at_marker(wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.unsafe_as(Proc(UInt16, UInt64, Float32, Void*, HRESULT)).call(wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.unsafe_as(Proc(UInt64, UInt64, Float32, HRESULT)).call(cnsstart, cnsduration, frate)
  end
  def set_log_client_id(flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(flogclientid)
  end
  def get_log_client_id(pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflogclientid)
  end
  def stop_buffering : HRESULT
    @lpVtbl.value.stop_buffering.unsafe_as(Proc(HRESULT)).call
  end
  def open_stream(pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, IWMReaderCallback, Void*, HRESULT)).call(pstream, pcallback, pvcontext)
  end
  def stop_net_streaming : HRESULT
    @lpVtbl.value.stop_net_streaming.unsafe_as(Proc(HRESULT)).call
  end
  def start_at_position(wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.unsafe_as(Proc(UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)).call(wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
end
struct LibWin32::IWMReaderAdvanced4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_user_provided_clock(fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fuserclock)
  end
  def get_user_provided_clock(pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfuserclock)
  end
  def deliver_time(cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnstime)
  end
  def set_manual_stream_selection(fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fselection)
  end
  def get_manual_stream_selection(pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfselection)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fgetcallbacks)
  end
  def get_receive_selection_callbacks(pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfgetcallbacks)
  end
  def set_receive_stream_samples(wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(dwoutputnum, fallocate)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fallocate)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(dwsreamnum, pfallocate)
  end
  def get_statistics(pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(WM_READER_STATISTICS*, HRESULT)).call(pstatistics)
  end
  def set_client_info(pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.unsafe_as(Proc(WM_READER_CLIENTINFO*, HRESULT)).call(pclientinfo)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def notify_late_delivery(cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.unsafe_as(Proc(UInt64, HRESULT)).call(cnslateness)
  end
  def set_play_mode(mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.unsafe_as(Proc(WMT_PLAY_MODE, HRESULT)).call(mode)
  end
  def get_play_mode(pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.unsafe_as(Proc(WMT_PLAY_MODE*, HRESULT)).call(pmode)
  end
  def get_buffer_progress(pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.unsafe_as(Proc(UInt32*, UInt64*, HRESULT)).call(pdwpercent, pcnsbuffering)
  end
  def get_download_progress(pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.unsafe_as(Proc(UInt32*, UInt64*, UInt64*, HRESULT)).call(pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpercent)
  end
  def save_file_as(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def get_protocol_name(pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszprotocol, pcchprotocol)
  end
  def start_at_marker(wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.unsafe_as(Proc(UInt16, UInt64, Float32, Void*, HRESULT)).call(wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.unsafe_as(Proc(UInt64, UInt64, Float32, HRESULT)).call(cnsstart, cnsduration, frate)
  end
  def set_log_client_id(flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(flogclientid)
  end
  def get_log_client_id(pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflogclientid)
  end
  def stop_buffering : HRESULT
    @lpVtbl.value.stop_buffering.unsafe_as(Proc(HRESULT)).call
  end
  def open_stream(pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, IWMReaderCallback, Void*, HRESULT)).call(pstream, pcallback, pvcontext)
  end
  def stop_net_streaming : HRESULT
    @lpVtbl.value.stop_net_streaming.unsafe_as(Proc(HRESULT)).call
  end
  def start_at_position(wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.unsafe_as(Proc(UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)).call(wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
  def get_language_count(dwoutputnum : UInt32, pwlanguagecount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.unsafe_as(Proc(UInt32, UInt16*, HRESULT)).call(dwoutputnum, pwlanguagecount)
  end
  def get_language(dwoutputnum : UInt32, wlanguage : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(UInt32, UInt16, Char*, UInt16*, HRESULT)).call(dwoutputnum, wlanguage, pwszlanguagestring, pcchlanguagestringlength)
  end
  def get_max_speed_factor(pdblfactor : Float64*) : HRESULT
    @lpVtbl.value.get_max_speed_factor.unsafe_as(Proc(Float64*, HRESULT)).call(pdblfactor)
  end
  def is_using_fast_cache(pfusingfastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_fast_cache.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfusingfastcache)
  end
  def add_log_param(wsznamespace : LibC::LPWSTR, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_log_param.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wsznamespace, wszname, wszvalue)
  end
  def send_log_params : HRESULT
    @lpVtbl.value.send_log_params.unsafe_as(Proc(HRESULT)).call
  end
  def can_save_file_as(pfcansave : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_save_file_as.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcansave)
  end
  def cancel_save_file_as : HRESULT
    @lpVtbl.value.cancel_save_file_as.unsafe_as(Proc(HRESULT)).call
  end
  def get_url(pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_url.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszurl, pcchurl)
  end
end
struct LibWin32::IWMReaderAdvanced5
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_user_provided_clock(fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fuserclock)
  end
  def get_user_provided_clock(pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfuserclock)
  end
  def deliver_time(cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnstime)
  end
  def set_manual_stream_selection(fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fselection)
  end
  def get_manual_stream_selection(pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfselection)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fgetcallbacks)
  end
  def get_receive_selection_callbacks(pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfgetcallbacks)
  end
  def set_receive_stream_samples(wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(dwoutputnum, fallocate)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fallocate)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(dwsreamnum, pfallocate)
  end
  def get_statistics(pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(WM_READER_STATISTICS*, HRESULT)).call(pstatistics)
  end
  def set_client_info(pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.unsafe_as(Proc(WM_READER_CLIENTINFO*, HRESULT)).call(pclientinfo)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def notify_late_delivery(cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.unsafe_as(Proc(UInt64, HRESULT)).call(cnslateness)
  end
  def set_play_mode(mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.unsafe_as(Proc(WMT_PLAY_MODE, HRESULT)).call(mode)
  end
  def get_play_mode(pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.unsafe_as(Proc(WMT_PLAY_MODE*, HRESULT)).call(pmode)
  end
  def get_buffer_progress(pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.unsafe_as(Proc(UInt32*, UInt64*, HRESULT)).call(pdwpercent, pcnsbuffering)
  end
  def get_download_progress(pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.unsafe_as(Proc(UInt32*, UInt64*, UInt64*, HRESULT)).call(pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpercent)
  end
  def save_file_as(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def get_protocol_name(pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszprotocol, pcchprotocol)
  end
  def start_at_marker(wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.unsafe_as(Proc(UInt16, UInt64, Float32, Void*, HRESULT)).call(wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.unsafe_as(Proc(UInt64, UInt64, Float32, HRESULT)).call(cnsstart, cnsduration, frate)
  end
  def set_log_client_id(flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(flogclientid)
  end
  def get_log_client_id(pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflogclientid)
  end
  def stop_buffering : HRESULT
    @lpVtbl.value.stop_buffering.unsafe_as(Proc(HRESULT)).call
  end
  def open_stream(pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, IWMReaderCallback, Void*, HRESULT)).call(pstream, pcallback, pvcontext)
  end
  def stop_net_streaming : HRESULT
    @lpVtbl.value.stop_net_streaming.unsafe_as(Proc(HRESULT)).call
  end
  def start_at_position(wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.unsafe_as(Proc(UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)).call(wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
  def get_language_count(dwoutputnum : UInt32, pwlanguagecount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.unsafe_as(Proc(UInt32, UInt16*, HRESULT)).call(dwoutputnum, pwlanguagecount)
  end
  def get_language(dwoutputnum : UInt32, wlanguage : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(UInt32, UInt16, Char*, UInt16*, HRESULT)).call(dwoutputnum, wlanguage, pwszlanguagestring, pcchlanguagestringlength)
  end
  def get_max_speed_factor(pdblfactor : Float64*) : HRESULT
    @lpVtbl.value.get_max_speed_factor.unsafe_as(Proc(Float64*, HRESULT)).call(pdblfactor)
  end
  def is_using_fast_cache(pfusingfastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_fast_cache.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfusingfastcache)
  end
  def add_log_param(wsznamespace : LibC::LPWSTR, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_log_param.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wsznamespace, wszname, wszvalue)
  end
  def send_log_params : HRESULT
    @lpVtbl.value.send_log_params.unsafe_as(Proc(HRESULT)).call
  end
  def can_save_file_as(pfcansave : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_save_file_as.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcansave)
  end
  def cancel_save_file_as : HRESULT
    @lpVtbl.value.cancel_save_file_as.unsafe_as(Proc(HRESULT)).call
  end
  def get_url(pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_url.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszurl, pcchurl)
  end
  def set_player_hook(dwoutputnum : UInt32, phook : IWMPlayerHook) : HRESULT
    @lpVtbl.value.set_player_hook.unsafe_as(Proc(UInt32, IWMPlayerHook, HRESULT)).call(dwoutputnum, phook)
  end
end
struct LibWin32::IWMReaderAdvanced6
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_user_provided_clock(fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fuserclock)
  end
  def get_user_provided_clock(pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfuserclock)
  end
  def deliver_time(cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnstime)
  end
  def set_manual_stream_selection(fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fselection)
  end
  def get_manual_stream_selection(pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfselection)
  end
  def set_streams_selected(cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)).call(cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.unsafe_as(Proc(UInt16, WMT_STREAM_SELECTION*, HRESULT)).call(wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fgetcallbacks)
  end
  def get_receive_selection_callbacks(pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfgetcallbacks)
  end
  def set_receive_stream_samples(wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL, HRESULT)).call(dwoutputnum, fallocate)
  end
  def get_allocate_for_output(dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL, HRESULT)).call(wstreamnum, fallocate)
  end
  def get_allocate_for_stream(dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(dwsreamnum, pfallocate)
  end
  def get_statistics(pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(WM_READER_STATISTICS*, HRESULT)).call(pstatistics)
  end
  def set_client_info(pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.unsafe_as(Proc(WM_READER_CLIENTINFO*, HRESULT)).call(pclientinfo)
  end
  def get_max_output_sample_size(dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.unsafe_as(Proc(UInt16, UInt32*, HRESULT)).call(wstream, pcbmax)
  end
  def notify_late_delivery(cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.unsafe_as(Proc(UInt64, HRESULT)).call(cnslateness)
  end
  def set_play_mode(mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.unsafe_as(Proc(WMT_PLAY_MODE, HRESULT)).call(mode)
  end
  def get_play_mode(pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.unsafe_as(Proc(WMT_PLAY_MODE*, HRESULT)).call(pmode)
  end
  def get_buffer_progress(pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.unsafe_as(Proc(UInt32*, UInt64*, HRESULT)).call(pdwpercent, pcnsbuffering)
  end
  def get_download_progress(pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.unsafe_as(Proc(UInt32*, UInt64*, UInt64*, HRESULT)).call(pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpercent)
  end
  def save_file_as(pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszfilename)
  end
  def get_protocol_name(pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszprotocol, pcchprotocol)
  end
  def start_at_marker(wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.unsafe_as(Proc(UInt16, UInt64, Float32, Void*, HRESULT)).call(wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.unsafe_as(Proc(UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.unsafe_as(Proc(UInt64, UInt64, Float32, HRESULT)).call(cnsstart, cnsduration, frate)
  end
  def set_log_client_id(flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(flogclientid)
  end
  def get_log_client_id(pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflogclientid)
  end
  def stop_buffering : HRESULT
    @lpVtbl.value.stop_buffering.unsafe_as(Proc(HRESULT)).call
  end
  def open_stream(pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.unsafe_as(Proc(IStream, IWMReaderCallback, Void*, HRESULT)).call(pstream, pcallback, pvcontext)
  end
  def stop_net_streaming : HRESULT
    @lpVtbl.value.stop_net_streaming.unsafe_as(Proc(HRESULT)).call
  end
  def start_at_position(wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.unsafe_as(Proc(UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)).call(wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
  def get_language_count(dwoutputnum : UInt32, pwlanguagecount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.unsafe_as(Proc(UInt32, UInt16*, HRESULT)).call(dwoutputnum, pwlanguagecount)
  end
  def get_language(dwoutputnum : UInt32, wlanguage : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.unsafe_as(Proc(UInt32, UInt16, Char*, UInt16*, HRESULT)).call(dwoutputnum, wlanguage, pwszlanguagestring, pcchlanguagestringlength)
  end
  def get_max_speed_factor(pdblfactor : Float64*) : HRESULT
    @lpVtbl.value.get_max_speed_factor.unsafe_as(Proc(Float64*, HRESULT)).call(pdblfactor)
  end
  def is_using_fast_cache(pfusingfastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_fast_cache.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfusingfastcache)
  end
  def add_log_param(wsznamespace : LibC::LPWSTR, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_log_param.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wsznamespace, wszname, wszvalue)
  end
  def send_log_params : HRESULT
    @lpVtbl.value.send_log_params.unsafe_as(Proc(HRESULT)).call
  end
  def can_save_file_as(pfcansave : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_save_file_as.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcansave)
  end
  def cancel_save_file_as : HRESULT
    @lpVtbl.value.cancel_save_file_as.unsafe_as(Proc(HRESULT)).call
  end
  def get_url(pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_url.unsafe_as(Proc(Char*, UInt32*, HRESULT)).call(pwszurl, pcchurl)
  end
  def set_player_hook(dwoutputnum : UInt32, phook : IWMPlayerHook) : HRESULT
    @lpVtbl.value.set_player_hook.unsafe_as(Proc(UInt32, IWMPlayerHook, HRESULT)).call(dwoutputnum, phook)
  end
  def set_protect_stream_samples(pbcertificate : UInt8*, cbcertificate : UInt32, dwcertificatetype : UInt32, dwflags : UInt32, pbinitializationvector : UInt8*, pcbinitializationvector : UInt32*) : HRESULT
    @lpVtbl.value.set_protect_stream_samples.unsafe_as(Proc(UInt8*, UInt32, UInt32, UInt32, UInt8*, UInt32*, HRESULT)).call(pbcertificate, cbcertificate, dwcertificatetype, dwflags, pbinitializationvector, pcbinitializationvector)
  end
end
struct LibWin32::IWMPlayerHook
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def pre_decode : HRESULT
    @lpVtbl.value.pre_decode.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMReaderAllocatorEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def allocate_for_stream_ex(wstreamnum : UInt16, cbbuffer : UInt32, ppbuffer : INSSBuffer*, dwflags : UInt32, cnssampletime : UInt64, cnssampleduration : UInt64, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_stream_ex.unsafe_as(Proc(UInt16, UInt32, INSSBuffer*, UInt32, UInt64, UInt64, Void*, HRESULT)).call(wstreamnum, cbbuffer, ppbuffer, dwflags, cnssampletime, cnssampleduration, pvcontext)
  end
  def allocate_for_output_ex(dwoutputnum : UInt32, cbbuffer : UInt32, ppbuffer : INSSBuffer*, dwflags : UInt32, cnssampletime : UInt64, cnssampleduration : UInt64, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_output_ex.unsafe_as(Proc(UInt32, UInt32, INSSBuffer*, UInt32, UInt64, UInt64, Void*, HRESULT)).call(dwoutputnum, cbbuffer, ppbuffer, dwflags, cnssampletime, cnssampleduration, pvcontext)
  end
end
struct LibWin32::IWMReaderTypeNegotiation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def try_output_props(dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.try_output_props.unsafe_as(Proc(UInt32, IWMOutputMediaProps, HRESULT)).call(dwoutputnum, poutput)
  end
end
struct LibWin32::IWMReaderCallbackAdvanced
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_stream_sample(wstreamnum : UInt16, cnssampletime : UInt64, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_stream_sample.unsafe_as(Proc(UInt16, UInt64, UInt64, UInt32, INSSBuffer, Void*, HRESULT)).call(wstreamnum, cnssampletime, cnssampleduration, dwflags, psample, pvcontext)
  end
  def on_time(cnscurrenttime : UInt64, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_time.unsafe_as(Proc(UInt64, Void*, HRESULT)).call(cnscurrenttime, pvcontext)
  end
  def on_stream_selection(wstreamcount : UInt16, pstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_stream_selection.unsafe_as(Proc(UInt16, UInt16*, WMT_STREAM_SELECTION*, Void*, HRESULT)).call(wstreamcount, pstreamnumbers, pselections, pvcontext)
  end
  def on_output_props_changed(dwoutputnum : UInt32, pmediatype : WM_MEDIA_TYPE*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_output_props_changed.unsafe_as(Proc(UInt32, WM_MEDIA_TYPE*, Void*, HRESULT)).call(dwoutputnum, pmediatype, pvcontext)
  end
  def allocate_for_stream(wstreamnum : UInt16, cbbuffer : UInt32, ppbuffer : INSSBuffer*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_stream.unsafe_as(Proc(UInt16, UInt32, INSSBuffer*, Void*, HRESULT)).call(wstreamnum, cbbuffer, ppbuffer, pvcontext)
  end
  def allocate_for_output(dwoutputnum : UInt32, cbbuffer : UInt32, ppbuffer : INSSBuffer*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_output.unsafe_as(Proc(UInt32, UInt32, INSSBuffer*, Void*, HRESULT)).call(dwoutputnum, cbbuffer, ppbuffer, pvcontext)
  end
end
struct LibWin32::IWMDRMReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def acquire_license(dwflags : UInt32) : HRESULT
    @lpVtbl.value.acquire_license.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def cancel_license_acquisition : HRESULT
    @lpVtbl.value.cancel_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def individualize(dwflags : UInt32) : HRESULT
    @lpVtbl.value.individualize.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def cancel_individualization : HRESULT
    @lpVtbl.value.cancel_individualization.unsafe_as(Proc(HRESULT)).call
  end
  def monitor_license_acquisition : HRESULT
    @lpVtbl.value.monitor_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def cancel_monitor_license_acquisition : HRESULT
    @lpVtbl.value.cancel_monitor_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def set_drm_property(pwstrname : LibC::LPWSTR, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(pwstrname, dwtype, pvalue, cblength)
  end
  def get_drm_property(pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstrname, pdwtype, pvalue, pcblength)
  end
end
struct LibWin32::IWMDRMReader2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def acquire_license(dwflags : UInt32) : HRESULT
    @lpVtbl.value.acquire_license.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def cancel_license_acquisition : HRESULT
    @lpVtbl.value.cancel_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def individualize(dwflags : UInt32) : HRESULT
    @lpVtbl.value.individualize.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def cancel_individualization : HRESULT
    @lpVtbl.value.cancel_individualization.unsafe_as(Proc(HRESULT)).call
  end
  def monitor_license_acquisition : HRESULT
    @lpVtbl.value.monitor_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def cancel_monitor_license_acquisition : HRESULT
    @lpVtbl.value.cancel_monitor_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def set_drm_property(pwstrname : LibC::LPWSTR, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(pwstrname, dwtype, pvalue, cblength)
  end
  def get_drm_property(pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstrname, pdwtype, pvalue, pcblength)
  end
  def set_evaluate_output_level_licenses(fevaluate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_evaluate_output_level_licenses.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fevaluate)
  end
  def get_play_output_levels(pplayopl : DRM_PLAY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_play_output_levels.unsafe_as(Proc(DRM_PLAY_OPL*, UInt32*, UInt32*, HRESULT)).call(pplayopl, pcblength, pdwminappcompliancelevel)
  end
  def get_copy_output_levels(pcopyopl : DRM_COPY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_copy_output_levels.unsafe_as(Proc(DRM_COPY_OPL*, UInt32*, UInt32*, HRESULT)).call(pcopyopl, pcblength, pdwminappcompliancelevel)
  end
  def try_next_license : HRESULT
    @lpVtbl.value.try_next_license.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMDRMReader3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def acquire_license(dwflags : UInt32) : HRESULT
    @lpVtbl.value.acquire_license.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def cancel_license_acquisition : HRESULT
    @lpVtbl.value.cancel_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def individualize(dwflags : UInt32) : HRESULT
    @lpVtbl.value.individualize.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def cancel_individualization : HRESULT
    @lpVtbl.value.cancel_individualization.unsafe_as(Proc(HRESULT)).call
  end
  def monitor_license_acquisition : HRESULT
    @lpVtbl.value.monitor_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def cancel_monitor_license_acquisition : HRESULT
    @lpVtbl.value.cancel_monitor_license_acquisition.unsafe_as(Proc(HRESULT)).call
  end
  def set_drm_property(pwstrname : LibC::LPWSTR, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(pwstrname, dwtype, pvalue, cblength)
  end
  def get_drm_property(pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pwstrname, pdwtype, pvalue, pcblength)
  end
  def set_evaluate_output_level_licenses(fevaluate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_evaluate_output_level_licenses.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fevaluate)
  end
  def get_play_output_levels(pplayopl : DRM_PLAY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_play_output_levels.unsafe_as(Proc(DRM_PLAY_OPL*, UInt32*, UInt32*, HRESULT)).call(pplayopl, pcblength, pdwminappcompliancelevel)
  end
  def get_copy_output_levels(pcopyopl : DRM_COPY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_copy_output_levels.unsafe_as(Proc(DRM_COPY_OPL*, UInt32*, UInt32*, HRESULT)).call(pcopyopl, pcblength, pdwminappcompliancelevel)
  end
  def try_next_license : HRESULT
    @lpVtbl.value.try_next_license.unsafe_as(Proc(HRESULT)).call
  end
  def get_inclusion_list(ppguids : Guid**, pcguids : UInt32*) : HRESULT
    @lpVtbl.value.get_inclusion_list.unsafe_as(Proc(Guid**, UInt32*, HRESULT)).call(ppguids, pcguids)
  end
end
struct LibWin32::IWMReaderPlaylistBurn
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init_playlist_burn(cfiles : UInt32, ppwszfilenames : LibC::LPWSTR*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.init_playlist_burn.unsafe_as(Proc(UInt32, LibC::LPWSTR*, IWMStatusCallback, Void*, HRESULT)).call(cfiles, ppwszfilenames, pcallback, pvcontext)
  end
  def get_init_results(cfiles : UInt32, phrstati : HRESULT*) : HRESULT
    @lpVtbl.value.get_init_results.unsafe_as(Proc(UInt32, HRESULT*, HRESULT)).call(cfiles, phrstati)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def end_playlist_burn(hrburnresult : HRESULT) : HRESULT
    @lpVtbl.value.end_playlist_burn.unsafe_as(Proc(HRESULT, HRESULT)).call(hrburnresult)
  end
end
struct LibWin32::IWMReaderNetworkConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffering_time(pcnsbufferingtime : UInt64*) : HRESULT
    @lpVtbl.value.get_buffering_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsbufferingtime)
  end
  def set_buffering_time(cnsbufferingtime : UInt64) : HRESULT
    @lpVtbl.value.set_buffering_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnsbufferingtime)
  end
  def get_udp_port_ranges(prangearray : WM_PORT_NUMBER_RANGE*, pcranges : UInt32*) : HRESULT
    @lpVtbl.value.get_udp_port_ranges.unsafe_as(Proc(WM_PORT_NUMBER_RANGE*, UInt32*, HRESULT)).call(prangearray, pcranges)
  end
  def set_udp_port_ranges(prangearray : WM_PORT_NUMBER_RANGE*, cranges : UInt32) : HRESULT
    @lpVtbl.value.set_udp_port_ranges.unsafe_as(Proc(WM_PORT_NUMBER_RANGE*, UInt32, HRESULT)).call(prangearray, cranges)
  end
  def get_proxy_settings(pwszprotocol : LibC::LPWSTR, pproxysetting : WMT_PROXY_SETTINGS*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(LibC::LPWSTR, WMT_PROXY_SETTINGS*, HRESULT)).call(pwszprotocol, pproxysetting)
  end
  def set_proxy_settings(pwszprotocol : LibC::LPWSTR, proxysetting : WMT_PROXY_SETTINGS) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(LibC::LPWSTR, WMT_PROXY_SETTINGS, HRESULT)).call(pwszprotocol, proxysetting)
  end
  def get_proxy_host_name(pwszprotocol : LibC::LPWSTR, pwszhostname : Char*, pcchhostname : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_host_name.unsafe_as(Proc(LibC::LPWSTR, Char*, UInt32*, HRESULT)).call(pwszprotocol, pwszhostname, pcchhostname)
  end
  def set_proxy_host_name(pwszprotocol : LibC::LPWSTR, pwszhostname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_host_name.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprotocol, pwszhostname)
  end
  def get_proxy_port(pwszprotocol : LibC::LPWSTR, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_port.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pwszprotocol, pdwport)
  end
  def set_proxy_port(pwszprotocol : LibC::LPWSTR, dwport : UInt32) : HRESULT
    @lpVtbl.value.set_proxy_port.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pwszprotocol, dwport)
  end
  def get_proxy_exception_list(pwszprotocol : LibC::LPWSTR, pwszexceptionlist : Char*, pcchexceptionlist : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_exception_list.unsafe_as(Proc(LibC::LPWSTR, Char*, UInt32*, HRESULT)).call(pwszprotocol, pwszexceptionlist, pcchexceptionlist)
  end
  def set_proxy_exception_list(pwszprotocol : LibC::LPWSTR, pwszexceptionlist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_exception_list.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprotocol, pwszexceptionlist)
  end
  def get_proxy_bypass_for_local(pwszprotocol : LibC::LPWSTR, pfbypassforlocal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_proxy_bypass_for_local.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(pwszprotocol, pfbypassforlocal)
  end
  def set_proxy_bypass_for_local(pwszprotocol : LibC::LPWSTR, fbypassforlocal : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_proxy_bypass_for_local.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pwszprotocol, fbypassforlocal)
  end
  def get_force_rerun_auto_proxy_detection(pfforcererundetection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_force_rerun_auto_proxy_detection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfforcererundetection)
  end
  def set_force_rerun_auto_proxy_detection(fforcererundetection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_force_rerun_auto_proxy_detection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fforcererundetection)
  end
  def get_enable_multicast(pfenablemulticast : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_multicast.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablemulticast)
  end
  def set_enable_multicast(fenablemulticast : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_multicast.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablemulticast)
  end
  def get_enable_http(pfenablehttp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_http.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablehttp)
  end
  def set_enable_http(fenablehttp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_http.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablehttp)
  end
  def get_enable_udp(pfenableudp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_udp.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenableudp)
  end
  def set_enable_udp(fenableudp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_udp.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenableudp)
  end
  def get_enable_tcp(pfenabletcp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_tcp.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenabletcp)
  end
  def set_enable_tcp(fenabletcp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_tcp.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenabletcp)
  end
  def reset_protocol_rollover : HRESULT
    @lpVtbl.value.reset_protocol_rollover.unsafe_as(Proc(HRESULT)).call
  end
  def get_connection_bandwidth(pdwconnectionbandwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_bandwidth.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwconnectionbandwidth)
  end
  def set_connection_bandwidth(dwconnectionbandwidth : UInt32) : HRESULT
    @lpVtbl.value.set_connection_bandwidth.unsafe_as(Proc(UInt32, HRESULT)).call(dwconnectionbandwidth)
  end
  def get_num_protocols_supported(pcprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_num_protocols_supported.unsafe_as(Proc(UInt32*, HRESULT)).call(pcprotocols)
  end
  def get_supported_protocol_name(dwprotocolnum : UInt32, pwszprotocolname : Char*, pcchprotocolname : UInt32*) : HRESULT
    @lpVtbl.value.get_supported_protocol_name.unsafe_as(Proc(UInt32, Char*, UInt32*, HRESULT)).call(dwprotocolnum, pwszprotocolname, pcchprotocolname)
  end
  def add_logging_url(pwszurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_logging_url.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszurl)
  end
  def get_logging_url(dwindex : UInt32, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url.unsafe_as(Proc(UInt32, Char*, UInt32*, HRESULT)).call(dwindex, pwszurl, pcchurl)
  end
  def get_logging_url_count(pdwurlcount : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwurlcount)
  end
  def reset_logging_url_list : HRESULT
    @lpVtbl.value.reset_logging_url_list.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMReaderNetworkConfig2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffering_time(pcnsbufferingtime : UInt64*) : HRESULT
    @lpVtbl.value.get_buffering_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsbufferingtime)
  end
  def set_buffering_time(cnsbufferingtime : UInt64) : HRESULT
    @lpVtbl.value.set_buffering_time.unsafe_as(Proc(UInt64, HRESULT)).call(cnsbufferingtime)
  end
  def get_udp_port_ranges(prangearray : WM_PORT_NUMBER_RANGE*, pcranges : UInt32*) : HRESULT
    @lpVtbl.value.get_udp_port_ranges.unsafe_as(Proc(WM_PORT_NUMBER_RANGE*, UInt32*, HRESULT)).call(prangearray, pcranges)
  end
  def set_udp_port_ranges(prangearray : WM_PORT_NUMBER_RANGE*, cranges : UInt32) : HRESULT
    @lpVtbl.value.set_udp_port_ranges.unsafe_as(Proc(WM_PORT_NUMBER_RANGE*, UInt32, HRESULT)).call(prangearray, cranges)
  end
  def get_proxy_settings(pwszprotocol : LibC::LPWSTR, pproxysetting : WMT_PROXY_SETTINGS*) : HRESULT
    @lpVtbl.value.get_proxy_settings.unsafe_as(Proc(LibC::LPWSTR, WMT_PROXY_SETTINGS*, HRESULT)).call(pwszprotocol, pproxysetting)
  end
  def set_proxy_settings(pwszprotocol : LibC::LPWSTR, proxysetting : WMT_PROXY_SETTINGS) : HRESULT
    @lpVtbl.value.set_proxy_settings.unsafe_as(Proc(LibC::LPWSTR, WMT_PROXY_SETTINGS, HRESULT)).call(pwszprotocol, proxysetting)
  end
  def get_proxy_host_name(pwszprotocol : LibC::LPWSTR, pwszhostname : Char*, pcchhostname : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_host_name.unsafe_as(Proc(LibC::LPWSTR, Char*, UInt32*, HRESULT)).call(pwszprotocol, pwszhostname, pcchhostname)
  end
  def set_proxy_host_name(pwszprotocol : LibC::LPWSTR, pwszhostname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_host_name.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprotocol, pwszhostname)
  end
  def get_proxy_port(pwszprotocol : LibC::LPWSTR, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_port.unsafe_as(Proc(LibC::LPWSTR, UInt32*, HRESULT)).call(pwszprotocol, pdwport)
  end
  def set_proxy_port(pwszprotocol : LibC::LPWSTR, dwport : UInt32) : HRESULT
    @lpVtbl.value.set_proxy_port.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pwszprotocol, dwport)
  end
  def get_proxy_exception_list(pwszprotocol : LibC::LPWSTR, pwszexceptionlist : Char*, pcchexceptionlist : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_exception_list.unsafe_as(Proc(LibC::LPWSTR, Char*, UInt32*, HRESULT)).call(pwszprotocol, pwszexceptionlist, pcchexceptionlist)
  end
  def set_proxy_exception_list(pwszprotocol : LibC::LPWSTR, pwszexceptionlist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_exception_list.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszprotocol, pwszexceptionlist)
  end
  def get_proxy_bypass_for_local(pwszprotocol : LibC::LPWSTR, pfbypassforlocal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_proxy_bypass_for_local.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)).call(pwszprotocol, pfbypassforlocal)
  end
  def set_proxy_bypass_for_local(pwszprotocol : LibC::LPWSTR, fbypassforlocal : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_proxy_bypass_for_local.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pwszprotocol, fbypassforlocal)
  end
  def get_force_rerun_auto_proxy_detection(pfforcererundetection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_force_rerun_auto_proxy_detection.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfforcererundetection)
  end
  def set_force_rerun_auto_proxy_detection(fforcererundetection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_force_rerun_auto_proxy_detection.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fforcererundetection)
  end
  def get_enable_multicast(pfenablemulticast : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_multicast.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablemulticast)
  end
  def set_enable_multicast(fenablemulticast : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_multicast.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablemulticast)
  end
  def get_enable_http(pfenablehttp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_http.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablehttp)
  end
  def set_enable_http(fenablehttp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_http.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablehttp)
  end
  def get_enable_udp(pfenableudp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_udp.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenableudp)
  end
  def set_enable_udp(fenableudp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_udp.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenableudp)
  end
  def get_enable_tcp(pfenabletcp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_tcp.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenabletcp)
  end
  def set_enable_tcp(fenabletcp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_tcp.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenabletcp)
  end
  def reset_protocol_rollover : HRESULT
    @lpVtbl.value.reset_protocol_rollover.unsafe_as(Proc(HRESULT)).call
  end
  def get_connection_bandwidth(pdwconnectionbandwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_bandwidth.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwconnectionbandwidth)
  end
  def set_connection_bandwidth(dwconnectionbandwidth : UInt32) : HRESULT
    @lpVtbl.value.set_connection_bandwidth.unsafe_as(Proc(UInt32, HRESULT)).call(dwconnectionbandwidth)
  end
  def get_num_protocols_supported(pcprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_num_protocols_supported.unsafe_as(Proc(UInt32*, HRESULT)).call(pcprotocols)
  end
  def get_supported_protocol_name(dwprotocolnum : UInt32, pwszprotocolname : Char*, pcchprotocolname : UInt32*) : HRESULT
    @lpVtbl.value.get_supported_protocol_name.unsafe_as(Proc(UInt32, Char*, UInt32*, HRESULT)).call(dwprotocolnum, pwszprotocolname, pcchprotocolname)
  end
  def add_logging_url(pwszurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_logging_url.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszurl)
  end
  def get_logging_url(dwindex : UInt32, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url.unsafe_as(Proc(UInt32, Char*, UInt32*, HRESULT)).call(dwindex, pwszurl, pcchurl)
  end
  def get_logging_url_count(pdwurlcount : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwurlcount)
  end
  def reset_logging_url_list : HRESULT
    @lpVtbl.value.reset_logging_url_list.unsafe_as(Proc(HRESULT)).call
  end
  def get_enable_content_caching(pfenablecontentcaching : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_content_caching.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablecontentcaching)
  end
  def set_enable_content_caching(fenablecontentcaching : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_content_caching.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablecontentcaching)
  end
  def get_enable_fast_cache(pfenablefastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_fast_cache.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablefastcache)
  end
  def set_enable_fast_cache(fenablefastcache : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_fast_cache.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablefastcache)
  end
  def get_accelerated_streaming_duration(pcnsaccelduration : UInt64*) : HRESULT
    @lpVtbl.value.get_accelerated_streaming_duration.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsaccelduration)
  end
  def set_accelerated_streaming_duration(cnsaccelduration : UInt64) : HRESULT
    @lpVtbl.value.set_accelerated_streaming_duration.unsafe_as(Proc(UInt64, HRESULT)).call(cnsaccelduration)
  end
  def get_auto_reconnect_limit(pdwautoreconnectlimit : UInt32*) : HRESULT
    @lpVtbl.value.get_auto_reconnect_limit.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwautoreconnectlimit)
  end
  def set_auto_reconnect_limit(dwautoreconnectlimit : UInt32) : HRESULT
    @lpVtbl.value.set_auto_reconnect_limit.unsafe_as(Proc(UInt32, HRESULT)).call(dwautoreconnectlimit)
  end
  def get_enable_resends(pfenableresends : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_resends.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenableresends)
  end
  def set_enable_resends(fenableresends : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_resends.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenableresends)
  end
  def get_enable_thinning(pfenablethinning : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_thinning.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfenablethinning)
  end
  def set_enable_thinning(fenablethinning : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_thinning.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenablethinning)
  end
  def get_max_net_packet_size(pdwmaxnetpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_net_packet_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxnetpacketsize)
  end
end
struct LibWin32::IWMReaderStreamClock
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_time(pcnsnow : UInt64*) : HRESULT
    @lpVtbl.value.get_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsnow)
  end
  def set_timer(cnswhen : UInt64, pvparam : Void*, pdwtimerid : UInt32*) : HRESULT
    @lpVtbl.value.set_timer.unsafe_as(Proc(UInt64, Void*, UInt32*, HRESULT)).call(cnswhen, pvparam, pdwtimerid)
  end
  def kill_timer(dwtimerid : UInt32) : HRESULT
    @lpVtbl.value.kill_timer.unsafe_as(Proc(UInt32, HRESULT)).call(dwtimerid)
  end
end
struct LibWin32::IWMIndexer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_indexing(pwszurl : LibC::LPWSTR, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_indexing.unsafe_as(Proc(LibC::LPWSTR, IWMStatusCallback, Void*, HRESULT)).call(pwszurl, pcallback, pvcontext)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMIndexer2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_indexing(pwszurl : LibC::LPWSTR, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_indexing.unsafe_as(Proc(LibC::LPWSTR, IWMStatusCallback, Void*, HRESULT)).call(pwszurl, pcallback, pvcontext)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def configure(wstreamnum : UInt16, nindexertype : WMT_INDEXER_TYPE, pvinterval : Void*, pvindextype : Void*) : HRESULT
    @lpVtbl.value.configure.unsafe_as(Proc(UInt16, WMT_INDEXER_TYPE, Void*, Void*, HRESULT)).call(wstreamnum, nindexertype, pvinterval, pvindextype)
  end
end
struct LibWin32::IWMLicenseBackup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def backup_licenses(dwflags : UInt32, pcallback : IWMStatusCallback) : HRESULT
    @lpVtbl.value.backup_licenses.unsafe_as(Proc(UInt32, IWMStatusCallback, HRESULT)).call(dwflags, pcallback)
  end
  def cancel_license_backup : HRESULT
    @lpVtbl.value.cancel_license_backup.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMLicenseRestore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def restore_licenses(dwflags : UInt32, pcallback : IWMStatusCallback) : HRESULT
    @lpVtbl.value.restore_licenses.unsafe_as(Proc(UInt32, IWMStatusCallback, HRESULT)).call(dwflags, pcallback)
  end
  def cancel_license_restore : HRESULT
    @lpVtbl.value.cancel_license_restore.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMBackupRestoreProps
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_prop_count(pcprops : UInt16*) : HRESULT
    @lpVtbl.value.get_prop_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pcprops)
  end
  def get_prop_by_index(windex : UInt16, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_prop_by_index.unsafe_as(Proc(UInt16, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(windex, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_prop_by_name(pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_prop_by_name.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)).call(pszname, ptype, pvalue, pcblength)
  end
  def set_prop(pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_prop.unsafe_as(Proc(LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)).call(pszname, type, pvalue, cblength)
  end
  def remove_prop(pcwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_prop.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pcwszname)
  end
  def remove_all_props : HRESULT
    @lpVtbl.value.remove_all_props.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMCodecInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_codec_info_count(guidtype : Guid*, pccodecs : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(guidtype, pccodecs)
  end
  def get_codec_format_count(guidtype : Guid*, dwcodecindex : UInt32, pcformat : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_count.unsafe_as(Proc(Guid*, UInt32, UInt32*, HRESULT)).call(guidtype, dwcodecindex, pcformat)
  end
  def get_codec_format(guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_codec_format.unsafe_as(Proc(Guid*, UInt32, UInt32, IWMStreamConfig*, HRESULT)).call(guidtype, dwcodecindex, dwformatindex, ppistreamconfig)
  end
end
struct LibWin32::IWMCodecInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_codec_info_count(guidtype : Guid*, pccodecs : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(guidtype, pccodecs)
  end
  def get_codec_format_count(guidtype : Guid*, dwcodecindex : UInt32, pcformat : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_count.unsafe_as(Proc(Guid*, UInt32, UInt32*, HRESULT)).call(guidtype, dwcodecindex, pcformat)
  end
  def get_codec_format(guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_codec_format.unsafe_as(Proc(Guid*, UInt32, UInt32, IWMStreamConfig*, HRESULT)).call(guidtype, dwcodecindex, dwformatindex, ppistreamconfig)
  end
  def get_codec_name(guidtype : Guid*, dwcodecindex : UInt32, wszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_name.unsafe_as(Proc(Guid*, UInt32, Char*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, wszname, pcchname)
  end
  def get_codec_format_desc(guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*, wszdesc : Char*, pcchdesc : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_desc.unsafe_as(Proc(Guid*, UInt32, UInt32, IWMStreamConfig*, Char*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, dwformatindex, ppistreamconfig, wszdesc, pcchdesc)
  end
end
struct LibWin32::IWMCodecInfo3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_codec_info_count(guidtype : Guid*, pccodecs : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(guidtype, pccodecs)
  end
  def get_codec_format_count(guidtype : Guid*, dwcodecindex : UInt32, pcformat : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_count.unsafe_as(Proc(Guid*, UInt32, UInt32*, HRESULT)).call(guidtype, dwcodecindex, pcformat)
  end
  def get_codec_format(guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_codec_format.unsafe_as(Proc(Guid*, UInt32, UInt32, IWMStreamConfig*, HRESULT)).call(guidtype, dwcodecindex, dwformatindex, ppistreamconfig)
  end
  def get_codec_name(guidtype : Guid*, dwcodecindex : UInt32, wszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_name.unsafe_as(Proc(Guid*, UInt32, Char*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, wszname, pcchname)
  end
  def get_codec_format_desc(guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*, wszdesc : Char*, pcchdesc : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_desc.unsafe_as(Proc(Guid*, UInt32, UInt32, IWMStreamConfig*, Char*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, dwformatindex, ppistreamconfig, wszdesc, pcchdesc)
  end
  def get_codec_format_prop(guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_prop.unsafe_as(Proc(Guid*, UInt32, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, dwformatindex, pszname, ptype, pvalue, pdwsize)
  end
  def get_codec_prop(guidtype : Guid*, dwcodecindex : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_prop.unsafe_as(Proc(Guid*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, pszname, ptype, pvalue, pdwsize)
  end
  def set_codec_enumeration_setting(guidtype : Guid*, dwcodecindex : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, dwsize : UInt32) : HRESULT
    @lpVtbl.value.set_codec_enumeration_setting.unsafe_as(Proc(Guid*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt32, HRESULT)).call(guidtype, dwcodecindex, pszname, type, pvalue, dwsize)
  end
  def get_codec_enumeration_setting(guidtype : Guid*, dwcodecindex : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_enumeration_setting.unsafe_as(Proc(Guid*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)).call(guidtype, dwcodecindex, pszname, ptype, pvalue, pdwsize)
  end
end
struct LibWin32::IWMLanguageList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_language_count(pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pwcount)
  end
  def get_language_details(windex : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language_details.unsafe_as(Proc(UInt16, Char*, UInt16*, HRESULT)).call(windex, pwszlanguagestring, pcchlanguagestringlength)
  end
  def add_language_by_rfc1766_string(pwszlanguagestring : LibC::LPWSTR, pwindex : UInt16*) : HRESULT
    @lpVtbl.value.add_language_by_rfc1766_string.unsafe_as(Proc(LibC::LPWSTR, UInt16*, HRESULT)).call(pwszlanguagestring, pwindex)
  end
end
struct LibWin32::IWMWriterPushSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_header(pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pheader)
  end
  def is_real_time(pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfrealtime)
  end
  def allocate_data_unit(cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.unsafe_as(Proc(UInt32, INSSBuffer*, HRESULT)).call(cbdataunit, ppdataunit)
  end
  def on_data_unit(pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.unsafe_as(Proc(INSSBuffer, HRESULT)).call(pdataunit)
  end
  def on_end_writing : HRESULT
    @lpVtbl.value.on_end_writing.unsafe_as(Proc(HRESULT)).call
  end
  def connect(pwszurl : LibC::LPWSTR, pwsztemplateurl : LibC::LPWSTR, fautodestroy : LibC::BOOL) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)).call(pwszurl, pwsztemplateurl, fautodestroy)
  end
  def disconnect : HRESULT
    @lpVtbl.value.disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def end_session : HRESULT
    @lpVtbl.value.end_session.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMDeviceRegistration
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_device(dwregistertype : UInt32, pbcertificate : UInt8*, cbcertificate : UInt32, serialnumber : DRM_VAL16, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.register_device.unsafe_as(Proc(UInt32, UInt8*, UInt32, DRM_VAL16, IWMRegisteredDevice*, HRESULT)).call(dwregistertype, pbcertificate, cbcertificate, serialnumber, ppdevice)
  end
  def unregister_device(dwregistertype : UInt32, pbcertificate : UInt8*, cbcertificate : UInt32, serialnumber : DRM_VAL16) : HRESULT
    @lpVtbl.value.unregister_device.unsafe_as(Proc(UInt32, UInt8*, UInt32, DRM_VAL16, HRESULT)).call(dwregistertype, pbcertificate, cbcertificate, serialnumber)
  end
  def get_registration_stats(dwregistertype : UInt32, pcregistereddevices : UInt32*) : HRESULT
    @lpVtbl.value.get_registration_stats.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(dwregistertype, pcregistereddevices)
  end
  def get_first_registered_device(dwregistertype : UInt32, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.get_first_registered_device.unsafe_as(Proc(UInt32, IWMRegisteredDevice*, HRESULT)).call(dwregistertype, ppdevice)
  end
  def get_next_registered_device(ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.get_next_registered_device.unsafe_as(Proc(IWMRegisteredDevice*, HRESULT)).call(ppdevice)
  end
  def get_registered_device_by_id(dwregistertype : UInt32, pbcertificate : UInt8*, cbcertificate : UInt32, serialnumber : DRM_VAL16, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.get_registered_device_by_id.unsafe_as(Proc(UInt32, UInt8*, UInt32, DRM_VAL16, IWMRegisteredDevice*, HRESULT)).call(dwregistertype, pbcertificate, cbcertificate, serialnumber, ppdevice)
  end
end
struct LibWin32::IWMRegisteredDevice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_device_serial_number(pserialnumber : DRM_VAL16*) : HRESULT
    @lpVtbl.value.get_device_serial_number.unsafe_as(Proc(DRM_VAL16*, HRESULT)).call(pserialnumber)
  end
  def get_device_certificate(ppcertificate : INSSBuffer*) : HRESULT
    @lpVtbl.value.get_device_certificate.unsafe_as(Proc(INSSBuffer*, HRESULT)).call(ppcertificate)
  end
  def get_device_type(pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_device_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwtype)
  end
  def get_attribute_count(pcattributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcattributes)
  end
  def get_attribute_by_index(dwindex : UInt32, pbstrname : UInt8**, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute_by_index.unsafe_as(Proc(UInt32, UInt8**, UInt8**, HRESULT)).call(dwindex, pbstrname, pbstrvalue)
  end
  def get_attribute_by_name(bstrname : UInt8*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute_by_name.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrname, pbstrvalue)
  end
  def set_attribute_by_name(bstrname : UInt8*, bstrvalue : UInt8*) : HRESULT
    @lpVtbl.value.set_attribute_by_name.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrname, bstrvalue)
  end
  def approve(fapprove : LibC::BOOL) : HRESULT
    @lpVtbl.value.approve.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fapprove)
  end
  def is_valid(pfvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_valid.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfvalid)
  end
  def is_approved(pfapproved : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_approved.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfapproved)
  end
  def is_wmdrm_compliant(pfcompliant : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_wmdrm_compliant.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfcompliant)
  end
  def is_opened(pfopened : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_opened.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfopened)
  end
  def open : HRESULT
    @lpVtbl.value.open.unsafe_as(Proc(HRESULT)).call
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMProximityDetection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_detection(pbregistrationmsg : UInt8*, cbregistrationmsg : UInt32, pblocaladdress : UInt8*, cblocaladdress : UInt32, dwextraportsallowed : UInt32, ppregistrationresponsemsg : INSSBuffer*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_detection.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)).call(pbregistrationmsg, cbregistrationmsg, pblocaladdress, cblocaladdress, dwextraportsallowed, ppregistrationresponsemsg, pcallback, pvcontext)
  end
end
struct LibWin32::IWMDRMMessageParser
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def parse_registration_req_msg(pbregistrationreqmsg : UInt8*, cbregistrationreqmsg : UInt32, ppdevicecert : INSSBuffer*, pdeviceserialnumber : DRM_VAL16*) : HRESULT
    @lpVtbl.value.parse_registration_req_msg.unsafe_as(Proc(UInt8*, UInt32, INSSBuffer*, DRM_VAL16*, HRESULT)).call(pbregistrationreqmsg, cbregistrationreqmsg, ppdevicecert, pdeviceserialnumber)
  end
  def parse_license_request_msg(pblicenserequestmsg : UInt8*, cblicenserequestmsg : UInt32, ppdevicecert : INSSBuffer*, pdeviceserialnumber : DRM_VAL16*, pbstraction : UInt8**) : HRESULT
    @lpVtbl.value.parse_license_request_msg.unsafe_as(Proc(UInt8*, UInt32, INSSBuffer*, DRM_VAL16*, UInt8**, HRESULT)).call(pblicenserequestmsg, cblicenserequestmsg, ppdevicecert, pdeviceserialnumber, pbstraction)
  end
end
struct LibWin32::IWMDRMTranscryptor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(bstrfilename : UInt8*, pblicenserequestmsg : UInt8*, cblicenserequestmsg : UInt32, pplicenseresponsemsg : INSSBuffer*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt8*, UInt8*, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)).call(bstrfilename, pblicenserequestmsg, cblicenserequestmsg, pplicenseresponsemsg, pcallback, pvcontext)
  end
  def seek(hnstime : UInt64) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(UInt64, HRESULT)).call(hnstime)
  end
  def read(pbdata : UInt8*, pcbdata : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbdata, pcbdata)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMDRMTranscryptor2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(bstrfilename : UInt8*, pblicenserequestmsg : UInt8*, cblicenserequestmsg : UInt32, pplicenseresponsemsg : INSSBuffer*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(UInt8*, UInt8*, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)).call(bstrfilename, pblicenserequestmsg, cblicenserequestmsg, pplicenseresponsemsg, pcallback, pvcontext)
  end
  def seek(hnstime : UInt64) : HRESULT
    @lpVtbl.value.seek.unsafe_as(Proc(UInt64, HRESULT)).call(hnstime)
  end
  def read(pbdata : UInt8*, pcbdata : UInt32*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt8*, UInt32*, HRESULT)).call(pbdata, pcbdata)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def seek_ex(cnsstarttime : UInt64, cnsduration : UInt64, flrate : Float32, fincludefileheader : LibC::BOOL) : HRESULT
    @lpVtbl.value.seek_ex.unsafe_as(Proc(UInt64, UInt64, Float32, LibC::BOOL, HRESULT)).call(cnsstarttime, cnsduration, flrate, fincludefileheader)
  end
  def zero_adjust_timestamps(fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.zero_adjust_timestamps.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fenable)
  end
  def get_seek_start_time(pcnstime : UInt64*) : HRESULT
    @lpVtbl.value.get_seek_start_time.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnstime)
  end
  def get_duration(pcnsduration : UInt64*) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(UInt64*, HRESULT)).call(pcnsduration)
  end
end
struct LibWin32::IWMDRMTranscryptionManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_transcryptor(pptranscryptor : IWMDRMTranscryptor*) : HRESULT
    @lpVtbl.value.create_transcryptor.unsafe_as(Proc(IWMDRMTranscryptor*, HRESULT)).call(pptranscryptor)
  end
end
struct LibWin32::IWMWatermarkInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_watermark_entry_count(wmettype : WMT_WATERMARK_ENTRY_TYPE, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_watermark_entry_count.unsafe_as(Proc(WMT_WATERMARK_ENTRY_TYPE, UInt32*, HRESULT)).call(wmettype, pdwcount)
  end
  def get_watermark_entry(wmettype : WMT_WATERMARK_ENTRY_TYPE, dwentrynum : UInt32, pentry : WMT_WATERMARK_ENTRY*) : HRESULT
    @lpVtbl.value.get_watermark_entry.unsafe_as(Proc(WMT_WATERMARK_ENTRY_TYPE, UInt32, WMT_WATERMARK_ENTRY*, HRESULT)).call(wmettype, dwentrynum, pentry)
  end
end
struct LibWin32::IWMReaderAccelerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_codec_interface(dwoutputnum : UInt32, riid : Guid*, ppvcodecinterface : Void**) : HRESULT
    @lpVtbl.value.get_codec_interface.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(dwoutputnum, riid, ppvcodecinterface)
  end
  def notify(dwoutputnum : UInt32, psubtype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.notify.unsafe_as(Proc(UInt32, WM_MEDIA_TYPE*, HRESULT)).call(dwoutputnum, psubtype)
  end
end
struct LibWin32::IWMReaderTimecode
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_timecode_range_count(wstreamnum : UInt16, pwrangecount : UInt16*) : HRESULT
    @lpVtbl.value.get_timecode_range_count.unsafe_as(Proc(UInt16, UInt16*, HRESULT)).call(wstreamnum, pwrangecount)
  end
  def get_timecode_range_bounds(wstreamnum : UInt16, wrangenum : UInt16, pstarttimecode : UInt32*, pendtimecode : UInt32*) : HRESULT
    @lpVtbl.value.get_timecode_range_bounds.unsafe_as(Proc(UInt16, UInt16, UInt32*, UInt32*, HRESULT)).call(wstreamnum, wrangenum, pstarttimecode, pendtimecode)
  end
end
struct LibWin32::IWMAddressAccess
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_access_entry_count(aetype : WM_AETYPE, pcentries : UInt32*) : HRESULT
    @lpVtbl.value.get_access_entry_count.unsafe_as(Proc(WM_AETYPE, UInt32*, HRESULT)).call(aetype, pcentries)
  end
  def get_access_entry(aetype : WM_AETYPE, dwentrynum : UInt32, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.get_access_entry.unsafe_as(Proc(WM_AETYPE, UInt32, WM_ADDRESS_ACCESSENTRY*, HRESULT)).call(aetype, dwentrynum, paddraccessentry)
  end
  def add_access_entry(aetype : WM_AETYPE, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.add_access_entry.unsafe_as(Proc(WM_AETYPE, WM_ADDRESS_ACCESSENTRY*, HRESULT)).call(aetype, paddraccessentry)
  end
  def remove_access_entry(aetype : WM_AETYPE, dwentrynum : UInt32) : HRESULT
    @lpVtbl.value.remove_access_entry.unsafe_as(Proc(WM_AETYPE, UInt32, HRESULT)).call(aetype, dwentrynum)
  end
end
struct LibWin32::IWMAddressAccess2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_access_entry_count(aetype : WM_AETYPE, pcentries : UInt32*) : HRESULT
    @lpVtbl.value.get_access_entry_count.unsafe_as(Proc(WM_AETYPE, UInt32*, HRESULT)).call(aetype, pcentries)
  end
  def get_access_entry(aetype : WM_AETYPE, dwentrynum : UInt32, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.get_access_entry.unsafe_as(Proc(WM_AETYPE, UInt32, WM_ADDRESS_ACCESSENTRY*, HRESULT)).call(aetype, dwentrynum, paddraccessentry)
  end
  def add_access_entry(aetype : WM_AETYPE, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.add_access_entry.unsafe_as(Proc(WM_AETYPE, WM_ADDRESS_ACCESSENTRY*, HRESULT)).call(aetype, paddraccessentry)
  end
  def remove_access_entry(aetype : WM_AETYPE, dwentrynum : UInt32) : HRESULT
    @lpVtbl.value.remove_access_entry.unsafe_as(Proc(WM_AETYPE, UInt32, HRESULT)).call(aetype, dwentrynum)
  end
  def get_access_entry_ex(aetype : WM_AETYPE, dwentrynum : UInt32, pbstraddress : UInt8**, pbstrmask : UInt8**) : HRESULT
    @lpVtbl.value.get_access_entry_ex.unsafe_as(Proc(WM_AETYPE, UInt32, UInt8**, UInt8**, HRESULT)).call(aetype, dwentrynum, pbstraddress, pbstrmask)
  end
  def add_access_entry_ex(aetype : WM_AETYPE, bstraddress : UInt8*, bstrmask : UInt8*) : HRESULT
    @lpVtbl.value.add_access_entry_ex.unsafe_as(Proc(WM_AETYPE, UInt8*, UInt8*, HRESULT)).call(aetype, bstraddress, bstrmask)
  end
end
struct LibWin32::IWMImageInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_image_count(pcimages : UInt32*) : HRESULT
    @lpVtbl.value.get_image_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcimages)
  end
  def get_image(windex : UInt32, pcchmimetype : UInt16*, pwszmimetype : Char*, pcchdescription : UInt16*, pwszdescription : Char*, pimagetype : UInt16*, pcbimagedata : UInt32*, pbimagedata : UInt8*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(UInt32, UInt16*, Char*, UInt16*, Char*, UInt16*, UInt32*, UInt8*, HRESULT)).call(windex, pcchmimetype, pwszmimetype, pcchdescription, pwszdescription, pimagetype, pcbimagedata, pbimagedata)
  end
end
struct LibWin32::IWMLicenseRevocationAgent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_lrb_challenge(pmachineid : UInt8*, dwmachineidlength : UInt32, pchallenge : UInt8*, dwchallengelength : UInt32, pchallengeoutput : UInt8*, pdwchallengeoutputlength : UInt32*) : HRESULT
    @lpVtbl.value.get_lrb_challenge.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)).call(pmachineid, dwmachineidlength, pchallenge, dwchallengelength, pchallengeoutput, pdwchallengeoutputlength)
  end
  def process_lrb(psignedlrb : UInt8*, dwsignedlrblength : UInt32, psignedack : UInt8*, pdwsignedacklength : UInt32*) : HRESULT
    @lpVtbl.value.process_lrb.unsafe_as(Proc(UInt8*, UInt32, UInt8*, UInt32*, HRESULT)).call(psignedlrb, dwsignedlrblength, psignedack, pdwsignedacklength)
  end
end
struct LibWin32::IWMAuthorizer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_cert_count(pccerts : UInt32*) : HRESULT
    @lpVtbl.value.get_cert_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pccerts)
  end
  def get_cert(dwindex : UInt32, ppbcertdata : UInt8**) : HRESULT
    @lpVtbl.value.get_cert.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(dwindex, ppbcertdata)
  end
  def get_shared_data(dwcertindex : UInt32, pbshareddata : UInt8*, pbcert : UInt8*, ppbshareddata : UInt8**) : HRESULT
    @lpVtbl.value.get_shared_data.unsafe_as(Proc(UInt32, UInt8*, UInt8*, UInt8**, HRESULT)).call(dwcertindex, pbshareddata, pbcert, ppbshareddata)
  end
end
struct LibWin32::IWMSecureChannel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_cert_count(pccerts : UInt32*) : HRESULT
    @lpVtbl.value.get_cert_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pccerts)
  end
  def get_cert(dwindex : UInt32, ppbcertdata : UInt8**) : HRESULT
    @lpVtbl.value.get_cert.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(dwindex, ppbcertdata)
  end
  def get_shared_data(dwcertindex : UInt32, pbshareddata : UInt8*, pbcert : UInt8*, ppbshareddata : UInt8**) : HRESULT
    @lpVtbl.value.get_shared_data.unsafe_as(Proc(UInt32, UInt8*, UInt8*, UInt8**, HRESULT)).call(dwcertindex, pbshareddata, pbcert, ppbshareddata)
  end
  def wmsc_add_certificate(pcert : IWMAuthorizer) : HRESULT
    @lpVtbl.value.wmsc_add_certificate.unsafe_as(Proc(IWMAuthorizer, HRESULT)).call(pcert)
  end
  def wmsc_add_signature(pbcertsig : UInt8*, cbcertsig : UInt32) : HRESULT
    @lpVtbl.value.wmsc_add_signature.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pbcertsig, cbcertsig)
  end
  def wmsc_connect(potherside : IWMSecureChannel) : HRESULT
    @lpVtbl.value.wmsc_connect.unsafe_as(Proc(IWMSecureChannel, HRESULT)).call(potherside)
  end
  def wmsc_is_connected(pfisconnected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.wmsc_is_connected.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfisconnected)
  end
  def wmsc_disconnect : HRESULT
    @lpVtbl.value.wmsc_disconnect.unsafe_as(Proc(HRESULT)).call
  end
  def wmsc_get_valid_certificate(ppbcertificate : UInt8**, pdwsignature : UInt32*) : HRESULT
    @lpVtbl.value.wmsc_get_valid_certificate.unsafe_as(Proc(UInt8**, UInt32*, HRESULT)).call(ppbcertificate, pdwsignature)
  end
  def wmsc_encrypt(pbdata : UInt8*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.wmsc_encrypt.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pbdata, cbdata)
  end
  def wmsc_decrypt(pbdata : UInt8*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.wmsc_decrypt.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pbdata, cbdata)
  end
  def wmsc_lock : HRESULT
    @lpVtbl.value.wmsc_lock.unsafe_as(Proc(HRESULT)).call
  end
  def wmsc_unlock : HRESULT
    @lpVtbl.value.wmsc_unlock.unsafe_as(Proc(HRESULT)).call
  end
  def wmsc_set_shared_data(dwcertindex : UInt32, pbshareddata : UInt8*) : HRESULT
    @lpVtbl.value.wmsc_set_shared_data.unsafe_as(Proc(UInt32, UInt8*, HRESULT)).call(dwcertindex, pbshareddata)
  end
end
struct LibWin32::IWMGetSecureChannel
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_peer_secure_channel_interface(pppeer : IWMSecureChannel*) : HRESULT
    @lpVtbl.value.get_peer_secure_channel_interface.unsafe_as(Proc(IWMSecureChannel*, HRESULT)).call(pppeer)
  end
end
struct LibWin32::INSNetSourceCreator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HRESULT)).call
  end
  def create_net_source(pszstreamname : LibC::LPWSTR, pmonitor : IUnknown, pdata : UInt8*, pusercontext : IUnknown, pcallback : IUnknown, qwcontext : UInt64) : HRESULT
    @lpVtbl.value.create_net_source.unsafe_as(Proc(LibC::LPWSTR, IUnknown, UInt8*, IUnknown, IUnknown, UInt64, HRESULT)).call(pszstreamname, pmonitor, pdata, pusercontext, pcallback, qwcontext)
  end
  def get_net_source_properties(pszstreamname : LibC::LPWSTR, pppropertiesnode : IUnknown*) : HRESULT
    @lpVtbl.value.get_net_source_properties.unsafe_as(Proc(LibC::LPWSTR, IUnknown*, HRESULT)).call(pszstreamname, pppropertiesnode)
  end
  def get_net_source_shared_namespace(ppsharednamespace : IUnknown*) : HRESULT
    @lpVtbl.value.get_net_source_shared_namespace.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppsharednamespace)
  end
  def get_net_source_admin_interface(pszstreamname : LibC::LPWSTR, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_net_source_admin_interface.unsafe_as(Proc(LibC::LPWSTR, VARIANT*, HRESULT)).call(pszstreamname, pval)
  end
  def get_num_protocols_supported(pcprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_num_protocols_supported.unsafe_as(Proc(UInt32*, HRESULT)).call(pcprotocols)
  end
  def get_protocol_name(dwprotocolnum : UInt32, pwszprotocolname : LibC::LPWSTR, pcchprotocolname : UInt16*) : HRESULT
    @lpVtbl.value.get_protocol_name.unsafe_as(Proc(UInt32, LibC::LPWSTR, UInt16*, HRESULT)).call(dwprotocolnum, pwszprotocolname, pcchprotocolname)
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IWMPlayerTimestampHook
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def map_timestamp(rtin : Int64, prtout : Int64*) : HRESULT
    @lpVtbl.value.map_timestamp.unsafe_as(Proc(Int64, Int64*, HRESULT)).call(rtin, prtout)
  end
end
struct LibWin32::IWMCodecAMVideoAccelerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_accelerator_interface(piamva : IAMVideoAccelerator) : HRESULT
    @lpVtbl.value.set_accelerator_interface.unsafe_as(Proc(IAMVideoAccelerator, HRESULT)).call(piamva)
  end
  def negotiate_connection(pmediatype : AM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.negotiate_connection.unsafe_as(Proc(AM_MEDIA_TYPE*, HRESULT)).call(pmediatype)
  end
  def set_player_notify(phook : IWMPlayerTimestampHook) : HRESULT
    @lpVtbl.value.set_player_notify.unsafe_as(Proc(IWMPlayerTimestampHook, HRESULT)).call(phook)
  end
end
struct LibWin32::IWMCodecVideoAccelerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def negotiate_connection(piamva : IAMVideoAccelerator, pmediatype : AM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.negotiate_connection.unsafe_as(Proc(IAMVideoAccelerator, AM_MEDIA_TYPE*, HRESULT)).call(piamva, pmediatype)
  end
  def set_player_notify(phook : IWMPlayerTimestampHook) : HRESULT
    @lpVtbl.value.set_player_notify.unsafe_as(Proc(IWMPlayerTimestampHook, HRESULT)).call(phook)
  end
end
struct LibWin32::IWMSInternalAdminNetSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(psharednamespace : IUnknown, pnamespacenode : IUnknown, pnetsourcecreator : INSNetSourceCreator, fembeddedinserver : LibC::BOOL) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, IUnknown, INSNetSourceCreator, LibC::BOOL, HRESULT)).call(psharednamespace, pnamespacenode, pnetsourcecreator, fembeddedinserver)
  end
  def get_net_source_creator(ppnetsourcecreator : INSNetSourceCreator*) : HRESULT
    @lpVtbl.value.get_net_source_creator.unsafe_as(Proc(INSNetSourceCreator*, HRESULT)).call(ppnetsourcecreator)
  end
  def set_credentials(bstrrealm : UInt8*, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, HRESULT)).call(bstrrealm, bstrname, bstrpassword, fpersist, fconfirmedgood)
  end
  def get_credentials(bstrrealm : UInt8*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials.unsafe_as(Proc(UInt8*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)).call(bstrrealm, pbstrname, pbstrpassword, pfconfirmedgood)
  end
  def delete_credentials(bstrrealm : UInt8*) : HRESULT
    @lpVtbl.value.delete_credentials.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrrealm)
  end
  def get_credential_flags(lpdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_credential_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(lpdwflags)
  end
  def set_credential_flags(dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_credential_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def find_proxy_for_url(bstrprotocol : UInt8*, bstrhost : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pdwproxycontext : UInt32*) : HRESULT
    @lpVtbl.value.find_proxy_for_url.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt32*, HRESULT)).call(bstrprotocol, bstrhost, pfproxyenabled, pbstrproxyserver, pdwproxyport, pdwproxycontext)
  end
  def register_proxy_failure(hrparam : HRESULT, dwproxycontext : UInt32) : HRESULT
    @lpVtbl.value.register_proxy_failure.unsafe_as(Proc(HRESULT, UInt32, HRESULT)).call(hrparam, dwproxycontext)
  end
  def shutdown_proxy_context(dwproxycontext : UInt32) : HRESULT
    @lpVtbl.value.shutdown_proxy_context.unsafe_as(Proc(UInt32, HRESULT)).call(dwproxycontext)
  end
  def is_using_ie(dwproxycontext : UInt32, pfisusingie : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_ie.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwproxycontext, pfisusingie)
  end
end
struct LibWin32::IWMSInternalAdminNetSource2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_credentials_ex(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials_ex.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, HRESULT)).call(bstrrealm, bstrurl, fproxy, bstrname, bstrpassword, fpersist, fconfirmedgood)
  end
  def get_credentials_ex(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, pdwurlpolicy : NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials_ex.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)).call(bstrrealm, bstrurl, fproxy, pdwurlpolicy, pbstrname, pbstrpassword, pfconfirmedgood)
  end
  def delete_credentials_ex(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL) : HRESULT
    @lpVtbl.value.delete_credentials_ex.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, HRESULT)).call(bstrrealm, bstrurl, fproxy)
  end
  def find_proxy_for_url_ex(bstrprotocol : UInt8*, bstrhost : UInt8*, bstrurl : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pdwproxycontext : UInt32*) : HRESULT
    @lpVtbl.value.find_proxy_for_url_ex.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt32*, HRESULT)).call(bstrprotocol, bstrhost, bstrurl, pfproxyenabled, pbstrproxyserver, pdwproxyport, pdwproxycontext)
  end
end
struct LibWin32::IWMSInternalAdminNetSource3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_credentials_ex(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials_ex.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, HRESULT)).call(bstrrealm, bstrurl, fproxy, bstrname, bstrpassword, fpersist, fconfirmedgood)
  end
  def get_credentials_ex(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, pdwurlpolicy : NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials_ex.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)).call(bstrrealm, bstrurl, fproxy, pdwurlpolicy, pbstrname, pbstrpassword, pfconfirmedgood)
  end
  def delete_credentials_ex(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL) : HRESULT
    @lpVtbl.value.delete_credentials_ex.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, HRESULT)).call(bstrrealm, bstrurl, fproxy)
  end
  def find_proxy_for_url_ex(bstrprotocol : UInt8*, bstrhost : UInt8*, bstrurl : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pdwproxycontext : UInt32*) : HRESULT
    @lpVtbl.value.find_proxy_for_url_ex.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt32*, HRESULT)).call(bstrprotocol, bstrhost, bstrurl, pfproxyenabled, pbstrproxyserver, pdwproxyport, pdwproxycontext)
  end
  def get_net_source_creator2(ppnetsourcecreator : IUnknown*) : HRESULT
    @lpVtbl.value.get_net_source_creator2.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppnetsourcecreator)
  end
  def find_proxy_for_url_ex2(bstrprotocol : UInt8*, bstrhost : UInt8*, bstrurl : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pqwproxycontext : UInt64*) : HRESULT
    @lpVtbl.value.find_proxy_for_url_ex2.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt64*, HRESULT)).call(bstrprotocol, bstrhost, bstrurl, pfproxyenabled, pbstrproxyserver, pdwproxyport, pqwproxycontext)
  end
  def register_proxy_failure2(hrparam : HRESULT, qwproxycontext : UInt64) : HRESULT
    @lpVtbl.value.register_proxy_failure2.unsafe_as(Proc(HRESULT, UInt64, HRESULT)).call(hrparam, qwproxycontext)
  end
  def shutdown_proxy_context2(qwproxycontext : UInt64) : HRESULT
    @lpVtbl.value.shutdown_proxy_context2.unsafe_as(Proc(UInt64, HRESULT)).call(qwproxycontext)
  end
  def is_using_ie2(qwproxycontext : UInt64, pfisusingie : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_ie2.unsafe_as(Proc(UInt64, LibC::BOOL*, HRESULT)).call(qwproxycontext, pfisusingie)
  end
  def set_credentials_ex2(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL, fcleartextauthentication : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials_ex2.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)).call(bstrrealm, bstrurl, fproxy, bstrname, bstrpassword, fpersist, fconfirmedgood, fcleartextauthentication)
  end
  def get_credentials_ex2(bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, fcleartextauthentication : LibC::BOOL, pdwurlpolicy : NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials_ex2.unsafe_as(Proc(UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)).call(bstrrealm, bstrurl, fproxy, fcleartextauthentication, pdwurlpolicy, pbstrname, pbstrpassword, pfconfirmedgood)
  end
end
