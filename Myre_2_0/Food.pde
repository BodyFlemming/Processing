class Food {
  PVector pos;
  static final float foodSize  = 2.5;

  Food(float x, float y) {
    pos = new PVector(x, y);
  }

  void show() {
    pushMatrix();
    fill(139, 69, 19);
    ellipse(pos.x, pos.y, 5, 5);
    popMatrix();
  }
}
