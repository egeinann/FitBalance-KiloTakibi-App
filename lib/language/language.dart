import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/language/language_maps/de_DE.dart';
import 'package:kilo_takibi_uyg/language/language_maps/en_us.dart';
import 'package:kilo_takibi_uyg/language/language_maps/es_ES.dart';
import 'package:kilo_takibi_uyg/language/language_maps/fr_FR.dart';
import 'package:kilo_takibi_uyg/language/language_maps/pt_PT.dart';
import 'package:kilo_takibi_uyg/language/language_maps/tr_tr.dart';
import 'package:kilo_takibi_uyg/language/language_maps/zh_CN.dart';

class Languages extends Translations {
  static const defa = Locale("en", "US"); // default dil
  static final languageList = [
    // dil listesi
    const Locale("en", "US"),
    const Locale("tr", "TR"),
    const Locale("es", "ES"),
    const Locale("fr", "FR"),
    const Locale("de", "DE"),
    const Locale("pt", "PT"),
    const Locale("zh", "CN"),
  ];

  @override
  Map<String, Map<String, String>> get keys {
    // İstenilen dil dosyasını yüklemek için
    return {
      'en_US': _loadLocale('en_US'),
      'tr_TR': _loadLocale('tr_TR'),
      'es_ES': _loadLocale('es_ES'),
      'fr_FR': _loadLocale('fr_FR'),
      'de_DE': _loadLocale('de_DE'),
      'pt_PT': _loadLocale('pt_PT'),
      'zh_CN': _loadLocale('zh_CN'),
    };
  }

  // Lazy-loading için bir metot
  Map<String, String> _loadLocale(String locale) {
    switch (locale) {
      case 'en_US':
        return enUS; // en_us.dart dosyasından verileri yükler
      case 'tr_TR':
        return trTR; // tr_tr.dart dosyasından verileri yükler
      case 'es_ES':
        return esES; // es_es.dart dosyasından verileri yükler
      case 'fr_FR':
        return frFR; // fr_fr.dart dosyasından verileri yükler
      case 'de_DE':
        return deDE; // de_de.dart dosyasından verileri yükler
      case 'pt_PT':
        return ptPT; // pt_pt.dart dosyasından verileri yükler
      case 'zh_CN':
        return zhCN; // zh_cn.dart dosyasından verileri yükler
      default:
        return enUS; // Varsayılan olarak İngilizceyi yükle
    }
  }
}
