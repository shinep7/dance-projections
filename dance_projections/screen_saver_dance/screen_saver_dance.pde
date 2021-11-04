
//individual photo zoom
//each photo stays for like 20 seconds
//at the end (last 30 seconds of the song), pictures start floating up fast

//time element

ArrayList<Image> images;
int gameState = 0;
int currentphoto = 5;
PImage img1, img2, img3, img4, img5;
PImage img8th, img8th2, img9th, img9th2, img10th, img10th2, img11th;

void setup() {

  fullScreen(P3D);

  images = new ArrayList<Image>();
  
  img1 = loadImage("image1.jpeg");
  img2 = loadImage("image3.jpeg");
  img3 = loadImage("image4.jpeg");
  img4 = loadImage("image5.jpeg");
  img5 = loadImage("image6.jpeg");
  img8th = loadImage("8thgrade.jpeg");
  img8th2 = loadImage("8thgrade(1).jpeg");
  img9th = loadImage("9thgrade.jpeg");
  img9th2 = loadImage("9thgrade(1).jpeg");
  img10th = loadImage("10thgrade(1).jpeg");
  img10th2 = loadImage("10thgrade.jpeg");
  img11th = loadImage("11thgrade.png");


  images.add(new Image(img1)); 
  images.add(new Image(img10th2));
  images.add(new Image(img2));
  images.add(new Image(img8th2));
  images.add(new Image(img3));
  images.add(new Image(img11th));
  images.add(new Image(img4));
  images.add(new Image(img9th2));
  images.add(new Image(img5));
  images.add(new Image(img9th));
  images.add(new Image(img8th));
  images.add(new Image(img11th));
  images.add(new Image(img8th2));
  images.add(new Image(img3));
  images.add(new Image(img10th));
  images.add(new Image(img8th));
  images.add(new Image(img5));
  images.add(new Image(img8th2));
  images.add(new Image(img10th2));
  images.add(new Image(img4));
  images.add(new Image(img9th));
  images.add(new Image(img1));
  images.add(new Image(img9th2));
  images.add(new Image(img8th));
  images.add(new Image(img2));
  images.add(new Image(img10th));
  images.add(new Image(img4));
  images.add(new Image(img9th));
  images.add(new Image(img1));
  images.add(new Image(img10th2));
  images.add(new Image(img5));
  images.add(new Image(img3));
  images.add(new Image(img11th));
  images.add(new Image(img9th2));
  images.add(new Image(img2));
  images.add(new Image(img10th));
  
  


  // loop through images and set position
  int bandWidth = height/4;
  for (int i = 0; i < images.size(); i++) {
    Image currentimg = images.get(i);
    currentimg.position = new PVector(random(0, width), random(height + i * bandWidth, height + (i + 1) * bandWidth), random(0, 5));
  }
}

void draw() {

  background(0);

  if (gameState == 0) {
    drawGameState0();
  } else if (gameState == 1) {

    drawGameState1();
  } else if (gameState == 2) {
    //drawGameState1();
  }
}


void drawGameState0() {

  for (Image i : images) {
    i.display();
    
    i.move();
  }
}

void setGS1() {


  Image first = images.get(currentphoto);

  first.position.x = width/2;
  first.position.y = height;
  first.display();
}

void drawGameState1() {

  Image first = images.get(currentphoto);

  first.move();
  first.display();
}

void keyPressed() {

  if (keyCode == ' ') {
    gameState++;

    if (gameState == 1) {
      setGS1();
    }
  } else if (key == 'a') {
    currentphoto++;
    setGS1();
  } else {
    gameState = 0;
  }
}
