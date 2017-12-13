class Button {

  int x, y, sizex, sizey;

  Button(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    sizex = 200;
    sizey = 50;
  }

  void draw() {
    rectMode(CENTER);
    fill(200, 50);
    rect(x, y, sizex, sizey);
  }

  boolean buttonPressed() {
    if (mousePressed && mouseX < x+sizex/2 && mouseX > x - sizex/2 && mouseY < y+sizey/2 && mouseY > y - sizey/2) {
      return true;
    }
    return false;
  }
}