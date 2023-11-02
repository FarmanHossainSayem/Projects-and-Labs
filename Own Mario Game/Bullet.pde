class Bullet extends Objects {

  float b_width;
  float b_height;

  Bullet(float x, float y) {
    super(x, y);
    acceleration = new PVector (0, -2);
    b_width=3;
    b_height=20;
  }

  void update() {
    super.update();
  }

  void display() {
    noStroke();
    fill(0,0,255);
    rect(location.x, location.y, b_width, b_height);
  }

  boolean checkOut() {
    if (location.y<0) {
      return true;
    } else {
      return false;
    }
  }

}
