class Puzzle {
  // 1. Attributes
  Piece[][] piezas;
  Piece[][] soluc;
  Piece[][] grid;
  Button sig = new Button();
  PImage img;
  int n, m, a, b, finish, aux;
  int X, Y;
  private boolean drgin;
  //private boolean done;
  
  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  
  Puzzle() {
    super();
  }

  // 2.2. Main constructor

  Puzzle( String path) {
    img = loadImage(path);
    a = img.width/2;
    b = img.height/2;
    n = img.width/ss;
    m = img.height/ss;
    finish = m*n;
    aux = 0;
    Y=0;
    piezas = new Piece[m][n];
    soluc = new Piece[m][n];
    grid = new Piece[m][n];
    
    for (int i=0; i<m; i++) {
      X=0;
      for (int j=0; j<n/2; j++) {
        piezas[i][j] = new Image (img.get(X, Y, ss, ss), ss, 350 + se*i, 20 + se*j);
        X=X+ss;
      }
      for (int j=n/2; j<n; j++) {
        piezas[i][j] = new Image(img.get(X, Y, ss, ss), ss,((m*se)+ 350 + se*i), 20 + se*(j-(n/2)));
        X=X+ss;
      }
      Y=Y+ss;
    }
    
    Y=0;
    for (int i=0; i<m; i++) {
      X=0;
      for (int j=0; j<n; j++) {
        if (n%2==0){
        soluc[i][j] = new Image (img.get(X, Y, ss, ss), ss, 350 + (ss * j), ((n/2)*se) + 35 + (ss * i));
        grid[i][j] = new Rectangle(ss, 350 + (ss * j), ((n/2)*se) + 35 + (ss * i));
        }else{
        soluc[i][j] = new Image (img.get(X, Y, ss, ss), ss, 350 + (ss * j), ((n/2)*se)+ se + 25 + (ss * i));
        grid[i][j] = new Rectangle (ss, 350 + (ss * j), ((n/2)*se)+ se + 25 + (ss * i));
        }
        X=X+ss;
      }
      Y=Y+ss;
    }
  }

  void display() {
    pushStyle();
    img.resize(a, b);
    background(255);
    image(img, 20, 20);
    
    for (int i=0; i<m; i++) {
      for (int j=0; j<n; j++) {
        //soluc[i][j].display();
        grid[i][j].display();
        piezas[i][j].display();
      }
    }
    popStyle();
    sig.display();
  }

  void update()
  {
    boolean pDragging = false;
    
    for (int i=0; i<m; i++) {
      for (int j=0; j<n; j++) {
      piezas[i][j].update(drgin);
      if (piezas[i][j].isDragged())
      {
        pDragging = true;
        if (!drgin)
        {
          drgin = true;
        }
        piezas[i][j].move();
        if(piezas[i][j].posiX<(grid[i][j].posiX + grid[i][j].size) 
        && piezas[i][j].posiY<(grid[i][j].posiY + grid[i][j].size) 
        && piezas[i][j].posiX>(grid[i][j].posiX - grid[i][j].size) 
        && piezas[i][j].posiY>(grid[i][j].posiY - grid[i][j].size)){
        piezas[i][j].posiX = grid[i][j].posiX;
        piezas[i][j].posiY = grid[i][j].posiY;
      }
      }
      piezas[i][j].display();
      //done = compare(piezas[i][j], soluc[i][j]);
    }
    }
    drgin = pDragging;
  }
  
  //boolean compare(Piece a, Piece b){
  //  if (a.img==b.img){
  //    aux++;
  //    if (aux==finish)
  //    return true;
  //  }
  //  return false;
  //}
  
}
