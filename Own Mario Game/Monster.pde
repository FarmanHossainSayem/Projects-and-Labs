class Monster extends Objects{
  int m_width;
  int m_height;
  PImage monster;
  
  Monster(float x, float y) {
    super(x, y);
    location=new PVector(random(width), 0);
    velocity=new PVector(0, random(2));
    m_width=25;
    m_height=25;
    this.monster=loadImage("Starwar/monster.png");
    monster.resize(m_width, m_height);
  }
  
  void display() {
    fill(100, 230, 79);
    image(monster, location.x - m_width/2, location.y - m_height/2);
  }
  
  void falling() {
    location.add(velocity);
  }
  
  void run() {
    display();
    falling();
  }
}
