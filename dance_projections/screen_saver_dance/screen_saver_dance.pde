
//individual photo zoom
//each photo says for like 20 seconds
//at the end (last 30 seconds of the song), pictures start floating up fast

ArrayList<Image> images;
int gameState = 0;
//Image image1;

void setup() {
  fullScreen(P3D);

  images = new ArrayList<Image>();
  images.add(new Image("img1.jpeg"));
  images.add(new Image("img3.jpeg"));
  images.add(new Image("img4.jpeg"));
  images.add(new Image("img5.jpeg"));
  images.add(new Image("img6.jpeg"));
  images.add(new Image("img8.jpeg"));
  images.add(new Image("8th.jpeg"));
  images.add(new Image("8th(1).jpeg"));
  images.add(new Image("9th.jpeg"));
  images.add(new Image("9th(1).jpeg"));
  images.add(new Image("10th.jpeg"));
  images.add(new Image("11th.png"));

  // loop through images and set position
  int bandWidth = height/2;
  for (int i = 0; i < images.size(); i++) {
    Image currentimg = images.get(i);
    currentimg.position = new PVector(random(0, width), random(height + i * bandWidth, height + (i + 1) * bandWidth), random(0, 5));
  }
  
  //image1 = new Image(img);
}

void draw() {
  background(0);

  
    if (gameState == 0) {
      drawGameState0();
    } else if (gameState == 1) {
      drawGameState1();
    } else if (gameState == 2) {
      //image1.ending();
    }
  
}


void drawGameState0()
{
  for (Image i : images) {
      i.display();
      i.move();
      }
}

void drawGameState1()
{
  Image first = images.get(0);
      first.position.x = width/2;
      first.position.y = height/2;
      first.display();
}


void keyPressed() {
  if (keyCode == ' ') {
    gameState++;
  } else {
    gameState = 0;
  }
}

/*class Image {

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
    if (image1.vy == 0.7) {
      image1.vy = 3;
    } else {
      image1.vy = 0.7;
    }
  }

  void display() {
    pushMatrix();
    translate(image1.position.x, image1.position.y, image1.position.z);

    textureMode(NORMAL);

    beginShape();
    texture(image1.img);

    vertex(-200, -200, 0, 0, 0);
    vertex(200, -200, 0, 1, 0);
    vertex(200, 200, 0, 1, 1);
    vertex(-200, 200, 0, 0, 1);

    endShape();

    popMatrix();
  }

  void move() {
    image1.position.add(image1.direction);
  }
  */



  /*void zoom() {
  }

  void ending() {

    //change speed of the final images so that they're faster

    pushMatrix();
    translate(image1.position.x, image1.position.y, image1.position.z);

    textureMode(NORMAL);

    beginShape();
    texture(image1.img);

    vertex(-200, -200, 0, 0, 0);
    vertex(200, -200, 0, 1, 0);
    vertex(200, 200, 0, 1, 1);
    vertex(-200, 200, 0, 0, 1);

    endShape();

    popMatrix();
  }
  */
