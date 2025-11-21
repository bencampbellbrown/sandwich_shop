import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';

void main() {
  group('OrderRepository', () {
    test('initial state', () {
      final repo = OrderRepository(maxQuantity: 5);

      expect(repo.quantity, equals(0));
      expect(repo.canIncrement, isTrue);
      expect(repo.canDecrement, isFalse);
    });

    test('increment increases quantity up to maxQuantity and stops', () {
      final repo = OrderRepository(maxQuantity: 2);

      expect(repo.quantity, equals(0));
      repo.increment();
      expect(repo.quantity, equals(1));
      expect(repo.canIncrement, isTrue);
      expect(repo.canDecrement, isTrue);

      repo.increment();
      expect(repo.quantity, equals(2));
      expect(repo.canIncrement, isFalse);
      expect(repo.canDecrement, isTrue);

      // Further increments should have no effect
      repo.increment();
      expect(repo.quantity, equals(2));
    });

    test('decrement decreases quantity down to 0 and stops', () {
      final repo = OrderRepository(maxQuantity: 3);

      // bring to non-zero
      repo.increment();
      repo.increment();
      expect(repo.quantity, equals(2));
      expect(repo.canDecrement, isTrue);

      repo.decrement();
      expect(repo.quantity, equals(1));
      expect(repo.canDecrement, isTrue);

      repo.decrement();
      expect(repo.quantity, equals(0));
      expect(repo.canDecrement, isFalse);

      // Further decrements should have no effect
      repo.decrement();
      expect(repo.quantity, equals(0));
    });

    test('canIncrement and canDecrement reflect boundary transitions', () {
      final repo = OrderRepository(maxQuantity: 1);

      // start
      expect(repo.canIncrement, isTrue);
      expect(repo.canDecrement, isFalse);

      // increment to max
      repo.increment();
      expect(repo.canIncrement, isFalse);
      expect(repo.canDecrement, isTrue);

      // decrement back to zero
      repo.decrement();
      expect(repo.canIncrement, isTrue);
      expect(repo.canDecrement, isFalse);
    });
  });
}