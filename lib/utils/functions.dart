List<List<int>> rotatePath(List<List<int>> path, int boardSize) {
  return path.map((pos) {
    int newRow = pos[1];
    int newCol = boardSize - 1 - pos[0];
    return [newRow, newCol];
  }).toList();
}