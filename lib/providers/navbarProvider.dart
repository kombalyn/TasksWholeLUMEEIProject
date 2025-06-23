import 'package:flutter/material.dart';

typedef SwitchToWidgetCallback = void Function(int);

/// A custom `InheritedWidget` that provides a callback to switch between
/// widgets from the bottom navigation bar.
///
/// This is typically used to manage navigation in a `PageView` or similar
/// navigational structure.
///
/// Example:
/// ```dart
/// NavbarProvider.of(context)?.switchToOtherWidgetFromNavBar(2);
/// ```
class NavbarProvider extends InheritedWidget {
  final SwitchToWidgetCallback switchToOtherWidgetFromNavBar;

  const NavbarProvider({
    Key? key,
    required this.switchToOtherWidgetFromNavBar,
    required Widget child,
  }) : super(key: key, child: child);

  /// Retrieves the nearest `NavbarProvider` in the widget tree.
  ///
  /// Throws an assertion error if no provider is found in debug mode.
  static NavbarProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<NavbarProvider>();
    assert(provider != null, 'No NavbarProvider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(NavbarProvider oldWidget) => false;
}
