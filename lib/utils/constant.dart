final List<List<int>> path = [
  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], // left top
  [5, 6], [4, 6], [3, 6], [2, 6], [1, 6], [0, 6], // up left
  [0, 7], // top middle
  [0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [5, 8], // up right
  [6, 9], [6, 10], [6, 11], [6, 12], [6, 13], [6, 14], // right top
  [7, 14], // right middle
  [8, 14], [8, 13], [8, 12], [8, 11], [8, 10], [8, 9], // right bottom
  [9, 8], [10, 8], [11, 8], [12, 8], [13, 8], [14, 8], // bottom right
  [14, 7], // top middle
  [14, 6], [13, 6], [12, 6], [11, 6], [10, 6], [9, 6], // bottom left
  [8, 5], [8, 4], [8, 3], [8, 2], [8, 1], [8, 0], // left bottom
  [7, 0], // left middle
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

final redHomePosition = [
  [2, 6],
  [8, 2],
  [12, 8],
  [6, 12],
];

final blueHomePosition = [
  [2, 6],
  [8, 2],
  [12, 8],
  [6, 12],
];

final yellowHomePosition = [
  [2, 6],
  [8, 2],
  [12, 8],
  [6, 12],
];

final greenHomePosition = [
  [2, 6],
  [8, 2],
  [12, 8],
  [6, 12],
];
