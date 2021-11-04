import 'package:core/core.dart';
import 'package:core/network/api_constant.dart';
import 'package:detail/detail.dart';
import 'package:favorit/favorit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/home.dart';
import 'package:home/presentation/bloc/food_cubit.dart';

void main() {
  Modular.init(CoreModule(baseUrl: ApiConstant.baseUrl));
  // Modular.
  runApp(ModularApp(module: AppModule()));
  // runApp(
  //   MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: HomeScreen(),
  //   )
  // ); 
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => FoodCubit(homeUseCase: Modular.get<HomeUseCase>()),
      child: MaterialApp(
      title: 'Food Apps',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    ),
    );
  }
}

class AppModule extends MainModule {

  // @override
  // List<Module> get imports => [
  //   CoreModule(baseUrl: ApiConstant.baseUrl),
  // ];

  @override 
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(
      '/',
      module: FeatureHomeModule()
    ),
    ModularRouter(
      '/detail',
      module: FeatureDetailModule()
    ),
    ModularRouter('/favorit', module: FeatureFavoritModule())
    // ModuleRoute('/detail', module: FeatureDetailModule())
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

}


