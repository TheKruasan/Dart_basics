import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'repository_provider.config.dart';
// import 'package:module1_data/src/service_provider.config.dart';


@InjectableInit()
void initializeRepository() => $initGetIt(GetIt.I);
