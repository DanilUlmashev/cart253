// Exercise 06
//
// Using the webcam as input to play with Bouncers.

// Import the video library
import processing.video.*;

// The capture object for reading from the webcam
Capture video;

// An array of bouncers to play with
Bouncer[] bouncers = new Bouncer[10];

// Blobs to track clusters of a particular color
Blobs blobs;

// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);

  // Our old friend the for-loop used to go through the length of an
  // array adding new objects to it (Bouncers in this case)
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0,width),random(0,height),random(-10,10),random(-10,10),random(20,50),color(random(255)));
  }
  
  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();
  blobs = new Blobs(video, color(0, 0, 255));
}

// draw()
//
// Processes the frame of video, draws the video to the screen, updates the Bouncers
// and then just draws an ellipse at the brightest pixel location. You code should
// do something much more interesting in order to actually interact with the Bouncers.

void draw() {
  // A function that processes the current frame of video
  //handleVideoInput();
  
  if (!video.available()) {
    // If not, then just return, nothing to do
    return;
  }
  
  video.read();

  // Draw the video frame to the screen
  image(video, 0, 0);
  
  blobs.update();
  blobs.display();
  
  // Our old friend the for-loop running through the length of an array to
  // update and display objects, in this case Bouncers.
  // If the brightness (or other video property) is going to interact with all the
  // Bouncers, it will need to happen in here.
  for (int i = 0; i < bouncers.length; i++) {
   bouncers[i].update();
   bouncers[i].display();
  }
}