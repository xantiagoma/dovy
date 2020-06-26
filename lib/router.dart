import 'package:dovy/general.dart';

final router = Router()
  ..define(
    '/',
    handler: Handler(
      handlerFunc: (context, parameters) => MainScreen(),
    ),
  )
  ..define(
    '/init',
    handler: Handler(
      handlerFunc: (context, parameters) => InitScreen(),
    ),
  );
