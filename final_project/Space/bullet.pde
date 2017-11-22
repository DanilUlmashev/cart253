class Bullet {
  
    float size, vx, vy, speed;
    
    PVector loc;
    PVector velB;
    
    boolean active;
  
  
  Bullet(PVector tempLoc){
    
    loc = tempLoc;
    size = 10;
    
    active = true;

  
  }
  
  
  void update() {
    
    
    loc.y -= 10;
  }
  
  
  
  void display() {
    
    if (active) {
    rectMode(CENTER);
    fill(200, 0, 0);
    rect(loc.x, loc.y, size, size);
    }
  
  
  }

  boolean isFinished() {
    return loc.y < 0;
  }


}