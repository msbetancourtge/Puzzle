class Image extends Piece {

  Image() {
    super();
  }

  Image(PImage img, int size, int posiX, int posiY) {
    super(img, size, posiX, posiY);
  }

  @Override
    void display() {
    pushStyle();
    image(this.img, posiX, posiY);
    if (pick(mouseX, mouseY, posiX, posiY)) {
      tint(50, 100, 80, 150);
      image(this.img, posiX, posiY);
      if (mousePressed) {
        tint(255, 200);
        image(this.img, posiX, posiY);
      }
    }
    popStyle();
    centerX=(posiX+int(size()/2));
    centerY=(posiY+int(size()/2));
    //println(centerX, centerY);
  }

  @Override
    boolean pick(int x, int y, int posx, int posy) {
    return x>posx && x<(posx + size()) && y>posy && y<(posy + size());
  }
  
}
