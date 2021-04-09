import 'package:coding_challenges/1_fibonacci/fibonacci.dart';
import 'package:coding_challenges/2_robot_cleaner/robot_cleaner.dart';

void main(List<String> arguments) {
  // fibonacci();
  robotCleaner();
}

// Call challenge methods with executeChallenge to see the time it takes to complete the solution
void executeChallenge(Function func, String stringToPrint, List<dynamic> arguments) {
  int timeBefore = DateTime.now().microsecondsSinceEpoch;
  print('$stringToPrint ${func(arguments)}');
  int timeAfter = DateTime.now().microsecondsSinceEpoch;
  print('Executed in ${timeAfter - timeBefore} microseconds (10^-6)');
}

// Challenge 1: Fibonacci => Find the nth Fibonacci number
void fibonacci() {
  int fibN = 42;

  executeChallenge(fibonacci, 'The ${fibN}th Fibonacci number is:', [fibN]);
  executeChallenge(fibonacciRecursive, 'The ${fibN}th Fibonacci number (using recursion) is:', [fibN]);
}

// Challenge 2: Robot Cleaner => Traverse a 2D array with a robot
void robotCleaner() {
  int x = 10, y = 10;
  List<List<String>> newMap = List<List<String>>.generate(x, (_) => List.filled(y, '.'));
  RobotCleaner rc = RobotCleaner(cleaningMap: newMap);

  executeChallenge(rc.start, 'The amount of steps the Robot took to clean the map is:', [true, 2]);
}
