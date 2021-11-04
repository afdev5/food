import 'package:detail/detail.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:home/data/datasources/remote_home_data_source.dart';
import 'package:home/data/repositories/home_repositories_impl.dart';
import 'package:home/domain/repositories/home_repositories.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/presentation/bloc/food_cubit.dart';
import 'package:home/presentation/ui/home_screen.dart';

class FeatureHomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((_) => RemoteHomeDataSourceImpl(dio: Dio())),
        Bind((_) => RemoteHomeDataSourceImpl(dio: Modular.get<Dio>())),
        Bind((_) => HomeRepositoriesImpl(
            remoteDataSource: Modular.get<RemoteHomeDataSource>())),
        Bind((_) =>
            HomeUseCaseImpl(repositories: Modular.get<HomeRepositories>())),
        Bind((_) => FoodCubit(homeUseCase: Modular.get<HomeUseCase>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => HomeScreen())
        // ChildRoute('/', child: (context, args) => HomeScreen()),
        // ModuleRoute('/detail', module: FeatureDetailModule())
      ];

  // @override
  // // TODO: implement routers
  // List<ModularRouter> get routers => throw UnimplementedError();
}
