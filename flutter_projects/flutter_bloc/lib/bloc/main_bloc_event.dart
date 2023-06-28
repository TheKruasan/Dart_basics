part of 'main_bloc_bloc.dart';

@immutable
abstract class MainBlocEvent {}

class AddElemByButtonPressed extends MainBlocEvent {
  final String res;

  AddElemByButtonPressed(this.res);
}
