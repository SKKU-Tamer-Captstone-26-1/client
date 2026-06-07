import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_client/core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;

void main() {
  test('beverage recommendation request exposes diversity controls', () {
    final request = pb.GetBeverageRecommendationsRequest(
      limit: 3,
      excludeBeverageIds: ['bev-1', 'bev-2'],
      excludeResultIds: ['result-1'],
      diversityMode:
          pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_DIFFERENT,
    );

    expect(request.excludeBeverageIds, orderedEquals(['bev-1', 'bev-2']));
    expect(request.excludeResultIds, orderedEquals(['result-1']));
    expect(
      request.diversityMode,
      pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_DIFFERENT,
    );

    final decoded = pb.GetBeverageRecommendationsRequest.fromBuffer(
      request.writeToBuffer(),
    );
    expect(decoded.excludeBeverageIds, orderedEquals(['bev-1', 'bev-2']));
    expect(decoded.excludeResultIds, orderedEquals(['result-1']));
    expect(
      decoded.diversityMode,
      pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_DIFFERENT,
    );
  });
}
