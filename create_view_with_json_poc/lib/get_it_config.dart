import 'package:create_view_with_json_poc/view_model.dart';
import 'package:get_it/get_it.dart';

import 'drag_view_model.dart';

GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton(() => ViewModel());
  getIt.registerLazySingleton(() => DragViewModel());
}
