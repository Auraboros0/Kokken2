import gifAnimation.*;
import processing.sound.*;

int shutdown;

TitleScreen ts;
charSample CS;
MainMenu mm;
mainGame MG;
Credits cr;
PlayGame pg;
VersusBattle vb;
mapSelection ms;
characterSelection cs;
LoadingScreen lS;
gameOver go;

int bgColor = 90;
int progState;
float x;
float y;

SoundFile projHit;
SoundFile hardHit;
SoundFile lightHit;
SoundFile lightestHit;

SoundFile block;

SoundFile KO;


SoundFile s1Music;
SoundFile s2Music;
SoundFile s3Music;
SoundFile s4Music;
SoundFile m1Music;
SoundFile m2Music;
SoundFile m3Music;
SoundFile m4Music;

int menuMusic;


void setup() {
  //fullScreen(P2D);
  size(1200, 800);
  shutdown = 0;
  progState = 0;
  ts = new TitleScreen();
  mm = new MainMenu();
  cr = new Credits();
  pg = new PlayGame();
  vb = new VersusBattle();
  ms = new mapSelection();
  cs = new characterSelection();
  lS = new LoadingScreen();
  MG = new mainGame();
  go = new gameOver();
  projHit = new SoundFile(this, "HardPunch2.wav");
  hardHit = new SoundFile(this, "HardHit.wav");
  lightHit = new SoundFile(this, "LightPunch2.wav");
  lightestHit = new SoundFile(this, "LightPunch.wav");
  block = new SoundFile(this, "BlockSound.wav");
  KO = new SoundFile(this, "KO.wav");
  s1Music = new SoundFile(this, "StageTheme1.mp3");
  s2Music = new SoundFile(this, "StageTheme2.mp3");
  s3Music = new SoundFile(this, "StageTheme3.mp3");
  s4Music = new SoundFile(this, "StageTheme4.mp3");
  m1Music = new SoundFile(this, "MainMenu1.mp3");
  m2Music = new SoundFile(this, "MainMenu2.mp3");
  m3Music = new SoundFile(this, "MainMenu3.mp3");
  m4Music = new SoundFile(this, "MainMenu4.mp3");
  menuMusic = int(random(1, 5));
}

void draw() {
  background(bgColor);
  //MG.gameDraw();
  //ts.display();
  //if (CS.ATK_STATE == "STARTUP") {
  //  bgColor = #FF0000;
  //} else if (CS.ATK_STATE == "ACTIVE") {
  //  bgColor = #00FF00;
  //} else if (CS.ATK_STATE == "RECOVERY") {
  //  bgColor = #0000FF;
  //} else {
  //  bgColor = 90;
  //}
  ////CS.SAMPLE_ATK();
  //println(CS.actionCount);
  //println(CS.ATK_STATE);

  //Program States
  if (shutdown < (60 * 60 * 2)) {
    shutdown++;

    if (progState != 10) {
      switch(menuMusic) {
      case 1:
        if (!m1Music.isPlaying()) {
          m1Music.play();
        }
        break;

      case 2:
        if (!m2Music.isPlaying()) {
          m2Music.play();
        }
        break;

      case 3:
        if (!m3Music.isPlaying()) {
          m3Music.play();
        }
        break;

      case 4:
        if (!m4Music.isPlaying()) {
          m4Music.play();
        }
        break;
      }
      if (progState != 10) {
        if (s1Music.isPlaying()) {
          s1Music.stop();
        }
        if (s2Music.isPlaying()) {
          s2Music.stop();
        }
        if (s3Music.isPlaying()) {
          s3Music.stop();
        }
        if (s4Music.isPlaying()) {
          s4Music.stop();
        }
      }
    } else {
      if (m1Music.isPlaying()) {
        m1Music.stop();
      }
      if (m2Music.isPlaying()) {
        m2Music.stop();
      }
      if (m3Music.isPlaying()) {
        m3Music.stop();
      }
      if (m4Music.isPlaying()) {
        m4Music.stop();
      }
    }


    if (progState == 0) {
      ts.display();
      ts.update();
    }
    if (progState == 1) {
      mm.display();
      mm.update();
    }
    if (progState == 4) {
      cr.display();
      cr.update();
    }
    if (progState == 5) {
      pg.display();
      pg.update();
    }
    if (progState == 6) {
      vb.display();
      vb.update();
    }
    if (progState == 7) {
      ms.display();
      ms.update();
    }
    if (progState == 8) {
      cs.display();
      cs.update();
      MG = new mainGame();
      MG.gameSetup();
    }
    if (progState == 9) {
      lS.update();
      lS.display();
    }
    if (progState == 10) {
      lS.frames = 0;
      MG.gameDraw();
    }
    if (progState == 11) {
      go.display();
    }
  } else {
    background(0);
  }
}

