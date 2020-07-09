import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TabController useTabController({
  int initialIndex = 0,
  int length: 5,
}) {
  final tabControllerTickerProvider = useSingleTickerProvider();
  final tabController = useMemoized(
    () => TabController(
      vsync: tabControllerTickerProvider,
      length: length,
      initialIndex: initialIndex,
    ),
    [tabControllerTickerProvider, length, initialIndex],
  );
  return tabController;
}
