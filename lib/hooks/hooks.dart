import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

AsyncSnapshot<T?> useMemoizedFuture<T>(Future<T> future) {
  final memo = useMemoized(() => future);
  final snapshot = useFuture<T?>(
    memo,
    initialData: null,
  );
  return snapshot;
}
