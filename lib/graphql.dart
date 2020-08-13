import 'package:dovy/general.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  uri: 'https://server.xantiagoma.com/graphql',
);

final AuthLink authLink = AuthLink(
  getToken: () async {
    final token = await GetIt.I<AuthService>().token;
    return 'Bearer $token';
  },
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> graphQLClient = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);
