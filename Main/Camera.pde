public class Camera {
  private float x, y, z;
  PShape body;

  public Camera(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    body = createShape(BOX, 20, 20, 20);
  }

  protected void runCamera() {
    //ortho(-x, x, -y, y);
    camera();
  }
  protected void createCameraBody() {
    pushMatrix();
    translate(width / 2, height / 2);
    shape(camera.body);
    popMatrix();
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
