import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final qController = useTextEditingController(text: '');
    final q = useValueListenable(qController);

    final stationsResult$ = ref.watch(stationsSearchProvider(q.text));
    final linesResult$ = ref.watch(linesSearchProvider(q.text));
    final router = ref.watch(routerProvider);

    final stationsResult = stationsResult$.asData?.value ?? [];
    final linesResult = linesResult$.asData?.value ?? [];

    final loading = stationsResult$.loading && linesResult$.loading;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          primary: true,
          floating: true,
          backgroundColor: context.theme.scaffoldBackgroundColor.darken(),
          title: CupertinoTextField(
            placeholder: 'Search for...',
            autofocus: true,
            controller: qController,
            textInputAction: TextInputAction.search,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
            clearButtonMode: OverlayVisibilityMode.editing,
          ),
          centerTitle: true,
        ),
        if (loading)
          SliverFillRemaining(
            child: SpinKitDoubleBounce(
              color: Colors.white,
            ),
          ),
        if (!loading &&
            stationsResult.isEmpty &&
            linesResult.isEmpty &&
            q.text.isNotEmpty)
          SliverFillRemaining(
            child: Center(
              child: Text("Not found"),
            ),
          ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final line = linesResult[i];
              return InkWell(
                onTap: () {
                  router.navigateTo(context, '/line/${line['id']}');
                },
                child: Chip(
                  label: Text(line['attributes']['name']),
                  backgroundColor: getColor(line['color']),
                ),
              );
            },
            childCount: linesResult.length,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final station = stationsResult[i];

              return InkWell(
                onTap: () {
                  router.navigateTo(context, '/station/${station['id']}');
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.white12,
                      ),
                      top: BorderSide(
                        width: i == 0 ? 1 : 0,
                        color: Colors.white12,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Text(station['attributes']?['name'] ?? '-'),
                ),
              );
            },
            childCount: stationsResult.length,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
