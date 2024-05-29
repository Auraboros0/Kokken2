class hurtbox {
  int c;
  int tag;
  float x;
  float y;
  float l;
  float w;
  boolean collide;
  boolean right;
  int linger;
  int xOffset;

  hurtbox(int tag, float x, float y, float l, float w, boolean right, int xOffset) {
    c = #FFFFFF;
    this.tag = tag;
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.right = right;
    this.collide = false;
    linger = 2;
    this.xOffset = xOffset;
  }

  void hit(int tag, float x, float y, float l, float w, int linger, boolean right, int xOffset) {
    if (this.right == false) {
      if (right == false) {
        if (this.linger > 0 && linger > 0 && tag != this.tag && x < this.x + this.l && x + l > this.x && y < this.y + this.w && y + w > this.y) {
          collide = true;
        } else {
          collide = false;
        }
      } else {
        if (this.linger > 0 && linger > 0 && tag != this.tag && x - 2*xOffset - l < this.x + this.l && x - 2*xOffset> this.x && y < this.y + this.w && y + w > this.y) {
          collide = true;
        } else {
          collide = false;
        }
      }
    } else {
      if (right == true) {
        if (this.linger > 0 && linger > 0 && tag != this.tag && x -2*xOffset > this.x - 2*this.xOffset - this.l && x - 2*xOffset - l < this.x - 2*this.xOffset && y < this.y + this.w && y + w > this.y) {
          collide = true;
        } else {
          collide = false;
        }
      } else {
        if (this.linger > 0 && linger > 0 && tag != this.tag && x + l > this.x - 2*this.xOffset - this.l && x < this.x - 2*this.xOffset && y < this.y + this.w && y + w > this.y) {
          collide = true;
        } else {
          collide = false;
        }
      }
    }
  }

  boolean display() {
    linger--;
    if (linger <= 0) {
      linger = 0;
      return false;
    }
    if (collide == true) {
      c = #0000FF;
    } else {
      c = #00FF00;
    }
    fill(c, 128);
    if (right == false) {
     // rect(x, y, l, w);
    } else {
     // rect(x+(-2*xOffset-l), y, l, w);
    }
    //println(collide);
    return true;
  }
}
