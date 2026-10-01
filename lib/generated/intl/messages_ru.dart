// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(version) => "Версия ${version}";

  static String m1(permission) =>
      "Функции приложения не будут работать без разрешения на ${permission}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutUs": MessageLookupByLibrary.simpleMessage("О нас"),
    "afrikaans": MessageLookupByLibrary.simpleMessage("Afrikaans"),
    "afterCallFunction": MessageLookupByLibrary.simpleMessage(
      "Функция после вызова",
    ),
    "afterCallOption": MessageLookupByLibrary.simpleMessage(
      "Опцион после колл",
    ),
    "afterCallOptionSubText": MessageLookupByLibrary.simpleMessage(
      "После любого звонка вы увидите опции: перезвонить, отправить сообщение или сохранить контакт.",
    ),
    "afterCallSubText": MessageLookupByLibrary.simpleMessage(
      "После завершения звонка вам будут предложены варианты: перезвонить, отправить сообщение или сохранить контакт.",
    ),
    "allow": MessageLookupByLibrary.simpleMessage("Позволять"),
    "allowPermissionCallend": MessageLookupByLibrary.simpleMessage("Разрешить"),
    "appMode": MessageLookupByLibrary.simpleMessage("Режим приложения"),
    "appName": MessageLookupByLibrary.simpleMessage("Фонарик"),
    "appVersion": m0,
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Вы уверены?"),
    "areYouSureSubText": MessageLookupByLibrary.simpleMessage(
      "«Вы не сможете увидеть информацию о звонке»",
    ),
    "autoStartAccess": MessageLookupByLibrary.simpleMessage(
      "Доступ к автоматическому запуску",
    ),
    "calendar": MessageLookupByLibrary.simpleMessage("Календарь"),
    "callLater": MessageLookupByLibrary.simpleMessage("Я перезвоню вам позже"),
    "cameraPermissionFirstDenialDesc": MessageLookupByLibrary.simpleMessage(
      "Нам нужен доступ к вашей камере, чтобы фонарик работал, даже когда приложение закрыто или работает в фоновом режиме. Без доступа к камере фонарик будет работать только во время использования приложения.",
    ),
    "cameraPermissionTitle": MessageLookupByLibrary.simpleMessage(
      "Требуется доступ к камере",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cantTalkNow": MessageLookupByLibrary.simpleMessage(
      "Не могу сейчас говорить",
    ),
    "chinese": MessageLookupByLibrary.simpleMessage("Chinese"),
    "chooseApp": MessageLookupByLibrary.simpleMessage("Выберите приложение"),
    "chooseColor": MessageLookupByLibrary.simpleMessage("Выберите цвет"),
    "closeButton": MessageLookupByLibrary.simpleMessage("Close button"),
    "contact": MessageLookupByLibrary.simpleMessage("Контакт"),
    "createReminder": MessageLookupByLibrary.simpleMessage(
      "Создать новое напоминание",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Темный режим"),
    "dialogBackPressOverlayPermissionDescription":
        MessageLookupByLibrary.simpleMessage(
          "Приложение будет работать только при предоставлении разрешения на отображение поверх других приложений.",
        ),
    "dialogBackPressPhoneNotificationPermissionDescription": m1,
    "dismiss": MessageLookupByLibrary.simpleMessage("Увольнять"),
    "duration": MessageLookupByLibrary.simpleMessage("Длительность:"),
    "enable": MessageLookupByLibrary.simpleMessage("Давать возможность"),
    "enableDisplayPermission": MessageLookupByLibrary.simpleMessage(
      "Включить разрешение на отображение",
    ),
    "enableFor": MessageLookupByLibrary.simpleMessage("ВКЛЮЧИТЬ ДЛЯ"),
    "enableNotificationAccess": MessageLookupByLibrary.simpleMessage(
      "Включить доступ к уведомлениям",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterMessage": MessageLookupByLibrary.simpleMessage(
      "Написать личное сообщение",
    ),
    "enterReminderText": MessageLookupByLibrary.simpleMessage(
      "Заполнить Содержание напоминания",
    ),
    "fillipino": MessageLookupByLibrary.simpleMessage("Filipino"),
    "flashOn": MessageLookupByLibrary.simpleMessage("ВСПЫШКА ВКЛ."),
    "french": MessageLookupByLibrary.simpleMessage("French"),
    "german": MessageLookupByLibrary.simpleMessage("German"),
    "hindi": MessageLookupByLibrary.simpleMessage("Hindi"),
    "hungarian": MessageLookupByLibrary.simpleMessage("Hungarian"),
    "imOnWay": MessageLookupByLibrary.simpleMessage("Я в пути"),
    "incoming": MessageLookupByLibrary.simpleMessage("Входящий"),
    "incomingCall": MessageLookupByLibrary.simpleMessage("Вх. звонок"),
    "incomingSms": MessageLookupByLibrary.simpleMessage("Входящие СМС"),
    "indonesian": MessageLookupByLibrary.simpleMessage("Indonesian"),
    "installApp": MessageLookupByLibrary.simpleMessage("Скачать"),
    "italian": MessageLookupByLibrary.simpleMessage("Italian"),
    "japan": MessageLookupByLibrary.simpleMessage("Japanese"),
    "keepIt": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "korean": MessageLookupByLibrary.simpleMessage("Korean"),
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "languages": MessageLookupByLibrary.simpleMessage("Языки"),
    "later": MessageLookupByLibrary.simpleMessage("Позже"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Световой режим"),
    "mail": MessageLookupByLibrary.simpleMessage("Почта"),
    "message": MessageLookupByLibrary.simpleMessage("Сообщения"),
    "missedCall": MessageLookupByLibrary.simpleMessage("Пропущенный вызов"),
    "noAppFound": MessageLookupByLibrary.simpleMessage(
      "Приложение не найдено.",
    ),
    "noReminders": MessageLookupByLibrary.simpleMessage("Нет напоминаний"),
    "notSet": MessageLookupByLibrary.simpleMessage("Не указано"),
    "notification": MessageLookupByLibrary.simpleMessage("Уведомление"),
    "notificationPermissionSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "Чтобы получать флэш-оповещения, разрешите доступ к уведомлениям в настройках.",
    ),
    "notificationPermissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Включить уведомления",
    ),
    "notificationPhone": MessageLookupByLibrary.simpleMessage(
      "Уведомления и телефон",
    ),
    "notificationRequired": MessageLookupByLibrary.simpleMessage(
      "Чтобы использовать вспышку при входящих SMS, предоставьте доступ к уведомлениям. Это позволит вам определять сообщения и включать вспышку для мгновенных уведомлений. Включить сейчас?",
    ),
    "notificationRequired2": MessageLookupByLibrary.simpleMessage(
      "Включите эту настройку, иначе фонарик может не мигать при входящем звонке или смс.",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
    "offLength": MessageLookupByLibrary.simpleMessage("Офф-Длина"),
    "onLength": MessageLookupByLibrary.simpleMessage("О длине"),
    "otherApps": MessageLookupByLibrary.simpleMessage("Другие приложения"),
    "outgoing": MessageLookupByLibrary.simpleMessage("Исходящий"),
    "overlayPermissionMaintextOne": MessageLookupByLibrary.simpleMessage(
      "Включить",
    ),
    "overlayPermissionMaintextThree": MessageLookupByLibrary.simpleMessage(
      "Разрешение. На некоторых устройствах оно может называться иначе. Воспользуйтесь одним из вышеперечисленных способов.",
    ),
    "overlayPermissionMaintextTwo": MessageLookupByLibrary.simpleMessage(
      "«Отображать поверх других приложений (показывать сверху)»",
    ),
    "permissionButtonText": MessageLookupByLibrary.simpleMessage(
      "Разрешить и продолжить",
    ),
    "permissionDialogAutoStartText4": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, включите автозапуск для обеспечения бесперебойной работы приложения.",
    ),
    "permissionDialogAutoStartTitle": MessageLookupByLibrary.simpleMessage(
      "Разрешение на автозапуск",
    ),
    "permissionDialogButtonText": MessageLookupByLibrary.simpleMessage(
      "Позволять",
    ),
    "permissionDialogNotificationText2": MessageLookupByLibrary.simpleMessage(
      "Будьте в курсе событий благодаря оповещениям, напоминаниям и важной информации.",
    ),
    "permissionDialogNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Уведомления",
    ),
    "permissionDialogOverlayText2": MessageLookupByLibrary.simpleMessage(
      "Позволяет быстро выполнять действия после звонка, не прерывая рабочий процесс.",
    ),
    "permissionDialogOverlayTitle": MessageLookupByLibrary.simpleMessage(
      "Наложение поверх других приложений",
    ),
    "permissionDialogPhoneStateText4": MessageLookupByLibrary.simpleMessage(
      "Помогает нам определять окончание звонка для отображения полезных функций после звонка.",
    ),
    "permissionDialogPhoneStateTitle": MessageLookupByLibrary.simpleMessage(
      "Состояние телефона",
    ),
    "permissionDialogSettings": MessageLookupByLibrary.simpleMessage(
      "Настройки",
    ),
    "permissionDialogText3": MessageLookupByLibrary.simpleMessage(
      "Мы запрашиваем только те разрешения, которые необходимы для комфортной работы с приложением.",
    ),
    "permissionDialogTitle3": MessageLookupByLibrary.simpleMessage(
      "Необходимые разрешения",
    ),
    "permissionNoteText": MessageLookupByLibrary.simpleMessage(
      "Нажимая «Разрешить и продолжить», вы соглашаетесь с нашей",
    ),
    "permissionOverlayButtonText": MessageLookupByLibrary.simpleMessage(
      "Разрешить",
    ),
    "permissionOverlayDialogButtonText": MessageLookupByLibrary.simpleMessage(
      "Позволять",
    ),
    "permissionOverlayDialogText": MessageLookupByLibrary.simpleMessage(
      "Зачем это нужно?",
    ),
    "permissionOverlayDialogText4": MessageLookupByLibrary.simpleMessage(
      "Предоставьте быстрый доступ к наложению для мгновенного получения информации о звонках, умных напоминаний и удобного последующего взаимодействия после звонков. Не беспокойтесь — ваши личные данные остаются полностью конфиденциальными и защищенными.",
    ),
    "permissionOverlayDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Зачем нужно это разрешение?",
    ),
    "permissionOverlayText2": MessageLookupByLibrary.simpleMessage(
      "Позволяет приложению отображать полезные инструменты, не прерывая вашу работу.",
    ),
    "permissionOverlayTitle": MessageLookupByLibrary.simpleMessage(
      "Разрешение на наложение",
    ),
    "permissionSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "Чтобы продолжить использование этой функции, предоставьте необходимое разрешение в настройках вашего телефона.",
    ),
    "permissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Требуется разрешение",
    ),
    "permissionText3": MessageLookupByLibrary.simpleMessage(
      "Разрешите следующие разрешения для бесперебойной работы приложения.",
    ),
    "personalization": MessageLookupByLibrary.simpleMessage("Персонализация"),
    "phone": MessageLookupByLibrary.simpleMessage("Телефон"),
    "phoneStatePermissionFirstDenialDesc": MessageLookupByLibrary.simpleMessage(
      "Чтобы мигать фонариком при входящих звонках, нам нужен доступ к состоянию вашего телефона. Это позволит приложению определить, когда вы получаете звонок, и включить вспышку.",
    ),
    "phoneStatePermissionTitle": MessageLookupByLibrary.simpleMessage(
      "Требуется доступ к состоянию телефона",
    ),
    "pleaseSelectFuturTime": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, выберите время в будущем",
    ),
    "polish": MessageLookupByLibrary.simpleMessage("Polish"),
    "portuguese": MessageLookupByLibrary.simpleMessage("Portuguese"),
    "pressBackAgainToExit": MessageLookupByLibrary.simpleMessage(
      "Нажмите кнопку «Назад» ещё раз, чтобы выйти.",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Политика конфиденциальности",
    ),
    "privacyPolicyPermission": MessageLookupByLibrary.simpleMessage(
      "Политика конфиденциальности",
    ),
    "privateNumber": MessageLookupByLibrary.simpleMessage("Частный номер"),
    "proceed": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "rateUs": MessageLookupByLibrary.simpleMessage("Оцените нас"),
    "reminderAlert": MessageLookupByLibrary.simpleMessage("Напоминание!"),
    "reminderDeleted": MessageLookupByLibrary.simpleMessage(
      "Напоминание удалено!",
    ),
    "reminderSetSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Напоминание успешно установлено!",
    ),
    "resultNotFound": MessageLookupByLibrary.simpleMessage(
      "Результат не найден.",
    ),
    "ring": MessageLookupByLibrary.simpleMessage("Кольцо"),
    "romanian": MessageLookupByLibrary.simpleMessage("Romanian"),
    "russian": MessageLookupByLibrary.simpleMessage("Russian"),
    "safetapDesc": MessageLookupByLibrary.simpleMessage(
      "Ежедневная проверка безопасности и оповещения",
    ),
    "screenLight": MessageLookupByLibrary.simpleMessage("Подсветка экрана"),
    "searchApps": MessageLookupByLibrary.simpleMessage("Поиск приложений…"),
    "seeCallInformation": MessageLookupByLibrary.simpleMessage(
      "Посмотреть информацию о звонке",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "shakeNotificationText": MessageLookupByLibrary.simpleMessage(
      "Встряхните устройство, чтобы включить или выключить фонарик.",
    ),
    "shakeNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Встряхните, чтобы включить фонарик.",
    ),
    "shakePermissionDialogDescription": MessageLookupByLibrary.simpleMessage(
      "Для использования функции Shake to Flash, пожалуйста, разрешите отправку уведомлений, чтобы служба Shake могла работать в фоновом режиме.",
    ),
    "shakePermissionDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Встряхните, чтобы получить разрешение на использование Flash.",
    ),
    "shakePermissionSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Для работы службы Shake to Flash требуется разрешение на отправку уведомлений. Пожалуйста, разрешите уведомления в настройках.",
    ),
    "shakePermissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Включить разрешение на отправку уведомлений",
    ),
    "shakeToToggleFlashlight": MessageLookupByLibrary.simpleMessage(
      "Встряхните, чтобы включить/выключить фонарик",
    ),
    "shareApp": MessageLookupByLibrary.simpleMessage("Поделиться приложением"),
    "silent": MessageLookupByLibrary.simpleMessage("Тихий"),
    "spanish": MessageLookupByLibrary.simpleMessage("Spanish"),
    "spendlyDesc": MessageLookupByLibrary.simpleMessage(
      "Учет расходов и планировщик бюджета",
    ),
    "subtextPermissionDailoge": MessageLookupByLibrary.simpleMessage(
      "Разрешите следующие разрешения, чтобы использовать приложение без перебоев.",
    ),
    "subtextPermissionDialog": MessageLookupByLibrary.simpleMessage(
      "Разрешите следующие разрешения, чтобы использовать приложение без перебоев.",
    ),
    "systemDefault": MessageLookupByLibrary.simpleMessage(
      "Системные настройки по умолчанию",
    ),
    "tabFlashAlert": MessageLookupByLibrary.simpleMessage("Флэш-ув."),
    "tabFlashLight": MessageLookupByLibrary.simpleMessage("Вспышка света"),
    "tabStroboscope": MessageLookupByLibrary.simpleMessage("Стробоскоп"),
    "tapScreenToHideControls": MessageLookupByLibrary.simpleMessage(
      "Коснитесь экрана, чтобы скрыть элементы управления.",
    ),
    "testFlash": MessageLookupByLibrary.simpleMessage("ТЕСТОВАЯ ВСПЫШКА"),
    "testOff": MessageLookupByLibrary.simpleMessage("Тест выключен"),
    "testOn": MessageLookupByLibrary.simpleMessage("Тест на"),
    "thai": MessageLookupByLibrary.simpleMessage("Thai"),
    "tipsplitDesc": MessageLookupByLibrary.simpleMessage(
      "Разделение счета и калькулятор чаевых",
    ),
    "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
    "tomorrow": MessageLookupByLibrary.simpleMessage("Завтра"),
    "torchTurnedOn": MessageLookupByLibrary.simpleMessage("Фонарик включен"),
    "turkish": MessageLookupByLibrary.simpleMessage("Turkish"),
    "turnFlashlightOn": MessageLookupByLibrary.simpleMessage(
      "Включить фонарик при запуске",
    ),
    "turnOff": MessageLookupByLibrary.simpleMessage("Выключать"),
    "ukrainian": MessageLookupByLibrary.simpleMessage("Ukrainian"),
    "unableToUnlockFeatures": MessageLookupByLibrary.simpleMessage(
      "Включить для разблокировки функций",
    ),
    "vibrate": MessageLookupByLibrary.simpleMessage("Вибрация"),
    "vietnam": MessageLookupByLibrary.simpleMessage("Vietnamese"),
    "waterReminderDesc": MessageLookupByLibrary.simpleMessage(
      "Напоминание пить воду и трекер гидратации",
    ),
  };
}
