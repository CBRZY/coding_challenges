import 'dart:io';

class Position {
    final int x;
    final int y;

    const Position({this.x = 0, this.y = 0});
    Position.from(int posX, int posY): this(x: posX, y: posY);
}

class RobotCleaner {
  final List<List<String>> _cleaningMap;
  Position startingPos;
  Position currentPos;
  int steps = 0;
  bool shouldPrintMap = true;
  int algorithmToRun = 1;

  // Create a new map, starting position and current position of Robot
  RobotCleaner({required cleaningMap, int startingX = 0, int startingY = 0}) :
    _cleaningMap = cleaningMap,
    startingPos = Position(x: startingX, y: startingY),
    currentPos = Position(x: startingX, y: startingY);

  void printMap() {
    // Clear Debug Console
    print('\x1B[2J\x1B[0;0H'); 
    _cleaningMap.forEach((row) { 
      String displayRow = row.fold('', (prev, curr) => '$prev $curr');
      print(displayRow);
    });
    // Add delay to the printing of the map so that you can see how the Robot moves
    sleep(Duration(milliseconds: 100));
  }

  int start(List<dynamic> args) {
    shouldPrintMap = args[0];
    algorithmToRun = args[1];
    _cleaningMap[startingPos.y][startingPos.x] = 'R';
    traverseMap();
    return steps;
  }

  void traverseMap() {
    while(!isMapClean()!) {
      switch (algorithmToRun) {
        case 1: upRightDownLeft();
          break;
        case 2: rightLeftUpDown();
          break;
      }
      shouldPrintMap ? printMap() : null;
    }
  }

  // Algorithm for prioritising move direction in the following order: UP, RIGHT, LEFT, DOWN
  void upRightDownLeft() {
    if (canMoveTo(currentPos.x, currentPos.y - 1)) { // Up
      moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y - 1);
    } else if (canMoveTo(currentPos.x + 1, currentPos.y)) { // Right
      moveFromTo(currentPos.x, currentPos.y, currentPos.x + 1, currentPos.y);
    } else if (canMoveTo(currentPos.x, currentPos.y + 1)) { // Down
      moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y + 1);
    } else if (canMoveTo(currentPos.x - 1, currentPos.y)) { // Left
      moveFromTo(currentPos.x, currentPos.y, currentPos.x - 1, currentPos.y);
    } else {
      print('CANT MOVE');
    }
  }

  // Algorithm for prioritising move direction in the following order: RIGHT, LEFT, UP, DOWN
  void rightLeftUpDown() {
    if (canMoveTo(currentPos.x + 1, currentPos.y)) { // Right
      moveFromTo(currentPos.x, currentPos.y, currentPos.x + 1, currentPos.y);
    } else if (canMoveTo(currentPos.x - 1, currentPos.y)) { // Left
      moveFromTo(currentPos.x, currentPos.y, currentPos.x - 1, currentPos.y);
    } else if (canMoveTo(currentPos.x, currentPos.y - 1)) { // Up
      moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y - 1);
    } else if (canMoveTo(currentPos.x, currentPos.y + 1)) { // Down
      moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y + 1);
    } else {
      print('CANT MOVE');
    }
  }

  void moveFromTo(int moveFromX, int moveFromY, int moveToX, int moveToY) {
    _cleaningMap[moveToY][moveToX] = 'R';
    _cleaningMap[moveFromY][moveFromX] = '#';
    currentPos = Position.from(moveToX, moveToY);
    steps++;
  }

  

  bool canMoveTo(int moveToX, int moveToY) {
    if (moveToX >= 0 && moveToX < _cleaningMap[0].length && moveToY >= 0 && moveToY < _cleaningMap.length) {
      if (_cleaningMap[moveToY][moveToX] == '.') {
        return true;
      }
    }
    return false;
  }

  bool? isMapClean() {
    return _cleaningMap.every((row) => row.every((cell) => cell != '.'));
  }
}
