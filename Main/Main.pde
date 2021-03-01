Planet ifrit, sylph, bahamut, titan, moon, odin, ramuh, carbuncle, shiva, leviathan;
float xRotation, yRotation;

void setup() {
  size(1000, 1000, P3D);
  xRotation = 0;
  yRotation = 0;
  create_planets();
}

void draw() {
  drawBackground();
  //translate(, , 0);
  rotateX(radians(xRotation));
  rotateY(radians(yRotation));
  translate(mouseX, mouseY);
  runSystem();
}

void drawBackground() {
  color black = color(0);
  background(black);
}

void create_planets() {
  ifrit = new Planet(width * 0.1, width * 0.1, height / 2, 0);
  sylph = new Planet(width * 0.02, width * 0.3, height / 2, 0); 
  bahamut = new Planet(width * 0.02, width * 0.38, height / 2, 0);
  titan = new Planet(width * 0.025, width * 0.47, height / 2, 0);
  odin = new Planet(width * 0.02, width * 0.55, height / 2, 0);
  ramuh = new Planet(width * 0.04, width * 0.65, height / 2, 0);
  carbuncle = new Planet(width * 0.035, width * 0.75, height / 2, 0);
  shiva = new Planet(width * 0.03, width * 0.85, height / 2, 0);
  leviathan = new Planet(width * 0.03, width * 0.95, height / 2, 0);
}

void runSystem() {
  ifrit = new Planet(width * 0.1, width * 0.1, height / 2, 0);
  sylph.movePlanet(ifrit.x, ifrit.z);
  bahamut.movePlanet(ifrit.x, ifrit.z);
  titan.movePlanet(ifrit.x, ifrit.z);
  odin.movePlanet(ifrit.x, ifrit.z);
  ramuh.movePlanet(ifrit.x, ifrit.z);
  carbuncle.movePlanet(ifrit.x, ifrit.z);
  shiva.movePlanet(ifrit.x, ifrit.z);
  leviathan.movePlanet(ifrit.x, ifrit.z);
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
