import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class UploadPage extends StatefulWidget {
  final String summary;
  final double amount;
  const UploadPage({super.key, required this.summary, required this.amount});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _linkCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  Uint8List? _imageBytes;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _linkCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final bytes = await file.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  void _continue() {
    final l10n = AppLocalizations.of(context)!;
    if (_imageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pickImage)),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      // نمرّر بيانات الطلب للدفع (الرفع الفعلي بعد تأكيد الدفع — مرحلة المنطق)
      context.go('/payment', extra: {
        'summary': widget.summary,
        'amount': widget.amount,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.go('/'),
        ),
        title: Text(l10n.uploadTitle),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        border: Border.all(color: AppColors.blockBorder),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: _imageBytes == null
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 40,
                              color: AppColors.textSecondary),
                          const SizedBox(height: 8),
                          Text(l10n.pickImage,
                              style: const TextStyle(
                                  color: AppColors.textSecondary)),
                        ],
                      )
                          : Image.memory(_imageBytes!, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _titleCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.adTitleLabel,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) =>
                    (v == null || v.isEmpty) ? l10n.requiredField : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _linkCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.linkLabel,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return l10n.requiredField;
                      final uri = Uri.tryParse(v);
                      if (uri == null || !uri.isAbsolute) {
                        return l10n.invalidUrl;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.emailLabel,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return l10n.requiredField;
                      if (!v.contains('@') || !v.contains('.')) {
                        return l10n.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _continue,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.vipGold,
                      foregroundColor: AppColors.vipGoldText,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(l10n.continueBtn),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}