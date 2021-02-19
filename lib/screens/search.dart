import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
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

    return ListView.builder(
      itemBuilder: (ctx, i) {
        return Text("Item: $i");
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
