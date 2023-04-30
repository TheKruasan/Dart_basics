import 'package:flutter/material.dart';

class LayoutTab extends StatelessWidget {
  const LayoutTab({
    Key? key,
    // required this.opacity,
  }) : super(key: key);
  // int opacity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: const Card(
        color: Color(0xFF00B800),
        child: ListTile(
          trailing: Icon(
            Icons.account_balance_wallet_outlined,
          ),
          title: Text('1'),
        ),
      ),
    );
  }
}
