final List<List<int>> basePath = [
  [14, 6], [13, 6], [12, 6], [11, 6], [10, 6], [9, 6], // bottom left
  [8, 5], [8, 4], [8, 3], [8, 2], [8, 1], [8, 0], // left bottom
  [7, 0], // left middle
  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], // left top
  [5, 6], [4, 6], [3, 6], [2, 6], [1, 6], [0, 6], // up left
  [0, 7], // top middle
  [0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [5, 8], // up right
  [6, 9], [6, 10], [6, 11], [6, 12], [6, 13], [6, 14], // right top
  [7, 14], // right middle
  [8, 14], [8, 13], [8, 12], [8, 11], [8, 10], [8, 9], // right bottom
  [9, 8], [10, 8], [11, 8], [12, 8], [13, 8], [14, 8], // bottom right
  [14, 7], // bottom middle
];

final centerPosition = [
  [6, 6],
  [6, 7],
  [6, 8],
  [7, 6],
  [7, 7],
  [7, 8],
  [8, 6],
  [8, 7],
  [8, 8],
];

final holdPosition = [
  [2, 6],
  [8, 2],
  [12, 8],
  [6, 12],
];

final startPosition = [
  [13, 6], // p1
  [6, 1], // p2
  [1, 8], // p3
  [8, 13], // p4
];

final p1HomePosition = [
  [13, 7], [12, 7], [11, 7], [10, 7], [9, 7], [8, 7], // home to win
];

final p4HomePosition = [
  [7, 13], [7, 12], [7, 11], [7, 10], [7, 9], [7, 8], // home to win
];

final p3HomePosition = [
  [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7] // home to win
];

final p2HomePosition = [
  [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], // home to win
];
