class Dragon extends Objects {
  int lifeSpan = 50;
  int w = 60;
  int h = 150;
  float speed = 0.25;
  Dragon(float x, float y) {
    super(x, y);
    velocity = new PVector(0.25, 0);
  }
  void display() {
    //ellipse(location.x, location.y, 60, 150);
    //imageMode(CENTER);
    image(dragon1, location.x -125, location.y-125, 250, 250);
  }

  boolean isDead() {
    return lifeSpan<=0;
  }
  void update() {
    super.update();
  }
  void checkboundary() {
    if (location.x == width -125) {
      velocity.x = -0.25;
    } else if (location.x == 125) {
      location.x = 0.25;
    }
  }
}
