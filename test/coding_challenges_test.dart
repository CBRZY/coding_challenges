import 'package:coding_challenges/1_fibonacci/fibonacci.dart';
import 'package:test/test.dart';

void main() {
  group('1 Fibonacci', () {
    test('Iterative', () {
      expect(fibonacci(8), 21);
      expect(fibonacci(12), 144);
      expect(fibonacci(20), 6765);
    });
    test('Recursive', () {
      expect(fibonacciRecursive(8), 21);
      expect(fibonacciRecursive(12), 144);
      expect(fibonacciRecursive(20), 6765);
    });
  });
  
}
