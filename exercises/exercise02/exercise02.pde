// added floats for the additional balls positions

float [] x;
float [] y;
float [] xD;
float [] yD;

// Number of additional balls on screen
int numOfBalls = 10;

// Setting initial background color to 0 (black)
color backgroundColor = color(0);

// Number of "static" noise objects 
int numStatic = 1000;

// Minimal size of a static rect (1 pix)
int staticSizeMin = 1;

// Max size of static rect (3 pix)
int staticSizeMax = 5;

// Color of the static rect 200 (grey)
color staticColor = color(200);

// Holds position of the peddel along the X axis
int paddleX;

// Holds position of the peddel along the Y axis
int paddleY;

// Holds number of pixels the paddle should be moved for on the next draw cycle
// If negative value - move left, if possitive value - move right
int paddleVX;

// Represents the speed of movement of the paddle along the x-axis
// (i.e. how many pixels the paddle is moved each time LEFT or RIGHT button is pressed)
int paddleSpeed = 10;

// Width of the paddle
int paddleWidth = 128;

// Height of the padde
int paddleHeight = 16;

// Color of the paddle 255 (white)
color paddleColor = color(255);

// Repeated values for paddle2
int paddleX2;
int paddleY2;
int paddleVX2;
int paddleSpeed2 = 10;
int paddleWidth2 = 128;
int paddleHeight2 = 16;
color paddleColor2 = color(255);


// Positin of the ball alog the x-axis
int ballX;

// Positin of the ball alog the y-axis
int ballY;

// Holds how many pixels along the x-axis the ball should be moved
// in the next draw cycle
int ballVX;

// Holds how many pixels along the y-axis the ball should be moved
// in the next draw cycle
int ballVY;

// Speed of the ball (number of ixels the ball is moved per draw cycle)
int ballSpeed = 5;

// Size of the ball (i.e size of the sides of the ball rect)
int ballSize = 16;

// The color of the ball 255 (white)
color ballColor = color(255);

// Color variation value.
color ballColorV = color(random(255), random(255), random(255));

color ballColorG = color(random(255), random(255), random(255));


// Initial setup of the scene, called once before starting the animations
void setup() {
  
   // Setting size of the screen to 640 px width and 480 px hight
  size(640, 480); 
    // Calling setupPaddle() and setupPaddle2() functions to set up the paddle variables
  setupPaddle();
  setupPaddle2();
  
   // Calling setupBall() and setupBall2() functions to set up the ball variables
  setupBall();
  setupBalls();
}

// Sets initial values for paddle and paddle2 variables
void setupPaddle() {
    // Setting the paddle to be on center of the bottom edge of the screen, stationary
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

void setupPaddle2() {
  paddleX2 = width/2;
  paddleY2 = paddleHeight;
  paddleVX2 = 0;
}

// Sets initial values for ball variables
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

// Sets initial values for balls variables and their for loop 
void setupBalls() {
  // Adding new float values; numOfBalls decalred above. x and y are original and xD, and yD are changing. 
  x = new float[numOfBalls];
  y = new float[numOfBalls];
  xD = new float[numOfBalls];
  yD = new float[numOfBalls];
  // Beginning of the loop; If i = 0 then i is less than numOfBalls then do the process below and then come back and add 1 (i++)
  for(int i = 0; i < numOfBalls; i++) {
    x[i] = random(5, 475);
    y[i] = random(5, 475);
    xD[i] = random(2, 7);
    yD[i] = random(2, 7);
  }
}


// Called directly after setup() and executes continuously
// All Processing programs update the screen at the end of draw()
void draw() {
  
    // Setting the color for the background of the Processing window
  background(backgroundColor);
  
    // Calling functin that draws the static noise on the screen
  drawStatic();

  // Calling functin that updates the values in both paddles position variables
  updatePaddle();
  updatePaddle2();
  
  // Calling functin that updates the values in the ball position variables  
  updateBall();
  updateBalls();

 
  // Calling functin that draws the paddle on the screen, accordng to the values in paddle position variables
  drawPaddle();
  drawPaddle2();
  
    // Calling functin that draws the ball on the screen, accordng to the values in ball position variables
  drawBall();
  
    // Calling functin that draws the balls on the screen, accordng to the values in balls position variables
  drawBalls();
}


// Draws the static noise background on the screen
void drawStatic() {
  
    // In the loop, iterating over each static pixel, (from 0 to 1000)
  for (int i = 0; i < numStatic; i++) {
       // Calculating randomly position x, y and size for a noise pixel.
   // and drawing it on the screen
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(random (200),random(200), random (200));
   rect(x,y,staticSize,staticSize);
  }
}

// Updates the values in paddles position variables
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}


void updatePaddle2() {
  paddleX2 += paddleVX2;  
  paddleX2 = constrain(paddleX2, 0+paddleWidth2/2, width-paddleWidth2/2);
}

