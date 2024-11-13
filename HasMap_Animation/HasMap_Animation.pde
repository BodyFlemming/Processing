MapController controller;
int i;

void setup() {
  size(1024, 1024); // Size needs to be of power 2, otherwise small gaps happens at small sections sizes...
  controller = new MapController(1000, 10);
  frameRate(10);
  i = 0;
  //controller.sortAtomsIntoSections();
  //controller.divide(30);

  //controller.drawAtoms();
  //controller.drawSections(false); // noFill or fill
  
  //controller.drawSectionsDebug();

  println(controller.sections.size());
}

void draw() {
  background(0, 0, 0);
  controller.sortAtomsIntoSections();
  
  //controller.divide(30);
  Section s = controller.sections.get(i);
      
  if (s.atoms.size() >= 30) {
    controller.splitSection(i);
    
    int size = controller.sections.size();
    Section first = controller.sections.get(size-1); // Last element
    Section second = controller.sections.get(size-2); // Second to last element
    first.findAtoms(s.atoms);
    second.findAtoms(s.atoms);
    controller.sections.remove(i);
    
    --i;
  }
  
  controller.drawSections(false);
  controller.drawAtoms();
  controller.drawSectionsDebug();
  ++i;
  if (i > sections.size()) noLoop();
}
