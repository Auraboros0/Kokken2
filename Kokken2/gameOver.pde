class gameOver {
  PImage Title;
  PImage Title2;
  int frames;
  gameOver() {
    Title = loadImage("P1wins.png");
    Title2 = loadImage("P2wins.png");
  }

  void display() {
    background(190);
    fill (250);
    textSize(100);
    textAlign(CENTER);
    if (frames < 60 * 30) {
      frames++;
    } else {
      progState = 0;
    }
    //imageMode(CORNER);
    if (MG.h.p1wincount == 2) {
      image(Title, 0, 0, width, height);
    } else if (MG.h.p2wincount == 2) {
      image(Title2, 0, 0, width, height);
    }
  }

  void keyPressed() {
    progState = 0;
  }
}
