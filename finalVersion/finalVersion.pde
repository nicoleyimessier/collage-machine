//collage generator by Nicole Yi Messier
//December 2014
//Nicole Yi Messier.com

//-----------directions to use------------
//------------Find and Format Images------------------
//1.Find three images: one for the background and two to collage with
//2.Save each image as a png and reformat so each Image is the same size
//2b. Save under the names "background", "first", and "second"
//3.Drag images into processing sketch 

//------------Creating Shapes-----------------
//1.. To create shapes, simply click the mouse (circles will appear for the points
//& lines will connect the points.
//2.. Press s when you want to create the shape and save it. 
//Note: you can save up to 6 shapes; each shape will be saved with the tag 1-6
//e.g. Your first shape will be saved with tag 1
//3. If you want to use a different shape, simply press the number for that shape and it
//will appear
//4. If you want to delete your stored shapes, press "d" 

//---------------Switching textures---------------
//1. To switch through different textures, press "f"

//---------------To draw different image as background---------------
//1. Press "a", "b", or "c"
//2. Press "p" for a colored background


PImage bImage; //background image of sketch
PImage imageOne; //load the collage first image
PImage imageTwo; //load the second collage image
int iw, ih; //size of images
boolean flip=true; //boolean used to flip between two collaging images 
ArrayList points; //create arraylist to store points
ArrayList shapes; //create arraylist to store points
int tag; 

int size = 2; // size of ellipse saw you can see where the points are being stored
int lineCounter=0; //lines outlining the shape that is being stored 

void setup() {
  size(400, 601, P2D); //we need to work in P2D mode to use shapes
  bImage = loadImage("background.png"); //upload background image
  imageOne = loadImage("first.png"); //upload first image
  imageTwo = loadImage("second.png"); //upload second image
  image(bImage, 0, 0); //set background image as background
  points = new ArrayList(); //initiate arraylist for points
  shapes = new ArrayList(); //initiate arraylist for points
}

void draw() {
}

void mousePressed() {
  //--------storing each point when the mouse is pressed-----------
  points.add(new Point()); //add a new point to the arraylist Points every time the mouse is pressed
  Point p = (Point) points.get(points.size()-1);
  p.storePoint();
  lineCounter++;

  //--------create lines between each point----------
  ellipse(p.x, p.y, size, size);
  if (points.size()>=2) {
    Point p1 = (Point) points.get(lineCounter-2);
    Point p2 = (Point) points.get(lineCounter-1);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

void keyPressed() {

  //--------creating the shape-----------
  //press s to create the shape 
  if (key == 's') { 
    tag++; //counter for the number of shapes
    shapes.add(new Shape()); //add new shape to arraylist
    Shape s = (Shape) shapes.get(tag-1); //add the shape at arraylist position (tag-1)
    s.shapeSet(); //function to set begin drawing shape
    for (int i=points.size()-1; i>=0; i--) {
      Point p = (Point) points.get(i); //cycle through each point in the points arraylist
      s.shapeVertex(p.x, p.y); //in the shape, add a vertex at each point 
      if (i==0) {
        s.firstPoint(p.x, p.y); //store the value of the first point to use when we draw the shape
      }
    }
    s.display(); //function that closes and draws the shape
    s.storeTag(tag); //store the tag number of the shape
    s.pGraphic(); //create a pgraphic o the shape

    if (flip==true) {
      s.returnMaskOne(); //return shape with image one
      println("mask 1 is happening");
    } 
    else if (flip==false) {
      s.returnMaskTwo();//return shape with image two
      println("mask 2 is happening");
    }

    for (int i=points.size()-1; i>=0; i--) {
      points.remove(i); //after the shape is created, delete the points in the points arraylist
    }

    lineCounter=0; //reset the linecounter to 0
  }

  if (key == 'f') {
    flip=!flip; //every time f is pressed, flip the boolean value
    println("flip: " + flip);
  }


  //--------calling stored shape-----------
  //you can store up to 6 shapes
  //the first shape will be stored under "1"
  //the second shape will be stored under "2"
  //& so on!
  if (key == '1') {
    println("shapes.size(): " + shapes.size());
    Shape n = (Shape) shapes.get(0);
    if (flip==true) {
      n.moveMask();
      println("second image");
    } 
    else if (flip == false) {
      n.moveMaskTwo();
      println("first image");
    }
    println("drawing 1 stored shape");
  } 

  if (key == '2') {
    Shape n = (Shape) shapes.get(1);
    if (flip==true) {
      n.moveMask();
      println("second image");
    } 
    else if (flip == false) {
      n.moveMaskTwo();
      println("first image");
    }
    println("drawing 2 stored shape");
  }

  if (key == '3') { 
    Shape n = (Shape) shapes.get(2);
    if (flip==true) {
      n.moveMask();
      println("second image");
    } 
    else if (flip == false) {
      n.moveMaskTwo();
      println("first image");
    }
    println("drawing 3 stored shape");
  }

  if (key == '4') {
    Shape n = (Shape) shapes.get(3);
    if (flip==true) {
      n.moveMask();
      println("second image");
    } 
    else if (flip == false) {
      n.moveMaskTwo();
      println("first image");
    }
    println("drawing 4 stored shape");
  }

  if (key == '5') {
    Shape n = (Shape) shapes.get(4);
    if (flip==true) {
      n.moveMask();
      println("second image");
    } 
    else if (flip == false) {
      n.moveMaskTwo();
      println("first image");
    }
    println("drawing 5 stored shape");
  }

  if (key == '6') {
    Shape n = (Shape) shapes.get(5);
    if (flip==true) {
      n.moveMask();
      println("second image");
    } 
    else if (flip == false) {
      n.moveMaskTwo();
      println("first image");
    }
    println("drawing 6 stored shape");
  }

  //--------clearing shapes-----------
  // if you press d, it deletes all of the shapes
  if (key == 'd') {
    for (int i=shapes.size()-1; i>=0; i--) {
      shapes.remove(i); //after the shape is created, delete the points in the points arraylist
      println("shapes have been cleared");
    }
  }

  //--------controls for background images-----------
  if (key == 'a') {
    firstPicture();
  }

  if (key == 'b') {
    secondPicture();
  }

  if (key == 'c') {
    drawBackground();
  }

  if (key == 'p') {
    colorBackground();
  }
}

//--------functions to draw images in background-----------
void firstPicture() {
  image(imageOne, 0, 0); //set imageOne as background to see where you are cutting
}

void secondPicture() {
  image(imageTwo, 0, 0); //set imageTwo as background to see where you are cutting
}

void drawBackground() {
  image(bImage, 0, 0); //set background image as background
}

void colorBackground() {
  background(204, 153, 255); //set background image as background
}

