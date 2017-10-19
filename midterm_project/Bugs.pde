// ********************
// PONG MIDTERM GAME
// Background bugs class
// Represents an array of bug objects (i.e. the background noise)
// CART 253-B
// Due 18 October, 2017
// ********************

class Bugs {
  
  // Declaring the array
  Bug [] bug = new Bug [1000];

  Bugs() {
    // Initializing the array
    for (int i = 0; i < bug.length; i++) {
      bug[i] = new Bug(random(width), random(height), 4);
    }
  }
  
  // Moving the bugs
  void moveBugs() {
    for (int i = 0; i < bug.length; i++) {
      bug[i].moveBug();
    }
  }
  
  // Drawing the bugs
  void displayBugs() {
    for (int i = 0; i < bug.length; i++) {
      bug[i].display();
    }
  }
}