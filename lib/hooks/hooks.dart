import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncSnapshot<T> useMemoizedFuture<T>(Future<T> future) {
  final memo = useMemoized(() => future);
  final snapshot = useFuture(memo);
  return snapshot;
}
