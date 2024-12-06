import 'dart:ui';

import 'package:flutter/material.dart';

/// Hero Page Route with slide transition from bottom and backdrop filter
class HeroPageRoute<T> extends PageRoute<T> {
  @override
  final String? barrierLabel;
  final WidgetBuilder builder;
  // ignore: annotate_overrides , overridden_fields
  final ImageFilter? filter;
  @override
  final bool barrierDismissible;
  @override
  final bool semanticsDismissible;
  @override
  final Duration transitionDuration;
  HeroPageRoute({
    this.filter,
    required this.builder,
    this.barrierLabel = 'Dismiss',
    this. barrierDismissible = true,
    this. semanticsDismissible = false,
    super.settings,
    this.transitionDuration= const Duration(milliseconds: 400)
  });

  @override
  bool get opaque => false;


  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    if(filter ==null) {
      return _DraggableDismissiblePage(
      child: builder(context),
    );
    }
    return BackdropFilter(
      filter: filter ?? ImageFilter.blur(),
      child: _DraggableDismissiblePage(
        child: builder(context),
      ),
    );
  }
}

class _DraggableDismissiblePage extends StatefulWidget {
  final Widget child;

  const _DraggableDismissiblePage({required this.child});

  @override
  State<_DraggableDismissiblePage> createState() =>
      _DraggableDismissiblePageState();
}

class _DraggableDismissiblePageState extends State<_DraggableDismissiblePage>
    with SingleTickerProviderStateMixin {
  double _dragOffset = 0.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.primaryDelta ?? 0.0;
      _dragOffset = _dragOffset.clamp(0.0, double.infinity);
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_dragOffset > 150) {
      Navigator.of(context).maybePop();
    } else {
      _controller.reverse();
      setState(() {
        _dragOffset = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _dragOffset),
          child: GestureDetector(
            onVerticalDragUpdate: _onVerticalDragUpdate,
            onVerticalDragEnd: _onVerticalDragEnd,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}