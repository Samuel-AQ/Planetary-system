public class Camera{
  private float x, y, z;
  
  public Camera(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  
  protected void runCamera(){
    ortho(-x, x, -y, y);
  }
  
  protected void updateCamera(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
