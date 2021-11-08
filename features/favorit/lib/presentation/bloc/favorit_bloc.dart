import 'package:bloc/bloc.dart';
import 'package:favorit/domain/usecase/favorit_usecase.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:meta/meta.dart';

part 'favorit_event.dart';
part 'favorit_state.dart';

class FavoritBloc extends Bloc<FavoritEvent, FavoritState> {
  final FavoritUseCase favoritUseCase;

  FavoritBloc({required this.favoritUseCase}) : super(FavoritInitial());

  @override
  Stream<FavoritState> mapEventToState(
    FavoritEvent event,
  ) async* {
    if (event is GetFoodsEvent) {
      try {
        yield LoadingFavoritState();
        final response = await favoritUseCase.getFavoritFood();
        print(response);
        
        yield response.isEmpty
            ? EmptyFavoritState()
            : SuccessFavoritState(datas: response);
      } catch (e) {
        yield Error(message: e.toString());
      }
    }
  }
}
