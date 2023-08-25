import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await locator.init();