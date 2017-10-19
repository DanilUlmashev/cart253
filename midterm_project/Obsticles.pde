// ********************
// PONG MIDTERM GAME
// Obsticles class
// Represents a collection of obsticles in the game.
// CART 253-B
// Due 18 October, 2017
// ********************

class Obsticles {
  
  // Declaring the obsticles arrays
  Obsticle[][] obsticlesOdd = new Obsticle[4][11];
  Obsticle[][] obsticlesEven = new Obsticle[3][10];
  
  // Obsticle size
  int size = 15;

  Obsticles() {
    // Initializing the arrays and positioning the obsticles
    int dist = -90;
    for (int i = 0; i < obsticlesOdd.length; i++) {
      for (int j = 0; j < obsticlesOdd[i].length; j++) {
        obsticlesOdd[i][j] = new Obsticle(width/2 + dist, 0 + size + j*60, size);
      }
      dist += 60;
    }
    int dist2 = -60;
    for (int i = 0; i < obsticlesEven.length; i++) {
      for (int j = 0; j < obsticlesEven[i].length; j++) {
        obsticlesEven[i][j] = new Obsticle(width/2 + dist2, 30 + size + j*60, size);
      }
      dist2 += 60;
    }
    numberObsticlesActive = 11*4 + 10*3;
  }

  // Handling the interaction with the ball
  void handleBall(Ball ball) {
    int numberActive = 0;
    for (int i = 0; i < obsticlesOdd.length; i++) {
      for (int j = 0; j < obsticlesOdd[i].length; j++) {
        obsticlesOdd[i][j].handleBall(ball);
        if (obsticlesOdd[i][j].active) {
          numberActive++;
        }
      }
    }
    for (int i = 0; i < obsticlesEven.length; i++) {
      for (int j = 0; j < obsticlesEven[i].length; j++) {
        obsticlesEven[i][j].handleBall(ball);
        if (obsticlesEven[i][j].active) {
          numberActive++;
        }
      }
    }
    numberObsticlesActive = numberActive;
  }
  
  // Drawing the obsticles
  void display() {
    for (int i = 0; i < obsticlesOdd.length; i++) {
      for (int j = 0; j < obsticlesOdd[i].length; j++) {
        obsticlesOdd[i][j].displayObstacle();
      }
    }
    for (int i = 0; i < obsticlesEven.length; i++) {
      for (int j = 0; j < obsticlesEven[i].length; j++) {
        obsticlesEven[i][j].displayObstacle();
      }
    }
  }
}