Planet ifrit, sylph, bahamut, titan, moon, odin, ramuh, carbuncle, shiva, leviathan;
PImage ifritTexture, sylphTexture, bahamutTexture, titanTexture, moonTexture, odinTexture, ramuhTexture, carbuncleTexture, shivaTexture, leviathanTexture;
float xRotation, yRotation, systemRotation;

void setup() {
  size(1000, 1000, P3D);
  xRotation = 0;
  yRotation = 0;
  systemRotation = 0;
  createSystem();
}

void createSystem() {
  loadTextures();
  ifrit = new Planet(width * 0.2, 0, height / 2, 0, ifritTexture);
  sylph = new Planet(width * 0.05, width * 0.3, height / 2, 200, sylphTexture); 
  bahamut = new Planet(width * 0.05, width * -0.38 , height / 2, 150, bahamutTexture);
  titan = new Planet(width * 0.055, width * -0.47, height / 2, 50, titanTexture);
  odin = new Planet(width * 0.05, width * 0.55, height / 2, 80, odinTexture);
  ramuh = new Planet(width * 0.06, width * -0.65, height / 2, 300, ramuhTexture);
  carbuncle = new Planet(width * 0.04, width * 0.75, height / 2, 500, carbuncleTexture);
  shiva = new Planet(width * 0.045, width * -0.85, height / 2, 150, shivaTexture);
  leviathan = new Planet(width * 0.05, width * -0.95, height / 2, 800, leviathanTexture);
}

void loadTextures(){
  ifritTexture = loadImage("../data/textures/ifrit.png");
  sylphTexture = loadImage("../data/textures/sylph.jpg");
  bahamutTexture = loadImage("../data/textures/bahamut.jpg");
  titanTexture = loadImage("../data/textures/titan.jpg");
  odinTexture = loadImage("../data/textures/odin.jpg");
  ramuhTexture = loadImage("../data/textures/ramuh.jpg");
  carbuncleTexture = loadImage("../data/textures/carbuncle.jpg");
  shivaTexture = loadImage("../data/textures/shiva.jpg");
  leviathanTexture = loadImage("../data/textures/leviathan.jpg");
}

void draw() {
  drawBackground();
  translate(width / 2, height / 8, width * -0.8);
  rotateX(radians(xRotation));
  rotateY(radians(yRotation));
  movePlanets();
  updatePlanetsRotation();
}

void drawBackground() {
  color black = color(0);
  background(black);
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
