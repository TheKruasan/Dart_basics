import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollTab extends StatelessWidget {
  ScrollTab({
    Key? key,
    this.title,
    this.icon,
    //this.isFavourite,
  }) : super(key: key);
  bool isFavourite = false;
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
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
            isFavourite = isFavourite ? false : true;
          },
        ),
      ),
    );
  }
}
