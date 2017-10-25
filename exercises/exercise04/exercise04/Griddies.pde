// Griddies class
//Represents an array of griddie objects.
// This class also calculates the distance between griddies and sparkles and if coditions are met then they change color 

class Griddies {

  // An array storing all the griddies
  Griddie[] griddies = new Griddie[50];
  // The size of a single grid element
  int gridSize = 20;


  Griddies() {
    // QUESTION: What does this for loop do?
    // This loop initializes griddies array with Griddie class objects.
    for (int i = 0; i < griddies.length; i++) {
      int x = floor(random(0, width/gridSize));
      int y = floor(random(0, height/gridSize));
      griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
    }
  }

  void updateGriddies() {
    // We need to loop through all the griddies one by one
    for (int i = 0; i < griddies.length; i++) {

      // Update the griddies
      griddies[i].update();

      // Now go through all the griddies a second time...
      for (int j = 0; j < griddies.length; j++) {
        // QUESTION: What is this if-statement for?
        // This statement prevents checking (or colliding) object to itself.
        if (j != i) {
          // QUESTION: What does this line check?
          // This line checks if objects collide and update their energy levels.
          griddies[i].collide(griddies[j]);
        }
      }
    }
  }

  void display() {
    for (int i = 0; i < griddies.length; i++) {
      griddies[i].display();
    }
  }

  void handle(Sparkles spakles) {

    for (int i = 0; i < griddies.length; i++) {

      Griddie griddie = griddies[i];

      for (int j = 0; j < spakles.sparkles.length; j++) {

        Sparkle sparkle = spakles.sparkles[j];

        float dist = dist(griddie.x, griddie.y, sparkle.x, sparkle.y);

        if (dist < griddie.size + sparkle.size) {

          griddie.changeColor();
          sparkle.changeColor();
        }
      }
    }
  }
}