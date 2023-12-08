int block_c = 0, block_v = 1;
boolean block [][] = new boolean [10][10];
void falling() {
  int blX, blY;
  if (block_down == true) {
    by += 5;
    image (PIblocks[1], bx, by);
  }

  if (block_down == false) {
    if (block_c == 0) {
      bv2 = bv;
      bv = 0;
    }
    block_c += 1;
    block_v += 1;
    if (block_c <= 90) {
      if (block_v <= 10) {
        image (PIblocks[1], bx, by);
      } else {
        if (block_v == 20) {
          block_v = 0;
        }
      }
    } else {
      block_down = true;
      block_c = 0;
      block_v = 0;
      bv = bv2;
    }
  }
  
  blX = int(bx/40);
  blY = int((-by-41.0)/40);

  if (by <= 80) {
    if ((by <= -80)&&(block [blX][blY] == true)||(dBlock [blX][blY] == true)) {
      block [blX][blY+1] = true;
      blocks = true;
    } else {
      if (by == -40) {
        block [blX][blY] = true;
        blocks = true;
      }
    }
  }
  if (by > 0) {
    block [blX][blY] = true;
    blocks = true;
  }

  if (blocks == true) {
    bx = 160;
    by = -400;
    block_down = false;
    game_count += 1;
    blocks = false;
  }
  fill(360);
}
