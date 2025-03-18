import 'dart:async';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:flutter/material.dart';

class OverlayRouter<T> extends OverlayRoute<T> {
  final Builder _builder;
  final CustomSnackBar snackBar;

  T? _result;
  CustomSnackBarStatus? currentStatus;

  final Completer<T> _transitionCompleter = Completer<T>();

  Alignment? _initialAlignment;
  Alignment? _endAlignment;
  Timer? _timer;

  OverlayRouter({
    required this.snackBar,
    super.settings,
  })  : _builder = Builder(builder: (BuildContext innerContext) => snackBar) {
    _configureAlignment();
  }

  void _configureAlignment() {
    _initialAlignment = const Alignment(-1.0, -2.0);
    _endAlignment = const Alignment(-1.0, -1.0);
  }

  Future<T> get completed => _transitionCompleter.future;
  bool get opaque => false;

  @override
  Future<RoutePopDisposition> willPop() {
    if (_timer?.isActive == true) {
      return Future.value(RoutePopDisposition.doNotPop);
    }

    return Future.value(RoutePopDisposition.pop);
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    final overlays = <OverlayEntry>[];

    overlays.add(
      OverlayEntry(
        builder: (BuildContext context) {
          return Semantics(
            focused: false,
            container: true,
            explicitChildNodes: true,
            child: AlignTransition(
              alignment: _animation!,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 80,
                  ),
                  child: _builder,
                ),
              ),
            ),
          );
        },
        maintainState: false,
        opaque: opaque,
      ),
    );

    return overlays;
  }

  Animation<Alignment>? get animation => _animation;
  Animation<Alignment>? _animation;

  @override
  bool get finishedWhenPopped =>
      _controller!.status == AnimationStatus.dismissed;

  @protected
  AnimationController? get controller => _controller;
  AnimationController? _controller;

  AnimationController createAnimationController() {
    return AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: navigator!,
    );
  }

  Animation<Alignment> createAnimation() {
    return AlignmentTween(begin: _initialAlignment, end: _endAlignment).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeOutCirc,
      ),
    );
  }

  void _handleStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        currentStatus = CustomSnackBarStatus.showing;
        if (overlayEntries.isNotEmpty) overlayEntries.first.opaque = opaque;

        break;
      case AnimationStatus.forward:
        currentStatus = CustomSnackBarStatus.isAppearing;
        break;
      case AnimationStatus.reverse:
        currentStatus = CustomSnackBarStatus.isHiding;
        if (overlayEntries.isNotEmpty) overlayEntries.first.opaque = false;
        break;
      case AnimationStatus.dismissed:
        currentStatus = CustomSnackBarStatus.dismissed;

        if (!isCurrent) {
          navigator!.finalizeRoute(this);
          if (overlayEntries.isNotEmpty) {
            overlayEntries.clear();
          }
        }
        break;
    }
    changedInternalState();
  }

  @override
  void install() {
    _controller = createAnimationController();
    _animation = createAnimation();
    super.install();
  }

  @override
  TickerFuture didPush() {
    _animation!.addStatusListener(_handleStatusChanged);
    _configureTimer();
    super.didPush();

    return _controller!.forward();
  }

  @override
  void didReplace(Route? oldRoute) {
    if (oldRoute is OverlayRouter) {
      _controller!.value = oldRoute._controller!.value;
    }
    _animation!.addStatusListener(_handleStatusChanged);
    super.didReplace(oldRoute);
  }

  @override
  bool didPop(T? result) {
    _result = result;
    _cancelTimer();
    _controller!.reverse();

    return super.didPop(result);
  }

  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  void _configureTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(seconds: 4), () {
      if (isCurrent) {
        navigator!.pop();
      } else if (isActive) {
        navigator!.removeRoute(this);
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _transitionCompleter.complete(_result);
    _timer?.cancel();
    super.dispose();
  }
}

OverlayRouter showSnackbar<T>({required CustomSnackBar snackBar}) {
  return OverlayRouter<T>(
    snackBar: snackBar,
    settings: const RouteSettings(name: '/snackbar_route'),
  );
}
