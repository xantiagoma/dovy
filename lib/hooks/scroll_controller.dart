import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates a [ScrollController] automatically disposed.
///
/// See also:
///   * [ScrollController]
final useScrollController = UseScrollController();

/// Using various [ScrollController]s.
///
/// See also:
///   * [call]
///   * [tracking]
class UseScrollController {
  /// Creates an [ScrollController] automatically disposed.
  ///
  /// [initialScrollOffset], [keepScrollOffset] and [debugLabel] are ignored after the first call.
  ///
  /// See also:
  ///   * [ScrollController]
  ScrollController call({
    String debugLabel,
    double initialScrollOffset = 0.0,
    bool keepScrollOffset = true,
    List keys,
  }) {
    return Hook.use(_ScrollControllerHook(
      debugLabel: debugLabel,
      initialScrollOffset: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      keys: keys,
    ));
  }
}

class _ScrollControllerHook extends Hook<ScrollController> {
  final String debugLabel;
  final double initialScrollOffset;
  final bool keepScrollOffset;

  const _ScrollControllerHook({
    this.debugLabel,
    this.initialScrollOffset,
    this.keepScrollOffset,
    List keys,
  }) : super(keys: keys);

  @override
  _ScrollControllerHookState createState() => _ScrollControllerHookState();
}

class _ScrollControllerHookState
    extends HookState<ScrollController, _ScrollControllerHook> {
  ScrollController _scrollController;

  @override
  void initHook() {
    _scrollController = ScrollController(
      initialScrollOffset: hook.initialScrollOffset,
      keepScrollOffset: hook.keepScrollOffset,
      debugLabel: hook.debugLabel,
    );
  }

  @override
  ScrollController build(BuildContext context) => _scrollController;

  @override
  void dispose() => _scrollController.dispose();
}
