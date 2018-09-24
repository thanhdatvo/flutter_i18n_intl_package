import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'initialize_i18n/messages_all.dart';
import 'package:flutter_i18n_intl_package/constant.dart' show languages;

class MyLocalizations {
  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      print('localeName' + localeName);
      Intl.defaultLocale = localeName;
      return new MyLocalizations();
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  greetTo(name) => Intl.message("Nice to meet you, $name!",
      name: 'greetTo', desc: 'The application title', args: [name]);

  String get hello {
    return Intl.message('Hello!', name: 'hello');
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return languages.contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) {
    return MyLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalizations> old) {
    return false;
  }
}
