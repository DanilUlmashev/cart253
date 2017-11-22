class Circle {

  Square square;
  Bullet bullet;



  PVector loc;
  PVector vel;
  PVector acc;

  float size;

  boolean active;




  Circle() {
    //square = tempSquare;


    loc = new PVector(width/2, height/2);
    vel = new PVector(random(-2, 2), 2);
    //acc = new PVector(0, 0);

    size = 40;

    active = true;
  }


  void update() {

    PVector center = new PVector(random(width), random(height));
    if (loc.y > height) {
      loc.y -= height;
    }
    center.sub(loc);
    center.setMag(0.5);

    acc = center;

    loc.add(vel);
    vel.add(acc);
    vel.limit(5);

    //float dist = dist(loc.x, loc.y, square.loc.x, square.loc.y);
    //if (dist < size) {
    //  active = false;
    //}

    //for (Bullet b: square.pulki) {
    //  float bulletdist = dist(loc.x, loc.y, b.loc.x, b.loc.y);
    //  if (bulletdist < size) {
    //    active = false;

    //  }

    //}

    //if (bullet.loc.y < loc.y) {

    //}
  }


  void display() {
    if (active) {
      stroke(0, 0, 170);
      fill(0, 170, 0);
      ellipse(loc.x, loc.y, size, size);
    }

    //if (mousePressed) active = false;
  }
}