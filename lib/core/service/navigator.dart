import 'package:flutter/material.dart';

class NavigationServices {}

extension NavigationService on BuildContext {
  navigateReplace(Widget route, {isDialog = false}) =>
      Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          fullscreenDialog: isDialog,
          builder: (context) => route,
        ),
      );

  navigate(Widget route, {isDialog = false}) => Navigator.push(
        this,
        MaterialPageRoute(
          fullscreenDialog: isDialog,
          builder: (context) => route,
        ),
      );

  popToFirst() => Navigator.of(this).popUntil((route) => route.isFirst);

  popView({data}) => Navigator.pop(this, data);

  navigateTransparentRoute(Widget route, double dx, dy) async {
    return await Navigator.push(
      this,
      TransparentRoute(
        builder: (context) => route,
        dx: dx,
        dy: dy,
      ),
    );
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    required this.dx,
    required this.dy,
    RouteSettings? settings,
  }) : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  final double dx, dy;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: Offset(dx, dy),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, -1.0),
            ).animate(secondaryAnimation),
            child: result,
          ),
        ),
      ),
    );
  }
}
