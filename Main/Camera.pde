public class Camera {
  private float eyeX, eyeY, centerX, centerY, centerZ;
  private PShape body;
  private PImage spacecraftTexture;

  public Camera(float z) {
    centerX = width / 2;
    centerY = height / 2;
    centerZ = z;
    eyeX = 510;
    eyeY = 480;
    body = createShape(BOX, 10, 10, 10);
    spacecraftTexture = loadImage("../data/textures/spacecraft-texture.jpg");
  }

  protected void runCamera() {
    camera(centerX, centerY, centerZ, eyeX, eyeY, 0, 0, 1, 0);
  }

  protected void createCameraBody() {
    pushMatrix();
    translate(centerX, centerY, centerZ);
    rotateX(radians(eyeY));
    rotateY(radians(eyeX));
    body.setTexture(spacecraftTexture);
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
  
  protected void increaseEyeX(float value){
    eyeX += value;
  }
  
  protected void decreaseEyeX(float value){
    eyeX -= value;
  }
  
  protected void increaseEyeY(float value){
    eyeY += value;
  }
  
  protected void decreaseEyeY(float value){
    eyeY -= value;
  }
}
