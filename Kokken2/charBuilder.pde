class charBuilder extends charSample {

  // Will extend from charSample, remove duplicates

  //Attack [] atkAttributes;
  //Animations jinAnim;
  //int c;
  //float x;
  //float y;
  //float xVelo;
  //float yVelo;
  //String atkState;
  //String atkInp;
  //int currentHbox;
  //charSample CS;
  //inputTracker iT;

  //boolean right;
  int tag;
  projectileSprite jinHado;
  //int hiBCount;
  //int huBCount;


  charBuilder(int tag) {
    super(tag);

    //super(x, y, tag);

    // Attack Name // DMG // Frame Advantage // X Knockback // Y Knockback // Hard Knockdown? // Launcher? // atkLevel // Low or High?
    atkAttributes = new Attack[100];
    atkAttributes[0] = new Attack("standLP", 4, 8, 2, 0, false, false, 1, null);
    atkAttributes[1] = new Attack("standLK", 4, 8, 2, 0, false, false, 1, "LOW");
    atkAttributes[2] = new Attack("standHP", 7, 10, 2, -20, false, true, 3, null);
    atkAttributes[3] = new Attack("standHK", 9, 9, 11, -10, true, true, 3, null);
    atkAttributes[4] = new Attack("airHP", 6, 12, 1, 0, false, false, 3, "HIGH");
    atkAttributes[5] = new Attack("airHK", 4, 10, 1, 0, false, false, 2, "HIGH");
    atkAttributes[6] = new Attack("fireBall", 11, 10, 5, 0, false, false, 4, null);
    atkAttributes[7] = new Attack("shoryu", 16, 50, 3, -20, true, true, 4, null);


    //jinHado = new projectileSprite(tag);

    charAnim = new Animations();
    this.tag = tag;
    if (tag == 0) {
      right = false;
      // x = 0;
    } else {
      right = true;
      // x = width;
    }
    //CS.right = right;
    HP = 100;
    // x = 400;
    y = height;
    xVelo = 0;
    yVelo = 0;
    WALK_SPEED = 5;
    AIR_DASH_F = 20;
    AIR_DASH_B = 10;
    DASH_F = 15;
    DASH_B = 12;
    JUMP_HEIGHT = 20;
    gravity = 0.6;
  }



  void display() {
    //right = CS.right;
    // tag = CS.tag;
    gravity = 0.6;
    //iT = CS.iT;
    UPDATE();
    hurtboxGenerator();
    //if (atkAttributes != null) {
    //  for (Attack a : atkAttributes) {
    //    if (!grounded) {
    //      a.lowHigh = "HIGH";
    //    } else {
    //      atkAttributes[0] = new Attack("standLP", 4, 6, 2, 0, false, false, 1, null);
    //      atkAttributes[1] = new Attack("standLK", 4, 6, 2, 0, false, false, 1, "LOW");
    //      atkAttributes[2] = new Attack("standHP", 7, 10, 2, -20, false, true, 3, null);
    //      atkAttributes[3] = new Attack("standHK", 9, 50, 11, -10, true, true, 3, null);
    //      atkAttributes[4] = new Attack("fireBall", 11, 10, 5, 0, false, false, 4, null);
    //      atkAttributes[5] = new Attack("shoryu", 16, 50, 3, -20, true, true, 4, null);
    //    }
    //  }
    //}

    //if (atk_STATE == "STARTU") {
    //  c = #FF0000;
    //} else if (atk_STATE == "ACTIVE") {
    //  c = #00FF00;
    //} else if (atk_STATE == "RECOVERY") {
    //  c = #0000FF;
    //} else {
    //  c = #FFFFFF;
    //}

    //if (CS.hitStun > 0) {
    //  c = 0;
    //}
    //fill(c);
    if (hitStun == 0) {
      hitBy = null;
    }
    animationHandler();


    // println(actionCount);
  }

  void animationHandler() {
    if (ATK_INP == null && grounded == true) {
      if (xVelo > 0) {
        charAnim.setAnimation(71);
      } else {
        charAnim.setAnimation(50);
      }
    }

    if (ATK_INP == null && !grounded) {
      charAnim.setAnimation(73);
    }



    if (ATK_INP == "CROUCH") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(76);
      } else {
        charAnim.setAnimation(77);
      }
    }

    if ((hitBy != null && block()) || blockStun > 0) {
      if (D) {
        charAnim.setAnimation(91);
      } else {
        charAnim.setAnimation(90);
      }
    }

    if (ATK_INP == "UKEMI") {
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(88);
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(89);
      }
    }
    if (ATK_INP == "JUMP") {
      if (xVelo >= 0) {
        if (yVelo < 0) {
          charAnim.setAnimation(72);
        } else {
          charAnim.setAnimation(73);
        }
      } else {
        if (!grounded) {
          charAnim.setAnimation(74);
        } else {
          charAnim.setAnimation(75);
        }
      }
    }
    if (ATK_INP == "DASHB") {
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(92);
      }
    }
    if (hitStun > 0) {
      if (!grounded) {
        if (yVelo <= 0) {
          charAnim.setAnimation(84);
        } else {
          charAnim.setAnimation(85);
        }
      } else {
        if (hitStun > 3) {
          charAnim.setAnimation(79);
        } else {
          charAnim.setAnimation(80);
        }
        if (hitStunType == "KNOCKDOWN") {
          charAnim.setAnimation(87);
        }
      }
    }
    if (HP <= 0) {
      charAnim.setAnimation(87);
    }
    charAnim.display(x, y, right);
  }

  void hurtboxGenerator() {
    int xOffset;
    if (ATK_INP == "DASHF") {
      xOffset = -100;
      MG.huB[MG.huBCount] = new hurtbox(tag, x+xOffset, y-200, 200, 300, right, xOffset);
    } else {
      xOffset = -150;
      MG.huB[MG.huBCount] = new hurtbox(tag, x+xOffset, y-100, 200, 250, right, xOffset);
      MG.huBCount++;
      xOffset = -25;
      MG.huB[MG.huBCount] = new hurtbox(tag, x+xOffset, y-175, 80, 80, right, xOffset);
      MG.huBCount++;
      xOffset = 50;
      MG.huB[MG.huBCount] = new hurtbox(tag, x+xOffset, y-150, 80, 120, right, xOffset);
    }
    MG.huBCount++;
  }

  void standLP() {
    int xOffset;
    ATK_SKELETON(6, 2, 3, "5A");
    if (ATK_INP == "5A") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(51);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(52);
        xOffset = 0;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-100, 200, 100, right, xOffset, "standLP");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(53);
      }
    }
  }

  void standLK() {
    int xOffset;
    ATK_SKELETON(8, 2, 6, "5B");
    if (ATK_INP == "5B") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(54);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(55);
        xOffset = 0;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y+100, 200, 100, right, xOffset, "standLK");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(56);
      }
    }
  }

  void standHP() {
    int xOffset;
    ATK_SKELETON(6, 4, 7, "5C");
    if (ATK_INP == "5C") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(57);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(58);
        xOffset = 75;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-150, 100, 200, right, xOffset, "standHP");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(59);
      }
    }
  }

  void standHK() {
    int xOffset;
    ATK_SKELETON(6, 4, 7, "5D");
    if (ATK_INP == "5D") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(60);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(61);
        xOffset = 75;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-150, 100, 200, right, xOffset, "standHK");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(62);
      }
    }
  }

  void airHP() {
    int xOffset;
    ATK_SKELETON(10, 4, 12, "A5P");
    if (ATK_INP == "A5P") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(93);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(94);
        xOffset = 75;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-150, 250, 200, right, xOffset, "airHP");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(95);
      }
      if (grounded) {
        charAnim.setAnimation(76);
        ATK_STATE = "RECOVERY";
      }
    }
  }

  void airHK() {
    int xOffset;
    ATK_SKELETON(8, 8, 10, "A5K");
    if (ATK_INP == "A5K") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(96);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(97);
        xOffset = 50;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-25, 200, 100, right, xOffset, "airHP");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(73);
      }
      if (grounded) {
        charAnim.setAnimation(76);
        ATK_STATE = "RECOVERY";
      }
    }
  }

  void fireBall() {
    int xOffset;
    ATK_SKELETON(12, 1, 10, "236C");
    if (ATK_INP == "236C") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(63);
        xVelo = 0;
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(64);
        xOffset = 75;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-100, 100, 100, right, xOffset, "fireBall");
        MG.hiB[MG.hiBCount].linger = 120;
        MG.hiB[MG.hiBCount].xVelo = 15;
        MG.hiBCount++;
        //xVelo = 0;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(65);
      }
    }
  }

  void shoryu() {
    int xOffset;
    ATK_SKELETON(12, 1, 10, "623C");
    if (ATK_INP == "623C") {
      if (ATK_STATE == "STARTU") {
        charAnim.setAnimation(67);
      }
      if (ATK_STATE == "ACTIVE") {
        charAnim.setAnimation(68);
        if (grounded == true) {
          yVelo = -30;
        }
        if (yVelo < 0) {
          actionCount = 0;
        }
        xOffset = 75;
        MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-150, 100, 200, right, xOffset, "shoryu");
        MG.hiBCount++;
      }
      if (ATK_STATE == "RECOVERY") {
        charAnim.setAnimation(70);
      }
    }
  }

  void projectile(int xOffset) {
    Gif projectile = new Gif(Kokken2.this, "projectile.gif");
    projectile.play();
  }



  void moveList() {
    ukemi();
    if (hitStun <= 0) {
      standLP();
      standLK();
      standHP();
      standHK();
      airHP();
      airHK();
      fireBall();
      shoryu();
      BASIC_MOVEMENT();
    }
  }

  void keyPressed() {
    if (HP > 0) {
      if (((key == '1' && tag == 0) || (key == '7' && tag == 1))) {
        if ((!atk || gatling < 1) && hitBy == null && hitStun <= 0) {
          if ((iT.input.get(iT.input.size()-3) == 6 && iT.input.get(iT.input.size()-2) == 2 && iT.input.get(iT.input.size()-1) == 3) || iT.input.get(iT.input.size()-4) == 6 && iT.input.get(iT.input.size()-3) == 3 && iT.input.get(iT.input.size()-2) == 2 && iT.input.get(iT.input.size()-1) == 3) {
            ATK_INP="623C";
          } else if (iT.input.get(iT.input.size()-3) == 2 && iT.input.get(iT.input.size()-2) == 3 && iT.input.get(iT.input.size()-1) == 6) {
            ATK_INP="236C";
          } else if (!grounded) {
            ATK_INP = "A5P";
          } else {
            ATK_INP = "5A";
          }
        } else if (hitStunType == "KNOCKDOWN" && grounded) {
          ATK_INP = "UKEMI";
        }
      }
      if (((key == '2' && tag == 0) || (key == '8' && tag == 1))) {
        if ((!atk || gatling < 1) && hitBy == null && hitStun <= 0) {
          if (!grounded) {
            ATK_INP = "A5K";
          } else {
            ATK_INP = "5B";
          }
        } else if (hitStunType == "KNOCKDOWN" && grounded) {
          ATK_INP = "UKEMI";
        }
      }
      if (((key == '3' && tag == 0) || (key == '9' && tag == 1))) {
        if ((!atk || gatling < 4 )&& hitBy == null && hitStun <= 0) {
          if ((iT.input.get(iT.input.size()-3) == 6 && iT.input.get(iT.input.size()-2) == 2 && iT.input.get(iT.input.size()-1) == 3) || iT.input.get(iT.input.size()-4) == 6 && iT.input.get(iT.input.size()-3) == 3 && iT.input.get(iT.input.size()-2) == 2 && iT.input.get(iT.input.size()-1) == 3) {
            ATK_INP="623C";
          } else if (iT.input.get(iT.input.size()-3) == 2 && iT.input.get(iT.input.size()-2) == 3 && iT.input.get(iT.input.size()-1) == 6) {
            ATK_INP="236C";
          } else if (!grounded) {
            ATK_INP = "A5P";
          } else {
            ATK_INP = "5C";
          }
        } else if (hitStunType == "KNOCKDOWN" && grounded) {
          ATK_INP = "UKEMI";
        }
      }
      if (((key == '4' && tag == 0) || (key == '0' && tag == 1))) {
        if ((!atk || gatling < 3) && hitBy == null && hitStun <= 0) {
          if (!grounded) {
            ATK_INP = "A5K";
          } else {
            ATK_INP = "5D";
          }
        } else if (hitStunType == "KNOCKDOWN" && grounded) {
          ATK_INP = "UKEMI";
        }
      }
      KEYPRESSED();
    }

    if ((key == 'a' && tag == 0) || (key == 'j' && tag == 1)) {
      if (right) {
        F = true;
      } else {
        B = true;
      }
    }

    if ((key == 'd' && tag == 0) || (key == 'l' && tag == 1)) {
      if (!right) {
        F = true;
      } else {
        B = true;
      }
    }
  }

  void keyReleased() {
    KEYRELEASED();
    if (key == '1') {
    }
  }
}
