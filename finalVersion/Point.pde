//this is a class called point that stores
//the x and y values when the mouse is clicked 

class Point {
  
  int x;
  int y; 
  
  void storePoint() {
      x = mouseX;
      y = mouseY;
      println("x: " + x + ", y: " + y + ", point stored!");
  }
}

