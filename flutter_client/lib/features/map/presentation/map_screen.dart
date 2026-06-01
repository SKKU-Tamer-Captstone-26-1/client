import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_maps_flutter/kakao_maps_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/map_api_data_source.dart';
import '../models/map_place.dart';
import 'widgets/kakao_map_view.dart';

const _fallbackPosition = LatLng(
  latitude: 37.29503950633725,
  longitude: 126.97742215615531,
);

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

  LatLng? _initialPosition;
  List<MapPlace> _places = const [];
  MapPlace? _selectedPlace;
  bool _locationLoading = true;
  bool _markersLoading = false;

  @override
  void initState() {
    super.initState();
    _loadInitialPosition();
  }

  Future<void> _loadInitialPosition() async {
    final gps = await _resolveGpsPosition();
    final usingFallback = gps == null;
    final position = gps ?? _fallbackPosition;
    debugPrint(
      '[MapScreen] initial position: '
      'lat=${position.latitude}, lon=${position.longitude} '
      '(${usingFallback ? "fallback" : "GPS"})',
    );
    if (!mounted) return;
    setState(() {
      _initialPosition = position;
      _locationLoading = false;
    });
    _fetchMarkersAround(position, halfDeg: 0.05);
  }

  Future<LatLng?> _resolveGpsPosition() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('[MapScreen] location service disabled');
        return null;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        debugPrint('[MapScreen] location permission: $permission');
        return null;
      }

      // Try last known position first (instant)
      final last = await Geolocator.getLastKnownPosition();
      if (last != null) {
        debugPrint('[MapScreen] using last known position');
        return LatLng(latitude: last.latitude, longitude: last.longitude);
      }

      // Fall back to fresh fix with longer timeout
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          timeLimit: Duration(seconds: 15),
        ),
      );
      return LatLng(latitude: pos.latitude, longitude: pos.longitude);
    } catch (e) {
      debugPrint('[MapScreen] GPS error: $e');
      return null;
    }
  }

  Future<void> _fetchMarkersAround(LatLng center, {double halfDeg = 0.05}) {
    return _fetchMarkers(
      minLon: center.longitude - halfDeg,
      minLat: center.latitude - halfDeg,
      maxLon: center.longitude + halfDeg,
      maxLat: center.latitude + halfDeg,
    );
  }

  Future<void> _fetchMarkers({
    required double minLon,
    required double minLat,
    required double maxLon,
    required double maxLat,
  }) async {
    if (_markersLoading) return;
    setState(() => _markersLoading = true);
    try {
      debugPrint('[MapScreen] fetching markers bbox=$minLon,$minLat,$maxLon,$maxLat');
      final markers = await _api.fetchMarkers(
        minLon: minLon,
        minLat: minLat,
        maxLon: maxLon,
        maxLat: maxLat,
      );
      debugPrint('[MapScreen] fetched ${markers.length} markers');
      if (!mounted) return;
      if (markers.isNotEmpty) setState(() => _places = markers);
    } catch (e) {
      debugPrint('[MapScreen] fetchMarkers error: $e');
    } finally {
      if (mounted) setState(() => _markersLoading = false);
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
      body: _locationLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primaryContainer),
            )
          : Stack(
              children: [
                Positioned.fill(
                  child: KakaoMapView(
                    initialPosition: _initialPosition!,
                    places: _places,
                    onPlaceSelected: (place) =>
                        setState(() => _selectedPlace = place),
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
                    palette: palette,
                  ),
                ),
                if (_markersLoading)
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
                if (_selectedPlace != null)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 20,
                    child: _PlaceInfoCard(
                      place: _selectedPlace!,
                      onDismiss: () => setState(() => _selectedPlace = null),
                    ),
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
          BoxShadow(color: Color(0x18000000), blurRadius: 16, offset: Offset(0, 6)),
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

const _chipColors = [
  Color(0xFFFF7E36), // Bar — primary orange
  Color(0xFFC4963A), // Pub — amber
  Color(0xFF4F7ED4), // Liquor Shop — steel blue
  Color(0xFF5CA874), // Outdoor — sage green
];

class _MapFilterChips extends StatelessWidget {
  const _MapFilterChips({required this.labels, required this.palette});
  final List<String> labels;
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
          final isSelected = index == 0;
          final chipColor = index < _chipColors.length
              ? _chipColors[index]
              : AppColors.primaryContainer;
          return DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected ? chipColor : palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(999),
              border: isSelected
                  ? null
                  : Border.all(color: chipColor.withValues(alpha: 0.6)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: Text(
                  labels[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : chipColor,
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

class _PlaceInfoCard extends StatelessWidget {
  const _PlaceInfoCard({required this.place, required this.onDismiss});
  final MapPlace place;
  final VoidCallback onDismiss;

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
          BoxShadow(color: Color(0x26000000), blurRadius: 24, offset: Offset(0, 10)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasImage) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AppNetworkImage(url: place.imageUrl, width: 80, height: 80),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    place.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    [
                      place.category,
                      if (hasDistance) place.distanceLabel,
                    ].join('  ·  '),
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
                  if (hasRating) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: AppColors.primaryContainer),
                        const SizedBox(width: 2),
                        Text(
                          place.rating,
                          style: const TextStyle(
                            color: AppColors.primaryContainer,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            GestureDetector(
              onTap: onDismiss,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(Icons.close, size: 20, color: palette.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
