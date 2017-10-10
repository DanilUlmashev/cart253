// Declares color backgroundColor (pink/beige).
color backgroundColor = color(200, 150, 150);

//Declaring two Bouncer objects.
//Changed declared object's name from bouncer to b to avoid confusion (CHANGED).
Bouncer b1;
Bouncer b2;

// A function that defines initial enviroment properties
void setup() {
  size(640, 480);
  background(backgroundColor);

  // Initializing our Bouncer objects
  // (with position x, y; speed vx, vy; size; default color, and hover color)
  // However, initial position will reset to new random coordinates due to the 
  // premir colision of two objects and function teleport (CHANGED).
  b1 = new Bouncer(width/2, height/2, 5, 5, 50, color(150, 0, 0, 50), color(255, 0, 0, 50));
  b2 = new Bouncer(width/2, height/2, -5, 5, 50, color(0, 0, 150, 50), color(0, 0, 255, 50));
}


// Handling draw "loop"
void draw() {  
  // Updating internal variables of the objects
  b1.update();
  b2.update();

  
  // Added functions to teleport the objects b to random positions at colision
  // Added float d to calculate the distance between two objects (CHANGED).
  float d = dist(b1.x, b1.y, b2.x, b2.y);
  if (d < b1.size + b2.size) {
    b1.teleport();
    b2.teleport();
    background(backgroundColor);
  }

    // Drawing Bouncer objects accoriding to their internal variables.
    b1.draw();
    b2.draw();
  
}

// Handling mouse pressed.
void mousePressed () {
  background(backgroundColor);

  // Added functions to teleport the objects b to random positions when mouse is pressed (CHANGED).
  b1.teleport();
  b2.teleport();
}