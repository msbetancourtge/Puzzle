class Button {
  String text;
  int posX, posY;

  Button() {
    setText("Next");
    setPosX(1000);
    setPosY(650);
  }

  Button(String content, int posiX, int posiY) {
    setText(content);
    setPosX(posiX);
    setPosY(posiY);
  }

  void display() {
    pushStyle();
    rect(posX, posY, 180, 50);
    //textAlign(CENTER);
    textSize(18);
    fill(0, 200, 50);
    text(text, posX+70, posY+30);
    popStyle();
  }

  boolean clicked() {
    if (mousePressed) {
      if (mouseX<posX + 180 
        && mouseY<posY + 50
        && mouseX>posX
        && mouseY>posY) {
          return true;
      }
    }
    return false;
  }


  void setText(String content) {
    text = content;
  }
  void setPosX(int px) {
    posX = px;
  }
  void setPosY(int py) {
    posY = py;
  }


  int posX() {
    return posX;
  }
  int posY() {
    return posY;
  }
}
