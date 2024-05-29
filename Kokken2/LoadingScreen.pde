class LoadingScreen {
  PImage font1;
  float fontx;
  float fonty;
  float xVelo;
  int frames;
  int fontsizex;
  int fontsizey;

  LoadingScreen () {
    this.fontx = width/2;
    this.fonty = height/2;
    this.xVelo = 10;
    this.frames = 0;
    this.fontsizex = width/6*3;
    this.fontsizey = height/6*2;
    font1 = loadImage("LoadingScreenFont1.png");
  }
  void display() {
    background (30);
    imageMode (CENTER);
    font1.resize (fontsizex, fontsizey);
    image(font1, fontx, fonty);
  }
  
  void update() {
    fontx = fontx + xVelo;
    frames = frames + 2;
    //shaking
    if (fontx< fontx+10) {
      xVelo = -xVelo;
    }
    //stop shaking
    if (frames == 120) {
      fontsizex = width/6*4;
      fontsizey = height/6*3;
    }
    if (frames == 240) {
      fontsizex = width/6*5;
      fontsizey = height/6*4;
    }
    if (frames == 300) {
      fontsizex = width/6*5;
      fontsizey = height/6*4;
      //frames = 0;
      frames = frames + 0;
      fontx = width/2+10;
      xVelo = 0;
      progState = 10;
    }
  }
}
