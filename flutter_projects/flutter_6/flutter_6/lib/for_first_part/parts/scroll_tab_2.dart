// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollTabState extends StatefulWidget {
  bool isFavourite = false;
  final String? title;
  final IconData? icon;
  ScrollTabState({
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  State<ScrollTabState> createState() =>
      _ScrollTabStateState(title: title, icon: icon);
}

class _ScrollTabStateState extends State<ScrollTabState>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isFavourite = false;
  final String? title;
  final IconData? icon;
  _ScrollTabStateState({
    this.title,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          trailing: Icon(
            icon,
            color: isFavourite ? Colors.red : Colors.black12,
          ),
          title: Text(title.toString()),
          onTap: () {
            setState(() {
              isFavourite = isFavourite ? false : true;
            });
          },
        ),
      ),
    );
  }
}
