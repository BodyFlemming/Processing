
class Atom {
  int x;
  int y;

  Atom(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  void show(){
    push();
    strokeWeight(5);
    point(x, y);
    pop();
  }
  

}
