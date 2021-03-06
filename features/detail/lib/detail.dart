import 'package:detail/data/datasources/local_detail_data_source.dart';
import 'package:detail/presentation/bloc/detail_bloc.dart';
import 'package:detail/presentation/ui/detail_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'data/datasources/remote_detail_data_source.dart';
import 'data/repositories/detail_repositories_impl.dart';
import 'domain/repositories/detail_repositories.dart';
import 'domain/usecase/detail_usecase.dart';
import 'package:core/db/database_module.dart';

class FeatureDetailModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => RemoteDetailDataSourceImpl(dio: Modular.get<Dio>())),
        Bind((_) =>
            LocalDetailDataSourceImpl(database: Modular.get<AppDatabase>())),
        Bind((_) => DetailRepositoriesImpl(
            remoteDataSource: Modular.get<RemoteDetailDataSource>(),
            localDataSource: Modular.get<LocalDetailDataSource>())),
        Bind((_) =>
            DetailUseCaseImpl(repositories: Modular.get<DetailRepositories>())),
        Bind(
            (_) => DetailBloc(detailUseCase: Modular.get<DetailUseCase>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/detail',
            child: (context, args) => DetailScreen(
                  data: args.data,
                )),
      ];
}
