class Box {
  boolean right;
  int c;
  int tag;
  float x;
  float y;
  float l;
  float w;
  String properties;
  int linger;
  int xOffset;
  Box(int tag, float x, float y, float l, float w, boolean right, int xOffset) {
    this.right = right;
    c = #FF0000;
    this.tag = tag;
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.properties = properties;
    linger = 2;
    this.xOffset = xOffset;
  }
  
  boolean display() {
    linger--;
    if (linger <= 0) {
      linger = 0;
     return false; 
    }
    fill(c, 128);
    if (right == false) {
    rect(x,y,l,w);
    } else {
     rect(x+(-2*xOffset-l),y,l,w); 
    }
   // println(tag);
    return true;
  }
  
}
