class hitbox {
  boolean right;
  int xVelo;
  int c;
  int tag;
  float x;
  float y;
  float l;
  float w;
  String properties;
  int linger;
  int xOffset;
  String name;

  Animation fbAnim;

  hitbox(int tag, float x, float y, float l, float w, boolean right, int xOffset, String name) {
    fbAnim = new Animation();
    fbAnim.addPic("Projectile1.png");
    fbAnim.addPic("Projectile2.png");
    fbAnim.addPic("Projectile3.png");
    fbAnim.addPic("Projectile4.png");
    this.right = right;
    xVelo = 0;
    c = #FF0000;
    this.tag = tag;
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.properties = properties;
    linger = 2;
    this.xOffset = xOffset;
    this.name = name;
  }

  void setParameters() {
  }

  boolean display() {
    linger--;
    if (linger <= 0) {
      linger = 0;
      return false;
    }
    if (!right) {
      x = x + xVelo;
    } else {
      x = x - xVelo;
    }
    fill(c, 128);
    if (right == false) {
      //rect(x, y, l, w);
      if (name == "fireBall") {
        imageMode(CENTER);
        fbAnim.flip(x+w/2, y+l/2, right);
      }
    } else {
      //rect(x+(-2*xOffset-l), y, l, w);
      if (name == "fireBall") {
        imageMode(CORNER);
        fbAnim.flip(x-w/2+(-2*xOffset), y+l/2, right);
      }
    }
    // println(x);

    return true;
  }
}
