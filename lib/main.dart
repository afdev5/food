import 'package:core/core.dart';
import 'package:core/network/api_constant.dart';
import 'package:detail/detail.dart';
import 'package:favorit/favorit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';

void main() {
  Modular.init(CoreModule(baseUrl: ApiConstant.baseUrl));
  runApp(ModularApp(module: AppModule()));
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Apps',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: FeatureHomeModule()),
        ModularRouter('/detail', module: FeatureDetailModule()),
        ModularRouter('/favorit', module: FeatureFavoritModule())
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
