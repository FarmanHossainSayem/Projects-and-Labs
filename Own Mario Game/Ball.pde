class Ball {
  float ball_x, ball_y;
  float ball_x_step, ball_y_step;
  float ball_r = 13;

  Ball() {
    ball_x = random(ball_r, width - ball_r);
    ball_y = random(ball_r, height/2 );
    ball_x_step = random(-3, 3);
    ball_y_step = random(1, 3);
  }

  void reset() {
    ball_x = random(ball_r, width - ball_r);
    ball_y = random(ball_r, height/2 );
    ball_x_step = random(1, 5);
    ball_y_step = random(1, 5);
  }

  void display() {
    // Checking the right and left edge to make the ball bounce

    if (ball_x - ball_r < 0 || ball_x + ball_r > width) { 
      ball_x_step = -ball_x_step;
    }

    // Checking the top and buttom to make the ball reset and score points

    if (ball_y > height) {
      point.play();
      leftscore++;
      reset();
    }

    if (ball_y  < 0) {
      point.play();
      rightscore++;
      reset();
    }

    // Ball movement 

    ball_x = ball_x + ball_x_step;
    ball_y = ball_y + ball_y_step; 

    // Drawing the ball
    noStroke();
    fill(135, 206, 235);
    ellipse(ball_x, ball_y, ball_r*2, ball_r*2);
  }

  boolean rectIsOnCircle(Paddle pad) {
    float nx = max(pad.paddle_x, min(ball_x, pad.paddle_x + pad.paddle_w));
    float ny = max(pad.paddle_y, min(ball_y, pad.paddle_y + pad.paddle_h));
    float dx = ball_x - nx;
    float dy = ball_y - ny;
    return dx * dx + dy * dy < ball.ball_r * ball.ball_r;
  }
boolean checkUp(){
return ball_y<0;
}
boolean checkDown(){
  return ball_y>height;
}
}

//// COMMENT
//if (rectIsOnCircle(paddle_x, height - paddle_h, paddle_w, paddle_h, 
//  ball_x, ball_y, ball_r)) {
//  ball_y_step = -ball_y_step;
//}

// Rough
// 
//if (ball_y - ball_r < 0) { 
//  //point.play();
//  //rightscore++;  
//  ball_y_step = -ball_y_step;
//}
