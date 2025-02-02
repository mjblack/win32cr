require "./../foundation.cr"
require "./../system/com.cr"
require "./../graphics/gdi.cr"

module Win32cr::Media::WindowsMediaFormat
  extend self
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

  enum AM_ASFWRITERCONFIG_PARAM_
    AM_CONFIGASFWRITER_PARAM_AUTOINDEX = 1_i32
    AM_CONFIGASFWRITER_PARAM_MULTIPASS = 2_i32
    AM_CONFIGASFWRITER_PARAM_DONTCOMPRESS = 3_i32
  end
  enum WEBSTREAM_SAMPLE_TYPE
    WEBSTREAM_SAMPLE_TYPE_FILE = 1_i32
    WEBSTREAM_SAMPLE_TYPE_RENDER = 2_i32
  end
  enum WM_SF_TYPE
    WM_SF_CLEANPOINT = 1_i32
    WM_SF_DISCONTINUITY = 2_i32
    WM_SF_DATALOSS = 4_i32
  end
  enum WM_SFEX_TYPE
    WM_SFEX_NOTASYNCPOINT = 2_i32
    WM_SFEX_DATALOSS = 4_i32
  end
  enum WMT_STATUS
    WMT_ERROR = 0_i32
    WMT_OPENED = 1_i32
    WMT_BUFFERING_START = 2_i32
    WMT_BUFFERING_STOP = 3_i32
    WMT_EOF = 4_i32
    WMT_END_OF_FILE = 4_i32
    WMT_END_OF_SEGMENT = 5_i32
    WMT_END_OF_STREAMING = 6_i32
    WMT_LOCATING = 7_i32
    WMT_CONNECTING = 8_i32
    WMT_NO_RIGHTS = 9_i32
    WMT_MISSING_CODEC = 10_i32
    WMT_STARTED = 11_i32
    WMT_STOPPED = 12_i32
    WMT_CLOSED = 13_i32
    WMT_STRIDING = 14_i32
    WMT_TIMER = 15_i32
    WMT_INDEX_PROGRESS = 16_i32
    WMT_SAVEAS_START = 17_i32
    WMT_SAVEAS_STOP = 18_i32
    WMT_NEW_SOURCEFLAGS = 19_i32
    WMT_NEW_METADATA = 20_i32
    WMT_BACKUPRESTORE_BEGIN = 21_i32
    WMT_SOURCE_SWITCH = 22_i32
    WMT_ACQUIRE_LICENSE = 23_i32
    WMT_INDIVIDUALIZE = 24_i32
    WMT_NEEDS_INDIVIDUALIZATION = 25_i32
    WMT_NO_RIGHTS_EX = 26_i32
    WMT_BACKUPRESTORE_END = 27_i32
    WMT_BACKUPRESTORE_CONNECTING = 28_i32
    WMT_BACKUPRESTORE_DISCONNECTING = 29_i32
    WMT_ERROR_WITHURL = 30_i32
    WMT_RESTRICTED_LICENSE = 31_i32
    WMT_CLIENT_CONNECT = 32_i32
    WMT_CLIENT_DISCONNECT = 33_i32
    WMT_NATIVE_OUTPUT_PROPS_CHANGED = 34_i32
    WMT_RECONNECT_START = 35_i32
    WMT_RECONNECT_END = 36_i32
    WMT_CLIENT_CONNECT_EX = 37_i32
    WMT_CLIENT_DISCONNECT_EX = 38_i32
    WMT_SET_FEC_SPAN = 39_i32
    WMT_PREROLL_READY = 40_i32
    WMT_PREROLL_COMPLETE = 41_i32
    WMT_CLIENT_PROPERTIES = 42_i32
    WMT_LICENSEURL_SIGNATURE_STATE = 43_i32
    WMT_INIT_PLAYLIST_BURN = 44_i32
    WMT_TRANSCRYPTOR_INIT = 45_i32
    WMT_TRANSCRYPTOR_SEEKED = 46_i32
    WMT_TRANSCRYPTOR_READ = 47_i32
    WMT_TRANSCRYPTOR_CLOSED = 48_i32
    WMT_PROXIMITY_RESULT = 49_i32
    WMT_PROXIMITY_COMPLETED = 50_i32
    WMT_CONTENT_ENABLER = 51_i32
  end
  enum WMT_STREAM_SELECTION
    WMT_OFF = 0_i32
    WMT_CLEANPOINT_ONLY = 1_i32
    WMT_ON = 2_i32
  end
  enum WMT_IMAGE_TYPE
    WMT_IT_NONE = 0_i32
    WMT_IT_BITMAP = 1_i32
    WMT_IT_JPEG = 2_i32
    WMT_IT_GIF = 3_i32
  end
  enum WMT_ATTR_DATATYPE
    WMT_TYPE_DWORD = 0_i32
    WMT_TYPE_STRING = 1_i32
    WMT_TYPE_BINARY = 2_i32
    WMT_TYPE_BOOL = 3_i32
    WMT_TYPE_QWORD = 4_i32
    WMT_TYPE_WORD = 5_i32
    WMT_TYPE_GUID = 6_i32
  end
  enum WMT_ATTR_IMAGETYPE
    WMT_IMAGETYPE_BITMAP = 1_i32
    WMT_IMAGETYPE_JPEG = 2_i32
    WMT_IMAGETYPE_GIF = 3_i32
  end
  enum WMT_VERSION
    WMT_VER_4_0 = 262144_i32
    WMT_VER_7_0 = 458752_i32
    WMT_VER_8_0 = 524288_i32
    WMT_VER_9_0 = 589824_i32
  end
  enum WMT_STORAGE_FORMAT
    WMT_Storage_Format_MP3 = 0_i32
    WMT_Storage_Format_V1 = 1_i32
  end
  enum WMT_DRMLA_TRUST
    WMT_DRMLA_UNTRUSTED = 0_i32
    WMT_DRMLA_TRUSTED = 1_i32
    WMT_DRMLA_TAMPERED = 2_i32
  end
  enum WMT_TRANSPORT_TYPE
    WMT_Transport_Type_Unreliable = 0_i32
    WMT_Transport_Type_Reliable = 1_i32
  end
  enum WMT_NET_PROTOCOL
    WMT_PROTOCOL_HTTP = 0_i32
  end
  enum WMT_PLAY_MODE
    WMT_PLAY_MODE_AUTOSELECT = 0_i32
    WMT_PLAY_MODE_LOCAL = 1_i32
    WMT_PLAY_MODE_DOWNLOAD = 2_i32
    WMT_PLAY_MODE_STREAMING = 3_i32
  end
  enum WMT_PROXY_SETTINGS
    WMT_PROXY_SETTING_NONE = 0_i32
    WMT_PROXY_SETTING_MANUAL = 1_i32
    WMT_PROXY_SETTING_AUTO = 2_i32
    WMT_PROXY_SETTING_BROWSER = 3_i32
    WMT_PROXY_SETTING_MAX = 4_i32
  end
  enum WMT_CODEC_INFO_TYPE
    WMT_CODECINFO_AUDIO = 0_i32
    WMT_CODECINFO_VIDEO = 1_i32
    WMT_CODECINFO_UNKNOWN = -1_i32
  end
  enum WM_DM_INTERLACED_TYPE
    WM_DM_NOTINTERLACED = 0_i32
    WM_DM_DEINTERLACE_NORMAL = 1_i32
    WM_DM_DEINTERLACE_HALFSIZE = 2_i32
    WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE = 3_i32
    WM_DM_DEINTERLACE_INVERSETELECINE = 4_i32
    WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE = 5_i32
  end
  enum WM_DM_IT_FIRST_FRAME_COHERENCY
    WM_DM_IT_DISABLE_COHERENT_MODE = 0_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP = 1_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP = 2_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP = 3_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP = 4_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP = 5_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM = 6_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM = 7_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM = 8_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM = 9_i32
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM = 10_i32
  end
  enum WMT_OFFSET_FORMAT
    WMT_OFFSET_FORMAT_100NS = 0_i32
    WMT_OFFSET_FORMAT_FRAME_NUMBERS = 1_i32
    WMT_OFFSET_FORMAT_PLAYLIST_OFFSET = 2_i32
    WMT_OFFSET_FORMAT_TIMECODE = 3_i32
    WMT_OFFSET_FORMAT_100NS_APPROXIMATE = 4_i32
  end
  enum WMT_INDEXER_TYPE
    WMT_IT_PRESENTATION_TIME = 0_i32
    WMT_IT_FRAME_NUMBERS = 1_i32
    WMT_IT_TIMECODE = 2_i32
  end
  enum WMT_INDEX_TYPE
    WMT_IT_NEAREST_DATA_UNIT = 1_i32
    WMT_IT_NEAREST_OBJECT = 2_i32
    WMT_IT_NEAREST_CLEAN_POINT = 3_i32
  end
  enum WMT_FILESINK_MODE
    WMT_FM_SINGLE_BUFFERS = 1_i32
    WMT_FM_FILESINK_DATA_UNITS = 2_i32
    WMT_FM_FILESINK_UNBUFFERED = 4_i32
  end
  enum WMT_MUSICSPEECH_CLASS_MODE
    WMT_MS_CLASS_MUSIC = 0_i32
    WMT_MS_CLASS_SPEECH = 1_i32
    WMT_MS_CLASS_MIXED = 2_i32
  end
  enum WMT_WATERMARK_ENTRY_TYPE
    WMT_WMETYPE_AUDIO = 1_i32
    WMT_WMETYPE_VIDEO = 2_i32
  end
  enum WM_PLAYBACK_DRC_LEVEL
    WM_PLAYBACK_DRC_HIGH = 0_i32
    WM_PLAYBACK_DRC_MEDIUM = 1_i32
    WM_PLAYBACK_DRC_LOW = 2_i32
  end
  enum WMT_TIMECODE_FRAMERATE
    WMT_TIMECODE_FRAMERATE_30 = 0_i32
    WMT_TIMECODE_FRAMERATE_30DROP = 1_i32
    WMT_TIMECODE_FRAMERATE_25 = 2_i32
    WMT_TIMECODE_FRAMERATE_24 = 3_i32
  end
  enum WMT_CREDENTIAL_FLAGS
    WMT_CREDENTIAL_SAVE = 1_i32
    WMT_CREDENTIAL_DONT_CACHE = 2_i32
    WMT_CREDENTIAL_CLEAR_TEXT = 4_i32
    WMT_CREDENTIAL_PROXY = 8_i32
    WMT_CREDENTIAL_ENCRYPT = 16_i32
  end
  enum WM_AETYPE
    WM_AETYPE_INCLUDE = 105_i32
    WM_AETYPE_EXCLUDE = 101_i32
  end
  enum WMT_RIGHTS
    WMT_RIGHT_PLAYBACK = 1_i32
    WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE = 2_i32
    WMT_RIGHT_COPY_TO_CD = 8_i32
    WMT_RIGHT_COPY_TO_SDMI_DEVICE = 16_i32
    WMT_RIGHT_ONE_TIME = 32_i32
    WMT_RIGHT_SAVE_STREAM_PROTECTED = 64_i32
    WMT_RIGHT_COPY = 128_i32
    WMT_RIGHT_COLLABORATIVE_PLAY = 256_i32
    WMT_RIGHT_SDMI_TRIGGER = 65536_i32
    WMT_RIGHT_SDMI_NOMORECOPIES = 131072_i32
  end
  enum NETSOURCE_URLCREDPOLICY_SETTINGS
    NETSOURCE_URLCREDPOLICY_SETTING_SILENTLOGONOK = 0_i32
    NETSOURCE_URLCREDPOLICY_SETTING_MUSTPROMPTUSER = 1_i32
    NETSOURCE_URLCREDPOLICY_SETTING_ANONYMOUSONLY = 2_i32
  end

  @[Extern]
  struct AM_WMT_EVENT_DATA
    property hrStatus : Win32cr::Foundation::HRESULT
    property pData : Void*
    def initialize(@hrStatus : Win32cr::Foundation::HRESULT, @pData : Void*)
    end
  end

  @[Extern]
  struct WM_STREAM_PRIORITY_RECORD
    property wStreamNumber : UInt16
    property fMandatory : Win32cr::Foundation::BOOL
    def initialize(@wStreamNumber : UInt16, @fMandatory : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WM_WRITER_STATISTICS
    property qwSampleCount : UInt64
    property qwByteCount : UInt64
    property qwDroppedSampleCount : UInt64
    property qwDroppedByteCount : UInt64
    property dwCurrentBitrate : UInt32
    property dwAverageBitrate : UInt32
    property dwExpectedBitrate : UInt32
    property dwCurrentSampleRate : UInt32
    property dwAverageSampleRate : UInt32
    property dwExpectedSampleRate : UInt32
    def initialize(@qwSampleCount : UInt64, @qwByteCount : UInt64, @qwDroppedSampleCount : UInt64, @qwDroppedByteCount : UInt64, @dwCurrentBitrate : UInt32, @dwAverageBitrate : UInt32, @dwExpectedBitrate : UInt32, @dwCurrentSampleRate : UInt32, @dwAverageSampleRate : UInt32, @dwExpectedSampleRate : UInt32)
    end
  end

  @[Extern]
  struct WM_WRITER_STATISTICS_EX
    property dwBitratePlusOverhead : UInt32
    property dwCurrentSampleDropRateInQueue : UInt32
    property dwCurrentSampleDropRateInCodec : UInt32
    property dwCurrentSampleDropRateInMultiplexer : UInt32
    property dwTotalSampleDropsInQueue : UInt32
    property dwTotalSampleDropsInCodec : UInt32
    property dwTotalSampleDropsInMultiplexer : UInt32
    def initialize(@dwBitratePlusOverhead : UInt32, @dwCurrentSampleDropRateInQueue : UInt32, @dwCurrentSampleDropRateInCodec : UInt32, @dwCurrentSampleDropRateInMultiplexer : UInt32, @dwTotalSampleDropsInQueue : UInt32, @dwTotalSampleDropsInCodec : UInt32, @dwTotalSampleDropsInMultiplexer : UInt32)
    end
  end

  @[Extern]
  struct WM_READER_STATISTICS
    property cbSize : UInt32
    property dwBandwidth : UInt32
    property cPacketsReceived : UInt32
    property cPacketsRecovered : UInt32
    property cPacketsLost : UInt32
    property wQuality : UInt16
    def initialize(@cbSize : UInt32, @dwBandwidth : UInt32, @cPacketsReceived : UInt32, @cPacketsRecovered : UInt32, @cPacketsLost : UInt32, @wQuality : UInt16)
    end
  end

  @[Extern]
  struct WM_READER_CLIENTINFO
    property cbSize : UInt32
    property wszLang : Win32cr::Foundation::PWSTR
    property wszBrowserUserAgent : Win32cr::Foundation::PWSTR
    property wszBrowserWebPage : Win32cr::Foundation::PWSTR
    property qwReserved : UInt64
    property pReserved : Win32cr::Foundation::LPARAM*
    property wszHostExe : Win32cr::Foundation::PWSTR
    property qwHostVersion : UInt64
    property wszPlayerUserAgent : Win32cr::Foundation::PWSTR
    def initialize(@cbSize : UInt32, @wszLang : Win32cr::Foundation::PWSTR, @wszBrowserUserAgent : Win32cr::Foundation::PWSTR, @wszBrowserWebPage : Win32cr::Foundation::PWSTR, @qwReserved : UInt64, @pReserved : Win32cr::Foundation::LPARAM*, @wszHostExe : Win32cr::Foundation::PWSTR, @qwHostVersion : UInt64, @wszPlayerUserAgent : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WM_CLIENT_PROPERTIES
    property dwIPAddress : UInt32
    property dwPort : UInt32
    def initialize(@dwIPAddress : UInt32, @dwPort : UInt32)
    end
  end

  @[Extern]
  struct WM_CLIENT_PROPERTIES_EX
    property cbSize : UInt32
    property pwszIPAddress : Win32cr::Foundation::PWSTR
    property pwszPort : Win32cr::Foundation::PWSTR
    property pwszDNSName : Win32cr::Foundation::PWSTR
    def initialize(@cbSize : UInt32, @pwszIPAddress : Win32cr::Foundation::PWSTR, @pwszPort : Win32cr::Foundation::PWSTR, @pwszDNSName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WM_PORT_NUMBER_RANGE
    property wPortBegin : UInt16
    property wPortEnd : UInt16
    def initialize(@wPortBegin : UInt16, @wPortEnd : UInt16)
    end
  end

  @[Extern]
  struct WMT_BUFFER_SEGMENT
    property pBuffer : Void*
    property cbOffset : UInt32
    property cbLength : UInt32
    def initialize(@pBuffer : Void*, @cbOffset : UInt32, @cbLength : UInt32)
    end
  end

  @[Extern]
  struct WMT_PAYLOAD_FRAGMENT
    property dwPayloadIndex : UInt32
    property segmentData : Win32cr::Media::WindowsMediaFormat::WMT_BUFFER_SEGMENT
    def initialize(@dwPayloadIndex : UInt32, @segmentData : Win32cr::Media::WindowsMediaFormat::WMT_BUFFER_SEGMENT)
    end
  end

  @[Extern]
  struct WMT_FILESINK_DATA_UNIT
    property packetHeaderBuffer : Win32cr::Media::WindowsMediaFormat::WMT_BUFFER_SEGMENT
    property cPayloads : UInt32
    property pPayloadHeaderBuffers : Win32cr::Media::WindowsMediaFormat::WMT_BUFFER_SEGMENT*
    property cPayloadDataFragments : UInt32
    property pPayloadDataFragments : Win32cr::Media::WindowsMediaFormat::WMT_PAYLOAD_FRAGMENT*
    def initialize(@packetHeaderBuffer : Win32cr::Media::WindowsMediaFormat::WMT_BUFFER_SEGMENT, @cPayloads : UInt32, @pPayloadHeaderBuffers : Win32cr::Media::WindowsMediaFormat::WMT_BUFFER_SEGMENT*, @cPayloadDataFragments : UInt32, @pPayloadDataFragments : Win32cr::Media::WindowsMediaFormat::WMT_PAYLOAD_FRAGMENT*)
    end
  end

  @[Extern]
  struct WMT_WEBSTREAM_FORMAT
    property cbSize : UInt16
    property cbSampleHeaderFixedData : UInt16
    property wVersion : UInt16
    property wReserved : UInt16
    def initialize(@cbSize : UInt16, @cbSampleHeaderFixedData : UInt16, @wVersion : UInt16, @wReserved : UInt16)
    end
  end

  @[Extern]
  struct WMT_WEBSTREAM_SAMPLE_HEADER
    property cbLength : UInt16
    property wPart : UInt16
    property cTotalParts : UInt16
    property wSampleType : UInt16
    property wszURL : UInt16*
    def initialize(@cbLength : UInt16, @wPart : UInt16, @cTotalParts : UInt16, @wSampleType : UInt16, @wszURL : UInt16*)
    end
  end

  @[Extern]
  struct WM_ADDRESS_ACCESSENTRY
    property dwIPAddress : UInt32
    property dwMask : UInt32
    def initialize(@dwIPAddress : UInt32, @dwMask : UInt32)
    end
  end

  @[Extern]
  struct WM_PICTURE
    property pwszMIMEType : Win32cr::Foundation::PWSTR
    property bPictureType : UInt8
    property pwszDescription : Win32cr::Foundation::PWSTR
    property dwDataLen : UInt32
    property pbData : UInt8*
    def initialize(@pwszMIMEType : Win32cr::Foundation::PWSTR, @bPictureType : UInt8, @pwszDescription : Win32cr::Foundation::PWSTR, @dwDataLen : UInt32, @pbData : UInt8*)
    end
  end

  @[Extern]
  struct WM_SYNCHRONISED_LYRICS
    property bTimeStampFormat : UInt8
    property bContentType : UInt8
    property pwszContentDescriptor : Win32cr::Foundation::PWSTR
    property dwLyricsLen : UInt32
    property pbLyrics : UInt8*
    def initialize(@bTimeStampFormat : UInt8, @bContentType : UInt8, @pwszContentDescriptor : Win32cr::Foundation::PWSTR, @dwLyricsLen : UInt32, @pbLyrics : UInt8*)
    end
  end

  @[Extern]
  struct WM_USER_WEB_URL
    property pwszDescription : Win32cr::Foundation::PWSTR
    property pwszURL : Win32cr::Foundation::PWSTR
    def initialize(@pwszDescription : Win32cr::Foundation::PWSTR, @pwszURL : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WM_USER_TEXT
    property pwszDescription : Win32cr::Foundation::PWSTR
    property pwszText : Win32cr::Foundation::PWSTR
    def initialize(@pwszDescription : Win32cr::Foundation::PWSTR, @pwszText : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WM_LEAKY_BUCKET_PAIR
    property dwBitrate : UInt32
    property msBufferWindow : UInt32
    def initialize(@dwBitrate : UInt32, @msBufferWindow : UInt32)
    end
  end

  @[Extern]
  struct WM_STREAM_TYPE_INFO
    property guidMajorType : LibC::GUID
    property cbFormat : UInt32
    def initialize(@guidMajorType : LibC::GUID, @cbFormat : UInt32)
    end
  end

  @[Extern]
  struct WMT_WATERMARK_ENTRY
    property wmetType : Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY_TYPE
    property clsid : LibC::GUID
    property cbDisplayName : UInt32
    property pwszDisplayName : Win32cr::Foundation::PWSTR
    def initialize(@wmetType : Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY_TYPE, @clsid : LibC::GUID, @cbDisplayName : UInt32, @pwszDisplayName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WMT_VIDEOIMAGE_SAMPLE
    property dwMagic : UInt32
    property cbStruct : UInt32
    property dwControlFlags : UInt32
    property dwInputFlagsCur : UInt32
    property lCurMotionXtoX : Int32
    property lCurMotionYtoX : Int32
    property lCurMotionXoffset : Int32
    property lCurMotionXtoY : Int32
    property lCurMotionYtoY : Int32
    property lCurMotionYoffset : Int32
    property lCurBlendCoef1 : Int32
    property lCurBlendCoef2 : Int32
    property dwInputFlagsPrev : UInt32
    property lPrevMotionXtoX : Int32
    property lPrevMotionYtoX : Int32
    property lPrevMotionXoffset : Int32
    property lPrevMotionXtoY : Int32
    property lPrevMotionYtoY : Int32
    property lPrevMotionYoffset : Int32
    property lPrevBlendCoef1 : Int32
    property lPrevBlendCoef2 : Int32
    def initialize(@dwMagic : UInt32, @cbStruct : UInt32, @dwControlFlags : UInt32, @dwInputFlagsCur : UInt32, @lCurMotionXtoX : Int32, @lCurMotionYtoX : Int32, @lCurMotionXoffset : Int32, @lCurMotionXtoY : Int32, @lCurMotionYtoY : Int32, @lCurMotionYoffset : Int32, @lCurBlendCoef1 : Int32, @lCurBlendCoef2 : Int32, @dwInputFlagsPrev : UInt32, @lPrevMotionXtoX : Int32, @lPrevMotionYtoX : Int32, @lPrevMotionXoffset : Int32, @lPrevMotionXtoY : Int32, @lPrevMotionYtoY : Int32, @lPrevMotionYoffset : Int32, @lPrevBlendCoef1 : Int32, @lPrevBlendCoef2 : Int32)
    end
  end

  @[Extern]
  struct WMT_VIDEOIMAGE_SAMPLE2
    property dwMagic : UInt32
    property dwStructSize : UInt32
    property dwControlFlags : UInt32
    property dwViewportWidth : UInt32
    property dwViewportHeight : UInt32
    property dwCurrImageWidth : UInt32
    property dwCurrImageHeight : UInt32
    property fCurrRegionX0 : Float32
    property fCurrRegionY0 : Float32
    property fCurrRegionWidth : Float32
    property fCurrRegionHeight : Float32
    property fCurrBlendCoef : Float32
    property dwPrevImageWidth : UInt32
    property dwPrevImageHeight : UInt32
    property fPrevRegionX0 : Float32
    property fPrevRegionY0 : Float32
    property fPrevRegionWidth : Float32
    property fPrevRegionHeight : Float32
    property fPrevBlendCoef : Float32
    property dwEffectType : UInt32
    property dwNumEffectParas : UInt32
    property fEffectPara0 : Float32
    property fEffectPara1 : Float32
    property fEffectPara2 : Float32
    property fEffectPara3 : Float32
    property fEffectPara4 : Float32
    property bKeepPrevImage : Win32cr::Foundation::BOOL
    def initialize(@dwMagic : UInt32, @dwStructSize : UInt32, @dwControlFlags : UInt32, @dwViewportWidth : UInt32, @dwViewportHeight : UInt32, @dwCurrImageWidth : UInt32, @dwCurrImageHeight : UInt32, @fCurrRegionX0 : Float32, @fCurrRegionY0 : Float32, @fCurrRegionWidth : Float32, @fCurrRegionHeight : Float32, @fCurrBlendCoef : Float32, @dwPrevImageWidth : UInt32, @dwPrevImageHeight : UInt32, @fPrevRegionX0 : Float32, @fPrevRegionY0 : Float32, @fPrevRegionWidth : Float32, @fPrevRegionHeight : Float32, @fPrevBlendCoef : Float32, @dwEffectType : UInt32, @dwNumEffectParas : UInt32, @fEffectPara0 : Float32, @fEffectPara1 : Float32, @fEffectPara2 : Float32, @fEffectPara3 : Float32, @fEffectPara4 : Float32, @bKeepPrevImage : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WM_MEDIA_TYPE
    property majortype : LibC::GUID
    property subtype : LibC::GUID
    property bFixedSizeSamples : Win32cr::Foundation::BOOL
    property bTemporalCompression : Win32cr::Foundation::BOOL
    property lSampleSize : UInt32
    property formattype : LibC::GUID
    property pUnk : Void*
    property cbFormat : UInt32
    property pbFormat : UInt8*
    def initialize(@majortype : LibC::GUID, @subtype : LibC::GUID, @bFixedSizeSamples : Win32cr::Foundation::BOOL, @bTemporalCompression : Win32cr::Foundation::BOOL, @lSampleSize : UInt32, @formattype : LibC::GUID, @pUnk : Void*, @cbFormat : UInt32, @pbFormat : UInt8*)
    end
  end

  @[Extern]
  struct WMVIDEOINFOHEADER
    property rcSource : Win32cr::Foundation::RECT
    property rcTarget : Win32cr::Foundation::RECT
    property dwBitRate : UInt32
    property dwBitErrorRate : UInt32
    property avg_time_per_frame : Int64
    property bmiHeader : Win32cr::Graphics::Gdi::BITMAPINFOHEADER
    def initialize(@rcSource : Win32cr::Foundation::RECT, @rcTarget : Win32cr::Foundation::RECT, @dwBitRate : UInt32, @dwBitErrorRate : UInt32, @avg_time_per_frame : Int64, @bmiHeader : Win32cr::Graphics::Gdi::BITMAPINFOHEADER)
    end
  end

  @[Extern]
  struct WMVIDEOINFOHEADER2
    property rcSource : Win32cr::Foundation::RECT
    property rcTarget : Win32cr::Foundation::RECT
    property dwBitRate : UInt32
    property dwBitErrorRate : UInt32
    property avg_time_per_frame : Int64
    property dwInterlaceFlags : UInt32
    property dwCopyProtectFlags : UInt32
    property dwPictAspectRatioX : UInt32
    property dwPictAspectRatioY : UInt32
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    property bmiHeader : Win32cr::Graphics::Gdi::BITMAPINFOHEADER
    def initialize(@rcSource : Win32cr::Foundation::RECT, @rcTarget : Win32cr::Foundation::RECT, @dwBitRate : UInt32, @dwBitErrorRate : UInt32, @avg_time_per_frame : Int64, @dwInterlaceFlags : UInt32, @dwCopyProtectFlags : UInt32, @dwPictAspectRatioX : UInt32, @dwPictAspectRatioY : UInt32, @dwReserved1 : UInt32, @dwReserved2 : UInt32, @bmiHeader : Win32cr::Graphics::Gdi::BITMAPINFOHEADER)
    end
  end

  @[Extern]
  struct WMMPEG2VIDEOINFO
    property hdr : Win32cr::Media::WindowsMediaFormat::WMVIDEOINFOHEADER2
    property dwStartTimeCode : UInt32
    property cbSequenceHeader : UInt32
    property dwProfile : UInt32
    property dwLevel : UInt32
    property dwFlags : UInt32
    property dwSequenceHeader : UInt32*
    def initialize(@hdr : Win32cr::Media::WindowsMediaFormat::WMVIDEOINFOHEADER2, @dwStartTimeCode : UInt32, @cbSequenceHeader : UInt32, @dwProfile : UInt32, @dwLevel : UInt32, @dwFlags : UInt32, @dwSequenceHeader : UInt32*)
    end
  end

  @[Extern]
  struct WMSCRIPTFORMAT
    property scriptType : LibC::GUID
    def initialize(@scriptType : LibC::GUID)
    end
  end

  @[Extern]
  struct WMT_COLORSPACEINFO_EXTENSION_DATA
    property ucColorPrimaries : UInt8
    property ucColorTransferChar : UInt8
    property ucColorMatrixCoef : UInt8
    def initialize(@ucColorPrimaries : UInt8, @ucColorTransferChar : UInt8, @ucColorMatrixCoef : UInt8)
    end
  end

  @[Extern]
  struct WMT_TIMECODE_EXTENSION_DATA
    property wRange : UInt16
    property dwTimecode : UInt32
    property dwUserbits : UInt32
    property dwAmFlags : UInt32
    def initialize(@wRange : UInt16, @dwTimecode : UInt32, @dwUserbits : UInt32, @dwAmFlags : UInt32)
    end
  end

  @[Extern]
  struct DRM_VAL16
    property val : UInt8[16]
    def initialize(@val : UInt8[16])
    end
  end

  @[Extern]
  struct WMDRM_IMPORT_INIT_STRUCT
    property dwVersion : UInt32
    property cbEncryptedSessionKeyMessage : UInt32
    property pbEncryptedSessionKeyMessage : UInt8*
    property cbEncryptedKeyMessage : UInt32
    property pbEncryptedKeyMessage : UInt8*
    def initialize(@dwVersion : UInt32, @cbEncryptedSessionKeyMessage : UInt32, @pbEncryptedSessionKeyMessage : UInt8*, @cbEncryptedKeyMessage : UInt32, @pbEncryptedKeyMessage : UInt8*)
    end
  end

  @[Extern]
  struct DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS
    property wCompressedDigitalVideo : UInt16
    property wUncompressedDigitalVideo : UInt16
    property wAnalogVideo : UInt16
    property wCompressedDigitalAudio : UInt16
    property wUncompressedDigitalAudio : UInt16
    def initialize(@wCompressedDigitalVideo : UInt16, @wUncompressedDigitalVideo : UInt16, @wAnalogVideo : UInt16, @wCompressedDigitalAudio : UInt16, @wUncompressedDigitalAudio : UInt16)
    end
  end

  @[Extern]
  struct DRM_OPL_OUTPUT_IDS
    property cIds : UInt16
    property rgIds : LibC::GUID*
    def initialize(@cIds : UInt16, @rgIds : LibC::GUID*)
    end
  end

  @[Extern]
  struct DRM_OUTPUT_PROTECTION
    property guidId : LibC::GUID
    property bConfigData : UInt8
    def initialize(@guidId : LibC::GUID, @bConfigData : UInt8)
    end
  end

  @[Extern]
  struct DRM_VIDEO_OUTPUT_PROTECTION_IDS
    property cEntries : UInt16
    property rgVop : Win32cr::Media::WindowsMediaFormat::DRM_OUTPUT_PROTECTION*
    def initialize(@cEntries : UInt16, @rgVop : Win32cr::Media::WindowsMediaFormat::DRM_OUTPUT_PROTECTION*)
    end
  end

  @[Extern]
  struct DRM_PLAY_OPL
    property minOPL : Win32cr::Media::WindowsMediaFormat::DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS
    property oplIdReserved : Win32cr::Media::WindowsMediaFormat::DRM_OPL_OUTPUT_IDS
    property vopi : Win32cr::Media::WindowsMediaFormat::DRM_VIDEO_OUTPUT_PROTECTION_IDS
    def initialize(@minOPL : Win32cr::Media::WindowsMediaFormat::DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS, @oplIdReserved : Win32cr::Media::WindowsMediaFormat::DRM_OPL_OUTPUT_IDS, @vopi : Win32cr::Media::WindowsMediaFormat::DRM_VIDEO_OUTPUT_PROTECTION_IDS)
    end
  end

  @[Extern]
  struct DRM_COPY_OPL
    property wMinimumCopyLevel : UInt16
    property oplIdIncludes : Win32cr::Media::WindowsMediaFormat::DRM_OPL_OUTPUT_IDS
    property oplIdExcludes : Win32cr::Media::WindowsMediaFormat::DRM_OPL_OUTPUT_IDS
    def initialize(@wMinimumCopyLevel : UInt16, @oplIdIncludes : Win32cr::Media::WindowsMediaFormat::DRM_OPL_OUTPUT_IDS, @oplIdExcludes : Win32cr::Media::WindowsMediaFormat::DRM_OPL_OUTPUT_IDS)
    end
  end

  @[Extern]
  record INSSBufferVtbl,
    query_interface : Proc(INSSBuffer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INSSBuffer*, UInt32),
    release : Proc(INSSBuffer*, UInt32),
    get_length : Proc(INSSBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    set_length : Proc(INSSBuffer*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_length : Proc(INSSBuffer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(INSSBuffer*, UInt8**, Win32cr::Foundation::HRESULT),
    get_buffer_and_length : Proc(INSSBuffer*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INSSBuffer, lpVtbl : INSSBufferVtbl* do
    GUID = LibC::GUID.new(0xe1cd3524_u32, 0x3d7_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xed_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd2_u8, 0xd7_u8, 0xcf_u8])
    def query_interface(this : INSSBuffer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INSSBuffer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INSSBuffer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_length(this : INSSBuffer*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_length.call(this, pdwLength)
    end
    def set_length(this : INSSBuffer*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_length.call(this, dwLength)
    end
    def get_max_length(this : INSSBuffer*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_length.call(this, pdwLength)
    end
    def get_buffer(this : INSSBuffer*, ppdwBuffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, ppdwBuffer)
    end
    def get_buffer_and_length(this : INSSBuffer*, ppdwBuffer : UInt8**, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_and_length.call(this, ppdwBuffer, pdwLength)
    end

  end

  @[Extern]
  record INSSBuffer2Vtbl,
    query_interface : Proc(INSSBuffer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INSSBuffer2*, UInt32),
    release : Proc(INSSBuffer2*, UInt32),
    get_length : Proc(INSSBuffer2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_length : Proc(INSSBuffer2*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_length : Proc(INSSBuffer2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(INSSBuffer2*, UInt8**, Win32cr::Foundation::HRESULT),
    get_buffer_and_length : Proc(INSSBuffer2*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_sample_properties : Proc(INSSBuffer2*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    set_sample_properties : Proc(INSSBuffer2*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INSSBuffer2, lpVtbl : INSSBuffer2Vtbl* do
    GUID = LibC::GUID.new(0x4f528693_u32, 0x1035_u16, 0x43fe_u16, StaticArray[0xb4_u8, 0x28_u8, 0x75_u8, 0x75_u8, 0x61_u8, 0xad_u8, 0x3a_u8, 0x68_u8])
    def query_interface(this : INSSBuffer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INSSBuffer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INSSBuffer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_length(this : INSSBuffer2*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_length.call(this, pdwLength)
    end
    def set_length(this : INSSBuffer2*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_length.call(this, dwLength)
    end
    def get_max_length(this : INSSBuffer2*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_length.call(this, pdwLength)
    end
    def get_buffer(this : INSSBuffer2*, ppdwBuffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, ppdwBuffer)
    end
    def get_buffer_and_length(this : INSSBuffer2*, ppdwBuffer : UInt8**, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_and_length.call(this, ppdwBuffer, pdwLength)
    end
    def get_sample_properties(this : INSSBuffer2*, cbProperties : UInt32, pbProperties : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sample_properties.call(this, cbProperties, pbProperties)
    end
    def set_sample_properties(this : INSSBuffer2*, cbProperties : UInt32, pbProperties : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sample_properties.call(this, cbProperties, pbProperties)
    end

  end

  @[Extern]
  record INSSBuffer3Vtbl,
    query_interface : Proc(INSSBuffer3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INSSBuffer3*, UInt32),
    release : Proc(INSSBuffer3*, UInt32),
    get_length : Proc(INSSBuffer3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_length : Proc(INSSBuffer3*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_length : Proc(INSSBuffer3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(INSSBuffer3*, UInt8**, Win32cr::Foundation::HRESULT),
    get_buffer_and_length : Proc(INSSBuffer3*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_sample_properties : Proc(INSSBuffer3*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    set_sample_properties : Proc(INSSBuffer3*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    set_property : Proc(INSSBuffer3*, LibC::GUID, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_property : Proc(INSSBuffer3*, LibC::GUID, Void*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INSSBuffer3, lpVtbl : INSSBuffer3Vtbl* do
    GUID = LibC::GUID.new(0xc87ceaaf_u32, 0x75be_u16, 0x4bc4_u16, StaticArray[0x84_u8, 0xeb_u8, 0xac_u8, 0x27_u8, 0x98_u8, 0x50_u8, 0x76_u8, 0x72_u8])
    def query_interface(this : INSSBuffer3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INSSBuffer3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INSSBuffer3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_length(this : INSSBuffer3*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_length.call(this, pdwLength)
    end
    def set_length(this : INSSBuffer3*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_length.call(this, dwLength)
    end
    def get_max_length(this : INSSBuffer3*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_length.call(this, pdwLength)
    end
    def get_buffer(this : INSSBuffer3*, ppdwBuffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, ppdwBuffer)
    end
    def get_buffer_and_length(this : INSSBuffer3*, ppdwBuffer : UInt8**, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_and_length.call(this, ppdwBuffer, pdwLength)
    end
    def get_sample_properties(this : INSSBuffer3*, cbProperties : UInt32, pbProperties : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sample_properties.call(this, cbProperties, pbProperties)
    end
    def set_sample_properties(this : INSSBuffer3*, cbProperties : UInt32, pbProperties : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sample_properties.call(this, cbProperties, pbProperties)
    end
    def set_property(this : INSSBuffer3*, guidBufferProperty : LibC::GUID, pvBufferProperty : Void*, dwBufferPropertySize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, guidBufferProperty, pvBufferProperty, dwBufferPropertySize)
    end
    def get_property(this : INSSBuffer3*, guidBufferProperty : LibC::GUID, pvBufferProperty : Void*, pdwBufferPropertySize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, guidBufferProperty, pvBufferProperty, pdwBufferPropertySize)
    end

  end

  @[Extern]
  record INSSBuffer4Vtbl,
    query_interface : Proc(INSSBuffer4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INSSBuffer4*, UInt32),
    release : Proc(INSSBuffer4*, UInt32),
    get_length : Proc(INSSBuffer4*, UInt32*, Win32cr::Foundation::HRESULT),
    set_length : Proc(INSSBuffer4*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_length : Proc(INSSBuffer4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_buffer : Proc(INSSBuffer4*, UInt8**, Win32cr::Foundation::HRESULT),
    get_buffer_and_length : Proc(INSSBuffer4*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_sample_properties : Proc(INSSBuffer4*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    set_sample_properties : Proc(INSSBuffer4*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    set_property : Proc(INSSBuffer4*, LibC::GUID, Void*, UInt32, Win32cr::Foundation::HRESULT),
    get_property : Proc(INSSBuffer4*, LibC::GUID, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_count : Proc(INSSBuffer4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_by_index : Proc(INSSBuffer4*, UInt32, LibC::GUID*, Void*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INSSBuffer4, lpVtbl : INSSBuffer4Vtbl* do
    GUID = LibC::GUID.new(0xb6b8fd5a_u32, 0x32e2_u16, 0x49d4_u16, StaticArray[0xa9_u8, 0x10_u8, 0xc2_u8, 0x6c_u8, 0xc8_u8, 0x54_u8, 0x65_u8, 0xed_u8])
    def query_interface(this : INSSBuffer4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INSSBuffer4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INSSBuffer4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_length(this : INSSBuffer4*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_length.call(this, pdwLength)
    end
    def set_length(this : INSSBuffer4*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_length.call(this, dwLength)
    end
    def get_max_length(this : INSSBuffer4*, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_length.call(this, pdwLength)
    end
    def get_buffer(this : INSSBuffer4*, ppdwBuffer : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer.call(this, ppdwBuffer)
    end
    def get_buffer_and_length(this : INSSBuffer4*, ppdwBuffer : UInt8**, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_and_length.call(this, ppdwBuffer, pdwLength)
    end
    def get_sample_properties(this : INSSBuffer4*, cbProperties : UInt32, pbProperties : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sample_properties.call(this, cbProperties, pbProperties)
    end
    def set_sample_properties(this : INSSBuffer4*, cbProperties : UInt32, pbProperties : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sample_properties.call(this, cbProperties, pbProperties)
    end
    def set_property(this : INSSBuffer4*, guidBufferProperty : LibC::GUID, pvBufferProperty : Void*, dwBufferPropertySize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, guidBufferProperty, pvBufferProperty, dwBufferPropertySize)
    end
    def get_property(this : INSSBuffer4*, guidBufferProperty : LibC::GUID, pvBufferProperty : Void*, pdwBufferPropertySize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, guidBufferProperty, pvBufferProperty, pdwBufferPropertySize)
    end
    def get_property_count(this : INSSBuffer4*, pcBufferProperties : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_count.call(this, pcBufferProperties)
    end
    def get_property_by_index(this : INSSBuffer4*, dwBufferPropertyIndex : UInt32, pguidBufferProperty : LibC::GUID*, pvBufferProperty : Void*, pdwBufferPropertySize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_by_index.call(this, dwBufferPropertyIndex, pguidBufferProperty, pvBufferProperty, pdwBufferPropertySize)
    end

  end

  @[Extern]
  record IWMSBufferAllocatorVtbl,
    query_interface : Proc(IWMSBufferAllocator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSBufferAllocator*, UInt32),
    release : Proc(IWMSBufferAllocator*, UInt32),
    allocate_buffer : Proc(IWMSBufferAllocator*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    allocate_page_size_buffer : Proc(IWMSBufferAllocator*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSBufferAllocator, lpVtbl : IWMSBufferAllocatorVtbl* do
    GUID = LibC::GUID.new(0x61103ca4_u32, 0x2033_u16, 0x11d2_u16, StaticArray[0x9e_u8, 0xf1_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xd2_u8, 0xd7_u8, 0xcf_u8])
    def query_interface(this : IWMSBufferAllocator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSBufferAllocator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSBufferAllocator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def allocate_buffer(this : IWMSBufferAllocator*, dwMaxBufferSize : UInt32, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_buffer.call(this, dwMaxBufferSize, ppBuffer)
    end
    def allocate_page_size_buffer(this : IWMSBufferAllocator*, dwMaxBufferSize : UInt32, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_page_size_buffer.call(this, dwMaxBufferSize, ppBuffer)
    end

  end

  @[Extern]
  record IWMMediaPropsVtbl,
    query_interface : Proc(IWMMediaProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMMediaProps*, UInt32),
    release : Proc(IWMMediaProps*, UInt32),
    get_type : Proc(IWMMediaProps*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_media_type : Proc(IWMMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, UInt32*, Win32cr::Foundation::HRESULT),
    set_media_type : Proc(IWMMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMMediaProps, lpVtbl : IWMMediaPropsVtbl* do
    GUID = LibC::GUID.new(0x96406bce_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMMediaProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMMediaProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMMediaProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : IWMMediaProps*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def get_media_type(this : IWMMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, pcbType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_media_type.call(this, pType, pcbType)
    end
    def set_media_type(this : IWMMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_media_type.call(this, pType)
    end

  end

  @[Extern]
  record IWMVideoMediaPropsVtbl,
    query_interface : Proc(IWMVideoMediaProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMVideoMediaProps*, UInt32),
    release : Proc(IWMVideoMediaProps*, UInt32),
    get_type : Proc(IWMVideoMediaProps*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_media_type : Proc(IWMVideoMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, UInt32*, Win32cr::Foundation::HRESULT),
    set_media_type : Proc(IWMVideoMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    get_max_key_frame_spacing : Proc(IWMVideoMediaProps*, Int64*, Win32cr::Foundation::HRESULT),
    set_max_key_frame_spacing : Proc(IWMVideoMediaProps*, Int64, Win32cr::Foundation::HRESULT),
    get_quality : Proc(IWMVideoMediaProps*, UInt32*, Win32cr::Foundation::HRESULT),
    set_quality : Proc(IWMVideoMediaProps*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMVideoMediaProps, lpVtbl : IWMVideoMediaPropsVtbl* do
    GUID = LibC::GUID.new(0x96406bcf_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMVideoMediaProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMVideoMediaProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMVideoMediaProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : IWMVideoMediaProps*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def get_media_type(this : IWMVideoMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, pcbType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_media_type.call(this, pType, pcbType)
    end
    def set_media_type(this : IWMVideoMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_media_type.call(this, pType)
    end
    def get_max_key_frame_spacing(this : IWMVideoMediaProps*, pllTime : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_key_frame_spacing.call(this, pllTime)
    end
    def set_max_key_frame_spacing(this : IWMVideoMediaProps*, llTime : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_key_frame_spacing.call(this, llTime)
    end
    def get_quality(this : IWMVideoMediaProps*, pdwQuality : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_quality.call(this, pdwQuality)
    end
    def set_quality(this : IWMVideoMediaProps*, dwQuality : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_quality.call(this, dwQuality)
    end

  end

  @[Extern]
  record IWMWriterVtbl,
    query_interface : Proc(IWMWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriter*, UInt32),
    release : Proc(IWMWriter*, UInt32),
    set_profile_by_id : Proc(IWMWriter*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_profile : Proc(IWMWriter*, Void*, Win32cr::Foundation::HRESULT),
    set_output_filename : Proc(IWMWriter*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_input_count : Proc(IWMWriter*, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_props : Proc(IWMWriter*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_input_props : Proc(IWMWriter*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_input_format_count : Proc(IWMWriter*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_format : Proc(IWMWriter*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    begin_writing : Proc(IWMWriter*, Win32cr::Foundation::HRESULT),
    end_writing : Proc(IWMWriter*, Win32cr::Foundation::HRESULT),
    allocate_sample : Proc(IWMWriter*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    write_sample : Proc(IWMWriter*, UInt32, UInt64, UInt32, Void*, Win32cr::Foundation::HRESULT),
    flush : Proc(IWMWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriter, lpVtbl : IWMWriterVtbl* do
    GUID = LibC::GUID.new(0x96406bd4_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_profile_by_id(this : IWMWriter*, guidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profile_by_id.call(this, guidProfile)
    end
    def set_profile(this : IWMWriter*, pProfile : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_profile.call(this, pProfile)
    end
    def set_output_filename(this : IWMWriter*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filename.call(this, pwszFilename)
    end
    def get_input_count(this : IWMWriter*, pcInputs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_count.call(this, pcInputs)
    end
    def get_input_props(this : IWMWriter*, dwInputNum : UInt32, ppInput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_props.call(this, dwInputNum, ppInput)
    end
    def set_input_props(this : IWMWriter*, dwInputNum : UInt32, pInput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_props.call(this, dwInputNum, pInput)
    end
    def get_input_format_count(this : IWMWriter*, dwInputNumber : UInt32, pcFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_format_count.call(this, dwInputNumber, pcFormats)
    end
    def get_input_format(this : IWMWriter*, dwInputNumber : UInt32, dwFormatNumber : UInt32, pProps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_format.call(this, dwInputNumber, dwFormatNumber, pProps)
    end
    def begin_writing(this : IWMWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_writing.call(this)
    end
    def end_writing(this : IWMWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_writing.call(this)
    end
    def allocate_sample(this : IWMWriter*, dwSampleSize : UInt32, ppSample : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_sample.call(this, dwSampleSize, ppSample)
    end
    def write_sample(this : IWMWriter*, dwInputNum : UInt32, cnsSampleTime : UInt64, dwFlags : UInt32, pSample : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_sample.call(this, dwInputNum, cnsSampleTime, dwFlags, pSample)
    end
    def flush(this : IWMWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end

  end

  @[Extern]
  record IWMDRMWriterVtbl,
    query_interface : Proc(IWMDRMWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMWriter*, UInt32),
    release : Proc(IWMDRMWriter*, UInt32),
    generate_key_seed : Proc(IWMDRMWriter*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    generate_key_id : Proc(IWMDRMWriter*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    generate_signing_key_pair : Proc(IWMDRMWriter*, UInt16*, UInt32*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_drm_attribute : Proc(IWMDRMWriter*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMWriter, lpVtbl : IWMDRMWriterVtbl* do
    GUID = LibC::GUID.new(0xd6ea5dd0_u32, 0x12a0_u16, 0x43f4_u16, StaticArray[0x90_u8, 0xab_u8, 0xa3_u8, 0xfd_u8, 0x45_u8, 0x1e_u8, 0x6a_u8, 0x7_u8])
    def query_interface(this : IWMDRMWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def generate_key_seed(this : IWMDRMWriter*, pwszKeySeed : UInt16*, pcwchLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_key_seed.call(this, pwszKeySeed, pcwchLength)
    end
    def generate_key_id(this : IWMDRMWriter*, pwszKeyID : UInt16*, pcwchLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_key_id.call(this, pwszKeyID, pcwchLength)
    end
    def generate_signing_key_pair(this : IWMDRMWriter*, pwszPrivKey : UInt16*, pcwchPrivKeyLength : UInt32*, pwszPubKey : UInt16*, pcwchPubKeyLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_signing_key_pair.call(this, pwszPrivKey, pcwchPrivKeyLength, pwszPubKey, pcwchPubKeyLength)
    end
    def set_drm_attribute(this : IWMDRMWriter*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drm_attribute.call(this, wStreamNum, pszName, type__, pValue, cbLength)
    end

  end

  @[Extern]
  record IWMDRMWriter2Vtbl,
    query_interface : Proc(IWMDRMWriter2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMWriter2*, UInt32),
    release : Proc(IWMDRMWriter2*, UInt32),
    generate_key_seed : Proc(IWMDRMWriter2*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    generate_key_id : Proc(IWMDRMWriter2*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    generate_signing_key_pair : Proc(IWMDRMWriter2*, UInt16*, UInt32*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_drm_attribute : Proc(IWMDRMWriter2*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    set_wmdrm_net_encryption : Proc(IWMDRMWriter2*, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMWriter2, lpVtbl : IWMDRMWriter2Vtbl* do
    GUID = LibC::GUID.new(0x38ee7a94_u32, 0x40e2_u16, 0x4e10_u16, StaticArray[0xaa_u8, 0x3f_u8, 0x33_u8, 0xfd_u8, 0x32_u8, 0x10_u8, 0xed_u8, 0x5b_u8])
    def query_interface(this : IWMDRMWriter2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMWriter2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMWriter2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def generate_key_seed(this : IWMDRMWriter2*, pwszKeySeed : UInt16*, pcwchLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_key_seed.call(this, pwszKeySeed, pcwchLength)
    end
    def generate_key_id(this : IWMDRMWriter2*, pwszKeyID : UInt16*, pcwchLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_key_id.call(this, pwszKeyID, pcwchLength)
    end
    def generate_signing_key_pair(this : IWMDRMWriter2*, pwszPrivKey : UInt16*, pcwchPrivKeyLength : UInt32*, pwszPubKey : UInt16*, pcwchPubKeyLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_signing_key_pair.call(this, pwszPrivKey, pcwchPrivKeyLength, pwszPubKey, pcwchPubKeyLength)
    end
    def set_drm_attribute(this : IWMDRMWriter2*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drm_attribute.call(this, wStreamNum, pszName, type__, pValue, cbLength)
    end
    def set_wmdrm_net_encryption(this : IWMDRMWriter2*, fSamplesEncrypted : Win32cr::Foundation::BOOL, pbKeyID : UInt8*, cbKeyID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wmdrm_net_encryption.call(this, fSamplesEncrypted, pbKeyID, cbKeyID)
    end

  end

  @[Extern]
  record IWMDRMWriter3Vtbl,
    query_interface : Proc(IWMDRMWriter3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMWriter3*, UInt32),
    release : Proc(IWMDRMWriter3*, UInt32),
    generate_key_seed : Proc(IWMDRMWriter3*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    generate_key_id : Proc(IWMDRMWriter3*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    generate_signing_key_pair : Proc(IWMDRMWriter3*, UInt16*, UInt32*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_drm_attribute : Proc(IWMDRMWriter3*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    set_wmdrm_net_encryption : Proc(IWMDRMWriter3*, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_protect_stream_samples : Proc(IWMDRMWriter3*, Win32cr::Media::WindowsMediaFormat::WMDRM_IMPORT_INIT_STRUCT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMWriter3, lpVtbl : IWMDRMWriter3Vtbl* do
    GUID = LibC::GUID.new(0xa7184082_u32, 0xa4aa_u16, 0x4dde_u16, StaticArray[0xac_u8, 0x9c_u8, 0xe7_u8, 0x5d_u8, 0xbd_u8, 0x11_u8, 0x17_u8, 0xce_u8])
    def query_interface(this : IWMDRMWriter3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMWriter3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMWriter3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def generate_key_seed(this : IWMDRMWriter3*, pwszKeySeed : UInt16*, pcwchLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_key_seed.call(this, pwszKeySeed, pcwchLength)
    end
    def generate_key_id(this : IWMDRMWriter3*, pwszKeyID : UInt16*, pcwchLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_key_id.call(this, pwszKeyID, pcwchLength)
    end
    def generate_signing_key_pair(this : IWMDRMWriter3*, pwszPrivKey : UInt16*, pcwchPrivKeyLength : UInt32*, pwszPubKey : UInt16*, pcwchPubKeyLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.generate_signing_key_pair.call(this, pwszPrivKey, pcwchPrivKeyLength, pwszPubKey, pcwchPubKeyLength)
    end
    def set_drm_attribute(this : IWMDRMWriter3*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drm_attribute.call(this, wStreamNum, pszName, type__, pValue, cbLength)
    end
    def set_wmdrm_net_encryption(this : IWMDRMWriter3*, fSamplesEncrypted : Win32cr::Foundation::BOOL, pbKeyID : UInt8*, cbKeyID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wmdrm_net_encryption.call(this, fSamplesEncrypted, pbKeyID, cbKeyID)
    end
    def set_protect_stream_samples(this : IWMDRMWriter3*, pImportInitStruct : Win32cr::Media::WindowsMediaFormat::WMDRM_IMPORT_INIT_STRUCT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_protect_stream_samples.call(this, pImportInitStruct)
    end

  end

  @[Extern]
  record IWMInputMediaPropsVtbl,
    query_interface : Proc(IWMInputMediaProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMInputMediaProps*, UInt32),
    release : Proc(IWMInputMediaProps*, UInt32),
    get_type : Proc(IWMInputMediaProps*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_media_type : Proc(IWMInputMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, UInt32*, Win32cr::Foundation::HRESULT),
    set_media_type : Proc(IWMInputMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    get_connection_name : Proc(IWMInputMediaProps*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    get_group_name : Proc(IWMInputMediaProps*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMInputMediaProps, lpVtbl : IWMInputMediaPropsVtbl* do
    GUID = LibC::GUID.new(0x96406bd5_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMInputMediaProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMInputMediaProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMInputMediaProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : IWMInputMediaProps*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def get_media_type(this : IWMInputMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, pcbType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_media_type.call(this, pType, pcbType)
    end
    def set_media_type(this : IWMInputMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_media_type.call(this, pType)
    end
    def get_connection_name(this : IWMInputMediaProps*, pwszName : UInt16*, pcchName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_name.call(this, pwszName, pcchName)
    end
    def get_group_name(this : IWMInputMediaProps*, pwszName : UInt16*, pcchName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_group_name.call(this, pwszName, pcchName)
    end

  end

  @[Extern]
  record IWMPropertyVaultVtbl,
    query_interface : Proc(IWMPropertyVault*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMPropertyVault*, UInt32),
    release : Proc(IWMPropertyVault*, UInt32),
    get_property_count : Proc(IWMPropertyVault*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_by_name : Proc(IWMPropertyVault*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_property : Proc(IWMPropertyVault*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_property_by_index : Proc(IWMPropertyVault*, UInt32, UInt16*, UInt32*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    copy_properties_from : Proc(IWMPropertyVault*, Void*, Win32cr::Foundation::HRESULT),
    clear : Proc(IWMPropertyVault*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMPropertyVault, lpVtbl : IWMPropertyVaultVtbl* do
    GUID = LibC::GUID.new(0x72995a79_u32, 0x5090_u16, 0x42a4_u16, StaticArray[0x9c_u8, 0x8c_u8, 0xd9_u8, 0xd0_u8, 0xb6_u8, 0xd3_u8, 0x4b_u8, 0xe5_u8])
    def query_interface(this : IWMPropertyVault*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMPropertyVault*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMPropertyVault*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property_count(this : IWMPropertyVault*, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_count.call(this, pdwCount)
    end
    def get_property_by_name(this : IWMPropertyVault*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_by_name.call(this, pszName, pType, pValue, pdwSize)
    end
    def set_property(this : IWMPropertyVault*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, dwSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, pszName, pType, pValue, dwSize)
    end
    def get_property_by_index(this : IWMPropertyVault*, dwIndex : UInt32, pszName : UInt16*, pdwNameLen : UInt32*, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_by_index.call(this, dwIndex, pszName, pdwNameLen, pType, pValue, pdwSize)
    end
    def copy_properties_from(this : IWMPropertyVault*, pIWMPropertyVault : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_properties_from.call(this, pIWMPropertyVault)
    end
    def clear(this : IWMPropertyVault*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IWMIStreamPropsVtbl,
    query_interface : Proc(IWMIStreamProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMIStreamProps*, UInt32),
    release : Proc(IWMIStreamProps*, UInt32),
    get_property : Proc(IWMIStreamProps*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMIStreamProps, lpVtbl : IWMIStreamPropsVtbl* do
    GUID = LibC::GUID.new(0x6816dad3_u32, 0x2b4b_u16, 0x4c8e_u16, StaticArray[0x81_u8, 0x49_u8, 0x87_u8, 0x4c_u8, 0x34_u8, 0x83_u8, 0xa7_u8, 0x53_u8])
    def query_interface(this : IWMIStreamProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMIStreamProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMIStreamProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property(this : IWMIStreamProps*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, pszName, pType, pValue, pdwSize)
    end

  end

  @[Extern]
  record IWMReaderVtbl,
    query_interface : Proc(IWMReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReader*, UInt32),
    release : Proc(IWMReader*, UInt32),
    open : Proc(IWMReader*, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMReader*, Win32cr::Foundation::HRESULT),
    get_output_count : Proc(IWMReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_props : Proc(IWMReader*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_output_props : Proc(IWMReader*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_output_format_count : Proc(IWMReader*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_format : Proc(IWMReader*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    start : Proc(IWMReader*, UInt64, UInt64, Float32, Void*, Win32cr::Foundation::HRESULT),
    stop : Proc(IWMReader*, Win32cr::Foundation::HRESULT),
    pause : Proc(IWMReader*, Win32cr::Foundation::HRESULT),
    resume : Proc(IWMReader*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReader, lpVtbl : IWMReaderVtbl* do
    GUID = LibC::GUID.new(0x96406bd6_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IWMReader*, pwszURL : Win32cr::Foundation::PWSTR, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszURL, pCallback, pvContext)
    end
    def close(this : IWMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def get_output_count(this : IWMReader*, pcOutputs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_count.call(this, pcOutputs)
    end
    def get_output_props(this : IWMReader*, dwOutputNum : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_props.call(this, dwOutputNum, ppOutput)
    end
    def set_output_props(this : IWMReader*, dwOutputNum : UInt32, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_props.call(this, dwOutputNum, pOutput)
    end
    def get_output_format_count(this : IWMReader*, dwOutputNumber : UInt32, pcFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_format_count.call(this, dwOutputNumber, pcFormats)
    end
    def get_output_format(this : IWMReader*, dwOutputNumber : UInt32, dwFormatNumber : UInt32, ppProps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_format.call(this, dwOutputNumber, dwFormatNumber, ppProps)
    end
    def start(this : IWMReader*, cnsStart : UInt64, cnsDuration : UInt64, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, cnsStart, cnsDuration, fRate, pvContext)
    end
    def stop(this : IWMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def pause(this : IWMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IWMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end

  end

  @[Extern]
  record IWMSyncReaderVtbl,
    query_interface : Proc(IWMSyncReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSyncReader*, UInt32),
    release : Proc(IWMSyncReader*, UInt32),
    open : Proc(IWMSyncReader*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IWMSyncReader*, Win32cr::Foundation::HRESULT),
    set_range : Proc(IWMSyncReader*, UInt64, Int64, Win32cr::Foundation::HRESULT),
    set_range_by_frame : Proc(IWMSyncReader*, UInt16, UInt64, Int64, Win32cr::Foundation::HRESULT),
    get_next_sample : Proc(IWMSyncReader*, UInt16, Void**, UInt64*, UInt64*, UInt32*, UInt32*, UInt16*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMSyncReader*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMSyncReader*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_read_stream_samples : Proc(IWMSyncReader*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_read_stream_samples : Proc(IWMSyncReader*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMSyncReader*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMSyncReader*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_output_count : Proc(IWMSyncReader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_props : Proc(IWMSyncReader*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_output_props : Proc(IWMSyncReader*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_output_format_count : Proc(IWMSyncReader*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_format : Proc(IWMSyncReader*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_output_number_for_stream : Proc(IWMSyncReader*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    get_stream_number_for_output : Proc(IWMSyncReader*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMSyncReader*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMSyncReader*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMSyncReader*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSyncReader, lpVtbl : IWMSyncReaderVtbl* do
    GUID = LibC::GUID.new(0x9397f121_u32, 0x7705_u16, 0x4dc9_u16, StaticArray[0xb0_u8, 0x49_u8, 0x98_u8, 0xb6_u8, 0x98_u8, 0x18_u8, 0x84_u8, 0x14_u8])
    def query_interface(this : IWMSyncReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSyncReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSyncReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IWMSyncReader*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end
    def close(this : IWMSyncReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def set_range(this : IWMSyncReader*, cnsStartTime : UInt64, cnsDuration : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range.call(this, cnsStartTime, cnsDuration)
    end
    def set_range_by_frame(this : IWMSyncReader*, wStreamNum : UInt16, qwFrameNumber : UInt64, cFramesToRead : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range_by_frame.call(this, wStreamNum, qwFrameNumber, cFramesToRead)
    end
    def get_next_sample(this : IWMSyncReader*, wStreamNum : UInt16, ppSample : Void**, pcnsSampleTime : UInt64*, pcnsDuration : UInt64*, pdwFlags : UInt32*, pdwOutputNum : UInt32*, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_sample.call(this, wStreamNum, ppSample, pcnsSampleTime, pcnsDuration, pdwFlags, pdwOutputNum, pwStreamNum)
    end
    def set_streams_selected(this : IWMSyncReader*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMSyncReader*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_read_stream_samples(this : IWMSyncReader*, wStreamNum : UInt16, fCompressed : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_read_stream_samples.call(this, wStreamNum, fCompressed)
    end
    def get_read_stream_samples(this : IWMSyncReader*, wStreamNum : UInt16, pfCompressed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_read_stream_samples.call(this, wStreamNum, pfCompressed)
    end
    def get_output_setting(this : IWMSyncReader*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMSyncReader*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def get_output_count(this : IWMSyncReader*, pcOutputs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_count.call(this, pcOutputs)
    end
    def get_output_props(this : IWMSyncReader*, dwOutputNum : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_props.call(this, dwOutputNum, ppOutput)
    end
    def set_output_props(this : IWMSyncReader*, dwOutputNum : UInt32, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_props.call(this, dwOutputNum, pOutput)
    end
    def get_output_format_count(this : IWMSyncReader*, dwOutputNum : UInt32, pcFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_format_count.call(this, dwOutputNum, pcFormats)
    end
    def get_output_format(this : IWMSyncReader*, dwOutputNum : UInt32, dwFormatNum : UInt32, ppProps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_format.call(this, dwOutputNum, dwFormatNum, ppProps)
    end
    def get_output_number_for_stream(this : IWMSyncReader*, wStreamNum : UInt16, pdwOutputNum : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_number_for_stream.call(this, wStreamNum, pdwOutputNum)
    end
    def get_stream_number_for_output(this : IWMSyncReader*, dwOutputNum : UInt32, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_number_for_output.call(this, dwOutputNum, pwStreamNum)
    end
    def get_max_output_sample_size(this : IWMSyncReader*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMSyncReader*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def open_stream(this : IWMSyncReader*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream)
    end

  end

  @[Extern]
  record IWMSyncReader2Vtbl,
    query_interface : Proc(IWMSyncReader2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSyncReader2*, UInt32),
    release : Proc(IWMSyncReader2*, UInt32),
    open : Proc(IWMSyncReader2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IWMSyncReader2*, Win32cr::Foundation::HRESULT),
    set_range : Proc(IWMSyncReader2*, UInt64, Int64, Win32cr::Foundation::HRESULT),
    set_range_by_frame : Proc(IWMSyncReader2*, UInt16, UInt64, Int64, Win32cr::Foundation::HRESULT),
    get_next_sample : Proc(IWMSyncReader2*, UInt16, Void**, UInt64*, UInt64*, UInt32*, UInt32*, UInt16*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMSyncReader2*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMSyncReader2*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_read_stream_samples : Proc(IWMSyncReader2*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_read_stream_samples : Proc(IWMSyncReader2*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMSyncReader2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMSyncReader2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_output_count : Proc(IWMSyncReader2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_props : Proc(IWMSyncReader2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_output_props : Proc(IWMSyncReader2*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_output_format_count : Proc(IWMSyncReader2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_output_format : Proc(IWMSyncReader2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_output_number_for_stream : Proc(IWMSyncReader2*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    get_stream_number_for_output : Proc(IWMSyncReader2*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMSyncReader2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMSyncReader2*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMSyncReader2*, Void*, Win32cr::Foundation::HRESULT),
    set_range_by_timecode : Proc(IWMSyncReader2*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_TIMECODE_EXTENSION_DATA*, Win32cr::Media::WindowsMediaFormat::WMT_TIMECODE_EXTENSION_DATA*, Win32cr::Foundation::HRESULT),
    set_range_by_frame_ex : Proc(IWMSyncReader2*, UInt16, UInt64, Int64, UInt64*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMSyncReader2*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMSyncReader2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMSyncReader2*, UInt16, Void*, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMSyncReader2*, UInt16, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSyncReader2, lpVtbl : IWMSyncReader2Vtbl* do
    GUID = LibC::GUID.new(0xfaed3d21_u32, 0x1b6b_u16, 0x4af7_u16, StaticArray[0x8c_u8, 0xb6_u8, 0x3e_u8, 0x18_u8, 0x9b_u8, 0xbc_u8, 0x18_u8, 0x7b_u8])
    def query_interface(this : IWMSyncReader2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSyncReader2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSyncReader2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IWMSyncReader2*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end
    def close(this : IWMSyncReader2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def set_range(this : IWMSyncReader2*, cnsStartTime : UInt64, cnsDuration : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range.call(this, cnsStartTime, cnsDuration)
    end
    def set_range_by_frame(this : IWMSyncReader2*, wStreamNum : UInt16, qwFrameNumber : UInt64, cFramesToRead : Int64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range_by_frame.call(this, wStreamNum, qwFrameNumber, cFramesToRead)
    end
    def get_next_sample(this : IWMSyncReader2*, wStreamNum : UInt16, ppSample : Void**, pcnsSampleTime : UInt64*, pcnsDuration : UInt64*, pdwFlags : UInt32*, pdwOutputNum : UInt32*, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_sample.call(this, wStreamNum, ppSample, pcnsSampleTime, pcnsDuration, pdwFlags, pdwOutputNum, pwStreamNum)
    end
    def set_streams_selected(this : IWMSyncReader2*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMSyncReader2*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_read_stream_samples(this : IWMSyncReader2*, wStreamNum : UInt16, fCompressed : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_read_stream_samples.call(this, wStreamNum, fCompressed)
    end
    def get_read_stream_samples(this : IWMSyncReader2*, wStreamNum : UInt16, pfCompressed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_read_stream_samples.call(this, wStreamNum, pfCompressed)
    end
    def get_output_setting(this : IWMSyncReader2*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMSyncReader2*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def get_output_count(this : IWMSyncReader2*, pcOutputs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_count.call(this, pcOutputs)
    end
    def get_output_props(this : IWMSyncReader2*, dwOutputNum : UInt32, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_props.call(this, dwOutputNum, ppOutput)
    end
    def set_output_props(this : IWMSyncReader2*, dwOutputNum : UInt32, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_props.call(this, dwOutputNum, pOutput)
    end
    def get_output_format_count(this : IWMSyncReader2*, dwOutputNum : UInt32, pcFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_format_count.call(this, dwOutputNum, pcFormats)
    end
    def get_output_format(this : IWMSyncReader2*, dwOutputNum : UInt32, dwFormatNum : UInt32, ppProps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_format.call(this, dwOutputNum, dwFormatNum, ppProps)
    end
    def get_output_number_for_stream(this : IWMSyncReader2*, wStreamNum : UInt16, pdwOutputNum : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_number_for_stream.call(this, wStreamNum, pdwOutputNum)
    end
    def get_stream_number_for_output(this : IWMSyncReader2*, dwOutputNum : UInt32, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_number_for_output.call(this, dwOutputNum, pwStreamNum)
    end
    def get_max_output_sample_size(this : IWMSyncReader2*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMSyncReader2*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def open_stream(this : IWMSyncReader2*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream)
    end
    def set_range_by_timecode(this : IWMSyncReader2*, wStreamNum : UInt16, pStart : Win32cr::Media::WindowsMediaFormat::WMT_TIMECODE_EXTENSION_DATA*, pEnd : Win32cr::Media::WindowsMediaFormat::WMT_TIMECODE_EXTENSION_DATA*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range_by_timecode.call(this, wStreamNum, pStart, pEnd)
    end
    def set_range_by_frame_ex(this : IWMSyncReader2*, wStreamNum : UInt16, qwFrameNumber : UInt64, cFramesToRead : Int64, pcnsStartTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_range_by_frame_ex.call(this, wStreamNum, qwFrameNumber, cFramesToRead, pcnsStartTime)
    end
    def set_allocate_for_output(this : IWMSyncReader2*, dwOutputNum : UInt32, pAllocator : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, pAllocator)
    end
    def get_allocate_for_output(this : IWMSyncReader2*, dwOutputNum : UInt32, ppAllocator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, ppAllocator)
    end
    def set_allocate_for_stream(this : IWMSyncReader2*, wStreamNum : UInt16, pAllocator : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, pAllocator)
    end
    def get_allocate_for_stream(this : IWMSyncReader2*, dwSreamNum : UInt16, ppAllocator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, ppAllocator)
    end

  end

  @[Extern]
  record IWMOutputMediaPropsVtbl,
    query_interface : Proc(IWMOutputMediaProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMOutputMediaProps*, UInt32),
    release : Proc(IWMOutputMediaProps*, UInt32),
    get_type : Proc(IWMOutputMediaProps*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_media_type : Proc(IWMOutputMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, UInt32*, Win32cr::Foundation::HRESULT),
    set_media_type : Proc(IWMOutputMediaProps*, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, Win32cr::Foundation::HRESULT),
    get_stream_group_name : Proc(IWMOutputMediaProps*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    get_connection_name : Proc(IWMOutputMediaProps*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMOutputMediaProps, lpVtbl : IWMOutputMediaPropsVtbl* do
    GUID = LibC::GUID.new(0x96406bd7_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMOutputMediaProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMOutputMediaProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMOutputMediaProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : IWMOutputMediaProps*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def get_media_type(this : IWMOutputMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, pcbType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_media_type.call(this, pType, pcbType)
    end
    def set_media_type(this : IWMOutputMediaProps*, pType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_media_type.call(this, pType)
    end
    def get_stream_group_name(this : IWMOutputMediaProps*, pwszName : UInt16*, pcchName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_group_name.call(this, pwszName, pcchName)
    end
    def get_connection_name(this : IWMOutputMediaProps*, pwszName : UInt16*, pcchName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_name.call(this, pwszName, pcchName)
    end

  end

  @[Extern]
  record IWMStatusCallbackVtbl,
    query_interface : Proc(IWMStatusCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMStatusCallback*, UInt32),
    release : Proc(IWMStatusCallback*, UInt32),
    on_status : Proc(IWMStatusCallback*, Win32cr::Media::WindowsMediaFormat::WMT_STATUS, Win32cr::Foundation::HRESULT, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMStatusCallback, lpVtbl : IWMStatusCallbackVtbl* do
    GUID = LibC::GUID.new(0x6d7cdc70_u32, 0x9888_u16, 0x11d3_u16, StaticArray[0x8e_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x9_u8, 0xcf_u8])
    def query_interface(this : IWMStatusCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMStatusCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMStatusCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_status(this : IWMStatusCallback*, status : Win32cr::Media::WindowsMediaFormat::WMT_STATUS, hr : Win32cr::Foundation::HRESULT, dwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status.call(this, status, hr, dwType, pValue, pvContext)
    end

  end

  @[Extern]
  record IWMReaderCallbackVtbl,
    query_interface : Proc(IWMReaderCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderCallback*, UInt32),
    release : Proc(IWMReaderCallback*, UInt32),
    on_status : Proc(IWMReaderCallback*, Win32cr::Media::WindowsMediaFormat::WMT_STATUS, Win32cr::Foundation::HRESULT, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    on_sample : Proc(IWMReaderCallback*, UInt32, UInt64, UInt64, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderCallback, lpVtbl : IWMReaderCallbackVtbl* do
    GUID = LibC::GUID.new(0x96406bd8_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMReaderCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_status(this : IWMReaderCallback*, status : Win32cr::Media::WindowsMediaFormat::WMT_STATUS, hr : Win32cr::Foundation::HRESULT, dwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status.call(this, status, hr, dwType, pValue, pvContext)
    end
    def on_sample(this : IWMReaderCallback*, dwOutputNum : UInt32, cnsSampleTime : UInt64, cnsSampleDuration : UInt64, dwFlags : UInt32, pSample : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_sample.call(this, dwOutputNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext)
    end

  end

  @[Extern]
  record IWMCredentialCallbackVtbl,
    query_interface : Proc(IWMCredentialCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMCredentialCallback*, UInt32),
    release : Proc(IWMCredentialCallback*, UInt32),
    acquire_credentials : Proc(IWMCredentialCallback*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt16*, UInt32, UInt16*, UInt32, Win32cr::Foundation::HRESULT, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMCredentialCallback, lpVtbl : IWMCredentialCallbackVtbl* do
    GUID = LibC::GUID.new(0x342e0eb7_u32, 0xe651_u16, 0x450c_u16, StaticArray[0x97_u8, 0x5b_u8, 0x2a_u8, 0xce_u8, 0x2c_u8, 0x90_u8, 0xc4_u8, 0x8e_u8])
    def query_interface(this : IWMCredentialCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMCredentialCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMCredentialCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def acquire_credentials(this : IWMCredentialCallback*, pwszRealm : Win32cr::Foundation::PWSTR, pwszSite : Win32cr::Foundation::PWSTR, pwszUser : UInt16*, cchUser : UInt32, pwszPassword : UInt16*, cchPassword : UInt32, hrStatus : Win32cr::Foundation::HRESULT, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_credentials.call(this, pwszRealm, pwszSite, pwszUser, cchUser, pwszPassword, cchPassword, hrStatus, pdwFlags)
    end

  end

  @[Extern]
  record IWMMetadataEditorVtbl,
    query_interface : Proc(IWMMetadataEditor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMMetadataEditor*, UInt32),
    release : Proc(IWMMetadataEditor*, UInt32),
    open : Proc(IWMMetadataEditor*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IWMMetadataEditor*, Win32cr::Foundation::HRESULT),
    flush : Proc(IWMMetadataEditor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMMetadataEditor, lpVtbl : IWMMetadataEditorVtbl* do
    GUID = LibC::GUID.new(0x96406bd9_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMMetadataEditor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMMetadataEditor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMMetadataEditor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IWMMetadataEditor*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end
    def close(this : IWMMetadataEditor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def flush(this : IWMMetadataEditor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end

  end

  @[Extern]
  record IWMMetadataEditor2Vtbl,
    query_interface : Proc(IWMMetadataEditor2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMMetadataEditor2*, UInt32),
    release : Proc(IWMMetadataEditor2*, UInt32),
    open : Proc(IWMMetadataEditor2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    close : Proc(IWMMetadataEditor2*, Win32cr::Foundation::HRESULT),
    flush : Proc(IWMMetadataEditor2*, Win32cr::Foundation::HRESULT),
    open_ex : Proc(IWMMetadataEditor2*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMMetadataEditor2, lpVtbl : IWMMetadataEditor2Vtbl* do
    GUID = LibC::GUID.new(0x203cffe3_u32, 0x2e18_u16, 0x4fdf_u16, StaticArray[0xb5_u8, 0x9d_u8, 0x6e_u8, 0x71_u8, 0x53_u8, 0x5_u8, 0x34_u8, 0xcf_u8])
    def query_interface(this : IWMMetadataEditor2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMMetadataEditor2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMMetadataEditor2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open(this : IWMMetadataEditor2*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end
    def close(this : IWMMetadataEditor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def flush(this : IWMMetadataEditor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def open_ex(this : IWMMetadataEditor2*, pwszFilename : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, dwShareMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_ex.call(this, pwszFilename, dwDesiredAccess, dwShareMode)
    end

  end

  @[Extern]
  record IWMDRMEditorVtbl,
    query_interface : Proc(IWMDRMEditor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMEditor*, UInt32),
    release : Proc(IWMDRMEditor*, UInt32),
    get_drm_property : Proc(IWMDRMEditor*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMEditor, lpVtbl : IWMDRMEditorVtbl* do
    GUID = LibC::GUID.new(0xff130ebc_u32, 0xa6c3_u16, 0x42a6_u16, StaticArray[0xb4_u8, 0x1_u8, 0xc3_u8, 0x38_u8, 0x2c_u8, 0x3e_u8, 0x8_u8, 0xb3_u8])
    def query_interface(this : IWMDRMEditor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMEditor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMEditor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_drm_property(this : IWMDRMEditor*, pwstrName : Win32cr::Foundation::PWSTR, pdwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drm_property.call(this, pwstrName, pdwType, pValue, pcbLength)
    end

  end

  @[Extern]
  record IWMHeaderInfoVtbl,
    query_interface : Proc(IWMHeaderInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMHeaderInfo*, UInt32),
    release : Proc(IWMHeaderInfo*, UInt32),
    get_attribute_count : Proc(IWMHeaderInfo*, UInt16, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_index : Proc(IWMHeaderInfo*, UInt16, UInt16*, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_name : Proc(IWMHeaderInfo*, UInt16*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_attribute : Proc(IWMHeaderInfo*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_marker_count : Proc(IWMHeaderInfo*, UInt16*, Win32cr::Foundation::HRESULT),
    get_marker : Proc(IWMHeaderInfo*, UInt16, UInt16*, UInt16*, UInt64*, Win32cr::Foundation::HRESULT),
    add_marker : Proc(IWMHeaderInfo*, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    remove_marker : Proc(IWMHeaderInfo*, UInt16, Win32cr::Foundation::HRESULT),
    get_script_count : Proc(IWMHeaderInfo*, UInt16*, Win32cr::Foundation::HRESULT),
    get_script : Proc(IWMHeaderInfo*, UInt16, UInt16*, UInt16*, UInt16*, UInt16*, UInt64*, Win32cr::Foundation::HRESULT),
    add_script : Proc(IWMHeaderInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    remove_script : Proc(IWMHeaderInfo*, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMHeaderInfo, lpVtbl : IWMHeaderInfoVtbl* do
    GUID = LibC::GUID.new(0x96406bda_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMHeaderInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMHeaderInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMHeaderInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_count(this : IWMHeaderInfo*, wStreamNum : UInt16, pcAttributes : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_count.call(this, wStreamNum, pcAttributes)
    end
    def get_attribute_by_index(this : IWMHeaderInfo*, wIndex : UInt16, pwStreamNum : UInt16*, pwszName : UInt16*, pcchNameLen : UInt16*, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_index.call(this, wIndex, pwStreamNum, pwszName, pcchNameLen, pType, pValue, pcbLength)
    end
    def get_attribute_by_name(this : IWMHeaderInfo*, pwStreamNum : UInt16*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_name.call(this, pwStreamNum, pszName, pType, pValue, pcbLength)
    end
    def set_attribute(this : IWMHeaderInfo*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attribute.call(this, wStreamNum, pszName, type__, pValue, cbLength)
    end
    def get_marker_count(this : IWMHeaderInfo*, pcMarkers : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marker_count.call(this, pcMarkers)
    end
    def get_marker(this : IWMHeaderInfo*, wIndex : UInt16, pwszMarkerName : UInt16*, pcchMarkerNameLen : UInt16*, pcnsMarkerTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marker.call(this, wIndex, pwszMarkerName, pcchMarkerNameLen, pcnsMarkerTime)
    end
    def add_marker(this : IWMHeaderInfo*, pwszMarkerName : Win32cr::Foundation::PWSTR, cnsMarkerTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_marker.call(this, pwszMarkerName, cnsMarkerTime)
    end
    def remove_marker(this : IWMHeaderInfo*, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_marker.call(this, wIndex)
    end
    def get_script_count(this : IWMHeaderInfo*, pcScripts : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_count.call(this, pcScripts)
    end
    def get_script(this : IWMHeaderInfo*, wIndex : UInt16, pwszType : UInt16*, pcchTypeLen : UInt16*, pwszCommand : UInt16*, pcchCommandLen : UInt16*, pcnsScriptTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script.call(this, wIndex, pwszType, pcchTypeLen, pwszCommand, pcchCommandLen, pcnsScriptTime)
    end
    def add_script(this : IWMHeaderInfo*, pwszType : Win32cr::Foundation::PWSTR, pwszCommand : Win32cr::Foundation::PWSTR, cnsScriptTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_script.call(this, pwszType, pwszCommand, cnsScriptTime)
    end
    def remove_script(this : IWMHeaderInfo*, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_script.call(this, wIndex)
    end

  end

  @[Extern]
  record IWMHeaderInfo2Vtbl,
    query_interface : Proc(IWMHeaderInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMHeaderInfo2*, UInt32),
    release : Proc(IWMHeaderInfo2*, UInt32),
    get_attribute_count : Proc(IWMHeaderInfo2*, UInt16, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_index : Proc(IWMHeaderInfo2*, UInt16, UInt16*, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_name : Proc(IWMHeaderInfo2*, UInt16*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_attribute : Proc(IWMHeaderInfo2*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_marker_count : Proc(IWMHeaderInfo2*, UInt16*, Win32cr::Foundation::HRESULT),
    get_marker : Proc(IWMHeaderInfo2*, UInt16, UInt16*, UInt16*, UInt64*, Win32cr::Foundation::HRESULT),
    add_marker : Proc(IWMHeaderInfo2*, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    remove_marker : Proc(IWMHeaderInfo2*, UInt16, Win32cr::Foundation::HRESULT),
    get_script_count : Proc(IWMHeaderInfo2*, UInt16*, Win32cr::Foundation::HRESULT),
    get_script : Proc(IWMHeaderInfo2*, UInt16, UInt16*, UInt16*, UInt16*, UInt16*, UInt64*, Win32cr::Foundation::HRESULT),
    add_script : Proc(IWMHeaderInfo2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    remove_script : Proc(IWMHeaderInfo2*, UInt16, Win32cr::Foundation::HRESULT),
    get_codec_info_count : Proc(IWMHeaderInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_info : Proc(IWMHeaderInfo2*, UInt32, UInt16*, UInt16*, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_CODEC_INFO_TYPE*, UInt16*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMHeaderInfo2, lpVtbl : IWMHeaderInfo2Vtbl* do
    GUID = LibC::GUID.new(0x15cf9781_u32, 0x454e_u16, 0x482e_u16, StaticArray[0xb3_u8, 0x93_u8, 0x85_u8, 0xfa_u8, 0xe4_u8, 0x87_u8, 0xa8_u8, 0x10_u8])
    def query_interface(this : IWMHeaderInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMHeaderInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMHeaderInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_count(this : IWMHeaderInfo2*, wStreamNum : UInt16, pcAttributes : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_count.call(this, wStreamNum, pcAttributes)
    end
    def get_attribute_by_index(this : IWMHeaderInfo2*, wIndex : UInt16, pwStreamNum : UInt16*, pwszName : UInt16*, pcchNameLen : UInt16*, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_index.call(this, wIndex, pwStreamNum, pwszName, pcchNameLen, pType, pValue, pcbLength)
    end
    def get_attribute_by_name(this : IWMHeaderInfo2*, pwStreamNum : UInt16*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_name.call(this, pwStreamNum, pszName, pType, pValue, pcbLength)
    end
    def set_attribute(this : IWMHeaderInfo2*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attribute.call(this, wStreamNum, pszName, type__, pValue, cbLength)
    end
    def get_marker_count(this : IWMHeaderInfo2*, pcMarkers : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marker_count.call(this, pcMarkers)
    end
    def get_marker(this : IWMHeaderInfo2*, wIndex : UInt16, pwszMarkerName : UInt16*, pcchMarkerNameLen : UInt16*, pcnsMarkerTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marker.call(this, wIndex, pwszMarkerName, pcchMarkerNameLen, pcnsMarkerTime)
    end
    def add_marker(this : IWMHeaderInfo2*, pwszMarkerName : Win32cr::Foundation::PWSTR, cnsMarkerTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_marker.call(this, pwszMarkerName, cnsMarkerTime)
    end
    def remove_marker(this : IWMHeaderInfo2*, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_marker.call(this, wIndex)
    end
    def get_script_count(this : IWMHeaderInfo2*, pcScripts : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_count.call(this, pcScripts)
    end
    def get_script(this : IWMHeaderInfo2*, wIndex : UInt16, pwszType : UInt16*, pcchTypeLen : UInt16*, pwszCommand : UInt16*, pcchCommandLen : UInt16*, pcnsScriptTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script.call(this, wIndex, pwszType, pcchTypeLen, pwszCommand, pcchCommandLen, pcnsScriptTime)
    end
    def add_script(this : IWMHeaderInfo2*, pwszType : Win32cr::Foundation::PWSTR, pwszCommand : Win32cr::Foundation::PWSTR, cnsScriptTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_script.call(this, pwszType, pwszCommand, cnsScriptTime)
    end
    def remove_script(this : IWMHeaderInfo2*, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_script.call(this, wIndex)
    end
    def get_codec_info_count(this : IWMHeaderInfo2*, pcCodecInfos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info_count.call(this, pcCodecInfos)
    end
    def get_codec_info(this : IWMHeaderInfo2*, wIndex : UInt32, pcchName : UInt16*, pwszName : UInt16*, pcchDescription : UInt16*, pwszDescription : UInt16*, pCodecType : Win32cr::Media::WindowsMediaFormat::WMT_CODEC_INFO_TYPE*, pcbCodecInfo : UInt16*, pbCodecInfo : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info.call(this, wIndex, pcchName, pwszName, pcchDescription, pwszDescription, pCodecType, pcbCodecInfo, pbCodecInfo)
    end

  end

  @[Extern]
  record IWMHeaderInfo3Vtbl,
    query_interface : Proc(IWMHeaderInfo3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMHeaderInfo3*, UInt32),
    release : Proc(IWMHeaderInfo3*, UInt32),
    get_attribute_count : Proc(IWMHeaderInfo3*, UInt16, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_index : Proc(IWMHeaderInfo3*, UInt16, UInt16*, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_name : Proc(IWMHeaderInfo3*, UInt16*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_attribute : Proc(IWMHeaderInfo3*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_marker_count : Proc(IWMHeaderInfo3*, UInt16*, Win32cr::Foundation::HRESULT),
    get_marker : Proc(IWMHeaderInfo3*, UInt16, UInt16*, UInt16*, UInt64*, Win32cr::Foundation::HRESULT),
    add_marker : Proc(IWMHeaderInfo3*, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    remove_marker : Proc(IWMHeaderInfo3*, UInt16, Win32cr::Foundation::HRESULT),
    get_script_count : Proc(IWMHeaderInfo3*, UInt16*, Win32cr::Foundation::HRESULT),
    get_script : Proc(IWMHeaderInfo3*, UInt16, UInt16*, UInt16*, UInt16*, UInt16*, UInt64*, Win32cr::Foundation::HRESULT),
    add_script : Proc(IWMHeaderInfo3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    remove_script : Proc(IWMHeaderInfo3*, UInt16, Win32cr::Foundation::HRESULT),
    get_codec_info_count : Proc(IWMHeaderInfo3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_info : Proc(IWMHeaderInfo3*, UInt32, UInt16*, UInt16*, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_CODEC_INFO_TYPE*, UInt16*, UInt8*, Win32cr::Foundation::HRESULT),
    get_attribute_count_ex : Proc(IWMHeaderInfo3*, UInt16, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_indices : Proc(IWMHeaderInfo3*, UInt16, Win32cr::Foundation::PWSTR, UInt16*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    get_attribute_by_index_ex : Proc(IWMHeaderInfo3*, UInt16, UInt16, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt16*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    modify_attribute : Proc(IWMHeaderInfo3*, UInt16, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt16, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    add_attribute : Proc(IWMHeaderInfo3*, UInt16, Win32cr::Foundation::PWSTR, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt16, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    delete_attribute : Proc(IWMHeaderInfo3*, UInt16, UInt16, Win32cr::Foundation::HRESULT),
    add_codec_info : Proc(IWMHeaderInfo3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_CODEC_INFO_TYPE, UInt16, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMHeaderInfo3, lpVtbl : IWMHeaderInfo3Vtbl* do
    GUID = LibC::GUID.new(0x15cc68e3_u32, 0x27cc_u16, 0x4ecd_u16, StaticArray[0xb2_u8, 0x22_u8, 0x3f_u8, 0x5d_u8, 0x2_u8, 0xd8_u8, 0xb_u8, 0xd5_u8])
    def query_interface(this : IWMHeaderInfo3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMHeaderInfo3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMHeaderInfo3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_attribute_count(this : IWMHeaderInfo3*, wStreamNum : UInt16, pcAttributes : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_count.call(this, wStreamNum, pcAttributes)
    end
    def get_attribute_by_index(this : IWMHeaderInfo3*, wIndex : UInt16, pwStreamNum : UInt16*, pwszName : UInt16*, pcchNameLen : UInt16*, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_index.call(this, wIndex, pwStreamNum, pwszName, pcchNameLen, pType, pValue, pcbLength)
    end
    def get_attribute_by_name(this : IWMHeaderInfo3*, pwStreamNum : UInt16*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_name.call(this, pwStreamNum, pszName, pType, pValue, pcbLength)
    end
    def set_attribute(this : IWMHeaderInfo3*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attribute.call(this, wStreamNum, pszName, type__, pValue, cbLength)
    end
    def get_marker_count(this : IWMHeaderInfo3*, pcMarkers : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marker_count.call(this, pcMarkers)
    end
    def get_marker(this : IWMHeaderInfo3*, wIndex : UInt16, pwszMarkerName : UInt16*, pcchMarkerNameLen : UInt16*, pcnsMarkerTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_marker.call(this, wIndex, pwszMarkerName, pcchMarkerNameLen, pcnsMarkerTime)
    end
    def add_marker(this : IWMHeaderInfo3*, pwszMarkerName : Win32cr::Foundation::PWSTR, cnsMarkerTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_marker.call(this, pwszMarkerName, cnsMarkerTime)
    end
    def remove_marker(this : IWMHeaderInfo3*, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_marker.call(this, wIndex)
    end
    def get_script_count(this : IWMHeaderInfo3*, pcScripts : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script_count.call(this, pcScripts)
    end
    def get_script(this : IWMHeaderInfo3*, wIndex : UInt16, pwszType : UInt16*, pcchTypeLen : UInt16*, pwszCommand : UInt16*, pcchCommandLen : UInt16*, pcnsScriptTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_script.call(this, wIndex, pwszType, pcchTypeLen, pwszCommand, pcchCommandLen, pcnsScriptTime)
    end
    def add_script(this : IWMHeaderInfo3*, pwszType : Win32cr::Foundation::PWSTR, pwszCommand : Win32cr::Foundation::PWSTR, cnsScriptTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_script.call(this, pwszType, pwszCommand, cnsScriptTime)
    end
    def remove_script(this : IWMHeaderInfo3*, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_script.call(this, wIndex)
    end
    def get_codec_info_count(this : IWMHeaderInfo3*, pcCodecInfos : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info_count.call(this, pcCodecInfos)
    end
    def get_codec_info(this : IWMHeaderInfo3*, wIndex : UInt32, pcchName : UInt16*, pwszName : UInt16*, pcchDescription : UInt16*, pwszDescription : UInt16*, pCodecType : Win32cr::Media::WindowsMediaFormat::WMT_CODEC_INFO_TYPE*, pcbCodecInfo : UInt16*, pbCodecInfo : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info.call(this, wIndex, pcchName, pwszName, pcchDescription, pwszDescription, pCodecType, pcbCodecInfo, pbCodecInfo)
    end
    def get_attribute_count_ex(this : IWMHeaderInfo3*, wStreamNum : UInt16, pcAttributes : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_count_ex.call(this, wStreamNum, pcAttributes)
    end
    def get_attribute_indices(this : IWMHeaderInfo3*, wStreamNum : UInt16, pwszName : Win32cr::Foundation::PWSTR, pwLangIndex : UInt16*, pwIndices : UInt16*, pwCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_indices.call(this, wStreamNum, pwszName, pwLangIndex, pwIndices, pwCount)
    end
    def get_attribute_by_index_ex(this : IWMHeaderInfo3*, wStreamNum : UInt16, wIndex : UInt16, pwszName : UInt16*, pwNameLen : UInt16*, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pwLangIndex : UInt16*, pValue : UInt8*, pdwDataLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_index_ex.call(this, wStreamNum, wIndex, pwszName, pwNameLen, pType, pwLangIndex, pValue, pdwDataLength)
    end
    def modify_attribute(this : IWMHeaderInfo3*, wStreamNum : UInt16, wIndex : UInt16, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, wLangIndex : UInt16, pValue : UInt8*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_attribute.call(this, wStreamNum, wIndex, type__, wLangIndex, pValue, dwLength)
    end
    def add_attribute(this : IWMHeaderInfo3*, wStreamNum : UInt16, pszName : Win32cr::Foundation::PWSTR, pwIndex : UInt16*, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, wLangIndex : UInt16, pValue : UInt8*, dwLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_attribute.call(this, wStreamNum, pszName, pwIndex, type__, wLangIndex, pValue, dwLength)
    end
    def delete_attribute(this : IWMHeaderInfo3*, wStreamNum : UInt16, wIndex : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_attribute.call(this, wStreamNum, wIndex)
    end
    def add_codec_info(this : IWMHeaderInfo3*, pwszName : Win32cr::Foundation::PWSTR, pwszDescription : Win32cr::Foundation::PWSTR, codecType : Win32cr::Media::WindowsMediaFormat::WMT_CODEC_INFO_TYPE, cbCodecInfo : UInt16, pbCodecInfo : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_codec_info.call(this, pwszName, pwszDescription, codecType, cbCodecInfo, pbCodecInfo)
    end

  end

  @[Extern]
  record IWMProfileManagerVtbl,
    query_interface : Proc(IWMProfileManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProfileManager*, UInt32),
    release : Proc(IWMProfileManager*, UInt32),
    create_empty_profile : Proc(IWMProfileManager*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION, Void**, Win32cr::Foundation::HRESULT),
    load_profile_by_id : Proc(IWMProfileManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    load_profile_by_data : Proc(IWMProfileManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    save_profile : Proc(IWMProfileManager*, Void*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_system_profile_count : Proc(IWMProfileManager*, UInt32*, Win32cr::Foundation::HRESULT),
    load_system_profile : Proc(IWMProfileManager*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProfileManager, lpVtbl : IWMProfileManagerVtbl* do
    GUID = LibC::GUID.new(0xd16679f2_u32, 0x6ca0_u16, 0x472d_u16, StaticArray[0x8d_u8, 0x31_u8, 0x2f_u8, 0x5d_u8, 0x55_u8, 0xae_u8, 0xe1_u8, 0x55_u8])
    def query_interface(this : IWMProfileManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProfileManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProfileManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_empty_profile(this : IWMProfileManager*, dwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_empty_profile.call(this, dwVersion, ppProfile)
    end
    def load_profile_by_id(this : IWMProfileManager*, guidProfile : LibC::GUID*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_profile_by_id.call(this, guidProfile, ppProfile)
    end
    def load_profile_by_data(this : IWMProfileManager*, pwszProfile : Win32cr::Foundation::PWSTR, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_profile_by_data.call(this, pwszProfile, ppProfile)
    end
    def save_profile(this : IWMProfileManager*, pIWMProfile : Void*, pwszProfile : Win32cr::Foundation::PWSTR, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_profile.call(this, pIWMProfile, pwszProfile, pdwLength)
    end
    def get_system_profile_count(this : IWMProfileManager*, pcProfiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_system_profile_count.call(this, pcProfiles)
    end
    def load_system_profile(this : IWMProfileManager*, dwProfileIndex : UInt32, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_system_profile.call(this, dwProfileIndex, ppProfile)
    end

  end

  @[Extern]
  record IWMProfileManager2Vtbl,
    query_interface : Proc(IWMProfileManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProfileManager2*, UInt32),
    release : Proc(IWMProfileManager2*, UInt32),
    create_empty_profile : Proc(IWMProfileManager2*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION, Void**, Win32cr::Foundation::HRESULT),
    load_profile_by_id : Proc(IWMProfileManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    load_profile_by_data : Proc(IWMProfileManager2*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    save_profile : Proc(IWMProfileManager2*, Void*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_system_profile_count : Proc(IWMProfileManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    load_system_profile : Proc(IWMProfileManager2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_system_profile_version : Proc(IWMProfileManager2*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION*, Win32cr::Foundation::HRESULT),
    set_system_profile_version : Proc(IWMProfileManager2*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProfileManager2, lpVtbl : IWMProfileManager2Vtbl* do
    GUID = LibC::GUID.new(0x7a924e51_u32, 0x73c1_u16, 0x494d_u16, StaticArray[0x80_u8, 0x19_u8, 0x23_u8, 0xd3_u8, 0x7e_u8, 0xd9_u8, 0xb8_u8, 0x9a_u8])
    def query_interface(this : IWMProfileManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProfileManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProfileManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_empty_profile(this : IWMProfileManager2*, dwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_empty_profile.call(this, dwVersion, ppProfile)
    end
    def load_profile_by_id(this : IWMProfileManager2*, guidProfile : LibC::GUID*, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_profile_by_id.call(this, guidProfile, ppProfile)
    end
    def load_profile_by_data(this : IWMProfileManager2*, pwszProfile : Win32cr::Foundation::PWSTR, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_profile_by_data.call(this, pwszProfile, ppProfile)
    end
    def save_profile(this : IWMProfileManager2*, pIWMProfile : Void*, pwszProfile : Win32cr::Foundation::PWSTR, pdwLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_profile.call(this, pIWMProfile, pwszProfile, pdwLength)
    end
    def get_system_profile_count(this : IWMProfileManager2*, pcProfiles : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_system_profile_count.call(this, pcProfiles)
    end
    def load_system_profile(this : IWMProfileManager2*, dwProfileIndex : UInt32, ppProfile : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_system_profile.call(this, dwProfileIndex, ppProfile)
    end
    def get_system_profile_version(this : IWMProfileManager2*, pdwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_system_profile_version.call(this, pdwVersion)
    end
    def set_system_profile_version(this : IWMProfileManager2*, dwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_system_profile_version.call(this, dwVersion)
    end

  end

  @[Extern]
  record IWMProfileManagerLanguageVtbl,
    query_interface : Proc(IWMProfileManagerLanguage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProfileManagerLanguage*, UInt32),
    release : Proc(IWMProfileManagerLanguage*, UInt32),
    get_user_language_id : Proc(IWMProfileManagerLanguage*, UInt16*, Win32cr::Foundation::HRESULT),
    set_user_language_id : Proc(IWMProfileManagerLanguage*, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProfileManagerLanguage, lpVtbl : IWMProfileManagerLanguageVtbl* do
    GUID = LibC::GUID.new(0xba4dcc78_u32, 0x7ee0_u16, 0x4ab8_u16, StaticArray[0xb2_u8, 0x7a_u8, 0xdb_u8, 0xce_u8, 0x8b_u8, 0xc5_u8, 0x14_u8, 0x54_u8])
    def query_interface(this : IWMProfileManagerLanguage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProfileManagerLanguage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProfileManagerLanguage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_user_language_id(this : IWMProfileManagerLanguage*, wLangID : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_language_id.call(this, wLangID)
    end
    def set_user_language_id(this : IWMProfileManagerLanguage*, wLangID : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_language_id.call(this, wLangID)
    end

  end

  @[Extern]
  record IWMProfileVtbl,
    query_interface : Proc(IWMProfile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProfile*, UInt32),
    release : Proc(IWMProfile*, UInt32),
    get_version : Proc(IWMProfile*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMProfile*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IWMProfile*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IWMProfile*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IWMProfile*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_stream_count : Proc(IWMProfile*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IWMProfile*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_stream_by_number : Proc(IWMProfile*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMProfile*, Void*, Win32cr::Foundation::HRESULT),
    remove_stream_by_number : Proc(IWMProfile*, UInt16, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMProfile*, Void*, Win32cr::Foundation::HRESULT),
    reconfig_stream : Proc(IWMProfile*, Void*, Win32cr::Foundation::HRESULT),
    create_new_stream : Proc(IWMProfile*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_mutual_exclusion_count : Proc(IWMProfile*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mutual_exclusion : Proc(IWMProfile*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_mutual_exclusion : Proc(IWMProfile*, Void*, Win32cr::Foundation::HRESULT),
    add_mutual_exclusion : Proc(IWMProfile*, Void*, Win32cr::Foundation::HRESULT),
    create_new_mutual_exclusion : Proc(IWMProfile*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProfile, lpVtbl : IWMProfileVtbl* do
    GUID = LibC::GUID.new(0x96406bdb_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMProfile*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProfile*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProfile*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version(this : IWMProfile*, pdwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_name(this : IWMProfile*, pwszName : UInt16*, pcchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, pcchName)
    end
    def set_name(this : IWMProfile*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, pwszName)
    end
    def get_description(this : IWMProfile*, pwszDescription : UInt16*, pcchDescription : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pwszDescription, pcchDescription)
    end
    def set_description(this : IWMProfile*, pwszDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, pwszDescription)
    end
    def get_stream_count(this : IWMProfile*, pcStreams : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_count.call(this, pcStreams)
    end
    def get_stream(this : IWMProfile*, dwStreamIndex : UInt32, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, dwStreamIndex, ppConfig)
    end
    def get_stream_by_number(this : IWMProfile*, wStreamNum : UInt16, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_by_number.call(this, wStreamNum, ppConfig)
    end
    def remove_stream(this : IWMProfile*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, pConfig)
    end
    def remove_stream_by_number(this : IWMProfile*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream_by_number.call(this, wStreamNum)
    end
    def add_stream(this : IWMProfile*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, pConfig)
    end
    def reconfig_stream(this : IWMProfile*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconfig_stream.call(this, pConfig)
    end
    def create_new_stream(this : IWMProfile*, guidStreamType : LibC::GUID*, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_stream.call(this, guidStreamType, ppConfig)
    end
    def get_mutual_exclusion_count(this : IWMProfile*, pcME : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mutual_exclusion_count.call(this, pcME)
    end
    def get_mutual_exclusion(this : IWMProfile*, dwMEIndex : UInt32, ppME : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mutual_exclusion.call(this, dwMEIndex, ppME)
    end
    def remove_mutual_exclusion(this : IWMProfile*, pME : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_mutual_exclusion.call(this, pME)
    end
    def add_mutual_exclusion(this : IWMProfile*, pME : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_mutual_exclusion.call(this, pME)
    end
    def create_new_mutual_exclusion(this : IWMProfile*, ppME : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_mutual_exclusion.call(this, ppME)
    end

  end

  @[Extern]
  record IWMProfile2Vtbl,
    query_interface : Proc(IWMProfile2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProfile2*, UInt32),
    release : Proc(IWMProfile2*, UInt32),
    get_version : Proc(IWMProfile2*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMProfile2*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IWMProfile2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IWMProfile2*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IWMProfile2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_stream_count : Proc(IWMProfile2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IWMProfile2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_stream_by_number : Proc(IWMProfile2*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMProfile2*, Void*, Win32cr::Foundation::HRESULT),
    remove_stream_by_number : Proc(IWMProfile2*, UInt16, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMProfile2*, Void*, Win32cr::Foundation::HRESULT),
    reconfig_stream : Proc(IWMProfile2*, Void*, Win32cr::Foundation::HRESULT),
    create_new_stream : Proc(IWMProfile2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_mutual_exclusion_count : Proc(IWMProfile2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mutual_exclusion : Proc(IWMProfile2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_mutual_exclusion : Proc(IWMProfile2*, Void*, Win32cr::Foundation::HRESULT),
    add_mutual_exclusion : Proc(IWMProfile2*, Void*, Win32cr::Foundation::HRESULT),
    create_new_mutual_exclusion : Proc(IWMProfile2*, Void**, Win32cr::Foundation::HRESULT),
    get_profile_id : Proc(IWMProfile2*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProfile2, lpVtbl : IWMProfile2Vtbl* do
    GUID = LibC::GUID.new(0x7e72d33_u32, 0xd94e_u16, 0x4be7_u16, StaticArray[0x88_u8, 0x43_u8, 0x60_u8, 0xae_u8, 0x5f_u8, 0xf7_u8, 0xe5_u8, 0xf5_u8])
    def query_interface(this : IWMProfile2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProfile2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProfile2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version(this : IWMProfile2*, pdwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_name(this : IWMProfile2*, pwszName : UInt16*, pcchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, pcchName)
    end
    def set_name(this : IWMProfile2*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, pwszName)
    end
    def get_description(this : IWMProfile2*, pwszDescription : UInt16*, pcchDescription : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pwszDescription, pcchDescription)
    end
    def set_description(this : IWMProfile2*, pwszDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, pwszDescription)
    end
    def get_stream_count(this : IWMProfile2*, pcStreams : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_count.call(this, pcStreams)
    end
    def get_stream(this : IWMProfile2*, dwStreamIndex : UInt32, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, dwStreamIndex, ppConfig)
    end
    def get_stream_by_number(this : IWMProfile2*, wStreamNum : UInt16, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_by_number.call(this, wStreamNum, ppConfig)
    end
    def remove_stream(this : IWMProfile2*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, pConfig)
    end
    def remove_stream_by_number(this : IWMProfile2*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream_by_number.call(this, wStreamNum)
    end
    def add_stream(this : IWMProfile2*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, pConfig)
    end
    def reconfig_stream(this : IWMProfile2*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconfig_stream.call(this, pConfig)
    end
    def create_new_stream(this : IWMProfile2*, guidStreamType : LibC::GUID*, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_stream.call(this, guidStreamType, ppConfig)
    end
    def get_mutual_exclusion_count(this : IWMProfile2*, pcME : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mutual_exclusion_count.call(this, pcME)
    end
    def get_mutual_exclusion(this : IWMProfile2*, dwMEIndex : UInt32, ppME : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mutual_exclusion.call(this, dwMEIndex, ppME)
    end
    def remove_mutual_exclusion(this : IWMProfile2*, pME : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_mutual_exclusion.call(this, pME)
    end
    def add_mutual_exclusion(this : IWMProfile2*, pME : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_mutual_exclusion.call(this, pME)
    end
    def create_new_mutual_exclusion(this : IWMProfile2*, ppME : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_mutual_exclusion.call(this, ppME)
    end
    def get_profile_id(this : IWMProfile2*, pguidID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile_id.call(this, pguidID)
    end

  end

  @[Extern]
  record IWMProfile3Vtbl,
    query_interface : Proc(IWMProfile3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProfile3*, UInt32),
    release : Proc(IWMProfile3*, UInt32),
    get_version : Proc(IWMProfile3*, Win32cr::Media::WindowsMediaFormat::WMT_VERSION*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMProfile3*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IWMProfile3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_description : Proc(IWMProfile3*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_description : Proc(IWMProfile3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_stream_count : Proc(IWMProfile3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_stream : Proc(IWMProfile3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_stream_by_number : Proc(IWMProfile3*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    remove_stream_by_number : Proc(IWMProfile3*, UInt16, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    reconfig_stream : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    create_new_stream : Proc(IWMProfile3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_mutual_exclusion_count : Proc(IWMProfile3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_mutual_exclusion : Proc(IWMProfile3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_mutual_exclusion : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    add_mutual_exclusion : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    create_new_mutual_exclusion : Proc(IWMProfile3*, Void**, Win32cr::Foundation::HRESULT),
    get_profile_id : Proc(IWMProfile3*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_storage_format : Proc(IWMProfile3*, Win32cr::Media::WindowsMediaFormat::WMT_STORAGE_FORMAT*, Win32cr::Foundation::HRESULT),
    set_storage_format : Proc(IWMProfile3*, Win32cr::Media::WindowsMediaFormat::WMT_STORAGE_FORMAT, Win32cr::Foundation::HRESULT),
    get_bandwidth_sharing_count : Proc(IWMProfile3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_bandwidth_sharing : Proc(IWMProfile3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    remove_bandwidth_sharing : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    add_bandwidth_sharing : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    create_new_bandwidth_sharing : Proc(IWMProfile3*, Void**, Win32cr::Foundation::HRESULT),
    get_stream_prioritization : Proc(IWMProfile3*, Void**, Win32cr::Foundation::HRESULT),
    set_stream_prioritization : Proc(IWMProfile3*, Void*, Win32cr::Foundation::HRESULT),
    remove_stream_prioritization : Proc(IWMProfile3*, Win32cr::Foundation::HRESULT),
    create_new_stream_prioritization : Proc(IWMProfile3*, Void**, Win32cr::Foundation::HRESULT),
    get_expected_packet_count : Proc(IWMProfile3*, UInt64, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProfile3, lpVtbl : IWMProfile3Vtbl* do
    GUID = LibC::GUID.new(0xef96cc_u32, 0xa461_u16, 0x4546_u16, StaticArray[0x8b_u8, 0xcd_u8, 0xc9_u8, 0xa2_u8, 0x8f_u8, 0xe_u8, 0x6_u8, 0xf5_u8])
    def query_interface(this : IWMProfile3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProfile3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProfile3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version(this : IWMProfile3*, pdwVersion : Win32cr::Media::WindowsMediaFormat::WMT_VERSION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version.call(this, pdwVersion)
    end
    def get_name(this : IWMProfile3*, pwszName : UInt16*, pcchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, pcchName)
    end
    def set_name(this : IWMProfile3*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, pwszName)
    end
    def get_description(this : IWMProfile3*, pwszDescription : UInt16*, pcchDescription : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pwszDescription, pcchDescription)
    end
    def set_description(this : IWMProfile3*, pwszDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_description.call(this, pwszDescription)
    end
    def get_stream_count(this : IWMProfile3*, pcStreams : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_count.call(this, pcStreams)
    end
    def get_stream(this : IWMProfile3*, dwStreamIndex : UInt32, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream.call(this, dwStreamIndex, ppConfig)
    end
    def get_stream_by_number(this : IWMProfile3*, wStreamNum : UInt16, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_by_number.call(this, wStreamNum, ppConfig)
    end
    def remove_stream(this : IWMProfile3*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, pConfig)
    end
    def remove_stream_by_number(this : IWMProfile3*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream_by_number.call(this, wStreamNum)
    end
    def add_stream(this : IWMProfile3*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, pConfig)
    end
    def reconfig_stream(this : IWMProfile3*, pConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconfig_stream.call(this, pConfig)
    end
    def create_new_stream(this : IWMProfile3*, guidStreamType : LibC::GUID*, ppConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_stream.call(this, guidStreamType, ppConfig)
    end
    def get_mutual_exclusion_count(this : IWMProfile3*, pcME : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mutual_exclusion_count.call(this, pcME)
    end
    def get_mutual_exclusion(this : IWMProfile3*, dwMEIndex : UInt32, ppME : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mutual_exclusion.call(this, dwMEIndex, ppME)
    end
    def remove_mutual_exclusion(this : IWMProfile3*, pME : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_mutual_exclusion.call(this, pME)
    end
    def add_mutual_exclusion(this : IWMProfile3*, pME : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_mutual_exclusion.call(this, pME)
    end
    def create_new_mutual_exclusion(this : IWMProfile3*, ppME : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_mutual_exclusion.call(this, ppME)
    end
    def get_profile_id(this : IWMProfile3*, pguidID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile_id.call(this, pguidID)
    end
    def get_storage_format(this : IWMProfile3*, pnStorageFormat : Win32cr::Media::WindowsMediaFormat::WMT_STORAGE_FORMAT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_storage_format.call(this, pnStorageFormat)
    end
    def set_storage_format(this : IWMProfile3*, nStorageFormat : Win32cr::Media::WindowsMediaFormat::WMT_STORAGE_FORMAT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_storage_format.call(this, nStorageFormat)
    end
    def get_bandwidth_sharing_count(this : IWMProfile3*, pcBS : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bandwidth_sharing_count.call(this, pcBS)
    end
    def get_bandwidth_sharing(this : IWMProfile3*, dwBSIndex : UInt32, ppBS : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bandwidth_sharing.call(this, dwBSIndex, ppBS)
    end
    def remove_bandwidth_sharing(this : IWMProfile3*, pBS : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_bandwidth_sharing.call(this, pBS)
    end
    def add_bandwidth_sharing(this : IWMProfile3*, pBS : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_bandwidth_sharing.call(this, pBS)
    end
    def create_new_bandwidth_sharing(this : IWMProfile3*, ppBS : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_bandwidth_sharing.call(this, ppBS)
    end
    def get_stream_prioritization(this : IWMProfile3*, ppSP : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_prioritization.call(this, ppSP)
    end
    def set_stream_prioritization(this : IWMProfile3*, pSP : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_prioritization.call(this, pSP)
    end
    def remove_stream_prioritization(this : IWMProfile3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream_prioritization.call(this)
    end
    def create_new_stream_prioritization(this : IWMProfile3*, ppSP : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_new_stream_prioritization.call(this, ppSP)
    end
    def get_expected_packet_count(this : IWMProfile3*, msDuration : UInt64, pcPackets : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_expected_packet_count.call(this, msDuration, pcPackets)
    end

  end

  @[Extern]
  record IWMStreamConfigVtbl,
    query_interface : Proc(IWMStreamConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMStreamConfig*, UInt32),
    release : Proc(IWMStreamConfig*, UInt32),
    get_stream_type : Proc(IWMStreamConfig*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_stream_number : Proc(IWMStreamConfig*, UInt16*, Win32cr::Foundation::HRESULT),
    set_stream_number : Proc(IWMStreamConfig*, UInt16, Win32cr::Foundation::HRESULT),
    get_stream_name : Proc(IWMStreamConfig*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_stream_name : Proc(IWMStreamConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_connection_name : Proc(IWMStreamConfig*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_connection_name : Proc(IWMStreamConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_bitrate : Proc(IWMStreamConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    set_bitrate : Proc(IWMStreamConfig*, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer_window : Proc(IWMStreamConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    set_buffer_window : Proc(IWMStreamConfig*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMStreamConfig, lpVtbl : IWMStreamConfigVtbl* do
    GUID = LibC::GUID.new(0x96406bdc_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMStreamConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMStreamConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMStreamConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stream_type(this : IWMStreamConfig*, pguidStreamType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_type.call(this, pguidStreamType)
    end
    def get_stream_number(this : IWMStreamConfig*, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_number.call(this, pwStreamNum)
    end
    def set_stream_number(this : IWMStreamConfig*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_number.call(this, wStreamNum)
    end
    def get_stream_name(this : IWMStreamConfig*, pwszStreamName : UInt16*, pcchStreamName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_name.call(this, pwszStreamName, pcchStreamName)
    end
    def set_stream_name(this : IWMStreamConfig*, pwszStreamName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_name.call(this, pwszStreamName)
    end
    def get_connection_name(this : IWMStreamConfig*, pwszInputName : UInt16*, pcchInputName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_name.call(this, pwszInputName, pcchInputName)
    end
    def set_connection_name(this : IWMStreamConfig*, pwszInputName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_name.call(this, pwszInputName)
    end
    def get_bitrate(this : IWMStreamConfig*, pdwBitrate : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitrate.call(this, pdwBitrate)
    end
    def set_bitrate(this : IWMStreamConfig*, pdwBitrate : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitrate.call(this, pdwBitrate)
    end
    def get_buffer_window(this : IWMStreamConfig*, pmsBufferWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_window.call(this, pmsBufferWindow)
    end
    def set_buffer_window(this : IWMStreamConfig*, msBufferWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_window.call(this, msBufferWindow)
    end

  end

  @[Extern]
  record IWMStreamConfig2Vtbl,
    query_interface : Proc(IWMStreamConfig2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMStreamConfig2*, UInt32),
    release : Proc(IWMStreamConfig2*, UInt32),
    get_stream_type : Proc(IWMStreamConfig2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_stream_number : Proc(IWMStreamConfig2*, UInt16*, Win32cr::Foundation::HRESULT),
    set_stream_number : Proc(IWMStreamConfig2*, UInt16, Win32cr::Foundation::HRESULT),
    get_stream_name : Proc(IWMStreamConfig2*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_stream_name : Proc(IWMStreamConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_connection_name : Proc(IWMStreamConfig2*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_connection_name : Proc(IWMStreamConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_bitrate : Proc(IWMStreamConfig2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_bitrate : Proc(IWMStreamConfig2*, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer_window : Proc(IWMStreamConfig2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_buffer_window : Proc(IWMStreamConfig2*, UInt32, Win32cr::Foundation::HRESULT),
    get_transport_type : Proc(IWMStreamConfig2*, Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE*, Win32cr::Foundation::HRESULT),
    set_transport_type : Proc(IWMStreamConfig2*, Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE, Win32cr::Foundation::HRESULT),
    add_data_unit_extension : Proc(IWMStreamConfig2*, LibC::GUID, UInt16, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_data_unit_extension_count : Proc(IWMStreamConfig2*, UInt16*, Win32cr::Foundation::HRESULT),
    get_data_unit_extension : Proc(IWMStreamConfig2*, UInt16, LibC::GUID*, UInt16*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_all_data_unit_extensions : Proc(IWMStreamConfig2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMStreamConfig2, lpVtbl : IWMStreamConfig2Vtbl* do
    GUID = LibC::GUID.new(0x7688d8cb_u32, 0xfc0d_u16, 0x43bd_u16, StaticArray[0x94_u8, 0x59_u8, 0x5a_u8, 0x8d_u8, 0xec_u8, 0x20_u8, 0xc_u8, 0xfa_u8])
    def query_interface(this : IWMStreamConfig2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMStreamConfig2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMStreamConfig2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stream_type(this : IWMStreamConfig2*, pguidStreamType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_type.call(this, pguidStreamType)
    end
    def get_stream_number(this : IWMStreamConfig2*, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_number.call(this, pwStreamNum)
    end
    def set_stream_number(this : IWMStreamConfig2*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_number.call(this, wStreamNum)
    end
    def get_stream_name(this : IWMStreamConfig2*, pwszStreamName : UInt16*, pcchStreamName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_name.call(this, pwszStreamName, pcchStreamName)
    end
    def set_stream_name(this : IWMStreamConfig2*, pwszStreamName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_name.call(this, pwszStreamName)
    end
    def get_connection_name(this : IWMStreamConfig2*, pwszInputName : UInt16*, pcchInputName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_name.call(this, pwszInputName, pcchInputName)
    end
    def set_connection_name(this : IWMStreamConfig2*, pwszInputName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_name.call(this, pwszInputName)
    end
    def get_bitrate(this : IWMStreamConfig2*, pdwBitrate : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitrate.call(this, pdwBitrate)
    end
    def set_bitrate(this : IWMStreamConfig2*, pdwBitrate : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitrate.call(this, pdwBitrate)
    end
    def get_buffer_window(this : IWMStreamConfig2*, pmsBufferWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_window.call(this, pmsBufferWindow)
    end
    def set_buffer_window(this : IWMStreamConfig2*, msBufferWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_window.call(this, msBufferWindow)
    end
    def get_transport_type(this : IWMStreamConfig2*, pnTransportType : Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_type.call(this, pnTransportType)
    end
    def set_transport_type(this : IWMStreamConfig2*, nTransportType : Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transport_type.call(this, nTransportType)
    end
    def add_data_unit_extension(this : IWMStreamConfig2*, guidExtensionSystemID : LibC::GUID, cbExtensionDataSize : UInt16, pbExtensionSystemInfo : UInt8*, cbExtensionSystemInfo : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_data_unit_extension.call(this, guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo)
    end
    def get_data_unit_extension_count(this : IWMStreamConfig2*, pcDataUnitExtensions : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_unit_extension_count.call(this, pcDataUnitExtensions)
    end
    def get_data_unit_extension(this : IWMStreamConfig2*, wDataUnitExtensionNumber : UInt16, pguidExtensionSystemID : LibC::GUID*, pcbExtensionDataSize : UInt16*, pbExtensionSystemInfo : UInt8*, pcbExtensionSystemInfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_unit_extension.call(this, wDataUnitExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo)
    end
    def remove_all_data_unit_extensions(this : IWMStreamConfig2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_data_unit_extensions.call(this)
    end

  end

  @[Extern]
  record IWMStreamConfig3Vtbl,
    query_interface : Proc(IWMStreamConfig3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMStreamConfig3*, UInt32),
    release : Proc(IWMStreamConfig3*, UInt32),
    get_stream_type : Proc(IWMStreamConfig3*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_stream_number : Proc(IWMStreamConfig3*, UInt16*, Win32cr::Foundation::HRESULT),
    set_stream_number : Proc(IWMStreamConfig3*, UInt16, Win32cr::Foundation::HRESULT),
    get_stream_name : Proc(IWMStreamConfig3*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_stream_name : Proc(IWMStreamConfig3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_connection_name : Proc(IWMStreamConfig3*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_connection_name : Proc(IWMStreamConfig3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_bitrate : Proc(IWMStreamConfig3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_bitrate : Proc(IWMStreamConfig3*, UInt32, Win32cr::Foundation::HRESULT),
    get_buffer_window : Proc(IWMStreamConfig3*, UInt32*, Win32cr::Foundation::HRESULT),
    set_buffer_window : Proc(IWMStreamConfig3*, UInt32, Win32cr::Foundation::HRESULT),
    get_transport_type : Proc(IWMStreamConfig3*, Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE*, Win32cr::Foundation::HRESULT),
    set_transport_type : Proc(IWMStreamConfig3*, Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE, Win32cr::Foundation::HRESULT),
    add_data_unit_extension : Proc(IWMStreamConfig3*, LibC::GUID, UInt16, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_data_unit_extension_count : Proc(IWMStreamConfig3*, UInt16*, Win32cr::Foundation::HRESULT),
    get_data_unit_extension : Proc(IWMStreamConfig3*, UInt16, LibC::GUID*, UInt16*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    remove_all_data_unit_extensions : Proc(IWMStreamConfig3*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IWMStreamConfig3*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_language : Proc(IWMStreamConfig3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMStreamConfig3, lpVtbl : IWMStreamConfig3Vtbl* do
    GUID = LibC::GUID.new(0xcb164104_u32, 0x3aa9_u16, 0x45a7_u16, StaticArray[0x9a_u8, 0xc9_u8, 0x4d_u8, 0xae_u8, 0xe1_u8, 0x31_u8, 0xd6_u8, 0xe1_u8])
    def query_interface(this : IWMStreamConfig3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMStreamConfig3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMStreamConfig3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_stream_type(this : IWMStreamConfig3*, pguidStreamType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_type.call(this, pguidStreamType)
    end
    def get_stream_number(this : IWMStreamConfig3*, pwStreamNum : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_number.call(this, pwStreamNum)
    end
    def set_stream_number(this : IWMStreamConfig3*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_number.call(this, wStreamNum)
    end
    def get_stream_name(this : IWMStreamConfig3*, pwszStreamName : UInt16*, pcchStreamName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_name.call(this, pwszStreamName, pcchStreamName)
    end
    def set_stream_name(this : IWMStreamConfig3*, pwszStreamName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stream_name.call(this, pwszStreamName)
    end
    def get_connection_name(this : IWMStreamConfig3*, pwszInputName : UInt16*, pcchInputName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_name.call(this, pwszInputName, pcchInputName)
    end
    def set_connection_name(this : IWMStreamConfig3*, pwszInputName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_name.call(this, pwszInputName)
    end
    def get_bitrate(this : IWMStreamConfig3*, pdwBitrate : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bitrate.call(this, pdwBitrate)
    end
    def set_bitrate(this : IWMStreamConfig3*, pdwBitrate : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitrate.call(this, pdwBitrate)
    end
    def get_buffer_window(this : IWMStreamConfig3*, pmsBufferWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_window.call(this, pmsBufferWindow)
    end
    def set_buffer_window(this : IWMStreamConfig3*, msBufferWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffer_window.call(this, msBufferWindow)
    end
    def get_transport_type(this : IWMStreamConfig3*, pnTransportType : Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transport_type.call(this, pnTransportType)
    end
    def set_transport_type(this : IWMStreamConfig3*, nTransportType : Win32cr::Media::WindowsMediaFormat::WMT_TRANSPORT_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transport_type.call(this, nTransportType)
    end
    def add_data_unit_extension(this : IWMStreamConfig3*, guidExtensionSystemID : LibC::GUID, cbExtensionDataSize : UInt16, pbExtensionSystemInfo : UInt8*, cbExtensionSystemInfo : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_data_unit_extension.call(this, guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo)
    end
    def get_data_unit_extension_count(this : IWMStreamConfig3*, pcDataUnitExtensions : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_unit_extension_count.call(this, pcDataUnitExtensions)
    end
    def get_data_unit_extension(this : IWMStreamConfig3*, wDataUnitExtensionNumber : UInt16, pguidExtensionSystemID : LibC::GUID*, pcbExtensionDataSize : UInt16*, pbExtensionSystemInfo : UInt8*, pcbExtensionSystemInfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_unit_extension.call(this, wDataUnitExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo)
    end
    def remove_all_data_unit_extensions(this : IWMStreamConfig3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_data_unit_extensions.call(this)
    end
    def get_language(this : IWMStreamConfig3*, pwszLanguageString : UInt16*, pcchLanguageStringLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, pwszLanguageString, pcchLanguageStringLength)
    end
    def set_language(this : IWMStreamConfig3*, pwszLanguageString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language.call(this, pwszLanguageString)
    end

  end

  @[Extern]
  record IWMPacketSizeVtbl,
    query_interface : Proc(IWMPacketSize*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMPacketSize*, UInt32),
    release : Proc(IWMPacketSize*, UInt32),
    get_max_packet_size : Proc(IWMPacketSize*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_packet_size : Proc(IWMPacketSize*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMPacketSize, lpVtbl : IWMPacketSizeVtbl* do
    GUID = LibC::GUID.new(0xcdfb97ab_u32, 0x188f_u16, 0x40b3_u16, StaticArray[0xb6_u8, 0x43_u8, 0x5b_u8, 0x79_u8, 0x3_u8, 0x97_u8, 0x5c_u8, 0x59_u8])
    def query_interface(this : IWMPacketSize*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMPacketSize*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMPacketSize*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_max_packet_size(this : IWMPacketSize*, pdwMaxPacketSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_packet_size.call(this, pdwMaxPacketSize)
    end
    def set_max_packet_size(this : IWMPacketSize*, dwMaxPacketSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_packet_size.call(this, dwMaxPacketSize)
    end

  end

  @[Extern]
  record IWMPacketSize2Vtbl,
    query_interface : Proc(IWMPacketSize2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMPacketSize2*, UInt32),
    release : Proc(IWMPacketSize2*, UInt32),
    get_max_packet_size : Proc(IWMPacketSize2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_packet_size : Proc(IWMPacketSize2*, UInt32, Win32cr::Foundation::HRESULT),
    get_min_packet_size : Proc(IWMPacketSize2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_min_packet_size : Proc(IWMPacketSize2*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMPacketSize2, lpVtbl : IWMPacketSize2Vtbl* do
    GUID = LibC::GUID.new(0x8bfc2b9e_u32, 0xb646_u16, 0x4233_u16, StaticArray[0xa8_u8, 0x77_u8, 0x1c_u8, 0x6a_u8, 0x7_u8, 0x96_u8, 0x69_u8, 0xdc_u8])
    def query_interface(this : IWMPacketSize2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMPacketSize2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMPacketSize2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_max_packet_size(this : IWMPacketSize2*, pdwMaxPacketSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_packet_size.call(this, pdwMaxPacketSize)
    end
    def set_max_packet_size(this : IWMPacketSize2*, dwMaxPacketSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_packet_size.call(this, dwMaxPacketSize)
    end
    def get_min_packet_size(this : IWMPacketSize2*, pdwMinPacketSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_packet_size.call(this, pdwMinPacketSize)
    end
    def set_min_packet_size(this : IWMPacketSize2*, dwMinPacketSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_packet_size.call(this, dwMinPacketSize)
    end

  end

  @[Extern]
  record IWMStreamListVtbl,
    query_interface : Proc(IWMStreamList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMStreamList*, UInt32),
    release : Proc(IWMStreamList*, UInt32),
    get_streams : Proc(IWMStreamList*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMStreamList*, UInt16, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMStreamList*, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMStreamList, lpVtbl : IWMStreamListVtbl* do
    GUID = LibC::GUID.new(0x96406bdd_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMStreamList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMStreamList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMStreamList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_streams(this : IWMStreamList*, pwStreamNumArray : UInt16*, pcStreams : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams.call(this, pwStreamNumArray, pcStreams)
    end
    def add_stream(this : IWMStreamList*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, wStreamNum)
    end
    def remove_stream(this : IWMStreamList*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, wStreamNum)
    end

  end

  @[Extern]
  record IWMMutualExclusionVtbl,
    query_interface : Proc(IWMMutualExclusion*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMMutualExclusion*, UInt32),
    release : Proc(IWMMutualExclusion*, UInt32),
    get_streams : Proc(IWMMutualExclusion*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMMutualExclusion*, UInt16, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMMutualExclusion*, UInt16, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWMMutualExclusion*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_type : Proc(IWMMutualExclusion*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMMutualExclusion, lpVtbl : IWMMutualExclusionVtbl* do
    GUID = LibC::GUID.new(0x96406bde_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMMutualExclusion*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMMutualExclusion*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMMutualExclusion*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_streams(this : IWMMutualExclusion*, pwStreamNumArray : UInt16*, pcStreams : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams.call(this, pwStreamNumArray, pcStreams)
    end
    def add_stream(this : IWMMutualExclusion*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, wStreamNum)
    end
    def remove_stream(this : IWMMutualExclusion*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, wStreamNum)
    end
    def get_type(this : IWMMutualExclusion*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def set_type(this : IWMMutualExclusion*, guidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_type.call(this, guidType)
    end

  end

  @[Extern]
  record IWMMutualExclusion2Vtbl,
    query_interface : Proc(IWMMutualExclusion2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMMutualExclusion2*, UInt32),
    release : Proc(IWMMutualExclusion2*, UInt32),
    get_streams : Proc(IWMMutualExclusion2*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMMutualExclusion2*, UInt16, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMMutualExclusion2*, UInt16, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWMMutualExclusion2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_type : Proc(IWMMutualExclusion2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_name : Proc(IWMMutualExclusion2*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_name : Proc(IWMMutualExclusion2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_record_count : Proc(IWMMutualExclusion2*, UInt16*, Win32cr::Foundation::HRESULT),
    add_record : Proc(IWMMutualExclusion2*, Win32cr::Foundation::HRESULT),
    remove_record : Proc(IWMMutualExclusion2*, UInt16, Win32cr::Foundation::HRESULT),
    get_record_name : Proc(IWMMutualExclusion2*, UInt16, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    set_record_name : Proc(IWMMutualExclusion2*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_streams_for_record : Proc(IWMMutualExclusion2*, UInt16, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    add_stream_for_record : Proc(IWMMutualExclusion2*, UInt16, UInt16, Win32cr::Foundation::HRESULT),
    remove_stream_for_record : Proc(IWMMutualExclusion2*, UInt16, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMMutualExclusion2, lpVtbl : IWMMutualExclusion2Vtbl* do
    GUID = LibC::GUID.new(0x302b57d_u32, 0x89d1_u16, 0x4ba2_u16, StaticArray[0x85_u8, 0xc9_u8, 0x16_u8, 0x6f_u8, 0x2c_u8, 0x53_u8, 0xeb_u8, 0x91_u8])
    def query_interface(this : IWMMutualExclusion2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMMutualExclusion2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMMutualExclusion2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_streams(this : IWMMutualExclusion2*, pwStreamNumArray : UInt16*, pcStreams : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams.call(this, pwStreamNumArray, pcStreams)
    end
    def add_stream(this : IWMMutualExclusion2*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, wStreamNum)
    end
    def remove_stream(this : IWMMutualExclusion2*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, wStreamNum)
    end
    def get_type(this : IWMMutualExclusion2*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def set_type(this : IWMMutualExclusion2*, guidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_type.call(this, guidType)
    end
    def get_name(this : IWMMutualExclusion2*, pwszName : UInt16*, pcchName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name.call(this, pwszName, pcchName)
    end
    def set_name(this : IWMMutualExclusion2*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_name.call(this, pwszName)
    end
    def get_record_count(this : IWMMutualExclusion2*, pwRecordCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_record_count.call(this, pwRecordCount)
    end
    def add_record(this : IWMMutualExclusion2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_record.call(this)
    end
    def remove_record(this : IWMMutualExclusion2*, wRecordNumber : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_record.call(this, wRecordNumber)
    end
    def get_record_name(this : IWMMutualExclusion2*, wRecordNumber : UInt16, pwszRecordName : UInt16*, pcchRecordName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_record_name.call(this, wRecordNumber, pwszRecordName, pcchRecordName)
    end
    def set_record_name(this : IWMMutualExclusion2*, wRecordNumber : UInt16, pwszRecordName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_record_name.call(this, wRecordNumber, pwszRecordName)
    end
    def get_streams_for_record(this : IWMMutualExclusion2*, wRecordNumber : UInt16, pwStreamNumArray : UInt16*, pcStreams : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams_for_record.call(this, wRecordNumber, pwStreamNumArray, pcStreams)
    end
    def add_stream_for_record(this : IWMMutualExclusion2*, wRecordNumber : UInt16, wStreamNumber : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream_for_record.call(this, wRecordNumber, wStreamNumber)
    end
    def remove_stream_for_record(this : IWMMutualExclusion2*, wRecordNumber : UInt16, wStreamNumber : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream_for_record.call(this, wRecordNumber, wStreamNumber)
    end

  end

  @[Extern]
  record IWMBandwidthSharingVtbl,
    query_interface : Proc(IWMBandwidthSharing*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMBandwidthSharing*, UInt32),
    release : Proc(IWMBandwidthSharing*, UInt32),
    get_streams : Proc(IWMBandwidthSharing*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    add_stream : Proc(IWMBandwidthSharing*, UInt16, Win32cr::Foundation::HRESULT),
    remove_stream : Proc(IWMBandwidthSharing*, UInt16, Win32cr::Foundation::HRESULT),
    get_type : Proc(IWMBandwidthSharing*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_type : Proc(IWMBandwidthSharing*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_bandwidth : Proc(IWMBandwidthSharing*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_bandwidth : Proc(IWMBandwidthSharing*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMBandwidthSharing, lpVtbl : IWMBandwidthSharingVtbl* do
    GUID = LibC::GUID.new(0xad694af1_u32, 0xf8d9_u16, 0x42f8_u16, StaticArray[0xbc_u8, 0x47_u8, 0x70_u8, 0x31_u8, 0x1b_u8, 0xc_u8, 0x4f_u8, 0x9e_u8])
    def query_interface(this : IWMBandwidthSharing*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMBandwidthSharing*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMBandwidthSharing*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_streams(this : IWMBandwidthSharing*, pwStreamNumArray : UInt16*, pcStreams : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams.call(this, pwStreamNumArray, pcStreams)
    end
    def add_stream(this : IWMBandwidthSharing*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_stream.call(this, wStreamNum)
    end
    def remove_stream(this : IWMBandwidthSharing*, wStreamNum : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_stream.call(this, wStreamNum)
    end
    def get_type(this : IWMBandwidthSharing*, pguidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguidType)
    end
    def set_type(this : IWMBandwidthSharing*, guidType : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_type.call(this, guidType)
    end
    def get_bandwidth(this : IWMBandwidthSharing*, pdwBitrate : UInt32*, pmsBufferWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bandwidth.call(this, pdwBitrate, pmsBufferWindow)
    end
    def set_bandwidth(this : IWMBandwidthSharing*, dwBitrate : UInt32, msBufferWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bandwidth.call(this, dwBitrate, msBufferWindow)
    end

  end

  @[Extern]
  record IWMStreamPrioritizationVtbl,
    query_interface : Proc(IWMStreamPrioritization*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMStreamPrioritization*, UInt32),
    release : Proc(IWMStreamPrioritization*, UInt32),
    get_priority_records : Proc(IWMStreamPrioritization*, Win32cr::Media::WindowsMediaFormat::WM_STREAM_PRIORITY_RECORD*, UInt16*, Win32cr::Foundation::HRESULT),
    set_priority_records : Proc(IWMStreamPrioritization*, Win32cr::Media::WindowsMediaFormat::WM_STREAM_PRIORITY_RECORD*, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMStreamPrioritization, lpVtbl : IWMStreamPrioritizationVtbl* do
    GUID = LibC::GUID.new(0x8c1c6090_u32, 0xf9a8_u16, 0x4748_u16, StaticArray[0x8e_u8, 0xc3_u8, 0xdd_u8, 0x11_u8, 0x8_u8, 0xba_u8, 0x1e_u8, 0x77_u8])
    def query_interface(this : IWMStreamPrioritization*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMStreamPrioritization*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMStreamPrioritization*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_priority_records(this : IWMStreamPrioritization*, pRecordArray : Win32cr::Media::WindowsMediaFormat::WM_STREAM_PRIORITY_RECORD*, pcRecords : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority_records.call(this, pRecordArray, pcRecords)
    end
    def set_priority_records(this : IWMStreamPrioritization*, pRecordArray : Win32cr::Media::WindowsMediaFormat::WM_STREAM_PRIORITY_RECORD*, cRecords : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority_records.call(this, pRecordArray, cRecords)
    end

  end

  @[Extern]
  record IWMWriterAdvancedVtbl,
    query_interface : Proc(IWMWriterAdvanced*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterAdvanced*, UInt32),
    release : Proc(IWMWriterAdvanced*, UInt32),
    get_sink_count : Proc(IWMWriterAdvanced*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sink : Proc(IWMWriterAdvanced*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_sink : Proc(IWMWriterAdvanced*, Void*, Win32cr::Foundation::HRESULT),
    remove_sink : Proc(IWMWriterAdvanced*, Void*, Win32cr::Foundation::HRESULT),
    write_stream_sample : Proc(IWMWriterAdvanced*, UInt16, UInt64, UInt32, UInt64, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_live_source : Proc(IWMWriterAdvanced*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterAdvanced*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_writer_time : Proc(IWMWriterAdvanced*, UInt64*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMWriterAdvanced*, UInt16, Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_sync_tolerance : Proc(IWMWriterAdvanced*, UInt32, Win32cr::Foundation::HRESULT),
    get_sync_tolerance : Proc(IWMWriterAdvanced*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterAdvanced, lpVtbl : IWMWriterAdvancedVtbl* do
    GUID = LibC::GUID.new(0x96406be3_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMWriterAdvanced*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterAdvanced*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterAdvanced*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sink_count(this : IWMWriterAdvanced*, pcSinks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sink_count.call(this, pcSinks)
    end
    def get_sink(this : IWMWriterAdvanced*, dwSinkNum : UInt32, ppSink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sink.call(this, dwSinkNum, ppSink)
    end
    def add_sink(this : IWMWriterAdvanced*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_sink.call(this, pSink)
    end
    def remove_sink(this : IWMWriterAdvanced*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_sink.call(this, pSink)
    end
    def write_stream_sample(this : IWMWriterAdvanced*, wStreamNum : UInt16, cnsSampleTime : UInt64, msSampleSendTime : UInt32, cnsSampleDuration : UInt64, dwFlags : UInt32, pSample : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_stream_sample.call(this, wStreamNum, cnsSampleTime, msSampleSendTime, cnsSampleDuration, dwFlags, pSample)
    end
    def set_live_source(this : IWMWriterAdvanced*, fIsLiveSource : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_live_source.call(this, fIsLiveSource)
    end
    def is_real_time(this : IWMWriterAdvanced*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def get_writer_time(this : IWMWriterAdvanced*, pcnsCurrentTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_writer_time.call(this, pcnsCurrentTime)
    end
    def get_statistics(this : IWMWriterAdvanced*, wStreamNum : UInt16, pStats : Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, wStreamNum, pStats)
    end
    def set_sync_tolerance(this : IWMWriterAdvanced*, msWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sync_tolerance.call(this, msWindow)
    end
    def get_sync_tolerance(this : IWMWriterAdvanced*, pmsWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_tolerance.call(this, pmsWindow)
    end

  end

  @[Extern]
  record IWMWriterAdvanced2Vtbl,
    query_interface : Proc(IWMWriterAdvanced2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterAdvanced2*, UInt32),
    release : Proc(IWMWriterAdvanced2*, UInt32),
    get_sink_count : Proc(IWMWriterAdvanced2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sink : Proc(IWMWriterAdvanced2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_sink : Proc(IWMWriterAdvanced2*, Void*, Win32cr::Foundation::HRESULT),
    remove_sink : Proc(IWMWriterAdvanced2*, Void*, Win32cr::Foundation::HRESULT),
    write_stream_sample : Proc(IWMWriterAdvanced2*, UInt16, UInt64, UInt32, UInt64, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_live_source : Proc(IWMWriterAdvanced2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterAdvanced2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_writer_time : Proc(IWMWriterAdvanced2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMWriterAdvanced2*, UInt16, Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_sync_tolerance : Proc(IWMWriterAdvanced2*, UInt32, Win32cr::Foundation::HRESULT),
    get_sync_tolerance : Proc(IWMWriterAdvanced2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_setting : Proc(IWMWriterAdvanced2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_input_setting : Proc(IWMWriterAdvanced2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterAdvanced2, lpVtbl : IWMWriterAdvanced2Vtbl* do
    GUID = LibC::GUID.new(0x962dc1ec_u32, 0xc046_u16, 0x4db8_u16, StaticArray[0x9c_u8, 0xc7_u8, 0x26_u8, 0xce_u8, 0xae_u8, 0x50_u8, 0x8_u8, 0x17_u8])
    def query_interface(this : IWMWriterAdvanced2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterAdvanced2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterAdvanced2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sink_count(this : IWMWriterAdvanced2*, pcSinks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sink_count.call(this, pcSinks)
    end
    def get_sink(this : IWMWriterAdvanced2*, dwSinkNum : UInt32, ppSink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sink.call(this, dwSinkNum, ppSink)
    end
    def add_sink(this : IWMWriterAdvanced2*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_sink.call(this, pSink)
    end
    def remove_sink(this : IWMWriterAdvanced2*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_sink.call(this, pSink)
    end
    def write_stream_sample(this : IWMWriterAdvanced2*, wStreamNum : UInt16, cnsSampleTime : UInt64, msSampleSendTime : UInt32, cnsSampleDuration : UInt64, dwFlags : UInt32, pSample : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_stream_sample.call(this, wStreamNum, cnsSampleTime, msSampleSendTime, cnsSampleDuration, dwFlags, pSample)
    end
    def set_live_source(this : IWMWriterAdvanced2*, fIsLiveSource : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_live_source.call(this, fIsLiveSource)
    end
    def is_real_time(this : IWMWriterAdvanced2*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def get_writer_time(this : IWMWriterAdvanced2*, pcnsCurrentTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_writer_time.call(this, pcnsCurrentTime)
    end
    def get_statistics(this : IWMWriterAdvanced2*, wStreamNum : UInt16, pStats : Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, wStreamNum, pStats)
    end
    def set_sync_tolerance(this : IWMWriterAdvanced2*, msWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sync_tolerance.call(this, msWindow)
    end
    def get_sync_tolerance(this : IWMWriterAdvanced2*, pmsWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_tolerance.call(this, pmsWindow)
    end
    def get_input_setting(this : IWMWriterAdvanced2*, dwInputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_setting.call(this, dwInputNum, pszName, pType, pValue, pcbLength)
    end
    def set_input_setting(this : IWMWriterAdvanced2*, dwInputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_setting.call(this, dwInputNum, pszName, type__, pValue, cbLength)
    end

  end

  @[Extern]
  record IWMWriterAdvanced3Vtbl,
    query_interface : Proc(IWMWriterAdvanced3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterAdvanced3*, UInt32),
    release : Proc(IWMWriterAdvanced3*, UInt32),
    get_sink_count : Proc(IWMWriterAdvanced3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_sink : Proc(IWMWriterAdvanced3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    add_sink : Proc(IWMWriterAdvanced3*, Void*, Win32cr::Foundation::HRESULT),
    remove_sink : Proc(IWMWriterAdvanced3*, Void*, Win32cr::Foundation::HRESULT),
    write_stream_sample : Proc(IWMWriterAdvanced3*, UInt16, UInt64, UInt32, UInt64, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_live_source : Proc(IWMWriterAdvanced3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterAdvanced3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_writer_time : Proc(IWMWriterAdvanced3*, UInt64*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMWriterAdvanced3*, UInt16, Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_sync_tolerance : Proc(IWMWriterAdvanced3*, UInt32, Win32cr::Foundation::HRESULT),
    get_sync_tolerance : Proc(IWMWriterAdvanced3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_setting : Proc(IWMWriterAdvanced3*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_input_setting : Proc(IWMWriterAdvanced3*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_statistics_ex : Proc(IWMWriterAdvanced3*, UInt16, Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS_EX*, Win32cr::Foundation::HRESULT),
    set_non_blocking : Proc(IWMWriterAdvanced3*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterAdvanced3, lpVtbl : IWMWriterAdvanced3Vtbl* do
    GUID = LibC::GUID.new(0x2cd6492d_u32, 0x7c37_u16, 0x4e76_u16, StaticArray[0x9d_u8, 0x3b_u8, 0x59_u8, 0x26_u8, 0x11_u8, 0x83_u8, 0xa2_u8, 0x2e_u8])
    def query_interface(this : IWMWriterAdvanced3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterAdvanced3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterAdvanced3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_sink_count(this : IWMWriterAdvanced3*, pcSinks : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sink_count.call(this, pcSinks)
    end
    def get_sink(this : IWMWriterAdvanced3*, dwSinkNum : UInt32, ppSink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sink.call(this, dwSinkNum, ppSink)
    end
    def add_sink(this : IWMWriterAdvanced3*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_sink.call(this, pSink)
    end
    def remove_sink(this : IWMWriterAdvanced3*, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_sink.call(this, pSink)
    end
    def write_stream_sample(this : IWMWriterAdvanced3*, wStreamNum : UInt16, cnsSampleTime : UInt64, msSampleSendTime : UInt32, cnsSampleDuration : UInt64, dwFlags : UInt32, pSample : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_stream_sample.call(this, wStreamNum, cnsSampleTime, msSampleSendTime, cnsSampleDuration, dwFlags, pSample)
    end
    def set_live_source(this : IWMWriterAdvanced3*, fIsLiveSource : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_live_source.call(this, fIsLiveSource)
    end
    def is_real_time(this : IWMWriterAdvanced3*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def get_writer_time(this : IWMWriterAdvanced3*, pcnsCurrentTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_writer_time.call(this, pcnsCurrentTime)
    end
    def get_statistics(this : IWMWriterAdvanced3*, wStreamNum : UInt16, pStats : Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, wStreamNum, pStats)
    end
    def set_sync_tolerance(this : IWMWriterAdvanced3*, msWindow : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sync_tolerance.call(this, msWindow)
    end
    def get_sync_tolerance(this : IWMWriterAdvanced3*, pmsWindow : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sync_tolerance.call(this, pmsWindow)
    end
    def get_input_setting(this : IWMWriterAdvanced3*, dwInputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_setting.call(this, dwInputNum, pszName, pType, pValue, pcbLength)
    end
    def set_input_setting(this : IWMWriterAdvanced3*, dwInputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input_setting.call(this, dwInputNum, pszName, type__, pValue, cbLength)
    end
    def get_statistics_ex(this : IWMWriterAdvanced3*, wStreamNum : UInt16, pStats : Win32cr::Media::WindowsMediaFormat::WM_WRITER_STATISTICS_EX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics_ex.call(this, wStreamNum, pStats)
    end
    def set_non_blocking(this : IWMWriterAdvanced3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_non_blocking.call(this)
    end

  end

  @[Extern]
  record IWMWriterPreprocessVtbl,
    query_interface : Proc(IWMWriterPreprocess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterPreprocess*, UInt32),
    release : Proc(IWMWriterPreprocess*, UInt32),
    get_max_preprocessing_passes : Proc(IWMWriterPreprocess*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_num_preprocessing_passes : Proc(IWMWriterPreprocess*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    begin_preprocessing_pass : Proc(IWMWriterPreprocess*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    preprocess_sample : Proc(IWMWriterPreprocess*, UInt32, UInt64, UInt32, Void*, Win32cr::Foundation::HRESULT),
    end_preprocessing_pass : Proc(IWMWriterPreprocess*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterPreprocess, lpVtbl : IWMWriterPreprocessVtbl* do
    GUID = LibC::GUID.new(0xfc54a285_u32, 0x38c4_u16, 0x45b5_u16, StaticArray[0xaa_u8, 0x23_u8, 0x85_u8, 0xb9_u8, 0xf7_u8, 0xcb_u8, 0x42_u8, 0x4b_u8])
    def query_interface(this : IWMWriterPreprocess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterPreprocess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterPreprocess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_max_preprocessing_passes(this : IWMWriterPreprocess*, dwInputNum : UInt32, dwFlags : UInt32, pdwMaxNumPasses : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_preprocessing_passes.call(this, dwInputNum, dwFlags, pdwMaxNumPasses)
    end
    def set_num_preprocessing_passes(this : IWMWriterPreprocess*, dwInputNum : UInt32, dwFlags : UInt32, dwNumPasses : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_num_preprocessing_passes.call(this, dwInputNum, dwFlags, dwNumPasses)
    end
    def begin_preprocessing_pass(this : IWMWriterPreprocess*, dwInputNum : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_preprocessing_pass.call(this, dwInputNum, dwFlags)
    end
    def preprocess_sample(this : IWMWriterPreprocess*, dwInputNum : UInt32, cnsSampleTime : UInt64, dwFlags : UInt32, pSample : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preprocess_sample.call(this, dwInputNum, cnsSampleTime, dwFlags, pSample)
    end
    def end_preprocessing_pass(this : IWMWriterPreprocess*, dwInputNum : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_preprocessing_pass.call(this, dwInputNum, dwFlags)
    end

  end

  @[Extern]
  record IWMWriterPostViewCallbackVtbl,
    query_interface : Proc(IWMWriterPostViewCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterPostViewCallback*, UInt32),
    release : Proc(IWMWriterPostViewCallback*, UInt32),
    on_status : Proc(IWMWriterPostViewCallback*, Win32cr::Media::WindowsMediaFormat::WMT_STATUS, Win32cr::Foundation::HRESULT, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, Void*, Win32cr::Foundation::HRESULT),
    on_post_view_sample : Proc(IWMWriterPostViewCallback*, UInt16, UInt64, UInt64, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    allocate_for_post_view : Proc(IWMWriterPostViewCallback*, UInt16, UInt32, Void**, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterPostViewCallback, lpVtbl : IWMWriterPostViewCallbackVtbl* do
    GUID = LibC::GUID.new(0xd9d6549d_u32, 0xa193_u16, 0x4f24_u16, StaticArray[0xb3_u8, 0x8_u8, 0x3_u8, 0x12_u8, 0x3d_u8, 0x9b_u8, 0x7f_u8, 0x8d_u8])
    def query_interface(this : IWMWriterPostViewCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterPostViewCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterPostViewCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_status(this : IWMWriterPostViewCallback*, status : Win32cr::Media::WindowsMediaFormat::WMT_STATUS, hr : Win32cr::Foundation::HRESULT, dwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status.call(this, status, hr, dwType, pValue, pvContext)
    end
    def on_post_view_sample(this : IWMWriterPostViewCallback*, wStreamNumber : UInt16, cnsSampleTime : UInt64, cnsSampleDuration : UInt64, dwFlags : UInt32, pSample : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_post_view_sample.call(this, wStreamNumber, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext)
    end
    def allocate_for_post_view(this : IWMWriterPostViewCallback*, wStreamNum : UInt16, cbBuffer : UInt32, ppBuffer : Void**, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_for_post_view.call(this, wStreamNum, cbBuffer, ppBuffer, pvContext)
    end

  end

  @[Extern]
  record IWMWriterPostViewVtbl,
    query_interface : Proc(IWMWriterPostView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterPostView*, UInt32),
    release : Proc(IWMWriterPostView*, UInt32),
    set_post_view_callback : Proc(IWMWriterPostView*, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_receive_post_view_samples : Proc(IWMWriterPostView*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_post_view_samples : Proc(IWMWriterPostView*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_post_view_props : Proc(IWMWriterPostView*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    set_post_view_props : Proc(IWMWriterPostView*, UInt16, Void*, Win32cr::Foundation::HRESULT),
    get_post_view_format_count : Proc(IWMWriterPostView*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    get_post_view_format : Proc(IWMWriterPostView*, UInt16, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_allocate_for_post_view : Proc(IWMWriterPostView*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_post_view : Proc(IWMWriterPostView*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterPostView, lpVtbl : IWMWriterPostViewVtbl* do
    GUID = LibC::GUID.new(0x81e20ce4_u32, 0x75ef_u16, 0x491a_u16, StaticArray[0x80_u8, 0x4_u8, 0xfc_u8, 0x53_u8, 0xc4_u8, 0x5b_u8, 0xdc_u8, 0x3e_u8])
    def query_interface(this : IWMWriterPostView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterPostView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterPostView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_post_view_callback(this : IWMWriterPostView*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_view_callback.call(this, pCallback, pvContext)
    end
    def set_receive_post_view_samples(this : IWMWriterPostView*, wStreamNum : UInt16, fReceivePostViewSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_post_view_samples.call(this, wStreamNum, fReceivePostViewSamples)
    end
    def get_receive_post_view_samples(this : IWMWriterPostView*, wStreamNum : UInt16, pfReceivePostViewSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_post_view_samples.call(this, wStreamNum, pfReceivePostViewSamples)
    end
    def get_post_view_props(this : IWMWriterPostView*, wStreamNumber : UInt16, ppOutput : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_view_props.call(this, wStreamNumber, ppOutput)
    end
    def set_post_view_props(this : IWMWriterPostView*, wStreamNumber : UInt16, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_post_view_props.call(this, wStreamNumber, pOutput)
    end
    def get_post_view_format_count(this : IWMWriterPostView*, wStreamNumber : UInt16, pcFormats : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_view_format_count.call(this, wStreamNumber, pcFormats)
    end
    def get_post_view_format(this : IWMWriterPostView*, wStreamNumber : UInt16, dwFormatNumber : UInt32, ppProps : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_post_view_format.call(this, wStreamNumber, dwFormatNumber, ppProps)
    end
    def set_allocate_for_post_view(this : IWMWriterPostView*, wStreamNumber : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_post_view.call(this, wStreamNumber, fAllocate)
    end
    def get_allocate_for_post_view(this : IWMWriterPostView*, wStreamNumber : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_post_view.call(this, wStreamNumber, pfAllocate)
    end

  end

  @[Extern]
  record IWMWriterSinkVtbl,
    query_interface : Proc(IWMWriterSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterSink*, UInt32),
    release : Proc(IWMWriterSink*, UInt32),
    on_header : Proc(IWMWriterSink*, Void*, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterSink*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    allocate_data_unit : Proc(IWMWriterSink*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_data_unit : Proc(IWMWriterSink*, Void*, Win32cr::Foundation::HRESULT),
    on_end_writing : Proc(IWMWriterSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterSink, lpVtbl : IWMWriterSinkVtbl* do
    GUID = LibC::GUID.new(0x96406be4_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMWriterSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_header(this : IWMWriterSink*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_header.call(this, pHeader)
    end
    def is_real_time(this : IWMWriterSink*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def allocate_data_unit(this : IWMWriterSink*, cbDataUnit : UInt32, ppDataUnit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_data_unit.call(this, cbDataUnit, ppDataUnit)
    end
    def on_data_unit(this : IWMWriterSink*, pDataUnit : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit.call(this, pDataUnit)
    end
    def on_end_writing(this : IWMWriterSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_writing.call(this)
    end

  end

  @[Extern]
  record IWMRegisterCallbackVtbl,
    query_interface : Proc(IWMRegisterCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMRegisterCallback*, UInt32),
    release : Proc(IWMRegisterCallback*, UInt32),
    advise : Proc(IWMRegisterCallback*, Void*, Void*, Win32cr::Foundation::HRESULT),
    unadvise : Proc(IWMRegisterCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMRegisterCallback, lpVtbl : IWMRegisterCallbackVtbl* do
    GUID = LibC::GUID.new(0xcf4b1f99_u32, 0x4de2_u16, 0x4e49_u16, StaticArray[0xa3_u8, 0x63_u8, 0x25_u8, 0x27_u8, 0x40_u8, 0xd9_u8, 0x9b_u8, 0xc1_u8])
    def query_interface(this : IWMRegisterCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMRegisterCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMRegisterCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise(this : IWMRegisterCallback*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise.call(this, pCallback, pvContext)
    end
    def unadvise(this : IWMRegisterCallback*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise.call(this, pCallback, pvContext)
    end

  end

  @[Extern]
  record IWMWriterFileSinkVtbl,
    query_interface : Proc(IWMWriterFileSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterFileSink*, UInt32),
    release : Proc(IWMWriterFileSink*, UInt32),
    on_header : Proc(IWMWriterFileSink*, Void*, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterFileSink*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    allocate_data_unit : Proc(IWMWriterFileSink*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_data_unit : Proc(IWMWriterFileSink*, Void*, Win32cr::Foundation::HRESULT),
    on_end_writing : Proc(IWMWriterFileSink*, Win32cr::Foundation::HRESULT),
    open : Proc(IWMWriterFileSink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterFileSink, lpVtbl : IWMWriterFileSinkVtbl* do
    GUID = LibC::GUID.new(0x96406be5_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMWriterFileSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterFileSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterFileSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_header(this : IWMWriterFileSink*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_header.call(this, pHeader)
    end
    def is_real_time(this : IWMWriterFileSink*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def allocate_data_unit(this : IWMWriterFileSink*, cbDataUnit : UInt32, ppDataUnit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_data_unit.call(this, cbDataUnit, ppDataUnit)
    end
    def on_data_unit(this : IWMWriterFileSink*, pDataUnit : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit.call(this, pDataUnit)
    end
    def on_end_writing(this : IWMWriterFileSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_writing.call(this)
    end
    def open(this : IWMWriterFileSink*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end

  end

  @[Extern]
  record IWMWriterFileSink2Vtbl,
    query_interface : Proc(IWMWriterFileSink2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterFileSink2*, UInt32),
    release : Proc(IWMWriterFileSink2*, UInt32),
    on_header : Proc(IWMWriterFileSink2*, Void*, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterFileSink2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    allocate_data_unit : Proc(IWMWriterFileSink2*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_data_unit : Proc(IWMWriterFileSink2*, Void*, Win32cr::Foundation::HRESULT),
    on_end_writing : Proc(IWMWriterFileSink2*, Win32cr::Foundation::HRESULT),
    open : Proc(IWMWriterFileSink2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    start : Proc(IWMWriterFileSink2*, UInt64, Win32cr::Foundation::HRESULT),
    stop : Proc(IWMWriterFileSink2*, UInt64, Win32cr::Foundation::HRESULT),
    is_stopped : Proc(IWMWriterFileSink2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_file_duration : Proc(IWMWriterFileSink2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_file_size : Proc(IWMWriterFileSink2*, UInt64*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMWriterFileSink2*, Win32cr::Foundation::HRESULT),
    is_closed : Proc(IWMWriterFileSink2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterFileSink2, lpVtbl : IWMWriterFileSink2Vtbl* do
    GUID = LibC::GUID.new(0x14282ba7_u32, 0x4aef_u16, 0x4205_u16, StaticArray[0x8c_u8, 0xe5_u8, 0xc2_u8, 0x29_u8, 0x3_u8, 0x5a_u8, 0x5_u8, 0xbc_u8])
    def query_interface(this : IWMWriterFileSink2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterFileSink2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterFileSink2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_header(this : IWMWriterFileSink2*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_header.call(this, pHeader)
    end
    def is_real_time(this : IWMWriterFileSink2*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def allocate_data_unit(this : IWMWriterFileSink2*, cbDataUnit : UInt32, ppDataUnit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_data_unit.call(this, cbDataUnit, ppDataUnit)
    end
    def on_data_unit(this : IWMWriterFileSink2*, pDataUnit : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit.call(this, pDataUnit)
    end
    def on_end_writing(this : IWMWriterFileSink2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_writing.call(this)
    end
    def open(this : IWMWriterFileSink2*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end
    def start(this : IWMWriterFileSink2*, cnsStartTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, cnsStartTime)
    end
    def stop(this : IWMWriterFileSink2*, cnsStopTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this, cnsStopTime)
    end
    def is_stopped(this : IWMWriterFileSink2*, pfStopped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_stopped.call(this, pfStopped)
    end
    def get_file_duration(this : IWMWriterFileSink2*, pcnsDuration : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_duration.call(this, pcnsDuration)
    end
    def get_file_size(this : IWMWriterFileSink2*, pcbFile : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, pcbFile)
    end
    def close(this : IWMWriterFileSink2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def is_closed(this : IWMWriterFileSink2*, pfClosed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_closed.call(this, pfClosed)
    end

  end

  @[Extern]
  record IWMWriterFileSink3Vtbl,
    query_interface : Proc(IWMWriterFileSink3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterFileSink3*, UInt32),
    release : Proc(IWMWriterFileSink3*, UInt32),
    on_header : Proc(IWMWriterFileSink3*, Void*, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    allocate_data_unit : Proc(IWMWriterFileSink3*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_data_unit : Proc(IWMWriterFileSink3*, Void*, Win32cr::Foundation::HRESULT),
    on_end_writing : Proc(IWMWriterFileSink3*, Win32cr::Foundation::HRESULT),
    open : Proc(IWMWriterFileSink3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    start : Proc(IWMWriterFileSink3*, UInt64, Win32cr::Foundation::HRESULT),
    stop : Proc(IWMWriterFileSink3*, UInt64, Win32cr::Foundation::HRESULT),
    is_stopped : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_file_duration : Proc(IWMWriterFileSink3*, UInt64*, Win32cr::Foundation::HRESULT),
    get_file_size : Proc(IWMWriterFileSink3*, UInt64*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMWriterFileSink3*, Win32cr::Foundation::HRESULT),
    is_closed : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_auto_indexing : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_auto_indexing : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_control_stream : Proc(IWMWriterFileSink3*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_mode : Proc(IWMWriterFileSink3*, UInt32*, Win32cr::Foundation::HRESULT),
    on_data_unit_ex : Proc(IWMWriterFileSink3*, Win32cr::Media::WindowsMediaFormat::WMT_FILESINK_DATA_UNIT*, Win32cr::Foundation::HRESULT),
    set_unbuffered_io : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_unbuffered_io : Proc(IWMWriterFileSink3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    complete_operations : Proc(IWMWriterFileSink3*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterFileSink3, lpVtbl : IWMWriterFileSink3Vtbl* do
    GUID = LibC::GUID.new(0x3fea4feb_u32, 0x2945_u16, 0x47a7_u16, StaticArray[0xa1_u8, 0xdd_u8, 0xc5_u8, 0x3a_u8, 0x8f_u8, 0xc4_u8, 0xc4_u8, 0x5c_u8])
    def query_interface(this : IWMWriterFileSink3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterFileSink3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterFileSink3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_header(this : IWMWriterFileSink3*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_header.call(this, pHeader)
    end
    def is_real_time(this : IWMWriterFileSink3*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def allocate_data_unit(this : IWMWriterFileSink3*, cbDataUnit : UInt32, ppDataUnit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_data_unit.call(this, cbDataUnit, ppDataUnit)
    end
    def on_data_unit(this : IWMWriterFileSink3*, pDataUnit : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit.call(this, pDataUnit)
    end
    def on_end_writing(this : IWMWriterFileSink3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_writing.call(this)
    end
    def open(this : IWMWriterFileSink3*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pwszFilename)
    end
    def start(this : IWMWriterFileSink3*, cnsStartTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, cnsStartTime)
    end
    def stop(this : IWMWriterFileSink3*, cnsStopTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this, cnsStopTime)
    end
    def is_stopped(this : IWMWriterFileSink3*, pfStopped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_stopped.call(this, pfStopped)
    end
    def get_file_duration(this : IWMWriterFileSink3*, pcnsDuration : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_duration.call(this, pcnsDuration)
    end
    def get_file_size(this : IWMWriterFileSink3*, pcbFile : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, pcbFile)
    end
    def close(this : IWMWriterFileSink3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def is_closed(this : IWMWriterFileSink3*, pfClosed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_closed.call(this, pfClosed)
    end
    def set_auto_indexing(this : IWMWriterFileSink3*, fDoAutoIndexing : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_auto_indexing.call(this, fDoAutoIndexing)
    end
    def get_auto_indexing(this : IWMWriterFileSink3*, pfAutoIndexing : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_auto_indexing.call(this, pfAutoIndexing)
    end
    def set_control_stream(this : IWMWriterFileSink3*, wStreamNumber : UInt16, fShouldControlStartAndStop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_control_stream.call(this, wStreamNumber, fShouldControlStartAndStop)
    end
    def get_mode(this : IWMWriterFileSink3*, pdwFileSinkMode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mode.call(this, pdwFileSinkMode)
    end
    def on_data_unit_ex(this : IWMWriterFileSink3*, pFileSinkDataUnit : Win32cr::Media::WindowsMediaFormat::WMT_FILESINK_DATA_UNIT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit_ex.call(this, pFileSinkDataUnit)
    end
    def set_unbuffered_io(this : IWMWriterFileSink3*, fUnbufferedIO : Win32cr::Foundation::BOOL, fRestrictMemUsage : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_unbuffered_io.call(this, fUnbufferedIO, fRestrictMemUsage)
    end
    def get_unbuffered_io(this : IWMWriterFileSink3*, pfUnbufferedIO : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unbuffered_io.call(this, pfUnbufferedIO)
    end
    def complete_operations(this : IWMWriterFileSink3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.complete_operations.call(this)
    end

  end

  @[Extern]
  record IWMWriterNetworkSinkVtbl,
    query_interface : Proc(IWMWriterNetworkSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterNetworkSink*, UInt32),
    release : Proc(IWMWriterNetworkSink*, UInt32),
    on_header : Proc(IWMWriterNetworkSink*, Void*, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterNetworkSink*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    allocate_data_unit : Proc(IWMWriterNetworkSink*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_data_unit : Proc(IWMWriterNetworkSink*, Void*, Win32cr::Foundation::HRESULT),
    on_end_writing : Proc(IWMWriterNetworkSink*, Win32cr::Foundation::HRESULT),
    set_maximum_clients : Proc(IWMWriterNetworkSink*, UInt32, Win32cr::Foundation::HRESULT),
    get_maximum_clients : Proc(IWMWriterNetworkSink*, UInt32*, Win32cr::Foundation::HRESULT),
    set_network_protocol : Proc(IWMWriterNetworkSink*, Win32cr::Media::WindowsMediaFormat::WMT_NET_PROTOCOL, Win32cr::Foundation::HRESULT),
    get_network_protocol : Proc(IWMWriterNetworkSink*, Win32cr::Media::WindowsMediaFormat::WMT_NET_PROTOCOL*, Win32cr::Foundation::HRESULT),
    get_host_url : Proc(IWMWriterNetworkSink*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    open : Proc(IWMWriterNetworkSink*, UInt32*, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IWMWriterNetworkSink*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMWriterNetworkSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterNetworkSink, lpVtbl : IWMWriterNetworkSinkVtbl* do
    GUID = LibC::GUID.new(0x96406be7_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMWriterNetworkSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterNetworkSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterNetworkSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_header(this : IWMWriterNetworkSink*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_header.call(this, pHeader)
    end
    def is_real_time(this : IWMWriterNetworkSink*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def allocate_data_unit(this : IWMWriterNetworkSink*, cbDataUnit : UInt32, ppDataUnit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_data_unit.call(this, cbDataUnit, ppDataUnit)
    end
    def on_data_unit(this : IWMWriterNetworkSink*, pDataUnit : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit.call(this, pDataUnit)
    end
    def on_end_writing(this : IWMWriterNetworkSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_writing.call(this)
    end
    def set_maximum_clients(this : IWMWriterNetworkSink*, dwMaxClients : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_maximum_clients.call(this, dwMaxClients)
    end
    def get_maximum_clients(this : IWMWriterNetworkSink*, pdwMaxClients : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_maximum_clients.call(this, pdwMaxClients)
    end
    def set_network_protocol(this : IWMWriterNetworkSink*, protocol : Win32cr::Media::WindowsMediaFormat::WMT_NET_PROTOCOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_network_protocol.call(this, protocol)
    end
    def get_network_protocol(this : IWMWriterNetworkSink*, pProtocol : Win32cr::Media::WindowsMediaFormat::WMT_NET_PROTOCOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_network_protocol.call(this, pProtocol)
    end
    def get_host_url(this : IWMWriterNetworkSink*, pwszURL : Win32cr::Foundation::PWSTR, pcchURL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_url.call(this, pwszURL, pcchURL)
    end
    def open(this : IWMWriterNetworkSink*, pdwPortNum : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this, pdwPortNum)
    end
    def disconnect(this : IWMWriterNetworkSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def close(this : IWMWriterNetworkSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IWMClientConnectionsVtbl,
    query_interface : Proc(IWMClientConnections*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMClientConnections*, UInt32),
    release : Proc(IWMClientConnections*, UInt32),
    get_client_count : Proc(IWMClientConnections*, UInt32*, Win32cr::Foundation::HRESULT),
    get_client_properties : Proc(IWMClientConnections*, UInt32, Win32cr::Media::WindowsMediaFormat::WM_CLIENT_PROPERTIES*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMClientConnections, lpVtbl : IWMClientConnectionsVtbl* do
    GUID = LibC::GUID.new(0x73c66010_u32, 0xa299_u16, 0x41df_u16, StaticArray[0xb1_u8, 0xf0_u8, 0xcc_u8, 0xf0_u8, 0x3b_u8, 0x9_u8, 0xc1_u8, 0xc6_u8])
    def query_interface(this : IWMClientConnections*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMClientConnections*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMClientConnections*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_client_count(this : IWMClientConnections*, pcClients : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_count.call(this, pcClients)
    end
    def get_client_properties(this : IWMClientConnections*, dwClientNum : UInt32, pClientProperties : Win32cr::Media::WindowsMediaFormat::WM_CLIENT_PROPERTIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_properties.call(this, dwClientNum, pClientProperties)
    end

  end

  @[Extern]
  record IWMClientConnections2Vtbl,
    query_interface : Proc(IWMClientConnections2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMClientConnections2*, UInt32),
    release : Proc(IWMClientConnections2*, UInt32),
    get_client_count : Proc(IWMClientConnections2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_client_properties : Proc(IWMClientConnections2*, UInt32, Win32cr::Media::WindowsMediaFormat::WM_CLIENT_PROPERTIES*, Win32cr::Foundation::HRESULT),
    get_client_info : Proc(IWMClientConnections2*, UInt32, UInt16*, UInt32*, UInt16*, UInt32*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMClientConnections2, lpVtbl : IWMClientConnections2Vtbl* do
    GUID = LibC::GUID.new(0x4091571e_u32, 0x4701_u16, 0x4593_u16, StaticArray[0xbb_u8, 0x3d_u8, 0xd5_u8, 0xf5_u8, 0xf0_u8, 0xc7_u8, 0x42_u8, 0x46_u8])
    def query_interface(this : IWMClientConnections2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMClientConnections2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMClientConnections2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_client_count(this : IWMClientConnections2*, pcClients : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_count.call(this, pcClients)
    end
    def get_client_properties(this : IWMClientConnections2*, dwClientNum : UInt32, pClientProperties : Win32cr::Media::WindowsMediaFormat::WM_CLIENT_PROPERTIES*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_properties.call(this, dwClientNum, pClientProperties)
    end
    def get_client_info(this : IWMClientConnections2*, dwClientNum : UInt32, pwszNetworkAddress : UInt16*, pcchNetworkAddress : UInt32*, pwszPort : UInt16*, pcchPort : UInt32*, pwszDNSName : UInt16*, pcchDNSName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_info.call(this, dwClientNum, pwszNetworkAddress, pcchNetworkAddress, pwszPort, pcchPort, pwszDNSName, pcchDNSName)
    end

  end

  @[Extern]
  record IWMReaderAdvancedVtbl,
    query_interface : Proc(IWMReaderAdvanced*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAdvanced*, UInt32),
    release : Proc(IWMReaderAdvanced*, UInt32),
    set_user_provided_clock : Proc(IWMReaderAdvanced*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_user_provided_clock : Proc(IWMReaderAdvanced*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    deliver_time : Proc(IWMReaderAdvanced*, UInt64, Win32cr::Foundation::HRESULT),
    set_manual_stream_selection : Proc(IWMReaderAdvanced*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_manual_stream_selection : Proc(IWMReaderAdvanced*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMReaderAdvanced*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMReaderAdvanced*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_receive_stream_samples : Proc(IWMReaderAdvanced*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_stream_samples : Proc(IWMReaderAdvanced*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMReaderAdvanced*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMReaderAdvanced*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMReaderAdvanced*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMReaderAdvanced*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMReaderAdvanced*, Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_client_info : Proc(IWMReaderAdvanced*, Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMReaderAdvanced*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMReaderAdvanced*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    notify_late_delivery : Proc(IWMReaderAdvanced*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAdvanced, lpVtbl : IWMReaderAdvancedVtbl* do
    GUID = LibC::GUID.new(0x96406bea_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMReaderAdvanced*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAdvanced*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAdvanced*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_user_provided_clock(this : IWMReaderAdvanced*, fUserClock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_provided_clock.call(this, fUserClock)
    end
    def get_user_provided_clock(this : IWMReaderAdvanced*, pfUserClock : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_provided_clock.call(this, pfUserClock)
    end
    def deliver_time(this : IWMReaderAdvanced*, cnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deliver_time.call(this, cnsTime)
    end
    def set_manual_stream_selection(this : IWMReaderAdvanced*, fSelection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_stream_selection.call(this, fSelection)
    end
    def get_manual_stream_selection(this : IWMReaderAdvanced*, pfSelection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manual_stream_selection.call(this, pfSelection)
    end
    def set_streams_selected(this : IWMReaderAdvanced*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMReaderAdvanced*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_receive_selection_callbacks(this : IWMReaderAdvanced*, fGetCallbacks : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_selection_callbacks.call(this, fGetCallbacks)
    end
    def get_receive_selection_callbacks(this : IWMReaderAdvanced*, pfGetCallbacks : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_selection_callbacks.call(this, pfGetCallbacks)
    end
    def set_receive_stream_samples(this : IWMReaderAdvanced*, wStreamNum : UInt16, fReceiveStreamSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_stream_samples.call(this, wStreamNum, fReceiveStreamSamples)
    end
    def get_receive_stream_samples(this : IWMReaderAdvanced*, wStreamNum : UInt16, pfReceiveStreamSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_stream_samples.call(this, wStreamNum, pfReceiveStreamSamples)
    end
    def set_allocate_for_output(this : IWMReaderAdvanced*, dwOutputNum : UInt32, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, fAllocate)
    end
    def get_allocate_for_output(this : IWMReaderAdvanced*, dwOutputNum : UInt32, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, pfAllocate)
    end
    def set_allocate_for_stream(this : IWMReaderAdvanced*, wStreamNum : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, fAllocate)
    end
    def get_allocate_for_stream(this : IWMReaderAdvanced*, dwSreamNum : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, pfAllocate)
    end
    def get_statistics(this : IWMReaderAdvanced*, pStatistics : Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, pStatistics)
    end
    def set_client_info(this : IWMReaderAdvanced*, pClientInfo : Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_info.call(this, pClientInfo)
    end
    def get_max_output_sample_size(this : IWMReaderAdvanced*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMReaderAdvanced*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def notify_late_delivery(this : IWMReaderAdvanced*, cnsLateness : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_late_delivery.call(this, cnsLateness)
    end

  end

  @[Extern]
  record IWMReaderAdvanced2Vtbl,
    query_interface : Proc(IWMReaderAdvanced2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAdvanced2*, UInt32),
    release : Proc(IWMReaderAdvanced2*, UInt32),
    set_user_provided_clock : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_user_provided_clock : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    deliver_time : Proc(IWMReaderAdvanced2*, UInt64, Win32cr::Foundation::HRESULT),
    set_manual_stream_selection : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_manual_stream_selection : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMReaderAdvanced2*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMReaderAdvanced2*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_receive_stream_samples : Proc(IWMReaderAdvanced2*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_stream_samples : Proc(IWMReaderAdvanced2*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMReaderAdvanced2*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMReaderAdvanced2*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMReaderAdvanced2*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMReaderAdvanced2*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMReaderAdvanced2*, Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_client_info : Proc(IWMReaderAdvanced2*, Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMReaderAdvanced2*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMReaderAdvanced2*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    notify_late_delivery : Proc(IWMReaderAdvanced2*, UInt64, Win32cr::Foundation::HRESULT),
    set_play_mode : Proc(IWMReaderAdvanced2*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE, Win32cr::Foundation::HRESULT),
    get_play_mode : Proc(IWMReaderAdvanced2*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*, Win32cr::Foundation::HRESULT),
    get_buffer_progress : Proc(IWMReaderAdvanced2*, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    get_download_progress : Proc(IWMReaderAdvanced2*, UInt32*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_save_as_progress : Proc(IWMReaderAdvanced2*, UInt32*, Win32cr::Foundation::HRESULT),
    save_file_as : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_protocol_name : Proc(IWMReaderAdvanced2*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    start_at_marker : Proc(IWMReaderAdvanced2*, UInt16, UInt64, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMReaderAdvanced2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMReaderAdvanced2*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    preroll : Proc(IWMReaderAdvanced2*, UInt64, UInt64, Float32, Win32cr::Foundation::HRESULT),
    set_log_client_id : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_log_client_id : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    stop_buffering : Proc(IWMReaderAdvanced2*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMReaderAdvanced2*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAdvanced2, lpVtbl : IWMReaderAdvanced2Vtbl* do
    GUID = LibC::GUID.new(0xae14a945_u32, 0xb90c_u16, 0x4d0d_u16, StaticArray[0x91_u8, 0x27_u8, 0x80_u8, 0xd6_u8, 0x65_u8, 0xf7_u8, 0xd7_u8, 0x3e_u8])
    def query_interface(this : IWMReaderAdvanced2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAdvanced2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAdvanced2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_user_provided_clock(this : IWMReaderAdvanced2*, fUserClock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_provided_clock.call(this, fUserClock)
    end
    def get_user_provided_clock(this : IWMReaderAdvanced2*, pfUserClock : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_provided_clock.call(this, pfUserClock)
    end
    def deliver_time(this : IWMReaderAdvanced2*, cnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deliver_time.call(this, cnsTime)
    end
    def set_manual_stream_selection(this : IWMReaderAdvanced2*, fSelection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_stream_selection.call(this, fSelection)
    end
    def get_manual_stream_selection(this : IWMReaderAdvanced2*, pfSelection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manual_stream_selection.call(this, pfSelection)
    end
    def set_streams_selected(this : IWMReaderAdvanced2*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMReaderAdvanced2*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_receive_selection_callbacks(this : IWMReaderAdvanced2*, fGetCallbacks : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_selection_callbacks.call(this, fGetCallbacks)
    end
    def get_receive_selection_callbacks(this : IWMReaderAdvanced2*, pfGetCallbacks : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_selection_callbacks.call(this, pfGetCallbacks)
    end
    def set_receive_stream_samples(this : IWMReaderAdvanced2*, wStreamNum : UInt16, fReceiveStreamSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_stream_samples.call(this, wStreamNum, fReceiveStreamSamples)
    end
    def get_receive_stream_samples(this : IWMReaderAdvanced2*, wStreamNum : UInt16, pfReceiveStreamSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_stream_samples.call(this, wStreamNum, pfReceiveStreamSamples)
    end
    def set_allocate_for_output(this : IWMReaderAdvanced2*, dwOutputNum : UInt32, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, fAllocate)
    end
    def get_allocate_for_output(this : IWMReaderAdvanced2*, dwOutputNum : UInt32, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, pfAllocate)
    end
    def set_allocate_for_stream(this : IWMReaderAdvanced2*, wStreamNum : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, fAllocate)
    end
    def get_allocate_for_stream(this : IWMReaderAdvanced2*, dwSreamNum : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, pfAllocate)
    end
    def get_statistics(this : IWMReaderAdvanced2*, pStatistics : Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, pStatistics)
    end
    def set_client_info(this : IWMReaderAdvanced2*, pClientInfo : Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_info.call(this, pClientInfo)
    end
    def get_max_output_sample_size(this : IWMReaderAdvanced2*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMReaderAdvanced2*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def notify_late_delivery(this : IWMReaderAdvanced2*, cnsLateness : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_late_delivery.call(this, cnsLateness)
    end
    def set_play_mode(this : IWMReaderAdvanced2*, mode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_mode.call(this, mode)
    end
    def get_play_mode(this : IWMReaderAdvanced2*, pMode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_mode.call(this, pMode)
    end
    def get_buffer_progress(this : IWMReaderAdvanced2*, pdwPercent : UInt32*, pcnsBuffering : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_progress.call(this, pdwPercent, pcnsBuffering)
    end
    def get_download_progress(this : IWMReaderAdvanced2*, pdwPercent : UInt32*, pqwBytesDownloaded : UInt64*, pcnsDownload : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_download_progress.call(this, pdwPercent, pqwBytesDownloaded, pcnsDownload)
    end
    def get_save_as_progress(this : IWMReaderAdvanced2*, pdwPercent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_as_progress.call(this, pdwPercent)
    end
    def save_file_as(this : IWMReaderAdvanced2*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_file_as.call(this, pwszFilename)
    end
    def get_protocol_name(this : IWMReaderAdvanced2*, pwszProtocol : UInt16*, pcchProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_name.call(this, pwszProtocol, pcchProtocol)
    end
    def start_at_marker(this : IWMReaderAdvanced2*, wMarkerIndex : UInt16, cnsDuration : UInt64, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_marker.call(this, wMarkerIndex, cnsDuration, fRate, pvContext)
    end
    def get_output_setting(this : IWMReaderAdvanced2*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMReaderAdvanced2*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def preroll(this : IWMReaderAdvanced2*, cnsStart : UInt64, cnsDuration : UInt64, fRate : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preroll.call(this, cnsStart, cnsDuration, fRate)
    end
    def set_log_client_id(this : IWMReaderAdvanced2*, fLogClientID : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_client_id.call(this, fLogClientID)
    end
    def get_log_client_id(this : IWMReaderAdvanced2*, pfLogClientID : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_client_id.call(this, pfLogClientID)
    end
    def stop_buffering(this : IWMReaderAdvanced2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_buffering.call(this)
    end
    def open_stream(this : IWMReaderAdvanced2*, pStream : Void*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream, pCallback, pvContext)
    end

  end

  @[Extern]
  record IWMReaderAdvanced3Vtbl,
    query_interface : Proc(IWMReaderAdvanced3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAdvanced3*, UInt32),
    release : Proc(IWMReaderAdvanced3*, UInt32),
    set_user_provided_clock : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_user_provided_clock : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    deliver_time : Proc(IWMReaderAdvanced3*, UInt64, Win32cr::Foundation::HRESULT),
    set_manual_stream_selection : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_manual_stream_selection : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMReaderAdvanced3*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMReaderAdvanced3*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_receive_stream_samples : Proc(IWMReaderAdvanced3*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_stream_samples : Proc(IWMReaderAdvanced3*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMReaderAdvanced3*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMReaderAdvanced3*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMReaderAdvanced3*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMReaderAdvanced3*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMReaderAdvanced3*, Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_client_info : Proc(IWMReaderAdvanced3*, Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMReaderAdvanced3*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMReaderAdvanced3*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    notify_late_delivery : Proc(IWMReaderAdvanced3*, UInt64, Win32cr::Foundation::HRESULT),
    set_play_mode : Proc(IWMReaderAdvanced3*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE, Win32cr::Foundation::HRESULT),
    get_play_mode : Proc(IWMReaderAdvanced3*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*, Win32cr::Foundation::HRESULT),
    get_buffer_progress : Proc(IWMReaderAdvanced3*, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    get_download_progress : Proc(IWMReaderAdvanced3*, UInt32*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_save_as_progress : Proc(IWMReaderAdvanced3*, UInt32*, Win32cr::Foundation::HRESULT),
    save_file_as : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_protocol_name : Proc(IWMReaderAdvanced3*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    start_at_marker : Proc(IWMReaderAdvanced3*, UInt16, UInt64, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMReaderAdvanced3*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMReaderAdvanced3*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    preroll : Proc(IWMReaderAdvanced3*, UInt64, UInt64, Float32, Win32cr::Foundation::HRESULT),
    set_log_client_id : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_log_client_id : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    stop_buffering : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMReaderAdvanced3*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    stop_net_streaming : Proc(IWMReaderAdvanced3*, Win32cr::Foundation::HRESULT),
    start_at_position : Proc(IWMReaderAdvanced3*, UInt16, Void*, Void*, Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, Float32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAdvanced3, lpVtbl : IWMReaderAdvanced3Vtbl* do
    GUID = LibC::GUID.new(0x5dc0674b_u32, 0xf04b_u16, 0x4a4e_u16, StaticArray[0x9f_u8, 0x2a_u8, 0xb1_u8, 0xaf_u8, 0xde_u8, 0x2c_u8, 0x81_u8, 0x0_u8])
    def query_interface(this : IWMReaderAdvanced3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAdvanced3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAdvanced3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_user_provided_clock(this : IWMReaderAdvanced3*, fUserClock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_provided_clock.call(this, fUserClock)
    end
    def get_user_provided_clock(this : IWMReaderAdvanced3*, pfUserClock : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_provided_clock.call(this, pfUserClock)
    end
    def deliver_time(this : IWMReaderAdvanced3*, cnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deliver_time.call(this, cnsTime)
    end
    def set_manual_stream_selection(this : IWMReaderAdvanced3*, fSelection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_stream_selection.call(this, fSelection)
    end
    def get_manual_stream_selection(this : IWMReaderAdvanced3*, pfSelection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manual_stream_selection.call(this, pfSelection)
    end
    def set_streams_selected(this : IWMReaderAdvanced3*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMReaderAdvanced3*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_receive_selection_callbacks(this : IWMReaderAdvanced3*, fGetCallbacks : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_selection_callbacks.call(this, fGetCallbacks)
    end
    def get_receive_selection_callbacks(this : IWMReaderAdvanced3*, pfGetCallbacks : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_selection_callbacks.call(this, pfGetCallbacks)
    end
    def set_receive_stream_samples(this : IWMReaderAdvanced3*, wStreamNum : UInt16, fReceiveStreamSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_stream_samples.call(this, wStreamNum, fReceiveStreamSamples)
    end
    def get_receive_stream_samples(this : IWMReaderAdvanced3*, wStreamNum : UInt16, pfReceiveStreamSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_stream_samples.call(this, wStreamNum, pfReceiveStreamSamples)
    end
    def set_allocate_for_output(this : IWMReaderAdvanced3*, dwOutputNum : UInt32, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, fAllocate)
    end
    def get_allocate_for_output(this : IWMReaderAdvanced3*, dwOutputNum : UInt32, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, pfAllocate)
    end
    def set_allocate_for_stream(this : IWMReaderAdvanced3*, wStreamNum : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, fAllocate)
    end
    def get_allocate_for_stream(this : IWMReaderAdvanced3*, dwSreamNum : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, pfAllocate)
    end
    def get_statistics(this : IWMReaderAdvanced3*, pStatistics : Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, pStatistics)
    end
    def set_client_info(this : IWMReaderAdvanced3*, pClientInfo : Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_info.call(this, pClientInfo)
    end
    def get_max_output_sample_size(this : IWMReaderAdvanced3*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMReaderAdvanced3*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def notify_late_delivery(this : IWMReaderAdvanced3*, cnsLateness : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_late_delivery.call(this, cnsLateness)
    end
    def set_play_mode(this : IWMReaderAdvanced3*, mode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_mode.call(this, mode)
    end
    def get_play_mode(this : IWMReaderAdvanced3*, pMode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_mode.call(this, pMode)
    end
    def get_buffer_progress(this : IWMReaderAdvanced3*, pdwPercent : UInt32*, pcnsBuffering : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_progress.call(this, pdwPercent, pcnsBuffering)
    end
    def get_download_progress(this : IWMReaderAdvanced3*, pdwPercent : UInt32*, pqwBytesDownloaded : UInt64*, pcnsDownload : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_download_progress.call(this, pdwPercent, pqwBytesDownloaded, pcnsDownload)
    end
    def get_save_as_progress(this : IWMReaderAdvanced3*, pdwPercent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_as_progress.call(this, pdwPercent)
    end
    def save_file_as(this : IWMReaderAdvanced3*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_file_as.call(this, pwszFilename)
    end
    def get_protocol_name(this : IWMReaderAdvanced3*, pwszProtocol : UInt16*, pcchProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_name.call(this, pwszProtocol, pcchProtocol)
    end
    def start_at_marker(this : IWMReaderAdvanced3*, wMarkerIndex : UInt16, cnsDuration : UInt64, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_marker.call(this, wMarkerIndex, cnsDuration, fRate, pvContext)
    end
    def get_output_setting(this : IWMReaderAdvanced3*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMReaderAdvanced3*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def preroll(this : IWMReaderAdvanced3*, cnsStart : UInt64, cnsDuration : UInt64, fRate : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preroll.call(this, cnsStart, cnsDuration, fRate)
    end
    def set_log_client_id(this : IWMReaderAdvanced3*, fLogClientID : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_client_id.call(this, fLogClientID)
    end
    def get_log_client_id(this : IWMReaderAdvanced3*, pfLogClientID : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_client_id.call(this, pfLogClientID)
    end
    def stop_buffering(this : IWMReaderAdvanced3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_buffering.call(this)
    end
    def open_stream(this : IWMReaderAdvanced3*, pStream : Void*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream, pCallback, pvContext)
    end
    def stop_net_streaming(this : IWMReaderAdvanced3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_net_streaming.call(this)
    end
    def start_at_position(this : IWMReaderAdvanced3*, wStreamNum : UInt16, pvOffsetStart : Void*, pvDuration : Void*, dwOffsetFormat : Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_position.call(this, wStreamNum, pvOffsetStart, pvDuration, dwOffsetFormat, fRate, pvContext)
    end

  end

  @[Extern]
  record IWMReaderAdvanced4Vtbl,
    query_interface : Proc(IWMReaderAdvanced4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAdvanced4*, UInt32),
    release : Proc(IWMReaderAdvanced4*, UInt32),
    set_user_provided_clock : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_user_provided_clock : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    deliver_time : Proc(IWMReaderAdvanced4*, UInt64, Win32cr::Foundation::HRESULT),
    set_manual_stream_selection : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_manual_stream_selection : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMReaderAdvanced4*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMReaderAdvanced4*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_receive_stream_samples : Proc(IWMReaderAdvanced4*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_stream_samples : Proc(IWMReaderAdvanced4*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMReaderAdvanced4*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMReaderAdvanced4*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMReaderAdvanced4*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMReaderAdvanced4*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMReaderAdvanced4*, Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_client_info : Proc(IWMReaderAdvanced4*, Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMReaderAdvanced4*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMReaderAdvanced4*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    notify_late_delivery : Proc(IWMReaderAdvanced4*, UInt64, Win32cr::Foundation::HRESULT),
    set_play_mode : Proc(IWMReaderAdvanced4*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE, Win32cr::Foundation::HRESULT),
    get_play_mode : Proc(IWMReaderAdvanced4*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*, Win32cr::Foundation::HRESULT),
    get_buffer_progress : Proc(IWMReaderAdvanced4*, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    get_download_progress : Proc(IWMReaderAdvanced4*, UInt32*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_save_as_progress : Proc(IWMReaderAdvanced4*, UInt32*, Win32cr::Foundation::HRESULT),
    save_file_as : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_protocol_name : Proc(IWMReaderAdvanced4*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    start_at_marker : Proc(IWMReaderAdvanced4*, UInt16, UInt64, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMReaderAdvanced4*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMReaderAdvanced4*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    preroll : Proc(IWMReaderAdvanced4*, UInt64, UInt64, Float32, Win32cr::Foundation::HRESULT),
    set_log_client_id : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_log_client_id : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    stop_buffering : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMReaderAdvanced4*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    stop_net_streaming : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::HRESULT),
    start_at_position : Proc(IWMReaderAdvanced4*, UInt16, Void*, Void*, Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_language_count : Proc(IWMReaderAdvanced4*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IWMReaderAdvanced4*, UInt32, UInt16, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    get_max_speed_factor : Proc(IWMReaderAdvanced4*, Float64*, Win32cr::Foundation::HRESULT),
    is_using_fast_cache : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    add_log_param : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    send_log_params : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::HRESULT),
    can_save_file_as : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cancel_save_file_as : Proc(IWMReaderAdvanced4*, Win32cr::Foundation::HRESULT),
    get_url : Proc(IWMReaderAdvanced4*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAdvanced4, lpVtbl : IWMReaderAdvanced4Vtbl* do
    GUID = LibC::GUID.new(0x945a76a2_u32, 0x12ae_u16, 0x4d48_u16, StaticArray[0xbd_u8, 0x3c_u8, 0xcd_u8, 0x1d_u8, 0x90_u8, 0x39_u8, 0x9b_u8, 0x85_u8])
    def query_interface(this : IWMReaderAdvanced4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAdvanced4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAdvanced4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_user_provided_clock(this : IWMReaderAdvanced4*, fUserClock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_provided_clock.call(this, fUserClock)
    end
    def get_user_provided_clock(this : IWMReaderAdvanced4*, pfUserClock : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_provided_clock.call(this, pfUserClock)
    end
    def deliver_time(this : IWMReaderAdvanced4*, cnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deliver_time.call(this, cnsTime)
    end
    def set_manual_stream_selection(this : IWMReaderAdvanced4*, fSelection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_stream_selection.call(this, fSelection)
    end
    def get_manual_stream_selection(this : IWMReaderAdvanced4*, pfSelection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manual_stream_selection.call(this, pfSelection)
    end
    def set_streams_selected(this : IWMReaderAdvanced4*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMReaderAdvanced4*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_receive_selection_callbacks(this : IWMReaderAdvanced4*, fGetCallbacks : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_selection_callbacks.call(this, fGetCallbacks)
    end
    def get_receive_selection_callbacks(this : IWMReaderAdvanced4*, pfGetCallbacks : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_selection_callbacks.call(this, pfGetCallbacks)
    end
    def set_receive_stream_samples(this : IWMReaderAdvanced4*, wStreamNum : UInt16, fReceiveStreamSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_stream_samples.call(this, wStreamNum, fReceiveStreamSamples)
    end
    def get_receive_stream_samples(this : IWMReaderAdvanced4*, wStreamNum : UInt16, pfReceiveStreamSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_stream_samples.call(this, wStreamNum, pfReceiveStreamSamples)
    end
    def set_allocate_for_output(this : IWMReaderAdvanced4*, dwOutputNum : UInt32, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, fAllocate)
    end
    def get_allocate_for_output(this : IWMReaderAdvanced4*, dwOutputNum : UInt32, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, pfAllocate)
    end
    def set_allocate_for_stream(this : IWMReaderAdvanced4*, wStreamNum : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, fAllocate)
    end
    def get_allocate_for_stream(this : IWMReaderAdvanced4*, dwSreamNum : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, pfAllocate)
    end
    def get_statistics(this : IWMReaderAdvanced4*, pStatistics : Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, pStatistics)
    end
    def set_client_info(this : IWMReaderAdvanced4*, pClientInfo : Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_info.call(this, pClientInfo)
    end
    def get_max_output_sample_size(this : IWMReaderAdvanced4*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMReaderAdvanced4*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def notify_late_delivery(this : IWMReaderAdvanced4*, cnsLateness : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_late_delivery.call(this, cnsLateness)
    end
    def set_play_mode(this : IWMReaderAdvanced4*, mode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_mode.call(this, mode)
    end
    def get_play_mode(this : IWMReaderAdvanced4*, pMode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_mode.call(this, pMode)
    end
    def get_buffer_progress(this : IWMReaderAdvanced4*, pdwPercent : UInt32*, pcnsBuffering : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_progress.call(this, pdwPercent, pcnsBuffering)
    end
    def get_download_progress(this : IWMReaderAdvanced4*, pdwPercent : UInt32*, pqwBytesDownloaded : UInt64*, pcnsDownload : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_download_progress.call(this, pdwPercent, pqwBytesDownloaded, pcnsDownload)
    end
    def get_save_as_progress(this : IWMReaderAdvanced4*, pdwPercent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_as_progress.call(this, pdwPercent)
    end
    def save_file_as(this : IWMReaderAdvanced4*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_file_as.call(this, pwszFilename)
    end
    def get_protocol_name(this : IWMReaderAdvanced4*, pwszProtocol : UInt16*, pcchProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_name.call(this, pwszProtocol, pcchProtocol)
    end
    def start_at_marker(this : IWMReaderAdvanced4*, wMarkerIndex : UInt16, cnsDuration : UInt64, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_marker.call(this, wMarkerIndex, cnsDuration, fRate, pvContext)
    end
    def get_output_setting(this : IWMReaderAdvanced4*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMReaderAdvanced4*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def preroll(this : IWMReaderAdvanced4*, cnsStart : UInt64, cnsDuration : UInt64, fRate : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preroll.call(this, cnsStart, cnsDuration, fRate)
    end
    def set_log_client_id(this : IWMReaderAdvanced4*, fLogClientID : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_client_id.call(this, fLogClientID)
    end
    def get_log_client_id(this : IWMReaderAdvanced4*, pfLogClientID : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_client_id.call(this, pfLogClientID)
    end
    def stop_buffering(this : IWMReaderAdvanced4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_buffering.call(this)
    end
    def open_stream(this : IWMReaderAdvanced4*, pStream : Void*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream, pCallback, pvContext)
    end
    def stop_net_streaming(this : IWMReaderAdvanced4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_net_streaming.call(this)
    end
    def start_at_position(this : IWMReaderAdvanced4*, wStreamNum : UInt16, pvOffsetStart : Void*, pvDuration : Void*, dwOffsetFormat : Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_position.call(this, wStreamNum, pvOffsetStart, pvDuration, dwOffsetFormat, fRate, pvContext)
    end
    def get_language_count(this : IWMReaderAdvanced4*, dwOutputNum : UInt32, pwLanguageCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_count.call(this, dwOutputNum, pwLanguageCount)
    end
    def get_language(this : IWMReaderAdvanced4*, dwOutputNum : UInt32, wLanguage : UInt16, pwszLanguageString : UInt16*, pcchLanguageStringLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, dwOutputNum, wLanguage, pwszLanguageString, pcchLanguageStringLength)
    end
    def get_max_speed_factor(this : IWMReaderAdvanced4*, pdblFactor : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_speed_factor.call(this, pdblFactor)
    end
    def is_using_fast_cache(this : IWMReaderAdvanced4*, pfUsingFastCache : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_using_fast_cache.call(this, pfUsingFastCache)
    end
    def add_log_param(this : IWMReaderAdvanced4*, wszNameSpace : Win32cr::Foundation::PWSTR, wszName : Win32cr::Foundation::PWSTR, wszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_log_param.call(this, wszNameSpace, wszName, wszValue)
    end
    def send_log_params(this : IWMReaderAdvanced4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_log_params.call(this)
    end
    def can_save_file_as(this : IWMReaderAdvanced4*, pfCanSave : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_save_file_as.call(this, pfCanSave)
    end
    def cancel_save_file_as(this : IWMReaderAdvanced4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_save_file_as.call(this)
    end
    def get_url(this : IWMReaderAdvanced4*, pwszURL : UInt16*, pcchURL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url.call(this, pwszURL, pcchURL)
    end

  end

  @[Extern]
  record IWMReaderAdvanced5Vtbl,
    query_interface : Proc(IWMReaderAdvanced5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAdvanced5*, UInt32),
    release : Proc(IWMReaderAdvanced5*, UInt32),
    set_user_provided_clock : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_user_provided_clock : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    deliver_time : Proc(IWMReaderAdvanced5*, UInt64, Win32cr::Foundation::HRESULT),
    set_manual_stream_selection : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_manual_stream_selection : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMReaderAdvanced5*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMReaderAdvanced5*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_receive_stream_samples : Proc(IWMReaderAdvanced5*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_stream_samples : Proc(IWMReaderAdvanced5*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMReaderAdvanced5*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMReaderAdvanced5*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMReaderAdvanced5*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMReaderAdvanced5*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMReaderAdvanced5*, Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_client_info : Proc(IWMReaderAdvanced5*, Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMReaderAdvanced5*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMReaderAdvanced5*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    notify_late_delivery : Proc(IWMReaderAdvanced5*, UInt64, Win32cr::Foundation::HRESULT),
    set_play_mode : Proc(IWMReaderAdvanced5*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE, Win32cr::Foundation::HRESULT),
    get_play_mode : Proc(IWMReaderAdvanced5*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*, Win32cr::Foundation::HRESULT),
    get_buffer_progress : Proc(IWMReaderAdvanced5*, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    get_download_progress : Proc(IWMReaderAdvanced5*, UInt32*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_save_as_progress : Proc(IWMReaderAdvanced5*, UInt32*, Win32cr::Foundation::HRESULT),
    save_file_as : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_protocol_name : Proc(IWMReaderAdvanced5*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    start_at_marker : Proc(IWMReaderAdvanced5*, UInt16, UInt64, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMReaderAdvanced5*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMReaderAdvanced5*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    preroll : Proc(IWMReaderAdvanced5*, UInt64, UInt64, Float32, Win32cr::Foundation::HRESULT),
    set_log_client_id : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_log_client_id : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    stop_buffering : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMReaderAdvanced5*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    stop_net_streaming : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::HRESULT),
    start_at_position : Proc(IWMReaderAdvanced5*, UInt16, Void*, Void*, Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_language_count : Proc(IWMReaderAdvanced5*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IWMReaderAdvanced5*, UInt32, UInt16, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    get_max_speed_factor : Proc(IWMReaderAdvanced5*, Float64*, Win32cr::Foundation::HRESULT),
    is_using_fast_cache : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    add_log_param : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    send_log_params : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::HRESULT),
    can_save_file_as : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cancel_save_file_as : Proc(IWMReaderAdvanced5*, Win32cr::Foundation::HRESULT),
    get_url : Proc(IWMReaderAdvanced5*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_player_hook : Proc(IWMReaderAdvanced5*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAdvanced5, lpVtbl : IWMReaderAdvanced5Vtbl* do
    GUID = LibC::GUID.new(0x24c44db0_u32, 0x55d1_u16, 0x49ae_u16, StaticArray[0xa5_u8, 0xcc_u8, 0xf1_u8, 0x38_u8, 0x15_u8, 0xe3_u8, 0x63_u8, 0x63_u8])
    def query_interface(this : IWMReaderAdvanced5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAdvanced5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAdvanced5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_user_provided_clock(this : IWMReaderAdvanced5*, fUserClock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_provided_clock.call(this, fUserClock)
    end
    def get_user_provided_clock(this : IWMReaderAdvanced5*, pfUserClock : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_provided_clock.call(this, pfUserClock)
    end
    def deliver_time(this : IWMReaderAdvanced5*, cnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deliver_time.call(this, cnsTime)
    end
    def set_manual_stream_selection(this : IWMReaderAdvanced5*, fSelection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_stream_selection.call(this, fSelection)
    end
    def get_manual_stream_selection(this : IWMReaderAdvanced5*, pfSelection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manual_stream_selection.call(this, pfSelection)
    end
    def set_streams_selected(this : IWMReaderAdvanced5*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMReaderAdvanced5*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_receive_selection_callbacks(this : IWMReaderAdvanced5*, fGetCallbacks : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_selection_callbacks.call(this, fGetCallbacks)
    end
    def get_receive_selection_callbacks(this : IWMReaderAdvanced5*, pfGetCallbacks : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_selection_callbacks.call(this, pfGetCallbacks)
    end
    def set_receive_stream_samples(this : IWMReaderAdvanced5*, wStreamNum : UInt16, fReceiveStreamSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_stream_samples.call(this, wStreamNum, fReceiveStreamSamples)
    end
    def get_receive_stream_samples(this : IWMReaderAdvanced5*, wStreamNum : UInt16, pfReceiveStreamSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_stream_samples.call(this, wStreamNum, pfReceiveStreamSamples)
    end
    def set_allocate_for_output(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, fAllocate)
    end
    def get_allocate_for_output(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, pfAllocate)
    end
    def set_allocate_for_stream(this : IWMReaderAdvanced5*, wStreamNum : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, fAllocate)
    end
    def get_allocate_for_stream(this : IWMReaderAdvanced5*, dwSreamNum : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, pfAllocate)
    end
    def get_statistics(this : IWMReaderAdvanced5*, pStatistics : Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, pStatistics)
    end
    def set_client_info(this : IWMReaderAdvanced5*, pClientInfo : Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_info.call(this, pClientInfo)
    end
    def get_max_output_sample_size(this : IWMReaderAdvanced5*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMReaderAdvanced5*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def notify_late_delivery(this : IWMReaderAdvanced5*, cnsLateness : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_late_delivery.call(this, cnsLateness)
    end
    def set_play_mode(this : IWMReaderAdvanced5*, mode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_mode.call(this, mode)
    end
    def get_play_mode(this : IWMReaderAdvanced5*, pMode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_mode.call(this, pMode)
    end
    def get_buffer_progress(this : IWMReaderAdvanced5*, pdwPercent : UInt32*, pcnsBuffering : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_progress.call(this, pdwPercent, pcnsBuffering)
    end
    def get_download_progress(this : IWMReaderAdvanced5*, pdwPercent : UInt32*, pqwBytesDownloaded : UInt64*, pcnsDownload : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_download_progress.call(this, pdwPercent, pqwBytesDownloaded, pcnsDownload)
    end
    def get_save_as_progress(this : IWMReaderAdvanced5*, pdwPercent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_as_progress.call(this, pdwPercent)
    end
    def save_file_as(this : IWMReaderAdvanced5*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_file_as.call(this, pwszFilename)
    end
    def get_protocol_name(this : IWMReaderAdvanced5*, pwszProtocol : UInt16*, pcchProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_name.call(this, pwszProtocol, pcchProtocol)
    end
    def start_at_marker(this : IWMReaderAdvanced5*, wMarkerIndex : UInt16, cnsDuration : UInt64, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_marker.call(this, wMarkerIndex, cnsDuration, fRate, pvContext)
    end
    def get_output_setting(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def preroll(this : IWMReaderAdvanced5*, cnsStart : UInt64, cnsDuration : UInt64, fRate : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preroll.call(this, cnsStart, cnsDuration, fRate)
    end
    def set_log_client_id(this : IWMReaderAdvanced5*, fLogClientID : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_client_id.call(this, fLogClientID)
    end
    def get_log_client_id(this : IWMReaderAdvanced5*, pfLogClientID : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_client_id.call(this, pfLogClientID)
    end
    def stop_buffering(this : IWMReaderAdvanced5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_buffering.call(this)
    end
    def open_stream(this : IWMReaderAdvanced5*, pStream : Void*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream, pCallback, pvContext)
    end
    def stop_net_streaming(this : IWMReaderAdvanced5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_net_streaming.call(this)
    end
    def start_at_position(this : IWMReaderAdvanced5*, wStreamNum : UInt16, pvOffsetStart : Void*, pvDuration : Void*, dwOffsetFormat : Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_position.call(this, wStreamNum, pvOffsetStart, pvDuration, dwOffsetFormat, fRate, pvContext)
    end
    def get_language_count(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, pwLanguageCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_count.call(this, dwOutputNum, pwLanguageCount)
    end
    def get_language(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, wLanguage : UInt16, pwszLanguageString : UInt16*, pcchLanguageStringLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, dwOutputNum, wLanguage, pwszLanguageString, pcchLanguageStringLength)
    end
    def get_max_speed_factor(this : IWMReaderAdvanced5*, pdblFactor : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_speed_factor.call(this, pdblFactor)
    end
    def is_using_fast_cache(this : IWMReaderAdvanced5*, pfUsingFastCache : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_using_fast_cache.call(this, pfUsingFastCache)
    end
    def add_log_param(this : IWMReaderAdvanced5*, wszNameSpace : Win32cr::Foundation::PWSTR, wszName : Win32cr::Foundation::PWSTR, wszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_log_param.call(this, wszNameSpace, wszName, wszValue)
    end
    def send_log_params(this : IWMReaderAdvanced5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_log_params.call(this)
    end
    def can_save_file_as(this : IWMReaderAdvanced5*, pfCanSave : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_save_file_as.call(this, pfCanSave)
    end
    def cancel_save_file_as(this : IWMReaderAdvanced5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_save_file_as.call(this)
    end
    def get_url(this : IWMReaderAdvanced5*, pwszURL : UInt16*, pcchURL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url.call(this, pwszURL, pcchURL)
    end
    def set_player_hook(this : IWMReaderAdvanced5*, dwOutputNum : UInt32, pHook : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_player_hook.call(this, dwOutputNum, pHook)
    end

  end

  @[Extern]
  record IWMReaderAdvanced6Vtbl,
    query_interface : Proc(IWMReaderAdvanced6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAdvanced6*, UInt32),
    release : Proc(IWMReaderAdvanced6*, UInt32),
    set_user_provided_clock : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_user_provided_clock : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    deliver_time : Proc(IWMReaderAdvanced6*, UInt64, Win32cr::Foundation::HRESULT),
    set_manual_stream_selection : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_manual_stream_selection : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_streams_selected : Proc(IWMReaderAdvanced6*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    get_stream_selected : Proc(IWMReaderAdvanced6*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Win32cr::Foundation::HRESULT),
    set_receive_selection_callbacks : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_selection_callbacks : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_receive_stream_samples : Proc(IWMReaderAdvanced6*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_receive_stream_samples : Proc(IWMReaderAdvanced6*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_output : Proc(IWMReaderAdvanced6*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_output : Proc(IWMReaderAdvanced6*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_allocate_for_stream : Proc(IWMReaderAdvanced6*, UInt16, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_allocate_for_stream : Proc(IWMReaderAdvanced6*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(IWMReaderAdvanced6*, Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*, Win32cr::Foundation::HRESULT),
    set_client_info : Proc(IWMReaderAdvanced6*, Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*, Win32cr::Foundation::HRESULT),
    get_max_output_sample_size : Proc(IWMReaderAdvanced6*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_stream_sample_size : Proc(IWMReaderAdvanced6*, UInt16, UInt32*, Win32cr::Foundation::HRESULT),
    notify_late_delivery : Proc(IWMReaderAdvanced6*, UInt64, Win32cr::Foundation::HRESULT),
    set_play_mode : Proc(IWMReaderAdvanced6*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE, Win32cr::Foundation::HRESULT),
    get_play_mode : Proc(IWMReaderAdvanced6*, Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*, Win32cr::Foundation::HRESULT),
    get_buffer_progress : Proc(IWMReaderAdvanced6*, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    get_download_progress : Proc(IWMReaderAdvanced6*, UInt32*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_save_as_progress : Proc(IWMReaderAdvanced6*, UInt32*, Win32cr::Foundation::HRESULT),
    save_file_as : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_protocol_name : Proc(IWMReaderAdvanced6*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    start_at_marker : Proc(IWMReaderAdvanced6*, UInt16, UInt64, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_output_setting : Proc(IWMReaderAdvanced6*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_output_setting : Proc(IWMReaderAdvanced6*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    preroll : Proc(IWMReaderAdvanced6*, UInt64, UInt64, Float32, Win32cr::Foundation::HRESULT),
    set_log_client_id : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_log_client_id : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    stop_buffering : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::HRESULT),
    open_stream : Proc(IWMReaderAdvanced6*, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    stop_net_streaming : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::HRESULT),
    start_at_position : Proc(IWMReaderAdvanced6*, UInt16, Void*, Void*, Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, Float32, Void*, Win32cr::Foundation::HRESULT),
    get_language_count : Proc(IWMReaderAdvanced6*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    get_language : Proc(IWMReaderAdvanced6*, UInt32, UInt16, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    get_max_speed_factor : Proc(IWMReaderAdvanced6*, Float64*, Win32cr::Foundation::HRESULT),
    is_using_fast_cache : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    add_log_param : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    send_log_params : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::HRESULT),
    can_save_file_as : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cancel_save_file_as : Proc(IWMReaderAdvanced6*, Win32cr::Foundation::HRESULT),
    get_url : Proc(IWMReaderAdvanced6*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_player_hook : Proc(IWMReaderAdvanced6*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_protect_stream_samples : Proc(IWMReaderAdvanced6*, UInt8*, UInt32, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAdvanced6, lpVtbl : IWMReaderAdvanced6Vtbl* do
    GUID = LibC::GUID.new(0x18a2e7f8_u32, 0x428f_u16, 0x4acd_u16, StaticArray[0x8a_u8, 0x0_u8, 0xe6_u8, 0x46_u8, 0x39_u8, 0xbc_u8, 0x93_u8, 0xde_u8])
    def query_interface(this : IWMReaderAdvanced6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAdvanced6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAdvanced6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_user_provided_clock(this : IWMReaderAdvanced6*, fUserClock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_provided_clock.call(this, fUserClock)
    end
    def get_user_provided_clock(this : IWMReaderAdvanced6*, pfUserClock : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_provided_clock.call(this, pfUserClock)
    end
    def deliver_time(this : IWMReaderAdvanced6*, cnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deliver_time.call(this, cnsTime)
    end
    def set_manual_stream_selection(this : IWMReaderAdvanced6*, fSelection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_manual_stream_selection.call(this, fSelection)
    end
    def get_manual_stream_selection(this : IWMReaderAdvanced6*, pfSelection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_manual_stream_selection.call(this, pfSelection)
    end
    def set_streams_selected(this : IWMReaderAdvanced6*, cStreamCount : UInt16, pwStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_streams_selected.call(this, cStreamCount, pwStreamNumbers, pSelections)
    end
    def get_stream_selected(this : IWMReaderAdvanced6*, wStreamNum : UInt16, pSelection : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stream_selected.call(this, wStreamNum, pSelection)
    end
    def set_receive_selection_callbacks(this : IWMReaderAdvanced6*, fGetCallbacks : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_selection_callbacks.call(this, fGetCallbacks)
    end
    def get_receive_selection_callbacks(this : IWMReaderAdvanced6*, pfGetCallbacks : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_selection_callbacks.call(this, pfGetCallbacks)
    end
    def set_receive_stream_samples(this : IWMReaderAdvanced6*, wStreamNum : UInt16, fReceiveStreamSamples : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_receive_stream_samples.call(this, wStreamNum, fReceiveStreamSamples)
    end
    def get_receive_stream_samples(this : IWMReaderAdvanced6*, wStreamNum : UInt16, pfReceiveStreamSamples : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_receive_stream_samples.call(this, wStreamNum, pfReceiveStreamSamples)
    end
    def set_allocate_for_output(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_output.call(this, dwOutputNum, fAllocate)
    end
    def get_allocate_for_output(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_output.call(this, dwOutputNum, pfAllocate)
    end
    def set_allocate_for_stream(this : IWMReaderAdvanced6*, wStreamNum : UInt16, fAllocate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_allocate_for_stream.call(this, wStreamNum, fAllocate)
    end
    def get_allocate_for_stream(this : IWMReaderAdvanced6*, dwSreamNum : UInt16, pfAllocate : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allocate_for_stream.call(this, dwSreamNum, pfAllocate)
    end
    def get_statistics(this : IWMReaderAdvanced6*, pStatistics : Win32cr::Media::WindowsMediaFormat::WM_READER_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, pStatistics)
    end
    def set_client_info(this : IWMReaderAdvanced6*, pClientInfo : Win32cr::Media::WindowsMediaFormat::WM_READER_CLIENTINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_info.call(this, pClientInfo)
    end
    def get_max_output_sample_size(this : IWMReaderAdvanced6*, dwOutput : UInt32, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_output_sample_size.call(this, dwOutput, pcbMax)
    end
    def get_max_stream_sample_size(this : IWMReaderAdvanced6*, wStream : UInt16, pcbMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stream_sample_size.call(this, wStream, pcbMax)
    end
    def notify_late_delivery(this : IWMReaderAdvanced6*, cnsLateness : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_late_delivery.call(this, cnsLateness)
    end
    def set_play_mode(this : IWMReaderAdvanced6*, mode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_play_mode.call(this, mode)
    end
    def get_play_mode(this : IWMReaderAdvanced6*, pMode : Win32cr::Media::WindowsMediaFormat::WMT_PLAY_MODE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_mode.call(this, pMode)
    end
    def get_buffer_progress(this : IWMReaderAdvanced6*, pdwPercent : UInt32*, pcnsBuffering : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffer_progress.call(this, pdwPercent, pcnsBuffering)
    end
    def get_download_progress(this : IWMReaderAdvanced6*, pdwPercent : UInt32*, pqwBytesDownloaded : UInt64*, pcnsDownload : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_download_progress.call(this, pdwPercent, pqwBytesDownloaded, pcnsDownload)
    end
    def get_save_as_progress(this : IWMReaderAdvanced6*, pdwPercent : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_save_as_progress.call(this, pdwPercent)
    end
    def save_file_as(this : IWMReaderAdvanced6*, pwszFilename : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_file_as.call(this, pwszFilename)
    end
    def get_protocol_name(this : IWMReaderAdvanced6*, pwszProtocol : UInt16*, pcchProtocol : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_name.call(this, pwszProtocol, pcchProtocol)
    end
    def start_at_marker(this : IWMReaderAdvanced6*, wMarkerIndex : UInt16, cnsDuration : UInt64, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_marker.call(this, wMarkerIndex, cnsDuration, fRate, pvContext)
    end
    def get_output_setting(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_setting.call(this, dwOutputNum, pszName, pType, pValue, pcbLength)
    end
    def set_output_setting(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_setting.call(this, dwOutputNum, pszName, type__, pValue, cbLength)
    end
    def preroll(this : IWMReaderAdvanced6*, cnsStart : UInt64, cnsDuration : UInt64, fRate : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preroll.call(this, cnsStart, cnsDuration, fRate)
    end
    def set_log_client_id(this : IWMReaderAdvanced6*, fLogClientID : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_client_id.call(this, fLogClientID)
    end
    def get_log_client_id(this : IWMReaderAdvanced6*, pfLogClientID : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_client_id.call(this, pfLogClientID)
    end
    def stop_buffering(this : IWMReaderAdvanced6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_buffering.call(this)
    end
    def open_stream(this : IWMReaderAdvanced6*, pStream : Void*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_stream.call(this, pStream, pCallback, pvContext)
    end
    def stop_net_streaming(this : IWMReaderAdvanced6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_net_streaming.call(this)
    end
    def start_at_position(this : IWMReaderAdvanced6*, wStreamNum : UInt16, pvOffsetStart : Void*, pvDuration : Void*, dwOffsetFormat : Win32cr::Media::WindowsMediaFormat::WMT_OFFSET_FORMAT, fRate : Float32, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_at_position.call(this, wStreamNum, pvOffsetStart, pvDuration, dwOffsetFormat, fRate, pvContext)
    end
    def get_language_count(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, pwLanguageCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_count.call(this, dwOutputNum, pwLanguageCount)
    end
    def get_language(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, wLanguage : UInt16, pwszLanguageString : UInt16*, pcchLanguageStringLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language.call(this, dwOutputNum, wLanguage, pwszLanguageString, pcchLanguageStringLength)
    end
    def get_max_speed_factor(this : IWMReaderAdvanced6*, pdblFactor : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_speed_factor.call(this, pdblFactor)
    end
    def is_using_fast_cache(this : IWMReaderAdvanced6*, pfUsingFastCache : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_using_fast_cache.call(this, pfUsingFastCache)
    end
    def add_log_param(this : IWMReaderAdvanced6*, wszNameSpace : Win32cr::Foundation::PWSTR, wszName : Win32cr::Foundation::PWSTR, wszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_log_param.call(this, wszNameSpace, wszName, wszValue)
    end
    def send_log_params(this : IWMReaderAdvanced6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_log_params.call(this)
    end
    def can_save_file_as(this : IWMReaderAdvanced6*, pfCanSave : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_save_file_as.call(this, pfCanSave)
    end
    def cancel_save_file_as(this : IWMReaderAdvanced6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_save_file_as.call(this)
    end
    def get_url(this : IWMReaderAdvanced6*, pwszURL : UInt16*, pcchURL : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_url.call(this, pwszURL, pcchURL)
    end
    def set_player_hook(this : IWMReaderAdvanced6*, dwOutputNum : UInt32, pHook : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_player_hook.call(this, dwOutputNum, pHook)
    end
    def set_protect_stream_samples(this : IWMReaderAdvanced6*, pbCertificate : UInt8*, cbCertificate : UInt32, dwCertificateType : UInt32, dwFlags : UInt32, pbInitializationVector : UInt8*, pcbInitializationVector : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_protect_stream_samples.call(this, pbCertificate, cbCertificate, dwCertificateType, dwFlags, pbInitializationVector, pcbInitializationVector)
    end

  end

  @[Extern]
  record IWMPlayerHookVtbl,
    query_interface : Proc(IWMPlayerHook*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMPlayerHook*, UInt32),
    release : Proc(IWMPlayerHook*, UInt32),
    pre_decode : Proc(IWMPlayerHook*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMPlayerHook, lpVtbl : IWMPlayerHookVtbl* do
    GUID = LibC::GUID.new(0xe5b7ca9a_u32, 0xf1c_u16, 0x4f66_u16, StaticArray[0x90_u8, 0x2_u8, 0x74_u8, 0xec_u8, 0x50_u8, 0xd8_u8, 0xb3_u8, 0x4_u8])
    def query_interface(this : IWMPlayerHook*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMPlayerHook*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMPlayerHook*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def pre_decode(this : IWMPlayerHook*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pre_decode.call(this)
    end

  end

  @[Extern]
  record IWMReaderAllocatorExVtbl,
    query_interface : Proc(IWMReaderAllocatorEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAllocatorEx*, UInt32),
    release : Proc(IWMReaderAllocatorEx*, UInt32),
    allocate_for_stream_ex : Proc(IWMReaderAllocatorEx*, UInt16, UInt32, Void**, UInt32, UInt64, UInt64, Void*, Win32cr::Foundation::HRESULT),
    allocate_for_output_ex : Proc(IWMReaderAllocatorEx*, UInt32, UInt32, Void**, UInt32, UInt64, UInt64, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAllocatorEx, lpVtbl : IWMReaderAllocatorExVtbl* do
    GUID = LibC::GUID.new(0x9f762fa7_u32, 0xa22e_u16, 0x428d_u16, StaticArray[0x93_u8, 0xc9_u8, 0xac_u8, 0x82_u8, 0xf3_u8, 0xaa_u8, 0xfe_u8, 0x5a_u8])
    def query_interface(this : IWMReaderAllocatorEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAllocatorEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAllocatorEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def allocate_for_stream_ex(this : IWMReaderAllocatorEx*, wStreamNum : UInt16, cbBuffer : UInt32, ppBuffer : Void**, dwFlags : UInt32, cnsSampleTime : UInt64, cnsSampleDuration : UInt64, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_for_stream_ex.call(this, wStreamNum, cbBuffer, ppBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext)
    end
    def allocate_for_output_ex(this : IWMReaderAllocatorEx*, dwOutputNum : UInt32, cbBuffer : UInt32, ppBuffer : Void**, dwFlags : UInt32, cnsSampleTime : UInt64, cnsSampleDuration : UInt64, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_for_output_ex.call(this, dwOutputNum, cbBuffer, ppBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext)
    end

  end

  @[Extern]
  record IWMReaderTypeNegotiationVtbl,
    query_interface : Proc(IWMReaderTypeNegotiation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderTypeNegotiation*, UInt32),
    release : Proc(IWMReaderTypeNegotiation*, UInt32),
    try_output_props : Proc(IWMReaderTypeNegotiation*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderTypeNegotiation, lpVtbl : IWMReaderTypeNegotiationVtbl* do
    GUID = LibC::GUID.new(0xfdbe5592_u32, 0x81a1_u16, 0x41ea_u16, StaticArray[0x93_u8, 0xbd_u8, 0x73_u8, 0x5c_u8, 0xad_u8, 0x1a_u8, 0xdc_u8, 0x5_u8])
    def query_interface(this : IWMReaderTypeNegotiation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderTypeNegotiation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderTypeNegotiation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def try_output_props(this : IWMReaderTypeNegotiation*, dwOutputNum : UInt32, pOutput : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.try_output_props.call(this, dwOutputNum, pOutput)
    end

  end

  @[Extern]
  record IWMReaderCallbackAdvancedVtbl,
    query_interface : Proc(IWMReaderCallbackAdvanced*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderCallbackAdvanced*, UInt32),
    release : Proc(IWMReaderCallbackAdvanced*, UInt32),
    on_stream_sample : Proc(IWMReaderCallbackAdvanced*, UInt16, UInt64, UInt64, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_time : Proc(IWMReaderCallbackAdvanced*, UInt64, Void*, Win32cr::Foundation::HRESULT),
    on_stream_selection : Proc(IWMReaderCallbackAdvanced*, UInt16, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, Void*, Win32cr::Foundation::HRESULT),
    on_output_props_changed : Proc(IWMReaderCallbackAdvanced*, UInt32, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, Void*, Win32cr::Foundation::HRESULT),
    allocate_for_stream : Proc(IWMReaderCallbackAdvanced*, UInt16, UInt32, Void**, Void*, Win32cr::Foundation::HRESULT),
    allocate_for_output : Proc(IWMReaderCallbackAdvanced*, UInt32, UInt32, Void**, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderCallbackAdvanced, lpVtbl : IWMReaderCallbackAdvancedVtbl* do
    GUID = LibC::GUID.new(0x96406beb_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMReaderCallbackAdvanced*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderCallbackAdvanced*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderCallbackAdvanced*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_stream_sample(this : IWMReaderCallbackAdvanced*, wStreamNum : UInt16, cnsSampleTime : UInt64, cnsSampleDuration : UInt64, dwFlags : UInt32, pSample : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_stream_sample.call(this, wStreamNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext)
    end
    def on_time(this : IWMReaderCallbackAdvanced*, cnsCurrentTime : UInt64, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_time.call(this, cnsCurrentTime, pvContext)
    end
    def on_stream_selection(this : IWMReaderCallbackAdvanced*, wStreamCount : UInt16, pStreamNumbers : UInt16*, pSelections : Win32cr::Media::WindowsMediaFormat::WMT_STREAM_SELECTION*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_stream_selection.call(this, wStreamCount, pStreamNumbers, pSelections, pvContext)
    end
    def on_output_props_changed(this : IWMReaderCallbackAdvanced*, dwOutputNum : UInt32, pMediaType : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_output_props_changed.call(this, dwOutputNum, pMediaType, pvContext)
    end
    def allocate_for_stream(this : IWMReaderCallbackAdvanced*, wStreamNum : UInt16, cbBuffer : UInt32, ppBuffer : Void**, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_for_stream.call(this, wStreamNum, cbBuffer, ppBuffer, pvContext)
    end
    def allocate_for_output(this : IWMReaderCallbackAdvanced*, dwOutputNum : UInt32, cbBuffer : UInt32, ppBuffer : Void**, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_for_output.call(this, dwOutputNum, cbBuffer, ppBuffer, pvContext)
    end

  end

  @[Extern]
  record IWMDRMReaderVtbl,
    query_interface : Proc(IWMDRMReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMReader*, UInt32),
    release : Proc(IWMDRMReader*, UInt32),
    acquire_license : Proc(IWMDRMReader*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_license_acquisition : Proc(IWMDRMReader*, Win32cr::Foundation::HRESULT),
    individualize : Proc(IWMDRMReader*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_individualization : Proc(IWMDRMReader*, Win32cr::Foundation::HRESULT),
    monitor_license_acquisition : Proc(IWMDRMReader*, Win32cr::Foundation::HRESULT),
    cancel_monitor_license_acquisition : Proc(IWMDRMReader*, Win32cr::Foundation::HRESULT),
    set_drm_property : Proc(IWMDRMReader*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_drm_property : Proc(IWMDRMReader*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMReader, lpVtbl : IWMDRMReaderVtbl* do
    GUID = LibC::GUID.new(0xd2827540_u32, 0x3ee7_u16, 0x432c_u16, StaticArray[0xb1_u8, 0x4c_u8, 0xdc_u8, 0x17_u8, 0xf0_u8, 0x85_u8, 0xd3_u8, 0xb3_u8])
    def query_interface(this : IWMDRMReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def acquire_license(this : IWMDRMReader*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_license.call(this, dwFlags)
    end
    def cancel_license_acquisition(this : IWMDRMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_license_acquisition.call(this)
    end
    def individualize(this : IWMDRMReader*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.individualize.call(this, dwFlags)
    end
    def cancel_individualization(this : IWMDRMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_individualization.call(this)
    end
    def monitor_license_acquisition(this : IWMDRMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.monitor_license_acquisition.call(this)
    end
    def cancel_monitor_license_acquisition(this : IWMDRMReader*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_monitor_license_acquisition.call(this)
    end
    def set_drm_property(this : IWMDRMReader*, pwstrName : Win32cr::Foundation::PWSTR, dwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drm_property.call(this, pwstrName, dwType, pValue, cbLength)
    end
    def get_drm_property(this : IWMDRMReader*, pwstrName : Win32cr::Foundation::PWSTR, pdwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drm_property.call(this, pwstrName, pdwType, pValue, pcbLength)
    end

  end

  @[Extern]
  record IWMDRMReader2Vtbl,
    query_interface : Proc(IWMDRMReader2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMReader2*, UInt32),
    release : Proc(IWMDRMReader2*, UInt32),
    acquire_license : Proc(IWMDRMReader2*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_license_acquisition : Proc(IWMDRMReader2*, Win32cr::Foundation::HRESULT),
    individualize : Proc(IWMDRMReader2*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_individualization : Proc(IWMDRMReader2*, Win32cr::Foundation::HRESULT),
    monitor_license_acquisition : Proc(IWMDRMReader2*, Win32cr::Foundation::HRESULT),
    cancel_monitor_license_acquisition : Proc(IWMDRMReader2*, Win32cr::Foundation::HRESULT),
    set_drm_property : Proc(IWMDRMReader2*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_drm_property : Proc(IWMDRMReader2*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_evaluate_output_level_licenses : Proc(IWMDRMReader2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_play_output_levels : Proc(IWMDRMReader2*, Win32cr::Media::WindowsMediaFormat::DRM_PLAY_OPL*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_copy_output_levels : Proc(IWMDRMReader2*, Win32cr::Media::WindowsMediaFormat::DRM_COPY_OPL*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    try_next_license : Proc(IWMDRMReader2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMReader2, lpVtbl : IWMDRMReader2Vtbl* do
    GUID = LibC::GUID.new(0xbefe7a75_u32, 0x9f1d_u16, 0x4075_u16, StaticArray[0xb9_u8, 0xd9_u8, 0xa3_u8, 0xc3_u8, 0x7b_u8, 0xda_u8, 0x49_u8, 0xa0_u8])
    def query_interface(this : IWMDRMReader2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMReader2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMReader2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def acquire_license(this : IWMDRMReader2*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_license.call(this, dwFlags)
    end
    def cancel_license_acquisition(this : IWMDRMReader2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_license_acquisition.call(this)
    end
    def individualize(this : IWMDRMReader2*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.individualize.call(this, dwFlags)
    end
    def cancel_individualization(this : IWMDRMReader2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_individualization.call(this)
    end
    def monitor_license_acquisition(this : IWMDRMReader2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.monitor_license_acquisition.call(this)
    end
    def cancel_monitor_license_acquisition(this : IWMDRMReader2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_monitor_license_acquisition.call(this)
    end
    def set_drm_property(this : IWMDRMReader2*, pwstrName : Win32cr::Foundation::PWSTR, dwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drm_property.call(this, pwstrName, dwType, pValue, cbLength)
    end
    def get_drm_property(this : IWMDRMReader2*, pwstrName : Win32cr::Foundation::PWSTR, pdwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drm_property.call(this, pwstrName, pdwType, pValue, pcbLength)
    end
    def set_evaluate_output_level_licenses(this : IWMDRMReader2*, fEvaluate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_evaluate_output_level_licenses.call(this, fEvaluate)
    end
    def get_play_output_levels(this : IWMDRMReader2*, pPlayOPL : Win32cr::Media::WindowsMediaFormat::DRM_PLAY_OPL*, pcbLength : UInt32*, pdwMinAppComplianceLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_output_levels.call(this, pPlayOPL, pcbLength, pdwMinAppComplianceLevel)
    end
    def get_copy_output_levels(this : IWMDRMReader2*, pCopyOPL : Win32cr::Media::WindowsMediaFormat::DRM_COPY_OPL*, pcbLength : UInt32*, pdwMinAppComplianceLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_copy_output_levels.call(this, pCopyOPL, pcbLength, pdwMinAppComplianceLevel)
    end
    def try_next_license(this : IWMDRMReader2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.try_next_license.call(this)
    end

  end

  @[Extern]
  record IWMDRMReader3Vtbl,
    query_interface : Proc(IWMDRMReader3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMReader3*, UInt32),
    release : Proc(IWMDRMReader3*, UInt32),
    acquire_license : Proc(IWMDRMReader3*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_license_acquisition : Proc(IWMDRMReader3*, Win32cr::Foundation::HRESULT),
    individualize : Proc(IWMDRMReader3*, UInt32, Win32cr::Foundation::HRESULT),
    cancel_individualization : Proc(IWMDRMReader3*, Win32cr::Foundation::HRESULT),
    monitor_license_acquisition : Proc(IWMDRMReader3*, Win32cr::Foundation::HRESULT),
    cancel_monitor_license_acquisition : Proc(IWMDRMReader3*, Win32cr::Foundation::HRESULT),
    set_drm_property : Proc(IWMDRMReader3*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    get_drm_property : Proc(IWMDRMReader3*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_evaluate_output_level_licenses : Proc(IWMDRMReader3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_play_output_levels : Proc(IWMDRMReader3*, Win32cr::Media::WindowsMediaFormat::DRM_PLAY_OPL*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_copy_output_levels : Proc(IWMDRMReader3*, Win32cr::Media::WindowsMediaFormat::DRM_COPY_OPL*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    try_next_license : Proc(IWMDRMReader3*, Win32cr::Foundation::HRESULT),
    get_inclusion_list : Proc(IWMDRMReader3*, LibC::GUID**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMReader3, lpVtbl : IWMDRMReader3Vtbl* do
    GUID = LibC::GUID.new(0xe08672de_u32, 0xf1e7_u16, 0x4ff4_u16, StaticArray[0xa0_u8, 0xa3_u8, 0xfc_u8, 0x4b_u8, 0x8_u8, 0xe4_u8, 0xca_u8, 0xf8_u8])
    def query_interface(this : IWMDRMReader3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMReader3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMReader3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def acquire_license(this : IWMDRMReader3*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_license.call(this, dwFlags)
    end
    def cancel_license_acquisition(this : IWMDRMReader3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_license_acquisition.call(this)
    end
    def individualize(this : IWMDRMReader3*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.individualize.call(this, dwFlags)
    end
    def cancel_individualization(this : IWMDRMReader3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_individualization.call(this)
    end
    def monitor_license_acquisition(this : IWMDRMReader3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.monitor_license_acquisition.call(this)
    end
    def cancel_monitor_license_acquisition(this : IWMDRMReader3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_monitor_license_acquisition.call(this)
    end
    def set_drm_property(this : IWMDRMReader3*, pwstrName : Win32cr::Foundation::PWSTR, dwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_drm_property.call(this, pwstrName, dwType, pValue, cbLength)
    end
    def get_drm_property(this : IWMDRMReader3*, pwstrName : Win32cr::Foundation::PWSTR, pdwType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_drm_property.call(this, pwstrName, pdwType, pValue, pcbLength)
    end
    def set_evaluate_output_level_licenses(this : IWMDRMReader3*, fEvaluate : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_evaluate_output_level_licenses.call(this, fEvaluate)
    end
    def get_play_output_levels(this : IWMDRMReader3*, pPlayOPL : Win32cr::Media::WindowsMediaFormat::DRM_PLAY_OPL*, pcbLength : UInt32*, pdwMinAppComplianceLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_play_output_levels.call(this, pPlayOPL, pcbLength, pdwMinAppComplianceLevel)
    end
    def get_copy_output_levels(this : IWMDRMReader3*, pCopyOPL : Win32cr::Media::WindowsMediaFormat::DRM_COPY_OPL*, pcbLength : UInt32*, pdwMinAppComplianceLevel : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_copy_output_levels.call(this, pCopyOPL, pcbLength, pdwMinAppComplianceLevel)
    end
    def try_next_license(this : IWMDRMReader3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.try_next_license.call(this)
    end
    def get_inclusion_list(this : IWMDRMReader3*, ppGuids : LibC::GUID**, pcGuids : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inclusion_list.call(this, ppGuids, pcGuids)
    end

  end

  @[Extern]
  record IWMReaderPlaylistBurnVtbl,
    query_interface : Proc(IWMReaderPlaylistBurn*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderPlaylistBurn*, UInt32),
    release : Proc(IWMReaderPlaylistBurn*, UInt32),
    init_playlist_burn : Proc(IWMReaderPlaylistBurn*, UInt32, Win32cr::Foundation::PWSTR*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_init_results : Proc(IWMReaderPlaylistBurn*, UInt32, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IWMReaderPlaylistBurn*, Win32cr::Foundation::HRESULT),
    end_playlist_burn : Proc(IWMReaderPlaylistBurn*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderPlaylistBurn, lpVtbl : IWMReaderPlaylistBurnVtbl* do
    GUID = LibC::GUID.new(0xf28c0300_u32, 0x9baa_u16, 0x4477_u16, StaticArray[0xa8_u8, 0x46_u8, 0x17_u8, 0x44_u8, 0xd9_u8, 0xcb_u8, 0xf5_u8, 0x33_u8])
    def query_interface(this : IWMReaderPlaylistBurn*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderPlaylistBurn*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderPlaylistBurn*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init_playlist_burn(this : IWMReaderPlaylistBurn*, cFiles : UInt32, ppwszFilenames : Win32cr::Foundation::PWSTR*, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_playlist_burn.call(this, cFiles, ppwszFilenames, pCallback, pvContext)
    end
    def get_init_results(this : IWMReaderPlaylistBurn*, cFiles : UInt32, phrStati : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_init_results.call(this, cFiles, phrStati)
    end
    def cancel(this : IWMReaderPlaylistBurn*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def end_playlist_burn(this : IWMReaderPlaylistBurn*, hrBurnResult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_playlist_burn.call(this, hrBurnResult)
    end

  end

  @[Extern]
  record IWMReaderNetworkConfigVtbl,
    query_interface : Proc(IWMReaderNetworkConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderNetworkConfig*, UInt32),
    release : Proc(IWMReaderNetworkConfig*, UInt32),
    get_buffering_time : Proc(IWMReaderNetworkConfig*, UInt64*, Win32cr::Foundation::HRESULT),
    set_buffering_time : Proc(IWMReaderNetworkConfig*, UInt64, Win32cr::Foundation::HRESULT),
    get_udp_port_ranges : Proc(IWMReaderNetworkConfig*, Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, UInt32*, Win32cr::Foundation::HRESULT),
    set_udp_port_ranges : Proc(IWMReaderNetworkConfig*, Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, UInt32, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS, Win32cr::Foundation::HRESULT),
    get_proxy_host_name : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_host_name : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_port : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_port : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_proxy_exception_list : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_exception_list : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_multicast : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_multicast : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_http : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_http : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_udp : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_udp : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_tcp : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_tcp : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    reset_protocol_rollover : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::HRESULT),
    get_connection_bandwidth : Proc(IWMReaderNetworkConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    set_connection_bandwidth : Proc(IWMReaderNetworkConfig*, UInt32, Win32cr::Foundation::HRESULT),
    get_num_protocols_supported : Proc(IWMReaderNetworkConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    get_supported_protocol_name : Proc(IWMReaderNetworkConfig*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    add_logging_url : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_logging_url : Proc(IWMReaderNetworkConfig*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_logging_url_count : Proc(IWMReaderNetworkConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    reset_logging_url_list : Proc(IWMReaderNetworkConfig*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderNetworkConfig, lpVtbl : IWMReaderNetworkConfigVtbl* do
    GUID = LibC::GUID.new(0x96406bec_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMReaderNetworkConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderNetworkConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderNetworkConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffering_time(this : IWMReaderNetworkConfig*, pcnsBufferingTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffering_time.call(this, pcnsBufferingTime)
    end
    def set_buffering_time(this : IWMReaderNetworkConfig*, cnsBufferingTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffering_time.call(this, cnsBufferingTime)
    end
    def get_udp_port_ranges(this : IWMReaderNetworkConfig*, pRangeArray : Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, pcRanges : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_udp_port_ranges.call(this, pRangeArray, pcRanges)
    end
    def set_udp_port_ranges(this : IWMReaderNetworkConfig*, pRangeArray : Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, cRanges : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_udp_port_ranges.call(this, pRangeArray, cRanges)
    end
    def get_proxy_settings(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pProxySetting : Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pwszProtocol, pProxySetting)
    end
    def set_proxy_settings(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, proxy_setting : Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, pwszProtocol, proxy_setting)
    end
    def get_proxy_host_name(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszHostName : UInt16*, pcchHostName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_host_name.call(this, pwszProtocol, pwszHostName, pcchHostName)
    end
    def set_proxy_host_name(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszHostName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_host_name.call(this, pwszProtocol, pwszHostName)
    end
    def get_proxy_port(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pdwPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_port.call(this, pwszProtocol, pdwPort)
    end
    def set_proxy_port(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, dwPort : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_port.call(this, pwszProtocol, dwPort)
    end
    def get_proxy_exception_list(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszExceptionList : UInt16*, pcchExceptionList : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_exception_list.call(this, pwszProtocol, pwszExceptionList, pcchExceptionList)
    end
    def set_proxy_exception_list(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszExceptionList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_exception_list.call(this, pwszProtocol, pwszExceptionList)
    end
    def get_proxy_bypass_for_local(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, pfBypassForLocal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_bypass_for_local.call(this, pwszProtocol, pfBypassForLocal)
    end
    def set_proxy_bypass_for_local(this : IWMReaderNetworkConfig*, pwszProtocol : Win32cr::Foundation::PWSTR, fBypassForLocal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_bypass_for_local.call(this, pwszProtocol, fBypassForLocal)
    end
    def get_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig*, pfForceRerunDetection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_force_rerun_auto_proxy_detection.call(this, pfForceRerunDetection)
    end
    def set_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig*, fForceRerunDetection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_force_rerun_auto_proxy_detection.call(this, fForceRerunDetection)
    end
    def get_enable_multicast(this : IWMReaderNetworkConfig*, pfEnableMulticast : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_multicast.call(this, pfEnableMulticast)
    end
    def set_enable_multicast(this : IWMReaderNetworkConfig*, fEnableMulticast : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_multicast.call(this, fEnableMulticast)
    end
    def get_enable_http(this : IWMReaderNetworkConfig*, pfEnableHTTP : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_http.call(this, pfEnableHTTP)
    end
    def set_enable_http(this : IWMReaderNetworkConfig*, fEnableHTTP : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_http.call(this, fEnableHTTP)
    end
    def get_enable_udp(this : IWMReaderNetworkConfig*, pfEnableUDP : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_udp.call(this, pfEnableUDP)
    end
    def set_enable_udp(this : IWMReaderNetworkConfig*, fEnableUDP : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_udp.call(this, fEnableUDP)
    end
    def get_enable_tcp(this : IWMReaderNetworkConfig*, pfEnableTCP : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_tcp.call(this, pfEnableTCP)
    end
    def set_enable_tcp(this : IWMReaderNetworkConfig*, fEnableTCP : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_tcp.call(this, fEnableTCP)
    end
    def reset_protocol_rollover(this : IWMReaderNetworkConfig*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_protocol_rollover.call(this)
    end
    def get_connection_bandwidth(this : IWMReaderNetworkConfig*, pdwConnectionBandwidth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_bandwidth.call(this, pdwConnectionBandwidth)
    end
    def set_connection_bandwidth(this : IWMReaderNetworkConfig*, dwConnectionBandwidth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_bandwidth.call(this, dwConnectionBandwidth)
    end
    def get_num_protocols_supported(this : IWMReaderNetworkConfig*, pcProtocols : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_protocols_supported.call(this, pcProtocols)
    end
    def get_supported_protocol_name(this : IWMReaderNetworkConfig*, dwProtocolNum : UInt32, pwszProtocolName : UInt16*, pcchProtocolName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_protocol_name.call(this, dwProtocolNum, pwszProtocolName, pcchProtocolName)
    end
    def add_logging_url(this : IWMReaderNetworkConfig*, pwszUrl : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_logging_url.call(this, pwszUrl)
    end
    def get_logging_url(this : IWMReaderNetworkConfig*, dwIndex : UInt32, pwszUrl : UInt16*, pcchUrl : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logging_url.call(this, dwIndex, pwszUrl, pcchUrl)
    end
    def get_logging_url_count(this : IWMReaderNetworkConfig*, pdwUrlCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logging_url_count.call(this, pdwUrlCount)
    end
    def reset_logging_url_list(this : IWMReaderNetworkConfig*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_logging_url_list.call(this)
    end

  end

  @[Extern]
  record IWMReaderNetworkConfig2Vtbl,
    query_interface : Proc(IWMReaderNetworkConfig2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderNetworkConfig2*, UInt32),
    release : Proc(IWMReaderNetworkConfig2*, UInt32),
    get_buffering_time : Proc(IWMReaderNetworkConfig2*, UInt64*, Win32cr::Foundation::HRESULT),
    set_buffering_time : Proc(IWMReaderNetworkConfig2*, UInt64, Win32cr::Foundation::HRESULT),
    get_udp_port_ranges : Proc(IWMReaderNetworkConfig2*, Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, UInt32*, Win32cr::Foundation::HRESULT),
    set_udp_port_ranges : Proc(IWMReaderNetworkConfig2*, Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, UInt32, Win32cr::Foundation::HRESULT),
    get_proxy_settings : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS*, Win32cr::Foundation::HRESULT),
    set_proxy_settings : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS, Win32cr::Foundation::HRESULT),
    get_proxy_host_name : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_host_name : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_port : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_port : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_proxy_exception_list : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    set_proxy_exception_list : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_proxy_bypass_for_local : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_force_rerun_auto_proxy_detection : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_multicast : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_multicast : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_http : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_http : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_udp : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_udp : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_tcp : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_tcp : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    reset_protocol_rollover : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::HRESULT),
    get_connection_bandwidth : Proc(IWMReaderNetworkConfig2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_connection_bandwidth : Proc(IWMReaderNetworkConfig2*, UInt32, Win32cr::Foundation::HRESULT),
    get_num_protocols_supported : Proc(IWMReaderNetworkConfig2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_supported_protocol_name : Proc(IWMReaderNetworkConfig2*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    add_logging_url : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_logging_url : Proc(IWMReaderNetworkConfig2*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_logging_url_count : Proc(IWMReaderNetworkConfig2*, UInt32*, Win32cr::Foundation::HRESULT),
    reset_logging_url_list : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::HRESULT),
    get_enable_content_caching : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_content_caching : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_fast_cache : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_fast_cache : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_accelerated_streaming_duration : Proc(IWMReaderNetworkConfig2*, UInt64*, Win32cr::Foundation::HRESULT),
    set_accelerated_streaming_duration : Proc(IWMReaderNetworkConfig2*, UInt64, Win32cr::Foundation::HRESULT),
    get_auto_reconnect_limit : Proc(IWMReaderNetworkConfig2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_auto_reconnect_limit : Proc(IWMReaderNetworkConfig2*, UInt32, Win32cr::Foundation::HRESULT),
    get_enable_resends : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_resends : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_enable_thinning : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_enable_thinning : Proc(IWMReaderNetworkConfig2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_max_net_packet_size : Proc(IWMReaderNetworkConfig2*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderNetworkConfig2, lpVtbl : IWMReaderNetworkConfig2Vtbl* do
    GUID = LibC::GUID.new(0xd979a853_u32, 0x42b_u16, 0x4050_u16, StaticArray[0x83_u8, 0x87_u8, 0xc9_u8, 0x39_u8, 0xdb_u8, 0x22_u8, 0x1_u8, 0x3f_u8])
    def query_interface(this : IWMReaderNetworkConfig2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderNetworkConfig2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderNetworkConfig2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_buffering_time(this : IWMReaderNetworkConfig2*, pcnsBufferingTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_buffering_time.call(this, pcnsBufferingTime)
    end
    def set_buffering_time(this : IWMReaderNetworkConfig2*, cnsBufferingTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_buffering_time.call(this, cnsBufferingTime)
    end
    def get_udp_port_ranges(this : IWMReaderNetworkConfig2*, pRangeArray : Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, pcRanges : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_udp_port_ranges.call(this, pRangeArray, pcRanges)
    end
    def set_udp_port_ranges(this : IWMReaderNetworkConfig2*, pRangeArray : Win32cr::Media::WindowsMediaFormat::WM_PORT_NUMBER_RANGE*, cRanges : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_udp_port_ranges.call(this, pRangeArray, cRanges)
    end
    def get_proxy_settings(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pProxySetting : Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_settings.call(this, pwszProtocol, pProxySetting)
    end
    def set_proxy_settings(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, proxy_setting : Win32cr::Media::WindowsMediaFormat::WMT_PROXY_SETTINGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_settings.call(this, pwszProtocol, proxy_setting)
    end
    def get_proxy_host_name(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszHostName : UInt16*, pcchHostName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_host_name.call(this, pwszProtocol, pwszHostName, pcchHostName)
    end
    def set_proxy_host_name(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszHostName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_host_name.call(this, pwszProtocol, pwszHostName)
    end
    def get_proxy_port(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pdwPort : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_port.call(this, pwszProtocol, pdwPort)
    end
    def set_proxy_port(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, dwPort : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_port.call(this, pwszProtocol, dwPort)
    end
    def get_proxy_exception_list(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszExceptionList : UInt16*, pcchExceptionList : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_exception_list.call(this, pwszProtocol, pwszExceptionList, pcchExceptionList)
    end
    def set_proxy_exception_list(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pwszExceptionList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_exception_list.call(this, pwszProtocol, pwszExceptionList)
    end
    def get_proxy_bypass_for_local(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, pfBypassForLocal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proxy_bypass_for_local.call(this, pwszProtocol, pfBypassForLocal)
    end
    def set_proxy_bypass_for_local(this : IWMReaderNetworkConfig2*, pwszProtocol : Win32cr::Foundation::PWSTR, fBypassForLocal : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_proxy_bypass_for_local.call(this, pwszProtocol, fBypassForLocal)
    end
    def get_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig2*, pfForceRerunDetection : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_force_rerun_auto_proxy_detection.call(this, pfForceRerunDetection)
    end
    def set_force_rerun_auto_proxy_detection(this : IWMReaderNetworkConfig2*, fForceRerunDetection : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_force_rerun_auto_proxy_detection.call(this, fForceRerunDetection)
    end
    def get_enable_multicast(this : IWMReaderNetworkConfig2*, pfEnableMulticast : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_multicast.call(this, pfEnableMulticast)
    end
    def set_enable_multicast(this : IWMReaderNetworkConfig2*, fEnableMulticast : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_multicast.call(this, fEnableMulticast)
    end
    def get_enable_http(this : IWMReaderNetworkConfig2*, pfEnableHTTP : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_http.call(this, pfEnableHTTP)
    end
    def set_enable_http(this : IWMReaderNetworkConfig2*, fEnableHTTP : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_http.call(this, fEnableHTTP)
    end
    def get_enable_udp(this : IWMReaderNetworkConfig2*, pfEnableUDP : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_udp.call(this, pfEnableUDP)
    end
    def set_enable_udp(this : IWMReaderNetworkConfig2*, fEnableUDP : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_udp.call(this, fEnableUDP)
    end
    def get_enable_tcp(this : IWMReaderNetworkConfig2*, pfEnableTCP : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_tcp.call(this, pfEnableTCP)
    end
    def set_enable_tcp(this : IWMReaderNetworkConfig2*, fEnableTCP : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_tcp.call(this, fEnableTCP)
    end
    def reset_protocol_rollover(this : IWMReaderNetworkConfig2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_protocol_rollover.call(this)
    end
    def get_connection_bandwidth(this : IWMReaderNetworkConfig2*, pdwConnectionBandwidth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_connection_bandwidth.call(this, pdwConnectionBandwidth)
    end
    def set_connection_bandwidth(this : IWMReaderNetworkConfig2*, dwConnectionBandwidth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_bandwidth.call(this, dwConnectionBandwidth)
    end
    def get_num_protocols_supported(this : IWMReaderNetworkConfig2*, pcProtocols : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_protocols_supported.call(this, pcProtocols)
    end
    def get_supported_protocol_name(this : IWMReaderNetworkConfig2*, dwProtocolNum : UInt32, pwszProtocolName : UInt16*, pcchProtocolName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_protocol_name.call(this, dwProtocolNum, pwszProtocolName, pcchProtocolName)
    end
    def add_logging_url(this : IWMReaderNetworkConfig2*, pwszUrl : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_logging_url.call(this, pwszUrl)
    end
    def get_logging_url(this : IWMReaderNetworkConfig2*, dwIndex : UInt32, pwszUrl : UInt16*, pcchUrl : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logging_url.call(this, dwIndex, pwszUrl, pcchUrl)
    end
    def get_logging_url_count(this : IWMReaderNetworkConfig2*, pdwUrlCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_logging_url_count.call(this, pdwUrlCount)
    end
    def reset_logging_url_list(this : IWMReaderNetworkConfig2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_logging_url_list.call(this)
    end
    def get_enable_content_caching(this : IWMReaderNetworkConfig2*, pfEnableContentCaching : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_content_caching.call(this, pfEnableContentCaching)
    end
    def set_enable_content_caching(this : IWMReaderNetworkConfig2*, fEnableContentCaching : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_content_caching.call(this, fEnableContentCaching)
    end
    def get_enable_fast_cache(this : IWMReaderNetworkConfig2*, pfEnableFastCache : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_fast_cache.call(this, pfEnableFastCache)
    end
    def set_enable_fast_cache(this : IWMReaderNetworkConfig2*, fEnableFastCache : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_fast_cache.call(this, fEnableFastCache)
    end
    def get_accelerated_streaming_duration(this : IWMReaderNetworkConfig2*, pcnsAccelDuration : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accelerated_streaming_duration.call(this, pcnsAccelDuration)
    end
    def set_accelerated_streaming_duration(this : IWMReaderNetworkConfig2*, cnsAccelDuration : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_accelerated_streaming_duration.call(this, cnsAccelDuration)
    end
    def get_auto_reconnect_limit(this : IWMReaderNetworkConfig2*, pdwAutoReconnectLimit : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_auto_reconnect_limit.call(this, pdwAutoReconnectLimit)
    end
    def set_auto_reconnect_limit(this : IWMReaderNetworkConfig2*, dwAutoReconnectLimit : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_auto_reconnect_limit.call(this, dwAutoReconnectLimit)
    end
    def get_enable_resends(this : IWMReaderNetworkConfig2*, pfEnableResends : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_resends.call(this, pfEnableResends)
    end
    def set_enable_resends(this : IWMReaderNetworkConfig2*, fEnableResends : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_resends.call(this, fEnableResends)
    end
    def get_enable_thinning(this : IWMReaderNetworkConfig2*, pfEnableThinning : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enable_thinning.call(this, pfEnableThinning)
    end
    def set_enable_thinning(this : IWMReaderNetworkConfig2*, fEnableThinning : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enable_thinning.call(this, fEnableThinning)
    end
    def get_max_net_packet_size(this : IWMReaderNetworkConfig2*, pdwMaxNetPacketSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_net_packet_size.call(this, pdwMaxNetPacketSize)
    end

  end

  @[Extern]
  record IWMReaderStreamClockVtbl,
    query_interface : Proc(IWMReaderStreamClock*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderStreamClock*, UInt32),
    release : Proc(IWMReaderStreamClock*, UInt32),
    get_time : Proc(IWMReaderStreamClock*, UInt64*, Win32cr::Foundation::HRESULT),
    set_timer : Proc(IWMReaderStreamClock*, UInt64, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    kill_timer : Proc(IWMReaderStreamClock*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderStreamClock, lpVtbl : IWMReaderStreamClockVtbl* do
    GUID = LibC::GUID.new(0x96406bed_u32, 0x2b2b_u16, 0x11d3_u16, StaticArray[0xb3_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x8_u8, 0xff_u8])
    def query_interface(this : IWMReaderStreamClock*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderStreamClock*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderStreamClock*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_time(this : IWMReaderStreamClock*, pcnsNow : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_time.call(this, pcnsNow)
    end
    def set_timer(this : IWMReaderStreamClock*, cnsWhen : UInt64, pvParam : Void*, pdwTimerId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_timer.call(this, cnsWhen, pvParam, pdwTimerId)
    end
    def kill_timer(this : IWMReaderStreamClock*, dwTimerId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.kill_timer.call(this, dwTimerId)
    end

  end

  @[Extern]
  record IWMIndexerVtbl,
    query_interface : Proc(IWMIndexer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMIndexer*, UInt32),
    release : Proc(IWMIndexer*, UInt32),
    start_indexing : Proc(IWMIndexer*, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IWMIndexer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMIndexer, lpVtbl : IWMIndexerVtbl* do
    GUID = LibC::GUID.new(0x6d7cdc71_u32, 0x9888_u16, 0x11d3_u16, StaticArray[0x8e_u8, 0xdc_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x9_u8, 0xcf_u8])
    def query_interface(this : IWMIndexer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMIndexer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMIndexer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_indexing(this : IWMIndexer*, pwszURL : Win32cr::Foundation::PWSTR, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_indexing.call(this, pwszURL, pCallback, pvContext)
    end
    def cancel(this : IWMIndexer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record IWMIndexer2Vtbl,
    query_interface : Proc(IWMIndexer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMIndexer2*, UInt32),
    release : Proc(IWMIndexer2*, UInt32),
    start_indexing : Proc(IWMIndexer2*, Win32cr::Foundation::PWSTR, Void*, Void*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IWMIndexer2*, Win32cr::Foundation::HRESULT),
    configure : Proc(IWMIndexer2*, UInt16, Win32cr::Media::WindowsMediaFormat::WMT_INDEXER_TYPE, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMIndexer2, lpVtbl : IWMIndexer2Vtbl* do
    GUID = LibC::GUID.new(0xb70f1e42_u32, 0x6255_u16, 0x4df0_u16, StaticArray[0xa6_u8, 0xb9_u8, 0x2_u8, 0xb2_u8, 0x12_u8, 0xd9_u8, 0xe2_u8, 0xbb_u8])
    def query_interface(this : IWMIndexer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMIndexer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMIndexer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_indexing(this : IWMIndexer2*, pwszURL : Win32cr::Foundation::PWSTR, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_indexing.call(this, pwszURL, pCallback, pvContext)
    end
    def cancel(this : IWMIndexer2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def configure(this : IWMIndexer2*, wStreamNum : UInt16, nIndexerType : Win32cr::Media::WindowsMediaFormat::WMT_INDEXER_TYPE, pvInterval : Void*, pvIndexType : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure.call(this, wStreamNum, nIndexerType, pvInterval, pvIndexType)
    end

  end

  @[Extern]
  record IWMLicenseBackupVtbl,
    query_interface : Proc(IWMLicenseBackup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMLicenseBackup*, UInt32),
    release : Proc(IWMLicenseBackup*, UInt32),
    backup_licenses : Proc(IWMLicenseBackup*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    cancel_license_backup : Proc(IWMLicenseBackup*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMLicenseBackup, lpVtbl : IWMLicenseBackupVtbl* do
    GUID = LibC::GUID.new(0x5e5ac9f_u32, 0x3fb6_u16, 0x4508_u16, StaticArray[0xbb_u8, 0x43_u8, 0xa4_u8, 0x6_u8, 0x7b_u8, 0xa1_u8, 0xeb_u8, 0xe8_u8])
    def query_interface(this : IWMLicenseBackup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMLicenseBackup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMLicenseBackup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def backup_licenses(this : IWMLicenseBackup*, dwFlags : UInt32, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup_licenses.call(this, dwFlags, pCallback)
    end
    def cancel_license_backup(this : IWMLicenseBackup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_license_backup.call(this)
    end

  end

  @[Extern]
  record IWMLicenseRestoreVtbl,
    query_interface : Proc(IWMLicenseRestore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMLicenseRestore*, UInt32),
    release : Proc(IWMLicenseRestore*, UInt32),
    restore_licenses : Proc(IWMLicenseRestore*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    cancel_license_restore : Proc(IWMLicenseRestore*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMLicenseRestore, lpVtbl : IWMLicenseRestoreVtbl* do
    GUID = LibC::GUID.new(0xc70b6334_u32, 0xa22e_u16, 0x4efb_u16, StaticArray[0xa2_u8, 0x45_u8, 0x15_u8, 0xe6_u8, 0x5a_u8, 0x0_u8, 0x4a_u8, 0x13_u8])
    def query_interface(this : IWMLicenseRestore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMLicenseRestore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMLicenseRestore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def restore_licenses(this : IWMLicenseRestore*, dwFlags : UInt32, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_licenses.call(this, dwFlags, pCallback)
    end
    def cancel_license_restore(this : IWMLicenseRestore*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_license_restore.call(this)
    end

  end

  @[Extern]
  record IWMBackupRestorePropsVtbl,
    query_interface : Proc(IWMBackupRestoreProps*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMBackupRestoreProps*, UInt32),
    release : Proc(IWMBackupRestoreProps*, UInt32),
    get_prop_count : Proc(IWMBackupRestoreProps*, UInt16*, Win32cr::Foundation::HRESULT),
    get_prop_by_index : Proc(IWMBackupRestoreProps*, UInt16, UInt16*, UInt16*, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    get_prop_by_name : Proc(IWMBackupRestoreProps*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt16*, Win32cr::Foundation::HRESULT),
    set_prop : Proc(IWMBackupRestoreProps*, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt16, Win32cr::Foundation::HRESULT),
    remove_prop : Proc(IWMBackupRestoreProps*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove_all_props : Proc(IWMBackupRestoreProps*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMBackupRestoreProps, lpVtbl : IWMBackupRestorePropsVtbl* do
    GUID = LibC::GUID.new(0x3c8e0da6_u32, 0x996f_u16, 0x4ff3_u16, StaticArray[0xa1_u8, 0xaf_u8, 0x48_u8, 0x38_u8, 0xf9_u8, 0x37_u8, 0x7e_u8, 0x2e_u8])
    def query_interface(this : IWMBackupRestoreProps*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMBackupRestoreProps*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMBackupRestoreProps*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_prop_count(this : IWMBackupRestoreProps*, pcProps : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_count.call(this, pcProps)
    end
    def get_prop_by_index(this : IWMBackupRestoreProps*, wIndex : UInt16, pwszName : UInt16*, pcchNameLen : UInt16*, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_by_index.call(this, wIndex, pwszName, pcchNameLen, pType, pValue, pcbLength)
    end
    def get_prop_by_name(this : IWMBackupRestoreProps*, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pcbLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_by_name.call(this, pszName, pType, pValue, pcbLength)
    end
    def set_prop(this : IWMBackupRestoreProps*, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, cbLength : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prop.call(this, pszName, type__, pValue, cbLength)
    end
    def remove_prop(this : IWMBackupRestoreProps*, pcwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_prop.call(this, pcwszName)
    end
    def remove_all_props(this : IWMBackupRestoreProps*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_props.call(this)
    end

  end

  @[Extern]
  record IWMCodecInfoVtbl,
    query_interface : Proc(IWMCodecInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMCodecInfo*, UInt32),
    release : Proc(IWMCodecInfo*, UInt32),
    get_codec_info_count : Proc(IWMCodecInfo*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format_count : Proc(IWMCodecInfo*, LibC::GUID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format : Proc(IWMCodecInfo*, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMCodecInfo, lpVtbl : IWMCodecInfoVtbl* do
    GUID = LibC::GUID.new(0xa970f41e_u32, 0x34de_u16, 0x4a98_u16, StaticArray[0xb3_u8, 0xba_u8, 0xe4_u8, 0xb3_u8, 0xca_u8, 0x75_u8, 0x28_u8, 0xf0_u8])
    def query_interface(this : IWMCodecInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMCodecInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMCodecInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_codec_info_count(this : IWMCodecInfo*, guidType : LibC::GUID*, pcCodecs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info_count.call(this, guidType, pcCodecs)
    end
    def get_codec_format_count(this : IWMCodecInfo*, guidType : LibC::GUID*, dwCodecIndex : UInt32, pcFormat : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format_count.call(this, guidType, dwCodecIndex, pcFormat)
    end
    def get_codec_format(this : IWMCodecInfo*, guidType : LibC::GUID*, dwCodecIndex : UInt32, dwFormatIndex : UInt32, ppIStreamConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format.call(this, guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig)
    end

  end

  @[Extern]
  record IWMCodecInfo2Vtbl,
    query_interface : Proc(IWMCodecInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMCodecInfo2*, UInt32),
    release : Proc(IWMCodecInfo2*, UInt32),
    get_codec_info_count : Proc(IWMCodecInfo2*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format_count : Proc(IWMCodecInfo2*, LibC::GUID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format : Proc(IWMCodecInfo2*, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_codec_name : Proc(IWMCodecInfo2*, LibC::GUID*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format_desc : Proc(IWMCodecInfo2*, LibC::GUID*, UInt32, UInt32, Void**, UInt16*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMCodecInfo2, lpVtbl : IWMCodecInfo2Vtbl* do
    GUID = LibC::GUID.new(0xaa65e273_u32, 0xb686_u16, 0x4056_u16, StaticArray[0x91_u8, 0xec_u8, 0xdd_u8, 0x76_u8, 0x8d_u8, 0x4d_u8, 0xf7_u8, 0x10_u8])
    def query_interface(this : IWMCodecInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMCodecInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMCodecInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_codec_info_count(this : IWMCodecInfo2*, guidType : LibC::GUID*, pcCodecs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info_count.call(this, guidType, pcCodecs)
    end
    def get_codec_format_count(this : IWMCodecInfo2*, guidType : LibC::GUID*, dwCodecIndex : UInt32, pcFormat : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format_count.call(this, guidType, dwCodecIndex, pcFormat)
    end
    def get_codec_format(this : IWMCodecInfo2*, guidType : LibC::GUID*, dwCodecIndex : UInt32, dwFormatIndex : UInt32, ppIStreamConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format.call(this, guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig)
    end
    def get_codec_name(this : IWMCodecInfo2*, guidType : LibC::GUID*, dwCodecIndex : UInt32, wszName : UInt16*, pcchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_name.call(this, guidType, dwCodecIndex, wszName, pcchName)
    end
    def get_codec_format_desc(this : IWMCodecInfo2*, guidType : LibC::GUID*, dwCodecIndex : UInt32, dwFormatIndex : UInt32, ppIStreamConfig : Void**, wszDesc : UInt16*, pcchDesc : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format_desc.call(this, guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig, wszDesc, pcchDesc)
    end

  end

  @[Extern]
  record IWMCodecInfo3Vtbl,
    query_interface : Proc(IWMCodecInfo3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMCodecInfo3*, UInt32),
    release : Proc(IWMCodecInfo3*, UInt32),
    get_codec_info_count : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format_count : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_codec_name : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format_desc : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, UInt32, Void**, UInt16*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_format_prop : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_codec_prop : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_codec_enumeration_setting : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_codec_enumeration_setting : Proc(IWMCodecInfo3*, LibC::GUID*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMCodecInfo3, lpVtbl : IWMCodecInfo3Vtbl* do
    GUID = LibC::GUID.new(0x7e51f487_u32, 0x4d93_u16, 0x4f98_u16, StaticArray[0x8a_u8, 0xb4_u8, 0x27_u8, 0xd0_u8, 0x56_u8, 0x5a_u8, 0xdc_u8, 0x51_u8])
    def query_interface(this : IWMCodecInfo3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMCodecInfo3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMCodecInfo3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_codec_info_count(this : IWMCodecInfo3*, guidType : LibC::GUID*, pcCodecs : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_info_count.call(this, guidType, pcCodecs)
    end
    def get_codec_format_count(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, pcFormat : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format_count.call(this, guidType, dwCodecIndex, pcFormat)
    end
    def get_codec_format(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, dwFormatIndex : UInt32, ppIStreamConfig : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format.call(this, guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig)
    end
    def get_codec_name(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, wszName : UInt16*, pcchName : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_name.call(this, guidType, dwCodecIndex, wszName, pcchName)
    end
    def get_codec_format_desc(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, dwFormatIndex : UInt32, ppIStreamConfig : Void**, wszDesc : UInt16*, pcchDesc : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format_desc.call(this, guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig, wszDesc, pcchDesc)
    end
    def get_codec_format_prop(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, dwFormatIndex : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_format_prop.call(this, guidType, dwCodecIndex, dwFormatIndex, pszName, pType, pValue, pdwSize)
    end
    def get_codec_prop(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_prop.call(this, guidType, dwCodecIndex, pszName, pType, pValue, pdwSize)
    end
    def set_codec_enumeration_setting(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, pszName : Win32cr::Foundation::PWSTR, type__ : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE, pValue : UInt8*, dwSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_codec_enumeration_setting.call(this, guidType, dwCodecIndex, pszName, type__, pValue, dwSize)
    end
    def get_codec_enumeration_setting(this : IWMCodecInfo3*, guidType : LibC::GUID*, dwCodecIndex : UInt32, pszName : Win32cr::Foundation::PWSTR, pType : Win32cr::Media::WindowsMediaFormat::WMT_ATTR_DATATYPE*, pValue : UInt8*, pdwSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_enumeration_setting.call(this, guidType, dwCodecIndex, pszName, pType, pValue, pdwSize)
    end

  end

  @[Extern]
  record IWMLanguageListVtbl,
    query_interface : Proc(IWMLanguageList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMLanguageList*, UInt32),
    release : Proc(IWMLanguageList*, UInt32),
    get_language_count : Proc(IWMLanguageList*, UInt16*, Win32cr::Foundation::HRESULT),
    get_language_details : Proc(IWMLanguageList*, UInt16, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    add_language_by_rfc1766_string : Proc(IWMLanguageList*, Win32cr::Foundation::PWSTR, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMLanguageList, lpVtbl : IWMLanguageListVtbl* do
    GUID = LibC::GUID.new(0xdf683f00_u32, 0x2d49_u16, 0x4d8e_u16, StaticArray[0x92_u8, 0xb7_u8, 0xfb_u8, 0x19_u8, 0xf6_u8, 0xa0_u8, 0xdc_u8, 0x57_u8])
    def query_interface(this : IWMLanguageList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMLanguageList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMLanguageList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_language_count(this : IWMLanguageList*, pwCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_count.call(this, pwCount)
    end
    def get_language_details(this : IWMLanguageList*, wIndex : UInt16, pwszLanguageString : UInt16*, pcchLanguageStringLength : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_details.call(this, wIndex, pwszLanguageString, pcchLanguageStringLength)
    end
    def add_language_by_rfc1766_string(this : IWMLanguageList*, pwszLanguageString : Win32cr::Foundation::PWSTR, pwIndex : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_language_by_rfc1766_string.call(this, pwszLanguageString, pwIndex)
    end

  end

  @[Extern]
  record IWMWriterPushSinkVtbl,
    query_interface : Proc(IWMWriterPushSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWriterPushSink*, UInt32),
    release : Proc(IWMWriterPushSink*, UInt32),
    on_header : Proc(IWMWriterPushSink*, Void*, Win32cr::Foundation::HRESULT),
    is_real_time : Proc(IWMWriterPushSink*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    allocate_data_unit : Proc(IWMWriterPushSink*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    on_data_unit : Proc(IWMWriterPushSink*, Void*, Win32cr::Foundation::HRESULT),
    on_end_writing : Proc(IWMWriterPushSink*, Win32cr::Foundation::HRESULT),
    connect : Proc(IWMWriterPushSink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IWMWriterPushSink*, Win32cr::Foundation::HRESULT),
    end_session : Proc(IWMWriterPushSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWriterPushSink, lpVtbl : IWMWriterPushSinkVtbl* do
    GUID = LibC::GUID.new(0xdc10e6a5_u32, 0x72c_u16, 0x467d_u16, StaticArray[0xbf_u8, 0x57_u8, 0x63_u8, 0x30_u8, 0xa9_u8, 0xdd_u8, 0xe1_u8, 0x2a_u8])
    def query_interface(this : IWMWriterPushSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWriterPushSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWriterPushSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_header(this : IWMWriterPushSink*, pHeader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_header.call(this, pHeader)
    end
    def is_real_time(this : IWMWriterPushSink*, pfRealTime : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_real_time.call(this, pfRealTime)
    end
    def allocate_data_unit(this : IWMWriterPushSink*, cbDataUnit : UInt32, ppDataUnit : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.allocate_data_unit.call(this, cbDataUnit, ppDataUnit)
    end
    def on_data_unit(this : IWMWriterPushSink*, pDataUnit : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_unit.call(this, pDataUnit)
    end
    def on_end_writing(this : IWMWriterPushSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_writing.call(this)
    end
    def connect(this : IWMWriterPushSink*, pwszURL : Win32cr::Foundation::PWSTR, pwszTemplateURL : Win32cr::Foundation::PWSTR, fAutoDestroy : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, pwszURL, pwszTemplateURL, fAutoDestroy)
    end
    def disconnect(this : IWMWriterPushSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def end_session(this : IWMWriterPushSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_session.call(this)
    end

  end

  @[Extern]
  record IWMDeviceRegistrationVtbl,
    query_interface : Proc(IWMDeviceRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDeviceRegistration*, UInt32),
    release : Proc(IWMDeviceRegistration*, UInt32),
    register_device : Proc(IWMDeviceRegistration*, UInt32, UInt8*, UInt32, Win32cr::Media::WindowsMediaFormat::DRM_VAL16, Void**, Win32cr::Foundation::HRESULT),
    unregister_device : Proc(IWMDeviceRegistration*, UInt32, UInt8*, UInt32, Win32cr::Media::WindowsMediaFormat::DRM_VAL16, Win32cr::Foundation::HRESULT),
    get_registration_stats : Proc(IWMDeviceRegistration*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_first_registered_device : Proc(IWMDeviceRegistration*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_next_registered_device : Proc(IWMDeviceRegistration*, Void**, Win32cr::Foundation::HRESULT),
    get_registered_device_by_id : Proc(IWMDeviceRegistration*, UInt32, UInt8*, UInt32, Win32cr::Media::WindowsMediaFormat::DRM_VAL16, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDeviceRegistration, lpVtbl : IWMDeviceRegistrationVtbl* do
    GUID = LibC::GUID.new(0xf6211f03_u32, 0x8d21_u16, 0x4e94_u16, StaticArray[0x93_u8, 0xe6_u8, 0x85_u8, 0x10_u8, 0x80_u8, 0x5f_u8, 0x2d_u8, 0x99_u8])
    def query_interface(this : IWMDeviceRegistration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDeviceRegistration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDeviceRegistration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_device(this : IWMDeviceRegistration*, dwRegisterType : UInt32, pbCertificate : UInt8*, cbCertificate : UInt32, serial_number : Win32cr::Media::WindowsMediaFormat::DRM_VAL16, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_device.call(this, dwRegisterType, pbCertificate, cbCertificate, serial_number, ppDevice)
    end
    def unregister_device(this : IWMDeviceRegistration*, dwRegisterType : UInt32, pbCertificate : UInt8*, cbCertificate : UInt32, serial_number : Win32cr::Media::WindowsMediaFormat::DRM_VAL16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_device.call(this, dwRegisterType, pbCertificate, cbCertificate, serial_number)
    end
    def get_registration_stats(this : IWMDeviceRegistration*, dwRegisterType : UInt32, pcRegisteredDevices : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registration_stats.call(this, dwRegisterType, pcRegisteredDevices)
    end
    def get_first_registered_device(this : IWMDeviceRegistration*, dwRegisterType : UInt32, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first_registered_device.call(this, dwRegisterType, ppDevice)
    end
    def get_next_registered_device(this : IWMDeviceRegistration*, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_registered_device.call(this, ppDevice)
    end
    def get_registered_device_by_id(this : IWMDeviceRegistration*, dwRegisterType : UInt32, pbCertificate : UInt8*, cbCertificate : UInt32, serial_number : Win32cr::Media::WindowsMediaFormat::DRM_VAL16, ppDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registered_device_by_id.call(this, dwRegisterType, pbCertificate, cbCertificate, serial_number, ppDevice)
    end

  end

  @[Extern]
  record IWMRegisteredDeviceVtbl,
    query_interface : Proc(IWMRegisteredDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMRegisteredDevice*, UInt32),
    release : Proc(IWMRegisteredDevice*, UInt32),
    get_device_serial_number : Proc(IWMRegisteredDevice*, Win32cr::Media::WindowsMediaFormat::DRM_VAL16*, Win32cr::Foundation::HRESULT),
    get_device_certificate : Proc(IWMRegisteredDevice*, Void**, Win32cr::Foundation::HRESULT),
    get_device_type : Proc(IWMRegisteredDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute_count : Proc(IWMRegisteredDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_attribute_by_index : Proc(IWMRegisteredDevice*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_attribute_by_name : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_attribute_by_name : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    approve : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_valid : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_approved : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_wmdrm_compliant : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_opened : Proc(IWMRegisteredDevice*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    open : Proc(IWMRegisteredDevice*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMRegisteredDevice*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMRegisteredDevice, lpVtbl : IWMRegisteredDeviceVtbl* do
    GUID = LibC::GUID.new(0xa4503bec_u32, 0x5508_u16, 0x4148_u16, StaticArray[0x97_u8, 0xac_u8, 0xbf_u8, 0xa7_u8, 0x57_u8, 0x60_u8, 0xa7_u8, 0xd_u8])
    def query_interface(this : IWMRegisteredDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMRegisteredDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMRegisteredDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_serial_number(this : IWMRegisteredDevice*, pSerialNumber : Win32cr::Media::WindowsMediaFormat::DRM_VAL16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_serial_number.call(this, pSerialNumber)
    end
    def get_device_certificate(this : IWMRegisteredDevice*, ppCertificate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_certificate.call(this, ppCertificate)
    end
    def get_device_type(this : IWMRegisteredDevice*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_type.call(this, pdwType)
    end
    def get_attribute_count(this : IWMRegisteredDevice*, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_count.call(this, pcAttributes)
    end
    def get_attribute_by_index(this : IWMRegisteredDevice*, dwIndex : UInt32, pbstrName : Win32cr::Foundation::BSTR*, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_index.call(this, dwIndex, pbstrName, pbstrValue)
    end
    def get_attribute_by_name(this : IWMRegisteredDevice*, bstrName : Win32cr::Foundation::BSTR, pbstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_by_name.call(this, bstrName, pbstrValue)
    end
    def set_attribute_by_name(this : IWMRegisteredDevice*, bstrName : Win32cr::Foundation::BSTR, bstrValue : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attribute_by_name.call(this, bstrName, bstrValue)
    end
    def approve(this : IWMRegisteredDevice*, fApprove : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.approve.call(this, fApprove)
    end
    def is_valid(this : IWMRegisteredDevice*, pfValid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_valid.call(this, pfValid)
    end
    def is_approved(this : IWMRegisteredDevice*, pfApproved : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_approved.call(this, pfApproved)
    end
    def is_wmdrm_compliant(this : IWMRegisteredDevice*, pfCompliant : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_wmdrm_compliant.call(this, pfCompliant)
    end
    def is_opened(this : IWMRegisteredDevice*, pfOpened : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_opened.call(this, pfOpened)
    end
    def open(this : IWMRegisteredDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open.call(this)
    end
    def close(this : IWMRegisteredDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IWMProximityDetectionVtbl,
    query_interface : Proc(IWMProximityDetection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMProximityDetection*, UInt32),
    release : Proc(IWMProximityDetection*, UInt32),
    start_detection : Proc(IWMProximityDetection*, UInt8*, UInt32, UInt8*, UInt32, UInt32, Void**, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMProximityDetection, lpVtbl : IWMProximityDetectionVtbl* do
    GUID = LibC::GUID.new(0x6a9fd8ee_u32, 0xb651_u16, 0x4bf0_u16, StaticArray[0xb8_u8, 0x49_u8, 0x7d_u8, 0x4e_u8, 0xce_u8, 0x79_u8, 0xa2_u8, 0xb1_u8])
    def query_interface(this : IWMProximityDetection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMProximityDetection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMProximityDetection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_detection(this : IWMProximityDetection*, pbRegistrationMsg : UInt8*, cbRegistrationMsg : UInt32, pbLocalAddress : UInt8*, cbLocalAddress : UInt32, dwExtraPortsAllowed : UInt32, ppRegistrationResponseMsg : Void**, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_detection.call(this, pbRegistrationMsg, cbRegistrationMsg, pbLocalAddress, cbLocalAddress, dwExtraPortsAllowed, ppRegistrationResponseMsg, pCallback, pvContext)
    end

  end

  @[Extern]
  record IWMDRMMessageParserVtbl,
    query_interface : Proc(IWMDRMMessageParser*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMMessageParser*, UInt32),
    release : Proc(IWMDRMMessageParser*, UInt32),
    parse_registration_req_msg : Proc(IWMDRMMessageParser*, UInt8*, UInt32, Void**, Win32cr::Media::WindowsMediaFormat::DRM_VAL16*, Win32cr::Foundation::HRESULT),
    parse_license_request_msg : Proc(IWMDRMMessageParser*, UInt8*, UInt32, Void**, Win32cr::Media::WindowsMediaFormat::DRM_VAL16*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMMessageParser, lpVtbl : IWMDRMMessageParserVtbl* do
    GUID = LibC::GUID.new(0xa73a0072_u32, 0x25a0_u16, 0x4c99_u16, StaticArray[0xb4_u8, 0xa5_u8, 0xed_u8, 0xe8_u8, 0x10_u8, 0x1a_u8, 0x6c_u8, 0x39_u8])
    def query_interface(this : IWMDRMMessageParser*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMMessageParser*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMMessageParser*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_registration_req_msg(this : IWMDRMMessageParser*, pbRegistrationReqMsg : UInt8*, cbRegistrationReqMsg : UInt32, ppDeviceCert : Void**, pDeviceSerialNumber : Win32cr::Media::WindowsMediaFormat::DRM_VAL16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_registration_req_msg.call(this, pbRegistrationReqMsg, cbRegistrationReqMsg, ppDeviceCert, pDeviceSerialNumber)
    end
    def parse_license_request_msg(this : IWMDRMMessageParser*, pbLicenseRequestMsg : UInt8*, cbLicenseRequestMsg : UInt32, ppDeviceCert : Void**, pDeviceSerialNumber : Win32cr::Media::WindowsMediaFormat::DRM_VAL16*, pbstrAction : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_license_request_msg.call(this, pbLicenseRequestMsg, cbLicenseRequestMsg, ppDeviceCert, pDeviceSerialNumber, pbstrAction)
    end

  end

  @[Extern]
  record IWMDRMTranscryptorVtbl,
    query_interface : Proc(IWMDRMTranscryptor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMTranscryptor*, UInt32),
    release : Proc(IWMDRMTranscryptor*, UInt32),
    initialize__ : Proc(IWMDRMTranscryptor*, Win32cr::Foundation::BSTR, UInt8*, UInt32, Void**, Void*, Void*, Win32cr::Foundation::HRESULT),
    seek : Proc(IWMDRMTranscryptor*, UInt64, Win32cr::Foundation::HRESULT),
    read : Proc(IWMDRMTranscryptor*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMDRMTranscryptor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMTranscryptor, lpVtbl : IWMDRMTranscryptorVtbl* do
    GUID = LibC::GUID.new(0x69059850_u32, 0x6e6f_u16, 0x4bb2_u16, StaticArray[0x80_u8, 0x6f_u8, 0x71_u8, 0x86_u8, 0x3d_u8, 0xdf_u8, 0xc4_u8, 0x71_u8])
    def query_interface(this : IWMDRMTranscryptor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMTranscryptor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMTranscryptor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWMDRMTranscryptor*, bstrFileName : Win32cr::Foundation::BSTR, pbLicenseRequestMsg : UInt8*, cbLicenseRequestMsg : UInt32, ppLicenseResponseMsg : Void**, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, bstrFileName, pbLicenseRequestMsg, cbLicenseRequestMsg, ppLicenseResponseMsg, pCallback, pvContext)
    end
    def seek(this : IWMDRMTranscryptor*, hnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, hnsTime)
    end
    def read(this : IWMDRMTranscryptor*, pbData : UInt8*, pcbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pbData, pcbData)
    end
    def close(this : IWMDRMTranscryptor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end

  end

  @[Extern]
  record IWMDRMTranscryptor2Vtbl,
    query_interface : Proc(IWMDRMTranscryptor2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMTranscryptor2*, UInt32),
    release : Proc(IWMDRMTranscryptor2*, UInt32),
    initialize__ : Proc(IWMDRMTranscryptor2*, Win32cr::Foundation::BSTR, UInt8*, UInt32, Void**, Void*, Void*, Win32cr::Foundation::HRESULT),
    seek : Proc(IWMDRMTranscryptor2*, UInt64, Win32cr::Foundation::HRESULT),
    read : Proc(IWMDRMTranscryptor2*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    close : Proc(IWMDRMTranscryptor2*, Win32cr::Foundation::HRESULT),
    seek_ex : Proc(IWMDRMTranscryptor2*, UInt64, UInt64, Float32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    zero_adjust_timestamps : Proc(IWMDRMTranscryptor2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_seek_start_time : Proc(IWMDRMTranscryptor2*, UInt64*, Win32cr::Foundation::HRESULT),
    get_duration : Proc(IWMDRMTranscryptor2*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMTranscryptor2, lpVtbl : IWMDRMTranscryptor2Vtbl* do
    GUID = LibC::GUID.new(0xe0da439f_u32, 0xd331_u16, 0x496a_u16, StaticArray[0xbe_u8, 0xce_u8, 0x18_u8, 0xe5_u8, 0xba_u8, 0xc5_u8, 0xdd_u8, 0x23_u8])
    def query_interface(this : IWMDRMTranscryptor2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMTranscryptor2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMTranscryptor2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWMDRMTranscryptor2*, bstrFileName : Win32cr::Foundation::BSTR, pbLicenseRequestMsg : UInt8*, cbLicenseRequestMsg : UInt32, ppLicenseResponseMsg : Void**, pCallback : Void*, pvContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, bstrFileName, pbLicenseRequestMsg, cbLicenseRequestMsg, ppLicenseResponseMsg, pCallback, pvContext)
    end
    def seek(this : IWMDRMTranscryptor2*, hnsTime : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek.call(this, hnsTime)
    end
    def read(this : IWMDRMTranscryptor2*, pbData : UInt8*, pcbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, pbData, pcbData)
    end
    def close(this : IWMDRMTranscryptor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def seek_ex(this : IWMDRMTranscryptor2*, cnsStartTime : UInt64, cnsDuration : UInt64, flRate : Float32, fIncludeFileHeader : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.seek_ex.call(this, cnsStartTime, cnsDuration, flRate, fIncludeFileHeader)
    end
    def zero_adjust_timestamps(this : IWMDRMTranscryptor2*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zero_adjust_timestamps.call(this, fEnable)
    end
    def get_seek_start_time(this : IWMDRMTranscryptor2*, pcnsTime : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_seek_start_time.call(this, pcnsTime)
    end
    def get_duration(this : IWMDRMTranscryptor2*, pcnsDuration : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_duration.call(this, pcnsDuration)
    end

  end

  @[Extern]
  record IWMDRMTranscryptionManagerVtbl,
    query_interface : Proc(IWMDRMTranscryptionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMDRMTranscryptionManager*, UInt32),
    release : Proc(IWMDRMTranscryptionManager*, UInt32),
    create_transcryptor : Proc(IWMDRMTranscryptionManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMDRMTranscryptionManager, lpVtbl : IWMDRMTranscryptionManagerVtbl* do
    GUID = LibC::GUID.new(0xb1a887b2_u32, 0xa4f0_u16, 0x407a_u16, StaticArray[0xb0_u8, 0x2e_u8, 0xef_u8, 0xbd_u8, 0x23_u8, 0xbb_u8, 0xec_u8, 0xdf_u8])
    def query_interface(this : IWMDRMTranscryptionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMDRMTranscryptionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMDRMTranscryptionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_transcryptor(this : IWMDRMTranscryptionManager*, ppTranscryptor : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transcryptor.call(this, ppTranscryptor)
    end

  end

  @[Extern]
  record IWMWatermarkInfoVtbl,
    query_interface : Proc(IWMWatermarkInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMWatermarkInfo*, UInt32),
    release : Proc(IWMWatermarkInfo*, UInt32),
    get_watermark_entry_count : Proc(IWMWatermarkInfo*, Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY_TYPE, UInt32*, Win32cr::Foundation::HRESULT),
    get_watermark_entry : Proc(IWMWatermarkInfo*, Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY_TYPE, UInt32, Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMWatermarkInfo, lpVtbl : IWMWatermarkInfoVtbl* do
    GUID = LibC::GUID.new(0x6f497062_u32, 0xf2e2_u16, 0x4624_u16, StaticArray[0x8e_u8, 0xa7_u8, 0x9d_u8, 0xd4_u8, 0xd_u8, 0x81_u8, 0xfc_u8, 0x8d_u8])
    def query_interface(this : IWMWatermarkInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMWatermarkInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMWatermarkInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_watermark_entry_count(this : IWMWatermarkInfo*, wmetType : Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY_TYPE, pdwCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_watermark_entry_count.call(this, wmetType, pdwCount)
    end
    def get_watermark_entry(this : IWMWatermarkInfo*, wmetType : Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY_TYPE, dwEntryNum : UInt32, pEntry : Win32cr::Media::WindowsMediaFormat::WMT_WATERMARK_ENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_watermark_entry.call(this, wmetType, dwEntryNum, pEntry)
    end

  end

  @[Extern]
  record IWMReaderAcceleratorVtbl,
    query_interface : Proc(IWMReaderAccelerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderAccelerator*, UInt32),
    release : Proc(IWMReaderAccelerator*, UInt32),
    get_codec_interface : Proc(IWMReaderAccelerator*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    notify : Proc(IWMReaderAccelerator*, UInt32, Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderAccelerator, lpVtbl : IWMReaderAcceleratorVtbl* do
    GUID = LibC::GUID.new(0xbddc4d08_u32, 0x944d_u16, 0x4d52_u16, StaticArray[0xa6_u8, 0x12_u8, 0x46_u8, 0xc3_u8, 0xfd_u8, 0xa0_u8, 0x7d_u8, 0xd4_u8])
    def query_interface(this : IWMReaderAccelerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderAccelerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderAccelerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_codec_interface(this : IWMReaderAccelerator*, dwOutputNum : UInt32, riid : LibC::GUID*, ppvCodecInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_codec_interface.call(this, dwOutputNum, riid, ppvCodecInterface)
    end
    def notify(this : IWMReaderAccelerator*, dwOutputNum : UInt32, pSubtype : Win32cr::Media::WindowsMediaFormat::WM_MEDIA_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify.call(this, dwOutputNum, pSubtype)
    end

  end

  @[Extern]
  record IWMReaderTimecodeVtbl,
    query_interface : Proc(IWMReaderTimecode*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMReaderTimecode*, UInt32),
    release : Proc(IWMReaderTimecode*, UInt32),
    get_timecode_range_count : Proc(IWMReaderTimecode*, UInt16, UInt16*, Win32cr::Foundation::HRESULT),
    get_timecode_range_bounds : Proc(IWMReaderTimecode*, UInt16, UInt16, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMReaderTimecode, lpVtbl : IWMReaderTimecodeVtbl* do
    GUID = LibC::GUID.new(0xf369e2f0_u32, 0xe081_u16, 0x4fe6_u16, StaticArray[0x84_u8, 0x50_u8, 0xb8_u8, 0x10_u8, 0xb2_u8, 0xf4_u8, 0x10_u8, 0xd1_u8])
    def query_interface(this : IWMReaderTimecode*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMReaderTimecode*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMReaderTimecode*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_timecode_range_count(this : IWMReaderTimecode*, wStreamNum : UInt16, pwRangeCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timecode_range_count.call(this, wStreamNum, pwRangeCount)
    end
    def get_timecode_range_bounds(this : IWMReaderTimecode*, wStreamNum : UInt16, wRangeNum : UInt16, pStartTimecode : UInt32*, pEndTimecode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_timecode_range_bounds.call(this, wStreamNum, wRangeNum, pStartTimecode, pEndTimecode)
    end

  end

  @[Extern]
  record IWMAddressAccessVtbl,
    query_interface : Proc(IWMAddressAccess*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMAddressAccess*, UInt32),
    release : Proc(IWMAddressAccess*, UInt32),
    get_access_entry_count : Proc(IWMAddressAccess*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32*, Win32cr::Foundation::HRESULT),
    get_access_entry : Proc(IWMAddressAccess*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32, Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*, Win32cr::Foundation::HRESULT),
    add_access_entry : Proc(IWMAddressAccess*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*, Win32cr::Foundation::HRESULT),
    remove_access_entry : Proc(IWMAddressAccess*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMAddressAccess, lpVtbl : IWMAddressAccessVtbl* do
    GUID = LibC::GUID.new(0xbb3c6389_u32, 0x1633_u16, 0x4e92_u16, StaticArray[0xaf_u8, 0x14_u8, 0x9f_u8, 0x31_u8, 0x73_u8, 0xba_u8, 0x39_u8, 0xd0_u8])
    def query_interface(this : IWMAddressAccess*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMAddressAccess*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMAddressAccess*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_access_entry_count(this : IWMAddressAccess*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, pcEntries : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_access_entry_count.call(this, aeType, pcEntries)
    end
    def get_access_entry(this : IWMAddressAccess*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, dwEntryNum : UInt32, pAddrAccessEntry : Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_access_entry.call(this, aeType, dwEntryNum, pAddrAccessEntry)
    end
    def add_access_entry(this : IWMAddressAccess*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, pAddrAccessEntry : Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_access_entry.call(this, aeType, pAddrAccessEntry)
    end
    def remove_access_entry(this : IWMAddressAccess*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, dwEntryNum : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_access_entry.call(this, aeType, dwEntryNum)
    end

  end

  @[Extern]
  record IWMAddressAccess2Vtbl,
    query_interface : Proc(IWMAddressAccess2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMAddressAccess2*, UInt32),
    release : Proc(IWMAddressAccess2*, UInt32),
    get_access_entry_count : Proc(IWMAddressAccess2*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32*, Win32cr::Foundation::HRESULT),
    get_access_entry : Proc(IWMAddressAccess2*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32, Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*, Win32cr::Foundation::HRESULT),
    add_access_entry : Proc(IWMAddressAccess2*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*, Win32cr::Foundation::HRESULT),
    remove_access_entry : Proc(IWMAddressAccess2*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32, Win32cr::Foundation::HRESULT),
    get_access_entry_ex : Proc(IWMAddressAccess2*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_access_entry_ex : Proc(IWMAddressAccess2*, Win32cr::Media::WindowsMediaFormat::WM_AETYPE, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMAddressAccess2, lpVtbl : IWMAddressAccess2Vtbl* do
    GUID = LibC::GUID.new(0x65a83fc2_u32, 0x3e98_u16, 0x4d4d_u16, StaticArray[0x81_u8, 0xb5_u8, 0x2a_u8, 0x74_u8, 0x28_u8, 0x86_u8, 0xb3_u8, 0x3d_u8])
    def query_interface(this : IWMAddressAccess2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMAddressAccess2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMAddressAccess2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_access_entry_count(this : IWMAddressAccess2*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, pcEntries : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_access_entry_count.call(this, aeType, pcEntries)
    end
    def get_access_entry(this : IWMAddressAccess2*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, dwEntryNum : UInt32, pAddrAccessEntry : Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_access_entry.call(this, aeType, dwEntryNum, pAddrAccessEntry)
    end
    def add_access_entry(this : IWMAddressAccess2*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, pAddrAccessEntry : Win32cr::Media::WindowsMediaFormat::WM_ADDRESS_ACCESSENTRY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_access_entry.call(this, aeType, pAddrAccessEntry)
    end
    def remove_access_entry(this : IWMAddressAccess2*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, dwEntryNum : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_access_entry.call(this, aeType, dwEntryNum)
    end
    def get_access_entry_ex(this : IWMAddressAccess2*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, dwEntryNum : UInt32, pbstrAddress : Win32cr::Foundation::BSTR*, pbstrMask : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_access_entry_ex.call(this, aeType, dwEntryNum, pbstrAddress, pbstrMask)
    end
    def add_access_entry_ex(this : IWMAddressAccess2*, aeType : Win32cr::Media::WindowsMediaFormat::WM_AETYPE, bstrAddress : Win32cr::Foundation::BSTR, bstrMask : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_access_entry_ex.call(this, aeType, bstrAddress, bstrMask)
    end

  end

  @[Extern]
  record IWMImageInfoVtbl,
    query_interface : Proc(IWMImageInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMImageInfo*, UInt32),
    release : Proc(IWMImageInfo*, UInt32),
    get_image_count : Proc(IWMImageInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_image : Proc(IWMImageInfo*, UInt32, UInt16*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32*, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMImageInfo, lpVtbl : IWMImageInfoVtbl* do
    GUID = LibC::GUID.new(0x9f0aa3b6_u32, 0x7267_u16, 0x4d89_u16, StaticArray[0x88_u8, 0xf2_u8, 0xba_u8, 0x91_u8, 0x5a_u8, 0xa5_u8, 0xc4_u8, 0xc6_u8])
    def query_interface(this : IWMImageInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMImageInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMImageInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_image_count(this : IWMImageInfo*, pcImages : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image_count.call(this, pcImages)
    end
    def get_image(this : IWMImageInfo*, wIndex : UInt32, pcchMIMEType : UInt16*, pwszMIMEType : UInt16*, pcchDescription : UInt16*, pwszDescription : UInt16*, pImageType : UInt16*, pcbImageData : UInt32*, pbImageData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_image.call(this, wIndex, pcchMIMEType, pwszMIMEType, pcchDescription, pwszDescription, pImageType, pcbImageData, pbImageData)
    end

  end

  @[Extern]
  record IWMLicenseRevocationAgentVtbl,
    query_interface : Proc(IWMLicenseRevocationAgent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMLicenseRevocationAgent*, UInt32),
    release : Proc(IWMLicenseRevocationAgent*, UInt32),
    get_lrb_challenge : Proc(IWMLicenseRevocationAgent*, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    process_lrb : Proc(IWMLicenseRevocationAgent*, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMLicenseRevocationAgent, lpVtbl : IWMLicenseRevocationAgentVtbl* do
    GUID = LibC::GUID.new(0x6967f2c9_u32, 0x4e26_u16, 0x4b57_u16, StaticArray[0x88_u8, 0x94_u8, 0x79_u8, 0x98_u8, 0x80_u8, 0xf7_u8, 0xac_u8, 0x7b_u8])
    def query_interface(this : IWMLicenseRevocationAgent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMLicenseRevocationAgent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMLicenseRevocationAgent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_lrb_challenge(this : IWMLicenseRevocationAgent*, pMachineID : UInt8*, dwMachineIDLength : UInt32, pChallenge : UInt8*, dwChallengeLength : UInt32, pChallengeOutput : UInt8*, pdwChallengeOutputLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lrb_challenge.call(this, pMachineID, dwMachineIDLength, pChallenge, dwChallengeLength, pChallengeOutput, pdwChallengeOutputLength)
    end
    def process_lrb(this : IWMLicenseRevocationAgent*, pSignedLRB : UInt8*, dwSignedLRBLength : UInt32, pSignedACK : UInt8*, pdwSignedACKLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_lrb.call(this, pSignedLRB, dwSignedLRBLength, pSignedACK, pdwSignedACKLength)
    end

  end

  @[Extern]
  record IWMAuthorizerVtbl,
    query_interface : Proc(IWMAuthorizer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMAuthorizer*, UInt32),
    release : Proc(IWMAuthorizer*, UInt32),
    get_cert_count : Proc(IWMAuthorizer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cert : Proc(IWMAuthorizer*, UInt32, UInt8**, Win32cr::Foundation::HRESULT),
    get_shared_data : Proc(IWMAuthorizer*, UInt32, UInt8*, UInt8*, UInt8**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMAuthorizer, lpVtbl : IWMAuthorizerVtbl* do
    GUID = LibC::GUID.new(0xd9b67d36_u32, 0xa9ad_u16, 0x4eb4_u16, StaticArray[0xba_u8, 0xef_u8, 0xdb_u8, 0x28_u8, 0x4e_u8, 0xf5_u8, 0x50_u8, 0x4c_u8])
    def query_interface(this : IWMAuthorizer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMAuthorizer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMAuthorizer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_cert_count(this : IWMAuthorizer*, pcCerts : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cert_count.call(this, pcCerts)
    end
    def get_cert(this : IWMAuthorizer*, dwIndex : UInt32, ppbCertData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cert.call(this, dwIndex, ppbCertData)
    end
    def get_shared_data(this : IWMAuthorizer*, dwCertIndex : UInt32, pbSharedData : UInt8*, pbCert : UInt8*, ppbSharedData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_data.call(this, dwCertIndex, pbSharedData, pbCert, ppbSharedData)
    end

  end

  @[Extern]
  record IWMSecureChannelVtbl,
    query_interface : Proc(IWMSecureChannel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSecureChannel*, UInt32),
    release : Proc(IWMSecureChannel*, UInt32),
    get_cert_count : Proc(IWMSecureChannel*, UInt32*, Win32cr::Foundation::HRESULT),
    get_cert : Proc(IWMSecureChannel*, UInt32, UInt8**, Win32cr::Foundation::HRESULT),
    get_shared_data : Proc(IWMSecureChannel*, UInt32, UInt8*, UInt8*, UInt8**, Win32cr::Foundation::HRESULT),
    wmsc_add_certificate : Proc(IWMSecureChannel*, Void*, Win32cr::Foundation::HRESULT),
    wmsc_add_signature : Proc(IWMSecureChannel*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    wmsc_connect : Proc(IWMSecureChannel*, Void*, Win32cr::Foundation::HRESULT),
    wmsc_is_connected : Proc(IWMSecureChannel*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    wmsc_disconnect : Proc(IWMSecureChannel*, Win32cr::Foundation::HRESULT),
    wmsc_get_valid_certificate : Proc(IWMSecureChannel*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    wmsc_encrypt : Proc(IWMSecureChannel*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    wmsc_decrypt : Proc(IWMSecureChannel*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    wmsc_lock : Proc(IWMSecureChannel*, Win32cr::Foundation::HRESULT),
    wmsc_unlock : Proc(IWMSecureChannel*, Win32cr::Foundation::HRESULT),
    wmsc_set_shared_data : Proc(IWMSecureChannel*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSecureChannel, lpVtbl : IWMSecureChannelVtbl* do
    GUID = LibC::GUID.new(0x2720598a_u32, 0xd0f2_u16, 0x4189_u16, StaticArray[0xbd_u8, 0x10_u8, 0x91_u8, 0xc4_u8, 0x6e_u8, 0xf0_u8, 0x93_u8, 0x6f_u8])
    def query_interface(this : IWMSecureChannel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSecureChannel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSecureChannel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_cert_count(this : IWMSecureChannel*, pcCerts : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cert_count.call(this, pcCerts)
    end
    def get_cert(this : IWMSecureChannel*, dwIndex : UInt32, ppbCertData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cert.call(this, dwIndex, ppbCertData)
    end
    def get_shared_data(this : IWMSecureChannel*, dwCertIndex : UInt32, pbSharedData : UInt8*, pbCert : UInt8*, ppbSharedData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_shared_data.call(this, dwCertIndex, pbSharedData, pbCert, ppbSharedData)
    end
    def wmsc_add_certificate(this : IWMSecureChannel*, pCert : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_add_certificate.call(this, pCert)
    end
    def wmsc_add_signature(this : IWMSecureChannel*, pbCertSig : UInt8*, cbCertSig : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_add_signature.call(this, pbCertSig, cbCertSig)
    end
    def wmsc_connect(this : IWMSecureChannel*, pOtherSide : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_connect.call(this, pOtherSide)
    end
    def wmsc_is_connected(this : IWMSecureChannel*, pfIsConnected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_is_connected.call(this, pfIsConnected)
    end
    def wmsc_disconnect(this : IWMSecureChannel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_disconnect.call(this)
    end
    def wmsc_get_valid_certificate(this : IWMSecureChannel*, ppbCertificate : UInt8**, pdwSignature : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_get_valid_certificate.call(this, ppbCertificate, pdwSignature)
    end
    def wmsc_encrypt(this : IWMSecureChannel*, pbData : UInt8*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_encrypt.call(this, pbData, cbData)
    end
    def wmsc_decrypt(this : IWMSecureChannel*, pbData : UInt8*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_decrypt.call(this, pbData, cbData)
    end
    def wmsc_lock(this : IWMSecureChannel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_lock.call(this)
    end
    def wmsc_unlock(this : IWMSecureChannel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_unlock.call(this)
    end
    def wmsc_set_shared_data(this : IWMSecureChannel*, dwCertIndex : UInt32, pbSharedData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wmsc_set_shared_data.call(this, dwCertIndex, pbSharedData)
    end

  end

  @[Extern]
  record IWMGetSecureChannelVtbl,
    query_interface : Proc(IWMGetSecureChannel*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMGetSecureChannel*, UInt32),
    release : Proc(IWMGetSecureChannel*, UInt32),
    get_peer_secure_channel_interface : Proc(IWMGetSecureChannel*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMGetSecureChannel, lpVtbl : IWMGetSecureChannelVtbl* do
    GUID = LibC::GUID.new(0x94bc0598_u32, 0xc3d2_u16, 0x11d3_u16, StaticArray[0xbe_u8, 0xdf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x61_u8, 0x29_u8, 0x86_u8])
    def query_interface(this : IWMGetSecureChannel*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMGetSecureChannel*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMGetSecureChannel*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_peer_secure_channel_interface(this : IWMGetSecureChannel*, ppPeer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_peer_secure_channel_interface.call(this, ppPeer)
    end

  end

  @[Extern]
  record INSNetSourceCreatorVtbl,
    query_interface : Proc(INSNetSourceCreator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INSNetSourceCreator*, UInt32),
    release : Proc(INSNetSourceCreator*, UInt32),
    initialize__ : Proc(INSNetSourceCreator*, Win32cr::Foundation::HRESULT),
    create_net_source : Proc(INSNetSourceCreator*, Win32cr::Foundation::PWSTR, Void*, UInt8*, Void*, Void*, UInt64, Win32cr::Foundation::HRESULT),
    get_net_source_properties : Proc(INSNetSourceCreator*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_net_source_shared_namespace : Proc(INSNetSourceCreator*, Void**, Win32cr::Foundation::HRESULT),
    get_net_source_admin_interface : Proc(INSNetSourceCreator*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_num_protocols_supported : Proc(INSNetSourceCreator*, UInt32*, Win32cr::Foundation::HRESULT),
    get_protocol_name : Proc(INSNetSourceCreator*, UInt32, Win32cr::Foundation::PWSTR, UInt16*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(INSNetSourceCreator*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record INSNetSourceCreator, lpVtbl : INSNetSourceCreatorVtbl* do
    GUID = LibC::GUID.new(0xc0e4080_u32, 0x9081_u16, 0x11d2_u16, StaticArray[0xbe_u8, 0xec_u8, 0x0_u8, 0x60_u8, 0x8_u8, 0x2f_u8, 0x20_u8, 0x54_u8])
    def query_interface(this : INSNetSourceCreator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INSNetSourceCreator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INSNetSourceCreator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : INSNetSourceCreator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this)
    end
    def create_net_source(this : INSNetSourceCreator*, pszStreamName : Win32cr::Foundation::PWSTR, pMonitor : Void*, pData : UInt8*, pUserContext : Void*, pCallback : Void*, qwContext : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_net_source.call(this, pszStreamName, pMonitor, pData, pUserContext, pCallback, qwContext)
    end
    def get_net_source_properties(this : INSNetSourceCreator*, pszStreamName : Win32cr::Foundation::PWSTR, ppPropertiesNode : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_net_source_properties.call(this, pszStreamName, ppPropertiesNode)
    end
    def get_net_source_shared_namespace(this : INSNetSourceCreator*, ppSharedNamespace : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_net_source_shared_namespace.call(this, ppSharedNamespace)
    end
    def get_net_source_admin_interface(this : INSNetSourceCreator*, pszStreamName : Win32cr::Foundation::PWSTR, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_net_source_admin_interface.call(this, pszStreamName, pVal)
    end
    def get_num_protocols_supported(this : INSNetSourceCreator*, pcProtocols : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_num_protocols_supported.call(this, pcProtocols)
    end
    def get_protocol_name(this : INSNetSourceCreator*, dwProtocolNum : UInt32, pwszProtocolName : Win32cr::Foundation::PWSTR, pcchProtocolName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_protocol_name.call(this, dwProtocolNum, pwszProtocolName, pcchProtocolName)
    end
    def shutdown(this : INSNetSourceCreator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end

  end

  @[Extern]
  record IWMPlayerTimestampHookVtbl,
    query_interface : Proc(IWMPlayerTimestampHook*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMPlayerTimestampHook*, UInt32),
    release : Proc(IWMPlayerTimestampHook*, UInt32),
    map_timestamp : Proc(IWMPlayerTimestampHook*, Int64, Int64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMPlayerTimestampHook, lpVtbl : IWMPlayerTimestampHookVtbl* do
    GUID = LibC::GUID.new(0x28580dda_u32, 0xd98e_u16, 0x48d0_u16, StaticArray[0xb7_u8, 0xae_u8, 0x69_u8, 0xe4_u8, 0x73_u8, 0xa0_u8, 0x28_u8, 0x25_u8])
    def query_interface(this : IWMPlayerTimestampHook*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMPlayerTimestampHook*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMPlayerTimestampHook*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def map_timestamp(this : IWMPlayerTimestampHook*, rtIn : Int64, prtOut : Int64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_timestamp.call(this, rtIn, prtOut)
    end

  end

  @[Extern]
  record IWMSInternalAdminNetSourceVtbl,
    query_interface : Proc(IWMSInternalAdminNetSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSInternalAdminNetSource*, UInt32),
    release : Proc(IWMSInternalAdminNetSource*, UInt32),
    initialize__ : Proc(IWMSInternalAdminNetSource*, Void*, Void*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_net_source_creator : Proc(IWMSInternalAdminNetSource*, Void**, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IWMSInternalAdminNetSource*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_credentials : Proc(IWMSInternalAdminNetSource*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    delete_credentials : Proc(IWMSInternalAdminNetSource*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_credential_flags : Proc(IWMSInternalAdminNetSource*, UInt32*, Win32cr::Foundation::HRESULT),
    set_credential_flags : Proc(IWMSInternalAdminNetSource*, UInt32, Win32cr::Foundation::HRESULT),
    find_proxy_for_url : Proc(IWMSInternalAdminNetSource*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    register_proxy_failure : Proc(IWMSInternalAdminNetSource*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::HRESULT),
    shutdown_proxy_context : Proc(IWMSInternalAdminNetSource*, UInt32, Win32cr::Foundation::HRESULT),
    is_using_ie : Proc(IWMSInternalAdminNetSource*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSInternalAdminNetSource, lpVtbl : IWMSInternalAdminNetSourceVtbl* do
    GUID = LibC::GUID.new(0x8bb23e5f_u32, 0xd127_u16, 0x4afb_u16, StaticArray[0x8d_u8, 0x2_u8, 0xae_u8, 0x5b_u8, 0x66_u8, 0xd5_u8, 0x4c_u8, 0x78_u8])
    def query_interface(this : IWMSInternalAdminNetSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSInternalAdminNetSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSInternalAdminNetSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IWMSInternalAdminNetSource*, pSharedNamespace : Void*, pNamespaceNode : Void*, pNetSourceCreator : Void*, fEmbeddedInServer : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pSharedNamespace, pNamespaceNode, pNetSourceCreator, fEmbeddedInServer)
    end
    def get_net_source_creator(this : IWMSInternalAdminNetSource*, ppNetSourceCreator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_net_source_creator.call(this, ppNetSourceCreator)
    end
    def set_credentials(this : IWMSInternalAdminNetSource*, bstrRealm : Win32cr::Foundation::BSTR, bstrName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, fPersist : Win32cr::Foundation::BOOL, fConfirmedGood : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, bstrRealm, bstrName, bstrPassword, fPersist, fConfirmedGood)
    end
    def get_credentials(this : IWMSInternalAdminNetSource*, bstrRealm : Win32cr::Foundation::BSTR, pbstrName : Win32cr::Foundation::BSTR*, pbstrPassword : Win32cr::Foundation::BSTR*, pfConfirmedGood : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_credentials.call(this, bstrRealm, pbstrName, pbstrPassword, pfConfirmedGood)
    end
    def delete_credentials(this : IWMSInternalAdminNetSource*, bstrRealm : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_credentials.call(this, bstrRealm)
    end
    def get_credential_flags(this : IWMSInternalAdminNetSource*, lpdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_credential_flags.call(this, lpdwFlags)
    end
    def set_credential_flags(this : IWMSInternalAdminNetSource*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credential_flags.call(this, dwFlags)
    end
    def find_proxy_for_url(this : IWMSInternalAdminNetSource*, bstrProtocol : Win32cr::Foundation::BSTR, bstrHost : Win32cr::Foundation::BSTR, pfProxyEnabled : Win32cr::Foundation::BOOL*, pbstrProxyServer : Win32cr::Foundation::BSTR*, pdwProxyPort : UInt32*, pdwProxyContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_proxy_for_url.call(this, bstrProtocol, bstrHost, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pdwProxyContext)
    end
    def register_proxy_failure(this : IWMSInternalAdminNetSource*, hrParam : Win32cr::Foundation::HRESULT, dwProxyContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_proxy_failure.call(this, hrParam, dwProxyContext)
    end
    def shutdown_proxy_context(this : IWMSInternalAdminNetSource*, dwProxyContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_proxy_context.call(this, dwProxyContext)
    end
    def is_using_ie(this : IWMSInternalAdminNetSource*, dwProxyContext : UInt32, pfIsUsingIE : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_using_ie.call(this, dwProxyContext, pfIsUsingIE)
    end

  end

  @[Extern]
  record IWMSInternalAdminNetSource2Vtbl,
    query_interface : Proc(IWMSInternalAdminNetSource2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSInternalAdminNetSource2*, UInt32),
    release : Proc(IWMSInternalAdminNetSource2*, UInt32),
    set_credentials_ex : Proc(IWMSInternalAdminNetSource2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_credentials_ex : Proc(IWMSInternalAdminNetSource2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Media::WindowsMediaFormat::NETSOURCE_URLCREDPOLICY_SETTINGS*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    delete_credentials_ex : Proc(IWMSInternalAdminNetSource2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    find_proxy_for_url_ex : Proc(IWMSInternalAdminNetSource2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSInternalAdminNetSource2, lpVtbl : IWMSInternalAdminNetSource2Vtbl* do
    GUID = LibC::GUID.new(0xe74d58c3_u32, 0xcf77_u16, 0x4b51_u16, StaticArray[0xaf_u8, 0x17_u8, 0x74_u8, 0x46_u8, 0x87_u8, 0xc4_u8, 0x3e_u8, 0xae_u8])
    def query_interface(this : IWMSInternalAdminNetSource2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSInternalAdminNetSource2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSInternalAdminNetSource2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_credentials_ex(this : IWMSInternalAdminNetSource2*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL, bstrName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, fPersist : Win32cr::Foundation::BOOL, fConfirmedGood : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials_ex.call(this, bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood)
    end
    def get_credentials_ex(this : IWMSInternalAdminNetSource2*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL, pdwUrlPolicy : Win32cr::Media::WindowsMediaFormat::NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrName : Win32cr::Foundation::BSTR*, pbstrPassword : Win32cr::Foundation::BSTR*, pfConfirmedGood : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_credentials_ex.call(this, bstrRealm, bstrUrl, fProxy, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood)
    end
    def delete_credentials_ex(this : IWMSInternalAdminNetSource2*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_credentials_ex.call(this, bstrRealm, bstrUrl, fProxy)
    end
    def find_proxy_for_url_ex(this : IWMSInternalAdminNetSource2*, bstrProtocol : Win32cr::Foundation::BSTR, bstrHost : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, pfProxyEnabled : Win32cr::Foundation::BOOL*, pbstrProxyServer : Win32cr::Foundation::BSTR*, pdwProxyPort : UInt32*, pdwProxyContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_proxy_for_url_ex.call(this, bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pdwProxyContext)
    end

  end

  @[Extern]
  record IWMSInternalAdminNetSource3Vtbl,
    query_interface : Proc(IWMSInternalAdminNetSource3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWMSInternalAdminNetSource3*, UInt32),
    release : Proc(IWMSInternalAdminNetSource3*, UInt32),
    set_credentials_ex : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_credentials_ex : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Media::WindowsMediaFormat::NETSOURCE_URLCREDPOLICY_SETTINGS*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    delete_credentials_ex : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    find_proxy_for_url_ex : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_net_source_creator2 : Proc(IWMSInternalAdminNetSource3*, Void**, Win32cr::Foundation::HRESULT),
    find_proxy_for_url_ex2 : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::BSTR*, UInt32*, UInt64*, Win32cr::Foundation::HRESULT),
    register_proxy_failure2 : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::HRESULT, UInt64, Win32cr::Foundation::HRESULT),
    shutdown_proxy_context2 : Proc(IWMSInternalAdminNetSource3*, UInt64, Win32cr::Foundation::HRESULT),
    is_using_ie2 : Proc(IWMSInternalAdminNetSource3*, UInt64, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_credentials_ex2 : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_credentials_ex2 : Proc(IWMSInternalAdminNetSource3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Win32cr::Media::WindowsMediaFormat::NETSOURCE_URLCREDPOLICY_SETTINGS*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWMSInternalAdminNetSource3, lpVtbl : IWMSInternalAdminNetSource3Vtbl* do
    GUID = LibC::GUID.new(0x6b63d08e_u32, 0x4590_u16, 0x44af_u16, StaticArray[0x9e_u8, 0xb3_u8, 0x57_u8, 0xff_u8, 0x1e_u8, 0x73_u8, 0xbf_u8, 0x80_u8])
    def query_interface(this : IWMSInternalAdminNetSource3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWMSInternalAdminNetSource3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWMSInternalAdminNetSource3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_credentials_ex(this : IWMSInternalAdminNetSource3*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL, bstrName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, fPersist : Win32cr::Foundation::BOOL, fConfirmedGood : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials_ex.call(this, bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood)
    end
    def get_credentials_ex(this : IWMSInternalAdminNetSource3*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL, pdwUrlPolicy : Win32cr::Media::WindowsMediaFormat::NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrName : Win32cr::Foundation::BSTR*, pbstrPassword : Win32cr::Foundation::BSTR*, pfConfirmedGood : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_credentials_ex.call(this, bstrRealm, bstrUrl, fProxy, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood)
    end
    def delete_credentials_ex(this : IWMSInternalAdminNetSource3*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_credentials_ex.call(this, bstrRealm, bstrUrl, fProxy)
    end
    def find_proxy_for_url_ex(this : IWMSInternalAdminNetSource3*, bstrProtocol : Win32cr::Foundation::BSTR, bstrHost : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, pfProxyEnabled : Win32cr::Foundation::BOOL*, pbstrProxyServer : Win32cr::Foundation::BSTR*, pdwProxyPort : UInt32*, pdwProxyContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_proxy_for_url_ex.call(this, bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pdwProxyContext)
    end
    def get_net_source_creator2(this : IWMSInternalAdminNetSource3*, ppNetSourceCreator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_net_source_creator2.call(this, ppNetSourceCreator)
    end
    def find_proxy_for_url_ex2(this : IWMSInternalAdminNetSource3*, bstrProtocol : Win32cr::Foundation::BSTR, bstrHost : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, pfProxyEnabled : Win32cr::Foundation::BOOL*, pbstrProxyServer : Win32cr::Foundation::BSTR*, pdwProxyPort : UInt32*, pqwProxyContext : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_proxy_for_url_ex2.call(this, bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pqwProxyContext)
    end
    def register_proxy_failure2(this : IWMSInternalAdminNetSource3*, hrParam : Win32cr::Foundation::HRESULT, qwProxyContext : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_proxy_failure2.call(this, hrParam, qwProxyContext)
    end
    def shutdown_proxy_context2(this : IWMSInternalAdminNetSource3*, qwProxyContext : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_proxy_context2.call(this, qwProxyContext)
    end
    def is_using_ie2(this : IWMSInternalAdminNetSource3*, qwProxyContext : UInt64, pfIsUsingIE : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_using_ie2.call(this, qwProxyContext, pfIsUsingIE)
    end
    def set_credentials_ex2(this : IWMSInternalAdminNetSource3*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL, bstrName : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, fPersist : Win32cr::Foundation::BOOL, fConfirmedGood : Win32cr::Foundation::BOOL, fClearTextAuthentication : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials_ex2.call(this, bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood, fClearTextAuthentication)
    end
    def get_credentials_ex2(this : IWMSInternalAdminNetSource3*, bstrRealm : Win32cr::Foundation::BSTR, bstrUrl : Win32cr::Foundation::BSTR, fProxy : Win32cr::Foundation::BOOL, fClearTextAuthentication : Win32cr::Foundation::BOOL, pdwUrlPolicy : Win32cr::Media::WindowsMediaFormat::NETSOURCE_URLCREDPOLICY_SETTINGS*, pbstrName : Win32cr::Foundation::BSTR*, pbstrPassword : Win32cr::Foundation::BSTR*, pfConfirmedGood : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_credentials_ex2.call(this, bstrRealm, bstrUrl, fProxy, fClearTextAuthentication, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood)
    end

  end

  def wMIsContentProtected(pwszFileName : Win32cr::Foundation::PWSTR, pfIsProtected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.WMIsContentProtected(pwszFileName, pfIsProtected)
  end

  def wMCreateWriter(pUnkCert : Void*, ppWriter : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateWriter(pUnkCert, ppWriter)
  end

  def wMCreateReader(pUnkCert : Void*, dwRights : UInt32, ppReader : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateReader(pUnkCert, dwRights, ppReader)
  end

  def wMCreateSyncReader(pUnkCert : Void*, dwRights : UInt32, ppSyncReader : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateSyncReader(pUnkCert, dwRights, ppSyncReader)
  end

  def wMCreateEditor(ppEditor : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateEditor(ppEditor)
  end

  def wMCreateIndexer(ppIndexer : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateIndexer(ppIndexer)
  end

  def wMCreateBackupRestorer(pCallback : Void*, ppBackup : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateBackupRestorer(pCallback, ppBackup)
  end

  def wMCreateProfileManager(ppProfileManager : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateProfileManager(ppProfileManager)
  end

  def wMCreateWriterFileSink(ppSink : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateWriterFileSink(ppSink)
  end

  def wMCreateWriterNetworkSink(ppSink : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateWriterNetworkSink(ppSink)
  end

  def wMCreateWriterPushSink(ppSink : Void**) : Win32cr::Foundation::HRESULT
    C.WMCreateWriterPushSink(ppSink)
  end

  @[Link("wmvcore")]
  lib C
    # :nodoc:
    fun WMIsContentProtected(pwszFileName : Win32cr::Foundation::PWSTR, pfIsProtected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateWriter(pUnkCert : Void*, ppWriter : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateReader(pUnkCert : Void*, dwRights : UInt32, ppReader : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateSyncReader(pUnkCert : Void*, dwRights : UInt32, ppSyncReader : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateEditor(ppEditor : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateIndexer(ppIndexer : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateBackupRestorer(pCallback : Void*, ppBackup : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateProfileManager(ppProfileManager : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateWriterFileSink(ppSink : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateWriterNetworkSink(ppSink : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WMCreateWriterPushSink(ppSink : Void**) : Win32cr::Foundation::HRESULT

  end
end