import 'package:flutter/material.dart';

class OneList extends StatelessWidget {
  final Image img;
  final String text;
  const OneList({required this.img, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.blueAccent,
      tileColor: Colors.blueAccent,
      leading: CircleAvatar(
        child: img,
        radius: 30,
      ),
      title: Text(text),
      onTap: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                    child: Column(children: [
                  const ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Сумма'),
                    trailing: Text('200 руб.'),
                  ),
                  ElevatedButton(
                    child: const Text('Оплатить'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ])),
              );
            });
      },
    );
  }
}
