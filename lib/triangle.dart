/*
  2. Triangle
  Given a triangle array, return the minimum path sum from top to bottom.

  For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.
*/

import 'dart:math';

/// Dynamic Programming with a bottom up approach
int minimumPathSum(List<List<int>> triangle) {
  // Start at the bottom of the triangle 
  for (int i = triangle.length - 2; i >= 0; i--) {
    // Start at the end of the row
    for (int j = triangle[i].length - 1; j >= 0; j--) {
      // Set the current node's value equal to the sum of current node's value and the minimum value between the nodes below it
      triangle[i][j] += min(triangle[i + 1][j], triangle[i + 1][j + 1]);
    }
  }
  // After traversing the entire triangle, the top node will have the value that is the minimum path sum
  return triangle[0][0];
}