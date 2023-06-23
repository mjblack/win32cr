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

  IAMWMBufferPass_GUID = "6dd816d7-e740-4123-9e24-2444412644d8"
  IID_IAMWMBufferPass = LibC::GUID.new(0x6dd816d7_u32, 0xe740_u16, 0x4123_u16, StaticArray[0x9e_u8, 0x24_u8, 0x24_u8, 0x44_u8, 0x41_u8, 0x26_u8, 0x44_u8, 0xd8_u8])
  struct IAMWMBufferPass
    lpVtbl : IAMWMBufferPassVTbl*
  end

  struct IAMWMBufferPassCallbackVTbl
    query_interface : Proc(IAMWMBufferPassCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAMWMBufferPassCallback*, UInt32)
    release : Proc(IAMWMBufferPassCallback*, UInt32)
    notify : Proc(IAMWMBufferPassCallback*, INSSBuffer3, IPin, Int64*, Int64*, HRESULT)
  end

  IAMWMBufferPassCallback_GUID = "b25b8372-d2d2-44b2-8653-1b8dae332489"
  IID_IAMWMBufferPassCallback = LibC::GUID.new(0xb25b8372_u32, 0xd2d2_u16, 0x44b2_u16, StaticArray[0x86_u8, 0x53_u8, 0x1b_u8, 0x8d_u8, 0xae_u8, 0x33_u8, 0x24_u8, 0x89_u8])
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

  INSSBuffer_GUID = "e1cd3524-03d7-11d2-9eed-006097d2d7cf"
  IID_INSSBuffer = LibC::GUID.new(0xe1cd3524_u32, 0x3d7_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xed_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd2_u8, 0xd7_u8, 0xcf_u8])
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

  INSSBuffer2_GUID = "4f528693-1035-43fe-b428-757561ad3a68"
  IID_INSSBuffer2 = LibC::GUID.new(0x4f528693_u32, 0x1035_u16, 0x43fe_u16, StaticArray[0xb4_u8, 0x28_u8, 0x75_u8, 0x75_u8, 0x61_u8, 0xad_u8, 0x3a_u8, 0x68_u8])
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

  INSSBuffer3_GUID = "c87ceaaf-75be-4bc4-84eb-ac2798507672"
  IID_INSSBuffer3 = LibC::GUID.new(0xc87ceaaf_u32, 0x75be_u16, 0x4bc4_u16, StaticArray[0x84_u8, 0xeb_u8, 0xac_u8, 0x27_u8, 0x98_u8, 0x50_u8, 0x76_u8, 0x72_u8])
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

  INSSBuffer4_GUID = "b6b8fd5a-32e2-49d4-a910-c26cc85465ed"
  IID_INSSBuffer4 = LibC::GUID.new(0xb6b8fd5a_u32, 0x32e2_u16, 0x49d4_u16, StaticArray[0xa9_u8, 0x10_u8, 0xc2_u8, 0x6c_u8, 0xc8_u8, 0x54_u8, 0x65_u8, 0xed_u8])
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

  IWMSBufferAllocator_GUID = "61103ca4-2033-11d2-9ef1-006097d2d7cf"
  IID_IWMSBufferAllocator = LibC::GUID.new(0x61103ca4_u32, 0x2033_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xf1_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd2_u8, 0xd7_u8, 0xcf_u8])
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

  IWMMediaProps_GUID = "96406bce-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMMediaProps = LibC::GUID.new(0x96406bce_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMVideoMediaProps_GUID = "96406bcf-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMVideoMediaProps = LibC::GUID.new(0x96406bcf_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMWriter_GUID = "96406bd4-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriter = LibC::GUID.new(0x96406bd4_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMDRMWriter_GUID = "d6ea5dd0-12a0-43f4-90ab-a3fd451e6a07"
  IID_IWMDRMWriter = LibC::GUID.new(0xd6ea5dd0_u32, 0x12a0_u16, 0x43f4_u16, StaticArray[0x90_u8, 0xab_u8, 0xa3_u8, 0xfd_u8, 0x45_u8, 0x1e_u8, 0x6a_u8, 0x7_u8])
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

  IWMDRMWriter2_GUID = "38ee7a94-40e2-4e10-aa3f-33fd3210ed5b"
  IID_IWMDRMWriter2 = LibC::GUID.new(0x38ee7a94_u32, 0x40e2_u16, 0x4e10_u16, StaticArray[0xaa_u8, 0x3f_u8, 0x33_u8, 0xfd_u8, 0x32_u8, 0x10_u8, 0xed_u8, 0x5b_u8])
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

  IWMDRMWriter3_GUID = "a7184082-a4aa-4dde-ac9c-e75dbd1117ce"
  IID_IWMDRMWriter3 = LibC::GUID.new(0xa7184082_u32, 0xa4aa_u16, 0x4dde_u16, StaticArray[0xac_u8, 0x9c_u8, 0xe7_u8, 0x5d_u8, 0xbd_u8, 0x11_u8, 0x17_u8, 0xce_u8])
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

  IWMInputMediaProps_GUID = "96406bd5-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMInputMediaProps = LibC::GUID.new(0x96406bd5_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMPropertyVault_GUID = "72995a79-5090-42a4-9c8c-d9d0b6d34be5"
  IID_IWMPropertyVault = LibC::GUID.new(0x72995a79_u32, 0x5090_u16, 0x42a4_u16, StaticArray[0x9c_u8, 0x8c_u8, 0xd9_u8, 0xd0_u8, 0xb6_u8, 0xd3_u8, 0x4b_u8, 0xe5_u8])
  struct IWMPropertyVault
    lpVtbl : IWMPropertyVaultVTbl*
  end

  struct IWMIStreamPropsVTbl
    query_interface : Proc(IWMIStreamProps*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMIStreamProps*, UInt32)
    release : Proc(IWMIStreamProps*, UInt32)
    get_property : Proc(IWMIStreamProps*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt32*, HRESULT)
  end

  IWMIStreamProps_GUID = "6816dad3-2b4b-4c8e-8149-874c3483a753"
  IID_IWMIStreamProps = LibC::GUID.new(0x6816dad3_u32, 0x2b4b_u16, 0x4c8e_u16, StaticArray[0x81_u8, 0x49_u8, 0x87_u8, 0x4c_u8, 0x34_u8, 0x83_u8, 0xa7_u8, 0x53_u8])
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

  IWMReader_GUID = "96406bd6-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReader = LibC::GUID.new(0x96406bd6_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMSyncReader_GUID = "9397f121-7705-4dc9-b049-98b698188414"
  IID_IWMSyncReader = LibC::GUID.new(0x9397f121_u32, 0x7705_u16, 0x4dc9_u16, StaticArray[0xb0_u8, 0x49_u8, 0x98_u8, 0xb6_u8, 0x98_u8, 0x18_u8, 0x84_u8, 0x14_u8])
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

  IWMSyncReader2_GUID = "faed3d21-1b6b-4af7-8cb6-3e189bbc187b"
  IID_IWMSyncReader2 = LibC::GUID.new(0xfaed3d21_u32, 0x1b6b_u16, 0x4af7_u16, StaticArray[0x8c_u8, 0xb6_u8, 0x3e_u8, 0x18_u8, 0x9b_u8, 0xbc_u8, 0x18_u8, 0x7b_u8])
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

  IWMOutputMediaProps_GUID = "96406bd7-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMOutputMediaProps = LibC::GUID.new(0x96406bd7_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMOutputMediaProps
    lpVtbl : IWMOutputMediaPropsVTbl*
  end

  struct IWMStatusCallbackVTbl
    query_interface : Proc(IWMStatusCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMStatusCallback*, UInt32)
    release : Proc(IWMStatusCallback*, UInt32)
    on_status : Proc(IWMStatusCallback*, WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, UInt8*, Void*, HRESULT)
  end

  IWMStatusCallback_GUID = "6d7cdc70-9888-11d3-8edc-00c04f6109cf"
  IID_IWMStatusCallback = LibC::GUID.new(0x6d7cdc70_u32, 0x9888_u16, 0x11d3_u16, StaticArray[0x8e_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x9_u8, 0xcf_u8])
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

  IWMReaderCallback_GUID = "96406bd8-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderCallback = LibC::GUID.new(0x96406bd8_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
  struct IWMReaderCallback
    lpVtbl : IWMReaderCallbackVTbl*
  end

  struct IWMCredentialCallbackVTbl
    query_interface : Proc(IWMCredentialCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMCredentialCallback*, UInt32)
    release : Proc(IWMCredentialCallback*, UInt32)
    acquire_credentials : Proc(IWMCredentialCallback*, LibC::LPWSTR, LibC::LPWSTR, Char*, UInt32, Char*, UInt32, HRESULT, UInt32*, HRESULT)
  end

  IWMCredentialCallback_GUID = "342e0eb7-e651-450c-975b-2ace2c90c48e"
  IID_IWMCredentialCallback = LibC::GUID.new(0x342e0eb7_u32, 0xe651_u16, 0x450c_u16, StaticArray[0x97_u8, 0x5b_u8, 0x2a_u8, 0xce_u8, 0x2c_u8, 0x90_u8, 0xc4_u8, 0x8e_u8])
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

  IWMMetadataEditor_GUID = "96406bd9-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMMetadataEditor = LibC::GUID.new(0x96406bd9_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMMetadataEditor2_GUID = "203cffe3-2e18-4fdf-b59d-6e71530534cf"
  IID_IWMMetadataEditor2 = LibC::GUID.new(0x203cffe3_u32, 0x2e18_u16, 0x4fdf_u16, StaticArray[0xb5_u8, 0x9d_u8, 0x6e_u8, 0x71_u8, 0x53_u8, 0x5_u8, 0x34_u8, 0xcf_u8])
  struct IWMMetadataEditor2
    lpVtbl : IWMMetadataEditor2VTbl*
  end

  struct IWMDRMEditorVTbl
    query_interface : Proc(IWMDRMEditor*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMEditor*, UInt32)
    release : Proc(IWMDRMEditor*, UInt32)
    get_drm_property : Proc(IWMDRMEditor*, LibC::LPWSTR, WMT_ATTR_DATATYPE*, UInt8*, UInt16*, HRESULT)
  end

  IWMDRMEditor_GUID = "ff130ebc-a6c3-42a6-b401-c3382c3e08b3"
  IID_IWMDRMEditor = LibC::GUID.new(0xff130ebc_u32, 0xa6c3_u16, 0x42a6_u16, StaticArray[0xb4_u8, 0x1_u8, 0xc3_u8, 0x38_u8, 0x2c_u8, 0x3e_u8, 0x8_u8, 0xb3_u8])
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

  IWMHeaderInfo_GUID = "96406bda-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMHeaderInfo = LibC::GUID.new(0x96406bda_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMHeaderInfo2_GUID = "15cf9781-454e-482e-b393-85fae487a810"
  IID_IWMHeaderInfo2 = LibC::GUID.new(0x15cf9781_u32, 0x454e_u16, 0x482e_u16, StaticArray[0xb3_u8, 0x93_u8, 0x85_u8, 0xfa_u8, 0xe4_u8, 0x87_u8, 0xa8_u8, 0x10_u8])
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

  IWMHeaderInfo3_GUID = "15cc68e3-27cc-4ecd-b222-3f5d02d80bd5"
  IID_IWMHeaderInfo3 = LibC::GUID.new(0x15cc68e3_u32, 0x27cc_u16, 0x4ecd_u16, StaticArray[0xb2_u8, 0x22_u8, 0x3f_u8, 0x5d_u8, 0x2_u8, 0xd8_u8, 0xb_u8, 0xd5_u8])
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

  IWMProfileManager_GUID = "d16679f2-6ca0-472d-8d31-2f5d55aee155"
  IID_IWMProfileManager = LibC::GUID.new(0xd16679f2_u32, 0x6ca0_u16, 0x472d_u16, StaticArray[0x8d_u8, 0x31_u8, 0x2f_u8, 0x5d_u8, 0x55_u8, 0xae_u8, 0xe1_u8, 0x55_u8])
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

  IWMProfileManager2_GUID = "7a924e51-73c1-494d-8019-23d37ed9b89a"
  IID_IWMProfileManager2 = LibC::GUID.new(0x7a924e51_u32, 0x73c1_u16, 0x494d_u16, StaticArray[0x80_u8, 0x19_u8, 0x23_u8, 0xd3_u8, 0x7e_u8, 0xd9_u8, 0xb8_u8, 0x9a_u8])
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

  IWMProfileManagerLanguage_GUID = "ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454"
  IID_IWMProfileManagerLanguage = LibC::GUID.new(0xba4dcc78_u32, 0x7ee0_u16, 0x4ab8_u16, StaticArray[0xb2_u8, 0x7a_u8, 0xdb_u8, 0xce_u8, 0x8b_u8, 0xc5_u8, 0x14_u8, 0x54_u8])
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

  IWMProfile_GUID = "96406bdb-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMProfile = LibC::GUID.new(0x96406bdb_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMProfile2_GUID = "07e72d33-d94e-4be7-8843-60ae5ff7e5f5"
  IID_IWMProfile2 = LibC::GUID.new(0x7e72d33_u32, 0xd94e_u16, 0x4be7_u16, StaticArray[0x88_u8, 0x43_u8, 0x60_u8, 0xae_u8, 0x5f_u8, 0xf7_u8, 0xe5_u8, 0xf5_u8])
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

  IWMProfile3_GUID = "00ef96cc-a461-4546-8bcd-c9a28f0e06f5"
  IID_IWMProfile3 = LibC::GUID.new(0xef96cc_u32, 0xa461_u16, 0x4546_u16, StaticArray[0x8b_u8, 0xcd_u8, 0xc9_u8, 0xa2_u8, 0x8f_u8, 0xe_u8, 0x6_u8, 0xf5_u8])
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

  IWMStreamConfig_GUID = "96406bdc-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMStreamConfig = LibC::GUID.new(0x96406bdc_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMStreamConfig2_GUID = "7688d8cb-fc0d-43bd-9459-5a8dec200cfa"
  IID_IWMStreamConfig2 = LibC::GUID.new(0x7688d8cb_u32, 0xfc0d_u16, 0x43bd_u16, StaticArray[0x94_u8, 0x59_u8, 0x5a_u8, 0x8d_u8, 0xec_u8, 0x20_u8, 0xc_u8, 0xfa_u8])
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

  IWMStreamConfig3_GUID = "cb164104-3aa9-45a7-9ac9-4daee131d6e1"
  IID_IWMStreamConfig3 = LibC::GUID.new(0xcb164104_u32, 0x3aa9_u16, 0x45a7_u16, StaticArray[0x9a_u8, 0xc9_u8, 0x4d_u8, 0xae_u8, 0xe1_u8, 0x31_u8, 0xd6_u8, 0xe1_u8])
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

  IWMPacketSize_GUID = "cdfb97ab-188f-40b3-b643-5b7903975c59"
  IID_IWMPacketSize = LibC::GUID.new(0xcdfb97ab_u32, 0x188f_u16, 0x40b3_u16, StaticArray[0xb6_u8, 0x43_u8, 0x5b_u8, 0x79_u8, 0x3_u8, 0x97_u8, 0x5c_u8, 0x59_u8])
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

  IWMPacketSize2_GUID = "8bfc2b9e-b646-4233-a877-1c6a079669dc"
  IID_IWMPacketSize2 = LibC::GUID.new(0x8bfc2b9e_u32, 0xb646_u16, 0x4233_u16, StaticArray[0xa8_u8, 0x77_u8, 0x1c_u8, 0x6a_u8, 0x7_u8, 0x96_u8, 0x69_u8, 0xdc_u8])
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

  IWMStreamList_GUID = "96406bdd-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMStreamList = LibC::GUID.new(0x96406bdd_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMMutualExclusion_GUID = "96406bde-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMMutualExclusion = LibC::GUID.new(0x96406bde_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMMutualExclusion2_GUID = "0302b57d-89d1-4ba2-85c9-166f2c53eb91"
  IID_IWMMutualExclusion2 = LibC::GUID.new(0x302b57d_u32, 0x89d1_u16, 0x4ba2_u16, StaticArray[0x85_u8, 0xc9_u8, 0x16_u8, 0x6f_u8, 0x2c_u8, 0x53_u8, 0xeb_u8, 0x91_u8])
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

  IWMBandwidthSharing_GUID = "ad694af1-f8d9-42f8-bc47-70311b0c4f9e"
  IID_IWMBandwidthSharing = LibC::GUID.new(0xad694af1_u32, 0xf8d9_u16, 0x42f8_u16, StaticArray[0xbc_u8, 0x47_u8, 0x70_u8, 0x31_u8, 0x1b_u8, 0xc_u8, 0x4f_u8, 0x9e_u8])
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

  IWMStreamPrioritization_GUID = "8c1c6090-f9a8-4748-8ec3-dd1108ba1e77"
  IID_IWMStreamPrioritization = LibC::GUID.new(0x8c1c6090_u32, 0xf9a8_u16, 0x4748_u16, StaticArray[0x8e_u8, 0xc3_u8, 0xdd_u8, 0x11_u8, 0x8_u8, 0xba_u8, 0x1e_u8, 0x77_u8])
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

  IWMWriterAdvanced_GUID = "96406be3-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterAdvanced = LibC::GUID.new(0x96406be3_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMWriterAdvanced2_GUID = "962dc1ec-c046-4db8-9cc7-26ceae500817"
  IID_IWMWriterAdvanced2 = LibC::GUID.new(0x962dc1ec_u32, 0xc046_u16, 0x4db8_u16, StaticArray[0x9c_u8, 0xc7_u8, 0x26_u8, 0xce_u8, 0xae_u8, 0x50_u8, 0x8_u8, 0x17_u8])
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

  IWMWriterAdvanced3_GUID = "2cd6492d-7c37-4e76-9d3b-59261183a22e"
  IID_IWMWriterAdvanced3 = LibC::GUID.new(0x2cd6492d_u32, 0x7c37_u16, 0x4e76_u16, StaticArray[0x9d_u8, 0x3b_u8, 0x59_u8, 0x26_u8, 0x11_u8, 0x83_u8, 0xa2_u8, 0x2e_u8])
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

  IWMWriterPreprocess_GUID = "fc54a285-38c4-45b5-aa23-85b9f7cb424b"
  IID_IWMWriterPreprocess = LibC::GUID.new(0xfc54a285_u32, 0x38c4_u16, 0x45b5_u16, StaticArray[0xaa_u8, 0x23_u8, 0x85_u8, 0xb9_u8, 0xf7_u8, 0xcb_u8, 0x42_u8, 0x4b_u8])
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

  IWMWriterPostViewCallback_GUID = "d9d6549d-a193-4f24-b308-03123d9b7f8d"
  IID_IWMWriterPostViewCallback = LibC::GUID.new(0xd9d6549d_u32, 0xa193_u16, 0x4f24_u16, StaticArray[0xb3_u8, 0x8_u8, 0x3_u8, 0x12_u8, 0x3d_u8, 0x9b_u8, 0x7f_u8, 0x8d_u8])
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

  IWMWriterPostView_GUID = "81e20ce4-75ef-491a-8004-fc53c45bdc3e"
  IID_IWMWriterPostView = LibC::GUID.new(0x81e20ce4_u32, 0x75ef_u16, 0x491a_u16, StaticArray[0x80_u8, 0x4_u8, 0xfc_u8, 0x53_u8, 0xc4_u8, 0x5b_u8, 0xdc_u8, 0x3e_u8])
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

  IWMWriterSink_GUID = "96406be4-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterSink = LibC::GUID.new(0x96406be4_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMRegisterCallback_GUID = "cf4b1f99-4de2-4e49-a363-252740d99bc1"
  IID_IWMRegisterCallback = LibC::GUID.new(0xcf4b1f99_u32, 0x4de2_u16, 0x4e49_u16, StaticArray[0xa3_u8, 0x63_u8, 0x25_u8, 0x27_u8, 0x40_u8, 0xd9_u8, 0x9b_u8, 0xc1_u8])
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

  IWMWriterFileSink_GUID = "96406be5-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterFileSink = LibC::GUID.new(0x96406be5_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMWriterFileSink2_GUID = "14282ba7-4aef-4205-8ce5-c229035a05bc"
  IID_IWMWriterFileSink2 = LibC::GUID.new(0x14282ba7_u32, 0x4aef_u16, 0x4205_u16, StaticArray[0x8c_u8, 0xe5_u8, 0xc2_u8, 0x29_u8, 0x3_u8, 0x5a_u8, 0x5_u8, 0xbc_u8])
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

  IWMWriterFileSink3_GUID = "3fea4feb-2945-47a7-a1dd-c53a8fc4c45c"
  IID_IWMWriterFileSink3 = LibC::GUID.new(0x3fea4feb_u32, 0x2945_u16, 0x47a7_u16, StaticArray[0xa1_u8, 0xdd_u8, 0xc5_u8, 0x3a_u8, 0x8f_u8, 0xc4_u8, 0xc4_u8, 0x5c_u8])
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

  IWMWriterNetworkSink_GUID = "96406be7-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMWriterNetworkSink = LibC::GUID.new(0x96406be7_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMClientConnections_GUID = "73c66010-a299-41df-b1f0-ccf03b09c1c6"
  IID_IWMClientConnections = LibC::GUID.new(0x73c66010_u32, 0xa299_u16, 0x41df_u16, StaticArray[0xb1_u8, 0xf0_u8, 0xcc_u8, 0xf0_u8, 0x3b_u8, 0x9_u8, 0xc1_u8, 0xc6_u8])
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

  IWMClientConnections2_GUID = "4091571e-4701-4593-bb3d-d5f5f0c74246"
  IID_IWMClientConnections2 = LibC::GUID.new(0x4091571e_u32, 0x4701_u16, 0x4593_u16, StaticArray[0xbb_u8, 0x3d_u8, 0xd5_u8, 0xf5_u8, 0xf0_u8, 0xc7_u8, 0x42_u8, 0x46_u8])
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

  IWMReaderAdvanced_GUID = "96406bea-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderAdvanced = LibC::GUID.new(0x96406bea_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMReaderAdvanced2_GUID = "ae14a945-b90c-4d0d-9127-80d665f7d73e"
  IID_IWMReaderAdvanced2 = LibC::GUID.new(0xae14a945_u32, 0xb90c_u16, 0x4d0d_u16, StaticArray[0x91_u8, 0x27_u8, 0x80_u8, 0xd6_u8, 0x65_u8, 0xf7_u8, 0xd7_u8, 0x3e_u8])
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

  IWMReaderAdvanced3_GUID = "5dc0674b-f04b-4a4e-9f2a-b1afde2c8100"
  IID_IWMReaderAdvanced3 = LibC::GUID.new(0x5dc0674b_u32, 0xf04b_u16, 0x4a4e_u16, StaticArray[0x9f_u8, 0x2a_u8, 0xb1_u8, 0xaf_u8, 0xde_u8, 0x2c_u8, 0x81_u8, 0x0_u8])
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

  IWMReaderAdvanced4_GUID = "945a76a2-12ae-4d48-bd3c-cd1d90399b85"
  IID_IWMReaderAdvanced4 = LibC::GUID.new(0x945a76a2_u32, 0x12ae_u16, 0x4d48_u16, StaticArray[0xbd_u8, 0x3c_u8, 0xcd_u8, 0x1d_u8, 0x90_u8, 0x39_u8, 0x9b_u8, 0x85_u8])
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

  IWMReaderAdvanced5_GUID = "24c44db0-55d1-49ae-a5cc-f13815e36363"
  IID_IWMReaderAdvanced5 = LibC::GUID.new(0x24c44db0_u32, 0x55d1_u16, 0x49ae_u16, StaticArray[0xa5_u8, 0xcc_u8, 0xf1_u8, 0x38_u8, 0x15_u8, 0xe3_u8, 0x63_u8, 0x63_u8])
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

  IWMReaderAdvanced6_GUID = "18a2e7f8-428f-4acd-8a00-e64639bc93de"
  IID_IWMReaderAdvanced6 = LibC::GUID.new(0x18a2e7f8_u32, 0x428f_u16, 0x4acd_u16, StaticArray[0x8a_u8, 0x0_u8, 0xe6_u8, 0x46_u8, 0x39_u8, 0xbc_u8, 0x93_u8, 0xde_u8])
  struct IWMReaderAdvanced6
    lpVtbl : IWMReaderAdvanced6VTbl*
  end

  struct IWMPlayerHookVTbl
    query_interface : Proc(IWMPlayerHook*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPlayerHook*, UInt32)
    release : Proc(IWMPlayerHook*, UInt32)
    pre_decode : Proc(IWMPlayerHook*, HRESULT)
  end

  IWMPlayerHook_GUID = "e5b7ca9a-0f1c-4f66-9002-74ec50d8b304"
  IID_IWMPlayerHook = LibC::GUID.new(0xe5b7ca9a_u32, 0xf1c_u16, 0x4f66_u16, StaticArray[0x90_u8, 0x2_u8, 0x74_u8, 0xec_u8, 0x50_u8, 0xd8_u8, 0xb3_u8, 0x4_u8])
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

  IWMReaderAllocatorEx_GUID = "9f762fa7-a22e-428d-93c9-ac82f3aafe5a"
  IID_IWMReaderAllocatorEx = LibC::GUID.new(0x9f762fa7_u32, 0xa22e_u16, 0x428d_u16, StaticArray[0x93_u8, 0xc9_u8, 0xac_u8, 0x82_u8, 0xf3_u8, 0xaa_u8, 0xfe_u8, 0x5a_u8])
  struct IWMReaderAllocatorEx
    lpVtbl : IWMReaderAllocatorExVTbl*
  end

  struct IWMReaderTypeNegotiationVTbl
    query_interface : Proc(IWMReaderTypeNegotiation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMReaderTypeNegotiation*, UInt32)
    release : Proc(IWMReaderTypeNegotiation*, UInt32)
    try_output_props : Proc(IWMReaderTypeNegotiation*, UInt32, IWMOutputMediaProps, HRESULT)
  end

  IWMReaderTypeNegotiation_GUID = "fdbe5592-81a1-41ea-93bd-735cad1adc05"
  IID_IWMReaderTypeNegotiation = LibC::GUID.new(0xfdbe5592_u32, 0x81a1_u16, 0x41ea_u16, StaticArray[0x93_u8, 0xbd_u8, 0x73_u8, 0x5c_u8, 0xad_u8, 0x1a_u8, 0xdc_u8, 0x5_u8])
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

  IWMReaderCallbackAdvanced_GUID = "96406beb-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderCallbackAdvanced = LibC::GUID.new(0x96406beb_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMDRMReader_GUID = "d2827540-3ee7-432c-b14c-dc17f085d3b3"
  IID_IWMDRMReader = LibC::GUID.new(0xd2827540_u32, 0x3ee7_u16, 0x432c_u16, StaticArray[0xb1_u8, 0x4c_u8, 0xdc_u8, 0x17_u8, 0xf0_u8, 0x85_u8, 0xd3_u8, 0xb3_u8])
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

  IWMDRMReader2_GUID = "befe7a75-9f1d-4075-b9d9-a3c37bda49a0"
  IID_IWMDRMReader2 = LibC::GUID.new(0xbefe7a75_u32, 0x9f1d_u16, 0x4075_u16, StaticArray[0xb9_u8, 0xd9_u8, 0xa3_u8, 0xc3_u8, 0x7b_u8, 0xda_u8, 0x49_u8, 0xa0_u8])
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

  IWMDRMReader3_GUID = "e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8"
  IID_IWMDRMReader3 = LibC::GUID.new(0xe08672de_u32, 0xf1e7_u16, 0x4ff4_u16, StaticArray[0xa0_u8, 0xa3_u8, 0xfc_u8, 0x4b_u8, 0x8_u8, 0xe4_u8, 0xca_u8, 0xf8_u8])
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

  IWMReaderPlaylistBurn_GUID = "f28c0300-9baa-4477-a846-1744d9cbf533"
  IID_IWMReaderPlaylistBurn = LibC::GUID.new(0xf28c0300_u32, 0x9baa_u16, 0x4477_u16, StaticArray[0xa8_u8, 0x46_u8, 0x17_u8, 0x44_u8, 0xd9_u8, 0xcb_u8, 0xf5_u8, 0x33_u8])
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

  IWMReaderNetworkConfig_GUID = "96406bec-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderNetworkConfig = LibC::GUID.new(0x96406bec_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMReaderNetworkConfig2_GUID = "d979a853-042b-4050-8387-c939db22013f"
  IID_IWMReaderNetworkConfig2 = LibC::GUID.new(0xd979a853_u32, 0x42b_u16, 0x4050_u16, StaticArray[0x83_u8, 0x87_u8, 0xc9_u8, 0x39_u8, 0xdb_u8, 0x22_u8, 0x1_u8, 0x3f_u8])
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

  IWMReaderStreamClock_GUID = "96406bed-2b2b-11d3-b36b-00c04f6108ff"
  IID_IWMReaderStreamClock = LibC::GUID.new(0x96406bed_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
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

  IWMIndexer_GUID = "6d7cdc71-9888-11d3-8edc-00c04f6109cf"
  IID_IWMIndexer = LibC::GUID.new(0x6d7cdc71_u32, 0x9888_u16, 0x11d3_u16, StaticArray[0x8e_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x9_u8, 0xcf_u8])
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

  IWMIndexer2_GUID = "b70f1e42-6255-4df0-a6b9-02b212d9e2bb"
  IID_IWMIndexer2 = LibC::GUID.new(0xb70f1e42_u32, 0x6255_u16, 0x4df0_u16, StaticArray[0xa6_u8, 0xb9_u8, 0x2_u8, 0xb2_u8, 0x12_u8, 0xd9_u8, 0xe2_u8, 0xbb_u8])
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

  IWMLicenseBackup_GUID = "05e5ac9f-3fb6-4508-bb43-a4067ba1ebe8"
  IID_IWMLicenseBackup = LibC::GUID.new(0x5e5ac9f_u32, 0x3fb6_u16, 0x4508_u16, StaticArray[0xbb_u8, 0x43_u8, 0xa4_u8, 0x6_u8, 0x7b_u8, 0xa1_u8, 0xeb_u8, 0xe8_u8])
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

  IWMLicenseRestore_GUID = "c70b6334-a22e-4efb-a245-15e65a004a13"
  IID_IWMLicenseRestore = LibC::GUID.new(0xc70b6334_u32, 0xa22e_u16, 0x4efb_u16, StaticArray[0xa2_u8, 0x45_u8, 0x15_u8, 0xe6_u8, 0x5a_u8, 0x0_u8, 0x4a_u8, 0x13_u8])
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

  IWMBackupRestoreProps_GUID = "3c8e0da6-996f-4ff3-a1af-4838f9377e2e"
  IID_IWMBackupRestoreProps = LibC::GUID.new(0x3c8e0da6_u32, 0x996f_u16, 0x4ff3_u16, StaticArray[0xa1_u8, 0xaf_u8, 0x48_u8, 0x38_u8, 0xf9_u8, 0x37_u8, 0x7e_u8, 0x2e_u8])
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

  IWMCodecInfo_GUID = "a970f41e-34de-4a98-b3ba-e4b3ca7528f0"
  IID_IWMCodecInfo = LibC::GUID.new(0xa970f41e_u32, 0x34de_u16, 0x4a98_u16, StaticArray[0xb3_u8, 0xba_u8, 0xe4_u8, 0xb3_u8, 0xca_u8, 0x75_u8, 0x28_u8, 0xf0_u8])
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

  IWMCodecInfo2_GUID = "aa65e273-b686-4056-91ec-dd768d4df710"
  IID_IWMCodecInfo2 = LibC::GUID.new(0xaa65e273_u32, 0xb686_u16, 0x4056_u16, StaticArray[0x91_u8, 0xec_u8, 0xdd_u8, 0x76_u8, 0x8d_u8, 0x4d_u8, 0xf7_u8, 0x10_u8])
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

  IWMCodecInfo3_GUID = "7e51f487-4d93-4f98-8ab4-27d0565adc51"
  IID_IWMCodecInfo3 = LibC::GUID.new(0x7e51f487_u32, 0x4d93_u16, 0x4f98_u16, StaticArray[0x8a_u8, 0xb4_u8, 0x27_u8, 0xd0_u8, 0x56_u8, 0x5a_u8, 0xdc_u8, 0x51_u8])
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

  IWMLanguageList_GUID = "df683f00-2d49-4d8e-92b7-fb19f6a0dc57"
  IID_IWMLanguageList = LibC::GUID.new(0xdf683f00_u32, 0x2d49_u16, 0x4d8e_u16, StaticArray[0x92_u8, 0xb7_u8, 0xfb_u8, 0x19_u8, 0xf6_u8, 0xa0_u8, 0xdc_u8, 0x57_u8])
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

  IWMWriterPushSink_GUID = "dc10e6a5-072c-467d-bf57-6330a9dde12a"
  IID_IWMWriterPushSink = LibC::GUID.new(0xdc10e6a5_u32, 0x72c_u16, 0x467d_u16, StaticArray[0xbf_u8, 0x57_u8, 0x63_u8, 0x30_u8, 0xa9_u8, 0xdd_u8, 0xe1_u8, 0x2a_u8])
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

  IWMDeviceRegistration_GUID = "f6211f03-8d21-4e94-93e6-8510805f2d99"
  IID_IWMDeviceRegistration = LibC::GUID.new(0xf6211f03_u32, 0x8d21_u16, 0x4e94_u16, StaticArray[0x93_u8, 0xe6_u8, 0x85_u8, 0x10_u8, 0x80_u8, 0x5f_u8, 0x2d_u8, 0x99_u8])
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

  IWMRegisteredDevice_GUID = "a4503bec-5508-4148-97ac-bfa75760a70d"
  IID_IWMRegisteredDevice = LibC::GUID.new(0xa4503bec_u32, 0x5508_u16, 0x4148_u16, StaticArray[0x97_u8, 0xac_u8, 0xbf_u8, 0xa7_u8, 0x57_u8, 0x60_u8, 0xa7_u8, 0xd_u8])
  struct IWMRegisteredDevice
    lpVtbl : IWMRegisteredDeviceVTbl*
  end

  struct IWMProximityDetectionVTbl
    query_interface : Proc(IWMProximityDetection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMProximityDetection*, UInt32)
    release : Proc(IWMProximityDetection*, UInt32)
    start_detection : Proc(IWMProximityDetection*, UInt8*, UInt32, UInt8*, UInt32, UInt32, INSSBuffer*, IWMStatusCallback, Void*, HRESULT)
  end

  IWMProximityDetection_GUID = "6a9fd8ee-b651-4bf0-b849-7d4ece79a2b1"
  IID_IWMProximityDetection = LibC::GUID.new(0x6a9fd8ee_u32, 0xb651_u16, 0x4bf0_u16, StaticArray[0xb8_u8, 0x49_u8, 0x7d_u8, 0x4e_u8, 0xce_u8, 0x79_u8, 0xa2_u8, 0xb1_u8])
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

  IWMDRMMessageParser_GUID = "a73a0072-25a0-4c99-b4a5-ede8101a6c39"
  IID_IWMDRMMessageParser = LibC::GUID.new(0xa73a0072_u32, 0x25a0_u16, 0x4c99_u16, StaticArray[0xb4_u8, 0xa5_u8, 0xed_u8, 0xe8_u8, 0x10_u8, 0x1a_u8, 0x6c_u8, 0x39_u8])
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

  IWMDRMTranscryptor_GUID = "69059850-6e6f-4bb2-806f-71863ddfc471"
  IID_IWMDRMTranscryptor = LibC::GUID.new(0x69059850_u32, 0x6e6f_u16, 0x4bb2_u16, StaticArray[0x80_u8, 0x6f_u8, 0x71_u8, 0x86_u8, 0x3d_u8, 0xdf_u8, 0xc4_u8, 0x71_u8])
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

  IWMDRMTranscryptor2_GUID = "e0da439f-d331-496a-bece-18e5bac5dd23"
  IID_IWMDRMTranscryptor2 = LibC::GUID.new(0xe0da439f_u32, 0xd331_u16, 0x496a_u16, StaticArray[0xbe_u8, 0xce_u8, 0x18_u8, 0xe5_u8, 0xba_u8, 0xc5_u8, 0xdd_u8, 0x23_u8])
  struct IWMDRMTranscryptor2
    lpVtbl : IWMDRMTranscryptor2VTbl*
  end

  struct IWMDRMTranscryptionManagerVTbl
    query_interface : Proc(IWMDRMTranscryptionManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMDRMTranscryptionManager*, UInt32)
    release : Proc(IWMDRMTranscryptionManager*, UInt32)
    create_transcryptor : Proc(IWMDRMTranscryptionManager*, IWMDRMTranscryptor*, HRESULT)
  end

  IWMDRMTranscryptionManager_GUID = "b1a887b2-a4f0-407a-b02e-efbd23bbecdf"
  IID_IWMDRMTranscryptionManager = LibC::GUID.new(0xb1a887b2_u32, 0xa4f0_u16, 0x407a_u16, StaticArray[0xb0_u8, 0x2e_u8, 0xef_u8, 0xbd_u8, 0x23_u8, 0xbb_u8, 0xec_u8, 0xdf_u8])
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

  IWMWatermarkInfo_GUID = "6f497062-f2e2-4624-8ea7-9dd40d81fc8d"
  IID_IWMWatermarkInfo = LibC::GUID.new(0x6f497062_u32, 0xf2e2_u16, 0x4624_u16, StaticArray[0x8e_u8, 0xa7_u8, 0x9d_u8, 0xd4_u8, 0xd_u8, 0x81_u8, 0xfc_u8, 0x8d_u8])
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

  IWMReaderAccelerator_GUID = "bddc4d08-944d-4d52-a612-46c3fda07dd4"
  IID_IWMReaderAccelerator = LibC::GUID.new(0xbddc4d08_u32, 0x944d_u16, 0x4d52_u16, StaticArray[0xa6_u8, 0x12_u8, 0x46_u8, 0xc3_u8, 0xfd_u8, 0xa0_u8, 0x7d_u8, 0xd4_u8])
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

  IWMReaderTimecode_GUID = "f369e2f0-e081-4fe6-8450-b810b2f410d1"
  IID_IWMReaderTimecode = LibC::GUID.new(0xf369e2f0_u32, 0xe081_u16, 0x4fe6_u16, StaticArray[0x84_u8, 0x50_u8, 0xb8_u8, 0x10_u8, 0xb2_u8, 0xf4_u8, 0x10_u8, 0xd1_u8])
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

  IWMAddressAccess_GUID = "bb3c6389-1633-4e92-af14-9f3173ba39d0"
  IID_IWMAddressAccess = LibC::GUID.new(0xbb3c6389_u32, 0x1633_u16, 0x4e92_u16, StaticArray[0xaf_u8, 0x14_u8, 0x9f_u8, 0x31_u8, 0x73_u8, 0xba_u8, 0x39_u8, 0xd0_u8])
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

  IWMAddressAccess2_GUID = "65a83fc2-3e98-4d4d-81b5-2a742886b33d"
  IID_IWMAddressAccess2 = LibC::GUID.new(0x65a83fc2_u32, 0x3e98_u16, 0x4d4d_u16, StaticArray[0x81_u8, 0xb5_u8, 0x2a_u8, 0x74_u8, 0x28_u8, 0x86_u8, 0xb3_u8, 0x3d_u8])
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

  IWMImageInfo_GUID = "9f0aa3b6-7267-4d89-88f2-ba915aa5c4c6"
  IID_IWMImageInfo = LibC::GUID.new(0x9f0aa3b6_u32, 0x7267_u16, 0x4d89_u16, StaticArray[0x88_u8, 0xf2_u8, 0xba_u8, 0x91_u8, 0x5a_u8, 0xa5_u8, 0xc4_u8, 0xc6_u8])
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

  IWMLicenseRevocationAgent_GUID = "6967f2c9-4e26-4b57-8894-799880f7ac7b"
  IID_IWMLicenseRevocationAgent = LibC::GUID.new(0x6967f2c9_u32, 0x4e26_u16, 0x4b57_u16, StaticArray[0x88_u8, 0x94_u8, 0x79_u8, 0x98_u8, 0x80_u8, 0xf7_u8, 0xac_u8, 0x7b_u8])
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

  IWMAuthorizer_GUID = "d9b67d36-a9ad-4eb4-baef-db284ef5504c"
  IID_IWMAuthorizer = LibC::GUID.new(0xd9b67d36_u32, 0xa9ad_u16, 0x4eb4_u16, StaticArray[0xba_u8, 0xef_u8, 0xdb_u8, 0x28_u8, 0x4e_u8, 0xf5_u8, 0x50_u8, 0x4c_u8])
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

  IWMSecureChannel_GUID = "2720598a-d0f2-4189-bd10-91c46ef0936f"
  IID_IWMSecureChannel = LibC::GUID.new(0x2720598a_u32, 0xd0f2_u16, 0x4189_u16, StaticArray[0xbd_u8, 0x10_u8, 0x91_u8, 0xc4_u8, 0x6e_u8, 0xf0_u8, 0x93_u8, 0x6f_u8])
  struct IWMSecureChannel
    lpVtbl : IWMSecureChannelVTbl*
  end

  struct IWMGetSecureChannelVTbl
    query_interface : Proc(IWMGetSecureChannel*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMGetSecureChannel*, UInt32)
    release : Proc(IWMGetSecureChannel*, UInt32)
    get_peer_secure_channel_interface : Proc(IWMGetSecureChannel*, IWMSecureChannel*, HRESULT)
  end

  IWMGetSecureChannel_GUID = "94bc0598-c3d2-11d3-bedf-00c04f612986"
  IID_IWMGetSecureChannel = LibC::GUID.new(0x94bc0598_u32, 0xc3d2_u16, 0x11d3_u16, StaticArray[0xbe_u8, 0xdf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x29_u8, 0x86_u8])
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

  INSNetSourceCreator_GUID = "0c0e4080-9081-11d2-beec-0060082f2054"
  IID_INSNetSourceCreator = LibC::GUID.new(0xc0e4080_u32, 0x9081_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0xec_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x2f_u8, 0x20_u8, 0x54_u8])
  struct INSNetSourceCreator
    lpVtbl : INSNetSourceCreatorVTbl*
  end

  struct IWMPlayerTimestampHookVTbl
    query_interface : Proc(IWMPlayerTimestampHook*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWMPlayerTimestampHook*, UInt32)
    release : Proc(IWMPlayerTimestampHook*, UInt32)
    map_timestamp : Proc(IWMPlayerTimestampHook*, Int64, Int64*, HRESULT)
  end

  IWMPlayerTimestampHook_GUID = "28580dda-d98e-48d0-b7ae-69e473a02825"
  IID_IWMPlayerTimestampHook = LibC::GUID.new(0x28580dda_u32, 0xd98e_u16, 0x48d0_u16, StaticArray[0xb7_u8, 0xae_u8, 0x69_u8, 0xe4_u8, 0x73_u8, 0xa0_u8, 0x28_u8, 0x25_u8])
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

  IWMCodecAMVideoAccelerator_GUID = "d98ee251-34e0-4a2d-9312-9b4c788d9fa1"
  IID_IWMCodecAMVideoAccelerator = LibC::GUID.new(0xd98ee251_u32, 0x34e0_u16, 0x4a2d_u16, StaticArray[0x93_u8, 0x12_u8, 0x9b_u8, 0x4c_u8, 0x78_u8, 0x8d_u8, 0x9f_u8, 0xa1_u8])
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

  IWMCodecVideoAccelerator_GUID = "990641b0-739f-4e94-a808-9888da8f75af"
  IID_IWMCodecVideoAccelerator = LibC::GUID.new(0x990641b0_u32, 0x739f_u16, 0x4e94_u16, StaticArray[0xa8_u8, 0x8_u8, 0x98_u8, 0x88_u8, 0xda_u8, 0x8f_u8, 0x75_u8, 0xaf_u8])
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

  IWMSInternalAdminNetSource_GUID = "8bb23e5f-d127-4afb-8d02-ae5b66d54c78"
  IID_IWMSInternalAdminNetSource = LibC::GUID.new(0x8bb23e5f_u32, 0xd127_u16, 0x4afb_u16, StaticArray[0x8d_u8, 0x2_u8, 0xae_u8, 0x5b_u8, 0x66_u8, 0xd5_u8, 0x4c_u8, 0x78_u8])
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

  IWMSInternalAdminNetSource2_GUID = "e74d58c3-cf77-4b51-af17-744687c43eae"
  IID_IWMSInternalAdminNetSource2 = LibC::GUID.new(0xe74d58c3_u32, 0xcf77_u16, 0x4b51_u16, StaticArray[0xaf_u8, 0x17_u8, 0x74_u8, 0x46_u8, 0x87_u8, 0xc4_u8, 0x3e_u8, 0xae_u8])
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
  def query_interface(this : IAMWMBufferPass*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAMWMBufferPass*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAMWMBufferPass*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_notify(this : IAMWMBufferPass*, pcallback : IAMWMBufferPassCallback) : HRESULT
    @lpVtbl.value.set_notify.call(this, pcallback)
  end
end
struct LibWin32::IAMWMBufferPassCallback
  def query_interface(this : IAMWMBufferPassCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAMWMBufferPassCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAMWMBufferPassCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def notify(this : IAMWMBufferPassCallback*, pnssbuffer3 : INSSBuffer3, ppin : IPin, prtstart : Int64*, prtend : Int64*) : HRESULT
    @lpVtbl.value.notify.call(this, pnssbuffer3, ppin, prtstart, prtend)
  end
end
struct LibWin32::INSSBuffer
  def query_interface(this : INSSBuffer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INSSBuffer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INSSBuffer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_length(this : INSSBuffer*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.call(this, pdwlength)
  end
  def set_length(this : INSSBuffer*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.call(this, dwlength)
  end
  def get_max_length(this : INSSBuffer*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.call(this, pdwlength)
  end
  def get_buffer(this : INSSBuffer*, ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.call(this, ppdwbuffer)
  end
  def get_buffer_and_length(this : INSSBuffer*, ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.call(this, ppdwbuffer, pdwlength)
  end
end
struct LibWin32::INSSBuffer2
  def query_interface(this : INSSBuffer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INSSBuffer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INSSBuffer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_length(this : INSSBuffer2*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.call(this, pdwlength)
  end
  def set_length(this : INSSBuffer2*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.call(this, dwlength)
  end
  def get_max_length(this : INSSBuffer2*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.call(this, pdwlength)
  end
  def get_buffer(this : INSSBuffer2*, ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.call(this, ppdwbuffer)
  end
  def get_buffer_and_length(this : INSSBuffer2*, ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.call(this, ppdwbuffer, pdwlength)
  end
  def get_sample_properties(this : INSSBuffer2*, cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.get_sample_properties.call(this, cbproperties, pbproperties)
  end
  def set_sample_properties(this : INSSBuffer2*, cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.set_sample_properties.call(this, cbproperties, pbproperties)
  end
end
struct LibWin32::INSSBuffer3
  def query_interface(this : INSSBuffer3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INSSBuffer3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INSSBuffer3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_length(this : INSSBuffer3*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.call(this, pdwlength)
  end
  def set_length(this : INSSBuffer3*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.call(this, dwlength)
  end
  def get_max_length(this : INSSBuffer3*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.call(this, pdwlength)
  end
  def get_buffer(this : INSSBuffer3*, ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.call(this, ppdwbuffer)
  end
  def get_buffer_and_length(this : INSSBuffer3*, ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.call(this, ppdwbuffer, pdwlength)
  end
  def get_sample_properties(this : INSSBuffer3*, cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.get_sample_properties.call(this, cbproperties, pbproperties)
  end
  def set_sample_properties(this : INSSBuffer3*, cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.set_sample_properties.call(this, cbproperties, pbproperties)
  end
  def set_property(this : INSSBuffer3*, guidbufferproperty : Guid, pvbufferproperty : Void*, dwbufferpropertysize : UInt32) : HRESULT
    @lpVtbl.value.set_property.call(this, guidbufferproperty, pvbufferproperty, dwbufferpropertysize)
  end
  def get_property(this : INSSBuffer3*, guidbufferproperty : Guid, pvbufferproperty : Void*, pdwbufferpropertysize : UInt32*) : HRESULT
    @lpVtbl.value.get_property.call(this, guidbufferproperty, pvbufferproperty, pdwbufferpropertysize)
  end
end
struct LibWin32::INSSBuffer4
  def query_interface(this : INSSBuffer4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INSSBuffer4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INSSBuffer4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_length(this : INSSBuffer4*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_length.call(this, pdwlength)
  end
  def set_length(this : INSSBuffer4*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.set_length.call(this, dwlength)
  end
  def get_max_length(this : INSSBuffer4*, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_max_length.call(this, pdwlength)
  end
  def get_buffer(this : INSSBuffer4*, ppdwbuffer : UInt8**) : HRESULT
    @lpVtbl.value.get_buffer.call(this, ppdwbuffer)
  end
  def get_buffer_and_length(this : INSSBuffer4*, ppdwbuffer : UInt8**, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_and_length.call(this, ppdwbuffer, pdwlength)
  end
  def get_sample_properties(this : INSSBuffer4*, cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.get_sample_properties.call(this, cbproperties, pbproperties)
  end
  def set_sample_properties(this : INSSBuffer4*, cbproperties : UInt32, pbproperties : UInt8*) : HRESULT
    @lpVtbl.value.set_sample_properties.call(this, cbproperties, pbproperties)
  end
  def set_property(this : INSSBuffer4*, guidbufferproperty : Guid, pvbufferproperty : Void*, dwbufferpropertysize : UInt32) : HRESULT
    @lpVtbl.value.set_property.call(this, guidbufferproperty, pvbufferproperty, dwbufferpropertysize)
  end
  def get_property(this : INSSBuffer4*, guidbufferproperty : Guid, pvbufferproperty : Void*, pdwbufferpropertysize : UInt32*) : HRESULT
    @lpVtbl.value.get_property.call(this, guidbufferproperty, pvbufferproperty, pdwbufferpropertysize)
  end
  def get_property_count(this : INSSBuffer4*, pcbufferproperties : UInt32*) : HRESULT
    @lpVtbl.value.get_property_count.call(this, pcbufferproperties)
  end
  def get_property_by_index(this : INSSBuffer4*, dwbufferpropertyindex : UInt32, pguidbufferproperty : Guid*, pvbufferproperty : Void*, pdwbufferpropertysize : UInt32*) : HRESULT
    @lpVtbl.value.get_property_by_index.call(this, dwbufferpropertyindex, pguidbufferproperty, pvbufferproperty, pdwbufferpropertysize)
  end
end
struct LibWin32::IWMSBufferAllocator
  def query_interface(this : IWMSBufferAllocator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSBufferAllocator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSBufferAllocator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def allocate_buffer(this : IWMSBufferAllocator*, dwmaxbuffersize : UInt32, ppbuffer : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_buffer.call(this, dwmaxbuffersize, ppbuffer)
  end
  def allocate_page_size_buffer(this : IWMSBufferAllocator*, dwmaxbuffersize : UInt32, ppbuffer : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_page_size_buffer.call(this, dwmaxbuffersize, ppbuffer)
  end
end
struct LibWin32::IWMMediaProps
  def query_interface(this : IWMMediaProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMMediaProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMMediaProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type(this : IWMMediaProps*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def get_media_type(this : IWMMediaProps*, ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.call(this, ptype, pcbtype)
  end
  def set_media_type(this : IWMMediaProps*, ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.call(this, ptype)
  end
end
struct LibWin32::IWMVideoMediaProps
  def query_interface(this : IWMVideoMediaProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMVideoMediaProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMVideoMediaProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type(this : IWMVideoMediaProps*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def get_media_type(this : IWMVideoMediaProps*, ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.call(this, ptype, pcbtype)
  end
  def set_media_type(this : IWMVideoMediaProps*, ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.call(this, ptype)
  end
  def get_max_key_frame_spacing(this : IWMVideoMediaProps*, plltime : Int64*) : HRESULT
    @lpVtbl.value.get_max_key_frame_spacing.call(this, plltime)
  end
  def set_max_key_frame_spacing(this : IWMVideoMediaProps*, lltime : Int64) : HRESULT
    @lpVtbl.value.set_max_key_frame_spacing.call(this, lltime)
  end
  def get_quality(this : IWMVideoMediaProps*, pdwquality : UInt32*) : HRESULT
    @lpVtbl.value.get_quality.call(this, pdwquality)
  end
  def set_quality(this : IWMVideoMediaProps*, dwquality : UInt32) : HRESULT
    @lpVtbl.value.set_quality.call(this, dwquality)
  end
end
struct LibWin32::IWMWriter
  def query_interface(this : IWMWriter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_profile_by_id(this : IWMWriter*, guidprofile : Guid*) : HRESULT
    @lpVtbl.value.set_profile_by_id.call(this, guidprofile)
  end
  def set_profile(this : IWMWriter*, pprofile : IWMProfile) : HRESULT
    @lpVtbl.value.set_profile.call(this, pprofile)
  end
  def set_output_filename(this : IWMWriter*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_output_filename.call(this, pwszfilename)
  end
  def get_input_count(this : IWMWriter*, pcinputs : UInt32*) : HRESULT
    @lpVtbl.value.get_input_count.call(this, pcinputs)
  end
  def get_input_props(this : IWMWriter*, dwinputnum : UInt32, ppinput : IWMInputMediaProps*) : HRESULT
    @lpVtbl.value.get_input_props.call(this, dwinputnum, ppinput)
  end
  def set_input_props(this : IWMWriter*, dwinputnum : UInt32, pinput : IWMInputMediaProps) : HRESULT
    @lpVtbl.value.set_input_props.call(this, dwinputnum, pinput)
  end
  def get_input_format_count(this : IWMWriter*, dwinputnumber : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_input_format_count.call(this, dwinputnumber, pcformats)
  end
  def get_input_format(this : IWMWriter*, dwinputnumber : UInt32, dwformatnumber : UInt32, pprops : IWMInputMediaProps*) : HRESULT
    @lpVtbl.value.get_input_format.call(this, dwinputnumber, dwformatnumber, pprops)
  end
  def begin_writing(this : IWMWriter*) : HRESULT
    @lpVtbl.value.begin_writing.call(this)
  end
  def end_writing(this : IWMWriter*) : HRESULT
    @lpVtbl.value.end_writing.call(this)
  end
  def allocate_sample(this : IWMWriter*, dwsamplesize : UInt32, ppsample : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_sample.call(this, dwsamplesize, ppsample)
  end
  def write_sample(this : IWMWriter*, dwinputnum : UInt32, cnssampletime : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_sample.call(this, dwinputnum, cnssampletime, dwflags, psample)
  end
  def flush(this : IWMWriter*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
end
struct LibWin32::IWMDRMWriter
  def query_interface(this : IWMDRMWriter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMWriter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMWriter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def generate_key_seed(this : IWMDRMWriter*, pwszkeyseed : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_seed.call(this, pwszkeyseed, pcwchlength)
  end
  def generate_key_id(this : IWMDRMWriter*, pwszkeyid : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_id.call(this, pwszkeyid, pcwchlength)
  end
  def generate_signing_key_pair(this : IWMDRMWriter*, pwszprivkey : Char*, pcwchprivkeylength : UInt32*, pwszpubkey : Char*, pcwchpubkeylength : UInt32*) : HRESULT
    @lpVtbl.value.generate_signing_key_pair.call(this, pwszprivkey, pcwchprivkeylength, pwszpubkey, pcwchpubkeylength)
  end
  def set_drm_attribute(this : IWMDRMWriter*, wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_attribute.call(this, wstreamnum, pszname, type, pvalue, cblength)
  end
end
struct LibWin32::IWMDRMWriter2
  def query_interface(this : IWMDRMWriter2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMWriter2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMWriter2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def generate_key_seed(this : IWMDRMWriter2*, pwszkeyseed : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_seed.call(this, pwszkeyseed, pcwchlength)
  end
  def generate_key_id(this : IWMDRMWriter2*, pwszkeyid : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_id.call(this, pwszkeyid, pcwchlength)
  end
  def generate_signing_key_pair(this : IWMDRMWriter2*, pwszprivkey : Char*, pcwchprivkeylength : UInt32*, pwszpubkey : Char*, pcwchpubkeylength : UInt32*) : HRESULT
    @lpVtbl.value.generate_signing_key_pair.call(this, pwszprivkey, pcwchprivkeylength, pwszpubkey, pcwchpubkeylength)
  end
  def set_drm_attribute(this : IWMDRMWriter2*, wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_attribute.call(this, wstreamnum, pszname, type, pvalue, cblength)
  end
  def set_wmdrm_net_encryption(this : IWMDRMWriter2*, fsamplesencrypted : LibC::BOOL, pbkeyid : UInt8*, cbkeyid : UInt32) : HRESULT
    @lpVtbl.value.set_wmdrm_net_encryption.call(this, fsamplesencrypted, pbkeyid, cbkeyid)
  end
end
struct LibWin32::IWMDRMWriter3
  def query_interface(this : IWMDRMWriter3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMWriter3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMWriter3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def generate_key_seed(this : IWMDRMWriter3*, pwszkeyseed : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_seed.call(this, pwszkeyseed, pcwchlength)
  end
  def generate_key_id(this : IWMDRMWriter3*, pwszkeyid : Char*, pcwchlength : UInt32*) : HRESULT
    @lpVtbl.value.generate_key_id.call(this, pwszkeyid, pcwchlength)
  end
  def generate_signing_key_pair(this : IWMDRMWriter3*, pwszprivkey : Char*, pcwchprivkeylength : UInt32*, pwszpubkey : Char*, pcwchpubkeylength : UInt32*) : HRESULT
    @lpVtbl.value.generate_signing_key_pair.call(this, pwszprivkey, pcwchprivkeylength, pwszpubkey, pcwchpubkeylength)
  end
  def set_drm_attribute(this : IWMDRMWriter3*, wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_attribute.call(this, wstreamnum, pszname, type, pvalue, cblength)
  end
  def set_wmdrm_net_encryption(this : IWMDRMWriter3*, fsamplesencrypted : LibC::BOOL, pbkeyid : UInt8*, cbkeyid : UInt32) : HRESULT
    @lpVtbl.value.set_wmdrm_net_encryption.call(this, fsamplesencrypted, pbkeyid, cbkeyid)
  end
  def set_protect_stream_samples(this : IWMDRMWriter3*, pimportinitstruct : WMDRM_IMPORT_INIT_STRUCT*) : HRESULT
    @lpVtbl.value.set_protect_stream_samples.call(this, pimportinitstruct)
  end
end
struct LibWin32::IWMInputMediaProps
  def query_interface(this : IWMInputMediaProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMInputMediaProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMInputMediaProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type(this : IWMInputMediaProps*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def get_media_type(this : IWMInputMediaProps*, ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.call(this, ptype, pcbtype)
  end
  def set_media_type(this : IWMInputMediaProps*, ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.call(this, ptype)
  end
  def get_connection_name(this : IWMInputMediaProps*, pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.call(this, pwszname, pcchname)
  end
  def get_group_name(this : IWMInputMediaProps*, pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_group_name.call(this, pwszname, pcchname)
  end
end
struct LibWin32::IWMPropertyVault
  def query_interface(this : IWMPropertyVault*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMPropertyVault*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMPropertyVault*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property_count(this : IWMPropertyVault*, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_property_count.call(this, pdwcount)
  end
  def get_property_by_name(this : IWMPropertyVault*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_property_by_name.call(this, pszname, ptype, pvalue, pdwsize)
  end
  def set_property(this : IWMPropertyVault*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE, pvalue : UInt8*, dwsize : UInt32) : HRESULT
    @lpVtbl.value.set_property.call(this, pszname, ptype, pvalue, dwsize)
  end
  def get_property_by_index(this : IWMPropertyVault*, dwindex : UInt32, pszname : Char*, pdwnamelen : UInt32*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_property_by_index.call(this, dwindex, pszname, pdwnamelen, ptype, pvalue, pdwsize)
  end
  def copy_properties_from(this : IWMPropertyVault*, piwmpropertyvault : IWMPropertyVault) : HRESULT
    @lpVtbl.value.copy_properties_from.call(this, piwmpropertyvault)
  end
  def clear(this : IWMPropertyVault*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
end
struct LibWin32::IWMIStreamProps
  def query_interface(this : IWMIStreamProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMIStreamProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMIStreamProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property(this : IWMIStreamProps*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_property.call(this, pszname, ptype, pvalue, pdwsize)
  end
end
struct LibWin32::IWMReader
  def query_interface(this : IWMReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IWMReader*, pwszurl : LibC::LPWSTR, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open.call(this, pwszurl, pcallback, pvcontext)
  end
  def close(this : IWMReader*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def get_output_count(this : IWMReader*, pcoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_output_count.call(this, pcoutputs)
  end
  def get_output_props(this : IWMReader*, dwoutputnum : UInt32, ppoutput : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_props.call(this, dwoutputnum, ppoutput)
  end
  def set_output_props(this : IWMReader*, dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.set_output_props.call(this, dwoutputnum, poutput)
  end
  def get_output_format_count(this : IWMReader*, dwoutputnumber : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_output_format_count.call(this, dwoutputnumber, pcformats)
  end
  def get_output_format(this : IWMReader*, dwoutputnumber : UInt32, dwformatnumber : UInt32, ppprops : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_format.call(this, dwoutputnumber, dwformatnumber, ppprops)
  end
  def start(this : IWMReader*, cnsstart : UInt64, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start.call(this, cnsstart, cnsduration, frate, pvcontext)
  end
  def stop(this : IWMReader*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def pause(this : IWMReader*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def resume(this : IWMReader*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
end
struct LibWin32::IWMSyncReader
  def query_interface(this : IWMSyncReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSyncReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSyncReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IWMSyncReader*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
  def close(this : IWMSyncReader*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def set_range(this : IWMSyncReader*, cnsstarttime : UInt64, cnsduration : Int64) : HRESULT
    @lpVtbl.value.set_range.call(this, cnsstarttime, cnsduration)
  end
  def set_range_by_frame(this : IWMSyncReader*, wstreamnum : UInt16, qwframenumber : UInt64, cframestoread : Int64) : HRESULT
    @lpVtbl.value.set_range_by_frame.call(this, wstreamnum, qwframenumber, cframestoread)
  end
  def get_next_sample(this : IWMSyncReader*, wstreamnum : UInt16, ppsample : INSSBuffer*, pcnssampletime : UInt64*, pcnsduration : UInt64*, pdwflags : UInt32*, pdwoutputnum : UInt32*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_next_sample.call(this, wstreamnum, ppsample, pcnssampletime, pcnsduration, pdwflags, pdwoutputnum, pwstreamnum)
  end
  def set_streams_selected(this : IWMSyncReader*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMSyncReader*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_read_stream_samples(this : IWMSyncReader*, wstreamnum : UInt16, fcompressed : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_read_stream_samples.call(this, wstreamnum, fcompressed)
  end
  def get_read_stream_samples(this : IWMSyncReader*, wstreamnum : UInt16, pfcompressed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_read_stream_samples.call(this, wstreamnum, pfcompressed)
  end
  def get_output_setting(this : IWMSyncReader*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMSyncReader*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def get_output_count(this : IWMSyncReader*, pcoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_output_count.call(this, pcoutputs)
  end
  def get_output_props(this : IWMSyncReader*, dwoutputnum : UInt32, ppoutput : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_props.call(this, dwoutputnum, ppoutput)
  end
  def set_output_props(this : IWMSyncReader*, dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.set_output_props.call(this, dwoutputnum, poutput)
  end
  def get_output_format_count(this : IWMSyncReader*, dwoutputnum : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_output_format_count.call(this, dwoutputnum, pcformats)
  end
  def get_output_format(this : IWMSyncReader*, dwoutputnum : UInt32, dwformatnum : UInt32, ppprops : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_format.call(this, dwoutputnum, dwformatnum, ppprops)
  end
  def get_output_number_for_stream(this : IWMSyncReader*, wstreamnum : UInt16, pdwoutputnum : UInt32*) : HRESULT
    @lpVtbl.value.get_output_number_for_stream.call(this, wstreamnum, pdwoutputnum)
  end
  def get_stream_number_for_output(this : IWMSyncReader*, dwoutputnum : UInt32, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number_for_output.call(this, dwoutputnum, pwstreamnum)
  end
  def get_max_output_sample_size(this : IWMSyncReader*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMSyncReader*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def open_stream(this : IWMSyncReader*, pstream : IStream) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream)
  end
end
struct LibWin32::IWMSyncReader2
  def query_interface(this : IWMSyncReader2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSyncReader2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSyncReader2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IWMSyncReader2*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
  def close(this : IWMSyncReader2*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def set_range(this : IWMSyncReader2*, cnsstarttime : UInt64, cnsduration : Int64) : HRESULT
    @lpVtbl.value.set_range.call(this, cnsstarttime, cnsduration)
  end
  def set_range_by_frame(this : IWMSyncReader2*, wstreamnum : UInt16, qwframenumber : UInt64, cframestoread : Int64) : HRESULT
    @lpVtbl.value.set_range_by_frame.call(this, wstreamnum, qwframenumber, cframestoread)
  end
  def get_next_sample(this : IWMSyncReader2*, wstreamnum : UInt16, ppsample : INSSBuffer*, pcnssampletime : UInt64*, pcnsduration : UInt64*, pdwflags : UInt32*, pdwoutputnum : UInt32*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_next_sample.call(this, wstreamnum, ppsample, pcnssampletime, pcnsduration, pdwflags, pdwoutputnum, pwstreamnum)
  end
  def set_streams_selected(this : IWMSyncReader2*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMSyncReader2*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_read_stream_samples(this : IWMSyncReader2*, wstreamnum : UInt16, fcompressed : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_read_stream_samples.call(this, wstreamnum, fcompressed)
  end
  def get_read_stream_samples(this : IWMSyncReader2*, wstreamnum : UInt16, pfcompressed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_read_stream_samples.call(this, wstreamnum, pfcompressed)
  end
  def get_output_setting(this : IWMSyncReader2*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMSyncReader2*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def get_output_count(this : IWMSyncReader2*, pcoutputs : UInt32*) : HRESULT
    @lpVtbl.value.get_output_count.call(this, pcoutputs)
  end
  def get_output_props(this : IWMSyncReader2*, dwoutputnum : UInt32, ppoutput : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_props.call(this, dwoutputnum, ppoutput)
  end
  def set_output_props(this : IWMSyncReader2*, dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.set_output_props.call(this, dwoutputnum, poutput)
  end
  def get_output_format_count(this : IWMSyncReader2*, dwoutputnum : UInt32, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_output_format_count.call(this, dwoutputnum, pcformats)
  end
  def get_output_format(this : IWMSyncReader2*, dwoutputnum : UInt32, dwformatnum : UInt32, ppprops : IWMOutputMediaProps*) : HRESULT
    @lpVtbl.value.get_output_format.call(this, dwoutputnum, dwformatnum, ppprops)
  end
  def get_output_number_for_stream(this : IWMSyncReader2*, wstreamnum : UInt16, pdwoutputnum : UInt32*) : HRESULT
    @lpVtbl.value.get_output_number_for_stream.call(this, wstreamnum, pdwoutputnum)
  end
  def get_stream_number_for_output(this : IWMSyncReader2*, dwoutputnum : UInt32, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number_for_output.call(this, dwoutputnum, pwstreamnum)
  end
  def get_max_output_sample_size(this : IWMSyncReader2*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMSyncReader2*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def open_stream(this : IWMSyncReader2*, pstream : IStream) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream)
  end
  def set_range_by_timecode(this : IWMSyncReader2*, wstreamnum : UInt16, pstart : WMT_TIMECODE_EXTENSION_DATA*, pend : WMT_TIMECODE_EXTENSION_DATA*) : HRESULT
    @lpVtbl.value.set_range_by_timecode.call(this, wstreamnum, pstart, pend)
  end
  def set_range_by_frame_ex(this : IWMSyncReader2*, wstreamnum : UInt16, qwframenumber : UInt64, cframestoread : Int64, pcnsstarttime : UInt64*) : HRESULT
    @lpVtbl.value.set_range_by_frame_ex.call(this, wstreamnum, qwframenumber, cframestoread, pcnsstarttime)
  end
  def set_allocate_for_output(this : IWMSyncReader2*, dwoutputnum : UInt32, pallocator : IWMReaderAllocatorEx) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, pallocator)
  end
  def get_allocate_for_output(this : IWMSyncReader2*, dwoutputnum : UInt32, ppallocator : IWMReaderAllocatorEx*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, ppallocator)
  end
  def set_allocate_for_stream(this : IWMSyncReader2*, wstreamnum : UInt16, pallocator : IWMReaderAllocatorEx) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, pallocator)
  end
  def get_allocate_for_stream(this : IWMSyncReader2*, dwsreamnum : UInt16, ppallocator : IWMReaderAllocatorEx*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, ppallocator)
  end
end
struct LibWin32::IWMOutputMediaProps
  def query_interface(this : IWMOutputMediaProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMOutputMediaProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMOutputMediaProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type(this : IWMOutputMediaProps*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def get_media_type(this : IWMOutputMediaProps*, ptype : WM_MEDIA_TYPE*, pcbtype : UInt32*) : HRESULT
    @lpVtbl.value.get_media_type.call(this, ptype, pcbtype)
  end
  def set_media_type(this : IWMOutputMediaProps*, ptype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.set_media_type.call(this, ptype)
  end
  def get_stream_group_name(this : IWMOutputMediaProps*, pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_group_name.call(this, pwszname, pcchname)
  end
  def get_connection_name(this : IWMOutputMediaProps*, pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.call(this, pwszname, pcchname)
  end
end
struct LibWin32::IWMStatusCallback
  def query_interface(this : IWMStatusCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMStatusCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMStatusCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_status(this : IWMStatusCallback*, status : WMT_STATUS, hr : HRESULT, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_status.call(this, status, hr, dwtype, pvalue, pvcontext)
  end
end
struct LibWin32::IWMReaderCallback
  def query_interface(this : IWMReaderCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_status(this : IWMReaderCallback*, status : WMT_STATUS, hr : HRESULT, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_status.call(this, status, hr, dwtype, pvalue, pvcontext)
  end
  def on_sample(this : IWMReaderCallback*, dwoutputnum : UInt32, cnssampletime : UInt64, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_sample.call(this, dwoutputnum, cnssampletime, cnssampleduration, dwflags, psample, pvcontext)
  end
end
struct LibWin32::IWMCredentialCallback
  def query_interface(this : IWMCredentialCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMCredentialCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMCredentialCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_credentials(this : IWMCredentialCallback*, pwszrealm : LibC::LPWSTR, pwszsite : LibC::LPWSTR, pwszuser : Char*, cchuser : UInt32, pwszpassword : Char*, cchpassword : UInt32, hrstatus : HRESULT, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.acquire_credentials.call(this, pwszrealm, pwszsite, pwszuser, cchuser, pwszpassword, cchpassword, hrstatus, pdwflags)
  end
end
struct LibWin32::IWMMetadataEditor
  def query_interface(this : IWMMetadataEditor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMMetadataEditor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMMetadataEditor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IWMMetadataEditor*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
  def close(this : IWMMetadataEditor*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def flush(this : IWMMetadataEditor*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
end
struct LibWin32::IWMMetadataEditor2
  def query_interface(this : IWMMetadataEditor2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMMetadataEditor2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMMetadataEditor2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def open(this : IWMMetadataEditor2*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
  def close(this : IWMMetadataEditor2*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def flush(this : IWMMetadataEditor2*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
  def open_ex(this : IWMMetadataEditor2*, pwszfilename : LibC::LPWSTR, dwdesiredaccess : UInt32, dwsharemode : UInt32) : HRESULT
    @lpVtbl.value.open_ex.call(this, pwszfilename, dwdesiredaccess, dwsharemode)
  end
end
struct LibWin32::IWMDRMEditor
  def query_interface(this : IWMDRMEditor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMEditor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMEditor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_drm_property(this : IWMDRMEditor*, pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.call(this, pwstrname, pdwtype, pvalue, pcblength)
  end
end
struct LibWin32::IWMHeaderInfo
  def query_interface(this : IWMHeaderInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMHeaderInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMHeaderInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attribute_count(this : IWMHeaderInfo*, wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count.call(this, wstreamnum, pcattributes)
  end
  def get_attribute_by_index(this : IWMHeaderInfo*, windex : UInt16, pwstreamnum : UInt16*, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_index.call(this, windex, pwstreamnum, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_attribute_by_name(this : IWMHeaderInfo*, pwstreamnum : UInt16*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_name.call(this, pwstreamnum, pszname, ptype, pvalue, pcblength)
  end
  def set_attribute(this : IWMHeaderInfo*, wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_attribute.call(this, wstreamnum, pszname, type, pvalue, cblength)
  end
  def get_marker_count(this : IWMHeaderInfo*, pcmarkers : UInt16*) : HRESULT
    @lpVtbl.value.get_marker_count.call(this, pcmarkers)
  end
  def get_marker(this : IWMHeaderInfo*, windex : UInt16, pwszmarkername : Char*, pcchmarkernamelen : UInt16*, pcnsmarkertime : UInt64*) : HRESULT
    @lpVtbl.value.get_marker.call(this, windex, pwszmarkername, pcchmarkernamelen, pcnsmarkertime)
  end
  def add_marker(this : IWMHeaderInfo*, pwszmarkername : LibC::LPWSTR, cnsmarkertime : UInt64) : HRESULT
    @lpVtbl.value.add_marker.call(this, pwszmarkername, cnsmarkertime)
  end
  def remove_marker(this : IWMHeaderInfo*, windex : UInt16) : HRESULT
    @lpVtbl.value.remove_marker.call(this, windex)
  end
  def get_script_count(this : IWMHeaderInfo*, pcscripts : UInt16*) : HRESULT
    @lpVtbl.value.get_script_count.call(this, pcscripts)
  end
  def get_script(this : IWMHeaderInfo*, windex : UInt16, pwsztype : Char*, pcchtypelen : UInt16*, pwszcommand : Char*, pcchcommandlen : UInt16*, pcnsscripttime : UInt64*) : HRESULT
    @lpVtbl.value.get_script.call(this, windex, pwsztype, pcchtypelen, pwszcommand, pcchcommandlen, pcnsscripttime)
  end
  def add_script(this : IWMHeaderInfo*, pwsztype : LibC::LPWSTR, pwszcommand : LibC::LPWSTR, cnsscripttime : UInt64) : HRESULT
    @lpVtbl.value.add_script.call(this, pwsztype, pwszcommand, cnsscripttime)
  end
  def remove_script(this : IWMHeaderInfo*, windex : UInt16) : HRESULT
    @lpVtbl.value.remove_script.call(this, windex)
  end
end
struct LibWin32::IWMHeaderInfo2
  def query_interface(this : IWMHeaderInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMHeaderInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMHeaderInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attribute_count(this : IWMHeaderInfo2*, wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count.call(this, wstreamnum, pcattributes)
  end
  def get_attribute_by_index(this : IWMHeaderInfo2*, windex : UInt16, pwstreamnum : UInt16*, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_index.call(this, windex, pwstreamnum, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_attribute_by_name(this : IWMHeaderInfo2*, pwstreamnum : UInt16*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_name.call(this, pwstreamnum, pszname, ptype, pvalue, pcblength)
  end
  def set_attribute(this : IWMHeaderInfo2*, wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_attribute.call(this, wstreamnum, pszname, type, pvalue, cblength)
  end
  def get_marker_count(this : IWMHeaderInfo2*, pcmarkers : UInt16*) : HRESULT
    @lpVtbl.value.get_marker_count.call(this, pcmarkers)
  end
  def get_marker(this : IWMHeaderInfo2*, windex : UInt16, pwszmarkername : Char*, pcchmarkernamelen : UInt16*, pcnsmarkertime : UInt64*) : HRESULT
    @lpVtbl.value.get_marker.call(this, windex, pwszmarkername, pcchmarkernamelen, pcnsmarkertime)
  end
  def add_marker(this : IWMHeaderInfo2*, pwszmarkername : LibC::LPWSTR, cnsmarkertime : UInt64) : HRESULT
    @lpVtbl.value.add_marker.call(this, pwszmarkername, cnsmarkertime)
  end
  def remove_marker(this : IWMHeaderInfo2*, windex : UInt16) : HRESULT
    @lpVtbl.value.remove_marker.call(this, windex)
  end
  def get_script_count(this : IWMHeaderInfo2*, pcscripts : UInt16*) : HRESULT
    @lpVtbl.value.get_script_count.call(this, pcscripts)
  end
  def get_script(this : IWMHeaderInfo2*, windex : UInt16, pwsztype : Char*, pcchtypelen : UInt16*, pwszcommand : Char*, pcchcommandlen : UInt16*, pcnsscripttime : UInt64*) : HRESULT
    @lpVtbl.value.get_script.call(this, windex, pwsztype, pcchtypelen, pwszcommand, pcchcommandlen, pcnsscripttime)
  end
  def add_script(this : IWMHeaderInfo2*, pwsztype : LibC::LPWSTR, pwszcommand : LibC::LPWSTR, cnsscripttime : UInt64) : HRESULT
    @lpVtbl.value.add_script.call(this, pwsztype, pwszcommand, cnsscripttime)
  end
  def remove_script(this : IWMHeaderInfo2*, windex : UInt16) : HRESULT
    @lpVtbl.value.remove_script.call(this, windex)
  end
  def get_codec_info_count(this : IWMHeaderInfo2*, pccodecinfos : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.call(this, pccodecinfos)
  end
  def get_codec_info(this : IWMHeaderInfo2*, windex : UInt32, pcchname : UInt16*, pwszname : Char*, pcchdescription : UInt16*, pwszdescription : Char*, pcodectype : WMT_CODEC_INFO_TYPE*, pcbcodecinfo : UInt16*, pbcodecinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_codec_info.call(this, windex, pcchname, pwszname, pcchdescription, pwszdescription, pcodectype, pcbcodecinfo, pbcodecinfo)
  end
end
struct LibWin32::IWMHeaderInfo3
  def query_interface(this : IWMHeaderInfo3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMHeaderInfo3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMHeaderInfo3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_attribute_count(this : IWMHeaderInfo3*, wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count.call(this, wstreamnum, pcattributes)
  end
  def get_attribute_by_index(this : IWMHeaderInfo3*, windex : UInt16, pwstreamnum : UInt16*, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_index.call(this, windex, pwstreamnum, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_attribute_by_name(this : IWMHeaderInfo3*, pwstreamnum : UInt16*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_by_name.call(this, pwstreamnum, pszname, ptype, pvalue, pcblength)
  end
  def set_attribute(this : IWMHeaderInfo3*, wstreamnum : UInt16, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_attribute.call(this, wstreamnum, pszname, type, pvalue, cblength)
  end
  def get_marker_count(this : IWMHeaderInfo3*, pcmarkers : UInt16*) : HRESULT
    @lpVtbl.value.get_marker_count.call(this, pcmarkers)
  end
  def get_marker(this : IWMHeaderInfo3*, windex : UInt16, pwszmarkername : Char*, pcchmarkernamelen : UInt16*, pcnsmarkertime : UInt64*) : HRESULT
    @lpVtbl.value.get_marker.call(this, windex, pwszmarkername, pcchmarkernamelen, pcnsmarkertime)
  end
  def add_marker(this : IWMHeaderInfo3*, pwszmarkername : LibC::LPWSTR, cnsmarkertime : UInt64) : HRESULT
    @lpVtbl.value.add_marker.call(this, pwszmarkername, cnsmarkertime)
  end
  def remove_marker(this : IWMHeaderInfo3*, windex : UInt16) : HRESULT
    @lpVtbl.value.remove_marker.call(this, windex)
  end
  def get_script_count(this : IWMHeaderInfo3*, pcscripts : UInt16*) : HRESULT
    @lpVtbl.value.get_script_count.call(this, pcscripts)
  end
  def get_script(this : IWMHeaderInfo3*, windex : UInt16, pwsztype : Char*, pcchtypelen : UInt16*, pwszcommand : Char*, pcchcommandlen : UInt16*, pcnsscripttime : UInt64*) : HRESULT
    @lpVtbl.value.get_script.call(this, windex, pwsztype, pcchtypelen, pwszcommand, pcchcommandlen, pcnsscripttime)
  end
  def add_script(this : IWMHeaderInfo3*, pwsztype : LibC::LPWSTR, pwszcommand : LibC::LPWSTR, cnsscripttime : UInt64) : HRESULT
    @lpVtbl.value.add_script.call(this, pwsztype, pwszcommand, cnsscripttime)
  end
  def remove_script(this : IWMHeaderInfo3*, windex : UInt16) : HRESULT
    @lpVtbl.value.remove_script.call(this, windex)
  end
  def get_codec_info_count(this : IWMHeaderInfo3*, pccodecinfos : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.call(this, pccodecinfos)
  end
  def get_codec_info(this : IWMHeaderInfo3*, windex : UInt32, pcchname : UInt16*, pwszname : Char*, pcchdescription : UInt16*, pwszdescription : Char*, pcodectype : WMT_CODEC_INFO_TYPE*, pcbcodecinfo : UInt16*, pbcodecinfo : UInt8*) : HRESULT
    @lpVtbl.value.get_codec_info.call(this, windex, pcchname, pwszname, pcchdescription, pwszdescription, pcodectype, pcbcodecinfo, pbcodecinfo)
  end
  def get_attribute_count_ex(this : IWMHeaderInfo3*, wstreamnum : UInt16, pcattributes : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_count_ex.call(this, wstreamnum, pcattributes)
  end
  def get_attribute_indices(this : IWMHeaderInfo3*, wstreamnum : UInt16, pwszname : LibC::LPWSTR, pwlangindex : UInt16*, pwindices : UInt16*, pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_attribute_indices.call(this, wstreamnum, pwszname, pwlangindex, pwindices, pwcount)
  end
  def get_attribute_by_index_ex(this : IWMHeaderInfo3*, wstreamnum : UInt16, windex : UInt16, pwszname : Char*, pwnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pwlangindex : UInt16*, pvalue : UInt8*, pdwdatalength : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_by_index_ex.call(this, wstreamnum, windex, pwszname, pwnamelen, ptype, pwlangindex, pvalue, pdwdatalength)
  end
  def modify_attribute(this : IWMHeaderInfo3*, wstreamnum : UInt16, windex : UInt16, type : WMT_ATTR_DATATYPE, wlangindex : UInt16, pvalue : UInt8*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.modify_attribute.call(this, wstreamnum, windex, type, wlangindex, pvalue, dwlength)
  end
  def add_attribute(this : IWMHeaderInfo3*, wstreamnum : UInt16, pszname : LibC::LPWSTR, pwindex : UInt16*, type : WMT_ATTR_DATATYPE, wlangindex : UInt16, pvalue : UInt8*, dwlength : UInt32) : HRESULT
    @lpVtbl.value.add_attribute.call(this, wstreamnum, pszname, pwindex, type, wlangindex, pvalue, dwlength)
  end
  def delete_attribute(this : IWMHeaderInfo3*, wstreamnum : UInt16, windex : UInt16) : HRESULT
    @lpVtbl.value.delete_attribute.call(this, wstreamnum, windex)
  end
  def add_codec_info(this : IWMHeaderInfo3*, pwszname : LibC::LPWSTR, pwszdescription : LibC::LPWSTR, codectype : WMT_CODEC_INFO_TYPE, cbcodecinfo : UInt16, pbcodecinfo : UInt8*) : HRESULT
    @lpVtbl.value.add_codec_info.call(this, pwszname, pwszdescription, codectype, cbcodecinfo, pbcodecinfo)
  end
end
struct LibWin32::IWMProfileManager
  def query_interface(this : IWMProfileManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProfileManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProfileManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_empty_profile(this : IWMProfileManager*, dwversion : WMT_VERSION, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.create_empty_profile.call(this, dwversion, ppprofile)
  end
  def load_profile_by_id(this : IWMProfileManager*, guidprofile : Guid*, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_id.call(this, guidprofile, ppprofile)
  end
  def load_profile_by_data(this : IWMProfileManager*, pwszprofile : LibC::LPWSTR, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_data.call(this, pwszprofile, ppprofile)
  end
  def save_profile(this : IWMProfileManager*, piwmprofile : IWMProfile, pwszprofile : LibC::LPWSTR, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.save_profile.call(this, piwmprofile, pwszprofile, pdwlength)
  end
  def get_system_profile_count(this : IWMProfileManager*, pcprofiles : UInt32*) : HRESULT
    @lpVtbl.value.get_system_profile_count.call(this, pcprofiles)
  end
  def load_system_profile(this : IWMProfileManager*, dwprofileindex : UInt32, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_system_profile.call(this, dwprofileindex, ppprofile)
  end
end
struct LibWin32::IWMProfileManager2
  def query_interface(this : IWMProfileManager2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProfileManager2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProfileManager2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_empty_profile(this : IWMProfileManager2*, dwversion : WMT_VERSION, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.create_empty_profile.call(this, dwversion, ppprofile)
  end
  def load_profile_by_id(this : IWMProfileManager2*, guidprofile : Guid*, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_id.call(this, guidprofile, ppprofile)
  end
  def load_profile_by_data(this : IWMProfileManager2*, pwszprofile : LibC::LPWSTR, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_profile_by_data.call(this, pwszprofile, ppprofile)
  end
  def save_profile(this : IWMProfileManager2*, piwmprofile : IWMProfile, pwszprofile : LibC::LPWSTR, pdwlength : UInt32*) : HRESULT
    @lpVtbl.value.save_profile.call(this, piwmprofile, pwszprofile, pdwlength)
  end
  def get_system_profile_count(this : IWMProfileManager2*, pcprofiles : UInt32*) : HRESULT
    @lpVtbl.value.get_system_profile_count.call(this, pcprofiles)
  end
  def load_system_profile(this : IWMProfileManager2*, dwprofileindex : UInt32, ppprofile : IWMProfile*) : HRESULT
    @lpVtbl.value.load_system_profile.call(this, dwprofileindex, ppprofile)
  end
  def get_system_profile_version(this : IWMProfileManager2*, pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_system_profile_version.call(this, pdwversion)
  end
  def set_system_profile_version(this : IWMProfileManager2*, dwversion : WMT_VERSION) : HRESULT
    @lpVtbl.value.set_system_profile_version.call(this, dwversion)
  end
end
struct LibWin32::IWMProfileManagerLanguage
  def query_interface(this : IWMProfileManagerLanguage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProfileManagerLanguage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProfileManagerLanguage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_user_language_id(this : IWMProfileManagerLanguage*, wlangid : UInt16*) : HRESULT
    @lpVtbl.value.get_user_language_id.call(this, wlangid)
  end
  def set_user_language_id(this : IWMProfileManagerLanguage*, wlangid : UInt16) : HRESULT
    @lpVtbl.value.set_user_language_id.call(this, wlangid)
  end
end
struct LibWin32::IWMProfile
  def query_interface(this : IWMProfile*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProfile*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProfile*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_version(this : IWMProfile*, pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_name(this : IWMProfile*, pwszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, pcchname)
  end
  def set_name(this : IWMProfile*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.call(this, pwszname)
  end
  def get_description(this : IWMProfile*, pwszdescription : Char*, pcchdescription : UInt32*) : HRESULT
    @lpVtbl.value.get_description.call(this, pwszdescription, pcchdescription)
  end
  def set_description(this : IWMProfile*, pwszdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.call(this, pwszdescription)
  end
  def get_stream_count(this : IWMProfile*, pcstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.call(this, pcstreams)
  end
  def get_stream(this : IWMProfile*, dwstreamindex : UInt32, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream.call(this, dwstreamindex, ppconfig)
  end
  def get_stream_by_number(this : IWMProfile*, wstreamnum : UInt16, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream_by_number.call(this, wstreamnum, ppconfig)
  end
  def remove_stream(this : IWMProfile*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.remove_stream.call(this, pconfig)
  end
  def remove_stream_by_number(this : IWMProfile*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_by_number.call(this, wstreamnum)
  end
  def add_stream(this : IWMProfile*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.add_stream.call(this, pconfig)
  end
  def reconfig_stream(this : IWMProfile*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.reconfig_stream.call(this, pconfig)
  end
  def create_new_stream(this : IWMProfile*, guidstreamtype : Guid*, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.create_new_stream.call(this, guidstreamtype, ppconfig)
  end
  def get_mutual_exclusion_count(this : IWMProfile*, pcme : UInt32*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion_count.call(this, pcme)
  end
  def get_mutual_exclusion(this : IWMProfile*, dwmeindex : UInt32, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion.call(this, dwmeindex, ppme)
  end
  def remove_mutual_exclusion(this : IWMProfile*, pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.remove_mutual_exclusion.call(this, pme)
  end
  def add_mutual_exclusion(this : IWMProfile*, pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.add_mutual_exclusion.call(this, pme)
  end
  def create_new_mutual_exclusion(this : IWMProfile*, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.create_new_mutual_exclusion.call(this, ppme)
  end
end
struct LibWin32::IWMProfile2
  def query_interface(this : IWMProfile2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProfile2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProfile2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_version(this : IWMProfile2*, pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_name(this : IWMProfile2*, pwszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, pcchname)
  end
  def set_name(this : IWMProfile2*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.call(this, pwszname)
  end
  def get_description(this : IWMProfile2*, pwszdescription : Char*, pcchdescription : UInt32*) : HRESULT
    @lpVtbl.value.get_description.call(this, pwszdescription, pcchdescription)
  end
  def set_description(this : IWMProfile2*, pwszdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.call(this, pwszdescription)
  end
  def get_stream_count(this : IWMProfile2*, pcstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.call(this, pcstreams)
  end
  def get_stream(this : IWMProfile2*, dwstreamindex : UInt32, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream.call(this, dwstreamindex, ppconfig)
  end
  def get_stream_by_number(this : IWMProfile2*, wstreamnum : UInt16, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream_by_number.call(this, wstreamnum, ppconfig)
  end
  def remove_stream(this : IWMProfile2*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.remove_stream.call(this, pconfig)
  end
  def remove_stream_by_number(this : IWMProfile2*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_by_number.call(this, wstreamnum)
  end
  def add_stream(this : IWMProfile2*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.add_stream.call(this, pconfig)
  end
  def reconfig_stream(this : IWMProfile2*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.reconfig_stream.call(this, pconfig)
  end
  def create_new_stream(this : IWMProfile2*, guidstreamtype : Guid*, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.create_new_stream.call(this, guidstreamtype, ppconfig)
  end
  def get_mutual_exclusion_count(this : IWMProfile2*, pcme : UInt32*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion_count.call(this, pcme)
  end
  def get_mutual_exclusion(this : IWMProfile2*, dwmeindex : UInt32, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion.call(this, dwmeindex, ppme)
  end
  def remove_mutual_exclusion(this : IWMProfile2*, pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.remove_mutual_exclusion.call(this, pme)
  end
  def add_mutual_exclusion(this : IWMProfile2*, pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.add_mutual_exclusion.call(this, pme)
  end
  def create_new_mutual_exclusion(this : IWMProfile2*, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.create_new_mutual_exclusion.call(this, ppme)
  end
  def get_profile_id(this : IWMProfile2*, pguidid : Guid*) : HRESULT
    @lpVtbl.value.get_profile_id.call(this, pguidid)
  end
end
struct LibWin32::IWMProfile3
  def query_interface(this : IWMProfile3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProfile3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProfile3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_version(this : IWMProfile3*, pdwversion : WMT_VERSION*) : HRESULT
    @lpVtbl.value.get_version.call(this, pdwversion)
  end
  def get_name(this : IWMProfile3*, pwszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, pcchname)
  end
  def set_name(this : IWMProfile3*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.call(this, pwszname)
  end
  def get_description(this : IWMProfile3*, pwszdescription : Char*, pcchdescription : UInt32*) : HRESULT
    @lpVtbl.value.get_description.call(this, pwszdescription, pcchdescription)
  end
  def set_description(this : IWMProfile3*, pwszdescription : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_description.call(this, pwszdescription)
  end
  def get_stream_count(this : IWMProfile3*, pcstreams : UInt32*) : HRESULT
    @lpVtbl.value.get_stream_count.call(this, pcstreams)
  end
  def get_stream(this : IWMProfile3*, dwstreamindex : UInt32, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream.call(this, dwstreamindex, ppconfig)
  end
  def get_stream_by_number(this : IWMProfile3*, wstreamnum : UInt16, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_stream_by_number.call(this, wstreamnum, ppconfig)
  end
  def remove_stream(this : IWMProfile3*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.remove_stream.call(this, pconfig)
  end
  def remove_stream_by_number(this : IWMProfile3*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_by_number.call(this, wstreamnum)
  end
  def add_stream(this : IWMProfile3*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.add_stream.call(this, pconfig)
  end
  def reconfig_stream(this : IWMProfile3*, pconfig : IWMStreamConfig) : HRESULT
    @lpVtbl.value.reconfig_stream.call(this, pconfig)
  end
  def create_new_stream(this : IWMProfile3*, guidstreamtype : Guid*, ppconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.create_new_stream.call(this, guidstreamtype, ppconfig)
  end
  def get_mutual_exclusion_count(this : IWMProfile3*, pcme : UInt32*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion_count.call(this, pcme)
  end
  def get_mutual_exclusion(this : IWMProfile3*, dwmeindex : UInt32, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.get_mutual_exclusion.call(this, dwmeindex, ppme)
  end
  def remove_mutual_exclusion(this : IWMProfile3*, pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.remove_mutual_exclusion.call(this, pme)
  end
  def add_mutual_exclusion(this : IWMProfile3*, pme : IWMMutualExclusion) : HRESULT
    @lpVtbl.value.add_mutual_exclusion.call(this, pme)
  end
  def create_new_mutual_exclusion(this : IWMProfile3*, ppme : IWMMutualExclusion*) : HRESULT
    @lpVtbl.value.create_new_mutual_exclusion.call(this, ppme)
  end
  def get_profile_id(this : IWMProfile3*, pguidid : Guid*) : HRESULT
    @lpVtbl.value.get_profile_id.call(this, pguidid)
  end
  def get_storage_format(this : IWMProfile3*, pnstorageformat : WMT_STORAGE_FORMAT*) : HRESULT
    @lpVtbl.value.get_storage_format.call(this, pnstorageformat)
  end
  def set_storage_format(this : IWMProfile3*, nstorageformat : WMT_STORAGE_FORMAT) : HRESULT
    @lpVtbl.value.set_storage_format.call(this, nstorageformat)
  end
  def get_bandwidth_sharing_count(this : IWMProfile3*, pcbs : UInt32*) : HRESULT
    @lpVtbl.value.get_bandwidth_sharing_count.call(this, pcbs)
  end
  def get_bandwidth_sharing(this : IWMProfile3*, dwbsindex : UInt32, ppbs : IWMBandwidthSharing*) : HRESULT
    @lpVtbl.value.get_bandwidth_sharing.call(this, dwbsindex, ppbs)
  end
  def remove_bandwidth_sharing(this : IWMProfile3*, pbs : IWMBandwidthSharing) : HRESULT
    @lpVtbl.value.remove_bandwidth_sharing.call(this, pbs)
  end
  def add_bandwidth_sharing(this : IWMProfile3*, pbs : IWMBandwidthSharing) : HRESULT
    @lpVtbl.value.add_bandwidth_sharing.call(this, pbs)
  end
  def create_new_bandwidth_sharing(this : IWMProfile3*, ppbs : IWMBandwidthSharing*) : HRESULT
    @lpVtbl.value.create_new_bandwidth_sharing.call(this, ppbs)
  end
  def get_stream_prioritization(this : IWMProfile3*, ppsp : IWMStreamPrioritization*) : HRESULT
    @lpVtbl.value.get_stream_prioritization.call(this, ppsp)
  end
  def set_stream_prioritization(this : IWMProfile3*, psp : IWMStreamPrioritization) : HRESULT
    @lpVtbl.value.set_stream_prioritization.call(this, psp)
  end
  def remove_stream_prioritization(this : IWMProfile3*) : HRESULT
    @lpVtbl.value.remove_stream_prioritization.call(this)
  end
  def create_new_stream_prioritization(this : IWMProfile3*, ppsp : IWMStreamPrioritization*) : HRESULT
    @lpVtbl.value.create_new_stream_prioritization.call(this, ppsp)
  end
  def get_expected_packet_count(this : IWMProfile3*, msduration : UInt64, pcpackets : UInt64*) : HRESULT
    @lpVtbl.value.get_expected_packet_count.call(this, msduration, pcpackets)
  end
end
struct LibWin32::IWMStreamConfig
  def query_interface(this : IWMStreamConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMStreamConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMStreamConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_stream_type(this : IWMStreamConfig*, pguidstreamtype : Guid*) : HRESULT
    @lpVtbl.value.get_stream_type.call(this, pguidstreamtype)
  end
  def get_stream_number(this : IWMStreamConfig*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number.call(this, pwstreamnum)
  end
  def set_stream_number(this : IWMStreamConfig*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.set_stream_number.call(this, wstreamnum)
  end
  def get_stream_name(this : IWMStreamConfig*, pwszstreamname : Char*, pcchstreamname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_name.call(this, pwszstreamname, pcchstreamname)
  end
  def set_stream_name(this : IWMStreamConfig*, pwszstreamname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stream_name.call(this, pwszstreamname)
  end
  def get_connection_name(this : IWMStreamConfig*, pwszinputname : Char*, pcchinputname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.call(this, pwszinputname, pcchinputname)
  end
  def set_connection_name(this : IWMStreamConfig*, pwszinputname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_connection_name.call(this, pwszinputname)
  end
  def get_bitrate(this : IWMStreamConfig*, pdwbitrate : UInt32*) : HRESULT
    @lpVtbl.value.get_bitrate.call(this, pdwbitrate)
  end
  def set_bitrate(this : IWMStreamConfig*, pdwbitrate : UInt32) : HRESULT
    @lpVtbl.value.set_bitrate.call(this, pdwbitrate)
  end
  def get_buffer_window(this : IWMStreamConfig*, pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_window.call(this, pmsbufferwindow)
  end
  def set_buffer_window(this : IWMStreamConfig*, msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_window.call(this, msbufferwindow)
  end
end
struct LibWin32::IWMStreamConfig2
  def query_interface(this : IWMStreamConfig2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMStreamConfig2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMStreamConfig2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_stream_type(this : IWMStreamConfig2*, pguidstreamtype : Guid*) : HRESULT
    @lpVtbl.value.get_stream_type.call(this, pguidstreamtype)
  end
  def get_stream_number(this : IWMStreamConfig2*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number.call(this, pwstreamnum)
  end
  def set_stream_number(this : IWMStreamConfig2*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.set_stream_number.call(this, wstreamnum)
  end
  def get_stream_name(this : IWMStreamConfig2*, pwszstreamname : Char*, pcchstreamname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_name.call(this, pwszstreamname, pcchstreamname)
  end
  def set_stream_name(this : IWMStreamConfig2*, pwszstreamname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stream_name.call(this, pwszstreamname)
  end
  def get_connection_name(this : IWMStreamConfig2*, pwszinputname : Char*, pcchinputname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.call(this, pwszinputname, pcchinputname)
  end
  def set_connection_name(this : IWMStreamConfig2*, pwszinputname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_connection_name.call(this, pwszinputname)
  end
  def get_bitrate(this : IWMStreamConfig2*, pdwbitrate : UInt32*) : HRESULT
    @lpVtbl.value.get_bitrate.call(this, pdwbitrate)
  end
  def set_bitrate(this : IWMStreamConfig2*, pdwbitrate : UInt32) : HRESULT
    @lpVtbl.value.set_bitrate.call(this, pdwbitrate)
  end
  def get_buffer_window(this : IWMStreamConfig2*, pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_window.call(this, pmsbufferwindow)
  end
  def set_buffer_window(this : IWMStreamConfig2*, msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_window.call(this, msbufferwindow)
  end
  def get_transport_type(this : IWMStreamConfig2*, pntransporttype : WMT_TRANSPORT_TYPE*) : HRESULT
    @lpVtbl.value.get_transport_type.call(this, pntransporttype)
  end
  def set_transport_type(this : IWMStreamConfig2*, ntransporttype : WMT_TRANSPORT_TYPE) : HRESULT
    @lpVtbl.value.set_transport_type.call(this, ntransporttype)
  end
  def add_data_unit_extension(this : IWMStreamConfig2*, guidextensionsystemid : Guid, cbextensiondatasize : UInt16, pbextensionsysteminfo : UInt8*, cbextensionsysteminfo : UInt32) : HRESULT
    @lpVtbl.value.add_data_unit_extension.call(this, guidextensionsystemid, cbextensiondatasize, pbextensionsysteminfo, cbextensionsysteminfo)
  end
  def get_data_unit_extension_count(this : IWMStreamConfig2*, pcdataunitextensions : UInt16*) : HRESULT
    @lpVtbl.value.get_data_unit_extension_count.call(this, pcdataunitextensions)
  end
  def get_data_unit_extension(this : IWMStreamConfig2*, wdataunitextensionnumber : UInt16, pguidextensionsystemid : Guid*, pcbextensiondatasize : UInt16*, pbextensionsysteminfo : UInt8*, pcbextensionsysteminfo : UInt32*) : HRESULT
    @lpVtbl.value.get_data_unit_extension.call(this, wdataunitextensionnumber, pguidextensionsystemid, pcbextensiondatasize, pbextensionsysteminfo, pcbextensionsysteminfo)
  end
  def remove_all_data_unit_extensions(this : IWMStreamConfig2*) : HRESULT
    @lpVtbl.value.remove_all_data_unit_extensions.call(this)
  end
end
struct LibWin32::IWMStreamConfig3
  def query_interface(this : IWMStreamConfig3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMStreamConfig3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMStreamConfig3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_stream_type(this : IWMStreamConfig3*, pguidstreamtype : Guid*) : HRESULT
    @lpVtbl.value.get_stream_type.call(this, pguidstreamtype)
  end
  def get_stream_number(this : IWMStreamConfig3*, pwstreamnum : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_number.call(this, pwstreamnum)
  end
  def set_stream_number(this : IWMStreamConfig3*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.set_stream_number.call(this, wstreamnum)
  end
  def get_stream_name(this : IWMStreamConfig3*, pwszstreamname : Char*, pcchstreamname : UInt16*) : HRESULT
    @lpVtbl.value.get_stream_name.call(this, pwszstreamname, pcchstreamname)
  end
  def set_stream_name(this : IWMStreamConfig3*, pwszstreamname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_stream_name.call(this, pwszstreamname)
  end
  def get_connection_name(this : IWMStreamConfig3*, pwszinputname : Char*, pcchinputname : UInt16*) : HRESULT
    @lpVtbl.value.get_connection_name.call(this, pwszinputname, pcchinputname)
  end
  def set_connection_name(this : IWMStreamConfig3*, pwszinputname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_connection_name.call(this, pwszinputname)
  end
  def get_bitrate(this : IWMStreamConfig3*, pdwbitrate : UInt32*) : HRESULT
    @lpVtbl.value.get_bitrate.call(this, pdwbitrate)
  end
  def set_bitrate(this : IWMStreamConfig3*, pdwbitrate : UInt32) : HRESULT
    @lpVtbl.value.set_bitrate.call(this, pdwbitrate)
  end
  def get_buffer_window(this : IWMStreamConfig3*, pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_window.call(this, pmsbufferwindow)
  end
  def set_buffer_window(this : IWMStreamConfig3*, msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_buffer_window.call(this, msbufferwindow)
  end
  def get_transport_type(this : IWMStreamConfig3*, pntransporttype : WMT_TRANSPORT_TYPE*) : HRESULT
    @lpVtbl.value.get_transport_type.call(this, pntransporttype)
  end
  def set_transport_type(this : IWMStreamConfig3*, ntransporttype : WMT_TRANSPORT_TYPE) : HRESULT
    @lpVtbl.value.set_transport_type.call(this, ntransporttype)
  end
  def add_data_unit_extension(this : IWMStreamConfig3*, guidextensionsystemid : Guid, cbextensiondatasize : UInt16, pbextensionsysteminfo : UInt8*, cbextensionsysteminfo : UInt32) : HRESULT
    @lpVtbl.value.add_data_unit_extension.call(this, guidextensionsystemid, cbextensiondatasize, pbextensionsysteminfo, cbextensionsysteminfo)
  end
  def get_data_unit_extension_count(this : IWMStreamConfig3*, pcdataunitextensions : UInt16*) : HRESULT
    @lpVtbl.value.get_data_unit_extension_count.call(this, pcdataunitextensions)
  end
  def get_data_unit_extension(this : IWMStreamConfig3*, wdataunitextensionnumber : UInt16, pguidextensionsystemid : Guid*, pcbextensiondatasize : UInt16*, pbextensionsysteminfo : UInt8*, pcbextensionsysteminfo : UInt32*) : HRESULT
    @lpVtbl.value.get_data_unit_extension.call(this, wdataunitextensionnumber, pguidextensionsystemid, pcbextensiondatasize, pbextensionsysteminfo, pcbextensionsysteminfo)
  end
  def remove_all_data_unit_extensions(this : IWMStreamConfig3*) : HRESULT
    @lpVtbl.value.remove_all_data_unit_extensions.call(this)
  end
  def get_language(this : IWMStreamConfig3*, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.call(this, pwszlanguagestring, pcchlanguagestringlength)
  end
  def set_language(this : IWMStreamConfig3*, pwszlanguagestring : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_language.call(this, pwszlanguagestring)
  end
end
struct LibWin32::IWMPacketSize
  def query_interface(this : IWMPacketSize*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMPacketSize*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMPacketSize*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_max_packet_size(this : IWMPacketSize*, pdwmaxpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_packet_size.call(this, pdwmaxpacketsize)
  end
  def set_max_packet_size(this : IWMPacketSize*, dwmaxpacketsize : UInt32) : HRESULT
    @lpVtbl.value.set_max_packet_size.call(this, dwmaxpacketsize)
  end
end
struct LibWin32::IWMPacketSize2
  def query_interface(this : IWMPacketSize2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMPacketSize2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMPacketSize2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_max_packet_size(this : IWMPacketSize2*, pdwmaxpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_packet_size.call(this, pdwmaxpacketsize)
  end
  def set_max_packet_size(this : IWMPacketSize2*, dwmaxpacketsize : UInt32) : HRESULT
    @lpVtbl.value.set_max_packet_size.call(this, dwmaxpacketsize)
  end
  def get_min_packet_size(this : IWMPacketSize2*, pdwminpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_min_packet_size.call(this, pdwminpacketsize)
  end
  def set_min_packet_size(this : IWMPacketSize2*, dwminpacketsize : UInt32) : HRESULT
    @lpVtbl.value.set_min_packet_size.call(this, dwminpacketsize)
  end
end
struct LibWin32::IWMStreamList
  def query_interface(this : IWMStreamList*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMStreamList*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMStreamList*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_streams(this : IWMStreamList*, pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.call(this, pwstreamnumarray, pcstreams)
  end
  def add_stream(this : IWMStreamList*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.call(this, wstreamnum)
  end
  def remove_stream(this : IWMStreamList*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.call(this, wstreamnum)
  end
end
struct LibWin32::IWMMutualExclusion
  def query_interface(this : IWMMutualExclusion*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMMutualExclusion*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMMutualExclusion*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_streams(this : IWMMutualExclusion*, pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.call(this, pwstreamnumarray, pcstreams)
  end
  def add_stream(this : IWMMutualExclusion*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.call(this, wstreamnum)
  end
  def remove_stream(this : IWMMutualExclusion*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.call(this, wstreamnum)
  end
  def get_type(this : IWMMutualExclusion*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def set_type(this : IWMMutualExclusion*, guidtype : Guid*) : HRESULT
    @lpVtbl.value.set_type.call(this, guidtype)
  end
end
struct LibWin32::IWMMutualExclusion2
  def query_interface(this : IWMMutualExclusion2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMMutualExclusion2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMMutualExclusion2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_streams(this : IWMMutualExclusion2*, pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.call(this, pwstreamnumarray, pcstreams)
  end
  def add_stream(this : IWMMutualExclusion2*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.call(this, wstreamnum)
  end
  def remove_stream(this : IWMMutualExclusion2*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.call(this, wstreamnum)
  end
  def get_type(this : IWMMutualExclusion2*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def set_type(this : IWMMutualExclusion2*, guidtype : Guid*) : HRESULT
    @lpVtbl.value.set_type.call(this, guidtype)
  end
  def get_name(this : IWMMutualExclusion2*, pwszname : Char*, pcchname : UInt16*) : HRESULT
    @lpVtbl.value.get_name.call(this, pwszname, pcchname)
  end
  def set_name(this : IWMMutualExclusion2*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_name.call(this, pwszname)
  end
  def get_record_count(this : IWMMutualExclusion2*, pwrecordcount : UInt16*) : HRESULT
    @lpVtbl.value.get_record_count.call(this, pwrecordcount)
  end
  def add_record(this : IWMMutualExclusion2*) : HRESULT
    @lpVtbl.value.add_record.call(this)
  end
  def remove_record(this : IWMMutualExclusion2*, wrecordnumber : UInt16) : HRESULT
    @lpVtbl.value.remove_record.call(this, wrecordnumber)
  end
  def get_record_name(this : IWMMutualExclusion2*, wrecordnumber : UInt16, pwszrecordname : Char*, pcchrecordname : UInt16*) : HRESULT
    @lpVtbl.value.get_record_name.call(this, wrecordnumber, pwszrecordname, pcchrecordname)
  end
  def set_record_name(this : IWMMutualExclusion2*, wrecordnumber : UInt16, pwszrecordname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_record_name.call(this, wrecordnumber, pwszrecordname)
  end
  def get_streams_for_record(this : IWMMutualExclusion2*, wrecordnumber : UInt16, pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams_for_record.call(this, wrecordnumber, pwstreamnumarray, pcstreams)
  end
  def add_stream_for_record(this : IWMMutualExclusion2*, wrecordnumber : UInt16, wstreamnumber : UInt16) : HRESULT
    @lpVtbl.value.add_stream_for_record.call(this, wrecordnumber, wstreamnumber)
  end
  def remove_stream_for_record(this : IWMMutualExclusion2*, wrecordnumber : UInt16, wstreamnumber : UInt16) : HRESULT
    @lpVtbl.value.remove_stream_for_record.call(this, wrecordnumber, wstreamnumber)
  end
end
struct LibWin32::IWMBandwidthSharing
  def query_interface(this : IWMBandwidthSharing*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMBandwidthSharing*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMBandwidthSharing*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_streams(this : IWMBandwidthSharing*, pwstreamnumarray : UInt16*, pcstreams : UInt16*) : HRESULT
    @lpVtbl.value.get_streams.call(this, pwstreamnumarray, pcstreams)
  end
  def add_stream(this : IWMBandwidthSharing*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.add_stream.call(this, wstreamnum)
  end
  def remove_stream(this : IWMBandwidthSharing*, wstreamnum : UInt16) : HRESULT
    @lpVtbl.value.remove_stream.call(this, wstreamnum)
  end
  def get_type(this : IWMBandwidthSharing*, pguidtype : Guid*) : HRESULT
    @lpVtbl.value.get_type.call(this, pguidtype)
  end
  def set_type(this : IWMBandwidthSharing*, guidtype : Guid*) : HRESULT
    @lpVtbl.value.set_type.call(this, guidtype)
  end
  def get_bandwidth(this : IWMBandwidthSharing*, pdwbitrate : UInt32*, pmsbufferwindow : UInt32*) : HRESULT
    @lpVtbl.value.get_bandwidth.call(this, pdwbitrate, pmsbufferwindow)
  end
  def set_bandwidth(this : IWMBandwidthSharing*, dwbitrate : UInt32, msbufferwindow : UInt32) : HRESULT
    @lpVtbl.value.set_bandwidth.call(this, dwbitrate, msbufferwindow)
  end
end
struct LibWin32::IWMStreamPrioritization
  def query_interface(this : IWMStreamPrioritization*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMStreamPrioritization*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMStreamPrioritization*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_priority_records(this : IWMStreamPrioritization*, precordarray : WM_STREAM_PRIORITY_RECORD*, pcrecords : UInt16*) : HRESULT
    @lpVtbl.value.get_priority_records.call(this, precordarray, pcrecords)
  end
  def set_priority_records(this : IWMStreamPrioritization*, precordarray : WM_STREAM_PRIORITY_RECORD*, crecords : UInt16) : HRESULT
    @lpVtbl.value.set_priority_records.call(this, precordarray, crecords)
  end
end
struct LibWin32::IWMWriterAdvanced
  def query_interface(this : IWMWriterAdvanced*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterAdvanced*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterAdvanced*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sink_count(this : IWMWriterAdvanced*, pcsinks : UInt32*) : HRESULT
    @lpVtbl.value.get_sink_count.call(this, pcsinks)
  end
  def get_sink(this : IWMWriterAdvanced*, dwsinknum : UInt32, ppsink : IWMWriterSink*) : HRESULT
    @lpVtbl.value.get_sink.call(this, dwsinknum, ppsink)
  end
  def add_sink(this : IWMWriterAdvanced*, psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.add_sink.call(this, psink)
  end
  def remove_sink(this : IWMWriterAdvanced*, psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.remove_sink.call(this, psink)
  end
  def write_stream_sample(this : IWMWriterAdvanced*, wstreamnum : UInt16, cnssampletime : UInt64, mssamplesendtime : UInt32, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_stream_sample.call(this, wstreamnum, cnssampletime, mssamplesendtime, cnssampleduration, dwflags, psample)
  end
  def set_live_source(this : IWMWriterAdvanced*, fislivesource : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_live_source.call(this, fislivesource)
  end
  def is_real_time(this : IWMWriterAdvanced*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def get_writer_time(this : IWMWriterAdvanced*, pcnscurrenttime : UInt64*) : HRESULT
    @lpVtbl.value.get_writer_time.call(this, pcnscurrenttime)
  end
  def get_statistics(this : IWMWriterAdvanced*, wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, wstreamnum, pstats)
  end
  def set_sync_tolerance(this : IWMWriterAdvanced*, mswindow : UInt32) : HRESULT
    @lpVtbl.value.set_sync_tolerance.call(this, mswindow)
  end
  def get_sync_tolerance(this : IWMWriterAdvanced*, pmswindow : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_tolerance.call(this, pmswindow)
  end
end
struct LibWin32::IWMWriterAdvanced2
  def query_interface(this : IWMWriterAdvanced2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterAdvanced2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterAdvanced2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sink_count(this : IWMWriterAdvanced2*, pcsinks : UInt32*) : HRESULT
    @lpVtbl.value.get_sink_count.call(this, pcsinks)
  end
  def get_sink(this : IWMWriterAdvanced2*, dwsinknum : UInt32, ppsink : IWMWriterSink*) : HRESULT
    @lpVtbl.value.get_sink.call(this, dwsinknum, ppsink)
  end
  def add_sink(this : IWMWriterAdvanced2*, psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.add_sink.call(this, psink)
  end
  def remove_sink(this : IWMWriterAdvanced2*, psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.remove_sink.call(this, psink)
  end
  def write_stream_sample(this : IWMWriterAdvanced2*, wstreamnum : UInt16, cnssampletime : UInt64, mssamplesendtime : UInt32, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_stream_sample.call(this, wstreamnum, cnssampletime, mssamplesendtime, cnssampleduration, dwflags, psample)
  end
  def set_live_source(this : IWMWriterAdvanced2*, fislivesource : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_live_source.call(this, fislivesource)
  end
  def is_real_time(this : IWMWriterAdvanced2*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def get_writer_time(this : IWMWriterAdvanced2*, pcnscurrenttime : UInt64*) : HRESULT
    @lpVtbl.value.get_writer_time.call(this, pcnscurrenttime)
  end
  def get_statistics(this : IWMWriterAdvanced2*, wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, wstreamnum, pstats)
  end
  def set_sync_tolerance(this : IWMWriterAdvanced2*, mswindow : UInt32) : HRESULT
    @lpVtbl.value.set_sync_tolerance.call(this, mswindow)
  end
  def get_sync_tolerance(this : IWMWriterAdvanced2*, pmswindow : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_tolerance.call(this, pmswindow)
  end
  def get_input_setting(this : IWMWriterAdvanced2*, dwinputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_input_setting.call(this, dwinputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_input_setting(this : IWMWriterAdvanced2*, dwinputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_input_setting.call(this, dwinputnum, pszname, type, pvalue, cblength)
  end
end
struct LibWin32::IWMWriterAdvanced3
  def query_interface(this : IWMWriterAdvanced3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterAdvanced3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterAdvanced3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_sink_count(this : IWMWriterAdvanced3*, pcsinks : UInt32*) : HRESULT
    @lpVtbl.value.get_sink_count.call(this, pcsinks)
  end
  def get_sink(this : IWMWriterAdvanced3*, dwsinknum : UInt32, ppsink : IWMWriterSink*) : HRESULT
    @lpVtbl.value.get_sink.call(this, dwsinknum, ppsink)
  end
  def add_sink(this : IWMWriterAdvanced3*, psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.add_sink.call(this, psink)
  end
  def remove_sink(this : IWMWriterAdvanced3*, psink : IWMWriterSink) : HRESULT
    @lpVtbl.value.remove_sink.call(this, psink)
  end
  def write_stream_sample(this : IWMWriterAdvanced3*, wstreamnum : UInt16, cnssampletime : UInt64, mssamplesendtime : UInt32, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.write_stream_sample.call(this, wstreamnum, cnssampletime, mssamplesendtime, cnssampleduration, dwflags, psample)
  end
  def set_live_source(this : IWMWriterAdvanced3*, fislivesource : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_live_source.call(this, fislivesource)
  end
  def is_real_time(this : IWMWriterAdvanced3*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def get_writer_time(this : IWMWriterAdvanced3*, pcnscurrenttime : UInt64*) : HRESULT
    @lpVtbl.value.get_writer_time.call(this, pcnscurrenttime)
  end
  def get_statistics(this : IWMWriterAdvanced3*, wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, wstreamnum, pstats)
  end
  def set_sync_tolerance(this : IWMWriterAdvanced3*, mswindow : UInt32) : HRESULT
    @lpVtbl.value.set_sync_tolerance.call(this, mswindow)
  end
  def get_sync_tolerance(this : IWMWriterAdvanced3*, pmswindow : UInt32*) : HRESULT
    @lpVtbl.value.get_sync_tolerance.call(this, pmswindow)
  end
  def get_input_setting(this : IWMWriterAdvanced3*, dwinputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_input_setting.call(this, dwinputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_input_setting(this : IWMWriterAdvanced3*, dwinputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_input_setting.call(this, dwinputnum, pszname, type, pvalue, cblength)
  end
  def get_statistics_ex(this : IWMWriterAdvanced3*, wstreamnum : UInt16, pstats : WM_WRITER_STATISTICS_EX*) : HRESULT
    @lpVtbl.value.get_statistics_ex.call(this, wstreamnum, pstats)
  end
  def set_non_blocking(this : IWMWriterAdvanced3*) : HRESULT
    @lpVtbl.value.set_non_blocking.call(this)
  end
end
struct LibWin32::IWMWriterPreprocess
  def query_interface(this : IWMWriterPreprocess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterPreprocess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterPreprocess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_max_preprocessing_passes(this : IWMWriterPreprocess*, dwinputnum : UInt32, dwflags : UInt32, pdwmaxnumpasses : UInt32*) : HRESULT
    @lpVtbl.value.get_max_preprocessing_passes.call(this, dwinputnum, dwflags, pdwmaxnumpasses)
  end
  def set_num_preprocessing_passes(this : IWMWriterPreprocess*, dwinputnum : UInt32, dwflags : UInt32, dwnumpasses : UInt32) : HRESULT
    @lpVtbl.value.set_num_preprocessing_passes.call(this, dwinputnum, dwflags, dwnumpasses)
  end
  def begin_preprocessing_pass(this : IWMWriterPreprocess*, dwinputnum : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.begin_preprocessing_pass.call(this, dwinputnum, dwflags)
  end
  def preprocess_sample(this : IWMWriterPreprocess*, dwinputnum : UInt32, cnssampletime : UInt64, dwflags : UInt32, psample : INSSBuffer) : HRESULT
    @lpVtbl.value.preprocess_sample.call(this, dwinputnum, cnssampletime, dwflags, psample)
  end
  def end_preprocessing_pass(this : IWMWriterPreprocess*, dwinputnum : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.end_preprocessing_pass.call(this, dwinputnum, dwflags)
  end
end
struct LibWin32::IWMWriterPostViewCallback
  def query_interface(this : IWMWriterPostViewCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterPostViewCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterPostViewCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_status(this : IWMWriterPostViewCallback*, status : WMT_STATUS, hr : HRESULT, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_status.call(this, status, hr, dwtype, pvalue, pvcontext)
  end
  def on_post_view_sample(this : IWMWriterPostViewCallback*, wstreamnumber : UInt16, cnssampletime : UInt64, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_post_view_sample.call(this, wstreamnumber, cnssampletime, cnssampleduration, dwflags, psample, pvcontext)
  end
  def allocate_for_post_view(this : IWMWriterPostViewCallback*, wstreamnum : UInt16, cbbuffer : UInt32, ppbuffer : INSSBuffer*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_post_view.call(this, wstreamnum, cbbuffer, ppbuffer, pvcontext)
  end
end
struct LibWin32::IWMWriterPostView
  def query_interface(this : IWMWriterPostView*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterPostView*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterPostView*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_post_view_callback(this : IWMWriterPostView*, pcallback : IWMWriterPostViewCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.set_post_view_callback.call(this, pcallback, pvcontext)
  end
  def set_receive_post_view_samples(this : IWMWriterPostView*, wstreamnum : UInt16, freceivepostviewsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_post_view_samples.call(this, wstreamnum, freceivepostviewsamples)
  end
  def get_receive_post_view_samples(this : IWMWriterPostView*, wstreamnum : UInt16, pfreceivepostviewsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_post_view_samples.call(this, wstreamnum, pfreceivepostviewsamples)
  end
  def get_post_view_props(this : IWMWriterPostView*, wstreamnumber : UInt16, ppoutput : IWMMediaProps*) : HRESULT
    @lpVtbl.value.get_post_view_props.call(this, wstreamnumber, ppoutput)
  end
  def set_post_view_props(this : IWMWriterPostView*, wstreamnumber : UInt16, poutput : IWMMediaProps) : HRESULT
    @lpVtbl.value.set_post_view_props.call(this, wstreamnumber, poutput)
  end
  def get_post_view_format_count(this : IWMWriterPostView*, wstreamnumber : UInt16, pcformats : UInt32*) : HRESULT
    @lpVtbl.value.get_post_view_format_count.call(this, wstreamnumber, pcformats)
  end
  def get_post_view_format(this : IWMWriterPostView*, wstreamnumber : UInt16, dwformatnumber : UInt32, ppprops : IWMMediaProps*) : HRESULT
    @lpVtbl.value.get_post_view_format.call(this, wstreamnumber, dwformatnumber, ppprops)
  end
  def set_allocate_for_post_view(this : IWMWriterPostView*, wstreamnumber : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_post_view.call(this, wstreamnumber, fallocate)
  end
  def get_allocate_for_post_view(this : IWMWriterPostView*, wstreamnumber : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_post_view.call(this, wstreamnumber, pfallocate)
  end
end
struct LibWin32::IWMWriterSink
  def query_interface(this : IWMWriterSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_header(this : IWMWriterSink*, pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.call(this, pheader)
  end
  def is_real_time(this : IWMWriterSink*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def allocate_data_unit(this : IWMWriterSink*, cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.call(this, cbdataunit, ppdataunit)
  end
  def on_data_unit(this : IWMWriterSink*, pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.call(this, pdataunit)
  end
  def on_end_writing(this : IWMWriterSink*) : HRESULT
    @lpVtbl.value.on_end_writing.call(this)
  end
end
struct LibWin32::IWMRegisterCallback
  def query_interface(this : IWMRegisterCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMRegisterCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMRegisterCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise(this : IWMRegisterCallback*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.advise.call(this, pcallback, pvcontext)
  end
  def unadvise(this : IWMRegisterCallback*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.unadvise.call(this, pcallback, pvcontext)
  end
end
struct LibWin32::IWMWriterFileSink
  def query_interface(this : IWMWriterFileSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterFileSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterFileSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_header(this : IWMWriterFileSink*, pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.call(this, pheader)
  end
  def is_real_time(this : IWMWriterFileSink*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def allocate_data_unit(this : IWMWriterFileSink*, cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.call(this, cbdataunit, ppdataunit)
  end
  def on_data_unit(this : IWMWriterFileSink*, pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.call(this, pdataunit)
  end
  def on_end_writing(this : IWMWriterFileSink*) : HRESULT
    @lpVtbl.value.on_end_writing.call(this)
  end
  def open(this : IWMWriterFileSink*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
end
struct LibWin32::IWMWriterFileSink2
  def query_interface(this : IWMWriterFileSink2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterFileSink2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterFileSink2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_header(this : IWMWriterFileSink2*, pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.call(this, pheader)
  end
  def is_real_time(this : IWMWriterFileSink2*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def allocate_data_unit(this : IWMWriterFileSink2*, cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.call(this, cbdataunit, ppdataunit)
  end
  def on_data_unit(this : IWMWriterFileSink2*, pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.call(this, pdataunit)
  end
  def on_end_writing(this : IWMWriterFileSink2*) : HRESULT
    @lpVtbl.value.on_end_writing.call(this)
  end
  def open(this : IWMWriterFileSink2*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
  def start(this : IWMWriterFileSink2*, cnsstarttime : UInt64) : HRESULT
    @lpVtbl.value.start.call(this, cnsstarttime)
  end
  def stop(this : IWMWriterFileSink2*, cnsstoptime : UInt64) : HRESULT
    @lpVtbl.value.stop.call(this, cnsstoptime)
  end
  def is_stopped(this : IWMWriterFileSink2*, pfstopped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_stopped.call(this, pfstopped)
  end
  def get_file_duration(this : IWMWriterFileSink2*, pcnsduration : UInt64*) : HRESULT
    @lpVtbl.value.get_file_duration.call(this, pcnsduration)
  end
  def get_file_size(this : IWMWriterFileSink2*, pcbfile : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, pcbfile)
  end
  def close(this : IWMWriterFileSink2*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def is_closed(this : IWMWriterFileSink2*, pfclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_closed.call(this, pfclosed)
  end
end
struct LibWin32::IWMWriterFileSink3
  def query_interface(this : IWMWriterFileSink3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterFileSink3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterFileSink3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_header(this : IWMWriterFileSink3*, pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.call(this, pheader)
  end
  def is_real_time(this : IWMWriterFileSink3*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def allocate_data_unit(this : IWMWriterFileSink3*, cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.call(this, cbdataunit, ppdataunit)
  end
  def on_data_unit(this : IWMWriterFileSink3*, pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.call(this, pdataunit)
  end
  def on_end_writing(this : IWMWriterFileSink3*) : HRESULT
    @lpVtbl.value.on_end_writing.call(this)
  end
  def open(this : IWMWriterFileSink3*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.open.call(this, pwszfilename)
  end
  def start(this : IWMWriterFileSink3*, cnsstarttime : UInt64) : HRESULT
    @lpVtbl.value.start.call(this, cnsstarttime)
  end
  def stop(this : IWMWriterFileSink3*, cnsstoptime : UInt64) : HRESULT
    @lpVtbl.value.stop.call(this, cnsstoptime)
  end
  def is_stopped(this : IWMWriterFileSink3*, pfstopped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_stopped.call(this, pfstopped)
  end
  def get_file_duration(this : IWMWriterFileSink3*, pcnsduration : UInt64*) : HRESULT
    @lpVtbl.value.get_file_duration.call(this, pcnsduration)
  end
  def get_file_size(this : IWMWriterFileSink3*, pcbfile : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, pcbfile)
  end
  def close(this : IWMWriterFileSink3*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def is_closed(this : IWMWriterFileSink3*, pfclosed : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_closed.call(this, pfclosed)
  end
  def set_auto_indexing(this : IWMWriterFileSink3*, fdoautoindexing : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_auto_indexing.call(this, fdoautoindexing)
  end
  def get_auto_indexing(this : IWMWriterFileSink3*, pfautoindexing : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_indexing.call(this, pfautoindexing)
  end
  def set_control_stream(this : IWMWriterFileSink3*, wstreamnumber : UInt16, fshouldcontrolstartandstop : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_control_stream.call(this, wstreamnumber, fshouldcontrolstartandstop)
  end
  def get_mode(this : IWMWriterFileSink3*, pdwfilesinkmode : UInt32*) : HRESULT
    @lpVtbl.value.get_mode.call(this, pdwfilesinkmode)
  end
  def on_data_unit_ex(this : IWMWriterFileSink3*, pfilesinkdataunit : WMT_FILESINK_DATA_UNIT*) : HRESULT
    @lpVtbl.value.on_data_unit_ex.call(this, pfilesinkdataunit)
  end
  def set_unbuffered_io(this : IWMWriterFileSink3*, funbufferedio : LibC::BOOL, frestrictmemusage : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_unbuffered_io.call(this, funbufferedio, frestrictmemusage)
  end
  def get_unbuffered_io(this : IWMWriterFileSink3*, pfunbufferedio : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_unbuffered_io.call(this, pfunbufferedio)
  end
  def complete_operations(this : IWMWriterFileSink3*) : HRESULT
    @lpVtbl.value.complete_operations.call(this)
  end
end
struct LibWin32::IWMWriterNetworkSink
  def query_interface(this : IWMWriterNetworkSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterNetworkSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterNetworkSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_header(this : IWMWriterNetworkSink*, pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.call(this, pheader)
  end
  def is_real_time(this : IWMWriterNetworkSink*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def allocate_data_unit(this : IWMWriterNetworkSink*, cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.call(this, cbdataunit, ppdataunit)
  end
  def on_data_unit(this : IWMWriterNetworkSink*, pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.call(this, pdataunit)
  end
  def on_end_writing(this : IWMWriterNetworkSink*) : HRESULT
    @lpVtbl.value.on_end_writing.call(this)
  end
  def set_maximum_clients(this : IWMWriterNetworkSink*, dwmaxclients : UInt32) : HRESULT
    @lpVtbl.value.set_maximum_clients.call(this, dwmaxclients)
  end
  def get_maximum_clients(this : IWMWriterNetworkSink*, pdwmaxclients : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_clients.call(this, pdwmaxclients)
  end
  def set_network_protocol(this : IWMWriterNetworkSink*, protocol : WMT_NET_PROTOCOL) : HRESULT
    @lpVtbl.value.set_network_protocol.call(this, protocol)
  end
  def get_network_protocol(this : IWMWriterNetworkSink*, pprotocol : WMT_NET_PROTOCOL*) : HRESULT
    @lpVtbl.value.get_network_protocol.call(this, pprotocol)
  end
  def get_host_url(this : IWMWriterNetworkSink*, pwszurl : LibC::LPWSTR, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_host_url.call(this, pwszurl, pcchurl)
  end
  def open(this : IWMWriterNetworkSink*, pdwportnum : UInt32*) : HRESULT
    @lpVtbl.value.open.call(this, pdwportnum)
  end
  def disconnect(this : IWMWriterNetworkSink*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def close(this : IWMWriterNetworkSink*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IWMClientConnections
  def query_interface(this : IWMClientConnections*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMClientConnections*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMClientConnections*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_client_count(this : IWMClientConnections*, pcclients : UInt32*) : HRESULT
    @lpVtbl.value.get_client_count.call(this, pcclients)
  end
  def get_client_properties(this : IWMClientConnections*, dwclientnum : UInt32, pclientproperties : WM_CLIENT_PROPERTIES*) : HRESULT
    @lpVtbl.value.get_client_properties.call(this, dwclientnum, pclientproperties)
  end
end
struct LibWin32::IWMClientConnections2
  def query_interface(this : IWMClientConnections2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMClientConnections2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMClientConnections2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_client_count(this : IWMClientConnections2*, pcclients : UInt32*) : HRESULT
    @lpVtbl.value.get_client_count.call(this, pcclients)
  end
  def get_client_properties(this : IWMClientConnections2*, dwclientnum : UInt32, pclientproperties : WM_CLIENT_PROPERTIES*) : HRESULT
    @lpVtbl.value.get_client_properties.call(this, dwclientnum, pclientproperties)
  end
  def get_client_info(this : IWMClientConnections2*, dwclientnum : UInt32, pwsznetworkaddress : Char*, pcchnetworkaddress : UInt32*, pwszport : Char*, pcchport : UInt32*, pwszdnsname : Char*, pcchdnsname : UInt32*) : HRESULT
    @lpVtbl.value.get_client_info.call(this, dwclientnum, pwsznetworkaddress, pcchnetworkaddress, pwszport, pcchport, pwszdnsname, pcchdnsname)
  end
end
struct LibWin32::IWMReaderAdvanced
  def query_interface(this : IWMReaderAdvanced*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAdvanced*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAdvanced*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_user_provided_clock(this : IWMReaderAdvanced*, fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.call(this, fuserclock)
  end
  def get_user_provided_clock(this : IWMReaderAdvanced*, pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.call(this, pfuserclock)
  end
  def deliver_time(this : IWMReaderAdvanced*, cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.call(this, cnstime)
  end
  def set_manual_stream_selection(this : IWMReaderAdvanced*, fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.call(this, fselection)
  end
  def get_manual_stream_selection(this : IWMReaderAdvanced*, pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.call(this, pfselection)
  end
  def set_streams_selected(this : IWMReaderAdvanced*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMReaderAdvanced*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(this : IWMReaderAdvanced*, fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.call(this, fgetcallbacks)
  end
  def get_receive_selection_callbacks(this : IWMReaderAdvanced*, pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.call(this, pfgetcallbacks)
  end
  def set_receive_stream_samples(this : IWMReaderAdvanced*, wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.call(this, wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(this : IWMReaderAdvanced*, wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.call(this, wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(this : IWMReaderAdvanced*, dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, fallocate)
  end
  def get_allocate_for_output(this : IWMReaderAdvanced*, dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(this : IWMReaderAdvanced*, wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, fallocate)
  end
  def get_allocate_for_stream(this : IWMReaderAdvanced*, dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, pfallocate)
  end
  def get_statistics(this : IWMReaderAdvanced*, pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, pstatistics)
  end
  def set_client_info(this : IWMReaderAdvanced*, pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.call(this, pclientinfo)
  end
  def get_max_output_sample_size(this : IWMReaderAdvanced*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMReaderAdvanced*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def notify_late_delivery(this : IWMReaderAdvanced*, cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.call(this, cnslateness)
  end
end
struct LibWin32::IWMReaderAdvanced2
  def query_interface(this : IWMReaderAdvanced2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAdvanced2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAdvanced2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_user_provided_clock(this : IWMReaderAdvanced2*, fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.call(this, fuserclock)
  end
  def get_user_provided_clock(this : IWMReaderAdvanced2*, pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.call(this, pfuserclock)
  end
  def deliver_time(this : IWMReaderAdvanced2*, cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.call(this, cnstime)
  end
  def set_manual_stream_selection(this : IWMReaderAdvanced2*, fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.call(this, fselection)
  end
  def get_manual_stream_selection(this : IWMReaderAdvanced2*, pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.call(this, pfselection)
  end
  def set_streams_selected(this : IWMReaderAdvanced2*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMReaderAdvanced2*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(this : IWMReaderAdvanced2*, fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.call(this, fgetcallbacks)
  end
  def get_receive_selection_callbacks(this : IWMReaderAdvanced2*, pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.call(this, pfgetcallbacks)
  end
  def set_receive_stream_samples(this : IWMReaderAdvanced2*, wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.call(this, wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(this : IWMReaderAdvanced2*, wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.call(this, wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(this : IWMReaderAdvanced2*, dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, fallocate)
  end
  def get_allocate_for_output(this : IWMReaderAdvanced2*, dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(this : IWMReaderAdvanced2*, wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, fallocate)
  end
  def get_allocate_for_stream(this : IWMReaderAdvanced2*, dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, pfallocate)
  end
  def get_statistics(this : IWMReaderAdvanced2*, pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, pstatistics)
  end
  def set_client_info(this : IWMReaderAdvanced2*, pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.call(this, pclientinfo)
  end
  def get_max_output_sample_size(this : IWMReaderAdvanced2*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMReaderAdvanced2*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def notify_late_delivery(this : IWMReaderAdvanced2*, cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.call(this, cnslateness)
  end
  def set_play_mode(this : IWMReaderAdvanced2*, mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.call(this, mode)
  end
  def get_play_mode(this : IWMReaderAdvanced2*, pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.call(this, pmode)
  end
  def get_buffer_progress(this : IWMReaderAdvanced2*, pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.call(this, pdwpercent, pcnsbuffering)
  end
  def get_download_progress(this : IWMReaderAdvanced2*, pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.call(this, pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(this : IWMReaderAdvanced2*, pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.call(this, pdwpercent)
  end
  def save_file_as(this : IWMReaderAdvanced2*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.call(this, pwszfilename)
  end
  def get_protocol_name(this : IWMReaderAdvanced2*, pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.call(this, pwszprotocol, pcchprotocol)
  end
  def start_at_marker(this : IWMReaderAdvanced2*, wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.call(this, wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(this : IWMReaderAdvanced2*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMReaderAdvanced2*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(this : IWMReaderAdvanced2*, cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.call(this, cnsstart, cnsduration, frate)
  end
  def set_log_client_id(this : IWMReaderAdvanced2*, flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.call(this, flogclientid)
  end
  def get_log_client_id(this : IWMReaderAdvanced2*, pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.call(this, pflogclientid)
  end
  def stop_buffering(this : IWMReaderAdvanced2*) : HRESULT
    @lpVtbl.value.stop_buffering.call(this)
  end
  def open_stream(this : IWMReaderAdvanced2*, pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream, pcallback, pvcontext)
  end
end
struct LibWin32::IWMReaderAdvanced3
  def query_interface(this : IWMReaderAdvanced3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAdvanced3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAdvanced3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_user_provided_clock(this : IWMReaderAdvanced3*, fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.call(this, fuserclock)
  end
  def get_user_provided_clock(this : IWMReaderAdvanced3*, pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.call(this, pfuserclock)
  end
  def deliver_time(this : IWMReaderAdvanced3*, cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.call(this, cnstime)
  end
  def set_manual_stream_selection(this : IWMReaderAdvanced3*, fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.call(this, fselection)
  end
  def get_manual_stream_selection(this : IWMReaderAdvanced3*, pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.call(this, pfselection)
  end
  def set_streams_selected(this : IWMReaderAdvanced3*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMReaderAdvanced3*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(this : IWMReaderAdvanced3*, fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.call(this, fgetcallbacks)
  end
  def get_receive_selection_callbacks(this : IWMReaderAdvanced3*, pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.call(this, pfgetcallbacks)
  end
  def set_receive_stream_samples(this : IWMReaderAdvanced3*, wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.call(this, wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(this : IWMReaderAdvanced3*, wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.call(this, wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(this : IWMReaderAdvanced3*, dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, fallocate)
  end
  def get_allocate_for_output(this : IWMReaderAdvanced3*, dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(this : IWMReaderAdvanced3*, wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, fallocate)
  end
  def get_allocate_for_stream(this : IWMReaderAdvanced3*, dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, pfallocate)
  end
  def get_statistics(this : IWMReaderAdvanced3*, pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, pstatistics)
  end
  def set_client_info(this : IWMReaderAdvanced3*, pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.call(this, pclientinfo)
  end
  def get_max_output_sample_size(this : IWMReaderAdvanced3*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMReaderAdvanced3*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def notify_late_delivery(this : IWMReaderAdvanced3*, cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.call(this, cnslateness)
  end
  def set_play_mode(this : IWMReaderAdvanced3*, mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.call(this, mode)
  end
  def get_play_mode(this : IWMReaderAdvanced3*, pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.call(this, pmode)
  end
  def get_buffer_progress(this : IWMReaderAdvanced3*, pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.call(this, pdwpercent, pcnsbuffering)
  end
  def get_download_progress(this : IWMReaderAdvanced3*, pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.call(this, pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(this : IWMReaderAdvanced3*, pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.call(this, pdwpercent)
  end
  def save_file_as(this : IWMReaderAdvanced3*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.call(this, pwszfilename)
  end
  def get_protocol_name(this : IWMReaderAdvanced3*, pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.call(this, pwszprotocol, pcchprotocol)
  end
  def start_at_marker(this : IWMReaderAdvanced3*, wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.call(this, wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(this : IWMReaderAdvanced3*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMReaderAdvanced3*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(this : IWMReaderAdvanced3*, cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.call(this, cnsstart, cnsduration, frate)
  end
  def set_log_client_id(this : IWMReaderAdvanced3*, flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.call(this, flogclientid)
  end
  def get_log_client_id(this : IWMReaderAdvanced3*, pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.call(this, pflogclientid)
  end
  def stop_buffering(this : IWMReaderAdvanced3*) : HRESULT
    @lpVtbl.value.stop_buffering.call(this)
  end
  def open_stream(this : IWMReaderAdvanced3*, pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream, pcallback, pvcontext)
  end
  def stop_net_streaming(this : IWMReaderAdvanced3*) : HRESULT
    @lpVtbl.value.stop_net_streaming.call(this)
  end
  def start_at_position(this : IWMReaderAdvanced3*, wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.call(this, wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
end
struct LibWin32::IWMReaderAdvanced4
  def query_interface(this : IWMReaderAdvanced4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAdvanced4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAdvanced4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_user_provided_clock(this : IWMReaderAdvanced4*, fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.call(this, fuserclock)
  end
  def get_user_provided_clock(this : IWMReaderAdvanced4*, pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.call(this, pfuserclock)
  end
  def deliver_time(this : IWMReaderAdvanced4*, cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.call(this, cnstime)
  end
  def set_manual_stream_selection(this : IWMReaderAdvanced4*, fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.call(this, fselection)
  end
  def get_manual_stream_selection(this : IWMReaderAdvanced4*, pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.call(this, pfselection)
  end
  def set_streams_selected(this : IWMReaderAdvanced4*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMReaderAdvanced4*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(this : IWMReaderAdvanced4*, fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.call(this, fgetcallbacks)
  end
  def get_receive_selection_callbacks(this : IWMReaderAdvanced4*, pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.call(this, pfgetcallbacks)
  end
  def set_receive_stream_samples(this : IWMReaderAdvanced4*, wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.call(this, wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(this : IWMReaderAdvanced4*, wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.call(this, wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(this : IWMReaderAdvanced4*, dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, fallocate)
  end
  def get_allocate_for_output(this : IWMReaderAdvanced4*, dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(this : IWMReaderAdvanced4*, wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, fallocate)
  end
  def get_allocate_for_stream(this : IWMReaderAdvanced4*, dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, pfallocate)
  end
  def get_statistics(this : IWMReaderAdvanced4*, pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, pstatistics)
  end
  def set_client_info(this : IWMReaderAdvanced4*, pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.call(this, pclientinfo)
  end
  def get_max_output_sample_size(this : IWMReaderAdvanced4*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMReaderAdvanced4*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def notify_late_delivery(this : IWMReaderAdvanced4*, cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.call(this, cnslateness)
  end
  def set_play_mode(this : IWMReaderAdvanced4*, mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.call(this, mode)
  end
  def get_play_mode(this : IWMReaderAdvanced4*, pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.call(this, pmode)
  end
  def get_buffer_progress(this : IWMReaderAdvanced4*, pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.call(this, pdwpercent, pcnsbuffering)
  end
  def get_download_progress(this : IWMReaderAdvanced4*, pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.call(this, pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(this : IWMReaderAdvanced4*, pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.call(this, pdwpercent)
  end
  def save_file_as(this : IWMReaderAdvanced4*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.call(this, pwszfilename)
  end
  def get_protocol_name(this : IWMReaderAdvanced4*, pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.call(this, pwszprotocol, pcchprotocol)
  end
  def start_at_marker(this : IWMReaderAdvanced4*, wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.call(this, wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(this : IWMReaderAdvanced4*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMReaderAdvanced4*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(this : IWMReaderAdvanced4*, cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.call(this, cnsstart, cnsduration, frate)
  end
  def set_log_client_id(this : IWMReaderAdvanced4*, flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.call(this, flogclientid)
  end
  def get_log_client_id(this : IWMReaderAdvanced4*, pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.call(this, pflogclientid)
  end
  def stop_buffering(this : IWMReaderAdvanced4*) : HRESULT
    @lpVtbl.value.stop_buffering.call(this)
  end
  def open_stream(this : IWMReaderAdvanced4*, pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream, pcallback, pvcontext)
  end
  def stop_net_streaming(this : IWMReaderAdvanced4*) : HRESULT
    @lpVtbl.value.stop_net_streaming.call(this)
  end
  def start_at_position(this : IWMReaderAdvanced4*, wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.call(this, wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
  def get_language_count(this : IWMReaderAdvanced4*, dwoutputnum : UInt32, pwlanguagecount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.call(this, dwoutputnum, pwlanguagecount)
  end
  def get_language(this : IWMReaderAdvanced4*, dwoutputnum : UInt32, wlanguage : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.call(this, dwoutputnum, wlanguage, pwszlanguagestring, pcchlanguagestringlength)
  end
  def get_max_speed_factor(this : IWMReaderAdvanced4*, pdblfactor : Float64*) : HRESULT
    @lpVtbl.value.get_max_speed_factor.call(this, pdblfactor)
  end
  def is_using_fast_cache(this : IWMReaderAdvanced4*, pfusingfastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_fast_cache.call(this, pfusingfastcache)
  end
  def add_log_param(this : IWMReaderAdvanced4*, wsznamespace : LibC::LPWSTR, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_log_param.call(this, wsznamespace, wszname, wszvalue)
  end
  def send_log_params(this : IWMReaderAdvanced4*) : HRESULT
    @lpVtbl.value.send_log_params.call(this)
  end
  def can_save_file_as(this : IWMReaderAdvanced4*, pfcansave : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_save_file_as.call(this, pfcansave)
  end
  def cancel_save_file_as(this : IWMReaderAdvanced4*) : HRESULT
    @lpVtbl.value.cancel_save_file_as.call(this)
  end
  def get_url(this : IWMReaderAdvanced4*, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_url.call(this, pwszurl, pcchurl)
  end
end
struct LibWin32::IWMReaderAdvanced5
  def query_interface(this : IWMReaderAdvanced5*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAdvanced5*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAdvanced5*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_user_provided_clock(this : IWMReaderAdvanced5*, fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.call(this, fuserclock)
  end
  def get_user_provided_clock(this : IWMReaderAdvanced5*, pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.call(this, pfuserclock)
  end
  def deliver_time(this : IWMReaderAdvanced5*, cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.call(this, cnstime)
  end
  def set_manual_stream_selection(this : IWMReaderAdvanced5*, fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.call(this, fselection)
  end
  def get_manual_stream_selection(this : IWMReaderAdvanced5*, pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.call(this, pfselection)
  end
  def set_streams_selected(this : IWMReaderAdvanced5*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMReaderAdvanced5*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(this : IWMReaderAdvanced5*, fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.call(this, fgetcallbacks)
  end
  def get_receive_selection_callbacks(this : IWMReaderAdvanced5*, pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.call(this, pfgetcallbacks)
  end
  def set_receive_stream_samples(this : IWMReaderAdvanced5*, wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.call(this, wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(this : IWMReaderAdvanced5*, wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.call(this, wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, fallocate)
  end
  def get_allocate_for_output(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(this : IWMReaderAdvanced5*, wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, fallocate)
  end
  def get_allocate_for_stream(this : IWMReaderAdvanced5*, dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, pfallocate)
  end
  def get_statistics(this : IWMReaderAdvanced5*, pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, pstatistics)
  end
  def set_client_info(this : IWMReaderAdvanced5*, pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.call(this, pclientinfo)
  end
  def get_max_output_sample_size(this : IWMReaderAdvanced5*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMReaderAdvanced5*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def notify_late_delivery(this : IWMReaderAdvanced5*, cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.call(this, cnslateness)
  end
  def set_play_mode(this : IWMReaderAdvanced5*, mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.call(this, mode)
  end
  def get_play_mode(this : IWMReaderAdvanced5*, pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.call(this, pmode)
  end
  def get_buffer_progress(this : IWMReaderAdvanced5*, pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.call(this, pdwpercent, pcnsbuffering)
  end
  def get_download_progress(this : IWMReaderAdvanced5*, pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.call(this, pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(this : IWMReaderAdvanced5*, pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.call(this, pdwpercent)
  end
  def save_file_as(this : IWMReaderAdvanced5*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.call(this, pwszfilename)
  end
  def get_protocol_name(this : IWMReaderAdvanced5*, pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.call(this, pwszprotocol, pcchprotocol)
  end
  def start_at_marker(this : IWMReaderAdvanced5*, wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.call(this, wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(this : IWMReaderAdvanced5*, cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.call(this, cnsstart, cnsduration, frate)
  end
  def set_log_client_id(this : IWMReaderAdvanced5*, flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.call(this, flogclientid)
  end
  def get_log_client_id(this : IWMReaderAdvanced5*, pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.call(this, pflogclientid)
  end
  def stop_buffering(this : IWMReaderAdvanced5*) : HRESULT
    @lpVtbl.value.stop_buffering.call(this)
  end
  def open_stream(this : IWMReaderAdvanced5*, pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream, pcallback, pvcontext)
  end
  def stop_net_streaming(this : IWMReaderAdvanced5*) : HRESULT
    @lpVtbl.value.stop_net_streaming.call(this)
  end
  def start_at_position(this : IWMReaderAdvanced5*, wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.call(this, wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
  def get_language_count(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, pwlanguagecount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.call(this, dwoutputnum, pwlanguagecount)
  end
  def get_language(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, wlanguage : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.call(this, dwoutputnum, wlanguage, pwszlanguagestring, pcchlanguagestringlength)
  end
  def get_max_speed_factor(this : IWMReaderAdvanced5*, pdblfactor : Float64*) : HRESULT
    @lpVtbl.value.get_max_speed_factor.call(this, pdblfactor)
  end
  def is_using_fast_cache(this : IWMReaderAdvanced5*, pfusingfastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_fast_cache.call(this, pfusingfastcache)
  end
  def add_log_param(this : IWMReaderAdvanced5*, wsznamespace : LibC::LPWSTR, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_log_param.call(this, wsznamespace, wszname, wszvalue)
  end
  def send_log_params(this : IWMReaderAdvanced5*) : HRESULT
    @lpVtbl.value.send_log_params.call(this)
  end
  def can_save_file_as(this : IWMReaderAdvanced5*, pfcansave : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_save_file_as.call(this, pfcansave)
  end
  def cancel_save_file_as(this : IWMReaderAdvanced5*) : HRESULT
    @lpVtbl.value.cancel_save_file_as.call(this)
  end
  def get_url(this : IWMReaderAdvanced5*, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_url.call(this, pwszurl, pcchurl)
  end
  def set_player_hook(this : IWMReaderAdvanced5*, dwoutputnum : UInt32, phook : IWMPlayerHook) : HRESULT
    @lpVtbl.value.set_player_hook.call(this, dwoutputnum, phook)
  end
end
struct LibWin32::IWMReaderAdvanced6
  def query_interface(this : IWMReaderAdvanced6*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAdvanced6*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAdvanced6*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_user_provided_clock(this : IWMReaderAdvanced6*, fuserclock : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_user_provided_clock.call(this, fuserclock)
  end
  def get_user_provided_clock(this : IWMReaderAdvanced6*, pfuserclock : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_user_provided_clock.call(this, pfuserclock)
  end
  def deliver_time(this : IWMReaderAdvanced6*, cnstime : UInt64) : HRESULT
    @lpVtbl.value.deliver_time.call(this, cnstime)
  end
  def set_manual_stream_selection(this : IWMReaderAdvanced6*, fselection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_manual_stream_selection.call(this, fselection)
  end
  def get_manual_stream_selection(this : IWMReaderAdvanced6*, pfselection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_manual_stream_selection.call(this, pfselection)
  end
  def set_streams_selected(this : IWMReaderAdvanced6*, cstreamcount : UInt16, pwstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.set_streams_selected.call(this, cstreamcount, pwstreamnumbers, pselections)
  end
  def get_stream_selected(this : IWMReaderAdvanced6*, wstreamnum : UInt16, pselection : WMT_STREAM_SELECTION*) : HRESULT
    @lpVtbl.value.get_stream_selected.call(this, wstreamnum, pselection)
  end
  def set_receive_selection_callbacks(this : IWMReaderAdvanced6*, fgetcallbacks : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_selection_callbacks.call(this, fgetcallbacks)
  end
  def get_receive_selection_callbacks(this : IWMReaderAdvanced6*, pfgetcallbacks : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_selection_callbacks.call(this, pfgetcallbacks)
  end
  def set_receive_stream_samples(this : IWMReaderAdvanced6*, wstreamnum : UInt16, freceivestreamsamples : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_receive_stream_samples.call(this, wstreamnum, freceivestreamsamples)
  end
  def get_receive_stream_samples(this : IWMReaderAdvanced6*, wstreamnum : UInt16, pfreceivestreamsamples : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_receive_stream_samples.call(this, wstreamnum, pfreceivestreamsamples)
  end
  def set_allocate_for_output(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_output.call(this, dwoutputnum, fallocate)
  end
  def get_allocate_for_output(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_output.call(this, dwoutputnum, pfallocate)
  end
  def set_allocate_for_stream(this : IWMReaderAdvanced6*, wstreamnum : UInt16, fallocate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_allocate_for_stream.call(this, wstreamnum, fallocate)
  end
  def get_allocate_for_stream(this : IWMReaderAdvanced6*, dwsreamnum : UInt16, pfallocate : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allocate_for_stream.call(this, dwsreamnum, pfallocate)
  end
  def get_statistics(this : IWMReaderAdvanced6*, pstatistics : WM_READER_STATISTICS*) : HRESULT
    @lpVtbl.value.get_statistics.call(this, pstatistics)
  end
  def set_client_info(this : IWMReaderAdvanced6*, pclientinfo : WM_READER_CLIENTINFO*) : HRESULT
    @lpVtbl.value.set_client_info.call(this, pclientinfo)
  end
  def get_max_output_sample_size(this : IWMReaderAdvanced6*, dwoutput : UInt32, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_output_sample_size.call(this, dwoutput, pcbmax)
  end
  def get_max_stream_sample_size(this : IWMReaderAdvanced6*, wstream : UInt16, pcbmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_stream_sample_size.call(this, wstream, pcbmax)
  end
  def notify_late_delivery(this : IWMReaderAdvanced6*, cnslateness : UInt64) : HRESULT
    @lpVtbl.value.notify_late_delivery.call(this, cnslateness)
  end
  def set_play_mode(this : IWMReaderAdvanced6*, mode : WMT_PLAY_MODE) : HRESULT
    @lpVtbl.value.set_play_mode.call(this, mode)
  end
  def get_play_mode(this : IWMReaderAdvanced6*, pmode : WMT_PLAY_MODE*) : HRESULT
    @lpVtbl.value.get_play_mode.call(this, pmode)
  end
  def get_buffer_progress(this : IWMReaderAdvanced6*, pdwpercent : UInt32*, pcnsbuffering : UInt64*) : HRESULT
    @lpVtbl.value.get_buffer_progress.call(this, pdwpercent, pcnsbuffering)
  end
  def get_download_progress(this : IWMReaderAdvanced6*, pdwpercent : UInt32*, pqwbytesdownloaded : UInt64*, pcnsdownload : UInt64*) : HRESULT
    @lpVtbl.value.get_download_progress.call(this, pdwpercent, pqwbytesdownloaded, pcnsdownload)
  end
  def get_save_as_progress(this : IWMReaderAdvanced6*, pdwpercent : UInt32*) : HRESULT
    @lpVtbl.value.get_save_as_progress.call(this, pdwpercent)
  end
  def save_file_as(this : IWMReaderAdvanced6*, pwszfilename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.save_file_as.call(this, pwszfilename)
  end
  def get_protocol_name(this : IWMReaderAdvanced6*, pwszprotocol : Char*, pcchprotocol : UInt32*) : HRESULT
    @lpVtbl.value.get_protocol_name.call(this, pwszprotocol, pcchprotocol)
  end
  def start_at_marker(this : IWMReaderAdvanced6*, wmarkerindex : UInt16, cnsduration : UInt64, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_marker.call(this, wmarkerindex, cnsduration, frate, pvcontext)
  end
  def get_output_setting(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_output_setting.call(this, dwoutputnum, pszname, ptype, pvalue, pcblength)
  end
  def set_output_setting(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_output_setting.call(this, dwoutputnum, pszname, type, pvalue, cblength)
  end
  def preroll(this : IWMReaderAdvanced6*, cnsstart : UInt64, cnsduration : UInt64, frate : Float32) : HRESULT
    @lpVtbl.value.preroll.call(this, cnsstart, cnsduration, frate)
  end
  def set_log_client_id(this : IWMReaderAdvanced6*, flogclientid : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_log_client_id.call(this, flogclientid)
  end
  def get_log_client_id(this : IWMReaderAdvanced6*, pflogclientid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_log_client_id.call(this, pflogclientid)
  end
  def stop_buffering(this : IWMReaderAdvanced6*) : HRESULT
    @lpVtbl.value.stop_buffering.call(this)
  end
  def open_stream(this : IWMReaderAdvanced6*, pstream : IStream, pcallback : IWMReaderCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.open_stream.call(this, pstream, pcallback, pvcontext)
  end
  def stop_net_streaming(this : IWMReaderAdvanced6*) : HRESULT
    @lpVtbl.value.stop_net_streaming.call(this)
  end
  def start_at_position(this : IWMReaderAdvanced6*, wstreamnum : UInt16, pvoffsetstart : Void*, pvduration : Void*, dwoffsetformat : WMT_OFFSET_FORMAT, frate : Float32, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_at_position.call(this, wstreamnum, pvoffsetstart, pvduration, dwoffsetformat, frate, pvcontext)
  end
  def get_language_count(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, pwlanguagecount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.call(this, dwoutputnum, pwlanguagecount)
  end
  def get_language(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, wlanguage : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language.call(this, dwoutputnum, wlanguage, pwszlanguagestring, pcchlanguagestringlength)
  end
  def get_max_speed_factor(this : IWMReaderAdvanced6*, pdblfactor : Float64*) : HRESULT
    @lpVtbl.value.get_max_speed_factor.call(this, pdblfactor)
  end
  def is_using_fast_cache(this : IWMReaderAdvanced6*, pfusingfastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_fast_cache.call(this, pfusingfastcache)
  end
  def add_log_param(this : IWMReaderAdvanced6*, wsznamespace : LibC::LPWSTR, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_log_param.call(this, wsznamespace, wszname, wszvalue)
  end
  def send_log_params(this : IWMReaderAdvanced6*) : HRESULT
    @lpVtbl.value.send_log_params.call(this)
  end
  def can_save_file_as(this : IWMReaderAdvanced6*, pfcansave : LibC::BOOL*) : HRESULT
    @lpVtbl.value.can_save_file_as.call(this, pfcansave)
  end
  def cancel_save_file_as(this : IWMReaderAdvanced6*) : HRESULT
    @lpVtbl.value.cancel_save_file_as.call(this)
  end
  def get_url(this : IWMReaderAdvanced6*, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_url.call(this, pwszurl, pcchurl)
  end
  def set_player_hook(this : IWMReaderAdvanced6*, dwoutputnum : UInt32, phook : IWMPlayerHook) : HRESULT
    @lpVtbl.value.set_player_hook.call(this, dwoutputnum, phook)
  end
  def set_protect_stream_samples(this : IWMReaderAdvanced6*, pbcertificate : UInt8*, cbcertificate : UInt32, dwcertificatetype : UInt32, dwflags : UInt32, pbinitializationvector : UInt8*, pcbinitializationvector : UInt32*) : HRESULT
    @lpVtbl.value.set_protect_stream_samples.call(this, pbcertificate, cbcertificate, dwcertificatetype, dwflags, pbinitializationvector, pcbinitializationvector)
  end
end
struct LibWin32::IWMPlayerHook
  def query_interface(this : IWMPlayerHook*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMPlayerHook*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMPlayerHook*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def pre_decode(this : IWMPlayerHook*) : HRESULT
    @lpVtbl.value.pre_decode.call(this)
  end
end
struct LibWin32::IWMReaderAllocatorEx
  def query_interface(this : IWMReaderAllocatorEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAllocatorEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAllocatorEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def allocate_for_stream_ex(this : IWMReaderAllocatorEx*, wstreamnum : UInt16, cbbuffer : UInt32, ppbuffer : INSSBuffer*, dwflags : UInt32, cnssampletime : UInt64, cnssampleduration : UInt64, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_stream_ex.call(this, wstreamnum, cbbuffer, ppbuffer, dwflags, cnssampletime, cnssampleduration, pvcontext)
  end
  def allocate_for_output_ex(this : IWMReaderAllocatorEx*, dwoutputnum : UInt32, cbbuffer : UInt32, ppbuffer : INSSBuffer*, dwflags : UInt32, cnssampletime : UInt64, cnssampleduration : UInt64, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_output_ex.call(this, dwoutputnum, cbbuffer, ppbuffer, dwflags, cnssampletime, cnssampleduration, pvcontext)
  end
end
struct LibWin32::IWMReaderTypeNegotiation
  def query_interface(this : IWMReaderTypeNegotiation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderTypeNegotiation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderTypeNegotiation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def try_output_props(this : IWMReaderTypeNegotiation*, dwoutputnum : UInt32, poutput : IWMOutputMediaProps) : HRESULT
    @lpVtbl.value.try_output_props.call(this, dwoutputnum, poutput)
  end
end
struct LibWin32::IWMReaderCallbackAdvanced
  def query_interface(this : IWMReaderCallbackAdvanced*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderCallbackAdvanced*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderCallbackAdvanced*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_stream_sample(this : IWMReaderCallbackAdvanced*, wstreamnum : UInt16, cnssampletime : UInt64, cnssampleduration : UInt64, dwflags : UInt32, psample : INSSBuffer, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_stream_sample.call(this, wstreamnum, cnssampletime, cnssampleduration, dwflags, psample, pvcontext)
  end
  def on_time(this : IWMReaderCallbackAdvanced*, cnscurrenttime : UInt64, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_time.call(this, cnscurrenttime, pvcontext)
  end
  def on_stream_selection(this : IWMReaderCallbackAdvanced*, wstreamcount : UInt16, pstreamnumbers : UInt16*, pselections : WMT_STREAM_SELECTION*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_stream_selection.call(this, wstreamcount, pstreamnumbers, pselections, pvcontext)
  end
  def on_output_props_changed(this : IWMReaderCallbackAdvanced*, dwoutputnum : UInt32, pmediatype : WM_MEDIA_TYPE*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.on_output_props_changed.call(this, dwoutputnum, pmediatype, pvcontext)
  end
  def allocate_for_stream(this : IWMReaderCallbackAdvanced*, wstreamnum : UInt16, cbbuffer : UInt32, ppbuffer : INSSBuffer*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_stream.call(this, wstreamnum, cbbuffer, ppbuffer, pvcontext)
  end
  def allocate_for_output(this : IWMReaderCallbackAdvanced*, dwoutputnum : UInt32, cbbuffer : UInt32, ppbuffer : INSSBuffer*, pvcontext : Void*) : HRESULT
    @lpVtbl.value.allocate_for_output.call(this, dwoutputnum, cbbuffer, ppbuffer, pvcontext)
  end
end
struct LibWin32::IWMDRMReader
  def query_interface(this : IWMDRMReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_license(this : IWMDRMReader*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.acquire_license.call(this, dwflags)
  end
  def cancel_license_acquisition(this : IWMDRMReader*) : HRESULT
    @lpVtbl.value.cancel_license_acquisition.call(this)
  end
  def individualize(this : IWMDRMReader*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.individualize.call(this, dwflags)
  end
  def cancel_individualization(this : IWMDRMReader*) : HRESULT
    @lpVtbl.value.cancel_individualization.call(this)
  end
  def monitor_license_acquisition(this : IWMDRMReader*) : HRESULT
    @lpVtbl.value.monitor_license_acquisition.call(this)
  end
  def cancel_monitor_license_acquisition(this : IWMDRMReader*) : HRESULT
    @lpVtbl.value.cancel_monitor_license_acquisition.call(this)
  end
  def set_drm_property(this : IWMDRMReader*, pwstrname : LibC::LPWSTR, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_property.call(this, pwstrname, dwtype, pvalue, cblength)
  end
  def get_drm_property(this : IWMDRMReader*, pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.call(this, pwstrname, pdwtype, pvalue, pcblength)
  end
end
struct LibWin32::IWMDRMReader2
  def query_interface(this : IWMDRMReader2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMReader2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMReader2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_license(this : IWMDRMReader2*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.acquire_license.call(this, dwflags)
  end
  def cancel_license_acquisition(this : IWMDRMReader2*) : HRESULT
    @lpVtbl.value.cancel_license_acquisition.call(this)
  end
  def individualize(this : IWMDRMReader2*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.individualize.call(this, dwflags)
  end
  def cancel_individualization(this : IWMDRMReader2*) : HRESULT
    @lpVtbl.value.cancel_individualization.call(this)
  end
  def monitor_license_acquisition(this : IWMDRMReader2*) : HRESULT
    @lpVtbl.value.monitor_license_acquisition.call(this)
  end
  def cancel_monitor_license_acquisition(this : IWMDRMReader2*) : HRESULT
    @lpVtbl.value.cancel_monitor_license_acquisition.call(this)
  end
  def set_drm_property(this : IWMDRMReader2*, pwstrname : LibC::LPWSTR, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_property.call(this, pwstrname, dwtype, pvalue, cblength)
  end
  def get_drm_property(this : IWMDRMReader2*, pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.call(this, pwstrname, pdwtype, pvalue, pcblength)
  end
  def set_evaluate_output_level_licenses(this : IWMDRMReader2*, fevaluate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_evaluate_output_level_licenses.call(this, fevaluate)
  end
  def get_play_output_levels(this : IWMDRMReader2*, pplayopl : DRM_PLAY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_play_output_levels.call(this, pplayopl, pcblength, pdwminappcompliancelevel)
  end
  def get_copy_output_levels(this : IWMDRMReader2*, pcopyopl : DRM_COPY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_copy_output_levels.call(this, pcopyopl, pcblength, pdwminappcompliancelevel)
  end
  def try_next_license(this : IWMDRMReader2*) : HRESULT
    @lpVtbl.value.try_next_license.call(this)
  end
end
struct LibWin32::IWMDRMReader3
  def query_interface(this : IWMDRMReader3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMReader3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMReader3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_license(this : IWMDRMReader3*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.acquire_license.call(this, dwflags)
  end
  def cancel_license_acquisition(this : IWMDRMReader3*) : HRESULT
    @lpVtbl.value.cancel_license_acquisition.call(this)
  end
  def individualize(this : IWMDRMReader3*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.individualize.call(this, dwflags)
  end
  def cancel_individualization(this : IWMDRMReader3*) : HRESULT
    @lpVtbl.value.cancel_individualization.call(this)
  end
  def monitor_license_acquisition(this : IWMDRMReader3*) : HRESULT
    @lpVtbl.value.monitor_license_acquisition.call(this)
  end
  def cancel_monitor_license_acquisition(this : IWMDRMReader3*) : HRESULT
    @lpVtbl.value.cancel_monitor_license_acquisition.call(this)
  end
  def set_drm_property(this : IWMDRMReader3*, pwstrname : LibC::LPWSTR, dwtype : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_drm_property.call(this, pwstrname, dwtype, pvalue, cblength)
  end
  def get_drm_property(this : IWMDRMReader3*, pwstrname : LibC::LPWSTR, pdwtype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_drm_property.call(this, pwstrname, pdwtype, pvalue, pcblength)
  end
  def set_evaluate_output_level_licenses(this : IWMDRMReader3*, fevaluate : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_evaluate_output_level_licenses.call(this, fevaluate)
  end
  def get_play_output_levels(this : IWMDRMReader3*, pplayopl : DRM_PLAY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_play_output_levels.call(this, pplayopl, pcblength, pdwminappcompliancelevel)
  end
  def get_copy_output_levels(this : IWMDRMReader3*, pcopyopl : DRM_COPY_OPL*, pcblength : UInt32*, pdwminappcompliancelevel : UInt32*) : HRESULT
    @lpVtbl.value.get_copy_output_levels.call(this, pcopyopl, pcblength, pdwminappcompliancelevel)
  end
  def try_next_license(this : IWMDRMReader3*) : HRESULT
    @lpVtbl.value.try_next_license.call(this)
  end
  def get_inclusion_list(this : IWMDRMReader3*, ppguids : Guid**, pcguids : UInt32*) : HRESULT
    @lpVtbl.value.get_inclusion_list.call(this, ppguids, pcguids)
  end
end
struct LibWin32::IWMReaderPlaylistBurn
  def query_interface(this : IWMReaderPlaylistBurn*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderPlaylistBurn*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderPlaylistBurn*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def init_playlist_burn(this : IWMReaderPlaylistBurn*, cfiles : UInt32, ppwszfilenames : LibC::LPWSTR*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.init_playlist_burn.call(this, cfiles, ppwszfilenames, pcallback, pvcontext)
  end
  def get_init_results(this : IWMReaderPlaylistBurn*, cfiles : UInt32, phrstati : HRESULT*) : HRESULT
    @lpVtbl.value.get_init_results.call(this, cfiles, phrstati)
  end
  def cancel(this : IWMReaderPlaylistBurn*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def end_playlist_burn(this : IWMReaderPlaylistBurn*, hrburnresult : HRESULT) : HRESULT
    @lpVtbl.value.end_playlist_burn.call(this, hrburnresult)
  end
end
struct LibWin32::IWMReaderNetworkConfig
  def query_interface(this : IWMReaderNetworkConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderNetworkConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderNetworkConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffering_time(this : IWMReaderNetworkConfig*, pcnsbufferingtime : UInt64*) : HRESULT
    @lpVtbl.value.get_buffering_time.call(this, pcnsbufferingtime)
  end
  def set_buffering_time(this : IWMReaderNetworkConfig*, cnsbufferingtime : UInt64) : HRESULT
    @lpVtbl.value.set_buffering_time.call(this, cnsbufferingtime)
  end
  def get_udp_port_ranges(this : IWMReaderNetworkConfig*, prangearray : WM_PORT_NUMBER_RANGE*, pcranges : UInt32*) : HRESULT
    @lpVtbl.value.get_udp_port_ranges.call(this, prangearray, pcranges)
  end
  def set_udp_port_ranges(this : IWMReaderNetworkConfig*, prangearray : WM_PORT_NUMBER_RANGE*, cranges : UInt32) : HRESULT
    @lpVtbl.value.set_udp_port_ranges.call(this, prangearray, cranges)
  end
  def get_proxy_settings(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pproxysetting : WMT_PROXY_SETTINGS*) : HRESULT
    @lpVtbl.value.get_proxy_settings.call(this, pwszprotocol, pproxysetting)
  end
  def set_proxy_settings(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, proxysetting : WMT_PROXY_SETTINGS) : HRESULT
    @lpVtbl.value.set_proxy_settings.call(this, pwszprotocol, proxysetting)
  end
  def get_proxy_host_name(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pwszhostname : Char*, pcchhostname : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_host_name.call(this, pwszprotocol, pwszhostname, pcchhostname)
  end
  def set_proxy_host_name(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pwszhostname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_host_name.call(this, pwszprotocol, pwszhostname)
  end
  def get_proxy_port(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_port.call(this, pwszprotocol, pdwport)
  end
  def set_proxy_port(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, dwport : UInt32) : HRESULT
    @lpVtbl.value.set_proxy_port.call(this, pwszprotocol, dwport)
  end
  def get_proxy_exception_list(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pwszexceptionlist : Char*, pcchexceptionlist : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_exception_list.call(this, pwszprotocol, pwszexceptionlist, pcchexceptionlist)
  end
  def set_proxy_exception_list(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pwszexceptionlist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_exception_list.call(this, pwszprotocol, pwszexceptionlist)
  end
  def get_proxy_bypass_for_local(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, pfbypassforlocal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_proxy_bypass_for_local.call(this, pwszprotocol, pfbypassforlocal)
  end
  def set_proxy_bypass_for_local(this : IWMReaderNetworkConfig*, pwszprotocol : LibC::LPWSTR, fbypassforlocal : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_proxy_bypass_for_local.call(this, pwszprotocol, fbypassforlocal)
  end
  def get_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig*, pfforcererundetection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_force_rerun_auto_proxy_detection.call(this, pfforcererundetection)
  end
  def set_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig*, fforcererundetection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_force_rerun_auto_proxy_detection.call(this, fforcererundetection)
  end
  def get_enable_multicast(this : IWMReaderNetworkConfig*, pfenablemulticast : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_multicast.call(this, pfenablemulticast)
  end
  def set_enable_multicast(this : IWMReaderNetworkConfig*, fenablemulticast : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_multicast.call(this, fenablemulticast)
  end
  def get_enable_http(this : IWMReaderNetworkConfig*, pfenablehttp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_http.call(this, pfenablehttp)
  end
  def set_enable_http(this : IWMReaderNetworkConfig*, fenablehttp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_http.call(this, fenablehttp)
  end
  def get_enable_udp(this : IWMReaderNetworkConfig*, pfenableudp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_udp.call(this, pfenableudp)
  end
  def set_enable_udp(this : IWMReaderNetworkConfig*, fenableudp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_udp.call(this, fenableudp)
  end
  def get_enable_tcp(this : IWMReaderNetworkConfig*, pfenabletcp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_tcp.call(this, pfenabletcp)
  end
  def set_enable_tcp(this : IWMReaderNetworkConfig*, fenabletcp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_tcp.call(this, fenabletcp)
  end
  def reset_protocol_rollover(this : IWMReaderNetworkConfig*) : HRESULT
    @lpVtbl.value.reset_protocol_rollover.call(this)
  end
  def get_connection_bandwidth(this : IWMReaderNetworkConfig*, pdwconnectionbandwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_bandwidth.call(this, pdwconnectionbandwidth)
  end
  def set_connection_bandwidth(this : IWMReaderNetworkConfig*, dwconnectionbandwidth : UInt32) : HRESULT
    @lpVtbl.value.set_connection_bandwidth.call(this, dwconnectionbandwidth)
  end
  def get_num_protocols_supported(this : IWMReaderNetworkConfig*, pcprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_num_protocols_supported.call(this, pcprotocols)
  end
  def get_supported_protocol_name(this : IWMReaderNetworkConfig*, dwprotocolnum : UInt32, pwszprotocolname : Char*, pcchprotocolname : UInt32*) : HRESULT
    @lpVtbl.value.get_supported_protocol_name.call(this, dwprotocolnum, pwszprotocolname, pcchprotocolname)
  end
  def add_logging_url(this : IWMReaderNetworkConfig*, pwszurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_logging_url.call(this, pwszurl)
  end
  def get_logging_url(this : IWMReaderNetworkConfig*, dwindex : UInt32, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url.call(this, dwindex, pwszurl, pcchurl)
  end
  def get_logging_url_count(this : IWMReaderNetworkConfig*, pdwurlcount : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url_count.call(this, pdwurlcount)
  end
  def reset_logging_url_list(this : IWMReaderNetworkConfig*) : HRESULT
    @lpVtbl.value.reset_logging_url_list.call(this)
  end
end
struct LibWin32::IWMReaderNetworkConfig2
  def query_interface(this : IWMReaderNetworkConfig2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderNetworkConfig2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderNetworkConfig2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffering_time(this : IWMReaderNetworkConfig2*, pcnsbufferingtime : UInt64*) : HRESULT
    @lpVtbl.value.get_buffering_time.call(this, pcnsbufferingtime)
  end
  def set_buffering_time(this : IWMReaderNetworkConfig2*, cnsbufferingtime : UInt64) : HRESULT
    @lpVtbl.value.set_buffering_time.call(this, cnsbufferingtime)
  end
  def get_udp_port_ranges(this : IWMReaderNetworkConfig2*, prangearray : WM_PORT_NUMBER_RANGE*, pcranges : UInt32*) : HRESULT
    @lpVtbl.value.get_udp_port_ranges.call(this, prangearray, pcranges)
  end
  def set_udp_port_ranges(this : IWMReaderNetworkConfig2*, prangearray : WM_PORT_NUMBER_RANGE*, cranges : UInt32) : HRESULT
    @lpVtbl.value.set_udp_port_ranges.call(this, prangearray, cranges)
  end
  def get_proxy_settings(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pproxysetting : WMT_PROXY_SETTINGS*) : HRESULT
    @lpVtbl.value.get_proxy_settings.call(this, pwszprotocol, pproxysetting)
  end
  def set_proxy_settings(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, proxysetting : WMT_PROXY_SETTINGS) : HRESULT
    @lpVtbl.value.set_proxy_settings.call(this, pwszprotocol, proxysetting)
  end
  def get_proxy_host_name(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pwszhostname : Char*, pcchhostname : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_host_name.call(this, pwszprotocol, pwszhostname, pcchhostname)
  end
  def set_proxy_host_name(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pwszhostname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_host_name.call(this, pwszprotocol, pwszhostname)
  end
  def get_proxy_port(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pdwport : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_port.call(this, pwszprotocol, pdwport)
  end
  def set_proxy_port(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, dwport : UInt32) : HRESULT
    @lpVtbl.value.set_proxy_port.call(this, pwszprotocol, dwport)
  end
  def get_proxy_exception_list(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pwszexceptionlist : Char*, pcchexceptionlist : UInt32*) : HRESULT
    @lpVtbl.value.get_proxy_exception_list.call(this, pwszprotocol, pwszexceptionlist, pcchexceptionlist)
  end
  def set_proxy_exception_list(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pwszexceptionlist : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_proxy_exception_list.call(this, pwszprotocol, pwszexceptionlist)
  end
  def get_proxy_bypass_for_local(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, pfbypassforlocal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_proxy_bypass_for_local.call(this, pwszprotocol, pfbypassforlocal)
  end
  def set_proxy_bypass_for_local(this : IWMReaderNetworkConfig2*, pwszprotocol : LibC::LPWSTR, fbypassforlocal : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_proxy_bypass_for_local.call(this, pwszprotocol, fbypassforlocal)
  end
  def get_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig2*, pfforcererundetection : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_force_rerun_auto_proxy_detection.call(this, pfforcererundetection)
  end
  def set_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig2*, fforcererundetection : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_force_rerun_auto_proxy_detection.call(this, fforcererundetection)
  end
  def get_enable_multicast(this : IWMReaderNetworkConfig2*, pfenablemulticast : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_multicast.call(this, pfenablemulticast)
  end
  def set_enable_multicast(this : IWMReaderNetworkConfig2*, fenablemulticast : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_multicast.call(this, fenablemulticast)
  end
  def get_enable_http(this : IWMReaderNetworkConfig2*, pfenablehttp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_http.call(this, pfenablehttp)
  end
  def set_enable_http(this : IWMReaderNetworkConfig2*, fenablehttp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_http.call(this, fenablehttp)
  end
  def get_enable_udp(this : IWMReaderNetworkConfig2*, pfenableudp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_udp.call(this, pfenableudp)
  end
  def set_enable_udp(this : IWMReaderNetworkConfig2*, fenableudp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_udp.call(this, fenableudp)
  end
  def get_enable_tcp(this : IWMReaderNetworkConfig2*, pfenabletcp : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_tcp.call(this, pfenabletcp)
  end
  def set_enable_tcp(this : IWMReaderNetworkConfig2*, fenabletcp : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_tcp.call(this, fenabletcp)
  end
  def reset_protocol_rollover(this : IWMReaderNetworkConfig2*) : HRESULT
    @lpVtbl.value.reset_protocol_rollover.call(this)
  end
  def get_connection_bandwidth(this : IWMReaderNetworkConfig2*, pdwconnectionbandwidth : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_bandwidth.call(this, pdwconnectionbandwidth)
  end
  def set_connection_bandwidth(this : IWMReaderNetworkConfig2*, dwconnectionbandwidth : UInt32) : HRESULT
    @lpVtbl.value.set_connection_bandwidth.call(this, dwconnectionbandwidth)
  end
  def get_num_protocols_supported(this : IWMReaderNetworkConfig2*, pcprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_num_protocols_supported.call(this, pcprotocols)
  end
  def get_supported_protocol_name(this : IWMReaderNetworkConfig2*, dwprotocolnum : UInt32, pwszprotocolname : Char*, pcchprotocolname : UInt32*) : HRESULT
    @lpVtbl.value.get_supported_protocol_name.call(this, dwprotocolnum, pwszprotocolname, pcchprotocolname)
  end
  def add_logging_url(this : IWMReaderNetworkConfig2*, pwszurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add_logging_url.call(this, pwszurl)
  end
  def get_logging_url(this : IWMReaderNetworkConfig2*, dwindex : UInt32, pwszurl : Char*, pcchurl : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url.call(this, dwindex, pwszurl, pcchurl)
  end
  def get_logging_url_count(this : IWMReaderNetworkConfig2*, pdwurlcount : UInt32*) : HRESULT
    @lpVtbl.value.get_logging_url_count.call(this, pdwurlcount)
  end
  def reset_logging_url_list(this : IWMReaderNetworkConfig2*) : HRESULT
    @lpVtbl.value.reset_logging_url_list.call(this)
  end
  def get_enable_content_caching(this : IWMReaderNetworkConfig2*, pfenablecontentcaching : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_content_caching.call(this, pfenablecontentcaching)
  end
  def set_enable_content_caching(this : IWMReaderNetworkConfig2*, fenablecontentcaching : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_content_caching.call(this, fenablecontentcaching)
  end
  def get_enable_fast_cache(this : IWMReaderNetworkConfig2*, pfenablefastcache : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_fast_cache.call(this, pfenablefastcache)
  end
  def set_enable_fast_cache(this : IWMReaderNetworkConfig2*, fenablefastcache : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_fast_cache.call(this, fenablefastcache)
  end
  def get_accelerated_streaming_duration(this : IWMReaderNetworkConfig2*, pcnsaccelduration : UInt64*) : HRESULT
    @lpVtbl.value.get_accelerated_streaming_duration.call(this, pcnsaccelduration)
  end
  def set_accelerated_streaming_duration(this : IWMReaderNetworkConfig2*, cnsaccelduration : UInt64) : HRESULT
    @lpVtbl.value.set_accelerated_streaming_duration.call(this, cnsaccelduration)
  end
  def get_auto_reconnect_limit(this : IWMReaderNetworkConfig2*, pdwautoreconnectlimit : UInt32*) : HRESULT
    @lpVtbl.value.get_auto_reconnect_limit.call(this, pdwautoreconnectlimit)
  end
  def set_auto_reconnect_limit(this : IWMReaderNetworkConfig2*, dwautoreconnectlimit : UInt32) : HRESULT
    @lpVtbl.value.set_auto_reconnect_limit.call(this, dwautoreconnectlimit)
  end
  def get_enable_resends(this : IWMReaderNetworkConfig2*, pfenableresends : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_resends.call(this, pfenableresends)
  end
  def set_enable_resends(this : IWMReaderNetworkConfig2*, fenableresends : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_resends.call(this, fenableresends)
  end
  def get_enable_thinning(this : IWMReaderNetworkConfig2*, pfenablethinning : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_enable_thinning.call(this, pfenablethinning)
  end
  def set_enable_thinning(this : IWMReaderNetworkConfig2*, fenablethinning : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_enable_thinning.call(this, fenablethinning)
  end
  def get_max_net_packet_size(this : IWMReaderNetworkConfig2*, pdwmaxnetpacketsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_net_packet_size.call(this, pdwmaxnetpacketsize)
  end
end
struct LibWin32::IWMReaderStreamClock
  def query_interface(this : IWMReaderStreamClock*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderStreamClock*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderStreamClock*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_time(this : IWMReaderStreamClock*, pcnsnow : UInt64*) : HRESULT
    @lpVtbl.value.get_time.call(this, pcnsnow)
  end
  def set_timer(this : IWMReaderStreamClock*, cnswhen : UInt64, pvparam : Void*, pdwtimerid : UInt32*) : HRESULT
    @lpVtbl.value.set_timer.call(this, cnswhen, pvparam, pdwtimerid)
  end
  def kill_timer(this : IWMReaderStreamClock*, dwtimerid : UInt32) : HRESULT
    @lpVtbl.value.kill_timer.call(this, dwtimerid)
  end
end
struct LibWin32::IWMIndexer
  def query_interface(this : IWMIndexer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMIndexer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMIndexer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_indexing(this : IWMIndexer*, pwszurl : LibC::LPWSTR, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_indexing.call(this, pwszurl, pcallback, pvcontext)
  end
  def cancel(this : IWMIndexer*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::IWMIndexer2
  def query_interface(this : IWMIndexer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMIndexer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMIndexer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_indexing(this : IWMIndexer2*, pwszurl : LibC::LPWSTR, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_indexing.call(this, pwszurl, pcallback, pvcontext)
  end
  def cancel(this : IWMIndexer2*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def configure(this : IWMIndexer2*, wstreamnum : UInt16, nindexertype : WMT_INDEXER_TYPE, pvinterval : Void*, pvindextype : Void*) : HRESULT
    @lpVtbl.value.configure.call(this, wstreamnum, nindexertype, pvinterval, pvindextype)
  end
end
struct LibWin32::IWMLicenseBackup
  def query_interface(this : IWMLicenseBackup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMLicenseBackup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMLicenseBackup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def backup_licenses(this : IWMLicenseBackup*, dwflags : UInt32, pcallback : IWMStatusCallback) : HRESULT
    @lpVtbl.value.backup_licenses.call(this, dwflags, pcallback)
  end
  def cancel_license_backup(this : IWMLicenseBackup*) : HRESULT
    @lpVtbl.value.cancel_license_backup.call(this)
  end
end
struct LibWin32::IWMLicenseRestore
  def query_interface(this : IWMLicenseRestore*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMLicenseRestore*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMLicenseRestore*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def restore_licenses(this : IWMLicenseRestore*, dwflags : UInt32, pcallback : IWMStatusCallback) : HRESULT
    @lpVtbl.value.restore_licenses.call(this, dwflags, pcallback)
  end
  def cancel_license_restore(this : IWMLicenseRestore*) : HRESULT
    @lpVtbl.value.cancel_license_restore.call(this)
  end
end
struct LibWin32::IWMBackupRestoreProps
  def query_interface(this : IWMBackupRestoreProps*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMBackupRestoreProps*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMBackupRestoreProps*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_prop_count(this : IWMBackupRestoreProps*, pcprops : UInt16*) : HRESULT
    @lpVtbl.value.get_prop_count.call(this, pcprops)
  end
  def get_prop_by_index(this : IWMBackupRestoreProps*, windex : UInt16, pwszname : Char*, pcchnamelen : UInt16*, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_prop_by_index.call(this, windex, pwszname, pcchnamelen, ptype, pvalue, pcblength)
  end
  def get_prop_by_name(this : IWMBackupRestoreProps*, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pcblength : UInt16*) : HRESULT
    @lpVtbl.value.get_prop_by_name.call(this, pszname, ptype, pvalue, pcblength)
  end
  def set_prop(this : IWMBackupRestoreProps*, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, cblength : UInt16) : HRESULT
    @lpVtbl.value.set_prop.call(this, pszname, type, pvalue, cblength)
  end
  def remove_prop(this : IWMBackupRestoreProps*, pcwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_prop.call(this, pcwszname)
  end
  def remove_all_props(this : IWMBackupRestoreProps*) : HRESULT
    @lpVtbl.value.remove_all_props.call(this)
  end
end
struct LibWin32::IWMCodecInfo
  def query_interface(this : IWMCodecInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMCodecInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMCodecInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_codec_info_count(this : IWMCodecInfo*, guidtype : Guid*, pccodecs : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.call(this, guidtype, pccodecs)
  end
  def get_codec_format_count(this : IWMCodecInfo*, guidtype : Guid*, dwcodecindex : UInt32, pcformat : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_count.call(this, guidtype, dwcodecindex, pcformat)
  end
  def get_codec_format(this : IWMCodecInfo*, guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_codec_format.call(this, guidtype, dwcodecindex, dwformatindex, ppistreamconfig)
  end
end
struct LibWin32::IWMCodecInfo2
  def query_interface(this : IWMCodecInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMCodecInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMCodecInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_codec_info_count(this : IWMCodecInfo2*, guidtype : Guid*, pccodecs : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.call(this, guidtype, pccodecs)
  end
  def get_codec_format_count(this : IWMCodecInfo2*, guidtype : Guid*, dwcodecindex : UInt32, pcformat : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_count.call(this, guidtype, dwcodecindex, pcformat)
  end
  def get_codec_format(this : IWMCodecInfo2*, guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_codec_format.call(this, guidtype, dwcodecindex, dwformatindex, ppistreamconfig)
  end
  def get_codec_name(this : IWMCodecInfo2*, guidtype : Guid*, dwcodecindex : UInt32, wszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_name.call(this, guidtype, dwcodecindex, wszname, pcchname)
  end
  def get_codec_format_desc(this : IWMCodecInfo2*, guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*, wszdesc : Char*, pcchdesc : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_desc.call(this, guidtype, dwcodecindex, dwformatindex, ppistreamconfig, wszdesc, pcchdesc)
  end
end
struct LibWin32::IWMCodecInfo3
  def query_interface(this : IWMCodecInfo3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMCodecInfo3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMCodecInfo3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_codec_info_count(this : IWMCodecInfo3*, guidtype : Guid*, pccodecs : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_info_count.call(this, guidtype, pccodecs)
  end
  def get_codec_format_count(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, pcformat : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_count.call(this, guidtype, dwcodecindex, pcformat)
  end
  def get_codec_format(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*) : HRESULT
    @lpVtbl.value.get_codec_format.call(this, guidtype, dwcodecindex, dwformatindex, ppistreamconfig)
  end
  def get_codec_name(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, wszname : Char*, pcchname : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_name.call(this, guidtype, dwcodecindex, wszname, pcchname)
  end
  def get_codec_format_desc(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, ppistreamconfig : IWMStreamConfig*, wszdesc : Char*, pcchdesc : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_desc.call(this, guidtype, dwcodecindex, dwformatindex, ppistreamconfig, wszdesc, pcchdesc)
  end
  def get_codec_format_prop(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, dwformatindex : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_format_prop.call(this, guidtype, dwcodecindex, dwformatindex, pszname, ptype, pvalue, pdwsize)
  end
  def get_codec_prop(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_prop.call(this, guidtype, dwcodecindex, pszname, ptype, pvalue, pdwsize)
  end
  def set_codec_enumeration_setting(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, pszname : LibC::LPWSTR, type : WMT_ATTR_DATATYPE, pvalue : UInt8*, dwsize : UInt32) : HRESULT
    @lpVtbl.value.set_codec_enumeration_setting.call(this, guidtype, dwcodecindex, pszname, type, pvalue, dwsize)
  end
  def get_codec_enumeration_setting(this : IWMCodecInfo3*, guidtype : Guid*, dwcodecindex : UInt32, pszname : LibC::LPWSTR, ptype : WMT_ATTR_DATATYPE*, pvalue : UInt8*, pdwsize : UInt32*) : HRESULT
    @lpVtbl.value.get_codec_enumeration_setting.call(this, guidtype, dwcodecindex, pszname, ptype, pvalue, pdwsize)
  end
end
struct LibWin32::IWMLanguageList
  def query_interface(this : IWMLanguageList*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMLanguageList*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMLanguageList*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_language_count(this : IWMLanguageList*, pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_language_count.call(this, pwcount)
  end
  def get_language_details(this : IWMLanguageList*, windex : UInt16, pwszlanguagestring : Char*, pcchlanguagestringlength : UInt16*) : HRESULT
    @lpVtbl.value.get_language_details.call(this, windex, pwszlanguagestring, pcchlanguagestringlength)
  end
  def add_language_by_rfc1766_string(this : IWMLanguageList*, pwszlanguagestring : LibC::LPWSTR, pwindex : UInt16*) : HRESULT
    @lpVtbl.value.add_language_by_rfc1766_string.call(this, pwszlanguagestring, pwindex)
  end
end
struct LibWin32::IWMWriterPushSink
  def query_interface(this : IWMWriterPushSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWriterPushSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWriterPushSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_header(this : IWMWriterPushSink*, pheader : INSSBuffer) : HRESULT
    @lpVtbl.value.on_header.call(this, pheader)
  end
  def is_real_time(this : IWMWriterPushSink*, pfrealtime : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_real_time.call(this, pfrealtime)
  end
  def allocate_data_unit(this : IWMWriterPushSink*, cbdataunit : UInt32, ppdataunit : INSSBuffer*) : HRESULT
    @lpVtbl.value.allocate_data_unit.call(this, cbdataunit, ppdataunit)
  end
  def on_data_unit(this : IWMWriterPushSink*, pdataunit : INSSBuffer) : HRESULT
    @lpVtbl.value.on_data_unit.call(this, pdataunit)
  end
  def on_end_writing(this : IWMWriterPushSink*) : HRESULT
    @lpVtbl.value.on_end_writing.call(this)
  end
  def connect(this : IWMWriterPushSink*, pwszurl : LibC::LPWSTR, pwsztemplateurl : LibC::LPWSTR, fautodestroy : LibC::BOOL) : HRESULT
    @lpVtbl.value.connect.call(this, pwszurl, pwsztemplateurl, fautodestroy)
  end
  def disconnect(this : IWMWriterPushSink*) : HRESULT
    @lpVtbl.value.disconnect.call(this)
  end
  def end_session(this : IWMWriterPushSink*) : HRESULT
    @lpVtbl.value.end_session.call(this)
  end
end
struct LibWin32::IWMDeviceRegistration
  def query_interface(this : IWMDeviceRegistration*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDeviceRegistration*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDeviceRegistration*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_device(this : IWMDeviceRegistration*, dwregistertype : UInt32, pbcertificate : UInt8*, cbcertificate : UInt32, serialnumber : DRM_VAL16, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.register_device.call(this, dwregistertype, pbcertificate, cbcertificate, serialnumber, ppdevice)
  end
  def unregister_device(this : IWMDeviceRegistration*, dwregistertype : UInt32, pbcertificate : UInt8*, cbcertificate : UInt32, serialnumber : DRM_VAL16) : HRESULT
    @lpVtbl.value.unregister_device.call(this, dwregistertype, pbcertificate, cbcertificate, serialnumber)
  end
  def get_registration_stats(this : IWMDeviceRegistration*, dwregistertype : UInt32, pcregistereddevices : UInt32*) : HRESULT
    @lpVtbl.value.get_registration_stats.call(this, dwregistertype, pcregistereddevices)
  end
  def get_first_registered_device(this : IWMDeviceRegistration*, dwregistertype : UInt32, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.get_first_registered_device.call(this, dwregistertype, ppdevice)
  end
  def get_next_registered_device(this : IWMDeviceRegistration*, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.get_next_registered_device.call(this, ppdevice)
  end
  def get_registered_device_by_id(this : IWMDeviceRegistration*, dwregistertype : UInt32, pbcertificate : UInt8*, cbcertificate : UInt32, serialnumber : DRM_VAL16, ppdevice : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.get_registered_device_by_id.call(this, dwregistertype, pbcertificate, cbcertificate, serialnumber, ppdevice)
  end
end
struct LibWin32::IWMRegisteredDevice
  def query_interface(this : IWMRegisteredDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMRegisteredDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMRegisteredDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_device_serial_number(this : IWMRegisteredDevice*, pserialnumber : DRM_VAL16*) : HRESULT
    @lpVtbl.value.get_device_serial_number.call(this, pserialnumber)
  end
  def get_device_certificate(this : IWMRegisteredDevice*, ppcertificate : INSSBuffer*) : HRESULT
    @lpVtbl.value.get_device_certificate.call(this, ppcertificate)
  end
  def get_device_type(this : IWMRegisteredDevice*, pdwtype : UInt32*) : HRESULT
    @lpVtbl.value.get_device_type.call(this, pdwtype)
  end
  def get_attribute_count(this : IWMRegisteredDevice*, pcattributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attribute_count.call(this, pcattributes)
  end
  def get_attribute_by_index(this : IWMRegisteredDevice*, dwindex : UInt32, pbstrname : UInt8**, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute_by_index.call(this, dwindex, pbstrname, pbstrvalue)
  end
  def get_attribute_by_name(this : IWMRegisteredDevice*, bstrname : UInt8*, pbstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_attribute_by_name.call(this, bstrname, pbstrvalue)
  end
  def set_attribute_by_name(this : IWMRegisteredDevice*, bstrname : UInt8*, bstrvalue : UInt8*) : HRESULT
    @lpVtbl.value.set_attribute_by_name.call(this, bstrname, bstrvalue)
  end
  def approve(this : IWMRegisteredDevice*, fapprove : LibC::BOOL) : HRESULT
    @lpVtbl.value.approve.call(this, fapprove)
  end
  def is_valid(this : IWMRegisteredDevice*, pfvalid : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_valid.call(this, pfvalid)
  end
  def is_approved(this : IWMRegisteredDevice*, pfapproved : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_approved.call(this, pfapproved)
  end
  def is_wmdrm_compliant(this : IWMRegisteredDevice*, pfcompliant : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_wmdrm_compliant.call(this, pfcompliant)
  end
  def is_opened(this : IWMRegisteredDevice*, pfopened : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_opened.call(this, pfopened)
  end
  def open(this : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.open.call(this)
  end
  def close(this : IWMRegisteredDevice*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IWMProximityDetection
  def query_interface(this : IWMProximityDetection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMProximityDetection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMProximityDetection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_detection(this : IWMProximityDetection*, pbregistrationmsg : UInt8*, cbregistrationmsg : UInt32, pblocaladdress : UInt8*, cblocaladdress : UInt32, dwextraportsallowed : UInt32, ppregistrationresponsemsg : INSSBuffer*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.start_detection.call(this, pbregistrationmsg, cbregistrationmsg, pblocaladdress, cblocaladdress, dwextraportsallowed, ppregistrationresponsemsg, pcallback, pvcontext)
  end
end
struct LibWin32::IWMDRMMessageParser
  def query_interface(this : IWMDRMMessageParser*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMMessageParser*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMMessageParser*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def parse_registration_req_msg(this : IWMDRMMessageParser*, pbregistrationreqmsg : UInt8*, cbregistrationreqmsg : UInt32, ppdevicecert : INSSBuffer*, pdeviceserialnumber : DRM_VAL16*) : HRESULT
    @lpVtbl.value.parse_registration_req_msg.call(this, pbregistrationreqmsg, cbregistrationreqmsg, ppdevicecert, pdeviceserialnumber)
  end
  def parse_license_request_msg(this : IWMDRMMessageParser*, pblicenserequestmsg : UInt8*, cblicenserequestmsg : UInt32, ppdevicecert : INSSBuffer*, pdeviceserialnumber : DRM_VAL16*, pbstraction : UInt8**) : HRESULT
    @lpVtbl.value.parse_license_request_msg.call(this, pblicenserequestmsg, cblicenserequestmsg, ppdevicecert, pdeviceserialnumber, pbstraction)
  end
end
struct LibWin32::IWMDRMTranscryptor
  def query_interface(this : IWMDRMTranscryptor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMTranscryptor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMTranscryptor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IWMDRMTranscryptor*, bstrfilename : UInt8*, pblicenserequestmsg : UInt8*, cblicenserequestmsg : UInt32, pplicenseresponsemsg : INSSBuffer*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.initialize.call(this, bstrfilename, pblicenserequestmsg, cblicenserequestmsg, pplicenseresponsemsg, pcallback, pvcontext)
  end
  def seek(this : IWMDRMTranscryptor*, hnstime : UInt64) : HRESULT
    @lpVtbl.value.seek.call(this, hnstime)
  end
  def read(this : IWMDRMTranscryptor*, pbdata : UInt8*, pcbdata : UInt32*) : HRESULT
    @lpVtbl.value.read.call(this, pbdata, pcbdata)
  end
  def close(this : IWMDRMTranscryptor*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
end
struct LibWin32::IWMDRMTranscryptor2
  def query_interface(this : IWMDRMTranscryptor2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMTranscryptor2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMTranscryptor2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IWMDRMTranscryptor2*, bstrfilename : UInt8*, pblicenserequestmsg : UInt8*, cblicenserequestmsg : UInt32, pplicenseresponsemsg : INSSBuffer*, pcallback : IWMStatusCallback, pvcontext : Void*) : HRESULT
    @lpVtbl.value.initialize.call(this, bstrfilename, pblicenserequestmsg, cblicenserequestmsg, pplicenseresponsemsg, pcallback, pvcontext)
  end
  def seek(this : IWMDRMTranscryptor2*, hnstime : UInt64) : HRESULT
    @lpVtbl.value.seek.call(this, hnstime)
  end
  def read(this : IWMDRMTranscryptor2*, pbdata : UInt8*, pcbdata : UInt32*) : HRESULT
    @lpVtbl.value.read.call(this, pbdata, pcbdata)
  end
  def close(this : IWMDRMTranscryptor2*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def seek_ex(this : IWMDRMTranscryptor2*, cnsstarttime : UInt64, cnsduration : UInt64, flrate : Float32, fincludefileheader : LibC::BOOL) : HRESULT
    @lpVtbl.value.seek_ex.call(this, cnsstarttime, cnsduration, flrate, fincludefileheader)
  end
  def zero_adjust_timestamps(this : IWMDRMTranscryptor2*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.zero_adjust_timestamps.call(this, fenable)
  end
  def get_seek_start_time(this : IWMDRMTranscryptor2*, pcnstime : UInt64*) : HRESULT
    @lpVtbl.value.get_seek_start_time.call(this, pcnstime)
  end
  def get_duration(this : IWMDRMTranscryptor2*, pcnsduration : UInt64*) : HRESULT
    @lpVtbl.value.get_duration.call(this, pcnsduration)
  end
end
struct LibWin32::IWMDRMTranscryptionManager
  def query_interface(this : IWMDRMTranscryptionManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMDRMTranscryptionManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMDRMTranscryptionManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_transcryptor(this : IWMDRMTranscryptionManager*, pptranscryptor : IWMDRMTranscryptor*) : HRESULT
    @lpVtbl.value.create_transcryptor.call(this, pptranscryptor)
  end
end
struct LibWin32::IWMWatermarkInfo
  def query_interface(this : IWMWatermarkInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMWatermarkInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMWatermarkInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_watermark_entry_count(this : IWMWatermarkInfo*, wmettype : WMT_WATERMARK_ENTRY_TYPE, pdwcount : UInt32*) : HRESULT
    @lpVtbl.value.get_watermark_entry_count.call(this, wmettype, pdwcount)
  end
  def get_watermark_entry(this : IWMWatermarkInfo*, wmettype : WMT_WATERMARK_ENTRY_TYPE, dwentrynum : UInt32, pentry : WMT_WATERMARK_ENTRY*) : HRESULT
    @lpVtbl.value.get_watermark_entry.call(this, wmettype, dwentrynum, pentry)
  end
end
struct LibWin32::IWMReaderAccelerator
  def query_interface(this : IWMReaderAccelerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderAccelerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderAccelerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_codec_interface(this : IWMReaderAccelerator*, dwoutputnum : UInt32, riid : Guid*, ppvcodecinterface : Void**) : HRESULT
    @lpVtbl.value.get_codec_interface.call(this, dwoutputnum, riid, ppvcodecinterface)
  end
  def notify(this : IWMReaderAccelerator*, dwoutputnum : UInt32, psubtype : WM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.notify.call(this, dwoutputnum, psubtype)
  end
end
struct LibWin32::IWMReaderTimecode
  def query_interface(this : IWMReaderTimecode*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMReaderTimecode*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMReaderTimecode*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_timecode_range_count(this : IWMReaderTimecode*, wstreamnum : UInt16, pwrangecount : UInt16*) : HRESULT
    @lpVtbl.value.get_timecode_range_count.call(this, wstreamnum, pwrangecount)
  end
  def get_timecode_range_bounds(this : IWMReaderTimecode*, wstreamnum : UInt16, wrangenum : UInt16, pstarttimecode : UInt32*, pendtimecode : UInt32*) : HRESULT
    @lpVtbl.value.get_timecode_range_bounds.call(this, wstreamnum, wrangenum, pstarttimecode, pendtimecode)
  end
end
struct LibWin32::IWMAddressAccess
  def query_interface(this : IWMAddressAccess*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMAddressAccess*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMAddressAccess*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_access_entry_count(this : IWMAddressAccess*, aetype : WM_AETYPE, pcentries : UInt32*) : HRESULT
    @lpVtbl.value.get_access_entry_count.call(this, aetype, pcentries)
  end
  def get_access_entry(this : IWMAddressAccess*, aetype : WM_AETYPE, dwentrynum : UInt32, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.get_access_entry.call(this, aetype, dwentrynum, paddraccessentry)
  end
  def add_access_entry(this : IWMAddressAccess*, aetype : WM_AETYPE, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.add_access_entry.call(this, aetype, paddraccessentry)
  end
  def remove_access_entry(this : IWMAddressAccess*, aetype : WM_AETYPE, dwentrynum : UInt32) : HRESULT
    @lpVtbl.value.remove_access_entry.call(this, aetype, dwentrynum)
  end
end
struct LibWin32::IWMAddressAccess2
  def query_interface(this : IWMAddressAccess2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMAddressAccess2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMAddressAccess2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_access_entry_count(this : IWMAddressAccess2*, aetype : WM_AETYPE, pcentries : UInt32*) : HRESULT
    @lpVtbl.value.get_access_entry_count.call(this, aetype, pcentries)
  end
  def get_access_entry(this : IWMAddressAccess2*, aetype : WM_AETYPE, dwentrynum : UInt32, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.get_access_entry.call(this, aetype, dwentrynum, paddraccessentry)
  end
  def add_access_entry(this : IWMAddressAccess2*, aetype : WM_AETYPE, paddraccessentry : WM_ADDRESS_ACCESSENTRY*) : HRESULT
    @lpVtbl.value.add_access_entry.call(this, aetype, paddraccessentry)
  end
  def remove_access_entry(this : IWMAddressAccess2*, aetype : WM_AETYPE, dwentrynum : UInt32) : HRESULT
    @lpVtbl.value.remove_access_entry.call(this, aetype, dwentrynum)
  end
  def get_access_entry_ex(this : IWMAddressAccess2*, aetype : WM_AETYPE, dwentrynum : UInt32, pbstraddress : UInt8**, pbstrmask : UInt8**) : HRESULT
    @lpVtbl.value.get_access_entry_ex.call(this, aetype, dwentrynum, pbstraddress, pbstrmask)
  end
  def add_access_entry_ex(this : IWMAddressAccess2*, aetype : WM_AETYPE, bstraddress : UInt8*, bstrmask : UInt8*) : HRESULT
    @lpVtbl.value.add_access_entry_ex.call(this, aetype, bstraddress, bstrmask)
  end
end
struct LibWin32::IWMImageInfo
  def query_interface(this : IWMImageInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMImageInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMImageInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_image_count(this : IWMImageInfo*, pcimages : UInt32*) : HRESULT
    @lpVtbl.value.get_image_count.call(this, pcimages)
  end
  def get_image(this : IWMImageInfo*, windex : UInt32, pcchmimetype : UInt16*, pwszmimetype : Char*, pcchdescription : UInt16*, pwszdescription : Char*, pimagetype : UInt16*, pcbimagedata : UInt32*, pbimagedata : UInt8*) : HRESULT
    @lpVtbl.value.get_image.call(this, windex, pcchmimetype, pwszmimetype, pcchdescription, pwszdescription, pimagetype, pcbimagedata, pbimagedata)
  end
end
struct LibWin32::IWMLicenseRevocationAgent
  def query_interface(this : IWMLicenseRevocationAgent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMLicenseRevocationAgent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMLicenseRevocationAgent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_lrb_challenge(this : IWMLicenseRevocationAgent*, pmachineid : UInt8*, dwmachineidlength : UInt32, pchallenge : UInt8*, dwchallengelength : UInt32, pchallengeoutput : UInt8*, pdwchallengeoutputlength : UInt32*) : HRESULT
    @lpVtbl.value.get_lrb_challenge.call(this, pmachineid, dwmachineidlength, pchallenge, dwchallengelength, pchallengeoutput, pdwchallengeoutputlength)
  end
  def process_lrb(this : IWMLicenseRevocationAgent*, psignedlrb : UInt8*, dwsignedlrblength : UInt32, psignedack : UInt8*, pdwsignedacklength : UInt32*) : HRESULT
    @lpVtbl.value.process_lrb.call(this, psignedlrb, dwsignedlrblength, psignedack, pdwsignedacklength)
  end
end
struct LibWin32::IWMAuthorizer
  def query_interface(this : IWMAuthorizer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMAuthorizer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMAuthorizer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_cert_count(this : IWMAuthorizer*, pccerts : UInt32*) : HRESULT
    @lpVtbl.value.get_cert_count.call(this, pccerts)
  end
  def get_cert(this : IWMAuthorizer*, dwindex : UInt32, ppbcertdata : UInt8**) : HRESULT
    @lpVtbl.value.get_cert.call(this, dwindex, ppbcertdata)
  end
  def get_shared_data(this : IWMAuthorizer*, dwcertindex : UInt32, pbshareddata : UInt8*, pbcert : UInt8*, ppbshareddata : UInt8**) : HRESULT
    @lpVtbl.value.get_shared_data.call(this, dwcertindex, pbshareddata, pbcert, ppbshareddata)
  end
end
struct LibWin32::IWMSecureChannel
  def query_interface(this : IWMSecureChannel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSecureChannel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSecureChannel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_cert_count(this : IWMSecureChannel*, pccerts : UInt32*) : HRESULT
    @lpVtbl.value.get_cert_count.call(this, pccerts)
  end
  def get_cert(this : IWMSecureChannel*, dwindex : UInt32, ppbcertdata : UInt8**) : HRESULT
    @lpVtbl.value.get_cert.call(this, dwindex, ppbcertdata)
  end
  def get_shared_data(this : IWMSecureChannel*, dwcertindex : UInt32, pbshareddata : UInt8*, pbcert : UInt8*, ppbshareddata : UInt8**) : HRESULT
    @lpVtbl.value.get_shared_data.call(this, dwcertindex, pbshareddata, pbcert, ppbshareddata)
  end
  def wmsc_add_certificate(this : IWMSecureChannel*, pcert : IWMAuthorizer) : HRESULT
    @lpVtbl.value.wmsc_add_certificate.call(this, pcert)
  end
  def wmsc_add_signature(this : IWMSecureChannel*, pbcertsig : UInt8*, cbcertsig : UInt32) : HRESULT
    @lpVtbl.value.wmsc_add_signature.call(this, pbcertsig, cbcertsig)
  end
  def wmsc_connect(this : IWMSecureChannel*, potherside : IWMSecureChannel) : HRESULT
    @lpVtbl.value.wmsc_connect.call(this, potherside)
  end
  def wmsc_is_connected(this : IWMSecureChannel*, pfisconnected : LibC::BOOL*) : HRESULT
    @lpVtbl.value.wmsc_is_connected.call(this, pfisconnected)
  end
  def wmsc_disconnect(this : IWMSecureChannel*) : HRESULT
    @lpVtbl.value.wmsc_disconnect.call(this)
  end
  def wmsc_get_valid_certificate(this : IWMSecureChannel*, ppbcertificate : UInt8**, pdwsignature : UInt32*) : HRESULT
    @lpVtbl.value.wmsc_get_valid_certificate.call(this, ppbcertificate, pdwsignature)
  end
  def wmsc_encrypt(this : IWMSecureChannel*, pbdata : UInt8*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.wmsc_encrypt.call(this, pbdata, cbdata)
  end
  def wmsc_decrypt(this : IWMSecureChannel*, pbdata : UInt8*, cbdata : UInt32) : HRESULT
    @lpVtbl.value.wmsc_decrypt.call(this, pbdata, cbdata)
  end
  def wmsc_lock(this : IWMSecureChannel*) : HRESULT
    @lpVtbl.value.wmsc_lock.call(this)
  end
  def wmsc_unlock(this : IWMSecureChannel*) : HRESULT
    @lpVtbl.value.wmsc_unlock.call(this)
  end
  def wmsc_set_shared_data(this : IWMSecureChannel*, dwcertindex : UInt32, pbshareddata : UInt8*) : HRESULT
    @lpVtbl.value.wmsc_set_shared_data.call(this, dwcertindex, pbshareddata)
  end
end
struct LibWin32::IWMGetSecureChannel
  def query_interface(this : IWMGetSecureChannel*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMGetSecureChannel*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMGetSecureChannel*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_peer_secure_channel_interface(this : IWMGetSecureChannel*, pppeer : IWMSecureChannel*) : HRESULT
    @lpVtbl.value.get_peer_secure_channel_interface.call(this, pppeer)
  end
end
struct LibWin32::INSNetSourceCreator
  def query_interface(this : INSNetSourceCreator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INSNetSourceCreator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INSNetSourceCreator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : INSNetSourceCreator*) : HRESULT
    @lpVtbl.value.initialize.call(this)
  end
  def create_net_source(this : INSNetSourceCreator*, pszstreamname : LibC::LPWSTR, pmonitor : IUnknown, pdata : UInt8*, pusercontext : IUnknown, pcallback : IUnknown, qwcontext : UInt64) : HRESULT
    @lpVtbl.value.create_net_source.call(this, pszstreamname, pmonitor, pdata, pusercontext, pcallback, qwcontext)
  end
  def get_net_source_properties(this : INSNetSourceCreator*, pszstreamname : LibC::LPWSTR, pppropertiesnode : IUnknown*) : HRESULT
    @lpVtbl.value.get_net_source_properties.call(this, pszstreamname, pppropertiesnode)
  end
  def get_net_source_shared_namespace(this : INSNetSourceCreator*, ppsharednamespace : IUnknown*) : HRESULT
    @lpVtbl.value.get_net_source_shared_namespace.call(this, ppsharednamespace)
  end
  def get_net_source_admin_interface(this : INSNetSourceCreator*, pszstreamname : LibC::LPWSTR, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_net_source_admin_interface.call(this, pszstreamname, pval)
  end
  def get_num_protocols_supported(this : INSNetSourceCreator*, pcprotocols : UInt32*) : HRESULT
    @lpVtbl.value.get_num_protocols_supported.call(this, pcprotocols)
  end
  def get_protocol_name(this : INSNetSourceCreator*, dwprotocolnum : UInt32, pwszprotocolname : LibC::LPWSTR, pcchprotocolname : UInt16*) : HRESULT
    @lpVtbl.value.get_protocol_name.call(this, dwprotocolnum, pwszprotocolname, pcchprotocolname)
  end
  def shutdown(this : INSNetSourceCreator*) : HRESULT
    @lpVtbl.value.shutdown.call(this)
  end
end
struct LibWin32::IWMPlayerTimestampHook
  def query_interface(this : IWMPlayerTimestampHook*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMPlayerTimestampHook*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMPlayerTimestampHook*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def map_timestamp(this : IWMPlayerTimestampHook*, rtin : Int64, prtout : Int64*) : HRESULT
    @lpVtbl.value.map_timestamp.call(this, rtin, prtout)
  end
end
struct LibWin32::IWMCodecAMVideoAccelerator
  def query_interface(this : IWMCodecAMVideoAccelerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMCodecAMVideoAccelerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMCodecAMVideoAccelerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_accelerator_interface(this : IWMCodecAMVideoAccelerator*, piamva : IAMVideoAccelerator) : HRESULT
    @lpVtbl.value.set_accelerator_interface.call(this, piamva)
  end
  def negotiate_connection(this : IWMCodecAMVideoAccelerator*, pmediatype : AM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.negotiate_connection.call(this, pmediatype)
  end
  def set_player_notify(this : IWMCodecAMVideoAccelerator*, phook : IWMPlayerTimestampHook) : HRESULT
    @lpVtbl.value.set_player_notify.call(this, phook)
  end
end
struct LibWin32::IWMCodecVideoAccelerator
  def query_interface(this : IWMCodecVideoAccelerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMCodecVideoAccelerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMCodecVideoAccelerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def negotiate_connection(this : IWMCodecVideoAccelerator*, piamva : IAMVideoAccelerator, pmediatype : AM_MEDIA_TYPE*) : HRESULT
    @lpVtbl.value.negotiate_connection.call(this, piamva, pmediatype)
  end
  def set_player_notify(this : IWMCodecVideoAccelerator*, phook : IWMPlayerTimestampHook) : HRESULT
    @lpVtbl.value.set_player_notify.call(this, phook)
  end
end
struct LibWin32::IWMSInternalAdminNetSource
  def query_interface(this : IWMSInternalAdminNetSource*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSInternalAdminNetSource*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSInternalAdminNetSource*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IWMSInternalAdminNetSource*, psharednamespace : IUnknown, pnamespacenode : IUnknown, pnetsourcecreator : INSNetSourceCreator, fembeddedinserver : LibC::BOOL) : HRESULT
    @lpVtbl.value.initialize.call(this, psharednamespace, pnamespacenode, pnetsourcecreator, fembeddedinserver)
  end
  def get_net_source_creator(this : IWMSInternalAdminNetSource*, ppnetsourcecreator : INSNetSourceCreator*) : HRESULT
    @lpVtbl.value.get_net_source_creator.call(this, ppnetsourcecreator)
  end
  def set_credentials(this : IWMSInternalAdminNetSource*, bstrrealm : UInt8*, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials.call(this, bstrrealm, bstrname, bstrpassword, fpersist, fconfirmedgood)
  end
  def get_credentials(this : IWMSInternalAdminNetSource*, bstrrealm : UInt8*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials.call(this, bstrrealm, pbstrname, pbstrpassword, pfconfirmedgood)
  end
  def delete_credentials(this : IWMSInternalAdminNetSource*, bstrrealm : UInt8*) : HRESULT
    @lpVtbl.value.delete_credentials.call(this, bstrrealm)
  end
  def get_credential_flags(this : IWMSInternalAdminNetSource*, lpdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_credential_flags.call(this, lpdwflags)
  end
  def set_credential_flags(this : IWMSInternalAdminNetSource*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_credential_flags.call(this, dwflags)
  end
  def find_proxy_for_url(this : IWMSInternalAdminNetSource*, bstrprotocol : UInt8*, bstrhost : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pdwproxycontext : UInt32*) : HRESULT
    @lpVtbl.value.find_proxy_for_url.call(this, bstrprotocol, bstrhost, pfproxyenabled, pbstrproxyserver, pdwproxyport, pdwproxycontext)
  end
  def register_proxy_failure(this : IWMSInternalAdminNetSource*, hrparam : HRESULT, dwproxycontext : UInt32) : HRESULT
    @lpVtbl.value.register_proxy_failure.call(this, hrparam, dwproxycontext)
  end
  def shutdown_proxy_context(this : IWMSInternalAdminNetSource*, dwproxycontext : UInt32) : HRESULT
    @lpVtbl.value.shutdown_proxy_context.call(this, dwproxycontext)
  end
  def is_using_ie(this : IWMSInternalAdminNetSource*, dwproxycontext : UInt32, pfisusingie : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_ie.call(this, dwproxycontext, pfisusingie)
  end
end
struct LibWin32::IWMSInternalAdminNetSource2
  def query_interface(this : IWMSInternalAdminNetSource2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSInternalAdminNetSource2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSInternalAdminNetSource2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_credentials_ex(this : IWMSInternalAdminNetSource2*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials_ex.call(this, bstrrealm, bstrurl, fproxy, bstrname, bstrpassword, fpersist, fconfirmedgood)
  end
  def get_credentials_ex(this : IWMSInternalAdminNetSource2*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, pdwurlpolicy : NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials_ex.call(this, bstrrealm, bstrurl, fproxy, pdwurlpolicy, pbstrname, pbstrpassword, pfconfirmedgood)
  end
  def delete_credentials_ex(this : IWMSInternalAdminNetSource2*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL) : HRESULT
    @lpVtbl.value.delete_credentials_ex.call(this, bstrrealm, bstrurl, fproxy)
  end
  def find_proxy_for_url_ex(this : IWMSInternalAdminNetSource2*, bstrprotocol : UInt8*, bstrhost : UInt8*, bstrurl : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pdwproxycontext : UInt32*) : HRESULT
    @lpVtbl.value.find_proxy_for_url_ex.call(this, bstrprotocol, bstrhost, bstrurl, pfproxyenabled, pbstrproxyserver, pdwproxyport, pdwproxycontext)
  end
end
struct LibWin32::IWMSInternalAdminNetSource3
  def query_interface(this : IWMSInternalAdminNetSource3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWMSInternalAdminNetSource3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWMSInternalAdminNetSource3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_credentials_ex(this : IWMSInternalAdminNetSource3*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials_ex.call(this, bstrrealm, bstrurl, fproxy, bstrname, bstrpassword, fpersist, fconfirmedgood)
  end
  def get_credentials_ex(this : IWMSInternalAdminNetSource3*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, pdwurlpolicy : NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials_ex.call(this, bstrrealm, bstrurl, fproxy, pdwurlpolicy, pbstrname, pbstrpassword, pfconfirmedgood)
  end
  def delete_credentials_ex(this : IWMSInternalAdminNetSource3*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL) : HRESULT
    @lpVtbl.value.delete_credentials_ex.call(this, bstrrealm, bstrurl, fproxy)
  end
  def find_proxy_for_url_ex(this : IWMSInternalAdminNetSource3*, bstrprotocol : UInt8*, bstrhost : UInt8*, bstrurl : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pdwproxycontext : UInt32*) : HRESULT
    @lpVtbl.value.find_proxy_for_url_ex.call(this, bstrprotocol, bstrhost, bstrurl, pfproxyenabled, pbstrproxyserver, pdwproxyport, pdwproxycontext)
  end
  def get_net_source_creator2(this : IWMSInternalAdminNetSource3*, ppnetsourcecreator : IUnknown*) : HRESULT
    @lpVtbl.value.get_net_source_creator2.call(this, ppnetsourcecreator)
  end
  def find_proxy_for_url_ex2(this : IWMSInternalAdminNetSource3*, bstrprotocol : UInt8*, bstrhost : UInt8*, bstrurl : UInt8*, pfproxyenabled : LibC::BOOL*, pbstrproxyserver : UInt8**, pdwproxyport : UInt32*, pqwproxycontext : UInt64*) : HRESULT
    @lpVtbl.value.find_proxy_for_url_ex2.call(this, bstrprotocol, bstrhost, bstrurl, pfproxyenabled, pbstrproxyserver, pdwproxyport, pqwproxycontext)
  end
  def register_proxy_failure2(this : IWMSInternalAdminNetSource3*, hrparam : HRESULT, qwproxycontext : UInt64) : HRESULT
    @lpVtbl.value.register_proxy_failure2.call(this, hrparam, qwproxycontext)
  end
  def shutdown_proxy_context2(this : IWMSInternalAdminNetSource3*, qwproxycontext : UInt64) : HRESULT
    @lpVtbl.value.shutdown_proxy_context2.call(this, qwproxycontext)
  end
  def is_using_ie2(this : IWMSInternalAdminNetSource3*, qwproxycontext : UInt64, pfisusingie : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_using_ie2.call(this, qwproxycontext, pfisusingie)
  end
  def set_credentials_ex2(this : IWMSInternalAdminNetSource3*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, bstrname : UInt8*, bstrpassword : UInt8*, fpersist : LibC::BOOL, fconfirmedgood : LibC::BOOL, fcleartextauthentication : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_credentials_ex2.call(this, bstrrealm, bstrurl, fproxy, bstrname, bstrpassword, fpersist, fconfirmedgood, fcleartextauthentication)
  end
  def get_credentials_ex2(this : IWMSInternalAdminNetSource3*, bstrrealm : UInt8*, bstrurl : UInt8*, fproxy : LibC::BOOL, fcleartextauthentication : LibC::BOOL, pdwurlpolicy : NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrname : UInt8**, pbstrpassword : UInt8**, pfconfirmedgood : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_credentials_ex2.call(this, bstrrealm, bstrurl, fproxy, fcleartextauthentication, pdwurlpolicy, pbstrname, pbstrpassword, pfconfirmedgood)
  end
end
