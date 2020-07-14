import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rubber/rubber.dart';

/// Creates an animation controller.
///
/// * [value] is the initial value of the animation. If defaults to the lower
///   bound.
///
/// * [duration] is the length of time this animation should last.
///
/// * [debugLabel] is a string to help identify this animation during
///   debugging (used by [toString]).
///
/// * [lowerBoundValue] is the smallest value this animation can obtain and the
///   value at which this animation is deemed to be dismissed. It cannot be
///   null.
///
/// * [halfBoundValue] is the half value this animation can obtain and the
///   value at which this animation is deemed to be half expanded. It can be
///   null.
///
/// * [dismissable] if set true when the bottomsheet goes at 0 is dismissed
///
/// * [upperBoundValue] is the largest value this animation can obtain and the
///   value at which this animation is deemed to be completed. It cannot be
///   null.
///
/// * `vsync` is the [TickerProvider] for the current context. It can be
///   changed by calling [resync]. It is required and must not be null. See
///   [TickerProvider] for advice on obtaining a ticker provider.
///
/// If no [vsync] is provided, the [TickerProvider] is implicitly obtained using [useSingleTickerProvider].
/// If a [vsync] is specified, changing the instance of [vsync] will result in a call to [AnimationController.resync].
/// It is not possible to switch between implicit and explicit [vsync].
///
/// Changing the [duration] parameter automatically updates [AnimationController.duration].
///
/// [initialValue], [lowerBound], [upperBound] and [debugLabel] are ignored after the first call.
///
/// See also:
///   * [AnimationController], the created object.
///   * [useAnimation], to listen to the created [AnimationController].
RubberAnimationController useRubberAnimationController({
  AnimationBehavior animationBehavior = AnimationBehavior.normal,
  AnimationControllerValue halfBoundValue,
  AnimationControllerValue lowerBoundValue,
  AnimationControllerValue upperBoundValue,
  bool dismissable = false,
  double initialValue,
  Duration duration,
  List<Object> keys,
  SpringDescription springDescription,
  String debugLabel,
  TickerProvider vsync,
}) {
  vsync ??= useSingleTickerProvider(keys: keys);

  return use(
    RubberAnimationControllerHook(
      animationBehavior: animationBehavior,
      debugLabel: debugLabel,
      duration: duration,
      halfBoundValue: halfBoundValue,
      initialValue: initialValue,
      keys: keys,
      lowerBoundValue: lowerBoundValue,
      upperBoundValue: upperBoundValue,
      vsync: vsync,
    ),
  );
}

class RubberAnimationControllerHook extends Hook<RubberAnimationController> {
  const RubberAnimationControllerHook({
    this.animationBehavior = AnimationBehavior.normal,
    this.debugLabel,
    this.dismissable = false,
    this.duration,
    this.halfBoundValue,
    this.initialValue,
    this.lowerBoundValue,
    this.springDescription,
    this.upperBoundValue,
    this.vsync,
    List<Object> keys,
  }) : super(keys: keys);

  final AnimationBehavior animationBehavior;
  final AnimationControllerValue halfBoundValue;
  final AnimationControllerValue lowerBoundValue;
  final AnimationControllerValue upperBoundValue;
  final bool dismissable;
  final double initialValue;
  final Duration duration;
  final SpringDescription springDescription;
  final String debugLabel;
  final TickerProvider vsync;

  @override
  RubberAnimationControllerHookState createState() =>
      RubberAnimationControllerHookState();
}

class RubberAnimationControllerHookState extends HookState<
    RubberAnimationController, RubberAnimationControllerHook> {
  RubberAnimationController _animationController;

  @override
  void initHook() {
    super.initHook();
    _animationController = RubberAnimationController(
      animationBehavior: hook.animationBehavior,
      debugLabel: hook.debugLabel,
      dismissable: hook.dismissable,
      duration: hook.duration,
      halfBoundValue: hook.halfBoundValue,
      initialValue: hook.initialValue,
      lowerBoundValue: hook.lowerBoundValue,
      springDescription: hook.springDescription,
      upperBoundValue: hook.upperBoundValue,
      vsync: hook.vsync,
    );
  }

  @override
  void didUpdateHook(RubberAnimationControllerHook oldHook) {
    super.didUpdateHook(oldHook);
    if (hook.vsync != oldHook.vsync) {
      _animationController.resync(hook.vsync);
    }

    if (hook.duration != oldHook.duration) {
      _animationController.duration = hook.duration;
    }
  }

  @override
  RubberAnimationController build(BuildContext context) {
    return _animationController;
  }

  @override
  void dispose() {
    try {
      _animationController.dispose();
    } catch (_) {}
  }
}
