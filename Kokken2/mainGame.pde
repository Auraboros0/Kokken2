class mainGame {
  int a = 0;
  int charOneID = 0;
  int charTwoID;
  boolean roundActive;
  charBuilder CB;
  charBuilder CB2;


  hitbox [] hiB ;
  hurtbox [] huB;
  int hiBCount;
  int huBCount;
  int hiBCount2;
  int huBCount2;
  healthBar h;
  PImage bg;

  int c1;
  int c2;

  mainGame() {
    gameSetup();
    this.h = new healthBar(1, 1, CB.HP, CB2.HP);
  }

  void gameSetup() {
    // Object CB;
    //  if (charOneID == 0) {
    // charBuilder CB;
    this.roundActive = true;
    switch(ms.selectedStage) {
    case 1:
      this.bg = loadImage("Stage1.png");
      break;
    case 2:
      this.bg = loadImage("Stage2.png");
      break;
    case 3:
      this.bg = loadImage("Stage3.png");
      break;
    case 4:
      this.bg = loadImage("Stage4.png");
    }
    this.bg.resize(width, height);

    this.CB = new charBuilder(0);
    //  }
    this.CB2 = new charBuilder(1);
    this.hiB = new hitbox[100];
    this.huB = new hurtbox[100];
    this.hiBCount = 0;
    this.huBCount = 0;
    this.hiBCount2 = 50;
    this.huBCount2 = 50;
    this.c1 = 90;
    this.c2 = 90;
  }

  void gameDraw() {
    strokeWeight(0);
    background(0, a);
    imageMode(CORNER);
    image(bg, 0, 0);
    // used for testing frame data
    //fill(c1);
    //rect(0, 0, width/2, height);
    //fill(c2);
    //rect(width/2, 0, width/2, height);
    switch(ms.selectedStage) {
    case 1:
      if (!s1Music.isPlaying()) {
        s1Music.play();
      }
      break;
    case 2:
      if (!s2Music.isPlaying()) {
        s2Music.play();
      }
      break;
    case 3:
      if (!s3Music.isPlaying()) {
        s3Music.play();
      }
      break;
    case 4:
      if (!s4Music.isPlaying()) {
        s4Music.play();
      }
    }
    CB.moveList();
    CB.display();
    CB2.moveList();
    CB2.display();



    h.display(CB.HP, CB2.HP);
    h.update();
    if (CB.ATK_STATE == "STARTU") {
      c1 = #FF0000;
    } else if (CB.ATK_STATE == "ACTIVE") {
      c1 = #00FF00;
    } else if (CB.ATK_STATE == "RECOVERY") {
      c1 = #0000FF;
    } else if (CB.hitStun > 0) {
      c1 = #FFF000;
    } else {
      c1 = 90;
    }

    if (CB2.ATK_STATE == "STARTU") {
      c2 = #FF0000;
    } else if (CB2.ATK_STATE == "ACTIVE") {
      c2 = #00FF00;
    } else if (CB2.ATK_STATE == "RECOVERY") {
      c2 = #0000FF;
    } else if (CB2.hitStun > 0) {
      c2 = #FFF000;
    } else {
      c2 = 90;
    }

    //if (CB.ATK_STATE == "ACTIVE") {
    //  bgColor = 0;
    //} else {
    //  bgColor = 90;
    //}


    huBCount = CB.hurtboxCounter;
    // huBCount2 = CB2.CS.hurtboxCounter;

    if (hiBCount >= 50) {
      hiBCount = 0;
    }

    if (huBCount >= 50) {
      huBCount = 0;
    }

    if (hiBCount2 >= 100) {
      hiBCount2 = 50;
    }

    if (huBCount2 >= 100) {
      huBCount2 = 50;
    }


    for (hurtbox hurt : huB) {
      if (hurt != null) {
        hurt.display();
      }
    }

    for (hitbox hit : hiB) {
      if (hit != null) {
        hit.display();
      }
    }

    if (CB.x < CB2.x) {
      if (CB.grounded) {
        if (CB.right) {
          CB.right = false;
          CB.switchSide = true;
        } else {
          CB.switchSide = false;
        }
      }
      if (CB2.grounded) {
        if (!CB2.right) {
          CB2.right = true;
          CB2.switchSide = true;
        } else {
          CB2.switchSide = false;
        }
      }
    }




    if (CB2.x < CB.x) {
      if (CB.grounded) {
        if (!CB.right) {
          CB.right = true;
          CB.switchSide = true;
        } else {
          CB.switchSide = false;
        }
      }
      if (CB2.grounded) {
        if (CB2.right) {
          CB2.right = false;
          CB2.switchSide = true;
        } else {
          CB2.switchSide = false;
        }
      }
    }


    CB.collide(CB2.x, CB2.y, CB2.grounded);
    CB2.collide(CB.x, CB.y, CB.grounded);

    //CB.collide(CB2.x, CB2.y, CB2.grounded);
    //CB2.collide(CB.x, CB.y, CB.grounded);



    for (hitbox hit : hiB) {
      for (hurtbox hurt : huB) {
        if (hurt != null && hit != null) {
          hurt.hit(hit.tag, hit.x, hit.y, hit.l, hit.w, hit.linger, hit.right, hit.xOffset);
          if (hurt.collide == true) {
            if (hurt.tag == 0) {
              for (Attack atk : CB2.atkAttributes) {
                if (atk != null) {
                  if (atk.atkName == hit.name) {
                    CB.atkHitBy = atk;
                    CB2.gatling = atk.atkLvl;
                    CB2.atkHitWith = atk;

                    //if (CB2.grounded == false) {
                    //  CB.atkHitBy.lowHigh = "HIGH";
                    //} else {
                    //  CB.atkHitBy.lowHigh = atk.lowHigh;
                    //}
                    CB.hitHandler();
                  }
                }
              }
            }
            if (hurt.tag == 1) {
              for (Attack atk : CB.atkAttributes) {
                if (atk != null) {
                  if (atk.atkName == hit.name) {
                    CB2.atkHitBy = atk;
                    CB.gatling = atk.atkLvl;
                    CB.atkHitWith = atk;
                    //if (CB.grounded == false) {
                    //  CB2.atkHitBy.lowHigh = "HIGH";
                    //} else {
                    //  CB2.atkHitBy.lowHigh = atk.lowHigh;
                    //}
                    CB2.hitHandler();
                  }
                }
              }
            }
            // bgColor = 0;
            hit.linger = 0;
          } else {
            //  bgColor = 90;
          }
        }
      }
    }


    if ((CB.HP <= 0 || CB2.HP <= 0) || (h.time == 0) && a <= 255 ) {
      a = a + 5;
      roundActive = false;
    }

    if (a >= 255 && roundActive == false) {
      a = a - 5;
      h.active = true;
      gameSetup();
      h.time = 120;
      roundActive = true;
    }

    if (roundActive) {
      if (a > 0) {
        a = a - 5;
      }
    }

    if (h.p1wincount == 2 || h.p2wincount == 2) {
      progState = 11;
    }
    //if (hiBCount > 0) {
    //if (CB.ATK_STATE == "NEUTRAL" && CB2.hitStun > 0) {
    //  println("ADVANTAGE" + " " + CB2.hitStun);
    //}
    //else if (CB.ATK_STATE == "RECOVERY" && CB2.hitStun <= 0) {
    // println("DISADVANTAGE" + " " + CB2.hitStun);
    //}
    //println(CB.actionCount + " " + CB.ATK_STATE + " " + CB.ATK_INP);
    //println(CB2.hitStun);
    println(CB.ATK_INP);
    println(CB.gatling + " " + CB.atkHitWith);
    //}
    //println(CB2.ATK_INP + " " + CB2.hitStun + " " + CB2.actionCount + " " + CB2.ATK_STATE);
    fill(0, a);
    rect(0, 0, width, height);
  }

  void keyPressed() {
    CB.keyPressed();
    CB2.keyPressed();
    //CB.collide(CB2.x, CB2.y, CB2.grounded);
  }

  void keyReleased() {
    CB.keyReleased();
    CB2.keyReleased();
  }
}
