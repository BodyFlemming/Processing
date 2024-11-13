
class MapController {
  ArrayList<Section> sections;
  ArrayList<Atom> atoms;
  // boolean sliceHor = true; 
  
  MapController(int atomsAmount) {
    initialMap(atomsAmount);
  }
  
  String getSliceDir(int i) {
    Section s = sections.get(i);
    
    
    if (s.h == s.w) {
      if (i == 0) {
        return "Hor";
      }
      else {
        int prevI = i-1;
        Section prevS = sections.get(prevI);
        while (prevS.h == prevS.w)
        {
          if (prevI == 0) {
            return "Hor";
          }
          prevI -= 1;
          prevS = sections.get(prevI);
        }
        if (prevS.h > prevS.w) return "Hor";
        else if (prevS.w > prevS.h) return "Ver";
      }
    }
    else if (s.h > s.w) return "Hor";
    return "Ver";
  }
  
  void splitSection(int i) {
    Section s = sections.get(i);
    String sliceDir = getSliceDir(i);
  
    if (sliceDir == "Hor") {
      sections.add(new Section(s.x, s.y, s.w, s.h/2));
      sections.add(new Section(s.x, s.y + s.h/2, s.w, s.h/2));
      //sections.remove(i);
      sliceDir = "Ver";
    } else {
      sections.add(new Section(s.x, s.y, s.w/2, s.h));
      sections.add(new Section(s.x + s.w/2, s.y, s.w/2, s.h));
      //sections.remove(i);
      sliceDir = "Hor";
    }
  }
  
  void divide(int threshold) {
    for (int i = 0; i < sections.size(); i++) {
      Section s = sections.get(i);
      println(s.atoms.size());
      if (s.atoms.size() >= threshold) {
        splitSection(i);
        
        int size = sections.size();
        Section first = sections.get(size-1); // Last element
        Section second = sections.get(size-2); // Second to last element
        first.findAtoms(s.atoms);
        second.findAtoms(s.atoms);
        sections.remove(i);
        
        --i;
      }
    }
  }
  
  void sortAtomsIntoSections(){
    for (Section s : sections) {
      s.findAtoms(atoms);
    }
  }
  
  void initialMap(int atomsAmount) {
    sections = new ArrayList<Section>();
    atoms = new ArrayList<Atom>();
    sections.add(new Section(0, 0, width/2, height));
    sections.add(new Section(width/2, 0, width/2, height));
    for(int i=0; i < atomsAmount; i++){
       atoms.add(new Atom(floor(randomGaussian()*width/6 + width/2), floor(randomGaussian()*height/6 + height/2)));
    }
  }
  
  void drawSections() {
    for (Section s : sections) {
      s.show();
    }
  }
  
  void drawAtoms() {
    for (Atom a : atoms) {
      a.show();
    }
  }
  
  void drawSectionsDebug() {
    for (int i = 0; i < sections.size(); ++i) {
      Section s = sections.get(i);
      push();
      textSize(20);
      fill(0,0,0);
      text(i, s.x+s.w/2, s.y+s.h/2);
      pop();
    }
  }
}
