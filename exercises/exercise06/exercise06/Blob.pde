// Class that defines a cluster of a particular color on the screen
// Idea was borrowed from the Coding Train channel on YouTube (https://www.youtube.com/watch?v=ce-2l2wRqO8)

class Blob {

  // Defining bounds of the cluster (blob) 
  float minX;
  float minY;
  float maxX;
  float maxY;

  // Constructor
  Blob(float x, float y) {
    minX = x;
    minY = y;
    maxX = x;
    maxY = y;
  }
  
  // Extending the bounds of the cluster blob
  void add(float x, float y) {
    minX = min(minX, x);
    minY = min(minY, y);
    maxX = max(maxX, x);
    maxY = max(maxY, y);
  }
  
  // Display the bounds of the cluster
  void show() {
    stroke(0);
    fill(0, 0, 255, 100);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(minX, minY, maxX, maxY);
  }
  
  // Checking if a particular point (x,y) is near the blob
  boolean isNear(float x, float y) {
    float cx = max(min(x, maxX), minX);
    float cy = max(min(y, maxY), minY);
    float distance = dist(cx, cy, x, y);
    // Comparing the distance to the arbitrary number 100 discovered by trial and error 
    if (distance < 100) {
      return true;
    }
    return false;
  }
  
  // Checks is the blob contains a particulr point x, y
  boolean contains(float x, float y) {
    return x >= minX && x <= maxX && y >= minY && y <= maxY;
  }
  
  // Calculates the area of the blob in pixels squared
  float getArea() {
    return (maxX - minX) * (maxY - minY);
  }
  
}