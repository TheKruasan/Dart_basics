import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'repository_provider.config.dart';

@InjectableInit()
void initializeRepository() => $initGetIt(GetIt.I);
