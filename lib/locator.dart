

import 'package:flutter_app/core/services/api.dart';
import 'package:flutter_app/core/viewmodels/profile_model.dart';
import 'package:flutter_app/core/viewmodels/relationships_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Api>(Api());

  locator.registerFactory(() => ProfileModel());
  locator.registerFactory(() => RelationshipsModel());
}