import 'dart:io';

/// Position 
/// 
/// Contains X and Y coordinates that can be used on a 2D List to represent a position in the 2D list
class Position {
    final int x;
    final int y;

    const Position({this.x = 0, this.y = 0});
    Position.from(int posX, int posY): this(x: posX, y: posY);
}

/// Robot Cleaner
/// 
/// 
class RobotCleaner {
  final List<List<String>> _cleaningMap;
  Position startingPos;
  Position currentPos;
  int steps = 0;
  bool shouldPrintMap = true;
  int algorithmToRun = 1;

  /// Create a new RobotCleaner.
  /// 
  /// [cleaningMap] - List<List<String>> representing a map for the Robot to clean
  /// 
  /// [startingX] - Starting position of the Robot on the X axis, defaults to 0
  /// 
  /// [startingY] - Starting position of the Robot on the Y axis, defaults to 0
  RobotCleaner({required cleaningMap, int startingX = 0, int startingY = 0}) :
    _cleaningMap = cleaningMap,
    startingPos = Position(x: startingX, y: startingY),
    currentPos = Position(x: startingX, y: startingY);

  /// Clears the current Debug console
  /// 
  /// Prints entire [cleaningMap]
  /// 
  /// Can be used to simulate movements of the Robot
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

  /// Start the Robot cleaning simulation
  /// [shouldPrintMap] - boolean to switch on printing of the cleaning map
  /// 
  /// [algorithmToRun] - integer to indicate which algorithm to run
  /// 
  /// Algorithm 1 - Robot checks and moves with the following priority Up, Right, Down, Left
  /// 
  /// Algorithm 1 - Robot checks and moves with the following priority Right, Left, Up, Down
  // TODO: Need to clean up argument list
  int start(List<dynamic> args) {
    shouldPrintMap = args[0];
    algorithmToRun = args[1];
    _cleaningMap[startingPos.y][startingPos.x] = 'R';
    _traverseMap();
    return steps;
  }

  /// Robot traverses map while the map still has '.' spots on the map
  void _traverseMap() {
    while(!_isMapClean()) {
      switch (algorithmToRun) {
        case 1: _upRightDownLeft();
          break;
        case 2: _rightLeftUpDown();
          break;
      }
      shouldPrintMap ? printMap() : null;
    }
  }

  /// Move the Robot from one position to another position
  /// 
  // TODO: Could possibly use Position instead of 4 integeres
  // TODO: Can remove the from coordinates as they are available in [currentPos]
  void _moveFromTo(int moveFromX, int moveFromY, int moveToX, int moveToY) {
    _cleaningMap[moveToY][moveToX] = 'R';
    _cleaningMap[moveFromY][moveFromX] = '#';
    currentPos = Position.from(moveToX, moveToY);
    steps++;
  }

  /// URDL
  /// 
  /// Algorithm for prioritising move direction in the following order: UP, RIGHT, LEFT, DOWN
  void _upRightDownLeft() {
    if (_canMoveTo(currentPos.x, currentPos.y - 1)) { // Up
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y - 1);
    } else if (_canMoveTo(currentPos.x + 1, currentPos.y)) { // Right
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x + 1, currentPos.y);
    } else if (_canMoveTo(currentPos.x, currentPos.y + 1)) { // Down
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y + 1);
    } else if (_canMoveTo(currentPos.x - 1, currentPos.y)) { // Left
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x - 1, currentPos.y);
    } else {
      print('CANT MOVE');
    }
  }

  /// RLUD
  /// 
  /// Algorithm for prioritising move direction in the following order: RIGHT, LEFT, UP, DOWN
  void _rightLeftUpDown() {
    if (_canMoveTo(currentPos.x + 1, currentPos.y)) { // Right
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x + 1, currentPos.y);
    } else if (_canMoveTo(currentPos.x - 1, currentPos.y)) { // Left
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x - 1, currentPos.y);
    } else if (_canMoveTo(currentPos.x, currentPos.y - 1)) { // Up
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y - 1);
    } else if (_canMoveTo(currentPos.x, currentPos.y + 1)) { // Down
      _moveFromTo(currentPos.x, currentPos.y, currentPos.x, currentPos.y + 1);
    } else {
      print('CANT MOVE');
    }
  }

  /// Checks if a certain position is open to move to
  // TODO: Could possibly use Position instead of 2 integeres
  // TODO: Should probably take [currentPos] into considiration, to ensure Robot doesn't 'jump'
  bool _canMoveTo(int moveToX, int moveToY) {
    if (moveToX >= 0 && moveToX < _cleaningMap[0].length && moveToY >= 0 && moveToY < _cleaningMap.length) {
      if (_cleaningMap[moveToY][moveToX] == '.') {
        return true;
      }
    }
    return false;
  }

  /// Checks if the entire map is clean
  bool _isMapClean() {
    return _cleaningMap.every((row) => row.every((cell) => cell != '.'));
  }
}
