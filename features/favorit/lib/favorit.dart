import 'package:core/db/database_module.dart';
import 'package:favorit/data/repositories/favorit_repositories_impl.dart';
import 'package:favorit/domain/usecase/favorit_usecase.dart';
import 'package:favorit/presentation/bloc/favorit_bloc.dart';
import 'package:favorit/presentation/ui/favorit_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/local_favorit_data_source.dart';
import 'domain/repositories/favorit_reporitories.dart';

class FeatureFavoritModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) =>
            LocalFavoritDataSourceImpl(database: Modular.get<AppDatabase>())),
        Bind((_) => FavoritRepositoriesImpl(
            localDataSource: Modular.get<LocalFavoritDataSource>())),
        Bind((_) => FavoritUseCaseImpl(
            repositories: Modular.get<FavoritRepositories>())),
        Bind((_) =>
            FavoritBloc(favoritUseCase: Modular.get<FavoritUseCase>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/favorit', child: (context, args) => FavoritScreen()),
      ];
}
