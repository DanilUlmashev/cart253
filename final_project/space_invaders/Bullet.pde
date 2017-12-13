class Bullet {
    int x, y;
    boolean fromEnemy = false;

    Bullet(int xpos, int ypos, boolean fromEnemyTmp) {
        x = xpos + gridsize/2 - 4;
        y = ypos;
        fromEnemy = fromEnemyTmp;
    }

    void draw() {
        fill(255);
        rect(x, y, pixelsize, pixelsize);
        if (!fromEnemy) {
          y -= pixelsize;
        }
        else {
          y += pixelsize;
        }
    }
}