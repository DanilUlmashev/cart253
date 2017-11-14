


class Ball {
  
  int x, y, vx, vy, size, speed;
  
  
  Ball(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    speed = 5;
    vx = speed;
    vy = speed;
    
    
  
  }
  
  void update() {
    x += vx;
    y += vy;
    
    if (x + size/2 > width || x - size/2 < 0) {
      vx = -vx;
    }
    if (y + size/2 > height || y - size/2 < 0) {
      vy = -vy;
    
    }
    
    
  
  }
  
  void display() {
    fill(200);
    noStroke();
    rectMode(CENTER);
    rect(x, y, size, size, 10);
  
  } 





}