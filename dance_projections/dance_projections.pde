//image filters and collision detectionw

PVector velocity;
PVector position;
PVector direction;
PVector position1;
PVector velocity1;
PVector direction1;


PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

int gameState = 0;

void setup(){
  fullScreen(P3D);  
  
  img1 = loadImage("download.jpg");
  img2 = loadImage("download-1.jpg");
  img3 = loadImage("download-2.jpg");
  img4 = loadImage("download-3.jpg");
  img5 = loadImage("download-4.jpg");
  
  velocity = new PVector(2,2,2);
  position = new PVector(width/2, height/2, 1);
  direction = new PVector(1,1,1);
  position1 = new PVector(100,100,100);
  velocity1 = new PVector(1,2,1);
  direction1 = new PVector(1,1,1);
}


void drawImg1(){
  translate(position.x, position.y, position.z);
  
  textureMode(NORMAL);
  
  beginShape();
  texture(img1);
  vertex(100, 100, 0, 0, 0);
  vertex(500, 100, 0, 1, 0);
  vertex(500, 500, 0, 1, 1);
  vertex(100, 500, 0, 0, 1);
  endShape();
  

}

void drawImg2(){
  
  translate(position1.x, position1.y, position1.z);
  
  beginShape();
  texture(img2);
  vertex(100, 100, 0, 0, 0);
  vertex(500, 100, 0, 1, 0);
  vertex(500, 500, 0, 1, 1);
  vertex(100, 500, 0, 0, 1);
  endShape();
}

void drawImg3(){
  
  translate(position.x, position.y, position.z);
  
  beginShape();
  texture(img3);
  vertex(100, 100, 0, 0, 0);
  vertex(500, 100, 0, 1, 0);
  vertex(500, 500, 0, 1, 1);
  vertex(100, 500, 0, 0, 1);
  endShape();
}

void drawImg4(){
  
  translate(position.x, position.y, position.z);
  
  beginShape();
  texture(img4);
  vertex(100, 100, 0, 0, 0);
  vertex(500, 100, 0, 1, 0);
  vertex(500, 500, 0, 1, 1);
  vertex(100, 500, 0, 0, 1);
  endShape();
}

void drawImg5(){
  
  translate(position.x, position.y, position.z);
  
  beginShape();
  texture(img5);
  vertex(100, 100, 0, 0, 0);
  vertex(500, 100, 0, 1, 0);
  vertex(500, 500, 0, 1, 1);
  vertex(100, 500, 0, 0, 1);
  endShape();
}

void draw(){
  background(0);
  
  if(gameState == 0){
    drawImg1();
    //drawImg2();
  }else if(gameState == 1){
    drawImg2();
  }else if(gameState == 2){
    drawImg3();
  }else if (gameState == 3){
    drawImg4();
  }else if (gameState == 4){
    drawImg5();
  }else{
    gameState = 0;
  }
  
 position.x = position.x + (velocity.x * direction.x);
  position.y = position.y + (velocity.y * direction.y);
  position.z = position.z + (velocity.z * direction.z);
  position1.x = position1.x + (velocity1.x * direction1.x);
  position1.y = position1.y + (velocity1.y * direction1.y);
  position1.z = position1.z + (velocity1.z * direction1.z);
  
 /* if(dist(position.x, position.y, position1.x, position1.y)<50)
  {
    velocity.x *= random(0,3);
    velocity.y *= random(0,3);
    velocity.z *= random(0,3);
    velocity1.x *= random(0,3);
    velocity1.y *= random(0,3);
    velocity1.z *= random(0,3);
    
    direction.x *= random(0,3);
    direction.y *= random(0,3);
    direction.z *= random(0,3);
    direction1.x *= random(0,3);
    direction1.y *= random(0,3);
    direction1.z *= random(0,3);
    
    
  }*/
  
  
  if(position.x > (width) || position.x < 0){
    direction.x *= -1;
  }
  
  if(position.y > (height) || position.y < 0){
    direction.y *= -1;
  }
  
  if(position.z > 20 || position.z < 0){
    direction.z *= -1;
  }
  
  if(position1.x > (width) || position1.x < 0){
    direction1.x *= -1;
  }
  
  if(position1.y > (height) || position1.y < 0){
    direction1.y *= -1;
  }
  
  if(position1.z > 100 || position1.z < 0){
    direction1.z *= -1;
  }
  
  if(position.z > 500){
    direction.z *= -1;
  }
  
  if(position.x < 100){
    direction.x *= -1;
  }
  
  if(position.y < 100){
    direction.y *= -1;
  }
  
  if(position.z < 0){
    direction.z *= -1;
  }
}

void keyPressed(){
  if(keyCode == ' '){
    gameState ++;
  }
}
