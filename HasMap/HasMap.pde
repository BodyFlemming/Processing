ArrayList<Section> sections;
ArrayList<Atom> atoms;

void setup() {
  size(600, 600);
  initialMap();
}

void draw() {
  background(0, 0, 0);
  drawSections();
  drawAtoms();
}

void initialMap() {
  sections = new ArrayList<Section>();
  atoms = new ArrayList<Atom>();
  sections.add(new Section(0, 0, width/2, height));
  sections.add(new Section(width/2, 0, width/2, height));
  for(int i=0; i < 100; i++){
     atoms.add(new Atom(floor(randomGaussian()*width/6 + width/2), floor(randomGaussian()*height/6 + height/2)));
  }
}

void drawSections() {
  for (Section s : sections)
  {
    s.show();
  }
}

void drawAtoms() {
  for (Atom a : atoms) {
    a.show();
  }
}

void sortAtomsIntoSections(){
  for (Section s : sections) {
    s.findAtoms(atoms);
  }
}
