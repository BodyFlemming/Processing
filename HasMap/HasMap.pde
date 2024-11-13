MapController controller;

void setup() {
  size(1024, 1024); // Size needs to be of power 2, otherwise small gaps happens at small sections sizes...
  controller = new MapController(1000, 10);
  controller.sortAtomsIntoSections();
  controller.divide(30);

  controller.drawAtoms();
  controller.drawSections(false); // noFill or fill
  
  //controller.drawSectionsDebug();

  println(controller.sections.size());
}

void draw() {
  //background(0, 0, 0);
  //controller.sortAtomsIntoSections();
  //controller.drawSections();
  //controller.drawAtoms();
  //controller.drawSectionsDebug();
}
