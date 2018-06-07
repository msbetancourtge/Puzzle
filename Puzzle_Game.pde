Puzzle[] levels;
int total, current;
//PImage img;
//Piece[][] piezas;
int ss = 95; 
int se = ss+4;
String state;

void setup() {

  size(1200, 750);
  frameRate(30);
  String[] names = new String[4];
  names[0] = "Data/test1.png";
  names[1] = "Data/test2.png";
  names[2] = "Data/test3.png";
  names[3] = "Data/test4.png";
  
  
  total = names.length;
  levels = new Puzzle[total];
  for (int i = 0; i < levels.length; i++){
    String temp = names[i];
    levels[i] = new Puzzle(temp);
  }
}




void draw() {
 

  
  menu();
  
  if(state == "Puzzle"){
    playPuzzle();
  }
}

void menu(){
  
  background(255);
  Button puzzle = new Button("Jugar", 500, 400);
  puzzle.display();
  if(puzzle.clicked())
  state="Puzzle";
}

void playPuzzle(){
    levels[current].display();
  levels[current].update();
  if(levels[current].sig.clicked())
  current = current < total-1 ? current+1 : 0;
}
