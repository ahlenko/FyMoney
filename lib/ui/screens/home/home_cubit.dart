import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  changeHoverState(int? hoverIndex) {
    emit(state.copyWith(hoveredIndex: hoverIndex));
  }

  void setPage(int value) {
    emit(state.copyWith(earningSelected: value == 1));
  }
}
