class Shape {
  PShape s;
  int tag; 
  PGraphics pg;
  PImage returnedImage;
  PImage returnedImage2; 
  PImage maskedImage;
  PImage maskedImage2;
  int pointX;
  int pointY;

  void shapeSet() {
    s = createShape();
    s.beginShape();
    s.noStroke();
    //println("shape set!");
  }

  void firstPoint (int x, int y) {
    pointX = x;
    pointY = y;
    println("firstPoint - x: " + x + ", y: " + y);
  }

  void shapeVertex(int x, int y) {
    s.vertex(x, y);
    //println("shape vertex!");
  }

  void display() {
    s.fill(0, 0, 255);
    s.endShape(CLOSE);
    shape(s);
    //println("shape created!");
  }

  void storeTag(int x) {
    tag = x;
  }

  void pGraphic() {

    //maskedImage = loadImage("poms.jpg");
    maskedImage = loadImage("first.png");
    maskedImage2 = loadImage("second.png");
    iw = maskedImage.width;
    ih = maskedImage.height;
    pg = createGraphics(iw, ih);
    //----------pgraphic-----------------
    pg.beginDraw();
    // Erase graphics with black background
    pg.background(0);
    // Draw in white
    pg.fill(255);
    pg.noStroke();
    // An ellipse to see a good part of the image
    pg.shape(s);
    pg.endDraw();


    //---------------------mask----------------
    // Copy the original image (kept as reference)
    returnedImage = maskedImage.get();
    returnedImage2 = maskedImage2.get();
    // Apply the mask
    returnedImage.mask(pg);
    returnedImage2.mask(pg);
    // Display the result
  }

  void returnMaskOne() {
    image(returnedImage, 0, 0);
    println("masked with one!");
  }
  
  void returnMaskTwo() {
    image(returnedImage2, 0, 0);
    println("masked with two!");
  }

  void moveMask() {
    image(returnedImage, mouseX - pointX, mouseY - pointY);
  }
  
  void moveMaskTwo() {
    image(returnedImage2, mouseX - pointX, mouseY - pointY);
  }
}

