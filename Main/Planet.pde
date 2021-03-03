public class Planet {
  String name;
  float x, y, z;
  ArrayList<Planet> moons;
  float radius;
  PImage texture;
  PShape shape;

  public Planet(String name, float radius, float x, float y, float z, PImage texture) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.texture = texture;
    
    setPlanet(this);
  }

  public Planet(String name, float radius, float x, float y, float z, PImage texture, ArrayList<Planet> moons) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.texture = texture;
    this.moons = moons;
    
    setPlanet(this);
  }
  

  protected void updatePlanet() {
    setPlanet(this);
    updateMoons();
  }

  private void updateMoons() {
    if (moons != null) {
      for (Planet moon : moons) {
        setPlanet(moon);
      }
    }
  }
  
  private void setPlanet(Planet target){
    //TODO: show target name and move it
    pushMatrix();
    translate(target.x, target.y, target.z);
    target.shape = createShape(SPHERE, target.radius);
    target.shape.setTexture(target.texture);
    target.shape.setStroke(false);
    shape(target.shape);
    popMatrix();
  }
}
