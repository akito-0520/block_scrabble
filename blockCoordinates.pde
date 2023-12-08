void blockCoordinates() { //<>//
  for (int i=0; i<10; i++) {
    for (int ii=0; ii<10; ii++) {
      if (block [i][ii] == true) {
        image (PIblocks[1], i*40, -ii*40-40);
      }
      if (dBlock [i][ii] == true) {
        image (PIblocks[2], i*40, -ii*40-40);
      }
    }
    stroke(2);
  }
}
