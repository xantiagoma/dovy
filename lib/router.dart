import 'package:dovy/general.dart';

final router = Router()
  ..define(
    '/',
    handler: Handler(
      handlerFunc: (context, parameters) => MainScreen(),
    ),
  )
  ..define(
    '/login',
    handler: Handler(
      handlerFunc: (context, parameters) => LoginScreen(),
    ),
  )
  ..define(
    '/home',
    handler: Handler(
      handlerFunc: (context, parameters) => HomeScreen(),
    ),
  );
