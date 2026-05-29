import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_colors.dart';
import '../../auth/providers/auth_provider.dart';
import '../data/grpc_gen/board/v1/board.pbenum.dart';
import '../data/image_upload_service.dart';
import '../models/board_models.dart';
import '../providers/board_repository_provider.dart';

class BoardCreatePostScreen extends ConsumerStatefulWidget {
  const BoardCreatePostScreen({
    super.key,
    required this.onCancel,
    required this.onPostCreated,
  });

  final VoidCallback onCancel;

  /// Invoked after a post is successfully created on the server.
  /// `createChat` is true when the user pressed the "Create Chat" action —
  /// the host (main.dart) should then create + open the linked chat room
  /// via [ChatRepository.getOrCreateBoardChatRoom].
  final Future<void> Function(BoardPost post, {required bool createChat})
      onPostCreated;

  @override
  ConsumerState<BoardCreatePostScreen> createState() =>
      _BoardCreatePostScreenState();
}

class _BoardCreatePostScreenState extends ConsumerState<BoardCreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _imagePicker = ImagePicker();
  final List<XFile> _selectedImages = [];
  BoardType _boardType = BoardType.BOARD_TYPE_FREE;
  bool _submitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final result = await _imagePicker.pickMultiImage(imageQuality: 80);
    if (result.isEmpty) return;
    setState(() {
      _selectedImages.addAll(result);
      if (_selectedImages.length > 5) {
        _selectedImages.removeRange(5, _selectedImages.length);
      }
    });
  }

  Future<List<String>> _uploadImages() async {
    final urls = <String>[];
    for (final img in _selectedImages) {
      final bytes = await img.readAsBytes();
      final ext = img.name.contains('.') ? img.name.split('.').last : 'jpg';
      final url = await ImageUploadService.uploadBoardImage(bytes, ext);
      urls.add(url);
    }
    return urls;
  }

  Future<void> _submit({required bool createChat}) async {
    if (_submitting) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final authToken = ref.read(authProvider).accessToken ?? '';
    if (authToken.isEmpty) {
      _showSnack('Login required.');
      return;
    }

    setState(() => _submitting = true);
    try {
      final imageUrls = await _uploadImages();
      final repo = ref.read(boardRepositoryProvider);
      final post = await repo.createPost(
        authToken: authToken,
        boardType: _boardType,
        title: _titleController.text.trim(),
        content: _contentController.text.trim(),
        imageUrls: imageUrls,
      );

      ref.invalidate(boardPostsProvider);

      if (!mounted) return;
      await widget.onPostCreated(post, createChat: createChat);
    } catch (e) {
      if (kDebugMode) debugPrint('BOARD_CREATE_FAILED: $e');
      if (!mounted) return;
      _showSnack('Failed to create post: $e');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: palette.surfaceContainerLowest,
        foregroundColor: palette.onSurface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _submitting ? null : widget.onCancel,
        ),
        title: const Text(
          'Write Post',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: _submitting,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              children: [
                _SectionLabel(label: 'Category'),
                const SizedBox(height: 8),
                _BoardTypeSelector(
                  selected: _boardType,
                  onChanged: (v) => setState(() => _boardType = v),
                ),
                const SizedBox(height: 20),
                _SectionLabel(label: 'Title'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _titleController,
                  maxLength: 80,
                  style: const TextStyle(color: Colors.black),
                  decoration: _inputDecoration(palette, hint: 'Enter a title'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Title is required' : null,
                ),
                const SizedBox(height: 12),
                _SectionLabel(label: 'Content'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _contentController,
                  maxLines: 10,
                  minLines: 6,
                  style: const TextStyle(color: Colors.black),
                  decoration:
                      _inputDecoration(palette, hint: 'Share something...'),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Content is required'
                      : null,
                ),
                const SizedBox(height: 20),
                _SectionLabel(label: 'Photos (optional, max 5)'),
                const SizedBox(height: 8),
                _PhotosSection(
                  images: _selectedImages,
                  onAdd: _submitting ? null : _pickImages,
                  onRemove: _submitting
                      ? null
                      : (i) => setState(() => _selectedImages.removeAt(i)),
                ),
                const SizedBox(height: 24),
                _ActionButtons(
                  submitting: _submitting,
                  onPost: () => _submit(createChat: false),
                  onCreateChat: () => _submit(createChat: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(AppPalette palette, {required String hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: palette.surfaceContainerLowest,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        borderSide: const BorderSide(
          color: AppColors.primaryContainer,
          width: 1.5,
        ),
      ),
    );
  }
}

class _PhotosSection extends StatelessWidget {
  const _PhotosSection({
    required this.images,
    required this.onAdd,
    required this.onRemove,
  });

  final List<XFile> images;
  final VoidCallback? onAdd;
  final ValueChanged<int>? onRemove;

  static const _max = 5;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final showAddButton = images.length < _max;

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length + (showAddButton ? 1 : 0),
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          if (i == images.length) {
            return GestureDetector(
              onTap: onAdd,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: palette.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: palette.outlineVariant),
                ),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 26,
                          color: palette.secondary,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 11,
                            color: palette.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FutureBuilder<Uint8List>(
                  future: images[i].readAsBytes(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return Container(
                        width: 90,
                        height: 90,
                        color: palette.surfaceContainerLow,
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      );
                    }
                    return Image.memory(
                      snap.data!,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              if (onRemove != null)
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => onRemove!(i),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.close,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: context.palette.onSurfaceVariant,
      ),
    );
  }
}

class _BoardTypeSelector extends StatelessWidget {
  const _BoardTypeSelector({required this.selected, required this.onChanged});

  final BoardType selected;
  final ValueChanged<BoardType> onChanged;

  static const _options = <(BoardType, String)>[
    (BoardType.BOARD_TYPE_FREE, 'Free'),
    (BoardType.BOARD_TYPE_FLASH_MEETUP, 'Flash Meetup'),
    (BoardType.BOARD_TYPE_INFO, 'Info'),
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Wrap(
      spacing: 8,
      children: _options.map((opt) {
        final isSelected = opt.$1 == selected;
        return ChoiceChip(
          label: Text(opt.$2),
          selected: isSelected,
          onSelected: (_) => onChanged(opt.$1),
          selectedColor: AppColors.primaryContainer,
          backgroundColor: palette.surfaceContainerLowest,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : palette.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected
                  ? AppColors.primaryContainer
                  : palette.outlineVariant,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({
    required this.submitting,
    required this.onPost,
    required this.onCreateChat,
  });

  final bool submitting;
  final VoidCallback onPost;
  final VoidCallback onCreateChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: submitting ? null : onCreateChat,
            icon: submitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.chat_bubble_outline),
            label: const Text(
              'Create Chat',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton(
            onPressed: submitting ? null : onPost,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryContainer,
              side: const BorderSide(color: AppColors.primaryContainer),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Post',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
