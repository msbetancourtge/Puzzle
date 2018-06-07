class Rectangle extends Piece {
  
  Rectangle(){
    super();
  }
  
  Rectangle(int size, int posiX, int posiY){
    super(size, posiX, posiY);
  }
  
  @Override
  void display() {
    pushStyle();
    //rectMode(CENTER);
    strokeWeight(2);
    stroke(0);
    fill(220, 100, 150);
    rect(posiX, posiY, size, size);
    popStyle();
    centerX=(posiX+int(size()/2));
    centerY=(posiY+int(size()/2));
  }
  
  @Override
  boolean pick(int x, int y, int posx, int posy) {
    return x>posx && x<(posx + size()) && y>posy && y<(posy + size());
  }
  
}
