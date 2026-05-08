import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key, this.onComplete});

  final VoidCallback? onComplete;

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _nicknameController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: palette.surfaceContainerLowest,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: Border(bottom: BorderSide(color: palette.outlineVariant)),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: AppColors.primaryContainer),
        ),
        title: Text(
          'Set Up Profile',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: palette.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _AvatarPicker(),
                    const SizedBox(height: 40),
                    _NicknameField(controller: _nicknameController),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, top: 24),
                child: _CompleteButton(onPressed: widget.onComplete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarPicker extends StatelessWidget {
  const _AvatarPicker();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Stack(
      children: [
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: palette.surfaceContainerLow,
            shape: BoxShape.circle,
            border: Border.all(color: palette.surfaceContainerLowest, width: 4),
          ),
          child: Icon(Icons.person, size: 64, color: palette.secondary),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryContainer,
              shape: BoxShape.circle,
              border: Border.all(color: palette.surfaceContainerLowest, width: 4),
            ),
            child: const Icon(Icons.photo_camera, size: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _NicknameField extends StatelessWidget {
  const _NicknameField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nickname',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: palette.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your nickname',
            hintStyle: TextStyle(color: palette.secondary),
            filled: true,
            fillColor: palette.surfaceContainerLowest,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: palette.outlineVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: palette.outlineVariant),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryContainer),
            ),
          ),
        ),
      ],
    );
  }
}

class _CompleteButton extends StatelessWidget {
  const _CompleteButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: const Text('Complete'),
      ),
    );
  }
}
