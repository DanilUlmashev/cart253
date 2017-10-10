// Declares color backgroundColor (pink/beige).
color backgroundColor = color(200, 150, 150);

// Declaring two Bouncer objects.
Bouncer bouncer;
Bouncer bouncer2;

// A function that defines initial enviroment properties
void setup() {
  size(640, 480);
  background(backgroundColor);

  // Initializing our Bouncer objects
  // (with position x, y; speed vx, vy; size; default color, and hover color)
  bouncer = new Bouncer(width/2, height/2, 5, 5, 50, color(150, 0, 0, 50), color(255, 0, 0, 50));
  bouncer2 = new Bouncer(width/2, height/2, -5, 5, 50, color(0, 0, 150, 50), color(0, 0, 255, 50));
}


// Handling draw "loop"
void draw() {  
  // Updating internal variables of the objects
  bouncer.update();
  bouncer2.update();

  // Drawing Bouncer objects accoriding to their internal variables.
  bouncer.draw();
  bouncer2.draw();
}

// Handling mouse pressed.
void mousePressed () {
  background(backgroundColor);
}