/*
  1. Fibonacci
  The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence,
  such that each number is the sum of the two preceding ones, starting from 0 and 1.
*/

// Iterative approach
int fibonacci(int n) {
  if (n <= 1) return n;

  var current = 2;
  var first = 0;
  var second = 1;

  while (current < n) {
    var temp = first + second;
    first = second;
    second = temp;
    current++;
  }

  return first + second;
}

// Recursive approach
int fibonacciRecursive(int n) {
  if (n <= 1) return n;
  return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2);
}