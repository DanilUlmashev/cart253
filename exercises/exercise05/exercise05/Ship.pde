// Class Ship, represents the players main character of the game.

// Class Ship also extends all functions and parameters from abstract class Particles 
class Ship extends Particles {


  float speed = 5;
  float size;

  Ship() {
    x = width/2;
    y = height/2;
    dx = speed;
    dy = speed;
    size = 50;
  }

  void show() {
    fill(#AC18B4);
    stroke(255);
    rectMode(CENTER);
    ellipse(x, y, size, size);
  }

  void act() {
    if (wKey) {
      dy = -speed;
    }
    if (sKey) {
      dy = speed;
    }
    if (!wKey && !sKey) {
      dy = 0;
    }
    if (aKey) {
      dx = -speed;
    }
    if (dKey) {
      dx = speed;
    }
    if (!aKey && !dKey) {
      dx = 0;
    }
    x += dx;
    y += dy;
    // Instantiating the bullets when spaceKey is true. 
    if (spaceKey) {
      engine.add(new Bullet());
    }
  }
}