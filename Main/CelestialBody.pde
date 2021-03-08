public class CelestialBody {
  String name;
  float x, y, z;
  CelestialBody moon;
  float radius, angle;
  PImage texture;
  PShape shape;

  public CelestialBody(String name, float radius, float x, float y, float z, PImage texture) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.texture = texture;
    this.angle = 0;

    setCelestialBody(this);
  }

  public CelestialBody(String name, float radius, float x, float y, float z, PImage texture, CelestialBody moon) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.texture = texture;
    this.moon = moon;
    this.angle = 0;
    this.moon.angle = -500;

    setCelestialBody(this);
  }


  protected void updateCelestialBody() {
    setCelestialBody(this);
  }

  private void setCelestialBody(CelestialBody target) {
    pushMatrix();
    translate(target.x, target.y, target.z);
    updateAngle();
    target.shape = createShape(SPHERE, target.radius);
    target.shape.setTexture(target.texture);
    target.shape.setStroke(false);
    shape(target.shape);
    popMatrix();

    if (target.moon != null) {
      pushMatrix();
      translate(target.moon.x, target.moon.y, target.moon.z);
      target.moon.shape = createShape(SPHERE, target.moon.radius);
      target.moon.shape.setTexture(target.moon.texture);
      target.moon.shape.setStroke(false);
      shape(target.moon.shape);
      popMatrix();
    }
  }

  private void updateAngle() {
    if (angle > 360) angle -= 360;
    rotateY(radians(angle += 1));
  }
}
