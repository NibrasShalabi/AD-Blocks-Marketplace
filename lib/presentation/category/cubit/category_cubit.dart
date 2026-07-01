import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/mock/mock_data.dart';
import '../../../data/models/block_model.dart';
import '../../../data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState());

  void load(String categoryId) {
    final category =
    MockData.categories.firstWhere((c) => c.id == categoryId);
    emit(CategoryState(
      category: category,
      blocks: MockData.blocksFor(categoryId),
    ));
  }
}