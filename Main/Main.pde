/**
 * @author: Samuel Arrocha Quevedo
 * @version: 05/03/2021
 */

PlanetarySystem system;
PImage backgroundImage;
Camera camera;
float xRotation, yRotation, systemRotation, viewAngle;
boolean showLegend, cameraMode;
char cameraKey;

void setup() {
  size(1000, 1000, P3D);
  xRotation = -15;
  yRotation = 0;
  systemRotation = 0;
  viewAngle = width * -0.9;
  backgroundImage = loadImage("../data/universe-background.jpg");
  camera = new Camera(100);
  showLegend = false;
  cameraMode = false;
  createSystem();
}

void createSystem() {
  PImage ifritTexture = loadImage("../data/textures/ifrit.png");
  PImage sylphTexture = loadImage("../data/textures/sylph.jpg");
  PImage bahamutTexture = loadImage("../data/textures/bahamut.jpg");
  PImage titanTexture = loadImage("../data/textures/titan.jpg");
  PImage odinTexture = loadImage("../data/textures/odin.jpg");
  PImage ramuhTexture = loadImage("../data/textures/ramuh.jpg");
  PImage carbuncleTexture = loadImage("../data/textures/carbuncle.jpg");
  PImage shivaTexture = loadImage("../data/textures/shiva.jpg");
  PImage shivaMoonTexture = loadImage("../data/textures/shivaMoon.jpg");
  PImage leviathanTexture = loadImage("../data/textures/leviathan.jpg");

  CelestialBody ifrit = new CelestialBody("Ifrit", width * 0.2, 0, height / 2, 0, ifritTexture);
  CelestialBody sylph = new CelestialBody("Sylph", width * 0.05, 0, height / 2, 300, sylphTexture); 
  CelestialBody bahamut = new CelestialBody("Bahamut", width * 0.05, width * -0.38, height / 2, 400, bahamutTexture);
  CelestialBody titan = new CelestialBody("Titan", width * 0.055, width * 0.2, height / 2, -500, titanTexture);
  CelestialBody odin = new CelestialBody("Odin", width * 0.05, width * 0.55, height / 2, 650, odinTexture);
  CelestialBody ramuh = new CelestialBody("Ramuh", width * 0.06, width * -0.65, height / 2, 750, ramuhTexture);
  CelestialBody carbuncle = new CelestialBody("Carbuncle", width * 0.04, width * 0.75, height / 2, -800, carbuncleTexture);
  CelestialBody shivaMoon = new CelestialBody("Mogu", width * 0.018, width * -0.97, height / 2, -900, shivaMoonTexture);
  CelestialBody shiva = new CelestialBody("Shiva", width * 0.045, width * -0.85, height / 2, -900, shivaTexture, shivaMoon);
  CelestialBody leviathan = new CelestialBody("Leviathan", width * 0.05, width * -0.95, height / 2, 950, leviathanTexture);

  system = new PlanetarySystem(ifrit);

  system.addCelestialBody(sylph);
  system.addCelestialBody(bahamut);
  system.addCelestialBody(titan);
  system.addCelestialBody(odin);
  system.addCelestialBody(ramuh);
  system.addCelestialBody(carbuncle);
  system.addCelestialBody(shiva);
  system.addCelestialBody(leviathan);
}

void draw() {
  background(backgroundImage);
  checkCameraKey();
  showInfo();
  
  if (showLegend) drawCelestialBodysNames();
  
  // Camera control
  if (cameraMode) {
    camera.runCamera();
  } else {
    camera.createCameraBody();
    camera();
  }

  updateMovements();
  system.moveCelestialBodies();
}

void checkCameraKey() {
  float increment = 5;

  switch(cameraKey) {
  case 'w':
    camera.decreaseY(increment);
    break;
  case 'd':
    camera.increaseX(increment);
    break;
  case 's':
    camera.increaseY(increment);
    break;
  case 'a':
    camera.decreaseX(increment);
    break;
  case 'e':
    camera.decreaseZ(increment);
    break;
  case 'q':
    camera.increaseZ(increment);
    break;
  }
}

