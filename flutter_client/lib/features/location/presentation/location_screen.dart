import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../../core/config/app_config.dart';
import '../../../core/theme/app_colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.onSave, this.onSkip});

  final void Function(String neighborhood)? onSave;
  final VoidCallback? onSkip;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _textController = TextEditingController();
  bool _isLoading = false;
  String? _confirmed;
  String? _error;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _searchByText() async {
    final query = _textController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _confirmed = null;
    });

    try {
      final result = await _addressSearch(query);
      setState(() {
        _confirmed = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'No results found. Try a more specific city, district, or neighborhood name.';
        _isLoading = false;
      });
    }
  }

  Future<void> _detectByGps() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _confirmed = null;
    });

    try {
      final permission = await Geolocator.checkPermission();
      final resolved = permission == LocationPermission.denied
          ? await Geolocator.requestPermission()
          : permission;

      if (resolved == LocationPermission.denied ||
          resolved == LocationPermission.deniedForever) {
        setState(() {
          _error = 'Location permission is required.';
          _isLoading = false;
        });
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
        ),
      );

      final result = await _reverseGeocode(pos.longitude, pos.latitude);
      setState(() {
        _confirmed = result;
        _textController.text = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Could not get current location.';
        _isLoading = false;
      });
    }
  }

  Future<String> _addressSearch(String query) async {
    final uri = Uri.parse(
      'https://dapi.kakao.com/v2/local/search/address.json',
    ).replace(queryParameters: {'query': query, 'size': '1'});

    final res = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $kKakaoRestApiKey',
    });

    if (res.statusCode != 200) {
      throw Exception('Kakao API error: ${res.statusCode}');
    }

    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final docs = body['documents'] as List<dynamic>;
    if (docs.isEmpty) throw Exception('No result');

    final doc = docs.first as Map<String, dynamic>;
    final addr = doc['address'] as Map<String, dynamic>?;
    if (addr == null) throw Exception('No address field');

    final d1 = (addr['region_1depth_name'] as String? ?? '').trim();
    final d2 = (addr['region_2depth_name'] as String? ?? '').trim();
    final d3 = (addr['region_3depth_name'] as String? ?? '').trim();

    final parts = [d1, d2, d3].where((s) => s.isNotEmpty).toList();
    if (parts.isEmpty) throw Exception('Empty region names');
    return parts.join(' ');
  }

  Future<String> _reverseGeocode(double lng, double lat) async {
    final uri = Uri.parse(
      'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=$lng&y=$lat',
    );
    final res = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $kKakaoRestApiKey',
    });

    if (res.statusCode != 200) {
      throw Exception('Kakao API error: ${res.statusCode}');
    }

    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final docs = body['documents'] as List<dynamic>;
    if (docs.isEmpty) throw Exception('No region found');

    // Prefer 법정동 (region_type == 'B'), fallback to first entry.
    final region = (docs.firstWhere(
      (d) => (d as Map<String, dynamic>)['region_type'] == 'B',
      orElse: () => docs.first,
    )) as Map<String, dynamic>;

    final d1 = (region['region_1depth_name'] as String? ?? '').trim();
    final d2 = (region['region_2depth_name'] as String? ?? '').trim();
    final d3 = (region['region_3depth_name'] as String? ?? '').trim();

    final parts = [d1, d2, d3].where((s) => s.isNotEmpty).toList();
    return parts.join(' ');
  }

  void _reset() {
    setState(() {
      _confirmed = null;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Select My Neighborhood',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select My Neighborhood',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Search by city, district, or neighborhood name,\nor use your current location.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      enabled: _confirmed == null,
                      keyboardType: TextInputType.text,
                      onSubmitted: (_) => _searchByText(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: '예) 수원시 장안구 율전동',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: (_isLoading || _confirmed != null) ? null : _searchByText,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Divider(color: colorScheme.outlineVariant)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: colorScheme.outlineVariant)),
                ],
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: (_isLoading || _confirmed != null) ? null : _detectByGps,
                icon: const Icon(Icons.my_location, size: 18),
                label: const Text('Use My Current Location'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else if (_confirmed != null)
                _ConfirmedLocation(
                  location: _confirmed!,
                  onReset: _reset,
                )
              else if (_error != null)
                Text(
                  _error!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: colorScheme.error,
                  ),
                ),
              const Spacer(),
              FilledButton.icon(
                onPressed: _confirmed != null
                    ? () => widget.onSave?.call(_confirmed!)
                    : null,
                icon: const Icon(Icons.check),
                label: const Text('Save & Continue'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: colorScheme.surfaceContainerHigh,
                  disabledForegroundColor:
                      colorScheme.onSurfaceVariant.withValues(alpha: 0.55),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: widget.onSkip,
                icon: const Icon(Icons.close, size: 16),
                label: const Text('Skip'),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmedLocation extends StatelessWidget {
  const _ConfirmedLocation({required this.location, required this.onReset});

  final String location;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryContainer.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(Icons.place, color: AppColors.primaryContainer, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              size: 18,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: onReset,
            tooltip: 'Search again',
          ),
        ],
      ),
    );
  }
}
