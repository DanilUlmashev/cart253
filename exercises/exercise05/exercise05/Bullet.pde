class Bullet extends Particles {
  //float x, y, dx, dy, hp;
  
float size;
  
  Bullet() {
    
    x = ship.x;
    y = ship.y - 20;
    size = ship.size/10;
    dx = 0;
    dy = -5;
    hp = 1;
  
  }
  
  void show() {
    fill (255, 0, 0);
    rect (x, y, size, size);
  
  }
  
  void act() {
    x = x + dx;
    y = y + dy;
    

  
  }
  
  boolean isDead() {
    return y < 0 || hp <= 0;
  
  }


}