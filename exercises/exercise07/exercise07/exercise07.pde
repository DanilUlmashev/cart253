Ball ball;



void setup() {
  size(640, 480);
  background(0);
  
  ball = new Ball(width/2, height/2, 20);


}


void draw() {
  background(0);
  
  ball.update();
  
  ball.display();


}