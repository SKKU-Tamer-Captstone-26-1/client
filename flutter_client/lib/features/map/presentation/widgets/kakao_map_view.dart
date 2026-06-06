import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kakao_maps_flutter/kakao_maps_flutter.dart';

import '../../../../core/theme/app_colors.dart';
import '../../models/map_place.dart';

// Pre-generated 36x36 circle PNGs (one per layer) — created with Pillow RGBA,
// ellipse fill, saved as PNG. Avoids K3fCore "unsupported image format" error.
const _layerIconBase64 = {
  'bar':
      'iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAtElEQVR4nO2YMRaEIAxEM3Moj7eFx/NS2O7blRARwhT+nsx3QsHT7MUH1kn5bMUdvB9dszFSYoQcZ8vcPYuZIj1tMVMmMpOZMpHZzJZpZYQvdRZc0Y6XxVUytUz9lckIlQXrusrWbUgFmhg0MWhi0MSgqQqh8w08gu9s3YYkhbBgbfjJ/GsoUwoXWdory2wJlYxqQzOl4Mx2V4YJUq2Z4cDy8AEX/bjwpcaDtu6clfsd82INTsWaTDxNgvkiAAAAAElFTkSuQmCC',
  'pub':
      'iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAuUlEQVR4nO2YwRGFIAxEw5blpKJfkBUxtqVX5yshIoQ9+K6O2eeGA6PIh02SRvK67NZz/W1Ns1NPiR5yGC3z9N00UqSlLUTKeGYiUsYzG9EytQz3oY4CM9qxsjBLppTJvzIaoTxhXXfZvA2xACEDQgaEDAgZEFYhbbwD9+CczdsQpZBOWJv+ZV4aipTSmyzulUW2pIWMYkMjpdSYba5MB0jVZroD88sLnPfj3IdaX7T15F263zEfUuEAiRxMPBtfCb0AAAAASUVORK5CYII=',
  'liquor_shop':
      'iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAuklEQVR4nO2YwRGFIAxEw9ZjL3T0D3aUXuxHr85XQkQIe/BdHbPPDQdGkQ+bJI3k37Zbz3VdmmannhI95DBa5um7aaRIS1uIlPHMRKSMZzaiZWoZ7kMdBWa0Y2Vhlkwpk39lNEJ5wrrusnkbYgFCBoQMCBkQMiCsQtp4B+7BOZu3IUohnbA2/cu8NBQppTdZ3CuLbEkLGcWGRkqpMdtcmQ6Qqs10B+aXFzjvx7kPtb5o68m7dL9jPqTCAS7kTDynjJbdAAAAAElFTkSuQmCC',
  'outdoor_spot':
      'iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAuUlEQVR4nO2YMRKFIAxEw57SgmP8Y3iMFN5SW+crISKELXytY/a5oWAU+bBJ0kjefrv1XJe1aXbqKdFDDqNlnr6bRoq0tIVIGc9MRMp4ZiNappbhPtRRYEY7VhZmyZQy+VdGI5QnrOsum7chFiBkQMiAkAEhA8IqpI134B6cs3kbohTSCWvTv8xLQ5FSepPFvbLIlrSQUWxopJQas82V6QCp2kx3YH55gfN+nPtQ64u2nrxL9zvmQyocEGxMPBxcYaoAAAAASUVORK5CYII=',
  'other':
      'iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAsklEQVR4nO2YQRKFIAxDS46ag/WqunX+F6gIJQvf1rF5piwYzT7aFBvE3Y/Wc5JDs8tMiRlyWC3z9N2yUmSkLWTKRGYiUyYyG9kyvYzwoc4CO9ppZWGXTC1Tf2UyQr5hXXfZug2pABMDJgZMDJgYMFUhDt6BZ3DN1m1IUogb1safzL+GMqV4k6W9ssyWWMmoNrRSio3ZzZVxgVRvZjjQX17goh8XPtR80daTd+V+x3xYhxO240w86u3sTwAAAABJRU5ErkJggg==',
};

Uint8List _iconBytesForLayer(String layerCode) {
  final b64 = _layerIconBase64[layerCode] ?? _layerIconBase64['other']!;
  return base64Decode(b64);
}

class KakaoMapView extends StatefulWidget {
  const KakaoMapView({
    super.key,
    required this.initialPosition,
    required this.places,
    required this.onPlaceSelected,
    this.onViewportChanged,
    this.onMapInteracted,
  });

  final LatLng initialPosition;
  final List<MapPlace> places;
  final ValueChanged<MapPlace> onPlaceSelected;
  final void Function(LatLngBounds bounds)? onViewportChanged;
  final VoidCallback? onMapInteracted;

  @override
  State<KakaoMapView> createState() => KakaoMapViewState();
}

class KakaoMapViewState extends State<KakaoMapView> {
  KakaoMapController? _controller;
  StreamSubscription<LabelClickEvent>? _markerClickSub;
  StreamSubscription<CameraMoveEndEvent>? _cameraSub;
  final Set<String> _addedMarkerIds = {};
  bool _markerLayerReady = false;
  bool _stylesRegistered = false;

