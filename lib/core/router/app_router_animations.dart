import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouterAnimations {
  static CustomTransitionPage slideAnimation({required Widget child,required GoRouterState state}) {
    return CustomTransitionPage(
      transitionDuration: Duration(milliseconds: 200),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
  static CustomTransitionPage fadeAnimation({required Widget child,required GoRouterState state}) {
    return CustomTransitionPage(
      transitionDuration: Duration(milliseconds: 200),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
