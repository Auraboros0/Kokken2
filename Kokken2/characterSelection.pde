class characterSelection {
  int g1;
  int g2;
  int Y_AXIS = 1;
  int hx;
  int hy;
  int ho;
  int hx2;
  int hy2;
  int ho2;
  float eo;
  int ey;
  int ax;
  int ay;
  PImage JinIcon;
  PImage BobbyIcon;
  PImage GuileIcon;
  int characterSelect1;
  int characterSelect2;
  int ready;
  Animations animations;
  Animations animations2;
  PImage stage1;
  PImage stage2;
  PImage stage3;
  PImage stage4;

  characterSelection() {
    g1 = color(0); //gradient color 1
    g2 = color (#1E90FF); //gradient color 2
    JinIcon = loadImage ("JinIcon.png");
    BobbyIcon = loadImage ("BobbyIcon.png");
    GuileIcon = loadImage ("GuileIcon.png");
    hx = width/2-225;
    hy = height/2-145;
    ho2 = 255;
    hx2 = width/2-225;
    hy2 = height/2-145;
    ho = 255;
    eo = 173;
    ax = width/3;
    ay = height/3-120;
    ey = height/2+365;
    animations = new Animations();
    animations2 = new Animations();
    characterSelect1 = 0;
    ready = 0;
    stage1 = loadImage ("Stage1.png");
    stage2 = loadImage ("Stage2.png");
    stage3 = loadImage ("Stage3.png");
    stage4 = loadImage ("Stage4.png");
  }

  void display() {
    //background
    //background (30);
    imageMode (CORNER);
    if (ms.hx == ms.mx - 400) {
      stage1.resize (width, height);
      image (stage1, 0, 0);
    }
    if (ms.hx == ms.mx - 133) {
      stage2.resize (width, height+10);
      image (stage2, 0, 0);
    }
    if (ms.hx == ms.mx + 134) {
      stage3.resize (width, height);
      image (stage3, 0, 0);
    }
    if (ms.hx == ms.mx + 401) {
      stage4.resize (width, height);
      image (stage4, 0, 0);
    }
    rectMode (CORNER);
    fill (0, 120);
    rect (0, 0, width, height);
    textSize (width/20);
    fill (255);
    textAlign(CENTER);
    text ("PICK YOUR CHARACTER", width/2, height/5);
    //character icons
    fill (255, ho);
    noStroke();
    imageMode (CORNER);
    rectMode (CORNER);
    rect (hx-5, hy-5, 210, 130);
    fill (#1E90FF, ho2);
    rect (hx2-5, hy2-5, 210, 130);
    setGradient(width/2-225, height/2-145, 199, 120, g1, g2, Y_AXIS);
    image (JinIcon, width/2-225, height/2-145, 200, 121);
    setGradient(width/2+25, height/2-145, 199, 120, g1, g2, Y_AXIS);
    image (BobbyIcon, width/2+25, height/2-145, 200, 121);
    setGradient(width/2-225, height/2+25, 199, 120, g1, g2, Y_AXIS);
    image (GuileIcon, width/2-225, height/2+25, 200, 121);
    setGradient(width/2+25, height/2+25, 199, 120, g1, g2, Y_AXIS);
    //exit
    textSize (25);
    textMode (CENTER);
    fill (255, eo);
    text ("Back", width/2, ey);
    //character preview
    scale(width/750, height/700);
    imageMode (CENTER);
    //player1
    if (characterSelect1 == 1) {
      println ("show");
      animations.setAnimation(0);
      animations.display(ax*1/5, ay, false);
      //name?
      //fill (255);
      //textSize (40);
      //text ("Jin", width/2-415, height/2);
    }
    if (characterSelect1 == 2) {
      animations.setAnimation(20);
      animations.display(ax*1/5, ay, false);
    }
    if (characterSelect1 == 3) {
      animations.setAnimation(100);
      animations.display(ax*1/5, ay, false);
    }
    //player2
    if (characterSelect2 == 1) {
      animations2.setAnimation(0);
      animations2.display(ax*4/5, ay, true);
    }
    if (characterSelect2 == 2) {
      animations2.setAnimation(20);
      animations2.display(ax*4/5, ay, true);
    }
    if (characterSelect2 == 3) {
      animations2.setAnimation(100);
      animations2.display(ax*4/5, ay, true);
    }
    //confirmation
    textMode (CENTER);
    textSize (width/17);
    fill (255);
    if (ready == 1) {
      text ("Ready?", width/2, height/2+250);
    }
    if (ready == 2) {
      text ("Ready!", width/2, height/2+250);
    }
  }

  void setGradient(int x, int y, float w, float h, color g1, color g2, int axis ) {
    noFill();
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(g1, g2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }
  }

  void update() {
    //opacity
    if (hy == ey) {
      eo = 255;
      ho = 0;
    } else {
      eo = 173;
      ho = 255;
    }
    if (hy2 == ey) {
      eo = 255;
      ho2 = 0;
    } else {
      eo = 173;
      ho2 = 255;
    }
    //character preview highlight box
    //player 1
    if (hx == width/2-225 && hy == height/2-145) {
      characterSelect1 = 1;
    }
    if (hx == width/2+25 && hy == height/2-145) {
      characterSelect1 = 2;
    }
    if (hx == width/2-225 && hy == height/2+25) {
      characterSelect1 = 3;
    }
    //player 2
    if (hx2 == width/2-225 && hy2 == height/2-145) {
      characterSelect2 = 1;
    }
    if (hx2 == width/2+25 && hy2 == height/2-145) {
      characterSelect2 = 2;
    }
    if (hx2 == width/2-225 && hy2 == height/2+25) {
      characterSelect2 = 3;
    }
  }

  void keyPressed() {
    //player 1
    if (key == 'd') {
      hx = hx + 250;
      if (hx == width/2+275) {
        hx = width/2-225;
      }
    }
    if (key == 'a') {
      hx = hx - 250;
      if (hx == width/2-475) {
        hx = width/2+25;
      }
    }
    if (key == 'w') {
      hy = hy - 170;
      if (hy == height/2-315) {
        hy = height/2+365;
      }
      if (hy == height/2+195) {
        hy = height/2+25;
        ho = 0;
      }
    }
    if (key == 's') {
      hy = hy + 170;
      if (hy == height/2+195) {
        hy = height/2+365;
      }
      if (hy == height/2+535) {
        hy = height/2-145;
        ho = 0;
      }
    }
    //player 2
    if (key == 'l') {
      hx2 = hx2 + 250;
      if (hx2 == width/2+275) {
        hx2 = width/2-225;
      }
    }
    if (key == 'j') {
      hx2 = hx2 - 250;
      if (hx2 == width/2-475) {
        hx2 = width/2+25;
      }
    }
    if (key == 'i') {
      hy2 = hy2 - 170;
      if (hy2 == height/2-315) {
        hy2 = height/2+365;
      }
      if (hy2 == height/2+195) {
        hy2 = height/2+25;
        ho2 = 0;
      }
    }
    if (key == 'k') {
      hy2 = hy2 + 170;
      if (hy2 == height/2+195) {
        hy2 = height/2+365;
      }
      if (hy2 == height/2+535) {
        hy2 = height/2-145;
        ho2 = 0;
      }
    }
    if (key == 'z') {
      ready = ready +1;
      if (ready > 2 && characterSelect1 == 1 || characterSelect1 == 2 || characterSelect1 == 3) {
        if (characterSelect2 == 1|| characterSelect2 == 2|| characterSelect2 == 3) {
          progState = 9;
        }
      }
      if (hy == ey || hy2 == ey) {
        progState = 7;
        ready = 0;
        hy = height/2-145;
      }
    }
  }

  void mousePressed() {
    ready = ready +1;
    if (ready > 2 && characterSelect1 == 1 || characterSelect1 == 2 || characterSelect1 == 3) {
      if (characterSelect2 == 1|| characterSelect2 == 2|| characterSelect2 == 3) {
        progState = 9;
      }
    }
    if (hy == ey || hy2 == ey) {
      progState = 7;
      ready = 0;
      hy = height/2-145;
    }
  }
}
