import 'dart:io';

enum AppIcons {
  discount('discount-icon.svg');

  final String name;

  const AppIcons(this.name);

  String get path => 'assets/icons/$name';

  File get file => File(path);
}
