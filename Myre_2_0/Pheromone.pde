class Pheromone {
  PVector pos = new PVector();
  int life = 600;
  
  Pheromone (PVector pos_) {
    pos = pos_;
  }
  void decay() {
    life--;
    if (life < 0) {
      pheromones.remove(this);
    }
  }
  void show() {
    pushMatrix();
    strokeWeight(0.5);
    fill(30,240,60);
    ellipse(pos.x, pos.y, 10, 10);
    popMatrix();
  }
}
