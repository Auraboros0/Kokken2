// Each time an input is pressed, add to a list.
class inputTracker {
  IntList input;
  int blockInp;

  inputTracker() {
    this.input = new IntList();
    this.blockInp = 0;
  }

  void addKey(int dir) {
    if (dir != blockInp) {
      this.input.append(dir);
    }
    for (int i : input) {
     // print(i + " ");
    }
    //println("");
  }

  void lock(int dir) {
    blockInp = dir;
  }

  void unlock() {
    blockInp = 0;
  }
}
