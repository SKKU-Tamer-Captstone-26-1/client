import 'package:flutter/material.dart';
import 'package:kakao_maps_flutter/kakao_maps_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/map_api_data_source.dart';
import '../data/mock_map_places.dart';
import '../models/map_place.dart';
import 'widgets/kakao_map_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.onBottomNavSelected,
    this.onProfileSelected,
    this.bottomNavBadgeCounts = const <AppBottomNavItem, int>{},
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final VoidCallback? onProfileSelected;
  final Map<AppBottomNavItem, int> bottomNavBadgeCounts;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _api = MapApiDataSource();
  List<MapPlace> _places = mockMapPlaces;
  MapPlace _selectedPlace = mockMapPlaces.first;
  bool _loading = false;

  // Seoul bounding box used for the initial load
  static const double _seoulMinLon = 126.70;
  static const double _seoulMinLat = 37.40;
  static const double _seoulMaxLon = 127.20;
  static const double _seoulMaxLat = 37.75;

  @override
  void initState() {
    super.initState();
    _fetchMarkers(
      minLon: _seoulMinLon,
      minLat: _seoulMinLat,
      maxLon: _seoulMaxLon,
      maxLat: _seoulMaxLat,
    );
  }

  Future<void> _fetchMarkers({
    required double minLon,
    required double minLat,
    required double maxLon,
    required double maxLat,
  }) async {
    if (_loading) return;
    setState(() => _loading = true);

    try {
      final markers = await _api.fetchMarkers(
        minLon: minLon,
        minLat: minLat,
        maxLon: maxLon,
        maxLat: maxLat,
      );
      if (!mounted) return;
      setState(() {
        if (markers.isNotEmpty) {
          _places = markers;
          _selectedPlace = markers.first;
        }
      });
    } catch (_) {
      // Keep showing mock data if API is unreachable (map-service not running)
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _onViewportChanged(LatLngBounds bounds) {
    _fetchMarkers(
      minLon: bounds.southwest.longitude,
      minLat: bounds.southwest.latitude,
      maxLon: bounds.northeast.longitude,
      maxLat: bounds.northeast.latitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppTopAppBar(
        onNotificationBoardSelected: () {
          widget.onBottomNavSelected?.call(AppBottomNavItem.board);
        },
        onProfileSelected: widget.onProfileSelected,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.map,
        onItemSelected: widget.onBottomNavSelected,
        badgeCounts: widget.bottomNavBadgeCounts,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: KakaoMapView(
              places: _places,
              selectedPlace: _selectedPlace,
              onPlaceSelected: (place) => setState(() => _selectedPlace = place),
              onViewportChanged: _onViewportChanged,
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
              labels: const ['Bar', 'Pub', 'Liquor Shop', 'Outdoor'],
              selectedIndex: 0,
              palette: palette,
            ),
          ),
          if (_loading)
            const Positioned(
              top: 128,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryContainer,
                  ),
                ),
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
    final hasImage = place.imageUrl.isNotEmpty;
    final hasRating = place.rating.isNotEmpty;
    final hasStatus = place.status.isNotEmpty;
    final hasDistance = place.distanceLabel.isNotEmpty;

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
            if (hasImage) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AppNetworkImage(
                  url: place.imageUrl,
                  width: 92,
                  height: 92,
                ),
              ),
              const SizedBox(width: 14),
            ],
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
                      if (hasRating) ...[
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
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    [if (hasDistance) place.distanceLabel, place.category]
                        .join(' - '),
                    style: TextStyle(color: palette.secondary, fontSize: 12),
                  ),
                  if (hasStatus) ...[
                    const SizedBox(height: 4),
                    Text(
                      place.status,
                      style: const TextStyle(
                        color: AppColors.primaryContainer,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                  if (place.tags.isNotEmpty) ...[
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
