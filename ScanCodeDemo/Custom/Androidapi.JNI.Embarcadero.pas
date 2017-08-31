{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Embarcadero;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.AdMob,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Location,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.PlayServices,
  Androidapi.JNI.Util,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JFMXNativeActivity = interface;//com.embarcadero.firemonkey.FMXNativeActivity
  JFullScreenFSM_Callback = interface;//com.embarcadero.firemonkey.FMXNativeActivity$FullScreenFSM$Callback
  JOnActivityListener = interface;//com.embarcadero.firemonkey.OnActivityListener
  JViewStack = interface;//com.embarcadero.firemonkey.ViewStack
  JAddressBookObserver = interface;//com.embarcadero.firemonkey.addressbook.AddressBookObserver
  JOnAddressBookChangesListener = interface;//com.embarcadero.firemonkey.addressbook.OnAddressBookChangesListener
  JAdListenerAdapter = interface;//com.embarcadero.firemonkey.advertising.AdListenerAdapter
  JIAdListener = interface;//com.embarcadero.firemonkey.advertising.IAdListener
  JFMXBroadcastReceiver = interface;//com.embarcadero.firemonkey.broadcast.FMXBroadcastReceiver
  JFMXBroadcastReceiverListener = interface;//com.embarcadero.firemonkey.broadcast.FMXBroadcastReceiverListener
  JCamPreview = interface;//com.embarcadero.firemonkey.camerapreview.CamPreview
  JFMXDialogFactory = interface;//com.embarcadero.firemonkey.dialogs.FMXDialogFactory
  JFMXDialogHelpers = interface;//com.embarcadero.firemonkey.dialogs.FMXDialogHelpers
  JFMXDialogListener = interface;//com.embarcadero.firemonkey.dialogs.FMXDialogListener
  JFMXStandardDialog = interface;//com.embarcadero.firemonkey.dialogs.FMXStandardDialog
  JFMXDefaultStandardDialog = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultStandardDialog
  JFMXDefaultAlertDialog = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultAlertDialog
  JFMXDefaultDialogFactory = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultDialogFactory
  JFMXDefaultDialogFragment = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultDialogFragment
  JFMXDefaultInputQueryDialog = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultInputQueryDialog
  JFMXGingerbreadStandardDialog = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadStandardDialog
  JFMXGingerbreadAlertDialog = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadAlertDialog
  JFMXGingerbreadDialogFactory = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadDialogFactory
  JFMXGingerbreadInputQueryDialog = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadInputQueryDialog
  JJavaGeocoder = interface;//com.embarcadero.firemonkey.geocoder.JavaGeocoder
  JCameraChangeListener = interface;//com.embarcadero.firemonkey.maps.CameraChangeListener
  JCameraChangeListener_Callback = interface;//com.embarcadero.firemonkey.maps.CameraChangeListener$Callback
  JMapViewWithGestures = interface;//com.embarcadero.firemonkey.maps.MapViewWithGestures
  JFMXMediaLibrary = interface;//com.embarcadero.firemonkey.medialibrary.FMXMediaLibrary
  JFMXMediaLibraryListener = interface;//com.embarcadero.firemonkey.medialibrary.FMXMediaLibraryListener
  JMediaImage = interface;//com.embarcadero.firemonkey.medialibrary.MediaImage
  JMediaImage_ImageStorePlace = interface;//com.embarcadero.firemonkey.medialibrary.MediaImage$ImageStorePlace
  JSize = interface;//com.embarcadero.firemonkey.medialibrary.Size
  JUtils = interface;//com.embarcadero.firemonkey.medialibrary.Utils
  JNativeControlHost = interface;//com.embarcadero.firemonkey.nativelayout.NativeControlHost
  JNativeLayout = interface;//com.embarcadero.firemonkey.nativelayout.NativeLayout
  JBasePicker = interface;//com.embarcadero.firemonkey.pickers.BasePicker
  JBaseDateTimePicker = interface;//com.embarcadero.firemonkey.pickers.BaseDateTimePicker
  JBaseListPicker = interface;//com.embarcadero.firemonkey.pickers.BaseListPicker
  JBasePickersFactory = interface;//com.embarcadero.firemonkey.pickers.BasePickersFactory
  JGeneratorPickerID = interface;//com.embarcadero.firemonkey.pickers.GeneratorPickerID
  JOnDateTimeChangedListener = interface;//com.embarcadero.firemonkey.pickers.OnDateTimeChangedListener
  JOnItemChangedListener = interface;//com.embarcadero.firemonkey.pickers.OnItemChangedListener
  Jdefaults_DatePickerFragment = interface;//com.embarcadero.firemonkey.pickers.defaults.DatePickerFragment
  JDefaultDatePicker = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultDatePicker
  JDefaultListPicker = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultListPicker
  JDefaultPickersFactory = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultPickersFactory
  JDefaultTimePicker = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultTimePicker
  Jdefaults_ListPickerFragment = interface;//com.embarcadero.firemonkey.pickers.defaults.ListPickerFragment
  Jdefaults_TimePickerFragment = interface;//com.embarcadero.firemonkey.pickers.defaults.TimePickerFragment
  JGingerbreadDatePicker = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadDatePicker
  JGingerbreadListPicker = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadListPicker
  JGingerbreadPickersFactory = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadPickersFactory
  JGingerbreadTimePicker = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadTimePicker
  JIAPSecurity = interface;//com.embarcadero.firemonkey.purchasing.IAPSecurity
  JFMXTextEditorProxy = interface;//com.embarcadero.firemonkey.text.FMXTextEditorProxy
  JFMXTextEditorProxy_OnEnterActionListener = interface;//com.embarcadero.firemonkey.text.FMXTextEditorProxy$OnEnterActionListener
  JFMXTextListener = interface;//com.embarcadero.firemonkey.text.FMXTextListener
  JVKStateChangeListener = interface;//com.embarcadero.firemonkey.text.VKStateChangeListener
  JOnWebViewListener = interface;//com.embarcadero.firemonkey.webbrowser.OnWebViewListener
  JWebBrowser = interface;//com.embarcadero.firemonkey.webbrowser.WebBrowser
  JWebClient = interface;//com.embarcadero.firemonkey.webbrowser.WebClient
  //JProxyInterface = interface;//com.embarcadero.rtl.ProxyInterface
  JProxyService = interface;//com.embarcadero.rtl.ProxyService
  JRTLHandler = interface;//com.embarcadero.rtl.RTLHandler
  JRTLHandler_Listener = interface;//com.embarcadero.rtl.RTLHandler$Listener
  JRTLHandler_RTLSuperHandler = interface;//com.embarcadero.rtl.RTLHandler$RTLSuperHandler
  JNotificationAlarm = interface;//com.embarcadero.rtl.notifications.NotificationAlarm
  JNotificationInfo = interface;//com.embarcadero.rtl.notifications.NotificationInfo
  JNotificationPublisher = interface;//com.embarcadero.rtl.notifications.NotificationPublisher
  JRepeatInterval = interface;//com.embarcadero.rtl.notifications.RepeatInterval

// ===== Interface declarations =====

  JFMXNativeActivityClass = interface(JNativeActivityClass)
    ['{829C77FB-08F1-4D19-9782-3C58EEC12599}']
    {class} function init: JFMXNativeActivity; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/FMXNativeActivity')]
  JFMXNativeActivity = interface(JNativeActivity)
    ['{2FA559EC-D1D7-46AA-9C52-FEFC6B3E2DE3}']
    procedure OnMediaLibraryAccept; cdecl;
    procedure OnMediaLibraryCancel; cdecl;
    function addView(view: JView; params: JViewGroup_LayoutParams): Integer; cdecl;
    procedure applicationActivated; cdecl;
    procedure applicationDeactivated; cdecl;
    function dispatchKeyEvent(event: JKeyEvent): Boolean; cdecl;
    procedure embSetOrientation(orientationMask: Integer); cdecl;
    function getDeviceID: JString; cdecl;
    function getFMXMediaLibrary: JFMXMediaLibrary; cdecl;
    function getLastEvent: JKeyEvent; cdecl;
    function getNextPickerDialogId: Integer; cdecl;
    function getRawDisplaySize: JPoint; cdecl;
    function getStartupGCM: JBundle; cdecl;
    function getStatusBarVisibility: Boolean; cdecl;
    function getSystemUIVisibility: Boolean; cdecl;
    function getTextEditorProxy: JFMXTextEditorProxy; cdecl;
    function getViewGroup: JViewGroup; cdecl;
    function getViewStack: JViewStack; cdecl;
    procedure hideStatusBar; cdecl;
    procedure hideSystemUI; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onWindowFocusChanged(hasFocus: Boolean); cdecl;
    procedure receiveGCM(bundle: JBundle); cdecl;
    procedure registerIntentAction(action: JString); cdecl;
    procedure removeView(view: JView); cdecl;
    procedure removeViewAt(index: Integer); cdecl;
    procedure setListener(listener: JOnActivityListener); cdecl;
    procedure setNativeCallback(callback: JSurfaceHolder_Callback2); cdecl;
    procedure setStatusBarVisibility(visible: Boolean); cdecl;
    procedure setSystemUIVisibility(visible: Boolean); cdecl;
    procedure showDialog(id: Integer; dialog: JDialog); cdecl;
    procedure showStatusBar; cdecl;
    procedure showSystemUI; cdecl;
    procedure surfaceChanged(holder: JSurfaceHolder; format: Integer; w: Integer; h: Integer); cdecl;
    procedure surfaceCreated(holder: JSurfaceHolder); cdecl;
    procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl;
  end;
  TJFMXNativeActivity = class(TJavaGenericImport<JFMXNativeActivityClass, JFMXNativeActivity>) end;

  JFullScreenFSM_CallbackClass = interface(JObjectClass)
    ['{E8223F38-BC43-46FC-90C1-D74459FF39A2}']
    {class} function init: JFullScreenFSM_Callback; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/FMXNativeActivity$FullScreenFSM$Callback')]
  JFullScreenFSM_Callback = interface(JObject)
    ['{215A9DA2-A648-4ABD-A01A-C6578F7CCA44}']
  end;
  TJFullScreenFSM_Callback = class(TJavaGenericImport<JFullScreenFSM_CallbackClass, JFullScreenFSM_Callback>) end;

  JOnActivityListenerClass = interface(IJavaClass)
    ['{168F8C7B-7FE9-4A08-87AD-51CCC3C56E43}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/OnActivityListener')]
  JOnActivityListener = interface(IJavaInstance)
    ['{D0E0FCFB-0400-4522-B51E-220FC79F92BB}']
    procedure onCancelReceiveImage(requestCode: Integer); cdecl;
    procedure onReceiveImagePath(requestCode: Integer; fileName: JString); cdecl;
    procedure onReceiveNotification(intent: JIntent); cdecl;
    procedure onReceiveResult(requestCode: Integer; resultCode: Integer; intent: JIntent); cdecl;
  end;
  TJOnActivityListener = class(TJavaGenericImport<JOnActivityListenerClass, JOnActivityListener>) end;

  JViewStackClass = interface(JObjectClass)
    ['{267403CF-D226-4018-A570-BB92912191FF}']
    {class} function init(context: JContext): JViewStack; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/ViewStack')]
  JViewStack = interface(JObject)
    ['{33CF1A1F-1D75-43B4-90C7-8822DFA6D1FB}']
    procedure addView(view: JViewGroup); cdecl;
    procedure disableViews; cdecl;
    procedure removeView(view: JViewGroup); cdecl;
    procedure setPosition(view: JViewGroup; absoluteX: Integer; absoluteY: Integer); cdecl;
    procedure setSize(view: JViewGroup; absoluteWidth: Integer; absoluteHeight: Integer); cdecl;
  end;
  TJViewStack = class(TJavaGenericImport<JViewStackClass, JViewStack>) end;

  JAddressBookObserverClass = interface(JContentObserverClass)
    ['{6F4C5DCF-451B-484D-A8CC-AB0FBA10739B}']
    {class} function init(listener: JOnAddressBookChangesListener): JAddressBookObserver; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/addressbook/AddressBookObserver')]
  JAddressBookObserver = interface(JContentObserver)
    ['{1942AB70-72D9-4305-9E13-2D8653A90595}']
    procedure onChange(selfChange: Boolean); cdecl;
  end;
  TJAddressBookObserver = class(TJavaGenericImport<JAddressBookObserverClass, JAddressBookObserver>) end;

  JOnAddressBookChangesListenerClass = interface(IJavaClass)
    ['{3E1F45C0-439C-492D-8573-835A12251052}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/addressbook/OnAddressBookChangesListener')]
  JOnAddressBookChangesListener = interface(IJavaInstance)
    ['{07FE15E5-7885-430E-B161-2E339965B549}']
    procedure onChanged(selfChange: Boolean); cdecl;
  end;
  TJOnAddressBookChangesListener = class(TJavaGenericImport<JOnAddressBookChangesListenerClass, JOnAddressBookChangesListener>) end;

  JAdListenerAdapterClass = interface(JAdListenerClass)
    ['{CD2C5FBC-0887-4691-A942-FAEBDC43BC70}']
    {class} function init(listener: JIAdListener): JAdListenerAdapter; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/advertising/AdListenerAdapter')]
  JAdListenerAdapter = interface(JAdListener)
    ['{9711888A-C126-4ACF-9F3C-E0E946542342}']
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(errorCode: Integer); cdecl;
    procedure onAdLeftApplication; cdecl;
    procedure onAdLoaded; cdecl;
    procedure onAdOpened; cdecl;
  end;
  TJAdListenerAdapter = class(TJavaGenericImport<JAdListenerAdapterClass, JAdListenerAdapter>) end;

  JIAdListenerClass = interface(IJavaClass)
    ['{3E8BEED5-B092-42FA-96EB-E4C49A7A0E00}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/advertising/IAdListener')]
  JIAdListener = interface(IJavaInstance)
    ['{8E46C3D5-1846-458C-9FA4-EFC3DDCA705F}']
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(errorCode: Integer); cdecl;
    procedure onAdLeftApplication; cdecl;
    procedure onAdLoaded; cdecl;
    procedure onAdOpened; cdecl;
  end;
  TJIAdListener = class(TJavaGenericImport<JIAdListenerClass, JIAdListener>) end;

  JFMXBroadcastReceiverClass = interface(JBroadcastReceiverClass)
    ['{18E76E33-CD0C-4E7F-9DBE-F1B2EB9DEFD9}']
    {class} function init(listener: JFMXBroadcastReceiverListener): JFMXBroadcastReceiver; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/broadcast/FMXBroadcastReceiver')]
  JFMXBroadcastReceiver = interface(JBroadcastReceiver)
    ['{A84605C5-6CC0-4C17-AE5A-A7065C0E3C6A}']
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  TJFMXBroadcastReceiver = class(TJavaGenericImport<JFMXBroadcastReceiverClass, JFMXBroadcastReceiver>) end;

  JFMXBroadcastReceiverListenerClass = interface(IJavaClass)
    ['{9896B7DB-1D20-4C30-82BB-3B0CEF41280E}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/broadcast/FMXBroadcastReceiverListener')]
  JFMXBroadcastReceiverListener = interface(IJavaInstance)
    ['{8D356FEB-9F54-40C6-8E01-94603B4AB486}']
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  TJFMXBroadcastReceiverListener = class(TJavaGenericImport<JFMXBroadcastReceiverListenerClass, JFMXBroadcastReceiverListener>) end;

  JCamPreviewClass = interface(JSurfaceViewClass)
    ['{4A2F8A98-B8E3-4616-8E02-DA083EC4E2BA}']
    {class} function init(context: JContext): JCamPreview; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/camerapreview/CamPreview')]
  JCamPreview = interface(JSurfaceView)
    ['{09E012FD-099E-45F9-AC84-DDB431920646}']
    function _GetmCamera: JCamera; cdecl;
    procedure _SetmCamera(Value: JCamera); cdecl;
    procedure draw(canvas: JCanvas); cdecl;
    procedure surfaceChanged(holder: JSurfaceHolder; format: Integer; w: Integer; h: Integer); cdecl;
    procedure surfaceCreated(holder: JSurfaceHolder); cdecl;
    procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl;
    property mCamera: JCamera read _GetmCamera write _SetmCamera;
  end;
  TJCamPreview = class(TJavaGenericImport<JCamPreviewClass, JCamPreview>) end;

  JFMXDialogFactoryClass = interface(JObjectClass)
    ['{03FCA454-E214-41B1-93B2-66CEA875FF35}']
    {class} function init: JFMXDialogFactory; cdecl;
    {class} function getFactory: JFMXDialogFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXDialogFactory')]
  JFMXDialogFactory = interface(JObject)
    ['{F5811DCA-3A5F-4A62-A09D-0D53BB8A5814}']
    function createInputQueryDialog(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXStandardDialog; cdecl;
    function createMessageDialog(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXStandardDialog; cdecl;
  end;
  TJFMXDialogFactory = class(TJavaGenericImport<JFMXDialogFactoryClass, JFMXDialogFactory>) end;

  JFMXDialogHelpersClass = interface(JObjectClass)
    ['{7138130B-970C-447C-83D6-FE9A52C812A9}']
    {class} function init: JFMXDialogHelpers; cdecl;
    {class} procedure generateAlertDialog(activity: JFMXNativeActivity; builder: JAlertDialog_Builder; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer; fmxdialog: JFMXStandardDialog); cdecl;
    {class} function generateInputQuery(activity: JFMXNativeActivity; builder: JAlertDialog_Builder; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>; fmxdialog: JFMXStandardDialog): TJavaObjectArray<JEditText>; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXDialogHelpers')]
  JFMXDialogHelpers = interface(JObject)
    ['{A28D79BB-09AD-4173-B82E-A1FB140FA98F}']
  end;
  TJFMXDialogHelpers = class(TJavaGenericImport<JFMXDialogHelpersClass, JFMXDialogHelpers>) end;

  JFMXDialogListenerClass = interface(IJavaClass)
    ['{7C47781B-98A1-4A45-9F90-0B21A4A24FAC}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXDialogListener')]
  JFMXDialogListener = interface(IJavaInstance)
    ['{008E6099-5C9D-4FF3-9EDD-8AA87B6A52E2}']
    procedure onDialogClosed(modalResult: Integer; values: TJavaObjectArray<JString>); cdecl;
  end;
  TJFMXDialogListener = class(TJavaGenericImport<JFMXDialogListenerClass, JFMXDialogListener>) end;

  JFMXStandardDialogClass = interface(JObjectClass)
    ['{1A06AAF5-F5F5-48C0-89EE-65A1F061DA95}']
    {class} function init: JFMXStandardDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXStandardDialog')]
  JFMXStandardDialog = interface(JObject)
    ['{30C9BF38-AE9D-486A-AAD9-885BDF3CC53E}']
    function getListener: JFMXDialogListener; cdecl;
    function getModalResult: Integer; cdecl;
    function getRealDialog: JDialog; cdecl;
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setListener(listener: JFMXDialogListener); cdecl;
    procedure show; cdecl;
  end;
  TJFMXStandardDialog = class(TJavaGenericImport<JFMXStandardDialogClass, JFMXStandardDialog>) end;

  JFMXDefaultStandardDialogClass = interface(JFMXStandardDialogClass)
    ['{D0013B08-E351-49D6-964F-829964750FCE}']
    {class} function init(aActivity: JFMXNativeActivity): JFMXDefaultStandardDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultStandardDialog')]
  JFMXDefaultStandardDialog = interface(JFMXStandardDialog)
    ['{DE4F0684-2CCE-4683-8129-1A3670786BC8}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure show; cdecl;
  end;
  TJFMXDefaultStandardDialog = class(TJavaGenericImport<JFMXDefaultStandardDialogClass, JFMXDefaultStandardDialog>) end;

  JFMXDefaultAlertDialogClass = interface(JFMXDefaultStandardDialogClass)
    ['{03590861-A4BD-4AF8-AD1A-C68FE14F26EB}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXDefaultAlertDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultAlertDialog')]
  JFMXDefaultAlertDialog = interface(JFMXDefaultStandardDialog)
    ['{0A269919-5978-4AD4-BABE-6A576A886F78}']
  end;
  TJFMXDefaultAlertDialog = class(TJavaGenericImport<JFMXDefaultAlertDialogClass, JFMXDefaultAlertDialog>) end;

  JFMXDefaultDialogFactoryClass = interface(JFMXDialogFactoryClass)
    ['{C4CC93D3-CEC9-4DD0-B23D-8219344FB73D}']
    {class} function init: JFMXDefaultDialogFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultDialogFactory')]
  JFMXDefaultDialogFactory = interface(JFMXDialogFactory)
    ['{6453A528-226B-4C72-9762-694413D677FB}']
    function createInputQueryDialog(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXStandardDialog; cdecl;
    function createMessageDialog(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXStandardDialog; cdecl;
  end;
  TJFMXDefaultDialogFactory = class(TJavaGenericImport<JFMXDefaultDialogFactoryClass, JFMXDefaultDialogFactory>) end;

  JFMXDefaultDialogFragmentClass = interface(JDialogFragmentClass)
    ['{EDB8636C-4BCF-4366-AA83-2D897866C3E4}']
    {class} function init: JFMXDefaultDialogFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultDialogFragment')]
  JFMXDefaultDialogFragment = interface(JDialogFragment)
    ['{D224B738-0D7A-4E8C-ADF3-54CE72EF6756}']
    procedure onCreate(savedInstanceState: JBundle); cdecl;
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure setDialog(dialog: JFMXDefaultStandardDialog); cdecl;
  end;
  TJFMXDefaultDialogFragment = class(TJavaGenericImport<JFMXDefaultDialogFragmentClass, JFMXDefaultDialogFragment>) end;

  JFMXDefaultInputQueryDialogClass = interface(JFMXDefaultStandardDialogClass)
    ['{DBDAE8E2-BDCA-4EC0-A786-9EEE6B8CFCE1}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXDefaultInputQueryDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultInputQueryDialog')]
  JFMXDefaultInputQueryDialog = interface(JFMXDefaultStandardDialog)
    ['{C041BD5B-0A58-4CF1-8A91-B2B15DF013D7}']
    function getValues: TJavaObjectArray<JString>; cdecl;
  end;
  TJFMXDefaultInputQueryDialog = class(TJavaGenericImport<JFMXDefaultInputQueryDialogClass, JFMXDefaultInputQueryDialog>) end;

  JFMXGingerbreadStandardDialogClass = interface(JFMXStandardDialogClass)
    ['{BFDD344D-5113-4492-BC49-2F50AF5011F4}']
    {class} function init(aActivity: JFMXNativeActivity): JFMXGingerbreadStandardDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadStandardDialog')]
  JFMXGingerbreadStandardDialog = interface(JFMXStandardDialog)
    ['{63ECBF0C-7956-482E-AF9B-CEF3E9499A30}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setModalResult(result: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJFMXGingerbreadStandardDialog = class(TJavaGenericImport<JFMXGingerbreadStandardDialogClass, JFMXGingerbreadStandardDialog>) end;

  JFMXGingerbreadAlertDialogClass = interface(JFMXGingerbreadStandardDialogClass)
    ['{B382535A-0A9E-444F-A236-D87E9AE8AF83}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXGingerbreadAlertDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadAlertDialog')]
  JFMXGingerbreadAlertDialog = interface(JFMXGingerbreadStandardDialog)
    ['{7D2005B6-A6C8-4023-9B95-564602535997}']
  end;
  TJFMXGingerbreadAlertDialog = class(TJavaGenericImport<JFMXGingerbreadAlertDialogClass, JFMXGingerbreadAlertDialog>) end;

  JFMXGingerbreadDialogFactoryClass = interface(JFMXDialogFactoryClass)
    ['{E90B4670-3F25-42AC-9BB7-0626BABF255B}']
    {class} function init: JFMXGingerbreadDialogFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadDialogFactory')]
  JFMXGingerbreadDialogFactory = interface(JFMXDialogFactory)
    ['{536BFE48-7FEB-4EB0-84FD-A498DFA4A519}']
    function createInputQueryDialog(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXStandardDialog; cdecl;
    function createMessageDialog(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXStandardDialog; cdecl;
  end;
  TJFMXGingerbreadDialogFactory = class(TJavaGenericImport<JFMXGingerbreadDialogFactoryClass, JFMXGingerbreadDialogFactory>) end;

  JFMXGingerbreadInputQueryDialogClass = interface(JFMXGingerbreadStandardDialogClass)
    ['{4C88CE24-90DD-48CE-B1EE-DEFF0B33C356}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXGingerbreadInputQueryDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadInputQueryDialog')]
  JFMXGingerbreadInputQueryDialog = interface(JFMXGingerbreadStandardDialog)
    ['{1BFFEFCE-7D05-4A0A-8620-4939B63D6606}']
    function getValues: TJavaObjectArray<JString>; cdecl;
  end;
  TJFMXGingerbreadInputQueryDialog = class(TJavaGenericImport<JFMXGingerbreadInputQueryDialogClass, JFMXGingerbreadInputQueryDialog>) end;

  JJavaGeocoderClass = interface(JObjectClass)
    ['{DC6EC615-5DEF-4BFC-88A7-FA31017D974B}']
    {class} function init(Con: JContext): JJavaGeocoder; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/geocoder/JavaGeocoder')]
  JJavaGeocoder = interface(JObject)
    ['{A6AF9F65-04F2-4AE6-A75A-ABE841B23DD2}']
    function _GetInstanceOfGeocoder: JGeocoder; cdecl;
    procedure _SetInstanceOfGeocoder(Value: JGeocoder); cdecl;
    property InstanceOfGeocoder: JGeocoder read _GetInstanceOfGeocoder write _SetInstanceOfGeocoder;
  end;
  TJJavaGeocoder = class(TJavaGenericImport<JJavaGeocoderClass, JJavaGeocoder>) end;

  JCameraChangeListenerClass = interface(JObjectClass)
    ['{F4FEB220-69F8-42F6-B16C-8EE14637E5E8}']
    {class} function init: JCameraChangeListener; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/CameraChangeListener')]
  JCameraChangeListener = interface(JObject)
    ['{77995FF0-3B8E-4B7E-96DB-DD36E3359227}']
    function getBearing: Single; cdecl;
    function getLatitude: Double; cdecl;
    function getLongitude: Double; cdecl;
    function getTilt: Single; cdecl;
    function getZoom: Single; cdecl;
    procedure onCameraChange(position: JCameraPosition); cdecl;
    procedure setCallback(callback: JCameraChangeListener_Callback); cdecl;
  end;
  TJCameraChangeListener = class(TJavaGenericImport<JCameraChangeListenerClass, JCameraChangeListener>) end;

  JCameraChangeListener_CallbackClass = interface(IJavaClass)
    ['{B967D9A3-3A71-43F2-8603-7198391440EF}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/CameraChangeListener$Callback')]
  JCameraChangeListener_Callback = interface(IJavaInstance)
    ['{6EBC7047-A849-46A4-B610-B453B3876038}']
    procedure onCameraChange(listener: JCameraChangeListener); cdecl;
  end;
  TJCameraChangeListener_Callback = class(TJavaGenericImport<JCameraChangeListener_CallbackClass, JCameraChangeListener_Callback>) end;

  JMapViewWithGesturesClass = interface(JMapViewClass)
    ['{1C7E8661-598A-495E-B93F-F7F8ABFDE659}']
    {class} function init(context: JContext; options: JGoogleMapOptions): JMapViewWithGestures; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/MapViewWithGestures')]
  JMapViewWithGestures = interface(JMapView)
    ['{619B12B4-6B8D-4FF0-B1E6-89E864F0C073}']
    function dispatchTouchEvent(ev: JMotionEvent): Boolean; cdecl;
    function getGestureDetector: JGestureDetector; cdecl;
  end;
  TJMapViewWithGestures = class(TJavaGenericImport<JMapViewWithGesturesClass, JMapViewWithGestures>) end;

  JFMXMediaLibraryClass = interface(JObjectClass)
    ['{66D17071-77BC-4881-9546-0F803D781E41}']
    {class} function _GetACTION_CROP_IMAGE: Integer; cdecl;
    {class} function _GetACTION_TAKE_IMAGE_FROM_CAMERA: Integer; cdecl;
    {class} function _GetACTION_TAKE_IMAGE_FROM_LIBRARY: Integer; cdecl;
    {class} function init(activity: JActivity): JFMXMediaLibrary; cdecl;
    {class} function isRequestForTakingImage(requestCode: Integer): Boolean; cdecl;
    {class} property ACTION_CROP_IMAGE: Integer read _GetACTION_CROP_IMAGE;
    {class} property ACTION_TAKE_IMAGE_FROM_CAMERA: Integer read _GetACTION_TAKE_IMAGE_FROM_CAMERA;
    {class} property ACTION_TAKE_IMAGE_FROM_LIBRARY: Integer read _GetACTION_TAKE_IMAGE_FROM_LIBRARY;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/FMXMediaLibrary')]
  JFMXMediaLibrary = interface(JObject)
    ['{FA55B1EF-8E7E-4D22-B835-14F0B0B4C375}']
    function getLastPhotoName: JString; cdecl;
    procedure handleTakingPhotoRequest(data: JIntent; requestCode: Integer); cdecl;
    procedure onRestoreInstanceState(savedInstanceState: JBundle); cdecl;
    procedure onSaveInstanceState(outState: JBundle); cdecl;
    procedure setListener(listener: JFMXMediaLibraryListener); cdecl;
    procedure takeImageFromCamera(maxWidth: Integer; maxHeight: Integer; editable: Boolean; needSaveToAlbum: Boolean); cdecl;
    procedure takeImageFromLibrary(maxWidth: Integer; maxHeight: Integer; editable: Boolean); cdecl;
  end;
  TJFMXMediaLibrary = class(TJavaGenericImport<JFMXMediaLibraryClass, JFMXMediaLibrary>) end;

  JFMXMediaLibraryListenerClass = interface(IJavaClass)
    ['{A9A14D40-E569-4D87-AA19-6759376B8E85}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/FMXMediaLibraryListener')]
  JFMXMediaLibraryListener = interface(IJavaInstance)
    ['{A74DD810-7822-4CD1-A67A-ED471D7F136F}']
    procedure OnMediaLibraryAccept; cdecl;
    procedure OnMediaLibraryCancel; cdecl;
  end;
  TJFMXMediaLibraryListener = class(TJavaGenericImport<JFMXMediaLibraryListenerClass, JFMXMediaLibraryListener>) end;

  JMediaImageClass = interface(JObjectClass)
    ['{F9A004A1-D818-4044-BB22-2BEF9964DDE9}']
    {class} function init(activity: JActivity): JMediaImage; cdecl; overload;
    {class} function init(activity: JActivity; imageType: JMediaImage_ImageStorePlace): JMediaImage; cdecl; overload;
    {class} function loadFromUri(activity: JActivity; imageUri: Jnet_Uri; requiredSize: JSize): JMediaImage; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/MediaImage')]
  JMediaImage = interface(JObject)
    ['{EBFB1830-3743-4322-841B-D229E5E28806}']
    procedure addPhotoToGallery; cdecl;
    function cropImage(selectedUri: Jnet_Uri): Boolean; cdecl;
    function getFileName: JString; cdecl;
    function getFileUri: Jnet_Uri; cdecl;
    function getRotationAngle: Integer; cdecl;
    function isFileExists: Boolean; cdecl;
    function isImageLoaded: Boolean; cdecl;
    procedure loadFromFile(requiredSize: JSize); cdecl; overload;
    procedure loadFromFile(fileName: JString; requiredSize: JSize); cdecl; overload;
    procedure normalizeOrientation; cdecl;
    procedure remove; cdecl;
    procedure saveToFile; cdecl;
    procedure saveToTempFile; cdecl;
    procedure unloadBitmap; cdecl;
  end;
  TJMediaImage = class(TJavaGenericImport<JMediaImageClass, JMediaImage>) end;

  JMediaImage_ImageStorePlaceClass = interface(JEnumClass)
    ['{E72870F7-4E76-4F02-B1BA-443154EC4CC1}']
    {class} function _GetCACHE: JMediaImage_ImageStorePlace; cdecl;
    {class} function _GetCAMERA_PHOTO: JMediaImage_ImageStorePlace; cdecl;
    {class} function valueOf(name: JString): JMediaImage_ImageStorePlace; cdecl;
    {class} function values: TJavaObjectArray<JMediaImage_ImageStorePlace>; cdecl;
    {class} property CACHE: JMediaImage_ImageStorePlace read _GetCACHE;
    {class} property CAMERA_PHOTO: JMediaImage_ImageStorePlace read _GetCAMERA_PHOTO;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/MediaImage$ImageStorePlace')]
  JMediaImage_ImageStorePlace = interface(JEnum)
    ['{23112798-8591-41BA-8411-BB8E4FF83766}']
  end;
  TJMediaImage_ImageStorePlace = class(TJavaGenericImport<JMediaImage_ImageStorePlaceClass, JMediaImage_ImageStorePlace>) end;

  JSizeClass = interface(JObjectClass)
    ['{504D8D1C-33C2-4616-B8A3-103EB98A0F3E}']
    {class} function init(width: Integer; height: Integer): JSize; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/Size')]
  JSize = interface(JObject)
    ['{8555E68B-9EA9-4F02-8DEE-89A9666DD7EB}']
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
  end;
  TJSize = class(TJavaGenericImport<JSizeClass, JSize>) end;

  JUtilsClass = interface(JObjectClass)
    ['{AA250306-1C54-4F37-BDE4-BF311C544025}']
    {class} function init: JUtils; cdecl;
    {class} function copyStream(input: JInputStream; output: JOutputStream): Integer; cdecl;
    {class} function getAlbumDir(albumName: JString): JFile; cdecl;
    {class} function getPhotosDir: JFile; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/Utils')]
  JUtils = interface(JObject)
    ['{0B0C8119-2A9F-480F-AE06-E17CE12DE684}']
  end;
  TJUtils = class(TJavaGenericImport<JUtilsClass, JUtils>) end;

  JNativeControlHostClass = interface(JObjectClass)
    ['{BAF9E1C5-7EBD-46AC-9B3B-BCE1C353E5FE}']
    {class} function init(context: JContext): JNativeControlHost; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/nativelayout/NativeControlHost')]
  JNativeControlHost = interface(JObject)
    ['{E6589CE6-E4BF-4A09-833B-0AF754D4E580}']
    function getView: JView; cdecl;
    procedure setControl(view: JView); cdecl;
    procedure setFocus(newFocusState: Boolean); cdecl;
    procedure setFocusable(focusable: Boolean); cdecl;
    procedure setPosition(absoluteX: Integer; absoluteY: Integer); cdecl;
    procedure setSize(absoluteWidth: Integer; absoluteHeight: Integer); cdecl;
  end;
  TJNativeControlHost = class(TJavaGenericImport<JNativeControlHostClass, JNativeControlHost>) end;

  JNativeLayoutClass = interface(JObjectClass)
    ['{199D9A89-2415-4FFA-8BF5-92EABBD883CE}']
    {class} function init(Con: JContext; Token: JIBinder): JNativeLayout; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/nativelayout/NativeLayout')]
  JNativeLayout = interface(JObject)
    ['{3D369CB4-4A09-4C30-8D92-9BA198957802}']
    procedure setControl(view: JView); cdecl;
    procedure setFocus(newFocusState: Boolean); cdecl;
    procedure setOnFocusChangeListener(listener: JView_OnFocusChangeListener); cdecl;
    procedure setPosition(absoluteX: Integer; absoluteY: Integer); cdecl;
    procedure setSize(absoluteWidth: Integer; absoluteHeight: Integer); cdecl;
  end;
  TJNativeLayout = class(TJavaGenericImport<JNativeLayoutClass, JNativeLayout>) end;

  JBasePickerClass = interface(JObjectClass)
    ['{9F35AC6E-96AD-4E73-BFC2-23B3ACB3F01E}']
    {class} function init: JBasePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BasePicker')]
  JBasePicker = interface(JObject)
    ['{FB1961D2-65AB-4224-B8D9-2D48AA436652}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJBasePicker = class(TJavaGenericImport<JBasePickerClass, JBasePicker>) end;

  JBaseDateTimePickerClass = interface(JBasePickerClass)
    ['{AEF4DB42-B726-4D97-923F-EBACCD26AE68}']
    {class} function init: JBaseDateTimePicker; cdecl;
    {class} function getGMTTimeZone: JTimeZone; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BaseDateTimePicker')]
  JBaseDateTimePicker = interface(JBasePicker)
    ['{93D09E24-E245-43DE-B992-77C7BB27C672}']
    function getDate: JDate; cdecl;
    function getTime: JDate; cdecl;
    function hasListener: Boolean; cdecl;
    procedure setDate(timeInMillis: Int64); cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
  end;
  TJBaseDateTimePicker = class(TJavaGenericImport<JBaseDateTimePickerClass, JBaseDateTimePicker>) end;

  JBaseListPickerClass = interface(JBasePickerClass)
    ['{960A0BD3-E971-4206-B089-ED555BA8F736}']
    {class} function init: JBaseListPicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BaseListPicker')]
  JBaseListPicker = interface(JBasePicker)
    ['{E7D99458-E717-4FDB-8CEB-8288A81AC9B4}']
    function hasListener: Boolean; cdecl;
    procedure setItemIndex(itemIndex: Integer); cdecl;
    procedure setItems(items: TJavaObjectArray<JCharSequence>); cdecl;
    procedure setListener(listener: JOnItemChangedListener); cdecl;
  end;
  TJBaseListPicker = class(TJavaGenericImport<JBaseListPickerClass, JBaseListPicker>) end;

  JBasePickersFactoryClass = interface(JObjectClass)
    ['{235431A6-84D7-48A1-9194-9A44E118294E}']
    {class} function init: JBasePickersFactory; cdecl;
    {class} function getFactory: JBasePickersFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BasePickersFactory')]
  JBasePickersFactory = interface(JObject)
    ['{F192F199-A07C-41CC-A4A4-8DCC857B26EA}']
    function createDatePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
    function createListPicker(activity: JFMXNativeActivity): JBaseListPicker; cdecl;
    function createTimePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
  end;
  TJBasePickersFactory = class(TJavaGenericImport<JBasePickersFactoryClass, JBasePickersFactory>) end;

  JGeneratorPickerIDClass = interface(JObjectClass)
    ['{311AD0A1-F9EC-484D-B7D6-AEC67E5BFC55}']
    {class} function init: JGeneratorPickerID; cdecl;
    {class} function getUniqueID: Integer; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/GeneratorPickerID')]
  JGeneratorPickerID = interface(JObject)
    ['{3FE9FE79-740A-4D21-AE66-E8C9C2F0517F}']
  end;
  TJGeneratorPickerID = class(TJavaGenericImport<JGeneratorPickerIDClass, JGeneratorPickerID>) end;

  JOnDateTimeChangedListenerClass = interface(IJavaClass)
    ['{6253D5BE-9035-4894-B479-2B91B1496180}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/OnDateTimeChangedListener')]
  JOnDateTimeChangedListener = interface(IJavaInstance)
    ['{3BE7DC7B-92F9-4B5D-BBC4-B49FAE5CE96E}']
    procedure onDateChanged(date: JDate); cdecl;
    procedure onHide; cdecl;
    procedure onShow; cdecl;
  end;
  TJOnDateTimeChangedListener = class(TJavaGenericImport<JOnDateTimeChangedListenerClass, JOnDateTimeChangedListener>) end;

  JOnItemChangedListenerClass = interface(IJavaClass)
    ['{1A8B5BC7-25C3-43B9-9E0E-B144BDC49CC5}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/OnItemChangedListener')]
  JOnItemChangedListener = interface(IJavaInstance)
    ['{BC0BDDA3-53FD-4BA8-9E3D-B17F647345C6}']
    procedure onHide; cdecl;
    procedure onItemChanged(itemIndex: Integer); cdecl;
    procedure onShow; cdecl;
  end;
  TJOnItemChangedListener = class(TJavaGenericImport<JOnItemChangedListenerClass, JOnItemChangedListener>) end;

  Jdefaults_DatePickerFragmentClass = interface(JDialogFragmentClass)
    ['{BA993453-9297-45B2-B496-33DF58EC656E}']
    {class} function init(year: Integer; month: Integer; day: Integer): Jdefaults_DatePickerFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DatePickerFragment')]
  Jdefaults_DatePickerFragment = interface(JDialogFragment)
    ['{1E90BA78-2E8D-409C-9D3E-674B9C51E129}']
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onDateSet(view: JDatePicker; year: Integer; month: Integer; day: Integer); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setDate(year: Integer; month: Integer; day: Integer); cdecl;
    procedure setHasDateConstraints(hasDateConstraints: Boolean); cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setMaxDate(date: JDate); cdecl;
    procedure setMinDate(date: JDate); cdecl;
    procedure setTheme(theme: Integer); cdecl;
  end;
  TJdefaults_DatePickerFragment = class(TJavaGenericImport<Jdefaults_DatePickerFragmentClass, Jdefaults_DatePickerFragment>) end;

  JDefaultDatePickerClass = interface(JBaseDateTimePickerClass)
    ['{4D36CFEF-1AD9-4C50-8992-32E13346574D}']
    {class} function init(activity: JFMXNativeActivity): JDefaultDatePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultDatePicker')]
  JDefaultDatePicker = interface(JBaseDateTimePicker)
    ['{E5CB7805-4603-44A2-A088-2F0D03E061ED}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJDefaultDatePicker = class(TJavaGenericImport<JDefaultDatePickerClass, JDefaultDatePicker>) end;

  JDefaultListPickerClass = interface(JBaseListPickerClass)
    ['{926BA109-6E51-43DD-A672-75FB33576476}']
    {class} function init(activity: JFMXNativeActivity): JDefaultListPicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultListPicker')]
  JDefaultListPicker = interface(JBaseListPicker)
    ['{15AE1BAA-54EF-42B3-B032-BFE66A11ED01}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setItemIndex(itemIndex: Integer); cdecl;
    procedure setItems(items: TJavaObjectArray<JCharSequence>); cdecl;
    procedure setListener(listener: JOnItemChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJDefaultListPicker = class(TJavaGenericImport<JDefaultListPickerClass, JDefaultListPicker>) end;

  JDefaultPickersFactoryClass = interface(JBasePickersFactoryClass)
    ['{87462100-5B6E-4DAE-B264-A8FC84E3AB3E}']
    {class} function init: JDefaultPickersFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultPickersFactory')]
  JDefaultPickersFactory = interface(JBasePickersFactory)
    ['{FD970141-B89F-4A1E-8781-A3D6A5C0DB67}']
    function createDatePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
    function createListPicker(activity: JFMXNativeActivity): JBaseListPicker; cdecl;
    function createTimePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
  end;
  TJDefaultPickersFactory = class(TJavaGenericImport<JDefaultPickersFactoryClass, JDefaultPickersFactory>) end;

  JDefaultTimePickerClass = interface(JBaseDateTimePickerClass)
    ['{F58D42AA-5303-40D1-9A50-EFA6079B6B70}']
    {class} function init(activity: JFMXNativeActivity): JDefaultTimePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultTimePicker')]
  JDefaultTimePicker = interface(JBaseDateTimePicker)
    ['{52F03A05-2EF3-4114-A5E6-D3B2FF4E4BBC}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJDefaultTimePicker = class(TJavaGenericImport<JDefaultTimePickerClass, JDefaultTimePicker>) end;

  Jdefaults_ListPickerFragmentClass = interface(JDialogFragmentClass)
    ['{E96F3E38-4949-4F21-B722-AD1AA5968AEB}']
    {class} function init: Jdefaults_ListPickerFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/ListPickerFragment')]
  Jdefaults_ListPickerFragment = interface(JDialogFragment)
    ['{FBCD51E2-88FE-4962-B0A4-5CE647E66659}']
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onStart; cdecl;
    procedure setTheme(theme: Integer); cdecl;
  end;
  TJdefaults_ListPickerFragment = class(TJavaGenericImport<Jdefaults_ListPickerFragmentClass, Jdefaults_ListPickerFragment>) end;

  Jdefaults_TimePickerFragmentClass = interface(JDialogFragmentClass)
    ['{1DF31EF0-1207-48B7-8AF2-B892DD120EFB}']
    {class} function init(hour: Integer; min: Integer): Jdefaults_TimePickerFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/TimePickerFragment')]
  Jdefaults_TimePickerFragment = interface(JDialogFragment)
    ['{FA22FC03-0530-463C-8612-59B2266C92EC}']
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onTimeSet(view: JTimePicker; hourOfDay: Integer; minute: Integer); cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure setTime(hour: Integer; min: Integer); cdecl;
  end;
  TJdefaults_TimePickerFragment = class(TJavaGenericImport<Jdefaults_TimePickerFragmentClass, Jdefaults_TimePickerFragment>) end;

  JGingerbreadDatePickerClass = interface(JBaseDateTimePickerClass)
    ['{A14AF85E-0CC0-4DF1-B360-D096D9427D33}']
    {class} function init(activity: JFMXNativeActivity): JGingerbreadDatePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadDatePicker')]
  JGingerbreadDatePicker = interface(JBaseDateTimePicker)
    ['{DE11CE3A-2581-4854-8157-81D430D63BD7}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure onDateSet(view: JDatePicker; year: Integer; monthOfYear: Integer; dayOfMonth: Integer); cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onShow(dialog: JDialogInterface); cdecl;
    procedure show; cdecl;
  end;
  TJGingerbreadDatePicker = class(TJavaGenericImport<JGingerbreadDatePickerClass, JGingerbreadDatePicker>) end;

  JGingerbreadListPickerClass = interface(JBaseListPickerClass)
    ['{8DE518CE-091A-4B4D-A35F-52C33B2B6D47}']
    {class} function init(activity: JFMXNativeActivity): JGingerbreadListPicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadListPicker')]
  JGingerbreadListPicker = interface(JBaseListPicker)
    ['{452F008C-4501-472B-8DA7-D97B6A01363B}']
    procedure createNativePicker; cdecl;
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onShow(dialog: JDialogInterface); cdecl;
    procedure show; cdecl;
  end;
  TJGingerbreadListPicker = class(TJavaGenericImport<JGingerbreadListPickerClass, JGingerbreadListPicker>) end;

  JGingerbreadPickersFactoryClass = interface(JBasePickersFactoryClass)
    ['{7CED6A47-AF36-4331-8767-F10B3BB26AC2}']
    {class} function init: JGingerbreadPickersFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadPickersFactory')]
  JGingerbreadPickersFactory = interface(JBasePickersFactory)
    ['{D8997335-A78B-4ED6-BCA6-BFD161D27DEB}']
    function createDatePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
    function createListPicker(activity: JFMXNativeActivity): JBaseListPicker; cdecl;
    function createTimePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
  end;
  TJGingerbreadPickersFactory = class(TJavaGenericImport<JGingerbreadPickersFactoryClass, JGingerbreadPickersFactory>) end;

  JGingerbreadTimePickerClass = interface(JBaseDateTimePickerClass)
    ['{F8FA1BFD-468B-4BC0-8641-00477AF10DA9}']
    {class} function init(activity: JFMXNativeActivity): JGingerbreadTimePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadTimePicker')]
  JGingerbreadTimePicker = interface(JBaseDateTimePicker)
    ['{6E8FEB86-AE04-4A87-A497-0DFA1EB267D7}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onShow(dialog: JDialogInterface); cdecl;
    procedure onTimeSet(view: JTimePicker; hourOfDay: Integer; minute: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJGingerbreadTimePicker = class(TJavaGenericImport<JGingerbreadTimePickerClass, JGingerbreadTimePicker>) end;

  JIAPSecurityClass = interface(JObjectClass)
    ['{D3239720-8053-483A-8E21-6B866406B512}']
    {class} function init: JIAPSecurity; cdecl;
    {class} function verifyPurchase(base64PublicKey: JString; signedData: JString; signature: JString): Boolean; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/purchasing/IAPSecurity')]
  JIAPSecurity = interface(JObject)
    ['{288E1DF2-92BC-4F89-808A-A3EF90C77280}']
  end;
  TJIAPSecurity = class(TJavaGenericImport<JIAPSecurityClass, JIAPSecurity>) end;

  JFMXTextEditorProxyClass = interface(JViewClass)
    ['{A014F8A2-06B4-4AF7-B077-52980F566B5E}']
    {class} function _GetACTION_DONE: Integer; cdecl;
    {class} function _GetACTION_ENTER: Integer; cdecl;
    {class} function _GetACTION_GO: Integer; cdecl;
    {class} function _GetACTION_NEXT: Integer; cdecl;
    {class} function _GetACTION_SEARCH: Integer; cdecl;
    {class} function _GetACTION_SEND: Integer; cdecl;
    {class} function _GetINPUT_ALPHABET: Integer; cdecl;
    {class} function _GetINPUT_EMAIL_ADDRESS: Integer; cdecl;
    {class} function _GetINPUT_NAME_PHONE_PAD: Integer; cdecl;
    {class} function _GetINPUT_NUMBER: Integer; cdecl;
    {class} function _GetINPUT_NUMBER_AND_PUNCTUATION: Integer; cdecl;
    {class} function _GetINPUT_PHONE: Integer; cdecl;
    {class} function _GetINPUT_TEXT: Integer; cdecl;
    {class} function _GetINPUT_URL: Integer; cdecl;
    {class} function init(context: JContext): JFMXTextEditorProxy; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JFMXTextEditorProxy; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JFMXTextEditorProxy; cdecl; overload;
    {class} property ACTION_DONE: Integer read _GetACTION_DONE;
    {class} property ACTION_ENTER: Integer read _GetACTION_ENTER;
    {class} property ACTION_GO: Integer read _GetACTION_GO;
    {class} property ACTION_NEXT: Integer read _GetACTION_NEXT;
    {class} property ACTION_SEARCH: Integer read _GetACTION_SEARCH;
    {class} property ACTION_SEND: Integer read _GetACTION_SEND;
    {class} property INPUT_ALPHABET: Integer read _GetINPUT_ALPHABET;
    {class} property INPUT_EMAIL_ADDRESS: Integer read _GetINPUT_EMAIL_ADDRESS;
    {class} property INPUT_NAME_PHONE_PAD: Integer read _GetINPUT_NAME_PHONE_PAD;
    {class} property INPUT_NUMBER: Integer read _GetINPUT_NUMBER;
    {class} property INPUT_NUMBER_AND_PUNCTUATION: Integer read _GetINPUT_NUMBER_AND_PUNCTUATION;
    {class} property INPUT_PHONE: Integer read _GetINPUT_PHONE;
    {class} property INPUT_TEXT: Integer read _GetINPUT_TEXT;
    {class} property INPUT_URL: Integer read _GetINPUT_URL;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/FMXTextEditorProxy')]
  JFMXTextEditorProxy = interface(JView)
    ['{667444A4-E8C6-4FFD-ABC5-69B426278BFA}']
    procedure addOnVKStateChangeListener(vkListener: JVKStateChangeListener); cdecl;
    procedure addTextListener(textListener: JFMXTextListener); cdecl;
    procedure allowRestart; cdecl;
    procedure checkSpanMerge; cdecl;
    procedure copySelectedText; cdecl;
    procedure cutSelectedText; cdecl;
    function getCursorPosition: Integer; cdecl;
    function getEditable: JEditable; cdecl;
    function getSelectionEnd: Integer; cdecl;
    function getSelectionStart: Integer; cdecl;
    function getText: JCharSequence; cdecl;
    function onCheckIsTextEditor: Boolean; cdecl;
    function onCreateInputConnection(outAttrs: JEditorInfo): JInputConnection; cdecl;
    function onKeyDown(keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
    procedure onRestoreInstanceState(state: JParcelable); cdecl;
    function onSaveInstanceState: JParcelable; cdecl;
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
    function packText(editable: JSpannable): JCharSequence; cdecl;
    procedure pasteText; cdecl;
    procedure removeOnVKStateChangeListener(vkListener: JVKStateChangeListener); cdecl;
    procedure removeTextListener(textListener: JFMXTextListener); cdecl;
    procedure sendOnComposingText(begin_: Integer; end_: Integer); cdecl;
    procedure sendOnTextUpdated(text: JCharSequence; position: Integer); cdecl;
    procedure sendSkipKeyEvent(event: JKeyEvent); cdecl;
    procedure setCursorPosition(position: Integer); cdecl;
    procedure setEnterAction(enterAction: Integer); cdecl;
    procedure setInputConnection(connection: JObject); cdecl;
    procedure setInputType(inputType: Integer); cdecl;
    procedure setIsPassword(isPassword: Boolean); cdecl;
    procedure setMaxLength(value: Integer); cdecl;
    procedure setMultiline(multiline: Boolean); cdecl;
    procedure setOnEditorActionListener(actionListener: JFMXTextEditorProxy_OnEnterActionListener); cdecl;
    procedure setReadOnly(readonly: Boolean); cdecl;
    procedure setSelection(start: Integer; end_: Integer); cdecl;
    procedure setText(text: JCharSequence); cdecl;
    procedure showSoftInput(show: Boolean); cdecl;
    procedure skipRestart; cdecl;
  end;
  TJFMXTextEditorProxy = class(TJavaGenericImport<JFMXTextEditorProxyClass, JFMXTextEditorProxy>) end;

  JFMXTextEditorProxy_OnEnterActionListenerClass = interface(IJavaClass)
    ['{E309A61C-597B-4A10-AA18-11761591D1CF}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/FMXTextEditorProxy$OnEnterActionListener')]
  JFMXTextEditorProxy_OnEnterActionListener = interface(IJavaInstance)
    ['{5C64CAD2-21B3-4158-92C6-7E3C24901CA5}']
    function onAction(v: JFMXTextEditorProxy; actionId: Integer; event: JKeyEvent): Boolean; cdecl;
  end;
  TJFMXTextEditorProxy_OnEnterActionListener = class(TJavaGenericImport<JFMXTextEditorProxy_OnEnterActionListenerClass, JFMXTextEditorProxy_OnEnterActionListener>) end;

  JFMXTextListenerClass = interface(IJavaClass)
    ['{A8C204B6-E91D-43C9-AAE6-A8F638AC8B0B}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/FMXTextListener')]
  JFMXTextListener = interface(IJavaInstance)
    ['{343503D5-CA05-4DAE-AABF-C112202B9CFA}']
    procedure onComposingText(beginPosition: Integer; endPosition: Integer); cdecl;
    procedure onSkipKeyEvent(event: JKeyEvent); cdecl;
    procedure onTextUpdated(text: JCharSequence; position: Integer); cdecl;
  end;
  TJFMXTextListener = class(TJavaGenericImport<JFMXTextListenerClass, JFMXTextListener>) end;

  JVKStateChangeListenerClass = interface(IJavaClass)
    ['{3FB50750-6D9D-436D-829F-BE6EA8085453}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/VKStateChangeListener')]
  JVKStateChangeListener = interface(IJavaInstance)
    ['{00B21846-0476-4BF6-8F08-7DC3774FA25F}']
    procedure onVirtualKeyboardHidden; cdecl;
    procedure onVirtualKeyboardShown; cdecl;
  end;
  TJVKStateChangeListener = class(TJavaGenericImport<JVKStateChangeListenerClass, JVKStateChangeListener>) end;

  JOnWebViewListenerClass = interface(IJavaClass)
    ['{01D11CF8-BF46-45EF-8090-628E2BA23A2E}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/webbrowser/OnWebViewListener')]
  JOnWebViewListener = interface(IJavaInstance)
    ['{EF36619D-8759-4381-B638-C99B1C0A0EF8}']
    procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
    procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
    procedure onLoadResource(view: JWebView; url: JString); cdecl;
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
    procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
    procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
    function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
  end;
  TJOnWebViewListener = class(TJavaGenericImport<JOnWebViewListenerClass, JOnWebViewListener>) end;

  JWebBrowserClass = interface(JWebViewClass)
    ['{C9D39057-C2B7-4264-8E58-52DE4CA5AE56}']
    {class} function init(context: JContext): JWebBrowser; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/webbrowser/WebBrowser')]
  JWebBrowser = interface(JWebView)
    ['{21876269-EEA5-4130-BE15-F23BEB8ECA69}']
    procedure SetWebViewListener(listener: JOnWebViewListener); cdecl;
  end;
  TJWebBrowser = class(TJavaGenericImport<JWebBrowserClass, JWebBrowser>) end;

  JWebClientClass = interface(JWebViewClientClass)
    ['{424BCB34-24B0-4A4B-830B-D396C3667344}']
    {class} function init: JWebClient; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/webbrowser/WebClient')]
  JWebClient = interface(JWebViewClient)
    ['{6D32A60F-6D97-4756-95C6-AFBFE15C465F}']
    procedure SetWebViewListener(listener: JOnWebViewListener); cdecl;
    procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
    procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
    procedure onLoadResource(view: JWebView; url: JString); cdecl;
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
    procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
    procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
    function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
  end;
  TJWebClient = class(TJavaGenericImport<JWebClientClass, JWebClient>) end;

  // com.embarcadero.rtl.ProxyInterface
  JProxyServiceClass = interface(JObjectClass)
    ['{4308F1E3-BCAB-4A59-B386-8B467479DE19}']
    {class} function init: JProxyService; cdecl;
    {class} function getService(service: JObject; libraryName: JString): Int64; cdecl;
    {class} function onBind(service: JObject; libraryName: JString; intent: JIntent): JIBinder; cdecl;
    {class} procedure onConfigurationChanged(service: JObject; libraryName: JString; newConfig: JConfiguration); cdecl;
    {class} procedure onCreate(service: JObject; libraryName: JString); cdecl;
    {class} procedure onDestroy(service: JObject; libraryName: JString); cdecl;
    {class} procedure onHandleIntent(service: JObject; libraryName: JString; intent: JIntent); cdecl;
    {class} function onHandleMessage(service: JObject; libraryName: JString; msg: JMessage): Boolean; cdecl;
    {class} procedure onLowMemory(service: JObject; libraryName: JString); cdecl;
    {class} procedure onRebind(service: JObject; libraryName: JString; intent: JIntent); cdecl;
    {class} function onStartCommand(service: JObject; libraryName: JString; intent: JIntent; flags: Integer; startId: Integer): Integer; cdecl;
    {class} procedure onTaskRemoved(service: JObject; libraryName: JString; rootIntent: JIntent); cdecl;
    {class} procedure onTrimMemory(service: JObject; libraryName: JString; level: Integer); cdecl;
    {class} function onUnbind(service: JObject; libraryName: JString; intent: JIntent): Boolean; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/ProxyService')]
  JProxyService = interface(JObject)
    ['{81D7A55C-F3F2-4600-BBD0-F88F0D5B01A4}']
  end;
  TJProxyService = class(TJavaGenericImport<JProxyServiceClass, JProxyService>) end;

  JRTLHandlerClass = interface(JHandlerClass)
    ['{3417384C-A826-4CA7-B264-8728AB002B7B}']
    {class} function init(paramListener: JRTLHandler_Listener): JRTLHandler; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/RTLHandler')]
  JRTLHandler = interface(JHandler)
    ['{D703B524-788D-4D2C-A84C-96AEA91C1B9B}']
    function _GetSuper: JRTLHandler_RTLSuperHandler; cdecl;
    procedure handleMessage(paramMessage: JMessage); cdecl;
    property Super: JRTLHandler_RTLSuperHandler read _GetSuper;
  end;
  TJRTLHandler = class(TJavaGenericImport<JRTLHandlerClass, JRTLHandler>) end;

  JRTLHandler_ListenerClass = interface(IJavaClass)
    ['{49430D59-AA18-486D-94C7-04AC2EA58ADA}']
  end;

  [JavaSignature('com/embarcadero/rtl/RTLHandler$Listener')]
  JRTLHandler_Listener = interface(IJavaInstance)
    ['{D5EEE739-658B-4973-B431-F74CA8681B6E}']
    procedure handleMessage(paramMessage: JMessage); cdecl;
  end;
  TJRTLHandler_Listener = class(TJavaGenericImport<JRTLHandler_ListenerClass, JRTLHandler_Listener>) end;

  JRTLHandler_RTLSuperHandlerClass = interface(JObjectClass)
    ['{6B650C1B-F5D9-44EA-ACD9-CB2EDD0C3280}']
    {class} function init(paramRTLHandler: JRTLHandler): JRTLHandler_RTLSuperHandler; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/RTLHandler$RTLSuperHandler')]
  JRTLHandler_RTLSuperHandler = interface(JObject)
    ['{FF6A6138-30FC-4AE6-B6F6-3AF78E914A9E}']
    procedure handleMessage(paramMessage: JMessage); cdecl;
  end;
  TJRTLHandler_RTLSuperHandler = class(TJavaGenericImport<JRTLHandler_RTLSuperHandlerClass, JRTLHandler_RTLSuperHandler>) end;

  JNotificationAlarmClass = interface(JBroadcastReceiverClass)
    ['{C845BD22-FDA5-4A19-84BB-2F7E8042B832}']
    {class} function _GetNOTIFICATION_CENTER: JString; cdecl;
    {class} function _GetSETTINGS_NOTIFICATION_IDS: JString; cdecl;
    {class} function init: JNotificationAlarm; cdecl;
    {class} property NOTIFICATION_CENTER: JString read _GetNOTIFICATION_CENTER;
    {class} property SETTINGS_NOTIFICATION_IDS: JString read _GetSETTINGS_NOTIFICATION_IDS;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/NotificationAlarm')]
  JNotificationAlarm = interface(JBroadcastReceiver)
    ['{B08E8F99-0DE7-404C-A290-0DFCFCB2DCF7}']
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  TJNotificationAlarm = class(TJavaGenericImport<JNotificationAlarmClass, JNotificationAlarm>) end;

  JNotificationInfoClass = interface(JObjectClass)
    ['{752976D5-5009-42D5-8A32-EC531871F704}']
    {class} function _GetACTION_NOTIFICATION: JString; cdecl;
    {class} function _GetEXTRA_ACTIVITY_CLASS_NAME: JString; cdecl;
    {class} function _GetEXTRA_ALERT_ACTION: JString; cdecl;
    {class} function _GetEXTRA_ALERT_BODY: JString; cdecl;
    {class} function _GetEXTRA_ENABLE_SOUND: JString; cdecl;
    {class} function _GetEXTRA_FIRE_DATE: JString; cdecl;
    {class} function _GetEXTRA_FIRE_GMT_DATE: JString; cdecl;
    {class} function _GetEXTRA_HAS_ACTION: JString; cdecl;
    {class} function _GetEXTRA_NAME: JString; cdecl;
    {class} function _GetEXTRA_NUMBER: JString; cdecl;
    {class} function _GetEXTRA_REPEAT_INTERVAL: JString; cdecl;
    {class} function _GetEXTRA_SOUND_NAME: JString; cdecl;
    {class} function _GetEXTRA_TITLE: JString; cdecl;
    {class} function _GetEXTRA_UNIQUE_ID: JString; cdecl;
    {class} property ACTION_NOTIFICATION: JString read _GetACTION_NOTIFICATION;
    {class} property EXTRA_ACTIVITY_CLASS_NAME: JString read _GetEXTRA_ACTIVITY_CLASS_NAME;
    {class} property EXTRA_ALERT_ACTION: JString read _GetEXTRA_ALERT_ACTION;
    {class} property EXTRA_ALERT_BODY: JString read _GetEXTRA_ALERT_BODY;
    {class} property EXTRA_ENABLE_SOUND: JString read _GetEXTRA_ENABLE_SOUND;
    {class} property EXTRA_FIRE_DATE: JString read _GetEXTRA_FIRE_DATE;
    {class} property EXTRA_FIRE_GMT_DATE: JString read _GetEXTRA_FIRE_GMT_DATE;
    {class} property EXTRA_HAS_ACTION: JString read _GetEXTRA_HAS_ACTION;
    {class} property EXTRA_NAME: JString read _GetEXTRA_NAME;
    {class} property EXTRA_NUMBER: JString read _GetEXTRA_NUMBER;
    {class} property EXTRA_REPEAT_INTERVAL: JString read _GetEXTRA_REPEAT_INTERVAL;
    {class} property EXTRA_SOUND_NAME: JString read _GetEXTRA_SOUND_NAME;
    {class} property EXTRA_TITLE: JString read _GetEXTRA_TITLE;
    {class} property EXTRA_UNIQUE_ID: JString read _GetEXTRA_UNIQUE_ID;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/NotificationInfo')]
  JNotificationInfo = interface(JObject)
    ['{A9BD962E-87E0-46B6-96CB-0AEA5AA99BD9}']
    function getIntentCode: Integer; cdecl;
    function getName: JString; cdecl;
    function getNotificationPreferencesValue: JString; cdecl;
    function getRepeatInterval: Integer; cdecl;
  end;
  TJNotificationInfo = class(TJavaGenericImport<JNotificationInfoClass, JNotificationInfo>) end;

  JNotificationPublisherClass = interface(JObjectClass)
    ['{5AEDA84B-10E7-4EAD-969D-4ECA6D5BA622}']
    {class} function _GetACTION_GCM_NOTIFICATION: JString; cdecl;
    {class} function init(context: JContext): JNotificationPublisher; cdecl;
    {class} property ACTION_GCM_NOTIFICATION: JString read _GetACTION_GCM_NOTIFICATION;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/NotificationPublisher')]
  JNotificationPublisher = interface(JObject)
    ['{16220D10-7DB4-4869-B047-3B10B1B9C5A1}']
    procedure publishGCM(extras: JBundle); cdecl;
  end;
  TJNotificationPublisher = class(TJavaGenericImport<JNotificationPublisherClass, JNotificationPublisher>) end;

  JRepeatIntervalClass = interface(JObjectClass)
    ['{9C4491C8-7BAF-4A5C-96DD-7DB579165E74}']
    {class} function _GetREPEAT_INTERVAL_DAY: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_ERA: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_HOUR: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_MINUTE: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_MONTH: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_NONE: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_QUAERTER: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_SECOND: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_WEEK: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_WEEKDAYS: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_YEAR: Integer; cdecl;
    {class} function init: JRepeatInterval; cdecl;
    {class} function getRepeatIntervalMSsec(repeatIntervalType: Integer): Int64; cdecl;
    {class} property REPEAT_INTERVAL_DAY: Integer read _GetREPEAT_INTERVAL_DAY;
    {class} property REPEAT_INTERVAL_ERA: Integer read _GetREPEAT_INTERVAL_ERA;
    {class} property REPEAT_INTERVAL_HOUR: Integer read _GetREPEAT_INTERVAL_HOUR;
    {class} property REPEAT_INTERVAL_MINUTE: Integer read _GetREPEAT_INTERVAL_MINUTE;
    {class} property REPEAT_INTERVAL_MONTH: Integer read _GetREPEAT_INTERVAL_MONTH;
    {class} property REPEAT_INTERVAL_NONE: Integer read _GetREPEAT_INTERVAL_NONE;
    {class} property REPEAT_INTERVAL_QUAERTER: Integer read _GetREPEAT_INTERVAL_QUAERTER;
    {class} property REPEAT_INTERVAL_SECOND: Integer read _GetREPEAT_INTERVAL_SECOND;
    {class} property REPEAT_INTERVAL_WEEK: Integer read _GetREPEAT_INTERVAL_WEEK;
    {class} property REPEAT_INTERVAL_WEEKDAYS: Integer read _GetREPEAT_INTERVAL_WEEKDAYS;
    {class} property REPEAT_INTERVAL_YEAR: Integer read _GetREPEAT_INTERVAL_YEAR;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/RepeatInterval')]
  JRepeatInterval = interface(JObject)
    ['{71A87C37-FC7D-4A45-A1D4-7DE34B91336A}']
  end;
  TJRepeatInterval = class(TJavaGenericImport<JRepeatIntervalClass, JRepeatInterval>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXNativeActivity', TypeInfo(Androidapi.JNI.Embarcadero.JFMXNativeActivity));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFullScreenFSM_Callback', TypeInfo(Androidapi.JNI.Embarcadero.JFullScreenFSM_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnActivityListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnActivityListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JViewStack', TypeInfo(Androidapi.JNI.Embarcadero.JViewStack));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JAddressBookObserver', TypeInfo(Androidapi.JNI.Embarcadero.JAddressBookObserver));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnAddressBookChangesListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnAddressBookChangesListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JAdListenerAdapter', TypeInfo(Androidapi.JNI.Embarcadero.JAdListenerAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JIAdListener', TypeInfo(Androidapi.JNI.Embarcadero.JIAdListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXBroadcastReceiver', TypeInfo(Androidapi.JNI.Embarcadero.JFMXBroadcastReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXBroadcastReceiverListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXBroadcastReceiverListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCamPreview', TypeInfo(Androidapi.JNI.Embarcadero.JCamPreview));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDialogFactory', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDialogFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDialogHelpers', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDialogHelpers));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDialogListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDialogListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXStandardDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXStandardDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultStandardDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultStandardDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultAlertDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultAlertDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultDialogFactory', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultDialogFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultDialogFragment', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultDialogFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultInputQueryDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultInputQueryDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadStandardDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadStandardDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadAlertDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadAlertDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadDialogFactory', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadDialogFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadInputQueryDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadInputQueryDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JJavaGeocoder', TypeInfo(Androidapi.JNI.Embarcadero.JJavaGeocoder));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCameraChangeListener', TypeInfo(Androidapi.JNI.Embarcadero.JCameraChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCameraChangeListener_Callback', TypeInfo(Androidapi.JNI.Embarcadero.JCameraChangeListener_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JMapViewWithGestures', TypeInfo(Androidapi.JNI.Embarcadero.JMapViewWithGestures));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXMediaLibrary', TypeInfo(Androidapi.JNI.Embarcadero.JFMXMediaLibrary));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXMediaLibraryListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXMediaLibraryListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JMediaImage', TypeInfo(Androidapi.JNI.Embarcadero.JMediaImage));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JMediaImage_ImageStorePlace', TypeInfo(Androidapi.JNI.Embarcadero.JMediaImage_ImageStorePlace));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JSize', TypeInfo(Androidapi.JNI.Embarcadero.JSize));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JUtils', TypeInfo(Androidapi.JNI.Embarcadero.JUtils));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNativeControlHost', TypeInfo(Androidapi.JNI.Embarcadero.JNativeControlHost));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNativeLayout', TypeInfo(Androidapi.JNI.Embarcadero.JNativeLayout));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBasePicker', TypeInfo(Androidapi.JNI.Embarcadero.JBasePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBaseDateTimePicker', TypeInfo(Androidapi.JNI.Embarcadero.JBaseDateTimePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBaseListPicker', TypeInfo(Androidapi.JNI.Embarcadero.JBaseListPicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBasePickersFactory', TypeInfo(Androidapi.JNI.Embarcadero.JBasePickersFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGeneratorPickerID', TypeInfo(Androidapi.JNI.Embarcadero.JGeneratorPickerID));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnDateTimeChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnDateTimeChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnItemChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnItemChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.Jdefaults_DatePickerFragment', TypeInfo(Androidapi.JNI.Embarcadero.Jdefaults_DatePickerFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultDatePicker', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultDatePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultListPicker', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultListPicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultPickersFactory', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultPickersFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultTimePicker', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultTimePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.Jdefaults_ListPickerFragment', TypeInfo(Androidapi.JNI.Embarcadero.Jdefaults_ListPickerFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.Jdefaults_TimePickerFragment', TypeInfo(Androidapi.JNI.Embarcadero.Jdefaults_TimePickerFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadDatePicker', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadDatePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadListPicker', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadListPicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadPickersFactory', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadPickersFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadTimePicker', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadTimePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JIAPSecurity', TypeInfo(Androidapi.JNI.Embarcadero.JIAPSecurity));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXTextEditorProxy', TypeInfo(Androidapi.JNI.Embarcadero.JFMXTextEditorProxy));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXTextEditorProxy_OnEnterActionListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXTextEditorProxy_OnEnterActionListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXTextListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXTextListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JVKStateChangeListener', TypeInfo(Androidapi.JNI.Embarcadero.JVKStateChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnWebViewListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnWebViewListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JWebBrowser', TypeInfo(Androidapi.JNI.Embarcadero.JWebBrowser));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JWebClient', TypeInfo(Androidapi.JNI.Embarcadero.JWebClient));
  //TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JProxyInterface', TypeInfo(Androidapi.JNI.Embarcadero.JProxyInterface));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JProxyService', TypeInfo(Androidapi.JNI.Embarcadero.JProxyService));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRTLHandler', TypeInfo(Androidapi.JNI.Embarcadero.JRTLHandler));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRTLHandler_Listener', TypeInfo(Androidapi.JNI.Embarcadero.JRTLHandler_Listener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRTLHandler_RTLSuperHandler', TypeInfo(Androidapi.JNI.Embarcadero.JRTLHandler_RTLSuperHandler));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNotificationAlarm', TypeInfo(Androidapi.JNI.Embarcadero.JNotificationAlarm));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNotificationInfo', TypeInfo(Androidapi.JNI.Embarcadero.JNotificationInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNotificationPublisher', TypeInfo(Androidapi.JNI.Embarcadero.JNotificationPublisher));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRepeatInterval', TypeInfo(Androidapi.JNI.Embarcadero.JRepeatInterval));
end;

initialization
  RegisterTypes;
end.


