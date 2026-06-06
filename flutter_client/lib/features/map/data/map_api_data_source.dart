import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/map_place.dart';
import '../models/map_review.dart';

const _defaultBaseUrl = String.fromEnvironment(
  'MAP_API_BASE_URL',
  defaultValue: 'http://127.0.0.1:8088',
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
    List<String> layers = const ['bar', 'pub', 'liquor_shop', 'outdoor_spot'],
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

  Future<List<MapPlace>> searchPlaces(String query) async {
    final q = query.trim();
    if (q.isEmpty) return [];
    final uri = Uri.parse('$_baseUrl/v1/map/search').replace(
      queryParameters: {'q': q},
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

  Future<MapReview> submitReview({
    required String markerId,
    required String authorId,
    required String author,
    required bool isAnonymous,
    required int rating,
    required String reviewBody,
  }) async {
    final uri = Uri.parse('$_baseUrl/v1/map/markers/$markerId/reviews');
    final response = await _client
        .post(
          uri,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode({
            'author_id': authorId,
            'author': author,
            'is_anonymous': isAnonymous,
            'rating': rating,
            'body': reviewBody,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('map-service ${response.statusCode}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    if (body['ok'] != true) {
      final err = body['error'] as Map<String, dynamic>?;
      throw Exception('map-service error: ${err?['code']}');
    }

    return MapReview.fromJson(body['review'] as Map<String, dynamic>);
  }
}
