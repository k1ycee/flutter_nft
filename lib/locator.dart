import 'package:epicnfts/utils/navigation.dart';
import 'package:get_it/get_it.dart';

GetIt inject = GetIt.instance;

void injector() {
  inject
      .registerLazySingleton<NavigationHandler>(() => NavigationHandlerImpl());
}
