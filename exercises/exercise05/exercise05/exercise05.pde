// Bullet Hell (work in progress)
// by Danil Ulmashev
//
// A simple imitation of a classic arcade game Bullet Hell where a player operates a spaceship
// and fightinh incoming enemies by shooting them. The game so far has the most basic design 
// and few operational controles such as forward "w", backward "s", left "a", and right "d" keys
// and a space key to shoot bullets. It is still in "work in progress" mode and evetually will be complete.


// Array list stores objects objects of the game with option to add and remove and resize dynamicaly. 
ArrayList<Particles> engine;
boolean wKey, aKey, sKey, dKey, spaceKey = false;

Ship ship;


void setup() {

  //Initializing the game in 2D mode.
  size(640, 600, FX2D);

  // Instantiating the list with the capacity of 1000 and objects ship, star and dropper.
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

  // Drawing all the objects through the abstract class Particles and checking through each one
  // of them in the list.
  for (int i = 0; i < engine.size(); i++) {
    Particles particles = engine.get(i);
    particles.act();
    particles.show();
  }
}


// Initializing key commands.
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