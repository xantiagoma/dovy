import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dovy/models/models.dart';
export 'package:built_value/serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthResponse,
  User,
  Role,
  ModelEntity,
  Config,
  Station,
  Location,
  Line,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      )
      ..addBuilderFactory(
        FullType(
          Station,
          [
            FullType(Line),
          ],
        ),
        () => StationBuilder<Line>(),
      )
      ..addBuilderFactory(
        FullType(
          Station,
          [
            FullType(
              Line,
              [
                FullType(String),
              ],
            ),
          ],
        ),
        () => StationBuilder<Line<String>>(),
      )
      ..addBuilderFactory(
        FullType(
          BuiltList,
          [
            FullType(
              Line,
              [
                FullType(
                  String,
                ),
              ],
            ),
          ],
        ),
        () => ListBuilder<Line>(),
      )
      ..addBuilderFactory(
        FullType(
          BuiltList,
          [
            FullType(
              String,
            ),
          ],
        ),
        () => ListBuilder<String>(),
      )
      ..addBuilderFactory(
        FullType(
          Line,
          [
            FullType(
              String,
            ),
          ],
        ),
        () => LineBuilder<String>(),
      )
      ..addBuilderFactory(
        FullType(
          BuiltList,
          [
            FullType(
              Station,
              [
                FullType(
                  Line,
                  [
                    FullType(
                      String,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        () => ListBuilder<Station<Line<String>>>(),
      )
      ..addBuilderFactory(
        FullType(
          BuiltList,
          [
            FullType(
              Station,
              [
                FullType(
                  String,
                ),
              ],
            ),
          ],
        ),
        () => ListBuilder<Station<String>>(),
      )
      ..addBuilderFactory(
        FullType(
          Line,
          [
            FullType(
              Station,
              [
                FullType(
                  String,
                ),
              ],
            ),
          ],
        ),
        () => LineBuilder<Station<String>>(),
      )
      ..addBuilderFactory(
        FullType(
          BuiltList,
          [
            FullType(
              Line,
              [
                FullType(
                  Station,
                  [
                    FullType(
                      String,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        () => ListBuilder<Line<Station<String>>>(),
      )
      ..addBuilderFactory(
        FullType(
          Station,
          [
            FullType(
              String,
            ),
          ],
        ),
        () => StationBuilder<String>(),
      ))
    .build();
