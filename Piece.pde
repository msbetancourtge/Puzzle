abstract class Piece {
  
  // 1. Attributes
  PImage img;
  float size;
  int posiX, posiY;
  int centerX, centerY;
  
  private boolean select, move;
  private int moveX, moveY;

  // 2. Constructors
  
  // 2.1. Default
  Piece() {
    setImage(loadImage("none.png"));
    setSize(60);
  }

  // 2.2. Other
  
  Piece(PImage img, int size, int posiX, int posiY) {
    setImage(img);
    setSize(size);
    setPosX(posiX);
    setPosY(posiY);
  }
  
  Piece(int size, int posiX, int posiY) {
    setSize(size);
    setPosX(posiX);
    setPosY(posiY);
  }

  // 3. Methods
  abstract void display();
  abstract boolean pick(int x, int y, int posx, int posy);
  
  void update(boolean drgin)
  {
    select = pick(mouseX, mouseY, posiX, posiY);
    if (!drgin && mousePressed && mouseButton == LEFT && select)
    {
      move = true;
      moveX = mouseX - posiX;
      moveY = mouseY - posiY;
    }
    if (!mousePressed)
    {
      move = false;
    }
  }
  
  boolean isDragged()
  {
    return move;
  }
  
  void move()
  {
    if (move)
    {
      posiX = mouseX - moveX;
      posiY = mouseY - moveY;
    }
    
  }
  
  // 3.2. Setters
  void setSize(float s) {
    size = s;
  } 
  void setImage(PImage image) {
    img = image;
  }
  
  void setPosX(int px){
  posiX = px;
  }
  
  void setPosY(int py){
  posiY = py;
  }

  // 3.3. Getters
  float size() {
    return size;
  }  
  PImage imagge() {
    return img;
  }
  int posX(){
  return posiX;
  }
  int posY(){
  return posiY;
  }
  
}
