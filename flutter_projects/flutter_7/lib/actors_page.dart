import 'package:flutter/material.dart';
import 'package:flutter_7/actor.dart';

class ActorPage extends StatefulWidget {
  final Actor actor;
  static const String routeName = "/actors";
  const ActorPage({
    super.key,
    required this.actor,
  });

  @override
  State<ActorPage> createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.actor.name),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Text(widget.actor.description),
        ),
      ),
    );
  }
}
