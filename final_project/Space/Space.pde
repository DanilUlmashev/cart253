Square square;

//Circle circle;

ArrayList<Circle> circles;

boolean aKey, wKey, dKey, sKey, spaceKey = false;




void setup() {
  size(800, 1000);
  background(0);
  
  circles = new ArrayList<Circle>();
  
  for (int i = 0; i < 5; i++) {
    circles.add(new Circle());
  }
  
  //circle = new Circle();
  square = new Square(circles); 
}




void draw() {
  background(0);

  square.update();
  //circle.update();
  for (Circle c : circles) {
    c.update();
  }
  
  square.display();
  //circle.display();
  for (Circle c : circles) {
    c.display();
  }
  
  
}


void keyPressed() {

  //if  (keyCode == 87) wKey = true;
  //if  (keyCode == 65) aKey = true;
  //if  (keyCode == 83) sKey = true;
  //if  (keyCode == 68) dKey = true;
  if  (keyCode == 32) spaceKey = true;
}




void keyReleased() {
  //if  (keyCode == 87) wKey = false;
  //if  (keyCode == 65) aKey = false;
  //if  (keyCode == 83) sKey = false;
  //if  (keyCode == 68) dKey = false;
  if  (keyCode == 32) spaceKey = false;
}

void mousePressed() {  
  for (int i = 0; i < 5; i++) {
    circles.add(new Circle());
  }
}



 