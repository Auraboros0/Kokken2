class MainMenu {
  int ox;
  int oy;
  int hx;
  int hy;
  int dy;
  int stageChoice;
  PImage menu;
  PImage menus[];

  //highlight opacity
  int pgopacity;
  int oopacity;
  int uopacity;
  int copacity;
  int eopacity;

  MainMenu() {
    stageChoice = int(random(0, 5));
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
    menu = menus[stageChoice];

    ox = width/4-100;
    oy = height/2-100;
    hx = 200;
    hy = -265;
    dy = -265;
    //highlight opacity
    pgopacity = 173;
    oopacity = 173;
    uopacity = 173;
    copacity = 173;
    eopacity = 173;
  }

  void display () {
    imageMode (CORNER);
    image (menu, 0, 0);
    fill (0, 0, 255, 40); //blue tint on title screen
    rect (0, 0, width, height);
    //image (GloveIcon, hx-55, hy, 50, 50);
    textAlign (CORNER);
    fill (250);
    textSize (35);
    text ("Main Menu", ox-40, oy-55);
    text ("Main Menu", ox-41, oy-55);
    //line
    stroke (250, 75);
    strokeWeight (3);
    line (ox+140, oy-100, ox+140, oy+240);
    textSize (25);
    fill (250, pgopacity);
    text ("Play Game", ox+5, oy);
    fill (250, oopacity);
    text ("Options", ox+33, oy+50);
    fill (250, uopacity);
    text ("Updates", ox+28, oy+100);
    fill (250, copacity);
    text ("Credits", ox+41, oy+150);
    fill (250, eopacity);
    text ("Exit", ox+73, oy+200);
    //description text
    rectMode (CORNER);
    noStroke();
    fill (#1E90FF, 160);
    rect (0, dy, width, 50);
    //highlight box
    noFill();
    rect (hx, hy, 125, 50);
    //descriptions
    fill (250);
    textAlign (CENTER);
    if (hy == height/2-100) {
      text ("Get right into the fight with various game modes.", width/2, dy+32);
    }
    if (hy == height/2-50) {
      text ("View controls and adjust settings for volume.", width/2, dy+32);
    }
    if (hy == height/2) {
      text ("Updates and news.", width/2, dy+32);
    }
    if (hy == height/2+50) {
      text ("People who worked on the game.", width/2, dy+32);
    }
    if (hy == height/2+100) {
      text ("Return to the title screen.", width/2, dy+32);
    }
  }

  void update() {
    if (hy == height/2-100) {
      pgopacity = 250;
      dy = height-150;
    } else {
      pgopacity = 173;
      dy = height-150;
    }
    if (hy == height/2-50) {
      oopacity = 250;
      dy = height-150;
    } else {
      oopacity = 173;
      dy = height-150;
    }
    if (hy == height/2) {
      uopacity = 250;
      dy = height-150;
    } else {
      uopacity = 173;
      dy = height-150;
    }
    if (hy == height/2+50) {
      copacity = 250;
      dy = height-150;
    } else {
      copacity = 173;
      dy = height-150;
    }
    if (hy == height/2+100) {
      eopacity = 250;
      dy = height-150;
    } else {
      eopacity = 173;
      dy = height-150;
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
  }
}
