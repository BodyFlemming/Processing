
class Ant {
  PVector pos;
  PVector vel;
  float angle;
  String state;
  ArrayList<Pheromone> located;

  Ant() {
    pos = new PVector(width/2, height/5);
    vel = new PVector(0, 1);
    angle = 1;
    state = "searching";
    located = new ArrayList<Pheromone>();
  }

  void detect() {
    for (Pheromone n : pheromones) {
      pushMatrix();
      rotate(angle);
      translate(0, 20);
      if (Supp.circleCircleCol(0, 0, 30, n.pos.x - pos.x, n.pos.y - pos.y, 5)) {
        state = "following";
        located.add(n);
      }
     popMatrix();
    }
  }

  void move() {
    switch(state) {
      case("searching"):
      // pos.add(vel);
      break;
      case("following"):
      float angleSum = 0;
      for (Pheromone n : located) {
        PVector dir = PVector.sub(n.pos, pos);
        line(n.pos.x, n.pos.y, pos.x, pos.y);
        float angleBetween = PVector.angleBetween(dir, vel);
        println(angleBetween);
        angleSum += angleBetween / 10;
      }
      angle += angleSum;
      println(angle);
      // vel.rotate(angleSum);
      //pos.add(vel);
      located.clear();
      break;
    default:
      pos.add(vel);
    }
  }

  void draw() {
    pushMatrix();
    fill(217, 71, 71);
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, 0, 10, 20);
    popMatrix();
  }
  void debugGUI() {
    pushMatrix();
    switch(state) {
    case "searching":
      fill(255);
      break;
    case "following":
      fill(120, 0, 0);
      break;
    default:
      fill(255, 0, 0);
    }
    translate(pos.x, pos.y);
    line(0, 0, vel.x*50, vel.y*50);
    rotate(angle);
    ellipse(0, 20, 60, 60);
    popMatrix();
  }
}
