public class PlanetarySystem {

  ArrayList<Planet> planets;
  Planet star;

  public PlanetarySystem(Planet star) {
    this.star = star;
    planets = new ArrayList<Planet>();
  }

  protected void addPlanet(Planet planet) {
    planets.add(planet);
  }

  protected int getSize() {
    return planets.size();
  }

  protected Planet getPlanet(String planetName) {
    int position = -1;
    for (Planet planet : planets) {
      if (planet.name == planetName) {
        position = planets.indexOf(planet);
        break;
      }
    }
    return planets.get(position);
  }

  protected Planet getPlanet(int index) {
    return planets.get(index);
  }

  protected void movePlanets() {
    updateStar();

    rotateY(radians(systemRotation));
    for (Planet planet : planets) {
      planet.updatePlanet();
    } 
  }
  
  private void updateStar(){
    pushMatrix();
    translate(star.x, star.y, star.z);
    star.shape = createShape(SPHERE, star.radius);
    star.shape.setTexture(star.texture);
    star.shape.setStroke(false);
    shape(star.shape);
    popMatrix();
  }
}
