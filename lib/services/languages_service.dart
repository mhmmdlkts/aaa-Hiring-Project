class LanguageService {
  static const List<String> supportedLanguages = ['en', 'de', 'pl'];
  static const String defaultLanguage = 'en';

  static String getLang(String lang) {
    if (supportedLanguages.contains(lang))
      return lang;
    return defaultLanguage;
  }
}