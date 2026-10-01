// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  static String m0(version) => "Versão ${version}";

  static String m1(permission) =>
      "Este recurso não pode funcionar sem a permissão ${permission}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutUs": MessageLookupByLibrary.simpleMessage("Sobre nós"),
    "afrikaans": MessageLookupByLibrary.simpleMessage("Afrikaans"),
    "afterCallFunction": MessageLookupByLibrary.simpleMessage(
      "Recurso pós-chamada",
    ),
    "afterCallOption": MessageLookupByLibrary.simpleMessage(
      "Opção pós-chamada",
    ),
    "afterCallOptionSubText": MessageLookupByLibrary.simpleMessage(
      "Após uma chamada, você verá opções para retornar a ligação, enviar uma mensagem ou salvar o contato.",
    ),
    "afterCallSubText": MessageLookupByLibrary.simpleMessage(
      "Após uma chamada, tenha opções para retornar a ligação, enviar uma mensagem ou salvar o contato.",
    ),
    "allow": MessageLookupByLibrary.simpleMessage("Permitir"),
    "allowPermissionCallend": MessageLookupByLibrary.simpleMessage(
      "Permitir acesso",
    ),
    "appMode": MessageLookupByLibrary.simpleMessage("Modo do aplicativo"),
    "appName": MessageLookupByLibrary.simpleMessage("Lanterna"),
    "appVersion": m0,
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Tem certeza?"),
    "areYouSureSubText": MessageLookupByLibrary.simpleMessage(
      "Você não poderá ver nenhuma informação sobre as chamadas",
    ),
    "autoStartAccess": MessageLookupByLibrary.simpleMessage(
      "Acesso à inicialização automática",
    ),
    "calendar": MessageLookupByLibrary.simpleMessage("Calendário"),
    "callLater": MessageLookupByLibrary.simpleMessage(
      "Ligo para você mais tarde",
    ),
    "cameraPermissionFirstDenialDesc": MessageLookupByLibrary.simpleMessage(
      "Precisamos acessar sua câmera para manter a lanterna ligada mesmo quando o aplicativo estiver fechado ou funcionando em segundo plano. Sem essa permissão, a lanterna funcionará apenas enquanto você estiver usando o aplicativo.",
    ),
    "cameraPermissionTitle": MessageLookupByLibrary.simpleMessage(
      "Acesso à câmera necessário",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cantTalkNow": MessageLookupByLibrary.simpleMessage(
      "Não posso falar agora",
    ),
    "chinese": MessageLookupByLibrary.simpleMessage("Chinese"),
    "chooseApp": MessageLookupByLibrary.simpleMessage("Escolher aplicativo"),
    "chooseColor": MessageLookupByLibrary.simpleMessage("Escolher cor"),
    "closeButton": MessageLookupByLibrary.simpleMessage("Close button"),
    "contact": MessageLookupByLibrary.simpleMessage("Contato"),
    "createReminder": MessageLookupByLibrary.simpleMessage(
      "Criar novo lembrete",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Modo escuro"),
    "dialogBackPressOverlayPermissionDescription":
        MessageLookupByLibrary.simpleMessage(
          "O aplicativo só funcionará se a permissão para exibir sobre outros aplicativos for concedida.",
        ),
    "dialogBackPressPhoneNotificationPermissionDescription": m1,
    "dismiss": MessageLookupByLibrary.simpleMessage("Dispensar"),
    "duration": MessageLookupByLibrary.simpleMessage("Duração:"),
    "enable": MessageLookupByLibrary.simpleMessage("Ativar"),
    "enableDisplayPermission": MessageLookupByLibrary.simpleMessage(
      "Ativar permissão de exibição",
    ),
    "enableFor": MessageLookupByLibrary.simpleMessage("ATIVAR PARA"),
    "enableNotificationAccess": MessageLookupByLibrary.simpleMessage(
      "Ativar acesso às notificações",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterMessage": MessageLookupByLibrary.simpleMessage(
      "Escrever mensagem pessoal",
    ),
    "enterReminderText": MessageLookupByLibrary.simpleMessage(
      "Preencha o conteúdo do lembrete",
    ),
    "fillipino": MessageLookupByLibrary.simpleMessage("Filipino"),
    "flashOn": MessageLookupByLibrary.simpleMessage("FLASH LIGADO"),
    "french": MessageLookupByLibrary.simpleMessage("French"),
    "german": MessageLookupByLibrary.simpleMessage("German"),
    "hindi": MessageLookupByLibrary.simpleMessage("Hindi"),
    "hungarian": MessageLookupByLibrary.simpleMessage("Hungarian"),
    "imOnWay": MessageLookupByLibrary.simpleMessage("Estou a caminho"),
    "incoming": MessageLookupByLibrary.simpleMessage("Recebida"),
    "incomingCall": MessageLookupByLibrary.simpleMessage("Chamada recebida"),
    "incomingSms": MessageLookupByLibrary.simpleMessage("SMS recebido"),
    "indonesian": MessageLookupByLibrary.simpleMessage("Indonesian"),
    "installApp": MessageLookupByLibrary.simpleMessage("Obter"),
    "italian": MessageLookupByLibrary.simpleMessage("Italian"),
    "japan": MessageLookupByLibrary.simpleMessage("Japanese"),
    "keepIt": MessageLookupByLibrary.simpleMessage("Manter"),
    "korean": MessageLookupByLibrary.simpleMessage("Korean"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "languages": MessageLookupByLibrary.simpleMessage("Idiomas"),
    "later": MessageLookupByLibrary.simpleMessage("Mais tarde"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Modo claro"),
    "mail": MessageLookupByLibrary.simpleMessage("E-mail"),
    "message": MessageLookupByLibrary.simpleMessage("Mensagens"),
    "missedCall": MessageLookupByLibrary.simpleMessage("Chamada perdida"),
    "noAppFound": MessageLookupByLibrary.simpleMessage(
      "Nenhum aplicativo encontrado.",
    ),
    "noReminders": MessageLookupByLibrary.simpleMessage("Nenhum lembrete"),
    "notSet": MessageLookupByLibrary.simpleMessage("Não definido"),
    "notification": MessageLookupByLibrary.simpleMessage("Notificação"),
    "notificationPermissionSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "Permita o acesso às notificações nas configurações para receber alertas de flash.",
    ),
    "notificationPermissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Ativar notificações",
    ),
    "notificationPhone": MessageLookupByLibrary.simpleMessage(
      "Notificações e telefone",
    ),
    "notificationRequired": MessageLookupByLibrary.simpleMessage(
      "Para receber alertas de flash ao receber SMS, permita o acesso às notificações. Isso permite detectar mensagens e ativar o flash para fornecer alertas instantâneos. Deseja ativá-lo agora?",
    ),
    "notificationRequired2": MessageLookupByLibrary.simpleMessage(
      "Ative esta configuração, caso contrário, a lanterna poderá não piscar ao receber chamadas ou SMS.",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notificações"),
    "offLength": MessageLookupByLibrary.simpleMessage("Duração desligada"),
    "onLength": MessageLookupByLibrary.simpleMessage("Duração ligada"),
    "otherApps": MessageLookupByLibrary.simpleMessage("Mais aplicativos"),
    "outgoing": MessageLookupByLibrary.simpleMessage("Realizada"),
    "overlayPermissionMaintextOne": MessageLookupByLibrary.simpleMessage(
      "Ative a",
    ),
    "overlayPermissionMaintextThree": MessageLookupByLibrary.simpleMessage(
      ". Alguns dispositivos podem usar um nome diferente. Use um dos métodos acima.",
    ),
    "overlayPermissionMaintextTwo": MessageLookupByLibrary.simpleMessage(
      "permissão “Exibir sobre outros aplicativos (Aparecer na parte superior)”",
    ),
    "permissionButtonText": MessageLookupByLibrary.simpleMessage(
      "Permitir e continuar",
    ),
    "permissionDialogAutoStartText4": MessageLookupByLibrary.simpleMessage(
      "Ative a inicialização automática para manter o aplicativo funcionando corretamente.",
    ),
    "permissionDialogAutoStartTitle": MessageLookupByLibrary.simpleMessage(
      "Inicialização automática",
    ),
    "permissionDialogButtonText": MessageLookupByLibrary.simpleMessage(
      "Permitir",
    ),
    "permissionDialogNotificationText2": MessageLookupByLibrary.simpleMessage(
      "Fique atualizado com alertas, lembretes e informações importantes.",
    ),
    "permissionDialogNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Notificações",
    ),
    "permissionDialogOverlayText2": MessageLookupByLibrary.simpleMessage(
      "Permite acessar rapidamente as ações pós-chamada sem interromper o que você está fazendo.",
    ),
    "permissionDialogOverlayTitle": MessageLookupByLibrary.simpleMessage(
      "Exibir sobre outros aplicativos",
    ),
    "permissionDialogPhoneStateText4": MessageLookupByLibrary.simpleMessage(
      "Ajuda a detectar o encerramento das chamadas para ativar os recursos pós-chamada.",
    ),
    "permissionDialogPhoneStateTitle": MessageLookupByLibrary.simpleMessage(
      "Estado do telefone",
    ),
    "permissionDialogSettings": MessageLookupByLibrary.simpleMessage(
      "Configurações",
    ),
    "permissionDialogText3": MessageLookupByLibrary.simpleMessage(
      "Solicitamos apenas as permissões necessárias para proporcionar uma experiência tranquila.",
    ),
    "permissionDialogTitle3": MessageLookupByLibrary.simpleMessage(
      "Permissões necessárias",
    ),
    "permissionNoteText": MessageLookupByLibrary.simpleMessage(
      "Ao selecionar Permitir e continuar, você concorda com nossa",
    ),
    "permissionOverlayButtonText": MessageLookupByLibrary.simpleMessage(
      "Permitir acesso",
    ),
    "permissionOverlayDialogButtonText": MessageLookupByLibrary.simpleMessage(
      "Permitir",
    ),
    "permissionOverlayDialogText": MessageLookupByLibrary.simpleMessage(
      "Por que é necessário?",
    ),
    "permissionOverlayDialogText4": MessageLookupByLibrary.simpleMessage(
      "Tenha acesso rápido à sobreposição para informações instantâneas sobre chamadas, lembretes inteligentes e opções fáceis de acompanhamento.\n\nNão se preocupe — seus dados pessoais permanecem totalmente privados e seguros conosco.",
    ),
    "permissionOverlayDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Por que essa permissão é necessária?",
    ),
    "permissionOverlayText2": MessageLookupByLibrary.simpleMessage(
      "Permite que o aplicativo exiba ferramentas úteis sem interromper o que você está fazendo.",
    ),
    "permissionOverlayTitle": MessageLookupByLibrary.simpleMessage(
      "Permissão de sobreposição",
    ),
    "permissionSettingsDesc": MessageLookupByLibrary.simpleMessage(
      "Para continuar usando este recurso, permita a permissão necessária nas configurações do seu telefone.",
    ),
    "permissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Permissão necessária",
    ),
    "permissionText3": MessageLookupByLibrary.simpleMessage(
      "Permita as seguintes permissões para uma experiência tranquila com o aplicativo.",
    ),
    "personalization": MessageLookupByLibrary.simpleMessage("Personalização"),
    "phone": MessageLookupByLibrary.simpleMessage("Telefone"),
    "phoneStatePermissionFirstDenialDesc": MessageLookupByLibrary.simpleMessage(
      "Para fazer a lanterna piscar durante chamadas recebidas, precisamos acessar o estado do telefone. Isso permite que o aplicativo detecte quando você está recebendo uma chamada para que o flash possa alertá-lo.",
    ),
    "phoneStatePermissionTitle": MessageLookupByLibrary.simpleMessage(
      "Acesso ao estado do telefone necessário",
    ),
    "pleaseSelectFuturTime": MessageLookupByLibrary.simpleMessage(
      "Selecione um horário futuro",
    ),
    "polish": MessageLookupByLibrary.simpleMessage("Polish"),
    "portuguese": MessageLookupByLibrary.simpleMessage("Portuguese"),
    "pressBackAgainToExit": MessageLookupByLibrary.simpleMessage(
      "Pressione voltar novamente para sair",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de privacidade",
    ),
    "privacyPolicyPermission": MessageLookupByLibrary.simpleMessage(
      "Política de Privacidade",
    ),
    "privateNumber": MessageLookupByLibrary.simpleMessage("Número privado"),
    "proceed": MessageLookupByLibrary.simpleMessage("Continuar"),
    "rateUs": MessageLookupByLibrary.simpleMessage("Avalie-nos"),
    "reminderAlert": MessageLookupByLibrary.simpleMessage(
      "Alerta de lembrete!",
    ),
    "reminderDeleted": MessageLookupByLibrary.simpleMessage(
      "Lembrete excluído!",
    ),
    "reminderSetSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Lembrete definido com sucesso!",
    ),
    "resultNotFound": MessageLookupByLibrary.simpleMessage(
      "Nenhum resultado encontrado.",
    ),
    "ring": MessageLookupByLibrary.simpleMessage("Toque"),
    "romanian": MessageLookupByLibrary.simpleMessage("Romanian"),
    "russian": MessageLookupByLibrary.simpleMessage("Russian"),
    "safetapDesc": MessageLookupByLibrary.simpleMessage(
      "Check-in diário de segurança e alertas",
    ),
    "screenLight": MessageLookupByLibrary.simpleMessage("Luz da tela"),
    "searchApps": MessageLookupByLibrary.simpleMessage(
      "Pesquisar aplicativos…",
    ),
    "seeCallInformation": MessageLookupByLibrary.simpleMessage(
      "Ver informações da chamada",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
    "shakeNotificationText": MessageLookupByLibrary.simpleMessage(
      "Agite o dispositivo para ligar ou desligar a lanterna",
    ),
    "shakeNotificationTitle": MessageLookupByLibrary.simpleMessage(
      "Agitar para alternar a lanterna está ativado",
    ),
    "shakePermissionDialogDescription": MessageLookupByLibrary.simpleMessage(
      "Para usar o Agitar e Acender, permita as notificações para que o serviço de agitação possa funcionar em segundo plano.",
    ),
    "shakePermissionDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Permissão para Agitar e Acender",
    ),
    "shakePermissionSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "A permissão de notificações é necessária para executar o serviço Agitar e Acender. Permita as notificações nas Configurações.",
    ),
    "shakePermissionSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Ativar permissão de notificações",
    ),
    "shakeToToggleFlashlight": MessageLookupByLibrary.simpleMessage(
      "Agite para alternar a lanterna",
    ),
    "shareApp": MessageLookupByLibrary.simpleMessage("Compartilhar aplicativo"),
    "silent": MessageLookupByLibrary.simpleMessage("Silencioso"),
    "spanish": MessageLookupByLibrary.simpleMessage("Spanish"),
    "spendlyDesc": MessageLookupByLibrary.simpleMessage(
      "Controle de despesas e orçamento",
    ),
    "subtextPermissionDailoge": MessageLookupByLibrary.simpleMessage(
      "Permita as seguintes permissões para usar o aplicativo sem interrupções.",
    ),
    "subtextPermissionDialog": MessageLookupByLibrary.simpleMessage(
      "Permita as seguintes permissões para usar o aplicativo sem interrupções.",
    ),
    "systemDefault": MessageLookupByLibrary.simpleMessage("Padrão do sistema"),
    "tabFlashAlert": MessageLookupByLibrary.simpleMessage("Alerta de flash"),
    "tabFlashLight": MessageLookupByLibrary.simpleMessage("Lanterna"),
    "tabStroboscope": MessageLookupByLibrary.simpleMessage("Estroboscópio"),
    "tapScreenToHideControls": MessageLookupByLibrary.simpleMessage(
      "Toque na tela para ocultar os controles",
    ),
    "testFlash": MessageLookupByLibrary.simpleMessage("TESTAR FLASH"),
    "testOff": MessageLookupByLibrary.simpleMessage("Testar desligado"),
    "testOn": MessageLookupByLibrary.simpleMessage("Testar ligado"),
    "thai": MessageLookupByLibrary.simpleMessage("Thai"),
    "tipsplitDesc": MessageLookupByLibrary.simpleMessage(
      "Divisão de contas e calculadora de gorjetas",
    ),
    "today": MessageLookupByLibrary.simpleMessage("Hoje"),
    "tomorrow": MessageLookupByLibrary.simpleMessage("Amanhã"),
    "torchTurnedOn": MessageLookupByLibrary.simpleMessage("Lanterna ligada"),
    "turkish": MessageLookupByLibrary.simpleMessage("Turkish"),
    "turnFlashlightOn": MessageLookupByLibrary.simpleMessage(
      "Ligar a lanterna ao iniciar",
    ),
    "turnOff": MessageLookupByLibrary.simpleMessage("Desligar"),
    "ukrainian": MessageLookupByLibrary.simpleMessage("Ukrainian"),
    "unableToUnlockFeatures": MessageLookupByLibrary.simpleMessage(
      "Ative para desbloquear os recursos",
    ),
    "vibrate": MessageLookupByLibrary.simpleMessage("Vibrar"),
    "vietnam": MessageLookupByLibrary.simpleMessage("Vietnamese"),
    "waterReminderDesc": MessageLookupByLibrary.simpleMessage(
      "Lembrete para beber água e hidratação",
    ),
  };
}
