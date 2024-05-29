class charInstantiator extends charSample {

  int tag;
  int charID;
  charBuilder jin;
  charSample jin2;

  charInstantiator(int tag, int charID) {
    super(tag);
    this.tag = tag;
    this.charID = charID;
    if (this.charID == 0) {
      jin = new charBuilder(tag);
    }
  }

  void display() {
    if (charID == 0) {
      jin.moveList();
      jin.UPDATE();
    }
  }

  void KeyPressed() {
    if (charID == 0) {
      jin.keyPressed();
    }
  }

  void KeyReleased() {
    if (charID == 0) {
      jin.keyReleased();
    }
  }
}
