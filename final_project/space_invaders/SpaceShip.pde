class SpaceShip {
  int x, y;
  String sprite[];
  color c = color(255);
  int cTime = 0;
  int lives;
  int pixelsize;

  void draw() {
    updateObj();
    drawSprite();
  }

  void drawSprite() {
    if (cTime > 0) {
      cTime--;
      if (cTime % 2 == 0) {
        c = color(255);
      } else {
        c = color(255, 0, 0);
      }
      if (cTime == 0) {
        c = color(255);
      }
    }
    fill(c);
    for (int i = 0; i < sprite.length; i++) {
      String row = (String) sprite[i];
      for (int j = 0; j < row.length(); j++) {
        if (row.charAt(j) == '1') {
          rect(x + (j * pixelsize), y + (i * pixelsize), pixelsize, pixelsize);
        }
      }
    }
  }

  void updateObj() {
  }

  void flashColor(int time) {
    c = color(255, 0, 0);
    cTime = time;
  }
}