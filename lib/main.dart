import 'package:dovy/app.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
