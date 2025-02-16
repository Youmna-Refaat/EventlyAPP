import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  void back({Object? arguments}) => Navigator.of(this).pop(arguments);

  void goToNamed({required String routeName, Object? arguments}) =>
      Navigator.of(this).pushNamed(
        routeName,
        arguments: arguments,
      );

  void goToNamedReplace({required String routeName, Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  void goBackUntil({required String untilRoute}) => Navigator.of(this).popUntil(
        (routeName) => routeName.settings.name == untilRoute,
      );

  void goBackUntilAndPushNamed(
          {required String untilRoute,
          required String routeName,
          Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        routeName,
        (routeName) => routeName.settings.name == untilRoute,
        arguments: arguments,
      );

  void removeAllAndPushNamed({required String routeName, Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        routeName,
        (routeName) => false,
        arguments: arguments,
      );
}
