import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SelectNeighborhoodScreen extends StatefulWidget {
  const SelectNeighborhoodScreen({super.key, this.onSelected});

  final ValueChanged<String>? onSelected;

  @override
  State<SelectNeighborhoodScreen> createState() =>
      _SelectNeighborhoodScreenState();
}

class _SelectNeighborhoodScreenState
    extends State<SelectNeighborhoodScreen> {
  final _searchController = TextEditingController();
  List<String> _results = [];
  bool _hasSearched = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _hasSearched = query.isNotEmpty;
      // TODO: replace with actual neighborhood API call
      _results = query.isNotEmpty
          ? ['강남구 역삼동', '강남구 역삼1동', '강남구 역삼2동']
              .where((e) => e.contains(query))
              .toList()
          : [];
    });
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
          'Select Neighborhood',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: palette.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  _SearchBar(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                  ),
                  const SizedBox(height: 12),
                  const _CurrentLocationButton(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _hasSearched && _results.isNotEmpty
                  ? _ResultsList(
                      results: _results,
                      onSelected: widget.onSelected,
                    )
                  : const _EmptyState(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: '동(읍/면) 이름으로 검색 (예: 역삼동)',
        hintStyle: TextStyle(
          color: palette.onSurfaceVariant.withValues(alpha: 0.6),
          fontSize: 14,
        ),
        prefixIcon: Icon(Icons.search, color: palette.secondary, size: 20),
        filled: true,
        fillColor: palette.surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryContainer,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}

class _CurrentLocationButton extends StatelessWidget {
  const _CurrentLocationButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          // TODO: implement GPS location lookup
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryContainer,
          backgroundColor: AppColors.primaryContainer.withValues(alpha: 0.1),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: const StadiumBorder(),
        ),
        icon: const Icon(Icons.my_location, size: 18),
        label: const Text(
          '현재 위치로 찾기',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: palette.surfaceContainerLow,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.location_on_outlined,
            size: 32,
            color: palette.secondary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '거주하시는 동네를 검색해 주세요.',
          style: TextStyle(fontSize: 15, color: palette.onSurfaceVariant),
        ),
      ],
    );
  }
}

class _ResultsList extends StatelessWidget {
  const _ResultsList({required this.results, this.onSelected});

  final List<String> results;
  final ValueChanged<String>? onSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: results.length,
      separatorBuilder: (_, _) =>
          Divider(color: palette.outlineVariant, height: 1),
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          title: Text(
            result,
            style: TextStyle(fontSize: 15, color: palette.onSurface),
          ),
          onTap: () {
            onSelected?.call(result);
            Navigator.of(context).pop(result);
          },
        );
      },
    );
  }
}
