Planet ifrit, sylph, bahamut, titan, moon, odin, ramuh, carbuncle, shiva, leviathan;
PImage backgroundImage, ifritTexture, sylphTexture, bahamutTexture, titanTexture, moonTexture, odinTexture, ramuhTexture, carbuncleTexture, shivaTexture, leviathanTexture;
float xRotation, yRotation, systemRotation;

void setup() {
  size(1000, 1000, P3D);
  xRotation = -15;
  yRotation = 0;
  systemRotation = 0;
  
  createSystem();
}

void createSystem() {
  //TODO: fix planet location
  loadTextures();
  
  ifrit = new Planet("Ifrit", width * 0.2, 0, height / 2, 0, ifritTexture);
  sylph = new Planet("Sylph", width * 0.05, width * 0.3, height / 2, 0, sylphTexture); 
  bahamut = new Planet("Bahamut", width * 0.05, width * -0.38 , height / 2, 0, bahamutTexture);
  titan = new Planet("Titan", width * 0.055, width * -0.51, height / 2, 0, titanTexture);
  odin = new Planet("Odin", width * 0.05, width * 0.55, height / 2, 0, odinTexture);
  ramuh = new Planet("Ramuh", width * 0.06, width * -0.65, height / 2, 0, ramuhTexture);
  carbuncle = new Planet("Carbuncle", width * 0.04, width * 0.75, height / 2, 0, carbuncleTexture);
  shiva = new Planet("Shiva", width * 0.045, width * -0.85, height / 2, 0, shivaTexture);
  leviathan = new Planet("Leviathan", width * 0.05, width * -0.95, height / 2, 0, leviathanTexture);
}

void loadTextures(){
  backgroundImage = loadImage("../data/universe-background.jpg");
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
  background(backgroundImage);
  updateMovements();
  movePlanets();
}

void updateMovements() {
  translate(width / 2, height / 8, width * -0.8);
  rotateX(radians(xRotation));
  rotateY(radians(yRotation));
  
  if (systemRotation <= 360) {
    systemRotation += 1;
  } else {
    systemRotation -= 360;
  }
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
