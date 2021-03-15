/**
 * @author: Samuel Arrocha Quevedo
 * @version: 15/03/2021
 */

PlanetarySystem system;
PImage backgroundImage;
Camera camera;
float xRotation, yRotation, systemRotation, viewAngle;
boolean showLegend, cameraMode, showInfoScreen, showIntroScreen;
String cameraKey;

void setup() {
  size(1000, 1000, P3D);
  xRotation = -15;
  yRotation = 0;
  systemRotation = 0;
  viewAngle = width * -0.9;
  backgroundImage = loadImage("../data/universe-background.jpg");
  camera = new Camera(height / 1.5);
  showLegend = false;
  cameraMode = false;
  showInfoScreen = false;
  showIntroScreen = true;
  cameraKey = "";

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
  if (showIntroScreen) {
    showIntro();
  } else if (showInfoScreen && !showIntroScreen) {
    showInfo();
  } else {
    background(backgroundImage);

    // Legend control
    if (showLegend && !showIntroScreen && !showInfoScreen) drawCelestialBodysNames();

    // Camera control
    checkCameraKey();
    if (cameraMode) {
      camera.runCamera();
      showLegend = false;
    } else {
      textSize(20);
      textAlign(CENTER);
      text("· Pulse 'I' para acceder a la ayuda", width / 2, height - 30);
      camera.createCameraBody();
      camera();
    }

    // System management
    updateMovements();
    system.moveCelestialBodies();
  }
}

void showIntro() {
  color black = color(0);
  String title = "Bienvenido al sistema \n planetario Eidolon";
  String startControlText = "Pulse 'enter' para comenzar";
  PImage systemImage = loadImage("../data/intro-image.png");
  background(black);
  textAlign(CENTER);
  textSize(50);
  text(title, width / 2, height * 0.1);
  image(systemImage, width * 0.18, height * 0.25);
  textSize(40);
  text(startControlText, width / 2, height * 0.9);
}

void checkCameraKey() {
  float increment = 5;

  switch(cameraKey) {
  case "w":
    camera.decreaseY(increment);
    break;
  case "d":
    camera.increaseX(increment);
    break;
  case "s":
    camera.increaseY(increment);
    break;
  case "a":
    camera.decreaseX(increment);
    break;
  case "e":
    camera.decreaseZ(increment);
    break;
  case "q":
    camera.increaseZ(increment);
    break;
  case "UP":
    camera.decreaseEyeY(increment);
    break;
  case "DOWN":
    camera.increaseEyeY(increment);
    break;
  case "LEFT":
    camera.decreaseEyeX(increment);
    break;
  case "RIGHT":
    camera.increaseEyeX(increment);
    break;
  }
}

void showInfo() {
  color black = color(0);
  String cameraControls  = "· Para mover la nave (w: ascender, d: derecha, s: descender,\n" +
    "  a: izquierda, e: avanzar y q: retroceder)\n" +
    "· Pulse las teclas de dirección para rotar la cámara";

  String normalControls = "· Use la rueda del ratón para ajustar el zoom sobre el sistema\n" +
    "· Pulse 'L' para mostrar u ocultar la leyenda \n" +
    "· Pulse 'C' para activar el modo cámara \n" +
    "· Pulse 'R' para reiniciar la aplicación \n" +
    "· Pulse 'I' para salir del manual";

  background(black);
  textAlign(CENTER);
  textSize(50);

  text("MANUAL DEL SISTEMA", width / 2, height * 0.25);
  textSize(40);
  text("Controles de la nave", width / 2, height * 0.35);
  textSize(20);
  text(cameraControls, width / 2, height * 0.4);
  textSize(40);
  text("Controles del sistema", width / 2, height * 0.55);
  textSize(20);
  text(normalControls, width / 2, height * 0.6);
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
  textAlign(LEFT);

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
  if (!cameraMode) viewAngle -= event.getCount() * 50;
}

void keyPressed() {
  if (keyCode == ENTER) showIntroScreen = false;

  if (!cameraMode && keyCode == 'L' || keyCode == 'l') showLegend = !showLegend;

  if (keyCode == 'C' || keyCode == 'c') cameraMode = !cameraMode;

  if (keyCode == 'R' || keyCode == 'r') setup();

  if (keyCode == 'i' || keyCode == 'I') showInfoScreen = !showInfoScreen;

  // Camera controls
  if (keyCode == 'w' || keyCode == 'W') cameraKey = "w";
  if (keyCode == 'd' || keyCode == 'D') cameraKey = "d";
  if (keyCode == 's' || keyCode == 'S') cameraKey = "s";
  if (keyCode == 'a' || keyCode == 'A') cameraKey = "a";
  if (keyCode == 'e' || keyCode == 'E') cameraKey = "e";
  if (keyCode == 'q' || keyCode == 'Q') cameraKey = "q";
  if (keyCode == UP) cameraKey = "UP";
  if (keyCode == DOWN) cameraKey = "DOWN";
  if (keyCode == LEFT) cameraKey = "LEFT";
  if (keyCode == RIGHT) cameraKey = "RIGHT";
}

void keyReleased() {
  boolean someCameraKeyIsReleased = keyCode == 'w' || keyCode == 'W' ||
    keyCode == 'd' || keyCode == 'D' ||
    keyCode == 's' || keyCode == 'S' ||
    keyCode == 'a' || keyCode == 'A' ||
    keyCode == 'e' || keyCode == 'E' ||
    keyCode == 'q' || keyCode == 'Q' ||
    keyCode == UP || keyCode == DOWN ||
    keyCode == LEFT || keyCode == RIGHT;

  if (someCameraKeyIsReleased) cameraKey = "";
}
