import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebormed/core/usecases/no_params.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import 'package:kebormed/domain/usecases/home_usecase.dart';

import '../../../core/error/failure.dart';
import 'bloc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeUsecase homeUsecase;

  final TextEditingController searchFieldController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<UserDataEntity> fullUserList = [];

  HomeScreenBloc({required this.homeUsecase}) : super(const EmptyState()) {
    on<HomePageReadyEvent>(
        (event, emit) => emit(const HomeScreenPageReadyState(true)));
    on<FetchHomeScreenListEvent>((event, emit) => emit(const LoadingState()));

    on<ApiFailureEvent>((event, emit) => emit(const ApiFailureState()));
    on<ApiSuccessEvent>((event, emit) => emit(ApiSuccessState()));
    on<NoInternetEvent>((event, emit) => emit(NoInternetState()));
  }

  @override
  Future<void> onEvent(HomeScreenEvent event) async {
    super.onEvent(event);
    if (event is FetchHomeScreenListEvent) {
      final result = await homeUsecase.call(NoParams());
      result.fold((failure) {
        print("hfhagfdashdfsahdf $failure");
        if (failure is NetworkFailure) {
          add(NoInternetEvent());
        } else {
          add(
            const ApiFailureEvent(),
          );
        }
      }, (result) {
        fullUserList = result;
        add(
          const ApiSuccessEvent(),
        );
      });
    }
  }

  // pull-to-refresh
  Future<void> onRefresh() async {
    add(const FetchHomeScreenListEvent());
    await stream.firstWhere((state) => state is! LoadingState);
  }
}
