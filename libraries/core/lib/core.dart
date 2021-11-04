import 'package:core/db/database_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'network/dio_client.dart';

class CoreModule extends ChildModule {
  final String baseUrl;
  CoreModule({required this.baseUrl});

  @override
  List<Bind> get binds => [
        Bind((_) => Modular.get<DioClient>().dio),
        Bind((_) => DioClient(apiBaseUrl: baseUrl, isDebug: true)),
        Bind((_) => AppDatabase(isDebug: true))
      ];

  @override
  List<ModularRouter> get routers => [];
}
