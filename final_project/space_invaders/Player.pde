import processing.sound.*;

class Player extends SpaceShip {

  SoundFile laser;

  boolean canShoot = true;
  int shootdelay = 0;
  boolean changeColor = false;

  Player(int tempPixelsize) {
    pixelsize = tempPixelsize;
    x = width/2;
    y = height - (10 * pixelsize);
    setTypeOne();
    lives = 3;
  }
  
  void setTypeOne() {
    sprite    = new String[5];
    sprite[0] = "0010100";
    sprite[1] = "0110110";
    sprite[2] = "1111111";
    sprite[3] = "1111111";
    sprite[4] = "0111110";
  }
  
  void setTypeTwo() {
    sprite    = new String[5];
    sprite[0] = "1001001";
    sprite[1] = "0110110";
    sprite[2] = "0011100";
    sprite[3] = "1110111";
    sprite[4] = "0110110";
  }

  void updateObj() {
    if (keyPressed && keyCode == LEFT) {
      x = constrain(x - 5, 0, width);
    }

    if (keyPressed && keyCode == RIGHT) {
      x = constrain(x + 5, 0, width - 7 * pixelsize);
    }
    if (keyPressed && keyCode == SHIFT && canShoot) {
      //laser = new SoundFile(this, "laser0.wav");
      //laser.play();
      game.bullets.add(new Bullet(x, y, pixelsize, false));
      laserSound.play();
      canShoot = false;
      shootdelay = 0;
    }

    shootdelay++;
    if (shootdelay >= 10) {
      canShoot = true;
    }

    if (collisionWithEnemy() || collisionWithBullet()) {
      if (lives > 0) {
        lives--;
        flashColor(30);
        if (lives > 0) {
          expSound.play();
        }
        else {
          expSound2.play();
        }
      }
      if (lives == 0) {
        for (int j=0; j < random(8); j++) {
          game.balls.add(new Ball(x, y));
        }
      }
    }
  }

  boolean collisionWithBullet() {
    for (int i = 0; i < game.bullets.size(); i++) {
      Bullet bullet = game.bullets.get(i);
      if (bullet.fromEnemy && bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        game.bullets.remove(i);
        return true;
      }
    }

    return false;
  }

  boolean collisionWithEnemy() {
    for (Enemy enemy : game.enemies) {
      float dist = dist(x, y, enemy.x, enemy.y);
      if (dist < 5 * pixelsize) {
        return true;
      }
    }      
    return false;
  }
}