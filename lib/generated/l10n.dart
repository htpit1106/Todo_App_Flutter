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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add New Task`
  String get button_add_new_task {
    return Intl.message(
      'Add New Task',
      name: 'button_add_new_task',
      desc: '',
      args: [],
    );
  }

  /// `Add New Task`
  String get title_add_new_task {
    return Intl.message(
      'Add New Task',
      name: 'title_add_new_task',
      desc: '',
      args: [],
    );
  }

  /// `Task Title`
  String get label_task_title {
    return Intl.message(
      'Task Title',
      name: 'label_task_title',
      desc: '',
      args: [],
    );
  }

  /// `Task Title`
  String get hint_task_title {
    return Intl.message(
      'Task Title',
      name: 'hint_task_title',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get label_category {
    return Intl.message('Category', name: 'label_category', desc: '', args: []);
  }

  /// `Date`
  String get label_date {
    return Intl.message('Date', name: 'label_date', desc: '', args: []);
  }

  /// `Date`
  String get hint_date {
    return Intl.message('Date', name: 'hint_date', desc: '', args: []);
  }

  /// `Time`
  String get label_time {
    return Intl.message('Time', name: 'label_time', desc: '', args: []);
  }

  /// `Time`
  String get hint_time {
    return Intl.message('Time', name: 'hint_time', desc: '', args: []);
  }

  /// `Notes`
  String get label_notes {
    return Intl.message('Notes', name: 'label_notes', desc: '', args: []);
  }

  /// `Notes`
  String get hint_notes {
    return Intl.message('Notes', name: 'hint_notes', desc: '', args: []);
  }

  /// `My Todo List`
  String get title_app {
    return Intl.message('My Todo List', name: 'title_app', desc: '', args: []);
  }

  /// `Completed`
  String get label_completed {
    return Intl.message(
      'Completed',
      name: 'label_completed',
      desc: '',
      args: [],
    );
  }

  /// `Title is required`
  String get valid_title_required {
    return Intl.message(
      'Title is required',
      name: 'valid_title_required',
      desc: '',
      args: [],
    );
  }

  /// `Date is required`
  String get valid_date_required {
    return Intl.message(
      'Date is required',
      name: 'valid_date_required',
      desc: '',
      args: [],
    );
  }

  /// `Time is required`
  String get valid_time_required {
    return Intl.message(
      'Time is required',
      name: 'valid_time_required',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
