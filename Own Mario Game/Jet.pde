class Jet extends Objects {
  float j_width;
  float j_height;
  float jet_score;
  Jet(float x, float y) {
    super(x, y);
    j_width=30;
    j_height=20;
    velocity=new PVector(0, 0);
    jet_score=0;
    location.y=constrain(y, 20, height-30);
  }
  void update() {
    super.update();
  }
  void display() {
    fill(0, 0, 255);
  }
  void keyPressed() {
    if (keyCode==UP) {
      velocity.y=-6;
    } else if (keyCode==DOWN) {
      velocity.y=6;
    } else {
      velocity.y=0;
    }
  }
  void run() {
    update();
    display();
  }
  void keyReleased() {
    reset();
  }
  void reset() {
    velocity.x=0;
    velocity.y=0;
  }
}
