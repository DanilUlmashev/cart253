enum ParticleType {
 SHIP,
 ENEMY,
 DROPPER,
 BULLET
}

abstract class Particles {
  
float x, y, dx, dy, hp;
ParticleType type;
  
  //boolean shouldDouble() {
  //  return false;
  //}
  
  void show() {}
  
  void act() {}
  
boolean isDead() {
  return false;

}
  
}