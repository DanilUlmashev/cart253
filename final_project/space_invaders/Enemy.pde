class Enemy extends SpaceShip {
  


  Enemy(int xpos, int ypos) {

    x = xpos;
    y = ypos;
    sprite    = new String[5];
    sprite[0] = "1011101";
    sprite[1] = "0101010";
    sprite[2] = "1111111";
    sprite[3] = "0101010";
    sprite[4] = "1000001";
    
    lives = 2;
    

  }

  void updateObj() {
 
    if (frameCount%30 == 0) x += direction * gridsize;
    if (incy == true) y += gridsize / 2;
    
      int limit = 3000;
      float r = random(0, limit);
      if (r > limit-1) {
        bullets.add(new Bullet(x, y, true));
      }
      


  }
  
  boolean collisionWithBall() {

      for (int i = 0; i < balls.size(); i++) {
       Ball ball = balls.get(i);
      if (ball.x > x && ball.x < x + 7 * pixelsize + 5 && ball.y > y && ball.y < y + 5 * pixelsize) {
        balls.remove(i);
        return false;
      }
      }
      return true;
  }
  boolean collision() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      if (!bullet.fromEnemy && bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        bullets.remove(i);
        return false;
      }

    }

    return true;
  }

  boolean outside() {
    if (x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize) {
      return true;
    } else {
      return false;
    }
  }
}