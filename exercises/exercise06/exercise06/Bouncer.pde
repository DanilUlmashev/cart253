// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity.

class Bouncer {

  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // The size of the Bouncer
  float size;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;
  
  // Added actice state variable to indicate if the object is active or not
  boolean active = true;

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  
  // Added blobs object as a parametre to the function to handle intersection of the bouncer
  // with the blobs
  void update(Blobs blobs) {
    
    // Udating only the active bouncer
    if (active) {
      x += vx;
      y += vy;
      handleBounce();
      
      // Handling intercation of the bounce with the blobs
      handleBlobs(blobs);
    }
  }

  // handleBounce()
  //
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately

  void handleBounce() {
    // Check the left and right
    if (x - size/2 < 0 || x + size/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
  
  // Handles the if a collision of a a blob and a bouncer is detected, the bouncer
  // becomes inactive and disappears form the screen
  void handleBlobs(Blobs blobs) {
    for (Blob blob : blobs.blobs) {
      if (blob.contains(x, y)) {
        active = false;
      }
    }
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    // Displaying only the active boucer
    if (active) {
      noStroke();
      fill(fillColor);
      ellipse(x, y, size, size);
    }
  }
}