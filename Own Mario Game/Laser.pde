class Laser extends Objects {
  float w = 5;
  float h = -500;
  
  Laser(float x, float y) {
    super(x, y);
  }
  
  void display() {
    noStroke();
    fill(255, 0, 0);
    rect(location.x, location.y, w, h);
  }
  
  
}