  @override
  void didUpdateWidget(covariant KakaoMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.places != widget.places) {
      _syncMarkersWithRetry();
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
          if (widget.places.isNotEmpty)
            Positioned.fill(
              child: _MockMarkerOverlay(
                places: widget.places,
                onPlaceSelected: widget.onPlaceSelected,
              ),
            ),
        ],
      );
    }

    return KakaoMap(
      initialPosition: widget.initialPosition,
      initialLevel: 15,
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(KakaoMapController controller) {
    _controller = controller;

    _markerClickSub = controller.onLabelClickedStream.listen((event) {
      final tapped = widget.places.firstWhere(
        (p) => p.id == event.labelId,
        orElse: () => widget.places.first,
      );
      widget.onPlaceSelected(tapped);
    });

    _cameraSub = controller.onCameraMoveEndStream.listen((event) {
      widget.onMapInteracted?.call();
      const halfDeg = 0.05;
      widget.onViewportChanged?.call(LatLngBounds(
        southwest: LatLng(
          latitude: event.latitude - halfDeg,
          longitude: event.longitude - halfDeg,
        ),
        northeast: LatLng(
          latitude: event.latitude + halfDeg,
          longitude: event.longitude + halfDeg,
        ),
      ));
    });

    _syncMarkersWithRetry();
  }

  Future<void> moveToPlace(MapPlace place) async {
    final controller = _controller;
    if (controller == null) return;
    try {
      await controller.moveCamera(
        cameraUpdate: CameraUpdate.fromLatLng(
          LatLng(latitude: place.latitude, longitude: place.longitude),
        ),
      );
    } catch (e) {
      debugPrint('[KakaoMapView] moveCamera error: $e');
    }
  }

  Future<void> _syncMarkersWithRetry() async {
    for (var attempt = 0; attempt < 15; attempt++) {
      try {
        await _syncMarkers();
        return;
      } catch (e) {
        debugPrint('[KakaoMapView] _syncMarkers attempt $attempt failed: $e');
        await Future.delayed(const Duration(milliseconds: 400));
      }
    }
    debugPrint('[KakaoMapView] _syncMarkersWithRetry gave up after 15 attempts');
  }

  Future<void> _syncMarkers() async {
    final controller = _controller;
    if (controller == null) throw StateError('controller not ready');

    if (!_markerLayerReady) {
      await controller.addMarkerLayer(
        layerId: KakaoMapController.defaultLabelLayerId,
        clickable: true,
      );
      _markerLayerReady = true;
    }

    if (!_stylesRegistered) {
      final styles = _layerIconBase64.keys.map((code) {
        return MarkerStyle(
          styleId: code,
          perLevels: [MarkerPerLevelStyle.fromBytes(bytes: _iconBytesForLayer(code))],
        );
      }).toList();
      await controller.registerMarkerStyles(styles: styles);
      _stylesRegistered = true;
    }

    final newIds = widget.places.map((p) => p.id).toSet();

    final toRemove = _addedMarkerIds.difference(newIds).toList();
    if (toRemove.isNotEmpty) {
      await controller.removeMarkers(ids: toRemove);
      _addedMarkerIds.removeAll(toRemove);
    }

    final toAdd = widget.places.where((p) => !_addedMarkerIds.contains(p.id)).toList();
    if (toAdd.isEmpty) return;

    final options = toAdd.map((p) => MarkerOption(
      id: p.id,
      latLng: LatLng(latitude: p.latitude, longitude: p.longitude),
      styleId: _layerIconBase64.containsKey(p.layerCode) ? p.layerCode : 'other',
    )).toList();

    await controller.addMarkers(markerOptions: options);
    for (final p in toAdd) {
      _addedMarkerIds.add(p.id);
    }
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
              const Icon(Icons.map, color: AppColors.primaryContainer, size: 36),
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
                style: TextStyle(color: palette.onSurfaceVariant, fontSize: 12, height: 1.4),
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
    required this.onPlaceSelected,
  });

  final List<MapPlace> places;
  final ValueChanged<MapPlace> onPlaceSelected;

  @override
  Widget build(BuildContext context) {
    const positions = <Alignment>[
      Alignment(-0.35, -0.14),
      Alignment(0.34, -0.34),
      Alignment(0.12, 0.12),
    ];

    return Stack(
      children: [
        for (var i = 0; i < places.length && i < positions.length; i++)
          Align(
            alignment: positions[i],
            child: _MockMarkerButton(
              place: places[i],
              onPressed: () => onPlaceSelected(places[i]),
            ),
          ),
      ],
    );
  }
}

class _MockMarkerButton extends StatelessWidget {
  const _MockMarkerButton({required this.place, required this.onPressed});

  final MapPlace place;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            boxShadow: const [
              BoxShadow(color: Color(0x33000000), blurRadius: 10, offset: Offset(0, 4)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, color: AppColors.primaryContainer, size: 18),
              const SizedBox(width: 4),
              Text(
                place.name,
                style: const TextStyle(
                  color: Color(0xFF151C23),
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
