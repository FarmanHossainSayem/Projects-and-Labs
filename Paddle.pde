class Paddle {
  float paddle_x;
  float paddle_y;
  float paddle_step;
  float paddle_h = 16;
  float paddle_w = 100;
  int type;

  Paddle () {
  }


  Paddle(int mode) {
    type = mode;
    paddle_x = width/2;
    paddle_step = 0;
  }

  void keyReleased() {
    paddle_step=0;
  }
  
  void keyPressed() {
    paddle_step = 0;
    if (type ==1) {
      if (key == CODED && keyCode == LEFT) paddle_step = -5;
      else if (key == CODED && keyCode == RIGHT) paddle_step = 5;
    } 
    if (type ==2) {
      if (key == 'a')
        paddle_step = -5;
      else if (key== 'd')
        paddle_step = 5;
    }
  }

  // Drawing the paddle
  void display() {
    stroke(24);
    fill(255);
    if (type ==1) { 
      paddle_y=0;
      rect(paddle_x, paddle_y, paddle_w, paddle_h);
    } else {
      paddle_y= height-paddle_h;
      rect(paddle_x, paddle_y, paddle_w, paddle_h);
    }
    paddle_x= paddle_x + paddle_step; // Moving the Paddle
  }
  void shorten() {
    paddle_w-=20;
    paddle_w=constrain(paddle_w, 0, 100);
  }
}


// Rough
//void keyReleased() {
//  paddle_step = 0;
//}

//// https://yal.cc/rectangle-circle-intersection-test/
//// returns true if a rectangle (rx, ry, rw, rh) intersects with a circle (cx, cy, cr)

////void reset() {
////  ball_x = random(ball_r, width - ball_r);
////  ball_y = random(ball_r, height/2 );
////  ball_x_step = random(-3, 3);
////  ball_y_step = random(1, 3);
////}
