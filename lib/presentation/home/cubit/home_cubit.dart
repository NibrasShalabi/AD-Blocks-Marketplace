import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/mock/mock_data.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/vip_block_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void load() {
    final vips = MockData.vipBlocks();
    // الأحدث للـtoast (أكبر createdAt)
    final latest = vips.isEmpty
        ? null
        : vips.reduce((a, b) => a.createdAt.isAfter(b.createdAt) ? a : b);
    emit(HomeState(
      categories: MockData.categories,
      vipBlocks: vips,
      latestVip: latest,
    ));
  }
}