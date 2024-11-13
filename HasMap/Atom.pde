
class Atom {
  int x;
  int y;

  Atom(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  /*
  void findSection(ArrayList<Section> _sections){
    for(int i=0; i < _sections.size(); i++){
      Section s = _sections.get(i);
      if(pointRect(x, y, s.x, s.y, s.w, s.h)){
         
      }
    } 
  }
  */
  
  void show(){
    push();
    strokeWeight(5);
    point(x, y);
    pop();
  }
  

}
