class Ball {

  // Variables for position and velocity
  float x;
  float y;
  float vx;
  float vy;
  float size, value;

  Ball(int xpos, int ypos) {
    x = xpos + gridsize/2 - 4;
    y = ypos;
    
    size =  random(-7, 7);
    value=  random(0, 5);

    float theta = random(TWO_PI);
    float speed = random(-6, 6);

    vx = (cos(theta)*speed) + size;
    vy = (sin(theta)*-speed) + value;
  }
  
  void draw() {
    noStroke();
    fill(255);
    rect(x, y, size, size);
    update();
  }



  void update() {
    x += vx;
    y += vy;
  }

  //boolean collisionWithBall() {
  //  for (int i = 0; i < balls.size(); i++) {
  //    Enemy enemy = enemies.get(i);
  //    // if (enemy.collisionWithBall(ball))
  //    if (x > enemy.x && x < enemy.x + 7 * pixelsize + 5 && y > enemy.y && y < enemy.y + 5 * pixelsize) {
  //      balls.remove(i);
  //      return false;
  //    }
  //  }
  //  return true;
  //}
}