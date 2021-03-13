public class Camera {
  private float eyeX, eyeY, centerX, centerY, centerZ;
  PShape body;

  public Camera(float z) {
    centerX = width / 2;
    centerY = height / 2;
    centerZ = z;
    eyeX = centerX;
    eyeY = centerY;
    body = createShape(BOX, 10, 10, 10);
  }

  protected void runCamera() {
    camera(eyeX, eyeY, centerZ, centerX, centerY, centerZ, 0, 1, 0);
  }

  protected void createCameraBody() {
    pushMatrix();
    translate(centerX, centerY, centerZ);
    rotateX(radians(mouseY));
    rotateY(radians(mouseX));
    shape(body);
    popMatrix();
  }

  protected void increaseX(float value) {
    centerX += value;
  }

  protected void decreaseX(float value) {
    centerX -= value;
  }

  protected void increaseY(float value) {
    centerY += value;
  }

  protected void decreaseY(float value) {
    centerY -= value;
  }

  protected void increaseZ(float value) {
    centerZ += value;
  }

  protected void decreaseZ(float value) {
    centerZ -= value;
  }
  
  protected void updateEyeX(float value){
    eyeX += value;
  }
  
  protected void updateEyeY(float value){
    eyeY += value;
  }
}
