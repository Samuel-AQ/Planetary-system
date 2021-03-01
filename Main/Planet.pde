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

  protected void movePlanet(float starX, float starZ) {
    float speedIncrement = 0.8;
    
    if (x >= starX && z >= starZ) {
      x -= speedIncrement;
      z += speedIncrement;
    }

    if (x <= starX && z >= starZ) {
      x -= speedIncrement;
      z -= speedIncrement;
    }

    if (x <= starX && z <= starZ) {
      x += speedIncrement;
      z -= speedIncrement;
    }

    if (x >= starX && z <= starZ) {
      x += speedIncrement;
      z += speedIncrement;
    }

    pushMatrix();
    translate(x, y, z);
    rotateX(PI/8);
    sphere(radius);
    popMatrix();
  }
}
