
ArrayList<Image> images;

void setup() {
  fullScreen(P3D);
  
  images = new ArrayList<Image>();
  images.add(new Image("img1.jpeg"));
  images.add(new Image("img2.jpeg"));
  images.add(new Image("img3.jpeg"));
  images.add(new Image("img4.jpeg"));
  images.add(new Image("img5.jpeg"));
  images.add(new Image("img6.jpeg"));
  images.add(new Image("img7.jpeg"));
  images.add(new Image("img8.jpeg"));

}

void draw() {
  background(0);

  for (Image i : images) {
    i.display();
    i.move();
  }
}

class Image {

  float vy = 0.5;
  PVector position;
  PVector direction;
  PImage img;

  Image(String filename) {
    position = new PVector(random(0, width), random(height, height*3/2), random(0, 5));
    direction = new PVector(vy*0, -vy, vy*0);
    img = loadImage(filename);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
   
   textureMode(NORMAL);
   
   beginShape();
   texture(img);
   
   vertex(-100, -100, 0, 0, 0);
   vertex(100, -100, 0, 1, 0);
   vertex(100, 100, 0, 1, 1);
   vertex(-100, 100, 0, 0, 1);
   
   endShape();
   popMatrix();
  }

  void move(){
    position.add(direction);
  }
}
