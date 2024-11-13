class Wall {
  int x1;
  int y1;
  int x2;
  int y2;
  Cell neighbour1;
  Cell neighbour2;
  boolean currentWall;
  Wall(int x1_, int y1_, int x2_, int y2_, Cell n1, Cell n2) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    neighbour1 = n1;
    neighbour2 = n2;
    currentWall = false;
  }
  void show() {
    push();
    strokeWeight(5);
    if (currentWall) stroke(255, 192, 0);
    else if (!currentWall) stroke(0,0,0);
    line(x1, y1, x2, y2);
    pop();
  }
}
