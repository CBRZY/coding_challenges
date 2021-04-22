# Dart Coding Challenges

## Series of coding challenges developed/solved using the Dart language

### Structure
main.dart can be found in [bin](https://github.com/DigitalCapitan/coding_challenges/tree/main/bin)<br>
The main method is used to call all challenges and display time it takes to execute each method<br>

Source code of challenges can be found in [lib](https://github.com/DigitalCapitan/coding_challenges/tree/main/lib)<br>
List of all challenges are below<br>

Tests for all methods can be found in [test](https://github.com/DigitalCapitan/coding_challenges/tree/main/test)<br>

## Challenges
### 1. Fibonacci
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.

#### Example:

Input: n = 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.

### 2. Triangle
Given a triangle array, return the minimum path sum from top to bottom.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

#### Example:

Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
   2
  3 4
 6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11.