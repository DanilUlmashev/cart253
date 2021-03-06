// Class Enemy, represents the incoming enemy unit.

// Class Enemy also extends all functions and parameters from abstract class Particles 
class Enemy extends Particles {

  float size;
  float t = random(0, 100);


  Enemy(float tempX, float tempY) {

    x = tempX;
    y = tempY;
    dx = 0;
    dy = 1;
    hp = 10;
    size = 50;
  }

  void show() {
    fill(40, 200, 30);
    rect(x, y, size, size);
  }

  void act() {

    x = width*noise(t);
    t += 0.08;
    y += dy;


    if (collision (x, y, 50, 50, ship.x, ship.y, ship.size, ship.size)) {
      background(150);
    }
  }


  boolean isDead() {

    return y > height || hp <= 0;
  }
}