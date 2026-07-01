import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/grid_config.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/report_dialog.dart';
import '../cubit/category_cubit.dart';
import '../../widgets/ad_block.dart';

class CategoryPage extends StatelessWidget {
  final String categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => CategoryCubit()..load(categoryId),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => context.go('/'),
          ),
          title: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (_, state) =>
                  Text(state.category?.title ?? ''),
          ),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state.blocks.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            final width = MediaQuery.of(context).size.width;
            final columns = width < GridConfig.mobileBreakpoint
                ? GridConfig.normalColumnsMobile
                : GridConfig.normalColumns;
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: GridConfig.blockGap,
                  mainAxisSpacing: GridConfig.blockGap,
                  childAspectRatio:
                      0.72, // البطاقة أطول من عرضها (تسع صورة+نص+أزرار)
                ),
                itemCount: state.blocks.length,
                itemBuilder: (_, i) => AdBlock(
                  block: state.blocks[i],
                  onVisit: () {},
                  onReport: () => showReportDialog(context),
                  onTapEmpty: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
