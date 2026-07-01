part of 'home_cubit.dart';


class HomeState extends Equatable {
  final List<CategoryModel> categories;
  final List<VipBlockModel> vipBlocks;
  final VipBlockModel? latestVip; // لأجل الـtoast عند الفتح

  const HomeState({
    this.categories = const [],
    this.vipBlocks = const [],
    this.latestVip,
  });

  @override
  List<Object?> get props => [categories, vipBlocks, latestVip];
}