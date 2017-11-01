// Class Bullet, represents the small bullets shooting out of the ship when space key is pressed.

// Class Bullet also extends all functions and parameters from abstract class Particles 
class Bullet extends Particles {


  float size;

  Bullet() {

    x = ship.x;
    y = ship.y - 20;
    size = ship.size/10;
    dx = 0;
    dy = -5;
    hp = 1;
  }

  void show() {
    fill (255, 0, 0);
    rect (x, y, size, size);
  }

  void act() {
    x = x + dx;
    y = y + dy;
  }

  boolean isDead() {
    return y < 0 || hp <= 0;
  }
}