class Pheromone {
  PVector pos = new PVector();
  int life = 100;
  
  Pheromone (PVector pos_) {
    pos = pos_;
  }
  void decay() {
    life--;
  }
  void draw() {
    pushMatrix();
    strokeWeight(0.5);
    fill(30,240,60);
    ellipse(pos.x, pos.y, 10, 10);
    popMatrix();
  }
}
