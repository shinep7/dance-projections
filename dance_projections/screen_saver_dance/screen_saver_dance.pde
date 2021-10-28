
//individual photo zoom
//each photo says for like 20 seconds
//at the end (last 30 seconds of the song), pictures start floating up fast

//time element

ArrayList<Image> images;
int gameState = 0;
int currentphoto = 5;

void setup() {

  fullScreen(P3D);

  images = new ArrayList<Image>();
  images.add(new Image("image1.jpeg"));
  images.add(new Image("image3.jpeg"));
  images.add(new Image("image4.jpeg"));
  images.add(new Image("image5.jpeg"));
  images.add(new Image("image6.jpeg"));
  images.add(new Image("8thgrade.jpeg"));
  images.add(new Image("8thgrade(1).jpeg"));
  images.add(new Image("9thgrade.jpeg"));
  images.add(new Image("9thgrade(1).jpeg"));
  images.add(new Image("10thgrade(1).jpeg"));
  images.add(new Image("10thgrade.jpeg"));
  images.add(new Image("11thgrade.png"));

  // loop through images and set position
  int bandWidth = height/2;
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

  //first.display();
  //first.position.x = width/2;
  //first.position.y = height/2;
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
