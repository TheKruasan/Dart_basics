import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/main_bloc_bloc.dart';
import 'package:flutter_bloc_test/page.dart';

class FPage extends StatefulWidget {
  const FPage({super.key});

  @override
  State<FPage> createState() => _FPageState();
}

class _FPageState extends State<FPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<MainBlocBloc, MainBlocState>(
            builder: (_, state) => Column(
              children: [
                ...BlocProvider.of<MainBlocBloc>(context).mas.map(
                      (e) => Text(e),
                    ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return PageToAdd();
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
