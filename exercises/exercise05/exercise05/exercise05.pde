ArrayList<Particles> engine;
boolean wKey, aKey, sKey, dKey, spaceKey = false;

Ship ship;
Bullet bullet;
Enemy enemy;

void setup() {
  size(640, 600, FX2D);
  engine = new ArrayList<Particles>(1000);
  ship = new Ship();
  engine.add(ship);
  engine.add(new Dropper());



  for (int i = 0; i < 130; i++) {
    engine.add(0, new Star());
  }
}

void draw() {
  background(0);
  for (int i = 0; i < engine.size(); i++) {
    Particles particles = engine.get(i);
    particles.act();
    particles.show();
  }
}

void keyPressed() {
  if  (keyCode == 87) wKey = true;
  if  (keyCode == 65) aKey = true;
  if  (keyCode == 83) sKey = true;
  if  (keyCode == 68) dKey = true;
  if  (keyCode == 32) spaceKey = true;
}

void keyReleased() {
  if  (keyCode == 87) wKey = false;
  if  (keyCode == 65) aKey = false;
  if  (keyCode == 83) sKey = false;
  if  (keyCode == 68) dKey = false;
  if  (keyCode == 32) spaceKey = false;
}