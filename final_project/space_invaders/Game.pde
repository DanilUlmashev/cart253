class Game {

  int pixelsize = 5;
  int gridsize  = pixelsize * 7 + 5;
  int score = 0;
  int direction = 1;
  int level = 1;

  Player player;

  ArrayList<Star> stars = new ArrayList<Star>(500);
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<Ball> balls = new ArrayList();
  boolean incy = false;

  Game() {
    reset();
  }
  
  void reset() {
    stars.clear();
    player = new Player(pixelsize);
    for (int i = 0; i < 130; i++) {
      stars.add(0, new Star());
    }
    resetEnemies();
  }

  void resetEnemies() {
    enemies.clear();
    for (int i = 0; i < width/gridsize/2; i++) {
      for (int j = 0; j <= 5; j++) {
        enemies.add(new Enemy(i * gridsize, j * gridsize, pixelsize, level));
      }
    }
  }

  void draw() {
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.draw();
    }

    //if (player.alive) {
    player.draw();
    //}

    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      bullet.draw();
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      if (enemy.outside() == true) {
        direction = -direction;
        incy = true;
        break;
      }
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      if (!enemy.collision() && enemy.collisionWithBall()) {
        if (enemy.lives > 0) {
          enemy.lives--;
          enemy.flashColor(30);
          if (enemy.lives > 0) {
            expSound.play();
          }
          else {
            expSound2.play();
          }
        }
        if (enemy.lives == 0) {
          enemies.remove(i);
          score += (10 * level);
          for (int j=0; j < random(8); j++) {
            balls.add(new Ball(enemy.x, enemy.y));
          }
        }
      } else {
        enemy.draw();
      }
    }
    incy = false;

    if (enemies.size() == 0) {
      level++;
      player.lives++;
      resetEnemies();
    }

    for (int i = 0; i < balls.size(); i++) {
      Ball ball = balls.get(i);
      ball.draw();
      if (ball.outside()) {
        balls.remove(i);
      }
    }

    drawLives(player.lives);
    
    if (player.lives == 0) {
      gameState = "LOSE";
    }
  }

  void drawLives(int n) {
    fill(255);
    textSize(18);
    textAlign(LEFT, BOTTOM);
    text("Lives: " + n, 10, height - 2);
    textAlign(RIGHT, BOTTOM);
    text("Score: " + score, width - 10, height - 2);
  }
}