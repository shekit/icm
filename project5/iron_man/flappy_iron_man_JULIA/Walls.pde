class Wall {
  PVector location;
  PVector size;
  float speed;

  Wall(float x, float y, float w, float h) {
    location = new PVector(x, y);
    size = new PVector(w, h);
  }

  void setWallSpeed(float tempSpeed) {
    speed = tempSpeed;
  }

  void display() {
    fill(0, 255, 0); 
    rect(location.x, location.y, size.x, size.y);
  }

  void move() {
    location.x -= speed;
  }
}
