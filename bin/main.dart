import 'package:coding_challenges/1_fibonacci/fibonacci.dart';

void main(List<String> arguments) {
  var fibN = 20;
  executeChallenge(fibonacci, 'The ${fibN}th Fibonacci number is:', [fibN]);
}

void executeChallenge(Function func, String stringToPrint, List<dynamic> arguments) {
  print('$stringToPrint ${func(arguments[0])}');

}
