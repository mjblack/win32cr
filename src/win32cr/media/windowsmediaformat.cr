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
    query_interface : Proc(IAMWMBufferPass*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAMWMBufferPass*, UInt32)
    release : Proc(IAMWMBufferPass*, UInt32)
    set_notify : Proc(IAMWMBufferPass*, IAMWMBufferPassCallback, HRESULT)
  end

  IAMWMBufferPass_GUID = LibC::GUID.new("6dd816d7-e740-4123-9e24-2444412644d8")
  CLSID_IAMWMBufferPass = "6dd816d7-e740-4123-9e24-2444412644d8"
  struct IAMWMBufferPass
    lpVtbl : IAMWMBufferPassVTbl*
  end

  struct IAMWMBufferPassCallbackVTbl
    query_interface : Proc(IAMWMBufferPassCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAMWMBufferPassCallback*, UInt32)
    release : Proc(IAMWMBufferPassCallback*, UInt32)
    notify : Proc(IAMWMBufferPassCallback*, INSSBuffer3, IPin, Int64*, Int64*, HRESULT)
  end

  IAMWMBufferPassCallback_GUID = LibC::GUID.new("b25b8372-d2d2-44b2-8653-1b8dae332489")
  CLSID_IAMWMBufferPassCallback = "b25b8372-d2d2-44b2-8653-1b8dae332489"
  struct IAMWMBufferPassCallback
    lpVtbl : IAMWMBufferPassCallbackVTbl*
  end

  struct INSSBufferVTbl
    query_interface : Proc(INSSBuffer*, Guid*, Void**, HRESULT)
    add_ref : Proc(INSSBuffer*, UInt32)
    release : Proc(INSSBuffer*, UInt32)
    get_length : Proc(INSSBuffer*, UInt32*, HRESULT)
    set_length : Proc(INSSBuffer*, UInt32, HRESULT)
    get_max_length : Proc(INSSBuffer*, UInt32*, HRESULT)
    get_buffer : Proc(INSSBuffer*, UInt8**, HRESULT)
    get_buffer_and_length : Proc(INSSBuffer*, UInt8**, UInt32*, HRESULT)
  end

  INSSBuffer_GUID = LibC::GUID.new("e1cd3524-03d7-11d2-9eed-006097d2d7cf")
  CLSID_INSSBuffer = "e1cd3524-03d7-11d2-9eed-006097d2d7cf"
  struct INSSBuffer
    lpVtbl : INSSBufferVTbl*
  end

  struct INSSBuffer2VTbl
    query_interface : Proc(INSSBuffer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(INSSBuffer2*, UInt32)
    release : Proc(INSSBuffer2*, UInt32)
    get_length : Proc(INSSBuffer2*, UInt32*, HRESULT)
    set_length : Proc(INSSBuffer2*, UInt32, HRESULT)
    get_max_length : Proc(INSSBuffer2*, UInt32*, HRESULT)
    get_buffer : Proc(INSSBuffer2*, UInt8**, HRESULT)
    get_buffer_and_length : Proc(INSSBuffer2*, UInt8**, UInt32*, HRESULT)
    get_sample_properties : Proc(INSSBuffer2*, UInt32, UInt8*, HRESULT)
    set_sample_properties : Proc(INSSBuffer2*, UInt32, UInt8*, HRESULT)
  end

  INSSBuffer2_GUID = LibC::GUID.new("4f528693-1035-43fe-b428-757561ad3a68")
  CLSID_INSSBuffer2 = "4f528693-1035-43fe-b428-757561ad3a68"
  struct INSSBuffer2
    lpVtbl : INSSBuffer2VTbl*
  end

  struct INSSBuffer3VTbl
    query_interface : Proc(INSSBuffer3*, Guid*, Void**, HRESULT)
    add_ref : Proc(INSSBuffer3*, UInt32)
    release : Proc(INSSBuffer3*, UInt32)
    get_length : Proc(INSSBuffer3*, UInt32*, HRESULT)
    set_length : Proc(INSSBuffer3*, UInt32, HRESULT)
    get_max_length : Proc(INSSBuffer3*, UInt32*, HRESULT)
    get_buffer : Proc(INSSBuffer3*, UInt8**, HRESULT)
    get_buffer_and_length : Proc(INSSBuffer3*, UInt8**, UInt32*, HRESULT)
    get_sample_properties : Proc(INSSBuffer3*, UInt32, UInt8*, HRESULT)
    set_sample_properties : Proc(INSSBuffer3*, UInt32, UInt8*, HRESULT)
    set_property : Proc(INSSBuffer3*, Guid, Void*, UInt32, HRESULT)
    get_property : Proc(INSSBuffer3*, Guid, Void*, UInt32*, HRESULT)
  end

  INSSBuffer3_GUID = LibC::GUID.new("c87ceaaf-75be-4bc4-84eb-ac2798507672")
  CLSID_INSSBuffer3 = "c87ceaaf-75be-4bc4-84eb-ac2798507672"
  struct INSSBuffer3
    lpVtbl : INSSBuffer3VTbl*
  end

  struct INSSBuffer4VTbl
    query_interface : Proc(INSSBuffer4*, Guid*, Void**, HRESULT)
    add_ref : Proc(INSSBuffer4*, UInt32)
    release : Proc(INSSBuffer4*, UInt32)
    get_length : Proc(INSSBuffer4*, UInt32*, HRESULT)
    set_length : Proc(INSSBuffer4*, UInt32, HRESULT)
    get_max_length : Proc(INSSBuffer4*, UInt32*, HRESULT)
    get_buffer : Proc(INSSBuffer4*, UInt8**, HRESULT)
    get_buffer_and_length : Proc(INSSBuffer4*, UInt8**, UInt32*, HRESULT)
    get_sample_properties : Proc(INSSBuffer4*, UInt32, UInt8*, HRESULT)
    set_sample_properties : Proc(INSSBuffer4*, UInt32, UInt8*, HRESULT)
    set_property : Proc(INSSBuffer4*, Guid, Void*, UInt32, HRESULT)
    get_property : Proc(INSSBuffer4*, Guid, Void*, UInt32*, HRESULT)
    get_property_count : Proc(INSSBuffer4*, UInt32*, HRESULT)
    get_property_by_index : Proc(INSSBuffer4*, UInt32, Guid*, Void*, UInt32*, HRESULT)
  end

  INSSBuffer4_GUID = LibC::GUID.new("b6b8fd5a-32e2-49d4-a910-c26cc85465ed")
  CLSID_INSSBuffer4 = "b6b8fd5a-32e2-49d4-a910-c26cc85465ed"
  struct INSSBuffer4
    lpVtbl : INSSBuffer4VTbl*
  end

  struct IWMSBufferAllocatorVTbl
    query_interface : Proc(IWMSBufferAllocator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSBufferAllocator*, UInt32)
    release : Proc(IWMSBufferAllocator*, UInt32)
    allocate_buffer : Proc(IWMSBufferAllocator*, UInt32, INSSBuffer*, HRESULT)
    allocate_page_size_buffer : Proc(IWMSBufferAllocator*, UInt32, INSSBuffer*, HRESULT)
  end

  IWMSBufferAllocator_GUID = LibC::GUID.new("61103ca4-2033-11d2-9ef1-006097d2d7cf")
  CLSID_IWMSBufferAllocator = "61103ca4-2033-11d2-9ef1-006097d2d7cf"
  struct IWMSBufferAllocator
    lpVtbl : IWMSBufferAllocatorVTbl*
  end

  struct IWMMediaPropsVTbl
    query_interface : Proc(IWMMediaProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMMediaProps*, UInt32)
    release : Proc(IWMMediaProps*, UInt32)
    get_type : Proc(IWMMediaProps*, Guid*, HRESULT)
    get_media_type : Proc(IWMMediaProps*, WM_MEDIA_TYPE*, UInt32*, HRESULT)
    set_media_type : Proc(IWMMediaProps*, WM_MEDIA_TYPE*, HRESULT)
  end

  IWMMediaProps_GUID = LibC::GUID.new("96406bce-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMMediaProps = "96406bce-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMMediaProps
    lpVtbl : IWMMediaPropsVTbl*
  end

  struct IWMVideoMediaPropsVTbl
    query_interface : Proc(IWMVideoMediaProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMVideoMediaProps*, UInt32)
    release : Proc(IWMVideoMediaProps*, UInt32)
    get_type : Proc(IWMVideoMediaProps*, Guid*, HRESULT)
    get_media_type : Proc(IWMVideoMediaProps*, WM_MEDIA_TYPE*, UInt32*, HRESULT)
    set_media_type : Proc(IWMVideoMediaProps*, WM_MEDIA_TYPE*, HRESULT)
    get_max_key_frame_spacing : Proc(IWMVideoMediaProps*, Int64*, HRESULT)
    set_max_key_frame_spacing : Proc(IWMVideoMediaProps*, Int64, HRESULT)
    get_quality : Proc(IWMVideoMediaProps*, UInt32*, HRESULT)
    set_quality : Proc(IWMVideoMediaProps*, UInt32, HRESULT)
  end

  IWMVideoMediaProps_GUID = LibC::GUID.new("96406bcf-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMVideoMediaProps = "96406bcf-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMVideoMediaProps
    lpVtbl : IWMVideoMediaPropsVTbl*
  end

  struct IWMWriterVTbl
    query_interface : Proc(IWMWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriter*, UInt32)
    release : Proc(IWMWriter*, UInt32)
    set_profile_by_id : Proc(IWMWriter*, Guid*, HRESULT)
    set_profile : Proc(IWMWriter*, IWMProfile, HRESULT)
    set_output_filename : Proc(IWMWriter*, LibC::LPWSTR, HRESULT)
    get_input_count : Proc(IWMWriter*, UInt32*, HRESULT)
    get_input_props : Proc(IWMWriter*, UInt32, IWMInputMediaProps*, HRESULT)
    set_input_props : Proc(IWMWriter*, UInt32, IWMInputMediaProps, HRESULT)
    get_input_format_count : Proc(IWMWriter*, UInt32, UInt32*, HRESULT)
    get_input_format : Proc(IWMWriter*, UInt32, UInt32, IWMInputMediaProps*, HRESULT)
    begin_writing : Proc(IWMWriter*, HRESULT)
    end_writing : Proc(IWMWriter*, HRESULT)
    allocate_sample : Proc(IWMWriter*, UInt32, INSSBuffer*, HRESULT)
    write_sample : Proc(IWMWriter*, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)
    flush : Proc(IWMWriter*, HRESULT)
  end

  IWMWriter_GUID = LibC::GUID.new("96406bd4-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMWriter = "96406bd4-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMWriter
    lpVtbl : IWMWriterVTbl*
  end

  struct IWMDRMWriterVTbl
    query_interface : Proc(IWMDRMWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMWriter*, UInt32)
    release : Proc(IWMDRMWriter*, UInt32)
    generate_key_seed : Proc(IWMDRMWriter*, Char*, UInt32*, HRESULT)
    generate_key_id : Proc(IWMDRMWriter*, Char*, UInt32*, HRESULT)
    generate_signing_key_pair : Proc(IWMDRMWriter*, Char*, UInt32*, Char*, UInt32*, HRESULT)
    set_drm_attribute : Proc(IWMDRMWriter*, UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
  end

  IWMDRMWriter_GUID = LibC::GUID.new("d6ea5dd0-12a0-43f4-90ab-a3fd451e6a07")
  CLSID_IWMDRMWriter = "d6ea5dd0-12a0-43f4-90ab-a3fd451e6a07"
  struct IWMDRMWriter
    lpVtbl : IWMDRMWriterVTbl*
  end

  struct IWMDRMWriter2VTbl
    query_interface : Proc(IWMDRMWriter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMWriter2*, UInt32)
    release : Proc(IWMDRMWriter2*, UInt32)
    generate_key_seed : Proc(IWMDRMWriter2*, Char*, UInt32*, HRESULT)
    generate_key_id : Proc(IWMDRMWriter2*, Char*, UInt32*, HRESULT)
    generate_signing_key_pair : Proc(IWMDRMWriter2*, Char*, UInt32*, Char*, UInt32*, HRESULT)
    set_drm_attribute : Proc(IWMDRMWriter2*, UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    set_wmdrm_net_encryption : Proc(IWMDRMWriter2*, LibC::BOOL, UInt8*, UInt32, HRESULT)
  end

  IWMDRMWriter2_GUID = LibC::GUID.new("38ee7a94-40e2-4e10-aa3f-33fd3210ed5b")
  CLSID_IWMDRMWriter2 = "38ee7a94-40e2-4e10-aa3f-33fd3210ed5b"
  struct IWMDRMWriter2
    lpVtbl : IWMDRMWriter2VTbl*
  end

  struct IWMDRMWriter3VTbl
    query_interface : Proc(IWMDRMWriter3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMWriter3*, UInt32)
    release : Proc(IWMDRMWriter3*, UInt32)
    generate_key_seed : Proc(IWMDRMWriter3*, Char*, UInt32*, HRESULT)
    generate_key_id : Proc(IWMDRMWriter3*, Char*, UInt32*, HRESULT)
    generate_signing_key_pair : Proc(IWMDRMWriter3*, Char*, UInt32*, Char*, UInt32*, HRESULT)
    set_drm_attribute : Proc(IWMDRMWriter3*, UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    set_wmdrm_net_encryption : Proc(IWMDRMWriter3*, LibC::BOOL, UInt8*, UInt32, HRESULT)
    set_protect_stream_samples : Proc(IWMDRMWriter3*, WMDRM_IMPORT_INIT_STRUCT*, HRESULT)
  end

  IWMDRMWriter3_GUID = LibC::GUID.new("a7184082-a4aa-4dde-ac9c-e75dbd1117ce")
  CLSID_IWMDRMWriter3 = "a7184082-a4aa-4dde-ac9c-e75dbd1117ce"
  struct IWMDRMWriter3
    lpVtbl : IWMDRMWriter3VTbl*
  end

  struct IWMInputMediaPropsVTbl
    query_interface : Proc(IWMInputMediaProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMInputMediaProps*, UInt32)
    release : Proc(IWMInputMediaProps*, UInt32)
    get_type : Proc(IWMInputMediaProps*, Guid*, HRESULT)
    get_media_type : Proc(IWMInputMediaProps*, WM_MEDIA_TYPE*, UInt32*, HRESULT)
    set_media_type : Proc(IWMInputMediaProps*, WM_MEDIA_TYPE*, HRESULT)
    get_connection_name : Proc(IWMInputMediaProps*, Char*, UInt16*, HRESULT)
    get_group_name : Proc(IWMInputMediaProps*, Char*, UInt16*, HRESULT)
  end

  IWMInputMediaProps_GUID = LibC::GUID.new("96406bd5-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMInputMediaProps = "96406bd5-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMInputMediaProps
    lpVtbl : IWMInputMediaPropsVTbl*
  end

  struct IWMPropertyVaultVTbl
    query_interface : Proc(IWMPropertyVault*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPropertyVault*, UInt32)
    release : Proc(IWMPropertyVault*, UInt32)
    get_property_count : Proc(IWMPropertyVault*, UInt32*, HRESULT)
    get_property_by_name : Proc(IWMPropertyVault*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
    set_property : Proc(IWMPropertyVault*, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt32, HRESULT)
    get_property_by_index : Proc(IWMPropertyVault*, UInt32, Char*, UInt32*, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
    copy_properties_from : Proc(IWMPropertyVault*, IWMPropertyVault, HRESULT)
    clear : Proc(IWMPropertyVault*, HRESULT)
  end

  IWMPropertyVault_GUID = LibC::GUID.new("72995a79-5090-42a4-9c8c-d9d0b6d34be5")
  CLSID_IWMPropertyVault = "72995a79-5090-42a4-9c8c-d9d0b6d34be5"
  struct IWMPropertyVault
    lpVtbl : IWMPropertyVaultVTbl*
  end

  struct IWMIStreamPropsVTbl
    query_interface : Proc(IWMIStreamProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMIStreamProps*, UInt32)
    release : Proc(IWMIStreamProps*, UInt32)
    get_property : Proc(IWMIStreamProps*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
  end

  IWMIStreamProps_GUID = LibC::GUID.new("6816dad3-2b4b-4c8e-8149-874c3483a753")
  CLSID_IWMIStreamProps = "6816dad3-2b4b-4c8e-8149-874c3483a753"
  struct IWMIStreamProps
    lpVtbl : IWMIStreamPropsVTbl*
  end

  struct IWMReaderVTbl
    query_interface : Proc(IWMReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReader*, UInt32)
    release : Proc(IWMReader*, UInt32)
    open : Proc(IWMReader*, LibC::LPWSTR, IWMReaderCallback, Void*, HRESULT)
    close : Proc(IWMReader*, HRESULT)
    get_output_count : Proc(IWMReader*, UInt32*, HRESULT)
    get_output_props : Proc(IWMReader*, UInt32, IWMOutputMediaProps*, HRESULT)
    set_output_props : Proc(IWMReader*, UInt32, IWMOutputMediaProps, HRESULT)
    get_output_format_count : Proc(IWMReader*, UInt32, UInt32*, HRESULT)
    get_output_format : Proc(IWMReader*, UInt32, UInt32, IWMOutputMediaProps*, HRESULT)
    start : Proc(IWMReader*, UInt64, UInt64, Float32, Void*, HRESULT)
    stop : Proc(IWMReader*, HRESULT)
    pause : Proc(IWMReader*, HRESULT)
    resume : Proc(IWMReader*, HRESULT)
  end

  IWMReader_GUID = LibC::GUID.new("96406bd6-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMReader = "96406bd6-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMReader
    lpVtbl : IWMReaderVTbl*
  end

  struct IWMSyncReaderVTbl
    query_interface : Proc(IWMSyncReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSyncReader*, UInt32)
    release : Proc(IWMSyncReader*, UInt32)
    open : Proc(IWMSyncReader*, LibC::LPWSTR, HRESULT)
    close : Proc(IWMSyncReader*, HRESULT)
    set_range : Proc(IWMSyncReader*, UInt64, Int64, HRESULT)
    set_range_by_frame : Proc(IWMSyncReader*, UInt16, UInt64, Int64, HRESULT)
    get_next_sample : Proc(IWMSyncReader*, UInt16, INSSBuffer*, UInt64*, UInt64*, UInt32*, UInt32*, UInt16*, HRESULT)
    set_streams_selected : Proc(IWMSyncReader*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMSyncReader*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_read_stream_samples : Proc(IWMSyncReader*, UInt16, LibC::BOOL, HRESULT)
    get_read_stream_samples : Proc(IWMSyncReader*, UInt16, LibC::BOOL*, HRESULT)
    get_output_setting : Proc(IWMSyncReader*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMSyncReader*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_output_count : Proc(IWMSyncReader*, UInt32*, HRESULT)
    get_output_props : Proc(IWMSyncReader*, UInt32, IWMOutputMediaProps*, HRESULT)
    set_output_props : Proc(IWMSyncReader*, UInt32, IWMOutputMediaProps, HRESULT)
    get_output_format_count : Proc(IWMSyncReader*, UInt32, UInt32*, HRESULT)
    get_output_format : Proc(IWMSyncReader*, UInt32, UInt32, IWMOutputMediaProps*, HRESULT)
    get_output_number_for_stream : Proc(IWMSyncReader*, UInt16, UInt32*, HRESULT)
    get_stream_number_for_output : Proc(IWMSyncReader*, UInt32, UInt16*, HRESULT)
    get_max_output_sample_size : Proc(IWMSyncReader*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMSyncReader*, UInt16, UInt32*, HRESULT)
    open_stream : Proc(IWMSyncReader*, IStream, HRESULT)
  end

  IWMSyncReader_GUID = LibC::GUID.new("9397f121-7705-4dc9-b049-98b698188414")
  CLSID_IWMSyncReader = "9397f121-7705-4dc9-b049-98b698188414"
  struct IWMSyncReader
    lpVtbl : IWMSyncReaderVTbl*
  end

  struct IWMSyncReader2VTbl
    query_interface : Proc(IWMSyncReader2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSyncReader2*, UInt32)
    release : Proc(IWMSyncReader2*, UInt32)
    open : Proc(IWMSyncReader2*, LibC::LPWSTR, HRESULT)
    close : Proc(IWMSyncReader2*, HRESULT)
    set_range : Proc(IWMSyncReader2*, UInt64, Int64, HRESULT)
    set_range_by_frame : Proc(IWMSyncReader2*, UInt16, UInt64, Int64, HRESULT)
    get_next_sample : Proc(IWMSyncReader2*, UInt16, INSSBuffer*, UInt64*, UInt64*, UInt32*, UInt32*, UInt16*, HRESULT)
    set_streams_selected : Proc(IWMSyncReader2*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMSyncReader2*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_read_stream_samples : Proc(IWMSyncReader2*, UInt16, LibC::BOOL, HRESULT)
    get_read_stream_samples : Proc(IWMSyncReader2*, UInt16, LibC::BOOL*, HRESULT)
    get_output_setting : Proc(IWMSyncReader2*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMSyncReader2*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_output_count : Proc(IWMSyncReader2*, UInt32*, HRESULT)
    get_output_props : Proc(IWMSyncReader2*, UInt32, IWMOutputMediaProps*, HRESULT)
    set_output_props : Proc(IWMSyncReader2*, UInt32, IWMOutputMediaProps, HRESULT)
    get_output_format_count : Proc(IWMSyncReader2*, UInt32, UInt32*, HRESULT)
    get_output_format : Proc(IWMSyncReader2*, UInt32, UInt32, IWMOutputMediaProps*, HRESULT)
    get_output_number_for_stream : Proc(IWMSyncReader2*, UInt16, UInt32*, HRESULT)
    get_stream_number_for_output : Proc(IWMSyncReader2*, UInt32, UInt16*, HRESULT)
    get_max_output_sample_size : Proc(IWMSyncReader2*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMSyncReader2*, UInt16, UInt32*, HRESULT)
    open_stream : Proc(IWMSyncReader2*, IStream, HRESULT)
    set_range_by_timecode : Proc(IWMSyncReader2*, UInt16, WMT_TIMECODE_EXTENSION_DATA*, WMT_TIMECODE_EXTENSION_DATA*, HRESULT)
    set_range_by_frame_ex : Proc(IWMSyncReader2*, UInt16, UInt64, Int64, UInt64*, HRESULT)
    set_allocate_for_output : Proc(IWMSyncReader2*, UInt32, IWMReaderAllocatorEx, HRESULT)
    get_allocate_for_output : Proc(IWMSyncReader2*, UInt32, IWMReaderAllocatorEx*, HRESULT)
    set_allocate_for_stream : Proc(IWMSyncReader2*, UInt16, IWMReaderAllocatorEx, HRESULT)
    get_allocate_for_stream : Proc(IWMSyncReader2*, UInt16, IWMReaderAllocatorEx*, HRESULT)
  end

  IWMSyncReader2_GUID = LibC::GUID.new("faed3d21-1b6b-4af7-8cb6-3e189bbc187b")
  CLSID_IWMSyncReader2 = "faed3d21-1b6b-4af7-8cb6-3e189bbc187b"
  struct IWMSyncReader2
    lpVtbl : IWMSyncReader2VTbl*
  end

  struct IWMOutputMediaPropsVTbl
    query_interface : Proc(IWMOutputMediaProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMOutputMediaProps*, UInt32)
    release : Proc(IWMOutputMediaProps*, UInt32)
    get_type : Proc(IWMOutputMediaProps*, Guid*, HRESULT)
    get_media_type : Proc(IWMOutputMediaProps*, WM_MEDIA_TYPE*, UInt32*, HRESULT)
    set_media_type : Proc(IWMOutputMediaProps*, WM_MEDIA_TYPE*, HRESULT)
    get_stream_group_name : Proc(IWMOutputMediaProps*, Char*, UInt16*, HRESULT)
    get_connection_name : Proc(IWMOutputMediaProps*, Char*, UInt16*, HRESULT)
  end

  IWMOutputMediaProps_GUID = LibC::GUID.new("96406bd7-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMOutputMediaProps = "96406bd7-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMOutputMediaProps
    lpVtbl : IWMOutputMediaPropsVTbl*
  end

  struct IWMStatusCallbackVTbl
    query_interface : Proc(IWMStatusCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStatusCallback*, UInt32)
    release : Proc(IWMStatusCallback*, UInt32)
    on_status : Proc(IWMStatusCallback*, WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)
  end

  IWMStatusCallback_GUID = LibC::GUID.new("6d7cdc70-9888-11d3-8edc-00c04f6109cf")
  CLSID_IWMStatusCallback = "6d7cdc70-9888-11d3-8edc-00c04f6109cf"
  struct IWMStatusCallback
    lpVtbl : IWMStatusCallbackVTbl*
  end

  struct IWMReaderCallbackVTbl
    query_interface : Proc(IWMReaderCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderCallback*, UInt32)
    release : Proc(IWMReaderCallback*, UInt32)
    on_status : Proc(IWMReaderCallback*, WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)
    on_sample : Proc(IWMReaderCallback*, UInt32, UInt64, UInt64, UInt32, INSSBuffer, Void*, HRESULT)
  end

  IWMReaderCallback_GUID = LibC::GUID.new("96406bd8-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMReaderCallback = "96406bd8-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMReaderCallback
    lpVtbl : IWMReaderCallbackVTbl*
  end

  struct IWMCredentialCallbackVTbl
    query_interface : Proc(IWMCredentialCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCredentialCallback*, UInt32)
    release : Proc(IWMCredentialCallback*, UInt32)
    acquire_credentials : Proc(IWMCredentialCallback*, LibC::LPWSTR, LibC::LPWSTR, Char*, UInt32, Char*, UInt32, HRESULT, UInt32*, HRESULT)
  end

  IWMCredentialCallback_GUID = LibC::GUID.new("342e0eb7-e651-450c-975b-2ace2c90c48e")
  CLSID_IWMCredentialCallback = "342e0eb7-e651-450c-975b-2ace2c90c48e"
  struct IWMCredentialCallback
    lpVtbl : IWMCredentialCallbackVTbl*
  end

  struct IWMMetadataEditorVTbl
    query_interface : Proc(IWMMetadataEditor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMMetadataEditor*, UInt32)
    release : Proc(IWMMetadataEditor*, UInt32)
    open : Proc(IWMMetadataEditor*, LibC::LPWSTR, HRESULT)
    close : Proc(IWMMetadataEditor*, HRESULT)
    flush : Proc(IWMMetadataEditor*, HRESULT)
  end

  IWMMetadataEditor_GUID = LibC::GUID.new("96406bd9-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMMetadataEditor = "96406bd9-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMMetadataEditor
    lpVtbl : IWMMetadataEditorVTbl*
  end

  struct IWMMetadataEditor2VTbl
    query_interface : Proc(IWMMetadataEditor2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMMetadataEditor2*, UInt32)
    release : Proc(IWMMetadataEditor2*, UInt32)
    open : Proc(IWMMetadataEditor2*, LibC::LPWSTR, HRESULT)
    close : Proc(IWMMetadataEditor2*, HRESULT)
    flush : Proc(IWMMetadataEditor2*, HRESULT)
    open_ex : Proc(IWMMetadataEditor2*, LibC::LPWSTR, UInt32, UInt32, HRESULT)
  end

  IWMMetadataEditor2_GUID = LibC::GUID.new("203cffe3-2e18-4fdf-b59d-6e71530534cf")
  CLSID_IWMMetadataEditor2 = "203cffe3-2e18-4fdf-b59d-6e71530534cf"
  struct IWMMetadataEditor2
    lpVtbl : IWMMetadataEditor2VTbl*
  end

  struct IWMDRMEditorVTbl
    query_interface : Proc(IWMDRMEditor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMEditor*, UInt32)
    release : Proc(IWMDRMEditor*, UInt32)
    get_drm_property : Proc(IWMDRMEditor*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
  end

  IWMDRMEditor_GUID = LibC::GUID.new("ff130ebc-a6c3-42a6-b401-c3382c3e08b3")
  CLSID_IWMDRMEditor = "ff130ebc-a6c3-42a6-b401-c3382c3e08b3"
  struct IWMDRMEditor
    lpVtbl : IWMDRMEditorVTbl*
  end

  struct IWMHeaderInfoVTbl
    query_interface : Proc(IWMHeaderInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMHeaderInfo*, UInt32)
    release : Proc(IWMHeaderInfo*, UInt32)
    get_attribute_count : Proc(IWMHeaderInfo*, UInt16, UInt16*, HRESULT)
    get_attribute_by_index : Proc(IWMHeaderInfo*, UInt16, UInt16*, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    get_attribute_by_name : Proc(IWMHeaderInfo*, UInt16*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_attribute : Proc(IWMHeaderInfo*, UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_marker_count : Proc(IWMHeaderInfo*, UInt16*, HRESULT)
    get_marker : Proc(IWMHeaderInfo*, UInt16, Char*, UInt16*, UInt64*, HRESULT)
    add_marker : Proc(IWMHeaderInfo*, LibC::LPWSTR, UInt64, HRESULT)
    remove_marker : Proc(IWMHeaderInfo*, UInt16, HRESULT)
    get_script_count : Proc(IWMHeaderInfo*, UInt16*, HRESULT)
    get_script : Proc(IWMHeaderInfo*, UInt16, Char*, UInt16*, Char*, UInt16*, UInt64*, HRESULT)
    add_script : Proc(IWMHeaderInfo*, LibC::LPWSTR, LibC::LPWSTR, UInt64, HRESULT)
    remove_script : Proc(IWMHeaderInfo*, UInt16, HRESULT)
  end

  IWMHeaderInfo_GUID = LibC::GUID.new("96406bda-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMHeaderInfo = "96406bda-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMHeaderInfo
    lpVtbl : IWMHeaderInfoVTbl*
  end

  struct IWMHeaderInfo2VTbl
    query_interface : Proc(IWMHeaderInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMHeaderInfo2*, UInt32)
    release : Proc(IWMHeaderInfo2*, UInt32)
    get_attribute_count : Proc(IWMHeaderInfo2*, UInt16, UInt16*, HRESULT)
    get_attribute_by_index : Proc(IWMHeaderInfo2*, UInt16, UInt16*, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    get_attribute_by_name : Proc(IWMHeaderInfo2*, UInt16*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_attribute : Proc(IWMHeaderInfo2*, UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_marker_count : Proc(IWMHeaderInfo2*, UInt16*, HRESULT)
    get_marker : Proc(IWMHeaderInfo2*, UInt16, Char*, UInt16*, UInt64*, HRESULT)
    add_marker : Proc(IWMHeaderInfo2*, LibC::LPWSTR, UInt64, HRESULT)
    remove_marker : Proc(IWMHeaderInfo2*, UInt16, HRESULT)
    get_script_count : Proc(IWMHeaderInfo2*, UInt16*, HRESULT)
    get_script : Proc(IWMHeaderInfo2*, UInt16, Char*, UInt16*, Char*, UInt16*, UInt64*, HRESULT)
    add_script : Proc(IWMHeaderInfo2*, LibC::LPWSTR, LibC::LPWSTR, UInt64, HRESULT)
    remove_script : Proc(IWMHeaderInfo2*, UInt16, HRESULT)
    get_codec_info_count : Proc(IWMHeaderInfo2*, UInt32*, HRESULT)
    get_codec_info : Proc(IWMHeaderInfo2*, UInt32, UInt16*, Char*, UInt16*, Char*, WMT_CODEC_INFO_TYPE*, UInt16*, UInt8*, HRESULT)
  end

  IWMHeaderInfo2_GUID = LibC::GUID.new("15cf9781-454e-482e-b393-85fae487a810")
  CLSID_IWMHeaderInfo2 = "15cf9781-454e-482e-b393-85fae487a810"
  struct IWMHeaderInfo2
    lpVtbl : IWMHeaderInfo2VTbl*
  end

  struct IWMHeaderInfo3VTbl
    query_interface : Proc(IWMHeaderInfo3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMHeaderInfo3*, UInt32)
    release : Proc(IWMHeaderInfo3*, UInt32)
    get_attribute_count : Proc(IWMHeaderInfo3*, UInt16, UInt16*, HRESULT)
    get_attribute_by_index : Proc(IWMHeaderInfo3*, UInt16, UInt16*, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    get_attribute_by_name : Proc(IWMHeaderInfo3*, UInt16*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_attribute : Proc(IWMHeaderInfo3*, UInt16, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_marker_count : Proc(IWMHeaderInfo3*, UInt16*, HRESULT)
    get_marker : Proc(IWMHeaderInfo3*, UInt16, Char*, UInt16*, UInt64*, HRESULT)
    add_marker : Proc(IWMHeaderInfo3*, LibC::LPWSTR, UInt64, HRESULT)
    remove_marker : Proc(IWMHeaderInfo3*, UInt16, HRESULT)
    get_script_count : Proc(IWMHeaderInfo3*, UInt16*, HRESULT)
    get_script : Proc(IWMHeaderInfo3*, UInt16, Char*, UInt16*, Char*, UInt16*, UInt64*, HRESULT)
    add_script : Proc(IWMHeaderInfo3*, LibC::LPWSTR, LibC::LPWSTR, UInt64, HRESULT)
    remove_script : Proc(IWMHeaderInfo3*, UInt16, HRESULT)
    get_codec_info_count : Proc(IWMHeaderInfo3*, UInt32*, HRESULT)
    get_codec_info : Proc(IWMHeaderInfo3*, UInt32, UInt16*, Char*, UInt16*, Char*, WMT_CODEC_INFO_TYPE*, UInt16*, UInt8*, HRESULT)
    get_attribute_count_ex : Proc(IWMHeaderInfo3*, UInt16, UInt16*, HRESULT)
    get_attribute_indices : Proc(IWMHeaderInfo3*, UInt16, LibC::LPWSTR, UInt16*, UInt16*, UInt16*, HRESULT)
    get_attribute_by_index_ex : Proc(IWMHeaderInfo3*, UInt16, UInt16, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt16*, UInt8*, UInt32*, HRESULT)
    modify_attribute : Proc(IWMHeaderInfo3*, UInt16, UInt16, WMT_ATTR_DATATYPE, UInt16, UInt8*, UInt32, HRESULT)
    add_attribute : Proc(IWMHeaderInfo3*, UInt16, LibC::LPWSTR, UInt16*, WMT_ATTR_DATATYPE, UInt16, UInt8*, UInt32, HRESULT)
    delete_attribute : Proc(IWMHeaderInfo3*, UInt16, UInt16, HRESULT)
    add_codec_info : Proc(IWMHeaderInfo3*, LibC::LPWSTR, LibC::LPWSTR, WMT_CODEC_INFO_TYPE, UInt16, UInt8*, HRESULT)
  end

  IWMHeaderInfo3_GUID = LibC::GUID.new("15cc68e3-27cc-4ecd-b222-3f5d02d80bd5")
  CLSID_IWMHeaderInfo3 = "15cc68e3-27cc-4ecd-b222-3f5d02d80bd5"
  struct IWMHeaderInfo3
    lpVtbl : IWMHeaderInfo3VTbl*
  end

  struct IWMProfileManagerVTbl
    query_interface : Proc(IWMProfileManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProfileManager*, UInt32)
    release : Proc(IWMProfileManager*, UInt32)
    create_empty_profile : Proc(IWMProfileManager*, WMT_VERSION, IWMProfile*, HRESULT)
    load_profile_by_id : Proc(IWMProfileManager*, Guid*, IWMProfile*, HRESULT)
    load_profile_by_data : Proc(IWMProfileManager*, LibC::LPWSTR, IWMProfile*, HRESULT)
    save_profile : Proc(IWMProfileManager*, IWMProfile, LibC::LPWSTR, UInt32*, HRESULT)
    get_system_profile_count : Proc(IWMProfileManager*, UInt32*, HRESULT)
    load_system_profile : Proc(IWMProfileManager*, UInt32, IWMProfile*, HRESULT)
  end

  IWMProfileManager_GUID = LibC::GUID.new("d16679f2-6ca0-472d-8d31-2f5d55aee155")
  CLSID_IWMProfileManager = "d16679f2-6ca0-472d-8d31-2f5d55aee155"
  struct IWMProfileManager
    lpVtbl : IWMProfileManagerVTbl*
  end

  struct IWMProfileManager2VTbl
    query_interface : Proc(IWMProfileManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProfileManager2*, UInt32)
    release : Proc(IWMProfileManager2*, UInt32)
    create_empty_profile : Proc(IWMProfileManager2*, WMT_VERSION, IWMProfile*, HRESULT)
    load_profile_by_id : Proc(IWMProfileManager2*, Guid*, IWMProfile*, HRESULT)
    load_profile_by_data : Proc(IWMProfileManager2*, LibC::LPWSTR, IWMProfile*, HRESULT)
    save_profile : Proc(IWMProfileManager2*, IWMProfile, LibC::LPWSTR, UInt32*, HRESULT)
    get_system_profile_count : Proc(IWMProfileManager2*, UInt32*, HRESULT)
    load_system_profile : Proc(IWMProfileManager2*, UInt32, IWMProfile*, HRESULT)
    get_system_profile_version : Proc(IWMProfileManager2*, WMT_VERSION*, HRESULT)
    set_system_profile_version : Proc(IWMProfileManager2*, WMT_VERSION, HRESULT)
  end

  IWMProfileManager2_GUID = LibC::GUID.new("7a924e51-73c1-494d-8019-23d37ed9b89a")
  CLSID_IWMProfileManager2 = "7a924e51-73c1-494d-8019-23d37ed9b89a"
  struct IWMProfileManager2
    lpVtbl : IWMProfileManager2VTbl*
  end

  struct IWMProfileManagerLanguageVTbl
    query_interface : Proc(IWMProfileManagerLanguage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProfileManagerLanguage*, UInt32)
    release : Proc(IWMProfileManagerLanguage*, UInt32)
    get_user_language_id : Proc(IWMProfileManagerLanguage*, UInt16*, HRESULT)
    set_user_language_id : Proc(IWMProfileManagerLanguage*, UInt16, HRESULT)
  end

  IWMProfileManagerLanguage_GUID = LibC::GUID.new("ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454")
  CLSID_IWMProfileManagerLanguage = "ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454"
  struct IWMProfileManagerLanguage
    lpVtbl : IWMProfileManagerLanguageVTbl*
  end

  struct IWMProfileVTbl
    query_interface : Proc(IWMProfile*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProfile*, UInt32)
    release : Proc(IWMProfile*, UInt32)
    get_version : Proc(IWMProfile*, WMT_VERSION*, HRESULT)
    get_name : Proc(IWMProfile*, Char*, UInt32*, HRESULT)
    set_name : Proc(IWMProfile*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IWMProfile*, Char*, UInt32*, HRESULT)
    set_description : Proc(IWMProfile*, LibC::LPWSTR, HRESULT)
    get_stream_count : Proc(IWMProfile*, UInt32*, HRESULT)
    get_stream : Proc(IWMProfile*, UInt32, IWMStreamConfig*, HRESULT)
    get_stream_by_number : Proc(IWMProfile*, UInt16, IWMStreamConfig*, HRESULT)
    remove_stream : Proc(IWMProfile*, IWMStreamConfig, HRESULT)
    remove_stream_by_number : Proc(IWMProfile*, UInt16, HRESULT)
    add_stream : Proc(IWMProfile*, IWMStreamConfig, HRESULT)
    reconfig_stream : Proc(IWMProfile*, IWMStreamConfig, HRESULT)
    create_new_stream : Proc(IWMProfile*, Guid*, IWMStreamConfig*, HRESULT)
    get_mutual_exclusion_count : Proc(IWMProfile*, UInt32*, HRESULT)
    get_mutual_exclusion : Proc(IWMProfile*, UInt32, IWMMutualExclusion*, HRESULT)
    remove_mutual_exclusion : Proc(IWMProfile*, IWMMutualExclusion, HRESULT)
    add_mutual_exclusion : Proc(IWMProfile*, IWMMutualExclusion, HRESULT)
    create_new_mutual_exclusion : Proc(IWMProfile*, IWMMutualExclusion*, HRESULT)
  end

  IWMProfile_GUID = LibC::GUID.new("96406bdb-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMProfile = "96406bdb-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMProfile
    lpVtbl : IWMProfileVTbl*
  end

  struct IWMProfile2VTbl
    query_interface : Proc(IWMProfile2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProfile2*, UInt32)
    release : Proc(IWMProfile2*, UInt32)
    get_version : Proc(IWMProfile2*, WMT_VERSION*, HRESULT)
    get_name : Proc(IWMProfile2*, Char*, UInt32*, HRESULT)
    set_name : Proc(IWMProfile2*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IWMProfile2*, Char*, UInt32*, HRESULT)
    set_description : Proc(IWMProfile2*, LibC::LPWSTR, HRESULT)
    get_stream_count : Proc(IWMProfile2*, UInt32*, HRESULT)
    get_stream : Proc(IWMProfile2*, UInt32, IWMStreamConfig*, HRESULT)
    get_stream_by_number : Proc(IWMProfile2*, UInt16, IWMStreamConfig*, HRESULT)
    remove_stream : Proc(IWMProfile2*, IWMStreamConfig, HRESULT)
    remove_stream_by_number : Proc(IWMProfile2*, UInt16, HRESULT)
    add_stream : Proc(IWMProfile2*, IWMStreamConfig, HRESULT)
    reconfig_stream : Proc(IWMProfile2*, IWMStreamConfig, HRESULT)
    create_new_stream : Proc(IWMProfile2*, Guid*, IWMStreamConfig*, HRESULT)
    get_mutual_exclusion_count : Proc(IWMProfile2*, UInt32*, HRESULT)
    get_mutual_exclusion : Proc(IWMProfile2*, UInt32, IWMMutualExclusion*, HRESULT)
    remove_mutual_exclusion : Proc(IWMProfile2*, IWMMutualExclusion, HRESULT)
    add_mutual_exclusion : Proc(IWMProfile2*, IWMMutualExclusion, HRESULT)
    create_new_mutual_exclusion : Proc(IWMProfile2*, IWMMutualExclusion*, HRESULT)
    get_profile_id : Proc(IWMProfile2*, Guid*, HRESULT)
  end

  IWMProfile2_GUID = LibC::GUID.new("07e72d33-d94e-4be7-8843-60ae5ff7e5f5")
  CLSID_IWMProfile2 = "07e72d33-d94e-4be7-8843-60ae5ff7e5f5"
  struct IWMProfile2
    lpVtbl : IWMProfile2VTbl*
  end

  struct IWMProfile3VTbl
    query_interface : Proc(IWMProfile3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProfile3*, UInt32)
    release : Proc(IWMProfile3*, UInt32)
    get_version : Proc(IWMProfile3*, WMT_VERSION*, HRESULT)
    get_name : Proc(IWMProfile3*, Char*, UInt32*, HRESULT)
    set_name : Proc(IWMProfile3*, LibC::LPWSTR, HRESULT)
    get_description : Proc(IWMProfile3*, Char*, UInt32*, HRESULT)
    set_description : Proc(IWMProfile3*, LibC::LPWSTR, HRESULT)
    get_stream_count : Proc(IWMProfile3*, UInt32*, HRESULT)
    get_stream : Proc(IWMProfile3*, UInt32, IWMStreamConfig*, HRESULT)
    get_stream_by_number : Proc(IWMProfile3*, UInt16, IWMStreamConfig*, HRESULT)
    remove_stream : Proc(IWMProfile3*, IWMStreamConfig, HRESULT)
    remove_stream_by_number : Proc(IWMProfile3*, UInt16, HRESULT)
    add_stream : Proc(IWMProfile3*, IWMStreamConfig, HRESULT)
    reconfig_stream : Proc(IWMProfile3*, IWMStreamConfig, HRESULT)
    create_new_stream : Proc(IWMProfile3*, Guid*, IWMStreamConfig*, HRESULT)
    get_mutual_exclusion_count : Proc(IWMProfile3*, UInt32*, HRESULT)
    get_mutual_exclusion : Proc(IWMProfile3*, UInt32, IWMMutualExclusion*, HRESULT)
    remove_mutual_exclusion : Proc(IWMProfile3*, IWMMutualExclusion, HRESULT)
    add_mutual_exclusion : Proc(IWMProfile3*, IWMMutualExclusion, HRESULT)
    create_new_mutual_exclusion : Proc(IWMProfile3*, IWMMutualExclusion*, HRESULT)
    get_profile_id : Proc(IWMProfile3*, Guid*, HRESULT)
    get_storage_format : Proc(IWMProfile3*, WMT_STORAGE_FORMAT*, HRESULT)
    set_storage_format : Proc(IWMProfile3*, WMT_STORAGE_FORMAT, HRESULT)
    get_bandwidth_sharing_count : Proc(IWMProfile3*, UInt32*, HRESULT)
    get_bandwidth_sharing : Proc(IWMProfile3*, UInt32, IWMBandwidthSharing*, HRESULT)
    remove_bandwidth_sharing : Proc(IWMProfile3*, IWMBandwidthSharing, HRESULT)
    add_bandwidth_sharing : Proc(IWMProfile3*, IWMBandwidthSharing, HRESULT)
    create_new_bandwidth_sharing : Proc(IWMProfile3*, IWMBandwidthSharing*, HRESULT)
    get_stream_prioritization : Proc(IWMProfile3*, IWMStreamPrioritization*, HRESULT)
    set_stream_prioritization : Proc(IWMProfile3*, IWMStreamPrioritization, HRESULT)
    remove_stream_prioritization : Proc(IWMProfile3*, HRESULT)
    create_new_stream_prioritization : Proc(IWMProfile3*, IWMStreamPrioritization*, HRESULT)
    get_expected_packet_count : Proc(IWMProfile3*, UInt64, UInt64*, HRESULT)
  end

  IWMProfile3_GUID = LibC::GUID.new("00ef96cc-a461-4546-8bcd-c9a28f0e06f5")
  CLSID_IWMProfile3 = "00ef96cc-a461-4546-8bcd-c9a28f0e06f5"
  struct IWMProfile3
    lpVtbl : IWMProfile3VTbl*
  end

  struct IWMStreamConfigVTbl
    query_interface : Proc(IWMStreamConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStreamConfig*, UInt32)
    release : Proc(IWMStreamConfig*, UInt32)
    get_stream_type : Proc(IWMStreamConfig*, Guid*, HRESULT)
    get_stream_number : Proc(IWMStreamConfig*, UInt16*, HRESULT)
    set_stream_number : Proc(IWMStreamConfig*, UInt16, HRESULT)
    get_stream_name : Proc(IWMStreamConfig*, Char*, UInt16*, HRESULT)
    set_stream_name : Proc(IWMStreamConfig*, LibC::LPWSTR, HRESULT)
    get_connection_name : Proc(IWMStreamConfig*, Char*, UInt16*, HRESULT)
    set_connection_name : Proc(IWMStreamConfig*, LibC::LPWSTR, HRESULT)
    get_bitrate : Proc(IWMStreamConfig*, UInt32*, HRESULT)
    set_bitrate : Proc(IWMStreamConfig*, UInt32, HRESULT)
    get_buffer_window : Proc(IWMStreamConfig*, UInt32*, HRESULT)
    set_buffer_window : Proc(IWMStreamConfig*, UInt32, HRESULT)
  end

  IWMStreamConfig_GUID = LibC::GUID.new("96406bdc-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMStreamConfig = "96406bdc-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMStreamConfig
    lpVtbl : IWMStreamConfigVTbl*
  end

  struct IWMStreamConfig2VTbl
    query_interface : Proc(IWMStreamConfig2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStreamConfig2*, UInt32)
    release : Proc(IWMStreamConfig2*, UInt32)
    get_stream_type : Proc(IWMStreamConfig2*, Guid*, HRESULT)
    get_stream_number : Proc(IWMStreamConfig2*, UInt16*, HRESULT)
    set_stream_number : Proc(IWMStreamConfig2*, UInt16, HRESULT)
    get_stream_name : Proc(IWMStreamConfig2*, Char*, UInt16*, HRESULT)
    set_stream_name : Proc(IWMStreamConfig2*, LibC::LPWSTR, HRESULT)
    get_connection_name : Proc(IWMStreamConfig2*, Char*, UInt16*, HRESULT)
    set_connection_name : Proc(IWMStreamConfig2*, LibC::LPWSTR, HRESULT)
    get_bitrate : Proc(IWMStreamConfig2*, UInt32*, HRESULT)
    set_bitrate : Proc(IWMStreamConfig2*, UInt32, HRESULT)
    get_buffer_window : Proc(IWMStreamConfig2*, UInt32*, HRESULT)
    set_buffer_window : Proc(IWMStreamConfig2*, UInt32, HRESULT)
    get_transport_type : Proc(IWMStreamConfig2*, WMT_TRANSPORT_TYPE*, HRESULT)
    set_transport_type : Proc(IWMStreamConfig2*, WMT_TRANSPORT_TYPE, HRESULT)
    add_data_unit_extension : Proc(IWMStreamConfig2*, Guid, UInt16, UInt8*, UInt32, HRESULT)
    get_data_unit_extension_count : Proc(IWMStreamConfig2*, UInt16*, HRESULT)
    get_data_unit_extension : Proc(IWMStreamConfig2*, UInt16, Guid*, UInt16*, UInt8*, UInt32*, HRESULT)
    remove_all_data_unit_extensions : Proc(IWMStreamConfig2*, HRESULT)
  end

  IWMStreamConfig2_GUID = LibC::GUID.new("7688d8cb-fc0d-43bd-9459-5a8dec200cfa")
  CLSID_IWMStreamConfig2 = "7688d8cb-fc0d-43bd-9459-5a8dec200cfa"
  struct IWMStreamConfig2
    lpVtbl : IWMStreamConfig2VTbl*
  end

  struct IWMStreamConfig3VTbl
    query_interface : Proc(IWMStreamConfig3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStreamConfig3*, UInt32)
    release : Proc(IWMStreamConfig3*, UInt32)
    get_stream_type : Proc(IWMStreamConfig3*, Guid*, HRESULT)
    get_stream_number : Proc(IWMStreamConfig3*, UInt16*, HRESULT)
    set_stream_number : Proc(IWMStreamConfig3*, UInt16, HRESULT)
    get_stream_name : Proc(IWMStreamConfig3*, Char*, UInt16*, HRESULT)
    set_stream_name : Proc(IWMStreamConfig3*, LibC::LPWSTR, HRESULT)
    get_connection_name : Proc(IWMStreamConfig3*, Char*, UInt16*, HRESULT)
    set_connection_name : Proc(IWMStreamConfig3*, LibC::LPWSTR, HRESULT)
    get_bitrate : Proc(IWMStreamConfig3*, UInt32*, HRESULT)
    set_bitrate : Proc(IWMStreamConfig3*, UInt32, HRESULT)
    get_buffer_window : Proc(IWMStreamConfig3*, UInt32*, HRESULT)
    set_buffer_window : Proc(IWMStreamConfig3*, UInt32, HRESULT)
    get_transport_type : Proc(IWMStreamConfig3*, WMT_TRANSPORT_TYPE*, HRESULT)
    set_transport_type : Proc(IWMStreamConfig3*, WMT_TRANSPORT_TYPE, HRESULT)
    add_data_unit_extension : Proc(IWMStreamConfig3*, Guid, UInt16, UInt8*, UInt32, HRESULT)
    get_data_unit_extension_count : Proc(IWMStreamConfig3*, UInt16*, HRESULT)
    get_data_unit_extension : Proc(IWMStreamConfig3*, UInt16, Guid*, UInt16*, UInt8*, UInt32*, HRESULT)
    remove_all_data_unit_extensions : Proc(IWMStreamConfig3*, HRESULT)
    get_language : Proc(IWMStreamConfig3*, Char*, UInt16*, HRESULT)
    set_language : Proc(IWMStreamConfig3*, LibC::LPWSTR, HRESULT)
  end

  IWMStreamConfig3_GUID = LibC::GUID.new("cb164104-3aa9-45a7-9ac9-4daee131d6e1")
  CLSID_IWMStreamConfig3 = "cb164104-3aa9-45a7-9ac9-4daee131d6e1"
  struct IWMStreamConfig3
    lpVtbl : IWMStreamConfig3VTbl*
  end

  struct IWMPacketSizeVTbl
    query_interface : Proc(IWMPacketSize*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPacketSize*, UInt32)
    release : Proc(IWMPacketSize*, UInt32)
    get_max_packet_size : Proc(IWMPacketSize*, UInt32*, HRESULT)
    set_max_packet_size : Proc(IWMPacketSize*, UInt32, HRESULT)
  end

  IWMPacketSize_GUID = LibC::GUID.new("cdfb97ab-188f-40b3-b643-5b7903975c59")
  CLSID_IWMPacketSize = "cdfb97ab-188f-40b3-b643-5b7903975c59"
  struct IWMPacketSize
    lpVtbl : IWMPacketSizeVTbl*
  end

  struct IWMPacketSize2VTbl
    query_interface : Proc(IWMPacketSize2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPacketSize2*, UInt32)
    release : Proc(IWMPacketSize2*, UInt32)
    get_max_packet_size : Proc(IWMPacketSize2*, UInt32*, HRESULT)
    set_max_packet_size : Proc(IWMPacketSize2*, UInt32, HRESULT)
    get_min_packet_size : Proc(IWMPacketSize2*, UInt32*, HRESULT)
    set_min_packet_size : Proc(IWMPacketSize2*, UInt32, HRESULT)
  end

  IWMPacketSize2_GUID = LibC::GUID.new("8bfc2b9e-b646-4233-a877-1c6a079669dc")
  CLSID_IWMPacketSize2 = "8bfc2b9e-b646-4233-a877-1c6a079669dc"
  struct IWMPacketSize2
    lpVtbl : IWMPacketSize2VTbl*
  end

  struct IWMStreamListVTbl
    query_interface : Proc(IWMStreamList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStreamList*, UInt32)
    release : Proc(IWMStreamList*, UInt32)
    get_streams : Proc(IWMStreamList*, UInt16*, UInt16*, HRESULT)
    add_stream : Proc(IWMStreamList*, UInt16, HRESULT)
    remove_stream : Proc(IWMStreamList*, UInt16, HRESULT)
  end

  IWMStreamList_GUID = LibC::GUID.new("96406bdd-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMStreamList = "96406bdd-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMStreamList
    lpVtbl : IWMStreamListVTbl*
  end

  struct IWMMutualExclusionVTbl
    query_interface : Proc(IWMMutualExclusion*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMMutualExclusion*, UInt32)
    release : Proc(IWMMutualExclusion*, UInt32)
    get_streams : Proc(IWMMutualExclusion*, UInt16*, UInt16*, HRESULT)
    add_stream : Proc(IWMMutualExclusion*, UInt16, HRESULT)
    remove_stream : Proc(IWMMutualExclusion*, UInt16, HRESULT)
    get_type : Proc(IWMMutualExclusion*, Guid*, HRESULT)
    set_type : Proc(IWMMutualExclusion*, Guid*, HRESULT)
  end

  IWMMutualExclusion_GUID = LibC::GUID.new("96406bde-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMMutualExclusion = "96406bde-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMMutualExclusion
    lpVtbl : IWMMutualExclusionVTbl*
  end

  struct IWMMutualExclusion2VTbl
    query_interface : Proc(IWMMutualExclusion2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMMutualExclusion2*, UInt32)
    release : Proc(IWMMutualExclusion2*, UInt32)
    get_streams : Proc(IWMMutualExclusion2*, UInt16*, UInt16*, HRESULT)
    add_stream : Proc(IWMMutualExclusion2*, UInt16, HRESULT)
    remove_stream : Proc(IWMMutualExclusion2*, UInt16, HRESULT)
    get_type : Proc(IWMMutualExclusion2*, Guid*, HRESULT)
    set_type : Proc(IWMMutualExclusion2*, Guid*, HRESULT)
    get_name : Proc(IWMMutualExclusion2*, Char*, UInt16*, HRESULT)
    set_name : Proc(IWMMutualExclusion2*, LibC::LPWSTR, HRESULT)
    get_record_count : Proc(IWMMutualExclusion2*, UInt16*, HRESULT)
    add_record : Proc(IWMMutualExclusion2*, HRESULT)
    remove_record : Proc(IWMMutualExclusion2*, UInt16, HRESULT)
    get_record_name : Proc(IWMMutualExclusion2*, UInt16, Char*, UInt16*, HRESULT)
    set_record_name : Proc(IWMMutualExclusion2*, UInt16, LibC::LPWSTR, HRESULT)
    get_streams_for_record : Proc(IWMMutualExclusion2*, UInt16, UInt16*, UInt16*, HRESULT)
    add_stream_for_record : Proc(IWMMutualExclusion2*, UInt16, UInt16, HRESULT)
    remove_stream_for_record : Proc(IWMMutualExclusion2*, UInt16, UInt16, HRESULT)
  end

  IWMMutualExclusion2_GUID = LibC::GUID.new("0302b57d-89d1-4ba2-85c9-166f2c53eb91")
  CLSID_IWMMutualExclusion2 = "0302b57d-89d1-4ba2-85c9-166f2c53eb91"
  struct IWMMutualExclusion2
    lpVtbl : IWMMutualExclusion2VTbl*
  end

  struct IWMBandwidthSharingVTbl
    query_interface : Proc(IWMBandwidthSharing*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMBandwidthSharing*, UInt32)
    release : Proc(IWMBandwidthSharing*, UInt32)
    get_streams : Proc(IWMBandwidthSharing*, UInt16*, UInt16*, HRESULT)
    add_stream : Proc(IWMBandwidthSharing*, UInt16, HRESULT)
    remove_stream : Proc(IWMBandwidthSharing*, UInt16, HRESULT)
    get_type : Proc(IWMBandwidthSharing*, Guid*, HRESULT)
    set_type : Proc(IWMBandwidthSharing*, Guid*, HRESULT)
    get_bandwidth : Proc(IWMBandwidthSharing*, UInt32*, UInt32*, HRESULT)
    set_bandwidth : Proc(IWMBandwidthSharing*, UInt32, UInt32, HRESULT)
  end

  IWMBandwidthSharing_GUID = LibC::GUID.new("ad694af1-f8d9-42f8-bc47-70311b0c4f9e")
  CLSID_IWMBandwidthSharing = "ad694af1-f8d9-42f8-bc47-70311b0c4f9e"
  struct IWMBandwidthSharing
    lpVtbl : IWMBandwidthSharingVTbl*
  end

  struct IWMStreamPrioritizationVTbl
    query_interface : Proc(IWMStreamPrioritization*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStreamPrioritization*, UInt32)
    release : Proc(IWMStreamPrioritization*, UInt32)
    get_priority_records : Proc(IWMStreamPrioritization*, WM_STREAM_PRIORITY_RECORD*, UInt16*, HRESULT)
    set_priority_records : Proc(IWMStreamPrioritization*, WM_STREAM_PRIORITY_RECORD*, UInt16, HRESULT)
  end

  IWMStreamPrioritization_GUID = LibC::GUID.new("8c1c6090-f9a8-4748-8ec3-dd1108ba1e77")
  CLSID_IWMStreamPrioritization = "8c1c6090-f9a8-4748-8ec3-dd1108ba1e77"
  struct IWMStreamPrioritization
    lpVtbl : IWMStreamPrioritizationVTbl*
  end

  struct IWMWriterAdvancedVTbl
    query_interface : Proc(IWMWriterAdvanced*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterAdvanced*, UInt32)
    release : Proc(IWMWriterAdvanced*, UInt32)
    get_sink_count : Proc(IWMWriterAdvanced*, UInt32*, HRESULT)
    get_sink : Proc(IWMWriterAdvanced*, UInt32, IWMWriterSink*, HRESULT)
    add_sink : Proc(IWMWriterAdvanced*, IWMWriterSink, HRESULT)
    remove_sink : Proc(IWMWriterAdvanced*, IWMWriterSink, HRESULT)
    write_stream_sample : Proc(IWMWriterAdvanced*, UInt16, UInt64, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)
    set_live_source : Proc(IWMWriterAdvanced*, LibC::BOOL, HRESULT)
    is_real_time : Proc(IWMWriterAdvanced*, LibC::BOOL*, HRESULT)
    get_writer_time : Proc(IWMWriterAdvanced*, UInt64*, HRESULT)
    get_statistics : Proc(IWMWriterAdvanced*, UInt16, WM_WRITER_STATISTICS*, HRESULT)
    set_sync_tolerance : Proc(IWMWriterAdvanced*, UInt32, HRESULT)
    get_sync_tolerance : Proc(IWMWriterAdvanced*, UInt32*, HRESULT)
  end

  IWMWriterAdvanced_GUID = LibC::GUID.new("96406be3-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMWriterAdvanced = "96406be3-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMWriterAdvanced
    lpVtbl : IWMWriterAdvancedVTbl*
  end

  struct IWMWriterAdvanced2VTbl
    query_interface : Proc(IWMWriterAdvanced2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterAdvanced2*, UInt32)
    release : Proc(IWMWriterAdvanced2*, UInt32)
    get_sink_count : Proc(IWMWriterAdvanced2*, UInt32*, HRESULT)
    get_sink : Proc(IWMWriterAdvanced2*, UInt32, IWMWriterSink*, HRESULT)
    add_sink : Proc(IWMWriterAdvanced2*, IWMWriterSink, HRESULT)
    remove_sink : Proc(IWMWriterAdvanced2*, IWMWriterSink, HRESULT)
    write_stream_sample : Proc(IWMWriterAdvanced2*, UInt16, UInt64, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)
    set_live_source : Proc(IWMWriterAdvanced2*, LibC::BOOL, HRESULT)
    is_real_time : Proc(IWMWriterAdvanced2*, LibC::BOOL*, HRESULT)
    get_writer_time : Proc(IWMWriterAdvanced2*, UInt64*, HRESULT)
    get_statistics : Proc(IWMWriterAdvanced2*, UInt16, WM_WRITER_STATISTICS*, HRESULT)
    set_sync_tolerance : Proc(IWMWriterAdvanced2*, UInt32, HRESULT)
    get_sync_tolerance : Proc(IWMWriterAdvanced2*, UInt32*, HRESULT)
    get_input_setting : Proc(IWMWriterAdvanced2*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_input_setting : Proc(IWMWriterAdvanced2*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
  end

  IWMWriterAdvanced2_GUID = LibC::GUID.new("962dc1ec-c046-4db8-9cc7-26ceae500817")
  CLSID_IWMWriterAdvanced2 = "962dc1ec-c046-4db8-9cc7-26ceae500817"
  struct IWMWriterAdvanced2
    lpVtbl : IWMWriterAdvanced2VTbl*
  end

  struct IWMWriterAdvanced3VTbl
    query_interface : Proc(IWMWriterAdvanced3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterAdvanced3*, UInt32)
    release : Proc(IWMWriterAdvanced3*, UInt32)
    get_sink_count : Proc(IWMWriterAdvanced3*, UInt32*, HRESULT)
    get_sink : Proc(IWMWriterAdvanced3*, UInt32, IWMWriterSink*, HRESULT)
    add_sink : Proc(IWMWriterAdvanced3*, IWMWriterSink, HRESULT)
    remove_sink : Proc(IWMWriterAdvanced3*, IWMWriterSink, HRESULT)
    write_stream_sample : Proc(IWMWriterAdvanced3*, UInt16, UInt64, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)
    set_live_source : Proc(IWMWriterAdvanced3*, LibC::BOOL, HRESULT)
    is_real_time : Proc(IWMWriterAdvanced3*, LibC::BOOL*, HRESULT)
    get_writer_time : Proc(IWMWriterAdvanced3*, UInt64*, HRESULT)
    get_statistics : Proc(IWMWriterAdvanced3*, UInt16, WM_WRITER_STATISTICS*, HRESULT)
    set_sync_tolerance : Proc(IWMWriterAdvanced3*, UInt32, HRESULT)
    get_sync_tolerance : Proc(IWMWriterAdvanced3*, UInt32*, HRESULT)
    get_input_setting : Proc(IWMWriterAdvanced3*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_input_setting : Proc(IWMWriterAdvanced3*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_statistics_ex : Proc(IWMWriterAdvanced3*, UInt16, WM_WRITER_STATISTICS_EX*, HRESULT)
    set_non_blocking : Proc(IWMWriterAdvanced3*, HRESULT)
  end

  IWMWriterAdvanced3_GUID = LibC::GUID.new("2cd6492d-7c37-4e76-9d3b-59261183a22e")
  CLSID_IWMWriterAdvanced3 = "2cd6492d-7c37-4e76-9d3b-59261183a22e"
  struct IWMWriterAdvanced3
    lpVtbl : IWMWriterAdvanced3VTbl*
  end

  struct IWMWriterPreprocessVTbl
    query_interface : Proc(IWMWriterPreprocess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterPreprocess*, UInt32)
    release : Proc(IWMWriterPreprocess*, UInt32)
    get_max_preprocessing_passes : Proc(IWMWriterPreprocess*, UInt32, UInt32, UInt32*, HRESULT)
    set_num_preprocessing_passes : Proc(IWMWriterPreprocess*, UInt32, UInt32, UInt32, HRESULT)
    begin_preprocessing_pass : Proc(IWMWriterPreprocess*, UInt32, UInt32, HRESULT)
    preprocess_sample : Proc(IWMWriterPreprocess*, UInt32, UInt64, UInt32, INSSBuffer, HRESULT)
    end_preprocessing_pass : Proc(IWMWriterPreprocess*, UInt32, UInt32, HRESULT)
  end

  IWMWriterPreprocess_GUID = LibC::GUID.new("fc54a285-38c4-45b5-aa23-85b9f7cb424b")
  CLSID_IWMWriterPreprocess = "fc54a285-38c4-45b5-aa23-85b9f7cb424b"
  struct IWMWriterPreprocess
    lpVtbl : IWMWriterPreprocessVTbl*
  end

  struct IWMWriterPostViewCallbackVTbl
    query_interface : Proc(IWMWriterPostViewCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterPostViewCallback*, UInt32)
    release : Proc(IWMWriterPostViewCallback*, UInt32)
    on_status : Proc(IWMWriterPostViewCallback*, WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)
    on_post_view_sample : Proc(IWMWriterPostViewCallback*, UInt16, UInt64, UInt64, UInt32, INSSBuffer, Void*, HRESULT)
    allocate_for_post_view : Proc(IWMWriterPostViewCallback*, UInt16, UInt32, INSSBuffer*, Void*, HRESULT)
  end

  IWMWriterPostViewCallback_GUID = LibC::GUID.new("d9d6549d-a193-4f24-b308-03123d9b7f8d")
  CLSID_IWMWriterPostViewCallback = "d9d6549d-a193-4f24-b308-03123d9b7f8d"
  struct IWMWriterPostViewCallback
    lpVtbl : IWMWriterPostViewCallbackVTbl*
  end

  struct IWMWriterPostViewVTbl
    query_interface : Proc(IWMWriterPostView*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterPostView*, UInt32)
    release : Proc(IWMWriterPostView*, UInt32)
    set_post_view_callback : Proc(IWMWriterPostView*, IWMWriterPostViewCallback, Void*, HRESULT)
    set_receive_post_view_samples : Proc(IWMWriterPostView*, UInt16, LibC::BOOL, HRESULT)
    get_receive_post_view_samples : Proc(IWMWriterPostView*, UInt16, LibC::BOOL*, HRESULT)
    get_post_view_props : Proc(IWMWriterPostView*, UInt16, IWMMediaProps*, HRESULT)
    set_post_view_props : Proc(IWMWriterPostView*, UInt16, IWMMediaProps, HRESULT)
    get_post_view_format_count : Proc(IWMWriterPostView*, UInt16, UInt32*, HRESULT)
    get_post_view_format : Proc(IWMWriterPostView*, UInt16, UInt32, IWMMediaProps*, HRESULT)
    set_allocate_for_post_view : Proc(IWMWriterPostView*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_post_view : Proc(IWMWriterPostView*, UInt16, LibC::BOOL*, HRESULT)
  end

  IWMWriterPostView_GUID = LibC::GUID.new("81e20ce4-75ef-491a-8004-fc53c45bdc3e")
  CLSID_IWMWriterPostView = "81e20ce4-75ef-491a-8004-fc53c45bdc3e"
  struct IWMWriterPostView
    lpVtbl : IWMWriterPostViewVTbl*
  end

  struct IWMWriterSinkVTbl
    query_interface : Proc(IWMWriterSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterSink*, UInt32)
    release : Proc(IWMWriterSink*, UInt32)
    on_header : Proc(IWMWriterSink*, INSSBuffer, HRESULT)
    is_real_time : Proc(IWMWriterSink*, LibC::BOOL*, HRESULT)
    allocate_data_unit : Proc(IWMWriterSink*, UInt32, INSSBuffer*, HRESULT)
    on_data_unit : Proc(IWMWriterSink*, INSSBuffer, HRESULT)
    on_end_writing : Proc(IWMWriterSink*, HRESULT)
  end

  IWMWriterSink_GUID = LibC::GUID.new("96406be4-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMWriterSink = "96406be4-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMWriterSink
    lpVtbl : IWMWriterSinkVTbl*
  end

  struct IWMRegisterCallbackVTbl
    query_interface : Proc(IWMRegisterCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMRegisterCallback*, UInt32)
    release : Proc(IWMRegisterCallback*, UInt32)
    advise : Proc(IWMRegisterCallback*, IWMStatusCallback, Void*, HRESULT)
    unadvise : Proc(IWMRegisterCallback*, IWMStatusCallback, Void*, HRESULT)
  end

  IWMRegisterCallback_GUID = LibC::GUID.new("cf4b1f99-4de2-4e49-a363-252740d99bc1")
  CLSID_IWMRegisterCallback = "cf4b1f99-4de2-4e49-a363-252740d99bc1"
  struct IWMRegisterCallback
    lpVtbl : IWMRegisterCallbackVTbl*
  end

  struct IWMWriterFileSinkVTbl
    query_interface : Proc(IWMWriterFileSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterFileSink*, UInt32)
    release : Proc(IWMWriterFileSink*, UInt32)
    on_header : Proc(IWMWriterFileSink*, INSSBuffer, HRESULT)
    is_real_time : Proc(IWMWriterFileSink*, LibC::BOOL*, HRESULT)
    allocate_data_unit : Proc(IWMWriterFileSink*, UInt32, INSSBuffer*, HRESULT)
    on_data_unit : Proc(IWMWriterFileSink*, INSSBuffer, HRESULT)
    on_end_writing : Proc(IWMWriterFileSink*, HRESULT)
    open : Proc(IWMWriterFileSink*, LibC::LPWSTR, HRESULT)
  end

  IWMWriterFileSink_GUID = LibC::GUID.new("96406be5-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMWriterFileSink = "96406be5-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMWriterFileSink
    lpVtbl : IWMWriterFileSinkVTbl*
  end

  struct IWMWriterFileSink2VTbl
    query_interface : Proc(IWMWriterFileSink2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterFileSink2*, UInt32)
    release : Proc(IWMWriterFileSink2*, UInt32)
    on_header : Proc(IWMWriterFileSink2*, INSSBuffer, HRESULT)
    is_real_time : Proc(IWMWriterFileSink2*, LibC::BOOL*, HRESULT)
    allocate_data_unit : Proc(IWMWriterFileSink2*, UInt32, INSSBuffer*, HRESULT)
    on_data_unit : Proc(IWMWriterFileSink2*, INSSBuffer, HRESULT)
    on_end_writing : Proc(IWMWriterFileSink2*, HRESULT)
    open : Proc(IWMWriterFileSink2*, LibC::LPWSTR, HRESULT)
    start : Proc(IWMWriterFileSink2*, UInt64, HRESULT)
    stop : Proc(IWMWriterFileSink2*, UInt64, HRESULT)
    is_stopped : Proc(IWMWriterFileSink2*, LibC::BOOL*, HRESULT)
    get_file_duration : Proc(IWMWriterFileSink2*, UInt64*, HRESULT)
    get_file_size : Proc(IWMWriterFileSink2*, UInt64*, HRESULT)
    close : Proc(IWMWriterFileSink2*, HRESULT)
    is_closed : Proc(IWMWriterFileSink2*, LibC::BOOL*, HRESULT)
  end

  IWMWriterFileSink2_GUID = LibC::GUID.new("14282ba7-4aef-4205-8ce5-c229035a05bc")
  CLSID_IWMWriterFileSink2 = "14282ba7-4aef-4205-8ce5-c229035a05bc"
  struct IWMWriterFileSink2
    lpVtbl : IWMWriterFileSink2VTbl*
  end

  struct IWMWriterFileSink3VTbl
    query_interface : Proc(IWMWriterFileSink3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterFileSink3*, UInt32)
    release : Proc(IWMWriterFileSink3*, UInt32)
    on_header : Proc(IWMWriterFileSink3*, INSSBuffer, HRESULT)
    is_real_time : Proc(IWMWriterFileSink3*, LibC::BOOL*, HRESULT)
    allocate_data_unit : Proc(IWMWriterFileSink3*, UInt32, INSSBuffer*, HRESULT)
    on_data_unit : Proc(IWMWriterFileSink3*, INSSBuffer, HRESULT)
    on_end_writing : Proc(IWMWriterFileSink3*, HRESULT)
    open : Proc(IWMWriterFileSink3*, LibC::LPWSTR, HRESULT)
    start : Proc(IWMWriterFileSink3*, UInt64, HRESULT)
    stop : Proc(IWMWriterFileSink3*, UInt64, HRESULT)
    is_stopped : Proc(IWMWriterFileSink3*, LibC::BOOL*, HRESULT)
    get_file_duration : Proc(IWMWriterFileSink3*, UInt64*, HRESULT)
    get_file_size : Proc(IWMWriterFileSink3*, UInt64*, HRESULT)
    close : Proc(IWMWriterFileSink3*, HRESULT)
    is_closed : Proc(IWMWriterFileSink3*, LibC::BOOL*, HRESULT)
    set_auto_indexing : Proc(IWMWriterFileSink3*, LibC::BOOL, HRESULT)
    get_auto_indexing : Proc(IWMWriterFileSink3*, LibC::BOOL*, HRESULT)
    set_control_stream : Proc(IWMWriterFileSink3*, UInt16, LibC::BOOL, HRESULT)
    get_mode : Proc(IWMWriterFileSink3*, UInt32*, HRESULT)
    on_data_unit_ex : Proc(IWMWriterFileSink3*, WMT_FILESINK_DATA_UNIT*, HRESULT)
    set_unbuffered_io : Proc(IWMWriterFileSink3*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_unbuffered_io : Proc(IWMWriterFileSink3*, LibC::BOOL*, HRESULT)
    complete_operations : Proc(IWMWriterFileSink3*, HRESULT)
  end

  IWMWriterFileSink3_GUID = LibC::GUID.new("3fea4feb-2945-47a7-a1dd-c53a8fc4c45c")
  CLSID_IWMWriterFileSink3 = "3fea4feb-2945-47a7-a1dd-c53a8fc4c45c"
  struct IWMWriterFileSink3
    lpVtbl : IWMWriterFileSink3VTbl*
  end

  struct IWMWriterNetworkSinkVTbl
    query_interface : Proc(IWMWriterNetworkSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterNetworkSink*, UInt32)
    release : Proc(IWMWriterNetworkSink*, UInt32)
    on_header : Proc(IWMWriterNetworkSink*, INSSBuffer, HRESULT)
    is_real_time : Proc(IWMWriterNetworkSink*, LibC::BOOL*, HRESULT)
    allocate_data_unit : Proc(IWMWriterNetworkSink*, UInt32, INSSBuffer*, HRESULT)
    on_data_unit : Proc(IWMWriterNetworkSink*, INSSBuffer, HRESULT)
    on_end_writing : Proc(IWMWriterNetworkSink*, HRESULT)
    set_maximum_clients : Proc(IWMWriterNetworkSink*, UInt32, HRESULT)
    get_maximum_clients : Proc(IWMWriterNetworkSink*, UInt32*, HRESULT)
    set_network_protocol : Proc(IWMWriterNetworkSink*, WMT_NET_PROTOCOL, HRESULT)
    get_network_protocol : Proc(IWMWriterNetworkSink*, WMT_NET_PROTOCOL*, HRESULT)
    get_host_url : Proc(IWMWriterNetworkSink*, LibC::LPWSTR, UInt32*, HRESULT)
    open : Proc(IWMWriterNetworkSink*, UInt32*, HRESULT)
    disconnect : Proc(IWMWriterNetworkSink*, HRESULT)
    close : Proc(IWMWriterNetworkSink*, HRESULT)
  end

  IWMWriterNetworkSink_GUID = LibC::GUID.new("96406be7-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMWriterNetworkSink = "96406be7-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMWriterNetworkSink
    lpVtbl : IWMWriterNetworkSinkVTbl*
  end

  struct IWMClientConnectionsVTbl
    query_interface : Proc(IWMClientConnections*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMClientConnections*, UInt32)
    release : Proc(IWMClientConnections*, UInt32)
    get_client_count : Proc(IWMClientConnections*, UInt32*, HRESULT)
    get_client_properties : Proc(IWMClientConnections*, UInt32, WM_CLIENT_PROPERTIES*, HRESULT)
  end

  IWMClientConnections_GUID = LibC::GUID.new("73c66010-a299-41df-b1f0-ccf03b09c1c6")
  CLSID_IWMClientConnections = "73c66010-a299-41df-b1f0-ccf03b09c1c6"
  struct IWMClientConnections
    lpVtbl : IWMClientConnectionsVTbl*
  end

  struct IWMClientConnections2VTbl
    query_interface : Proc(IWMClientConnections2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMClientConnections2*, UInt32)
    release : Proc(IWMClientConnections2*, UInt32)
    get_client_count : Proc(IWMClientConnections2*, UInt32*, HRESULT)
    get_client_properties : Proc(IWMClientConnections2*, UInt32, WM_CLIENT_PROPERTIES*, HRESULT)
    get_client_info : Proc(IWMClientConnections2*, UInt32, Char*, UInt32*, Char*, UInt32*, Char*, UInt32*, HRESULT)
  end

  IWMClientConnections2_GUID = LibC::GUID.new("4091571e-4701-4593-bb3d-d5f5f0c74246")
  CLSID_IWMClientConnections2 = "4091571e-4701-4593-bb3d-d5f5f0c74246"
  struct IWMClientConnections2
    lpVtbl : IWMClientConnections2VTbl*
  end

  struct IWMReaderAdvancedVTbl
    query_interface : Proc(IWMReaderAdvanced*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAdvanced*, UInt32)
    release : Proc(IWMReaderAdvanced*, UInt32)
    set_user_provided_clock : Proc(IWMReaderAdvanced*, LibC::BOOL, HRESULT)
    get_user_provided_clock : Proc(IWMReaderAdvanced*, LibC::BOOL*, HRESULT)
    deliver_time : Proc(IWMReaderAdvanced*, UInt64, HRESULT)
    set_manual_stream_selection : Proc(IWMReaderAdvanced*, LibC::BOOL, HRESULT)
    get_manual_stream_selection : Proc(IWMReaderAdvanced*, LibC::BOOL*, HRESULT)
    set_streams_selected : Proc(IWMReaderAdvanced*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMReaderAdvanced*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced*, LibC::BOOL, HRESULT)
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced*, LibC::BOOL*, HRESULT)
    set_receive_stream_samples : Proc(IWMReaderAdvanced*, UInt16, LibC::BOOL, HRESULT)
    get_receive_stream_samples : Proc(IWMReaderAdvanced*, UInt16, LibC::BOOL*, HRESULT)
    set_allocate_for_output : Proc(IWMReaderAdvanced*, UInt32, LibC::BOOL, HRESULT)
    get_allocate_for_output : Proc(IWMReaderAdvanced*, UInt32, LibC::BOOL*, HRESULT)
    set_allocate_for_stream : Proc(IWMReaderAdvanced*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_stream : Proc(IWMReaderAdvanced*, UInt16, LibC::BOOL*, HRESULT)
    get_statistics : Proc(IWMReaderAdvanced*, WM_READER_STATISTICS*, HRESULT)
    set_client_info : Proc(IWMReaderAdvanced*, WM_READER_CLIENTINFO*, HRESULT)
    get_max_output_sample_size : Proc(IWMReaderAdvanced*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMReaderAdvanced*, UInt16, UInt32*, HRESULT)
    notify_late_delivery : Proc(IWMReaderAdvanced*, UInt64, HRESULT)
  end

  IWMReaderAdvanced_GUID = LibC::GUID.new("96406bea-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMReaderAdvanced = "96406bea-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMReaderAdvanced
    lpVtbl : IWMReaderAdvancedVTbl*
  end

  struct IWMReaderAdvanced2VTbl
    query_interface : Proc(IWMReaderAdvanced2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAdvanced2*, UInt32)
    release : Proc(IWMReaderAdvanced2*, UInt32)
    set_user_provided_clock : Proc(IWMReaderAdvanced2*, LibC::BOOL, HRESULT)
    get_user_provided_clock : Proc(IWMReaderAdvanced2*, LibC::BOOL*, HRESULT)
    deliver_time : Proc(IWMReaderAdvanced2*, UInt64, HRESULT)
    set_manual_stream_selection : Proc(IWMReaderAdvanced2*, LibC::BOOL, HRESULT)
    get_manual_stream_selection : Proc(IWMReaderAdvanced2*, LibC::BOOL*, HRESULT)
    set_streams_selected : Proc(IWMReaderAdvanced2*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMReaderAdvanced2*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced2*, LibC::BOOL, HRESULT)
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced2*, LibC::BOOL*, HRESULT)
    set_receive_stream_samples : Proc(IWMReaderAdvanced2*, UInt16, LibC::BOOL, HRESULT)
    get_receive_stream_samples : Proc(IWMReaderAdvanced2*, UInt16, LibC::BOOL*, HRESULT)
    set_allocate_for_output : Proc(IWMReaderAdvanced2*, UInt32, LibC::BOOL, HRESULT)
    get_allocate_for_output : Proc(IWMReaderAdvanced2*, UInt32, LibC::BOOL*, HRESULT)
    set_allocate_for_stream : Proc(IWMReaderAdvanced2*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_stream : Proc(IWMReaderAdvanced2*, UInt16, LibC::BOOL*, HRESULT)
    get_statistics : Proc(IWMReaderAdvanced2*, WM_READER_STATISTICS*, HRESULT)
    set_client_info : Proc(IWMReaderAdvanced2*, WM_READER_CLIENTINFO*, HRESULT)
    get_max_output_sample_size : Proc(IWMReaderAdvanced2*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMReaderAdvanced2*, UInt16, UInt32*, HRESULT)
    notify_late_delivery : Proc(IWMReaderAdvanced2*, UInt64, HRESULT)
    set_play_mode : Proc(IWMReaderAdvanced2*, WMT_PLAY_MODE, HRESULT)
    get_play_mode : Proc(IWMReaderAdvanced2*, WMT_PLAY_MODE*, HRESULT)
    get_buffer_progress : Proc(IWMReaderAdvanced2*, UInt32*, UInt64*, HRESULT)
    get_download_progress : Proc(IWMReaderAdvanced2*, UInt32*, UInt64*, UInt64*, HRESULT)
    get_save_as_progress : Proc(IWMReaderAdvanced2*, UInt32*, HRESULT)
    save_file_as : Proc(IWMReaderAdvanced2*, LibC::LPWSTR, HRESULT)
    get_protocol_name : Proc(IWMReaderAdvanced2*, Char*, UInt32*, HRESULT)
    start_at_marker : Proc(IWMReaderAdvanced2*, UInt16, UInt64, Float32, Void*, HRESULT)
    get_output_setting : Proc(IWMReaderAdvanced2*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMReaderAdvanced2*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    preroll : Proc(IWMReaderAdvanced2*, UInt64, UInt64, Float32, HRESULT)
    set_log_client_id : Proc(IWMReaderAdvanced2*, LibC::BOOL, HRESULT)
    get_log_client_id : Proc(IWMReaderAdvanced2*, LibC::BOOL*, HRESULT)
    stop_buffering : Proc(IWMReaderAdvanced2*, HRESULT)
    open_stream : Proc(IWMReaderAdvanced2*, IStream, IWMReaderCallback, Void*, HRESULT)
  end

  IWMReaderAdvanced2_GUID = LibC::GUID.new("ae14a945-b90c-4d0d-9127-80d665f7d73e")
  CLSID_IWMReaderAdvanced2 = "ae14a945-b90c-4d0d-9127-80d665f7d73e"
  struct IWMReaderAdvanced2
    lpVtbl : IWMReaderAdvanced2VTbl*
  end

  struct IWMReaderAdvanced3VTbl
    query_interface : Proc(IWMReaderAdvanced3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAdvanced3*, UInt32)
    release : Proc(IWMReaderAdvanced3*, UInt32)
    set_user_provided_clock : Proc(IWMReaderAdvanced3*, LibC::BOOL, HRESULT)
    get_user_provided_clock : Proc(IWMReaderAdvanced3*, LibC::BOOL*, HRESULT)
    deliver_time : Proc(IWMReaderAdvanced3*, UInt64, HRESULT)
    set_manual_stream_selection : Proc(IWMReaderAdvanced3*, LibC::BOOL, HRESULT)
    get_manual_stream_selection : Proc(IWMReaderAdvanced3*, LibC::BOOL*, HRESULT)
    set_streams_selected : Proc(IWMReaderAdvanced3*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMReaderAdvanced3*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced3*, LibC::BOOL, HRESULT)
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced3*, LibC::BOOL*, HRESULT)
    set_receive_stream_samples : Proc(IWMReaderAdvanced3*, UInt16, LibC::BOOL, HRESULT)
    get_receive_stream_samples : Proc(IWMReaderAdvanced3*, UInt16, LibC::BOOL*, HRESULT)
    set_allocate_for_output : Proc(IWMReaderAdvanced3*, UInt32, LibC::BOOL, HRESULT)
    get_allocate_for_output : Proc(IWMReaderAdvanced3*, UInt32, LibC::BOOL*, HRESULT)
    set_allocate_for_stream : Proc(IWMReaderAdvanced3*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_stream : Proc(IWMReaderAdvanced3*, UInt16, LibC::BOOL*, HRESULT)
    get_statistics : Proc(IWMReaderAdvanced3*, WM_READER_STATISTICS*, HRESULT)
    set_client_info : Proc(IWMReaderAdvanced3*, WM_READER_CLIENTINFO*, HRESULT)
    get_max_output_sample_size : Proc(IWMReaderAdvanced3*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMReaderAdvanced3*, UInt16, UInt32*, HRESULT)
    notify_late_delivery : Proc(IWMReaderAdvanced3*, UInt64, HRESULT)
    set_play_mode : Proc(IWMReaderAdvanced3*, WMT_PLAY_MODE, HRESULT)
    get_play_mode : Proc(IWMReaderAdvanced3*, WMT_PLAY_MODE*, HRESULT)
    get_buffer_progress : Proc(IWMReaderAdvanced3*, UInt32*, UInt64*, HRESULT)
    get_download_progress : Proc(IWMReaderAdvanced3*, UInt32*, UInt64*, UInt64*, HRESULT)
    get_save_as_progress : Proc(IWMReaderAdvanced3*, UInt32*, HRESULT)
    save_file_as : Proc(IWMReaderAdvanced3*, LibC::LPWSTR, HRESULT)
    get_protocol_name : Proc(IWMReaderAdvanced3*, Char*, UInt32*, HRESULT)
    start_at_marker : Proc(IWMReaderAdvanced3*, UInt16, UInt64, Float32, Void*, HRESULT)
    get_output_setting : Proc(IWMReaderAdvanced3*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMReaderAdvanced3*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    preroll : Proc(IWMReaderAdvanced3*, UInt64, UInt64, Float32, HRESULT)
    set_log_client_id : Proc(IWMReaderAdvanced3*, LibC::BOOL, HRESULT)
    get_log_client_id : Proc(IWMReaderAdvanced3*, LibC::BOOL*, HRESULT)
    stop_buffering : Proc(IWMReaderAdvanced3*, HRESULT)
    open_stream : Proc(IWMReaderAdvanced3*, IStream, IWMReaderCallback, Void*, HRESULT)
    stop_net_streaming : Proc(IWMReaderAdvanced3*, HRESULT)
    start_at_position : Proc(IWMReaderAdvanced3*, UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)
  end

  IWMReaderAdvanced3_GUID = LibC::GUID.new("5dc0674b-f04b-4a4e-9f2a-b1afde2c8100")
  CLSID_IWMReaderAdvanced3 = "5dc0674b-f04b-4a4e-9f2a-b1afde2c8100"
  struct IWMReaderAdvanced3
    lpVtbl : IWMReaderAdvanced3VTbl*
  end

  struct IWMReaderAdvanced4VTbl
    query_interface : Proc(IWMReaderAdvanced4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAdvanced4*, UInt32)
    release : Proc(IWMReaderAdvanced4*, UInt32)
    set_user_provided_clock : Proc(IWMReaderAdvanced4*, LibC::BOOL, HRESULT)
    get_user_provided_clock : Proc(IWMReaderAdvanced4*, LibC::BOOL*, HRESULT)
    deliver_time : Proc(IWMReaderAdvanced4*, UInt64, HRESULT)
    set_manual_stream_selection : Proc(IWMReaderAdvanced4*, LibC::BOOL, HRESULT)
    get_manual_stream_selection : Proc(IWMReaderAdvanced4*, LibC::BOOL*, HRESULT)
    set_streams_selected : Proc(IWMReaderAdvanced4*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMReaderAdvanced4*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced4*, LibC::BOOL, HRESULT)
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced4*, LibC::BOOL*, HRESULT)
    set_receive_stream_samples : Proc(IWMReaderAdvanced4*, UInt16, LibC::BOOL, HRESULT)
    get_receive_stream_samples : Proc(IWMReaderAdvanced4*, UInt16, LibC::BOOL*, HRESULT)
    set_allocate_for_output : Proc(IWMReaderAdvanced4*, UInt32, LibC::BOOL, HRESULT)
    get_allocate_for_output : Proc(IWMReaderAdvanced4*, UInt32, LibC::BOOL*, HRESULT)
    set_allocate_for_stream : Proc(IWMReaderAdvanced4*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_stream : Proc(IWMReaderAdvanced4*, UInt16, LibC::BOOL*, HRESULT)
    get_statistics : Proc(IWMReaderAdvanced4*, WM_READER_STATISTICS*, HRESULT)
    set_client_info : Proc(IWMReaderAdvanced4*, WM_READER_CLIENTINFO*, HRESULT)
    get_max_output_sample_size : Proc(IWMReaderAdvanced4*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMReaderAdvanced4*, UInt16, UInt32*, HRESULT)
    notify_late_delivery : Proc(IWMReaderAdvanced4*, UInt64, HRESULT)
    set_play_mode : Proc(IWMReaderAdvanced4*, WMT_PLAY_MODE, HRESULT)
    get_play_mode : Proc(IWMReaderAdvanced4*, WMT_PLAY_MODE*, HRESULT)
    get_buffer_progress : Proc(IWMReaderAdvanced4*, UInt32*, UInt64*, HRESULT)
    get_download_progress : Proc(IWMReaderAdvanced4*, UInt32*, UInt64*, UInt64*, HRESULT)
    get_save_as_progress : Proc(IWMReaderAdvanced4*, UInt32*, HRESULT)
    save_file_as : Proc(IWMReaderAdvanced4*, LibC::LPWSTR, HRESULT)
    get_protocol_name : Proc(IWMReaderAdvanced4*, Char*, UInt32*, HRESULT)
    start_at_marker : Proc(IWMReaderAdvanced4*, UInt16, UInt64, Float32, Void*, HRESULT)
    get_output_setting : Proc(IWMReaderAdvanced4*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMReaderAdvanced4*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    preroll : Proc(IWMReaderAdvanced4*, UInt64, UInt64, Float32, HRESULT)
    set_log_client_id : Proc(IWMReaderAdvanced4*, LibC::BOOL, HRESULT)
    get_log_client_id : Proc(IWMReaderAdvanced4*, LibC::BOOL*, HRESULT)
    stop_buffering : Proc(IWMReaderAdvanced4*, HRESULT)
    open_stream : Proc(IWMReaderAdvanced4*, IStream, IWMReaderCallback, Void*, HRESULT)
    stop_net_streaming : Proc(IWMReaderAdvanced4*, HRESULT)
    start_at_position : Proc(IWMReaderAdvanced4*, UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)
    get_language_count : Proc(IWMReaderAdvanced4*, UInt32, UInt16*, HRESULT)
    get_language : Proc(IWMReaderAdvanced4*, UInt32, UInt16, Char*, UInt16*, HRESULT)
    get_max_speed_factor : Proc(IWMReaderAdvanced4*, Float64*, HRESULT)
    is_using_fast_cache : Proc(IWMReaderAdvanced4*, LibC::BOOL*, HRESULT)
    add_log_param : Proc(IWMReaderAdvanced4*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    send_log_params : Proc(IWMReaderAdvanced4*, HRESULT)
    can_save_file_as : Proc(IWMReaderAdvanced4*, LibC::BOOL*, HRESULT)
    cancel_save_file_as : Proc(IWMReaderAdvanced4*, HRESULT)
    get_url : Proc(IWMReaderAdvanced4*, Char*, UInt32*, HRESULT)
  end

  IWMReaderAdvanced4_GUID = LibC::GUID.new("945a76a2-12ae-4d48-bd3c-cd1d90399b85")
  CLSID_IWMReaderAdvanced4 = "945a76a2-12ae-4d48-bd3c-cd1d90399b85"
  struct IWMReaderAdvanced4
    lpVtbl : IWMReaderAdvanced4VTbl*
  end

  struct IWMReaderAdvanced5VTbl
    query_interface : Proc(IWMReaderAdvanced5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAdvanced5*, UInt32)
    release : Proc(IWMReaderAdvanced5*, UInt32)
    set_user_provided_clock : Proc(IWMReaderAdvanced5*, LibC::BOOL, HRESULT)
    get_user_provided_clock : Proc(IWMReaderAdvanced5*, LibC::BOOL*, HRESULT)
    deliver_time : Proc(IWMReaderAdvanced5*, UInt64, HRESULT)
    set_manual_stream_selection : Proc(IWMReaderAdvanced5*, LibC::BOOL, HRESULT)
    get_manual_stream_selection : Proc(IWMReaderAdvanced5*, LibC::BOOL*, HRESULT)
    set_streams_selected : Proc(IWMReaderAdvanced5*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMReaderAdvanced5*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced5*, LibC::BOOL, HRESULT)
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced5*, LibC::BOOL*, HRESULT)
    set_receive_stream_samples : Proc(IWMReaderAdvanced5*, UInt16, LibC::BOOL, HRESULT)
    get_receive_stream_samples : Proc(IWMReaderAdvanced5*, UInt16, LibC::BOOL*, HRESULT)
    set_allocate_for_output : Proc(IWMReaderAdvanced5*, UInt32, LibC::BOOL, HRESULT)
    get_allocate_for_output : Proc(IWMReaderAdvanced5*, UInt32, LibC::BOOL*, HRESULT)
    set_allocate_for_stream : Proc(IWMReaderAdvanced5*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_stream : Proc(IWMReaderAdvanced5*, UInt16, LibC::BOOL*, HRESULT)
    get_statistics : Proc(IWMReaderAdvanced5*, WM_READER_STATISTICS*, HRESULT)
    set_client_info : Proc(IWMReaderAdvanced5*, WM_READER_CLIENTINFO*, HRESULT)
    get_max_output_sample_size : Proc(IWMReaderAdvanced5*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMReaderAdvanced5*, UInt16, UInt32*, HRESULT)
    notify_late_delivery : Proc(IWMReaderAdvanced5*, UInt64, HRESULT)
    set_play_mode : Proc(IWMReaderAdvanced5*, WMT_PLAY_MODE, HRESULT)
    get_play_mode : Proc(IWMReaderAdvanced5*, WMT_PLAY_MODE*, HRESULT)
    get_buffer_progress : Proc(IWMReaderAdvanced5*, UInt32*, UInt64*, HRESULT)
    get_download_progress : Proc(IWMReaderAdvanced5*, UInt32*, UInt64*, UInt64*, HRESULT)
    get_save_as_progress : Proc(IWMReaderAdvanced5*, UInt32*, HRESULT)
    save_file_as : Proc(IWMReaderAdvanced5*, LibC::LPWSTR, HRESULT)
    get_protocol_name : Proc(IWMReaderAdvanced5*, Char*, UInt32*, HRESULT)
    start_at_marker : Proc(IWMReaderAdvanced5*, UInt16, UInt64, Float32, Void*, HRESULT)
    get_output_setting : Proc(IWMReaderAdvanced5*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMReaderAdvanced5*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    preroll : Proc(IWMReaderAdvanced5*, UInt64, UInt64, Float32, HRESULT)
    set_log_client_id : Proc(IWMReaderAdvanced5*, LibC::BOOL, HRESULT)
    get_log_client_id : Proc(IWMReaderAdvanced5*, LibC::BOOL*, HRESULT)
    stop_buffering : Proc(IWMReaderAdvanced5*, HRESULT)
    open_stream : Proc(IWMReaderAdvanced5*, IStream, IWMReaderCallback, Void*, HRESULT)
    stop_net_streaming : Proc(IWMReaderAdvanced5*, HRESULT)
    start_at_position : Proc(IWMReaderAdvanced5*, UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)
    get_language_count : Proc(IWMReaderAdvanced5*, UInt32, UInt16*, HRESULT)
    get_language : Proc(IWMReaderAdvanced5*, UInt32, UInt16, Char*, UInt16*, HRESULT)
    get_max_speed_factor : Proc(IWMReaderAdvanced5*, Float64*, HRESULT)
    is_using_fast_cache : Proc(IWMReaderAdvanced5*, LibC::BOOL*, HRESULT)
    add_log_param : Proc(IWMReaderAdvanced5*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    send_log_params : Proc(IWMReaderAdvanced5*, HRESULT)
    can_save_file_as : Proc(IWMReaderAdvanced5*, LibC::BOOL*, HRESULT)
    cancel_save_file_as : Proc(IWMReaderAdvanced5*, HRESULT)
    get_url : Proc(IWMReaderAdvanced5*, Char*, UInt32*, HRESULT)
    set_player_hook : Proc(IWMReaderAdvanced5*, UInt32, IWMPlayerHook, HRESULT)
  end

  IWMReaderAdvanced5_GUID = LibC::GUID.new("24c44db0-55d1-49ae-a5cc-f13815e36363")
  CLSID_IWMReaderAdvanced5 = "24c44db0-55d1-49ae-a5cc-f13815e36363"
  struct IWMReaderAdvanced5
    lpVtbl : IWMReaderAdvanced5VTbl*
  end

  struct IWMReaderAdvanced6VTbl
    query_interface : Proc(IWMReaderAdvanced6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAdvanced6*, UInt32)
    release : Proc(IWMReaderAdvanced6*, UInt32)
    set_user_provided_clock : Proc(IWMReaderAdvanced6*, LibC::BOOL, HRESULT)
    get_user_provided_clock : Proc(IWMReaderAdvanced6*, LibC::BOOL*, HRESULT)
    deliver_time : Proc(IWMReaderAdvanced6*, UInt64, HRESULT)
    set_manual_stream_selection : Proc(IWMReaderAdvanced6*, LibC::BOOL, HRESULT)
    get_manual_stream_selection : Proc(IWMReaderAdvanced6*, LibC::BOOL*, HRESULT)
    set_streams_selected : Proc(IWMReaderAdvanced6*, UInt16, UInt16*, WMT_STREAM_SELECTION*, HRESULT)
    get_stream_selected : Proc(IWMReaderAdvanced6*, UInt16, WMT_STREAM_SELECTION*, HRESULT)
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced6*, LibC::BOOL, HRESULT)
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced6*, LibC::BOOL*, HRESULT)
    set_receive_stream_samples : Proc(IWMReaderAdvanced6*, UInt16, LibC::BOOL, HRESULT)
    get_receive_stream_samples : Proc(IWMReaderAdvanced6*, UInt16, LibC::BOOL*, HRESULT)
    set_allocate_for_output : Proc(IWMReaderAdvanced6*, UInt32, LibC::BOOL, HRESULT)
    get_allocate_for_output : Proc(IWMReaderAdvanced6*, UInt32, LibC::BOOL*, HRESULT)
    set_allocate_for_stream : Proc(IWMReaderAdvanced6*, UInt16, LibC::BOOL, HRESULT)
    get_allocate_for_stream : Proc(IWMReaderAdvanced6*, UInt16, LibC::BOOL*, HRESULT)
    get_statistics : Proc(IWMReaderAdvanced6*, WM_READER_STATISTICS*, HRESULT)
    set_client_info : Proc(IWMReaderAdvanced6*, WM_READER_CLIENTINFO*, HRESULT)
    get_max_output_sample_size : Proc(IWMReaderAdvanced6*, UInt32, UInt32*, HRESULT)
    get_max_stream_sample_size : Proc(IWMReaderAdvanced6*, UInt16, UInt32*, HRESULT)
    notify_late_delivery : Proc(IWMReaderAdvanced6*, UInt64, HRESULT)
    set_play_mode : Proc(IWMReaderAdvanced6*, WMT_PLAY_MODE, HRESULT)
    get_play_mode : Proc(IWMReaderAdvanced6*, WMT_PLAY_MODE*, HRESULT)
    get_buffer_progress : Proc(IWMReaderAdvanced6*, UInt32*, UInt64*, HRESULT)
    get_download_progress : Proc(IWMReaderAdvanced6*, UInt32*, UInt64*, UInt64*, HRESULT)
    get_save_as_progress : Proc(IWMReaderAdvanced6*, UInt32*, HRESULT)
    save_file_as : Proc(IWMReaderAdvanced6*, LibC::LPWSTR, HRESULT)
    get_protocol_name : Proc(IWMReaderAdvanced6*, Char*, UInt32*, HRESULT)
    start_at_marker : Proc(IWMReaderAdvanced6*, UInt16, UInt64, Float32, Void*, HRESULT)
    get_output_setting : Proc(IWMReaderAdvanced6*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_output_setting : Proc(IWMReaderAdvanced6*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    preroll : Proc(IWMReaderAdvanced6*, UInt64, UInt64, Float32, HRESULT)
    set_log_client_id : Proc(IWMReaderAdvanced6*, LibC::BOOL, HRESULT)
    get_log_client_id : Proc(IWMReaderAdvanced6*, LibC::BOOL*, HRESULT)
    stop_buffering : Proc(IWMReaderAdvanced6*, HRESULT)
    open_stream : Proc(IWMReaderAdvanced6*, IStream, IWMReaderCallback, Void*, HRESULT)
    stop_net_streaming : Proc(IWMReaderAdvanced6*, HRESULT)
    start_at_position : Proc(IWMReaderAdvanced6*, UInt16, Void*, Void*, WMT_OFFSET_FORMAT, Float32, Void*, HRESULT)
    get_language_count : Proc(IWMReaderAdvanced6*, UInt32, UInt16*, HRESULT)
    get_language : Proc(IWMReaderAdvanced6*, UInt32, UInt16, Char*, UInt16*, HRESULT)
    get_max_speed_factor : Proc(IWMReaderAdvanced6*, Float64*, HRESULT)
    is_using_fast_cache : Proc(IWMReaderAdvanced6*, LibC::BOOL*, HRESULT)
    add_log_param : Proc(IWMReaderAdvanced6*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    send_log_params : Proc(IWMReaderAdvanced6*, HRESULT)
    can_save_file_as : Proc(IWMReaderAdvanced6*, LibC::BOOL*, HRESULT)
    cancel_save_file_as : Proc(IWMReaderAdvanced6*, HRESULT)
    get_url : Proc(IWMReaderAdvanced6*, Char*, UInt32*, HRESULT)
    set_player_hook : Proc(IWMReaderAdvanced6*, UInt32, IWMPlayerHook, HRESULT)
    set_protect_stream_samples : Proc(IWMReaderAdvanced6*, UInt8*, UInt32, UInt32, UInt32, UInt8*, UInt32*, HRESULT)
  end

  IWMReaderAdvanced6_GUID = LibC::GUID.new("18a2e7f8-428f-4acd-8a00-e64639bc93de")
  CLSID_IWMReaderAdvanced6 = "18a2e7f8-428f-4acd-8a00-e64639bc93de"
  struct IWMReaderAdvanced6
    lpVtbl : IWMReaderAdvanced6VTbl*
  end

  struct IWMPlayerHookVTbl
    query_interface : Proc(IWMPlayerHook*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPlayerHook*, UInt32)
    release : Proc(IWMPlayerHook*, UInt32)
    pre_decode : Proc(IWMPlayerHook*, HRESULT)
  end

  IWMPlayerHook_GUID = LibC::GUID.new("e5b7ca9a-0f1c-4f66-9002-74ec50d8b304")
  CLSID_IWMPlayerHook = "e5b7ca9a-0f1c-4f66-9002-74ec50d8b304"
  struct IWMPlayerHook
    lpVtbl : IWMPlayerHookVTbl*
  end

  struct IWMReaderAllocatorExVTbl
    query_interface : Proc(IWMReaderAllocatorEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAllocatorEx*, UInt32)
    release : Proc(IWMReaderAllocatorEx*, UInt32)
    allocate_for_stream_ex : Proc(IWMReaderAllocatorEx*, UInt16, UInt32, INSSBuffer*, UInt32, UInt64, UInt64, Void*, HRESULT)
    allocate_for_output_ex : Proc(IWMReaderAllocatorEx*, UInt32, UInt32, INSSBuffer*, UInt32, UInt64, UInt64, Void*, HRESULT)
  end

  IWMReaderAllocatorEx_GUID = LibC::GUID.new("9f762fa7-a22e-428d-93c9-ac82f3aafe5a")
  CLSID_IWMReaderAllocatorEx = "9f762fa7-a22e-428d-93c9-ac82f3aafe5a"
  struct IWMReaderAllocatorEx
    lpVtbl : IWMReaderAllocatorExVTbl*
  end

  struct IWMReaderTypeNegotiationVTbl
    query_interface : Proc(IWMReaderTypeNegotiation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderTypeNegotiation*, UInt32)
    release : Proc(IWMReaderTypeNegotiation*, UInt32)
    try_output_props : Proc(IWMReaderTypeNegotiation*, UInt32, IWMOutputMediaProps, HRESULT)
  end

  IWMReaderTypeNegotiation_GUID = LibC::GUID.new("fdbe5592-81a1-41ea-93bd-735cad1adc05")
  CLSID_IWMReaderTypeNegotiation = "fdbe5592-81a1-41ea-93bd-735cad1adc05"
  struct IWMReaderTypeNegotiation
    lpVtbl : IWMReaderTypeNegotiationVTbl*
  end

  struct IWMReaderCallbackAdvancedVTbl
    query_interface : Proc(IWMReaderCallbackAdvanced*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderCallbackAdvanced*, UInt32)
    release : Proc(IWMReaderCallbackAdvanced*, UInt32)
    on_stream_sample : Proc(IWMReaderCallbackAdvanced*, UInt16, UInt64, UInt64, UInt32, INSSBuffer, Void*, HRESULT)
    on_time : Proc(IWMReaderCallbackAdvanced*, UInt64, Void*, HRESULT)
    on_stream_selection : Proc(IWMReaderCallbackAdvanced*, UInt16, UInt16*, WMT_STREAM_SELECTION*, Void*, HRESULT)
    on_output_props_changed : Proc(IWMReaderCallbackAdvanced*, UInt32, WM_MEDIA_TYPE*, Void*, HRESULT)
    allocate_for_stream : Proc(IWMReaderCallbackAdvanced*, UInt16, UInt32, INSSBuffer*, Void*, HRESULT)
    allocate_for_output : Proc(IWMReaderCallbackAdvanced*, UInt32, UInt32, INSSBuffer*, Void*, HRESULT)
  end

  IWMReaderCallbackAdvanced_GUID = LibC::GUID.new("96406beb-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMReaderCallbackAdvanced = "96406beb-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMReaderCallbackAdvanced
    lpVtbl : IWMReaderCallbackAdvancedVTbl*
  end

  struct IWMDRMReaderVTbl
    query_interface : Proc(IWMDRMReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMReader*, UInt32)
    release : Proc(IWMDRMReader*, UInt32)
    acquire_license : Proc(IWMDRMReader*, UInt32, HRESULT)
    cancel_license_acquisition : Proc(IWMDRMReader*, HRESULT)
    individualize : Proc(IWMDRMReader*, UInt32, HRESULT)
    cancel_individualization : Proc(IWMDRMReader*, HRESULT)
    monitor_license_acquisition : Proc(IWMDRMReader*, HRESULT)
    cancel_monitor_license_acquisition : Proc(IWMDRMReader*, HRESULT)
    set_drm_property : Proc(IWMDRMReader*, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_drm_property : Proc(IWMDRMReader*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
  end

  IWMDRMReader_GUID = LibC::GUID.new("d2827540-3ee7-432c-b14c-dc17f085d3b3")
  CLSID_IWMDRMReader = "d2827540-3ee7-432c-b14c-dc17f085d3b3"
  struct IWMDRMReader
    lpVtbl : IWMDRMReaderVTbl*
  end

  struct IWMDRMReader2VTbl
    query_interface : Proc(IWMDRMReader2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMReader2*, UInt32)
    release : Proc(IWMDRMReader2*, UInt32)
    acquire_license : Proc(IWMDRMReader2*, UInt32, HRESULT)
    cancel_license_acquisition : Proc(IWMDRMReader2*, HRESULT)
    individualize : Proc(IWMDRMReader2*, UInt32, HRESULT)
    cancel_individualization : Proc(IWMDRMReader2*, HRESULT)
    monitor_license_acquisition : Proc(IWMDRMReader2*, HRESULT)
    cancel_monitor_license_acquisition : Proc(IWMDRMReader2*, HRESULT)
    set_drm_property : Proc(IWMDRMReader2*, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_drm_property : Proc(IWMDRMReader2*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_evaluate_output_level_licenses : Proc(IWMDRMReader2*, LibC::BOOL, HRESULT)
    get_play_output_levels : Proc(IWMDRMReader2*, DRM_PLAY_OPL*, UInt32*, UInt32*, HRESULT)
    get_copy_output_levels : Proc(IWMDRMReader2*, DRM_COPY_OPL*, UInt32*, UInt32*, HRESULT)
    try_next_license : Proc(IWMDRMReader2*, HRESULT)
  end

  IWMDRMReader2_GUID = LibC::GUID.new("befe7a75-9f1d-4075-b9d9-a3c37bda49a0")
  CLSID_IWMDRMReader2 = "befe7a75-9f1d-4075-b9d9-a3c37bda49a0"
  struct IWMDRMReader2
    lpVtbl : IWMDRMReader2VTbl*
  end

  struct IWMDRMReader3VTbl
    query_interface : Proc(IWMDRMReader3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMReader3*, UInt32)
    release : Proc(IWMDRMReader3*, UInt32)
    acquire_license : Proc(IWMDRMReader3*, UInt32, HRESULT)
    cancel_license_acquisition : Proc(IWMDRMReader3*, HRESULT)
    individualize : Proc(IWMDRMReader3*, UInt32, HRESULT)
    cancel_individualization : Proc(IWMDRMReader3*, HRESULT)
    monitor_license_acquisition : Proc(IWMDRMReader3*, HRESULT)
    cancel_monitor_license_acquisition : Proc(IWMDRMReader3*, HRESULT)
    set_drm_property : Proc(IWMDRMReader3*, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    get_drm_property : Proc(IWMDRMReader3*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_evaluate_output_level_licenses : Proc(IWMDRMReader3*, LibC::BOOL, HRESULT)
    get_play_output_levels : Proc(IWMDRMReader3*, DRM_PLAY_OPL*, UInt32*, UInt32*, HRESULT)
    get_copy_output_levels : Proc(IWMDRMReader3*, DRM_COPY_OPL*, UInt32*, UInt32*, HRESULT)
    try_next_license : Proc(IWMDRMReader3*, HRESULT)
    get_inclusion_list : Proc(IWMDRMReader3*, Guid**, UInt32*, HRESULT)
  end

  IWMDRMReader3_GUID = LibC::GUID.new("e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8")
  CLSID_IWMDRMReader3 = "e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8"
  struct IWMDRMReader3
    lpVtbl : IWMDRMReader3VTbl*
  end

  struct IWMReaderPlaylistBurnVTbl
    query_interface : Proc(IWMReaderPlaylistBurn*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderPlaylistBurn*, UInt32)
    release : Proc(IWMReaderPlaylistBurn*, UInt32)
    init_playlist_burn : Proc(IWMReaderPlaylistBurn*, UInt32, LibC::LPWSTR*, IWMStatusCallback, Void*, HRESULT)
    get_init_results : Proc(IWMReaderPlaylistBurn*, UInt32, HRESULT*, HRESULT)
    cancel : Proc(IWMReaderPlaylistBurn*, HRESULT)
    end_playlist_burn : Proc(IWMReaderPlaylistBurn*, HRESULT, HRESULT)
  end

  IWMReaderPlaylistBurn_GUID = LibC::GUID.new("f28c0300-9baa-4477-a846-1744d9cbf533")
  CLSID_IWMReaderPlaylistBurn = "f28c0300-9baa-4477-a846-1744d9cbf533"
  struct IWMReaderPlaylistBurn
    lpVtbl : IWMReaderPlaylistBurnVTbl*
  end

  struct IWMReaderNetworkConfigVTbl
    query_interface : Proc(IWMReaderNetworkConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderNetworkConfig*, UInt32)
    release : Proc(IWMReaderNetworkConfig*, UInt32)
    get_buffering_time : Proc(IWMReaderNetworkConfig*, UInt64*, HRESULT)
    set_buffering_time : Proc(IWMReaderNetworkConfig*, UInt64, HRESULT)
    get_udp_port_ranges : Proc(IWMReaderNetworkConfig*, WM_PORT_NUMBER_RANGE*, UInt32*, HRESULT)
    set_udp_port_ranges : Proc(IWMReaderNetworkConfig*, WM_PORT_NUMBER_RANGE*, UInt32, HRESULT)
    get_proxy_settings : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, WMT_PROXY_SETTINGS*, HRESULT)
    set_proxy_settings : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, WMT_PROXY_SETTINGS, HRESULT)
    get_proxy_host_name : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, Char*, UInt32*, HRESULT)
    set_proxy_host_name : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_port : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, UInt32*, HRESULT)
    set_proxy_port : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, UInt32, HRESULT)
    get_proxy_exception_list : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, Char*, UInt32*, HRESULT)
    set_proxy_exception_list : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    set_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig*, LibC::BOOL*, HRESULT)
    set_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig*, LibC::BOOL, HRESULT)
    get_enable_multicast : Proc(IWMReaderNetworkConfig*, LibC::BOOL*, HRESULT)
    set_enable_multicast : Proc(IWMReaderNetworkConfig*, LibC::BOOL, HRESULT)
    get_enable_http : Proc(IWMReaderNetworkConfig*, LibC::BOOL*, HRESULT)
    set_enable_http : Proc(IWMReaderNetworkConfig*, LibC::BOOL, HRESULT)
    get_enable_udp : Proc(IWMReaderNetworkConfig*, LibC::BOOL*, HRESULT)
    set_enable_udp : Proc(IWMReaderNetworkConfig*, LibC::BOOL, HRESULT)
    get_enable_tcp : Proc(IWMReaderNetworkConfig*, LibC::BOOL*, HRESULT)
    set_enable_tcp : Proc(IWMReaderNetworkConfig*, LibC::BOOL, HRESULT)
    reset_protocol_rollover : Proc(IWMReaderNetworkConfig*, HRESULT)
    get_connection_bandwidth : Proc(IWMReaderNetworkConfig*, UInt32*, HRESULT)
    set_connection_bandwidth : Proc(IWMReaderNetworkConfig*, UInt32, HRESULT)
    get_num_protocols_supported : Proc(IWMReaderNetworkConfig*, UInt32*, HRESULT)
    get_supported_protocol_name : Proc(IWMReaderNetworkConfig*, UInt32, Char*, UInt32*, HRESULT)
    add_logging_url : Proc(IWMReaderNetworkConfig*, LibC::LPWSTR, HRESULT)
    get_logging_url : Proc(IWMReaderNetworkConfig*, UInt32, Char*, UInt32*, HRESULT)
    get_logging_url_count : Proc(IWMReaderNetworkConfig*, UInt32*, HRESULT)
    reset_logging_url_list : Proc(IWMReaderNetworkConfig*, HRESULT)
  end

  IWMReaderNetworkConfig_GUID = LibC::GUID.new("96406bec-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMReaderNetworkConfig = "96406bec-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMReaderNetworkConfig
    lpVtbl : IWMReaderNetworkConfigVTbl*
  end

  struct IWMReaderNetworkConfig2VTbl
    query_interface : Proc(IWMReaderNetworkConfig2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderNetworkConfig2*, UInt32)
    release : Proc(IWMReaderNetworkConfig2*, UInt32)
    get_buffering_time : Proc(IWMReaderNetworkConfig2*, UInt64*, HRESULT)
    set_buffering_time : Proc(IWMReaderNetworkConfig2*, UInt64, HRESULT)
    get_udp_port_ranges : Proc(IWMReaderNetworkConfig2*, WM_PORT_NUMBER_RANGE*, UInt32*, HRESULT)
    set_udp_port_ranges : Proc(IWMReaderNetworkConfig2*, WM_PORT_NUMBER_RANGE*, UInt32, HRESULT)
    get_proxy_settings : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, WMT_PROXY_SETTINGS*, HRESULT)
    set_proxy_settings : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, WMT_PROXY_SETTINGS, HRESULT)
    get_proxy_host_name : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, Char*, UInt32*, HRESULT)
    set_proxy_host_name : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_port : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, UInt32*, HRESULT)
    set_proxy_port : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, UInt32, HRESULT)
    get_proxy_exception_list : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, Char*, UInt32*, HRESULT)
    set_proxy_exception_list : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    set_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, LibC::BOOL, HRESULT)
    get_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_enable_multicast : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_multicast : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_enable_http : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_http : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_enable_udp : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_udp : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_enable_tcp : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_tcp : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    reset_protocol_rollover : Proc(IWMReaderNetworkConfig2*, HRESULT)
    get_connection_bandwidth : Proc(IWMReaderNetworkConfig2*, UInt32*, HRESULT)
    set_connection_bandwidth : Proc(IWMReaderNetworkConfig2*, UInt32, HRESULT)
    get_num_protocols_supported : Proc(IWMReaderNetworkConfig2*, UInt32*, HRESULT)
    get_supported_protocol_name : Proc(IWMReaderNetworkConfig2*, UInt32, Char*, UInt32*, HRESULT)
    add_logging_url : Proc(IWMReaderNetworkConfig2*, LibC::LPWSTR, HRESULT)
    get_logging_url : Proc(IWMReaderNetworkConfig2*, UInt32, Char*, UInt32*, HRESULT)
    get_logging_url_count : Proc(IWMReaderNetworkConfig2*, UInt32*, HRESULT)
    reset_logging_url_list : Proc(IWMReaderNetworkConfig2*, HRESULT)
    get_enable_content_caching : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_content_caching : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_enable_fast_cache : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_fast_cache : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_accelerated_streaming_duration : Proc(IWMReaderNetworkConfig2*, UInt64*, HRESULT)
    set_accelerated_streaming_duration : Proc(IWMReaderNetworkConfig2*, UInt64, HRESULT)
    get_auto_reconnect_limit : Proc(IWMReaderNetworkConfig2*, UInt32*, HRESULT)
    set_auto_reconnect_limit : Proc(IWMReaderNetworkConfig2*, UInt32, HRESULT)
    get_enable_resends : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_resends : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_enable_thinning : Proc(IWMReaderNetworkConfig2*, LibC::BOOL*, HRESULT)
    set_enable_thinning : Proc(IWMReaderNetworkConfig2*, LibC::BOOL, HRESULT)
    get_max_net_packet_size : Proc(IWMReaderNetworkConfig2*, UInt32*, HRESULT)
  end

  IWMReaderNetworkConfig2_GUID = LibC::GUID.new("d979a853-042b-4050-8387-c939db22013f")
  CLSID_IWMReaderNetworkConfig2 = "d979a853-042b-4050-8387-c939db22013f"
  struct IWMReaderNetworkConfig2
    lpVtbl : IWMReaderNetworkConfig2VTbl*
  end

  struct IWMReaderStreamClockVTbl
    query_interface : Proc(IWMReaderStreamClock*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderStreamClock*, UInt32)
    release : Proc(IWMReaderStreamClock*, UInt32)
    get_time : Proc(IWMReaderStreamClock*, UInt64*, HRESULT)
    set_timer : Proc(IWMReaderStreamClock*, UInt64, Void*, UInt32*, HRESULT)
    kill_timer : Proc(IWMReaderStreamClock*, UInt32, HRESULT)
  end

  IWMReaderStreamClock_GUID = LibC::GUID.new("96406bed-2b2b-11d3-b36b-00c04f6108ff")
  CLSID_IWMReaderStreamClock = "96406bed-2b2b-11d3-b36b-00c04f6108ff"
  struct IWMReaderStreamClock
    lpVtbl : IWMReaderStreamClockVTbl*
  end

  struct IWMIndexerVTbl
    query_interface : Proc(IWMIndexer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMIndexer*, UInt32)
    release : Proc(IWMIndexer*, UInt32)
    start_indexing : Proc(IWMIndexer*, LibC::LPWSTR, IWMStatusCallback, Void*, HRESULT)
    cancel : Proc(IWMIndexer*, HRESULT)
  end

  IWMIndexer_GUID = LibC::GUID.new("6d7cdc71-9888-11d3-8edc-00c04f6109cf")
  CLSID_IWMIndexer = "6d7cdc71-9888-11d3-8edc-00c04f6109cf"
  struct IWMIndexer
    lpVtbl : IWMIndexerVTbl*
  end

  struct IWMIndexer2VTbl
    query_interface : Proc(IWMIndexer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMIndexer2*, UInt32)
    release : Proc(IWMIndexer2*, UInt32)
    start_indexing : Proc(IWMIndexer2*, LibC::LPWSTR, IWMStatusCallback, Void*, HRESULT)
    cancel : Proc(IWMIndexer2*, HRESULT)
    configure : Proc(IWMIndexer2*, UInt16, WMT_INDEXER_TYPE, Void*, Void*, HRESULT)
  end

  IWMIndexer2_GUID = LibC::GUID.new("b70f1e42-6255-4df0-a6b9-02b212d9e2bb")
  CLSID_IWMIndexer2 = "b70f1e42-6255-4df0-a6b9-02b212d9e2bb"
  struct IWMIndexer2
    lpVtbl : IWMIndexer2VTbl*
  end

  struct IWMLicenseBackupVTbl
    query_interface : Proc(IWMLicenseBackup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMLicenseBackup*, UInt32)
    release : Proc(IWMLicenseBackup*, UInt32)
    backup_licenses : Proc(IWMLicenseBackup*, UInt32, IWMStatusCallback, HRESULT)
    cancel_license_backup : Proc(IWMLicenseBackup*, HRESULT)
  end

  IWMLicenseBackup_GUID = LibC::GUID.new("05e5ac9f-3fb6-4508-bb43-a4067ba1ebe8")
  CLSID_IWMLicenseBackup = "05e5ac9f-3fb6-4508-bb43-a4067ba1ebe8"
  struct IWMLicenseBackup
    lpVtbl : IWMLicenseBackupVTbl*
  end

  struct IWMLicenseRestoreVTbl
    query_interface : Proc(IWMLicenseRestore*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMLicenseRestore*, UInt32)
    release : Proc(IWMLicenseRestore*, UInt32)
    restore_licenses : Proc(IWMLicenseRestore*, UInt32, IWMStatusCallback, HRESULT)
    cancel_license_restore : Proc(IWMLicenseRestore*, HRESULT)
  end

  IWMLicenseRestore_GUID = LibC::GUID.new("c70b6334-a22e-4efb-a245-15e65a004a13")
  CLSID_IWMLicenseRestore = "c70b6334-a22e-4efb-a245-15e65a004a13"
  struct IWMLicenseRestore
    lpVtbl : IWMLicenseRestoreVTbl*
  end

  struct IWMBackupRestorePropsVTbl
    query_interface : Proc(IWMBackupRestoreProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMBackupRestoreProps*, UInt32)
    release : Proc(IWMBackupRestoreProps*, UInt32)
    get_prop_count : Proc(IWMBackupRestoreProps*, UInt16*, HRESULT)
    get_prop_by_index : Proc(IWMBackupRestoreProps*, UInt16, Char*, UInt16*, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    get_prop_by_name : Proc(IWMBackupRestoreProps*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
    set_prop : Proc(IWMBackupRestoreProps*, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt16, HRESULT)
    remove_prop : Proc(IWMBackupRestoreProps*, LibC::LPWSTR, HRESULT)
    remove_all_props : Proc(IWMBackupRestoreProps*, HRESULT)
  end

  IWMBackupRestoreProps_GUID = LibC::GUID.new("3c8e0da6-996f-4ff3-a1af-4838f9377e2e")
  CLSID_IWMBackupRestoreProps = "3c8e0da6-996f-4ff3-a1af-4838f9377e2e"
  struct IWMBackupRestoreProps
    lpVtbl : IWMBackupRestorePropsVTbl*
  end

  struct IWMCodecInfoVTbl
    query_interface : Proc(IWMCodecInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCodecInfo*, UInt32)
    release : Proc(IWMCodecInfo*, UInt32)
    get_codec_info_count : Proc(IWMCodecInfo*, Guid*, UInt32*, HRESULT)
    get_codec_format_count : Proc(IWMCodecInfo*, Guid*, UInt32, UInt32*, HRESULT)
    get_codec_format : Proc(IWMCodecInfo*, Guid*, UInt32, UInt32, IWMStreamConfig*, HRESULT)
  end

  IWMCodecInfo_GUID = LibC::GUID.new("a970f41e-34de-4a98-b3ba-e4b3ca7528f0")
  CLSID_IWMCodecInfo = "a970f41e-34de-4a98-b3ba-e4b3ca7528f0"
  struct IWMCodecInfo
    lpVtbl : IWMCodecInfoVTbl*
  end

  struct IWMCodecInfo2VTbl
    query_interface : Proc(IWMCodecInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCodecInfo2*, UInt32)
    release : Proc(IWMCodecInfo2*, UInt32)
    get_codec_info_count : Proc(IWMCodecInfo2*, Guid*, UInt32*, HRESULT)
    get_codec_format_count : Proc(IWMCodecInfo2*, Guid*, UInt32, UInt32*, HRESULT)
    get_codec_format : Proc(IWMCodecInfo2*, Guid*, UInt32, UInt32, IWMStreamConfig*, HRESULT)
    get_codec_name : Proc(IWMCodecInfo2*, Guid*, UInt32, Char*, UInt32*, HRESULT)
    get_codec_format_desc : Proc(IWMCodecInfo2*, Guid*, UInt32, UInt32, IWMStreamConfig*, Char*, UInt32*, HRESULT)
  end

  IWMCodecInfo2_GUID = LibC::GUID.new("aa65e273-b686-4056-91ec-dd768d4df710")
  CLSID_IWMCodecInfo2 = "aa65e273-b686-4056-91ec-dd768d4df710"
  struct IWMCodecInfo2
    lpVtbl : IWMCodecInfo2VTbl*
  end

  struct IWMCodecInfo3VTbl
    query_interface : Proc(IWMCodecInfo3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCodecInfo3*, UInt32)
    release : Proc(IWMCodecInfo3*, UInt32)
    get_codec_info_count : Proc(IWMCodecInfo3*, Guid*, UInt32*, HRESULT)
    get_codec_format_count : Proc(IWMCodecInfo3*, Guid*, UInt32, UInt32*, HRESULT)
    get_codec_format : Proc(IWMCodecInfo3*, Guid*, UInt32, UInt32, IWMStreamConfig*, HRESULT)
    get_codec_name : Proc(IWMCodecInfo3*, Guid*, UInt32, Char*, UInt32*, HRESULT)
    get_codec_format_desc : Proc(IWMCodecInfo3*, Guid*, UInt32, UInt32, IWMStreamConfig*, Char*, UInt32*, HRESULT)
    get_codec_format_prop : Proc(IWMCodecInfo3*, Guid*, UInt32, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
    get_codec_prop : Proc(IWMCodecInfo3*, Guid*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
    set_codec_enumeration_setting : Proc(IWMCodecInfo3*, Guid*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE, UInt8*, UInt32, HRESULT)
    get_codec_enumeration_setting : Proc(IWMCodecInfo3*, Guid*, UInt32, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
  end

  IWMCodecInfo3_GUID = LibC::GUID.new("7e51f487-4d93-4f98-8ab4-27d0565adc51")
  CLSID_IWMCodecInfo3 = "7e51f487-4d93-4f98-8ab4-27d0565adc51"
  struct IWMCodecInfo3
    lpVtbl : IWMCodecInfo3VTbl*
  end

  struct IWMLanguageListVTbl
    query_interface : Proc(IWMLanguageList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMLanguageList*, UInt32)
    release : Proc(IWMLanguageList*, UInt32)
    get_language_count : Proc(IWMLanguageList*, UInt16*, HRESULT)
    get_language_details : Proc(IWMLanguageList*, UInt16, Char*, UInt16*, HRESULT)
    add_language_by_rfc1766_string : Proc(IWMLanguageList*, LibC::LPWSTR, UInt16*, HRESULT)
  end

  IWMLanguageList_GUID = LibC::GUID.new("df683f00-2d49-4d8e-92b7-fb19f6a0dc57")
  CLSID_IWMLanguageList = "df683f00-2d49-4d8e-92b7-fb19f6a0dc57"
  struct IWMLanguageList
    lpVtbl : IWMLanguageListVTbl*
  end

  struct IWMWriterPushSinkVTbl
    query_interface : Proc(IWMWriterPushSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWriterPushSink*, UInt32)
    release : Proc(IWMWriterPushSink*, UInt32)
    on_header : Proc(IWMWriterPushSink*, INSSBuffer, HRESULT)
    is_real_time : Proc(IWMWriterPushSink*, LibC::BOOL*, HRESULT)
    allocate_data_unit : Proc(IWMWriterPushSink*, UInt32, INSSBuffer*, HRESULT)
    on_data_unit : Proc(IWMWriterPushSink*, INSSBuffer, HRESULT)
    on_end_writing : Proc(IWMWriterPushSink*, HRESULT)
    connect : Proc(IWMWriterPushSink*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
    disconnect : Proc(IWMWriterPushSink*, HRESULT)
    end_session : Proc(IWMWriterPushSink*, HRESULT)
  end

  IWMWriterPushSink_GUID = LibC::GUID.new("dc10e6a5-072c-467d-bf57-6330a9dde12a")
  CLSID_IWMWriterPushSink = "dc10e6a5-072c-467d-bf57-6330a9dde12a"
  struct IWMWriterPushSink
    lpVtbl : IWMWriterPushSinkVTbl*
  end

  struct IWMDeviceRegistrationVTbl
    query_interface : Proc(IWMDeviceRegistration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDeviceRegistration*, UInt32)
    release : Proc(IWMDeviceRegistration*, UInt32)
    register_device : Proc(IWMDeviceRegistration*, UInt32, UInt8*, UInt32, DRM_VAL16, IWMRegisteredDevice*, HRESULT)
    unregister_device : Proc(IWMDeviceRegistration*, UInt32, UInt8*, UInt32, DRM_VAL16, HRESULT)
    get_registration_stats : Proc(IWMDeviceRegistration*, UInt32, UInt32*, HRESULT)
    get_first_registered_device : Proc(IWMDeviceRegistration*, UInt32, IWMRegisteredDevice*, HRESULT)
    get_next_registered_device : Proc(IWMDeviceRegistration*, IWMRegisteredDevice*, HRESULT)
    get_registered_device_by_id : Proc(IWMDeviceRegistration*, UInt32, UInt8*, UInt32, DRM_VAL16, IWMRegisteredDevice*, HRESULT)
  end

  IWMDeviceRegistration_GUID = LibC::GUID.new("f6211f03-8d21-4e94-93e6-8510805f2d99")
  CLSID_IWMDeviceRegistration = "f6211f03-8d21-4e94-93e6-8510805f2d99"
  struct IWMDeviceRegistration
    lpVtbl : IWMDeviceRegistrationVTbl*
  end

  struct IWMRegisteredDeviceVTbl
    query_interface : Proc(IWMRegisteredDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMRegisteredDevice*, UInt32)
    release : Proc(IWMRegisteredDevice*, UInt32)
    get_device_serial_number : Proc(IWMRegisteredDevice*, DRM_VAL16*, HRESULT)
    get_device_certificate : Proc(IWMRegisteredDevice*, INSSBuffer*, HRESULT)
    get_device_type : Proc(IWMRegisteredDevice*, UInt32*, HRESULT)
    get_attribute_count : Proc(IWMRegisteredDevice*, UInt32*, HRESULT)
    get_attribute_by_index : Proc(IWMRegisteredDevice*, UInt32, UInt8**, UInt8**, HRESULT)
    get_attribute_by_name : Proc(IWMRegisteredDevice*, UInt8*, UInt8**, HRESULT)
    set_attribute_by_name : Proc(IWMRegisteredDevice*, UInt8*, UInt8*, HRESULT)
    approve : Proc(IWMRegisteredDevice*, LibC::BOOL, HRESULT)
    is_valid : Proc(IWMRegisteredDevice*, LibC::BOOL*, HRESULT)
    is_approved : Proc(IWMRegisteredDevice*, LibC::BOOL*, HRESULT)
    is_wmdrm_compliant : Proc(IWMRegisteredDevice*, LibC::BOOL*, HRESULT)
    is_opened : Proc(IWMRegisteredDevice*, LibC::BOOL*, HRESULT)
    open : Proc(IWMRegisteredDevice*, HRESULT)
    close : Proc(IWMRegisteredDevice*, HRESULT)
  end

  IWMRegisteredDevice_GUID = LibC::GUID.new("a4503bec-5508-4148-97ac-bfa75760a70d")
  CLSID_IWMRegisteredDevice = "a4503bec-5508-4148-97ac-bfa75760a70d"
  struct IWMRegisteredDevice
    lpVtbl : IWMRegisteredDeviceVTbl*
  end

  struct IWMProximityDetectionVTbl
    query_interface : Proc(IWMProximityDetection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProximityDetection*, UInt32)
    release : Proc(IWMProximityDetection*, UInt32)
    start_detection : Proc(IWMProximityDetection*, UInt8*, UInt32, UInt8*, UInt32, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)
  end

  IWMProximityDetection_GUID = LibC::GUID.new("6a9fd8ee-b651-4bf0-b849-7d4ece79a2b1")
  CLSID_IWMProximityDetection = "6a9fd8ee-b651-4bf0-b849-7d4ece79a2b1"
  struct IWMProximityDetection
    lpVtbl : IWMProximityDetectionVTbl*
  end

  struct IWMDRMMessageParserVTbl
    query_interface : Proc(IWMDRMMessageParser*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMMessageParser*, UInt32)
    release : Proc(IWMDRMMessageParser*, UInt32)
    parse_registration_req_msg : Proc(IWMDRMMessageParser*, UInt8*, UInt32, INSSBuffer*, DRM_VAL16*, HRESULT)
    parse_license_request_msg : Proc(IWMDRMMessageParser*, UInt8*, UInt32, INSSBuffer*, DRM_VAL16*, UInt8**, HRESULT)
  end

  IWMDRMMessageParser_GUID = LibC::GUID.new("a73a0072-25a0-4c99-b4a5-ede8101a6c39")
  CLSID_IWMDRMMessageParser = "a73a0072-25a0-4c99-b4a5-ede8101a6c39"
  struct IWMDRMMessageParser
    lpVtbl : IWMDRMMessageParserVTbl*
  end

  struct IWMDRMTranscryptorVTbl
    query_interface : Proc(IWMDRMTranscryptor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMTranscryptor*, UInt32)
    release : Proc(IWMDRMTranscryptor*, UInt32)
    initialize : Proc(IWMDRMTranscryptor*, UInt8*, UInt8*, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)
    seek : Proc(IWMDRMTranscryptor*, UInt64, HRESULT)
    read : Proc(IWMDRMTranscryptor*, UInt8*, UInt32*, HRESULT)
    close : Proc(IWMDRMTranscryptor*, HRESULT)
  end

  IWMDRMTranscryptor_GUID = LibC::GUID.new("69059850-6e6f-4bb2-806f-71863ddfc471")
  CLSID_IWMDRMTranscryptor = "69059850-6e6f-4bb2-806f-71863ddfc471"
  struct IWMDRMTranscryptor
    lpVtbl : IWMDRMTranscryptorVTbl*
  end

  struct IWMDRMTranscryptor2VTbl
    query_interface : Proc(IWMDRMTranscryptor2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMTranscryptor2*, UInt32)
    release : Proc(IWMDRMTranscryptor2*, UInt32)
    initialize : Proc(IWMDRMTranscryptor2*, UInt8*, UInt8*, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)
    seek : Proc(IWMDRMTranscryptor2*, UInt64, HRESULT)
    read : Proc(IWMDRMTranscryptor2*, UInt8*, UInt32*, HRESULT)
    close : Proc(IWMDRMTranscryptor2*, HRESULT)
    seek_ex : Proc(IWMDRMTranscryptor2*, UInt64, UInt64, Float32, LibC::BOOL, HRESULT)
    zero_adjust_timestamps : Proc(IWMDRMTranscryptor2*, LibC::BOOL, HRESULT)
    get_seek_start_time : Proc(IWMDRMTranscryptor2*, UInt64*, HRESULT)
    get_duration : Proc(IWMDRMTranscryptor2*, UInt64*, HRESULT)
  end

  IWMDRMTranscryptor2_GUID = LibC::GUID.new("e0da439f-d331-496a-bece-18e5bac5dd23")
  CLSID_IWMDRMTranscryptor2 = "e0da439f-d331-496a-bece-18e5bac5dd23"
  struct IWMDRMTranscryptor2
    lpVtbl : IWMDRMTranscryptor2VTbl*
  end

  struct IWMDRMTranscryptionManagerVTbl
    query_interface : Proc(IWMDRMTranscryptionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMTranscryptionManager*, UInt32)
    release : Proc(IWMDRMTranscryptionManager*, UInt32)
    create_transcryptor : Proc(IWMDRMTranscryptionManager*, IWMDRMTranscryptor*, HRESULT)
  end

  IWMDRMTranscryptionManager_GUID = LibC::GUID.new("b1a887b2-a4f0-407a-b02e-efbd23bbecdf")
  CLSID_IWMDRMTranscryptionManager = "b1a887b2-a4f0-407a-b02e-efbd23bbecdf"
  struct IWMDRMTranscryptionManager
    lpVtbl : IWMDRMTranscryptionManagerVTbl*
  end

  struct IWMWatermarkInfoVTbl
    query_interface : Proc(IWMWatermarkInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMWatermarkInfo*, UInt32)
    release : Proc(IWMWatermarkInfo*, UInt32)
    get_watermark_entry_count : Proc(IWMWatermarkInfo*, WMT_WATERMARK_ENTRY_TYPE, UInt32*, HRESULT)
    get_watermark_entry : Proc(IWMWatermarkInfo*, WMT_WATERMARK_ENTRY_TYPE, UInt32, WMT_WATERMARK_ENTRY*, HRESULT)
  end

  IWMWatermarkInfo_GUID = LibC::GUID.new("6f497062-f2e2-4624-8ea7-9dd40d81fc8d")
  CLSID_IWMWatermarkInfo = "6f497062-f2e2-4624-8ea7-9dd40d81fc8d"
  struct IWMWatermarkInfo
    lpVtbl : IWMWatermarkInfoVTbl*
  end

  struct IWMReaderAcceleratorVTbl
    query_interface : Proc(IWMReaderAccelerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderAccelerator*, UInt32)
    release : Proc(IWMReaderAccelerator*, UInt32)
    get_codec_interface : Proc(IWMReaderAccelerator*, UInt32, Guid*, Void**, HRESULT)
    notify : Proc(IWMReaderAccelerator*, UInt32, WM_MEDIA_TYPE*, HRESULT)
  end

  IWMReaderAccelerator_GUID = LibC::GUID.new("bddc4d08-944d-4d52-a612-46c3fda07dd4")
  CLSID_IWMReaderAccelerator = "bddc4d08-944d-4d52-a612-46c3fda07dd4"
  struct IWMReaderAccelerator
    lpVtbl : IWMReaderAcceleratorVTbl*
  end

  struct IWMReaderTimecodeVTbl
    query_interface : Proc(IWMReaderTimecode*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderTimecode*, UInt32)
    release : Proc(IWMReaderTimecode*, UInt32)
    get_timecode_range_count : Proc(IWMReaderTimecode*, UInt16, UInt16*, HRESULT)
    get_timecode_range_bounds : Proc(IWMReaderTimecode*, UInt16, UInt16, UInt32*, UInt32*, HRESULT)
  end

  IWMReaderTimecode_GUID = LibC::GUID.new("f369e2f0-e081-4fe6-8450-b810b2f410d1")
  CLSID_IWMReaderTimecode = "f369e2f0-e081-4fe6-8450-b810b2f410d1"
  struct IWMReaderTimecode
    lpVtbl : IWMReaderTimecodeVTbl*
  end

  struct IWMAddressAccessVTbl
    query_interface : Proc(IWMAddressAccess*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMAddressAccess*, UInt32)
    release : Proc(IWMAddressAccess*, UInt32)
    get_access_entry_count : Proc(IWMAddressAccess*, WM_AETYPE, UInt32*, HRESULT)
    get_access_entry : Proc(IWMAddressAccess*, WM_AETYPE, UInt32, WM_ADDRESS_ACCESSENTRY*, HRESULT)
    add_access_entry : Proc(IWMAddressAccess*, WM_AETYPE, WM_ADDRESS_ACCESSENTRY*, HRESULT)
    remove_access_entry : Proc(IWMAddressAccess*, WM_AETYPE, UInt32, HRESULT)
  end

  IWMAddressAccess_GUID = LibC::GUID.new("bb3c6389-1633-4e92-af14-9f3173ba39d0")
  CLSID_IWMAddressAccess = "bb3c6389-1633-4e92-af14-9f3173ba39d0"
  struct IWMAddressAccess
    lpVtbl : IWMAddressAccessVTbl*
  end

  struct IWMAddressAccess2VTbl
    query_interface : Proc(IWMAddressAccess2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMAddressAccess2*, UInt32)
    release : Proc(IWMAddressAccess2*, UInt32)
    get_access_entry_count : Proc(IWMAddressAccess2*, WM_AETYPE, UInt32*, HRESULT)
    get_access_entry : Proc(IWMAddressAccess2*, WM_AETYPE, UInt32, WM_ADDRESS_ACCESSENTRY*, HRESULT)
    add_access_entry : Proc(IWMAddressAccess2*, WM_AETYPE, WM_ADDRESS_ACCESSENTRY*, HRESULT)
    remove_access_entry : Proc(IWMAddressAccess2*, WM_AETYPE, UInt32, HRESULT)
    get_access_entry_ex : Proc(IWMAddressAccess2*, WM_AETYPE, UInt32, UInt8**, UInt8**, HRESULT)
    add_access_entry_ex : Proc(IWMAddressAccess2*, WM_AETYPE, UInt8*, UInt8*, HRESULT)
  end

  IWMAddressAccess2_GUID = LibC::GUID.new("65a83fc2-3e98-4d4d-81b5-2a742886b33d")
  CLSID_IWMAddressAccess2 = "65a83fc2-3e98-4d4d-81b5-2a742886b33d"
  struct IWMAddressAccess2
    lpVtbl : IWMAddressAccess2VTbl*
  end

  struct IWMImageInfoVTbl
    query_interface : Proc(IWMImageInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMImageInfo*, UInt32)
    release : Proc(IWMImageInfo*, UInt32)
    get_image_count : Proc(IWMImageInfo*, UInt32*, HRESULT)
    get_image : Proc(IWMImageInfo*, UInt32, UInt16*, Char*, UInt16*, Char*, UInt16*, UInt32*, UInt8*, HRESULT)
  end

  IWMImageInfo_GUID = LibC::GUID.new("9f0aa3b6-7267-4d89-88f2-ba915aa5c4c6")
  CLSID_IWMImageInfo = "9f0aa3b6-7267-4d89-88f2-ba915aa5c4c6"
  struct IWMImageInfo
    lpVtbl : IWMImageInfoVTbl*
  end

  struct IWMLicenseRevocationAgentVTbl
    query_interface : Proc(IWMLicenseRevocationAgent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMLicenseRevocationAgent*, UInt32)
    release : Proc(IWMLicenseRevocationAgent*, UInt32)
    get_lrb_challenge : Proc(IWMLicenseRevocationAgent*, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)
    process_lrb : Proc(IWMLicenseRevocationAgent*, UInt8*, UInt32, UInt8*, UInt32*, HRESULT)
  end

  IWMLicenseRevocationAgent_GUID = LibC::GUID.new("6967f2c9-4e26-4b57-8894-799880f7ac7b")
  CLSID_IWMLicenseRevocationAgent = "6967f2c9-4e26-4b57-8894-799880f7ac7b"
  struct IWMLicenseRevocationAgent
    lpVtbl : IWMLicenseRevocationAgentVTbl*
  end

  struct IWMAuthorizerVTbl
    query_interface : Proc(IWMAuthorizer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMAuthorizer*, UInt32)
    release : Proc(IWMAuthorizer*, UInt32)
    get_cert_count : Proc(IWMAuthorizer*, UInt32*, HRESULT)
    get_cert : Proc(IWMAuthorizer*, UInt32, UInt8**, HRESULT)
    get_shared_data : Proc(IWMAuthorizer*, UInt32, UInt8*, UInt8*, UInt8**, HRESULT)
  end

  IWMAuthorizer_GUID = LibC::GUID.new("d9b67d36-a9ad-4eb4-baef-db284ef5504c")
  CLSID_IWMAuthorizer = "d9b67d36-a9ad-4eb4-baef-db284ef5504c"
  struct IWMAuthorizer
    lpVtbl : IWMAuthorizerVTbl*
  end

  struct IWMSecureChannelVTbl
    query_interface : Proc(IWMSecureChannel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSecureChannel*, UInt32)
    release : Proc(IWMSecureChannel*, UInt32)
    get_cert_count : Proc(IWMSecureChannel*, UInt32*, HRESULT)
    get_cert : Proc(IWMSecureChannel*, UInt32, UInt8**, HRESULT)
    get_shared_data : Proc(IWMSecureChannel*, UInt32, UInt8*, UInt8*, UInt8**, HRESULT)
    wmsc_add_certificate : Proc(IWMSecureChannel*, IWMAuthorizer, HRESULT)
    wmsc_add_signature : Proc(IWMSecureChannel*, UInt8*, UInt32, HRESULT)
    wmsc_connect : Proc(IWMSecureChannel*, IWMSecureChannel, HRESULT)
    wmsc_is_connected : Proc(IWMSecureChannel*, LibC::BOOL*, HRESULT)
    wmsc_disconnect : Proc(IWMSecureChannel*, HRESULT)
    wmsc_get_valid_certificate : Proc(IWMSecureChannel*, UInt8**, UInt32*, HRESULT)
    wmsc_encrypt : Proc(IWMSecureChannel*, UInt8*, UInt32, HRESULT)
    wmsc_decrypt : Proc(IWMSecureChannel*, UInt8*, UInt32, HRESULT)
    wmsc_lock : Proc(IWMSecureChannel*, HRESULT)
    wmsc_unlock : Proc(IWMSecureChannel*, HRESULT)
    wmsc_set_shared_data : Proc(IWMSecureChannel*, UInt32, UInt8*, HRESULT)
  end

  IWMSecureChannel_GUID = LibC::GUID.new("2720598a-d0f2-4189-bd10-91c46ef0936f")
  CLSID_IWMSecureChannel = "2720598a-d0f2-4189-bd10-91c46ef0936f"
  struct IWMSecureChannel
    lpVtbl : IWMSecureChannelVTbl*
  end

  struct IWMGetSecureChannelVTbl
    query_interface : Proc(IWMGetSecureChannel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMGetSecureChannel*, UInt32)
    release : Proc(IWMGetSecureChannel*, UInt32)
    get_peer_secure_channel_interface : Proc(IWMGetSecureChannel*, IWMSecureChannel*, HRESULT)
  end

  IWMGetSecureChannel_GUID = LibC::GUID.new("94bc0598-c3d2-11d3-bedf-00c04f612986")
  CLSID_IWMGetSecureChannel = "94bc0598-c3d2-11d3-bedf-00c04f612986"
  struct IWMGetSecureChannel
    lpVtbl : IWMGetSecureChannelVTbl*
  end

  struct INSNetSourceCreatorVTbl
    query_interface : Proc(INSNetSourceCreator*, Guid*, Void**, HRESULT)
    add_ref : Proc(INSNetSourceCreator*, UInt32)
    release : Proc(INSNetSourceCreator*, UInt32)
    initialize : Proc(INSNetSourceCreator*, HRESULT)
    create_net_source : Proc(INSNetSourceCreator*, LibC::LPWSTR, IUnknown, UInt8*, IUnknown, IUnknown, UInt64, HRESULT)
    get_net_source_properties : Proc(INSNetSourceCreator*, LibC::LPWSTR, IUnknown*, HRESULT)
    get_net_source_shared_namespace : Proc(INSNetSourceCreator*, IUnknown*, HRESULT)
    get_net_source_admin_interface : Proc(INSNetSourceCreator*, LibC::LPWSTR, VARIANT*, HRESULT)
    get_num_protocols_supported : Proc(INSNetSourceCreator*, UInt32*, HRESULT)
    get_protocol_name : Proc(INSNetSourceCreator*, UInt32, LibC::LPWSTR, UInt16*, HRESULT)
    shutdown : Proc(INSNetSourceCreator*, HRESULT)
  end

  INSNetSourceCreator_GUID = LibC::GUID.new("0c0e4080-9081-11d2-beec-0060082f2054")
  CLSID_INSNetSourceCreator = "0c0e4080-9081-11d2-beec-0060082f2054"
  struct INSNetSourceCreator
    lpVtbl : INSNetSourceCreatorVTbl*
  end

  struct IWMPlayerTimestampHookVTbl
    query_interface : Proc(IWMPlayerTimestampHook*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPlayerTimestampHook*, UInt32)
    release : Proc(IWMPlayerTimestampHook*, UInt32)
    map_timestamp : Proc(IWMPlayerTimestampHook*, Int64, Int64*, HRESULT)
  end

  IWMPlayerTimestampHook_GUID = LibC::GUID.new("28580dda-d98e-48d0-b7ae-69e473a02825")
  CLSID_IWMPlayerTimestampHook = "28580dda-d98e-48d0-b7ae-69e473a02825"
  struct IWMPlayerTimestampHook
    lpVtbl : IWMPlayerTimestampHookVTbl*
  end

  struct IWMCodecAMVideoAcceleratorVTbl
    query_interface : Proc(IWMCodecAMVideoAccelerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCodecAMVideoAccelerator*, UInt32)
    release : Proc(IWMCodecAMVideoAccelerator*, UInt32)
    set_accelerator_interface : Proc(IWMCodecAMVideoAccelerator*, IAMVideoAccelerator, HRESULT)
    negotiate_connection : Proc(IWMCodecAMVideoAccelerator*, AM_MEDIA_TYPE*, HRESULT)
    set_player_notify : Proc(IWMCodecAMVideoAccelerator*, IWMPlayerTimestampHook, HRESULT)
  end

  IWMCodecAMVideoAccelerator_GUID = LibC::GUID.new("d98ee251-34e0-4a2d-9312-9b4c788d9fa1")
  CLSID_IWMCodecAMVideoAccelerator = "d98ee251-34e0-4a2d-9312-9b4c788d9fa1"
  struct IWMCodecAMVideoAccelerator
    lpVtbl : IWMCodecAMVideoAcceleratorVTbl*
  end

  struct IWMCodecVideoAcceleratorVTbl
    query_interface : Proc(IWMCodecVideoAccelerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCodecVideoAccelerator*, UInt32)
    release : Proc(IWMCodecVideoAccelerator*, UInt32)
    negotiate_connection : Proc(IWMCodecVideoAccelerator*, IAMVideoAccelerator, AM_MEDIA_TYPE*, HRESULT)
    set_player_notify : Proc(IWMCodecVideoAccelerator*, IWMPlayerTimestampHook, HRESULT)
  end

  IWMCodecVideoAccelerator_GUID = LibC::GUID.new("990641b0-739f-4e94-a808-9888da8f75af")
  CLSID_IWMCodecVideoAccelerator = "990641b0-739f-4e94-a808-9888da8f75af"
  struct IWMCodecVideoAccelerator
    lpVtbl : IWMCodecVideoAcceleratorVTbl*
  end

  struct IWMSInternalAdminNetSourceVTbl
    query_interface : Proc(IWMSInternalAdminNetSource*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSInternalAdminNetSource*, UInt32)
    release : Proc(IWMSInternalAdminNetSource*, UInt32)
    initialize : Proc(IWMSInternalAdminNetSource*, IUnknown, IUnknown, INSNetSourceCreator, LibC::BOOL, HRESULT)
    get_net_source_creator : Proc(IWMSInternalAdminNetSource*, INSNetSourceCreator*, HRESULT)
    set_credentials : Proc(IWMSInternalAdminNetSource*, UInt8*, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_credentials : Proc(IWMSInternalAdminNetSource*, UInt8*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)
    delete_credentials : Proc(IWMSInternalAdminNetSource*, UInt8*, HRESULT)
    get_credential_flags : Proc(IWMSInternalAdminNetSource*, UInt32*, HRESULT)
    set_credential_flags : Proc(IWMSInternalAdminNetSource*, UInt32, HRESULT)
    find_proxy_for_url : Proc(IWMSInternalAdminNetSource*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt32*, HRESULT)
    register_proxy_failure : Proc(IWMSInternalAdminNetSource*, HRESULT, UInt32, HRESULT)
    shutdown_proxy_context : Proc(IWMSInternalAdminNetSource*, UInt32, HRESULT)
    is_using_ie : Proc(IWMSInternalAdminNetSource*, UInt32, LibC::BOOL*, HRESULT)
  end

  IWMSInternalAdminNetSource_GUID = LibC::GUID.new("8bb23e5f-d127-4afb-8d02-ae5b66d54c78")
  CLSID_IWMSInternalAdminNetSource = "8bb23e5f-d127-4afb-8d02-ae5b66d54c78"
  struct IWMSInternalAdminNetSource
    lpVtbl : IWMSInternalAdminNetSourceVTbl*
  end

  struct IWMSInternalAdminNetSource2VTbl
    query_interface : Proc(IWMSInternalAdminNetSource2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSInternalAdminNetSource2*, UInt32)
    release : Proc(IWMSInternalAdminNetSource2*, UInt32)
    set_credentials_ex : Proc(IWMSInternalAdminNetSource2*, UInt8*, UInt8*, LibC::BOOL, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_credentials_ex : Proc(IWMSInternalAdminNetSource2*, UInt8*, UInt8*, LibC::BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)
    delete_credentials_ex : Proc(IWMSInternalAdminNetSource2*, UInt8*, UInt8*, LibC::BOOL, HRESULT)
    find_proxy_for_url_ex : Proc(IWMSInternalAdminNetSource2*, UInt8*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt32*, HRESULT)
  end

  IWMSInternalAdminNetSource2_GUID = LibC::GUID.new("e74d58c3-cf77-4b51-af17-744687c43eae")
  CLSID_IWMSInternalAdminNetSource2 = "e74d58c3-cf77-4b51-af17-744687c43eae"
  struct IWMSInternalAdminNetSource2
    lpVtbl : IWMSInternalAdminNetSource2VTbl*
  end

  struct IWMSInternalAdminNetSource3VTbl
    query_interface : Proc(IWMSInternalAdminNetSource3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMSInternalAdminNetSource3*, UInt32)
    release : Proc(IWMSInternalAdminNetSource3*, UInt32)
    set_credentials_ex : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, LibC::BOOL, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, HRESULT)
    get_credentials_ex : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, LibC::BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)
    delete_credentials_ex : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, LibC::BOOL, HRESULT)
    find_proxy_for_url_ex : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt32*, HRESULT)
    get_net_source_creator2 : Proc(IWMSInternalAdminNetSource3*, IUnknown*, HRESULT)
    find_proxy_for_url_ex2 : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, UInt8*, LibC::BOOL*, UInt8**, UInt32*, UInt64*, HRESULT)
    register_proxy_failure2 : Proc(IWMSInternalAdminNetSource3*, HRESULT, UInt64, HRESULT)
    shutdown_proxy_context2 : Proc(IWMSInternalAdminNetSource3*, UInt64, HRESULT)
    is_using_ie2 : Proc(IWMSInternalAdminNetSource3*, UInt64, LibC::BOOL*, HRESULT)
    set_credentials_ex2 : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, LibC::BOOL, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, LibC::BOOL, HRESULT)
    get_credentials_ex2 : Proc(IWMSInternalAdminNetSource3*, UInt8*, UInt8*, LibC::BOOL, LibC::BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, UInt8**, UInt8**, LibC::BOOL*, HRESULT)
  end

  IWMSInternalAdminNetSource3_GUID = LibC::GUID.new("6b63d08e-4590-44af-9eb3-57ff1e73bf80")
  CLSID_IWMSInternalAdminNetSource3 = "6b63d08e-4590-44af-9eb3-57ff1e73bf80"
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
