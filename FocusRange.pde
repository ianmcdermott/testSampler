class FocusRange {
  int max;
  int min;
  int index;
  SamplePlayer player;

  FocusRange(int max_, int min_, int i, SamplePlayer p) {
    max = max_;
    min = min_;
    index = i;
    player = p;
  }

  void setRangeMax() {
  }

  void setRangeMin() {
  }

  void setSample(SamplePlayer p) {
    player = p;
  }

  SamplePlayer getSample() {
    return player;
  }

  void displayFocusRange() {
    noFill();
    rectMode(CENTER);
    stroke(255, 0, 0);
    rect(max/2, max/2, max, max);
    stroke(0, 255, 127);
    rect(min/2, min/2, min, min);
  }
}
