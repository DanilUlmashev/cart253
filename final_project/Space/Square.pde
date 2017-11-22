class Square {

  //Circle circle;


  float size, speed;

  PVector loc;
  PVector vel;
  PVector acc;


  ArrayList<Bullet> pulki = new ArrayList<Bullet>();

  ArrayList<Circle> vragi;


  Square(ArrayList<Circle> tempVragi) {
    vragi = tempVragi;
    //circle =  tempCirlce;
    loc = new PVector(width/2, height - 32/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    size = 30;
    speed = 5;
  }

  void update() {
    if (mousePressed) {
      PVector mouse = new PVector(mouseX, mouseY);
      mouse.sub(loc);
      mouse.setMag(0.5);

      acc = mouse;

      //acc = PVector.random2D();
      vel.add(acc);
      loc.add(vel);
      vel.limit(5);
    }


    if (spaceKey && pulki.size() < 1) {
      pulki.add(new Bullet(new PVector(loc.x, loc.y)));
    }


    ArrayList<Bullet> bulletsToRemove = new ArrayList<Bullet>();
    if (pulki.size() > 0) {

      for (Bullet bullet : pulki) {
        bullet.update();
        if (bullet.isFinished()) {
          bulletsToRemove.add(bullet);
          
        }

        //float bulletdist = dist(circle.loc.x, circle.loc.y, bullet.loc.x, bullet.loc.y);
        //if (bulletdist < circle.size) {
        //  circle.active = false;
        //}

        for (Circle c : vragi) {
          float bulletdist = dist(c.loc.x, c.loc.y, bullet.loc.x, bullet.loc.y);
          if (bulletdist < c.size) {
            c.active = false;
          }
        }
        
        
        
        
        
      }

      pulki.removeAll(bulletsToRemove);

      loc.x = constrain(loc.x, 0 + size/2, width - size/2);
      loc.y = constrain(loc.y, 700 + size/2, height - size/2);
    }
  }



  void display() {

    rectMode(CENTER);
    stroke(255, 0, 0);
    strokeWeight(2);
    fill(200);
    rect(loc.x, loc.y, size, size);

    for (Bullet b : pulki) {
      b.display();
    }
  }
}