




import 'package:get_it/get_it.dart';
import 'package:shirin_sanjar_lessons/profile/service/service.dart';


final GetIt compas = GetIt.instance;

void compasLocator() {
  compas.registerLazySingleton(() => Service());
}