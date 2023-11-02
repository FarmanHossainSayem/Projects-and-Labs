class F_jet extends Objects {
  float f_width;
  float f_height;
  F_jet(float x, float y) {
    super(x, y);
    f_width=20;
    f_height=10;
    velocity=new PVector(0, 0);
    location.y=constrain(y, 0, height);
  }
  void update() {
    super.update();
  }
  void display() {
    fill(137, 96, 77);
  }
  void keyPressed() {
    if (keyCode==UP) {
      velocity.y=-7;
    } else if (keyCode==DOWN) {
      velocity.y=7;
    } else {
      velocity.y=0;
    }
  }
  void keyReleased() {
    reset();
  }
  void reset() {
    velocity.x=0;
    velocity.y=0;
  }

  void run() {
    update();
    display();
  }
}
