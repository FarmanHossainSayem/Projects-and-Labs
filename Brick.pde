class Brick extends Objects{
  float w;
  float h;
  int direction; // top = 3 right = 2 bottom = 1 left = 4 special = 5

  Brick(float b_x, float b_y) {
    super(b_x, b_y);
    w=50;
    h=50;
    direction = 0;
  }

  void run() {
    display();
    checkTouch_helper();
    checkTouch();
  }
  
  void display() {
    noStroke();
    fill(0, 0, 255);
    rect(location.x, location.y, w, h);
    image(brick, location.x, location.y, 50, 50);
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


  void checkTouch_helper() {
    if (rectIsOnCircle(location.x, location.y, w, h, mario.location.x+7, mario.location.y+7, 8)){
      float nx = checkRec_x(location.x, w, mario.location.x+7);
      float ny = checkRec_y(location.y, h, mario.location.y+7);
      if (nx == mario.location.x+7 && ny == location.y) { //top
        direction = 3;
      } else if (nx == location.x && ny == location.y + h) { //right
        direction = 2;
      } else if (nx == mario.location.x+7 && ny == location.y +h) { // bottom
        direction = 1;
      } else if (nx == location.x + w && ny == location.y + h) { //left
        direction = 4;
      } else {
        direction = 5;
      }
    } else {
      direction = 0;
    }
  }

  boolean checkTouch() {
    if (direction == 1) {
      return true;
    } else {
      return false;
    }
  }
}
