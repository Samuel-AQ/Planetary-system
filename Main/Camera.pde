public class Camera {
  private float x, y, z, xRotation, yRotation, centerX, centerY, centerZ;
  PShape body;

  public Camera(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    xRotation = 0;
    yRotation = 0;
    centerX = width / 2;
    centerY = height / 2;
    centerZ = 0;
    body = createShape(BOX, 20, 20, 20);
  }

  protected void runCamera() {
    camera(x, y, z - 200, centerX, centerY, centerZ, 0, 1, 0);
  }

  protected void createCameraBody() {
    pushMatrix();
    translate(centerX, centerY, centerZ);
    rotateX(radians(xRotation));
    rotateY(radians(yRotation));
    shape(body);
    popMatrix();
  }

  protected void increaseX(float value) {
    x += value;
    centerX += value;
  }

  protected void decreaseX(float value) {
    x -= value;
    centerX -= value;
  }

  protected void increaseY(float value) {
    y += value;
    centerY += value;
  }

  protected void decreaseY(float value) {
    y -= value;
    centerY -= value;
  }

  protected void increaseZ(float value) {
    z += value;
    centerZ += value;
  }

  protected void decreaseZ(float value) {
    z -= value;
    centerZ -= value;
  }

  protected void increaseXRotation(float value) {
    xRotation += value;
  }
  protected void decreaseXRotation(float value) {
    xRotation -= value;
  }
  protected void increaseYRotation(float value) {
    yRotation += value;
  }
  protected void decreaseYRotation(float value) {
    yRotation -= value;
  }
}
