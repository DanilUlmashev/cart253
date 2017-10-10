
// Declares new object class (Bouncer).
class Bouncer {
  // Declares integers x, y coordinates, xv, xy velocity, and the size of the object.  
  int x;
  int y;
  int vx;
  int vy;
  int size;

  // Declares color values 
  color fillColor;
  color defaultColor;
  color hoverColor;


  // Constructor, creats object with position x, y; speed vx, vy; size; default color, and hover color. 
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {

    // Position of x, y coordinates which aquire their new values (tempX and tempY).
    x = tempX;
    y = tempY;

    // Velocity of x and y coordinates which aquire new values (tempVX and tempVY). 
    vx = tempVX;
    vy = tempVY;

    // Size of the object which aquires new value tempSize.  
    size = tempSize;

    // All color values aquire new color values (tempDefaultColor, tempHoverColor, defaultColor).  
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }

  // Updating internal variables. 
  void update() {
    // Updated position of x and y coordinates.  
    x += vx;
    y += vy;

    // Funtion handleBounce updates the object's behavior on bounce.  
    handleBounce();

    // Function handleMouse updates the behavior of the object with mouse position.
    handleMouse();
  }

  // Calls function handleBounce.
  void handleBounce() {

    // Determines the object's direction once it reaches either sides of the screen on x-axis and flips the signe. 
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
    }

    // Determines the object's direction once it reaches either sides of the screen on y-axis and flips the signe.
    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
    }

    // Sets the minimum and maximum values for x and y while object is traveling on the screen.  
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }


  // Calls function handleMouse.
  void handleMouse() {

    // Chnages the color of the object once the parameters of "dist" and the "size" were met. 
    //Otherwise remain defaultColor.
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }

  // Handling draw "loop"
  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}