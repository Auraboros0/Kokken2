class PlayGame {
  PImage PlayGame;
  PImage menu;
  int ox;
  int oy;
  int hx;
  int hy;
  int stageChoice;
  //highlight opacity
  int vbopacity; //versus battle opacity
  int topacity; //tournament opacity
  int popacity; //practice opacity
  int bopacity; //back opacity
  int eopacity; //exit opacity
  PImage menus[];

  PlayGame() {
    ox = width/4-100;
    oy = height/2-100;
    hx = 170;
    hy = -265;
    //highlight opacity
    vbopacity = 173;
    topacity = 173;
    popacity = 173;
    bopacity = 173;
    eopacity = 173;
    //backgrounds
    menus = new PImage[7];
    menus = new PImage[7];
    menus[0] = loadImage ("MainMenu1.jpg");
    menus[0].resize (width, height);
    menus[1] = loadImage ("MainMenu2.jpg");
    menus[1].resize (width, height);
    menus[2] = loadImage ("MainMenu3.jpg");
    menus[2].resize (width, height);
    menus[3] = loadImage ("MainMenu5.jpg");
    menus[3].resize (width, height);
    menus[4] = loadImage ("MainMenu6.jpg");
    menus[4].resize (width, height);
    menus[5] = loadImage ("MainMenu7.jpg");
    menus[5].resize (width, height);
    menu = menus[mm.stageChoice];
  }

  void display () {
    //background
    imageMode (CORNER);
    image (menu, 0, 0);
    fill (0, 0, 255, 40); //blue tint on title screen
    rect (0, 0, width, height);
    textAlign (CORNER);
    fill (250);
    textSize (35);
    text ("Play Game", ox-40, oy-55);
    text ("Play Game", ox-41, oy-55);
    //line
    stroke (250, 75);
    strokeWeight (3);
    line (ox+140, oy-100, ox+140, oy+240);
    textSize (25);
    fill (250, vbopacity);
    text ("Versus Battle", ox-21, oy);
    fill (250, topacity);
    text ("Tournament", ox-17, oy+50);
    fill (250, popacity);
    text ("Practice", ox+30, oy+100);
    fill (250, bopacity);
    text ("Back", ox+60, oy+150);
    fill (250, eopacity);
    text ("Exit", ox+73, oy+200);
    //description text
    rectMode (CORNER);
    noStroke();
    fill (#1E90FF, 160);
    rect (0, mm.dy, width, 50);
    //highlight box
    noFill();
    rect (hx, hy, 155, 50);
    //descriptions
    fill (250);
    textAlign (CENTER);
    if (hy == height/2-100) {
      text ("Enjoy 1 on 1 battles with settings tweaked to your liking.", width/2, mm.dy+32);
    }
    if (hy == height/2-50) {
      text ("Fight battles in a 4-8 player tournament.", width/2, mm.dy+32);
    }
    if (hy == height/2) {
      text ("Try out different characters while learning new combos.", width/2, mm.dy+32);
    }
    if (hy == height/2+50) {
      text ("Return to the previous screen.", width/2, mm.dy+32);
    }
    if (hy == height/2+100) {
      text ("Return to the title screen.", width/2, mm.dy+32);
    }
  }

  void update() {
    if (hy == height/2-100) {
      vbopacity = 250;
    } else {
      vbopacity = 173;
    }
    if (hy == height/2-50) {
      topacity = 250;
    } else {
      topacity = 173;
    }
    if (hy == height/2) {
      popacity = 250;
    } else {
      popacity = 173;
    }
    if (hy == height/2+50) {
      bopacity = 250;
    } else {
      bopacity = 173;
    }
    if (hy == height/2+100) {
      eopacity = 250;
    } else {
      eopacity = 173;
    }
  }

  void keyPressed() {
    if (key == 's') {
      hy = hy + 50;
      if (hy < 0) {
        hy = height/2-100;
      }
      if (hy == height/2+150) {
        hy = height/2-100;
      }
    }
    if (key == 'w') {
      hy = hy - 50;
      if (hy < 0) {
        hy = height/2+100;
      }
      if (hy == height/2-150) {
        hy = height/2+100;
      }
    }
    if (key == 'z') {
      if (hy == height/2+50) {
        progState = 1;
        hy = -265;
      }
      if (hy == height/2+100) {
        progState = 0;
        hy = -265;
      }
    }
  }

  void mousePressed() {
    if (hy == height/2+50) {
      progState = 1;
      hy = -265;
    }
    if (hy == height/2+100) {
      progState = 0;
      hy = -265;
    }
  }
}
