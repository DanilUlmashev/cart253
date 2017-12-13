Player player;
GameMenue gameMenue;

int pixelsize = 5;
int gridsize  = pixelsize * 7 + 5;
int score = 0;
int direction = 1;

ArrayList<Star> star = new ArrayList<Star>(500);
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();
ArrayList<Ball> balls = new ArrayList();
boolean incy = false;

String gameState;


void setup() {
  background(0);
  noStroke();
  fill(255);
  size(600, 800, FX2D);
  
  gameState = "START";

  player = new Player();
  gameMenue = new GameMenue();

  for (int i = 0; i < 130; i++) {
    star.add(0, new Star());
  }

  for (int i = 0; i < width/gridsize/2; i++) {
    for (int j = 0; j <=5; j++) {
      enemies.add(new Enemy(i*gridsize, j*gridsize));
    }
  }
}

void draw() { 
  background(0);
  if (gameState == "START") {
    gameMenue.startGame();
  }
  else if (gameState == "LOSE") {
    gameMenue.loseGame();
  }
  else if (gameState == "CHOOSE") {
    gameMenue.choosePlayer();
  }
  else if (gameState == "BEGIN") {
    gameMenue.beginGame();
  }
  else if (gameState == "PLAY") {
    drawLives(player.lives);
    for (int i = 0; i < star.size(); i++) {
      Star stars = star.get(i);
      stars.draw();
    }

    if (player.alive) {
      player.draw();
    }

    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      bullet.draw();
    }

    for (int i = 0; i < balls.size(); i++) {
      Ball ball = balls.get(i);
      ball.draw();
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
        }
        if (enemy.lives == 0) {
          enemies.remove(i);
          score++;
          for (int j=0; j < random(8); j++) {
            balls.add(new Ball(enemy.x, enemy.y));
          }
        }
      } else {
        enemy.draw();
      }
    }
    incy = false;
  }
  
  if (player.lives == 0) {
    gameState = "LOSE";
  }
}

void drawLives(int n) {
  textSize(22);
  text("Lives: " + n, 20, height - 6);
  text("Score: " + score, width - 100, height - 6);
}