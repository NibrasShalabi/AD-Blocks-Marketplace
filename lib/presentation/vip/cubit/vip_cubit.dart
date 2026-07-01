import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/mock/mock_data.dart';
import '../../../data/models/vip_block_model.dart';

part 'vip_state.dart';
class VipCubit extends Cubit<VipState> {
  VipCubit() : super(const VipState());

  void load() {
    final blocks = MockData.vipBlocks();
    // الترتيب: الأعلى دفعاً أولاً، وعند التساوي الأقدم أولاً
    blocks.sort((a, b) {
      final byPriority = b.priority.compareTo(a.priority);
      if (byPriority != 0) return byPriority;
      return a.createdAt.compareTo(b.createdAt);
    });
    emit(VipState(blocks: blocks));
  }
}