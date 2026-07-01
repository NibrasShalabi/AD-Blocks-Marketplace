part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final CategoryModel? category;
  final List<BlockModel> blocks;

  const CategoryState({this.category, this.blocks = const []});

  @override
  List<Object?> get props => [category, blocks];
}