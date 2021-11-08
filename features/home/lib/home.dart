// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:home/data/datasources/remote_home_data_source.dart';
import 'package:home/data/repositories/home_repositories_impl.dart';
import 'package:home/domain/repositories/home_repositories.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/presentation/bloc/food_bloc.dart';
import 'package:home/presentation/ui/home_screen.dart';

class FeatureHomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => RemoteHomeDataSourceImpl(dio: Modular.get<Dio>())),
        Bind((_) => HomeRepositoriesImpl(
            remoteDataSource: Modular.get<RemoteHomeDataSource>())),
        Bind((_) =>
            HomeUseCaseImpl(repositories: Modular.get<HomeRepositories>())),
        Bind((_) => FoodBloc(homeUseCase: Modular.get<HomeUseCase>()))
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (context, args) => HomeScreen())];
}
