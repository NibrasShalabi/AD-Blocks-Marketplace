import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/report_dialog.dart';
import '../cubit/vip_cubit.dart';
import '../../widgets/vip_block.dart';

class VipPage extends StatelessWidget {
  const VipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VipCubit()..load(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => context.go('/'),
          ),
          title: const Text('إعلانات VIP'),
        ),
        body: BlocBuilder<VipCubit, VipState>(
          builder: (context, state) {
            if (state.blocks.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            // المساحة الحرّة: نرسم البلوكات بمواضعها (x, y, w, h)
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 340,
                child: Stack(
                  children: state.blocks.map((b) {
                    return Positioned(
                      left: b.x,
                      top: b.y,
                      width: b.width,
                      height: b.height,
                      child: VipBlock(block: b, onReport: () => showReportDialog(context),),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
