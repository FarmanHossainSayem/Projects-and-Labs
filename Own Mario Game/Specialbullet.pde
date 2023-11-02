class Specialbullet extends Bullet{
  PImage missile;
  Specialbullet(float x, float y){  
    super(x,y);
    missile = loadImage("Starwar/rocket2.png");
    acceleration = new PVector(0, -3);
  }
  
  void display(){
    image(missile, location.x, location.y, 12, 40);
  }
  
}
