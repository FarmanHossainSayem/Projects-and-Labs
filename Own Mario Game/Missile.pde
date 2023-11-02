class Missile extends Objects {
  PImage mis;
  float m_width;
  float m_height;
  Missile(float x, float y) {
    super(x, y);
    m_width=10;
    m_height=5;
    mis=loadImage("Plane/sideMissile.gif");
    velocity=new PVector (9, 0);
  }
  void update() {
    super.update();
  }
  void display() {
    fill(0, 255, 0);
    rect(location.x, location.y, m_width, m_height);
    image(mis, location.x-10, location.y-10, m_width+20, m_height+20);
  }
  boolean checkOut() {
    return location.x>width;
  }
  void run() {
    update();
    display();
  }
}
