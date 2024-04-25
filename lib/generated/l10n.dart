// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search for Services`
  String get SearchText {
    return Intl.message(
      'Search for Services',
      name: 'SearchText',
      desc: '',
      args: [],
    );
  }

  /// `Popular Categories`
  String get PopularCat {
    return Intl.message(
      'Popular Categories',
      name: 'PopularCat',
      desc: '',
      args: [],
    );
  }

  /// `Popular Services`
  String get PopularSer {
    return Intl.message(
      'Popular Services',
      name: 'PopularSer',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get Seeall {
    return Intl.message(
      'See all',
      name: 'Seeall',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get Favourites {
    return Intl.message(
      'Favourites',
      name: 'Favourites',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get Offers {
    return Intl.message(
      'Offers',
      name: 'Offers',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get Call {
    return Intl.message(
      'Call',
      name: 'Call',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get ChangeTheme {
    return Intl.message(
      'Change Theme',
      name: 'ChangeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Change Langauage`
  String get ChangLang {
    return Intl.message(
      'Change Langauage',
      name: 'ChangLang',
      desc: '',
      args: [],
    );
  }

  /// `Upload Categories`
  String get UploadCat {
    return Intl.message(
      'Upload Categories',
      name: 'UploadCat',
      desc: '',
      args: [],
    );
  }

  /// `Upload Services`
  String get UploadService {
    return Intl.message(
      'Upload Services',
      name: 'UploadService',
      desc: '',
      args: [],
    );
  }

  /// `Upload SubCategories`
  String get UploadSubCat {
    return Intl.message(
      'Upload SubCategories',
      name: 'UploadSubCat',
      desc: '',
      args: [],
    );
  }

  /// `Selected Zone (All Zones)`
  String get SelectedZoneAll {
    return Intl.message(
      'Selected Zone (All Zones)',
      name: 'SelectedZoneAll',
      desc: '',
      args: [],
    );
  }

  /// `Selected Zone (One)`
  String get SelectedZoneOne {
    return Intl.message(
      'Selected Zone (One)',
      name: 'SelectedZoneOne',
      desc: '',
      args: [],
    );
  }

  /// `Selected Zone (Two)`
  String get SelectedZonetwo {
    return Intl.message(
      'Selected Zone (Two)',
      name: 'SelectedZonetwo',
      desc: '',
      args: [],
    );
  }

  /// `Selected Zone (Three)`
  String get SelectedZonethree {
    return Intl.message(
      'Selected Zone (Three)',
      name: 'SelectedZonethree',
      desc: '',
      args: [],
    );
  }

  /// `No items Found`
  String get NoItemsFound {
    return Intl.message(
      'No items Found',
      name: 'NoItemsFound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}