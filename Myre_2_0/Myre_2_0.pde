
ArrayList<Pheromone> pheromones;
ArrayList<Food> foods;
ArrayList<Ant> ants;
Pheromone ph1;
Pheromone ph2;
float off = 0;
Ant ant;
void setup() {
  size(900, 900);
  background(200, 200, 200);
  rectMode(CENTER);
  pheromones = new ArrayList<Pheromone>();
  //  for (int i = 0; i < 20; i++) {
  //    pheromones.add(new Pheromone(new PVector(width/20*i + width/40, height/2)));
  //  }
  foods = new ArrayList<Food>();
  for (int i = 0; i < 5; i++) {
    foods.add(new Food(width/2 + random(100), height - height/5 + random(100)));
  }
  ants = new ArrayList<Ant>();
  for (int i = 0; i < 3; i++) {
    ants.add(new Ant());
  }
  ph1 = new Pheromone(new PVector(mouseX, mouseY));
  pheromones.add(ph1);
}

void draw() {
  background(200, 200, 200);
  ph1.pos.x = mouseX;
  ph1.pos.y = mouseY;
  ph1.show();
  for (int i = 0; i < pheromones.size(); i++) {
    pheromones.get(i).show();
    pheromones.get(i).decay();
  }
  for (Food f : foods) {
    f.show();
  }
  for (Ant a : ants) {
    a.move();
    a.debugGUI();
    a.show();
    a.detect();
  }

  pushMatrix();
  noFill();
  ellipse(width/2, height/2, 10*2, 10*2);
  popMatrix();
  off += 0.005;
}
