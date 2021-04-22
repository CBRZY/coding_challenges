import 'package:coding_challenges/fibonacci.dart' as fib;

void main(List<String> arguments) {
  fibonacci();
}

// Call challenge methods with executeChallenge to see the time it takes to complete the solution
void executeChallenge(Function func, String stringToPrint, List<dynamic> arguments) {
  int timeBefore = DateTime.now().microsecondsSinceEpoch;
  var result = Function.apply(func, arguments);
  int timeAfter = DateTime.now().microsecondsSinceEpoch;
  print('$stringToPrint $result}');
  print('Executed in ${timeAfter - timeBefore} microseconds (10^-6)');
}

// Challenge 1: Fibonacci => Find the nth Fibonacci number
void fibonacci() {
  int fibN = 42;

  executeChallenge(fib.fibonacci, 'The Nth ($fibN) Fibonacci number is:', [fibN]);
  executeChallenge(fib.fibonacciRecursive, 'The Nth ($fibN) Fibonacci number (using recursion) is:', [fibN]);
}
