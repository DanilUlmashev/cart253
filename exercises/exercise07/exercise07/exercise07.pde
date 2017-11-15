import processing.sound.*;

//SoundFile[] pitch = new SoundFile[3];
Ball[] ball = new Ball[5];

boolean active;


void setup() {
  size(640, 480);
  background(0);
  //int randomPitch = int(radnom(0, pitch.length));
  
  //for (int i = 0; i < pitch.length; i++) {
  //  pitch[i] = new SoundFile(this, "p" + i + ".aif");
  //}

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(random(width - 5), random(height - 5), random(10, 30), random(2, 10));
    ball[i].pitch = new SoundFile(this, "p" + i + ".aif");
  }
}


void draw() {
  if (mousePressed) {
    background(0);
    for (int i = 0; i < ball.length; i++) {
      float newRate = map(mouseX, 0, width, 0.01, 10);
      ball[i].pitch.rate(newRate);
      ball[i].update();
      ball[i].display();
    }
  } 
  else {
  }
}

void mousePressed() {
  active = true;
} 

void mouseClicked() {

} 