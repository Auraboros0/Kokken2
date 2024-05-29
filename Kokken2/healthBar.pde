class healthBar {
  float dmg;
  float dmg2;
  int c;
  int c2;
  int p1wincolor1;
  int p1wincolor2;
  int p2wincolor1;
  int p2wincolor2;
  int p1wincount;
  int p2wincount;
  int time;
  int seconds;
  int p1HP;
  int p2HP;
  boolean active;
  PImage JinIcon;
  PImage BobbyIcon;
  PImage GuileIcon;
  healthBar (float dmg, int c, int p1HP, int p2HP) {
    this.p1wincolor1 = (0);
    this.p1wincolor2 = (0);
    this.p2wincolor1 = (0);
    this.p2wincolor2 = (0);
    this.p1wincount = 0;
    this.p2wincount = 0;
    this.dmg = dmg;
    this.dmg2 = dmg2;
    this.c = #CD5C5C;
    this.c2 = #CD5C5C;
    this.time = 120;
    this.seconds = 0;
    this.p1HP = p1HP;
    this.p2HP = p2HP;
    this.active = true;
    this.JinIcon = loadImage ("JinIcon.png");
    this.BobbyIcon = loadImage ("BobbyIcon.png");
    this.GuileIcon = loadImage ("GuileIcon.png");
  }

  void display(int p1HP, int p2HP) {
    push();
    translate (x, y);
    //JinIcon.resize (180, 140);
    //BobbyIcon.resize (180, 140);
    dmg = (width/3.1)*p1HP/100;
    dmg2 = (width/3.1)*p2HP/100;
    if (dmg <= 0) {
      dmg = 0;
      if (active == true) {
        p2wincount++;
        active = false;
      }
    }
    if (dmg2 <= 0) {
      dmg2 = 0;
      if (active == true) {
        p1wincount++;
        active = false;
      }
    }
    noStroke();
    fill (c);
    rect (width-(width-250), 50, dmg, 60);
    fill (c2);
    rect (width-width/2.5-100, 50, dmg2, 60);

    //Healthbar Outline
    noFill();
    stroke(0);
    strokeWeight(5);
    rect (width-(width-250), 48, width/3.1, 60);
    rect (width-width/2.5-100, 48, width/3.1, 60);
    //cooler rectangle
    //strokeWeight(6);
    //stroke(0);
    //fill (c);
    //quad (200, 48, dmg+250, 48, 250+dmg-65, 110, 200, 110);
    //fill (c2);
    //quad (width-200, 48, width-250-dmg2, 48, width-250-dmg2+65, 110, width-200, 110);

    //Healthbar Coloring 1
    if (dmg > 550) {
      c = #006400;
    }
    if (dmg <490) {
      c = #059b2c;
    }
    if (dmg < 390) {
      c = #e3a90c;
    }
    if (dmg < 225) {
      c = #d15707;
    }
    if (dmg < 200) {
      c = #d15707;
    }
    if (dmg < 125) {
      c = #b00500;
    }

    //Healthbar Coloring 2
    if (dmg2 > 550) {
      c2 = #006400;
    }
    if (dmg2 <490) {
      c2 = #059b2c;
    }
    if (dmg2 < 390) {
      c2 = #e3a90c;
    }
    if (dmg2 < 225) {
      c2 = #d15707;
    }
    if (dmg2 < 200) {
      c2 = #d15707;
    }
    if (dmg2 < 125) {
      c2 = #b00500;
    }

    //Round Wins
    stroke (0);
    strokeWeight (4);
    fill (p1wincolor1);
    ellipse (width/2-215, 135, 25, 25);
    fill (p1wincolor2);
    ellipse (width/2-255, 135, 25, 25);
    fill (p2wincolor1);
    ellipse (width/2+175, 135, 25, 25);
    fill (p2wincolor2);
    ellipse (width/2+215, 135, 25, 25);
    if (p1wincount == 1) {
      p1wincolor1 = #81d467;
    }
    if (p1wincount == 2) {
      p1wincolor2 = #81d467;
    }
    if (p2wincount == 1) {
      p2wincolor1 = #81d467;
    }
    if (p2wincount == 2) {
      p2wincolor2 = #81d467;
    }

    //Timer
    fill (250);
    textSize(100);
    textAlign(CENTER);
    text (time, width/2, 120);
    if (time <= 0) {
      if (dmg > dmg2 && active == true) {
        p1wincount++;
      } else if (dmg2 > dmg && active == true) {
        p2wincount++;
      }
      time = 0;
      active = false;
    }
    
   if (cs.characterSelect1 == 1) {
      image (JinIcon, 50, 50);
    }
    if (cs.characterSelect1 == 2) {
      image (BobbyIcon, 50, 50);
    }
    if (cs.characterSelect1 == 3) {
      image (GuileIcon, 50, 50);
    }
   if (cs.characterSelect2 == 1) {
      image (JinIcon, width-160, 50);
    }
    if (cs.characterSelect2 == 2) {
      image (BobbyIcon, width-160, 50);
    }
    if (cs.characterSelect2 == 3) {
      image (GuileIcon, width-160, 50);
    }
    pop ();
  }
  void update () {
    seconds = seconds + 1;
    if (seconds==60) {
      seconds = 0;
      time = time - 1;
    }
  }
}
