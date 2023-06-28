import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/main_bloc_bloc.dart';

class PageToAdd extends StatefulWidget {
  const PageToAdd({super.key});

  @override
  State<PageToAdd> createState() => _PageToAddState();
}

TextEditingController _controller = TextEditingController();

class _PageToAddState extends State<PageToAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<MainBlocBloc>(context)
                      .add(AddElemByButtonPressed(_controller.text));
                  _controller.clear();
                  Navigator.pop(context);
                },
                child: const Text("save changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
