public class Planet {
  float x, y, z;
  ArrayList<Planet> moons;
  float radius;

  public Planet(float radius, float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    
    setPlanetPosition(this);
  }

  public Planet(float radius, float x, float y, float z, ArrayList<Planet> moons) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.moons = moons;
    
    setPlanetPosition(this);
  }
  

  protected void updatePlanet() {
    setPlanetPosition(this);
    updateMoons();
  }

  private void updateMoons() {
    if (moons != null) {
      for (Planet moon : moons) {
        setPlanetPosition(moon);
      }
    }
  }
  
  private void setPlanetPosition(Planet target){
    pushMatrix();
    translate(target.x, target.y, target.z);
    sphere(target.radius);
    popMatrix();
  }
}
