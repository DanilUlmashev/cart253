// Class Dropper, represents the invisible enemy deployer that constantly creates them. 

// Class Dropper also extends all functions and parameters from abstract class Particles 
// with exception of few local ones.
class Dropper extends Particles {

  float speed = 1;
  float t = random(0, 100);


  Dropper() {

    x = width/2;
    y = -100;
    dx = speed;
    dy = 0;
  }

  void show() {
    fill(10, 10, 200);
    rect(x, y, 100, 100);
  }

  void act() {

    //moveDropper();

    // First 200 frames no action.
    if  (frameCount < 300) {
      // unil 10000 frame handle dropper's random moving.
    } else if (frameCount < 10000) {
      randomDrop();
    }
  }

  //void straightLine(float tempX) {
  //  x = tempX;
  //  if (frameCount % 120 == 0) {
  //    engine.add(new Enemy(x, y));
  //  }
  //}

  // Moving the dropper in random directions on x axis.
  void randomDrop() {
    x = width*noise(t);
    t += 0.02;

    //  Deplying enemies once ecery 300 frames by instantiating the object enemy.
    if (frameCount % 300 == 0) {
      println(frameCount);
      engine.add(new Enemy(x, y));
    }
  }

  //void moveDropper() {
  //  //x += dx;
  //  if (x > width - 50 || x < 0 + 50) {
  //    dx = -dx;
  //  }
  //}



  boolean isDead() {

    return false;
  }
}