class Bullet {
  int x, y;
  boolean fromEnemy = false;
  int size;

  Bullet(int xpos, int ypos, int tempSize, boolean fromEnemyTmp) {
    x = xpos;
    y = ypos;
    size = tempSize;
    fromEnemy = fromEnemyTmp;
  }

  void draw() {
    fill(255);
    rect(x, y, size, size);
    if (!fromEnemy) {
      y -= size;
    } else {
      y += size;
    }
  }
}