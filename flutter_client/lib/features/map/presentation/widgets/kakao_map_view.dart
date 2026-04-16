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
  });

  final List<MapPlace> places;
  final MapPlace selectedPlace;
  final ValueChanged<MapPlace> onPlaceSelected;

  @override
  State<KakaoMapView> createState() => _KakaoMapViewState();
}

class _KakaoMapViewState extends State<KakaoMapView> {
  KakaoMapController? _controller;

  @override
  void didUpdateWidget(covariant KakaoMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedPlace.id != widget.selectedPlace.id) {
      _moveToSelectedPlace();
    }
  }

  @override
  Widget build(BuildContext context) {
    const kakaoMapApiKey = String.fromEnvironment('KAKAO_MAP_API_KEY');
    const hasKakaoMapApiKey = kakaoMapApiKey != '';

    return Stack(
      fit: StackFit.expand,
      children: [
        if (hasKakaoMapApiKey)
          KakaoMap(
            initialPosition: LatLng(
              latitude: widget.selectedPlace.latitude,
              longitude: widget.selectedPlace.longitude,
            ),
            initialLevel: 15,
            onMapCreated: (controller) {
              _controller = controller;
              _addMockMarkers();
            },
          )
        else
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

  Future<void> _addMockMarkers() async {
    final controller = _controller;
    if (controller == null) {
      return;
    }

    for (final place in widget.places) {
      await controller.addMarker(
        markerOption: MarkerOption(
          id: place.id,
          latLng: LatLng(latitude: place.latitude, longitude: place.longitude),
        ),
      );
    }
  }

  Future<void> _moveToSelectedPlace() async {
    final controller = _controller;
    if (controller == null) {
      return;
    }

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
                'Run with --dart-define=KAKAO_MAP_API_KEY=... to render the Kakao map engine. Mock markers and cards use local app data.',
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
