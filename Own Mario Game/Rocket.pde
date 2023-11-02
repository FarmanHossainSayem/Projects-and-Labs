class Rocket extends Objects {
  float r_width;
  float r_height;
  float r;
  PImage rocket;
  float mass;

  Rocket(float x, float y) {
    super(x, y);
    r_width=20;
    r_height=120;
    r=100;
    mass = 1;
    this.rocket=loadImage("Starwar/flight.png");
    force = new PVector(0, 0.00001*mass);
  }

  void run() {
    display();
    update();
    checkEdge();
  }

  void display() {
    image(rocket, location.x - 20, location.y - 170, 60, 60);    
    if (starwar_stage == 1 || starwar_stage == 2) {
      image(rocket3, location.x - 35, location.y - 160, 13, 50);
      image(rocket3, location.x + 43, location.y - 160, 13, 50);
    }
  }


  void checkEdge() {
    if (location.x>width-55) {
      location.x=width-55;
    }  
    if (location.x<40) {
      location.x=40;
    }
    if (location.y>height+100) {
      location.y=height+100;
    } 
    if (location.y < 175) {
      location.y= 175;
    }
  }

  void reset() {
    velocity.x = 0;
    velocity.y = 0;
    acceleration.x = 0;
    acceleration.y = 0;
  }

  void update() {
    super.update();
    if (velocity.y > 3 ) {
      velocity.y = 3;
    }
    velocity.limit(5);
  }

  void keyPressed() {
    if (key == CODED && keyCode == LEFT) {
      acceleration.x = -2;
    } 
    if (key == CODED && keyCode == RIGHT) {
      acceleration.x = 2;
    }  
    if (key == CODED && keyCode == UP) {
      acceleration.y = -2;
    }  
    if (key == CODED && keyCode == DOWN) {
      acceleration.y = 2;
    }
  }
}
