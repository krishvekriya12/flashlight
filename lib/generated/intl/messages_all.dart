// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_af.dart' deferred as messages_af;
import 'messages_ar.dart' deferred as messages_ar;
import 'messages_de.dart' deferred as messages_de;
import 'messages_en.dart' deferred as messages_en;
import 'messages_es.dart' deferred as messages_es;
import 'messages_fil.dart' deferred as messages_fil;
import 'messages_fr.dart' deferred as messages_fr;
import 'messages_fr_CA.dart' deferred as messages_fr_ca;
import 'messages_hi.dart' deferred as messages_hi;
import 'messages_hu.dart' deferred as messages_hu;
import 'messages_id.dart' deferred as messages_id;
import 'messages_it.dart' deferred as messages_it;
import 'messages_ja.dart' deferred as messages_ja;
import 'messages_ko.dart' deferred as messages_ko;
import 'messages_pl.dart' deferred as messages_pl;
import 'messages_pt.dart' deferred as messages_pt;
import 'messages_pt_BR.dart' deferred as messages_pt_br;
import 'messages_ro.dart' deferred as messages_ro;
import 'messages_ru.dart' deferred as messages_ru;
import 'messages_th.dart' deferred as messages_th;
import 'messages_tr.dart' deferred as messages_tr;
import 'messages_uk.dart' deferred as messages_uk;
import 'messages_vi.dart' deferred as messages_vi;
import 'messages_zh.dart' deferred as messages_zh;
import 'messages_zh_TW.dart' deferred as messages_zh_tw;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'af': messages_af.loadLibrary,
  'ar': messages_ar.loadLibrary,
  'de': messages_de.loadLibrary,
  'en': messages_en.loadLibrary,
  'es': messages_es.loadLibrary,
  'fil': messages_fil.loadLibrary,
  'fr': messages_fr.loadLibrary,
  'fr_CA': messages_fr_ca.loadLibrary,
  'hi': messages_hi.loadLibrary,
  'hu': messages_hu.loadLibrary,
  'id': messages_id.loadLibrary,
  'it': messages_it.loadLibrary,
  'ja': messages_ja.loadLibrary,
  'ko': messages_ko.loadLibrary,
  'pl': messages_pl.loadLibrary,
  'pt': messages_pt.loadLibrary,
  'pt_BR': messages_pt_br.loadLibrary,
  'ro': messages_ro.loadLibrary,
  'ru': messages_ru.loadLibrary,
  'th': messages_th.loadLibrary,
  'tr': messages_tr.loadLibrary,
  'uk': messages_uk.loadLibrary,
  'vi': messages_vi.loadLibrary,
  'zh': messages_zh.loadLibrary,
  'zh_TW': messages_zh_tw.loadLibrary,
};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'af':
      return messages_af.messages;
    case 'ar':
      return messages_ar.messages;
    case 'de':
      return messages_de.messages;
    case 'en':
      return messages_en.messages;
    case 'es':
      return messages_es.messages;
    case 'fil':
      return messages_fil.messages;
    case 'fr':
      return messages_fr.messages;
    case 'fr_CA':
      return messages_fr_ca.messages;
    case 'hi':
      return messages_hi.messages;
    case 'hu':
      return messages_hu.messages;
    case 'id':
      return messages_id.messages;
    case 'it':
      return messages_it.messages;
    case 'ja':
      return messages_ja.messages;
    case 'ko':
      return messages_ko.messages;
    case 'pl':
      return messages_pl.messages;
    case 'pt':
      return messages_pt.messages;
    case 'pt_BR':
      return messages_pt_br.messages;
    case 'ro':
      return messages_ro.messages;
    case 'ru':
      return messages_ru.messages;
    case 'th':
      return messages_th.messages;
    case 'tr':
      return messages_tr.messages;
    case 'uk':
      return messages_uk.messages;
    case 'vi':
      return messages_vi.messages;
    case 'zh':
      return messages_zh.messages;
    case 'zh_TW':
      return messages_zh_tw.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null,
  );
  if (availableLocale == null) {
    return new Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? new Future.value(false) : lib());
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(
    locale,
    _messagesExistFor,
    onFailure: (_) => null,
  );
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
