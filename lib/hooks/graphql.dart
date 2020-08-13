import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dovy/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AsyncSnapshot<QueryResult> useQuery(QueryOptions options) {
  final context = useContext();
  final graphQLClient = context.graphql;
  final future = useMemoized(
    () => graphQLClient.query(options),
    [graphQLClient],
  );
  final snapshot = useFuture(future);
  return snapshot;
}

class AsyncQuery extends Equatable {
  final void Function() call;
  final AsyncSnapshot<QueryResult> value;

  AsyncQuery(this.call, this.value);

  @override
  List<Object> get props => [call, value];

  @override
  bool get stringify => true;
}

// TODO
AsyncQuery useLazyQuery(QueryOptions options) {
  final ac = useState(false);
  final val = useState(null);
  useEffect(() {
    final snap = useQuery(options);
    val.value = snap;
    return () {};
  }, [ac.value]);

  final f = () {
    ac.value = true;
  };
  return AsyncQuery(f, val.value);
}

AsyncSnapshot<T> useMemoizedFuture<T>(Future<T> future) {
  final memo = useMemoized(() => future);
  final snapshot = useFuture(memo);
  return snapshot;
}

C useBloc<C extends Cubit<Object>>() {
  final context = useContext();
  final bloc = context.bloc<C>();
  return bloc;
}
