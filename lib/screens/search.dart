import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class SearchScreen extends StatefulHookWidget {
  const SearchScreen({
    Key key,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Search"),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return Text("Item: $i");
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
