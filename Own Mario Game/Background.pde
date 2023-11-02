class Background {
  float x, y, z, pz;

  Background() {
    x= random(-width, width);
    y= random (-height, height);
    z= random ( width); 
    pz=z;
    //  z is here to measure where the star will star and making the effect of moving closer and far away
  }

  void generate() {
    z= z-15; // z-speed to contol with mouse
    if (z<1) 
    // When z gets down to zero means closer to the screen, reset the z back 
    {
      z= width;
      x= random(-width, width);
      y= random (-height, height);
      pz=z; // the x and y is not changing so z is causing the change
    }
  }
  void display() {

    fill(255, 255, 255);
    noStroke();

    float mx= map(x/z, 0, 1, 0, width); 
    float my= map(y/z, 0, 1, 0, height); 
    // dividing by z making the effect to move towards the screen faster
    
    float close= map(z, 0, width, 20, 0); // Making the effect if the ball is far when it will be small and if they are close it will look big

    ellipse(mx, my, close/2, close/2);


    float ax= map(x/pz, 0, 1, 0, width);
    float ay= map(y/pz, 0, 1, 0, height);
    // updating it previous location
    pz=z;

     // Drawing a line between the two Locations
    strokeWeight(close/2); 
    stroke(255, 255, 255, 120);
    line(ax, ay, mx, my);


    strokeWeight(close/3); 
    stroke(255, 0, 255, 120);
    //line(ax, ay, mx, my);
    line(ax*.8, ay*.8, mx *1, my *1);

    strokeWeight(close/2.5); 
    stroke(0, 0, 255, 120);
    //line(ax, ay, mx, my);
    line(ax*.7, ay*.7, mx*.9, my*.9);
  }
}
