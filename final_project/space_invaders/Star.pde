class Star  {
  

  float x, y, dx, dy;
  boolean d = false;

  Star() {
    reset();
  }


void draw(){
show();
update();

}
  void show() {
    strokeWeight(2);
    stroke(200, random(20, 200));
    //fill(200, 0, 0, random(20, 200));
    rectMode(CENTER);
    rect(x, y, dx, dy);
  }

  void update() {
    x += dx;
    y += dy;
    if (y > height || y < 0 || x > width || x < 0) {
      reset();
      d = true;
    }
  }
  
  void reset() {
    x = random(0, width);
    y = random(0, height);
    dx = random(0);
    dy = random(1, 5);
  }
  
  boolean shouldDouble() {
    if (d) {
      d = false;
      return true;
    }
    return false;
  }
  

}