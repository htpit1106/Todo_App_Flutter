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

  /// `Save`
  String get button_save {
    return Intl.message('Save', name: 'button_save', desc: '', args: []);
  }

  /// `List is empty`
  String get label_list_empty {
    return Intl.message(
      'List is empty',
      name: 'label_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get hint_email {
    return Intl.message('Email', name: 'hint_email', desc: '', args: []);
  }

  /// `Please enter your email`
  String get valid_email_required {
    return Intl.message(
      'Please enter your email',
      name: 'valid_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hint_password {
    return Intl.message('Password', name: 'hint_password', desc: '', args: []);
  }

  /// `Confirm password`
  String get hint_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'hint_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get button_sign_up {
    return Intl.message('Sign Up', name: 'button_sign_up', desc: '', args: []);
  }

  /// `Log In`
  String get button_log_in {
    return Intl.message('Log In', name: 'button_log_in', desc: '', args: []);
  }

  /// `Login`
  String get button_login {
    return Intl.message('Login', name: 'button_login', desc: '', args: []);
  }

  /// `Forgot Password`
  String get button_forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'button_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Field cannot be empty`
  String get valid_field_empty {
    return Intl.message(
      'Field cannot be empty',
      name: 'valid_field_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your mail`
  String get valid_email_enter {
    return Intl.message(
      'Please enter your mail',
      name: 'valid_email_enter',
      desc: '',
      args: [],
    );
  }

  /// `Email is not correct`
  String get valid_email_format {
    return Intl.message(
      'Email is not correct',
      name: 'valid_email_format',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get valid_password_enter {
    return Intl.message(
      'Please enter your password',
      name: 'valid_password_enter',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password again`
  String get valid_confirm_password_enter {
    return Intl.message(
      'Please enter your password again',
      name: 'valid_confirm_password_enter',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password not match`
  String get valid_confirm_password_mismatch {
    return Intl.message(
      'Confirm password not match',
      name: 'valid_confirm_password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get title_update_profile {
    return Intl.message(
      'Update Profile',
      name: 'title_update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Upload avatar`
  String get button_upload_avatar {
    return Intl.message(
      'Upload avatar',
      name: 'button_upload_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get hint_name {
    return Intl.message('Name', name: 'hint_name', desc: '', args: []);
  }

  /// `Birthday`
  String get hint_birthday {
    return Intl.message('Birthday', name: 'hint_birthday', desc: '', args: []);
  }

  /// `Your full name`
  String get hint_full_name {
    return Intl.message(
      'Your full name',
      name: 'hint_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Manage tasks easily`
  String get onboarding_title {
    return Intl.message(
      'Manage tasks easily',
      name: 'onboarding_title',
      desc: '',
      args: [],
    );
  }

  /// `Create, track, and complete daily tasks in a simple way.`
  String get onboarding_description {
    return Intl.message(
      'Create, track, and complete daily tasks in a simple way.',
      name: 'onboarding_description',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onboarding_button_start {
    return Intl.message(
      'Get Started',
      name: 'onboarding_button_start',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get menu_update_profile {
    return Intl.message(
      'Update Profile',
      name: 'menu_update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get menu_change_password {
    return Intl.message(
      'Change password',
      name: 'menu_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Term & Policy`
  String get menu_terms_and_policy {
    return Intl.message(
      'Term & Policy',
      name: 'menu_terms_and_policy',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get menu_logout {
    return Intl.message('Logout', name: 'menu_logout', desc: '', args: []);
  }

  /// `Delete Account`
  String get menu_delete_account {
    return Intl.message(
      'Delete Account',
      name: 'menu_delete_account',
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
