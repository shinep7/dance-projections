
//individual photo zoom
//each photo says for like 20 seconds
//at the end (last 30 seconds of the song), pictures start floating up fast

//resize images + rename them

ArrayList<Image> images;
int gameState = 0;

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

void setGS1(){
  Image first = images.get(6);

  first.position.x = width/2;
  first.position.y = height/2;
  first.display();
}

void drawGameState1(){

  Image first = images.get(6);
  
  //first.display();
  //first.position.x = width/2;
  //first.position.y = height/2;
  first.move();
  first.display();
}

void keyPressed() {

  if (keyCode == ' ') {
    gameState++;
    if (gameState == 1){
      setGS1();
    }
  } else {
    gameState = 0;
  }
}
