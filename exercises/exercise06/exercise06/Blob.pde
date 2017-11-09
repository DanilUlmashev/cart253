class Blob {

  float minX;
  float minY;
  float maxX;
  float maxY;
  
  Blob(float x, float y) {
    minX = x;
    minY = y;
    maxX = x;
    maxY = y;
  }
  
  void add(float x, float y) {
    minX = min(minX, x);
    minY = min(minY, y);
    maxX = max(maxX, x);
    maxY = max(maxY, y);
  }
  
  void show() {
    stroke(0);
    fill(0, 0, 255, 100);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(minX, minY, maxX, maxY);
  }
  
  boolean isNear(float x, float y) {
    //if (px >= minX && px <= maxX && py >= minY && py <= maxY) {
    //  return true;
    //}
    float cx = max(min(x, maxX), minX);
    float cy = max(min(y, maxY), minY);
    float d = dist(cx, cy, x, y);
    if (d < 100) {
      return true;
    }
    return false;
  }
  
  boolean contains(float x, float y) {
    return x >= minX && x <= maxX && y >= minY && y <= maxY;
  }
  
  float getArea() {
    return (maxX - minX) * (maxY - minY);
  }
  
}