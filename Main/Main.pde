Planet ifrit, sylph, bahamut, titan, moon, odin, ramuh, carbuncle, shiva, leviathan;
float xRotation, yRotation, systemRotation;

void setup() {
  size(1000, 1000, P3D);
  xRotation = 0;
  yRotation = 0;
  systemRotation = 0;
  create_planets();
}

void draw() {
  drawBackground();
  translate(width / 2, height / 8, -800);
  rotateX(radians(xRotation));
  rotateY(radians(yRotation));
  movePlanets();
  updatePlanetsRotation();
}

void drawBackground() {
  color black = color(0);
  background(black);
}

void create_planets() {
  ifrit = new Planet(width * 0.2, 0, height / 2, 0);
  sylph = new Planet(width * 0.05, width * 0.3, height / 2, 200); 
  bahamut = new Planet(width * 0.05, width * 0.38 * - 1, height / 2, 150);
  titan = new Planet(width * 0.055, width * 0.47 * - 1, height / 2, 50);
  odin = new Planet(width * 0.05, width * 0.55, height / 2, 80);
  ramuh = new Planet(width * 0.06, width * 0.65 * - 1, height / 2, 300);
  carbuncle = new Planet(width * 0.04, width * 0.75, height / 2, 500);
  shiva = new Planet(width * 0.045, width * 0.85 * - 1, height / 2, 150);
  leviathan = new Planet(width * 0.05, width * 0.95 * - 1, height / 2, 800);
}

void movePlanets() {
  ifrit.updatePlanet();
  pushMatrix();
  rotateY(radians(systemRotation));
  sylph.updatePlanet();
  bahamut.updatePlanet();
  titan.updatePlanet();
  odin.updatePlanet();
  ramuh.updatePlanet();
  carbuncle.updatePlanet();
  shiva.updatePlanet();
  leviathan.updatePlanet();
  popMatrix();
}

void updatePlanetsRotation() {
  if (systemRotation <= 360) {
    systemRotation += 1;
  } else {
    systemRotation -= 360;
  }
}

void keyPressed() {
  float rotationIncrement = 5;

  if (keyCode == UP) {
    xRotation += rotationIncrement;
  }
  if (keyCode == DOWN) {
    xRotation -= rotationIncrement;
  }
  if (keyCode == RIGHT) {
    yRotation += rotationIncrement;
  }
  if (keyCode == LEFT) {
    yRotation -= rotationIncrement;
  }
}
