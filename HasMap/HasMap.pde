MapController controller;

void setup() {
  size(600, 600);
  controller = new MapController();
  controller.initialMap();
  controller.sortAtomsIntoSections();
  controller.divide(5);

  controller.drawSections();
  controller.drawAtoms();
  controller.drawSectionsDebug();

  println(controller.sections.size());
}

void draw() {
  //background(0, 0, 0);
  //controller.sortAtomsIntoSections();
  //controller.drawSections();
  //controller.drawAtoms();
  //controller.drawSectionsDebug();
}
