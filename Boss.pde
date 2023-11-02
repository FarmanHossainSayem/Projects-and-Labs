class Boss extends Objects {
  float b_size;
  float lifeSpan;
  Boss(float x, float y) {
    super(x, y);
    b_size=40;
    velocity=new PVector (random(-2, -1), 0);
    lifeSpan=20;
  }
  
  void update() {
    super.update();
  }
  
  void display() {
    fill(77, 255, 187);
    ellipse(location.x, location.y, b_size, b_size);
  }
  
  boolean checkOut() {
    return location.x<0;
  }
  
  boolean isDead() {
    return lifeSpan<=0;
  }
  
  void run() {
    update();
    display();
  }
  
}
