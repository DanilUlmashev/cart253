// Class that defines an array of blobs and updates them form a given video object.
// Color distance algorythm borrowed from the Coding Train channel on YouTube (https://www.youtube.com/watch?v=ce-2l2wRqO8)

class Blobs {

  // The capture object for reading from the webcam
  Capture video;

  // The color to find blobs with
  color trackColor;

  // The array of blobs
  ArrayList<Blob> blobs;

  // Constructor
  Blobs(Capture videoTmp, color trackColorTmp) {
    video = videoTmp;
    trackColor = trackColorTmp;
    blobs = new ArrayList<Blob>();
  }

  // Handling blob detection on each video frame
  void update() {

    // Reseting the array every frame as each frame will have its own set of blobs
    blobs.clear();

    // Go through every pixel in the grid of pixels made by this
    // frame of video
    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {

        // Calculate the location in the 1D pixels array
        int loc = x + y * width;
        color pixelColor = video.pixels[loc];

        // Calculating the values of every basic color (r, g, b) individually,
        // for the given pixel color and the color we are searching for.
        float r1 = red(pixelColor);
        float g1 = green(pixelColor);
        float b1 = blue(pixelColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);

        // Calculating the distance between the colors to how close the given color is
        // to the color we are searching for
        float d = dist(r1, g1, b1, r2, g2, b2);

        // Comparing the distance to an arbitrary number found by trial and error 
        if (d < 120) {

          // Iterating through blobs to find if a given pixel may belong to one of them
          boolean found = false;
          for (Blob b : blobs) {

            // if pixel is close enoigh add it to the blob
            if (b.isNear(x, y)) {
              b.add(x, y);
              found = true;
              break;
            }
          }

          // If no blobs are found creating a new one and adding it to the blobs array
          if (!found) {
            Blob b = new Blob(x, y);
            blobs.add(b);
          }
        }
      }
    }
  }

  // Displaying the major blobs on the screen
  // The blob has to be at least 500 square pixel in order to be displayed
  void display() {
    for (Blob b : blobs) {
      if (b.getArea() > 500) {
        b.show();
      }
    }
  }
}