void showInfo() {
  if (!cameraMode) {
    textSize(20);
    text("· Use la rueda del ratón para ajustar el zoom sobre el sistema", 30, height - 120);
    text("· Pulse las teclas de dirección para rotar el sistema", 30, height - 90);
    text("· Pulse 'L' para mostrar u ocultar la leyenda", 30, height - 60);
    text("· Pulse 'C' para activar el modo cámara", 30, height - 30);
  }
}

void updateMovements() {
  translate(width / 2, height / 8, viewAngle);
  rotateX(radians(xRotation));
  rotateY(radians(yRotation));

  if (systemRotation <= 360) {
    systemRotation += 1;
  } else {
    systemRotation -= 360;
  }
}

void drawCelestialBodysNames() {
  float y = height * 0.005;

  textSize(20);
  // Star name
  CelestialBody star = system.star;
  float adaptedRadius = star.radius * 0.08;
  text(star.name, 30, y += 35);
  pushMatrix();
  translate(150, y - 5);
  PShape shape = createShape(SPHERE, adaptedRadius);
  shape.setTexture(star.texture);
  shape.setStroke(false);
  shape(shape);
  popMatrix();

  // CelestialBodies names
  for (CelestialBody CelestialBody : system.CelestialBodies) {
    adaptedRadius = CelestialBody.radius * 0.25;
    text(CelestialBody.name, 30, y += 35);
    pushMatrix();
    translate(150, y - 5);
    shape = createShape(SPHERE, adaptedRadius);
    shape.setTexture(CelestialBody.texture);
    shape.setStroke(false);
    shape(shape);
    popMatrix();
    // Moon name if it exists
    if (CelestialBody.moon != null) {
      adaptedRadius = CelestialBody.moon.radius * 0.25;
      text(CelestialBody.moon.name, 30, y += 35);
      pushMatrix();
      translate(150, y - 5);
      shape = createShape(SPHERE, adaptedRadius);
      shape.setTexture(CelestialBody.moon.texture);
      shape.setStroke(false);
      shape(shape);
      popMatrix();
    }
  }
}

void mouseWheel(MouseEvent event) {
  viewAngle -= event.getCount() * 50;
}

void keyPressed() {
  float increment = 5;

  if (keyCode == 'L' || keyCode == 'l') {
    showLegend = !showLegend;
  }
  if (keyCode == 'C' || keyCode == 'c') {
    cameraMode = !cameraMode;
  }

  // This controls are only enabled when not using the camera mode
  if (!cameraMode) {
    if (keyCode == UP) {
      xRotation += increment;
    }
    if (keyCode == DOWN) {
      xRotation -= increment;
    }
    if (keyCode == RIGHT) {
      yRotation += increment;
    }
    if (keyCode == LEFT) {
      yRotation -= increment;
    }
  }

  boolean someCameraKeyIsPressed = keyCode == 'w' || keyCode == 'W' ||
    keyCode == 'd' || keyCode == 'D' ||
    keyCode == 's' || keyCode == 'S' ||
    keyCode == 'a' || keyCode == 'A' ||
    keyCode == 'e' || keyCode == 'E' ||
    keyCode == 'q' || keyCode == 'Q';
    
  if (someCameraKeyIsPressed) cameraKey = key;
}

void keyReleased() {
  boolean someCameraKeyIsReleased = keyCode == 'w' || keyCode == 'W' ||
    keyCode == 'd' || keyCode == 'D' ||
    keyCode == 's' || keyCode == 'S' ||
    keyCode == 'a' || keyCode == 'A' ||
    keyCode == 'e' || keyCode == 'E' ||
    keyCode == 'q' || keyCode == 'Q';
    
  if (someCameraKeyIsReleased) cameraKey = '0';
}
