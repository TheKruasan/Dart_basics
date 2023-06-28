import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainBlocBloc extends Bloc<MainBlocEvent, MainBlocState> {
  List<String> mas = [];
  MainBlocBloc() : super(MainBlocInitial()) {
    on<AddElemByButtonPressed>((event, emit) {
      mas.add(event.res);
      emit(AddedList());
    });
  }
}