void keyPressed() {
  shutdown = 0;
  if (shutdown < 60 * 60 * 2) {
    if (progState == 0) {
      ts.keyPressed();
    }
    if (progState == 1) {
      mm.keyPressed();
    }
    if (progState == 4) {
      cr.keyPressed();
    }
    if (progState == 5) {
      pg.keyPressed();
    }
    if (progState == 6) {
      vb.keyPressed();
    }
    if (progState == 7) {
      ms.keyPressed();
    }
    if (progState == 8) {
      cs.keyPressed();
    }
    if (progState == 10) {
      MG.keyPressed();
    }
    if (progState == 11) {
      go.keyPressed();
    }
  }
  if (key == 'z') {
    if (progState == 1) {
      //PlayGame
      if (mm.hy == height/2-100) {
        progState = 5;
        mm.hy = -265;
      }
      //Credits
      if (mm.hy == height/2+50) {
        progState = 4;
        mm.hy = -265;
      }
      //Back to the title screen
      if (mm.hy == height/2+100) {
        progState = 0;
        mm.hy = -265;
      }
    }
    //Play Game to Versus Battle
    if (progState == 5) {
      if (pg.hy == height/2-100) {
        progState = 6;
        mm.hy = -265;
        pg.hy = -265;
      }
    }
    //Versus Battle to Map Selection
    //if (progState == 6) {
    //  if (vb.hy == height/2+100) {
    //    progState = 5;
    //    mm.hy = -265;
    //    pg.hy = -265;
    //    vb.hy = -265;
    //  }
    //}
  }
}


void keyReleased() {
  if (shutdown < 60 * 60 * 60 * 2) {

    if (progState == 10) {
      MG.keyReleased();
    }
  }
}

void mousePressed() {
  if (shutdown < 60 * 60 * 2) {

    ts.mousePressed();
    if (progState == 4) {
      cr.mousePressed();
    } else if (progState == 5) {
      pg.mousePressed();
    } else if (progState == 6) {
      vb.mousePressed();
    } else if (progState == 7) {
      ms.mousePressed();
    } else if (progState == 8) {
      cs.mousePressed();
    }

    if (progState == 1) {
      //PlayGame
      if (mm.hy == height/2-100) {
        progState = 5;
        mm.hy = -265;
      }
      //Credits
      if (mm.hy == height/2+50) {
        progState = 4;
        mm.hy = -265;
      }
      //Back to the title screen
      if (mm.hy == height/2+100) {
        progState = 0;
        mm.hy = -265;
      }
    }
    //Play Game to Versus Battle
    if (progState == 5) {
      if (pg.hy == height/2-100) {
        progState = 6;
        mm.hy = -265;
        pg.hy = -265;
      }
    }
    //Versus Battle to Map Selection
    if (progState == 6) {
      if (vb.hy == height/2+100) {
        progState = 5;
        mm.hy = -265;
        pg.hy = -265;
        vb.hy = -265;
      }
    }
  }
}
