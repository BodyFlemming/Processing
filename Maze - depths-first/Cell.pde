class Cell {
  Boolean visited;
  Boolean[] walls;
  int x;
  int y;

  Cell(int i, int k) {
    visited = false;
    walls = new Boolean[]{true, true, true, true}; // op, højre, ned, venstre
    x = i;
    y = k;
  }
  void show(int x, int y) {
    push();
    if (visited) fill(230);
    else if (!visited) fill(160);
    noStroke();
    rect(x, y, cellSize, cellSize);
    pop();
    push();
    strokeWeight(2);
    stroke(0, 0, 0);
    if (walls[0]) line(x, y, x+cellSize, y);
    if (walls[1]) line(x+cellSize, y, x+cellSize, y+cellSize);
    if (walls[2]) line(x+cellSize, y+cellSize, x, y+cellSize);
    if (walls[3]) line(x, y+cellSize, x, y);
    pop();
  }
}
