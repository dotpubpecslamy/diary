import 'package:flutter_application_1/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'initApp')
Future<void> configureAppDependencies() async {
  getIt.initApp();
}
