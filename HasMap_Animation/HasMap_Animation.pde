MapController controller;
int i;
Section s;

void setup() {
  size(1024, 1024); // Size needs to be of power 2, otherwise small gaps happens at small sections sizes...
  controller = new MapController(10000, 10);
  // frameRate(1);
  i = 0;
}

void draw() {
  //background(0, 0, 0);
  controller.sortAtomsIntoSections();
    
  i = controller.divideSingle(50,i);  
  
  if (i == controller.sections.size()) {
    noLoop();
    controller.drawAtoms();
    return;
  }
  
  Section s = controller.sections.get(i);
  controller.drawAtoms();
  s.show(false);
  
  //controller.drawSectionsDebug();

  if (frameCount % 10 == 0) println(frameRate);
  
}
