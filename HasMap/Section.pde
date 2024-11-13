
class Section {
  int x;
  int y;
  int w;
  int h;
  ArrayList<Atom> atoms;
  
  Section(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    atoms = new ArrayList<Atom>(); 
  }
  
 
  void show() {
    push();
    stroke(0, 0, 0);
    rect(x, y, w, h);
    pop();
  }
  
  void findAtoms(ArrayList<Atom> allAtoms){
    atoms.clear();
    for (Atom a : allAtoms) {
      if (pointRect(a.x, a.y, x, y, w, h)) {
        atoms.add(a);
      }
    }
  }

  // POINT/RECTANGLE
  boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {
  
    // is the point inside the rectangle's bounds?
    if (px >= rx &&        // right of the left edge AND
        px <= rx + rw &&   // left of the right edge AND
        py >= ry &&        // below the top AND
        py <= ry + rh) {   // above the bottom
          return true;
    }
    return false;
  }
    
}
