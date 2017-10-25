// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255, 0, 0);

  boolean active = true;



  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {

    // QUESTION: What is this if-statement for?
    // This statement prevents futher execution if the energy of the object is 0.
    if (energy == 0) {
      return;
    }

    // QUESTION: How does the Griddie movement updating work?
    // The object moves with the range of -1 to 2 and multiplied by its own size
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += size * xMoveType;
    y += size * yMoveType;

    // QUESTION: What are these if statements doing?
    // These If statements loop the object around the screen
    // if object goes off the left side of the screen then it appears on the rigth.
    if (x < 0) {
      x += width;
    }
    // if object goes off the right side of the screen then it appears on the left.
    else if (x >= width) {
      x -= width;
    }
    // if object goes off the top side of the screen then it appears on the bottom.
    if (y < 0) {
      y += height;
    }
    // if object goes off the bottom side of the screen then it appears on the top.
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;

    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level

  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    // this if statement prevents collision energy increase if either of the objects are already at 0 energy.
    if (energy == 0 || other.energy == 0) {
      return;
    }

    // QUESTION: What does this if-statement check?
    // This statement checks if center of one objects is the same as the other.
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);
    }
  }



  void changeColor() {
    fill(#FA83BD, energy); 
    noStroke();
    rect(x, y, size, size);
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    if (active) {
      // QUESTION: What does this fill line do?
      // This line applies the color to the drawing object accordint to its energy level.
      fill(fill, energy); 
      noStroke();
      rect(x, y, size, size);
    }
  }
}