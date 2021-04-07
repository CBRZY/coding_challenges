class StartingPosition {
    final int x;
    final int y;

    const StartingPosition({this.x = 0, this.y = 0});
}

class RobotCleaner {
  
  List<List<String>>? cleaningMap;
  final StartingPosition startingPos;

  RobotCleaner({this.cleaningMap, this.startingPos = const StartingPosition()});

  void printMap() {
    cleaningMap?.forEach((row) { 
      String displayRow = row.fold('', (prev, curr) => '$prev $curr');
      print(displayRow);
    });
  }

  void start() {
    cleaningMap?[startingPos.y][startingPos.x] = 'R';
    cleaningMap != null ? traverseMap() : null;
    
  }


  void traverseMap() {

  }

  
}
