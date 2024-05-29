class projectileSprite {
  Animation fbAnim;
  int tag;
  int xOffset;
  int xVelo;
  int linger;
  projectileSprite(int tag, int linger, boolean right) {
    this.tag = tag;
    this.linger = linger;
    this.xOffset = xOffset;
    fbAnim = new Animation();
    fbAnim.addPic("Projectile1.png");
    fbAnim.addPic("Projectile2.png");
    fbAnim.addPic("Projectile3.png");
    fbAnim.addPic("Projectile4.png");
    MG.hiB[MG.hiBCount] = new hitbox(tag, x+xOffset, y-150, 100, 200, right, xOffset, "fireBall");
    MG.hiB[MG.hiBCount].linger = linger;
    MG.hiB[MG.hiBCount].xVelo = 15;
    MG.hiBCount++;
  }

  boolean display() {
    MG.hiB[MG.hiBCount].linger--;
    if (MG.hiB[MG.hiBCount].linger <= 0) {
      return false;
    } else {
      fbAnim.flip(MG.hiB[MG.hiBCount-1].x, MG.hiB[MG.hiBCount-1].y, MG.hiB[MG.hiBCount-1].right);
      return true;
    }
  }
}
