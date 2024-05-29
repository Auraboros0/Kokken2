class Animation {

  PImage pics[];
  int numPics;
  int currentFrame;

  Animation () {
    currentFrame = 0;
    numPics = 0;
    pics = new PImage[20];
  }

  void display () {
    currentFrame = currentFrame + 1;
    if (numPics==0) {
      return;
    }
    int currentPict = int(currentFrame / 5.0);
    if (progState == 8) {
      currentPict = int(currentFrame / 2.0);
    }
    if (currentPict >= numPics) {
      currentPict = 0;
      currentFrame = 0;
    }
    imageMode(CENTER);
    image (pics[currentPict], 0, 0);
  }

  void addPic (String filename) {
    this.pics[numPics] = loadImage(filename);
    //this.pics[numPics].resize(300, 400);
    numPics = numPics + 1;
  }

  void addPic (String filename, int w, int h) {
    this.pics[numPics] = loadImage(filename);
    this.pics[numPics].resize(w, h);
    numPics = numPics + 1;
  }

  void flip(float x, float y, boolean left) {
    push();
    translate(x, y);
    scale(left ? -3 : 3, 3);
    display();
    pop();
  }
}
