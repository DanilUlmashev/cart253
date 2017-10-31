class Dropper extends Particles {

  float speed = 1;
  float t = random(0,100);


  Dropper() {

    x = width/2;
    y = 100;
    dx = speed;
    dy = 0;
  }

  void show() {
    fill(10, 10, 200);
    rect(x, y, 100, 100);
  }

  void act() {

    moveDropper();
    if  (frameCount < 200) {
    } else if (frameCount < 10000) {
      randomDrop();
    }
  }

  void straightLine(float tempX) {
    x = tempX;
    if (frameCount % 120 == 0) {
      engine.add(new Enemy(x, y));
    }
  }

  void randomDrop() {
    x = width*noise(t);
    t += 0.02;
    if (frameCount % 300 == 0) {
      engine.add(new Enemy(x, y));
    }
  }

  void moveDropper() {
    //x += dx;
    if (x > width - 50 || x < 0 + 50) {
      dx = -dx;
    }
  }



  boolean isDead() {

    return false;
  }
}