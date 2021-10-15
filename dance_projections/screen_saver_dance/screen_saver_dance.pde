//stagger floating up photos
//individual photo zoom
//after 2 mins floating up pictues

ArrayList<Image> images;

void setup() {
  fullScreen(P3D);
  
  images = new ArrayList<Image>();
  images.add(new Image("img1.jpeg"));
  //images.add(new Image("img2.jpeg"));
  images.add(new Image("img3.jpeg"));
  images.add(new Image("img4.jpeg"));
  images.add(new Image("img5.jpeg"));
  images.add(new Image("img6.jpeg"));
  //images.add(new Image("img7.jpeg"));
  images.add(new Image("img8.jpeg"));
  images.add(new Image("8th.jpeg"));
  images.add(new Image("8th(1).jpeg"));
  images.add(new Image("9th.jpeg"));
  images.add(new Image("9th(1).jpeg"));
  images.add(new Image("10th.jpeg"));
  //images.add(new Image("10th(1).jpeg"));
  images.add(new Image("11th.png"));

  // loop through images and set position
  int bandWidth = height/2;
  for(int i = 0; i < images.size(); i++){
    Image currentimg = images.get(i);
    currentimg.position = new PVector(random(0, width), random(height + i * bandWidth, height + (i + 1) * bandWidth), random(0, 5));
  }
  
}

void draw() {
  background(0);

  for (Image i : images) {
    i.display();
    i.move();
  }
}

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

  void move(){
    position.add(direction);
  }
}
