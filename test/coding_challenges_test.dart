import 'package:coding_challenges/fibonacci.dart';
import 'package:coding_challenges/top_frequent_elements.dart';
import 'package:coding_challenges/triangle.dart';
import 'package:test/test.dart';

void main() {
  group('1 Fibonacci', () {
    test('Iterative', () {
      expect(
        executeChallenge(
          fibonacci,
          'The Nth (8) Fibonacci number is:',
          [8],
        ),
        21,
      );
      expect(
        executeChallenge(
          fibonacci,
          'The Nth (12) Fibonacci number is:',
          [12],
        ),
        144,
      );
      expect(
        executeChallenge(
          fibonacci,
          'The Nth (20) Fibonacci number is:',
          [20],
        ),
        6765,
      );
    });
    test('Recursive', () {
      expect(
        executeChallenge(
          fibonacciRecursive,
          'The Nth (8) Fibonacci number is:',
          [8],
        ),
        21,
      );
      expect(
        executeChallenge(
          fibonacciRecursive,
          'The Nth (12) Fibonacci number is:',
          [12],
        ),
        144,
      );
      expect(
        executeChallenge(
          fibonacciRecursive,
          'The Nth (20) Fibonacci number is:',
          [20],
        ),
        6765,
      );
    });
  });

  group('2 Triangle', () {
    test('Positive triangle', () {
      List<List<int>> triangle;
      triangle = [
        [2],
        [3, 4],
        [6, 5, 7],
        [4, 1, 8, 3]
      ];
      expect(
        executeChallenge(
          minimumPathSum,
          'The minimum path sum for triangle $triangle is:',
          [triangle],
        ),
        11,
      );
    });
    test('Negative triangle', () {
      List<List<int>> triangle;
      triangle = [
        [-1],
        [2, 3],
        [1, -1, -3]
      ];
      expect(
        executeChallenge(
          minimumPathSum,
          'The minimum path sum for triangle $triangle is:',
          [triangle],
        ),
        -1,
      );
    });
  });

  group('3 Top K Frequent Elements', () {
    test('List of integeres', () {
      var ints = [1, 1, 1, 2, 2, 3, 2, 2];
      var k = 2;
      expect(
        executeChallenge(
          topKFrequent,
          'The top $k elements in the list $ints is:',
          [ints, k],
        ),
        (List returnData) => returnData.every(
          (element) => (element == 2 || element == 1),
        ),
      );
    });
    test('List of String', () {
      var strings = ['R', 'A', 'B', 'B', 'A', 'A', 'T', 'R'];
      var k = 3;

      expect(
        executeChallenge(
          topKFrequent,
          'The top $k elements in the list $strings is:',
          [strings, k],
        ),
        (List returnData) => returnData.every(
          (element) => (element == 'A' || element == 'B' || element == 'R'),
        ),
      );
    });
  });
}

dynamic executeChallenge(
  Function func,
  String stringToPrint,
  List<dynamic> arguments,
) {
  int timeBefore = DateTime.now().microsecondsSinceEpoch;
  var result = Function.apply(func, arguments);
  int timeAfter = DateTime.now().microsecondsSinceEpoch;
  print('$stringToPrint $result');
  print('Executed in ${timeAfter - timeBefore} microseconds (10^-6)');
  return result;
}
