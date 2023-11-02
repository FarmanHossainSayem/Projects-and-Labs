class Figure extends Objects {
  float f_width;
  float f_height;
  float f_score;
  Figure(float x, float y) {
    super(x, y);
    f_width=10;
    f_height=10;
    velocity=new PVector(0, 0);
    f_score=0;
    location.x=constrain(x, 0, width);
  }
  void update() {
    super.update();
  }
  void display() {
    fill(0, 0, 255);
    rect(location.x, location.y, f_width, f_height);
  }
  void keyPressed() {
    if (keyCode==LEFT) {
      velocity.x=-3;
    } else if (keyCode==RIGHT) {
      velocity.x=3;
    } else {
      velocity.x=0;
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
