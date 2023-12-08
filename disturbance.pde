float dx = 0, dy = -400;
int dCount;
boolean dControl = true;
boolean dBlock [][] = new boolean [10][10];
int probability = 2000;
void disturbance() {
  int dlX, dlY;
  if ((random(0, probability) <= 10)&&(dControl == true)&&(block_down == false)&&(block_c <= 50)) {
    dy = -400;
    dControl = false;
    dx = 40*(int(random(1, 10)));
  }
  if (dControl == false) {
    dy += 5;
    image(PIblocks [2], dx, dy);
  }
  dlX = int(dx/40);
  dlY = int((-dy-41.0)/40);

  if (dy <= 80) {
    if ((dy <= -80)&&(dBlock [dlX][dlY] == true)||(block [dlX][dlY] == true)) {
      dBlock [dlX][dlY+1] = true;
      dControl = true;
    } else {
      if (dy == -40) {
        dBlock [dlX][dlY] = true;
        dControl = true;
      }
    }
  }
  if (dy > 0) {
    dBlock [dlX][dlY] = true;
    dControl = true;
  }
}
