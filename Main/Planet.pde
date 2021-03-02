public class Planet {
  float x, y, z;
  ArrayList<Planet> moons;
  float radius;

  public Planet(float radius, float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;

    pushMatrix();
    //fill(planetColor);
    translate(x, y, z);
    sphere(radius);
    popMatrix();
  }

  public Planet(float radius, float x, float y, float z, ArrayList<Planet> moons) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.moons = moons;

    pushMatrix();
    translate(x, y, z);
    sphere(radius);
    popMatrix();
  }

  protected void updatePlanet() {
    pushMatrix();
    translate(x, y, z);
    sphere(radius);
    popMatrix();
  }
}
