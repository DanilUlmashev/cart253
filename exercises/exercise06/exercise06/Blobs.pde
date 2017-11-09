

class Blobs {
  
  Capture video;
  color trackColor;
  ArrayList<Blob> blobs;

  Blobs(Capture videoTmp, color trackColorTmp) {
    video = videoTmp;
    trackColor = trackColorTmp;
    blobs = new ArrayList<Blob>();
  }
  
  void update() {
    blobs.clear();
    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        
        // Calculate the location in the 1D pixels array
        int loc = x + y * width;
        color pixelColor = video.pixels[loc];
        
        float r1 = red(pixelColor);
        float g1 = green(pixelColor);
        float b1 = blue(pixelColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);
        
        float d = dist(r1, g1, b1, r2, g2, b2);
        if (d < 120) {
          boolean found = false;
          for (Blob b : blobs) {
            if (b.isNear(x, y)) {
              b.add(x, y);
              found = true;
              break;
            }
          }
          if (!found) {
            Blob b = new Blob(x, y);
            blobs.add(b);
          }
        }
      }
    }
  }
  
  void display() {
    for (Blob b : blobs) {
      if (b.getArea() > 500) {
        b.show();
      }
    }
  }
  
}