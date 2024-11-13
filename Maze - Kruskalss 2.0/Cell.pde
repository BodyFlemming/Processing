class Cell {
  int x;
  int y;
  int section;
  Cell parent;

  Cell(int i, int k, int sec) {
    x = i;
    y = k;
    section = sec;
    parent = null;
  }
  void show() {
    push();
    noStroke();
    fill(230);
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
    // print(this + " ");
    // print(i[0] + "\n");
    Cell root = parent.getRootNoDeepth();
    return root;
  }
}
