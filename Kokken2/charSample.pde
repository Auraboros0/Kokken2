class charSample {

  Attack atkHitBy;

  Attack atkHitWith;

  Attack [] atkAttributes;
  Animations charAnim;

  boolean switchSide;

  int iFrames;
  int gatling;

  float x;
  float y;
  float xVelo;
  float yVelo;
  boolean right;
  boolean F;
  boolean B;
  boolean U;
  boolean D;
  boolean grounded;
  boolean hit;
  // F, B, U, D
  int tag;
  int currentInpDir;
  inputTracker iT;
  int inputLeniency;
  boolean atk;

  int HP;
  int WALK_SPEED;
  int AIR_DASH_F;
  int AIR_DASH_B;
  int DASH_F;
  int DASH_B;
  int JUMP_HEIGHT;

  String ATK_STATE;
  String ATK_INP;
  String ATK_INP_PREV;
  int actionCount; //for use in actions with startU, active & recovery
  float gravity;

  int blockStun;
  boolean collide;

  // Cant use enums for some reason so remember for hitStunType: "NORMAL" "AIRHIT" "KNOCKDOWN" "WALLSPLAT"

  int hitStun;
  String hitStunType;

  String hitBy;

  int hurtboxCounter;
  charSample(int tag) {
    if (tag == 0) {
      this.x = 800;
    } else {
      this.x = width-800;
    }
    this.y = y;

    iFrames = 0;
    gatling = 0;
    switchSide = false;
    this.tag = tag;
    atkHitBy = null;
    atkHitWith = null;
    iT = new inputTracker();
    currentInpDir = 5;
    xVelo = 0;
    yVelo = 0;

    HP = 100;
    WALK_SPEED = 0;
    AIR_DASH_F = 0;
    AIR_DASH_B = 0;
    DASH_F = 0;
    DASH_B = 0;
    JUMP_HEIGHT = 0;
    ATK_STATE = "NEUTRAL";
    ATK_INP = null;
    ATK_INP_PREV = null;
    atk = false;
    actionCount = 0;
    gravity = 0;
    F = false;
    B = false;
    U = false;
    D = false;
    grounded = true;
    right = false;
    hitStun = 0;
    hitStunType = null;
    hitBy = null;
    hit = false;
    collide = false;
    if (tag == 0) {
      hurtboxCounter = 0;
    }
    if (tag == 1) {
      hurtboxCounter = 50;
    }
    iT.input.set(0, 5);
    iT.input.set(1, 5);
    iT.input.set(2, 5);
    iT.input.set(3, 5);
    iT.input.set(4, 5);
    iT.input.set(5, 5);
  }

  void display() {
    UPDATE();
  }

  void UPDATE() {
    ATK_INP_PREV = ATK_INP;
    yVelo = yVelo + gravity;
    if (right == false) {
      x = x + xVelo;
    } else {
      x = x - xVelo;
    }
    //if (collide) {
    // xVelo = 0;
    //}
    y = y + yVelo;
    if (inputLeniency > 0) {
      inputLeniency--;
    }
    if (hitStun > 0) {
      hitStun--;
    } else {
      hitStunType = null;
      hitBy = null;
    }

    if (blockStun > 0) {
      blockStun--;
    }

    if (hitStunType == "KNOCKDOWN") {
      if (y < height - 150) {
        if (ATK_INP == null) {
          hitStun++;
          iFrames = 2;
        }
      }
    }

    if (atkHitWith != null) {
      atkHitWith = null;
    }

    if (ATK_STATE != "ACTIVE" && ATK_STATE != "RECOVERY") {
      if (atkHitWith != null) {
        atkHitWith = null;
      }
      gatling = 6;
    }

    if (x > width) {
      x = width;
    }
    if (x < 0) {
      x = 0;
    }

    if (y >= height -150) {
      y = height-150;
      if (grounded == false) {
        grounded = true;
        xVelo = 0;
      }
    } else {
      grounded = false;
      //if (ATK_INP == null) {
      // ATK_INP = "JUMP";
      //}
    }

    if (iFrames > 0) {
      iFrames--;
    }

    if (tag == 0) {
      hurtboxCounter = MG.huBCount;
    }
    if (tag == 1) {
      hurtboxCounter = MG.huBCount2;
    }

    if (F == true) {
      B = false;
    }
    if (B == true) {
      F = false;
    }
    if (U == true) {
      D = false;
    }
    if (D == true) {
      U = false;
    }

    if (switchSide) {
      if (F) {
        F = !F;
      }
      if (B) {
        B = !B;
      }
    }

    if (B == true && D == true) {
      currentInpDir = 1;
    }
    if (B == false && D == true && F == false) {
      currentInpDir = 2;
    }
    if (F == true && D == true) {
      currentInpDir = 3;
    }
    if (B == true && D == false && U == false) {
      currentInpDir = 4;
    }
    if (F == true && D == false && U == false) {
      currentInpDir = 6;
    }
    if (B == true && U == true) {
      currentInpDir = 7;
    }
    if (B == false && U == true && F == false) {
      currentInpDir = 8;
    }
    if (F == true && U == true) {
      currentInpDir = 9;
    }




    if (F == false && B == false && U == false && D == false) {
      if (iT.input.get(iT.input.size()-1) != 5) {
        currentInpDir = 5;
        //inputLeniency = 15;
        iT.addKey(currentInpDir);
      }
    } else {
      if (iT.input.get(iT.input.size()-1) != currentInpDir) {
        //if (inputLeniency <= 0) {
        iT.addKey(currentInpDir);
        inputLeniency = 15;
        //}
      } else if (iT.input.get(iT.input.size()-2) != currentInpDir) {
        //if (inputLeniency <= 0) {
        //iT.addKey(currentInpDir);
        inputLeniency = 15;
        //}
      }
    }

    if ((currentInpDir == 5 || currentInpDir == 2) && grounded == true && ATK_STATE == "NEUTRAL" && hitStun <= 0) {
      xVelo = 0;
    }

    if (ATK_STATE == "STARTU" || ATK_STATE == "ACTIVE" || ATK_STATE == "RECOVERY") {
      if (ATK_INP != "DASHF" && ATK_INP != "DASHB" && ATK_INP != "JUMP" && ATK_INP != "CROUCH" && ATK_INP != "UKEMI") {
        atk  = true;
      }
    } else {
      atk = false;
    }

    //if (right == true) {
    //  xVelo = -xVelo;
    //}
  }

  void walkF() {
    if (grounded == true) {
      if (currentInpDir == 6 && iT.input.get(iT.input.size()-1) == 6 && xVelo != DASH_F) {
        xVelo = WALK_SPEED;
      }
    }
  }

  void walkB() {
    if (grounded == true) {
      if (currentInpDir == 4 && iT.input.get(iT.input.size()-1)== 4 && xVelo != -DASH_B) {
        xVelo = -WALK_SPEED;
      }
    }
  }

  void crouch() {
    ATK_SKELETON(2, 2, 2, "CROUCH");
    if (ATK_INP == "CROUCH") {
      if (ATK_STATE == "ACTIVE") {
        if (D) {
          actionCount = 0;
        }
        xVelo = 0;
      }
    }
  }

  boolean block() {
    if (B && !atk && grounded && hitStun <= 0 || blockStun < 0) {
      return true;
    } else {
      return false;
    }
  }

  void dashF() {
    // if ((currentInpDir == 6 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 6)) {
    if (grounded == true) {
      if (iT.input != null) {
        ATK_SKELETON(0, 2, 20, "DASHF");
        if (ATK_INP == "DASHF") {
          if (ATK_STATE == "ACTIVE" ) {
            if (currentInpDir == 6) {
              actionCount = 0;
              xVelo = DASH_F;
            } else {
              actionCount = 2;
            }
          }
          if (ATK_STATE == "RECOVERY") {
            if (xVelo > 0) {
              xVelo--;
            }
            if (xVelo < 0) {
              xVelo++;
            }
          }
        }
      }
    }
  }


  //  }

  void dashB() {
    if (iT.input != null) {
      if (ATK_INP == "DASHB") {
        ATK_SKELETON(3, 25, 0, "DASHB");
        if (ATK_STATE == "ACTIVE" && ATK_INP == "DASHB") {
          yVelo = -2;
          gravity = 0;
          xVelo = -DASH_B;
        }
      }
    }
  }


  void jump() {
    if ((currentInpDir == 8 || currentInpDir == 7 || currentInpDir == 9) || ATK_INP == "JUMP") {
      if (grounded == true) {
        ATK_INP = "JUMP";
      }
      //if (ATK_INP == "JUMP") {
      ATK_SKELETON(4, 2, 4, "JUMP");
      //}
      if (ATK_STATE == "ACTIVE" && ATK_INP == "JUMP") {
        if (grounded == true && actionCount == 0) {
          yVelo = -JUMP_HEIGHT;
        }
        if (grounded == false) {
          actionCount = 1;
        }
      }
    }
  }

  void ukemi() {
    ATK_SKELETON(2, 4, 5, "UKEMI");
    if (ATK_INP == "UKEMI") {
      hitStun = 0;
      hitStunType = null;
      iFrames = 1;
      if (ATK_STATE == "ACTIVE") {
        yVelo = -2;
      }
    }
  }


  void BASIC_MOVEMENT() {
    if (hitStun <= 0 && atk == false) {
      if (!atk) {
        block();
        crouch();
        walkF();
        walkB();
        dashF();
        dashB();
      }
      if (!atk || atkHitWith.launcher) {
        jump();
      }
    }
  }

  void collide(float x2, float y2, boolean grounded2) {
    if ((grounded && grounded2)) {
      // background(0);
      if (right && xVelo > 0 && ATK_INP != "JUMP") {
        if (x < x2 + 200) {
          x = x2 + 200;
          collide = true;
        }
      }
      if (!right && xVelo > 0 && ATK_INP != "JUMP") {
        if (x > x2 - 200) {
          x = x2 - 200;
          collide = true;
        }
      }
    } else {
      collide = false;
    }
  }

  void SAMPLE_ATK() {
    ATK_SKELETON(6, 2, 3, "5A");
    if (ATK_STATE == "ACTIVE") {
      //MG.hiB[MG.hiBCount] = new hitbox(100, x, y, 100, 200, false, 0);
      MG.hiBCount++;
    }
  }

  void HURTBOX_SKELETON() {
    if (ATK_INP == "DASHF") {
      MG.huB[MG.huBCount] = new hurtbox(tag, x-100, y-200, 200, 300, right, -100);
    } else {
      MG.huB[MG.huBCount] = new hurtbox(tag, x-100, y-100, 200, 200, right, -100);
    }
    MG.huBCount++;
  }

  void hitHandler() {
    if (hitBy != atkHitBy.atkName && iFrames <= 0) {
      if ((block() && D && atkHitBy.lowHigh == "HIGH") || (block() && !D && atkHitBy.lowHigh == "LOW") || !block()) {
        if (ATK_INP != "CROUCH") {
          ATK_INP = null;
        }
        HP = HP - atkHitBy.dmg;
        hitStun = atkHitBy.hitStun;
        xVelo = -atkHitBy.knockBackX;
        yVelo = atkHitBy.knockBackY;
        if (atkHitBy.hardKD || (atkHitBy.launcher && !grounded)) {
          hitStunType = "KNOCKDOWN";
        }
        ATK_STATE = "NEUTRAL";
      } else if (block()) {
        if (blockStun <= 0) {
          HP = HP - atkHitBy.atkLvl;
        }
        blockStun = 8 + atkHitBy.atkLvl;
        if (!block.isPlaying()) {
          block.play();
        }
      }
    }
    if ((block() && D && atkHitBy.lowHigh == "HIGH") || (block() && !D && atkHitBy.lowHigh == "LOW") || !block()) {
      if (iFrames <= 0) {
        hitStun = atkHitBy.hitStun;
        xVelo = -atkHitBy.knockBackX;
        yVelo = atkHitBy.knockBackY;
        if (atkHitBy.atkName == "fireBall") {
          if (!projHit.isPlaying()) {
            projHit.play();
          }
        } else if (atkHitBy.atkLvl > 3) {
          if (!hardHit.isPlaying()) {
            hardHit.play();
          }
        } else if (atkHitBy.atkLvl > 2) {
          if (!lightHit.isPlaying()) {
            lightHit.play();
          }
        } else {
          if (!lightestHit.isPlaying()) {
            lightestHit.play();
          }
        }
      }
      if (atkHitBy.hardKD) {
        hitStunType = "KNOCKDOWN";
      }
    }
    hitBy = atkHitBy.atkName;
  }

  void ATK_SKELETON(int StartU, int Active, int Recovery, String input) {
    int startU = StartU;
    int active = Active;
    int recovery = Recovery;
    if (hitStun <= 0) {
      if (ATK_INP == input) {

        if (ATK_INP_PREV != ATK_INP) {
          //actionCount = 0;
          ATK_STATE = "NEUTRAL";
        }

        if (ATK_STATE == "NEUTRAL") {
          ATK_STATE = "STARTU";
        }

        if (startU >= actionCount && ATK_STATE == "STARTU") {
          ATK_STATE = "STARTU";
          actionCount++;
        }
        if (active >= actionCount && ATK_STATE == "ACTIVE") {
          ATK_STATE = "ACTIVE";
          actionCount++;
        }
        if (recovery >= actionCount && ATK_STATE == "RECOVERY") {
          ATK_STATE = "RECOVERY";
          actionCount++;
        }
        if ((actionCount > startU && ATK_STATE == "STARTU") || (actionCount > active && ATK_STATE == "ACTIVE") || (actionCount > recovery && ATK_STATE == "RECOVERY")) {
          if (ATK_STATE == "STARTU") {
            ATK_STATE = "ACTIVE";
          } else if (ATK_STATE == "ACTIVE") {
            ATK_STATE = "RECOVERY";
          } else if (ATK_STATE == "RECOVERY") {
            ATK_STATE = "NEUTRAL";
            ATK_INP = null;
          }
          actionCount = 0;
        }
      }
    }
  }

  void KEYPRESSED() {
    if (tag == 0) {

      if (key == 's') {
        if (F == true) {
          currentInpDir = 3;
        } else if (B == true) {
          currentInpDir = 1;
        } else {
          currentInpDir = 2;
        }
        D = true;
        if (!atk && grounded) {
          ATK_INP = "CROUCH";
        }
        iT.addKey(currentInpDir);
        // inputLeniency = 15;
      }

      if (right == false) {
        if (key == 'a') {
          if (U == true) {
            currentInpDir = 7;
          } else if (D == true) {
            currentInpDir = 1;
          } else {
            currentInpDir = 4;
          }
          B = true;
          iT.addKey(currentInpDir);
          // inputLeniency = 15;
          if ((iT.input.get(iT.input.size()-1) == 4 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 4)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL" && grounded == true) {
              ATK_STATE = "NEUTRAL";
              ATK_INP = "DASHB";
            }
          }
        }
        if (key == 'd') {
          if (U == true) {
            currentInpDir = 9;
          } else if (D == true) {
            currentInpDir = 3;
          } else {
            currentInpDir = 6;
          }
          F = true;
          iT.addKey(currentInpDir);
          // inputLeniency = 15;
          if ((iT.input.get(iT.input.size()-1) == 6 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 6)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL") {
              ATK_STATE = "NEUTRAL";
              ATK_INP = "DASHF";
            }
          }
        }
      }
      if (right == true) {
        if (key == 'd') {
          if (U == true) {
            currentInpDir = 7;
          } else if (D == true) {
            currentInpDir = 1;
          } else {
            currentInpDir = 4;
          }
          B = true;
          iT.addKey(currentInpDir);
          // inputLeniency = 15;
          if ((iT.input.get(iT.input.size()-1) == 4 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 4)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL" && grounded == true) {
              ATK_STATE = "NEUTRAL";
              ATK_INP = "DASHB";
            }
          }
        }
        if (key == 'a') {
          if (U == true) {
            currentInpDir = 9;
          } else if (D == true) {
            currentInpDir = 3;
          } else {
            currentInpDir = 6;
          }
          F = true;
          iT.addKey(currentInpDir);
          // inputLeniency = 15;
          if ((iT.input.get(iT.input.size()-1) == 6 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 6) && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL") {
              ATK_INP = "DASHF";
            }
          }
        }
      }
      if (key == 'w') {
        if (F == true) {
          currentInpDir = 9;
        } else if (B == true) {
          currentInpDir = 7;
        } else {
          currentInpDir = 8;
        }
        U = true;
        iT.addKey(currentInpDir);
        //inputLeniency = 15;
      }
    }

    if (tag == 1) {


      if (key == 'k') {
        if (F == true) {
          currentInpDir = 3;
        } else if (B == true) {
          currentInpDir = 1;
        } else {
          currentInpDir = 2;
        }
        D = true;
        if (!atk && grounded) {
          ATK_INP = "CROUCH";
        }
        iT.addKey(currentInpDir);
        // inputLeniency = 15;
      }
      if (right == false) {
        if (key == 'j') {
          if (U == true) {
            currentInpDir = 7;
          } else if (D == true) {
            currentInpDir = 1;
          } else {
            currentInpDir = 4;
          }
          B = true;

          iT.addKey(currentInpDir);
          // inputLeniency = 15;
          if ((currentInpDir == 4 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 4)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL" && grounded == true) {
              ATK_INP = "DASHB";
            }
          }
        }
        if (key == 'l') {
          if (U == true) {
            currentInpDir = 9;
          } else if (D == true) {
            currentInpDir = 3;
          } else {
            currentInpDir = 6;
          }
          F = true;

          iT.addKey(currentInpDir);
          //inputLeniency = 15;
          if ((iT.input.get(iT.input.size()-1) == 6 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 6)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL") {
              ATK_INP = "DASHF";
            }
          }
        }
      }
      if (right == true) {
        if (key == 'l') {
          if (U == true) {
            currentInpDir = 7;
          } else if (D == true) {
            currentInpDir = 1;
          } else {
            currentInpDir = 4;
          }
          B = true;

          iT.addKey(currentInpDir);
          //inputLeniency = 15;
          if ((currentInpDir == 4 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 4)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL" && grounded == true) {
              ATK_INP = "DASHB";
            }
          }
        }
        if (key == 'j') {
          if (U == true) {
            currentInpDir = 9;
          } else if (D == true) {
            currentInpDir = 3;
          } else {
            currentInpDir = 6;
          }
          F = true;

          iT.addKey(currentInpDir);
          //inputLeniency = 15;
          if ((iT.input.get(iT.input.size()-1) == 6 && iT.input.get(iT.input.size()-2) == 5 && iT.input.get(iT.input.size()-3) == 6)  && inputLeniency > 0) {
            if (ATK_INP == null && ATK_STATE == "NEUTRAL") {
              ATK_INP = "DASHF";
            }
          }
        }
      }
      if (key == 'i') {
        if (F == true) {
          currentInpDir = 9;
        } else if (B == true) {
          currentInpDir = 7;
        } else {
          currentInpDir = 8;
        }
        U = true;
        iT.addKey(currentInpDir);
        //inputLeniency = 15;
      }
    }
  }
  void KEYRELEASED() {
    if (tag == 0) {
      //if (key =='1') {
      //  ATK_INP = null;
      //}
      if (key == 'w') {
        U = false;
      }
      if (key == 's') {

        D = false;
      }
      if (right == false) {
        if (key == 'a') {
          if (F == false && grounded == true && ATK_STATE != "STARTU") {
            //  xVelo = 0;
          }
          B = false;
          if (F) {
            F = false;
          }
        }
        if (key == 'd') {
          if ( B == false && grounded == true && ATK_STATE != "STARTU") {
            // xVelo = 0;
          }
          F = false;
        }
      }
      if (right == true) {
        if (key == 'd') {
          if (F == false && grounded == true && ATK_STATE != "STARTU") {
            // xVelo = 0;
          }
          B = false;
          if (F) {
            F = false;
          }
        }
        if (key == 'a') {
          if ( B == false && grounded == true && ATK_STATE != "STARTU") {
            // xVelo = 0;
          }
          F = false;
        }
      }
    }

    if (tag == 1) {
      //if (key =='9') {
      //  ATK_INP = null;
      //}


      if (key == 'i') {
        U = false;
      }
      if (key == 'k') {
        D = false;
      }
      if (right == false) {
        if (key == 'j') {
          if (F == false && grounded == true && ATK_STATE != "STARTU") {
            //xVelo = 0;
          }
          B = false;
          if (F) {
            F = false;
          }
        }
        if (key == 'l') {
          if ( B == false && grounded == true && ATK_STATE != "STARTU") {
            // xVelo = 0;
          }
          F = false;
        }
      }
      if (right == true) {
        if (key == 'l') {
          if (F == false && grounded == true && ATK_STATE != "STARTU") {
            // xVelo = 0;
          }
          B = false;
          if (F) {
            F = false;
          }
        }
        if (key == 'j') {
          if ( B == false && grounded == true && ATK_STATE != "STARTU") {
            // xVelo = 0;
          }
          F = false;
        }
      }
    }
  }
}
