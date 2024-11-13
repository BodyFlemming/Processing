
boolean circleCircleCol(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {
  float dist = sqrt(pow((c1x-c2x),2) + pow((c1y-c2y),2));
  if (dist <  (c1r + c2r)) return true;
  else return false;
}
  
void drawVec(PVector o, PVector d) {
  line(o.x, o.y, o.x + d.x, o.y + d.y);
  pushMatrix();
  fill(255,0,0);
  ellipse(o.x + d.x, o.y + d.y, 2, 2);
  popMatrix();
}

void mousePressed() {
  pheromones.add(new Pheromone(new PVector(mouseX, mouseY)));
}
