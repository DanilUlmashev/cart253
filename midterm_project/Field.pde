// ********************
// PONG MIDTERM GAME
// Background field class
// Reppresents the game field (as a decoration for the game)
// CART 253-B
// Due 18 October, 2017
// ********************

class Field {

  Field() {
  }
  
  // Drawing the "static" field in the game
  void displayField() {
    stroke(230, 150);
    strokeWeight(5);
    fill(0);
    line(width/2, 0, width/2, height);
    line(0, 80, width, 80);
    line(0, height-80, width, height-80);
    line(270, 85, 270, height-85);
    line(810, 85, 810, height-85);
    line(275, height/2, 805, height/2);
  }
}