import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    final repository = PricingRepository();

    test('calculates price for one six-inch correctly', () {
      final price = repository.calculatePrice(quantity: 1, isFootlong: false);
      expect(price, 7.00);
    });

    test('calculates price for 3 footlongs correctly', () {
      final price = repository.calculatePrice(quantity: 3, isFootlong: true);
      expect(price, 33.00);
    });

    test('calculates price for 0 quantity as 0', () {
      final price = repository.calculatePrice(quantity: 0, isFootlong: true);
      expect(price, 0.00);
    });
  });
}