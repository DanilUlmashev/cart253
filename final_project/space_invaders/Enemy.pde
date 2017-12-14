class Enemy extends SpaceShip {

  Enemy(int xpos, int ypos, int tempPixelsize, int tempLives) {
    pixelsize = tempPixelsize;
    x = xpos;
    y = ypos;
    sprite = new String[5];
    sprite[0] = "1011101";
    sprite[1] = "0101010";
    sprite[2] = "1111111";
    sprite[3] = "0101010";
    sprite[4] = "1000001";
    lives = tempLives;
  }

  void updateObj() {

    if (frameCount%20 == 0) {
      x += game.direction * game.gridsize;
    }

    if (game.incy == true) {
      y += game.gridsize / 2;
    }

    int limit = 3000;
    float r = random(0, limit);
    if (r > limit-1) {
      game.bullets.add(new Bullet(x, y, pixelsize, true));
    }
  }

  boolean collisionWithBall() {
    for (int i = 0; i < game.balls.size(); i++) {
      Ball ball = game.balls.get(i);
      if (ball.x > x && ball.x < x + 7 * pixelsize + 5 && ball.y > y && ball.y < y + 5 * pixelsize) {
        game.balls.remove(i);
        return false;
      }
    }
    return true;
  }

  boolean collision() {
    for (int i = 0; i < game.bullets.size(); i++) {
      Bullet bullet = game.bullets.get(i);
      if (!bullet.fromEnemy && bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        game.bullets.remove(i);
        return false;
      }
    }

    return true;
  }

  boolean outside() {
    if (x + (game.direction * game.gridsize) < 0 || x + (game.direction * game.gridsize) > width - game.gridsize) {
      return true;
    } else {
      return false;
    }
  }
}