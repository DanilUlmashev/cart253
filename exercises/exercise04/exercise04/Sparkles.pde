// Sparkles class
//Represents an array of sparkle objects.

class Sparkles {

  Sparkle[] sparkles = new Sparkle[50];

  Sparkles() {
    for (int i = 0; i < sparkles.length; i++) {
      sparkles[i] = new Sparkle(random(width), (random(height)), 18);
    }
  }

  void moveSparkles() {
    for (int i = 0; i < sparkles.length; i++) {
      sparkles[i].move();
    }
  }

  void displaySparkles() {
    for (int i = 0; i < sparkles.length; i++) {
      sparkles[i].display();
    }
  }
}