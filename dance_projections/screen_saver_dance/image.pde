
class Image {

  float vy = 0.7;
  PVector position;
  PVector direction;
  PImage img;

  Image(String filename) {
    position = new PVector(0, 0, 0);
    direction = new PVector(vy*0, -vy, vy*0);
    imageMode(CENTER);
    img = loadImage(filename);
  }
}
