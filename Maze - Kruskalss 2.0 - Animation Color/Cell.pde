class Cell {
  int x;
  int y;
  int section;
  Cell parent;
  float r;
  float g;
  float b;

  Cell(int i, int k, int sec) {
    x = i;
    y = k;
    section = sec;
    parent = null;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  void show() {
    push();
    Cell root = getRootNoDeepth();
    noStroke();
    fill(root.r, root.g, root.b);
    // fill(map(root.section, 0, indexArr.length, 0, 255));
    rect(x * cellSize, y * cellSize, cellSize, cellSize);
    pop();
  }
  void showSection() {
    textAlign(CENTER);
    textSize(20);
    fill(10);
    text(section, x * cellSize + cellSize / 2, y * cellSize + cellSize / 2);
  }
  void showRoot() {
    textAlign(CENTER);
    textSize(20);
    fill(10);
    text(getRootNoDeepth().section, x * cellSize + cellSize / 2, y * cellSize + cellSize / 2);
  }
  Cell getRoot(int[] i) {
    i[0]++;
    if (parent == null) {
      return this;
    }
    // print(this + " ");
    // print(i[0] + "\n");
    Cell root = parent.getRoot(i);
    return root;
  }
    Cell getRootNoDeepth() {
    if (parent == null) {
      return this;
    }
    Cell root = parent.getRootNoDeepth();
    return root;
  }
}
