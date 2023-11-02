class Coin extends Objects {
  float w, h;
  Coin(float x, float y) {
    super(x, y);
    w = 25;
    h = 25;
  }

  void run() {
    display();
    boundary();
  }

  void display() {
    if (starwar.checkTouch()) {
      mariosound.play();
      for (int i =0; i <= 40; i++) {
        coin1.location.y -= 0.25;
      }
    } else if (plane.checkTouch()) {
      mariosound.play();
      for (int i =0; i <= 40; i++) {
        coin2.location.y -= 0.25;
      }
    } else if (birdgame.checkTouch()) {
      mariosound.play();
      for (int i =0; i <= 40; i++) {
        coin3.location.y -= 0.25;
      }
    } else if (ballgame.checkTouch()) {
      mariosound.play();
      for (int i =0; i <= 40; i++) {
        coin4.location.y -= 0.25;
      }
    }
    image(coin, location.x, location.y, 25, 25);
  }
  void boundary() {
    if (location.y < 300) {
      location.y = 300;
    }
  }

  boolean check() {
    if (rectIsOnCircle(location.x, location.y, w, h, mario.location.x+7, mario.location.y+7, 7)) {
      return true;
    } else {
      return false;
    }
  }

  boolean rectIsOnCircle(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
    float nx = max(rx, min(cx, rx + rw));
    float ny = max(ry, min(cy, ry + rh));
    float dx = cx - nx;
    float dy = cy - ny;
    return dx * dx + dy * dy < cr * cr;
  }
}
