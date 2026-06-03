import 'dart:async';

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

const _filterLabels = ['All', 'Bar', 'Pub', 'Liquor Shop', 'Outdoor'];
const _filterLayers = <String?>[null, 'bar', 'pub', 'liquor_shop', 'outdoor_spot'];

// Per-layer chip colors matching marker icon colors.
const _chipColors = [
  Color(0xFF6B6B8A), // All
  Color(0xFFFF7E36), // Bar
  Color(0xFFC4963A), // Pub
  Color(0xFF4F7ED4), // Liquor Shop
  Color(0xFF5CA874), // Outdoor
];

IconData _layerIcon(String code) => switch (code) {
      'bar' => Icons.local_bar,
      'pub' => Icons.sports_bar,
      'liquor_shop' => Icons.liquor,
      'outdoor_spot' => Icons.park,
      _ => Icons.place,
    };

Color _layerColor(String code) => switch (code) {
      'bar' => const Color(0xFFFF7E36),
      'pub' => const Color(0xFFC4963A),
      'liquor_shop' => const Color(0xFF4F7ED4),
      'outdoor_spot' => const Color(0xFF5CA874),
      _ => const Color(0xFF6B6B8A),
    };

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
  final _mapViewKey = GlobalKey<KakaoMapViewState>();
  final _searchController = TextEditingController();

  LatLng? _initialPosition;
  List<MapPlace> _allPlaces = const [];
  int _filterIndex = 0;
  MapPlace? _selectedPlace;
  bool _locationLoading = true;
  bool _markersLoading = false;

  bool _searchActive = false;
  List<MapPlace> _searchResults = [];
  bool _searchLoading = false;
  Timer? _searchDebounce;

  List<MapPlace> get _filteredPlaces {
    final layer = _filterLayers[_filterIndex];
    if (layer == null) return _allPlaces;
    return _allPlaces.where((p) => p.layerCode == layer).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadInitialPosition();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _searchDebounce?.cancel();
    if (query.trim().isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    _searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() => _searchLoading = true);
      try {
        final results = await _api.searchPlaces(query.trim());
        if (mounted) setState(() => _searchResults = results);
      } catch (e) {
        debugPrint('[MapScreen] search error: $e');
      } finally {
        if (mounted) setState(() => _searchLoading = false);
      }
    });
  }

  void _selectSearchResult(MapPlace place) {
    setState(() {
      _searchActive = false;
      _searchResults = [];
      _selectedPlace = place;
    });
    _searchController.clear();
    _mapViewKey.currentState?.moveToPlace(place);
  }

  void _dismissSearch() {
    setState(() {
      _searchActive = false;
      _searchResults = [];
    });
    _searchController.clear();
  }

  Future<void> _loadInitialPosition() async {
    final gps = await _resolveGpsPosition();
    final position = gps ?? _fallbackPosition;
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
      if (!serviceEnabled) return null;

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }

      final last = await Geolocator.getLastKnownPosition();
      if (last != null) {
        return LatLng(latitude: last.latitude, longitude: last.longitude);
      }

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
      final markers = await _api.fetchMarkers(
        minLon: minLon,
        minLat: minLat,
        maxLon: maxLon,
        maxLat: maxLat,
      );
      if (!mounted) return;
      if (markers.isNotEmpty) setState(() => _allPlaces = markers);
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
                    key: _mapViewKey,
                    initialPosition: _initialPosition!,
                    places: _filteredPlaces,
                    onPlaceSelected: (place) => setState(() => _selectedPlace = place),
                    onViewportChanged: _onViewportChanged,
                    onMapInteracted: () => setState(() => _selectedPlace = null),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: _MapSearchBar(
                    palette: palette,
                    onTap: () => setState(() => _searchActive = true),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 16,
                  right: 16,
                  child: _MapFilterChips(
                    labels: _filterLabels,
                    selectedIndex: _filterIndex,
                    onSelected: (i) => setState(() {
                      _filterIndex = i;
                      final layer = _filterLayers[i];
                      if (_selectedPlace != null &&
                          layer != null &&
                          _selectedPlace!.layerCode != layer) {
                        _selectedPlace = null;
                      }
                    }),
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
                if (_searchActive) ...[
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: _dismissSearch,
                      child: const ColoredBox(color: Color(0x80000000)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: _SearchHeader(
                      controller: _searchController,
                      isLoading: _searchLoading,
                      onChanged: _onSearchChanged,
                      onDismiss: _dismissSearch,
                      palette: palette,
                    ),
                  ),
                  if (_searchResults.isNotEmpty)
                    Positioned(
                      top: 80,
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: _SearchResultsList(
                        results: _searchResults,
                        onResultSelected: _selectSearchResult,
                        palette: palette,
                      ),
                    ),
                ],
              ],
            ),
    );
  }
}

