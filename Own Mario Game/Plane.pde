class Plane extends Objects {
  float p_size;
  Plane(float x, float y) {
    super(x, y);
    p_size=15;
    velocity=new PVector(random(-2, -1), 0);
  }
  void update() {
    super.update();
  }
  void display() {
    fill(255, 0, 0);
    ellipse(location.x, location.y, p_size, p_size);
  }
  boolean checkOut() {
    return location.x<0;
  }
  void run() {
    update();
    display();
  }
}
