import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakao_maps_flutter/kakao_maps_flutter.dart';

import '../../../../core/theme/app_colors.dart';
import '../../models/map_place.dart';

class KakaoMapView extends StatefulWidget {
  const KakaoMapView({
    super.key,
    required this.places,
    required this.selectedPlace,
    required this.onPlaceSelected,
    this.onViewportChanged,
  });

  final List<MapPlace> places;
  final MapPlace selectedPlace;
  final ValueChanged<MapPlace> onPlaceSelected;

  /// Called when camera stops moving. Provides the new visible bounds.
  final void Function(LatLngBounds bounds)? onViewportChanged;

  @override
  State<KakaoMapView> createState() => _KakaoMapViewState();
}

class _KakaoMapViewState extends State<KakaoMapView> {
  KakaoMapController? _controller;
  StreamSubscription<LabelClickEvent>? _markerClickSub;
  StreamSubscription<CameraMoveEndEvent>? _cameraSub;
  final Set<String> _addedMarkerIds = {};

  @override
  void didUpdateWidget(covariant KakaoMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedPlace.id != widget.selectedPlace.id) {
      _moveToSelectedPlace();
    }
    if (oldWidget.places != widget.places) {
      _syncMarkers();
    }
  }

  @override
  void dispose() {
    _markerClickSub?.cancel();
    _cameraSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const kakaoMapApiKey = String.fromEnvironment('KAKAO_MAP_API_KEY');
    const hasKakaoMapApiKey = kakaoMapApiKey != '';

    if (!hasKakaoMapApiKey) {
      return Stack(
        fit: StackFit.expand,
        children: [
          const _KakaoMapConfigurationPlaceholder(),
          Positioned.fill(
            child: _MockMarkerOverlay(
              places: widget.places,
              selectedPlace: widget.selectedPlace,
              onPlaceSelected: widget.onPlaceSelected,
            ),
          ),
        ],
      );
    }

    return KakaoMap(
      initialPosition: LatLng(
        latitude: widget.selectedPlace.latitude,
        longitude: widget.selectedPlace.longitude,
      ),
      initialLevel: 7,
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(KakaoMapController controller) {
    _controller = controller;

    _markerClickSub = controller.onLabelClickedStream.listen((event) {
      final tapped = widget.places.firstWhere(
        (p) => p.id == event.labelId,
        orElse: () => widget.selectedPlace,
      );
      widget.onPlaceSelected(tapped);
    });

    _cameraSub = controller.onCameraMoveEndStream.listen((_) async {
      final bounds = await controller.getViewportBounds();
      if (bounds != null) {
        widget.onViewportChanged?.call(bounds);
      }
    });

    _syncMarkers();
  }

  Future<void> _syncMarkers() async {
    final controller = _controller;
    if (controller == null) return;

    final newPlaces = widget.places.where((p) => !_addedMarkerIds.contains(p.id)).toList();
    if (newPlaces.isEmpty) return;

    final options = newPlaces
        .map((p) => MarkerOption(
              id: p.id,
              latLng: LatLng(latitude: p.latitude, longitude: p.longitude),
            ))
        .toList();

    await controller.addMarkers(markerOptions: options);
    for (final p in newPlaces) {
      _addedMarkerIds.add(p.id);
    }
  }

  Future<void> _moveToSelectedPlace() async {
    final controller = _controller;
    if (controller == null) return;

    await controller.moveCamera(
      cameraUpdate: CameraUpdate.fromLatLng(
        LatLng(
          latitude: widget.selectedPlace.latitude,
          longitude: widget.selectedPlace.longitude,
        ),
      ),
      animation: const CameraAnimation(
        duration: 500,
        autoElevation: true,
        isConsecutive: false,
      ),
    );
  }
}

class _KakaoMapConfigurationPlaceholder extends StatelessWidget {
  const _KakaoMapConfigurationPlaceholder();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [palette.surfaceContainerLow, palette.surfaceContainerLowest],
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: palette.outlineVariant),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.map,
                color: AppColors.primaryContainer,
                size: 36,
              ),
              const SizedBox(height: 10),
              Text(
                'Kakao Map baseline',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Run with --dart-define=KAKAO_MAP_API_KEY=... to render the Kakao map engine.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: palette.onSurfaceVariant,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MockMarkerOverlay extends StatelessWidget {
  const _MockMarkerOverlay({
    required this.places,
    required this.selectedPlace,
    required this.onPlaceSelected,
  });

  final List<MapPlace> places;
  final MapPlace selectedPlace;
  final ValueChanged<MapPlace> onPlaceSelected;

  @override
  Widget build(BuildContext context) {
    final positions = <Alignment>[
      const Alignment(-0.35, -0.14),
      const Alignment(0.34, -0.34),
      const Alignment(0.12, 0.12),
    ];

    return IgnorePointer(
      ignoring: false,
      child: Stack(
        children: [
          for (var index = 0; index < places.length; index++)
            Align(
              alignment: positions[index % positions.length],
              child: _MockMarkerButton(
                place: places[index],
                isSelected: places[index].id == selectedPlace.id,
                onPressed: () => onPlaceSelected(places[index]),
              ),
            ),
        ],
      ),
    );
  }
}

class _MockMarkerButton extends StatelessWidget {
  const _MockMarkerButton({
    required this.place,
    required this.isSelected,
    required this.onPressed,
  });

  final MapPlace place;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(999),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryContainer : Colors.white,
            borderRadius: BorderRadius.circular(999),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                color: isSelected ? Colors.white : AppColors.primaryContainer,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                place.name,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF151C23),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
