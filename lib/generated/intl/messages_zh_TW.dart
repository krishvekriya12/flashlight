// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_TW';

  static String m0(version) => "版本 ${version}";

  static String m1(permission) => "沒有 ${permission} 權限，此功能將無法運作。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutUs": MessageLookupByLibrary.simpleMessage("關於我們"),
    "afrikaans": MessageLookupByLibrary.simpleMessage("Afrikaans"),
    "afterCallFunction": MessageLookupByLibrary.simpleMessage("通話後功能"),
    "afterCallOption": MessageLookupByLibrary.simpleMessage("通話後選項"),
    "afterCallOptionSubText": MessageLookupByLibrary.simpleMessage(
      "通話結束後，您可以選擇回撥、傳送訊息或儲存聯絡人。",
    ),
    "afterCallSubText": MessageLookupByLibrary.simpleMessage(
      "通話結束後，可選擇回撥、傳送訊息或儲存聯絡人。",
    ),
    "allow": MessageLookupByLibrary.simpleMessage("允許"),
    "allowPermissionCallend": MessageLookupByLibrary.simpleMessage("允許權限"),
    "appMode": MessageLookupByLibrary.simpleMessage("應用程式模式"),
    "appName": MessageLookupByLibrary.simpleMessage("手電筒"),
    "appVersion": m0,
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("確定嗎？"),
    "areYouSureSubText": MessageLookupByLibrary.simpleMessage("「您將無法查看任何通話資訊」"),
    "autoStartAccess": MessageLookupByLibrary.simpleMessage("自動啟動權限"),
    "calendar": MessageLookupByLibrary.simpleMessage("日曆"),
    "callLater": MessageLookupByLibrary.simpleMessage("我稍後再打給你"),
    "cameraPermissionFirstDenialDesc": MessageLookupByLibrary.simpleMessage(
      "我們需要相機存取權，才能在應用程式關閉或於背景執行時保持手電筒開啟。如果不允許此權限，手電筒只能在您使用應用程式時運作。",
    ),
    "cameraPermissionTitle": MessageLookupByLibrary.simpleMessage("需要相機存取權"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cantTalkNow": MessageLookupByLibrary.simpleMessage("現在無法通話"),
    "chinese": MessageLookupByLibrary.simpleMessage("Chinese"),
    "chooseApp": MessageLookupByLibrary.simpleMessage("選擇應用程式"),
    "chooseColor": MessageLookupByLibrary.simpleMessage("選擇顏色"),
    "closeButton": MessageLookupByLibrary.simpleMessage("Close button"),
    "contact": MessageLookupByLibrary.simpleMessage("聯絡人"),
    "createReminder": MessageLookupByLibrary.simpleMessage("建立新提醒"),
    "darkMode": MessageLookupByLibrary.simpleMessage("深色模式"),
    "dialogBackPressOverlayPermissionDescription":
        MessageLookupByLibrary.simpleMessage(
          "只有在授予「顯示在其他應用程式上層」權限後，應用程式才能正常運作。",
        ),
    "dialogBackPressPhoneNotificationPermissionDescription": m1,
    "dismiss": MessageLookupByLibrary.simpleMessage("關閉"),
    "duration": MessageLookupByLibrary.simpleMessage("通話時間："),
    "enable": MessageLookupByLibrary.simpleMessage("啟用"),
    "enableDisplayPermission": MessageLookupByLibrary.simpleMessage("啟用顯示權限"),
    "enableFor": MessageLookupByLibrary.simpleMessage("啟用於"),
    "enableNotificationAccess": MessageLookupByLibrary.simpleMessage("啟用通知存取權"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterMessage": MessageLookupByLibrary.simpleMessage("輸入個人訊息"),
    "enterReminderText": MessageLookupByLibrary.simpleMessage("請填寫提醒內容"),
    "fillipino": MessageLookupByLibrary.simpleMessage("Filipino"),
    "flashOn": MessageLookupByLibrary.simpleMessage("閃光燈已開啟"),
    "french": MessageLookupByLibrary.simpleMessage("French"),
    "german": MessageLookupByLibrary.simpleMessage("German"),
    "hindi": MessageLookupByLibrary.simpleMessage("Hindi"),
    "hungarian": MessageLookupByLibrary.simpleMessage("Hungarian"),
    "imOnWay": MessageLookupByLibrary.simpleMessage("我正在路上"),
    "incoming": MessageLookupByLibrary.simpleMessage("來電"),
    "incomingCall": MessageLookupByLibrary.simpleMessage("來電"),
    "incomingSms": MessageLookupByLibrary.simpleMessage("收到簡訊"),
    "indonesian": MessageLookupByLibrary.simpleMessage("Indonesian"),
    "installApp": MessageLookupByLibrary.simpleMessage("取得"),
    "italian": MessageLookupByLibrary.simpleMessage("Italian"),
    "japan": MessageLookupByLibrary.simpleMessage("Japanese"),
    "keepIt": MessageLookupByLibrary.simpleMessage("保留"),
    "korean": MessageLookupByLibrary.simpleMessage("Korean"),
    "language": MessageLookupByLibrary.simpleMessage("語言"),
    "languages": MessageLookupByLibrary.simpleMessage("語言"),
    "later": MessageLookupByLibrary.simpleMessage("稍後"),
    "lightMode": MessageLookupByLibrary.simpleMessage("淺色模式"),
    "mail": MessageLookupByLibrary.simpleMessage("郵件"),
    "message": MessageLookupByLibrary.simpleMessage("訊息"),
    "missedCall": MessageLookupByLibrary.simpleMessage("未接來電"),
    "noAppFound": MessageLookupByLibrary.simpleMessage("找不到應用程式。"),
    "noReminders": MessageLookupByLibrary.simpleMessage("沒有提醒"),
    "notSet": MessageLookupByLibrary.simpleMessage("未設定"),
    "notification": MessageLookupByLibrary.simpleMessage("通知"),
    "notificationPermissionSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "請在設定中允許通知存取權，以接收閃光提醒。",
    ),
    "notificationPermissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "啟用通知",
    ),
    "notificationPhone": MessageLookupByLibrary.simpleMessage("通知與電話"),
    "notificationRequired": MessageLookupByLibrary.simpleMessage(
      "若要在收到簡訊時使用閃光提醒，請授予通知存取權。此權限可讓應用程式偵測訊息，並透過閃光燈即時提醒您。現在要啟用嗎？",
    ),
    "notificationRequired2": MessageLookupByLibrary.simpleMessage(
      "請啟用此設定，否則收到來電或簡訊時，手電筒可能無法閃爍。",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("通知"),
    "offLength": MessageLookupByLibrary.simpleMessage("關閉時間"),
    "onLength": MessageLookupByLibrary.simpleMessage("開啟時間"),
    "otherApps": MessageLookupByLibrary.simpleMessage("更多應用"),
    "outgoing": MessageLookupByLibrary.simpleMessage("撥出"),
    "overlayPermissionMaintextOne": MessageLookupByLibrary.simpleMessage("啟用"),
    "overlayPermissionMaintextThree": MessageLookupByLibrary.simpleMessage(
      "權限。部分裝置可能使用不同的名稱。請使用上述其中一種方法。",
    ),
    "overlayPermissionMaintextTwo": MessageLookupByLibrary.simpleMessage(
      "「顯示在其他應用程式上層（顯示於最上層）」",
    ),
    "permissionButtonText": MessageLookupByLibrary.simpleMessage("允許並繼續"),
    "permissionDialogAutoStartText4": MessageLookupByLibrary.simpleMessage(
      "請啟用自動啟動，以確保應用程式正常運作。",
    ),
    "permissionDialogAutoStartTitle": MessageLookupByLibrary.simpleMessage(
      "自動啟動",
    ),
    "permissionDialogButtonText": MessageLookupByLibrary.simpleMessage("允許"),
    "permissionDialogNotificationText2": MessageLookupByLibrary.simpleMessage(
      "即時掌握提醒、通知和重要資訊。",
    ),
    "permissionDialogNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "通知",
    ),
    "permissionDialogOverlayText2": MessageLookupByLibrary.simpleMessage(
      "讓您可以快速使用通話後操作，而不會中斷目前的工作。",
    ),
    "permissionDialogOverlayTitle": MessageLookupByLibrary.simpleMessage(
      "顯示在其他應用程式上層",
    ),
    "permissionDialogPhoneStateText4": MessageLookupByLibrary.simpleMessage(
      "協助偵測通話結束，以啟用通話後功能。",
    ),
    "permissionDialogPhoneStateTitle": MessageLookupByLibrary.simpleMessage(
      "電話狀態",
    ),
    "permissionDialogSettings": MessageLookupByLibrary.simpleMessage("設定"),
    "permissionDialogText3": MessageLookupByLibrary.simpleMessage(
      "我們只要求提供順暢使用體驗所需的權限。",
    ),
    "permissionDialogTitle3": MessageLookupByLibrary.simpleMessage("需要權限"),
    "permissionNoteText": MessageLookupByLibrary.simpleMessage(
      "選擇「允許並繼續」即表示您同意我們的",
    ),
    "permissionOverlayButtonText": MessageLookupByLibrary.simpleMessage("允許權限"),
    "permissionOverlayDialogButtonText": MessageLookupByLibrary.simpleMessage(
      "允許",
    ),
    "permissionOverlayDialogText": MessageLookupByLibrary.simpleMessage(
      "為什麼需要？",
    ),
    "permissionOverlayDialogText4": MessageLookupByLibrary.simpleMessage(
      "啟用懸浮視窗權限，即可快速查看來電資訊、使用智慧提醒，以及輕鬆進行後續操作。\n\n請放心 — 您的個人資料會受到完整的隱私與安全保護。",
    ),
    "permissionOverlayDialogTitle": MessageLookupByLibrary.simpleMessage(
      "為什麼需要此權限？",
    ),
    "permissionOverlayText2": MessageLookupByLibrary.simpleMessage(
      "讓應用程式可以顯示實用工具，而不會中斷您目前的操作。",
    ),
    "permissionOverlayTitle": MessageLookupByLibrary.simpleMessage("疊加權限"),
    "permissionSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "若要繼續使用此功能，請在手機設定中允許所需的權限。",
    ),
    "permissionSettingsTitle": MessageLookupByLibrary.simpleMessage("需要權限"),
    "permissionText3": MessageLookupByLibrary.simpleMessage(
      "允許以下權限，以享有順暢的應用程式使用體驗。",
    ),
    "personalization": MessageLookupByLibrary.simpleMessage("個人化"),
    "phone": MessageLookupByLibrary.simpleMessage("電話"),
    "phoneStatePermissionFirstDenialDesc": MessageLookupByLibrary.simpleMessage(
      "若要在來電時讓手電筒閃爍，我們需要存取電話狀態。這可讓應用程式偵測來電，以便透過閃光燈提醒您。",
    ),
    "phoneStatePermissionTitle": MessageLookupByLibrary.simpleMessage(
      "需要電話狀態存取權",
    ),
    "pleaseSelectFuturTime": MessageLookupByLibrary.simpleMessage("請選擇未來的時間"),
    "polish": MessageLookupByLibrary.simpleMessage("Polish"),
    "portuguese": MessageLookupByLibrary.simpleMessage("Portuguese"),
    "pressBackAgainToExit": MessageLookupByLibrary.simpleMessage("再次按下返回鍵即可退出"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隱私權政策"),
    "privacyPolicyPermission": MessageLookupByLibrary.simpleMessage("隱私權政策"),
    "privateNumber": MessageLookupByLibrary.simpleMessage("私人號碼"),
    "proceed": MessageLookupByLibrary.simpleMessage("繼續"),
    "rateUs": MessageLookupByLibrary.simpleMessage("為我們評分"),
    "reminderAlert": MessageLookupByLibrary.simpleMessage("提醒通知！"),
    "reminderDeleted": MessageLookupByLibrary.simpleMessage("提醒已刪除！"),
    "reminderSetSuccessfully": MessageLookupByLibrary.simpleMessage("提醒設定成功！"),
    "resultNotFound": MessageLookupByLibrary.simpleMessage("找不到結果。"),
    "ring": MessageLookupByLibrary.simpleMessage("響鈴"),
    "romanian": MessageLookupByLibrary.simpleMessage("Romanian"),
    "russian": MessageLookupByLibrary.simpleMessage("Russian"),
    "safetapDesc": MessageLookupByLibrary.simpleMessage("每日安全簽到與緊急預警"),
    "screenLight": MessageLookupByLibrary.simpleMessage("螢幕燈"),
    "searchApps": MessageLookupByLibrary.simpleMessage("搜尋應用程式…"),
    "seeCallInformation": MessageLookupByLibrary.simpleMessage("查看通話資訊"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "shakeNotificationText": MessageLookupByLibrary.simpleMessage(
      "搖晃裝置即可開啟或關閉手電筒",
    ),
    "shakeNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "搖晃切換手電筒功能已開啟",
    ),
    "shakePermissionDialogDescription": MessageLookupByLibrary.simpleMessage(
      "若要使用搖一搖閃光，請允許通知權限，以便搖晃服務可以在背景執行。",
    ),
    "shakePermissionDialogTitle": MessageLookupByLibrary.simpleMessage(
      "搖一搖閃光權限",
    ),
    "shakePermissionSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "執行搖一搖閃光服務需要通知權限。請在設定中允許通知。",
    ),
    "shakePermissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "啟用通知權限",
    ),
    "shakeToToggleFlashlight": MessageLookupByLibrary.simpleMessage("搖晃以切換手電筒"),
    "shareApp": MessageLookupByLibrary.simpleMessage("分享應用程式"),
    "silent": MessageLookupByLibrary.simpleMessage("靜音"),
    "spanish": MessageLookupByLibrary.simpleMessage("Spanish"),
    "spendlyDesc": MessageLookupByLibrary.simpleMessage("支出與預算管理工具"),
    "subtextPermissionDailoge": MessageLookupByLibrary.simpleMessage(
      "允許以下權限，以便不受中斷地使用應用程式。",
    ),
    "subtextPermissionDialog": MessageLookupByLibrary.simpleMessage(
      "允許以下權限，以便不受中斷地使用應用程式。",
    ),
    "systemDefault": MessageLookupByLibrary.simpleMessage("系統預設"),
    "tabFlashAlert": MessageLookupByLibrary.simpleMessage("閃光提醒"),
    "tabFlashLight": MessageLookupByLibrary.simpleMessage("手電筒"),
    "tabStroboscope": MessageLookupByLibrary.simpleMessage("頻閃燈"),
    "tapScreenToHideControls": MessageLookupByLibrary.simpleMessage(
      "點擊螢幕以隱藏控制項",
    ),
    "testFlash": MessageLookupByLibrary.simpleMessage("測試閃光"),
    "testOff": MessageLookupByLibrary.simpleMessage("測試關閉"),
    "testOn": MessageLookupByLibrary.simpleMessage("測試開啟"),
    "thai": MessageLookupByLibrary.simpleMessage("Thai"),
    "tipsplitDesc": MessageLookupByLibrary.simpleMessage("分帳與小費計算器"),
    "today": MessageLookupByLibrary.simpleMessage("今天"),
    "tomorrow": MessageLookupByLibrary.simpleMessage("明天"),
    "torchTurnedOn": MessageLookupByLibrary.simpleMessage("手電筒已開啟"),
    "turkish": MessageLookupByLibrary.simpleMessage("Turkish"),
    "turnFlashlightOn": MessageLookupByLibrary.simpleMessage("啟動時開啟手電筒"),
    "turnOff": MessageLookupByLibrary.simpleMessage("關閉"),
    "ukrainian": MessageLookupByLibrary.simpleMessage("Ukrainian"),
    "unableToUnlockFeatures": MessageLookupByLibrary.simpleMessage("啟用以解鎖功能"),
    "vibrate": MessageLookupByLibrary.simpleMessage("震動"),
    "vietnam": MessageLookupByLibrary.simpleMessage("Vietnamese"),
    "waterReminderDesc": MessageLookupByLibrary.simpleMessage("喝水提醒與健康飲水記錄"),
  };
}
