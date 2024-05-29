class VersusBattle {
  PImage VersusBattle;
  int ox;
  int oy;
  int hx;
  int hy;
  PImage LeftArrow;
  PImage RightArrow;
  PImage menu;
  PImage menus[];
  //highlight opacity
  int mtopacity; //play game opacity
  int nropacity; //options opacity
  int scopacity; //updates opacity
  int bopacity; //credits opacity
  //Versus Battle Settingss
  int mtx; //match type x
  int rx; //number of round x
  int roundCount;

  VersusBattle() {
    //VersusBattle = loadImage ("boxing_gloves_background.jpg");
    ox = width/4-50;
    oy = height/2-100;
    hx = 200;
    hy = -265;
    LeftArrow = loadImage ("LeftArrow.png");
    RightArrow = loadImage ("RightArrow.png");
    //highlight opacity
    mtopacity = 173;
    nropacity = 173;
    scopacity = 173;
    bopacity = 173;
    mtx = width/2;
    rx = width/2;
    //background
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
    imageMode (CORNER);
    image (menu, 0, 0);
    fill (0, 0, 255, 40); //blue tint on title screen
    rect (0, 0, width, height);
    fill (#1E90FF, 160);
    rectMode (CENTER);
    rect (width/2, height/2-50, width, 400);
    textAlign (CENTER);
    fill (250);
    textSize (45);
    text ("Versus Battle Settings", width/2, oy-75);
    text ("Versus Battle Settings", width/2-1, oy-75);
    textAlign (CORNER);
    textSize (25);
    fill (250, mtopacity);
    text ("Match Type", ox, oy);
    text ("Single Match", mtx, oy);
    text ("Team Match", mtx+2000, oy);
    fill (250, nropacity);
    text ("No. Rounds", ox, oy+50);
    text ("1", rx, oy+50);
    text ("3", rx+2000, oy+50);
    fill (250, scopacity);
    text ("Settings Complete", ox, oy+150);
    fill (250, bopacity);
    text ("Back", ox, oy+200);
    //description text
    rectMode (CORNER);
    noStroke();
    fill (#1E90FF, 160);
    rect (0, mm.dy, width, 50);
    //highlight box
    noFill();
    rect (hx, hy, 125, 50);
    //descriptions
    fill (250);
    textAlign (CENTER);
    if (hy == oy && mtx == width/2) {
      text ("In this mode, you fight one on one.", width/2, mm.dy+32);
    }
    if (hy == oy && mtx == width/2-2000) {
      text ("In this mode, you fight in teams of two.", width/2, mm.dy+32);
    }
    if (hy == oy+50 && rx == width/2) {
      text ("This lets you fight a battle with only one round.", width/2, mm.dy+32);
      roundCount = 1;
    }
    if (hy == oy+50 && rx == width/2-2000) {
      text ("This will let you fight in a best out of three battle.", width/2, mm.dy+32);
      roundCount = 2;
    }
    if (hy == oy+150 && rx == width/2) {
      text ("Confirm the fight settings here.", width/2, mm.dy+32);
    }
    if (hy == oy+200) {
      text ("Return to the previous screen.", width/2, mm.dy+32);
    }

    //Arrow consistency
    //if (mtx == width/2) {
    //  image (RightArrow, width/2+140, oy-20, 25, 25);
    //}
    //if (mtx == width/2-2000) {
    //  image (LeftArrow, width/2-30, oy-20, 25, 25);
    //}
    if (rx == width/2) {
      image (RightArrow, width/2+20, oy+30, 25, 25);
    }
    if (rx == width/2-2000) {
      image (LeftArrow, width/2-35, oy+30, 25, 25);
      //image (RightArrow, width/2+20, 330, 25, 25);
    }
    if (rx == width/2-3000) {
      image (LeftArrow, width/2-35, oy+30, 25, 25);
    }
  }

  void update() {
    if (hy == height/2-100) {
      mtopacity = 250;
    } else {
      mtopacity = 173;
    }
    if (hy == height/2-50) {
      nropacity = 250;
    } else {
      nropacity = 173;
    }
    if (hy == height/2+50) {
      scopacity = 250;
    } else {
      scopacity = 173;
    }
    if (hy == height/2+100) {
      bopacity = 250;
    } else {
      bopacity = 173;
    }
  }

  void keyPressed() {
    if (progState == 6) {
      //if (hy == height/2-100) {
      //  if (key == 'a') {
      //    mtx = width/2;
      //  }
      //  if (key == 'd') {
      //    mtx = width/2-2000;
      //  }
      //}
      if (hy == height/2-50) {
        if (key == 'a') {
          if (rx == width/2) {
            rx = width/2;
          }
          if (rx == width/2-2000) {
            rx = width/2;
          }
          if (rx == width/2-3000) {
            rx = width/2-2000;
          }
        }
        if (key == 'd') {
          if (rx == width/2) {
            rx = width/2-2000;
          }
        }
      }

      if (key == 's') {
        hy = hy + 50;
        if (hy < 0) {
          hy = height/2-100;
        }
        if (hy == height/2+150) {
          hy = height/2-100;
        }
        if (hy == height/2+150) {
          hy = height/2+100;
        }
      }

      if (key == 'w') {
        hy = hy - 50;
        if (hy < 0) {
          hy = height/2-100;
        }
        if (hy == height/2-150) {
          hy = height/2+100;
        }
        if (hy == height/2) {
          hy = height/2-50;
        }
      }
      if (key == 'z') {
        if (hy == height/2+50) {
          progState = 7;
          cs.ready = 0;
        }
      }
    }
  }

  void mousePressed() {
    if (hy == height/2+50) {
      progState = 7;
      cs.ready = 0;
    }
  }
}
