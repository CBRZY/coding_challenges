import 'package:coding_challenges/1_fibonacci/fibonacci.dart';
import 'package:coding_challenges/2_robot_cleaner/robot_cleaner.dart';

void main(List<String> arguments) {
  // fibonacci();
  robotCleaner();
}

void executeChallenge(Function func, String stringToPrint, List<dynamic> arguments) {
  int timeBefore = DateTime.now().microsecondsSinceEpoch;
  print('$stringToPrint ${func(arguments[0])}');
  int timeAfter = DateTime.now().microsecondsSinceEpoch;
  print('Executed in ${timeAfter - timeBefore} microseconds (10^-6)');
}

void fibonacci() {
  int fibN = 42;
  executeChallenge(fibonacci, 'The ${fibN}th Fibonacci number is:', [fibN]);
  executeChallenge(fibonacciRecursive, 'The ${fibN}th Fibonacci number (using recursion) is:', [fibN]);
}

void robotCleaner() {
  int x = 10, y = 10;
  List<List<String>> newMap = List<List<String>>.generate(x, (_) => List.filled(y, '.'));
  RobotCleaner rc = RobotCleaner(cleaningMap: newMap);
  rc.start();
  rc.printMap();
}
