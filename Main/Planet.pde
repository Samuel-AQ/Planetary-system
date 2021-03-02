public class Planet {
  float x, y, z;
  ArrayList<Planet> moons;
  float radius;
  PImage texture;
  PShape shape;

  public Planet(float radius, float x, float y, float z, PImage texture) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.texture = texture;
    
    setPlanetPosition(this);
  }

  public Planet(float radius, float x, float y, float z, PImage texture, ArrayList<Planet> moons) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.texture = texture;
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
    target.shape = createShape(SPHERE, target.radius);
    target.shape.setTexture(target.texture);
    target.shape.setStroke(false);
    shape(target.shape);
    popMatrix();
  }
}
