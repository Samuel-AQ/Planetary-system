public class Camera {
  private float x, y, z;

  public Camera(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  protected void runCamera() {
    //ortho(-x, x, -y, y);
    camera();
  }

  protected void increaseX(float value) {
    x += value;
  }

  protected void decreaseX(float value) {
    x -= value;
  }

  protected void increaseY(float value) {
    y += value;
  }

  protected void decreaseY(float value) {
    y -= value;
  }

  protected void increaseZ(float value) {
    z += value;
  }

  protected void decreaseZ(float value) {
    z -= value;
  }
}