class _MapSearchBar extends StatelessWidget {
  const _MapSearchBar({required this.palette, this.onTap});
  final AppPalette palette;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
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
    ),
    );
  }
}

class _MapFilterChips extends StatelessWidget {
  const _MapFilterChips({
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    required this.palette,
  });
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
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
          final chipColor = index < _chipColors.length
              ? _chipColors[index]
              : AppColors.primaryContainer;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: DecoratedBox(
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
    final layerColor = _layerColor(place.layerCode);
    final hasRating = place.rating.isNotEmpty;
    final closesAt = place.openHours.isNotEmpty
        ? place.openHours.split(' - ').last
        : '';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: place.imageUrl.isNotEmpty
                  ? AppNetworkImage(url: place.imageUrl, width: 72, height: 72)
                  : Container(
                      width: 72,
                      height: 72,
                      color: layerColor.withValues(alpha: 0.12),
                      child: Icon(_layerIcon(place.layerCode), color: layerColor, size: 30),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    place.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (place.address.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      place.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: palette.secondary, fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      if (place.isOpenNow != null) ...[
                        _OpenBadge(
                          isOpen: place.isOpenNow!,
                          closesAt: place.isOpenNow! ? closesAt : '',
                          palette: palette,
                        ),
                        if (hasRating) const SizedBox(width: 8),
                      ],
                      if (hasRating) ...[
                        const Icon(Icons.star_rounded, size: 13, color: AppColors.primaryContainer),
                        const SizedBox(width: 2),
                        Text(
                          place.reviewCount != null
                              ? '${place.rating}  (${place.reviewCount})'
                              : place.rating,
                          style: const TextStyle(
                            color: AppColors.primaryContainer,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ],
                  ),
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

class _OpenBadge extends StatelessWidget {
  const _OpenBadge({required this.isOpen, required this.closesAt, required this.palette});
  final bool isOpen;
  final String closesAt;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final label = isOpen
        ? (closesAt.isNotEmpty ? '영업 중 · $closesAt까지' : '영업 중')
        : '영업 종료';
    final color = isOpen ? const Color(0xFF5CA874) : palette.secondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader({
    required this.controller,
    required this.isLoading,
    required this.onChanged,
    required this.onDismiss,
    required this.palette,
  });

  final TextEditingController controller;
  final bool isLoading;
  final ValueChanged<String> onChanged;
  final VoidCallback onDismiss;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, topPad + 16, 16, 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: palette.outlineVariant),
            boxShadow: const [
              BoxShadow(color: Color(0x26000000), blurRadius: 16, offset: Offset(0, 6)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onDismiss,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(Icons.arrow_back, size: 22, color: palette.onSurface),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    onChanged: onChanged,
                    style: TextStyle(color: palette.onSurface, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Search nearby bars and bottle shops',
                      hintStyle: TextStyle(
                        color: palette.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                if (isLoading)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryContainer,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResultsList extends StatelessWidget {
  const _SearchResultsList({
    required this.results,
    required this.onResultSelected,
    required this.palette,
  });

  final List<MapPlace> results;
  final ValueChanged<MapPlace> onResultSelected;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palette.outlineVariant),
        boxShadow: const [
          BoxShadow(color: Color(0x26000000), blurRadius: 20, offset: Offset(0, 8)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: results.length,
          separatorBuilder: (_, _) => Divider(
            height: 1,
            thickness: 1,
            color: palette.outlineVariant,
          ),
          itemBuilder: (context, index) {
            final place = results[index];
            final color = _layerColor(place.layerCode);
            return InkWell(
              onTap: () => onResultSelected(place),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            place.name,
                            style: TextStyle(
                              color: palette.onSurface,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            place.category,
                            style: TextStyle(
                              color: palette.secondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: palette.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
