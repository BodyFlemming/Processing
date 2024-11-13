
ArrayList<Pheromone> pheromones;
Pheromone ph1;
Pheromone ph2;
Ant ant;
void setup() {
  size(500, 500);
  background(200, 200, 200);
  rectMode(CENTER);
  pheromones = new ArrayList<Pheromone>();
//  for (int i = 0; i < 20; i++) {
//    pheromones.add(new Pheromone(new PVector(width/20*i + width/40, height/2)));
//  }
  ant = new Ant();
  ph1 = new Pheromone(new PVector(mouseX, mouseY));
  ph2 = new Pheromone(new PVector(10, 350));
  pheromones.add(ph1);
  pheromones.add(ph2);
}

void draw() {
  background(200, 200, 200);
  ph1.pos.x = mouseX;
  ph1.pos.y = mouseY;
  ph1.draw();
  for (Pheromone n : pheromones) {
    n.draw();
  }
  ant.move();
  ant.detect();
  ant.debugGUI();
  ant.draw();
}
