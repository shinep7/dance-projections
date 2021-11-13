
//individual photo zoom
//each photo stays for like 20 seconds
//at the end (last 30 seconds of the song), pictures start floating up fast

//time element

ArrayList<Image> images;
int gameState = 0;
int currentphoto = 0;
PImage img1, img2, img3, img4, img5;
PImage img7th, img7th2, img8th, img8th2, img9th, img9th2, img10th, img10th2, img11th;

void setup() {

  fullScreen(P3D);

  images = new ArrayList<Image>();

  img1 = loadImage("image1.jpg");
  img2 = loadImage("image3.jpg");
  img3 = loadImage("image4.jpg");
  img4 = loadImage("image5.jpg");
  img5 = loadImage("image6.jpg");
  img7th = loadImage("7th.png");
  img7th2 = loadImage("7th.jpg");
  img8th = loadImage("8th (2).jpg");
  img8th2 = loadImage("8th (3).jpg");
  img9th = loadImage("9th (2).jpg");
  img9th2 = loadImage("9th (3).jpg");
  img10th = loadImage("10th (2).jpg");
  img10th2 = loadImage("10th (3).jpg");
  img11th = loadImage("11th (1).png");

  //0-1
  images.add(new Image(img7th));
  images.add(new Image(img7th2));
  
  //2-3
  images.add(new Image(img8th));
  images.add(new Image(img8th2));
  
  //4-5
  images.add(new Image(img9th2));
  images.add(new Image(img9th));
  
  //6-7
  images.add(new Image(img10th2));
  images.add(new Image(img10th));
  
  //8
  images.add(new Image(img11th));
  
  
  images.add(new Image(img1));
  images.add(new Image(img10th2));
  images.add(new Image(img7th2));
  images.add(new Image(img8th2));
  images.add(new Image(img3));
  images.add(new Image(img4));
  images.add(new Image(img9th2));
  images.add(new Image(img5));
  images.add(new Image(img11th));
  images.add(new Image(img7th));
  images.add(new Image(img8th2));
  images.add(new Image(img3));
  images.add(new Image(img10th));
  images.add(new Image(img8th));
  images.add(new Image(img5));
  images.add(new Image(img8th2));
  images.add(new Image(img7th2));
  images.add(new Image(img10th2));
  images.add(new Image(img4));
  images.add(new Image(img9th));
  images.add(new Image(img1));
  images.add(new Image(img9th2));
  images.add(new Image(img7th));
  images.add(new Image(img8th));
  images.add(new Image(img2));
  images.add(new Image(img4));
  images.add(new Image(img9th));
  images.add(new Image(img1));
  images.add(new Image(img10th2));
  images.add(new Image(img5));
  images.add(new Image(img3));
  images.add(new Image(img11th));
  images.add(new Image(img7th2));
  images.add(new Image(img9th2));
  images.add(new Image(img2));
   images.add(new Image(img7th));
  images.add(new Image(img2));
  images.add(new Image(img10th));


  // loop through images and set position
  int bandWidth = height/2;
  for (int i = 0; i < images.size(); i++) {
    Image currentimg = images.get(i);
    currentimg.position = new PVector(random(0, width-300), -(random(i * bandWidth, (i + 1) * bandWidth)), random(0, 5));
 // println(currentimg.position);  
}
}

void draw() {

  background(0);

  if (gameState == 0) {
    background(0);
  } else if (gameState == 1){
    drawGameState0();
  } else if (gameState == 2) {
    drawGameState1();
  } else if (gameState == 3) {
    drawGameState0();
  } else if (gameState == 4){
    background(0);
  }
}


void setGS0(){
  
  int bandWidth = height/2;
  for (int i = 0; i < images.size(); i++) {
    Image currentimg = images.get(i);
    
    currentimg.position = new PVector(random(300, width-500), -(random(i * bandWidth, (i + 1) * bandWidth)), random(0, 5));
   //println(currentimg.position);
}
  
  for (Image i : images){
    i.display();
  }
  
  
}

void drawGameState0() {

  for (Image i : images) {
    i.display();
    i.move();
  }
}

void fasterImages(){
  for (Image i : images){
    i.direction.y*=3;
  }
}

void setGS1() {


  Image first = images.get(currentphoto);

  first.position.x = width/2 - 400;
  first.position.y = 200;
  first.display();
  
  if (currentphoto == 0)
    setupPartner(1);
 
 if (currentphoto == 2)
   setupPartner(3);
   
  if (currentphoto == 4)
   setupPartner(5);
   
  if (currentphoto == 6)
   setupPartner(7);
  
}

void setupPartner(int i){
  Image seventh = images.get(i);
  seventh.position.x = width/2 + 400;
 seventh.position.y = 200;
 
}

void movePartner(int i)
{
  Image seventh = images.get(i);  
  seventh.move();
  seventh.display(); 
  
}


void drawGameState1() {

  Image first = images.get(currentphoto);
  
  first.move();
  first.display();
  
  if (currentphoto == 0)
      movePartner(1);
  
  if (currentphoto == 2)
      movePartner(3);
      
  if (currentphoto == 4)
      movePartner(5);
      
  if (currentphoto == 6)
      movePartner(7);
      
      
}

void keyPressed() {

  if (keyCode == ' ') {
    gameState++;

    if (gameState == 2) {
      setGS1();
    }
     if (gameState == 3){
       setGS0();
       fasterImages();
     }
  } else if (key == 'a') {
    currentphoto++;
    
    if (currentphoto == 1)
      currentphoto++; // skip over 8
    
    else if (currentphoto == 3)
      currentphoto++;
      
    else if (currentphoto == 5)
      currentphoto++;
      
    else if (currentphoto == 7)
       currentphoto++;
      
    setGS1();
  }
  
}
