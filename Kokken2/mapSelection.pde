class mapSelection {
  int mx; //map x
  int my; //map y
  int hx; //highlight x
  int hy; //highlight y
  float ho; //highlight o
  float eo; //exit opacity
  int ey; //exit y
  PImage stage1;
  PImage stage2;
  PImage stage3;
  PImage stage4;
  PImage stage1b;
  PImage stage2b;
  PImage stage3b;
  PImage stage4b;
  int selectedStage;

  mapSelection() {
    mx = width;
    my = height;
    hx = mx*1/5;
    hy = my*3/6;
    ho = 255;
    ey = my*5/6;
    eo = 173;
    stage1 = loadImage ("Stage1.png");
    stage2 = loadImage ("Stage2.png");
    stage3 = loadImage ("Stage3.png");
    stage4 = loadImage ("Stage4.png");
    stage1b = loadImage ("Stage1.png");
    stage2b = loadImage ("Stage2.png");
    stage3b = loadImage ("Stage3.png");
    stage4b = loadImage ("Stage4.png");
    selectedStage = int(random(1,5));
  }

  void display() {
    background (30);
    fill (255);
    textSize (width/20);
    text ("CHOOSE YOUR MAP", width/2, my*2/6-150);
    //highlight box
    noStroke();
    fill (255, ho);
    rectMode (CENTER);
    rect (hx, hy, width/6+10, height/7+10);
    //map choice
    imageMode (CENTER);
    stage1.resize (width/6, height/7);
    image (stage1, mx*1/5, my*3/6);
    stage2.resize (width/6, height/7);
    image (stage2, mx*2/5, my*3/6);
    stage3.resize (width/6, height/7);
    image (stage3, mx*3/5, my*3/6);
    stage4.resize (width/6, height/7);
    image (stage4, mx*4/5, my*3/6);
    //random map
    rectMode(CENTER);
    fill (90);
    rect (mx/2, my*4/6, width/6, height/7);
    fill (255);
    textSize (90);
    textMode (CENTER);
    text ("?", mx/2, my*4/6+25);
    //larger background
    if (hx == mx*1/5) {
      stage1b.resize (width/2, height/3);
      image (stage1b, mx/2, my*2/6-150);
      selectedStage = 1;
    }
    if (hx == mx*2/5) {
      stage2b.resize (width/2, height/3);
      image (stage2b, mx/2, my*2/6-150);
      selectedStage = 2;
    }
    if (hx == mx*3/5) {
      stage3b.resize (width/2, height/3);
      image (stage3b, mx/2, my*2/6-150);
      selectedStage = 3;
    }
    if (hx == mx*4/5) {
      stage4b.resize (width/2, height/3);
      image (stage4b, mx/2, my*2/6-150);
      selectedStage = 4;
    }
    if (hy == my*4/6) {
      fill (90);
      rect (mx/2, my*2/6-150, width/2, height/3);
      fill (255);
      textSize (180);
      textMode (CENTER);
      text ("?", mx/2, my*2/6-175);
    }
    ////map name
    //fill (90);
    //rect (mx, my-110, width/2, 40);
    //fill (250);
    //textSize (60);
    //text ("Map", mx/2-250, my*1/6);
    //text ("Select", mx/2-200, my-230);
    textSize (25);
    textMode (CENTER);
    fill (255, eo);
    text ("Exit", width/2, ey);
    //println(selectedStage);
  }

  void update() {
    //opacity
    if (hy == my*5/6) {
      eo = 255;
      ho = 0;
    } else {
      eo = 173;
      ho = 255;
    }
    if (hy == my*2/6) {
      ho = 0;
    }
  }

  void keyPressed() {
    if (key == 'd') {
      if (hy == my*3/6) {
        hx = hx + mx*1/5;
        if (hx > mx*4/5) {
          hx = mx*1/5;
        }
      }
      if (hy == my*4/6) {
        hy = my*3/6;
        hx = mx*4/5;
      }
    }
    if (key == 'a') {
      if (hy == my*3/6) {
        hx = hx - mx*1/5;
        if (hx < mx*1/5) {
          hx = mx*4/5;
        }
      }
      if (hy == my*4/6) {
        hy = my*3/6;
        hx = mx*1/5;
      }
    }
    if (key == 's') {
      hy = hy+my*1/6;
      if (hy == my*4/6) {
        hx = mx/2;
      }
      if (hy == my*5/6) {
        ho = 0;
      }
      if (hy == my*6/6) {
        hy = my*3/6;
        hx = mx*1/5;
      }
    }
    if (key == 'w') {
      hy = hy-(my*1/6);
      if (hy == my*4/6) {
        hx = mx*1/5;
      }
      if (hy == my*2/6) {
        hy = my*5/6;
        hx = mx/2;
        ho = 0;
      }
      if (hy == my*3/6) {
        hx = mx*1/5;
      }
      if (hy == my*4/6) {
        hx = mx/2;
      }
    }
    if (key == 'z') {
      if (progState == 7) {
        if (hy == my*5/6) {
          progState = 6;
          vb.hy = -265;
        }
        if (hx == mx*1/5 || hx == mx*2/5 || hx == mx*3/5 || hx == mx*4/5 || hy == my*3/6 && hy != my*5/6) {
          progState = 10;
        } else if (hx == mx/2 || hy == my*4/6) {
          progState = 10;
        }
      }
    }
  }

  void mousePressed() {
    if (hy == my*5/6) {
      progState = 6;
      vb.hy = -265;
    }
    if (hx == mx*1/5 || hx == mx*2/5 || hx == mx*3/5 || hx == mx*4/5 || hy == my*3/6 && hy != my*5/6) {
      progState = 10;
    }
    if (hx == mx/2 || hy == my*4/6) {
      progState = 10;
    }
  }
}
