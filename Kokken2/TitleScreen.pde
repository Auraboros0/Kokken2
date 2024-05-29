class TitleScreen {
  PImage Title;
  float time;
  int blink;
  int titleSize;
  float subtitleSize;
  Gif myAnimation;
  PFont DemoGrunge;

  TitleScreen() {
    //Title = loadImage ("StartupScreen1.gif");
    menuMusic = int(random(1, 5));
    myAnimation = new Gif(Kokken2.this, "StartupScreen1.gif");
    myAnimation.play();
    time = 0;
    blink = 200;
    titleSize = width/15;
    subtitleSize = width/60;
    DemoGrunge = createFont("DemoGrunge.ttf", width/15);
  }

  void display () {
    imageMode (CORNER);
    image (myAnimation, 0, 0, width, height);
    fill (0, 0, 255, 40); //blue tint on title screen
    rect (0, 0, width, height);
    fill (250);
    textAlign (CENTER);
    textSize (titleSize);
    //textFont(DemoGrunge);
    text ("KOKKEN: REBIRTH", width/2, height/2+20);
    fill (250);
    text ("KOKKEN: REBIRTH", width/2+2, height/2+20);
    textSize (subtitleSize);
    fill (250, blink);
    text ("PRESS ANY BUTTON", width/2, height/2+95);
  }

  void update () {
    //enlargen
    //time = time + 1;
    //if (time>70) {
    //  time = 0;
    //  subtitleSize = 30;
    //}
    //if (time<25){
    //  subtitleSize = subtitleSize + 0.3;
    //}
    //if (time>35){
    // subtitleSize = subtitleSize - 0.3;
    //}

    //blink
    time = time +1;
    if (time>80) {
      time = 0;
      blink = 250;
    }
    if (time<35) {
      blink = blink - 10;
    }
    if (time>40) {
      blink = blink + 8;
    }
  }

  void keyPressed() {
    if (progState == 0) {
      progState = 1;
    }
  }

  void mousePressed() {
    if (progState == 0) {
      progState = 1;
    }
  }
}
