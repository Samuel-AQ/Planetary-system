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
  
  protected int getSize(){
    return planets.size();
  }

  protected Planet getPlanet(String planetName) {
    int position = -1;
    for (Planet planet : planets) {
      if (planet.name == planetName){
        position = planets.indexOf(planet);
        break;
      }
    }
    return planets.get(position);
  }
  
  protected Planet getPlanet(int index){
    return planets.get(index);
  }
  
  protected void movePlanets(float systemRotation){
  star.updatePlanet();
  
  pushMatrix();
  rotateY(radians(systemRotation));
  for (Planet planet : planets) {
    planet.updatePlanet();
  } 
  popMatrix();
  }
}
