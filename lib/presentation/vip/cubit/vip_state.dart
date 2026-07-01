part of 'vip_cubit.dart';

class VipState extends Equatable {
  final List<VipBlockModel> blocks; // مرتّبة بالأولوية

  const VipState({this.blocks = const []});

  @override
  List<Object?> get props => [blocks];
}