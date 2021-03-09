public class PlanetarySystem {

  ArrayList<CelestialBody> CelestialBodies;
  CelestialBody star;

  public PlanetarySystem(CelestialBody star) {
    this.star = star;
    CelestialBodies = new ArrayList<CelestialBody>();
  }

  protected void addCelestialBody(CelestialBody CelestialBody) {
    CelestialBodies.add(CelestialBody);
  }

  protected int getSize() {
    return CelestialBodies.size();
  }

  protected void moveCelestialBodies() {
    updateStar();

    rotateY(radians(systemRotation));
    for (CelestialBody CelestialBody : CelestialBodies) {
      CelestialBody.updateCelestialBody();
    }
  }

  private void updateStar() {
    pushMatrix();
    translate(star.x, star.y, star.z);
    star.shape = createShape(SPHERE, star.radius);
    star.shape.setTexture(star.texture);
    star.shape.setStroke(false);
    shape(star.shape);
    popMatrix();
  }
}
