class Image{

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
  
  void mousePressed() {
    if (vy == 0.7) {
      vy = 3;
    } else {
      vy = 0.7;
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);

    textureMode(NORMAL);

    beginShape();
    texture(img);

    vertex(-200, -200, 0, 0, 0);
    vertex(200, -200, 0, 1, 0);
    vertex(200, 200, 0, 1, 1);
    vertex(-200, 200, 0, 0, 1);

    endShape();

    popMatrix();
  }

  void move() {
    position.add(direction);
  }
}
