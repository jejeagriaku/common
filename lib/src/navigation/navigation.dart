import 'package:flutter/cupertino.dart';

class Navigation {
  Navigation._internal();

  /// Pushing page into the navigation stack
  ///
  /// @param:
  /// - [context] : [BuildContext]
  /// - [page] : [Widget]
  /// - [name] : [String]
  ///
  /// @return: Future<[T]>

  static Future<T?> push<T extends Object>({
    required BuildContext context,
    required Widget page,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page, settings: settings),
    );
  }

  /// Presenting page into the navigation stack (FullScreen)
  ///
  /// @param:
  /// - [context] : [BuildContext]
  /// - [page] : [Widget]
  /// - [name] : [String]
  ///
  /// @return: Future<[T]>

  static Future<T?> present<T extends Object>({
    required BuildContext context,
    required Widget page,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => page,
        settings: settings,
      ),
    );
  }

  /// Push & Replace page into the navigation stack
  ///
  /// @param:
  /// - [context] : [BuildContext]
  /// - [page] : [Widget]
  /// - [name] : [String]
  ///
  /// @return: Future<[T]>

  static Future<T?> pushReplacement<T extends Object>({
    required BuildContext context,
    required Widget page,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => page,
        settings: settings,
      ),
    );
  }

  /// Push & Removing previous page into the navigation stack until given name.
  /// Use this function carefully because if there's no routes with given name
  /// found in the navigation stack, it will work similarly like [pushReplacement]
  ///
  /// @param:
  /// - [context] : [BuildContext]
  /// - [page] : [Widget]
  /// - [until] : [String]
  /// - [name] : [String]
  ///
  /// @return: Future<[T]>

  static Future<T?> pushAndRemoveUntil<T extends Object>({
    required BuildContext context,
    required Widget page,
    required String until,
    String? name,
  }) {
    RouteSettings? settings;

    if (name != null) {
      settings = RouteSettings(name: name);
    }

    return Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => page,
        settings: settings,
      ),
          (route) => route.settings.name == until,
    );
  }

  /// Presenting page into the navigation stack with Fade-in Transition
  ///
  /// @param:
  /// - [context] : [BuildContext]
  /// - [page] : [Widget]

  static fade({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.pushReplacement(context, _ADFadeRoute(page: page));
  }

  /// Removing page from navigation stack
  ///
  /// @param:
  /// - [context] : [BuildContext]

  static pop({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  /// Removing page from navigation stack until given page name
  /// Use this function carefully because if there's no routes with given name
  /// found in the navigation stack, it will pop everything.
  ///
  /// @param:
  /// - [context] : [BuildContext]
  /// - [name] : [String]

  static popUntil({
    required BuildContext context,
    required String name,
  }) {
    Navigator.of(context).popUntil((route) => route.settings.name == name);
  }

  /// Removing page from navigation stack until the first stack
  ///
  /// @param:
  /// - [context] : [BuildContext]

  static popToRoot({
    required BuildContext context,
  }) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

class _ADFadeRoute extends PageRouteBuilder {
  final Widget page;

  _ADFadeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
