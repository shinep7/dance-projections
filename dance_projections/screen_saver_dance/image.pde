
class Image {

  float vy = 1.0;
  PVector position;
  PVector direction;
  PImage img;

  Image(PImage img) {
    position = new PVector(0, 0, 0);
    direction = new PVector(0, -vy, 0);
    imageMode(CENTER);
     this.img = img;
  }
  
  void display(){
    pushMatrix();
    translate(position.x, position.y, position.z);
    
    textureMode(NORMAL);
    
    beginShape();
    texture(img);
    
    float w = 400;
    float h = w * img.height/img.width;
    
    vertex(-w, -h, 0, 0, 0);
    vertex(w, -h, 0, 1, 0);
    vertex(w, h, 0, 1, 1);
    vertex(-w, h, 0, 0, 1);
    
    endShape();
    
    popMatrix();
  }
  
  void move(){
    position.add(direction);
  }
}
