
class Ant {
  PVector pos;
  PVector vel;
  PVector viewCenter;
  PVector home;
  String state;
  ArrayList<Pheromone> located;
  Food locatedFood;
  int viewRadius;
  float antRadius;
  float xOffset, yOffset;
  int followTimer;
  boolean followingTrue;
  float pheromoneTimer;
  float searchTimer;

  Ant() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 1);
    antRadius = 2.5;
    viewRadius = 30;
    viewCenter = new PVector(pos.x + vel.x*viewRadius, pos.y + vel.y*viewRadius);
    state = "searching";
    located = new ArrayList<Pheromone>();
    home = new PVector(pos.x, pos.y);
    xOffset = random(10000);
    yOffset = random(10000);
    followTimer = 60;
    pheromoneTimer = 30;
    searchTimer = 360;
  }

  void detect() {
    {
      // Sets up the viewing correctly
      viewCenter = new PVector(pos.x + vel.x*viewRadius, pos.y + vel.y*viewRadius);
      viewCenter.add(PVector.mult(vel, viewRadius/4));

      switch(state) {
        case("searching"):
        for (Pheromone p : pheromones) {
          if (circleCircleCol(viewCenter.x, viewCenter.y, viewRadius, p.pos.x, p.pos.y, 5)) {
            located.add(p);
            searchTimer = 360;
            state = "following";
          }
        }
        for (Food f : foods) {
          if (circleCircleCol(viewCenter.x, viewCenter.y, viewRadius, f.pos.x, f.pos.y, antRadius)) {
            locatedFood = f;
            searchTimer = 360;
            state = "gathering";
            break;
          }
        }
        break;
        case("following"):
        for (Pheromone p : pheromones) {
          if (circleCircleCol(viewCenter.x, viewCenter.y, viewRadius, p.pos.x, p.pos.y, 5)) {
            followTimer = 60;
            located.add(p);
          }
        }
        if (located.size() == 0) {
          followTimer--;
        }
        if (followTimer < 0) {
          followTimer = 60;
          followingTrue = false;
          state = "searching";
        }
        for (Food f : foods) {
          if (circleCircleCol(viewCenter.x, viewCenter.y, viewRadius, f.pos.x, f.pos.y, Food.foodSize)) {
            locatedFood = f;
            followingTrue = false;
            state = "gathering";
            break;
          }
        }
        if (circleCircleCol(viewCenter.x, viewCenter.y, viewRadius, home.x, home.y, 10) && !followingTrue) {
          vel.mult(-1);
          followingTrue = true;
        }
        break;
        case("followingTrue"):
        break;
        case("gathering"):
        boolean foundFood = false;
        for (Food f : foods) {
          if (circleCircleCol(viewCenter.x, viewCenter.y, viewRadius, f.pos.x, f.pos.y, Food.foodSize)) {
            locatedFood = f;
            foundFood = true;
            break;
          }
        }
        if (!foundFood) {
          state = "searching";
        }
        if (circleCircleCol(pos.x, pos.y, antRadius, locatedFood.pos.x, locatedFood.pos.y, Food.foodSize)) {
          foods.remove(locatedFood);
          state = "returning";
        }
        break;
        case("returning"):
        if (circleCircleCol(pos.x, pos.y, antRadius, home.x, home.y, 10)) {
          vel.mult(-1);
          state = "searching";
        }
        break;
      default:
      }
    }
  }

  void move() {
    switch(state) {
      case("searching"):
      vel.x += map(noise(off + xOffset), 0, 1, -0.1, 0.1);
      vel.y += map(noise(off + yOffset), 0, 1, -0.1, 0.1);
      searchTimer--;
      if (searchTimer < 0) {
        PVector dir = PVector.sub(home, pos);
        dir.normalize();
        vel.add(dir);
        if (circleCircleCol(pos.x, pos.y, antRadius, home.x, home.y, 10)) {
          searchTimer = 360;
        }
      }
      vel.normalize();
      pos.add(vel);
      break;
      case("following"):
      for (Pheromone p : located) {
        PVector dir = PVector.sub(p.pos, pos);
        drawVec(pos, dir);
        dir.setMag(0.1);
        vel.add(dir);
      }
      vel.normalize();
      drawVec(pos, PVector.mult(vel, 10));
      pos.add(vel);
      located.clear();
      break;
      case("followingTrue"):
      break;
      case("gathering"):
      PVector dir = PVector.sub(locatedFood.pos, pos);
      dir.normalize();
      vel.add(dir);
      vel.normalize();
      pos.add(vel);
      break;
      case("returning"):
      dir = PVector.sub(home, pos);
      dir.normalize();
      vel.x += map(noise(off + xOffset), 0, 1, -1, 1);
      vel.y += map(noise(off + yOffset), 0, 1, -1, 1);
      vel.add(dir);
      vel.normalize();
      pos.add(vel);
      pheromoneTimer--;
      if (pheromoneTimer < 0) {
        pheromones.add(new Pheromone(new PVector(pos.x, pos.y)));
        pheromoneTimer = 30;
      }
      break;
    default:
      pos.add(vel);
    }
  }

  void show() {
    pushMatrix();
    fill(20, 20, 20);
    ellipse(pos.x, pos.y, antRadius, antRadius);
    popMatrix();
  }
  void debugGUI() {
    pushMatrix();
    noFill();
    popMatrix();
    switch(state) {
      case ("searching"):
      fill(255);
      break;
      case ("following"):
      fill(0, 0, 200);
      break;
      case("followingTrue"):
      break;
      case("gathering"):
      fill(169, 69, 10);
      break;
      case("returning"):
      fill(50, 205, 0);
      break;
    default:
      fill(255, 0, 0);
    }
    ellipse(viewCenter.x, viewCenter.y, viewRadius*2, viewRadius*2);
    //line(0, 0, viewCenter.x, viewCenter.y);
    //line(0, 0, pos.x, pos.y);
  }
}
