class Mario extends Objects {
  PImage stand_right, run_right1, run_right2;
  PImage stand_left, run_left1, run_left2;
  PImage jump_right, jump_left;
  Gif myAnimation;
  float topspeed;
  float mass; 
  int direction; // 0 = left, 1= right, 2 =up, 3 = down
  boolean jump;
  boolean key1, key2;

  Mario(float x, float y) {
    super(x, y);
    this.stand_right = loadImage("Mario/1_right.gif");
    this.run_right1 = loadImage("Mario/2_right.gif");
    this.run_right2 = loadImage("Mario/3_right.gif");
    this.stand_left = loadImage("Mario/1_left.gif");
    this.run_left1 = loadImage("Mario/2_left.gif");
    this.run_left2 = loadImage("Mario/3_left.gif");
    this.jump_right = loadImage("Mario/jump.gif");
    this.jump_left = loadImage("Mario/jump1.gif");
    jump = false; // check status
    topspeed = 3;
    mass = 100;
    force = new PVector(0, 0.002*mass);
    direction = 1;
  }


  void run() {
    update();
    checkboundary();
    display();
  }

  void display() {
    check_jump();
    if (jump && direction == 0) {
      image(jump_left, location.x, location.y);
    } else if (jump && direction == 1) {
      image(jump_right, location.x, location.y);
    } else if (direction == 0) {
      image(stand_left, location.x, location.y);
    } else if (direction == 1) {
      image(stand_right, location.x, location.y);
    } else {
      image(stand_right, location.x, location.y);
    }
  } 

  void restart() {
    location.x =100;
    location.y= 0;
  }

  void reset() {
    velocity.x = 0;
    //velocity.y = 0;
    acceleration.x = 0;
    acceleration.y = 0;
  }

  void update() {
    super.update();
    velocity.limit(5.5);
  }

  void checkboundary() {
    // stand on the first brick
    if (location.x > 212 && location.x < 270 &&  location.y <= 375 && location.y > 365) { //260
      location.y = 375;
    } else if (location.x > 212 && location.x < 270 && location.y >= 305 && location.y < 355) { //260
      location.y = 305;
    }
    if (location.x > 412 && location.x < 470 &&  location.y <= 375 && location.y > 365) { //260
      location.y = 375;
    } else if (location.x > 412 && location.x < 470 && location.y >= 305 && location.y < 355) { //260
      location.y = 305;
    }
    if (location.x > 612 && location.x < 670 &&  location.y <= 375 && location.y > 365) { //260
      location.y = 375;
    } else if (location.x > 612 && location.x < 670 && location.y >= 305 && location.y < 355) { //260
      location.y = 305;
    }
    if (location.x > 812 && location.x < 870 &&  location.y <= 375 && location.y > 365) { //260
      location.y = 375;
    } else if (location.x > 812 && location.x < 870 && location.y >= 305 && location.y < 355) { //260
      location.y = 305;
    }
    if (location.x < 0) {
      location.x = 0;
    }
    if (location.x > 1210) {
      location.x= 1210;
    }
    if (location.y < 0) {
      location.y = 0;
    }
    if (location.y > 485) {
      location.y = 485;
    }

    //if (location.x == 212 && location.y > 209 && location.y < 183) {
    //  location.x = 212;
    //}
  }

  void check_jump() {
    if (location.x >= 212 && location.x <= 270 && location.y == 305) {
      jump = false;
    } else if (location.x >= 412 && location.x <= 470 && location.y == 305) {
      jump = false;
    } else if (location.x >= 612 && location.x <= 670 && location.y == 305) {
      jump = false;
    } else if (location.x >= 812 && location.x <= 870 && location.y == 305) {
      jump = false;
    } else if (location.y< 485) {
      jump = true;
    } else {
      jump = false;
    }
  }

  void keyPressed() {
    if (key == 'a') {
      direction = 0;
      acceleration.x = -2;
      //acceleration.x = -0.1;
    }  
    if (key == 'd') {
      direction = 1;
      acceleration.x = 2;
    }  
    if (key == 'w') {
      acceleration.y = -3.5;
      if (!jump) {
        mario_jump.play();
      }
    } 

    while (key == 'd'&& !jump) {
      image(run_right1, location.x, location.y);
      image(run_right2, location.x, location.y);
      image(run_right1, location.x, location.y);
      image(stand_right, location.x, location.y);
      frameRate(42);
      break;
    }
    while (key == 'a' && !jump) {
      image(run_left1, location.x, location.y);
      image(run_left2, location.x, location.y);
      image(run_left1, location.x, location.y);
      image(stand_left, location.x, location.y);
      frameRate(42);
      break;
    }
  }

  boolean rectIsOnCircle(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
    float nx = max(rx, min(cx, rx + rw));
    float ny = max(ry, min(cy, ry + rh));
    float dx = cx - nx;
    float dy = cy - ny;
    return dx * dx + dy * dy < cr * cr;
  }

  float checkRec_y(float ry, float rh, float cy) {
    float ny = max(ry, min(cy, ry + rh));
    return ny;
  }

  float checkRec_x(float rx, float rw, float cx) {
    float nx = max(rx, min(cx, rx + rw));
    return nx;
  }
}
