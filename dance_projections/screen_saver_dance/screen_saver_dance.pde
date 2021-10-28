
//individual photo zoom
//each photo says for like 20 seconds
//at the end (last 30 seconds of the song), pictures start floating up fast

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

  for (Image i : images) {
    if (gameState == 0) {
      i.display();
      i.move();
    } else if (gameState == 1) {
      i.zoom();
    } else if (gameState == 2) {
      i.ending();
    }
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    gameState++;
  } else {
    gameState = 0;
  }
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

  void zoom() {
  }

  void ending() {

    //change speed of the final images so that they're faster

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
