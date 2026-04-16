import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/mock_map_places.dart';
import '../models/map_place.dart';
import 'widgets/kakao_map_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.onBottomNavSelected});

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapPlace _selectedPlace = mockMapPlaces.first;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppTopAppBar(
        onNotificationBoardSelected: () {
          widget.onBottomNavSelected?.call(AppBottomNavItem.board);
        },
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.map,
        onItemSelected: widget.onBottomNavSelected,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: KakaoMapView(
              places: mockMapPlaces,
              selectedPlace: _selectedPlace,
              onPlaceSelected: _selectPlace,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: _MapSearchBar(palette: palette),
          ),
          Positioned(
            top: 80,
            left: 16,
            right: 16,
            child: _MapFilterChips(
              labels: const ['Open Now', 'Cocktails', 'Bottle Shop', 'Outdoor'],
              selectedIndex: 0,
              palette: palette,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: _SelectedPlaceCard(place: _selectedPlace),
          ),
        ],
      ),
    );
  }

  void _selectPlace(MapPlace place) {
    setState(() {
      _selectedPlace = place;
    });
  }
}

class _MapSearchBar extends StatelessWidget {
  const _MapSearchBar({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            Icon(Icons.search, color: palette.secondary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Search nearby bars and bottle shops',
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.tune, color: palette.onSurface),
          ],
        ),
      ),
    );
  }
}

class _MapFilterChips extends StatelessWidget {
  const _MapFilterChips({
    required this.labels,
    required this.selectedIndex,
    required this.palette,
  });

  final List<String> labels;
  final int selectedIndex;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryContainer
                  : palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(999),
              border: isSelected
                  ? null
                  : Border.all(color: palette.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: Text(
                  labels[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : palette.onSurfaceVariant,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SelectedPlaceCard extends StatelessWidget {
  const _SelectedPlaceCard({required this.place});

  final MapPlace place;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppNetworkImage(
                url: place.imageUrl,
                width: 92,
                height: 92,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          place.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: palette.onSurface,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.primaryContainer,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        place.rating,
                        style: const TextStyle(
                          color: AppColors.primaryContainer,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${place.distanceLabel} - ${place.category}',
                    style: TextStyle(color: palette.secondary, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    place.status,
                    style: const TextStyle(
                      color: AppColors.primaryContainer,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final tag in place.tags)
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: palette.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 4,
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: palette.onSurfaceVariant,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
