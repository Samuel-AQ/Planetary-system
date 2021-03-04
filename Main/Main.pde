/**
 * @author: Samuel Arrocha Quevedo
 * @version: 04/03/2021
 */

PlanetarySystem system;
PImage backgroundImage;
float xRotation, yRotation, systemRotation, viewAngle;
boolean showLegend;

void setup() {
  size(1000, 1000, P3D);
  xRotation = -15;
  yRotation = 0;
  systemRotation = 0;
  viewAngle = width * -0.9;
  backgroundImage = loadImage("../data/universe-background.jpg");
  showLegend = false;
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

  Planet ifrit = new Planet("Ifrit", width * 0.2, 0, height / 2, 0, ifritTexture);
  Planet sylph = new Planet("Sylph", width * 0.05, 0, height / 2, 300, sylphTexture); 
  Planet bahamut = new Planet("Bahamut", width * 0.05, width * -0.38, height / 2, 400, bahamutTexture);
  Planet titan = new Planet("Titan", width * 0.055, width * 0.2, height / 2, -500, titanTexture);
  Planet odin = new Planet("Odin", width * 0.05, width * 0.55, height / 2, 650, odinTexture);
  Planet ramuh = new Planet("Ramuh", width * 0.06, width * -0.65, height / 2, 750, ramuhTexture);
  Planet carbuncle = new Planet("Carbuncle", width * 0.04, width * 0.75, height / 2, -800, carbuncleTexture);
  Planet shivaMoon = new Planet("ShivaMoon", width * 0.018, width * -0.97, height / 2, -900, shivaMoonTexture);
  Planet shiva = new Planet("Shiva", width * 0.045, width * -0.85, height / 2, -900, shivaTexture, shivaMoon);
  Planet leviathan = new Planet("Leviathan", width * 0.05, width * -0.95, height / 2, 950, leviathanTexture);

  system = new PlanetarySystem(ifrit);

  system.addPlanet(sylph);
  system.addPlanet(bahamut);
  system.addPlanet(titan);
  system.addPlanet(odin);
  system.addPlanet(ramuh);
  system.addPlanet(carbuncle);
  system.addPlanet(shiva);
  system.addPlanet(leviathan);
}

void draw() {
  background(backgroundImage);
  showInfo();
  if (showLegend) drawPlanetsNames();
  updateMovements();
  system.movePlanets();
}


void showInfo() {
  textSize(20);
  text("· Use la rueda del ratón para ajustar el zoom sobre el sistema", 30, height - 90);
  text("· Pulse las teclas de dirección para rotar el sistema", 30, height - 60);
  text("· Pulse 'L' para mostrar u ocultar la leyenda", 30, height - 30);
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

void drawPlanetsNames() {
  float y = height * 0.005;

  textSize(20);
  // Star name
  Planet star = system.star;
  float adaptedRadius = star.radius * 0.08;
  text(star.name, 30, y += 35);
  pushMatrix();
  translate(150, y - 5);
  PShape shape = createShape(SPHERE, adaptedRadius);
  shape.setTexture(star.texture);
  shape.setStroke(false);
  shape(shape);
  popMatrix();

  // Planets names
  for (Planet planet : system.planets) {
    adaptedRadius = planet.radius * 0.25;
    text(planet.name, 30, y += 35);
    pushMatrix();
    translate(150, y - 5);
    shape = createShape(SPHERE, adaptedRadius);
    shape.setTexture(planet.texture);
    shape.setStroke(false);
    shape(shape);
    popMatrix();
  }
}

void mouseWheel(MouseEvent event) {
  viewAngle -= event.getCount() * 50;
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
  if (keyCode == 'L' || keyCode == 'l') {
    showLegend = !showLegend;
  }
}
