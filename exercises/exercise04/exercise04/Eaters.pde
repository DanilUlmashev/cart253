// Eaters class
//Represents an array of eater objects.
// This class also calculates the distance between other objects (griddies and sparkles) and if conditions are met eatters eat them.

class Eaters {

  Eater[] eaters = new Eater[3];


  Eaters() {
    for (int i = 0; i < eaters.length; i++) {
      eaters[i] = new Eater(random(width), random(height), 40);
    }
  }


  void moveEaters() {
    for (int i = 0; i < eaters.length; i++) {
      eaters[i].move();
    }
  }


  void displayEaters() {
    for (int i = 0; i < eaters.length; i++) {
      eaters[i].display();
    }
  }

  void handleGriddies(Griddies grs) {
    for (int i = 0; i < eaters.length; i++) {
      Eater eater = eaters[i];
      for (int  j = 0; j < grs.griddies.length; j++) {
        float dist = dist(eater.x, eater.y, grs.griddies[j].x, grs.griddies[j].y);

        if (dist < eater.size + grs.griddies[j].size) {
          grs.griddies[j].active = false;
        }
      }
    }
  }

  void handleSparkles(Sparkles sps) {
    for (int i = 0; i < eaters.length; i++) {
      Eater eater = eaters[i];
      for (int j = 0; j < sps.sparkles.length; j++) {
        float dist = dist(eater.x, eater.y, sps.sparkles[j].x, sps.sparkles[j].y);
        if (dist < eater.size + sps.sparkles[j].size) {
          sps.sparkles[j].active = false;
        }
      }
    }
  }
}