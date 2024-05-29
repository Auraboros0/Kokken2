class Credits {
  int cx; //credits x
  int cy; //credits y
  int ts; //title size
  int ns; //name size
  int hy; // highlight y
  int eo; //exit opacity

  Credits() {
    cx = width/2-150;
    cy = height/2-200;
    ts = width/60;
    ns = width/40;
    hy = 0;
    eo = 173;
  }

  void display () {
    background (0);
    textAlign (CENTER);
    textSize (60);
    text ("Kokken: Rebirth", cx+150, cy);
    text ("Kokken: Rebirth", cx+152, cy);
    //titles
    textAlign (CORNER);
    textSize (ts);
    fill (#1E90FF);
    text ("Programming", cx-275, cy+100);
    text ("Art", cx-275, cy+275);
    text ("Music", cx+50, cy+100);
    text ("Honorable Mentions", cx+50, cy+225);
    text ("Sprite Credits", cx+375, cy+100);
    textAlign (CENTER);
    fill (255, eo);
    text ("Exit", width/2, cy+500);
    //names
    textAlign (CORNER);
    textSize (ns);
    fill (255, 180);
    text ("Joaquin Herrera", cx-275, cy+150);
    text ("Cameron Sanders", cx-275, cy+200);
    text ("Randee Jr. Haynes", cx-275, cy+325);
    text ("Cameron Sanders", cx-275, cy+375);
    text ("Marquel Riggins", cx-275, cy+425);
    text ("Randee Jr. Haynes", cx+50, cy+150);
    text ("David Zeigler", cx+50, cy+275);
    text ("Jode Redding", cx+50, cy+325);
    text ("Quincy Stockard", cx+50, cy+375);
    text ("Keith Van Rhein", cx+50, cy+425);
    text ("Konami", cx+375, cy+150);
    text ("Capcom", cx+375, cy+200);
    text ("SNK", cx+375, cy+250);
    noFill();
    rectMode (CENTER);
    rect (0, hy, width, 50);
  }

  void update () {
    if (hy == cy + 500) {
      eo = 255;
    }
    if (hy == 0) {
      eo =  173;
    }
  }

  void keyPressed() {
    if (key == 's' || key == 'w' && hy == 0) {
      hy = cy+500;
    } else if (key == 's' || key == 'w' && hy == cy+500) {
      hy = 0;
    }
    if (hy == cy+500 && key == 'z') {
      progState = 1;
      eo = 173;
    }
  }

  void mousePressed() {
    if (progState == 4) {
      if (hy == cy+500) {
        progState = 1;
        eo = 173;
      }
    }
  }
}
