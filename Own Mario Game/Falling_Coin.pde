class FCoin extends Objects{
  float c_size;
  FCoin(float x, float y,float xspeed){
    super (x,y);
    c_size=15;
    velocity=new PVector(xspeed,0);
    acceleration=new PVector(0,0.1);
  }
  void update(){
    super.update();
  }
  void checkOut(){
    if (location.y>height-30){
      location.y=height-30;
      velocity.x=0;
    }
  }
  void display(){
    fill(0);
    ellipse(location.x,location.y,c_size,c_size);
  }
    void run() {
    update();
    display();
  }
}
