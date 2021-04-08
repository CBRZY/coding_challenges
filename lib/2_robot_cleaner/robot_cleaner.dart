import 'dart:io';

class Position {
    final int x;
    final int y;

    const Position({this.x = 0, this.y = 0});
    Position.from(int posX, int posY): this(x: posX, y: posY);
}

class RobotCleaner {
  List<List<String>> cleaningMap;
  Position startingPos;
  Position currentPos;
  int steps = 0;
  bool mapClean = false;
  bool shouldPrintMap = true;

  // Create a new map, starting position and current position of Robot
  RobotCleaner({required this.cleaningMap, int startingX = 0, int startingY = 0}) :
    startingPos = Position(x: startingX, y: startingY),
    currentPos = Position(x: startingX, y: startingY);

  void printMap() {
    // Clear Debug Console
    print("\x1B[2J\x1B[0;0H"); 
    cleaningMap.forEach((row) { 
      String displayRow = row.fold('', (prev, curr) => '$prev $curr');
      print(displayRow);
    });
    // Add delay to the printing of the map so that you can see how the Robot moves
    sleep(Duration(milliseconds: 100));
  }

  int start(bool printMap) {
    shouldPrintMap = printMap;
    cleaningMap[startingPos.y][startingPos.x] = 'R';
    traverseMap();
    return steps;
  }

  void traverseMap() {
    while(!isMapClean()!) {
      if (canMoveUp()) {
        cleaningMap[currentPos.y - 1][currentPos.x] = 'R';
        cleaningMap[currentPos.y][currentPos.x] = '#';
        currentPos = Position.from(currentPos.x, currentPos.y - 1);
        steps++;
      } else if (canMoveRight()) {
        cleaningMap[currentPos.y][currentPos.x + 1] = 'R';
        cleaningMap[currentPos.y][currentPos.x] = '#';
        currentPos = Position.from(currentPos.x + 1, currentPos.y);
        steps++;
      } else if (canMoveDown()) {
        cleaningMap[currentPos.y + 1][currentPos.x] = 'R';
        cleaningMap[currentPos.y][currentPos.x] = '#';
        currentPos = Position.from(currentPos.x, currentPos.y + 1);
        steps++;
      } else if (canMoveLeft()) {
        cleaningMap[currentPos.y][currentPos.x - 1] = 'R';
        cleaningMap[currentPos.y][currentPos.x] = '#';
        currentPos = Position.from(currentPos.x - 1, currentPos.y);
        steps++;
      } else {
        print('CANT MOVE');
        mapClean = true;
      }
      shouldPrintMap ? printMap() : null;
    }
  }

  // TODO: Clean up to only use a single method with parameters to calculate movability
  bool canMoveUp() {
    if (currentPos.y - 1 >= 0 && currentPos.y - 1 < cleaningMap.length) {
      if (cleaningMap[currentPos.y - 1][currentPos.x] == '.') {
        return true;
      }
    }
    return false;
  }
  bool canMoveRight() {
    if (currentPos.x + 1 >= 0 && currentPos.x + 1 < cleaningMap[0].length) {
      if (cleaningMap[currentPos.y][currentPos.x + 1] == '.') {
        return true;
      }
    }
    return false;
  }
  bool canMoveDown() {
    if (currentPos.y + 1 >= 0 && currentPos.y + 1 < cleaningMap.length) {
      if (cleaningMap[currentPos.y + 1][currentPos.x] == '.') {
        return true;
      }
    }
    return false;
  }
  bool canMoveLeft() {
    if (currentPos.x - 1 >= 0 && currentPos.x - 1 < cleaningMap[0].length) {
      if (cleaningMap[currentPos.y][currentPos.x - 1] == '.') {
        return true;
      }
    }
    return false;
  }

  bool? isMapClean() {
    return cleaningMap.every((row) => row.every((cell) => cell != '.'));
  }
}
