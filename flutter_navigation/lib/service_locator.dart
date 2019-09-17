import 'package:get_it/get_it.dart';

import 'NavigateService.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(NavigateService());
}
