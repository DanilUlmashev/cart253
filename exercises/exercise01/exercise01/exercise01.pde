
// Declares the integer CIRCLE_SPEED as final and sets it to 7
final int CIRCLE_SPEED = 7;

// Declares the integer CIRCLE_SIZE_SPEED as final and sets it to 1
final int CIRCLE_SIZE_SPEED = 1;

//Declares the color NO_CLICK_FILL_COLOR as final and sets it to be some sort of pink
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);

// Declares the color CLICK_FILL_COLOR as final and sets it to be some sort of blue purple
final color CLICK_FILL_COLOR = color(100, 100, 250);

// Declares the color BACKGROUND_COLOR as final and sets it to be some sort of lighter pink
final color BACKGROUND_COLOR = color(250, 150, 150);

// Declares the color STROKE_COLOR as final and sets it to be some sort of lighter pink
final color STROKE_COLOR = color(250, 150, 150);

// Declares the integer CIRCLE_SIZE as final and sets it to 50
int circleSize;

// Declares the integer circleSizeV, represent the rate of change in circle size
int circleSizeV;

// Declares the integer circleX
int circleX;

// Declares the integer circleY
int circleY;

// Declares the integer circleVX
int circleVX; 

// Declares the integer circleVY
int circleVY;

// A function that defines initial enviroment properties
void setup() {
  
  // Sets the size of the screen 640 x-axis and 480 y-axis
  size(640, 480);
  
  // Initial position of X coordinate on x-axis (640/2)    
  circleX = width/2; 
  
  // Initial position of Y coordinate on y-axis (480/2)  
  circleY = height/2;
  
  // Initial size of the circle, 50
  circleSize = 50;
  
  // Integer circleVX and integer circleVY now equal to integer CIRCLE_SPEED which equals to 7
  // Represent the speed that circl moves in X and Y axis
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  circleSizeV = CIRCLE_SIZE_SPEED;
  
  // Stroke color equals to STROKE_COLOR which is some sort of lighter pink
  stroke(STROKE_COLOR);
  
  // Setting initial fill for the circle
  fill(NO_CLICK_FILL_COLOR);
  
  // Setting initial background of the scene
  background(BACKGROUND_COLOR);
}

// Handling draw "loop"
void draw() {
  
  // Function dist calculates the distance between two points - (mouseX, mouseY) and (circleX, circleY)
  // If distance is less than half of the size of cirle then make it color blue (CLICK_FILL_COLOR)
  if (dist(mouseX, mouseY, circleX, circleY) < circleSize/2) {
    fill(CLICK_FILL_COLOR);
  }
  
  // Otherwise make the color pink (NO_CLICK_FILL_COLOR)  
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  
  // Drawing the circle at position (circleX, circleY) and CIRCLE_SIZE size
  
  // If mouse is at the left side of the screen - drawing circle
  // otherwise - drawing square
  if (mouseX < width/2) {
    ellipse(circleX, circleY, circleSize, circleSize);
  }
  else {
    rect(circleX, circleY, circleSize, circleSize);
  }
  
  // Chanding position of the circle by moving it according to the speed value alogn x-axis.
  // Position of the circle on x-axis equals to initial position plus integer circleVX which equals to 7
  circleX += circleVX;
  
  // Chanding position of the circle by moving it according to the speed value alogn y-axis.
  // Position of the circle on y-axis equals to initial position plus integer circleVY which equals to 7
  circleY += circleVY;
  
  // If the circle reached the right or left sides of the screen, then change the circle's direction
  // (taking into considiration the circle size)
  if (circleX + circleSize/2 > width || circleX - circleSize/2 < 0) {
    circleVX = -circleVX;
  }
  
  // If the circle reached the top or bottom sides of the screen, then change the circle's direction
  // (taking into considiration the circle size)
  if (circleY + circleSize/2 > height || circleY - circleSize/2 < 0) {
    circleVY = -circleVY;
  }
  
  // Changing the size of the cirlcle on each iteration od draw.
  circleSize += circleSizeV;
  
  // If size of the circle is bigger than max or smaller than min,
  // than flipping the sign of circleSizeV
  if (circleSize > 95 || circleSize < 5) {
    circleSizeV = -circleSizeV;
  }
}

// Handling mouse pressed
void mousePressed() {
  // When mouse is pressed, drawing a new background to "rest" the scene
  background(BACKGROUND_COLOR);
}