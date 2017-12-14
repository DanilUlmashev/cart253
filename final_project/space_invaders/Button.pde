class Button {

  int x, y, sizex, sizey;
  String text;

  Button(int tempX, int tempY, String tempText) {
    x = tempX;
    y = tempY;
    sizex = 200;
    sizey = 50;
    text = tempText;
  }

  void draw() {
    rectMode(CENTER);
    fill(200, 50);
    stroke(100);
    rect(x, y, sizex, sizey, 20);
    textAlign(CENTER, CENTER);
    textSize(28);
    fill(255);
    text(text, x, y - 4);
  }

  boolean buttonPressed() {
    if (mousePressed && mouseX < x+sizex/2 && mouseX > x - sizex/2 && mouseY < y+sizey/2 && mouseY > y - sizey/2) {
      buttonSound.play();
      return true;
    }
    return false;
  }
}