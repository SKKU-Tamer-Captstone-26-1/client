import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/map_place.dart';

// Android emulator: 10.0.2.2 → host machine localhost
// iOS simulator: 127.0.0.1 works directly
// Physical device: set MAP_API_BASE_URL to host machine IP
const _defaultBaseUrl = String.fromEnvironment(
  'MAP_API_BASE_URL',
  defaultValue: 'http://10.0.2.2:8088',
);

class MapApiDataSource {
  MapApiDataSource({String? baseUrl, http.Client? client})
      : _baseUrl = baseUrl ?? _defaultBaseUrl,
        _client = client ?? http.Client();

  final String _baseUrl;
  final http.Client _client;

  Future<List<MapPlace>> fetchMarkers({
    required double minLon,
    required double minLat,
    required double maxLon,
    required double maxLat,
    List<String> layers = const ['bar', 'pub', 'liquor_shop'],
    int limit = 500,
    int offset = 0,
  }) async {
    final uri = Uri.parse('$_baseUrl/v1/map/markers').replace(
      queryParameters: {
        'bbox': '$minLon,$minLat,$maxLon,$maxLat',
        'layers': layers.join(','),
        'limit': '$limit',
        'offset': '$offset',
      },
    );

    final response = await _client.get(uri).timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('map-service ${response.statusCode}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    if (body['ok'] != true) {
      final err = body['error'] as Map<String, dynamic>?;
      throw Exception('map-service error: ${err?['code']}');
    }

    final markers = (body['markers'] as List<dynamic>).cast<Map<String, dynamic>>();
    return markers.map(MapPlace.fromApiMarker).toList();
  }
}
