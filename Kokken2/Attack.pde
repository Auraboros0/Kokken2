class Attack {

  String atkName;
  int dmg;
  int hitStun;
  int knockBackX;
  int knockBackY;
  boolean hardKD;
  boolean launcher;
  int atkLvl;
  String lowHigh;

  Attack(String atkName, int dmg, int hitStun, int knockBackX, int knockBackY, boolean hardKD, boolean launcher, int atkLvl, String lowHigh) {
    this.atkName = atkName;
    this.dmg = dmg;
    this.hitStun = hitStun;
    this.knockBackX = knockBackX;
    this.knockBackY = knockBackY;
    this.hardKD = hardKD;
    this.launcher = launcher;
    this.atkLvl = atkLvl;
    this.lowHigh = lowHigh;
  }
  
  
  
}
