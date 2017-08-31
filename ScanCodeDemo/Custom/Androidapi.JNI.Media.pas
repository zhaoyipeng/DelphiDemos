{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Media;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAsyncPlayer = interface;//android.media.AsyncPlayer
  JAudioAttributes = interface;//android.media.AudioAttributes
  JAudioAttributes_Builder = interface;//android.media.AudioAttributes$Builder
  JAudioDeviceCallback = interface;//android.media.AudioDeviceCallback
  JAudioDeviceInfo = interface;//android.media.AudioDeviceInfo
  JAudioFormat = interface;//android.media.AudioFormat
  JAudioFormat_Builder = interface;//android.media.AudioFormat$Builder
  JAudioManager = interface;//android.media.AudioManager
  JAudioManager_OnAudioFocusChangeListener = interface;//android.media.AudioManager$OnAudioFocusChangeListener
  JAudioRecord = interface;//android.media.AudioRecord
  JAudioRecord_Builder = interface;//android.media.AudioRecord$Builder
  JAudioRecord_OnRecordPositionUpdateListener = interface;//android.media.AudioRecord$OnRecordPositionUpdateListener
  JAudioRecord_OnRoutingChangedListener = interface;//android.media.AudioRecord$OnRoutingChangedListener
  JAudioTimestamp = interface;//android.media.AudioTimestamp
  JAudioTrack = interface;//android.media.AudioTrack
  JAudioTrack_Builder = interface;//android.media.AudioTrack$Builder
  JAudioTrack_OnPlaybackPositionUpdateListener = interface;//android.media.AudioTrack$OnPlaybackPositionUpdateListener
  JAudioTrack_OnRoutingChangedListener = interface;//android.media.AudioTrack$OnRoutingChangedListener
  JCamcorderProfile = interface;//android.media.CamcorderProfile
  JCameraProfile = interface;//android.media.CameraProfile
  JMediaDrmException = interface;//android.media.MediaDrmException
  JDeniedByServerException = interface;//android.media.DeniedByServerException
  JExifInterface = interface;//android.media.ExifInterface
  JFaceDetector = interface;//android.media.FaceDetector
  JFaceDetector_Face = interface;//android.media.FaceDetector$Face
  JImage = interface;//android.media.Image
  JImage_Plane = interface;//android.media.Image$Plane
  JImageReader = interface;//android.media.ImageReader
  JImageReader_OnImageAvailableListener = interface;//android.media.ImageReader$OnImageAvailableListener
  JImageWriter = interface;//android.media.ImageWriter
  JImageWriter_OnImageReleasedListener = interface;//android.media.ImageWriter$OnImageReleasedListener
  JJetPlayer = interface;//android.media.JetPlayer
  JJetPlayer_OnJetEventListener = interface;//android.media.JetPlayer$OnJetEventListener
  JMediaActionSound = interface;//android.media.MediaActionSound
  JMediaCodec = interface;//android.media.MediaCodec
  JMediaCodec_BufferInfo = interface;//android.media.MediaCodec$BufferInfo
  JMediaCodec_Callback = interface;//android.media.MediaCodec$Callback
  JMediaCodec_CodecException = interface;//android.media.MediaCodec$CodecException
  JMediaCodec_CryptoException = interface;//android.media.MediaCodec$CryptoException
  JMediaCodec_CryptoInfo = interface;//android.media.MediaCodec$CryptoInfo
  JMediaCodec_OnFrameRenderedListener = interface;//android.media.MediaCodec$OnFrameRenderedListener
  JMediaCodecInfo = interface;//android.media.MediaCodecInfo
  JMediaCodecInfo_AudioCapabilities = interface;//android.media.MediaCodecInfo$AudioCapabilities
  JMediaCodecInfo_CodecCapabilities = interface;//android.media.MediaCodecInfo$CodecCapabilities
  JMediaCodecInfo_CodecProfileLevel = interface;//android.media.MediaCodecInfo$CodecProfileLevel
  JMediaCodecInfo_EncoderCapabilities = interface;//android.media.MediaCodecInfo$EncoderCapabilities
  JMediaCodecInfo_VideoCapabilities = interface;//android.media.MediaCodecInfo$VideoCapabilities
  JMediaCodecList = interface;//android.media.MediaCodecList
  JMediaCrypto = interface;//android.media.MediaCrypto
  JMediaCryptoException = interface;//android.media.MediaCryptoException
  JMediaDataSource = interface;//android.media.MediaDataSource
  JMediaDescription = interface;//android.media.MediaDescription
  JMediaDescription_Builder = interface;//android.media.MediaDescription$Builder
  JMediaDrm = interface;//android.media.MediaDrm
  JMediaDrm_CryptoSession = interface;//android.media.MediaDrm$CryptoSession
  JMediaDrm_KeyRequest = interface;//android.media.MediaDrm$KeyRequest
  JMediaDrm_KeyStatus = interface;//android.media.MediaDrm$KeyStatus
  JMediaDrm_MediaDrmStateException = interface;//android.media.MediaDrm$MediaDrmStateException
  JMediaDrm_OnEventListener = interface;//android.media.MediaDrm$OnEventListener
  JMediaDrm_OnExpirationUpdateListener = interface;//android.media.MediaDrm$OnExpirationUpdateListener
  JMediaDrm_OnKeyStatusChangeListener = interface;//android.media.MediaDrm$OnKeyStatusChangeListener
  JMediaDrm_ProvisionRequest = interface;//android.media.MediaDrm$ProvisionRequest
  JMediaDrmResetException = interface;//android.media.MediaDrmResetException
  JMediaExtractor = interface;//android.media.MediaExtractor
  JMediaFormat = interface;//android.media.MediaFormat
  Jmedia_MediaMetadata = interface;//android.media.MediaMetadata
  JMediaMetadata_Builder = interface;//android.media.MediaMetadata$Builder
  JMediaMetadataEditor = interface;//android.media.MediaMetadataEditor
  JMediaMetadataRetriever = interface;//android.media.MediaMetadataRetriever
  JMediaMuxer = interface;//android.media.MediaMuxer
  JMediaMuxer_OutputFormat = interface;//android.media.MediaMuxer$OutputFormat
  JMediaPlayer = interface;//android.media.MediaPlayer
  JMediaPlayer_OnBufferingUpdateListener = interface;//android.media.MediaPlayer$OnBufferingUpdateListener
  JMediaPlayer_OnCompletionListener = interface;//android.media.MediaPlayer$OnCompletionListener
  JMediaPlayer_OnErrorListener = interface;//android.media.MediaPlayer$OnErrorListener
  JMediaPlayer_OnInfoListener = interface;//android.media.MediaPlayer$OnInfoListener
  JMediaPlayer_OnPreparedListener = interface;//android.media.MediaPlayer$OnPreparedListener
  JMediaPlayer_OnSeekCompleteListener = interface;//android.media.MediaPlayer$OnSeekCompleteListener
  JMediaPlayer_OnTimedMetaDataAvailableListener = interface;//android.media.MediaPlayer$OnTimedMetaDataAvailableListener
  JMediaPlayer_OnTimedTextListener = interface;//android.media.MediaPlayer$OnTimedTextListener
  JMediaPlayer_OnVideoSizeChangedListener = interface;//android.media.MediaPlayer$OnVideoSizeChangedListener
  JMediaPlayer_TrackInfo = interface;//android.media.MediaPlayer$TrackInfo
  JMediaRecorder = interface;//android.media.MediaRecorder
  JMediaRecorder_AudioEncoder = interface;//android.media.MediaRecorder$AudioEncoder
  JMediaRecorder_AudioSource = interface;//android.media.MediaRecorder$AudioSource
  JMediaRecorder_OnErrorListener = interface;//android.media.MediaRecorder$OnErrorListener
  JMediaRecorder_OnInfoListener = interface;//android.media.MediaRecorder$OnInfoListener
  JMediaRecorder_OutputFormat = interface;//android.media.MediaRecorder$OutputFormat
  JMediaRecorder_VideoEncoder = interface;//android.media.MediaRecorder$VideoEncoder
  JMediaRecorder_VideoSource = interface;//android.media.MediaRecorder$VideoSource
  JMediaRouter = interface;//android.media.MediaRouter
  JMediaRouter_Callback = interface;//android.media.MediaRouter$Callback
  JMediaRouter_RouteCategory = interface;//android.media.MediaRouter$RouteCategory
  JMediaRouter_RouteInfo = interface;//android.media.MediaRouter$RouteInfo
  JMediaRouter_RouteGroup = interface;//android.media.MediaRouter$RouteGroup
  JMediaRouter_SimpleCallback = interface;//android.media.MediaRouter$SimpleCallback
  JMediaRouter_UserRouteInfo = interface;//android.media.MediaRouter$UserRouteInfo
  JMediaRouter_VolumeCallback = interface;//android.media.MediaRouter$VolumeCallback
  JMediaScannerConnection = interface;//android.media.MediaScannerConnection
  JMediaScannerConnection_OnScanCompletedListener = interface;//android.media.MediaScannerConnection$OnScanCompletedListener
  JMediaScannerConnection_MediaScannerConnectionClient = interface;//android.media.MediaScannerConnection$MediaScannerConnectionClient
  JMediaSync = interface;//android.media.MediaSync
  JMediaSync_Callback = interface;//android.media.MediaSync$Callback
  JMediaSync_OnErrorListener = interface;//android.media.MediaSync$OnErrorListener
  JMediaSyncEvent = interface;//android.media.MediaSyncEvent
  JMediaTimestamp = interface;//android.media.MediaTimestamp
  JNotProvisionedException = interface;//android.media.NotProvisionedException
  JPlaybackParams = interface;//android.media.PlaybackParams
  JRating = interface;//android.media.Rating
  JRemoteControlClient = interface;//android.media.RemoteControlClient
  JRemoteControlClient_MetadataEditor = interface;//android.media.RemoteControlClient$MetadataEditor
  JRemoteControlClient_OnGetPlaybackPositionListener = interface;//android.media.RemoteControlClient$OnGetPlaybackPositionListener
  JRemoteControlClient_OnMetadataUpdateListener = interface;//android.media.RemoteControlClient$OnMetadataUpdateListener
  JRemoteControlClient_OnPlaybackPositionUpdateListener = interface;//android.media.RemoteControlClient$OnPlaybackPositionUpdateListener
  JRemoteController = interface;//android.media.RemoteController
  JRemoteController_MetadataEditor = interface;//android.media.RemoteController$MetadataEditor
  JRemoteController_OnClientUpdateListener = interface;//android.media.RemoteController$OnClientUpdateListener
  JResourceBusyException = interface;//android.media.ResourceBusyException
  JRingtone = interface;//android.media.Ringtone
  JRingtoneManager = interface;//android.media.RingtoneManager
  JSoundPool = interface;//android.media.SoundPool
  JSoundPool_Builder = interface;//android.media.SoundPool$Builder
  JSoundPool_OnLoadCompleteListener = interface;//android.media.SoundPool$OnLoadCompleteListener
  JSyncParams = interface;//android.media.SyncParams
  JThumbnailUtils = interface;//android.media.ThumbnailUtils
  JTimedMetaData = interface;//android.media.TimedMetaData
  JTimedText = interface;//android.media.TimedText
  JToneGenerator = interface;//android.media.ToneGenerator
  JUnsupportedSchemeException = interface;//android.media.UnsupportedSchemeException
  JVolumeProvider = interface;//android.media.VolumeProvider
  JAudioEffect = interface;//android.media.audiofx.AudioEffect
  JAcousticEchoCanceler = interface;//android.media.audiofx.AcousticEchoCanceler
  JAudioEffect_Descriptor = interface;//android.media.audiofx.AudioEffect$Descriptor
  JAudioEffect_OnControlStatusChangeListener = interface;//android.media.audiofx.AudioEffect$OnControlStatusChangeListener
  JAudioEffect_OnEnableStatusChangeListener = interface;//android.media.audiofx.AudioEffect$OnEnableStatusChangeListener
  JAutomaticGainControl = interface;//android.media.audiofx.AutomaticGainControl
  JBassBoost = interface;//android.media.audiofx.BassBoost
  JBassBoost_OnParameterChangeListener = interface;//android.media.audiofx.BassBoost$OnParameterChangeListener
  JBassBoost_Settings = interface;//android.media.audiofx.BassBoost$Settings
  JEnvironmentalReverb = interface;//android.media.audiofx.EnvironmentalReverb
  JEnvironmentalReverb_OnParameterChangeListener = interface;//android.media.audiofx.EnvironmentalReverb$OnParameterChangeListener
  JEnvironmentalReverb_Settings = interface;//android.media.audiofx.EnvironmentalReverb$Settings
  JEqualizer = interface;//android.media.audiofx.Equalizer
  JEqualizer_OnParameterChangeListener = interface;//android.media.audiofx.Equalizer$OnParameterChangeListener
  JEqualizer_Settings = interface;//android.media.audiofx.Equalizer$Settings
  JLoudnessEnhancer = interface;//android.media.audiofx.LoudnessEnhancer
  JNoiseSuppressor = interface;//android.media.audiofx.NoiseSuppressor
  JPresetReverb = interface;//android.media.audiofx.PresetReverb
  JPresetReverb_OnParameterChangeListener = interface;//android.media.audiofx.PresetReverb$OnParameterChangeListener
  JPresetReverb_Settings = interface;//android.media.audiofx.PresetReverb$Settings
  JVirtualizer = interface;//android.media.audiofx.Virtualizer
  JVirtualizer_OnParameterChangeListener = interface;//android.media.audiofx.Virtualizer$OnParameterChangeListener
  JVirtualizer_Settings = interface;//android.media.audiofx.Virtualizer$Settings
  JVisualizer = interface;//android.media.audiofx.Visualizer
  JVisualizer_MeasurementPeakRms = interface;//android.media.audiofx.Visualizer$MeasurementPeakRms
  JVisualizer_OnDataCaptureListener = interface;//android.media.audiofx.Visualizer$OnDataCaptureListener
  JMediaBrowser = interface;//android.media.browse.MediaBrowser
  JMediaBrowser_ConnectionCallback = interface;//android.media.browse.MediaBrowser$ConnectionCallback
  JMediaBrowser_ItemCallback = interface;//android.media.browse.MediaBrowser$ItemCallback
  JMediaBrowser_MediaItem = interface;//android.media.browse.MediaBrowser$MediaItem
  JMediaBrowser_SubscriptionCallback = interface;//android.media.browse.MediaBrowser$SubscriptionCallback
  JEffect = interface;//android.media.effect.Effect
  JEffectContext = interface;//android.media.effect.EffectContext
  JEffectFactory = interface;//android.media.effect.EffectFactory
  JEffectUpdateListener = interface;//android.media.effect.EffectUpdateListener
  JMidiDevice = interface;//android.media.midi.MidiDevice
  JMidiDevice_MidiConnection = interface;//android.media.midi.MidiDevice$MidiConnection
  JMidiDeviceInfo = interface;//android.media.midi.MidiDeviceInfo
  JMidiDeviceInfo_PortInfo = interface;//android.media.midi.MidiDeviceInfo$PortInfo
  JMidiDeviceService = interface;//android.media.midi.MidiDeviceService
  JMidiDeviceStatus = interface;//android.media.midi.MidiDeviceStatus
  JMidiReceiver = interface;//android.media.midi.MidiReceiver
  JMidiInputPort = interface;//android.media.midi.MidiInputPort
  JMidiManager = interface;//android.media.midi.MidiManager
  JMidiManager_DeviceCallback = interface;//android.media.midi.MidiManager$DeviceCallback
  JMidiManager_OnDeviceOpenedListener = interface;//android.media.midi.MidiManager$OnDeviceOpenedListener
  JMidiSender = interface;//android.media.midi.MidiSender
  JMidiOutputPort = interface;//android.media.midi.MidiOutputPort
  JMediaProjection = interface;//android.media.projection.MediaProjection
  JMediaProjection_Callback = interface;//android.media.projection.MediaProjection$Callback
  JMediaProjectionManager = interface;//android.media.projection.MediaProjectionManager
  Jsession_MediaController = interface;//android.media.session.MediaController
  JMediaController_Callback = interface;//android.media.session.MediaController$Callback
  JMediaController_PlaybackInfo = interface;//android.media.session.MediaController$PlaybackInfo
  JMediaController_TransportControls = interface;//android.media.session.MediaController$TransportControls
  JMediaSession = interface;//android.media.session.MediaSession
  JMediaSession_Callback = interface;//android.media.session.MediaSession$Callback
  JMediaSession_QueueItem = interface;//android.media.session.MediaSession$QueueItem
  JMediaSession_Token = interface;//android.media.session.MediaSession$Token
  JMediaSessionManager = interface;//android.media.session.MediaSessionManager
  JMediaSessionManager_OnActiveSessionsChangedListener = interface;//android.media.session.MediaSessionManager$OnActiveSessionsChangedListener
  JPlaybackState = interface;//android.media.session.PlaybackState
  JPlaybackState_Builder = interface;//android.media.session.PlaybackState$Builder
  JPlaybackState_CustomAction = interface;//android.media.session.PlaybackState$CustomAction
  JCustomAction_Builder = interface;//android.media.session.PlaybackState$CustomAction$Builder
  JTvContentRating = interface;//android.media.tv.TvContentRating
  JTvContract = interface;//android.media.tv.TvContract
  JTvContract_BaseTvColumns = interface;//android.media.tv.TvContract$BaseTvColumns
  JTvContract_Channels = interface;//android.media.tv.TvContract$Channels
  JChannels_Logo = interface;//android.media.tv.TvContract$Channels$Logo
  JTvContract_Programs = interface;//android.media.tv.TvContract$Programs
  JPrograms_Genres = interface;//android.media.tv.TvContract$Programs$Genres
  JTvInputInfo = interface;//android.media.tv.TvInputInfo
  JTvInputManager = interface;//android.media.tv.TvInputManager
  JTvInputManager_TvInputCallback = interface;//android.media.tv.TvInputManager$TvInputCallback
  JTvInputService = interface;//android.media.tv.TvInputService
  JTvInputService_Session = interface;//android.media.tv.TvInputService$Session
  JTvInputService_HardwareSession = interface;//android.media.tv.TvInputService$HardwareSession
  JTvTrackInfo = interface;//android.media.tv.TvTrackInfo
  JTvTrackInfo_Builder = interface;//android.media.tv.TvTrackInfo$Builder
  JTvView = interface;//android.media.tv.TvView
  JTvView_OnUnhandledInputEventListener = interface;//android.media.tv.TvView$OnUnhandledInputEventListener
  JTvView_TimeShiftPositionCallback = interface;//android.media.tv.TvView$TimeShiftPositionCallback
  JTvView_TvInputCallback = interface;//android.media.tv.TvView$TvInputCallback

// ===== Interface declarations =====

  JAsyncPlayerClass = interface(JObjectClass)
    ['{BF7F601F-6678-4903-B30E-7A73E4EE059C}']
    {class} function init(tag: JString): JAsyncPlayer; cdecl;
  end;

  [JavaSignature('android/media/AsyncPlayer')]
  JAsyncPlayer = interface(JObject)
    ['{8415DF11-11ED-4FA6-8864-F4420519D2C3}']
    procedure play(context: JContext; uri: Jnet_Uri; looping: Boolean; stream: Integer); cdecl; overload;//Deprecated
    procedure play(context: JContext; uri: Jnet_Uri; looping: Boolean; attributes: JAudioAttributes); cdecl; overload;
    procedure stop; cdecl;
  end;
  TJAsyncPlayer = class(TJavaGenericImport<JAsyncPlayerClass, JAsyncPlayer>) end;

  JAudioAttributesClass = interface(JObjectClass)
    ['{1EB61050-2F9F-4FC2-93C7-98AE576B5DD2}']
    {class} function _GetCONTENT_TYPE_MOVIE: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MUSIC: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_SONIFICATION: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_SPEECH: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFLAG_AUDIBILITY_ENFORCED: Integer; cdecl;
    {class} function _GetFLAG_HW_AV_SYNC: Integer; cdecl;
    {class} function _GetUSAGE_ALARM: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANCE_ACCESSIBILITY: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANCE_NAVIGATION_GUIDANCE: Integer; cdecl;
    {class} function _GetUSAGE_ASSISTANCE_SONIFICATION: Integer; cdecl;
    {class} function _GetUSAGE_GAME: Integer; cdecl;
    {class} function _GetUSAGE_MEDIA: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_COMMUNICATION_DELAYED: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_COMMUNICATION_INSTANT: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_COMMUNICATION_REQUEST: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_EVENT: Integer; cdecl;
    {class} function _GetUSAGE_NOTIFICATION_RINGTONE: Integer; cdecl;
    {class} function _GetUSAGE_UNKNOWN: Integer; cdecl;
    {class} function _GetUSAGE_VOICE_COMMUNICATION: Integer; cdecl;
    {class} function _GetUSAGE_VOICE_COMMUNICATION_SIGNALLING: Integer; cdecl;
    {class} property CONTENT_TYPE_MOVIE: Integer read _GetCONTENT_TYPE_MOVIE;
    {class} property CONTENT_TYPE_MUSIC: Integer read _GetCONTENT_TYPE_MUSIC;
    {class} property CONTENT_TYPE_SONIFICATION: Integer read _GetCONTENT_TYPE_SONIFICATION;
    {class} property CONTENT_TYPE_SPEECH: Integer read _GetCONTENT_TYPE_SPEECH;
    {class} property CONTENT_TYPE_UNKNOWN: Integer read _GetCONTENT_TYPE_UNKNOWN;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FLAG_AUDIBILITY_ENFORCED: Integer read _GetFLAG_AUDIBILITY_ENFORCED;
    {class} property FLAG_HW_AV_SYNC: Integer read _GetFLAG_HW_AV_SYNC;
    {class} property USAGE_ALARM: Integer read _GetUSAGE_ALARM;
    {class} property USAGE_ASSISTANCE_ACCESSIBILITY: Integer read _GetUSAGE_ASSISTANCE_ACCESSIBILITY;
    {class} property USAGE_ASSISTANCE_NAVIGATION_GUIDANCE: Integer read _GetUSAGE_ASSISTANCE_NAVIGATION_GUIDANCE;
    {class} property USAGE_ASSISTANCE_SONIFICATION: Integer read _GetUSAGE_ASSISTANCE_SONIFICATION;
    {class} property USAGE_GAME: Integer read _GetUSAGE_GAME;
    {class} property USAGE_MEDIA: Integer read _GetUSAGE_MEDIA;
    {class} property USAGE_NOTIFICATION: Integer read _GetUSAGE_NOTIFICATION;
    {class} property USAGE_NOTIFICATION_COMMUNICATION_DELAYED: Integer read _GetUSAGE_NOTIFICATION_COMMUNICATION_DELAYED;
    {class} property USAGE_NOTIFICATION_COMMUNICATION_INSTANT: Integer read _GetUSAGE_NOTIFICATION_COMMUNICATION_INSTANT;
    {class} property USAGE_NOTIFICATION_COMMUNICATION_REQUEST: Integer read _GetUSAGE_NOTIFICATION_COMMUNICATION_REQUEST;
    {class} property USAGE_NOTIFICATION_EVENT: Integer read _GetUSAGE_NOTIFICATION_EVENT;
    {class} property USAGE_NOTIFICATION_RINGTONE: Integer read _GetUSAGE_NOTIFICATION_RINGTONE;
    {class} property USAGE_UNKNOWN: Integer read _GetUSAGE_UNKNOWN;
    {class} property USAGE_VOICE_COMMUNICATION: Integer read _GetUSAGE_VOICE_COMMUNICATION;
    {class} property USAGE_VOICE_COMMUNICATION_SIGNALLING: Integer read _GetUSAGE_VOICE_COMMUNICATION_SIGNALLING;
  end;

  [JavaSignature('android/media/AudioAttributes')]
  JAudioAttributes = interface(JObject)
    ['{880D30F3-3AE2-43F2-979B-9D0E182C20AC}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getContentType: Integer; cdecl;
    function getFlags: Integer; cdecl;
    function getUsage: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJAudioAttributes = class(TJavaGenericImport<JAudioAttributesClass, JAudioAttributes>) end;

  JAudioAttributes_BuilderClass = interface(JObjectClass)
    ['{A6B7A372-3DD3-4E59-8C9B-301154CD330D}']
    {class} function init: JAudioAttributes_Builder; cdecl; overload;
    {class} function init(aa: JAudioAttributes): JAudioAttributes_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/AudioAttributes$Builder')]
  JAudioAttributes_Builder = interface(JObject)
    ['{D73EC2B2-C044-4DF8-9190-64F781958EA9}']
    function build: JAudioAttributes; cdecl;
    function setContentType(contentType: Integer): JAudioAttributes_Builder; cdecl;
    function setFlags(flags: Integer): JAudioAttributes_Builder; cdecl;
    function setLegacyStreamType(streamType: Integer): JAudioAttributes_Builder; cdecl;
    function setUsage(usage: Integer): JAudioAttributes_Builder; cdecl;
  end;
  TJAudioAttributes_Builder = class(TJavaGenericImport<JAudioAttributes_BuilderClass, JAudioAttributes_Builder>) end;

  JAudioDeviceCallbackClass = interface(JObjectClass)
    ['{FC684049-9A6C-43C6-9B21-E906EED4BD3C}']
    {class} function init: JAudioDeviceCallback; cdecl;
  end;

  [JavaSignature('android/media/AudioDeviceCallback')]
  JAudioDeviceCallback = interface(JObject)
    ['{9118880E-E444-46F1-9B46-89C30E87E51B}']
    procedure onAudioDevicesAdded(addedDevices: TJavaObjectArray<JAudioDeviceInfo>); cdecl;
    procedure onAudioDevicesRemoved(removedDevices: TJavaObjectArray<JAudioDeviceInfo>); cdecl;
  end;
  TJAudioDeviceCallback = class(TJavaGenericImport<JAudioDeviceCallbackClass, JAudioDeviceCallback>) end;

  JAudioDeviceInfoClass = interface(JObjectClass)
    ['{68C9A2CC-486D-4E1B-B35A-9CCC72AE4CAE}']
    {class} function _GetTYPE_AUX_LINE: Integer; cdecl;
    {class} function _GetTYPE_BLUETOOTH_A2DP: Integer; cdecl;
    {class} function _GetTYPE_BLUETOOTH_SCO: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_EARPIECE: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_MIC: Integer; cdecl;
    {class} function _GetTYPE_BUILTIN_SPEAKER: Integer; cdecl;
    {class} function _GetTYPE_DOCK: Integer; cdecl;
    {class} function _GetTYPE_FM: Integer; cdecl;
    {class} function _GetTYPE_FM_TUNER: Integer; cdecl;
    {class} function _GetTYPE_HDMI: Integer; cdecl;
    {class} function _GetTYPE_HDMI_ARC: Integer; cdecl;
    {class} function _GetTYPE_IP: Integer; cdecl;
    {class} function _GetTYPE_LINE_ANALOG: Integer; cdecl;
    {class} function _GetTYPE_LINE_DIGITAL: Integer; cdecl;
    {class} function _GetTYPE_TELEPHONY: Integer; cdecl;
    {class} function _GetTYPE_TV_TUNER: Integer; cdecl;
    {class} function _GetTYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetTYPE_USB_ACCESSORY: Integer; cdecl;
    {class} function _GetTYPE_USB_DEVICE: Integer; cdecl;
    {class} function _GetTYPE_WIRED_HEADPHONES: Integer; cdecl;
    {class} function _GetTYPE_WIRED_HEADSET: Integer; cdecl;
    {class} property TYPE_AUX_LINE: Integer read _GetTYPE_AUX_LINE;
    {class} property TYPE_BLUETOOTH_A2DP: Integer read _GetTYPE_BLUETOOTH_A2DP;
    {class} property TYPE_BLUETOOTH_SCO: Integer read _GetTYPE_BLUETOOTH_SCO;
    {class} property TYPE_BUILTIN_EARPIECE: Integer read _GetTYPE_BUILTIN_EARPIECE;
    {class} property TYPE_BUILTIN_MIC: Integer read _GetTYPE_BUILTIN_MIC;
    {class} property TYPE_BUILTIN_SPEAKER: Integer read _GetTYPE_BUILTIN_SPEAKER;
    {class} property TYPE_DOCK: Integer read _GetTYPE_DOCK;
    {class} property TYPE_FM: Integer read _GetTYPE_FM;
    {class} property TYPE_FM_TUNER: Integer read _GetTYPE_FM_TUNER;
    {class} property TYPE_HDMI: Integer read _GetTYPE_HDMI;
    {class} property TYPE_HDMI_ARC: Integer read _GetTYPE_HDMI_ARC;
    {class} property TYPE_IP: Integer read _GetTYPE_IP;
    {class} property TYPE_LINE_ANALOG: Integer read _GetTYPE_LINE_ANALOG;
    {class} property TYPE_LINE_DIGITAL: Integer read _GetTYPE_LINE_DIGITAL;
    {class} property TYPE_TELEPHONY: Integer read _GetTYPE_TELEPHONY;
    {class} property TYPE_TV_TUNER: Integer read _GetTYPE_TV_TUNER;
    {class} property TYPE_UNKNOWN: Integer read _GetTYPE_UNKNOWN;
    {class} property TYPE_USB_ACCESSORY: Integer read _GetTYPE_USB_ACCESSORY;
    {class} property TYPE_USB_DEVICE: Integer read _GetTYPE_USB_DEVICE;
    {class} property TYPE_WIRED_HEADPHONES: Integer read _GetTYPE_WIRED_HEADPHONES;
    {class} property TYPE_WIRED_HEADSET: Integer read _GetTYPE_WIRED_HEADSET;
  end;

  [JavaSignature('android/media/AudioDeviceInfo')]
  JAudioDeviceInfo = interface(JObject)
    ['{F90AC375-3BA3-4AEE-8154-DCCDF7114348}']
    function getChannelCounts: TJavaArray<Integer>; cdecl;
    function getChannelIndexMasks: TJavaArray<Integer>; cdecl;
    function getChannelMasks: TJavaArray<Integer>; cdecl;
    function getEncodings: TJavaArray<Integer>; cdecl;
    function getId: Integer; cdecl;
    function getProductName: JCharSequence; cdecl;
    function getSampleRates: TJavaArray<Integer>; cdecl;
    function getType: Integer; cdecl;
    function isSink: Boolean; cdecl;
    function isSource: Boolean; cdecl;
  end;
  TJAudioDeviceInfo = class(TJavaGenericImport<JAudioDeviceInfoClass, JAudioDeviceInfo>) end;

  JAudioFormatClass = interface(JObjectClass)
    ['{C173E007-9835-486C-AA1A-700127383914}']
    {class} function _GetCHANNEL_CONFIGURATION_DEFAULT: Integer; cdecl;
    {class} function _GetCHANNEL_CONFIGURATION_INVALID: Integer; cdecl;
    {class} function _GetCHANNEL_CONFIGURATION_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_CONFIGURATION_STEREO: Integer; cdecl;
    {class} function _GetCHANNEL_INVALID: Integer; cdecl;
    {class} function _GetCHANNEL_IN_BACK: Integer; cdecl;
    {class} function _GetCHANNEL_IN_BACK_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_DEFAULT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_FRONT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_FRONT_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_LEFT_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_IN_PRESSURE: Integer; cdecl;
    {class} function _GetCHANNEL_IN_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_IN_RIGHT_PROCESSED: Integer; cdecl;
    {class} function _GetCHANNEL_IN_STEREO: Integer; cdecl;
    {class} function _GetCHANNEL_IN_VOICE_DNLINK: Integer; cdecl;
    {class} function _GetCHANNEL_IN_VOICE_UPLINK: Integer; cdecl;
    {class} function _GetCHANNEL_IN_X_AXIS: Integer; cdecl;
    {class} function _GetCHANNEL_IN_Y_AXIS: Integer; cdecl;
    {class} function _GetCHANNEL_IN_Z_AXIS: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_5POINT1: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_7POINT1: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_7POINT1_SURROUND: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BACK_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BACK_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_BACK_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_DEFAULT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_LEFT_OF_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_FRONT_RIGHT_OF_CENTER: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_LOW_FREQUENCY: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_MONO: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_QUAD: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_SIDE_LEFT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_SIDE_RIGHT: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_STEREO: Integer; cdecl;
    {class} function _GetCHANNEL_OUT_SURROUND: Integer; cdecl;
    {class} function _GetENCODING_AC3: Integer; cdecl;
    {class} function _GetENCODING_DEFAULT: Integer; cdecl;
    {class} function _GetENCODING_DTS: Integer; cdecl;
    {class} function _GetENCODING_DTS_HD: Integer; cdecl;
    {class} function _GetENCODING_E_AC3: Integer; cdecl;
    {class} function _GetENCODING_INVALID: Integer; cdecl;
    {class} function _GetENCODING_PCM_16BIT: Integer; cdecl;
    {class} function _GetENCODING_PCM_8BIT: Integer; cdecl;
    {class} function _GetENCODING_PCM_FLOAT: Integer; cdecl;
    {class} function init: JAudioFormat; cdecl;
    {class} property CHANNEL_CONFIGURATION_DEFAULT: Integer read _GetCHANNEL_CONFIGURATION_DEFAULT;
    {class} property CHANNEL_CONFIGURATION_INVALID: Integer read _GetCHANNEL_CONFIGURATION_INVALID;
    {class} property CHANNEL_CONFIGURATION_MONO: Integer read _GetCHANNEL_CONFIGURATION_MONO;
    {class} property CHANNEL_CONFIGURATION_STEREO: Integer read _GetCHANNEL_CONFIGURATION_STEREO;
    {class} property CHANNEL_INVALID: Integer read _GetCHANNEL_INVALID;
    {class} property CHANNEL_IN_BACK: Integer read _GetCHANNEL_IN_BACK;
    {class} property CHANNEL_IN_BACK_PROCESSED: Integer read _GetCHANNEL_IN_BACK_PROCESSED;
    {class} property CHANNEL_IN_DEFAULT: Integer read _GetCHANNEL_IN_DEFAULT;
    {class} property CHANNEL_IN_FRONT: Integer read _GetCHANNEL_IN_FRONT;
    {class} property CHANNEL_IN_FRONT_PROCESSED: Integer read _GetCHANNEL_IN_FRONT_PROCESSED;
    {class} property CHANNEL_IN_LEFT: Integer read _GetCHANNEL_IN_LEFT;
    {class} property CHANNEL_IN_LEFT_PROCESSED: Integer read _GetCHANNEL_IN_LEFT_PROCESSED;
    {class} property CHANNEL_IN_MONO: Integer read _GetCHANNEL_IN_MONO;
    {class} property CHANNEL_IN_PRESSURE: Integer read _GetCHANNEL_IN_PRESSURE;
    {class} property CHANNEL_IN_RIGHT: Integer read _GetCHANNEL_IN_RIGHT;
    {class} property CHANNEL_IN_RIGHT_PROCESSED: Integer read _GetCHANNEL_IN_RIGHT_PROCESSED;
    {class} property CHANNEL_IN_STEREO: Integer read _GetCHANNEL_IN_STEREO;
    {class} property CHANNEL_IN_VOICE_DNLINK: Integer read _GetCHANNEL_IN_VOICE_DNLINK;
    {class} property CHANNEL_IN_VOICE_UPLINK: Integer read _GetCHANNEL_IN_VOICE_UPLINK;
    {class} property CHANNEL_IN_X_AXIS: Integer read _GetCHANNEL_IN_X_AXIS;
    {class} property CHANNEL_IN_Y_AXIS: Integer read _GetCHANNEL_IN_Y_AXIS;
    {class} property CHANNEL_IN_Z_AXIS: Integer read _GetCHANNEL_IN_Z_AXIS;
    {class} property CHANNEL_OUT_5POINT1: Integer read _GetCHANNEL_OUT_5POINT1;
    {class} property CHANNEL_OUT_7POINT1: Integer read _GetCHANNEL_OUT_7POINT1;
    {class} property CHANNEL_OUT_7POINT1_SURROUND: Integer read _GetCHANNEL_OUT_7POINT1_SURROUND;
    {class} property CHANNEL_OUT_BACK_CENTER: Integer read _GetCHANNEL_OUT_BACK_CENTER;
    {class} property CHANNEL_OUT_BACK_LEFT: Integer read _GetCHANNEL_OUT_BACK_LEFT;
    {class} property CHANNEL_OUT_BACK_RIGHT: Integer read _GetCHANNEL_OUT_BACK_RIGHT;
    {class} property CHANNEL_OUT_DEFAULT: Integer read _GetCHANNEL_OUT_DEFAULT;
    {class} property CHANNEL_OUT_FRONT_CENTER: Integer read _GetCHANNEL_OUT_FRONT_CENTER;
    {class} property CHANNEL_OUT_FRONT_LEFT: Integer read _GetCHANNEL_OUT_FRONT_LEFT;
    {class} property CHANNEL_OUT_FRONT_LEFT_OF_CENTER: Integer read _GetCHANNEL_OUT_FRONT_LEFT_OF_CENTER;
    {class} property CHANNEL_OUT_FRONT_RIGHT: Integer read _GetCHANNEL_OUT_FRONT_RIGHT;
    {class} property CHANNEL_OUT_FRONT_RIGHT_OF_CENTER: Integer read _GetCHANNEL_OUT_FRONT_RIGHT_OF_CENTER;
    {class} property CHANNEL_OUT_LOW_FREQUENCY: Integer read _GetCHANNEL_OUT_LOW_FREQUENCY;
    {class} property CHANNEL_OUT_MONO: Integer read _GetCHANNEL_OUT_MONO;
    {class} property CHANNEL_OUT_QUAD: Integer read _GetCHANNEL_OUT_QUAD;
    {class} property CHANNEL_OUT_SIDE_LEFT: Integer read _GetCHANNEL_OUT_SIDE_LEFT;
    {class} property CHANNEL_OUT_SIDE_RIGHT: Integer read _GetCHANNEL_OUT_SIDE_RIGHT;
    {class} property CHANNEL_OUT_STEREO: Integer read _GetCHANNEL_OUT_STEREO;
    {class} property CHANNEL_OUT_SURROUND: Integer read _GetCHANNEL_OUT_SURROUND;
    {class} property ENCODING_AC3: Integer read _GetENCODING_AC3;
    {class} property ENCODING_DEFAULT: Integer read _GetENCODING_DEFAULT;
    {class} property ENCODING_DTS: Integer read _GetENCODING_DTS;
    {class} property ENCODING_DTS_HD: Integer read _GetENCODING_DTS_HD;
    {class} property ENCODING_E_AC3: Integer read _GetENCODING_E_AC3;
    {class} property ENCODING_INVALID: Integer read _GetENCODING_INVALID;
    {class} property ENCODING_PCM_16BIT: Integer read _GetENCODING_PCM_16BIT;
    {class} property ENCODING_PCM_8BIT: Integer read _GetENCODING_PCM_8BIT;
    {class} property ENCODING_PCM_FLOAT: Integer read _GetENCODING_PCM_FLOAT;
  end;

  [JavaSignature('android/media/AudioFormat')]
  JAudioFormat = interface(JObject)
    ['{54729F91-CB43-4106-8A44-08A8FFF26397}']
    function getChannelCount: Integer; cdecl;
    function getChannelIndexMask: Integer; cdecl;
    function getChannelMask: Integer; cdecl;
    function getEncoding: Integer; cdecl;
    function getSampleRate: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJAudioFormat = class(TJavaGenericImport<JAudioFormatClass, JAudioFormat>) end;

  JAudioFormat_BuilderClass = interface(JObjectClass)
    ['{BAEECE3B-32C1-4F49-B6E8-2BA548854362}']
    {class} function init: JAudioFormat_Builder; cdecl; overload;
    {class} function init(af: JAudioFormat): JAudioFormat_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/AudioFormat$Builder')]
  JAudioFormat_Builder = interface(JObject)
    ['{136DA67F-AE5A-488C-8B36-0F6876B261ED}']
    function build: JAudioFormat; cdecl;
    function setChannelIndexMask(channelIndexMask: Integer): JAudioFormat_Builder; cdecl;
    function setChannelMask(channelMask: Integer): JAudioFormat_Builder; cdecl;
    function setEncoding(encoding: Integer): JAudioFormat_Builder; cdecl;
    function setSampleRate(sampleRate: Integer): JAudioFormat_Builder; cdecl;
  end;
  TJAudioFormat_Builder = class(TJavaGenericImport<JAudioFormat_BuilderClass, JAudioFormat_Builder>) end;

  JAudioManagerClass = interface(JObjectClass)
    ['{9CE5F205-F003-485F-AF71-8F0DAB8346B8}']
    {class} function _GetACTION_AUDIO_BECOMING_NOISY: JString; cdecl;
    {class} function _GetACTION_HDMI_AUDIO_PLUG: JString; cdecl;
    {class} function _GetACTION_HEADSET_PLUG: JString; cdecl;
    {class} function _GetACTION_SCO_AUDIO_STATE_CHANGED: JString; cdecl;
    {class} function _GetACTION_SCO_AUDIO_STATE_UPDATED: JString; cdecl;
    {class} function _GetADJUST_LOWER: Integer; cdecl;
    {class} function _GetADJUST_MUTE: Integer; cdecl;
    {class} function _GetADJUST_RAISE: Integer; cdecl;
    {class} function _GetADJUST_SAME: Integer; cdecl;
    {class} function _GetADJUST_TOGGLE_MUTE: Integer; cdecl;
    {class} function _GetADJUST_UNMUTE: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN_TRANSIENT: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_LOSS: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_LOSS_TRANSIENT: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_REQUEST_FAILED: Integer; cdecl;
    {class} function _GetAUDIOFOCUS_REQUEST_GRANTED: Integer; cdecl;
    {class} function _GetAUDIO_SESSION_ID_GENERATE: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetEXTRA_AUDIO_PLUG_STATE: JString; cdecl;
    {class} function _GetEXTRA_ENCODINGS: JString; cdecl;
    {class} function _GetEXTRA_MAX_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetEXTRA_RINGER_MODE: JString; cdecl;
    {class} function _GetEXTRA_SCO_AUDIO_PREVIOUS_STATE: JString; cdecl;
    {class} function _GetEXTRA_SCO_AUDIO_STATE: JString; cdecl;
    {class} function _GetEXTRA_VIBRATE_SETTING: JString; cdecl;
    {class} function _GetEXTRA_VIBRATE_TYPE: JString; cdecl;
    {class} function _GetFLAG_ALLOW_RINGER_MODES: Integer; cdecl;
    {class} function _GetFLAG_PLAY_SOUND: Integer; cdecl;
    {class} function _GetFLAG_REMOVE_SOUND_AND_VIBRATE: Integer; cdecl;
    {class} function _GetFLAG_SHOW_UI: Integer; cdecl;
    {class} function _GetFLAG_VIBRATE: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_DOWN: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_LEFT: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_RIGHT: Integer; cdecl;
    {class} function _GetFX_FOCUS_NAVIGATION_UP: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_DELETE: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_INVALID: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_RETURN: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_SPACEBAR: Integer; cdecl;
    {class} function _GetFX_KEYPRESS_STANDARD: Integer; cdecl;
    {class} function _GetFX_KEY_CLICK: Integer; cdecl;
    {class} function _GetGET_DEVICES_ALL: Integer; cdecl;
    {class} function _GetGET_DEVICES_INPUTS: Integer; cdecl;
    {class} function _GetGET_DEVICES_OUTPUTS: Integer; cdecl;
    {class} function _GetMODE_CURRENT: Integer; cdecl;
    {class} function _GetMODE_INVALID: Integer; cdecl;
    {class} function _GetMODE_IN_CALL: Integer; cdecl;
    {class} function _GetMODE_IN_COMMUNICATION: Integer; cdecl;
    {class} function _GetMODE_NORMAL: Integer; cdecl;
    {class} function _GetMODE_RINGTONE: Integer; cdecl;
    {class} function _GetNUM_STREAMS: Integer; cdecl;
    {class} function _GetPROPERTY_OUTPUT_FRAMES_PER_BUFFER: JString; cdecl;
    {class} function _GetPROPERTY_OUTPUT_SAMPLE_RATE: JString; cdecl;
    {class} function _GetPROPERTY_SUPPORT_MIC_NEAR_ULTRASOUND: JString; cdecl;
    {class} function _GetPROPERTY_SUPPORT_SPEAKER_NEAR_ULTRASOUND: JString; cdecl;
    {class} function _GetRINGER_MODE_CHANGED_ACTION: JString; cdecl;
    {class} function _GetRINGER_MODE_NORMAL: Integer; cdecl;
    {class} function _GetRINGER_MODE_SILENT: Integer; cdecl;
    {class} function _GetRINGER_MODE_VIBRATE: Integer; cdecl;
    {class} function _GetROUTE_ALL: Integer; cdecl;
    {class} function _GetROUTE_BLUETOOTH: Integer; cdecl;
    {class} function _GetROUTE_BLUETOOTH_A2DP: Integer; cdecl;
    {class} function _GetROUTE_BLUETOOTH_SCO: Integer; cdecl;
    {class} function _GetROUTE_EARPIECE: Integer; cdecl;
    {class} function _GetROUTE_HEADSET: Integer; cdecl;
    {class} function _GetROUTE_SPEAKER: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_CONNECTED: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_CONNECTING: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetSCO_AUDIO_STATE_ERROR: Integer; cdecl;
    {class} function _GetSTREAM_ALARM: Integer; cdecl;
    {class} function _GetSTREAM_DTMF: Integer; cdecl;
    {class} function _GetSTREAM_MUSIC: Integer; cdecl;
    {class} function _GetSTREAM_NOTIFICATION: Integer; cdecl;
    {class} function _GetSTREAM_RING: Integer; cdecl;
    {class} function _GetSTREAM_SYSTEM: Integer; cdecl;
    {class} function _GetSTREAM_VOICE_CALL: Integer; cdecl;
    {class} function _GetUSE_DEFAULT_STREAM_TYPE: Integer; cdecl;
    {class} function _GetVIBRATE_SETTING_CHANGED_ACTION: JString; cdecl;
    {class} function _GetVIBRATE_SETTING_OFF: Integer; cdecl;
    {class} function _GetVIBRATE_SETTING_ON: Integer; cdecl;
    {class} function _GetVIBRATE_SETTING_ONLY_SILENT: Integer; cdecl;
    {class} function _GetVIBRATE_TYPE_NOTIFICATION: Integer; cdecl;
    {class} function _GetVIBRATE_TYPE_RINGER: Integer; cdecl;
    {class} property ACTION_AUDIO_BECOMING_NOISY: JString read _GetACTION_AUDIO_BECOMING_NOISY;
    {class} property ACTION_HDMI_AUDIO_PLUG: JString read _GetACTION_HDMI_AUDIO_PLUG;
    {class} property ACTION_HEADSET_PLUG: JString read _GetACTION_HEADSET_PLUG;
    {class} property ACTION_SCO_AUDIO_STATE_CHANGED: JString read _GetACTION_SCO_AUDIO_STATE_CHANGED;
    {class} property ACTION_SCO_AUDIO_STATE_UPDATED: JString read _GetACTION_SCO_AUDIO_STATE_UPDATED;
    {class} property ADJUST_LOWER: Integer read _GetADJUST_LOWER;
    {class} property ADJUST_MUTE: Integer read _GetADJUST_MUTE;
    {class} property ADJUST_RAISE: Integer read _GetADJUST_RAISE;
    {class} property ADJUST_SAME: Integer read _GetADJUST_SAME;
    {class} property ADJUST_TOGGLE_MUTE: Integer read _GetADJUST_TOGGLE_MUTE;
    {class} property ADJUST_UNMUTE: Integer read _GetADJUST_UNMUTE;
    {class} property AUDIOFOCUS_GAIN: Integer read _GetAUDIOFOCUS_GAIN;
    {class} property AUDIOFOCUS_GAIN_TRANSIENT: Integer read _GetAUDIOFOCUS_GAIN_TRANSIENT;
    {class} property AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE: Integer read _GetAUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE;
    {class} property AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK: Integer read _GetAUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK;
    {class} property AUDIOFOCUS_LOSS: Integer read _GetAUDIOFOCUS_LOSS;
    {class} property AUDIOFOCUS_LOSS_TRANSIENT: Integer read _GetAUDIOFOCUS_LOSS_TRANSIENT;
    {class} property AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK: Integer read _GetAUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK;
    {class} property AUDIOFOCUS_REQUEST_FAILED: Integer read _GetAUDIOFOCUS_REQUEST_FAILED;
    {class} property AUDIOFOCUS_REQUEST_GRANTED: Integer read _GetAUDIOFOCUS_REQUEST_GRANTED;
    {class} property AUDIO_SESSION_ID_GENERATE: Integer read _GetAUDIO_SESSION_ID_GENERATE;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property EXTRA_AUDIO_PLUG_STATE: JString read _GetEXTRA_AUDIO_PLUG_STATE;
    {class} property EXTRA_ENCODINGS: JString read _GetEXTRA_ENCODINGS;
    {class} property EXTRA_MAX_CHANNEL_COUNT: JString read _GetEXTRA_MAX_CHANNEL_COUNT;
    {class} property EXTRA_RINGER_MODE: JString read _GetEXTRA_RINGER_MODE;
    {class} property EXTRA_SCO_AUDIO_PREVIOUS_STATE: JString read _GetEXTRA_SCO_AUDIO_PREVIOUS_STATE;
    {class} property EXTRA_SCO_AUDIO_STATE: JString read _GetEXTRA_SCO_AUDIO_STATE;
    {class} property EXTRA_VIBRATE_SETTING: JString read _GetEXTRA_VIBRATE_SETTING;
    {class} property EXTRA_VIBRATE_TYPE: JString read _GetEXTRA_VIBRATE_TYPE;
    {class} property FLAG_ALLOW_RINGER_MODES: Integer read _GetFLAG_ALLOW_RINGER_MODES;
    {class} property FLAG_PLAY_SOUND: Integer read _GetFLAG_PLAY_SOUND;
    {class} property FLAG_REMOVE_SOUND_AND_VIBRATE: Integer read _GetFLAG_REMOVE_SOUND_AND_VIBRATE;
    {class} property FLAG_SHOW_UI: Integer read _GetFLAG_SHOW_UI;
    {class} property FLAG_VIBRATE: Integer read _GetFLAG_VIBRATE;
    {class} property FX_FOCUS_NAVIGATION_DOWN: Integer read _GetFX_FOCUS_NAVIGATION_DOWN;
    {class} property FX_FOCUS_NAVIGATION_LEFT: Integer read _GetFX_FOCUS_NAVIGATION_LEFT;
    {class} property FX_FOCUS_NAVIGATION_RIGHT: Integer read _GetFX_FOCUS_NAVIGATION_RIGHT;
    {class} property FX_FOCUS_NAVIGATION_UP: Integer read _GetFX_FOCUS_NAVIGATION_UP;
    {class} property FX_KEYPRESS_DELETE: Integer read _GetFX_KEYPRESS_DELETE;
    {class} property FX_KEYPRESS_INVALID: Integer read _GetFX_KEYPRESS_INVALID;
    {class} property FX_KEYPRESS_RETURN: Integer read _GetFX_KEYPRESS_RETURN;
    {class} property FX_KEYPRESS_SPACEBAR: Integer read _GetFX_KEYPRESS_SPACEBAR;
    {class} property FX_KEYPRESS_STANDARD: Integer read _GetFX_KEYPRESS_STANDARD;
    {class} property FX_KEY_CLICK: Integer read _GetFX_KEY_CLICK;
    {class} property GET_DEVICES_ALL: Integer read _GetGET_DEVICES_ALL;
    {class} property GET_DEVICES_INPUTS: Integer read _GetGET_DEVICES_INPUTS;
    {class} property GET_DEVICES_OUTPUTS: Integer read _GetGET_DEVICES_OUTPUTS;
    {class} property MODE_CURRENT: Integer read _GetMODE_CURRENT;
    {class} property MODE_INVALID: Integer read _GetMODE_INVALID;
    {class} property MODE_IN_CALL: Integer read _GetMODE_IN_CALL;
    {class} property MODE_IN_COMMUNICATION: Integer read _GetMODE_IN_COMMUNICATION;
    {class} property MODE_NORMAL: Integer read _GetMODE_NORMAL;
    {class} property MODE_RINGTONE: Integer read _GetMODE_RINGTONE;
    {class} property NUM_STREAMS: Integer read _GetNUM_STREAMS;
    {class} property PROPERTY_OUTPUT_FRAMES_PER_BUFFER: JString read _GetPROPERTY_OUTPUT_FRAMES_PER_BUFFER;
    {class} property PROPERTY_OUTPUT_SAMPLE_RATE: JString read _GetPROPERTY_OUTPUT_SAMPLE_RATE;
    {class} property PROPERTY_SUPPORT_MIC_NEAR_ULTRASOUND: JString read _GetPROPERTY_SUPPORT_MIC_NEAR_ULTRASOUND;
    {class} property PROPERTY_SUPPORT_SPEAKER_NEAR_ULTRASOUND: JString read _GetPROPERTY_SUPPORT_SPEAKER_NEAR_ULTRASOUND;
    {class} property RINGER_MODE_CHANGED_ACTION: JString read _GetRINGER_MODE_CHANGED_ACTION;
    {class} property RINGER_MODE_NORMAL: Integer read _GetRINGER_MODE_NORMAL;
    {class} property RINGER_MODE_SILENT: Integer read _GetRINGER_MODE_SILENT;
    {class} property RINGER_MODE_VIBRATE: Integer read _GetRINGER_MODE_VIBRATE;
    {class} property ROUTE_ALL: Integer read _GetROUTE_ALL;
    {class} property ROUTE_BLUETOOTH: Integer read _GetROUTE_BLUETOOTH;
    {class} property ROUTE_BLUETOOTH_A2DP: Integer read _GetROUTE_BLUETOOTH_A2DP;
    {class} property ROUTE_BLUETOOTH_SCO: Integer read _GetROUTE_BLUETOOTH_SCO;
    {class} property ROUTE_EARPIECE: Integer read _GetROUTE_EARPIECE;
    {class} property ROUTE_HEADSET: Integer read _GetROUTE_HEADSET;
    {class} property ROUTE_SPEAKER: Integer read _GetROUTE_SPEAKER;
    {class} property SCO_AUDIO_STATE_CONNECTED: Integer read _GetSCO_AUDIO_STATE_CONNECTED;
    {class} property SCO_AUDIO_STATE_CONNECTING: Integer read _GetSCO_AUDIO_STATE_CONNECTING;
    {class} property SCO_AUDIO_STATE_DISCONNECTED: Integer read _GetSCO_AUDIO_STATE_DISCONNECTED;
    {class} property SCO_AUDIO_STATE_ERROR: Integer read _GetSCO_AUDIO_STATE_ERROR;
    {class} property STREAM_ALARM: Integer read _GetSTREAM_ALARM;
    {class} property STREAM_DTMF: Integer read _GetSTREAM_DTMF;
    {class} property STREAM_MUSIC: Integer read _GetSTREAM_MUSIC;
    {class} property STREAM_NOTIFICATION: Integer read _GetSTREAM_NOTIFICATION;
    {class} property STREAM_RING: Integer read _GetSTREAM_RING;
    {class} property STREAM_SYSTEM: Integer read _GetSTREAM_SYSTEM;
    {class} property STREAM_VOICE_CALL: Integer read _GetSTREAM_VOICE_CALL;
    {class} property USE_DEFAULT_STREAM_TYPE: Integer read _GetUSE_DEFAULT_STREAM_TYPE;
    {class} property VIBRATE_SETTING_CHANGED_ACTION: JString read _GetVIBRATE_SETTING_CHANGED_ACTION;
    {class} property VIBRATE_SETTING_OFF: Integer read _GetVIBRATE_SETTING_OFF;
    {class} property VIBRATE_SETTING_ON: Integer read _GetVIBRATE_SETTING_ON;
    {class} property VIBRATE_SETTING_ONLY_SILENT: Integer read _GetVIBRATE_SETTING_ONLY_SILENT;
    {class} property VIBRATE_TYPE_NOTIFICATION: Integer read _GetVIBRATE_TYPE_NOTIFICATION;
    {class} property VIBRATE_TYPE_RINGER: Integer read _GetVIBRATE_TYPE_RINGER;
  end;

  [JavaSignature('android/media/AudioManager')]
  JAudioManager = interface(JObject)
    ['{C02E6757-33D6-4A65-99F4-F658813EF426}']
    function abandonAudioFocus(l: JAudioManager_OnAudioFocusChangeListener): Integer; cdecl;
    procedure adjustStreamVolume(streamType: Integer; direction: Integer; flags: Integer); cdecl;
    procedure adjustSuggestedStreamVolume(direction: Integer; suggestedStreamType: Integer; flags: Integer); cdecl;
    procedure adjustVolume(direction: Integer; flags: Integer); cdecl;
    procedure dispatchMediaKeyEvent(keyEvent: JKeyEvent); cdecl;
    function generateAudioSessionId: Integer; cdecl;
    function getDevices(flags: Integer): TJavaObjectArray<JAudioDeviceInfo>; cdecl;
    function getMode: Integer; cdecl;
    function getParameters(keys: JString): JString; cdecl;
    function getProperty(key: JString): JString; cdecl;
    function getRingerMode: Integer; cdecl;
    function getRouting(mode: Integer): Integer; cdecl;//Deprecated
    function getStreamMaxVolume(streamType: Integer): Integer; cdecl;
    function getStreamVolume(streamType: Integer): Integer; cdecl;
    function getVibrateSetting(vibrateType: Integer): Integer; cdecl;//Deprecated
    function isBluetoothA2dpOn: Boolean; cdecl;
    function isBluetoothScoAvailableOffCall: Boolean; cdecl;
    function isBluetoothScoOn: Boolean; cdecl;
    function isMicrophoneMute: Boolean; cdecl;
    function isMusicActive: Boolean; cdecl;
    function isSpeakerphoneOn: Boolean; cdecl;
    function isStreamMute(streamType: Integer): Boolean; cdecl;
    function isVolumeFixed: Boolean; cdecl;
    function isWiredHeadsetOn: Boolean; cdecl;//Deprecated
    procedure loadSoundEffects; cdecl;
    procedure playSoundEffect(effectType: Integer); cdecl; overload;
    procedure playSoundEffect(effectType: Integer; volume: Single); cdecl; overload;
    procedure registerAudioDeviceCallback(callback: JAudioDeviceCallback; handler: JHandler); cdecl;
    procedure registerMediaButtonEventReceiver(eventReceiver: JComponentName); cdecl; overload;//Deprecated
    procedure registerMediaButtonEventReceiver(eventReceiver: JPendingIntent); cdecl; overload;//Deprecated
    procedure registerRemoteControlClient(rcClient: JRemoteControlClient); cdecl;//Deprecated
    function registerRemoteController(rctlr: JRemoteController): Boolean; cdecl;//Deprecated
    function requestAudioFocus(l: JAudioManager_OnAudioFocusChangeListener; streamType: Integer; durationHint: Integer): Integer; cdecl;
    procedure setBluetoothA2dpOn(on: Boolean); cdecl;//Deprecated
    procedure setBluetoothScoOn(on: Boolean); cdecl;
    procedure setMicrophoneMute(on: Boolean); cdecl;
    procedure setMode(mode: Integer); cdecl;
    procedure setParameters(keyValuePairs: JString); cdecl;
    procedure setRingerMode(ringerMode: Integer); cdecl;
    procedure setRouting(mode: Integer; routes: Integer; mask: Integer); cdecl;//Deprecated
    procedure setSpeakerphoneOn(on: Boolean); cdecl;
    procedure setStreamMute(streamType: Integer; state: Boolean); cdecl;//Deprecated
    procedure setStreamSolo(streamType: Integer; state: Boolean); cdecl;//Deprecated
    procedure setStreamVolume(streamType: Integer; index: Integer; flags: Integer); cdecl;
    procedure setVibrateSetting(vibrateType: Integer; vibrateSetting: Integer); cdecl;//Deprecated
    procedure setWiredHeadsetOn(on: Boolean); cdecl;//Deprecated
    function shouldVibrate(vibrateType: Integer): Boolean; cdecl;//Deprecated
    procedure startBluetoothSco; cdecl;
    procedure stopBluetoothSco; cdecl;
    procedure unloadSoundEffects; cdecl;
    procedure unregisterAudioDeviceCallback(callback: JAudioDeviceCallback); cdecl;
    procedure unregisterMediaButtonEventReceiver(eventReceiver: JComponentName); cdecl; overload;//Deprecated
    procedure unregisterMediaButtonEventReceiver(eventReceiver: JPendingIntent); cdecl; overload;//Deprecated
    procedure unregisterRemoteControlClient(rcClient: JRemoteControlClient); cdecl;//Deprecated
    procedure unregisterRemoteController(rctlr: JRemoteController); cdecl;//Deprecated
  end;
  TJAudioManager = class(TJavaGenericImport<JAudioManagerClass, JAudioManager>) end;

  JAudioManager_OnAudioFocusChangeListenerClass = interface(IJavaClass)
    ['{D79C0846-0031-48D5-9EB0-A995A3D034A2}']
  end;

  [JavaSignature('android/media/AudioManager$OnAudioFocusChangeListener')]
  JAudioManager_OnAudioFocusChangeListener = interface(IJavaInstance)
    ['{F6FE80F4-5596-4E41-B718-BFEEEDBFAE47}']
    procedure onAudioFocusChange(focusChange: Integer); cdecl;
  end;
  TJAudioManager_OnAudioFocusChangeListener = class(TJavaGenericImport<JAudioManager_OnAudioFocusChangeListenerClass, JAudioManager_OnAudioFocusChangeListener>) end;

  JAudioRecordClass = interface(JObjectClass)
    ['{52854509-E981-4598-90BD-591E322B9E11}']
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetREAD_BLOCKING: Integer; cdecl;
    {class} function _GetREAD_NON_BLOCKING: Integer; cdecl;
    {class} function _GetRECORDSTATE_RECORDING: Integer; cdecl;
    {class} function _GetRECORDSTATE_STOPPED: Integer; cdecl;
    {class} function _GetSTATE_INITIALIZED: Integer; cdecl;
    {class} function _GetSTATE_UNINITIALIZED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function init(audioSource: Integer; sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer; bufferSizeInBytes: Integer): JAudioRecord; cdecl;
    {class} function getMinBufferSize(sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer): Integer; cdecl;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property READ_BLOCKING: Integer read _GetREAD_BLOCKING;
    {class} property READ_NON_BLOCKING: Integer read _GetREAD_NON_BLOCKING;
    {class} property RECORDSTATE_RECORDING: Integer read _GetRECORDSTATE_RECORDING;
    {class} property RECORDSTATE_STOPPED: Integer read _GetRECORDSTATE_STOPPED;
    {class} property STATE_INITIALIZED: Integer read _GetSTATE_INITIALIZED;
    {class} property STATE_UNINITIALIZED: Integer read _GetSTATE_UNINITIALIZED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/media/AudioRecord')]
  JAudioRecord = interface(JObject)
    ['{512F5ADB-2452-441B-8FA6-C45F9A4449C0}']
    procedure addOnRoutingChangedListener(listener: JAudioRecord_OnRoutingChangedListener; handler: JHandler); cdecl;
    function getAudioFormat: Integer; cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getAudioSource: Integer; cdecl;
    function getBufferSizeInFrames: Integer; cdecl;
    function getChannelConfiguration: Integer; cdecl;
    function getChannelCount: Integer; cdecl;
    function getFormat: JAudioFormat; cdecl;
    function getNotificationMarkerPosition: Integer; cdecl;
    function getPositionNotificationPeriod: Integer; cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRecordingState: Integer; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    function getSampleRate: Integer; cdecl;
    function getState: Integer; cdecl;
    function read(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer; readMode: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer; readMode: Integer): Integer; cdecl; overload;
    function read(audioData: TJavaArray<Single>; offsetInFloats: Integer; sizeInFloats: Integer; readMode: Integer): Integer; cdecl; overload;
    function read(audioBuffer: JByteBuffer; sizeInBytes: Integer): Integer; cdecl; overload;
    function read(audioBuffer: JByteBuffer; sizeInBytes: Integer; readMode: Integer): Integer; cdecl; overload;
    procedure release; cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioRecord_OnRoutingChangedListener); cdecl;
    function setNotificationMarkerPosition(markerInFrames: Integer): Integer; cdecl;
    function setPositionNotificationPeriod(periodInFrames: Integer): Integer; cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
    procedure setRecordPositionUpdateListener(listener: JAudioRecord_OnRecordPositionUpdateListener); cdecl; overload;
    procedure setRecordPositionUpdateListener(listener: JAudioRecord_OnRecordPositionUpdateListener; handler: JHandler); cdecl; overload;
    procedure startRecording; cdecl; overload;
    procedure startRecording(syncEvent: JMediaSyncEvent); cdecl; overload;
    procedure stop; cdecl;
  end;
  TJAudioRecord = class(TJavaGenericImport<JAudioRecordClass, JAudioRecord>) end;

  JAudioRecord_BuilderClass = interface(JObjectClass)
    ['{76A6E9D4-566B-49BD-BF4E-2CAA4C17525B}']
    {class} function init: JAudioRecord_Builder; cdecl;
  end;

  [JavaSignature('android/media/AudioRecord$Builder')]
  JAudioRecord_Builder = interface(JObject)
    ['{BF486BE7-BE8A-48E5-A9FC-B7F22D0B6115}']
    function build: JAudioRecord; cdecl;
    function setAudioFormat(format: JAudioFormat): JAudioRecord_Builder; cdecl;
    function setAudioSource(source: Integer): JAudioRecord_Builder; cdecl;
    function setBufferSizeInBytes(bufferSizeInBytes: Integer): JAudioRecord_Builder; cdecl;
  end;
  TJAudioRecord_Builder = class(TJavaGenericImport<JAudioRecord_BuilderClass, JAudioRecord_Builder>) end;

  JAudioRecord_OnRecordPositionUpdateListenerClass = interface(IJavaClass)
    ['{61883778-37ED-4EE0-9039-ED97AA45C8FD}']
  end;

  [JavaSignature('android/media/AudioRecord$OnRecordPositionUpdateListener')]
  JAudioRecord_OnRecordPositionUpdateListener = interface(IJavaInstance)
    ['{C465EEDB-9E94-4687-B81D-9A0194874655}']
    procedure onMarkerReached(recorder: JAudioRecord); cdecl;
    procedure onPeriodicNotification(recorder: JAudioRecord); cdecl;
  end;
  TJAudioRecord_OnRecordPositionUpdateListener = class(TJavaGenericImport<JAudioRecord_OnRecordPositionUpdateListenerClass, JAudioRecord_OnRecordPositionUpdateListener>) end;

  JAudioRecord_OnRoutingChangedListenerClass = interface(IJavaClass)
    ['{468513AE-D4D7-4C5A-9C98-C2F3D2A37608}']
  end;

  [JavaSignature('android/media/AudioRecord$OnRoutingChangedListener')]
  JAudioRecord_OnRoutingChangedListener = interface(IJavaInstance)
    ['{67AB498B-237C-4BB1-9451-420F0990C8B5}']
    procedure onRoutingChanged(audioRecord: JAudioRecord); cdecl;
  end;
  TJAudioRecord_OnRoutingChangedListener = class(TJavaGenericImport<JAudioRecord_OnRoutingChangedListenerClass, JAudioRecord_OnRoutingChangedListener>) end;

  JAudioTimestampClass = interface(JObjectClass)
    ['{3E8076C1-696E-4380-8944-188F9A35A1D1}']
    {class} function init: JAudioTimestamp; cdecl;
  end;

  [JavaSignature('android/media/AudioTimestamp')]
  JAudioTimestamp = interface(JObject)
    ['{AB157175-DD33-422D-80A3-EBF292D59A04}']
    function _GetframePosition: Int64; cdecl;
    procedure _SetframePosition(Value: Int64); cdecl;
    function _GetnanoTime: Int64; cdecl;
    procedure _SetnanoTime(Value: Int64); cdecl;
    property framePosition: Int64 read _GetframePosition write _SetframePosition;
    property nanoTime: Int64 read _GetnanoTime write _SetnanoTime;
  end;
  TJAudioTimestamp = class(TJavaGenericImport<JAudioTimestampClass, JAudioTimestamp>) end;

  JAudioTrackClass = interface(JObjectClass)
    ['{F1B69999-E4BF-4586-B05F-708A2172FC51}']
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetMODE_STATIC: Integer; cdecl;
    {class} function _GetMODE_STREAM: Integer; cdecl;
    {class} function _GetPLAYSTATE_PAUSED: Integer; cdecl;
    {class} function _GetPLAYSTATE_PLAYING: Integer; cdecl;
    {class} function _GetPLAYSTATE_STOPPED: Integer; cdecl;
    {class} function _GetSTATE_INITIALIZED: Integer; cdecl;
    {class} function _GetSTATE_NO_STATIC_DATA: Integer; cdecl;
    {class} function _GetSTATE_UNINITIALIZED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function _GetWRITE_BLOCKING: Integer; cdecl;
    {class} function _GetWRITE_NON_BLOCKING: Integer; cdecl;
    {class} function init(streamType: Integer; sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer; bufferSizeInBytes: Integer; mode: Integer): JAudioTrack; cdecl; overload;
    {class} function init(streamType: Integer; sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer; bufferSizeInBytes: Integer; mode: Integer; sessionId: Integer): JAudioTrack; cdecl; overload;
    {class} function init(attributes: JAudioAttributes; format: JAudioFormat; bufferSizeInBytes: Integer; mode: Integer; sessionId: Integer): JAudioTrack; cdecl; overload;
    {class} function getMaxVolume: Single; cdecl;
    {class} function getMinBufferSize(sampleRateInHz: Integer; channelConfig: Integer; audioFormat: Integer): Integer; cdecl;
    {class} function getMinVolume: Single; cdecl;
    {class} function getNativeOutputSampleRate(streamType: Integer): Integer; cdecl;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property MODE_STATIC: Integer read _GetMODE_STATIC;
    {class} property MODE_STREAM: Integer read _GetMODE_STREAM;
    {class} property PLAYSTATE_PAUSED: Integer read _GetPLAYSTATE_PAUSED;
    {class} property PLAYSTATE_PLAYING: Integer read _GetPLAYSTATE_PLAYING;
    {class} property PLAYSTATE_STOPPED: Integer read _GetPLAYSTATE_STOPPED;
    {class} property STATE_INITIALIZED: Integer read _GetSTATE_INITIALIZED;
    {class} property STATE_NO_STATIC_DATA: Integer read _GetSTATE_NO_STATIC_DATA;
    {class} property STATE_UNINITIALIZED: Integer read _GetSTATE_UNINITIALIZED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property WRITE_BLOCKING: Integer read _GetWRITE_BLOCKING;
    {class} property WRITE_NON_BLOCKING: Integer read _GetWRITE_NON_BLOCKING;
  end;

  [JavaSignature('android/media/AudioTrack')]
  JAudioTrack = interface(JObject)
    ['{84D3E8CB-9DDC-4DCB-902C-43C9AECE0830}']
    procedure addOnRoutingChangedListener(listener: JAudioTrack_OnRoutingChangedListener; handler: JHandler); cdecl;
    function attachAuxEffect(effectId: Integer): Integer; cdecl;
    procedure flush; cdecl;
    function getAudioFormat: Integer; cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getBufferSizeInFrames: Integer; cdecl;
    function getChannelConfiguration: Integer; cdecl;
    function getChannelCount: Integer; cdecl;
    function getFormat: JAudioFormat; cdecl;
    function getNotificationMarkerPosition: Integer; cdecl;
    function getPlayState: Integer; cdecl;
    function getPlaybackHeadPosition: Integer; cdecl;
    function getPlaybackParams: JPlaybackParams; cdecl;
    function getPlaybackRate: Integer; cdecl;
    function getPositionNotificationPeriod: Integer; cdecl;
    function getPreferredDevice: JAudioDeviceInfo; cdecl;
    function getRoutedDevice: JAudioDeviceInfo; cdecl;
    function getSampleRate: Integer; cdecl;
    function getState: Integer; cdecl;
    function getStreamType: Integer; cdecl;
    function getTimestamp(timestamp: JAudioTimestamp): Boolean; cdecl;
    procedure pause; cdecl;
    procedure play; cdecl;
    procedure release; cdecl;
    function reloadStaticData: Integer; cdecl;
    procedure removeOnRoutingChangedListener(listener: JAudioTrack_OnRoutingChangedListener); cdecl;
    function setAuxEffectSendLevel(level: Single): Integer; cdecl;
    function setLoopPoints(startInFrames: Integer; endInFrames: Integer; loopCount: Integer): Integer; cdecl;
    function setNotificationMarkerPosition(markerInFrames: Integer): Integer; cdecl;
    function setPlaybackHeadPosition(positionInFrames: Integer): Integer; cdecl;
    procedure setPlaybackParams(params: JPlaybackParams); cdecl;
    procedure setPlaybackPositionUpdateListener(listener: JAudioTrack_OnPlaybackPositionUpdateListener); cdecl; overload;
    procedure setPlaybackPositionUpdateListener(listener: JAudioTrack_OnPlaybackPositionUpdateListener; handler: JHandler); cdecl; overload;
    function setPlaybackRate(sampleRateInHz: Integer): Integer; cdecl;
    function setPositionNotificationPeriod(periodInFrames: Integer): Integer; cdecl;
    function setPreferredDevice(deviceInfo: JAudioDeviceInfo): Boolean; cdecl;
    function setStereoVolume(leftGain: Single; rightGain: Single): Integer; cdecl;//Deprecated
    function setVolume(gain: Single): Integer; cdecl;
    procedure stop; cdecl;
    function write(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<Byte>; offsetInBytes: Integer; sizeInBytes: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<SmallInt>; offsetInShorts: Integer; sizeInShorts: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: TJavaArray<Single>; offsetInFloats: Integer; sizeInFloats: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: JByteBuffer; sizeInBytes: Integer; writeMode: Integer): Integer; cdecl; overload;
    function write(audioData: JByteBuffer; sizeInBytes: Integer; writeMode: Integer; timestamp: Int64): Integer; cdecl; overload;
  end;
  TJAudioTrack = class(TJavaGenericImport<JAudioTrackClass, JAudioTrack>) end;

  JAudioTrack_BuilderClass = interface(JObjectClass)
    ['{0F1ED02C-DB93-4597-B733-1A0398EBBBEF}']
    {class} function init: JAudioTrack_Builder; cdecl;
  end;

  [JavaSignature('android/media/AudioTrack$Builder')]
  JAudioTrack_Builder = interface(JObject)
    ['{6D4E424C-4AC6-4F46-89CF-A08F472B5B10}']
    function build: JAudioTrack; cdecl;
    function setAudioAttributes(attributes: JAudioAttributes): JAudioTrack_Builder; cdecl;
    function setAudioFormat(format: JAudioFormat): JAudioTrack_Builder; cdecl;
    function setBufferSizeInBytes(bufferSizeInBytes: Integer): JAudioTrack_Builder; cdecl;
    function setSessionId(sessionId: Integer): JAudioTrack_Builder; cdecl;
    function setTransferMode(mode: Integer): JAudioTrack_Builder; cdecl;
  end;
  TJAudioTrack_Builder = class(TJavaGenericImport<JAudioTrack_BuilderClass, JAudioTrack_Builder>) end;

  JAudioTrack_OnPlaybackPositionUpdateListenerClass = interface(IJavaClass)
    ['{8D53A876-1D82-45AE-87A9-26C1E7CF5736}']
  end;

  [JavaSignature('android/media/AudioTrack$OnPlaybackPositionUpdateListener')]
  JAudioTrack_OnPlaybackPositionUpdateListener = interface(IJavaInstance)
    ['{71399D16-1559-485C-900C-D25CFD06E25B}']
    procedure onMarkerReached(track: JAudioTrack); cdecl;
    procedure onPeriodicNotification(track: JAudioTrack); cdecl;
  end;
  TJAudioTrack_OnPlaybackPositionUpdateListener = class(TJavaGenericImport<JAudioTrack_OnPlaybackPositionUpdateListenerClass, JAudioTrack_OnPlaybackPositionUpdateListener>) end;

  JAudioTrack_OnRoutingChangedListenerClass = interface(IJavaClass)
    ['{829B450B-0CC6-4FD8-A7DE-776EC46D97BE}']
  end;

  [JavaSignature('android/media/AudioTrack$OnRoutingChangedListener')]
  JAudioTrack_OnRoutingChangedListener = interface(IJavaInstance)
    ['{C5DE60E1-8A6B-4607-AA9B-EFBF0ACB5C35}']
    procedure onRoutingChanged(audioTrack: JAudioTrack); cdecl;
  end;
  TJAudioTrack_OnRoutingChangedListener = class(TJavaGenericImport<JAudioTrack_OnRoutingChangedListenerClass, JAudioTrack_OnRoutingChangedListener>) end;

  JCamcorderProfileClass = interface(JObjectClass)
    ['{74CB0E77-4E93-4724-A3AA-EEE1C29C90AD}']
    {class} function _GetQUALITY_1080P: Integer; cdecl;
    {class} function _GetQUALITY_2160P: Integer; cdecl;
    {class} function _GetQUALITY_480P: Integer; cdecl;
    {class} function _GetQUALITY_720P: Integer; cdecl;
    {class} function _GetQUALITY_CIF: Integer; cdecl;
    {class} function _GetQUALITY_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_1080P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_2160P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_480P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_720P: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_HIGH_SPEED_LOW: Integer; cdecl;
    {class} function _GetQUALITY_LOW: Integer; cdecl;
    {class} function _GetQUALITY_QCIF: Integer; cdecl;
    {class} function _GetQUALITY_QVGA: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_1080P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_2160P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_480P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_720P: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_CIF: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_LOW: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_QCIF: Integer; cdecl;
    {class} function _GetQUALITY_TIME_LAPSE_QVGA: Integer; cdecl;
    {class} function &get(quality: Integer): JCamcorderProfile; cdecl; overload;
    {class} function &get(cameraId: Integer; quality: Integer): JCamcorderProfile; cdecl; overload;
    {class} function hasProfile(quality: Integer): Boolean; cdecl; overload;
    {class} function hasProfile(cameraId: Integer; quality: Integer): Boolean; cdecl; overload;
    {class} property QUALITY_1080P: Integer read _GetQUALITY_1080P;
    {class} property QUALITY_2160P: Integer read _GetQUALITY_2160P;
    {class} property QUALITY_480P: Integer read _GetQUALITY_480P;
    {class} property QUALITY_720P: Integer read _GetQUALITY_720P;
    {class} property QUALITY_CIF: Integer read _GetQUALITY_CIF;
    {class} property QUALITY_HIGH: Integer read _GetQUALITY_HIGH;
    {class} property QUALITY_HIGH_SPEED_1080P: Integer read _GetQUALITY_HIGH_SPEED_1080P;
    {class} property QUALITY_HIGH_SPEED_2160P: Integer read _GetQUALITY_HIGH_SPEED_2160P;
    {class} property QUALITY_HIGH_SPEED_480P: Integer read _GetQUALITY_HIGH_SPEED_480P;
    {class} property QUALITY_HIGH_SPEED_720P: Integer read _GetQUALITY_HIGH_SPEED_720P;
    {class} property QUALITY_HIGH_SPEED_HIGH: Integer read _GetQUALITY_HIGH_SPEED_HIGH;
    {class} property QUALITY_HIGH_SPEED_LOW: Integer read _GetQUALITY_HIGH_SPEED_LOW;
    {class} property QUALITY_LOW: Integer read _GetQUALITY_LOW;
    {class} property QUALITY_QCIF: Integer read _GetQUALITY_QCIF;
    {class} property QUALITY_QVGA: Integer read _GetQUALITY_QVGA;
    {class} property QUALITY_TIME_LAPSE_1080P: Integer read _GetQUALITY_TIME_LAPSE_1080P;
    {class} property QUALITY_TIME_LAPSE_2160P: Integer read _GetQUALITY_TIME_LAPSE_2160P;
    {class} property QUALITY_TIME_LAPSE_480P: Integer read _GetQUALITY_TIME_LAPSE_480P;
    {class} property QUALITY_TIME_LAPSE_720P: Integer read _GetQUALITY_TIME_LAPSE_720P;
    {class} property QUALITY_TIME_LAPSE_CIF: Integer read _GetQUALITY_TIME_LAPSE_CIF;
    {class} property QUALITY_TIME_LAPSE_HIGH: Integer read _GetQUALITY_TIME_LAPSE_HIGH;
    {class} property QUALITY_TIME_LAPSE_LOW: Integer read _GetQUALITY_TIME_LAPSE_LOW;
    {class} property QUALITY_TIME_LAPSE_QCIF: Integer read _GetQUALITY_TIME_LAPSE_QCIF;
    {class} property QUALITY_TIME_LAPSE_QVGA: Integer read _GetQUALITY_TIME_LAPSE_QVGA;
  end;

  [JavaSignature('android/media/CamcorderProfile')]
  JCamcorderProfile = interface(JObject)
    ['{2957E3CA-A488-4829-84DE-F15DEA6F7FFB}']
    function _GetaudioBitRate: Integer; cdecl;
    procedure _SetaudioBitRate(Value: Integer); cdecl;
    function _GetaudioChannels: Integer; cdecl;
    procedure _SetaudioChannels(Value: Integer); cdecl;
    function _GetaudioCodec: Integer; cdecl;
    procedure _SetaudioCodec(Value: Integer); cdecl;
    function _GetaudioSampleRate: Integer; cdecl;
    procedure _SetaudioSampleRate(Value: Integer); cdecl;
    function _Getduration: Integer; cdecl;
    procedure _Setduration(Value: Integer); cdecl;
    function _GetfileFormat: Integer; cdecl;
    procedure _SetfileFormat(Value: Integer); cdecl;
    function _Getquality: Integer; cdecl;
    procedure _Setquality(Value: Integer); cdecl;
    function _GetvideoBitRate: Integer; cdecl;
    procedure _SetvideoBitRate(Value: Integer); cdecl;
    function _GetvideoCodec: Integer; cdecl;
    procedure _SetvideoCodec(Value: Integer); cdecl;
    function _GetvideoFrameHeight: Integer; cdecl;
    procedure _SetvideoFrameHeight(Value: Integer); cdecl;
    function _GetvideoFrameRate: Integer; cdecl;
    procedure _SetvideoFrameRate(Value: Integer); cdecl;
    function _GetvideoFrameWidth: Integer; cdecl;
    procedure _SetvideoFrameWidth(Value: Integer); cdecl;
    property audioBitRate: Integer read _GetaudioBitRate write _SetaudioBitRate;
    property audioChannels: Integer read _GetaudioChannels write _SetaudioChannels;
    property audioCodec: Integer read _GetaudioCodec write _SetaudioCodec;
    property audioSampleRate: Integer read _GetaudioSampleRate write _SetaudioSampleRate;
    property duration: Integer read _Getduration write _Setduration;
    property fileFormat: Integer read _GetfileFormat write _SetfileFormat;
    property quality: Integer read _Getquality write _Setquality;
    property videoBitRate: Integer read _GetvideoBitRate write _SetvideoBitRate;
    property videoCodec: Integer read _GetvideoCodec write _SetvideoCodec;
    property videoFrameHeight: Integer read _GetvideoFrameHeight write _SetvideoFrameHeight;
    property videoFrameRate: Integer read _GetvideoFrameRate write _SetvideoFrameRate;
    property videoFrameWidth: Integer read _GetvideoFrameWidth write _SetvideoFrameWidth;
  end;
  TJCamcorderProfile = class(TJavaGenericImport<JCamcorderProfileClass, JCamcorderProfile>) end;

  JCameraProfileClass = interface(JObjectClass)
    ['{60E4B807-EC20-448E-86E5-DC8FE661FCEF}']
    {class} function _GetQUALITY_HIGH: Integer; cdecl;
    {class} function _GetQUALITY_LOW: Integer; cdecl;
    {class} function _GetQUALITY_MEDIUM: Integer; cdecl;
    {class} function init: JCameraProfile; cdecl;
    {class} function getJpegEncodingQualityParameter(quality: Integer): Integer; cdecl; overload;
    {class} function getJpegEncodingQualityParameter(cameraId: Integer; quality: Integer): Integer; cdecl; overload;
    {class} property QUALITY_HIGH: Integer read _GetQUALITY_HIGH;
    {class} property QUALITY_LOW: Integer read _GetQUALITY_LOW;
    {class} property QUALITY_MEDIUM: Integer read _GetQUALITY_MEDIUM;
  end;

  [JavaSignature('android/media/CameraProfile')]
  JCameraProfile = interface(JObject)
    ['{D149134A-7FEF-4216-B46B-F7E2E2F3C919}']
  end;
  TJCameraProfile = class(TJavaGenericImport<JCameraProfileClass, JCameraProfile>) end;

  JMediaDrmExceptionClass = interface(JExceptionClass)
    ['{2E43AF16-EDE3-44E4-B99F-46BC9B38C242}']
    {class} function init(detailMessage: JString): JMediaDrmException; cdecl;
  end;

  [JavaSignature('android/media/MediaDrmException')]
  JMediaDrmException = interface(JException)
    ['{3E068C5A-026A-4E02-BCA4-C37659511F93}']
  end;
  TJMediaDrmException = class(TJavaGenericImport<JMediaDrmExceptionClass, JMediaDrmException>) end;

  JDeniedByServerExceptionClass = interface(JMediaDrmExceptionClass)
    ['{A810E72B-E334-42EC-BAC0-715B71FE2412}']
    {class} function init(detailMessage: JString): JDeniedByServerException; cdecl;
  end;

  [JavaSignature('android/media/DeniedByServerException')]
  JDeniedByServerException = interface(JMediaDrmException)
    ['{14535695-BF59-4A81-BC49-E8F5FD94F3BF}']
  end;
  TJDeniedByServerException = class(TJavaGenericImport<JDeniedByServerExceptionClass, JDeniedByServerException>) end;

  JExifInterfaceClass = interface(JObjectClass)
    ['{023B6C11-488A-4106-9562-9DE6A3B3305C}']
    {class} function _GetORIENTATION_FLIP_HORIZONTAL: Integer; cdecl;
    {class} function _GetORIENTATION_FLIP_VERTICAL: Integer; cdecl;
    {class} function _GetORIENTATION_NORMAL: Integer; cdecl;
    {class} function _GetORIENTATION_ROTATE_180: Integer; cdecl;
    {class} function _GetORIENTATION_ROTATE_270: Integer; cdecl;
    {class} function _GetORIENTATION_ROTATE_90: Integer; cdecl;
    {class} function _GetORIENTATION_TRANSPOSE: Integer; cdecl;
    {class} function _GetORIENTATION_TRANSVERSE: Integer; cdecl;
    {class} function _GetORIENTATION_UNDEFINED: Integer; cdecl;
    {class} function _GetTAG_APERTURE: JString; cdecl;
    {class} function _GetTAG_DATETIME: JString; cdecl;
    {class} function _GetTAG_DATETIME_DIGITIZED: JString; cdecl;
    {class} function _GetTAG_EXPOSURE_TIME: JString; cdecl;
    {class} function _GetTAG_FLASH: JString; cdecl;
    {class} function _GetTAG_FOCAL_LENGTH: JString; cdecl;
    {class} function _GetTAG_GPS_ALTITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_ALTITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_DATESTAMP: JString; cdecl;
    {class} function _GetTAG_GPS_LATITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_LATITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_LONGITUDE: JString; cdecl;
    {class} function _GetTAG_GPS_LONGITUDE_REF: JString; cdecl;
    {class} function _GetTAG_GPS_PROCESSING_METHOD: JString; cdecl;
    {class} function _GetTAG_GPS_TIMESTAMP: JString; cdecl;
    {class} function _GetTAG_IMAGE_LENGTH: JString; cdecl;
    {class} function _GetTAG_IMAGE_WIDTH: JString; cdecl;
    {class} function _GetTAG_ISO: JString; cdecl;
    {class} function _GetTAG_MAKE: JString; cdecl;
    {class} function _GetTAG_MODEL: JString; cdecl;
    {class} function _GetTAG_ORIENTATION: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME_DIG: JString; cdecl;
    {class} function _GetTAG_SUBSEC_TIME_ORIG: JString; cdecl;
    {class} function _GetTAG_WHITE_BALANCE: JString; cdecl;
    {class} function _GetWHITEBALANCE_AUTO: Integer; cdecl;
    {class} function _GetWHITEBALANCE_MANUAL: Integer; cdecl;
    {class} function init(filename: JString): JExifInterface; cdecl;
    {class} property ORIENTATION_FLIP_HORIZONTAL: Integer read _GetORIENTATION_FLIP_HORIZONTAL;
    {class} property ORIENTATION_FLIP_VERTICAL: Integer read _GetORIENTATION_FLIP_VERTICAL;
    {class} property ORIENTATION_NORMAL: Integer read _GetORIENTATION_NORMAL;
    {class} property ORIENTATION_ROTATE_180: Integer read _GetORIENTATION_ROTATE_180;
    {class} property ORIENTATION_ROTATE_270: Integer read _GetORIENTATION_ROTATE_270;
    {class} property ORIENTATION_ROTATE_90: Integer read _GetORIENTATION_ROTATE_90;
    {class} property ORIENTATION_TRANSPOSE: Integer read _GetORIENTATION_TRANSPOSE;
    {class} property ORIENTATION_TRANSVERSE: Integer read _GetORIENTATION_TRANSVERSE;
    {class} property ORIENTATION_UNDEFINED: Integer read _GetORIENTATION_UNDEFINED;
    {class} property TAG_APERTURE: JString read _GetTAG_APERTURE;
    {class} property TAG_DATETIME: JString read _GetTAG_DATETIME;
    {class} property TAG_DATETIME_DIGITIZED: JString read _GetTAG_DATETIME_DIGITIZED;
    {class} property TAG_EXPOSURE_TIME: JString read _GetTAG_EXPOSURE_TIME;
    {class} property TAG_FLASH: JString read _GetTAG_FLASH;
    {class} property TAG_FOCAL_LENGTH: JString read _GetTAG_FOCAL_LENGTH;
    {class} property TAG_GPS_ALTITUDE: JString read _GetTAG_GPS_ALTITUDE;
    {class} property TAG_GPS_ALTITUDE_REF: JString read _GetTAG_GPS_ALTITUDE_REF;
    {class} property TAG_GPS_DATESTAMP: JString read _GetTAG_GPS_DATESTAMP;
    {class} property TAG_GPS_LATITUDE: JString read _GetTAG_GPS_LATITUDE;
    {class} property TAG_GPS_LATITUDE_REF: JString read _GetTAG_GPS_LATITUDE_REF;
    {class} property TAG_GPS_LONGITUDE: JString read _GetTAG_GPS_LONGITUDE;
    {class} property TAG_GPS_LONGITUDE_REF: JString read _GetTAG_GPS_LONGITUDE_REF;
    {class} property TAG_GPS_PROCESSING_METHOD: JString read _GetTAG_GPS_PROCESSING_METHOD;
    {class} property TAG_GPS_TIMESTAMP: JString read _GetTAG_GPS_TIMESTAMP;
    {class} property TAG_IMAGE_LENGTH: JString read _GetTAG_IMAGE_LENGTH;
    {class} property TAG_IMAGE_WIDTH: JString read _GetTAG_IMAGE_WIDTH;
    {class} property TAG_ISO: JString read _GetTAG_ISO;
    {class} property TAG_MAKE: JString read _GetTAG_MAKE;
    {class} property TAG_MODEL: JString read _GetTAG_MODEL;
    {class} property TAG_ORIENTATION: JString read _GetTAG_ORIENTATION;
    {class} property TAG_SUBSEC_TIME: JString read _GetTAG_SUBSEC_TIME;
    {class} property TAG_SUBSEC_TIME_DIG: JString read _GetTAG_SUBSEC_TIME_DIG;
    {class} property TAG_SUBSEC_TIME_ORIG: JString read _GetTAG_SUBSEC_TIME_ORIG;
    {class} property TAG_WHITE_BALANCE: JString read _GetTAG_WHITE_BALANCE;
    {class} property WHITEBALANCE_AUTO: Integer read _GetWHITEBALANCE_AUTO;
    {class} property WHITEBALANCE_MANUAL: Integer read _GetWHITEBALANCE_MANUAL;
  end;

  [JavaSignature('android/media/ExifInterface')]
  JExifInterface = interface(JObject)
    ['{A1FEA8A4-6E88-46E7-BB89-BC24ACA69331}']
    function getAltitude(defaultValue: Double): Double; cdecl;
    function getAttribute(tag: JString): JString; cdecl;
    function getAttributeDouble(tag: JString; defaultValue: Double): Double; cdecl;
    function getAttributeInt(tag: JString; defaultValue: Integer): Integer; cdecl;
    function getLatLong(output: TJavaArray<Single>): Boolean; cdecl;
    function getThumbnail: TJavaArray<Byte>; cdecl;
    function hasThumbnail: Boolean; cdecl;
    procedure saveAttributes; cdecl;
    procedure setAttribute(tag: JString; value: JString); cdecl;
  end;
  TJExifInterface = class(TJavaGenericImport<JExifInterfaceClass, JExifInterface>) end;

  JFaceDetectorClass = interface(JObjectClass)
    ['{1EFF1585-F9D1-473B-8157-809AF8522E6C}']
    {class} function init(width: Integer; height: Integer; maxFaces: Integer): JFaceDetector; cdecl;
  end;

  [JavaSignature('android/media/FaceDetector')]
  JFaceDetector = interface(JObject)
    ['{51F75D8F-DFA7-4368-B73F-DE24C7C060E4}']
    function findFaces(bitmap: JBitmap; faces: TJavaObjectArray<JFaceDetector_Face>): Integer; cdecl;
  end;
  TJFaceDetector = class(TJavaGenericImport<JFaceDetectorClass, JFaceDetector>) end;

  JFaceDetector_FaceClass = interface(JObjectClass)
    ['{17134C3D-57CA-4AF8-8AF5-042B9891843E}']
    {class} function _GetCONFIDENCE_THRESHOLD: Single; cdecl;
    {class} function _GetEULER_X: Integer; cdecl;
    {class} function _GetEULER_Y: Integer; cdecl;
    {class} function _GetEULER_Z: Integer; cdecl;
    {class} property CONFIDENCE_THRESHOLD: Single read _GetCONFIDENCE_THRESHOLD;
    {class} property EULER_X: Integer read _GetEULER_X;
    {class} property EULER_Y: Integer read _GetEULER_Y;
    {class} property EULER_Z: Integer read _GetEULER_Z;
  end;

  [JavaSignature('android/media/FaceDetector$Face')]
  JFaceDetector_Face = interface(JObject)
    ['{45D33BFD-93F8-4603-BA45-E24ED10ABE1E}']
    function confidence: Single; cdecl;
    function eyesDistance: Single; cdecl;
    procedure getMidPoint(point: JPointF); cdecl;
    function pose(euler: Integer): Single; cdecl;
  end;
  TJFaceDetector_Face = class(TJavaGenericImport<JFaceDetector_FaceClass, JFaceDetector_Face>) end;

  JImageClass = interface(JObjectClass)
    ['{222370FD-2F78-455E-8287-D8E3BCEBF8DA}']
  end;

  [JavaSignature('android/media/Image')]
  JImage = interface(JObject)
    ['{1433F1F5-7A0D-4F00-8551-D25DA9CE6B4D}']
    procedure close; cdecl;
    function getCropRect: JRect; cdecl;
    function getFormat: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getPlanes: TJavaObjectArray<JImage_Plane>; cdecl;
    function getTimestamp: Int64; cdecl;
    function getWidth: Integer; cdecl;
    procedure setCropRect(cropRect: JRect); cdecl;
    procedure setTimestamp(timestamp: Int64); cdecl;
  end;
  TJImage = class(TJavaGenericImport<JImageClass, JImage>) end;

  JImage_PlaneClass = interface(JObjectClass)
    ['{9FC1C95F-4623-461D-A1F9-64209E469FE6}']
  end;

  [JavaSignature('android/media/Image$Plane')]
  JImage_Plane = interface(JObject)
    ['{CC2F324B-70D7-4ACD-A0C6-516372E18651}']
    function getBuffer: JByteBuffer; cdecl;
    function getPixelStride: Integer; cdecl;
    function getRowStride: Integer; cdecl;
  end;
  TJImage_Plane = class(TJavaGenericImport<JImage_PlaneClass, JImage_Plane>) end;

  JImageReaderClass = interface(JObjectClass)
    ['{D8EA1DC9-1A2D-42B8-BCA9-BDD6BACF2B5D}']
    {class} function newInstance(width: Integer; height: Integer; format: Integer; maxImages: Integer): JImageReader; cdecl;
  end;

  [JavaSignature('android/media/ImageReader')]
  JImageReader = interface(JObject)
    ['{9C4D5031-D450-4FFC-B555-67A8E8AEF4A4}']
    function acquireLatestImage: JImage; cdecl;
    function acquireNextImage: JImage; cdecl;
    procedure close; cdecl;
    function getHeight: Integer; cdecl;
    function getImageFormat: Integer; cdecl;
    function getMaxImages: Integer; cdecl;
    function getSurface: JSurface; cdecl;
    function getWidth: Integer; cdecl;
    procedure setOnImageAvailableListener(listener: JImageReader_OnImageAvailableListener; handler: JHandler); cdecl;
  end;
  TJImageReader = class(TJavaGenericImport<JImageReaderClass, JImageReader>) end;

  JImageReader_OnImageAvailableListenerClass = interface(IJavaClass)
    ['{33317279-C3D3-40D2-9A41-F34FC98572A7}']
  end;

  [JavaSignature('android/media/ImageReader$OnImageAvailableListener')]
  JImageReader_OnImageAvailableListener = interface(IJavaInstance)
    ['{9FD886E2-54F8-4503-BF77-F112A0645C31}']
    procedure onImageAvailable(reader: JImageReader); cdecl;
  end;
  TJImageReader_OnImageAvailableListener = class(TJavaGenericImport<JImageReader_OnImageAvailableListenerClass, JImageReader_OnImageAvailableListener>) end;

  JImageWriterClass = interface(JObjectClass)
    ['{7BDA487C-CABD-4F23-AA24-AB6EEE8453EC}']
    {class} function newInstance(surface: JSurface; maxImages: Integer): JImageWriter; cdecl;
  end;

  [JavaSignature('android/media/ImageWriter')]
  JImageWriter = interface(JObject)
    ['{439AF5FD-217C-4772-828E-6C8614556D67}']
    procedure close; cdecl;
    function dequeueInputImage: JImage; cdecl;
    function getFormat: Integer; cdecl;
    function getMaxImages: Integer; cdecl;
    procedure queueInputImage(image: JImage); cdecl;
    procedure setOnImageReleasedListener(listener: JImageWriter_OnImageReleasedListener; handler: JHandler); cdecl;
  end;
  TJImageWriter = class(TJavaGenericImport<JImageWriterClass, JImageWriter>) end;

  JImageWriter_OnImageReleasedListenerClass = interface(IJavaClass)
    ['{1503EC3F-E332-4673-AEE2-233E46C74A66}']
  end;

  [JavaSignature('android/media/ImageWriter$OnImageReleasedListener')]
  JImageWriter_OnImageReleasedListener = interface(IJavaInstance)
    ['{468D8616-1AAE-4485-95A8-3805CB1DB12A}']
    procedure onImageReleased(writer: JImageWriter); cdecl;
  end;
  TJImageWriter_OnImageReleasedListener = class(TJavaGenericImport<JImageWriter_OnImageReleasedListenerClass, JImageWriter_OnImageReleasedListener>) end;

  JJetPlayerClass = interface(JObjectClass)
    ['{2CA09255-297D-4CAE-A504-4B4D00375EC3}']
    {class} function getJetPlayer: JJetPlayer; cdecl;
    {class} function getMaxTracks: Integer; cdecl;
  end;

  [JavaSignature('android/media/JetPlayer')]
  JJetPlayer = interface(JObject)
    ['{3E8DCD57-E0F8-4526-BFA1-62121FB1B4C2}']
    function clearQueue: Boolean; cdecl;
    function clone: JObject; cdecl;
    function closeJetFile: Boolean; cdecl;
    function loadJetFile(path: JString): Boolean; cdecl; overload;
    function loadJetFile(afd: JAssetFileDescriptor): Boolean; cdecl; overload;
    function pause: Boolean; cdecl;
    function play: Boolean; cdecl;
    function queueJetSegment(segmentNum: Integer; libNum: Integer; repeatCount: Integer; transpose: Integer; muteFlags: Integer; userID: Byte): Boolean; cdecl;
    function queueJetSegmentMuteArray(segmentNum: Integer; libNum: Integer; repeatCount: Integer; transpose: Integer; muteArray: TJavaArray<Boolean>; userID: Byte): Boolean; cdecl;
    procedure release; cdecl;
    procedure setEventListener(listener: JJetPlayer_OnJetEventListener); cdecl; overload;
    procedure setEventListener(listener: JJetPlayer_OnJetEventListener; handler: JHandler); cdecl; overload;
    function setMuteArray(muteArray: TJavaArray<Boolean>; sync: Boolean): Boolean; cdecl;
    function setMuteFlag(trackId: Integer; muteFlag: Boolean; sync: Boolean): Boolean; cdecl;
    function setMuteFlags(muteFlags: Integer; sync: Boolean): Boolean; cdecl;
    function triggerClip(clipId: Integer): Boolean; cdecl;
  end;
  TJJetPlayer = class(TJavaGenericImport<JJetPlayerClass, JJetPlayer>) end;

  JJetPlayer_OnJetEventListenerClass = interface(IJavaClass)
    ['{1B13E4B7-FC2B-4396-9E99-04D8FDE142F7}']
  end;

  [JavaSignature('android/media/JetPlayer$OnJetEventListener')]
  JJetPlayer_OnJetEventListener = interface(IJavaInstance)
    ['{3F6F1880-0533-4008-91A0-EDA0C4C2EC62}']
    procedure onJetEvent(player: JJetPlayer; segment: SmallInt; track: Byte; channel: Byte; controller: Byte; value: Byte); cdecl;
    procedure onJetNumQueuedSegmentUpdate(player: JJetPlayer; nbSegments: Integer); cdecl;
    procedure onJetPauseUpdate(player: JJetPlayer; paused: Integer); cdecl;
    procedure onJetUserIdUpdate(player: JJetPlayer; userId: Integer; repeatCount: Integer); cdecl;
  end;
  TJJetPlayer_OnJetEventListener = class(TJavaGenericImport<JJetPlayer_OnJetEventListenerClass, JJetPlayer_OnJetEventListener>) end;

  JMediaActionSoundClass = interface(JObjectClass)
    ['{2B4CEE61-D673-4EDE-9154-6C7D30F15988}']
    {class} function _GetFOCUS_COMPLETE: Integer; cdecl;
    {class} function _GetSHUTTER_CLICK: Integer; cdecl;
    {class} function _GetSTART_VIDEO_RECORDING: Integer; cdecl;
    {class} function _GetSTOP_VIDEO_RECORDING: Integer; cdecl;
    {class} function init: JMediaActionSound; cdecl;
    {class} property FOCUS_COMPLETE: Integer read _GetFOCUS_COMPLETE;
    {class} property SHUTTER_CLICK: Integer read _GetSHUTTER_CLICK;
    {class} property START_VIDEO_RECORDING: Integer read _GetSTART_VIDEO_RECORDING;
    {class} property STOP_VIDEO_RECORDING: Integer read _GetSTOP_VIDEO_RECORDING;
  end;

  [JavaSignature('android/media/MediaActionSound')]
  JMediaActionSound = interface(JObject)
    ['{F9314010-8F95-4079-A513-EA752C916635}']
    procedure load(soundName: Integer); cdecl;
    procedure play(soundName: Integer); cdecl;
    procedure release; cdecl;
  end;
  TJMediaActionSound = class(TJavaGenericImport<JMediaActionSoundClass, JMediaActionSound>) end;

  JMediaCodecClass = interface(JObjectClass)
    ['{CE3DED9B-E9AD-4A29-9755-ECFFFC1831BA}']
    {class} function _GetBUFFER_FLAG_CODEC_CONFIG: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_END_OF_STREAM: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_KEY_FRAME: Integer; cdecl;
    {class} function _GetBUFFER_FLAG_SYNC_FRAME: Integer; cdecl;
    {class} function _GetCONFIGURE_FLAG_ENCODE: Integer; cdecl;
    {class} function _GetCRYPTO_MODE_AES_CTR: Integer; cdecl;
    {class} function _GetCRYPTO_MODE_UNENCRYPTED: Integer; cdecl;
    {class} function _GetINFO_OUTPUT_BUFFERS_CHANGED: Integer; cdecl;
    {class} function _GetINFO_OUTPUT_FORMAT_CHANGED: Integer; cdecl;
    {class} function _GetINFO_TRY_AGAIN_LATER: Integer; cdecl;
    {class} function _GetPARAMETER_KEY_REQUEST_SYNC_FRAME: JString; cdecl;
    {class} function _GetPARAMETER_KEY_SUSPEND: JString; cdecl;
    {class} function _GetPARAMETER_KEY_VIDEO_BITRATE: JString; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT: Integer; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer; cdecl;
    {class} function createByCodecName(name: JString): JMediaCodec; cdecl;
    {class} function createDecoderByType(type_: JString): JMediaCodec; cdecl;
    {class} function createEncoderByType(type_: JString): JMediaCodec; cdecl;
    {class} function createPersistentInputSurface: JSurface; cdecl;
    {class} property BUFFER_FLAG_CODEC_CONFIG: Integer read _GetBUFFER_FLAG_CODEC_CONFIG;
    {class} property BUFFER_FLAG_END_OF_STREAM: Integer read _GetBUFFER_FLAG_END_OF_STREAM;
    {class} property BUFFER_FLAG_KEY_FRAME: Integer read _GetBUFFER_FLAG_KEY_FRAME;
    {class} property BUFFER_FLAG_SYNC_FRAME: Integer read _GetBUFFER_FLAG_SYNC_FRAME;
    {class} property CONFIGURE_FLAG_ENCODE: Integer read _GetCONFIGURE_FLAG_ENCODE;
    {class} property CRYPTO_MODE_AES_CTR: Integer read _GetCRYPTO_MODE_AES_CTR;
    {class} property CRYPTO_MODE_UNENCRYPTED: Integer read _GetCRYPTO_MODE_UNENCRYPTED;
    {class} property INFO_OUTPUT_BUFFERS_CHANGED: Integer read _GetINFO_OUTPUT_BUFFERS_CHANGED;
    {class} property INFO_OUTPUT_FORMAT_CHANGED: Integer read _GetINFO_OUTPUT_FORMAT_CHANGED;
    {class} property INFO_TRY_AGAIN_LATER: Integer read _GetINFO_TRY_AGAIN_LATER;
    {class} property PARAMETER_KEY_REQUEST_SYNC_FRAME: JString read _GetPARAMETER_KEY_REQUEST_SYNC_FRAME;
    {class} property PARAMETER_KEY_SUSPEND: JString read _GetPARAMETER_KEY_SUSPEND;
    {class} property PARAMETER_KEY_VIDEO_BITRATE: JString read _GetPARAMETER_KEY_VIDEO_BITRATE;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING;
  end;

  [JavaSignature('android/media/MediaCodec')]
  JMediaCodec = interface(JObject)
    ['{A535089E-5F3D-464D-9BB5-2A3553A461F1}']
    procedure configure(format: JMediaFormat; surface: JSurface; crypto: JMediaCrypto; flags: Integer); cdecl;
    function createInputSurface: JSurface; cdecl;
    function dequeueInputBuffer(timeoutUs: Int64): Integer; cdecl;
    function dequeueOutputBuffer(info: JMediaCodec_BufferInfo; timeoutUs: Int64): Integer; cdecl;
    procedure flush; cdecl;
    function getCodecInfo: JMediaCodecInfo; cdecl;
    function getInputBuffer(index: Integer): JByteBuffer; cdecl;
    function getInputBuffers: TJavaObjectArray<JByteBuffer>; cdecl;//Deprecated
    function getInputFormat: JMediaFormat; cdecl;
    function getInputImage(index: Integer): JImage; cdecl;
    function getName: JString; cdecl;
    function getOutputBuffer(index: Integer): JByteBuffer; cdecl;
    function getOutputBuffers: TJavaObjectArray<JByteBuffer>; cdecl;//Deprecated
    function getOutputFormat: JMediaFormat; cdecl; overload;
    function getOutputFormat(index: Integer): JMediaFormat; cdecl; overload;
    function getOutputImage(index: Integer): JImage; cdecl;
    procedure queueInputBuffer(index: Integer; offset: Integer; size: Integer; presentationTimeUs: Int64; flags: Integer); cdecl;
    procedure queueSecureInputBuffer(index: Integer; offset: Integer; info: JMediaCodec_CryptoInfo; presentationTimeUs: Int64; flags: Integer); cdecl;
    procedure release; cdecl;
    procedure releaseOutputBuffer(index: Integer; render: Boolean); cdecl; overload;
    procedure releaseOutputBuffer(index: Integer; renderTimestampNs: Int64); cdecl; overload;
    procedure reset; cdecl;
    procedure setCallback(cb: JMediaCodec_Callback; handler: JHandler); cdecl; overload;
    procedure setCallback(cb: JMediaCodec_Callback); cdecl; overload;
    procedure setInputSurface(surface: JSurface); cdecl;
    procedure setOnFrameRenderedListener(listener: JMediaCodec_OnFrameRenderedListener; handler: JHandler); cdecl;
    procedure setOutputSurface(surface: JSurface); cdecl;
    procedure setParameters(params: JBundle); cdecl;
    procedure setVideoScalingMode(mode: Integer); cdecl;
    procedure signalEndOfInputStream; cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
  end;
  TJMediaCodec = class(TJavaGenericImport<JMediaCodecClass, JMediaCodec>) end;

  JMediaCodec_BufferInfoClass = interface(JObjectClass)
    ['{F2CE3B97-9D62-442D-A689-ED511D19C5F2}']
    {class} function init: JMediaCodec_BufferInfo; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$BufferInfo')]
  JMediaCodec_BufferInfo = interface(JObject)
    ['{EB7BFC1B-B1F0-4602-9173-69B036DE28E1}']
    function _Getflags: Integer; cdecl;
    procedure _Setflags(Value: Integer); cdecl;
    function _Getoffset: Integer; cdecl;
    procedure _Setoffset(Value: Integer); cdecl;
    function _GetpresentationTimeUs: Int64; cdecl;
    procedure _SetpresentationTimeUs(Value: Int64); cdecl;
    function _Getsize: Integer; cdecl;
    procedure _Setsize(Value: Integer); cdecl;
    procedure &set(newOffset: Integer; newSize: Integer; newTimeUs: Int64; newFlags: Integer); cdecl;
    property flags: Integer read _Getflags write _Setflags;
    property offset: Integer read _Getoffset write _Setoffset;
    property presentationTimeUs: Int64 read _GetpresentationTimeUs write _SetpresentationTimeUs;
    property size: Integer read _Getsize write _Setsize;
  end;
  TJMediaCodec_BufferInfo = class(TJavaGenericImport<JMediaCodec_BufferInfoClass, JMediaCodec_BufferInfo>) end;

  JMediaCodec_CallbackClass = interface(JObjectClass)
    ['{603A4EB4-F4D1-41EB-BB3E-CA8FD9125BB6}']
    {class} function init: JMediaCodec_Callback; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$Callback')]
  JMediaCodec_Callback = interface(JObject)
    ['{63456BCE-790E-4EE8-8607-6E19D3D4370E}']
    procedure onError(codec: JMediaCodec; e: JMediaCodec_CodecException); cdecl;
    procedure onInputBufferAvailable(codec: JMediaCodec; index: Integer); cdecl;
    procedure onOutputBufferAvailable(codec: JMediaCodec; index: Integer; info: JMediaCodec_BufferInfo); cdecl;
    procedure onOutputFormatChanged(codec: JMediaCodec; format: JMediaFormat); cdecl;
  end;
  TJMediaCodec_Callback = class(TJavaGenericImport<JMediaCodec_CallbackClass, JMediaCodec_Callback>) end;

  JMediaCodec_CodecExceptionClass = interface(JIllegalStateExceptionClass)
    ['{52958DD7-6125-4029-ABC5-B25990346AB9}']
    {class} function _GetERROR_INSUFFICIENT_RESOURCE: Integer; cdecl;
    {class} function _GetERROR_RECLAIMED: Integer; cdecl;
    {class} property ERROR_INSUFFICIENT_RESOURCE: Integer read _GetERROR_INSUFFICIENT_RESOURCE;
    {class} property ERROR_RECLAIMED: Integer read _GetERROR_RECLAIMED;
  end;

  [JavaSignature('android/media/MediaCodec$CodecException')]
  JMediaCodec_CodecException = interface(JIllegalStateException)
    ['{0582C58D-F00C-467F-A211-847AE1AEA50E}']
    function getDiagnosticInfo: JString; cdecl;
    function getErrorCode: Integer; cdecl;
    function isRecoverable: Boolean; cdecl;
    function isTransient: Boolean; cdecl;
  end;
  TJMediaCodec_CodecException = class(TJavaGenericImport<JMediaCodec_CodecExceptionClass, JMediaCodec_CodecException>) end;

  JMediaCodec_CryptoExceptionClass = interface(JRuntimeExceptionClass)
    ['{CE90A025-BE54-4F7A-95ED-4FEA792EA200}']
    {class} function _GetERROR_INSUFFICIENT_OUTPUT_PROTECTION: Integer; cdecl;
    {class} function _GetERROR_KEY_EXPIRED: Integer; cdecl;
    {class} function _GetERROR_NO_KEY: Integer; cdecl;
    {class} function _GetERROR_RESOURCE_BUSY: Integer; cdecl;
    {class} function _GetERROR_SESSION_NOT_OPENED: Integer; cdecl;
    {class} function init(errorCode: Integer; detailMessage: JString): JMediaCodec_CryptoException; cdecl;
    {class} property ERROR_INSUFFICIENT_OUTPUT_PROTECTION: Integer read _GetERROR_INSUFFICIENT_OUTPUT_PROTECTION;
    {class} property ERROR_KEY_EXPIRED: Integer read _GetERROR_KEY_EXPIRED;
    {class} property ERROR_NO_KEY: Integer read _GetERROR_NO_KEY;
    {class} property ERROR_RESOURCE_BUSY: Integer read _GetERROR_RESOURCE_BUSY;
    {class} property ERROR_SESSION_NOT_OPENED: Integer read _GetERROR_SESSION_NOT_OPENED;
  end;

  [JavaSignature('android/media/MediaCodec$CryptoException')]
  JMediaCodec_CryptoException = interface(JRuntimeException)
    ['{D0A8F499-E687-4578-9E2D-A86E14881DB5}']
    function getErrorCode: Integer; cdecl;
  end;
  TJMediaCodec_CryptoException = class(TJavaGenericImport<JMediaCodec_CryptoExceptionClass, JMediaCodec_CryptoException>) end;

  JMediaCodec_CryptoInfoClass = interface(JObjectClass)
    ['{DDA3A4C6-56FD-4C37-8812-5269A274E6DD}']
    {class} function init: JMediaCodec_CryptoInfo; cdecl;
  end;

  [JavaSignature('android/media/MediaCodec$CryptoInfo')]
  JMediaCodec_CryptoInfo = interface(JObject)
    ['{5281B1AC-4C52-4BF3-A45F-75B3778E3774}']
    function _Getiv: TJavaArray<Byte>; cdecl;
    procedure _Setiv(Value: TJavaArray<Byte>); cdecl;
    function _Getkey: TJavaArray<Byte>; cdecl;
    procedure _Setkey(Value: TJavaArray<Byte>); cdecl;
    function _Getmode: Integer; cdecl;
    procedure _Setmode(Value: Integer); cdecl;
    function _GetnumBytesOfClearData: TJavaArray<Integer>; cdecl;
    procedure _SetnumBytesOfClearData(Value: TJavaArray<Integer>); cdecl;
    function _GetnumBytesOfEncryptedData: TJavaArray<Integer>; cdecl;
    procedure _SetnumBytesOfEncryptedData(Value: TJavaArray<Integer>); cdecl;
    function _GetnumSubSamples: Integer; cdecl;
    procedure _SetnumSubSamples(Value: Integer); cdecl;
    procedure &set(newNumSubSamples: Integer; newNumBytesOfClearData: TJavaArray<Integer>; newNumBytesOfEncryptedData: TJavaArray<Integer>; newKey: TJavaArray<Byte>; newIV: TJavaArray<Byte>; newMode: Integer); cdecl;
    function toString: JString; cdecl;
    property iv: TJavaArray<Byte> read _Getiv write _Setiv;
    property key: TJavaArray<Byte> read _Getkey write _Setkey;
    property mode: Integer read _Getmode write _Setmode;
    property numBytesOfClearData: TJavaArray<Integer> read _GetnumBytesOfClearData write _SetnumBytesOfClearData;
    property numBytesOfEncryptedData: TJavaArray<Integer> read _GetnumBytesOfEncryptedData write _SetnumBytesOfEncryptedData;
    property numSubSamples: Integer read _GetnumSubSamples write _SetnumSubSamples;
  end;
  TJMediaCodec_CryptoInfo = class(TJavaGenericImport<JMediaCodec_CryptoInfoClass, JMediaCodec_CryptoInfo>) end;

  JMediaCodec_OnFrameRenderedListenerClass = interface(IJavaClass)
    ['{84F9D7D7-89EB-487E-B4E1-530587A82704}']
  end;

  [JavaSignature('android/media/MediaCodec$OnFrameRenderedListener')]
  JMediaCodec_OnFrameRenderedListener = interface(IJavaInstance)
    ['{D8D0DD67-71AF-4052-B101-6EAA19ABCF6D}']
    procedure onFrameRendered(codec: JMediaCodec; presentationTimeUs: Int64; nanoTime: Int64); cdecl;
  end;
  TJMediaCodec_OnFrameRenderedListener = class(TJavaGenericImport<JMediaCodec_OnFrameRenderedListenerClass, JMediaCodec_OnFrameRenderedListener>) end;

  JMediaCodecInfoClass = interface(JObjectClass)
    ['{65843676-C663-48B7-B957-36E0FAA8C6DE}']
  end;

  [JavaSignature('android/media/MediaCodecInfo')]
  JMediaCodecInfo = interface(JObject)
    ['{DEB2A66A-5E90-4568-8DD2-5D17A9008896}']
    function getCapabilitiesForType(type_: JString): JMediaCodecInfo_CodecCapabilities; cdecl;
    function getName: JString; cdecl;
    function getSupportedTypes: TJavaObjectArray<JString>; cdecl;
    function isEncoder: Boolean; cdecl;
  end;
  TJMediaCodecInfo = class(TJavaGenericImport<JMediaCodecInfoClass, JMediaCodecInfo>) end;

  JMediaCodecInfo_AudioCapabilitiesClass = interface(JObjectClass)
    ['{75906A2D-B46A-4CC9-945B-DDEA07BE543C}']
  end;

  [JavaSignature('android/media/MediaCodecInfo$AudioCapabilities')]
  JMediaCodecInfo_AudioCapabilities = interface(JObject)
    ['{9D0C7E86-4355-4231-9666-C4266685A95D}']
    function getBitrateRange: JRange; cdecl;
    function getMaxInputChannelCount: Integer; cdecl;
    function getSupportedSampleRateRanges: TJavaObjectArray<JRange>; cdecl;
    function getSupportedSampleRates: TJavaArray<Integer>; cdecl;
    function isSampleRateSupported(sampleRate: Integer): Boolean; cdecl;
  end;
  TJMediaCodecInfo_AudioCapabilities = class(TJavaGenericImport<JMediaCodecInfo_AudioCapabilitiesClass, JMediaCodecInfo_AudioCapabilities>) end;

  JMediaCodecInfo_CodecCapabilitiesClass = interface(JObjectClass)
    ['{007827D3-EC90-41C8-BA89-794265D12834}']
    {class} function _GetCOLOR_Format12bitRGB444: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitARGB1555: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitARGB4444: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitBGR565: Integer; cdecl;
    {class} function _GetCOLOR_Format16bitRGB565: Integer; cdecl;
    {class} function _GetCOLOR_Format18BitBGR666: Integer; cdecl;
    {class} function _GetCOLOR_Format18bitARGB1665: Integer; cdecl;
    {class} function _GetCOLOR_Format18bitRGB666: Integer; cdecl;
    {class} function _GetCOLOR_Format19bitARGB1666: Integer; cdecl;
    {class} function _GetCOLOR_Format24BitABGR6666: Integer; cdecl;
    {class} function _GetCOLOR_Format24BitARGB6666: Integer; cdecl;
    {class} function _GetCOLOR_Format24bitARGB1887: Integer; cdecl;
    {class} function _GetCOLOR_Format24bitBGR888: Integer; cdecl;
    {class} function _GetCOLOR_Format24bitRGB888: Integer; cdecl;
    {class} function _GetCOLOR_Format25bitARGB1888: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitABGR8888: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitARGB8888: Integer; cdecl;
    {class} function _GetCOLOR_Format32bitBGRA8888: Integer; cdecl;
    {class} function _GetCOLOR_Format8bitRGB332: Integer; cdecl;
    {class} function _GetCOLOR_FormatCbYCrY: Integer; cdecl;
    {class} function _GetCOLOR_FormatCrYCbY: Integer; cdecl;
    {class} function _GetCOLOR_FormatL16: Integer; cdecl;
    {class} function _GetCOLOR_FormatL2: Integer; cdecl;
    {class} function _GetCOLOR_FormatL24: Integer; cdecl;
    {class} function _GetCOLOR_FormatL32: Integer; cdecl;
    {class} function _GetCOLOR_FormatL4: Integer; cdecl;
    {class} function _GetCOLOR_FormatL8: Integer; cdecl;
    {class} function _GetCOLOR_FormatMonochrome: Integer; cdecl;
    {class} function _GetCOLOR_FormatRGBAFlexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatRGBFlexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatRawBayer10bit: Integer; cdecl;
    {class} function _GetCOLOR_FormatRawBayer8bit: Integer; cdecl;
    {class} function _GetCOLOR_FormatRawBayer8bitcompressed: Integer; cdecl;
    {class} function _GetCOLOR_FormatSurface: Integer; cdecl;
    {class} function _GetCOLOR_FormatYCbYCr: Integer; cdecl;
    {class} function _GetCOLOR_FormatYCrYCb: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV411PackedPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV411Planar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420Flexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420PackedPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420PackedSemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420Planar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV420SemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422Flexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422PackedPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422PackedSemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422Planar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV422SemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV444Flexible: Integer; cdecl;
    {class} function _GetCOLOR_FormatYUV444Interleaved: Integer; cdecl;
    {class} function _GetCOLOR_QCOM_FormatYUV420SemiPlanar: Integer; cdecl;
    {class} function _GetCOLOR_TI_FormatYUV420PackedSemiPlanar: Integer; cdecl;
    {class} function _GetFEATURE_AdaptivePlayback: JString; cdecl;
    {class} function _GetFEATURE_SecurePlayback: JString; cdecl;
    {class} function _GetFEATURE_TunneledPlayback: JString; cdecl;
    {class} function init: JMediaCodecInfo_CodecCapabilities; cdecl;
    {class} function createFromProfileLevel(mime: JString; profile: Integer; level: Integer): JMediaCodecInfo_CodecCapabilities; cdecl;
    {class} property COLOR_Format12bitRGB444: Integer read _GetCOLOR_Format12bitRGB444;
    {class} property COLOR_Format16bitARGB1555: Integer read _GetCOLOR_Format16bitARGB1555;
    {class} property COLOR_Format16bitARGB4444: Integer read _GetCOLOR_Format16bitARGB4444;
    {class} property COLOR_Format16bitBGR565: Integer read _GetCOLOR_Format16bitBGR565;
    {class} property COLOR_Format16bitRGB565: Integer read _GetCOLOR_Format16bitRGB565;
    {class} property COLOR_Format18BitBGR666: Integer read _GetCOLOR_Format18BitBGR666;
    {class} property COLOR_Format18bitARGB1665: Integer read _GetCOLOR_Format18bitARGB1665;
    {class} property COLOR_Format18bitRGB666: Integer read _GetCOLOR_Format18bitRGB666;
    {class} property COLOR_Format19bitARGB1666: Integer read _GetCOLOR_Format19bitARGB1666;
    {class} property COLOR_Format24BitABGR6666: Integer read _GetCOLOR_Format24BitABGR6666;
    {class} property COLOR_Format24BitARGB6666: Integer read _GetCOLOR_Format24BitARGB6666;
    {class} property COLOR_Format24bitARGB1887: Integer read _GetCOLOR_Format24bitARGB1887;
    {class} property COLOR_Format24bitBGR888: Integer read _GetCOLOR_Format24bitBGR888;
    {class} property COLOR_Format24bitRGB888: Integer read _GetCOLOR_Format24bitRGB888;
    {class} property COLOR_Format25bitARGB1888: Integer read _GetCOLOR_Format25bitARGB1888;
    {class} property COLOR_Format32bitABGR8888: Integer read _GetCOLOR_Format32bitABGR8888;
    {class} property COLOR_Format32bitARGB8888: Integer read _GetCOLOR_Format32bitARGB8888;
    {class} property COLOR_Format32bitBGRA8888: Integer read _GetCOLOR_Format32bitBGRA8888;
    {class} property COLOR_Format8bitRGB332: Integer read _GetCOLOR_Format8bitRGB332;
    {class} property COLOR_FormatCbYCrY: Integer read _GetCOLOR_FormatCbYCrY;
    {class} property COLOR_FormatCrYCbY: Integer read _GetCOLOR_FormatCrYCbY;
    {class} property COLOR_FormatL16: Integer read _GetCOLOR_FormatL16;
    {class} property COLOR_FormatL2: Integer read _GetCOLOR_FormatL2;
    {class} property COLOR_FormatL24: Integer read _GetCOLOR_FormatL24;
    {class} property COLOR_FormatL32: Integer read _GetCOLOR_FormatL32;
    {class} property COLOR_FormatL4: Integer read _GetCOLOR_FormatL4;
    {class} property COLOR_FormatL8: Integer read _GetCOLOR_FormatL8;
    {class} property COLOR_FormatMonochrome: Integer read _GetCOLOR_FormatMonochrome;
    {class} property COLOR_FormatRGBAFlexible: Integer read _GetCOLOR_FormatRGBAFlexible;
    {class} property COLOR_FormatRGBFlexible: Integer read _GetCOLOR_FormatRGBFlexible;
    {class} property COLOR_FormatRawBayer10bit: Integer read _GetCOLOR_FormatRawBayer10bit;
    {class} property COLOR_FormatRawBayer8bit: Integer read _GetCOLOR_FormatRawBayer8bit;
    {class} property COLOR_FormatRawBayer8bitcompressed: Integer read _GetCOLOR_FormatRawBayer8bitcompressed;
    {class} property COLOR_FormatSurface: Integer read _GetCOLOR_FormatSurface;
    {class} property COLOR_FormatYCbYCr: Integer read _GetCOLOR_FormatYCbYCr;
    {class} property COLOR_FormatYCrYCb: Integer read _GetCOLOR_FormatYCrYCb;
    {class} property COLOR_FormatYUV411PackedPlanar: Integer read _GetCOLOR_FormatYUV411PackedPlanar;
    {class} property COLOR_FormatYUV411Planar: Integer read _GetCOLOR_FormatYUV411Planar;
    {class} property COLOR_FormatYUV420Flexible: Integer read _GetCOLOR_FormatYUV420Flexible;
    {class} property COLOR_FormatYUV420PackedPlanar: Integer read _GetCOLOR_FormatYUV420PackedPlanar;
    {class} property COLOR_FormatYUV420PackedSemiPlanar: Integer read _GetCOLOR_FormatYUV420PackedSemiPlanar;
    {class} property COLOR_FormatYUV420Planar: Integer read _GetCOLOR_FormatYUV420Planar;
    {class} property COLOR_FormatYUV420SemiPlanar: Integer read _GetCOLOR_FormatYUV420SemiPlanar;
    {class} property COLOR_FormatYUV422Flexible: Integer read _GetCOLOR_FormatYUV422Flexible;
    {class} property COLOR_FormatYUV422PackedPlanar: Integer read _GetCOLOR_FormatYUV422PackedPlanar;
    {class} property COLOR_FormatYUV422PackedSemiPlanar: Integer read _GetCOLOR_FormatYUV422PackedSemiPlanar;
    {class} property COLOR_FormatYUV422Planar: Integer read _GetCOLOR_FormatYUV422Planar;
    {class} property COLOR_FormatYUV422SemiPlanar: Integer read _GetCOLOR_FormatYUV422SemiPlanar;
    {class} property COLOR_FormatYUV444Flexible: Integer read _GetCOLOR_FormatYUV444Flexible;
    {class} property COLOR_FormatYUV444Interleaved: Integer read _GetCOLOR_FormatYUV444Interleaved;
    {class} property COLOR_QCOM_FormatYUV420SemiPlanar: Integer read _GetCOLOR_QCOM_FormatYUV420SemiPlanar;
    {class} property COLOR_TI_FormatYUV420PackedSemiPlanar: Integer read _GetCOLOR_TI_FormatYUV420PackedSemiPlanar;
    {class} property FEATURE_AdaptivePlayback: JString read _GetFEATURE_AdaptivePlayback;
    {class} property FEATURE_SecurePlayback: JString read _GetFEATURE_SecurePlayback;
    {class} property FEATURE_TunneledPlayback: JString read _GetFEATURE_TunneledPlayback;
  end;

  [JavaSignature('android/media/MediaCodecInfo$CodecCapabilities')]
  JMediaCodecInfo_CodecCapabilities = interface(JObject)
    ['{A04BF209-41B0-4DA2-B376-447B7BBC6237}']
    function _GetcolorFormats: TJavaArray<Integer>; cdecl;
    procedure _SetcolorFormats(Value: TJavaArray<Integer>); cdecl;
    function _GetprofileLevels: TJavaObjectArray<JMediaCodecInfo_CodecProfileLevel>; cdecl;
    procedure _SetprofileLevels(Value: TJavaObjectArray<JMediaCodecInfo_CodecProfileLevel>); cdecl;
    function getAudioCapabilities: JMediaCodecInfo_AudioCapabilities; cdecl;
    function getDefaultFormat: JMediaFormat; cdecl;
    function getEncoderCapabilities: JMediaCodecInfo_EncoderCapabilities; cdecl;
    function getMaxSupportedInstances: Integer; cdecl;
    function getMimeType: JString; cdecl;
    function getVideoCapabilities: JMediaCodecInfo_VideoCapabilities; cdecl;
    function isFeatureRequired(name: JString): Boolean; cdecl;
    function isFeatureSupported(name: JString): Boolean; cdecl;
    function isFormatSupported(format: JMediaFormat): Boolean; cdecl;
    property colorFormats: TJavaArray<Integer> read _GetcolorFormats write _SetcolorFormats;
    property profileLevels: TJavaObjectArray<JMediaCodecInfo_CodecProfileLevel> read _GetprofileLevels write _SetprofileLevels;
  end;
  TJMediaCodecInfo_CodecCapabilities = class(TJavaGenericImport<JMediaCodecInfo_CodecCapabilitiesClass, JMediaCodecInfo_CodecCapabilities>) end;

  JMediaCodecInfo_CodecProfileLevelClass = interface(JObjectClass)
    ['{E162DC0D-F8D3-4572-8029-474D4691B5E0}']
    {class} function _GetAACObjectELD: Integer; cdecl;
    {class} function _GetAACObjectERLC: Integer; cdecl;
    {class} function _GetAACObjectHE: Integer; cdecl;
    {class} function _GetAACObjectHE_PS: Integer; cdecl;
    {class} function _GetAACObjectLC: Integer; cdecl;
    {class} function _GetAACObjectLD: Integer; cdecl;
    {class} function _GetAACObjectLTP: Integer; cdecl;
    {class} function _GetAACObjectMain: Integer; cdecl;
    {class} function _GetAACObjectSSR: Integer; cdecl;
    {class} function _GetAACObjectScalable: Integer; cdecl;
    {class} function _GetAVCLevel1: Integer; cdecl;
    {class} function _GetAVCLevel11: Integer; cdecl;
    {class} function _GetAVCLevel12: Integer; cdecl;
    {class} function _GetAVCLevel13: Integer; cdecl;
    {class} function _GetAVCLevel1b: Integer; cdecl;
    {class} function _GetAVCLevel2: Integer; cdecl;
    {class} function _GetAVCLevel21: Integer; cdecl;
    {class} function _GetAVCLevel22: Integer; cdecl;
    {class} function _GetAVCLevel3: Integer; cdecl;
    {class} function _GetAVCLevel31: Integer; cdecl;
    {class} function _GetAVCLevel32: Integer; cdecl;
    {class} function _GetAVCLevel4: Integer; cdecl;
    {class} function _GetAVCLevel41: Integer; cdecl;
    {class} function _GetAVCLevel42: Integer; cdecl;
    {class} function _GetAVCLevel5: Integer; cdecl;
    {class} function _GetAVCLevel51: Integer; cdecl;
    {class} function _GetAVCLevel52: Integer; cdecl;
    {class} function _GetAVCProfileBaseline: Integer; cdecl;
    {class} function _GetAVCProfileExtended: Integer; cdecl;
    {class} function _GetAVCProfileHigh: Integer; cdecl;
    {class} function _GetAVCProfileHigh10: Integer; cdecl;
    {class} function _GetAVCProfileHigh422: Integer; cdecl;
    {class} function _GetAVCProfileHigh444: Integer; cdecl;
    {class} function _GetAVCProfileMain: Integer; cdecl;
    {class} function _GetH263Level10: Integer; cdecl;
    {class} function _GetH263Level20: Integer; cdecl;
    {class} function _GetH263Level30: Integer; cdecl;
    {class} function _GetH263Level40: Integer; cdecl;
    {class} function _GetH263Level45: Integer; cdecl;
    {class} function _GetH263Level50: Integer; cdecl;
    {class} function _GetH263Level60: Integer; cdecl;
    {class} function _GetH263Level70: Integer; cdecl;
    {class} function _GetH263ProfileBackwardCompatible: Integer; cdecl;
    {class} function _GetH263ProfileBaseline: Integer; cdecl;
    {class} function _GetH263ProfileH320Coding: Integer; cdecl;
    {class} function _GetH263ProfileHighCompression: Integer; cdecl;
    {class} function _GetH263ProfileHighLatency: Integer; cdecl;
    {class} function _GetH263ProfileISWV2: Integer; cdecl;
    {class} function _GetH263ProfileISWV3: Integer; cdecl;
    {class} function _GetH263ProfileInterlace: Integer; cdecl;
    {class} function _GetH263ProfileInternet: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel1: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel2: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel21: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel3: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel31: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel4: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel41: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel5: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel51: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel52: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel6: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel61: Integer; cdecl;
    {class} function _GetHEVCHighTierLevel62: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel1: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel2: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel21: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel3: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel31: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel4: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel41: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel5: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel51: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel52: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel6: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel61: Integer; cdecl;
    {class} function _GetHEVCMainTierLevel62: Integer; cdecl;
    {class} function _GetHEVCProfileMain: Integer; cdecl;
    {class} function _GetHEVCProfileMain10: Integer; cdecl;
    {class} function _GetMPEG2LevelH14: Integer; cdecl;
    {class} function _GetMPEG2LevelHL: Integer; cdecl;
    {class} function _GetMPEG2LevelLL: Integer; cdecl;
    {class} function _GetMPEG2LevelML: Integer; cdecl;
    {class} function _GetMPEG2Profile422: Integer; cdecl;
    {class} function _GetMPEG2ProfileHigh: Integer; cdecl;
    {class} function _GetMPEG2ProfileMain: Integer; cdecl;
    {class} function _GetMPEG2ProfileSNR: Integer; cdecl;
    {class} function _GetMPEG2ProfileSimple: Integer; cdecl;
    {class} function _GetMPEG2ProfileSpatial: Integer; cdecl;
    {class} function _GetMPEG4Level0: Integer; cdecl;
    {class} function _GetMPEG4Level0b: Integer; cdecl;
    {class} function _GetMPEG4Level1: Integer; cdecl;
    {class} function _GetMPEG4Level2: Integer; cdecl;
    {class} function _GetMPEG4Level3: Integer; cdecl;
    {class} function _GetMPEG4Level4: Integer; cdecl;
    {class} function _GetMPEG4Level4a: Integer; cdecl;
    {class} function _GetMPEG4Level5: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedCoding: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedCore: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedRealTime: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedScalable: Integer; cdecl;
    {class} function _GetMPEG4ProfileAdvancedSimple: Integer; cdecl;
    {class} function _GetMPEG4ProfileBasicAnimated: Integer; cdecl;
    {class} function _GetMPEG4ProfileCore: Integer; cdecl;
    {class} function _GetMPEG4ProfileCoreScalable: Integer; cdecl;
    {class} function _GetMPEG4ProfileHybrid: Integer; cdecl;
    {class} function _GetMPEG4ProfileMain: Integer; cdecl;
    {class} function _GetMPEG4ProfileNbit: Integer; cdecl;
    {class} function _GetMPEG4ProfileScalableTexture: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimple: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimpleFBA: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimpleFace: Integer; cdecl;
    {class} function _GetMPEG4ProfileSimpleScalable: Integer; cdecl;
    {class} function _GetVP8Level_Version0: Integer; cdecl;
    {class} function _GetVP8Level_Version1: Integer; cdecl;
    {class} function _GetVP8Level_Version2: Integer; cdecl;
    {class} function _GetVP8Level_Version3: Integer; cdecl;
    {class} function _GetVP8ProfileMain: Integer; cdecl;
    {class} function init: JMediaCodecInfo_CodecProfileLevel; cdecl;
    {class} property AACObjectELD: Integer read _GetAACObjectELD;
    {class} property AACObjectERLC: Integer read _GetAACObjectERLC;
    {class} property AACObjectHE: Integer read _GetAACObjectHE;
    {class} property AACObjectHE_PS: Integer read _GetAACObjectHE_PS;
    {class} property AACObjectLC: Integer read _GetAACObjectLC;
    {class} property AACObjectLD: Integer read _GetAACObjectLD;
    {class} property AACObjectLTP: Integer read _GetAACObjectLTP;
    {class} property AACObjectMain: Integer read _GetAACObjectMain;
    {class} property AACObjectSSR: Integer read _GetAACObjectSSR;
    {class} property AACObjectScalable: Integer read _GetAACObjectScalable;
    {class} property AVCLevel1: Integer read _GetAVCLevel1;
    {class} property AVCLevel11: Integer read _GetAVCLevel11;
    {class} property AVCLevel12: Integer read _GetAVCLevel12;
    {class} property AVCLevel13: Integer read _GetAVCLevel13;
    {class} property AVCLevel1b: Integer read _GetAVCLevel1b;
    {class} property AVCLevel2: Integer read _GetAVCLevel2;
    {class} property AVCLevel21: Integer read _GetAVCLevel21;
    {class} property AVCLevel22: Integer read _GetAVCLevel22;
    {class} property AVCLevel3: Integer read _GetAVCLevel3;
    {class} property AVCLevel31: Integer read _GetAVCLevel31;
    {class} property AVCLevel32: Integer read _GetAVCLevel32;
    {class} property AVCLevel4: Integer read _GetAVCLevel4;
    {class} property AVCLevel41: Integer read _GetAVCLevel41;
    {class} property AVCLevel42: Integer read _GetAVCLevel42;
    {class} property AVCLevel5: Integer read _GetAVCLevel5;
    {class} property AVCLevel51: Integer read _GetAVCLevel51;
    {class} property AVCLevel52: Integer read _GetAVCLevel52;
    {class} property AVCProfileBaseline: Integer read _GetAVCProfileBaseline;
    {class} property AVCProfileExtended: Integer read _GetAVCProfileExtended;
    {class} property AVCProfileHigh: Integer read _GetAVCProfileHigh;
    {class} property AVCProfileHigh10: Integer read _GetAVCProfileHigh10;
    {class} property AVCProfileHigh422: Integer read _GetAVCProfileHigh422;
    {class} property AVCProfileHigh444: Integer read _GetAVCProfileHigh444;
    {class} property AVCProfileMain: Integer read _GetAVCProfileMain;
    {class} property H263Level10: Integer read _GetH263Level10;
    {class} property H263Level20: Integer read _GetH263Level20;
    {class} property H263Level30: Integer read _GetH263Level30;
    {class} property H263Level40: Integer read _GetH263Level40;
    {class} property H263Level45: Integer read _GetH263Level45;
    {class} property H263Level50: Integer read _GetH263Level50;
    {class} property H263Level60: Integer read _GetH263Level60;
    {class} property H263Level70: Integer read _GetH263Level70;
    {class} property H263ProfileBackwardCompatible: Integer read _GetH263ProfileBackwardCompatible;
    {class} property H263ProfileBaseline: Integer read _GetH263ProfileBaseline;
    {class} property H263ProfileH320Coding: Integer read _GetH263ProfileH320Coding;
    {class} property H263ProfileHighCompression: Integer read _GetH263ProfileHighCompression;
    {class} property H263ProfileHighLatency: Integer read _GetH263ProfileHighLatency;
    {class} property H263ProfileISWV2: Integer read _GetH263ProfileISWV2;
    {class} property H263ProfileISWV3: Integer read _GetH263ProfileISWV3;
    {class} property H263ProfileInterlace: Integer read _GetH263ProfileInterlace;
    {class} property H263ProfileInternet: Integer read _GetH263ProfileInternet;
    {class} property HEVCHighTierLevel1: Integer read _GetHEVCHighTierLevel1;
    {class} property HEVCHighTierLevel2: Integer read _GetHEVCHighTierLevel2;
    {class} property HEVCHighTierLevel21: Integer read _GetHEVCHighTierLevel21;
    {class} property HEVCHighTierLevel3: Integer read _GetHEVCHighTierLevel3;
    {class} property HEVCHighTierLevel31: Integer read _GetHEVCHighTierLevel31;
    {class} property HEVCHighTierLevel4: Integer read _GetHEVCHighTierLevel4;
    {class} property HEVCHighTierLevel41: Integer read _GetHEVCHighTierLevel41;
    {class} property HEVCHighTierLevel5: Integer read _GetHEVCHighTierLevel5;
    {class} property HEVCHighTierLevel51: Integer read _GetHEVCHighTierLevel51;
    {class} property HEVCHighTierLevel52: Integer read _GetHEVCHighTierLevel52;
    {class} property HEVCHighTierLevel6: Integer read _GetHEVCHighTierLevel6;
    {class} property HEVCHighTierLevel61: Integer read _GetHEVCHighTierLevel61;
    {class} property HEVCHighTierLevel62: Integer read _GetHEVCHighTierLevel62;
    {class} property HEVCMainTierLevel1: Integer read _GetHEVCMainTierLevel1;
    {class} property HEVCMainTierLevel2: Integer read _GetHEVCMainTierLevel2;
    {class} property HEVCMainTierLevel21: Integer read _GetHEVCMainTierLevel21;
    {class} property HEVCMainTierLevel3: Integer read _GetHEVCMainTierLevel3;
    {class} property HEVCMainTierLevel31: Integer read _GetHEVCMainTierLevel31;
    {class} property HEVCMainTierLevel4: Integer read _GetHEVCMainTierLevel4;
    {class} property HEVCMainTierLevel41: Integer read _GetHEVCMainTierLevel41;
    {class} property HEVCMainTierLevel5: Integer read _GetHEVCMainTierLevel5;
    {class} property HEVCMainTierLevel51: Integer read _GetHEVCMainTierLevel51;
    {class} property HEVCMainTierLevel52: Integer read _GetHEVCMainTierLevel52;
    {class} property HEVCMainTierLevel6: Integer read _GetHEVCMainTierLevel6;
    {class} property HEVCMainTierLevel61: Integer read _GetHEVCMainTierLevel61;
    {class} property HEVCMainTierLevel62: Integer read _GetHEVCMainTierLevel62;
    {class} property HEVCProfileMain: Integer read _GetHEVCProfileMain;
    {class} property HEVCProfileMain10: Integer read _GetHEVCProfileMain10;
    {class} property MPEG2LevelH14: Integer read _GetMPEG2LevelH14;
    {class} property MPEG2LevelHL: Integer read _GetMPEG2LevelHL;
    {class} property MPEG2LevelLL: Integer read _GetMPEG2LevelLL;
    {class} property MPEG2LevelML: Integer read _GetMPEG2LevelML;
    {class} property MPEG2Profile422: Integer read _GetMPEG2Profile422;
    {class} property MPEG2ProfileHigh: Integer read _GetMPEG2ProfileHigh;
    {class} property MPEG2ProfileMain: Integer read _GetMPEG2ProfileMain;
    {class} property MPEG2ProfileSNR: Integer read _GetMPEG2ProfileSNR;
    {class} property MPEG2ProfileSimple: Integer read _GetMPEG2ProfileSimple;
    {class} property MPEG2ProfileSpatial: Integer read _GetMPEG2ProfileSpatial;
    {class} property MPEG4Level0: Integer read _GetMPEG4Level0;
    {class} property MPEG4Level0b: Integer read _GetMPEG4Level0b;
    {class} property MPEG4Level1: Integer read _GetMPEG4Level1;
    {class} property MPEG4Level2: Integer read _GetMPEG4Level2;
    {class} property MPEG4Level3: Integer read _GetMPEG4Level3;
    {class} property MPEG4Level4: Integer read _GetMPEG4Level4;
    {class} property MPEG4Level4a: Integer read _GetMPEG4Level4a;
    {class} property MPEG4Level5: Integer read _GetMPEG4Level5;
    {class} property MPEG4ProfileAdvancedCoding: Integer read _GetMPEG4ProfileAdvancedCoding;
    {class} property MPEG4ProfileAdvancedCore: Integer read _GetMPEG4ProfileAdvancedCore;
    {class} property MPEG4ProfileAdvancedRealTime: Integer read _GetMPEG4ProfileAdvancedRealTime;
    {class} property MPEG4ProfileAdvancedScalable: Integer read _GetMPEG4ProfileAdvancedScalable;
    {class} property MPEG4ProfileAdvancedSimple: Integer read _GetMPEG4ProfileAdvancedSimple;
    {class} property MPEG4ProfileBasicAnimated: Integer read _GetMPEG4ProfileBasicAnimated;
    {class} property MPEG4ProfileCore: Integer read _GetMPEG4ProfileCore;
    {class} property MPEG4ProfileCoreScalable: Integer read _GetMPEG4ProfileCoreScalable;
    {class} property MPEG4ProfileHybrid: Integer read _GetMPEG4ProfileHybrid;
    {class} property MPEG4ProfileMain: Integer read _GetMPEG4ProfileMain;
    {class} property MPEG4ProfileNbit: Integer read _GetMPEG4ProfileNbit;
    {class} property MPEG4ProfileScalableTexture: Integer read _GetMPEG4ProfileScalableTexture;
    {class} property MPEG4ProfileSimple: Integer read _GetMPEG4ProfileSimple;
    {class} property MPEG4ProfileSimpleFBA: Integer read _GetMPEG4ProfileSimpleFBA;
    {class} property MPEG4ProfileSimpleFace: Integer read _GetMPEG4ProfileSimpleFace;
    {class} property MPEG4ProfileSimpleScalable: Integer read _GetMPEG4ProfileSimpleScalable;
    {class} property VP8Level_Version0: Integer read _GetVP8Level_Version0;
    {class} property VP8Level_Version1: Integer read _GetVP8Level_Version1;
    {class} property VP8Level_Version2: Integer read _GetVP8Level_Version2;
    {class} property VP8Level_Version3: Integer read _GetVP8Level_Version3;
    {class} property VP8ProfileMain: Integer read _GetVP8ProfileMain;
  end;

  [JavaSignature('android/media/MediaCodecInfo$CodecProfileLevel')]
  JMediaCodecInfo_CodecProfileLevel = interface(JObject)
    ['{73647127-6989-4ABF-B521-186C8899A5AC}']
    function _Getlevel: Integer; cdecl;
    procedure _Setlevel(Value: Integer); cdecl;
    function _Getprofile: Integer; cdecl;
    procedure _Setprofile(Value: Integer); cdecl;
    property level: Integer read _Getlevel write _Setlevel;
    property profile: Integer read _Getprofile write _Setprofile;
  end;
  TJMediaCodecInfo_CodecProfileLevel = class(TJavaGenericImport<JMediaCodecInfo_CodecProfileLevelClass, JMediaCodecInfo_CodecProfileLevel>) end;

  JMediaCodecInfo_EncoderCapabilitiesClass = interface(JObjectClass)
    ['{7E63CBC5-39D5-4BD2-BA7D-546C75E7E8E7}']
    {class} function _GetBITRATE_MODE_CBR: Integer; cdecl;
    {class} function _GetBITRATE_MODE_CQ: Integer; cdecl;
    {class} function _GetBITRATE_MODE_VBR: Integer; cdecl;
    {class} property BITRATE_MODE_CBR: Integer read _GetBITRATE_MODE_CBR;
    {class} property BITRATE_MODE_CQ: Integer read _GetBITRATE_MODE_CQ;
    {class} property BITRATE_MODE_VBR: Integer read _GetBITRATE_MODE_VBR;
  end;

  [JavaSignature('android/media/MediaCodecInfo$EncoderCapabilities')]
  JMediaCodecInfo_EncoderCapabilities = interface(JObject)
    ['{CF329E17-B67E-43AA-B25C-1CBF285012FE}']
    function getComplexityRange: JRange; cdecl;
    function isBitrateModeSupported(mode: Integer): Boolean; cdecl;
  end;
  TJMediaCodecInfo_EncoderCapabilities = class(TJavaGenericImport<JMediaCodecInfo_EncoderCapabilitiesClass, JMediaCodecInfo_EncoderCapabilities>) end;

  JMediaCodecInfo_VideoCapabilitiesClass = interface(JObjectClass)
    ['{0316BD5A-7F27-454B-BB1D-8A56AB696162}']
  end;

  [JavaSignature('android/media/MediaCodecInfo$VideoCapabilities')]
  JMediaCodecInfo_VideoCapabilities = interface(JObject)
    ['{CAAA6FFF-B464-486E-8455-A484667C9BDA}']
    function areSizeAndRateSupported(width: Integer; height: Integer; frameRate: Double): Boolean; cdecl;
    function getAchievableFrameRatesFor(width: Integer; height: Integer): JRange; cdecl;
    function getBitrateRange: JRange; cdecl;
    function getHeightAlignment: Integer; cdecl;
    function getSupportedFrameRates: JRange; cdecl;
    function getSupportedFrameRatesFor(width: Integer; height: Integer): JRange; cdecl;
    function getSupportedHeights: JRange; cdecl;
    function getSupportedHeightsFor(width: Integer): JRange; cdecl;
    function getSupportedWidths: JRange; cdecl;
    function getSupportedWidthsFor(height: Integer): JRange; cdecl;
    function getWidthAlignment: Integer; cdecl;
    function isSizeSupported(width: Integer; height: Integer): Boolean; cdecl;
  end;
  TJMediaCodecInfo_VideoCapabilities = class(TJavaGenericImport<JMediaCodecInfo_VideoCapabilitiesClass, JMediaCodecInfo_VideoCapabilities>) end;

  JMediaCodecListClass = interface(JObjectClass)
    ['{F1400E68-3BDF-4B8B-9B45-F679CD2B2BF3}']
    {class} function _GetALL_CODECS: Integer; cdecl;
    {class} function _GetREGULAR_CODECS: Integer; cdecl;
    {class} function init(kind: Integer): JMediaCodecList; cdecl;
    {class} function getCodecCount: Integer; cdecl;//Deprecated
    {class} function getCodecInfoAt(index: Integer): JMediaCodecInfo; cdecl;//Deprecated
    {class} property ALL_CODECS: Integer read _GetALL_CODECS;
    {class} property REGULAR_CODECS: Integer read _GetREGULAR_CODECS;
  end;

  [JavaSignature('android/media/MediaCodecList')]
  JMediaCodecList = interface(JObject)
    ['{26F449D6-A979-4BE9-BCE4-C67841504DA3}']
    function findDecoderForFormat(format: JMediaFormat): JString; cdecl;
    function findEncoderForFormat(format: JMediaFormat): JString; cdecl;
    function getCodecInfos: TJavaObjectArray<JMediaCodecInfo>; cdecl;
  end;
  TJMediaCodecList = class(TJavaGenericImport<JMediaCodecListClass, JMediaCodecList>) end;

  JMediaCryptoClass = interface(JObjectClass)
    ['{31B7D145-1DBA-4D5C-860B-338AA3F6780B}']
    {class} function init(uuid: JUUID; initData: TJavaArray<Byte>): JMediaCrypto; cdecl;
    {class} function isCryptoSchemeSupported(uuid: JUUID): Boolean; cdecl;
  end;

  [JavaSignature('android/media/MediaCrypto')]
  JMediaCrypto = interface(JObject)
    ['{B1E505C9-9F43-4C70-AB68-C0DEC0999882}']
    procedure release; cdecl;
    function requiresSecureDecoderComponent(mime: JString): Boolean; cdecl;
    procedure setMediaDrmSession(sessionId: TJavaArray<Byte>); cdecl;
  end;
  TJMediaCrypto = class(TJavaGenericImport<JMediaCryptoClass, JMediaCrypto>) end;

  JMediaCryptoExceptionClass = interface(JExceptionClass)
    ['{36A5DB4A-6D5E-49B1-B7A0-5C25892D9C7E}']
    {class} function init(detailMessage: JString): JMediaCryptoException; cdecl;
  end;

  [JavaSignature('android/media/MediaCryptoException')]
  JMediaCryptoException = interface(JException)
    ['{1039BDE3-1DD7-440A-A6B8-B55FE0B3658E}']
  end;
  TJMediaCryptoException = class(TJavaGenericImport<JMediaCryptoExceptionClass, JMediaCryptoException>) end;

  JMediaDataSourceClass = interface(JObjectClass)
    ['{F151577B-1760-4D30-B10E-76366C98EFBC}']
    {class} function init: JMediaDataSource; cdecl;
  end;

  [JavaSignature('android/media/MediaDataSource')]
  JMediaDataSource = interface(JObject)
    ['{5FCFC5A1-995B-4989-878C-B361BC93D355}']
    function getSize: Int64; cdecl;
    function readAt(position: Int64; buffer: TJavaArray<Byte>; offset: Integer; size: Integer): Integer; cdecl;
  end;
  TJMediaDataSource = class(TJavaGenericImport<JMediaDataSourceClass, JMediaDataSource>) end;

  JMediaDescriptionClass = interface(JObjectClass)
    ['{48EF965A-BA6D-4E0D-9E96-295D7FC4A8A7}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/MediaDescription')]
  JMediaDescription = interface(JObject)
    ['{7990BBD4-299A-42B2-9A86-DAB2B978009D}']
    function describeContents: Integer; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getExtras: JBundle; cdecl;
    function getIconBitmap: JBitmap; cdecl;
    function getIconUri: Jnet_Uri; cdecl;
    function getMediaId: JString; cdecl;
    function getMediaUri: Jnet_Uri; cdecl;
    function getSubtitle: JCharSequence; cdecl;
    function getTitle: JCharSequence; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaDescription = class(TJavaGenericImport<JMediaDescriptionClass, JMediaDescription>) end;

  JMediaDescription_BuilderClass = interface(JObjectClass)
    ['{AD916B94-C370-4AB8-8521-CC3665D973EA}']
    {class} function init: JMediaDescription_Builder; cdecl;
  end;

  [JavaSignature('android/media/MediaDescription$Builder')]
  JMediaDescription_Builder = interface(JObject)
    ['{0E5F1828-0ED0-494B-A738-274DC25F2FBF}']
    function build: JMediaDescription; cdecl;
    function setDescription(description: JCharSequence): JMediaDescription_Builder; cdecl;
    function setExtras(extras: JBundle): JMediaDescription_Builder; cdecl;
    function setIconBitmap(icon: JBitmap): JMediaDescription_Builder; cdecl;
    function setIconUri(iconUri: Jnet_Uri): JMediaDescription_Builder; cdecl;
    function setMediaId(mediaId: JString): JMediaDescription_Builder; cdecl;
    function setMediaUri(mediaUri: Jnet_Uri): JMediaDescription_Builder; cdecl;
    function setSubtitle(subtitle: JCharSequence): JMediaDescription_Builder; cdecl;
    function setTitle(title: JCharSequence): JMediaDescription_Builder; cdecl;
  end;
  TJMediaDescription_Builder = class(TJavaGenericImport<JMediaDescription_BuilderClass, JMediaDescription_Builder>) end;

  JMediaDrmClass = interface(JObjectClass)
    ['{C651B2A8-FB61-4FB8-A78A-AC978A0301B6}']
    {class} function _GetEVENT_KEY_EXPIRED: Integer; cdecl;
    {class} function _GetEVENT_KEY_REQUIRED: Integer; cdecl;
    {class} function _GetEVENT_PROVISION_REQUIRED: Integer; cdecl;
    {class} function _GetEVENT_SESSION_RECLAIMED: Integer; cdecl;
    {class} function _GetEVENT_VENDOR_DEFINED: Integer; cdecl;
    {class} function _GetKEY_TYPE_OFFLINE: Integer; cdecl;
    {class} function _GetKEY_TYPE_RELEASE: Integer; cdecl;
    {class} function _GetKEY_TYPE_STREAMING: Integer; cdecl;
    {class} function _GetPROPERTY_ALGORITHMS: JString; cdecl;
    {class} function _GetPROPERTY_DESCRIPTION: JString; cdecl;
    {class} function _GetPROPERTY_DEVICE_UNIQUE_ID: JString; cdecl;
    {class} function _GetPROPERTY_VENDOR: JString; cdecl;
    {class} function _GetPROPERTY_VERSION: JString; cdecl;
    {class} function init(uuid: JUUID): JMediaDrm; cdecl;
    {class} function isCryptoSchemeSupported(uuid: JUUID): Boolean; cdecl; overload;
    {class} function isCryptoSchemeSupported(uuid: JUUID; mimeType: JString): Boolean; cdecl; overload;
    {class} property EVENT_KEY_EXPIRED: Integer read _GetEVENT_KEY_EXPIRED;
    {class} property EVENT_KEY_REQUIRED: Integer read _GetEVENT_KEY_REQUIRED;
    {class} property EVENT_PROVISION_REQUIRED: Integer read _GetEVENT_PROVISION_REQUIRED;
    {class} property EVENT_SESSION_RECLAIMED: Integer read _GetEVENT_SESSION_RECLAIMED;
    {class} property EVENT_VENDOR_DEFINED: Integer read _GetEVENT_VENDOR_DEFINED;
    {class} property KEY_TYPE_OFFLINE: Integer read _GetKEY_TYPE_OFFLINE;
    {class} property KEY_TYPE_RELEASE: Integer read _GetKEY_TYPE_RELEASE;
    {class} property KEY_TYPE_STREAMING: Integer read _GetKEY_TYPE_STREAMING;
    {class} property PROPERTY_ALGORITHMS: JString read _GetPROPERTY_ALGORITHMS;
    {class} property PROPERTY_DESCRIPTION: JString read _GetPROPERTY_DESCRIPTION;
    {class} property PROPERTY_DEVICE_UNIQUE_ID: JString read _GetPROPERTY_DEVICE_UNIQUE_ID;
    {class} property PROPERTY_VENDOR: JString read _GetPROPERTY_VENDOR;
    {class} property PROPERTY_VERSION: JString read _GetPROPERTY_VERSION;
  end;

  [JavaSignature('android/media/MediaDrm')]
  JMediaDrm = interface(JObject)
    ['{5F04A6A3-8E24-418B-B9DF-17F7D05A7679}']
    procedure closeSession(sessionId: TJavaArray<Byte>); cdecl;
    function getCryptoSession(sessionId: TJavaArray<Byte>; cipherAlgorithm: JString; macAlgorithm: JString): JMediaDrm_CryptoSession; cdecl;
    function getKeyRequest(scope: TJavaArray<Byte>; init: TJavaArray<Byte>; mimeType: JString; keyType: Integer; optionalParameters: JHashMap): JMediaDrm_KeyRequest; cdecl;
    function getPropertyByteArray(propertyName: JString): TJavaArray<Byte>; cdecl;
    function getPropertyString(propertyName: JString): JString; cdecl;
    function getProvisionRequest: JMediaDrm_ProvisionRequest; cdecl;
    function getSecureStop(ssid: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function getSecureStops: TJavaObjectArray<JList>; cdecl;
    function openSession: TJavaArray<Byte>; cdecl;
    function provideKeyResponse(scope: TJavaArray<Byte>; response: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    procedure provideProvisionResponse(response: TJavaArray<Byte>); cdecl;
    function queryKeyStatus(sessionId: TJavaArray<Byte>): JHashMap; cdecl;
    procedure release; cdecl;
    procedure releaseAllSecureStops; cdecl;
    procedure releaseSecureStops(ssRelease: TJavaArray<Byte>); cdecl;
    procedure removeKeys(sessionId: TJavaArray<Byte>); cdecl;
    procedure restoreKeys(sessionId: TJavaArray<Byte>; keySetId: TJavaArray<Byte>); cdecl;
    procedure setOnEventListener(listener: JMediaDrm_OnEventListener); cdecl;
    procedure setOnExpirationUpdateListener(listener: JMediaDrm_OnExpirationUpdateListener; handler: JHandler); cdecl;
    procedure setOnKeyStatusChangeListener(listener: JMediaDrm_OnKeyStatusChangeListener; handler: JHandler); cdecl;
    procedure setPropertyByteArray(propertyName: JString; value: TJavaArray<Byte>); cdecl;
    procedure setPropertyString(propertyName: JString; value: JString); cdecl;
  end;
  TJMediaDrm = class(TJavaGenericImport<JMediaDrmClass, JMediaDrm>) end;

  JMediaDrm_CryptoSessionClass = interface(JObjectClass)
    ['{2DC02445-1225-4C69-81FE-1753BE2C6FB2}']
  end;

  [JavaSignature('android/media/MediaDrm$CryptoSession')]
  JMediaDrm_CryptoSession = interface(JObject)
    ['{F42109AE-2871-43EE-B6EA-2D781395C054}']
    function decrypt(keyid: TJavaArray<Byte>; input: TJavaArray<Byte>; iv: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function encrypt(keyid: TJavaArray<Byte>; input: TJavaArray<Byte>; iv: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function sign(keyid: TJavaArray<Byte>; message: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function verify(keyid: TJavaArray<Byte>; message: TJavaArray<Byte>; signature: TJavaArray<Byte>): Boolean; cdecl;
  end;
  TJMediaDrm_CryptoSession = class(TJavaGenericImport<JMediaDrm_CryptoSessionClass, JMediaDrm_CryptoSession>) end;

  JMediaDrm_KeyRequestClass = interface(JObjectClass)
    ['{964AE14A-4E26-41DA-A810-ABD922956875}']
    {class} function _GetREQUEST_TYPE_INITIAL: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_RELEASE: Integer; cdecl;
    {class} function _GetREQUEST_TYPE_RENEWAL: Integer; cdecl;
    {class} property REQUEST_TYPE_INITIAL: Integer read _GetREQUEST_TYPE_INITIAL;
    {class} property REQUEST_TYPE_RELEASE: Integer read _GetREQUEST_TYPE_RELEASE;
    {class} property REQUEST_TYPE_RENEWAL: Integer read _GetREQUEST_TYPE_RENEWAL;
  end;

  [JavaSignature('android/media/MediaDrm$KeyRequest')]
  JMediaDrm_KeyRequest = interface(JObject)
    ['{D00A9BA0-FA23-413F-A5EB-D8CF720DBFB5}']
    function getData: TJavaArray<Byte>; cdecl;
    function getDefaultUrl: JString; cdecl;
    function getRequestType: Integer; cdecl;
  end;
  TJMediaDrm_KeyRequest = class(TJavaGenericImport<JMediaDrm_KeyRequestClass, JMediaDrm_KeyRequest>) end;

  JMediaDrm_KeyStatusClass = interface(JObjectClass)
    ['{3FF8AC02-0C3A-4628-A9FD-BE28D043700A}']
    {class} function _GetSTATUS_EXPIRED: Integer; cdecl;
    {class} function _GetSTATUS_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetSTATUS_OUTPUT_NOT_ALLOWED: Integer; cdecl;
    {class} function _GetSTATUS_PENDING: Integer; cdecl;
    {class} function _GetSTATUS_USABLE: Integer; cdecl;
    {class} property STATUS_EXPIRED: Integer read _GetSTATUS_EXPIRED;
    {class} property STATUS_INTERNAL_ERROR: Integer read _GetSTATUS_INTERNAL_ERROR;
    {class} property STATUS_OUTPUT_NOT_ALLOWED: Integer read _GetSTATUS_OUTPUT_NOT_ALLOWED;
    {class} property STATUS_PENDING: Integer read _GetSTATUS_PENDING;
    {class} property STATUS_USABLE: Integer read _GetSTATUS_USABLE;
  end;

  [JavaSignature('android/media/MediaDrm$KeyStatus')]
  JMediaDrm_KeyStatus = interface(JObject)
    ['{A2D99787-145F-4464-8F6E-2DEFA69F0DED}']
    function getKeyId: TJavaArray<Byte>; cdecl;
    function getStatusCode: Integer; cdecl;
  end;
  TJMediaDrm_KeyStatus = class(TJavaGenericImport<JMediaDrm_KeyStatusClass, JMediaDrm_KeyStatus>) end;

  JMediaDrm_MediaDrmStateExceptionClass = interface(JIllegalStateExceptionClass)
    ['{CD3FEF9C-60BC-4475-B926-D396045CC1A5}']
  end;

  [JavaSignature('android/media/MediaDrm$MediaDrmStateException')]
  JMediaDrm_MediaDrmStateException = interface(JIllegalStateException)
    ['{3664C8EF-AA87-4AED-802E-21D9F86220F4}']
    function getDiagnosticInfo: JString; cdecl;
  end;
  TJMediaDrm_MediaDrmStateException = class(TJavaGenericImport<JMediaDrm_MediaDrmStateExceptionClass, JMediaDrm_MediaDrmStateException>) end;

  JMediaDrm_OnEventListenerClass = interface(IJavaClass)
    ['{CF6EE834-C432-4B0D-8ECB-EE4718331C51}']
  end;

  [JavaSignature('android/media/MediaDrm$OnEventListener')]
  JMediaDrm_OnEventListener = interface(IJavaInstance)
    ['{4DB6D7F5-F0FC-418A-AB37-43AA7721ADFF}']
    procedure onEvent(md: JMediaDrm; sessionId: TJavaArray<Byte>; event: Integer; extra: Integer; data: TJavaArray<Byte>); cdecl;
  end;
  TJMediaDrm_OnEventListener = class(TJavaGenericImport<JMediaDrm_OnEventListenerClass, JMediaDrm_OnEventListener>) end;

  JMediaDrm_OnExpirationUpdateListenerClass = interface(IJavaClass)
    ['{D38B58CC-A6CF-4A6C-B5C2-F29285B3C67F}']
  end;

  [JavaSignature('android/media/MediaDrm$OnExpirationUpdateListener')]
  JMediaDrm_OnExpirationUpdateListener = interface(IJavaInstance)
    ['{759CF711-9B4E-4965-8EFF-AF9FB3101231}']
    procedure onExpirationUpdate(md: JMediaDrm; sessionId: TJavaArray<Byte>; expirationTime: Int64); cdecl;
  end;
  TJMediaDrm_OnExpirationUpdateListener = class(TJavaGenericImport<JMediaDrm_OnExpirationUpdateListenerClass, JMediaDrm_OnExpirationUpdateListener>) end;

  JMediaDrm_OnKeyStatusChangeListenerClass = interface(IJavaClass)
    ['{95ED86EB-B775-47E6-8AD2-86796BFF69D2}']
  end;

  [JavaSignature('android/media/MediaDrm$OnKeyStatusChangeListener')]
  JMediaDrm_OnKeyStatusChangeListener = interface(IJavaInstance)
    ['{CA1EB58D-4CCD-4325-976B-242CDFC71ECA}']
    procedure onKeyStatusChange(md: JMediaDrm; sessionId: TJavaArray<Byte>; keyInformation: JList; hasNewUsableKey: Boolean); cdecl;
  end;
  TJMediaDrm_OnKeyStatusChangeListener = class(TJavaGenericImport<JMediaDrm_OnKeyStatusChangeListenerClass, JMediaDrm_OnKeyStatusChangeListener>) end;

  JMediaDrm_ProvisionRequestClass = interface(JObjectClass)
    ['{7DC946DD-6DB8-48EC-8EE7-2D000D7A7FA1}']
  end;

  [JavaSignature('android/media/MediaDrm$ProvisionRequest')]
  JMediaDrm_ProvisionRequest = interface(JObject)
    ['{91EB8A7F-9E53-4FDC-8D0C-1C0A62A8B16C}']
    function getData: TJavaArray<Byte>; cdecl;
    function getDefaultUrl: JString; cdecl;
  end;
  TJMediaDrm_ProvisionRequest = class(TJavaGenericImport<JMediaDrm_ProvisionRequestClass, JMediaDrm_ProvisionRequest>) end;

  JMediaDrmResetExceptionClass = interface(JIllegalStateExceptionClass)
    ['{1C4CB370-BACA-4292-BECE-FA86BE23E196}']
    {class} function init(detailMessage: JString): JMediaDrmResetException; cdecl;
  end;

  [JavaSignature('android/media/MediaDrmResetException')]
  JMediaDrmResetException = interface(JIllegalStateException)
    ['{D65151B3-A20A-4BD6-BD11-AC70FA453291}']
  end;
  TJMediaDrmResetException = class(TJavaGenericImport<JMediaDrmResetExceptionClass, JMediaDrmResetException>) end;

  JMediaExtractorClass = interface(JObjectClass)
    ['{CAAD040F-C796-427A-91E6-29BD622C8972}']
    {class} function _GetSAMPLE_FLAG_ENCRYPTED: Integer; cdecl;
    {class} function _GetSAMPLE_FLAG_SYNC: Integer; cdecl;
    {class} function _GetSEEK_TO_CLOSEST_SYNC: Integer; cdecl;
    {class} function _GetSEEK_TO_NEXT_SYNC: Integer; cdecl;
    {class} function _GetSEEK_TO_PREVIOUS_SYNC: Integer; cdecl;
    {class} function init: JMediaExtractor; cdecl;
    {class} property SAMPLE_FLAG_ENCRYPTED: Integer read _GetSAMPLE_FLAG_ENCRYPTED;
    {class} property SAMPLE_FLAG_SYNC: Integer read _GetSAMPLE_FLAG_SYNC;
    {class} property SEEK_TO_CLOSEST_SYNC: Integer read _GetSEEK_TO_CLOSEST_SYNC;
    {class} property SEEK_TO_NEXT_SYNC: Integer read _GetSEEK_TO_NEXT_SYNC;
    {class} property SEEK_TO_PREVIOUS_SYNC: Integer read _GetSEEK_TO_PREVIOUS_SYNC;
  end;

  [JavaSignature('android/media/MediaExtractor')]
  JMediaExtractor = interface(JObject)
    ['{0B544D30-92E2-4592-86C8-80CB330796C9}']
    function advance: Boolean; cdecl;
    function getCachedDuration: Int64; cdecl;
    function getPsshInfo: TJavaObjectArray<JMap>; cdecl;
    function getSampleCryptoInfo(info: JMediaCodec_CryptoInfo): Boolean; cdecl;
    function getSampleFlags: Integer; cdecl;
    function getSampleTime: Int64; cdecl;
    function getSampleTrackIndex: Integer; cdecl;
    function getTrackCount: Integer; cdecl;
    function getTrackFormat(index: Integer): JMediaFormat; cdecl;
    function hasCacheReachedEndOfStream: Boolean; cdecl;
    function readSampleData(byteBuf: JByteBuffer; offset: Integer): Integer; cdecl;
    procedure release; cdecl;
    procedure seekTo(timeUs: Int64; mode: Integer); cdecl;
    procedure selectTrack(index: Integer); cdecl;
    procedure setDataSource(dataSource: JMediaDataSource); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri; headers: JMap); cdecl; overload;
    procedure setDataSource(path: JString; headers: JMap); cdecl; overload;
    procedure setDataSource(path: JString); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor; offset: Int64; length: Int64); cdecl; overload;
    procedure unselectTrack(index: Integer); cdecl;
  end;
  TJMediaExtractor = class(TJavaGenericImport<JMediaExtractorClass, JMediaExtractor>) end;

  JMediaFormatClass = interface(JObjectClass)
    ['{60105A0D-2764-4533-8EF5-DCE2759F23CC}']
    {class} function _GetKEY_AAC_DRC_ATTENUATION_FACTOR: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_BOOST_FACTOR: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_HEAVY_COMPRESSION: JString; cdecl;
    {class} function _GetKEY_AAC_DRC_TARGET_REFERENCE_LEVEL: JString; cdecl;
    {class} function _GetKEY_AAC_ENCODED_TARGET_LEVEL: JString; cdecl;
    {class} function _GetKEY_AAC_MAX_OUTPUT_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetKEY_AAC_PROFILE: JString; cdecl;
    {class} function _GetKEY_AAC_SBR_MODE: JString; cdecl;
    {class} function _GetKEY_AUDIO_SESSION_ID: JString; cdecl;
    {class} function _GetKEY_BITRATE_MODE: JString; cdecl;
    {class} function _GetKEY_BIT_RATE: JString; cdecl;
    {class} function _GetKEY_CAPTURE_RATE: JString; cdecl;
    {class} function _GetKEY_CHANNEL_COUNT: JString; cdecl;
    {class} function _GetKEY_CHANNEL_MASK: JString; cdecl;
    {class} function _GetKEY_COLOR_FORMAT: JString; cdecl;
    {class} function _GetKEY_COMPLEXITY: JString; cdecl;
    {class} function _GetKEY_DURATION: JString; cdecl;
    {class} function _GetKEY_FLAC_COMPRESSION_LEVEL: JString; cdecl;
    {class} function _GetKEY_FRAME_RATE: JString; cdecl;
    {class} function _GetKEY_HEIGHT: JString; cdecl;
    {class} function _GetKEY_IS_ADTS: JString; cdecl;
    {class} function _GetKEY_IS_AUTOSELECT: JString; cdecl;
    {class} function _GetKEY_IS_DEFAULT: JString; cdecl;
    {class} function _GetKEY_IS_FORCED_SUBTITLE: JString; cdecl;
    {class} function _GetKEY_I_FRAME_INTERVAL: JString; cdecl;
    {class} function _GetKEY_LANGUAGE: JString; cdecl;
    {class} function _GetKEY_LEVEL: JString; cdecl;
    {class} function _GetKEY_MAX_HEIGHT: JString; cdecl;
    {class} function _GetKEY_MAX_INPUT_SIZE: JString; cdecl;
    {class} function _GetKEY_MAX_WIDTH: JString; cdecl;
    {class} function _GetKEY_MIME: JString; cdecl;
    {class} function _GetKEY_OPERATING_RATE: JString; cdecl;
    {class} function _GetKEY_PRIORITY: JString; cdecl;
    {class} function _GetKEY_PROFILE: JString; cdecl;
    {class} function _GetKEY_PUSH_BLANK_BUFFERS_ON_STOP: JString; cdecl;
    {class} function _GetKEY_REPEAT_PREVIOUS_FRAME_AFTER: JString; cdecl;
    {class} function _GetKEY_ROTATION: JString; cdecl;
    {class} function _GetKEY_SAMPLE_RATE: JString; cdecl;
    {class} function _GetKEY_SLICE_HEIGHT: JString; cdecl;
    {class} function _GetKEY_STRIDE: JString; cdecl;
    {class} function _GetKEY_TEMPORAL_LAYERING: JString; cdecl;
    {class} function _GetKEY_WIDTH: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AAC: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AC3: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AMR_NB: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_AMR_WB: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_EAC3: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_FLAC: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_G711_ALAW: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_G711_MLAW: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MPEG: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_MSGSM: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_OPUS: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_QCELP: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_RAW: JString; cdecl;
    {class} function _GetMIMETYPE_AUDIO_VORBIS: JString; cdecl;
    {class} function _GetMIMETYPE_TEXT_CEA_608: JString; cdecl;
    {class} function _GetMIMETYPE_TEXT_VTT: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_AVC: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_H263: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_HEVC: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_MPEG2: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_MPEG4: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_RAW: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_VP8: JString; cdecl;
    {class} function _GetMIMETYPE_VIDEO_VP9: JString; cdecl;
    {class} function init: JMediaFormat; cdecl;
    {class} function createAudioFormat(mime: JString; sampleRate: Integer; channelCount: Integer): JMediaFormat; cdecl;
    {class} function createSubtitleFormat(mime: JString; language: JString): JMediaFormat; cdecl;
    {class} function createVideoFormat(mime: JString; width: Integer; height: Integer): JMediaFormat; cdecl;
    {class} property KEY_AAC_DRC_ATTENUATION_FACTOR: JString read _GetKEY_AAC_DRC_ATTENUATION_FACTOR;
    {class} property KEY_AAC_DRC_BOOST_FACTOR: JString read _GetKEY_AAC_DRC_BOOST_FACTOR;
    {class} property KEY_AAC_DRC_HEAVY_COMPRESSION: JString read _GetKEY_AAC_DRC_HEAVY_COMPRESSION;
    {class} property KEY_AAC_DRC_TARGET_REFERENCE_LEVEL: JString read _GetKEY_AAC_DRC_TARGET_REFERENCE_LEVEL;
    {class} property KEY_AAC_ENCODED_TARGET_LEVEL: JString read _GetKEY_AAC_ENCODED_TARGET_LEVEL;
    {class} property KEY_AAC_MAX_OUTPUT_CHANNEL_COUNT: JString read _GetKEY_AAC_MAX_OUTPUT_CHANNEL_COUNT;
    {class} property KEY_AAC_PROFILE: JString read _GetKEY_AAC_PROFILE;
    {class} property KEY_AAC_SBR_MODE: JString read _GetKEY_AAC_SBR_MODE;
    {class} property KEY_AUDIO_SESSION_ID: JString read _GetKEY_AUDIO_SESSION_ID;
    {class} property KEY_BITRATE_MODE: JString read _GetKEY_BITRATE_MODE;
    {class} property KEY_BIT_RATE: JString read _GetKEY_BIT_RATE;
    {class} property KEY_CAPTURE_RATE: JString read _GetKEY_CAPTURE_RATE;
    {class} property KEY_CHANNEL_COUNT: JString read _GetKEY_CHANNEL_COUNT;
    {class} property KEY_CHANNEL_MASK: JString read _GetKEY_CHANNEL_MASK;
    {class} property KEY_COLOR_FORMAT: JString read _GetKEY_COLOR_FORMAT;
    {class} property KEY_COMPLEXITY: JString read _GetKEY_COMPLEXITY;
    {class} property KEY_DURATION: JString read _GetKEY_DURATION;
    {class} property KEY_FLAC_COMPRESSION_LEVEL: JString read _GetKEY_FLAC_COMPRESSION_LEVEL;
    {class} property KEY_FRAME_RATE: JString read _GetKEY_FRAME_RATE;
    {class} property KEY_HEIGHT: JString read _GetKEY_HEIGHT;
    {class} property KEY_IS_ADTS: JString read _GetKEY_IS_ADTS;
    {class} property KEY_IS_AUTOSELECT: JString read _GetKEY_IS_AUTOSELECT;
    {class} property KEY_IS_DEFAULT: JString read _GetKEY_IS_DEFAULT;
    {class} property KEY_IS_FORCED_SUBTITLE: JString read _GetKEY_IS_FORCED_SUBTITLE;
    {class} property KEY_I_FRAME_INTERVAL: JString read _GetKEY_I_FRAME_INTERVAL;
    {class} property KEY_LANGUAGE: JString read _GetKEY_LANGUAGE;
    {class} property KEY_LEVEL: JString read _GetKEY_LEVEL;
    {class} property KEY_MAX_HEIGHT: JString read _GetKEY_MAX_HEIGHT;
    {class} property KEY_MAX_INPUT_SIZE: JString read _GetKEY_MAX_INPUT_SIZE;
    {class} property KEY_MAX_WIDTH: JString read _GetKEY_MAX_WIDTH;
    {class} property KEY_MIME: JString read _GetKEY_MIME;
    {class} property KEY_OPERATING_RATE: JString read _GetKEY_OPERATING_RATE;
    {class} property KEY_PRIORITY: JString read _GetKEY_PRIORITY;
    {class} property KEY_PROFILE: JString read _GetKEY_PROFILE;
    {class} property KEY_PUSH_BLANK_BUFFERS_ON_STOP: JString read _GetKEY_PUSH_BLANK_BUFFERS_ON_STOP;
    {class} property KEY_REPEAT_PREVIOUS_FRAME_AFTER: JString read _GetKEY_REPEAT_PREVIOUS_FRAME_AFTER;
    {class} property KEY_ROTATION: JString read _GetKEY_ROTATION;
    {class} property KEY_SAMPLE_RATE: JString read _GetKEY_SAMPLE_RATE;
    {class} property KEY_SLICE_HEIGHT: JString read _GetKEY_SLICE_HEIGHT;
    {class} property KEY_STRIDE: JString read _GetKEY_STRIDE;
    {class} property KEY_TEMPORAL_LAYERING: JString read _GetKEY_TEMPORAL_LAYERING;
    {class} property KEY_WIDTH: JString read _GetKEY_WIDTH;
    {class} property MIMETYPE_AUDIO_AAC: JString read _GetMIMETYPE_AUDIO_AAC;
    {class} property MIMETYPE_AUDIO_AC3: JString read _GetMIMETYPE_AUDIO_AC3;
    {class} property MIMETYPE_AUDIO_AMR_NB: JString read _GetMIMETYPE_AUDIO_AMR_NB;
    {class} property MIMETYPE_AUDIO_AMR_WB: JString read _GetMIMETYPE_AUDIO_AMR_WB;
    {class} property MIMETYPE_AUDIO_EAC3: JString read _GetMIMETYPE_AUDIO_EAC3;
    {class} property MIMETYPE_AUDIO_FLAC: JString read _GetMIMETYPE_AUDIO_FLAC;
    {class} property MIMETYPE_AUDIO_G711_ALAW: JString read _GetMIMETYPE_AUDIO_G711_ALAW;
    {class} property MIMETYPE_AUDIO_G711_MLAW: JString read _GetMIMETYPE_AUDIO_G711_MLAW;
    {class} property MIMETYPE_AUDIO_MPEG: JString read _GetMIMETYPE_AUDIO_MPEG;
    {class} property MIMETYPE_AUDIO_MSGSM: JString read _GetMIMETYPE_AUDIO_MSGSM;
    {class} property MIMETYPE_AUDIO_OPUS: JString read _GetMIMETYPE_AUDIO_OPUS;
    {class} property MIMETYPE_AUDIO_QCELP: JString read _GetMIMETYPE_AUDIO_QCELP;
    {class} property MIMETYPE_AUDIO_RAW: JString read _GetMIMETYPE_AUDIO_RAW;
    {class} property MIMETYPE_AUDIO_VORBIS: JString read _GetMIMETYPE_AUDIO_VORBIS;
    {class} property MIMETYPE_TEXT_CEA_608: JString read _GetMIMETYPE_TEXT_CEA_608;
    {class} property MIMETYPE_TEXT_VTT: JString read _GetMIMETYPE_TEXT_VTT;
    {class} property MIMETYPE_VIDEO_AVC: JString read _GetMIMETYPE_VIDEO_AVC;
    {class} property MIMETYPE_VIDEO_H263: JString read _GetMIMETYPE_VIDEO_H263;
    {class} property MIMETYPE_VIDEO_HEVC: JString read _GetMIMETYPE_VIDEO_HEVC;
    {class} property MIMETYPE_VIDEO_MPEG2: JString read _GetMIMETYPE_VIDEO_MPEG2;
    {class} property MIMETYPE_VIDEO_MPEG4: JString read _GetMIMETYPE_VIDEO_MPEG4;
    {class} property MIMETYPE_VIDEO_RAW: JString read _GetMIMETYPE_VIDEO_RAW;
    {class} property MIMETYPE_VIDEO_VP8: JString read _GetMIMETYPE_VIDEO_VP8;
    {class} property MIMETYPE_VIDEO_VP9: JString read _GetMIMETYPE_VIDEO_VP9;
  end;

  [JavaSignature('android/media/MediaFormat')]
  JMediaFormat = interface(JObject)
    ['{93B4C18E-4FE8-4AA6-9E32-469B5CC4E6DC}']
    function containsKey(name: JString): Boolean; cdecl;
    function getByteBuffer(name: JString): JByteBuffer; cdecl;
    function getFeatureEnabled(feature: JString): Boolean; cdecl;
    function getFloat(name: JString): Single; cdecl;
    function getInteger(name: JString): Integer; cdecl;
    function getLong(name: JString): Int64; cdecl;
    function getString(name: JString): JString; cdecl;
    procedure setByteBuffer(name: JString; bytes: JByteBuffer); cdecl;
    procedure setFeatureEnabled(feature: JString; enabled: Boolean); cdecl;
    procedure setFloat(name: JString; value: Single); cdecl;
    procedure setInteger(name: JString; value: Integer); cdecl;
    procedure setLong(name: JString; value: Int64); cdecl;
    procedure setString(name: JString; value: JString); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaFormat = class(TJavaGenericImport<JMediaFormatClass, JMediaFormat>) end;

  Jmedia_MediaMetadataClass = interface(JObjectClass)
    ['{2204D633-3F5A-49E0-9B8B-877BED88ECE8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM: JString; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM_ART: JString; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM_ARTIST: JString; cdecl;
    {class} function _GetMETADATA_KEY_ALBUM_ART_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_ART: JString; cdecl;
    {class} function _GetMETADATA_KEY_ARTIST: JString; cdecl;
    {class} function _GetMETADATA_KEY_ART_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_AUTHOR: JString; cdecl;
    {class} function _GetMETADATA_KEY_COMPILATION: JString; cdecl;
    {class} function _GetMETADATA_KEY_COMPOSER: JString; cdecl;
    {class} function _GetMETADATA_KEY_DATE: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISC_NUMBER: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_DESCRIPTION: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_ICON: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_ICON_URI: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_SUBTITLE: JString; cdecl;
    {class} function _GetMETADATA_KEY_DISPLAY_TITLE: JString; cdecl;
    {class} function _GetMETADATA_KEY_DURATION: JString; cdecl;
    {class} function _GetMETADATA_KEY_GENRE: JString; cdecl;
    {class} function _GetMETADATA_KEY_MEDIA_ID: JString; cdecl;
    {class} function _GetMETADATA_KEY_NUM_TRACKS: JString; cdecl;
    {class} function _GetMETADATA_KEY_RATING: JString; cdecl;
    {class} function _GetMETADATA_KEY_TITLE: JString; cdecl;
    {class} function _GetMETADATA_KEY_TRACK_NUMBER: JString; cdecl;
    {class} function _GetMETADATA_KEY_USER_RATING: JString; cdecl;
    {class} function _GetMETADATA_KEY_WRITER: JString; cdecl;
    {class} function _GetMETADATA_KEY_YEAR: JString; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property METADATA_KEY_ALBUM: JString read _GetMETADATA_KEY_ALBUM;
    {class} property METADATA_KEY_ALBUM_ART: JString read _GetMETADATA_KEY_ALBUM_ART;
    {class} property METADATA_KEY_ALBUM_ARTIST: JString read _GetMETADATA_KEY_ALBUM_ARTIST;
    {class} property METADATA_KEY_ALBUM_ART_URI: JString read _GetMETADATA_KEY_ALBUM_ART_URI;
    {class} property METADATA_KEY_ART: JString read _GetMETADATA_KEY_ART;
    {class} property METADATA_KEY_ARTIST: JString read _GetMETADATA_KEY_ARTIST;
    {class} property METADATA_KEY_ART_URI: JString read _GetMETADATA_KEY_ART_URI;
    {class} property METADATA_KEY_AUTHOR: JString read _GetMETADATA_KEY_AUTHOR;
    {class} property METADATA_KEY_COMPILATION: JString read _GetMETADATA_KEY_COMPILATION;
    {class} property METADATA_KEY_COMPOSER: JString read _GetMETADATA_KEY_COMPOSER;
    {class} property METADATA_KEY_DATE: JString read _GetMETADATA_KEY_DATE;
    {class} property METADATA_KEY_DISC_NUMBER: JString read _GetMETADATA_KEY_DISC_NUMBER;
    {class} property METADATA_KEY_DISPLAY_DESCRIPTION: JString read _GetMETADATA_KEY_DISPLAY_DESCRIPTION;
    {class} property METADATA_KEY_DISPLAY_ICON: JString read _GetMETADATA_KEY_DISPLAY_ICON;
    {class} property METADATA_KEY_DISPLAY_ICON_URI: JString read _GetMETADATA_KEY_DISPLAY_ICON_URI;
    {class} property METADATA_KEY_DISPLAY_SUBTITLE: JString read _GetMETADATA_KEY_DISPLAY_SUBTITLE;
    {class} property METADATA_KEY_DISPLAY_TITLE: JString read _GetMETADATA_KEY_DISPLAY_TITLE;
    {class} property METADATA_KEY_DURATION: JString read _GetMETADATA_KEY_DURATION;
    {class} property METADATA_KEY_GENRE: JString read _GetMETADATA_KEY_GENRE;
    {class} property METADATA_KEY_MEDIA_ID: JString read _GetMETADATA_KEY_MEDIA_ID;
    {class} property METADATA_KEY_NUM_TRACKS: JString read _GetMETADATA_KEY_NUM_TRACKS;
    {class} property METADATA_KEY_RATING: JString read _GetMETADATA_KEY_RATING;
    {class} property METADATA_KEY_TITLE: JString read _GetMETADATA_KEY_TITLE;
    {class} property METADATA_KEY_TRACK_NUMBER: JString read _GetMETADATA_KEY_TRACK_NUMBER;
    {class} property METADATA_KEY_USER_RATING: JString read _GetMETADATA_KEY_USER_RATING;
    {class} property METADATA_KEY_WRITER: JString read _GetMETADATA_KEY_WRITER;
    {class} property METADATA_KEY_YEAR: JString read _GetMETADATA_KEY_YEAR;
  end;

  [JavaSignature('android/media/MediaMetadata')]
  Jmedia_MediaMetadata = interface(JObject)
    ['{7FAEFB8D-C99D-459F-8A3C-4476B15DF5DB}']
    function containsKey(key: JString): Boolean; cdecl;
    function describeContents: Integer; cdecl;
    function getBitmap(key: JString): JBitmap; cdecl;
    function getDescription: JMediaDescription; cdecl;
    function getLong(key: JString): Int64; cdecl;
    function getRating(key: JString): JRating; cdecl;
    function getString(key: JString): JString; cdecl;
    function getText(key: JString): JCharSequence; cdecl;
    function keySet: JSet; cdecl;
    function size: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJmedia_MediaMetadata = class(TJavaGenericImport<Jmedia_MediaMetadataClass, Jmedia_MediaMetadata>) end;

  JMediaMetadata_BuilderClass = interface(JObjectClass)
    ['{B01B3502-75B4-4728-8517-51DBE5BF3877}']
    {class} function init: JMediaMetadata_Builder; cdecl; overload;
    {class} function init(source: Jmedia_MediaMetadata): JMediaMetadata_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/MediaMetadata$Builder')]
  JMediaMetadata_Builder = interface(JObject)
    ['{AED3AB63-592B-4E66-947F-86532D4FAC74}']
    function build: Jmedia_MediaMetadata; cdecl;
    function putBitmap(key: JString; value: JBitmap): JMediaMetadata_Builder; cdecl;
    function putLong(key: JString; value: Int64): JMediaMetadata_Builder; cdecl;
    function putRating(key: JString; value: JRating): JMediaMetadata_Builder; cdecl;
    function putString(key: JString; value: JString): JMediaMetadata_Builder; cdecl;
    function putText(key: JString; value: JCharSequence): JMediaMetadata_Builder; cdecl;
  end;
  TJMediaMetadata_Builder = class(TJavaGenericImport<JMediaMetadata_BuilderClass, JMediaMetadata_Builder>) end;

  JMediaMetadataEditorClass = interface(JObjectClass)
    ['{9DAEB2EA-4239-4CD5-94D0-B399E8D41B54}']
    {class} function _GetBITMAP_KEY_ARTWORK: Integer; cdecl;
    {class} function _GetRATING_KEY_BY_OTHERS: Integer; cdecl;
    {class} function _GetRATING_KEY_BY_USER: Integer; cdecl;
    {class} property BITMAP_KEY_ARTWORK: Integer read _GetBITMAP_KEY_ARTWORK;
    {class} property RATING_KEY_BY_OTHERS: Integer read _GetRATING_KEY_BY_OTHERS;
    {class} property RATING_KEY_BY_USER: Integer read _GetRATING_KEY_BY_USER;
  end;

  [JavaSignature('android/media/MediaMetadataEditor')]
  JMediaMetadataEditor = interface(JObject)
    ['{C0B1B71F-FC48-4E17-8B68-19B83612F2B1}']
    procedure addEditableKey(key: Integer); cdecl;
    procedure apply; cdecl;
    procedure clear; cdecl;
    function getBitmap(key: Integer; defaultValue: JBitmap): JBitmap; cdecl;
    function getEditableKeys: TJavaArray<Integer>; cdecl;
    function getLong(key: Integer; defaultValue: Int64): Int64; cdecl;
    function getObject(key: Integer; defaultValue: JObject): JObject; cdecl;
    function getString(key: Integer; defaultValue: JString): JString; cdecl;
    function putBitmap(key: Integer; bitmap: JBitmap): JMediaMetadataEditor; cdecl;
    function putLong(key: Integer; value: Int64): JMediaMetadataEditor; cdecl;
    function putObject(key: Integer; value: JObject): JMediaMetadataEditor; cdecl;
    function putString(key: Integer; value: JString): JMediaMetadataEditor; cdecl;
    procedure removeEditableKeys; cdecl;
  end;
  TJMediaMetadataEditor = class(TJavaGenericImport<JMediaMetadataEditorClass, JMediaMetadataEditor>) end;

  JMediaMetadataRetrieverClass = interface(JObjectClass)
    ['{A5C39E03-F4F3-4A10-B43C-0A01C64CB8A9}']
    {class} function _GetMETADATA_KEY_ALBUM: Integer; cdecl;
    {class} function _GetMETADATA_KEY_ALBUMARTIST: Integer; cdecl;
    {class} function _GetMETADATA_KEY_ARTIST: Integer; cdecl;
    {class} function _GetMETADATA_KEY_AUTHOR: Integer; cdecl;
    {class} function _GetMETADATA_KEY_BITRATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_CAPTURE_FRAMERATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_CD_TRACK_NUMBER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COMPILATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_COMPOSER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_DATE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_DISC_NUMBER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_DURATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_GENRE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_HAS_AUDIO: Integer; cdecl;
    {class} function _GetMETADATA_KEY_HAS_VIDEO: Integer; cdecl;
    {class} function _GetMETADATA_KEY_LOCATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_MIMETYPE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_NUM_TRACKS: Integer; cdecl;
    {class} function _GetMETADATA_KEY_TITLE: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_HEIGHT: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_ROTATION: Integer; cdecl;
    {class} function _GetMETADATA_KEY_VIDEO_WIDTH: Integer; cdecl;
    {class} function _GetMETADATA_KEY_WRITER: Integer; cdecl;
    {class} function _GetMETADATA_KEY_YEAR: Integer; cdecl;
    {class} function _GetOPTION_CLOSEST: Integer; cdecl;
    {class} function _GetOPTION_CLOSEST_SYNC: Integer; cdecl;
    {class} function _GetOPTION_NEXT_SYNC: Integer; cdecl;
    {class} function _GetOPTION_PREVIOUS_SYNC: Integer; cdecl;
    {class} function init: JMediaMetadataRetriever; cdecl;
    {class} property METADATA_KEY_ALBUM: Integer read _GetMETADATA_KEY_ALBUM;
    {class} property METADATA_KEY_ALBUMARTIST: Integer read _GetMETADATA_KEY_ALBUMARTIST;
    {class} property METADATA_KEY_ARTIST: Integer read _GetMETADATA_KEY_ARTIST;
    {class} property METADATA_KEY_AUTHOR: Integer read _GetMETADATA_KEY_AUTHOR;
    {class} property METADATA_KEY_BITRATE: Integer read _GetMETADATA_KEY_BITRATE;
    {class} property METADATA_KEY_CAPTURE_FRAMERATE: Integer read _GetMETADATA_KEY_CAPTURE_FRAMERATE;
    {class} property METADATA_KEY_CD_TRACK_NUMBER: Integer read _GetMETADATA_KEY_CD_TRACK_NUMBER;
    {class} property METADATA_KEY_COMPILATION: Integer read _GetMETADATA_KEY_COMPILATION;
    {class} property METADATA_KEY_COMPOSER: Integer read _GetMETADATA_KEY_COMPOSER;
    {class} property METADATA_KEY_DATE: Integer read _GetMETADATA_KEY_DATE;
    {class} property METADATA_KEY_DISC_NUMBER: Integer read _GetMETADATA_KEY_DISC_NUMBER;
    {class} property METADATA_KEY_DURATION: Integer read _GetMETADATA_KEY_DURATION;
    {class} property METADATA_KEY_GENRE: Integer read _GetMETADATA_KEY_GENRE;
    {class} property METADATA_KEY_HAS_AUDIO: Integer read _GetMETADATA_KEY_HAS_AUDIO;
    {class} property METADATA_KEY_HAS_VIDEO: Integer read _GetMETADATA_KEY_HAS_VIDEO;
    {class} property METADATA_KEY_LOCATION: Integer read _GetMETADATA_KEY_LOCATION;
    {class} property METADATA_KEY_MIMETYPE: Integer read _GetMETADATA_KEY_MIMETYPE;
    {class} property METADATA_KEY_NUM_TRACKS: Integer read _GetMETADATA_KEY_NUM_TRACKS;
    {class} property METADATA_KEY_TITLE: Integer read _GetMETADATA_KEY_TITLE;
    {class} property METADATA_KEY_VIDEO_HEIGHT: Integer read _GetMETADATA_KEY_VIDEO_HEIGHT;
    {class} property METADATA_KEY_VIDEO_ROTATION: Integer read _GetMETADATA_KEY_VIDEO_ROTATION;
    {class} property METADATA_KEY_VIDEO_WIDTH: Integer read _GetMETADATA_KEY_VIDEO_WIDTH;
    {class} property METADATA_KEY_WRITER: Integer read _GetMETADATA_KEY_WRITER;
    {class} property METADATA_KEY_YEAR: Integer read _GetMETADATA_KEY_YEAR;
    {class} property OPTION_CLOSEST: Integer read _GetOPTION_CLOSEST;
    {class} property OPTION_CLOSEST_SYNC: Integer read _GetOPTION_CLOSEST_SYNC;
    {class} property OPTION_NEXT_SYNC: Integer read _GetOPTION_NEXT_SYNC;
    {class} property OPTION_PREVIOUS_SYNC: Integer read _GetOPTION_PREVIOUS_SYNC;
  end;

  [JavaSignature('android/media/MediaMetadataRetriever')]
  JMediaMetadataRetriever = interface(JObject)
    ['{FE494ED1-BDE3-4DC1-BB24-35F061DE55DC}']
    function extractMetadata(keyCode: Integer): JString; cdecl;
    function getEmbeddedPicture: TJavaArray<Byte>; cdecl;
    function getFrameAtTime(timeUs: Int64; option: Integer): JBitmap; cdecl; overload;
    function getFrameAtTime(timeUs: Int64): JBitmap; cdecl; overload;
    function getFrameAtTime: JBitmap; cdecl; overload;
    procedure release; cdecl;
    procedure setDataSource(path: JString); cdecl; overload;
    procedure setDataSource(uri: JString; headers: JMap); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor; offset: Int64; length: Int64); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri); cdecl; overload;
    procedure setDataSource(dataSource: JMediaDataSource); cdecl; overload;
  end;
  TJMediaMetadataRetriever = class(TJavaGenericImport<JMediaMetadataRetrieverClass, JMediaMetadataRetriever>) end;

  JMediaMuxerClass = interface(JObjectClass)
    ['{2D17D70B-C9D2-4B57-87FA-0D726CEC9078}']
    {class} function init(path: JString; format: Integer): JMediaMuxer; cdecl;
  end;

  [JavaSignature('android/media/MediaMuxer')]
  JMediaMuxer = interface(JObject)
    ['{CD2A8ED6-F79C-46C9-AF4C-5FCACFE8CB9E}']
    function addTrack(format: JMediaFormat): Integer; cdecl;
    procedure release; cdecl;
    procedure setLocation(latitude: Single; longitude: Single); cdecl;
    procedure setOrientationHint(degrees: Integer); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure writeSampleData(trackIndex: Integer; byteBuf: JByteBuffer; bufferInfo: JMediaCodec_BufferInfo); cdecl;
  end;
  TJMediaMuxer = class(TJavaGenericImport<JMediaMuxerClass, JMediaMuxer>) end;

  JMediaMuxer_OutputFormatClass = interface(JObjectClass)
    ['{F6EB670C-37E3-4066-9F7A-290A3D6AD905}']
    {class} function _GetMUXER_OUTPUT_MPEG_4: Integer; cdecl;
    {class} function _GetMUXER_OUTPUT_WEBM: Integer; cdecl;
    {class} property MUXER_OUTPUT_MPEG_4: Integer read _GetMUXER_OUTPUT_MPEG_4;
    {class} property MUXER_OUTPUT_WEBM: Integer read _GetMUXER_OUTPUT_WEBM;
  end;

  [JavaSignature('android/media/MediaMuxer$OutputFormat')]
  JMediaMuxer_OutputFormat = interface(JObject)
    ['{40A3AF3E-CAA5-4779-B297-9EB9F25EF337}']
  end;
  TJMediaMuxer_OutputFormat = class(TJavaGenericImport<JMediaMuxer_OutputFormatClass, JMediaMuxer_OutputFormat>) end;

  JMediaPlayerClass = interface(JObjectClass)
    ['{5C9CABE2-E9F5-4990-8E18-6D0BB6C469FB}']
    {class} function _GetMEDIA_ERROR_IO: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_MALFORMED: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_SERVER_DIED: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_TIMED_OUT: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_ERROR_UNSUPPORTED: Integer; cdecl;
    {class} function _GetMEDIA_INFO_BAD_INTERLEAVING: Integer; cdecl;
    {class} function _GetMEDIA_INFO_BUFFERING_END: Integer; cdecl;
    {class} function _GetMEDIA_INFO_BUFFERING_START: Integer; cdecl;
    {class} function _GetMEDIA_INFO_METADATA_UPDATE: Integer; cdecl;
    {class} function _GetMEDIA_INFO_NOT_SEEKABLE: Integer; cdecl;
    {class} function _GetMEDIA_INFO_SUBTITLE_TIMED_OUT: Integer; cdecl;
    {class} function _GetMEDIA_INFO_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_INFO_UNSUPPORTED_SUBTITLE: Integer; cdecl;
    {class} function _GetMEDIA_INFO_VIDEO_RENDERING_START: Integer; cdecl;
    {class} function _GetMEDIA_INFO_VIDEO_TRACK_LAGGING: Integer; cdecl;
    {class} function _GetMEDIA_MIMETYPE_TEXT_SUBRIP: JString; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT: Integer; cdecl;
    {class} function _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer; cdecl;
    {class} function init: JMediaPlayer; cdecl;
    {class} function create(context: JContext; uri: Jnet_Uri): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; uri: Jnet_Uri; holder: JSurfaceHolder): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; uri: Jnet_Uri; holder: JSurfaceHolder; audioAttributes: JAudioAttributes; audioSessionId: Integer): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; resid: Integer): JMediaPlayer; cdecl; overload;
    {class} function create(context: JContext; resid: Integer; audioAttributes: JAudioAttributes; audioSessionId: Integer): JMediaPlayer; cdecl; overload;
    {class} property MEDIA_ERROR_IO: Integer read _GetMEDIA_ERROR_IO;
    {class} property MEDIA_ERROR_MALFORMED: Integer read _GetMEDIA_ERROR_MALFORMED;
    {class} property MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK: Integer read _GetMEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK;
    {class} property MEDIA_ERROR_SERVER_DIED: Integer read _GetMEDIA_ERROR_SERVER_DIED;
    {class} property MEDIA_ERROR_TIMED_OUT: Integer read _GetMEDIA_ERROR_TIMED_OUT;
    {class} property MEDIA_ERROR_UNKNOWN: Integer read _GetMEDIA_ERROR_UNKNOWN;
    {class} property MEDIA_ERROR_UNSUPPORTED: Integer read _GetMEDIA_ERROR_UNSUPPORTED;
    {class} property MEDIA_INFO_BAD_INTERLEAVING: Integer read _GetMEDIA_INFO_BAD_INTERLEAVING;
    {class} property MEDIA_INFO_BUFFERING_END: Integer read _GetMEDIA_INFO_BUFFERING_END;
    {class} property MEDIA_INFO_BUFFERING_START: Integer read _GetMEDIA_INFO_BUFFERING_START;
    {class} property MEDIA_INFO_METADATA_UPDATE: Integer read _GetMEDIA_INFO_METADATA_UPDATE;
    {class} property MEDIA_INFO_NOT_SEEKABLE: Integer read _GetMEDIA_INFO_NOT_SEEKABLE;
    {class} property MEDIA_INFO_SUBTITLE_TIMED_OUT: Integer read _GetMEDIA_INFO_SUBTITLE_TIMED_OUT;
    {class} property MEDIA_INFO_UNKNOWN: Integer read _GetMEDIA_INFO_UNKNOWN;
    {class} property MEDIA_INFO_UNSUPPORTED_SUBTITLE: Integer read _GetMEDIA_INFO_UNSUPPORTED_SUBTITLE;
    {class} property MEDIA_INFO_VIDEO_RENDERING_START: Integer read _GetMEDIA_INFO_VIDEO_RENDERING_START;
    {class} property MEDIA_INFO_VIDEO_TRACK_LAGGING: Integer read _GetMEDIA_INFO_VIDEO_TRACK_LAGGING;
    {class} property MEDIA_MIMETYPE_TEXT_SUBRIP: JString read _GetMEDIA_MIMETYPE_TEXT_SUBRIP;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT;
    {class} property VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING: Integer read _GetVIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING;
  end;

  [JavaSignature('android/media/MediaPlayer')]
  JMediaPlayer = interface(JObject)
    ['{BC844B6F-92C1-4D1D-93C5-E9B18351F502}']
    procedure addTimedTextSource(path: JString; mimeType: JString); cdecl; overload;
    procedure addTimedTextSource(context: JContext; uri: Jnet_Uri; mimeType: JString); cdecl; overload;
    procedure addTimedTextSource(fd: JFileDescriptor; mimeType: JString); cdecl; overload;
    procedure addTimedTextSource(fd: JFileDescriptor; offset: Int64; length: Int64; mime: JString); cdecl; overload;
    procedure attachAuxEffect(effectId: Integer); cdecl;
    procedure deselectTrack(index: Integer); cdecl;
    function getAudioSessionId: Integer; cdecl;
    function getCurrentPosition: Integer; cdecl;
    function getDuration: Integer; cdecl;
    function getPlaybackParams: JPlaybackParams; cdecl;
    function getSelectedTrack(trackType: Integer): Integer; cdecl;
    function getSyncParams: JSyncParams; cdecl;
    function getTimestamp: JMediaTimestamp; cdecl;
    function getTrackInfo: TJavaObjectArray<JMediaPlayer_TrackInfo>; cdecl;
    function getVideoHeight: Integer; cdecl;
    function getVideoWidth: Integer; cdecl;
    function isLooping: Boolean; cdecl;
    function isPlaying: Boolean; cdecl;
    procedure pause; cdecl;
    procedure prepare; cdecl;
    procedure prepareAsync; cdecl;
    procedure release; cdecl;
    procedure reset; cdecl;
    procedure seekTo(msec: Integer); cdecl;
    procedure selectTrack(index: Integer); cdecl;
    procedure setAudioAttributes(attributes: JAudioAttributes); cdecl;
    procedure setAudioSessionId(sessionId: Integer); cdecl;
    procedure setAudioStreamType(streamtype: Integer); cdecl;
    procedure setAuxEffectSendLevel(level: Single); cdecl;
    procedure setDataSource(context: JContext; uri: Jnet_Uri); cdecl; overload;
    procedure setDataSource(context: JContext; uri: Jnet_Uri; headers: JMap); cdecl; overload;
    procedure setDataSource(path: JString); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor); cdecl; overload;
    procedure setDataSource(fd: JFileDescriptor; offset: Int64; length: Int64); cdecl; overload;
    procedure setDataSource(dataSource: JMediaDataSource); cdecl; overload;
    procedure setDisplay(sh: JSurfaceHolder); cdecl;
    procedure setLooping(looping: Boolean); cdecl;
    procedure setNextMediaPlayer(next: JMediaPlayer); cdecl;
    procedure setOnBufferingUpdateListener(listener: JMediaPlayer_OnBufferingUpdateListener); cdecl;
    procedure setOnCompletionListener(listener: JMediaPlayer_OnCompletionListener); cdecl;
    procedure setOnErrorListener(listener: JMediaPlayer_OnErrorListener); cdecl;
    procedure setOnInfoListener(listener: JMediaPlayer_OnInfoListener); cdecl;
    procedure setOnPreparedListener(listener: JMediaPlayer_OnPreparedListener); cdecl;
    procedure setOnSeekCompleteListener(listener: JMediaPlayer_OnSeekCompleteListener); cdecl;
    procedure setOnTimedMetaDataAvailableListener(listener: JMediaPlayer_OnTimedMetaDataAvailableListener); cdecl;
    procedure setOnTimedTextListener(listener: JMediaPlayer_OnTimedTextListener); cdecl;
    procedure setOnVideoSizeChangedListener(listener: JMediaPlayer_OnVideoSizeChangedListener); cdecl;
    procedure setPlaybackParams(params: JPlaybackParams); cdecl;
    procedure setScreenOnWhilePlaying(screenOn: Boolean); cdecl;
    procedure setSurface(surface: JSurface); cdecl;
    procedure setSyncParams(params: JSyncParams); cdecl;
    procedure setVideoScalingMode(mode: Integer); cdecl;
    procedure setVolume(leftVolume: Single; rightVolume: Single); cdecl;
    procedure setWakeMode(context: JContext; mode: Integer); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
  end;
  TJMediaPlayer = class(TJavaGenericImport<JMediaPlayerClass, JMediaPlayer>) end;

  JMediaPlayer_OnBufferingUpdateListenerClass = interface(IJavaClass)
    ['{9690972A-5827-477B-A01D-4285196FB577}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnBufferingUpdateListener')]
  JMediaPlayer_OnBufferingUpdateListener = interface(IJavaInstance)
    ['{BA8BF9D7-325E-4A93-B58F-81B180199D14}']
    procedure onBufferingUpdate(mp: JMediaPlayer; percent: Integer); cdecl;
  end;
  TJMediaPlayer_OnBufferingUpdateListener = class(TJavaGenericImport<JMediaPlayer_OnBufferingUpdateListenerClass, JMediaPlayer_OnBufferingUpdateListener>) end;

  JMediaPlayer_OnCompletionListenerClass = interface(IJavaClass)
    ['{B52C8D4D-90D6-4A31-A123-590582DCA314}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnCompletionListener')]
  JMediaPlayer_OnCompletionListener = interface(IJavaInstance)
    ['{855040E1-8E41-40EE-B36F-06C212B8AC81}']
    procedure onCompletion(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnCompletionListener = class(TJavaGenericImport<JMediaPlayer_OnCompletionListenerClass, JMediaPlayer_OnCompletionListener>) end;

  JMediaPlayer_OnErrorListenerClass = interface(IJavaClass)
    ['{35FC0354-8C2B-4B4B-ABEC-DEBD6B40E6F7}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnErrorListener')]
  JMediaPlayer_OnErrorListener = interface(IJavaInstance)
    ['{164290D2-CB7D-41A2-94DC-20306173FB5E}']
    function onError(mp: JMediaPlayer; what: Integer; extra: Integer): Boolean; cdecl;
  end;
  TJMediaPlayer_OnErrorListener = class(TJavaGenericImport<JMediaPlayer_OnErrorListenerClass, JMediaPlayer_OnErrorListener>) end;

  JMediaPlayer_OnInfoListenerClass = interface(IJavaClass)
    ['{7141FE3D-8201-49F6-919F-FF71788DFFED}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnInfoListener')]
  JMediaPlayer_OnInfoListener = interface(IJavaInstance)
    ['{84CB6D98-5AC9-4787-8411-E5F7A7CAFA84}']
    function onInfo(mp: JMediaPlayer; what: Integer; extra: Integer): Boolean; cdecl;
  end;
  TJMediaPlayer_OnInfoListener = class(TJavaGenericImport<JMediaPlayer_OnInfoListenerClass, JMediaPlayer_OnInfoListener>) end;

  JMediaPlayer_OnPreparedListenerClass = interface(IJavaClass)
    ['{FF67A260-7174-40EF-B53B-DA2BE4CDD72B}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnPreparedListener')]
  JMediaPlayer_OnPreparedListener = interface(IJavaInstance)
    ['{4082D9D4-82AE-4A31-9C58-D8CA78DC1A2B}']
    procedure onPrepared(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnPreparedListener = class(TJavaGenericImport<JMediaPlayer_OnPreparedListenerClass, JMediaPlayer_OnPreparedListener>) end;

  JMediaPlayer_OnSeekCompleteListenerClass = interface(IJavaClass)
    ['{ED9A90D0-F45E-4F82-A31F-A8C9735E2CBE}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnSeekCompleteListener')]
  JMediaPlayer_OnSeekCompleteListener = interface(IJavaInstance)
    ['{2F3ABA30-AB96-4030-9621-3C3A6FEC13AD}']
    procedure onSeekComplete(mp: JMediaPlayer); cdecl;
  end;
  TJMediaPlayer_OnSeekCompleteListener = class(TJavaGenericImport<JMediaPlayer_OnSeekCompleteListenerClass, JMediaPlayer_OnSeekCompleteListener>) end;

  JMediaPlayer_OnTimedMetaDataAvailableListenerClass = interface(IJavaClass)
    ['{95A5650E-B0EB-4277-8DDF-3D24F435B260}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnTimedMetaDataAvailableListener')]
  JMediaPlayer_OnTimedMetaDataAvailableListener = interface(IJavaInstance)
    ['{DD4BD518-610B-4DE8-8950-6DD1090F9905}']
    procedure onTimedMetaDataAvailable(mp: JMediaPlayer; data: JTimedMetaData); cdecl;
  end;
  TJMediaPlayer_OnTimedMetaDataAvailableListener = class(TJavaGenericImport<JMediaPlayer_OnTimedMetaDataAvailableListenerClass, JMediaPlayer_OnTimedMetaDataAvailableListener>) end;

  JMediaPlayer_OnTimedTextListenerClass = interface(IJavaClass)
    ['{B1D8CCB6-43D0-4238-85F7-E9A91DA43744}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnTimedTextListener')]
  JMediaPlayer_OnTimedTextListener = interface(IJavaInstance)
    ['{0884B998-F061-44F4-BAB4-A31DAF22F162}']
    procedure onTimedText(mp: JMediaPlayer; text: JTimedText); cdecl;
  end;
  TJMediaPlayer_OnTimedTextListener = class(TJavaGenericImport<JMediaPlayer_OnTimedTextListenerClass, JMediaPlayer_OnTimedTextListener>) end;

  JMediaPlayer_OnVideoSizeChangedListenerClass = interface(IJavaClass)
    ['{3693771D-E38F-4C43-9FC2-AAB16CBF4DA3}']
  end;

  [JavaSignature('android/media/MediaPlayer$OnVideoSizeChangedListener')]
  JMediaPlayer_OnVideoSizeChangedListener = interface(IJavaInstance)
    ['{37F96835-D256-4DAF-B0F0-17B653F8ECB9}']
    procedure onVideoSizeChanged(mp: JMediaPlayer; width: Integer; height: Integer); cdecl;
  end;
  TJMediaPlayer_OnVideoSizeChangedListener = class(TJavaGenericImport<JMediaPlayer_OnVideoSizeChangedListenerClass, JMediaPlayer_OnVideoSizeChangedListener>) end;

  JMediaPlayer_TrackInfoClass = interface(JObjectClass)
    ['{D7B4E7F5-E306-471E-8F77-ADBDB9B94282}']
    {class} function _GetMEDIA_TRACK_TYPE_AUDIO: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_METADATA: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_SUBTITLE: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_TIMEDTEXT: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_TRACK_TYPE_VIDEO: Integer; cdecl;
    {class} property MEDIA_TRACK_TYPE_AUDIO: Integer read _GetMEDIA_TRACK_TYPE_AUDIO;
    {class} property MEDIA_TRACK_TYPE_METADATA: Integer read _GetMEDIA_TRACK_TYPE_METADATA;
    {class} property MEDIA_TRACK_TYPE_SUBTITLE: Integer read _GetMEDIA_TRACK_TYPE_SUBTITLE;
    {class} property MEDIA_TRACK_TYPE_TIMEDTEXT: Integer read _GetMEDIA_TRACK_TYPE_TIMEDTEXT;
    {class} property MEDIA_TRACK_TYPE_UNKNOWN: Integer read _GetMEDIA_TRACK_TYPE_UNKNOWN;
    {class} property MEDIA_TRACK_TYPE_VIDEO: Integer read _GetMEDIA_TRACK_TYPE_VIDEO;
  end;

  [JavaSignature('android/media/MediaPlayer$TrackInfo')]
  JMediaPlayer_TrackInfo = interface(JObject)
    ['{488EB87A-19D3-4231-BEE0-01414518C163}']
    function describeContents: Integer; cdecl;
    function getFormat: JMediaFormat; cdecl;
    function getLanguage: JString; cdecl;
    function getTrackType: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaPlayer_TrackInfo = class(TJavaGenericImport<JMediaPlayer_TrackInfoClass, JMediaPlayer_TrackInfo>) end;

  JMediaRecorderClass = interface(JObjectClass)
    ['{C70673D1-3BC5-4951-8C84-3023833CD3CE}']
    {class} function _GetMEDIA_ERROR_SERVER_DIED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_ERROR_UNKNOWN: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_MAX_DURATION_REACHED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED: Integer; cdecl;
    {class} function _GetMEDIA_RECORDER_INFO_UNKNOWN: Integer; cdecl;
    {class} function init: JMediaRecorder; cdecl;
    {class} function getAudioSourceMax: Integer; cdecl;
    {class} property MEDIA_ERROR_SERVER_DIED: Integer read _GetMEDIA_ERROR_SERVER_DIED;
    {class} property MEDIA_RECORDER_ERROR_UNKNOWN: Integer read _GetMEDIA_RECORDER_ERROR_UNKNOWN;
    {class} property MEDIA_RECORDER_INFO_MAX_DURATION_REACHED: Integer read _GetMEDIA_RECORDER_INFO_MAX_DURATION_REACHED;
    {class} property MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED: Integer read _GetMEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED;
    {class} property MEDIA_RECORDER_INFO_UNKNOWN: Integer read _GetMEDIA_RECORDER_INFO_UNKNOWN;
  end;

  [JavaSignature('android/media/MediaRecorder')]
  JMediaRecorder = interface(JObject)
    ['{39D29E60-05D8-4B2C-A0F5-EF03FD1E0E20}']
    function getMaxAmplitude: Integer; cdecl;
    function getSurface: JSurface; cdecl;
    procedure prepare; cdecl;
    procedure release; cdecl;
    procedure reset; cdecl;
    procedure setAudioChannels(numChannels: Integer); cdecl;
    procedure setAudioEncoder(audio_encoder: Integer); cdecl;
    procedure setAudioEncodingBitRate(bitRate: Integer); cdecl;
    procedure setAudioSamplingRate(samplingRate: Integer); cdecl;
    procedure setAudioSource(audio_source: Integer); cdecl;
    procedure setCamera(c: JCamera); cdecl;//Deprecated
    procedure setCaptureRate(fps: Double); cdecl;
    procedure setInputSurface(surface: JSurface); cdecl;
    procedure setLocation(latitude: Single; longitude: Single); cdecl;
    procedure setMaxDuration(max_duration_ms: Integer); cdecl;
    procedure setMaxFileSize(max_filesize_bytes: Int64); cdecl;
    procedure setOnErrorListener(l: JMediaRecorder_OnErrorListener); cdecl;
    procedure setOnInfoListener(listener: JMediaRecorder_OnInfoListener); cdecl;
    procedure setOrientationHint(degrees: Integer); cdecl;
    procedure setOutputFile(fd: JFileDescriptor); cdecl; overload;
    procedure setOutputFile(path: JString); cdecl; overload;
    procedure setOutputFormat(output_format: Integer); cdecl;
    procedure setPreviewDisplay(sv: JSurface); cdecl;
    procedure setProfile(profile: JCamcorderProfile); cdecl;
    procedure setVideoEncoder(video_encoder: Integer); cdecl;
    procedure setVideoEncodingBitRate(bitRate: Integer); cdecl;
    procedure setVideoFrameRate(rate: Integer); cdecl;
    procedure setVideoSize(width: Integer; height: Integer); cdecl;
    procedure setVideoSource(video_source: Integer); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
  end;
  TJMediaRecorder = class(TJavaGenericImport<JMediaRecorderClass, JMediaRecorder>) end;

  JMediaRecorder_AudioEncoderClass = interface(JObjectClass)
    ['{60BE0488-31F9-4C18-8DF8-ED6D05525906}']
    {class} function _GetAAC: Integer; cdecl;
    {class} function _GetAAC_ELD: Integer; cdecl;
    {class} function _GetAMR_NB: Integer; cdecl;
    {class} function _GetAMR_WB: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetHE_AAC: Integer; cdecl;
    {class} function _GetVORBIS: Integer; cdecl;
    {class} property AAC: Integer read _GetAAC;
    {class} property AAC_ELD: Integer read _GetAAC_ELD;
    {class} property AMR_NB: Integer read _GetAMR_NB;
    {class} property AMR_WB: Integer read _GetAMR_WB;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property HE_AAC: Integer read _GetHE_AAC;
    {class} property VORBIS: Integer read _GetVORBIS;
  end;

  [JavaSignature('android/media/MediaRecorder$AudioEncoder')]
  JMediaRecorder_AudioEncoder = interface(JObject)
    ['{A827A239-F905-460F-850D-633F3C370A44}']
  end;
  TJMediaRecorder_AudioEncoder = class(TJavaGenericImport<JMediaRecorder_AudioEncoderClass, JMediaRecorder_AudioEncoder>) end;

  JMediaRecorder_AudioSourceClass = interface(JObjectClass)
    ['{A2ACA9E4-86BA-483F-B173-9AC32C457B5B}']
    {class} function _GetCAMCORDER: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetMIC: Integer; cdecl;
    {class} function _GetREMOTE_SUBMIX: Integer; cdecl;
    {class} function _GetVOICE_CALL: Integer; cdecl;
    {class} function _GetVOICE_COMMUNICATION: Integer; cdecl;
    {class} function _GetVOICE_DOWNLINK: Integer; cdecl;
    {class} function _GetVOICE_RECOGNITION: Integer; cdecl;
    {class} function _GetVOICE_UPLINK: Integer; cdecl;
    {class} property CAMCORDER: Integer read _GetCAMCORDER;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property MIC: Integer read _GetMIC;
    {class} property REMOTE_SUBMIX: Integer read _GetREMOTE_SUBMIX;
    {class} property VOICE_CALL: Integer read _GetVOICE_CALL;
    {class} property VOICE_COMMUNICATION: Integer read _GetVOICE_COMMUNICATION;
    {class} property VOICE_DOWNLINK: Integer read _GetVOICE_DOWNLINK;
    {class} property VOICE_RECOGNITION: Integer read _GetVOICE_RECOGNITION;
    {class} property VOICE_UPLINK: Integer read _GetVOICE_UPLINK;
  end;

  [JavaSignature('android/media/MediaRecorder$AudioSource')]
  JMediaRecorder_AudioSource = interface(JObject)
    ['{32A3494D-269C-4635-83D3-8C8E42C03557}']
  end;
  TJMediaRecorder_AudioSource = class(TJavaGenericImport<JMediaRecorder_AudioSourceClass, JMediaRecorder_AudioSource>) end;

  JMediaRecorder_OnErrorListenerClass = interface(IJavaClass)
    ['{61C1AC3C-6F4E-4513-B98A-7CFDD07FE71B}']
  end;

  [JavaSignature('android/media/MediaRecorder$OnErrorListener')]
  JMediaRecorder_OnErrorListener = interface(IJavaInstance)
    ['{E36B1187-DCC1-48EF-994A-4AB4C6FBE5AF}']
    procedure onError(mr: JMediaRecorder; what: Integer; extra: Integer); cdecl;
  end;
  TJMediaRecorder_OnErrorListener = class(TJavaGenericImport<JMediaRecorder_OnErrorListenerClass, JMediaRecorder_OnErrorListener>) end;

  JMediaRecorder_OnInfoListenerClass = interface(IJavaClass)
    ['{2243D66B-0BD1-49F1-8031-1432CC3EBBD6}']
  end;

  [JavaSignature('android/media/MediaRecorder$OnInfoListener')]
  JMediaRecorder_OnInfoListener = interface(IJavaInstance)
    ['{49627774-9F01-4122-B7F3-62ED95C7DD6B}']
    procedure onInfo(mr: JMediaRecorder; what: Integer; extra: Integer); cdecl;
  end;
  TJMediaRecorder_OnInfoListener = class(TJavaGenericImport<JMediaRecorder_OnInfoListenerClass, JMediaRecorder_OnInfoListener>) end;

  JMediaRecorder_OutputFormatClass = interface(JObjectClass)
    ['{E5FB95FA-4387-4454-9464-8F93A2FB550A}']
    {class} function _GetAAC_ADTS: Integer; cdecl;
    {class} function _GetAMR_NB: Integer; cdecl;
    {class} function _GetAMR_WB: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetMPEG_4: Integer; cdecl;
    {class} function _GetRAW_AMR: Integer; cdecl;
    {class} function _GetTHREE_GPP: Integer; cdecl;
    {class} function _GetWEBM: Integer; cdecl;
    {class} property AAC_ADTS: Integer read _GetAAC_ADTS;
    {class} property AMR_NB: Integer read _GetAMR_NB;
    {class} property AMR_WB: Integer read _GetAMR_WB;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property MPEG_4: Integer read _GetMPEG_4;
    {class} property RAW_AMR: Integer read _GetRAW_AMR;
    {class} property THREE_GPP: Integer read _GetTHREE_GPP;
    {class} property WEBM: Integer read _GetWEBM;
  end;

  [JavaSignature('android/media/MediaRecorder$OutputFormat')]
  JMediaRecorder_OutputFormat = interface(JObject)
    ['{3988D375-2062-46A4-8DA6-145374E051D9}']
  end;
  TJMediaRecorder_OutputFormat = class(TJavaGenericImport<JMediaRecorder_OutputFormatClass, JMediaRecorder_OutputFormat>) end;

  JMediaRecorder_VideoEncoderClass = interface(JObjectClass)
    ['{CAC0CF12-4686-461C-AB83-FF52102278BF}']
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetH263: Integer; cdecl;
    {class} function _GetH264: Integer; cdecl;
    {class} function _GetMPEG_4_SP: Integer; cdecl;
    {class} function _GetVP8: Integer; cdecl;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property H263: Integer read _GetH263;
    {class} property H264: Integer read _GetH264;
    {class} property MPEG_4_SP: Integer read _GetMPEG_4_SP;
    {class} property VP8: Integer read _GetVP8;
  end;

  [JavaSignature('android/media/MediaRecorder$VideoEncoder')]
  JMediaRecorder_VideoEncoder = interface(JObject)
    ['{7790955C-286A-4B61-B266-A95E1774953A}']
  end;
  TJMediaRecorder_VideoEncoder = class(TJavaGenericImport<JMediaRecorder_VideoEncoderClass, JMediaRecorder_VideoEncoder>) end;

  JMediaRecorder_VideoSourceClass = interface(JObjectClass)
    ['{007242EA-B501-4179-BE6F-3D7641C9A412}']
    {class} function _GetCAMERA: Integer; cdecl;
    {class} function _GetDEFAULT: Integer; cdecl;
    {class} function _GetSURFACE: Integer; cdecl;
    {class} property CAMERA: Integer read _GetCAMERA;
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property SURFACE: Integer read _GetSURFACE;
  end;

  [JavaSignature('android/media/MediaRecorder$VideoSource')]
  JMediaRecorder_VideoSource = interface(JObject)
    ['{E14FEC4B-01A8-4E23-B9F2-63464382FE92}']
  end;
  TJMediaRecorder_VideoSource = class(TJavaGenericImport<JMediaRecorder_VideoSourceClass, JMediaRecorder_VideoSource>) end;

  JMediaRouterClass = interface(JObjectClass)
    ['{BE499891-CFC7-47BB-946C-E633641DEA6F}']
    {class} function _GetCALLBACK_FLAG_PERFORM_ACTIVE_SCAN: Integer; cdecl;
    {class} function _GetCALLBACK_FLAG_UNFILTERED_EVENTS: Integer; cdecl;
    {class} function _GetROUTE_TYPE_LIVE_AUDIO: Integer; cdecl;
    {class} function _GetROUTE_TYPE_LIVE_VIDEO: Integer; cdecl;
    {class} function _GetROUTE_TYPE_USER: Integer; cdecl;
    {class} property CALLBACK_FLAG_PERFORM_ACTIVE_SCAN: Integer read _GetCALLBACK_FLAG_PERFORM_ACTIVE_SCAN;
    {class} property CALLBACK_FLAG_UNFILTERED_EVENTS: Integer read _GetCALLBACK_FLAG_UNFILTERED_EVENTS;
    {class} property ROUTE_TYPE_LIVE_AUDIO: Integer read _GetROUTE_TYPE_LIVE_AUDIO;
    {class} property ROUTE_TYPE_LIVE_VIDEO: Integer read _GetROUTE_TYPE_LIVE_VIDEO;
    {class} property ROUTE_TYPE_USER: Integer read _GetROUTE_TYPE_USER;
  end;

  [JavaSignature('android/media/MediaRouter')]
  JMediaRouter = interface(JObject)
    ['{461EECED-4158-4A87-87AD-568D08569170}']
    procedure addCallback(types: Integer; cb: JMediaRouter_Callback); cdecl; overload;
    procedure addCallback(types: Integer; cb: JMediaRouter_Callback; flags: Integer); cdecl; overload;
    procedure addUserRoute(info: JMediaRouter_UserRouteInfo); cdecl;
    procedure clearUserRoutes; cdecl;
    function createRouteCategory(name: JCharSequence; isGroupable: Boolean): JMediaRouter_RouteCategory; cdecl; overload;
    function createRouteCategory(nameResId: Integer; isGroupable: Boolean): JMediaRouter_RouteCategory; cdecl; overload;
    function createUserRoute(category: JMediaRouter_RouteCategory): JMediaRouter_UserRouteInfo; cdecl;
    function getCategoryAt(index: Integer): JMediaRouter_RouteCategory; cdecl;
    function getCategoryCount: Integer; cdecl;
    function getDefaultRoute: JMediaRouter_RouteInfo; cdecl;
    function getRouteAt(index: Integer): JMediaRouter_RouteInfo; cdecl;
    function getRouteCount: Integer; cdecl;
    function getSelectedRoute(type_: Integer): JMediaRouter_RouteInfo; cdecl;
    procedure removeCallback(cb: JMediaRouter_Callback); cdecl;
    procedure removeUserRoute(info: JMediaRouter_UserRouteInfo); cdecl;
    procedure selectRoute(types: Integer; route: JMediaRouter_RouteInfo); cdecl;
  end;
  TJMediaRouter = class(TJavaGenericImport<JMediaRouterClass, JMediaRouter>) end;

  JMediaRouter_CallbackClass = interface(JObjectClass)
    ['{CE16DA8F-E295-40D7-BDB9-90B613FEF489}']
    {class} function init: JMediaRouter_Callback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter$Callback')]
  JMediaRouter_Callback = interface(JObject)
    ['{4B9C5746-9823-437E-8109-AE475A504BA9}']
    procedure onRouteAdded(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteGrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup; index: Integer); cdecl;
    procedure onRoutePresentationDisplayChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteRemoved(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteSelected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteUngrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup); cdecl;
    procedure onRouteUnselected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteVolumeChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
  end;
  TJMediaRouter_Callback = class(TJavaGenericImport<JMediaRouter_CallbackClass, JMediaRouter_Callback>) end;

  JMediaRouter_RouteCategoryClass = interface(JObjectClass)
    ['{CB0B2500-99F0-4F30-AC54-0BED238E7560}']
  end;

  [JavaSignature('android/media/MediaRouter$RouteCategory')]
  JMediaRouter_RouteCategory = interface(JObject)
    ['{C2544513-A0C0-4452-8046-95530994926B}']
    function getName: JCharSequence; cdecl; overload;
    function getName(context: JContext): JCharSequence; cdecl; overload;
    function getRoutes(out_: JList): JList; cdecl;
    function getSupportedTypes: Integer; cdecl;
    function isGroupable: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter_RouteCategory = class(TJavaGenericImport<JMediaRouter_RouteCategoryClass, JMediaRouter_RouteCategory>) end;

  JMediaRouter_RouteInfoClass = interface(JObjectClass)
    ['{AEC0CEF3-E779-45E4-A633-3453115EDCE5}']
    {class} function _GetPLAYBACK_TYPE_LOCAL: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_REMOTE: Integer; cdecl;
    {class} function _GetPLAYBACK_VOLUME_FIXED: Integer; cdecl;
    {class} function _GetPLAYBACK_VOLUME_VARIABLE: Integer; cdecl;
    {class} property PLAYBACK_TYPE_LOCAL: Integer read _GetPLAYBACK_TYPE_LOCAL;
    {class} property PLAYBACK_TYPE_REMOTE: Integer read _GetPLAYBACK_TYPE_REMOTE;
    {class} property PLAYBACK_VOLUME_FIXED: Integer read _GetPLAYBACK_VOLUME_FIXED;
    {class} property PLAYBACK_VOLUME_VARIABLE: Integer read _GetPLAYBACK_VOLUME_VARIABLE;
  end;

  [JavaSignature('android/media/MediaRouter$RouteInfo')]
  JMediaRouter_RouteInfo = interface(JObject)
    ['{D009A403-61AD-4006-AB7A-292CDB8562E2}']
    function getCategory: JMediaRouter_RouteCategory; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getGroup: JMediaRouter_RouteGroup; cdecl;
    function getIconDrawable: JDrawable; cdecl;
    function getName: JCharSequence; cdecl; overload;
    function getName(context: JContext): JCharSequence; cdecl; overload;
    function getPlaybackStream: Integer; cdecl;
    function getPlaybackType: Integer; cdecl;
    function getPresentationDisplay: JDisplay; cdecl;
    function getStatus: JCharSequence; cdecl;
    function getSupportedTypes: Integer; cdecl;
    function getTag: JObject; cdecl;
    function getVolume: Integer; cdecl;
    function getVolumeHandling: Integer; cdecl;
    function getVolumeMax: Integer; cdecl;
    function isConnecting: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    procedure requestSetVolume(volume: Integer); cdecl;
    procedure requestUpdateVolume(direction: Integer); cdecl;
    procedure setTag(tag: JObject); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter_RouteInfo = class(TJavaGenericImport<JMediaRouter_RouteInfoClass, JMediaRouter_RouteInfo>) end;

  JMediaRouter_RouteGroupClass = interface(JMediaRouter_RouteInfoClass)
    ['{6B4C631F-9D54-4FC0-9B20-A52A75CB5ACC}']
  end;

  [JavaSignature('android/media/MediaRouter$RouteGroup')]
  JMediaRouter_RouteGroup = interface(JMediaRouter_RouteInfo)
    ['{D55DC4A2-A487-467A-A3C0-873B2BF10409}']
    procedure addRoute(route: JMediaRouter_RouteInfo); cdecl; overload;
    procedure addRoute(route: JMediaRouter_RouteInfo; insertAt: Integer); cdecl; overload;
    function getRouteAt(index: Integer): JMediaRouter_RouteInfo; cdecl;
    function getRouteCount: Integer; cdecl;
    procedure removeRoute(route: JMediaRouter_RouteInfo); cdecl; overload;
    procedure removeRoute(index: Integer); cdecl; overload;
    procedure requestSetVolume(volume: Integer); cdecl;
    procedure requestUpdateVolume(direction: Integer); cdecl;
    procedure setIconDrawable(icon: JDrawable); cdecl;
    procedure setIconResource(resId: Integer); cdecl;
    function toString: JString; cdecl;
  end;
  TJMediaRouter_RouteGroup = class(TJavaGenericImport<JMediaRouter_RouteGroupClass, JMediaRouter_RouteGroup>) end;

  JMediaRouter_SimpleCallbackClass = interface(JMediaRouter_CallbackClass)
    ['{FE51271A-3E43-46CC-B7C7-1642F6906114}']
    {class} function init: JMediaRouter_SimpleCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter$SimpleCallback')]
  JMediaRouter_SimpleCallback = interface(JMediaRouter_Callback)
    ['{7CA629D1-D9D7-4F6A-85BA-4C3F81C87BD8}']
    procedure onRouteAdded(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteGrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup; index: Integer); cdecl;
    procedure onRouteRemoved(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteSelected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteUngrouped(router: JMediaRouter; info: JMediaRouter_RouteInfo; group: JMediaRouter_RouteGroup); cdecl;
    procedure onRouteUnselected(router: JMediaRouter; type_: Integer; info: JMediaRouter_RouteInfo); cdecl;
    procedure onRouteVolumeChanged(router: JMediaRouter; info: JMediaRouter_RouteInfo); cdecl;
  end;
  TJMediaRouter_SimpleCallback = class(TJavaGenericImport<JMediaRouter_SimpleCallbackClass, JMediaRouter_SimpleCallback>) end;

  JMediaRouter_UserRouteInfoClass = interface(JMediaRouter_RouteInfoClass)
    ['{E9430B96-BDA5-4EEA-BC9B-AB818A32EF7A}']
  end;

  [JavaSignature('android/media/MediaRouter$UserRouteInfo')]
  JMediaRouter_UserRouteInfo = interface(JMediaRouter_RouteInfo)
    ['{A7AD5F99-15D8-439D-9A45-2E6E013F6FA0}']
    function getRemoteControlClient: JRemoteControlClient; cdecl;
    procedure requestSetVolume(volume: Integer); cdecl;
    procedure requestUpdateVolume(direction: Integer); cdecl;
    procedure setDescription(description: JCharSequence); cdecl;
    procedure setIconDrawable(icon: JDrawable); cdecl;
    procedure setIconResource(resId: Integer); cdecl;
    procedure setName(name: JCharSequence); cdecl; overload;
    procedure setName(resId: Integer); cdecl; overload;
    procedure setPlaybackStream(stream: Integer); cdecl;
    procedure setPlaybackType(type_: Integer); cdecl;
    procedure setRemoteControlClient(rcc: JRemoteControlClient); cdecl;
    procedure setStatus(status: JCharSequence); cdecl;
    procedure setVolume(volume: Integer); cdecl;
    procedure setVolumeCallback(vcb: JMediaRouter_VolumeCallback); cdecl;
    procedure setVolumeHandling(volumeHandling: Integer); cdecl;
    procedure setVolumeMax(volumeMax: Integer); cdecl;
  end;
  TJMediaRouter_UserRouteInfo = class(TJavaGenericImport<JMediaRouter_UserRouteInfoClass, JMediaRouter_UserRouteInfo>) end;

  JMediaRouter_VolumeCallbackClass = interface(JObjectClass)
    ['{F2ABA613-70F4-47B1-B5F4-D1CD8AB94202}']
    {class} function init: JMediaRouter_VolumeCallback; cdecl;
  end;

  [JavaSignature('android/media/MediaRouter$VolumeCallback')]
  JMediaRouter_VolumeCallback = interface(JObject)
    ['{9D096802-5425-4970-BCBE-B112A7E4C19E}']
    procedure onVolumeSetRequest(info: JMediaRouter_RouteInfo; volume: Integer); cdecl;
    procedure onVolumeUpdateRequest(info: JMediaRouter_RouteInfo; direction: Integer); cdecl;
  end;
  TJMediaRouter_VolumeCallback = class(TJavaGenericImport<JMediaRouter_VolumeCallbackClass, JMediaRouter_VolumeCallback>) end;

  JMediaScannerConnectionClass = interface(JObjectClass)
    ['{B3D9C29E-B436-469D-B694-181060E571DC}']
    {class} function init(context: JContext; client: JMediaScannerConnection_MediaScannerConnectionClient): JMediaScannerConnection; cdecl;
    {class} procedure scanFile(context: JContext; paths: TJavaObjectArray<JString>; mimeTypes: TJavaObjectArray<JString>; callback: JMediaScannerConnection_OnScanCompletedListener); cdecl; overload;
  end;

  [JavaSignature('android/media/MediaScannerConnection')]
  JMediaScannerConnection = interface(JObject)
    ['{CB9CBD70-C6AD-4FB5-8359-07F04747FB02}']
    procedure connect; cdecl;
    procedure disconnect; cdecl;
    function isConnected: Boolean; cdecl;
    procedure onServiceConnected(className: JComponentName; service: JIBinder); cdecl;
    procedure onServiceDisconnected(className: JComponentName); cdecl;
    procedure scanFile(path: JString; mimeType: JString); cdecl; overload;
  end;
  TJMediaScannerConnection = class(TJavaGenericImport<JMediaScannerConnectionClass, JMediaScannerConnection>) end;

  JMediaScannerConnection_OnScanCompletedListenerClass = interface(IJavaClass)
    ['{743ED55A-4735-41E1-AE1A-E0D4023F8AA5}']
  end;

  [JavaSignature('android/media/MediaScannerConnection$OnScanCompletedListener')]
  JMediaScannerConnection_OnScanCompletedListener = interface(IJavaInstance)
    ['{67909CB7-D7EA-4870-9461-7394752675F3}']
    procedure onScanCompleted(path: JString; uri: Jnet_Uri); cdecl;
  end;
  TJMediaScannerConnection_OnScanCompletedListener = class(TJavaGenericImport<JMediaScannerConnection_OnScanCompletedListenerClass, JMediaScannerConnection_OnScanCompletedListener>) end;

  JMediaScannerConnection_MediaScannerConnectionClientClass = interface(JMediaScannerConnection_OnScanCompletedListenerClass)
    ['{BA6A6FBB-C272-4BFF-986D-6DD9ABB7EE36}']
  end;

  [JavaSignature('android/media/MediaScannerConnection$MediaScannerConnectionClient')]
  JMediaScannerConnection_MediaScannerConnectionClient = interface(JMediaScannerConnection_OnScanCompletedListener)
    ['{02CB4035-E2C0-4C2D-9250-5805C45E789D}']
    procedure onMediaScannerConnected; cdecl;
    procedure onScanCompleted(path: JString; uri: Jnet_Uri); cdecl;
  end;
  TJMediaScannerConnection_MediaScannerConnectionClient = class(TJavaGenericImport<JMediaScannerConnection_MediaScannerConnectionClientClass, JMediaScannerConnection_MediaScannerConnectionClient>) end;

  JMediaSyncClass = interface(JObjectClass)
    ['{3EF721E1-8B59-4388-8A0F-9132A386A927}']
    {class} function _GetMEDIASYNC_ERROR_AUDIOTRACK_FAIL: Integer; cdecl;
    {class} function _GetMEDIASYNC_ERROR_SURFACE_FAIL: Integer; cdecl;
    {class} function init: JMediaSync; cdecl;
    {class} property MEDIASYNC_ERROR_AUDIOTRACK_FAIL: Integer read _GetMEDIASYNC_ERROR_AUDIOTRACK_FAIL;
    {class} property MEDIASYNC_ERROR_SURFACE_FAIL: Integer read _GetMEDIASYNC_ERROR_SURFACE_FAIL;
  end;

  [JavaSignature('android/media/MediaSync')]
  JMediaSync = interface(JObject)
    ['{47A10A95-2462-4977-8F99-16FCC4BC603C}']
    function createInputSurface: JSurface; cdecl;
    procedure flush; cdecl;
    function getPlaybackParams: JPlaybackParams; cdecl;
    function getSyncParams: JSyncParams; cdecl;
    function getTimestamp: JMediaTimestamp; cdecl;
    procedure queueAudio(audioData: JByteBuffer; bufferId: Integer; presentationTimeUs: Int64); cdecl;
    procedure release; cdecl;
    procedure setAudioTrack(audioTrack: JAudioTrack); cdecl;
    procedure setCallback(cb: JMediaSync_Callback; handler: JHandler); cdecl;
    procedure setOnErrorListener(listener: JMediaSync_OnErrorListener; handler: JHandler); cdecl;
    procedure setPlaybackParams(params: JPlaybackParams); cdecl;
    procedure setSurface(surface: JSurface); cdecl;
    procedure setSyncParams(params: JSyncParams); cdecl;
  end;
  TJMediaSync = class(TJavaGenericImport<JMediaSyncClass, JMediaSync>) end;

  JMediaSync_CallbackClass = interface(JObjectClass)
    ['{DA4E8F9E-2A48-4B1D-A8BC-625A70FFCBC4}']
    {class} function init: JMediaSync_Callback; cdecl;
  end;

  [JavaSignature('android/media/MediaSync$Callback')]
  JMediaSync_Callback = interface(JObject)
    ['{CB27A785-4A0F-4947-9E43-E661FF9201EB}']
    procedure onAudioBufferConsumed(sync: JMediaSync; audioBuffer: JByteBuffer; bufferId: Integer); cdecl;
  end;
  TJMediaSync_Callback = class(TJavaGenericImport<JMediaSync_CallbackClass, JMediaSync_Callback>) end;

  JMediaSync_OnErrorListenerClass = interface(IJavaClass)
    ['{D69A54A3-1797-4EF4-A6C8-F7BAD055EBF0}']
  end;

  [JavaSignature('android/media/MediaSync$OnErrorListener')]
  JMediaSync_OnErrorListener = interface(IJavaInstance)
    ['{437602CE-BF44-4A64-8735-F76FD6A39839}']
    procedure onError(sync: JMediaSync; what: Integer; extra: Integer); cdecl;
  end;
  TJMediaSync_OnErrorListener = class(TJavaGenericImport<JMediaSync_OnErrorListenerClass, JMediaSync_OnErrorListener>) end;

  JMediaSyncEventClass = interface(JObjectClass)
    ['{79525AAA-24FE-4FE9-BBA4-E887C710A091}']
    {class} function _GetSYNC_EVENT_NONE: Integer; cdecl;
    {class} function _GetSYNC_EVENT_PRESENTATION_COMPLETE: Integer; cdecl;
    {class} function createEvent(eventType: Integer): JMediaSyncEvent; cdecl;
    {class} property SYNC_EVENT_NONE: Integer read _GetSYNC_EVENT_NONE;
    {class} property SYNC_EVENT_PRESENTATION_COMPLETE: Integer read _GetSYNC_EVENT_PRESENTATION_COMPLETE;
  end;

  [JavaSignature('android/media/MediaSyncEvent')]
  JMediaSyncEvent = interface(JObject)
    ['{13BEE748-33EE-423F-9C9B-9C570F9C3A9A}']
    function getAudioSessionId: Integer; cdecl;
    function getType: Integer; cdecl;
    function setAudioSessionId(audioSessionId: Integer): JMediaSyncEvent; cdecl;
  end;
  TJMediaSyncEvent = class(TJavaGenericImport<JMediaSyncEventClass, JMediaSyncEvent>) end;

  JMediaTimestampClass = interface(JObjectClass)
    ['{D0C42509-9397-490A-9F63-C9E08B213D74}']
  end;

  [JavaSignature('android/media/MediaTimestamp')]
  JMediaTimestamp = interface(JObject)
    ['{DFDC1617-2E31-4D19-9BBC-2DFF1DF2AB89}']
    function getAnchorMediaTimeUs: Int64; cdecl;
    function getAnchorSytemNanoTime: Int64; cdecl;
    function getMediaClockRate: Single; cdecl;
  end;
  TJMediaTimestamp = class(TJavaGenericImport<JMediaTimestampClass, JMediaTimestamp>) end;

  JNotProvisionedExceptionClass = interface(JMediaDrmExceptionClass)
    ['{1B9BB475-6595-4C0D-99B9-5038AF25E58F}']
    {class} function init(detailMessage: JString): JNotProvisionedException; cdecl;
  end;

  [JavaSignature('android/media/NotProvisionedException')]
  JNotProvisionedException = interface(JMediaDrmException)
    ['{09338289-B2A4-4772-BE68-5B0670C840E5}']
  end;
  TJNotProvisionedException = class(TJavaGenericImport<JNotProvisionedExceptionClass, JNotProvisionedException>) end;

  JPlaybackParamsClass = interface(JObjectClass)
    ['{493A1111-6306-4CAC-B53E-D51784B0C3FA}']
    {class} function _GetAUDIO_FALLBACK_MODE_DEFAULT: Integer; cdecl;
    {class} function _GetAUDIO_FALLBACK_MODE_FAIL: Integer; cdecl;
    {class} function _GetAUDIO_FALLBACK_MODE_MUTE: Integer; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JPlaybackParams; cdecl;
    {class} property AUDIO_FALLBACK_MODE_DEFAULT: Integer read _GetAUDIO_FALLBACK_MODE_DEFAULT;
    {class} property AUDIO_FALLBACK_MODE_FAIL: Integer read _GetAUDIO_FALLBACK_MODE_FAIL;
    {class} property AUDIO_FALLBACK_MODE_MUTE: Integer read _GetAUDIO_FALLBACK_MODE_MUTE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/PlaybackParams')]
  JPlaybackParams = interface(JObject)
    ['{C941D1D6-2452-4A43-9D8E-52F7ACA064B3}']
    function allowDefaults: JPlaybackParams; cdecl;
    function describeContents: Integer; cdecl;
    function getAudioFallbackMode: Integer; cdecl;
    function getPitch: Single; cdecl;
    function getSpeed: Single; cdecl;
    function setAudioFallbackMode(audioFallbackMode: Integer): JPlaybackParams; cdecl;
    function setPitch(pitch: Single): JPlaybackParams; cdecl;
    function setSpeed(speed: Single): JPlaybackParams; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackParams = class(TJavaGenericImport<JPlaybackParamsClass, JPlaybackParams>) end;

  JRatingClass = interface(JObjectClass)
    ['{2609B2B6-9F21-4FB9-994F-98CDABAB861A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetRATING_3_STARS: Integer; cdecl;
    {class} function _GetRATING_4_STARS: Integer; cdecl;
    {class} function _GetRATING_5_STARS: Integer; cdecl;
    {class} function _GetRATING_HEART: Integer; cdecl;
    {class} function _GetRATING_NONE: Integer; cdecl;
    {class} function _GetRATING_PERCENTAGE: Integer; cdecl;
    {class} function _GetRATING_THUMB_UP_DOWN: Integer; cdecl;
    {class} function newHeartRating(hasHeart: Boolean): JRating; cdecl;
    {class} function newPercentageRating(percent: Single): JRating; cdecl;
    {class} function newStarRating(starRatingStyle: Integer; starRating: Single): JRating; cdecl;
    {class} function newThumbRating(thumbIsUp: Boolean): JRating; cdecl;
    {class} function newUnratedRating(ratingStyle: Integer): JRating; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property RATING_3_STARS: Integer read _GetRATING_3_STARS;
    {class} property RATING_4_STARS: Integer read _GetRATING_4_STARS;
    {class} property RATING_5_STARS: Integer read _GetRATING_5_STARS;
    {class} property RATING_HEART: Integer read _GetRATING_HEART;
    {class} property RATING_NONE: Integer read _GetRATING_NONE;
    {class} property RATING_PERCENTAGE: Integer read _GetRATING_PERCENTAGE;
    {class} property RATING_THUMB_UP_DOWN: Integer read _GetRATING_THUMB_UP_DOWN;
  end;

  [JavaSignature('android/media/Rating')]
  JRating = interface(JObject)
    ['{D4D1A891-BFB2-4643-97CE-C19A57AA921F}']
    function describeContents: Integer; cdecl;
    function getPercentRating: Single; cdecl;
    function getRatingStyle: Integer; cdecl;
    function getStarRating: Single; cdecl;
    function hasHeart: Boolean; cdecl;
    function isRated: Boolean; cdecl;
    function isThumbUp: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJRating = class(TJavaGenericImport<JRatingClass, JRating>) end;

  JRemoteControlClientClass = interface(JObjectClass)
    ['{3BCB8D6B-7F9E-4559-97A5-FD7A0B386EBA}']
    {class} function _GetFLAG_KEY_MEDIA_FAST_FORWARD: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_NEXT: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PAUSE: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PLAY: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PLAY_PAUSE: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_POSITION_UPDATE: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_PREVIOUS: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_RATING: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_REWIND: Integer; cdecl;
    {class} function _GetFLAG_KEY_MEDIA_STOP: Integer; cdecl;
    {class} function _GetPLAYSTATE_BUFFERING: Integer; cdecl;
    {class} function _GetPLAYSTATE_ERROR: Integer; cdecl;
    {class} function _GetPLAYSTATE_FAST_FORWARDING: Integer; cdecl;
    {class} function _GetPLAYSTATE_PAUSED: Integer; cdecl;
    {class} function _GetPLAYSTATE_PLAYING: Integer; cdecl;
    {class} function _GetPLAYSTATE_REWINDING: Integer; cdecl;
    {class} function _GetPLAYSTATE_SKIPPING_BACKWARDS: Integer; cdecl;
    {class} function _GetPLAYSTATE_SKIPPING_FORWARDS: Integer; cdecl;
    {class} function _GetPLAYSTATE_STOPPED: Integer; cdecl;
    {class} function init(mediaButtonIntent: JPendingIntent): JRemoteControlClient; cdecl; overload;
    {class} function init(mediaButtonIntent: JPendingIntent; looper: JLooper): JRemoteControlClient; cdecl; overload;
    {class} property FLAG_KEY_MEDIA_FAST_FORWARD: Integer read _GetFLAG_KEY_MEDIA_FAST_FORWARD;
    {class} property FLAG_KEY_MEDIA_NEXT: Integer read _GetFLAG_KEY_MEDIA_NEXT;
    {class} property FLAG_KEY_MEDIA_PAUSE: Integer read _GetFLAG_KEY_MEDIA_PAUSE;
    {class} property FLAG_KEY_MEDIA_PLAY: Integer read _GetFLAG_KEY_MEDIA_PLAY;
    {class} property FLAG_KEY_MEDIA_PLAY_PAUSE: Integer read _GetFLAG_KEY_MEDIA_PLAY_PAUSE;
    {class} property FLAG_KEY_MEDIA_POSITION_UPDATE: Integer read _GetFLAG_KEY_MEDIA_POSITION_UPDATE;
    {class} property FLAG_KEY_MEDIA_PREVIOUS: Integer read _GetFLAG_KEY_MEDIA_PREVIOUS;
    {class} property FLAG_KEY_MEDIA_RATING: Integer read _GetFLAG_KEY_MEDIA_RATING;
    {class} property FLAG_KEY_MEDIA_REWIND: Integer read _GetFLAG_KEY_MEDIA_REWIND;
    {class} property FLAG_KEY_MEDIA_STOP: Integer read _GetFLAG_KEY_MEDIA_STOP;
    {class} property PLAYSTATE_BUFFERING: Integer read _GetPLAYSTATE_BUFFERING;
    {class} property PLAYSTATE_ERROR: Integer read _GetPLAYSTATE_ERROR;
    {class} property PLAYSTATE_FAST_FORWARDING: Integer read _GetPLAYSTATE_FAST_FORWARDING;
    {class} property PLAYSTATE_PAUSED: Integer read _GetPLAYSTATE_PAUSED;
    {class} property PLAYSTATE_PLAYING: Integer read _GetPLAYSTATE_PLAYING;
    {class} property PLAYSTATE_REWINDING: Integer read _GetPLAYSTATE_REWINDING;
    {class} property PLAYSTATE_SKIPPING_BACKWARDS: Integer read _GetPLAYSTATE_SKIPPING_BACKWARDS;
    {class} property PLAYSTATE_SKIPPING_FORWARDS: Integer read _GetPLAYSTATE_SKIPPING_FORWARDS;
    {class} property PLAYSTATE_STOPPED: Integer read _GetPLAYSTATE_STOPPED;
  end;

  [JavaSignature('android/media/RemoteControlClient')]
  JRemoteControlClient = interface(JObject)
    ['{63280B1B-0F55-4FE3-B931-E5E8DE0591E3}']
    function editMetadata(startEmpty: Boolean): JRemoteControlClient_MetadataEditor; cdecl;
    function getMediaSession: JMediaSession; cdecl;
    procedure setMetadataUpdateListener(l: JRemoteControlClient_OnMetadataUpdateListener); cdecl;
    procedure setOnGetPlaybackPositionListener(l: JRemoteControlClient_OnGetPlaybackPositionListener); cdecl;
    procedure setPlaybackPositionUpdateListener(l: JRemoteControlClient_OnPlaybackPositionUpdateListener); cdecl;
    procedure setPlaybackState(state: Integer); cdecl; overload;
    procedure setPlaybackState(state: Integer; timeInMs: Int64; playbackSpeed: Single); cdecl; overload;
    procedure setTransportControlFlags(transportControlFlags: Integer); cdecl;
  end;
  TJRemoteControlClient = class(TJavaGenericImport<JRemoteControlClientClass, JRemoteControlClient>) end;

  JRemoteControlClient_MetadataEditorClass = interface(JMediaMetadataEditorClass)
    ['{C27FF739-A30D-4355-82E4-E29C5068899F}']
    {class} function _GetBITMAP_KEY_ARTWORK: Integer; cdecl;
    {class} //BITMAP_KEY_ARTWORK is defined in parent interface
  end;

  [JavaSignature('android/media/RemoteControlClient$MetadataEditor')]
  JRemoteControlClient_MetadataEditor = interface(JMediaMetadataEditor)
    ['{C73C0E46-3442-440C-8A3D-E583A926B37B}']
    procedure apply; cdecl;
    procedure clear; cdecl;
    function putBitmap(key: Integer; bitmap: JBitmap): JRemoteControlClient_MetadataEditor; cdecl;
    function putLong(key: Integer; value: Int64): JRemoteControlClient_MetadataEditor; cdecl;
    function putObject(key: Integer; object_: JObject): JRemoteControlClient_MetadataEditor; cdecl;
    function putString(key: Integer; value: JString): JRemoteControlClient_MetadataEditor; cdecl;
  end;
  TJRemoteControlClient_MetadataEditor = class(TJavaGenericImport<JRemoteControlClient_MetadataEditorClass, JRemoteControlClient_MetadataEditor>) end;

  JRemoteControlClient_OnGetPlaybackPositionListenerClass = interface(IJavaClass)
    ['{3DD2FCE3-BD30-4B1A-95BA-9A4494C1ADED}']
  end;

  [JavaSignature('android/media/RemoteControlClient$OnGetPlaybackPositionListener')]
  JRemoteControlClient_OnGetPlaybackPositionListener = interface(IJavaInstance)
    ['{210D9E54-4FAE-4441-AD6C-F9DE9014C4CE}']
    function onGetPlaybackPosition: Int64; cdecl;
  end;
  TJRemoteControlClient_OnGetPlaybackPositionListener = class(TJavaGenericImport<JRemoteControlClient_OnGetPlaybackPositionListenerClass, JRemoteControlClient_OnGetPlaybackPositionListener>) end;

  JRemoteControlClient_OnMetadataUpdateListenerClass = interface(IJavaClass)
    ['{EDBAED8D-4EC5-44C9-8CA7-38ECF1F1B55D}']
  end;

  [JavaSignature('android/media/RemoteControlClient$OnMetadataUpdateListener')]
  JRemoteControlClient_OnMetadataUpdateListener = interface(IJavaInstance)
    ['{F8C8778D-2E0B-4D30-930F-FE967265EBBA}']
    procedure onMetadataUpdate(key: Integer; newValue: JObject); cdecl;
  end;
  TJRemoteControlClient_OnMetadataUpdateListener = class(TJavaGenericImport<JRemoteControlClient_OnMetadataUpdateListenerClass, JRemoteControlClient_OnMetadataUpdateListener>) end;

  JRemoteControlClient_OnPlaybackPositionUpdateListenerClass = interface(IJavaClass)
    ['{B6AB2D0B-3338-4567-9F36-13EB4B72FEAA}']
  end;

  [JavaSignature('android/media/RemoteControlClient$OnPlaybackPositionUpdateListener')]
  JRemoteControlClient_OnPlaybackPositionUpdateListener = interface(IJavaInstance)
    ['{6107D444-F76C-419B-9D19-46FAFB46F6A2}']
    procedure onPlaybackPositionUpdate(newPositionMs: Int64); cdecl;
  end;
  TJRemoteControlClient_OnPlaybackPositionUpdateListener = class(TJavaGenericImport<JRemoteControlClient_OnPlaybackPositionUpdateListenerClass, JRemoteControlClient_OnPlaybackPositionUpdateListener>) end;

  JRemoteControllerClass = interface(JObjectClass)
    ['{BB8681BE-C85D-4997-8406-D09160330A6B}']
    {class} function _GetPOSITION_SYNCHRONIZATION_CHECK: Integer; cdecl;
    {class} function _GetPOSITION_SYNCHRONIZATION_NONE: Integer; cdecl;
    {class} function init(context: JContext; updateListener: JRemoteController_OnClientUpdateListener): JRemoteController; cdecl; overload;
    {class} function init(context: JContext; updateListener: JRemoteController_OnClientUpdateListener; looper: JLooper): JRemoteController; cdecl; overload;
    {class} property POSITION_SYNCHRONIZATION_CHECK: Integer read _GetPOSITION_SYNCHRONIZATION_CHECK;
    {class} property POSITION_SYNCHRONIZATION_NONE: Integer read _GetPOSITION_SYNCHRONIZATION_NONE;
  end;

  [JavaSignature('android/media/RemoteController')]
  JRemoteController = interface(JObject)
    ['{7360A8B9-F9E1-42E3-A6DA-6EAE3DF805E8}']
    function clearArtworkConfiguration: Boolean; cdecl;
    function editMetadata: JRemoteController_MetadataEditor; cdecl;
    function getEstimatedMediaPosition: Int64; cdecl;
    function seekTo(timeMs: Int64): Boolean; cdecl;
    function sendMediaKeyEvent(keyEvent: JKeyEvent): Boolean; cdecl;
    function setArtworkConfiguration(width: Integer; height: Integer): Boolean; cdecl;
    function setSynchronizationMode(sync: Integer): Boolean; cdecl;
  end;
  TJRemoteController = class(TJavaGenericImport<JRemoteControllerClass, JRemoteController>) end;

  JRemoteController_MetadataEditorClass = interface(JMediaMetadataEditorClass)
    ['{17EB3909-923B-4004-BA1D-6A8D3AC0FC99}']
  end;

  [JavaSignature('android/media/RemoteController$MetadataEditor')]
  JRemoteController_MetadataEditor = interface(JMediaMetadataEditor)
    ['{CFE1A6CE-B7CF-407A-8ED2-02AEA5BB398B}']
    procedure apply; cdecl;
  end;
  TJRemoteController_MetadataEditor = class(TJavaGenericImport<JRemoteController_MetadataEditorClass, JRemoteController_MetadataEditor>) end;

  JRemoteController_OnClientUpdateListenerClass = interface(IJavaClass)
    ['{F3FA280A-BF61-42DE-BF2C-1BA2A9648A8B}']
  end;

  [JavaSignature('android/media/RemoteController$OnClientUpdateListener')]
  JRemoteController_OnClientUpdateListener = interface(IJavaInstance)
    ['{8322F220-C3E9-4663-9726-6DC6DBD7B939}']
    procedure onClientChange(clearing: Boolean); cdecl;
    procedure onClientMetadataUpdate(metadataEditor: JRemoteController_MetadataEditor); cdecl;
    procedure onClientPlaybackStateUpdate(state: Integer); cdecl; overload;
    procedure onClientPlaybackStateUpdate(state: Integer; stateChangeTimeMs: Int64; currentPosMs: Int64; speed: Single); cdecl; overload;
    procedure onClientTransportControlUpdate(transportControlFlags: Integer); cdecl;
  end;
  TJRemoteController_OnClientUpdateListener = class(TJavaGenericImport<JRemoteController_OnClientUpdateListenerClass, JRemoteController_OnClientUpdateListener>) end;

  JResourceBusyExceptionClass = interface(JMediaDrmExceptionClass)
    ['{F93F9FE6-C578-4379-BC55-06E8CFAE9A8D}']
    {class} function init(detailMessage: JString): JResourceBusyException; cdecl;
  end;

  [JavaSignature('android/media/ResourceBusyException')]
  JResourceBusyException = interface(JMediaDrmException)
    ['{2C491FA7-0602-4D59-9C98-D83FF4AE1EA3}']
  end;
  TJResourceBusyException = class(TJavaGenericImport<JResourceBusyExceptionClass, JResourceBusyException>) end;

  JRingtoneClass = interface(JObjectClass)
    ['{C62E030E-5189-47DF-963A-BCA873D1865B}']
  end;

  [JavaSignature('android/media/Ringtone')]
  JRingtone = interface(JObject)
    ['{D08C2112-5F37-4665-BA84-4DC9848539CC}']
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getStreamType: Integer; cdecl;//Deprecated
    function getTitle(context: JContext): JString; cdecl;
    function isPlaying: Boolean; cdecl;
    procedure play; cdecl;
    procedure setAudioAttributes(attributes: JAudioAttributes); cdecl;
    procedure setStreamType(streamType: Integer); cdecl;//Deprecated
    procedure stop; cdecl;
  end;
  TJRingtone = class(TJavaGenericImport<JRingtoneClass, JRingtone>) end;

  JRingtoneManagerClass = interface(JObjectClass)
    ['{8AFA6E70-C245-4694-8B7E-72C5D436FD94}']
    {class} function _GetACTION_RINGTONE_PICKER: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_DEFAULT_URI: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_EXISTING_URI: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_INCLUDE_DRM: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_PICKED_URI: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_SHOW_DEFAULT: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_SHOW_SILENT: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_TITLE: JString; cdecl;
    {class} function _GetEXTRA_RINGTONE_TYPE: JString; cdecl;
    {class} function _GetID_COLUMN_INDEX: Integer; cdecl;
    {class} function _GetTITLE_COLUMN_INDEX: Integer; cdecl;
    {class} function _GetTYPE_ALARM: Integer; cdecl;
    {class} function _GetTYPE_ALL: Integer; cdecl;
    {class} function _GetTYPE_NOTIFICATION: Integer; cdecl;
    {class} function _GetTYPE_RINGTONE: Integer; cdecl;
    {class} function _GetURI_COLUMN_INDEX: Integer; cdecl;
    {class} function init(activity: JActivity): JRingtoneManager; cdecl; overload;
    {class} function init(context: JContext): JRingtoneManager; cdecl; overload;
    {class} function getActualDefaultRingtoneUri(context: JContext; type_: Integer): Jnet_Uri; cdecl;
    {class} function getDefaultType(defaultRingtoneUri: Jnet_Uri): Integer; cdecl;
    {class} function getDefaultUri(type_: Integer): Jnet_Uri; cdecl;
    {class} function getRingtone(context: JContext; ringtoneUri: Jnet_Uri): JRingtone; cdecl; overload;
    {class} function getValidRingtoneUri(context: JContext): Jnet_Uri; cdecl;
    {class} function isDefault(ringtoneUri: Jnet_Uri): Boolean; cdecl;
    {class} procedure setActualDefaultRingtoneUri(context: JContext; type_: Integer; ringtoneUri: Jnet_Uri); cdecl;
    {class} property ACTION_RINGTONE_PICKER: JString read _GetACTION_RINGTONE_PICKER;
    {class} property EXTRA_RINGTONE_DEFAULT_URI: JString read _GetEXTRA_RINGTONE_DEFAULT_URI;
    {class} property EXTRA_RINGTONE_EXISTING_URI: JString read _GetEXTRA_RINGTONE_EXISTING_URI;
    {class} property EXTRA_RINGTONE_INCLUDE_DRM: JString read _GetEXTRA_RINGTONE_INCLUDE_DRM;
    {class} property EXTRA_RINGTONE_PICKED_URI: JString read _GetEXTRA_RINGTONE_PICKED_URI;
    {class} property EXTRA_RINGTONE_SHOW_DEFAULT: JString read _GetEXTRA_RINGTONE_SHOW_DEFAULT;
    {class} property EXTRA_RINGTONE_SHOW_SILENT: JString read _GetEXTRA_RINGTONE_SHOW_SILENT;
    {class} property EXTRA_RINGTONE_TITLE: JString read _GetEXTRA_RINGTONE_TITLE;
    {class} property EXTRA_RINGTONE_TYPE: JString read _GetEXTRA_RINGTONE_TYPE;
    {class} property ID_COLUMN_INDEX: Integer read _GetID_COLUMN_INDEX;
    {class} property TITLE_COLUMN_INDEX: Integer read _GetTITLE_COLUMN_INDEX;
    {class} property TYPE_ALARM: Integer read _GetTYPE_ALARM;
    {class} property TYPE_ALL: Integer read _GetTYPE_ALL;
    {class} property TYPE_NOTIFICATION: Integer read _GetTYPE_NOTIFICATION;
    {class} property TYPE_RINGTONE: Integer read _GetTYPE_RINGTONE;
    {class} property URI_COLUMN_INDEX: Integer read _GetURI_COLUMN_INDEX;
  end;

  [JavaSignature('android/media/RingtoneManager')]
  JRingtoneManager = interface(JObject)
    ['{1BD04E09-7368-4024-9231-7C23D839447C}']
    function getCursor: JCursor; cdecl;
    function getIncludeDrm: Boolean; cdecl;//Deprecated
    function getRingtone(position: Integer): JRingtone; cdecl; overload;
    function getRingtonePosition(ringtoneUri: Jnet_Uri): Integer; cdecl;
    function getRingtoneUri(position: Integer): Jnet_Uri; cdecl;
    function getStopPreviousRingtone: Boolean; cdecl;
    function inferStreamType: Integer; cdecl;
    procedure setIncludeDrm(includeDrm: Boolean); cdecl;//Deprecated
    procedure setStopPreviousRingtone(stopPreviousRingtone: Boolean); cdecl;
    procedure setType(type_: Integer); cdecl;
    procedure stopPreviousRingtone; cdecl;
  end;
  TJRingtoneManager = class(TJavaGenericImport<JRingtoneManagerClass, JRingtoneManager>) end;

  JSoundPoolClass = interface(JObjectClass)
    ['{DFFA6151-B321-4111-A703-864E406FDA28}']
    {class} function init(maxStreams: Integer; streamType: Integer; srcQuality: Integer): JSoundPool; cdecl;//Deprecated
  end;

  [JavaSignature('android/media/SoundPool')]
  JSoundPool = interface(JObject)
    ['{923ACDC6-1C0D-437A-9A44-D43B0BA82522}']
    procedure autoPause; cdecl;
    procedure autoResume; cdecl;
    function load(path: JString; priority: Integer): Integer; cdecl; overload;
    function load(context: JContext; resId: Integer; priority: Integer): Integer; cdecl; overload;
    function load(afd: JAssetFileDescriptor; priority: Integer): Integer; cdecl; overload;
    function load(fd: JFileDescriptor; offset: Int64; length: Int64; priority: Integer): Integer; cdecl; overload;
    procedure pause(streamID: Integer); cdecl;
    function play(soundID: Integer; leftVolume: Single; rightVolume: Single; priority: Integer; loop: Integer; rate: Single): Integer; cdecl;
    procedure release; cdecl;
    procedure resume(streamID: Integer); cdecl;
    procedure setLoop(streamID: Integer; loop: Integer); cdecl;
    procedure setOnLoadCompleteListener(listener: JSoundPool_OnLoadCompleteListener); cdecl;
    procedure setPriority(streamID: Integer; priority: Integer); cdecl;
    procedure setRate(streamID: Integer; rate: Single); cdecl;
    procedure setVolume(streamID: Integer; leftVolume: Single; rightVolume: Single); cdecl;
    procedure stop(streamID: Integer); cdecl;
    function unload(soundID: Integer): Boolean; cdecl;
  end;
  TJSoundPool = class(TJavaGenericImport<JSoundPoolClass, JSoundPool>) end;

  JSoundPool_BuilderClass = interface(JObjectClass)
    ['{88397C0D-2A54-48B3-B39F-7035F19C8670}']
    {class} function init: JSoundPool_Builder; cdecl;
  end;

  [JavaSignature('android/media/SoundPool$Builder')]
  JSoundPool_Builder = interface(JObject)
    ['{8571A1CE-EBF2-4461-953E-23F5B5F1CC4A}']
    function build: JSoundPool; cdecl;
    function setAudioAttributes(attributes: JAudioAttributes): JSoundPool_Builder; cdecl;
    function setMaxStreams(maxStreams: Integer): JSoundPool_Builder; cdecl;
  end;
  TJSoundPool_Builder = class(TJavaGenericImport<JSoundPool_BuilderClass, JSoundPool_Builder>) end;

  JSoundPool_OnLoadCompleteListenerClass = interface(IJavaClass)
    ['{3BB55DBE-8614-4445-BA79-3EB818241E8C}']
  end;

  [JavaSignature('android/media/SoundPool$OnLoadCompleteListener')]
  JSoundPool_OnLoadCompleteListener = interface(IJavaInstance)
    ['{E0F6A95C-27EF-4865-9C1C-DDD2664D58BD}']
    procedure onLoadComplete(soundPool: JSoundPool; sampleId: Integer; status: Integer); cdecl;
  end;
  TJSoundPool_OnLoadCompleteListener = class(TJavaGenericImport<JSoundPool_OnLoadCompleteListenerClass, JSoundPool_OnLoadCompleteListener>) end;

  JSyncParamsClass = interface(JObjectClass)
    ['{602D3104-4D7E-4424-A005-D365AA8B5A1D}']
    {class} function _GetAUDIO_ADJUST_MODE_DEFAULT: Integer; cdecl;
    {class} function _GetAUDIO_ADJUST_MODE_RESAMPLE: Integer; cdecl;
    {class} function _GetAUDIO_ADJUST_MODE_STRETCH: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_AUDIO: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_DEFAULT: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_SYSTEM_CLOCK: Integer; cdecl;
    {class} function _GetSYNC_SOURCE_VSYNC: Integer; cdecl;
    {class} function init: JSyncParams; cdecl;
    {class} property AUDIO_ADJUST_MODE_DEFAULT: Integer read _GetAUDIO_ADJUST_MODE_DEFAULT;
    {class} property AUDIO_ADJUST_MODE_RESAMPLE: Integer read _GetAUDIO_ADJUST_MODE_RESAMPLE;
    {class} property AUDIO_ADJUST_MODE_STRETCH: Integer read _GetAUDIO_ADJUST_MODE_STRETCH;
    {class} property SYNC_SOURCE_AUDIO: Integer read _GetSYNC_SOURCE_AUDIO;
    {class} property SYNC_SOURCE_DEFAULT: Integer read _GetSYNC_SOURCE_DEFAULT;
    {class} property SYNC_SOURCE_SYSTEM_CLOCK: Integer read _GetSYNC_SOURCE_SYSTEM_CLOCK;
    {class} property SYNC_SOURCE_VSYNC: Integer read _GetSYNC_SOURCE_VSYNC;
  end;

  [JavaSignature('android/media/SyncParams')]
  JSyncParams = interface(JObject)
    ['{2F176C77-E881-4CDB-95CC-1A233A604C45}']
    function allowDefaults: JSyncParams; cdecl;
    function getAudioAdjustMode: Integer; cdecl;
    function getFrameRate: Single; cdecl;
    function getSyncSource: Integer; cdecl;
    function getTolerance: Single; cdecl;
    function setAudioAdjustMode(audioAdjustMode: Integer): JSyncParams; cdecl;
    function setFrameRate(frameRate: Single): JSyncParams; cdecl;
    function setSyncSource(syncSource: Integer): JSyncParams; cdecl;
    function setTolerance(tolerance: Single): JSyncParams; cdecl;
  end;
  TJSyncParams = class(TJavaGenericImport<JSyncParamsClass, JSyncParams>) end;

  JThumbnailUtilsClass = interface(JObjectClass)
    ['{5D772E54-5912-4CF0-A97D-0A4B171E7EF7}']
    {class} function _GetOPTIONS_RECYCLE_INPUT: Integer; cdecl;
    {class} function init: JThumbnailUtils; cdecl;
    {class} function createVideoThumbnail(filePath: JString; kind: Integer): JBitmap; cdecl;
    {class} function extractThumbnail(source: JBitmap; width: Integer; height: Integer): JBitmap; cdecl; overload;
    {class} function extractThumbnail(source: JBitmap; width: Integer; height: Integer; options: Integer): JBitmap; cdecl; overload;
    {class} property OPTIONS_RECYCLE_INPUT: Integer read _GetOPTIONS_RECYCLE_INPUT;
  end;

  [JavaSignature('android/media/ThumbnailUtils')]
  JThumbnailUtils = interface(JObject)
    ['{EF230179-DF54-4876-A9BC-5D982DF95E21}']
  end;
  TJThumbnailUtils = class(TJavaGenericImport<JThumbnailUtilsClass, JThumbnailUtils>) end;

  JTimedMetaDataClass = interface(JObjectClass)
    ['{3D32D7E0-820D-41F7-9203-171A2563A6E4}']
  end;

  [JavaSignature('android/media/TimedMetaData')]
  JTimedMetaData = interface(JObject)
    ['{F0277382-AC54-4B77-A115-1AC93D5308ED}']
    function getMetaData: TJavaArray<Byte>; cdecl;
    function getTimestamp: Int64; cdecl;
  end;
  TJTimedMetaData = class(TJavaGenericImport<JTimedMetaDataClass, JTimedMetaData>) end;

  JTimedTextClass = interface(JObjectClass)
    ['{1C368248-EC42-4D7E-9CBF-4C9910FD9C67}']
  end;

  [JavaSignature('android/media/TimedText')]
  JTimedText = interface(JObject)
    ['{9240B2F5-1767-4D67-9C9D-780021A81BAE}']
    function getBounds: JRect; cdecl;
    function getText: JString; cdecl;
  end;
  TJTimedText = class(TJavaGenericImport<JTimedTextClass, JTimedText>) end;

  JToneGeneratorClass = interface(JObjectClass)
    ['{2E43AD5A-F8CC-439A-B70E-78EAC7415740}']
    {class} function _GetMAX_VOLUME: Integer; cdecl;
    {class} function _GetMIN_VOLUME: Integer; cdecl;
    {class} function _GetTONE_CDMA_ABBR_ALERT: Integer; cdecl;
    {class} function _GetTONE_CDMA_ABBR_INTERCEPT: Integer; cdecl;
    {class} function _GetTONE_CDMA_ABBR_REORDER: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_AUTOREDIAL_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_CALL_GUARD: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_INCALL_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_ALERT_NETWORK_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_ANSWER: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALLDROP_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_INTERGROUP: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_NORMAL: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT3: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT5: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT6: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT7: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_PING_RING: Integer; cdecl;
    {class} function _GetTONE_CDMA_CALL_SIGNAL_ISDN_SP_PRI: Integer; cdecl;
    {class} function _GetTONE_CDMA_CONFIRM: Integer; cdecl;
    {class} function _GetTONE_CDMA_DIAL_TONE_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_EMERGENCY_RINGBACK: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_PBX_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_SS_2: Integer; cdecl;
    {class} function _GetTONE_CDMA_HIGH_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_INTERCEPT: Integer; cdecl;
    {class} function _GetTONE_CDMA_KEYPAD_VOLUME_KEY_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_PBX_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_SS_2: Integer; cdecl;
    {class} function _GetTONE_CDMA_LOW_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_L: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_PBX_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SLS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SS: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SSL: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_SS_2: Integer; cdecl;
    {class} function _GetTONE_CDMA_MED_S_X4: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_BUSY: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_BUSY_ONE_SHOT: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_CALLWAITING: Integer; cdecl;
    {class} function _GetTONE_CDMA_NETWORK_USA_RINGBACK: Integer; cdecl;
    {class} function _GetTONE_CDMA_ONE_MIN_BEEP: Integer; cdecl;
    {class} function _GetTONE_CDMA_PIP: Integer; cdecl;
    {class} function _GetTONE_CDMA_PRESSHOLDKEY_LITE: Integer; cdecl;
    {class} function _GetTONE_CDMA_REORDER: Integer; cdecl;
    {class} function _GetTONE_CDMA_SIGNAL_OFF: Integer; cdecl;
    {class} function _GetTONE_CDMA_SOFT_ERROR_LITE: Integer; cdecl;
    {class} function _GetTONE_DTMF_0: Integer; cdecl;
    {class} function _GetTONE_DTMF_1: Integer; cdecl;
    {class} function _GetTONE_DTMF_2: Integer; cdecl;
    {class} function _GetTONE_DTMF_3: Integer; cdecl;
    {class} function _GetTONE_DTMF_4: Integer; cdecl;
    {class} function _GetTONE_DTMF_5: Integer; cdecl;
    {class} function _GetTONE_DTMF_6: Integer; cdecl;
    {class} function _GetTONE_DTMF_7: Integer; cdecl;
    {class} function _GetTONE_DTMF_8: Integer; cdecl;
    {class} function _GetTONE_DTMF_9: Integer; cdecl;
    {class} function _GetTONE_DTMF_A: Integer; cdecl;
    {class} function _GetTONE_DTMF_B: Integer; cdecl;
    {class} function _GetTONE_DTMF_C: Integer; cdecl;
    {class} function _GetTONE_DTMF_D: Integer; cdecl;
    {class} function _GetTONE_DTMF_P: Integer; cdecl;
    {class} function _GetTONE_DTMF_S: Integer; cdecl;
    {class} function _GetTONE_PROP_ACK: Integer; cdecl;
    {class} function _GetTONE_PROP_BEEP: Integer; cdecl;
    {class} function _GetTONE_PROP_BEEP2: Integer; cdecl;
    {class} function _GetTONE_PROP_NACK: Integer; cdecl;
    {class} function _GetTONE_PROP_PROMPT: Integer; cdecl;
    {class} function _GetTONE_SUP_BUSY: Integer; cdecl;
    {class} function _GetTONE_SUP_CALL_WAITING: Integer; cdecl;
    {class} function _GetTONE_SUP_CONFIRM: Integer; cdecl;
    {class} function _GetTONE_SUP_CONGESTION: Integer; cdecl;
    {class} function _GetTONE_SUP_CONGESTION_ABBREV: Integer; cdecl;
    {class} function _GetTONE_SUP_DIAL: Integer; cdecl;
    {class} function _GetTONE_SUP_ERROR: Integer; cdecl;
    {class} function _GetTONE_SUP_INTERCEPT: Integer; cdecl;
    {class} function _GetTONE_SUP_INTERCEPT_ABBREV: Integer; cdecl;
    {class} function _GetTONE_SUP_PIP: Integer; cdecl;
    {class} function _GetTONE_SUP_RADIO_ACK: Integer; cdecl;
    {class} function _GetTONE_SUP_RADIO_NOTAVAIL: Integer; cdecl;
    {class} function _GetTONE_SUP_RINGTONE: Integer; cdecl;
    {class} function init(streamType: Integer; volume: Integer): JToneGenerator; cdecl;
    {class} property MAX_VOLUME: Integer read _GetMAX_VOLUME;
    {class} property MIN_VOLUME: Integer read _GetMIN_VOLUME;
    {class} property TONE_CDMA_ABBR_ALERT: Integer read _GetTONE_CDMA_ABBR_ALERT;
    {class} property TONE_CDMA_ABBR_INTERCEPT: Integer read _GetTONE_CDMA_ABBR_INTERCEPT;
    {class} property TONE_CDMA_ABBR_REORDER: Integer read _GetTONE_CDMA_ABBR_REORDER;
    {class} property TONE_CDMA_ALERT_AUTOREDIAL_LITE: Integer read _GetTONE_CDMA_ALERT_AUTOREDIAL_LITE;
    {class} property TONE_CDMA_ALERT_CALL_GUARD: Integer read _GetTONE_CDMA_ALERT_CALL_GUARD;
    {class} property TONE_CDMA_ALERT_INCALL_LITE: Integer read _GetTONE_CDMA_ALERT_INCALL_LITE;
    {class} property TONE_CDMA_ALERT_NETWORK_LITE: Integer read _GetTONE_CDMA_ALERT_NETWORK_LITE;
    {class} property TONE_CDMA_ANSWER: Integer read _GetTONE_CDMA_ANSWER;
    {class} property TONE_CDMA_CALLDROP_LITE: Integer read _GetTONE_CDMA_CALLDROP_LITE;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_INTERGROUP: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_INTERGROUP;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_NORMAL: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_NORMAL;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT3: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT3;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT5: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT5;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT6: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT6;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PAT7: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PAT7;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_PING_RING: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_PING_RING;
    {class} property TONE_CDMA_CALL_SIGNAL_ISDN_SP_PRI: Integer read _GetTONE_CDMA_CALL_SIGNAL_ISDN_SP_PRI;
    {class} property TONE_CDMA_CONFIRM: Integer read _GetTONE_CDMA_CONFIRM;
    {class} property TONE_CDMA_DIAL_TONE_LITE: Integer read _GetTONE_CDMA_DIAL_TONE_LITE;
    {class} property TONE_CDMA_EMERGENCY_RINGBACK: Integer read _GetTONE_CDMA_EMERGENCY_RINGBACK;
    {class} property TONE_CDMA_HIGH_L: Integer read _GetTONE_CDMA_HIGH_L;
    {class} property TONE_CDMA_HIGH_PBX_L: Integer read _GetTONE_CDMA_HIGH_PBX_L;
    {class} property TONE_CDMA_HIGH_PBX_SLS: Integer read _GetTONE_CDMA_HIGH_PBX_SLS;
    {class} property TONE_CDMA_HIGH_PBX_SS: Integer read _GetTONE_CDMA_HIGH_PBX_SS;
    {class} property TONE_CDMA_HIGH_PBX_SSL: Integer read _GetTONE_CDMA_HIGH_PBX_SSL;
    {class} property TONE_CDMA_HIGH_PBX_S_X4: Integer read _GetTONE_CDMA_HIGH_PBX_S_X4;
    {class} property TONE_CDMA_HIGH_SLS: Integer read _GetTONE_CDMA_HIGH_SLS;
    {class} property TONE_CDMA_HIGH_SS: Integer read _GetTONE_CDMA_HIGH_SS;
    {class} property TONE_CDMA_HIGH_SSL: Integer read _GetTONE_CDMA_HIGH_SSL;
    {class} property TONE_CDMA_HIGH_SS_2: Integer read _GetTONE_CDMA_HIGH_SS_2;
    {class} property TONE_CDMA_HIGH_S_X4: Integer read _GetTONE_CDMA_HIGH_S_X4;
    {class} property TONE_CDMA_INTERCEPT: Integer read _GetTONE_CDMA_INTERCEPT;
    {class} property TONE_CDMA_KEYPAD_VOLUME_KEY_LITE: Integer read _GetTONE_CDMA_KEYPAD_VOLUME_KEY_LITE;
    {class} property TONE_CDMA_LOW_L: Integer read _GetTONE_CDMA_LOW_L;
    {class} property TONE_CDMA_LOW_PBX_L: Integer read _GetTONE_CDMA_LOW_PBX_L;
    {class} property TONE_CDMA_LOW_PBX_SLS: Integer read _GetTONE_CDMA_LOW_PBX_SLS;
    {class} property TONE_CDMA_LOW_PBX_SS: Integer read _GetTONE_CDMA_LOW_PBX_SS;
    {class} property TONE_CDMA_LOW_PBX_SSL: Integer read _GetTONE_CDMA_LOW_PBX_SSL;
    {class} property TONE_CDMA_LOW_PBX_S_X4: Integer read _GetTONE_CDMA_LOW_PBX_S_X4;
    {class} property TONE_CDMA_LOW_SLS: Integer read _GetTONE_CDMA_LOW_SLS;
    {class} property TONE_CDMA_LOW_SS: Integer read _GetTONE_CDMA_LOW_SS;
    {class} property TONE_CDMA_LOW_SSL: Integer read _GetTONE_CDMA_LOW_SSL;
    {class} property TONE_CDMA_LOW_SS_2: Integer read _GetTONE_CDMA_LOW_SS_2;
    {class} property TONE_CDMA_LOW_S_X4: Integer read _GetTONE_CDMA_LOW_S_X4;
    {class} property TONE_CDMA_MED_L: Integer read _GetTONE_CDMA_MED_L;
    {class} property TONE_CDMA_MED_PBX_L: Integer read _GetTONE_CDMA_MED_PBX_L;
    {class} property TONE_CDMA_MED_PBX_SLS: Integer read _GetTONE_CDMA_MED_PBX_SLS;
    {class} property TONE_CDMA_MED_PBX_SS: Integer read _GetTONE_CDMA_MED_PBX_SS;
    {class} property TONE_CDMA_MED_PBX_SSL: Integer read _GetTONE_CDMA_MED_PBX_SSL;
    {class} property TONE_CDMA_MED_PBX_S_X4: Integer read _GetTONE_CDMA_MED_PBX_S_X4;
    {class} property TONE_CDMA_MED_SLS: Integer read _GetTONE_CDMA_MED_SLS;
    {class} property TONE_CDMA_MED_SS: Integer read _GetTONE_CDMA_MED_SS;
    {class} property TONE_CDMA_MED_SSL: Integer read _GetTONE_CDMA_MED_SSL;
    {class} property TONE_CDMA_MED_SS_2: Integer read _GetTONE_CDMA_MED_SS_2;
    {class} property TONE_CDMA_MED_S_X4: Integer read _GetTONE_CDMA_MED_S_X4;
    {class} property TONE_CDMA_NETWORK_BUSY: Integer read _GetTONE_CDMA_NETWORK_BUSY;
    {class} property TONE_CDMA_NETWORK_BUSY_ONE_SHOT: Integer read _GetTONE_CDMA_NETWORK_BUSY_ONE_SHOT;
    {class} property TONE_CDMA_NETWORK_CALLWAITING: Integer read _GetTONE_CDMA_NETWORK_CALLWAITING;
    {class} property TONE_CDMA_NETWORK_USA_RINGBACK: Integer read _GetTONE_CDMA_NETWORK_USA_RINGBACK;
    {class} property TONE_CDMA_ONE_MIN_BEEP: Integer read _GetTONE_CDMA_ONE_MIN_BEEP;
    {class} property TONE_CDMA_PIP: Integer read _GetTONE_CDMA_PIP;
    {class} property TONE_CDMA_PRESSHOLDKEY_LITE: Integer read _GetTONE_CDMA_PRESSHOLDKEY_LITE;
    {class} property TONE_CDMA_REORDER: Integer read _GetTONE_CDMA_REORDER;
    {class} property TONE_CDMA_SIGNAL_OFF: Integer read _GetTONE_CDMA_SIGNAL_OFF;
    {class} property TONE_CDMA_SOFT_ERROR_LITE: Integer read _GetTONE_CDMA_SOFT_ERROR_LITE;
    {class} property TONE_DTMF_0: Integer read _GetTONE_DTMF_0;
    {class} property TONE_DTMF_1: Integer read _GetTONE_DTMF_1;
    {class} property TONE_DTMF_2: Integer read _GetTONE_DTMF_2;
    {class} property TONE_DTMF_3: Integer read _GetTONE_DTMF_3;
    {class} property TONE_DTMF_4: Integer read _GetTONE_DTMF_4;
    {class} property TONE_DTMF_5: Integer read _GetTONE_DTMF_5;
    {class} property TONE_DTMF_6: Integer read _GetTONE_DTMF_6;
    {class} property TONE_DTMF_7: Integer read _GetTONE_DTMF_7;
    {class} property TONE_DTMF_8: Integer read _GetTONE_DTMF_8;
    {class} property TONE_DTMF_9: Integer read _GetTONE_DTMF_9;
    {class} property TONE_DTMF_A: Integer read _GetTONE_DTMF_A;
    {class} property TONE_DTMF_B: Integer read _GetTONE_DTMF_B;
    {class} property TONE_DTMF_C: Integer read _GetTONE_DTMF_C;
    {class} property TONE_DTMF_D: Integer read _GetTONE_DTMF_D;
    {class} property TONE_DTMF_P: Integer read _GetTONE_DTMF_P;
    {class} property TONE_DTMF_S: Integer read _GetTONE_DTMF_S;
    {class} property TONE_PROP_ACK: Integer read _GetTONE_PROP_ACK;
    {class} property TONE_PROP_BEEP: Integer read _GetTONE_PROP_BEEP;
    {class} property TONE_PROP_BEEP2: Integer read _GetTONE_PROP_BEEP2;
    {class} property TONE_PROP_NACK: Integer read _GetTONE_PROP_NACK;
    {class} property TONE_PROP_PROMPT: Integer read _GetTONE_PROP_PROMPT;
    {class} property TONE_SUP_BUSY: Integer read _GetTONE_SUP_BUSY;
    {class} property TONE_SUP_CALL_WAITING: Integer read _GetTONE_SUP_CALL_WAITING;
    {class} property TONE_SUP_CONFIRM: Integer read _GetTONE_SUP_CONFIRM;
    {class} property TONE_SUP_CONGESTION: Integer read _GetTONE_SUP_CONGESTION;
    {class} property TONE_SUP_CONGESTION_ABBREV: Integer read _GetTONE_SUP_CONGESTION_ABBREV;
    {class} property TONE_SUP_DIAL: Integer read _GetTONE_SUP_DIAL;
    {class} property TONE_SUP_ERROR: Integer read _GetTONE_SUP_ERROR;
    {class} property TONE_SUP_INTERCEPT: Integer read _GetTONE_SUP_INTERCEPT;
    {class} property TONE_SUP_INTERCEPT_ABBREV: Integer read _GetTONE_SUP_INTERCEPT_ABBREV;
    {class} property TONE_SUP_PIP: Integer read _GetTONE_SUP_PIP;
    {class} property TONE_SUP_RADIO_ACK: Integer read _GetTONE_SUP_RADIO_ACK;
    {class} property TONE_SUP_RADIO_NOTAVAIL: Integer read _GetTONE_SUP_RADIO_NOTAVAIL;
    {class} property TONE_SUP_RINGTONE: Integer read _GetTONE_SUP_RINGTONE;
  end;

  [JavaSignature('android/media/ToneGenerator')]
  JToneGenerator = interface(JObject)
    ['{F31E2BEF-7899-4B50-8ED2-13547C7AA405}']
    function getAudioSessionId: Integer; cdecl;
    procedure release; cdecl;
    function startTone(toneType: Integer): Boolean; cdecl; overload;
    function startTone(toneType: Integer; durationMs: Integer): Boolean; cdecl; overload;
    procedure stopTone; cdecl;
  end;
  TJToneGenerator = class(TJavaGenericImport<JToneGeneratorClass, JToneGenerator>) end;

  JUnsupportedSchemeExceptionClass = interface(JMediaDrmExceptionClass)
    ['{D5DA0D0E-66A6-4CF4-A98D-A01F66C3E877}']
    {class} function init(detailMessage: JString): JUnsupportedSchemeException; cdecl;
  end;

  [JavaSignature('android/media/UnsupportedSchemeException')]
  JUnsupportedSchemeException = interface(JMediaDrmException)
    ['{B6A003FA-B91A-46B9-83E4-9654A849903C}']
  end;
  TJUnsupportedSchemeException = class(TJavaGenericImport<JUnsupportedSchemeExceptionClass, JUnsupportedSchemeException>) end;

  JVolumeProviderClass = interface(JObjectClass)
    ['{178BD28B-46A3-452D-B274-B226800793E4}']
    {class} function _GetVOLUME_CONTROL_ABSOLUTE: Integer; cdecl;
    {class} function _GetVOLUME_CONTROL_FIXED: Integer; cdecl;
    {class} function _GetVOLUME_CONTROL_RELATIVE: Integer; cdecl;
    {class} function init(volumeControl: Integer; maxVolume: Integer; currentVolume: Integer): JVolumeProvider; cdecl;
    {class} property VOLUME_CONTROL_ABSOLUTE: Integer read _GetVOLUME_CONTROL_ABSOLUTE;
    {class} property VOLUME_CONTROL_FIXED: Integer read _GetVOLUME_CONTROL_FIXED;
    {class} property VOLUME_CONTROL_RELATIVE: Integer read _GetVOLUME_CONTROL_RELATIVE;
  end;

  [JavaSignature('android/media/VolumeProvider')]
  JVolumeProvider = interface(JObject)
    ['{528B083C-AD72-4845-9AED-186F0347D369}']
    function getCurrentVolume: Integer; cdecl;
    function getMaxVolume: Integer; cdecl;
    function getVolumeControl: Integer; cdecl;
    procedure onAdjustVolume(direction: Integer); cdecl;
    procedure onSetVolumeTo(volume: Integer); cdecl;
    procedure setCurrentVolume(currentVolume: Integer); cdecl;
  end;
  TJVolumeProvider = class(TJavaGenericImport<JVolumeProviderClass, JVolumeProvider>) end;

  JAudioEffectClass = interface(JObjectClass)
    ['{13CBADC9-1D73-46D0-9D39-50F50F8E5EE5}']
    {class} function _GetACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION: JString; cdecl;
    {class} function _GetACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL: JString; cdecl;
    {class} function _GetACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION: JString; cdecl;
    {class} function _GetALREADY_EXISTS: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_GAME: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MOVIE: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_MUSIC: Integer; cdecl;
    {class} function _GetCONTENT_TYPE_VOICE: Integer; cdecl;
    {class} function _GetEFFECT_AUXILIARY: JString; cdecl;
    {class} function _GetEFFECT_INSERT: JString; cdecl;
    {class} function _GetEFFECT_TYPE_AEC: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_AGC: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_BASS_BOOST: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_ENV_REVERB: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_EQUALIZER: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_LOUDNESS_ENHANCER: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_NS: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_PRESET_REVERB: JUUID; cdecl;
    {class} function _GetEFFECT_TYPE_VIRTUALIZER: JUUID; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetERROR_NO_INIT: Integer; cdecl;
    {class} function _GetERROR_NO_MEMORY: Integer; cdecl;
    {class} function _GetEXTRA_AUDIO_SESSION: JString; cdecl;
    {class} function _GetEXTRA_CONTENT_TYPE: JString; cdecl;
    {class} function _GetEXTRA_PACKAGE_NAME: JString; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function queryEffects: TJavaObjectArray<JAudioEffect_Descriptor>; cdecl;
    {class} property ACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION: JString read _GetACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION;
    {class} property ACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL: JString read _GetACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL;
    {class} property ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION: JString read _GetACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION;
    {class} property ALREADY_EXISTS: Integer read _GetALREADY_EXISTS;
    {class} property CONTENT_TYPE_GAME: Integer read _GetCONTENT_TYPE_GAME;
    {class} property CONTENT_TYPE_MOVIE: Integer read _GetCONTENT_TYPE_MOVIE;
    {class} property CONTENT_TYPE_MUSIC: Integer read _GetCONTENT_TYPE_MUSIC;
    {class} property CONTENT_TYPE_VOICE: Integer read _GetCONTENT_TYPE_VOICE;
    {class} property EFFECT_AUXILIARY: JString read _GetEFFECT_AUXILIARY;
    {class} property EFFECT_INSERT: JString read _GetEFFECT_INSERT;
    {class} property EFFECT_TYPE_AEC: JUUID read _GetEFFECT_TYPE_AEC;
    {class} property EFFECT_TYPE_AGC: JUUID read _GetEFFECT_TYPE_AGC;
    {class} property EFFECT_TYPE_BASS_BOOST: JUUID read _GetEFFECT_TYPE_BASS_BOOST;
    {class} property EFFECT_TYPE_ENV_REVERB: JUUID read _GetEFFECT_TYPE_ENV_REVERB;
    {class} property EFFECT_TYPE_EQUALIZER: JUUID read _GetEFFECT_TYPE_EQUALIZER;
    {class} property EFFECT_TYPE_LOUDNESS_ENHANCER: JUUID read _GetEFFECT_TYPE_LOUDNESS_ENHANCER;
    {class} property EFFECT_TYPE_NS: JUUID read _GetEFFECT_TYPE_NS;
    {class} property EFFECT_TYPE_PRESET_REVERB: JUUID read _GetEFFECT_TYPE_PRESET_REVERB;
    {class} property EFFECT_TYPE_VIRTUALIZER: JUUID read _GetEFFECT_TYPE_VIRTUALIZER;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property ERROR_NO_INIT: Integer read _GetERROR_NO_INIT;
    {class} property ERROR_NO_MEMORY: Integer read _GetERROR_NO_MEMORY;
    {class} property EXTRA_AUDIO_SESSION: JString read _GetEXTRA_AUDIO_SESSION;
    {class} property EXTRA_CONTENT_TYPE: JString read _GetEXTRA_CONTENT_TYPE;
    {class} property EXTRA_PACKAGE_NAME: JString read _GetEXTRA_PACKAGE_NAME;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/media/audiofx/AudioEffect')]
  JAudioEffect = interface(JObject)
    ['{B494B3B3-1965-4831-9006-E22DC339A6C9}']
    function getDescriptor: JAudioEffect_Descriptor; cdecl;
    function getEnabled: Boolean; cdecl;
    function getId: Integer; cdecl;
    function hasControl: Boolean; cdecl;
    procedure release; cdecl;
    procedure setControlStatusListener(listener: JAudioEffect_OnControlStatusChangeListener); cdecl;
    procedure setEnableStatusListener(listener: JAudioEffect_OnEnableStatusChangeListener); cdecl;
    function setEnabled(enabled: Boolean): Integer; cdecl;
  end;
  TJAudioEffect = class(TJavaGenericImport<JAudioEffectClass, JAudioEffect>) end;

  JAcousticEchoCancelerClass = interface(JAudioEffectClass)
    ['{460A7A72-477C-497E-8D78-1BC0E9A71276}']
    {class} function create(audioSession: Integer): JAcousticEchoCanceler; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/AcousticEchoCanceler')]
  JAcousticEchoCanceler = interface(JAudioEffect)
    ['{DD17BEFF-C337-4979-A5DA-7A5B51C8BED5}']
  end;
  TJAcousticEchoCanceler = class(TJavaGenericImport<JAcousticEchoCancelerClass, JAcousticEchoCanceler>) end;

  JAudioEffect_DescriptorClass = interface(JObjectClass)
    ['{9A3069D0-C184-480C-B71E-20295F8F478D}']
    {class} function init: JAudioEffect_Descriptor; cdecl; overload;
    {class} function init(type_: JString; uuid: JString; connectMode: JString; name: JString; implementor: JString): JAudioEffect_Descriptor; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/AudioEffect$Descriptor')]
  JAudioEffect_Descriptor = interface(JObject)
    ['{51401F65-35F1-4271-88E5-9991F790D845}']
    function _GetconnectMode: JString; cdecl;
    procedure _SetconnectMode(Value: JString); cdecl;
    function _Getimplementor: JString; cdecl;
    procedure _Setimplementor(Value: JString); cdecl;
    function _Getname: JString; cdecl;
    procedure _Setname(Value: JString); cdecl;
    function _Gettype: JUUID; cdecl;
    procedure _Settype(Value: JUUID); cdecl;
    function _Getuuid: JUUID; cdecl;
    procedure _Setuuid(Value: JUUID); cdecl;
    property connectMode: JString read _GetconnectMode write _SetconnectMode;
    property implementor: JString read _Getimplementor write _Setimplementor;
    property name: JString read _Getname write _Setname;
    property &type: JUUID read _Gettype write _Settype;
    property uuid: JUUID read _Getuuid write _Setuuid;
  end;
  TJAudioEffect_Descriptor = class(TJavaGenericImport<JAudioEffect_DescriptorClass, JAudioEffect_Descriptor>) end;

  JAudioEffect_OnControlStatusChangeListenerClass = interface(IJavaClass)
    ['{77DA1E79-25E0-48F3-B55B-9D716AE5D500}']
  end;

  [JavaSignature('android/media/audiofx/AudioEffect$OnControlStatusChangeListener')]
  JAudioEffect_OnControlStatusChangeListener = interface(IJavaInstance)
    ['{C3C4A416-A600-46BB-8710-0FCFEFA42076}']
    procedure onControlStatusChange(effect: JAudioEffect; controlGranted: Boolean); cdecl;
  end;
  TJAudioEffect_OnControlStatusChangeListener = class(TJavaGenericImport<JAudioEffect_OnControlStatusChangeListenerClass, JAudioEffect_OnControlStatusChangeListener>) end;

  JAudioEffect_OnEnableStatusChangeListenerClass = interface(IJavaClass)
    ['{98D458F7-D2B6-412A-BE43-6825ACA42EA8}']
  end;

  [JavaSignature('android/media/audiofx/AudioEffect$OnEnableStatusChangeListener')]
  JAudioEffect_OnEnableStatusChangeListener = interface(IJavaInstance)
    ['{F2A3F549-058B-4354-A8B2-508B65EC88AF}']
    procedure onEnableStatusChange(effect: JAudioEffect; enabled: Boolean); cdecl;
  end;
  TJAudioEffect_OnEnableStatusChangeListener = class(TJavaGenericImport<JAudioEffect_OnEnableStatusChangeListenerClass, JAudioEffect_OnEnableStatusChangeListener>) end;

  JAutomaticGainControlClass = interface(JAudioEffectClass)
    ['{D3C90786-5E89-4FF8-8D7E-9E79A05CBB6A}']
    {class} function create(audioSession: Integer): JAutomaticGainControl; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/AutomaticGainControl')]
  JAutomaticGainControl = interface(JAudioEffect)
    ['{36F93C00-2A45-4AD0-B880-F79B56FE4096}']
  end;
  TJAutomaticGainControl = class(TJavaGenericImport<JAutomaticGainControlClass, JAutomaticGainControl>) end;

  JBassBoostClass = interface(JAudioEffectClass)
    ['{A209500F-399B-4AD4-B8BB-7D8E574B745E}']
    {class} function _GetPARAM_STRENGTH: Integer; cdecl;
    {class} function _GetPARAM_STRENGTH_SUPPORTED: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JBassBoost; cdecl;
    {class} property PARAM_STRENGTH: Integer read _GetPARAM_STRENGTH;
    {class} property PARAM_STRENGTH_SUPPORTED: Integer read _GetPARAM_STRENGTH_SUPPORTED;
  end;

  [JavaSignature('android/media/audiofx/BassBoost')]
  JBassBoost = interface(JAudioEffect)
    ['{38228576-3D9D-42B1-82AD-30EA32654FDD}']
    function getProperties: JBassBoost_Settings; cdecl;
    function getRoundedStrength: SmallInt; cdecl;
    function getStrengthSupported: Boolean; cdecl;
    procedure setParameterListener(listener: JBassBoost_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JBassBoost_Settings); cdecl;
    procedure setStrength(strength: SmallInt); cdecl;
  end;
  TJBassBoost = class(TJavaGenericImport<JBassBoostClass, JBassBoost>) end;

  JBassBoost_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{BFF4F1F8-5F21-47A9-BBB5-3EEE6066B689}']
  end;

  [JavaSignature('android/media/audiofx/BassBoost$OnParameterChangeListener')]
  JBassBoost_OnParameterChangeListener = interface(IJavaInstance)
    ['{CF34C515-408C-4ED9-8D9A-C1F73EA0CDAB}']
    procedure onParameterChange(effect: JBassBoost; status: Integer; param: Integer; value: SmallInt); cdecl;
  end;
  TJBassBoost_OnParameterChangeListener = class(TJavaGenericImport<JBassBoost_OnParameterChangeListenerClass, JBassBoost_OnParameterChangeListener>) end;

  JBassBoost_SettingsClass = interface(JObjectClass)
    ['{16961C98-3B24-451A-A990-83E334394621}']
    {class} function init: JBassBoost_Settings; cdecl; overload;
    {class} function init(settings: JString): JBassBoost_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/BassBoost$Settings')]
  JBassBoost_Settings = interface(JObject)
    ['{126672AC-6E3E-4118-85C0-52A19083384F}']
    function _Getstrength: SmallInt; cdecl;
    procedure _Setstrength(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property strength: SmallInt read _Getstrength write _Setstrength;
  end;
  TJBassBoost_Settings = class(TJavaGenericImport<JBassBoost_SettingsClass, JBassBoost_Settings>) end;

  JEnvironmentalReverbClass = interface(JAudioEffectClass)
    ['{6BDA0E80-3384-4B98-8145-F15D5728C3A6}']
    {class} function _GetPARAM_DECAY_HF_RATIO: Integer; cdecl;
    {class} function _GetPARAM_DECAY_TIME: Integer; cdecl;
    {class} function _GetPARAM_DENSITY: Integer; cdecl;
    {class} function _GetPARAM_DIFFUSION: Integer; cdecl;
    {class} function _GetPARAM_REFLECTIONS_DELAY: Integer; cdecl;
    {class} function _GetPARAM_REFLECTIONS_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_REVERB_DELAY: Integer; cdecl;
    {class} function _GetPARAM_REVERB_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_ROOM_HF_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_ROOM_LEVEL: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JEnvironmentalReverb; cdecl;
    {class} property PARAM_DECAY_HF_RATIO: Integer read _GetPARAM_DECAY_HF_RATIO;
    {class} property PARAM_DECAY_TIME: Integer read _GetPARAM_DECAY_TIME;
    {class} property PARAM_DENSITY: Integer read _GetPARAM_DENSITY;
    {class} property PARAM_DIFFUSION: Integer read _GetPARAM_DIFFUSION;
    {class} property PARAM_REFLECTIONS_DELAY: Integer read _GetPARAM_REFLECTIONS_DELAY;
    {class} property PARAM_REFLECTIONS_LEVEL: Integer read _GetPARAM_REFLECTIONS_LEVEL;
    {class} property PARAM_REVERB_DELAY: Integer read _GetPARAM_REVERB_DELAY;
    {class} property PARAM_REVERB_LEVEL: Integer read _GetPARAM_REVERB_LEVEL;
    {class} property PARAM_ROOM_HF_LEVEL: Integer read _GetPARAM_ROOM_HF_LEVEL;
    {class} property PARAM_ROOM_LEVEL: Integer read _GetPARAM_ROOM_LEVEL;
  end;

  [JavaSignature('android/media/audiofx/EnvironmentalReverb')]
  JEnvironmentalReverb = interface(JAudioEffect)
    ['{94A98733-66B8-4C17-B49C-5AD18808F3DB}']
    function getDecayHFRatio: SmallInt; cdecl;
    function getDecayTime: Integer; cdecl;
    function getDensity: SmallInt; cdecl;
    function getDiffusion: SmallInt; cdecl;
    function getProperties: JEnvironmentalReverb_Settings; cdecl;
    function getReflectionsDelay: Integer; cdecl;
    function getReflectionsLevel: SmallInt; cdecl;
    function getReverbDelay: Integer; cdecl;
    function getReverbLevel: SmallInt; cdecl;
    function getRoomHFLevel: SmallInt; cdecl;
    function getRoomLevel: SmallInt; cdecl;
    procedure setDecayHFRatio(decayHFRatio: SmallInt); cdecl;
    procedure setDecayTime(decayTime: Integer); cdecl;
    procedure setDensity(density: SmallInt); cdecl;
    procedure setDiffusion(diffusion: SmallInt); cdecl;
    procedure setParameterListener(listener: JEnvironmentalReverb_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JEnvironmentalReverb_Settings); cdecl;
    procedure setReflectionsDelay(reflectionsDelay: Integer); cdecl;
    procedure setReflectionsLevel(reflectionsLevel: SmallInt); cdecl;
    procedure setReverbDelay(reverbDelay: Integer); cdecl;
    procedure setReverbLevel(reverbLevel: SmallInt); cdecl;
    procedure setRoomHFLevel(roomHF: SmallInt); cdecl;
    procedure setRoomLevel(room: SmallInt); cdecl;
  end;
  TJEnvironmentalReverb = class(TJavaGenericImport<JEnvironmentalReverbClass, JEnvironmentalReverb>) end;

  JEnvironmentalReverb_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{51B7A404-EFBC-402C-AEA7-59B0E9ADABEE}']
  end;

  [JavaSignature('android/media/audiofx/EnvironmentalReverb$OnParameterChangeListener')]
  JEnvironmentalReverb_OnParameterChangeListener = interface(IJavaInstance)
    ['{2D4E8354-BD92-4AC9-8907-0B63369AA1CF}']
    procedure onParameterChange(effect: JEnvironmentalReverb; status: Integer; param: Integer; value: Integer); cdecl;
  end;
  TJEnvironmentalReverb_OnParameterChangeListener = class(TJavaGenericImport<JEnvironmentalReverb_OnParameterChangeListenerClass, JEnvironmentalReverb_OnParameterChangeListener>) end;

  JEnvironmentalReverb_SettingsClass = interface(JObjectClass)
    ['{552A5CB8-6E2A-4F05-ABCB-0C4947BADB69}']
    {class} function init: JEnvironmentalReverb_Settings; cdecl; overload;
    {class} function init(settings: JString): JEnvironmentalReverb_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/EnvironmentalReverb$Settings')]
  JEnvironmentalReverb_Settings = interface(JObject)
    ['{8456E091-3040-4D39-A819-68433D6B5C08}']
    function _GetdecayHFRatio: SmallInt; cdecl;
    procedure _SetdecayHFRatio(Value: SmallInt); cdecl;
    function _GetdecayTime: Integer; cdecl;
    procedure _SetdecayTime(Value: Integer); cdecl;
    function _Getdensity: SmallInt; cdecl;
    procedure _Setdensity(Value: SmallInt); cdecl;
    function _Getdiffusion: SmallInt; cdecl;
    procedure _Setdiffusion(Value: SmallInt); cdecl;
    function _GetreflectionsDelay: Integer; cdecl;
    procedure _SetreflectionsDelay(Value: Integer); cdecl;
    function _GetreflectionsLevel: SmallInt; cdecl;
    procedure _SetreflectionsLevel(Value: SmallInt); cdecl;
    function _GetreverbDelay: Integer; cdecl;
    procedure _SetreverbDelay(Value: Integer); cdecl;
    function _GetreverbLevel: SmallInt; cdecl;
    procedure _SetreverbLevel(Value: SmallInt); cdecl;
    function _GetroomHFLevel: SmallInt; cdecl;
    procedure _SetroomHFLevel(Value: SmallInt); cdecl;
    function _GetroomLevel: SmallInt; cdecl;
    procedure _SetroomLevel(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property decayHFRatio: SmallInt read _GetdecayHFRatio write _SetdecayHFRatio;
    property decayTime: Integer read _GetdecayTime write _SetdecayTime;
    property density: SmallInt read _Getdensity write _Setdensity;
    property diffusion: SmallInt read _Getdiffusion write _Setdiffusion;
    property reflectionsDelay: Integer read _GetreflectionsDelay write _SetreflectionsDelay;
    property reflectionsLevel: SmallInt read _GetreflectionsLevel write _SetreflectionsLevel;
    property reverbDelay: Integer read _GetreverbDelay write _SetreverbDelay;
    property reverbLevel: SmallInt read _GetreverbLevel write _SetreverbLevel;
    property roomHFLevel: SmallInt read _GetroomHFLevel write _SetroomHFLevel;
    property roomLevel: SmallInt read _GetroomLevel write _SetroomLevel;
  end;
  TJEnvironmentalReverb_Settings = class(TJavaGenericImport<JEnvironmentalReverb_SettingsClass, JEnvironmentalReverb_Settings>) end;

  JEqualizerClass = interface(JAudioEffectClass)
    ['{C4A093C1-0B55-4362-850E-FD34701A91F6}']
    {class} function _GetPARAM_BAND_FREQ_RANGE: Integer; cdecl;
    {class} function _GetPARAM_BAND_LEVEL: Integer; cdecl;
    {class} function _GetPARAM_CENTER_FREQ: Integer; cdecl;
    {class} function _GetPARAM_CURRENT_PRESET: Integer; cdecl;
    {class} function _GetPARAM_GET_BAND: Integer; cdecl;
    {class} function _GetPARAM_GET_NUM_OF_PRESETS: Integer; cdecl;
    {class} function _GetPARAM_GET_PRESET_NAME: Integer; cdecl;
    {class} function _GetPARAM_LEVEL_RANGE: Integer; cdecl;
    {class} function _GetPARAM_NUM_BANDS: Integer; cdecl;
    {class} function _GetPARAM_STRING_SIZE_MAX: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JEqualizer; cdecl;
    {class} property PARAM_BAND_FREQ_RANGE: Integer read _GetPARAM_BAND_FREQ_RANGE;
    {class} property PARAM_BAND_LEVEL: Integer read _GetPARAM_BAND_LEVEL;
    {class} property PARAM_CENTER_FREQ: Integer read _GetPARAM_CENTER_FREQ;
    {class} property PARAM_CURRENT_PRESET: Integer read _GetPARAM_CURRENT_PRESET;
    {class} property PARAM_GET_BAND: Integer read _GetPARAM_GET_BAND;
    {class} property PARAM_GET_NUM_OF_PRESETS: Integer read _GetPARAM_GET_NUM_OF_PRESETS;
    {class} property PARAM_GET_PRESET_NAME: Integer read _GetPARAM_GET_PRESET_NAME;
    {class} property PARAM_LEVEL_RANGE: Integer read _GetPARAM_LEVEL_RANGE;
    {class} property PARAM_NUM_BANDS: Integer read _GetPARAM_NUM_BANDS;
    {class} property PARAM_STRING_SIZE_MAX: Integer read _GetPARAM_STRING_SIZE_MAX;
  end;

  [JavaSignature('android/media/audiofx/Equalizer')]
  JEqualizer = interface(JAudioEffect)
    ['{AFA7DCA7-C3EA-4D50-811D-1788E9648023}']
    function getBand(frequency: Integer): SmallInt; cdecl;
    function getBandFreqRange(band: SmallInt): TJavaArray<Integer>; cdecl;
    function getBandLevel(band: SmallInt): SmallInt; cdecl;
    function getBandLevelRange: TJavaArray<SmallInt>; cdecl;
    function getCenterFreq(band: SmallInt): Integer; cdecl;
    function getCurrentPreset: SmallInt; cdecl;
    function getNumberOfBands: SmallInt; cdecl;
    function getNumberOfPresets: SmallInt; cdecl;
    function getPresetName(preset: SmallInt): JString; cdecl;
    function getProperties: JEqualizer_Settings; cdecl;
    procedure setBandLevel(band: SmallInt; level: SmallInt); cdecl;
    procedure setParameterListener(listener: JEqualizer_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JEqualizer_Settings); cdecl;
    procedure usePreset(preset: SmallInt); cdecl;
  end;
  TJEqualizer = class(TJavaGenericImport<JEqualizerClass, JEqualizer>) end;

  JEqualizer_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{E9CD9590-C15D-4BF5-8EC8-0459C90DF626}']
  end;

  [JavaSignature('android/media/audiofx/Equalizer$OnParameterChangeListener')]
  JEqualizer_OnParameterChangeListener = interface(IJavaInstance)
    ['{9C53A56E-58B3-477F-8B7A-40972ADDBC15}']
    procedure onParameterChange(effect: JEqualizer; status: Integer; param1: Integer; param2: Integer; value: Integer); cdecl;
  end;
  TJEqualizer_OnParameterChangeListener = class(TJavaGenericImport<JEqualizer_OnParameterChangeListenerClass, JEqualizer_OnParameterChangeListener>) end;

  JEqualizer_SettingsClass = interface(JObjectClass)
    ['{23304420-D186-451A-B6DC-5846218AA62D}']
    {class} function init: JEqualizer_Settings; cdecl; overload;
    {class} function init(settings: JString): JEqualizer_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/Equalizer$Settings')]
  JEqualizer_Settings = interface(JObject)
    ['{F4F67A0D-3F81-4AE7-80BE-21154E40D5A1}']
    function _GetbandLevels: TJavaArray<SmallInt>; cdecl;
    procedure _SetbandLevels(Value: TJavaArray<SmallInt>); cdecl;
    function _GetcurPreset: SmallInt; cdecl;
    procedure _SetcurPreset(Value: SmallInt); cdecl;
    function _GetnumBands: SmallInt; cdecl;
    procedure _SetnumBands(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property bandLevels: TJavaArray<SmallInt> read _GetbandLevels write _SetbandLevels;
    property curPreset: SmallInt read _GetcurPreset write _SetcurPreset;
    property numBands: SmallInt read _GetnumBands write _SetnumBands;
  end;
  TJEqualizer_Settings = class(TJavaGenericImport<JEqualizer_SettingsClass, JEqualizer_Settings>) end;

  JLoudnessEnhancerClass = interface(JAudioEffectClass)
    ['{0E17F2B9-AEFE-48A2-B880-85E8DF6022B1}']
    {class} function _GetPARAM_TARGET_GAIN_MB: Integer; cdecl;
    {class} function init(audioSession: Integer): JLoudnessEnhancer; cdecl;
    {class} property PARAM_TARGET_GAIN_MB: Integer read _GetPARAM_TARGET_GAIN_MB;
  end;

  [JavaSignature('android/media/audiofx/LoudnessEnhancer')]
  JLoudnessEnhancer = interface(JAudioEffect)
    ['{F3CFDC54-299C-4774-B4F1-BD348CA08827}']
    function getTargetGain: Single; cdecl;
    procedure setTargetGain(gainmB: Integer); cdecl;
  end;
  TJLoudnessEnhancer = class(TJavaGenericImport<JLoudnessEnhancerClass, JLoudnessEnhancer>) end;

  JNoiseSuppressorClass = interface(JAudioEffectClass)
    ['{F7824EA5-778F-46DC-8D0C-FB914FE0B3AA}']
    {class} function create(audioSession: Integer): JNoiseSuppressor; cdecl;
    {class} function isAvailable: Boolean; cdecl;
  end;

  [JavaSignature('android/media/audiofx/NoiseSuppressor')]
  JNoiseSuppressor = interface(JAudioEffect)
    ['{2B24295A-1361-400E-9ECF-75B5A696A150}']
  end;
  TJNoiseSuppressor = class(TJavaGenericImport<JNoiseSuppressorClass, JNoiseSuppressor>) end;

  JPresetReverbClass = interface(JAudioEffectClass)
    ['{E6BDD7E1-087C-4BEF-BBCC-001619236297}']
    {class} function _GetPARAM_PRESET: Integer; cdecl;
    {class} function _GetPRESET_LARGEHALL: SmallInt; cdecl;
    {class} function _GetPRESET_LARGEROOM: SmallInt; cdecl;
    {class} function _GetPRESET_MEDIUMHALL: SmallInt; cdecl;
    {class} function _GetPRESET_MEDIUMROOM: SmallInt; cdecl;
    {class} function _GetPRESET_NONE: SmallInt; cdecl;
    {class} function _GetPRESET_PLATE: SmallInt; cdecl;
    {class} function _GetPRESET_SMALLROOM: SmallInt; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JPresetReverb; cdecl;
    {class} property PARAM_PRESET: Integer read _GetPARAM_PRESET;
    {class} property PRESET_LARGEHALL: SmallInt read _GetPRESET_LARGEHALL;
    {class} property PRESET_LARGEROOM: SmallInt read _GetPRESET_LARGEROOM;
    {class} property PRESET_MEDIUMHALL: SmallInt read _GetPRESET_MEDIUMHALL;
    {class} property PRESET_MEDIUMROOM: SmallInt read _GetPRESET_MEDIUMROOM;
    {class} property PRESET_NONE: SmallInt read _GetPRESET_NONE;
    {class} property PRESET_PLATE: SmallInt read _GetPRESET_PLATE;
    {class} property PRESET_SMALLROOM: SmallInt read _GetPRESET_SMALLROOM;
  end;

  [JavaSignature('android/media/audiofx/PresetReverb')]
  JPresetReverb = interface(JAudioEffect)
    ['{86BA2002-A4F4-4B7F-8EB0-9DE5F08D9893}']
    function getPreset: SmallInt; cdecl;
    function getProperties: JPresetReverb_Settings; cdecl;
    procedure setParameterListener(listener: JPresetReverb_OnParameterChangeListener); cdecl;
    procedure setPreset(preset: SmallInt); cdecl;
    procedure setProperties(settings: JPresetReverb_Settings); cdecl;
  end;
  TJPresetReverb = class(TJavaGenericImport<JPresetReverbClass, JPresetReverb>) end;

  JPresetReverb_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{CF4131D1-77D9-444D-B8B5-FD871FF14C33}']
  end;

  [JavaSignature('android/media/audiofx/PresetReverb$OnParameterChangeListener')]
  JPresetReverb_OnParameterChangeListener = interface(IJavaInstance)
    ['{737B2E06-FD75-46B4-938E-E8DD6530E263}']
    procedure onParameterChange(effect: JPresetReverb; status: Integer; param: Integer; value: SmallInt); cdecl;
  end;
  TJPresetReverb_OnParameterChangeListener = class(TJavaGenericImport<JPresetReverb_OnParameterChangeListenerClass, JPresetReverb_OnParameterChangeListener>) end;

  JPresetReverb_SettingsClass = interface(JObjectClass)
    ['{DF5566DC-55CD-4C26-9AB8-520F698491CC}']
    {class} function init: JPresetReverb_Settings; cdecl; overload;
    {class} function init(settings: JString): JPresetReverb_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/PresetReverb$Settings')]
  JPresetReverb_Settings = interface(JObject)
    ['{F57B0B89-4CDE-451E-BF10-43518B99BB08}']
    function _Getpreset: SmallInt; cdecl;
    procedure _Setpreset(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property preset: SmallInt read _Getpreset write _Setpreset;
  end;
  TJPresetReverb_Settings = class(TJavaGenericImport<JPresetReverb_SettingsClass, JPresetReverb_Settings>) end;

  JVirtualizerClass = interface(JAudioEffectClass)
    ['{FD870DEA-E35B-48C4-B8D9-FFFEC73F5AEC}']
    {class} function _GetPARAM_STRENGTH: Integer; cdecl;
    {class} function _GetPARAM_STRENGTH_SUPPORTED: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_AUTO: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_BINAURAL: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_OFF: Integer; cdecl;
    {class} function _GetVIRTUALIZATION_MODE_TRANSAURAL: Integer; cdecl;
    {class} function init(priority: Integer; audioSession: Integer): JVirtualizer; cdecl;
    {class} property PARAM_STRENGTH: Integer read _GetPARAM_STRENGTH;
    {class} property PARAM_STRENGTH_SUPPORTED: Integer read _GetPARAM_STRENGTH_SUPPORTED;
    {class} property VIRTUALIZATION_MODE_AUTO: Integer read _GetVIRTUALIZATION_MODE_AUTO;
    {class} property VIRTUALIZATION_MODE_BINAURAL: Integer read _GetVIRTUALIZATION_MODE_BINAURAL;
    {class} property VIRTUALIZATION_MODE_OFF: Integer read _GetVIRTUALIZATION_MODE_OFF;
    {class} property VIRTUALIZATION_MODE_TRANSAURAL: Integer read _GetVIRTUALIZATION_MODE_TRANSAURAL;
  end;

  [JavaSignature('android/media/audiofx/Virtualizer')]
  JVirtualizer = interface(JAudioEffect)
    ['{29728474-34B6-43F2-8D30-D42C4D3C1B9D}']
    function canVirtualize(inputChannelMask: Integer; virtualizationMode: Integer): Boolean; cdecl;
    function forceVirtualizationMode(virtualizationMode: Integer): Boolean; cdecl;
    function getProperties: JVirtualizer_Settings; cdecl;
    function getRoundedStrength: SmallInt; cdecl;
    function getSpeakerAngles(inputChannelMask: Integer; virtualizationMode: Integer; angles: TJavaArray<Integer>): Boolean; cdecl;
    function getStrengthSupported: Boolean; cdecl;
    function getVirtualizationMode: Integer; cdecl;
    procedure setParameterListener(listener: JVirtualizer_OnParameterChangeListener); cdecl;
    procedure setProperties(settings: JVirtualizer_Settings); cdecl;
    procedure setStrength(strength: SmallInt); cdecl;
  end;
  TJVirtualizer = class(TJavaGenericImport<JVirtualizerClass, JVirtualizer>) end;

  JVirtualizer_OnParameterChangeListenerClass = interface(IJavaClass)
    ['{0B91AE60-FB61-4425-BC9E-E025BB1AB698}']
  end;

  [JavaSignature('android/media/audiofx/Virtualizer$OnParameterChangeListener')]
  JVirtualizer_OnParameterChangeListener = interface(IJavaInstance)
    ['{B1BC6069-30E3-40E7-937C-AE8A51C12405}']
    procedure onParameterChange(effect: JVirtualizer; status: Integer; param: Integer; value: SmallInt); cdecl;
  end;
  TJVirtualizer_OnParameterChangeListener = class(TJavaGenericImport<JVirtualizer_OnParameterChangeListenerClass, JVirtualizer_OnParameterChangeListener>) end;

  JVirtualizer_SettingsClass = interface(JObjectClass)
    ['{B9BC83BF-D598-46EB-985D-C2155AF80A53}']
    {class} function init: JVirtualizer_Settings; cdecl; overload;
    {class} function init(settings: JString): JVirtualizer_Settings; cdecl; overload;
  end;

  [JavaSignature('android/media/audiofx/Virtualizer$Settings')]
  JVirtualizer_Settings = interface(JObject)
    ['{664E4688-59A7-42AC-B5D0-A63571A56A5A}']
    function _Getstrength: SmallInt; cdecl;
    procedure _Setstrength(Value: SmallInt); cdecl;
    function toString: JString; cdecl;
    property strength: SmallInt read _Getstrength write _Setstrength;
  end;
  TJVirtualizer_Settings = class(TJavaGenericImport<JVirtualizer_SettingsClass, JVirtualizer_Settings>) end;

  JVisualizerClass = interface(JObjectClass)
    ['{8DBB66F3-CE56-4034-8FCA-1D4D88599192}']
    {class} function _GetALREADY_EXISTS: Integer; cdecl;
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetERROR_BAD_VALUE: Integer; cdecl;
    {class} function _GetERROR_DEAD_OBJECT: Integer; cdecl;
    {class} function _GetERROR_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetERROR_NO_INIT: Integer; cdecl;
    {class} function _GetERROR_NO_MEMORY: Integer; cdecl;
    {class} function _GetMEASUREMENT_MODE_NONE: Integer; cdecl;
    {class} function _GetMEASUREMENT_MODE_PEAK_RMS: Integer; cdecl;
    {class} function _GetSCALING_MODE_AS_PLAYED: Integer; cdecl;
    {class} function _GetSCALING_MODE_NORMALIZED: Integer; cdecl;
    {class} function _GetSTATE_ENABLED: Integer; cdecl;
    {class} function _GetSTATE_INITIALIZED: Integer; cdecl;
    {class} function _GetSTATE_UNINITIALIZED: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function init(audioSession: Integer): JVisualizer; cdecl;
    {class} function getCaptureSizeRange: TJavaArray<Integer>; cdecl;
    {class} function getMaxCaptureRate: Integer; cdecl;
    {class} property ALREADY_EXISTS: Integer read _GetALREADY_EXISTS;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ERROR_BAD_VALUE: Integer read _GetERROR_BAD_VALUE;
    {class} property ERROR_DEAD_OBJECT: Integer read _GetERROR_DEAD_OBJECT;
    {class} property ERROR_INVALID_OPERATION: Integer read _GetERROR_INVALID_OPERATION;
    {class} property ERROR_NO_INIT: Integer read _GetERROR_NO_INIT;
    {class} property ERROR_NO_MEMORY: Integer read _GetERROR_NO_MEMORY;
    {class} property MEASUREMENT_MODE_NONE: Integer read _GetMEASUREMENT_MODE_NONE;
    {class} property MEASUREMENT_MODE_PEAK_RMS: Integer read _GetMEASUREMENT_MODE_PEAK_RMS;
    {class} property SCALING_MODE_AS_PLAYED: Integer read _GetSCALING_MODE_AS_PLAYED;
    {class} property SCALING_MODE_NORMALIZED: Integer read _GetSCALING_MODE_NORMALIZED;
    {class} property STATE_ENABLED: Integer read _GetSTATE_ENABLED;
    {class} property STATE_INITIALIZED: Integer read _GetSTATE_INITIALIZED;
    {class} property STATE_UNINITIALIZED: Integer read _GetSTATE_UNINITIALIZED;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('android/media/audiofx/Visualizer')]
  JVisualizer = interface(JObject)
    ['{6796AEB3-D2B1-4840-9182-92C09375E8E6}']
    function getCaptureSize: Integer; cdecl;
    function getEnabled: Boolean; cdecl;
    function getFft(fft: TJavaArray<Byte>): Integer; cdecl;
    function getMeasurementMode: Integer; cdecl;
    function getMeasurementPeakRms(measurement: JVisualizer_MeasurementPeakRms): Integer; cdecl;
    function getSamplingRate: Integer; cdecl;
    function getScalingMode: Integer; cdecl;
    function getWaveForm(waveform: TJavaArray<Byte>): Integer; cdecl;
    procedure release; cdecl;
    function setCaptureSize(size: Integer): Integer; cdecl;
    function setDataCaptureListener(listener: JVisualizer_OnDataCaptureListener; rate: Integer; waveform: Boolean; fft: Boolean): Integer; cdecl;
    function setEnabled(enabled: Boolean): Integer; cdecl;
    function setMeasurementMode(mode: Integer): Integer; cdecl;
    function setScalingMode(mode: Integer): Integer; cdecl;
  end;
  TJVisualizer = class(TJavaGenericImport<JVisualizerClass, JVisualizer>) end;

  JVisualizer_MeasurementPeakRmsClass = interface(JObjectClass)
    ['{341FCA1D-109E-4A2D-8D12-3EC49D2BAD41}']
    {class} function init: JVisualizer_MeasurementPeakRms; cdecl;
  end;

  [JavaSignature('android/media/audiofx/Visualizer$MeasurementPeakRms')]
  JVisualizer_MeasurementPeakRms = interface(JObject)
    ['{D76E370A-7352-414D-B880-5E4F6BF28DE4}']
    function _GetmPeak: Integer; cdecl;
    procedure _SetmPeak(Value: Integer); cdecl;
    function _GetmRms: Integer; cdecl;
    procedure _SetmRms(Value: Integer); cdecl;
    property mPeak: Integer read _GetmPeak write _SetmPeak;
    property mRms: Integer read _GetmRms write _SetmRms;
  end;
  TJVisualizer_MeasurementPeakRms = class(TJavaGenericImport<JVisualizer_MeasurementPeakRmsClass, JVisualizer_MeasurementPeakRms>) end;

  JVisualizer_OnDataCaptureListenerClass = interface(IJavaClass)
    ['{3CCB3AC2-5737-486B-987E-88C328277426}']
  end;

  [JavaSignature('android/media/audiofx/Visualizer$OnDataCaptureListener')]
  JVisualizer_OnDataCaptureListener = interface(IJavaInstance)
    ['{092C4DEF-238A-4053-A59B-04136A5C3820}']
    procedure onFftDataCapture(visualizer: JVisualizer; fft: TJavaArray<Byte>; samplingRate: Integer); cdecl;
    procedure onWaveFormDataCapture(visualizer: JVisualizer; waveform: TJavaArray<Byte>; samplingRate: Integer); cdecl;
  end;
  TJVisualizer_OnDataCaptureListener = class(TJavaGenericImport<JVisualizer_OnDataCaptureListenerClass, JVisualizer_OnDataCaptureListener>) end;

  JMediaBrowserClass = interface(JObjectClass)
    ['{6552C201-45F9-47D4-85B2-39C16DAD58D3}']
    {class} function init(context: JContext; serviceComponent: JComponentName; callback: JMediaBrowser_ConnectionCallback; rootHints: JBundle): JMediaBrowser; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser')]
  JMediaBrowser = interface(JObject)
    ['{40A5A57D-F070-4DB9-B804-13CC7DC1B533}']
    procedure connect; cdecl;
    procedure disconnect; cdecl;
    function getExtras: JBundle; cdecl;
    procedure getItem(mediaId: JString; cb: JMediaBrowser_ItemCallback); cdecl;
    function getRoot: JString; cdecl;
    function getServiceComponent: JComponentName; cdecl;
    function getSessionToken: JMediaSession_Token; cdecl;
    function isConnected: Boolean; cdecl;
    procedure subscribe(parentId: JString; callback: JMediaBrowser_SubscriptionCallback); cdecl;
    procedure unsubscribe(parentId: JString); cdecl;
  end;
  TJMediaBrowser = class(TJavaGenericImport<JMediaBrowserClass, JMediaBrowser>) end;

  JMediaBrowser_ConnectionCallbackClass = interface(JObjectClass)
    ['{F1BB4681-70EB-4DD9-9121-ED461DE8B22D}']
    {class} function init: JMediaBrowser_ConnectionCallback; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$ConnectionCallback')]
  JMediaBrowser_ConnectionCallback = interface(JObject)
    ['{15C3E8C9-C306-4A51-A741-7D920D45FFC2}']
    procedure onConnected; cdecl;
    procedure onConnectionFailed; cdecl;
    procedure onConnectionSuspended; cdecl;
  end;
  TJMediaBrowser_ConnectionCallback = class(TJavaGenericImport<JMediaBrowser_ConnectionCallbackClass, JMediaBrowser_ConnectionCallback>) end;

  JMediaBrowser_ItemCallbackClass = interface(JObjectClass)
    ['{4166CDF8-B35A-4977-A0FB-46484BC62B67}']
    {class} function init: JMediaBrowser_ItemCallback; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$ItemCallback')]
  JMediaBrowser_ItemCallback = interface(JObject)
    ['{14AF3FEC-0A8C-474B-AA81-00409CEFA6A7}']
    procedure onError(itemId: JString); cdecl;
    procedure onItemLoaded(item: JMediaBrowser_MediaItem); cdecl;
  end;
  TJMediaBrowser_ItemCallback = class(TJavaGenericImport<JMediaBrowser_ItemCallbackClass, JMediaBrowser_ItemCallback>) end;

  JMediaBrowser_MediaItemClass = interface(JObjectClass)
    ['{B2A448F7-2C51-451E-AA53-8C4AA885A103}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetFLAG_BROWSABLE: Integer; cdecl;
    {class} function _GetFLAG_PLAYABLE: Integer; cdecl;
    {class} function init(description: JMediaDescription; flags: Integer): JMediaBrowser_MediaItem; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property FLAG_BROWSABLE: Integer read _GetFLAG_BROWSABLE;
    {class} property FLAG_PLAYABLE: Integer read _GetFLAG_PLAYABLE;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$MediaItem')]
  JMediaBrowser_MediaItem = interface(JObject)
    ['{40213ADA-1585-41A5-9D7D-1AAB4F1218BC}']
    function describeContents: Integer; cdecl;
    function getDescription: JMediaDescription; cdecl;
    function getFlags: Integer; cdecl;
    function getMediaId: JString; cdecl;
    function isBrowsable: Boolean; cdecl;
    function isPlayable: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJMediaBrowser_MediaItem = class(TJavaGenericImport<JMediaBrowser_MediaItemClass, JMediaBrowser_MediaItem>) end;

  JMediaBrowser_SubscriptionCallbackClass = interface(JObjectClass)
    ['{FE60B928-3734-4E3C-B2F2-BD99DF0AEF3D}']
    {class} function init: JMediaBrowser_SubscriptionCallback; cdecl;
  end;

  [JavaSignature('android/media/browse/MediaBrowser$SubscriptionCallback')]
  JMediaBrowser_SubscriptionCallback = interface(JObject)
    ['{400905BB-C3DA-4475-A8FA-FD22EF4A9383}']
    procedure onChildrenLoaded(parentId: JString; children: JList); cdecl;
    procedure onError(parentId: JString); cdecl;
  end;
  TJMediaBrowser_SubscriptionCallback = class(TJavaGenericImport<JMediaBrowser_SubscriptionCallbackClass, JMediaBrowser_SubscriptionCallback>) end;

  JEffectClass = interface(JObjectClass)
    ['{DC62EAE5-6D58-4DEC-B60B-CE5890CC3CDF}']
    {class} function init: JEffect; cdecl;
  end;

  [JavaSignature('android/media/effect/Effect')]
  JEffect = interface(JObject)
    ['{B0029DD4-ED95-41AD-9F14-3E81375B7DC6}']
    procedure apply(inputTexId: Integer; width: Integer; height: Integer; outputTexId: Integer); cdecl;
    function getName: JString; cdecl;
    procedure release; cdecl;
    procedure setParameter(parameterKey: JString; value: JObject); cdecl;
    procedure setUpdateListener(listener: JEffectUpdateListener); cdecl;
  end;
  TJEffect = class(TJavaGenericImport<JEffectClass, JEffect>) end;

  JEffectContextClass = interface(JObjectClass)
    ['{D74230AA-9EF6-439C-A03C-B6D0B03D9821}']
    {class} function createWithCurrentGlContext: JEffectContext; cdecl;
  end;

  [JavaSignature('android/media/effect/EffectContext')]
  JEffectContext = interface(JObject)
    ['{C963ECA3-2F09-44E5-948B-A564A49BBB5E}']
    function getFactory: JEffectFactory; cdecl;
    procedure release; cdecl;
  end;
  TJEffectContext = class(TJavaGenericImport<JEffectContextClass, JEffectContext>) end;

  JEffectFactoryClass = interface(JObjectClass)
    ['{14E2D166-0AC1-4491-BF2B-962F24BAB38A}']
    {class} function _GetEFFECT_AUTOFIX: JString; cdecl;
    {class} function _GetEFFECT_BACKDROPPER: JString; cdecl;
    {class} function _GetEFFECT_BITMAPOVERLAY: JString; cdecl;
    {class} function _GetEFFECT_BLACKWHITE: JString; cdecl;
    {class} function _GetEFFECT_BRIGHTNESS: JString; cdecl;
    {class} function _GetEFFECT_CONTRAST: JString; cdecl;
    {class} function _GetEFFECT_CROP: JString; cdecl;
    {class} function _GetEFFECT_CROSSPROCESS: JString; cdecl;
    {class} function _GetEFFECT_DOCUMENTARY: JString; cdecl;
    {class} function _GetEFFECT_DUOTONE: JString; cdecl;
    {class} function _GetEFFECT_FILLLIGHT: JString; cdecl;
    {class} function _GetEFFECT_FISHEYE: JString; cdecl;
    {class} function _GetEFFECT_FLIP: JString; cdecl;
    {class} function _GetEFFECT_GRAIN: JString; cdecl;
    {class} function _GetEFFECT_GRAYSCALE: JString; cdecl;
    {class} function _GetEFFECT_LOMOISH: JString; cdecl;
    {class} function _GetEFFECT_NEGATIVE: JString; cdecl;
    {class} function _GetEFFECT_POSTERIZE: JString; cdecl;
    {class} function _GetEFFECT_REDEYE: JString; cdecl;
    {class} function _GetEFFECT_ROTATE: JString; cdecl;
    {class} function _GetEFFECT_SATURATE: JString; cdecl;
    {class} function _GetEFFECT_SEPIA: JString; cdecl;
    {class} function _GetEFFECT_SHARPEN: JString; cdecl;
    {class} function _GetEFFECT_STRAIGHTEN: JString; cdecl;
    {class} function _GetEFFECT_TEMPERATURE: JString; cdecl;
    {class} function _GetEFFECT_TINT: JString; cdecl;
    {class} function _GetEFFECT_VIGNETTE: JString; cdecl;
    {class} function isEffectSupported(effectName: JString): Boolean; cdecl;
    {class} property EFFECT_AUTOFIX: JString read _GetEFFECT_AUTOFIX;
    {class} property EFFECT_BACKDROPPER: JString read _GetEFFECT_BACKDROPPER;
    {class} property EFFECT_BITMAPOVERLAY: JString read _GetEFFECT_BITMAPOVERLAY;
    {class} property EFFECT_BLACKWHITE: JString read _GetEFFECT_BLACKWHITE;
    {class} property EFFECT_BRIGHTNESS: JString read _GetEFFECT_BRIGHTNESS;
    {class} property EFFECT_CONTRAST: JString read _GetEFFECT_CONTRAST;
    {class} property EFFECT_CROP: JString read _GetEFFECT_CROP;
    {class} property EFFECT_CROSSPROCESS: JString read _GetEFFECT_CROSSPROCESS;
    {class} property EFFECT_DOCUMENTARY: JString read _GetEFFECT_DOCUMENTARY;
    {class} property EFFECT_DUOTONE: JString read _GetEFFECT_DUOTONE;
    {class} property EFFECT_FILLLIGHT: JString read _GetEFFECT_FILLLIGHT;
    {class} property EFFECT_FISHEYE: JString read _GetEFFECT_FISHEYE;
    {class} property EFFECT_FLIP: JString read _GetEFFECT_FLIP;
    {class} property EFFECT_GRAIN: JString read _GetEFFECT_GRAIN;
    {class} property EFFECT_GRAYSCALE: JString read _GetEFFECT_GRAYSCALE;
    {class} property EFFECT_LOMOISH: JString read _GetEFFECT_LOMOISH;
    {class} property EFFECT_NEGATIVE: JString read _GetEFFECT_NEGATIVE;
    {class} property EFFECT_POSTERIZE: JString read _GetEFFECT_POSTERIZE;
    {class} property EFFECT_REDEYE: JString read _GetEFFECT_REDEYE;
    {class} property EFFECT_ROTATE: JString read _GetEFFECT_ROTATE;
    {class} property EFFECT_SATURATE: JString read _GetEFFECT_SATURATE;
    {class} property EFFECT_SEPIA: JString read _GetEFFECT_SEPIA;
    {class} property EFFECT_SHARPEN: JString read _GetEFFECT_SHARPEN;
    {class} property EFFECT_STRAIGHTEN: JString read _GetEFFECT_STRAIGHTEN;
    {class} property EFFECT_TEMPERATURE: JString read _GetEFFECT_TEMPERATURE;
    {class} property EFFECT_TINT: JString read _GetEFFECT_TINT;
    {class} property EFFECT_VIGNETTE: JString read _GetEFFECT_VIGNETTE;
  end;

  [JavaSignature('android/media/effect/EffectFactory')]
  JEffectFactory = interface(JObject)
    ['{BABFFFB3-AB4C-4626-86FE-BAD146F6C251}']
    function createEffect(effectName: JString): JEffect; cdecl;
  end;
  TJEffectFactory = class(TJavaGenericImport<JEffectFactoryClass, JEffectFactory>) end;

  JEffectUpdateListenerClass = interface(IJavaClass)
    ['{B38D8A57-D3AB-4F58-AE3A-A9A7D8EE612B}']
  end;

  [JavaSignature('android/media/effect/EffectUpdateListener')]
  JEffectUpdateListener = interface(IJavaInstance)
    ['{FF287CF5-5208-4CF5-A0EF-8F76D144AF71}']
    procedure onEffectUpdated(effect: JEffect; info: JObject); cdecl;
  end;
  TJEffectUpdateListener = class(TJavaGenericImport<JEffectUpdateListenerClass, JEffectUpdateListener>) end;

  JMidiDeviceClass = interface(JObjectClass)
    ['{395FA5A0-52C7-4532-8A6F-C2B4F031EE7D}']
  end;

  [JavaSignature('android/media/midi/MidiDevice')]
  JMidiDevice = interface(JObject)
    ['{1F5DB79E-580C-4FD3-A0C4-7F4237B6CF4B}']
    procedure close; cdecl;
    function connectPorts(inputPort: JMidiInputPort; outputPortNumber: Integer): JMidiDevice_MidiConnection; cdecl;
    function getInfo: JMidiDeviceInfo; cdecl;
    function openInputPort(portNumber: Integer): JMidiInputPort; cdecl;
    function openOutputPort(portNumber: Integer): JMidiOutputPort; cdecl;
    function toString: JString; cdecl;
  end;
  TJMidiDevice = class(TJavaGenericImport<JMidiDeviceClass, JMidiDevice>) end;

  JMidiDevice_MidiConnectionClass = interface(JObjectClass)
    ['{672B6D66-8E49-4400-9BF5-8F43850FB5D2}']
  end;

  [JavaSignature('android/media/midi/MidiDevice$MidiConnection')]
  JMidiDevice_MidiConnection = interface(JObject)
    ['{961BABB4-CCF5-482C-AAC7-61EA15822464}']
    procedure close; cdecl;
  end;
  TJMidiDevice_MidiConnection = class(TJavaGenericImport<JMidiDevice_MidiConnectionClass, JMidiDevice_MidiConnection>) end;

  JMidiDeviceInfoClass = interface(JObjectClass)
    ['{A465A5A3-B299-469D-A4BC-F3EEBC8084E0}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPROPERTY_BLUETOOTH_DEVICE: JString; cdecl;
    {class} function _GetPROPERTY_MANUFACTURER: JString; cdecl;
    {class} function _GetPROPERTY_NAME: JString; cdecl;
    {class} function _GetPROPERTY_PRODUCT: JString; cdecl;
    {class} function _GetPROPERTY_SERIAL_NUMBER: JString; cdecl;
    {class} function _GetPROPERTY_USB_DEVICE: JString; cdecl;
    {class} function _GetPROPERTY_VERSION: JString; cdecl;
    {class} function _GetTYPE_BLUETOOTH: Integer; cdecl;
    {class} function _GetTYPE_USB: Integer; cdecl;
    {class} function _GetTYPE_VIRTUAL: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PROPERTY_BLUETOOTH_DEVICE: JString read _GetPROPERTY_BLUETOOTH_DEVICE;
    {class} property PROPERTY_MANUFACTURER: JString read _GetPROPERTY_MANUFACTURER;
    {class} property PROPERTY_NAME: JString read _GetPROPERTY_NAME;
    {class} property PROPERTY_PRODUCT: JString read _GetPROPERTY_PRODUCT;
    {class} property PROPERTY_SERIAL_NUMBER: JString read _GetPROPERTY_SERIAL_NUMBER;
    {class} property PROPERTY_USB_DEVICE: JString read _GetPROPERTY_USB_DEVICE;
    {class} property PROPERTY_VERSION: JString read _GetPROPERTY_VERSION;
    {class} property TYPE_BLUETOOTH: Integer read _GetTYPE_BLUETOOTH;
    {class} property TYPE_USB: Integer read _GetTYPE_USB;
    {class} property TYPE_VIRTUAL: Integer read _GetTYPE_VIRTUAL;
  end;

  [JavaSignature('android/media/midi/MidiDeviceInfo')]
  JMidiDeviceInfo = interface(JObject)
    ['{E9950E7C-BCA4-424A-90A7-23BAA66CDBE1}']
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getId: Integer; cdecl;
    function getInputPortCount: Integer; cdecl;
    function getOutputPortCount: Integer; cdecl;
    function getPorts: TJavaObjectArray<JMidiDeviceInfo_PortInfo>; cdecl;
    function getProperties: JBundle; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isPrivate: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJMidiDeviceInfo = class(TJavaGenericImport<JMidiDeviceInfoClass, JMidiDeviceInfo>) end;

  JMidiDeviceInfo_PortInfoClass = interface(JObjectClass)
    ['{FE15B908-45EF-47EC-89C9-66CE40E67449}']
    {class} function _GetTYPE_INPUT: Integer; cdecl;
    {class} function _GetTYPE_OUTPUT: Integer; cdecl;
    {class} property TYPE_INPUT: Integer read _GetTYPE_INPUT;
    {class} property TYPE_OUTPUT: Integer read _GetTYPE_OUTPUT;
  end;

  [JavaSignature('android/media/midi/MidiDeviceInfo$PortInfo')]
  JMidiDeviceInfo_PortInfo = interface(JObject)
    ['{6B280CEB-8BC6-4C87-BFAF-55F37D385E52}']
    function getName: JString; cdecl;
    function getPortNumber: Integer; cdecl;
    function getType: Integer; cdecl;
  end;
  TJMidiDeviceInfo_PortInfo = class(TJavaGenericImport<JMidiDeviceInfo_PortInfoClass, JMidiDeviceInfo_PortInfo>) end;

  JMidiDeviceServiceClass = interface(JServiceClass)
    ['{4DC0AA9B-13CB-4098-830D-11670B16E6C7}']
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function init: JMidiDeviceService; cdecl;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
  end;

  [JavaSignature('android/media/midi/MidiDeviceService')]
  JMidiDeviceService = interface(JService)
    ['{8C34974B-A4F0-44DC-B96B-17775C4A4990}']
    function getDeviceInfo: JMidiDeviceInfo; cdecl;
    function getOutputPortReceivers: TJavaObjectArray<JMidiReceiver>; cdecl;
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onClose; cdecl;
    procedure onCreate; cdecl;
    procedure onDeviceStatusChanged(status: JMidiDeviceStatus); cdecl;
    function onGetInputPortReceivers: TJavaObjectArray<JMidiReceiver>; cdecl;
  end;
  TJMidiDeviceService = class(TJavaGenericImport<JMidiDeviceServiceClass, JMidiDeviceService>) end;

  JMidiDeviceStatusClass = interface(JObjectClass)
    ['{FDC237D2-56BB-4B92-9013-B8B9995CB04A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/midi/MidiDeviceStatus')]
  JMidiDeviceStatus = interface(JObject)
    ['{7E4A9DAE-9C77-429F-B52D-FB2C55459A56}']
    function describeContents: Integer; cdecl;
    function getDeviceInfo: JMidiDeviceInfo; cdecl;
    function getOutputPortOpenCount(portNumber: Integer): Integer; cdecl;
    function isInputPortOpen(portNumber: Integer): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJMidiDeviceStatus = class(TJavaGenericImport<JMidiDeviceStatusClass, JMidiDeviceStatus>) end;

  JMidiReceiverClass = interface(JObjectClass)
    ['{0CCECD67-D5F2-45C0-A49A-443CE99311DC}']
    {class} function init: JMidiReceiver; cdecl; overload;
    {class} function init(maxMessageSize: Integer): JMidiReceiver; cdecl; overload;
  end;

  [JavaSignature('android/media/midi/MidiReceiver')]
  JMidiReceiver = interface(JObject)
    ['{1685B7DB-BD4A-4C6B-AB17-E234E834B69C}']
    procedure flush; cdecl;
    function getMaxMessageSize: Integer; cdecl;
    procedure onFlush; cdecl;
    procedure onSend(msg: TJavaArray<Byte>; offset: Integer; count: Integer; timestamp: Int64); cdecl;
    procedure send(msg: TJavaArray<Byte>; offset: Integer; count: Integer); cdecl; overload;
    procedure send(msg: TJavaArray<Byte>; offset: Integer; count: Integer; timestamp: Int64); cdecl; overload;
  end;
  TJMidiReceiver = class(TJavaGenericImport<JMidiReceiverClass, JMidiReceiver>) end;

  JMidiInputPortClass = interface(JMidiReceiverClass)
    ['{0E3E4890-4690-48CA-97E6-77F1B750612D}']
  end;

  [JavaSignature('android/media/midi/MidiInputPort')]
  JMidiInputPort = interface(JMidiReceiver)
    ['{D27C6ACE-6CF0-41BD-BE63-F829B56793C0}']
    procedure close; cdecl;
    function getPortNumber: Integer; cdecl;
    procedure onFlush; cdecl;
    procedure onSend(msg: TJavaArray<Byte>; offset: Integer; count: Integer; timestamp: Int64); cdecl;
  end;
  TJMidiInputPort = class(TJavaGenericImport<JMidiInputPortClass, JMidiInputPort>) end;

  JMidiManagerClass = interface(JObjectClass)
    ['{49DB445C-C786-4316-B589-8411C19B2355}']
  end;

  [JavaSignature('android/media/midi/MidiManager')]
  JMidiManager = interface(JObject)
    ['{AB859D24-0EFE-4B95-AAE3-82CB8AC52ED1}']
    function getDevices: TJavaObjectArray<JMidiDeviceInfo>; cdecl;
    procedure openBluetoothDevice(bluetoothDevice: JBluetoothDevice; listener: JMidiManager_OnDeviceOpenedListener; handler: JHandler); cdecl;
    procedure openDevice(deviceInfo: JMidiDeviceInfo; listener: JMidiManager_OnDeviceOpenedListener; handler: JHandler); cdecl;
    procedure registerDeviceCallback(callback: JMidiManager_DeviceCallback; handler: JHandler); cdecl;
    procedure unregisterDeviceCallback(callback: JMidiManager_DeviceCallback); cdecl;
  end;
  TJMidiManager = class(TJavaGenericImport<JMidiManagerClass, JMidiManager>) end;

  JMidiManager_DeviceCallbackClass = interface(JObjectClass)
    ['{4FAAAC9C-7841-4CDD-86EF-0BFF98A8B580}']
    {class} function init: JMidiManager_DeviceCallback; cdecl;
  end;

  [JavaSignature('android/media/midi/MidiManager$DeviceCallback')]
  JMidiManager_DeviceCallback = interface(JObject)
    ['{654B6030-ECA2-4BF6-B923-83EFDDC26C45}']
    procedure onDeviceAdded(device: JMidiDeviceInfo); cdecl;
    procedure onDeviceRemoved(device: JMidiDeviceInfo); cdecl;
    procedure onDeviceStatusChanged(status: JMidiDeviceStatus); cdecl;
  end;
  TJMidiManager_DeviceCallback = class(TJavaGenericImport<JMidiManager_DeviceCallbackClass, JMidiManager_DeviceCallback>) end;

  JMidiManager_OnDeviceOpenedListenerClass = interface(IJavaClass)
    ['{11DABDDC-283F-4AC7-B440-9A60A0798191}']
  end;

  [JavaSignature('android/media/midi/MidiManager$OnDeviceOpenedListener')]
  JMidiManager_OnDeviceOpenedListener = interface(IJavaInstance)
    ['{9FF14636-1673-454D-B7A3-B5D3E47DF991}']
    procedure onDeviceOpened(device: JMidiDevice); cdecl;
  end;
  TJMidiManager_OnDeviceOpenedListener = class(TJavaGenericImport<JMidiManager_OnDeviceOpenedListenerClass, JMidiManager_OnDeviceOpenedListener>) end;

  JMidiSenderClass = interface(JObjectClass)
    ['{6F9809BD-BCB7-44A7-9C71-DB3A8F9CFE9A}']
    {class} function init: JMidiSender; cdecl;
  end;

  [JavaSignature('android/media/midi/MidiSender')]
  JMidiSender = interface(JObject)
    ['{09B5168E-98B6-4814-A172-6507C1E2F60E}']
    procedure connect(receiver: JMidiReceiver); cdecl;
    procedure disconnect(receiver: JMidiReceiver); cdecl;
    procedure onConnect(receiver: JMidiReceiver); cdecl;
    procedure onDisconnect(receiver: JMidiReceiver); cdecl;
  end;
  TJMidiSender = class(TJavaGenericImport<JMidiSenderClass, JMidiSender>) end;

  JMidiOutputPortClass = interface(JMidiSenderClass)
    ['{54BEF4BB-E2DC-45BA-8877-0DB9A03566CB}']
  end;

  [JavaSignature('android/media/midi/MidiOutputPort')]
  JMidiOutputPort = interface(JMidiSender)
    ['{27269721-B1EE-4372-959B-58584ED3B1DC}']
    procedure close; cdecl;
    function getPortNumber: Integer; cdecl;
    procedure onConnect(receiver: JMidiReceiver); cdecl;
    procedure onDisconnect(receiver: JMidiReceiver); cdecl;
  end;
  TJMidiOutputPort = class(TJavaGenericImport<JMidiOutputPortClass, JMidiOutputPort>) end;

  JMediaProjectionClass = interface(JObjectClass)
    ['{671A8337-74A8-47BB-9752-5F6AC9CB340B}']
  end;

  [JavaSignature('android/media/projection/MediaProjection')]
  JMediaProjection = interface(JObject)
    ['{7C231C86-6D5D-4179-A8D4-A6577D7BE0D0}']
    function createVirtualDisplay(name: JString; width: Integer; height: Integer; dpi: Integer; flags: Integer; surface: JSurface; callback: JVirtualDisplay_Callback; handler: JHandler): JVirtualDisplay; cdecl;
    procedure registerCallback(callback: JMediaProjection_Callback; handler: JHandler); cdecl;
    procedure stop; cdecl;
    procedure unregisterCallback(callback: JMediaProjection_Callback); cdecl;
  end;
  TJMediaProjection = class(TJavaGenericImport<JMediaProjectionClass, JMediaProjection>) end;

  JMediaProjection_CallbackClass = interface(JObjectClass)
    ['{F10259FF-6EB2-422C-8CCD-D729A406206D}']
    {class} function init: JMediaProjection_Callback; cdecl;
  end;

  [JavaSignature('android/media/projection/MediaProjection$Callback')]
  JMediaProjection_Callback = interface(JObject)
    ['{75A3C800-92FC-4E1E-B0A9-52D1144EC066}']
    procedure onStop; cdecl;
  end;
  TJMediaProjection_Callback = class(TJavaGenericImport<JMediaProjection_CallbackClass, JMediaProjection_Callback>) end;

  JMediaProjectionManagerClass = interface(JObjectClass)
    ['{311A788C-E5D4-40F1-ABE2-32B15EAD8B35}']
  end;

  [JavaSignature('android/media/projection/MediaProjectionManager')]
  JMediaProjectionManager = interface(JObject)
    ['{8EF00E7E-ECE6-48D7-A512-52CE3704B0FF}']
    function createScreenCaptureIntent: JIntent; cdecl;
    function getMediaProjection(resultCode: Integer; resultData: JIntent): JMediaProjection; cdecl;
  end;
  TJMediaProjectionManager = class(TJavaGenericImport<JMediaProjectionManagerClass, JMediaProjectionManager>) end;

  Jsession_MediaControllerClass = interface(JObjectClass)
    ['{CDC93E33-2AE5-406F-B30A-6024E04CF5B1}']
  end;

  [JavaSignature('android/media/session/MediaController')]
  Jsession_MediaController = interface(JObject)
    ['{91D95F61-AC6D-4A3F-BB23-61C5FFC68662}']
    procedure adjustVolume(direction: Integer; flags: Integer); cdecl;
    function dispatchMediaButtonEvent(keyEvent: JKeyEvent): Boolean; cdecl;
    function getExtras: JBundle; cdecl;
    function getFlags: Int64; cdecl;
    function getMetadata: Jmedia_MediaMetadata; cdecl;
    function getPackageName: JString; cdecl;
    function getPlaybackInfo: JMediaController_PlaybackInfo; cdecl;
    function getPlaybackState: JPlaybackState; cdecl;
    function getQueue: JList; cdecl;
    function getQueueTitle: JCharSequence; cdecl;
    function getRatingType: Integer; cdecl;
    function getSessionActivity: JPendingIntent; cdecl;
    function getSessionToken: JMediaSession_Token; cdecl;
    function getTransportControls: JMediaController_TransportControls; cdecl;
    procedure registerCallback(callback: JMediaController_Callback); cdecl; overload;
    procedure registerCallback(callback: JMediaController_Callback; handler: JHandler); cdecl; overload;
    procedure sendCommand(command: JString; args: JBundle; cb: JResultReceiver); cdecl;
    procedure setVolumeTo(value: Integer; flags: Integer); cdecl;
    procedure unregisterCallback(callback: JMediaController_Callback); cdecl;
  end;
  TJsession_MediaController = class(TJavaGenericImport<Jsession_MediaControllerClass, Jsession_MediaController>) end;

  JMediaController_CallbackClass = interface(JObjectClass)
    ['{686A7C71-CE1C-4A03-AA1A-A9E8B5BB561C}']
    {class} function init: JMediaController_Callback; cdecl;
  end;

  [JavaSignature('android/media/session/MediaController$Callback')]
  JMediaController_Callback = interface(JObject)
    ['{173EA302-3941-4BB0-B5EC-AF19CCD30021}']
    procedure onAudioInfoChanged(info: JMediaController_PlaybackInfo); cdecl;
    procedure onExtrasChanged(extras: JBundle); cdecl;
    procedure onMetadataChanged(metadata: Jmedia_MediaMetadata); cdecl;
    procedure onPlaybackStateChanged(state: JPlaybackState); cdecl;
    procedure onQueueChanged(queue: JList); cdecl;
    procedure onQueueTitleChanged(title: JCharSequence); cdecl;
    procedure onSessionDestroyed; cdecl;
    procedure onSessionEvent(event: JString; extras: JBundle); cdecl;
  end;
  TJMediaController_Callback = class(TJavaGenericImport<JMediaController_CallbackClass, JMediaController_Callback>) end;

  JMediaController_PlaybackInfoClass = interface(JObjectClass)
    ['{196168F7-B750-484F-AC9C-F8D93E782B78}']
    {class} function _GetPLAYBACK_TYPE_LOCAL: Integer; cdecl;
    {class} function _GetPLAYBACK_TYPE_REMOTE: Integer; cdecl;
    {class} property PLAYBACK_TYPE_LOCAL: Integer read _GetPLAYBACK_TYPE_LOCAL;
    {class} property PLAYBACK_TYPE_REMOTE: Integer read _GetPLAYBACK_TYPE_REMOTE;
  end;

  [JavaSignature('android/media/session/MediaController$PlaybackInfo')]
  JMediaController_PlaybackInfo = interface(JObject)
    ['{B536C5C0-26C8-4487-AB17-98886C9C53B4}']
    function getAudioAttributes: JAudioAttributes; cdecl;
    function getCurrentVolume: Integer; cdecl;
    function getMaxVolume: Integer; cdecl;
    function getPlaybackType: Integer; cdecl;
    function getVolumeControl: Integer; cdecl;
  end;
  TJMediaController_PlaybackInfo = class(TJavaGenericImport<JMediaController_PlaybackInfoClass, JMediaController_PlaybackInfo>) end;

  JMediaController_TransportControlsClass = interface(JObjectClass)
    ['{9C224A90-7858-46AE-A728-7DB7AB3F5867}']
  end;

  [JavaSignature('android/media/session/MediaController$TransportControls')]
  JMediaController_TransportControls = interface(JObject)
    ['{1EDA0FD8-309C-4CA0-81D1-D71C546688D5}']
    procedure fastForward; cdecl;
    procedure pause; cdecl;
    procedure play; cdecl;
    procedure playFromMediaId(mediaId: JString; extras: JBundle); cdecl;
    procedure playFromSearch(query: JString; extras: JBundle); cdecl;
    procedure playFromUri(uri: Jnet_Uri; extras: JBundle); cdecl;
    procedure rewind; cdecl;
    procedure seekTo(pos: Int64); cdecl;
    procedure sendCustomAction(customAction: JPlaybackState_CustomAction; args: JBundle); cdecl; overload;
    procedure sendCustomAction(action: JString; args: JBundle); cdecl; overload;
    procedure setRating(rating: JRating); cdecl;
    procedure skipToNext; cdecl;
    procedure skipToPrevious; cdecl;
    procedure skipToQueueItem(id: Int64); cdecl;
    procedure stop; cdecl;
  end;
  TJMediaController_TransportControls = class(TJavaGenericImport<JMediaController_TransportControlsClass, JMediaController_TransportControls>) end;

  JMediaSessionClass = interface(JObjectClass)
    ['{DD2E1A91-EAE6-43F0-996D-C35A3405ED42}']
    {class} function _GetFLAG_HANDLES_MEDIA_BUTTONS: Integer; cdecl;
    {class} function _GetFLAG_HANDLES_TRANSPORT_CONTROLS: Integer; cdecl;
    {class} function init(context: JContext; tag: JString): JMediaSession; cdecl;
    {class} property FLAG_HANDLES_MEDIA_BUTTONS: Integer read _GetFLAG_HANDLES_MEDIA_BUTTONS;
    {class} property FLAG_HANDLES_TRANSPORT_CONTROLS: Integer read _GetFLAG_HANDLES_TRANSPORT_CONTROLS;
  end;

  [JavaSignature('android/media/session/MediaSession')]
  JMediaSession = interface(JObject)
    ['{3A86CFAB-1B2A-44A4-9C12-39AF616344FE}']
    function getController: Jsession_MediaController; cdecl;
    function getSessionToken: JMediaSession_Token; cdecl;
    function isActive: Boolean; cdecl;
    procedure release; cdecl;
    procedure sendSessionEvent(event: JString; extras: JBundle); cdecl;
    procedure setActive(active: Boolean); cdecl;
    procedure setCallback(callback: JMediaSession_Callback); cdecl; overload;
    procedure setCallback(callback: JMediaSession_Callback; handler: JHandler); cdecl; overload;
    procedure setExtras(extras: JBundle); cdecl;
    procedure setFlags(flags: Integer); cdecl;
    procedure setMediaButtonReceiver(mbr: JPendingIntent); cdecl;
    procedure setMetadata(metadata: Jmedia_MediaMetadata); cdecl;
    procedure setPlaybackState(state: JPlaybackState); cdecl;
    procedure setPlaybackToLocal(attributes: JAudioAttributes); cdecl;
    procedure setPlaybackToRemote(volumeProvider: JVolumeProvider); cdecl;
    procedure setQueue(queue: JList); cdecl;
    procedure setQueueTitle(title: JCharSequence); cdecl;
    procedure setRatingType(type_: Integer); cdecl;
    procedure setSessionActivity(pi: JPendingIntent); cdecl;
  end;
  TJMediaSession = class(TJavaGenericImport<JMediaSessionClass, JMediaSession>) end;

  JMediaSession_CallbackClass = interface(JObjectClass)
    ['{CDDCA65C-DD26-4BF7-A564-F86D96EA0B61}']
    {class} function init: JMediaSession_Callback; cdecl;
  end;

  [JavaSignature('android/media/session/MediaSession$Callback')]
  JMediaSession_Callback = interface(JObject)
    ['{B67D467F-4EB4-4B43-84FC-4FDC8EDFFBD9}']
    procedure onCommand(command: JString; args: JBundle; cb: JResultReceiver); cdecl;
    procedure onCustomAction(action: JString; extras: JBundle); cdecl;
    procedure onFastForward; cdecl;
    function onMediaButtonEvent(mediaButtonIntent: JIntent): Boolean; cdecl;
    procedure onPause; cdecl;
    procedure onPlay; cdecl;
    procedure onPlayFromMediaId(mediaId: JString; extras: JBundle); cdecl;
    procedure onPlayFromSearch(query: JString; extras: JBundle); cdecl;
    procedure onPlayFromUri(uri: Jnet_Uri; extras: JBundle); cdecl;
    procedure onRewind; cdecl;
    procedure onSeekTo(pos: Int64); cdecl;
    procedure onSetRating(rating: JRating); cdecl;
    procedure onSkipToNext; cdecl;
    procedure onSkipToPrevious; cdecl;
    procedure onSkipToQueueItem(id: Int64); cdecl;
    procedure onStop; cdecl;
  end;
  TJMediaSession_Callback = class(TJavaGenericImport<JMediaSession_CallbackClass, JMediaSession_Callback>) end;

  JMediaSession_QueueItemClass = interface(JObjectClass)
    ['{304E802E-0D8D-4697-8F1E-66D714C5A54B}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetUNKNOWN_ID: Integer; cdecl;
    {class} function init(description: JMediaDescription; id: Int64): JMediaSession_QueueItem; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property UNKNOWN_ID: Integer read _GetUNKNOWN_ID;
  end;

  [JavaSignature('android/media/session/MediaSession$QueueItem')]
  JMediaSession_QueueItem = interface(JObject)
    ['{A8131EBF-3607-4920-956C-2D45F3157333}']
    function describeContents: Integer; cdecl;
    function getDescription: JMediaDescription; cdecl;
    function getQueueId: Int64; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaSession_QueueItem = class(TJavaGenericImport<JMediaSession_QueueItemClass, JMediaSession_QueueItem>) end;

  JMediaSession_TokenClass = interface(JObjectClass)
    ['{BFA0DAE9-C1CB-4828-AD44-1FA0BA0E383F}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/session/MediaSession$Token')]
  JMediaSession_Token = interface(JObject)
    ['{9C7698F8-8021-4746-9E3A-B2BBE336167E}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJMediaSession_Token = class(TJavaGenericImport<JMediaSession_TokenClass, JMediaSession_Token>) end;

  JMediaSessionManagerClass = interface(JObjectClass)
    ['{7A9C7CBC-ABA5-4BF3-BF59-C4F5A807102D}']
  end;

  [JavaSignature('android/media/session/MediaSessionManager')]
  JMediaSessionManager = interface(JObject)
    ['{0BB154FE-A0E4-46DE-8702-A37590C31A4F}']
    procedure addOnActiveSessionsChangedListener(sessionListener: JMediaSessionManager_OnActiveSessionsChangedListener; notificationListener: JComponentName); cdecl; overload;
    procedure addOnActiveSessionsChangedListener(sessionListener: JMediaSessionManager_OnActiveSessionsChangedListener; notificationListener: JComponentName; handler: JHandler); cdecl; overload;
    function getActiveSessions(notificationListener: JComponentName): JList; cdecl;
    procedure removeOnActiveSessionsChangedListener(listener: JMediaSessionManager_OnActiveSessionsChangedListener); cdecl;
  end;
  TJMediaSessionManager = class(TJavaGenericImport<JMediaSessionManagerClass, JMediaSessionManager>) end;

  JMediaSessionManager_OnActiveSessionsChangedListenerClass = interface(IJavaClass)
    ['{AEA2EEF3-9628-4332-B2D5-F4D55D4429FA}']
  end;

  [JavaSignature('android/media/session/MediaSessionManager$OnActiveSessionsChangedListener')]
  JMediaSessionManager_OnActiveSessionsChangedListener = interface(IJavaInstance)
    ['{12307A91-67D5-4491-BDC3-8CCBF4134D68}']
    procedure onActiveSessionsChanged(controllers: JList); cdecl;
  end;
  TJMediaSessionManager_OnActiveSessionsChangedListener = class(TJavaGenericImport<JMediaSessionManager_OnActiveSessionsChangedListenerClass, JMediaSessionManager_OnActiveSessionsChangedListener>) end;

  JPlaybackStateClass = interface(JObjectClass)
    ['{1FCAA0BE-7E3C-4F33-8F8F-C15B994F0B44}']
    {class} function _GetACTION_FAST_FORWARD: Int64; cdecl;
    {class} function _GetACTION_PAUSE: Int64; cdecl;
    {class} function _GetACTION_PLAY: Int64; cdecl;
    {class} function _GetACTION_PLAY_FROM_MEDIA_ID: Int64; cdecl;
    {class} function _GetACTION_PLAY_FROM_SEARCH: Int64; cdecl;
    {class} function _GetACTION_PLAY_FROM_URI: Int64; cdecl;
    {class} function _GetACTION_PLAY_PAUSE: Int64; cdecl;
    {class} function _GetACTION_REWIND: Int64; cdecl;
    {class} function _GetACTION_SEEK_TO: Int64; cdecl;
    {class} function _GetACTION_SET_RATING: Int64; cdecl;
    {class} function _GetACTION_SKIP_TO_NEXT: Int64; cdecl;
    {class} function _GetACTION_SKIP_TO_PREVIOUS: Int64; cdecl;
    {class} function _GetACTION_SKIP_TO_QUEUE_ITEM: Int64; cdecl;
    {class} function _GetACTION_STOP: Int64; cdecl;
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPLAYBACK_POSITION_UNKNOWN: Int64; cdecl;
    {class} function _GetSTATE_BUFFERING: Integer; cdecl;
    {class} function _GetSTATE_CONNECTING: Integer; cdecl;
    {class} function _GetSTATE_ERROR: Integer; cdecl;
    {class} function _GetSTATE_FAST_FORWARDING: Integer; cdecl;
    {class} function _GetSTATE_NONE: Integer; cdecl;
    {class} function _GetSTATE_PAUSED: Integer; cdecl;
    {class} function _GetSTATE_PLAYING: Integer; cdecl;
    {class} function _GetSTATE_REWINDING: Integer; cdecl;
    {class} function _GetSTATE_SKIPPING_TO_NEXT: Integer; cdecl;
    {class} function _GetSTATE_SKIPPING_TO_PREVIOUS: Integer; cdecl;
    {class} function _GetSTATE_SKIPPING_TO_QUEUE_ITEM: Integer; cdecl;
    {class} function _GetSTATE_STOPPED: Integer; cdecl;
    {class} property ACTION_FAST_FORWARD: Int64 read _GetACTION_FAST_FORWARD;
    {class} property ACTION_PAUSE: Int64 read _GetACTION_PAUSE;
    {class} property ACTION_PLAY: Int64 read _GetACTION_PLAY;
    {class} property ACTION_PLAY_FROM_MEDIA_ID: Int64 read _GetACTION_PLAY_FROM_MEDIA_ID;
    {class} property ACTION_PLAY_FROM_SEARCH: Int64 read _GetACTION_PLAY_FROM_SEARCH;
    {class} property ACTION_PLAY_FROM_URI: Int64 read _GetACTION_PLAY_FROM_URI;
    {class} property ACTION_PLAY_PAUSE: Int64 read _GetACTION_PLAY_PAUSE;
    {class} property ACTION_REWIND: Int64 read _GetACTION_REWIND;
    {class} property ACTION_SEEK_TO: Int64 read _GetACTION_SEEK_TO;
    {class} property ACTION_SET_RATING: Int64 read _GetACTION_SET_RATING;
    {class} property ACTION_SKIP_TO_NEXT: Int64 read _GetACTION_SKIP_TO_NEXT;
    {class} property ACTION_SKIP_TO_PREVIOUS: Int64 read _GetACTION_SKIP_TO_PREVIOUS;
    {class} property ACTION_SKIP_TO_QUEUE_ITEM: Int64 read _GetACTION_SKIP_TO_QUEUE_ITEM;
    {class} property ACTION_STOP: Int64 read _GetACTION_STOP;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PLAYBACK_POSITION_UNKNOWN: Int64 read _GetPLAYBACK_POSITION_UNKNOWN;
    {class} property STATE_BUFFERING: Integer read _GetSTATE_BUFFERING;
    {class} property STATE_CONNECTING: Integer read _GetSTATE_CONNECTING;
    {class} property STATE_ERROR: Integer read _GetSTATE_ERROR;
    {class} property STATE_FAST_FORWARDING: Integer read _GetSTATE_FAST_FORWARDING;
    {class} property STATE_NONE: Integer read _GetSTATE_NONE;
    {class} property STATE_PAUSED: Integer read _GetSTATE_PAUSED;
    {class} property STATE_PLAYING: Integer read _GetSTATE_PLAYING;
    {class} property STATE_REWINDING: Integer read _GetSTATE_REWINDING;
    {class} property STATE_SKIPPING_TO_NEXT: Integer read _GetSTATE_SKIPPING_TO_NEXT;
    {class} property STATE_SKIPPING_TO_PREVIOUS: Integer read _GetSTATE_SKIPPING_TO_PREVIOUS;
    {class} property STATE_SKIPPING_TO_QUEUE_ITEM: Integer read _GetSTATE_SKIPPING_TO_QUEUE_ITEM;
    {class} property STATE_STOPPED: Integer read _GetSTATE_STOPPED;
  end;

  [JavaSignature('android/media/session/PlaybackState')]
  JPlaybackState = interface(JObject)
    ['{430F777C-C978-47EC-BA10-DFB49F2339C7}']
    function describeContents: Integer; cdecl;
    function getActions: Int64; cdecl;
    function getActiveQueueItemId: Int64; cdecl;
    function getBufferedPosition: Int64; cdecl;
    function getCustomActions: JList; cdecl;
    function getErrorMessage: JCharSequence; cdecl;
    function getExtras: JBundle; cdecl;
    function getLastPositionUpdateTime: Int64; cdecl;
    function getPlaybackSpeed: Single; cdecl;
    function getPosition: Int64; cdecl;
    function getState: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackState = class(TJavaGenericImport<JPlaybackStateClass, JPlaybackState>) end;

  JPlaybackState_BuilderClass = interface(JObjectClass)
    ['{14CEB35A-9DEA-487E-8205-E6A9D52F5FA7}']
    {class} function init: JPlaybackState_Builder; cdecl; overload;
    {class} function init(from: JPlaybackState): JPlaybackState_Builder; cdecl; overload;
  end;

  [JavaSignature('android/media/session/PlaybackState$Builder')]
  JPlaybackState_Builder = interface(JObject)
    ['{C2583FAC-5C63-4A81-827F-25B6471F9C97}']
    function addCustomAction(action: JString; name: JString; icon: Integer): JPlaybackState_Builder; cdecl; overload;
    function addCustomAction(customAction: JPlaybackState_CustomAction): JPlaybackState_Builder; cdecl; overload;
    function build: JPlaybackState; cdecl;
    function setActions(actions: Int64): JPlaybackState_Builder; cdecl;
    function setActiveQueueItemId(id: Int64): JPlaybackState_Builder; cdecl;
    function setBufferedPosition(bufferedPosition: Int64): JPlaybackState_Builder; cdecl;
    function setErrorMessage(error: JCharSequence): JPlaybackState_Builder; cdecl;
    function setExtras(extras: JBundle): JPlaybackState_Builder; cdecl;
    function setState(state: Integer; position: Int64; playbackSpeed: Single; updateTime: Int64): JPlaybackState_Builder; cdecl; overload;
    function setState(state: Integer; position: Int64; playbackSpeed: Single): JPlaybackState_Builder; cdecl; overload;
  end;
  TJPlaybackState_Builder = class(TJavaGenericImport<JPlaybackState_BuilderClass, JPlaybackState_Builder>) end;

  JPlaybackState_CustomActionClass = interface(JObjectClass)
    ['{FD5442D6-8F41-4A9E-8702-74E630E56EEB}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/media/session/PlaybackState$CustomAction')]
  JPlaybackState_CustomAction = interface(JObject)
    ['{ACAD5494-DA7A-41AE-9935-0A6C476501CD}']
    function describeContents: Integer; cdecl;
    function getAction: JString; cdecl;
    function getExtras: JBundle; cdecl;
    function getIcon: Integer; cdecl;
    function getName: JCharSequence; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPlaybackState_CustomAction = class(TJavaGenericImport<JPlaybackState_CustomActionClass, JPlaybackState_CustomAction>) end;

  JCustomAction_BuilderClass = interface(JObjectClass)
    ['{D9170974-7483-47AF-AC08-72555BEFF1E3}']
    {class} function init(action: JString; name: JCharSequence; icon: Integer): JCustomAction_Builder; cdecl;
  end;

  [JavaSignature('android/media/session/PlaybackState$CustomAction$Builder')]
  JCustomAction_Builder = interface(JObject)
    ['{27EAB325-4358-4187-A188-60DDBD0B0388}']
    function build: JPlaybackState_CustomAction; cdecl;
    function setExtras(extras: JBundle): JCustomAction_Builder; cdecl;
  end;
  TJCustomAction_Builder = class(TJavaGenericImport<JCustomAction_BuilderClass, JCustomAction_Builder>) end;

  JTvContentRatingClass = interface(JObjectClass)
    ['{322A526D-0620-49C6-A73B-16724301A4DC}']
    {class} function _GetUNRATED: JTvContentRating; cdecl;
    {class} function unflattenFromString(ratingString: JString): JTvContentRating; cdecl;
    {class} property UNRATED: JTvContentRating read _GetUNRATED;
  end;

  [JavaSignature('android/media/tv/TvContentRating')]
  JTvContentRating = interface(JObject)
    ['{85AA8AA2-F223-4815-A478-8D37FC54A1BC}']
    function equals(obj: JObject): Boolean; cdecl;
    function flattenToString: JString; cdecl;
    function getDomain: JString; cdecl;
    function getMainRating: JString; cdecl;
    function getRatingSystem: JString; cdecl;
    function getSubRatings: JList; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJTvContentRating = class(TJavaGenericImport<JTvContentRatingClass, JTvContentRating>) end;

  JTvContractClass = interface(JObjectClass)
    ['{617DCE60-1641-4F75-8B1B-F9459334F3B3}']
    {class} function _GetAUTHORITY: JString; cdecl;
    {class} function buildChannelLogoUri(channelId: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildChannelLogoUri(channelUri: Jnet_Uri): Jnet_Uri; cdecl; overload;
    {class} function buildChannelUri(channelId: Int64): Jnet_Uri; cdecl;
    {class} function buildChannelUriForPassthroughInput(inputId: JString): Jnet_Uri; cdecl;
    {class} function buildChannelsUriForInput(inputId: JString): Jnet_Uri; cdecl;
    {class} function buildInputId(name: JComponentName): JString; cdecl;
    {class} function buildProgramUri(programId: Int64): Jnet_Uri; cdecl;
    {class} function buildProgramsUriForChannel(channelId: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildProgramsUriForChannel(channelUri: Jnet_Uri): Jnet_Uri; cdecl; overload;
    {class} function buildProgramsUriForChannel(channelId: Int64; startTime: Int64; endTime: Int64): Jnet_Uri; cdecl; overload;
    {class} function buildProgramsUriForChannel(channelUri: Jnet_Uri; startTime: Int64; endTime: Int64): Jnet_Uri; cdecl; overload;
    {class} property AUTHORITY: JString read _GetAUTHORITY;
  end;

  [JavaSignature('android/media/tv/TvContract')]
  JTvContract = interface(JObject)
    ['{4ACA1AE4-AA5E-4A88-9E7A-7D7438F979C3}']
  end;
  TJTvContract = class(TJavaGenericImport<JTvContractClass, JTvContract>) end;

  JTvContract_BaseTvColumnsClass = interface(JBaseColumnsClass)
    ['{773D31D0-ECF5-480E-B000-9930CA1749AD}']
    {class} function _GetCOLUMN_PACKAGE_NAME: JString; cdecl;
    {class} property COLUMN_PACKAGE_NAME: JString read _GetCOLUMN_PACKAGE_NAME;
  end;

  [JavaSignature('android/media/tv/TvContract$BaseTvColumns')]
  JTvContract_BaseTvColumns = interface(JBaseColumns)
    ['{9AD43EBD-F58F-4A5C-B381-862778904287}']
  end;
  TJTvContract_BaseTvColumns = class(TJavaGenericImport<JTvContract_BaseTvColumnsClass, JTvContract_BaseTvColumns>) end;

  JTvContract_ChannelsClass = interface(JObjectClass)
    ['{76C4883A-633D-4254-B8EB-E52557B19D4C}']
    {class} function _GetCOLUMN_APP_LINK_COLOR: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_ICON_URI: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_INTENT_URI: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_POSTER_ART_URI: JString; cdecl;
    {class} function _GetCOLUMN_APP_LINK_TEXT: JString; cdecl;
    {class} function _GetCOLUMN_DESCRIPTION: JString; cdecl;
    {class} function _GetCOLUMN_DISPLAY_NAME: JString; cdecl;
    {class} function _GetCOLUMN_DISPLAY_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_INPUT_ID: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_DATA: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG1: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG2: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG3: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG4: JString; cdecl;
    {class} function _GetCOLUMN_NETWORK_AFFILIATION: JString; cdecl;
    {class} function _GetCOLUMN_ORIGINAL_NETWORK_ID: JString; cdecl;
    {class} function _GetCOLUMN_SEARCHABLE: JString; cdecl;
    {class} function _GetCOLUMN_SERVICE_ID: JString; cdecl;
    {class} function _GetCOLUMN_SERVICE_TYPE: JString; cdecl;
    {class} function _GetCOLUMN_TRANSPORT_STREAM_ID: JString; cdecl;
    {class} function _GetCOLUMN_TYPE: JString; cdecl;
    {class} function _GetCOLUMN_VERSION_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_VIDEO_FORMAT: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} function _GetSERVICE_TYPE_AUDIO: JString; cdecl;
    {class} function _GetSERVICE_TYPE_AUDIO_VIDEO: JString; cdecl;
    {class} function _GetSERVICE_TYPE_OTHER: JString; cdecl;
    {class} function _GetTYPE_1SEG: JString; cdecl;
    {class} function _GetTYPE_ATSC_C: JString; cdecl;
    {class} function _GetTYPE_ATSC_M_H: JString; cdecl;
    {class} function _GetTYPE_ATSC_T: JString; cdecl;
    {class} function _GetTYPE_CMMB: JString; cdecl;
    {class} function _GetTYPE_DTMB: JString; cdecl;
    {class} function _GetTYPE_DVB_C: JString; cdecl;
    {class} function _GetTYPE_DVB_C2: JString; cdecl;
    {class} function _GetTYPE_DVB_H: JString; cdecl;
    {class} function _GetTYPE_DVB_S: JString; cdecl;
    {class} function _GetTYPE_DVB_S2: JString; cdecl;
    {class} function _GetTYPE_DVB_SH: JString; cdecl;
    {class} function _GetTYPE_DVB_T: JString; cdecl;
    {class} function _GetTYPE_DVB_T2: JString; cdecl;
    {class} function _GetTYPE_ISDB_C: JString; cdecl;
    {class} function _GetTYPE_ISDB_S: JString; cdecl;
    {class} function _GetTYPE_ISDB_T: JString; cdecl;
    {class} function _GetTYPE_ISDB_TB: JString; cdecl;
    {class} function _GetTYPE_NTSC: JString; cdecl;
    {class} function _GetTYPE_OTHER: JString; cdecl;
    {class} function _GetTYPE_PAL: JString; cdecl;
    {class} function _GetTYPE_SECAM: JString; cdecl;
    {class} function _GetTYPE_S_DMB: JString; cdecl;
    {class} function _GetTYPE_T_DMB: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_1080I: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_1080P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_2160P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_240P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_360P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_4320P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_480I: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_480P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_576I: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_576P: JString; cdecl;
    {class} function _GetVIDEO_FORMAT_720P: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_ED: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_FHD: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_HD: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_SD: JString; cdecl;
    {class} function _GetVIDEO_RESOLUTION_UHD: JString; cdecl;
    {class} function getVideoResolution(videoFormat: JString): JString; cdecl;
    {class} property COLUMN_APP_LINK_COLOR: JString read _GetCOLUMN_APP_LINK_COLOR;
    {class} property COLUMN_APP_LINK_ICON_URI: JString read _GetCOLUMN_APP_LINK_ICON_URI;
    {class} property COLUMN_APP_LINK_INTENT_URI: JString read _GetCOLUMN_APP_LINK_INTENT_URI;
    {class} property COLUMN_APP_LINK_POSTER_ART_URI: JString read _GetCOLUMN_APP_LINK_POSTER_ART_URI;
    {class} property COLUMN_APP_LINK_TEXT: JString read _GetCOLUMN_APP_LINK_TEXT;
    {class} property COLUMN_DESCRIPTION: JString read _GetCOLUMN_DESCRIPTION;
    {class} property COLUMN_DISPLAY_NAME: JString read _GetCOLUMN_DISPLAY_NAME;
    {class} property COLUMN_DISPLAY_NUMBER: JString read _GetCOLUMN_DISPLAY_NUMBER;
    {class} property COLUMN_INPUT_ID: JString read _GetCOLUMN_INPUT_ID;
    {class} property COLUMN_INTERNAL_PROVIDER_DATA: JString read _GetCOLUMN_INTERNAL_PROVIDER_DATA;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG1: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG1;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG2: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG2;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG3: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG3;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG4: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG4;
    {class} property COLUMN_NETWORK_AFFILIATION: JString read _GetCOLUMN_NETWORK_AFFILIATION;
    {class} property COLUMN_ORIGINAL_NETWORK_ID: JString read _GetCOLUMN_ORIGINAL_NETWORK_ID;
    {class} property COLUMN_SEARCHABLE: JString read _GetCOLUMN_SEARCHABLE;
    {class} property COLUMN_SERVICE_ID: JString read _GetCOLUMN_SERVICE_ID;
    {class} property COLUMN_SERVICE_TYPE: JString read _GetCOLUMN_SERVICE_TYPE;
    {class} property COLUMN_TRANSPORT_STREAM_ID: JString read _GetCOLUMN_TRANSPORT_STREAM_ID;
    {class} property COLUMN_TYPE: JString read _GetCOLUMN_TYPE;
    {class} property COLUMN_VERSION_NUMBER: JString read _GetCOLUMN_VERSION_NUMBER;
    {class} property COLUMN_VIDEO_FORMAT: JString read _GetCOLUMN_VIDEO_FORMAT;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
    {class} property SERVICE_TYPE_AUDIO: JString read _GetSERVICE_TYPE_AUDIO;
    {class} property SERVICE_TYPE_AUDIO_VIDEO: JString read _GetSERVICE_TYPE_AUDIO_VIDEO;
    {class} property SERVICE_TYPE_OTHER: JString read _GetSERVICE_TYPE_OTHER;
    {class} property TYPE_1SEG: JString read _GetTYPE_1SEG;
    {class} property TYPE_ATSC_C: JString read _GetTYPE_ATSC_C;
    {class} property TYPE_ATSC_M_H: JString read _GetTYPE_ATSC_M_H;
    {class} property TYPE_ATSC_T: JString read _GetTYPE_ATSC_T;
    {class} property TYPE_CMMB: JString read _GetTYPE_CMMB;
    {class} property TYPE_DTMB: JString read _GetTYPE_DTMB;
    {class} property TYPE_DVB_C: JString read _GetTYPE_DVB_C;
    {class} property TYPE_DVB_C2: JString read _GetTYPE_DVB_C2;
    {class} property TYPE_DVB_H: JString read _GetTYPE_DVB_H;
    {class} property TYPE_DVB_S: JString read _GetTYPE_DVB_S;
    {class} property TYPE_DVB_S2: JString read _GetTYPE_DVB_S2;
    {class} property TYPE_DVB_SH: JString read _GetTYPE_DVB_SH;
    {class} property TYPE_DVB_T: JString read _GetTYPE_DVB_T;
    {class} property TYPE_DVB_T2: JString read _GetTYPE_DVB_T2;
    {class} property TYPE_ISDB_C: JString read _GetTYPE_ISDB_C;
    {class} property TYPE_ISDB_S: JString read _GetTYPE_ISDB_S;
    {class} property TYPE_ISDB_T: JString read _GetTYPE_ISDB_T;
    {class} property TYPE_ISDB_TB: JString read _GetTYPE_ISDB_TB;
    {class} property TYPE_NTSC: JString read _GetTYPE_NTSC;
    {class} property TYPE_OTHER: JString read _GetTYPE_OTHER;
    {class} property TYPE_PAL: JString read _GetTYPE_PAL;
    {class} property TYPE_SECAM: JString read _GetTYPE_SECAM;
    {class} property TYPE_S_DMB: JString read _GetTYPE_S_DMB;
    {class} property TYPE_T_DMB: JString read _GetTYPE_T_DMB;
    {class} property VIDEO_FORMAT_1080I: JString read _GetVIDEO_FORMAT_1080I;
    {class} property VIDEO_FORMAT_1080P: JString read _GetVIDEO_FORMAT_1080P;
    {class} property VIDEO_FORMAT_2160P: JString read _GetVIDEO_FORMAT_2160P;
    {class} property VIDEO_FORMAT_240P: JString read _GetVIDEO_FORMAT_240P;
    {class} property VIDEO_FORMAT_360P: JString read _GetVIDEO_FORMAT_360P;
    {class} property VIDEO_FORMAT_4320P: JString read _GetVIDEO_FORMAT_4320P;
    {class} property VIDEO_FORMAT_480I: JString read _GetVIDEO_FORMAT_480I;
    {class} property VIDEO_FORMAT_480P: JString read _GetVIDEO_FORMAT_480P;
    {class} property VIDEO_FORMAT_576I: JString read _GetVIDEO_FORMAT_576I;
    {class} property VIDEO_FORMAT_576P: JString read _GetVIDEO_FORMAT_576P;
    {class} property VIDEO_FORMAT_720P: JString read _GetVIDEO_FORMAT_720P;
    {class} property VIDEO_RESOLUTION_ED: JString read _GetVIDEO_RESOLUTION_ED;
    {class} property VIDEO_RESOLUTION_FHD: JString read _GetVIDEO_RESOLUTION_FHD;
    {class} property VIDEO_RESOLUTION_HD: JString read _GetVIDEO_RESOLUTION_HD;
    {class} property VIDEO_RESOLUTION_SD: JString read _GetVIDEO_RESOLUTION_SD;
    {class} property VIDEO_RESOLUTION_UHD: JString read _GetVIDEO_RESOLUTION_UHD;
  end;

  [JavaSignature('android/media/tv/TvContract$Channels')]
  JTvContract_Channels = interface(JObject)
    ['{8F0208EC-F865-465C-BF58-4968AB36CBB3}']
  end;
  TJTvContract_Channels = class(TJavaGenericImport<JTvContract_ChannelsClass, JTvContract_Channels>) end;

  JChannels_LogoClass = interface(JObjectClass)
    ['{A6F017D2-0D15-400D-9540-660ACD5ACCE1}']
    {class} function _GetCONTENT_DIRECTORY: JString; cdecl;
    {class} property CONTENT_DIRECTORY: JString read _GetCONTENT_DIRECTORY;
  end;

  [JavaSignature('android/media/tv/TvContract$Channels$Logo')]
  JChannels_Logo = interface(JObject)
    ['{03642B44-015D-4ED5-B535-147A886E2855}']
  end;
  TJChannels_Logo = class(TJavaGenericImport<JChannels_LogoClass, JChannels_Logo>) end;

  JTvContract_ProgramsClass = interface(JObjectClass)
    ['{3EB71005-2470-41FB-9ACD-6E7A895BB5AF}']
    {class} function _GetCOLUMN_AUDIO_LANGUAGE: JString; cdecl;
    {class} function _GetCOLUMN_BROADCAST_GENRE: JString; cdecl;
    {class} function _GetCOLUMN_CANONICAL_GENRE: JString; cdecl;
    {class} function _GetCOLUMN_CHANNEL_ID: JString; cdecl;
    {class} function _GetCOLUMN_CONTENT_RATING: JString; cdecl;
    {class} function _GetCOLUMN_END_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_EPISODE_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_EPISODE_TITLE: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_DATA: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG1: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG2: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG3: JString; cdecl;
    {class} function _GetCOLUMN_INTERNAL_PROVIDER_FLAG4: JString; cdecl;
    {class} function _GetCOLUMN_LONG_DESCRIPTION: JString; cdecl;
    {class} function _GetCOLUMN_POSTER_ART_URI: JString; cdecl;
    {class} function _GetCOLUMN_SEARCHABLE: JString; cdecl;
    {class} function _GetCOLUMN_SEASON_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_SHORT_DESCRIPTION: JString; cdecl;
    {class} function _GetCOLUMN_START_TIME_UTC_MILLIS: JString; cdecl;
    {class} function _GetCOLUMN_THUMBNAIL_URI: JString; cdecl;
    {class} function _GetCOLUMN_TITLE: JString; cdecl;
    {class} function _GetCOLUMN_VERSION_NUMBER: JString; cdecl;
    {class} function _GetCOLUMN_VIDEO_HEIGHT: JString; cdecl;
    {class} function _GetCOLUMN_VIDEO_WIDTH: JString; cdecl;
    {class} function _GetCONTENT_ITEM_TYPE: JString; cdecl;
    {class} function _GetCONTENT_TYPE: JString; cdecl;
    {class} function _GetCONTENT_URI: Jnet_Uri; cdecl;
    {class} property COLUMN_AUDIO_LANGUAGE: JString read _GetCOLUMN_AUDIO_LANGUAGE;
    {class} property COLUMN_BROADCAST_GENRE: JString read _GetCOLUMN_BROADCAST_GENRE;
    {class} property COLUMN_CANONICAL_GENRE: JString read _GetCOLUMN_CANONICAL_GENRE;
    {class} property COLUMN_CHANNEL_ID: JString read _GetCOLUMN_CHANNEL_ID;
    {class} property COLUMN_CONTENT_RATING: JString read _GetCOLUMN_CONTENT_RATING;
    {class} property COLUMN_END_TIME_UTC_MILLIS: JString read _GetCOLUMN_END_TIME_UTC_MILLIS;
    {class} property COLUMN_EPISODE_NUMBER: JString read _GetCOLUMN_EPISODE_NUMBER;
    {class} property COLUMN_EPISODE_TITLE: JString read _GetCOLUMN_EPISODE_TITLE;
    {class} property COLUMN_INTERNAL_PROVIDER_DATA: JString read _GetCOLUMN_INTERNAL_PROVIDER_DATA;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG1: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG1;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG2: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG2;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG3: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG3;
    {class} property COLUMN_INTERNAL_PROVIDER_FLAG4: JString read _GetCOLUMN_INTERNAL_PROVIDER_FLAG4;
    {class} property COLUMN_LONG_DESCRIPTION: JString read _GetCOLUMN_LONG_DESCRIPTION;
    {class} property COLUMN_POSTER_ART_URI: JString read _GetCOLUMN_POSTER_ART_URI;
    {class} property COLUMN_SEARCHABLE: JString read _GetCOLUMN_SEARCHABLE;
    {class} property COLUMN_SEASON_NUMBER: JString read _GetCOLUMN_SEASON_NUMBER;
    {class} property COLUMN_SHORT_DESCRIPTION: JString read _GetCOLUMN_SHORT_DESCRIPTION;
    {class} property COLUMN_START_TIME_UTC_MILLIS: JString read _GetCOLUMN_START_TIME_UTC_MILLIS;
    {class} property COLUMN_THUMBNAIL_URI: JString read _GetCOLUMN_THUMBNAIL_URI;
    {class} property COLUMN_TITLE: JString read _GetCOLUMN_TITLE;
    {class} property COLUMN_VERSION_NUMBER: JString read _GetCOLUMN_VERSION_NUMBER;
    {class} property COLUMN_VIDEO_HEIGHT: JString read _GetCOLUMN_VIDEO_HEIGHT;
    {class} property COLUMN_VIDEO_WIDTH: JString read _GetCOLUMN_VIDEO_WIDTH;
    {class} property CONTENT_ITEM_TYPE: JString read _GetCONTENT_ITEM_TYPE;
    {class} property CONTENT_TYPE: JString read _GetCONTENT_TYPE;
    {class} property CONTENT_URI: Jnet_Uri read _GetCONTENT_URI;
  end;

  [JavaSignature('android/media/tv/TvContract$Programs')]
  JTvContract_Programs = interface(JObject)
    ['{B064AE97-B755-45D2-9B2F-265D7E8AEC97}']
  end;
  TJTvContract_Programs = class(TJavaGenericImport<JTvContract_ProgramsClass, JTvContract_Programs>) end;

  JPrograms_GenresClass = interface(JObjectClass)
    ['{9D7EC7A4-1F0D-4D52-8C2A-AA2828C7BE3F}']
    {class} function _GetANIMAL_WILDLIFE: JString; cdecl;
    {class} function _GetARTS: JString; cdecl;
    {class} function _GetCOMEDY: JString; cdecl;
    {class} function _GetDRAMA: JString; cdecl;
    {class} function _GetEDUCATION: JString; cdecl;
    {class} function _GetENTERTAINMENT: JString; cdecl;
    {class} function _GetFAMILY_KIDS: JString; cdecl;
    {class} function _GetGAMING: JString; cdecl;
    {class} function _GetLIFE_STYLE: JString; cdecl;
    {class} function _GetMOVIES: JString; cdecl;
    {class} function _GetMUSIC: JString; cdecl;
    {class} function _GetNEWS: JString; cdecl;
    {class} function _GetPREMIER: JString; cdecl;
    {class} function _GetSHOPPING: JString; cdecl;
    {class} function _GetSPORTS: JString; cdecl;
    {class} function _GetTECH_SCIENCE: JString; cdecl;
    {class} function _GetTRAVEL: JString; cdecl;
    {class} function decode(genres: JString): TJavaObjectArray<JString>; cdecl;
    {class} property ANIMAL_WILDLIFE: JString read _GetANIMAL_WILDLIFE;
    {class} property ARTS: JString read _GetARTS;
    {class} property COMEDY: JString read _GetCOMEDY;
    {class} property DRAMA: JString read _GetDRAMA;
    {class} property EDUCATION: JString read _GetEDUCATION;
    {class} property ENTERTAINMENT: JString read _GetENTERTAINMENT;
    {class} property FAMILY_KIDS: JString read _GetFAMILY_KIDS;
    {class} property GAMING: JString read _GetGAMING;
    {class} property LIFE_STYLE: JString read _GetLIFE_STYLE;
    {class} property MOVIES: JString read _GetMOVIES;
    {class} property MUSIC: JString read _GetMUSIC;
    {class} property NEWS: JString read _GetNEWS;
    {class} property PREMIER: JString read _GetPREMIER;
    {class} property SHOPPING: JString read _GetSHOPPING;
    {class} property SPORTS: JString read _GetSPORTS;
    {class} property TECH_SCIENCE: JString read _GetTECH_SCIENCE;
    {class} property TRAVEL: JString read _GetTRAVEL;
  end;

  [JavaSignature('android/media/tv/TvContract$Programs$Genres')]
  JPrograms_Genres = interface(JObject)
    ['{AC4CFBA3-F369-40A6-A2E6-0C5C7C525692}']
  end;
  TJPrograms_Genres = class(TJavaGenericImport<JPrograms_GenresClass, JPrograms_Genres>) end;

  JTvInputInfoClass = interface(JObjectClass)
    ['{81E0FF25-09BF-46FE-A01F-5072D8601912}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEXTRA_INPUT_ID: JString; cdecl;
    {class} function _GetTYPE_COMPONENT: Integer; cdecl;
    {class} function _GetTYPE_COMPOSITE: Integer; cdecl;
    {class} function _GetTYPE_DISPLAY_PORT: Integer; cdecl;
    {class} function _GetTYPE_DVI: Integer; cdecl;
    {class} function _GetTYPE_HDMI: Integer; cdecl;
    {class} function _GetTYPE_OTHER: Integer; cdecl;
    {class} function _GetTYPE_SCART: Integer; cdecl;
    {class} function _GetTYPE_SVIDEO: Integer; cdecl;
    {class} function _GetTYPE_TUNER: Integer; cdecl;
    {class} function _GetTYPE_VGA: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EXTRA_INPUT_ID: JString read _GetEXTRA_INPUT_ID;
    {class} property TYPE_COMPONENT: Integer read _GetTYPE_COMPONENT;
    {class} property TYPE_COMPOSITE: Integer read _GetTYPE_COMPOSITE;
    {class} property TYPE_DISPLAY_PORT: Integer read _GetTYPE_DISPLAY_PORT;
    {class} property TYPE_DVI: Integer read _GetTYPE_DVI;
    {class} property TYPE_HDMI: Integer read _GetTYPE_HDMI;
    {class} property TYPE_OTHER: Integer read _GetTYPE_OTHER;
    {class} property TYPE_SCART: Integer read _GetTYPE_SCART;
    {class} property TYPE_SVIDEO: Integer read _GetTYPE_SVIDEO;
    {class} property TYPE_TUNER: Integer read _GetTYPE_TUNER;
    {class} property TYPE_VGA: Integer read _GetTYPE_VGA;
  end;

  [JavaSignature('android/media/tv/TvInputInfo')]
  JTvInputInfo = interface(JObject)
    ['{206FA923-F42B-4278-9959-163CBFABCC99}']
    function createSettingsIntent: JIntent; cdecl;
    function createSetupIntent: JIntent; cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getId: JString; cdecl;
    function getParentId: JString; cdecl;
    function getServiceInfo: JServiceInfo; cdecl;
    function getType: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isPassthroughInput: Boolean; cdecl;
    function loadIcon(context: JContext): JDrawable; cdecl;
    function loadLabel(context: JContext): JCharSequence; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTvInputInfo = class(TJavaGenericImport<JTvInputInfoClass, JTvInputInfo>) end;

  JTvInputManagerClass = interface(JObjectClass)
    ['{0408BC0B-DD35-43AE-A248-8CAEAA39BE8A}']
    {class} function _GetACTION_BLOCKED_RATINGS_CHANGED: JString; cdecl;
    {class} function _GetACTION_PARENTAL_CONTROLS_ENABLED_CHANGED: JString; cdecl;
    {class} function _GetACTION_QUERY_CONTENT_RATING_SYSTEMS: JString; cdecl;
    {class} function _GetINPUT_STATE_CONNECTED: Integer; cdecl;
    {class} function _GetINPUT_STATE_CONNECTED_STANDBY: Integer; cdecl;
    {class} function _GetINPUT_STATE_DISCONNECTED: Integer; cdecl;
    {class} function _GetMETA_DATA_CONTENT_RATING_SYSTEMS: JString; cdecl;
    {class} function _GetTIME_SHIFT_INVALID_TIME: Int64; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_AVAILABLE: Integer; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_UNAVAILABLE: Integer; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_UNKNOWN: Integer; cdecl;
    {class} function _GetTIME_SHIFT_STATUS_UNSUPPORTED: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_AUDIO_ONLY: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_BUFFERING: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_TUNING: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_UNKNOWN: Integer; cdecl;
    {class} function _GetVIDEO_UNAVAILABLE_REASON_WEAK_SIGNAL: Integer; cdecl;
    {class} property ACTION_BLOCKED_RATINGS_CHANGED: JString read _GetACTION_BLOCKED_RATINGS_CHANGED;
    {class} property ACTION_PARENTAL_CONTROLS_ENABLED_CHANGED: JString read _GetACTION_PARENTAL_CONTROLS_ENABLED_CHANGED;
    {class} property ACTION_QUERY_CONTENT_RATING_SYSTEMS: JString read _GetACTION_QUERY_CONTENT_RATING_SYSTEMS;
    {class} property INPUT_STATE_CONNECTED: Integer read _GetINPUT_STATE_CONNECTED;
    {class} property INPUT_STATE_CONNECTED_STANDBY: Integer read _GetINPUT_STATE_CONNECTED_STANDBY;
    {class} property INPUT_STATE_DISCONNECTED: Integer read _GetINPUT_STATE_DISCONNECTED;
    {class} property META_DATA_CONTENT_RATING_SYSTEMS: JString read _GetMETA_DATA_CONTENT_RATING_SYSTEMS;
    {class} property TIME_SHIFT_INVALID_TIME: Int64 read _GetTIME_SHIFT_INVALID_TIME;
    {class} property TIME_SHIFT_STATUS_AVAILABLE: Integer read _GetTIME_SHIFT_STATUS_AVAILABLE;
    {class} property TIME_SHIFT_STATUS_UNAVAILABLE: Integer read _GetTIME_SHIFT_STATUS_UNAVAILABLE;
    {class} property TIME_SHIFT_STATUS_UNKNOWN: Integer read _GetTIME_SHIFT_STATUS_UNKNOWN;
    {class} property TIME_SHIFT_STATUS_UNSUPPORTED: Integer read _GetTIME_SHIFT_STATUS_UNSUPPORTED;
    {class} property VIDEO_UNAVAILABLE_REASON_AUDIO_ONLY: Integer read _GetVIDEO_UNAVAILABLE_REASON_AUDIO_ONLY;
    {class} property VIDEO_UNAVAILABLE_REASON_BUFFERING: Integer read _GetVIDEO_UNAVAILABLE_REASON_BUFFERING;
    {class} property VIDEO_UNAVAILABLE_REASON_TUNING: Integer read _GetVIDEO_UNAVAILABLE_REASON_TUNING;
    {class} property VIDEO_UNAVAILABLE_REASON_UNKNOWN: Integer read _GetVIDEO_UNAVAILABLE_REASON_UNKNOWN;
    {class} property VIDEO_UNAVAILABLE_REASON_WEAK_SIGNAL: Integer read _GetVIDEO_UNAVAILABLE_REASON_WEAK_SIGNAL;
  end;

  [JavaSignature('android/media/tv/TvInputManager')]
  JTvInputManager = interface(JObject)
    ['{2F97DA50-5475-45F3-870F-0F88E3F1F901}']
    function getInputState(inputId: JString): Integer; cdecl;
    function getTvInputInfo(inputId: JString): JTvInputInfo; cdecl;
    function getTvInputList: JList; cdecl;
    function isParentalControlsEnabled: Boolean; cdecl;
    function isRatingBlocked(rating: JTvContentRating): Boolean; cdecl;
    procedure registerCallback(callback: JTvInputManager_TvInputCallback; handler: JHandler); cdecl;
    procedure unregisterCallback(callback: JTvInputManager_TvInputCallback); cdecl;
  end;
  TJTvInputManager = class(TJavaGenericImport<JTvInputManagerClass, JTvInputManager>) end;

  JTvInputManager_TvInputCallbackClass = interface(JObjectClass)
    ['{73BCF37E-F9C0-46D5-924E-2A6FD6CEE78A}']
    {class} function init: JTvInputManager_TvInputCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputManager$TvInputCallback')]
  JTvInputManager_TvInputCallback = interface(JObject)
    ['{415CBDB9-7B2D-42AD-BB14-425C8126E960}']
    procedure onInputAdded(inputId: JString); cdecl;
    procedure onInputRemoved(inputId: JString); cdecl;
    procedure onInputStateChanged(inputId: JString; state: Integer); cdecl;
  end;
  TJTvInputManager_TvInputCallback = class(TJavaGenericImport<JTvInputManager_TvInputCallbackClass, JTvInputManager_TvInputCallback>) end;

  JTvInputServiceClass = interface(JServiceClass)
    ['{002C4996-4C27-470F-BEF9-203BC0268E40}']
    {class} function _GetSERVICE_INTERFACE: JString; cdecl;
    {class} function _GetSERVICE_META_DATA: JString; cdecl;
    {class} function init: JTvInputService; cdecl;
    {class} property SERVICE_INTERFACE: JString read _GetSERVICE_INTERFACE;
    {class} property SERVICE_META_DATA: JString read _GetSERVICE_META_DATA;
  end;

  [JavaSignature('android/media/tv/TvInputService')]
  JTvInputService = interface(JService)
    ['{A2933D84-5B2E-46DE-8304-1B58E41D802F}']
    function onBind(intent: JIntent): JIBinder; cdecl;
    function onCreateSession(inputId: JString): JTvInputService_Session; cdecl;
  end;
  TJTvInputService = class(TJavaGenericImport<JTvInputServiceClass, JTvInputService>) end;

  JTvInputService_SessionClass = interface(JObjectClass)
    ['{C859B4C2-FADD-414D-BA6B-BFA3FC36FEBB}']
    {class} function init(context: JContext): JTvInputService_Session; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputService$Session')]
  JTvInputService_Session = interface(JObject)
    ['{8CE3F272-32C1-4046-A7CF-4A22D119B39C}']
    procedure layoutSurface(left: Integer; top: Integer; right: Integer; bottom: Integer); cdecl;
    procedure notifyChannelRetuned(channelUri: Jnet_Uri); cdecl;
    procedure notifyContentAllowed; cdecl;
    procedure notifyContentBlocked(rating: JTvContentRating); cdecl;
    procedure notifyTimeShiftStatusChanged(status: Integer); cdecl;
    procedure notifyTrackSelected(type_: Integer; trackId: JString); cdecl;
    procedure notifyTracksChanged(tracks: JList); cdecl;
    procedure notifyVideoAvailable; cdecl;
    procedure notifyVideoUnavailable(reason: Integer); cdecl;
    function onCreateOverlayView: JView; cdecl;
    function onGenericMotionEvent(event: JMotionEvent): Boolean; cdecl;
    function onKeyDown(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyLongPress(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyMultiple(keyCode: Integer; count: Integer; event: JKeyEvent): Boolean; cdecl;
    function onKeyUp(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    procedure onOverlayViewSizeChanged(width: Integer; height: Integer); cdecl;
    procedure onRelease; cdecl;
    function onSelectTrack(type_: Integer; trackId: JString): Boolean; cdecl;
    procedure onSetCaptionEnabled(enabled: Boolean); cdecl;
    procedure onSetStreamVolume(volume: Single); cdecl;
    function onSetSurface(surface: JSurface): Boolean; cdecl;
    procedure onSurfaceChanged(format: Integer; width: Integer; height: Integer); cdecl;
    function onTimeShiftGetCurrentPosition: Int64; cdecl;
    function onTimeShiftGetStartPosition: Int64; cdecl;
    procedure onTimeShiftPause; cdecl;
    procedure onTimeShiftResume; cdecl;
    procedure onTimeShiftSeekTo(timeMs: Int64); cdecl;
    procedure onTimeShiftSetPlaybackParams(params: JPlaybackParams); cdecl;
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
    function onTrackballEvent(event: JMotionEvent): Boolean; cdecl;
    function onTune(channelUri: Jnet_Uri): Boolean; cdecl;
    procedure onUnblockContent(unblockedRating: JTvContentRating); cdecl;
    procedure setOverlayViewEnabled(enable: Boolean); cdecl;
  end;
  TJTvInputService_Session = class(TJavaGenericImport<JTvInputService_SessionClass, JTvInputService_Session>) end;

  JTvInputService_HardwareSessionClass = interface(JTvInputService_SessionClass)
    ['{32192DCC-DBC8-4AB8-8F2B-26202F542994}']
    {class} function init(context: JContext): JTvInputService_HardwareSession; cdecl;
  end;

  [JavaSignature('android/media/tv/TvInputService$HardwareSession')]
  JTvInputService_HardwareSession = interface(JTvInputService_Session)
    ['{FF431494-707A-4084-8945-D32CAFFF2B21}']
    function getHardwareInputId: JString; cdecl;
    procedure onHardwareVideoAvailable; cdecl;
    procedure onHardwareVideoUnavailable(reason: Integer); cdecl;
    function onSetSurface(surface: JSurface): Boolean; cdecl;
  end;
  TJTvInputService_HardwareSession = class(TJavaGenericImport<JTvInputService_HardwareSessionClass, JTvInputService_HardwareSession>) end;

  JTvTrackInfoClass = interface(JObjectClass)
    ['{B3355E4A-BA42-4397-97C6-357204A82C02}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetTYPE_AUDIO: Integer; cdecl;
    {class} function _GetTYPE_SUBTITLE: Integer; cdecl;
    {class} function _GetTYPE_VIDEO: Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property TYPE_AUDIO: Integer read _GetTYPE_AUDIO;
    {class} property TYPE_SUBTITLE: Integer read _GetTYPE_SUBTITLE;
    {class} property TYPE_VIDEO: Integer read _GetTYPE_VIDEO;
  end;

  [JavaSignature('android/media/tv/TvTrackInfo')]
  JTvTrackInfo = interface(JObject)
    ['{31CD4871-2999-46C0-BBB9-C4B0CC905984}']
    function describeContents: Integer; cdecl;
    function getAudioChannelCount: Integer; cdecl;
    function getAudioSampleRate: Integer; cdecl;
    function getDescription: JCharSequence; cdecl;
    function getExtra: JBundle; cdecl;
    function getId: JString; cdecl;
    function getLanguage: JString; cdecl;
    function getType: Integer; cdecl;
    function getVideoFrameRate: Single; cdecl;
    function getVideoHeight: Integer; cdecl;
    function getVideoPixelAspectRatio: Single; cdecl;
    function getVideoWidth: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJTvTrackInfo = class(TJavaGenericImport<JTvTrackInfoClass, JTvTrackInfo>) end;

  JTvTrackInfo_BuilderClass = interface(JObjectClass)
    ['{7891AE9E-B5FD-4C99-A0C9-EADF7B6EC469}']
    {class} function init(type_: Integer; id: JString): JTvTrackInfo_Builder; cdecl;
  end;

  [JavaSignature('android/media/tv/TvTrackInfo$Builder')]
  JTvTrackInfo_Builder = interface(JObject)
    ['{9A0A4558-407E-44ED-BCC4-1FFD78D5F176}']
    function build: JTvTrackInfo; cdecl;
    function setAudioChannelCount(audioChannelCount: Integer): JTvTrackInfo_Builder; cdecl;
    function setAudioSampleRate(audioSampleRate: Integer): JTvTrackInfo_Builder; cdecl;
    function setDescription(description: JCharSequence): JTvTrackInfo_Builder; cdecl;
    function setExtra(extra: JBundle): JTvTrackInfo_Builder; cdecl;
    function setLanguage(language: JString): JTvTrackInfo_Builder; cdecl;
    function setVideoFrameRate(videoFrameRate: Single): JTvTrackInfo_Builder; cdecl;
    function setVideoHeight(videoHeight: Integer): JTvTrackInfo_Builder; cdecl;
    function setVideoPixelAspectRatio(videoPixelAspectRatio: Single): JTvTrackInfo_Builder; cdecl;
    function setVideoWidth(videoWidth: Integer): JTvTrackInfo_Builder; cdecl;
  end;
  TJTvTrackInfo_Builder = class(TJavaGenericImport<JTvTrackInfo_BuilderClass, JTvTrackInfo_Builder>) end;

  JTvViewClass = interface(JViewGroupClass)
    ['{2B409DB0-46DC-4873-A9D3-FE5856C49C2D}']
    {class} function init(context: JContext): JTvView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTvView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JTvView; cdecl; overload;
  end;

  [JavaSignature('android/media/tv/TvView')]
  JTvView = interface(JViewGroup)
    ['{9EBA8B84-51BF-44F3-B454-FF6662C2E6E7}']
    function dispatchGenericMotionEvent(event: JMotionEvent): Boolean; cdecl;
    function dispatchKeyEvent(event: JKeyEvent): Boolean; cdecl;
    function dispatchTouchEvent(event: JMotionEvent): Boolean; cdecl;
    function dispatchTrackballEvent(event: JMotionEvent): Boolean; cdecl;
    function dispatchUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
    procedure dispatchWindowFocusChanged(hasFocus: Boolean); cdecl;
    procedure draw(canvas: JCanvas); cdecl;
    function gatherTransparentRegion(region: JRegion): Boolean; cdecl;
    function getSelectedTrack(type_: Integer): JString; cdecl;
    function getTracks(type_: Integer): JList; cdecl;
    function onUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
    procedure reset; cdecl;
    procedure selectTrack(type_: Integer; trackId: JString); cdecl;
    procedure setCallback(callback: JTvView_TvInputCallback); cdecl;
    procedure setCaptionEnabled(enabled: Boolean); cdecl;
    procedure setOnUnhandledInputEventListener(listener: JTvView_OnUnhandledInputEventListener); cdecl;
    procedure setStreamVolume(volume: Single); cdecl;
    procedure setTimeShiftPositionCallback(callback: JTvView_TimeShiftPositionCallback); cdecl;
    procedure timeShiftPause; cdecl;
    procedure timeShiftResume; cdecl;
    procedure timeShiftSeekTo(timeMs: Int64); cdecl;
    procedure timeShiftSetPlaybackParams(params: JPlaybackParams); cdecl;
    procedure tune(inputId: JString; channelUri: Jnet_Uri); cdecl;
  end;
  TJTvView = class(TJavaGenericImport<JTvViewClass, JTvView>) end;

  JTvView_OnUnhandledInputEventListenerClass = interface(IJavaClass)
    ['{21A432E7-1563-455A-93E1-A750F30AE95A}']
  end;

  [JavaSignature('android/media/tv/TvView$OnUnhandledInputEventListener')]
  JTvView_OnUnhandledInputEventListener = interface(IJavaInstance)
    ['{A8A53C52-4272-49B2-9655-66E388EFDED7}']
    function onUnhandledInputEvent(event: JInputEvent): Boolean; cdecl;
  end;
  TJTvView_OnUnhandledInputEventListener = class(TJavaGenericImport<JTvView_OnUnhandledInputEventListenerClass, JTvView_OnUnhandledInputEventListener>) end;

  JTvView_TimeShiftPositionCallbackClass = interface(JObjectClass)
    ['{630A26E4-D26E-4A25-A4B0-6D4EB45C6640}']
    {class} function init: JTvView_TimeShiftPositionCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvView$TimeShiftPositionCallback')]
  JTvView_TimeShiftPositionCallback = interface(JObject)
    ['{016695D7-41AF-4EF2-8A9C-7F326F9B14A0}']
    procedure onTimeShiftCurrentPositionChanged(inputId: JString; timeMs: Int64); cdecl;
    procedure onTimeShiftStartPositionChanged(inputId: JString; timeMs: Int64); cdecl;
  end;
  TJTvView_TimeShiftPositionCallback = class(TJavaGenericImport<JTvView_TimeShiftPositionCallbackClass, JTvView_TimeShiftPositionCallback>) end;

  JTvView_TvInputCallbackClass = interface(JObjectClass)
    ['{7EA53B6D-A4B0-4022-8198-C2E6262246DA}']
    {class} function init: JTvView_TvInputCallback; cdecl;
  end;

  [JavaSignature('android/media/tv/TvView$TvInputCallback')]
  JTvView_TvInputCallback = interface(JObject)
    ['{40DF20F4-D8BE-4E16-AF7E-F780D5E7C701}']
    procedure onChannelRetuned(inputId: JString; channelUri: Jnet_Uri); cdecl;
    procedure onConnectionFailed(inputId: JString); cdecl;
    procedure onContentAllowed(inputId: JString); cdecl;
    procedure onContentBlocked(inputId: JString; rating: JTvContentRating); cdecl;
    procedure onDisconnected(inputId: JString); cdecl;
    procedure onTimeShiftStatusChanged(inputId: JString; status: Integer); cdecl;
    procedure onTrackSelected(inputId: JString; type_: Integer; trackId: JString); cdecl;
    procedure onTracksChanged(inputId: JString; tracks: JList); cdecl;
    procedure onVideoAvailable(inputId: JString); cdecl;
    procedure onVideoSizeChanged(inputId: JString; width: Integer; height: Integer); cdecl;
    procedure onVideoUnavailable(inputId: JString; reason: Integer); cdecl;
  end;
  TJTvView_TvInputCallback = class(TJavaGenericImport<JTvView_TvInputCallbackClass, JTvView_TvInputCallback>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAsyncPlayer', TypeInfo(Androidapi.JNI.Media.JAsyncPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioAttributes', TypeInfo(Androidapi.JNI.Media.JAudioAttributes));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioAttributes_Builder', TypeInfo(Androidapi.JNI.Media.JAudioAttributes_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioDeviceCallback', TypeInfo(Androidapi.JNI.Media.JAudioDeviceCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioDeviceInfo', TypeInfo(Androidapi.JNI.Media.JAudioDeviceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioFormat', TypeInfo(Androidapi.JNI.Media.JAudioFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioFormat_Builder', TypeInfo(Androidapi.JNI.Media.JAudioFormat_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager', TypeInfo(Androidapi.JNI.Media.JAudioManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioManager_OnAudioFocusChangeListener', TypeInfo(Androidapi.JNI.Media.JAudioManager_OnAudioFocusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord', TypeInfo(Androidapi.JNI.Media.JAudioRecord));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_Builder', TypeInfo(Androidapi.JNI.Media.JAudioRecord_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_OnRecordPositionUpdateListener', TypeInfo(Androidapi.JNI.Media.JAudioRecord_OnRecordPositionUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioRecord_OnRoutingChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioRecord_OnRoutingChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTimestamp', TypeInfo(Androidapi.JNI.Media.JAudioTimestamp));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack', TypeInfo(Androidapi.JNI.Media.JAudioTrack));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_Builder', TypeInfo(Androidapi.JNI.Media.JAudioTrack_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_OnPlaybackPositionUpdateListener', TypeInfo(Androidapi.JNI.Media.JAudioTrack_OnPlaybackPositionUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioTrack_OnRoutingChangedListener', TypeInfo(Androidapi.JNI.Media.JAudioTrack_OnRoutingChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCamcorderProfile', TypeInfo(Androidapi.JNI.Media.JCamcorderProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCameraProfile', TypeInfo(Androidapi.JNI.Media.JCameraProfile));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrmException', TypeInfo(Androidapi.JNI.Media.JMediaDrmException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JDeniedByServerException', TypeInfo(Androidapi.JNI.Media.JDeniedByServerException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JExifInterface', TypeInfo(Androidapi.JNI.Media.JExifInterface));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JFaceDetector', TypeInfo(Androidapi.JNI.Media.JFaceDetector));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JFaceDetector_Face', TypeInfo(Androidapi.JNI.Media.JFaceDetector_Face));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImage', TypeInfo(Androidapi.JNI.Media.JImage));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImage_Plane', TypeInfo(Androidapi.JNI.Media.JImage_Plane));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageReader', TypeInfo(Androidapi.JNI.Media.JImageReader));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageReader_OnImageAvailableListener', TypeInfo(Androidapi.JNI.Media.JImageReader_OnImageAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageWriter', TypeInfo(Androidapi.JNI.Media.JImageWriter));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JImageWriter_OnImageReleasedListener', TypeInfo(Androidapi.JNI.Media.JImageWriter_OnImageReleasedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JJetPlayer', TypeInfo(Androidapi.JNI.Media.JJetPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JJetPlayer_OnJetEventListener', TypeInfo(Androidapi.JNI.Media.JJetPlayer_OnJetEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaActionSound', TypeInfo(Androidapi.JNI.Media.JMediaActionSound));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec', TypeInfo(Androidapi.JNI.Media.JMediaCodec));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_BufferInfo', TypeInfo(Androidapi.JNI.Media.JMediaCodec_BufferInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_Callback', TypeInfo(Androidapi.JNI.Media.JMediaCodec_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_CodecException', TypeInfo(Androidapi.JNI.Media.JMediaCodec_CodecException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_CryptoException', TypeInfo(Androidapi.JNI.Media.JMediaCodec_CryptoException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_CryptoInfo', TypeInfo(Androidapi.JNI.Media.JMediaCodec_CryptoInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodec_OnFrameRenderedListener', TypeInfo(Androidapi.JNI.Media.JMediaCodec_OnFrameRenderedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_AudioCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_AudioCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_CodecCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_CodecCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_CodecProfileLevel', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_CodecProfileLevel));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_EncoderCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_EncoderCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecInfo_VideoCapabilities', TypeInfo(Androidapi.JNI.Media.JMediaCodecInfo_VideoCapabilities));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCodecList', TypeInfo(Androidapi.JNI.Media.JMediaCodecList));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCrypto', TypeInfo(Androidapi.JNI.Media.JMediaCrypto));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaCryptoException', TypeInfo(Androidapi.JNI.Media.JMediaCryptoException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDataSource', TypeInfo(Androidapi.JNI.Media.JMediaDataSource));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDescription', TypeInfo(Androidapi.JNI.Media.JMediaDescription));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDescription_Builder', TypeInfo(Androidapi.JNI.Media.JMediaDescription_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm', TypeInfo(Androidapi.JNI.Media.JMediaDrm));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_CryptoSession', TypeInfo(Androidapi.JNI.Media.JMediaDrm_CryptoSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_KeyRequest', TypeInfo(Androidapi.JNI.Media.JMediaDrm_KeyRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_KeyStatus', TypeInfo(Androidapi.JNI.Media.JMediaDrm_KeyStatus));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_MediaDrmStateException', TypeInfo(Androidapi.JNI.Media.JMediaDrm_MediaDrmStateException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnEventListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnExpirationUpdateListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnExpirationUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_OnKeyStatusChangeListener', TypeInfo(Androidapi.JNI.Media.JMediaDrm_OnKeyStatusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrm_ProvisionRequest', TypeInfo(Androidapi.JNI.Media.JMediaDrm_ProvisionRequest));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaDrmResetException', TypeInfo(Androidapi.JNI.Media.JMediaDrmResetException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaExtractor', TypeInfo(Androidapi.JNI.Media.JMediaExtractor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaFormat', TypeInfo(Androidapi.JNI.Media.JMediaFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jmedia_MediaMetadata', TypeInfo(Androidapi.JNI.Media.Jmedia_MediaMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadata_Builder', TypeInfo(Androidapi.JNI.Media.JMediaMetadata_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadataEditor', TypeInfo(Androidapi.JNI.Media.JMediaMetadataEditor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMetadataRetriever', TypeInfo(Androidapi.JNI.Media.JMediaMetadataRetriever));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMuxer', TypeInfo(Androidapi.JNI.Media.JMediaMuxer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaMuxer_OutputFormat', TypeInfo(Androidapi.JNI.Media.JMediaMuxer_OutputFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer', TypeInfo(Androidapi.JNI.Media.JMediaPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnBufferingUpdateListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnBufferingUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnCompletionListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnCompletionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnErrorListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnInfoListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnPreparedListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnPreparedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnSeekCompleteListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnSeekCompleteListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnTimedMetaDataAvailableListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnTimedMetaDataAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnTimedTextListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnTimedTextListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_OnVideoSizeChangedListener', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_OnVideoSizeChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaPlayer_TrackInfo', TypeInfo(Androidapi.JNI.Media.JMediaPlayer_TrackInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder', TypeInfo(Androidapi.JNI.Media.JMediaRecorder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_AudioEncoder', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_AudioEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_AudioSource', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_AudioSource));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_OnErrorListener', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_OnErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_OnInfoListener', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_OnInfoListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_OutputFormat', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_OutputFormat));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_VideoEncoder', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_VideoEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRecorder_VideoSource', TypeInfo(Androidapi.JNI.Media.JMediaRecorder_VideoSource));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter', TypeInfo(Androidapi.JNI.Media.JMediaRouter));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_Callback', TypeInfo(Androidapi.JNI.Media.JMediaRouter_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_RouteCategory', TypeInfo(Androidapi.JNI.Media.JMediaRouter_RouteCategory));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_RouteInfo', TypeInfo(Androidapi.JNI.Media.JMediaRouter_RouteInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_RouteGroup', TypeInfo(Androidapi.JNI.Media.JMediaRouter_RouteGroup));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_SimpleCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter_SimpleCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_UserRouteInfo', TypeInfo(Androidapi.JNI.Media.JMediaRouter_UserRouteInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaRouter_VolumeCallback', TypeInfo(Androidapi.JNI.Media.JMediaRouter_VolumeCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaScannerConnection', TypeInfo(Androidapi.JNI.Media.JMediaScannerConnection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaScannerConnection_OnScanCompletedListener', TypeInfo(Androidapi.JNI.Media.JMediaScannerConnection_OnScanCompletedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaScannerConnection_MediaScannerConnectionClient', TypeInfo(Androidapi.JNI.Media.JMediaScannerConnection_MediaScannerConnectionClient));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSync', TypeInfo(Androidapi.JNI.Media.JMediaSync));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSync_Callback', TypeInfo(Androidapi.JNI.Media.JMediaSync_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSync_OnErrorListener', TypeInfo(Androidapi.JNI.Media.JMediaSync_OnErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSyncEvent', TypeInfo(Androidapi.JNI.Media.JMediaSyncEvent));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaTimestamp', TypeInfo(Androidapi.JNI.Media.JMediaTimestamp));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JNotProvisionedException', TypeInfo(Androidapi.JNI.Media.JNotProvisionedException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackParams', TypeInfo(Androidapi.JNI.Media.JPlaybackParams));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRating', TypeInfo(Androidapi.JNI.Media.JRating));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_MetadataEditor', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_MetadataEditor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_OnGetPlaybackPositionListener', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_OnGetPlaybackPositionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_OnMetadataUpdateListener', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_OnMetadataUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteControlClient_OnPlaybackPositionUpdateListener', TypeInfo(Androidapi.JNI.Media.JRemoteControlClient_OnPlaybackPositionUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteController', TypeInfo(Androidapi.JNI.Media.JRemoteController));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteController_MetadataEditor', TypeInfo(Androidapi.JNI.Media.JRemoteController_MetadataEditor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRemoteController_OnClientUpdateListener', TypeInfo(Androidapi.JNI.Media.JRemoteController_OnClientUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JResourceBusyException', TypeInfo(Androidapi.JNI.Media.JResourceBusyException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRingtone', TypeInfo(Androidapi.JNI.Media.JRingtone));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JRingtoneManager', TypeInfo(Androidapi.JNI.Media.JRingtoneManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSoundPool', TypeInfo(Androidapi.JNI.Media.JSoundPool));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSoundPool_Builder', TypeInfo(Androidapi.JNI.Media.JSoundPool_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSoundPool_OnLoadCompleteListener', TypeInfo(Androidapi.JNI.Media.JSoundPool_OnLoadCompleteListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JSyncParams', TypeInfo(Androidapi.JNI.Media.JSyncParams));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JThumbnailUtils', TypeInfo(Androidapi.JNI.Media.JThumbnailUtils));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTimedMetaData', TypeInfo(Androidapi.JNI.Media.JTimedMetaData));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTimedText', TypeInfo(Androidapi.JNI.Media.JTimedText));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JToneGenerator', TypeInfo(Androidapi.JNI.Media.JToneGenerator));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JUnsupportedSchemeException', TypeInfo(Androidapi.JNI.Media.JUnsupportedSchemeException));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVolumeProvider', TypeInfo(Androidapi.JNI.Media.JVolumeProvider));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect', TypeInfo(Androidapi.JNI.Media.JAudioEffect));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAcousticEchoCanceler', TypeInfo(Androidapi.JNI.Media.JAcousticEchoCanceler));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect_Descriptor', TypeInfo(Androidapi.JNI.Media.JAudioEffect_Descriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect_OnControlStatusChangeListener', TypeInfo(Androidapi.JNI.Media.JAudioEffect_OnControlStatusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAudioEffect_OnEnableStatusChangeListener', TypeInfo(Androidapi.JNI.Media.JAudioEffect_OnEnableStatusChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JAutomaticGainControl', TypeInfo(Androidapi.JNI.Media.JAutomaticGainControl));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBassBoost', TypeInfo(Androidapi.JNI.Media.JBassBoost));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBassBoost_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JBassBoost_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JBassBoost_Settings', TypeInfo(Androidapi.JNI.Media.JBassBoost_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEnvironmentalReverb', TypeInfo(Androidapi.JNI.Media.JEnvironmentalReverb));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEnvironmentalReverb_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JEnvironmentalReverb_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEnvironmentalReverb_Settings', TypeInfo(Androidapi.JNI.Media.JEnvironmentalReverb_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEqualizer', TypeInfo(Androidapi.JNI.Media.JEqualizer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEqualizer_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JEqualizer_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEqualizer_Settings', TypeInfo(Androidapi.JNI.Media.JEqualizer_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JLoudnessEnhancer', TypeInfo(Androidapi.JNI.Media.JLoudnessEnhancer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JNoiseSuppressor', TypeInfo(Androidapi.JNI.Media.JNoiseSuppressor));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPresetReverb', TypeInfo(Androidapi.JNI.Media.JPresetReverb));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPresetReverb_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JPresetReverb_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPresetReverb_Settings', TypeInfo(Androidapi.JNI.Media.JPresetReverb_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVirtualizer', TypeInfo(Androidapi.JNI.Media.JVirtualizer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVirtualizer_OnParameterChangeListener', TypeInfo(Androidapi.JNI.Media.JVirtualizer_OnParameterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVirtualizer_Settings', TypeInfo(Androidapi.JNI.Media.JVirtualizer_Settings));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVisualizer', TypeInfo(Androidapi.JNI.Media.JVisualizer));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVisualizer_MeasurementPeakRms', TypeInfo(Androidapi.JNI.Media.JVisualizer_MeasurementPeakRms));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JVisualizer_OnDataCaptureListener', TypeInfo(Androidapi.JNI.Media.JVisualizer_OnDataCaptureListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser', TypeInfo(Androidapi.JNI.Media.JMediaBrowser));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_ConnectionCallback', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_ConnectionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_ItemCallback', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_ItemCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_MediaItem', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_MediaItem));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaBrowser_SubscriptionCallback', TypeInfo(Androidapi.JNI.Media.JMediaBrowser_SubscriptionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffect', TypeInfo(Androidapi.JNI.Media.JEffect));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffectContext', TypeInfo(Androidapi.JNI.Media.JEffectContext));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffectFactory', TypeInfo(Androidapi.JNI.Media.JEffectFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JEffectUpdateListener', TypeInfo(Androidapi.JNI.Media.JEffectUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDevice', TypeInfo(Androidapi.JNI.Media.JMidiDevice));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDevice_MidiConnection', TypeInfo(Androidapi.JNI.Media.JMidiDevice_MidiConnection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceInfo', TypeInfo(Androidapi.JNI.Media.JMidiDeviceInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceInfo_PortInfo', TypeInfo(Androidapi.JNI.Media.JMidiDeviceInfo_PortInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceService', TypeInfo(Androidapi.JNI.Media.JMidiDeviceService));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiDeviceStatus', TypeInfo(Androidapi.JNI.Media.JMidiDeviceStatus));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiReceiver', TypeInfo(Androidapi.JNI.Media.JMidiReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiInputPort', TypeInfo(Androidapi.JNI.Media.JMidiInputPort));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiManager', TypeInfo(Androidapi.JNI.Media.JMidiManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiManager_DeviceCallback', TypeInfo(Androidapi.JNI.Media.JMidiManager_DeviceCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiManager_OnDeviceOpenedListener', TypeInfo(Androidapi.JNI.Media.JMidiManager_OnDeviceOpenedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiSender', TypeInfo(Androidapi.JNI.Media.JMidiSender));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMidiOutputPort', TypeInfo(Androidapi.JNI.Media.JMidiOutputPort));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaProjection', TypeInfo(Androidapi.JNI.Media.JMediaProjection));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaProjection_Callback', TypeInfo(Androidapi.JNI.Media.JMediaProjection_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaProjectionManager', TypeInfo(Androidapi.JNI.Media.JMediaProjectionManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.Jsession_MediaController', TypeInfo(Androidapi.JNI.Media.Jsession_MediaController));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaController_Callback', TypeInfo(Androidapi.JNI.Media.JMediaController_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaController_PlaybackInfo', TypeInfo(Androidapi.JNI.Media.JMediaController_PlaybackInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaController_TransportControls', TypeInfo(Androidapi.JNI.Media.JMediaController_TransportControls));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession', TypeInfo(Androidapi.JNI.Media.JMediaSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession_Callback', TypeInfo(Androidapi.JNI.Media.JMediaSession_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession_QueueItem', TypeInfo(Androidapi.JNI.Media.JMediaSession_QueueItem));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSession_Token', TypeInfo(Androidapi.JNI.Media.JMediaSession_Token));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JMediaSessionManager_OnActiveSessionsChangedListener', TypeInfo(Androidapi.JNI.Media.JMediaSessionManager_OnActiveSessionsChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackState', TypeInfo(Androidapi.JNI.Media.JPlaybackState));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackState_Builder', TypeInfo(Androidapi.JNI.Media.JPlaybackState_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPlaybackState_CustomAction', TypeInfo(Androidapi.JNI.Media.JPlaybackState_CustomAction));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JCustomAction_Builder', TypeInfo(Androidapi.JNI.Media.JCustomAction_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContentRating', TypeInfo(Androidapi.JNI.Media.JTvContentRating));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract', TypeInfo(Androidapi.JNI.Media.JTvContract));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_BaseTvColumns', TypeInfo(Androidapi.JNI.Media.JTvContract_BaseTvColumns));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_Channels', TypeInfo(Androidapi.JNI.Media.JTvContract_Channels));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JChannels_Logo', TypeInfo(Androidapi.JNI.Media.JChannels_Logo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvContract_Programs', TypeInfo(Androidapi.JNI.Media.JTvContract_Programs));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JPrograms_Genres', TypeInfo(Androidapi.JNI.Media.JPrograms_Genres));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputInfo', TypeInfo(Androidapi.JNI.Media.JTvInputInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputManager', TypeInfo(Androidapi.JNI.Media.JTvInputManager));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputManager_TvInputCallback', TypeInfo(Androidapi.JNI.Media.JTvInputManager_TvInputCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService', TypeInfo(Androidapi.JNI.Media.JTvInputService));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService_Session', TypeInfo(Androidapi.JNI.Media.JTvInputService_Session));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvInputService_HardwareSession', TypeInfo(Androidapi.JNI.Media.JTvInputService_HardwareSession));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvTrackInfo', TypeInfo(Androidapi.JNI.Media.JTvTrackInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvTrackInfo_Builder', TypeInfo(Androidapi.JNI.Media.JTvTrackInfo_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView', TypeInfo(Androidapi.JNI.Media.JTvView));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView_OnUnhandledInputEventListener', TypeInfo(Androidapi.JNI.Media.JTvView_OnUnhandledInputEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView_TimeShiftPositionCallback', TypeInfo(Androidapi.JNI.Media.JTvView_TimeShiftPositionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Media.JTvView_TvInputCallback', TypeInfo(Androidapi.JNI.Media.JTvView_TvInputCallback));
end;

initialization
  RegisterTypes;
end.


