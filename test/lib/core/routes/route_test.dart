import 'package:flutter_test/flutter_test.dart';
import 'package:kebormed/core/routes/route.dart';

void main() {
  group('Routes', () {
    late Routes routes;

    setUp(() {
      routes = Routes();
    });

    test('should have correct login route', () {
      expect(routes.login, '/login');
    });

    test('should have correct home route', () {
      expect(routes.home, '/home');
    });

    test('should have correct detail route', () {
      expect(routes.detail, '/detail');
    });
  });
}
