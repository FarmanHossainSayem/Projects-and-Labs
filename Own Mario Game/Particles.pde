class Particle extends Objects {
  color c_balls;
  float lifeSpan;
  float m;
  //PVector force = new PVector(0, 0.1*m);
  color red;
  color yellow;
  color orange;
  color purple;
  color pink;
  color blue;
  int source;

  Particle(float x, float y) {
    super(x, y);
    acceleration=new PVector(0, 2);
    velocity=new PVector(random(-1, 1), random(0, 2));
    red=color(255, 0, 0);
    yellow=color(255, 198, 76);
    orange=color(252, 257, 49);
    purple=color(156, 47, 151);
    pink=color(248, 59, 84);
    blue=color(0, 191, 255);
    lifeSpan=255;
    source = int(random(0, 6));
    c_balls = red;
    m = 100;
  }

  void color_create() {
    if (source == 1) {
      c_balls = purple;
    } else if (source == 2) {
      c_balls = red;
    } else if (source == 3) {
      c_balls = purple;
    } else if (source == 4) {
      c_balls = pink;
    } else {
      c_balls = blue;
    }
  }


  void run() {
    update();
    display();
  }

  void update() {
    super.update();
    lifeSpan-=2;
  }

  void display() {
    if (starwar_stage == 1) {
      noStroke();
      fill(c_balls, lifeSpan);
      ellipse(location.x, location.y, 3, 3);
    }
    if (starwar_stage == 2) {
      noStroke();
      fill(c_balls, lifeSpan);
      ellipse(location.x, location.y, 3, 3);
    }
  }

  boolean isDead() {
    if (lifeSpan<=0) {
      return true;
    } else {
      return false;
    }
  }
}
