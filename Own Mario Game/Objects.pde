class Objects {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  float mass;
  float w;
  float h;

  Objects(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    force = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.add(force);
  }
  

}
