
import 'package:flashlight/generated/assets.gen.dart';

enum AppLanguage {
  english(
    label: "English",
    value: "en",
  ),
  espanol(
    label: "Español",
    value: "es",
  ),
  francais(
    label: "Français",
    value: "fr",
  ),
  francaisCanada(
    label: "Français - Canada",
    value: "fr-CA",
  ),
  portugues(
    label: "Português",
    value: "pt",
  ),
  portuguesBrasil(
    label: "Português - Brasil",
    value: "pt-BR",
  ),
  arabic(
    label: "عربي",
    value: "ar",
  ),
  russian(
    label: "Русский",
    value: "ru",
  ),
  korean(
    label: "한국인",
    value: "ko",
  ),
  german(
    label: "Deutsch",
    value: "de",
  ),
  turkish(
    label: "Türkçe",
    value: "tr",
  ),
  italian(
    label: "Italiano",
    value: "it",
  ),
  vietnamese(
    label: "Tiếng Việt",
    value: "vi",
  ),
  japanese(
    label: "日本語",
    value: "ja",
  ),
  indonesian(
    label: "Indonesia",
    value: "id",
  ),
  thai(
    label: "แบบไทย",
    value: "th",
  ),
  polish(
    label: "Polski",
    value: "pl",
  ),
  traditionalChinese(
    label: "中文 - 繁體",
    value: "zh-TW",
  ),
  simplifiedChinese(
    label: "中文 - 简体",
    value: "zh-CN",
  ),
  romanian(
    label: "Română",
    value: "ro",
  ),
  hindi(
    label: "हिंदी",
    value: "hi",
  ),
  afrikaans(
    label: "Afrikaans",
    value: "af",
  ),
  hungarian(
    label: "Magyar",
    value: "hu",
  ),
  ukrainian(
    label: "Українська",
    value: "uk",
  ),
  filipino(
    label: "Filipino",
    value: "fil",
  );

  final String label;
  final String value;

  const AppLanguage({
    required this.label,
    required this.value,
  });

  static AppLanguage? fromValue(String? value) {
    if (value == null || value.isEmpty) return null;
    final normalized = value.trim().toLowerCase();
    for (final language in AppLanguage.values) {
      if (language.value.toLowerCase() == normalized) return language;
    }
    for (final language in AppLanguage.values) {
      if (language.value.split('-').first.toLowerCase() == normalized.split('-').first) {
        return language;
      }
    }
    return null;
  }

  String image() {
    return switch (this) {
      AppLanguage.english => Assets.icons.language.icUsa.path,
      AppLanguage.espanol => Assets.icons.language.icEspanol.path,
      AppLanguage.francais => Assets.icons.language.icFrancais.path,
      AppLanguage.francaisCanada =>
      Assets.icons.language.icFrancaisCanada.path,
      AppLanguage.portugues => Assets.icons.language.icPortugal.path,
      AppLanguage.portuguesBrasil => Assets.icons.language.icBrasil.path,
      AppLanguage.arabic => Assets.icons.language.icArabic.path,
      AppLanguage.russian => Assets.icons.language.icRussia.path,
      AppLanguage.korean => Assets.icons.language.icKorea.path,
      AppLanguage.german => Assets.icons.language.icGerman.path,
      AppLanguage.turkish => Assets.icons.language.icTurkey.path,
      AppLanguage.italian => Assets.icons.language.icItaly.path,
      AppLanguage.vietnamese => Assets.icons.language.icVietnam.path,
      AppLanguage.japanese => Assets.icons.language.icJapan.path,
      AppLanguage.indonesian => Assets.icons.language.icIndonesia.path,
      AppLanguage.thai => Assets.icons.language.icThai.path,
      AppLanguage.polish => Assets.icons.language.icPolski.path,
      AppLanguage.traditionalChinese =>
      Assets.icons.language.icChina.path,
      AppLanguage.simplifiedChinese =>
      Assets.icons.language.icChina.path,
      AppLanguage.romanian => Assets.icons.language.icRomania.path,
      AppLanguage.hindi => Assets.icons.language.icHindi.path,
      AppLanguage.afrikaans => Assets.icons.language.icAfriaans.path,
      AppLanguage.hungarian => Assets.icons.language.icMagyar.path,
      AppLanguage.ukrainian => Assets.icons.language.icUkrain.path,
      AppLanguage.filipino => Assets.icons.language.icPhilippines.path,
    };
  }
}





