import processing.sound.*;

SoundFile pitch;


Ball[] ball = new Ball[3];

PImage pic;
PImage horse;

boolean active;

void setup() {
  size(640, 480);
  background(0);
  
  pitch = new SoundFile(this, "C.aif");


  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(random(width - 5), random(height - 5), random(10, 30), random(2, 10));
  }
}


void draw() {
  float newRate = map(mouseX,0,width,0.01,10);
  pitch.rate(newRate);

  if (mousePressed) {
    background(0);
    for (int i = 0; i < ball.length; i++) {
      ball[i].update();
      ball[i].display();
    }
  } 
  else {}
}

void mousePressed() {
  active = true;
} 

void mouseClicked() {
  pitch.play();

} 