// Updates the values in ball position variables
void updateBall() {
  //ballColor = ballColorV;
  ballX += ballVX;
  ballY += ballVY;
  
  
  // Calling functions that handle cases like: ball hist the paddle, ball hits the wall,
  // and ball hits the bottom of the screen
  handleBallHitPaddle();
  handleBallHitPaddle2();
  handleBallHitWall();
  handleBallOffBottom();
  handleBallOffHeight();
}


// Updates the boucing and the positon of the balls, which are others than the main ball.
// Balls are meant to go off the screen for a short period of time; therefore values = -50 and 50
void updateBalls() {

  for(int i = 0; i < numOfBalls; i++)  {
    x[i] = x[i] + xD[i];
    y[i] = y[i] + yD[i];
    if ((x[i] > width + 50) || (x[i] < -50)) {
      xD[i] = -xD[i];
    }
    if ((y[i] > height + 50) || (y[i] < -50)) {
      yD[i] = -yD[i];
    }

  }

}


// Draws the paddle on the screen, accordng to the values in paddle position variables
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

void drawPaddle2() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor2);
  rect(paddleX2, paddleY2, paddleWidth2, paddleHeight2);
}

// Draws the ball on the screen, accordng to the values in ball position variables
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}

// Draws the balls on the screen, accordng to the values in balls position variables
void drawBalls() {
  for(int i = 0; i < numOfBalls; i++)  {
    noStroke();
    fill(ballColorV);
    ellipse(x[i], y[i], ballSize, ballSize);
  }
}

// Updates position of the ball if it touches the paddle
void handleBallHitPaddle() {
    // Checking if ball overlaps (touches) the paddle and readjusting its position
  if (ballOverlapsPaddle()) {
    ballColor = color(color(random(255), random(255), random(255)));
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}

// Updates position of the ball if it touches the paddle2
void handleBallHitPaddle2() {
    // Checking if ball overlaps (touches) the paddle and readjusting its position
  if (ballOverlapsPaddle2()) {
    ballColor = color(color(random(255), random(255), random(255)));
    ballY = paddleY2 + paddleHeight/2 + ballSize/2;
    ballVY = -ballVY;
  }
}

// Returns true if ball overlaps (touches) the paddle, and false otherwise
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

// Returns true if ball overlaps (touches) the paddle, and false otherwise
boolean ballOverlapsPaddle2() {
  if (ballX - ballSize/2 > paddleX2 - paddleWidth2/2 && ballX + ballSize/2 < paddleX2 + paddleWidth2/2) {
    if (ballY < paddleY2 + paddleHeight2/2) {

      return true;
    }
  }
  return false;
}

// Updates position of the ball if it reaches the bottom of the screen 
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

// Return true if ball reached the bottom of the screen, and false otherwise
boolean ballOffBottom() {
  return (ballY + ballSize/2 > height);
}

void handleBallOffHeight() {
  if (ballOffHeight()) {
    ballX = width/2;
    ballY = height/2;
  }
}

// Return true if ball reached the top of the screen, and false otherwise
boolean ballOffHeight() {
  return (ballY - ballSize/2 < 0);
}


// Updates position of the ball if it reaches the side of the screen
void handleBallHitWall() {
    // Checking if ball reached the left side of the screen
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
      // Checking if ball reached the right side of the screen
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
}


// Handling 'key pressed' event
void keyPressed() {
    // Checking if 'left' button was pressed
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
      // Checking if 'right' button was pressed
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
  
      // Checking if 'left' button was pressed
  if (keyCode == LEFT) {
    paddleVX2 = -paddleSpeed2;
          // Checking if 'right' button was pressed
  } else if (keyCode == RIGHT) {
    paddleVX2 = paddleSpeed2;
  }
}


// Handling 'key released' event
void keyReleased() {
    // Checking if 'left' button was released and paddle was moving left
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
        // Stop the move
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
      // Checking if 'left' button was released and paddle was moving left
  if (keyCode == LEFT && paddleVX2 < 0) {
    paddleVX2 = 0;
        // Stop the movev
  } else if (keyCode == RIGHT && paddleVX2 > 0) {
    paddleVX2 = 0;
  }
}

//This program has a potential of adding two more paddles (one on top and one at the bottom). 
//This way the ball could be bouncing off of 4 different paddles.  The code for that would be 
//fairly simple since we already got two perfectly functional paddles at the top and at the bottom. 
//Code for each paddle could be copy-pasted with minor adjustments in integer values (which would
//require creating new integer value for each new paddle i.e. paddleX3, paddleXV3 or paddleX4, paddleXV4). 
//However, each paddle would need to have a constrain function otherwise, once one the paddle hits
//the wall they will collide and become one, in other words, each paddle needs borders starting from
//the edge of the screen to the middle of the screen. Also, same way keyPressed and keyReleased events
//would be assigned to each paddle according to their assigned integers, for example, paddleXV3 or paddleXV4
//to determine whether the paddle is moving or not when keys are pressed or released.