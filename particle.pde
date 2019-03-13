class Particle {

  PVector pos;
  float r;

  Particle(float radius, float angle) {
    pos = PVector.fromAngle(angle);
    pos.mult(radius);
    r = 3;
  }

  void update() {
    pos.x -= 1;
    pos.y += random(-10, 10);

    float angle = pos.heading();
    angle = constrain(angle, 0, PI/6);
    float magnitude = pos.mag();
    pos = PVector.fromAngle(angle);
    pos.setMag(magnitude);
  }

  void show() {
    fill(255);
    int alfa = map(alfa, 100, 0, pos.x, width);
    stroke(255);
    ellipse(pos.x, pos.y, r * 2, r *2);
  }

  boolean intersects(LinkedList<Particle> snowflake) {
    boolean result = false;
    for (Particle s : snowflake) {
      float d = dist(s.pos.x, s.pos.y, pos.x, pos.y); 
      if (d < r*2) {
        result = true;
        break;
      }
    }
    return result;
  }

  boolean finished() {
    return (pos.x < 1);
  }
}
