import 'package:coding_challenges/1_fibonacci/fibonacci.dart';

void main(List<String> arguments) {
  var fibN = 42;
  executeChallenge(fibonacci, 'The ${fibN}th Fibonacci number is:', [fibN]);
  executeChallenge(fibonacciRecursive, 'The ${fibN}th Fibonacci number (using recursion) is:', [fibN]);
}

void executeChallenge(Function func, String stringToPrint, List<dynamic> arguments) {
  var timeBefore = DateTime.now().microsecondsSinceEpoch;
  print('$stringToPrint ${func(arguments[0])}');
  var timeAfter = DateTime.now().microsecondsSinceEpoch;
  print('Executed in ${timeAfter - timeBefore} microseconds (10^-6)');
}
