// Griddies
// by Pippin Barr
// MODIFIED BY: Danil Ulmashev 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.
// Other artaficial life forms were added to this system which interact with eachother. 
// Sparkles and griddies have a loving relationship and change colors when meet eachother.
// Eaters are the type of creaters that eat others.



Griddies griddies;
Sparkles sparkles;
Eaters eaters;



// setup()
//
// Set up the window, griddies, sparkles and eaters

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  sparkles = new Sparkles();
  griddies = new Griddies();

  eaters = new Eaters();
}


// draw()
//
// Update all the griddies, check for collisions between them, display them.
// Also displays and moves sparkles and checks collision conditions.

void draw() {
  background(50);

  sparkles.moveSparkles();
  griddies.updateGriddies();

  griddies.handle(sparkles);

  sparkles.displaySparkles();
  griddies.display();

  eaters.moveEaters();
  eaters.handleGriddies(griddies);
  eaters.handleSparkles(sparkles);
  eaters.displayEaters();
}