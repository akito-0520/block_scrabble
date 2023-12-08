void break_down() {
  boolean block_d [][] = new boolean [10][10], dBlock_d [][] = new boolean [10][10];

  for (int i=0; i<10; i++) {
    if ((block[0][i] == true)&&(block [1][i] == true)&&(block [2][i] == true)&&
      (block [3][i] == true)&&(block [4][i] == true)&&(block [5][i] == true)&&
      (block [6][i] == true)&&(block [7][i] == true)&&(block [8][i] == true)
      &&(block [9][i] == true)) {
      soundEffects.rewind();
      soundEffects.play();

      for (int ii=0; ii<10; ii++) {
        block [ii][i] = false;
      }

      for (int ii=i; ii<10; ii++) {
        for (int iii=0; iii<10; iii++) {
          block_d [iii][ii] = block [iii][ii];
          dBlock_d [iii][ii] = dBlock [iii][ii];
          block [iii][ii] = false;
          dBlock [iii][ii] = false;
        }
      }

      for (int ii=i; ii<9; ii++) {
        for (int iii=0; iii<10; iii++) {
          block [iii][ii] = block_d [iii][ii+1];
          dBlock [iii][ii] = dBlock_d [iii][ii+1];
        }
      }

      for (int d=0; d<10; d++) {
        for (int dd=0; dd<10; dd++) {
          block_d [d][dd] = false;
          dBlock_d [d][dd] = false;
        }
      }

      bv += 10;
      game_point++;
      backCount++;

      if (i != 0) {
        for (int ii=0; ii<10; ii++) {
          if (dBlock[ii][i-1] == true) {
            dBlock[ii][i-1] = false;
            
            for (int iii=i; iii<10; iii++) {
              block_d[ii][iii] = block[ii][iii];
              dBlock_d[ii][iii] = dBlock[ii][iii];
            }
            for (int iii=i; iii<10; iii++) {
              block[ii][iii] = false;
              dBlock[ii][iii] = false;
            }
            for (int iii=i; iii<9; iii++) {
              block[ii][iii] = block_d[ii][iii+1];
              dBlock[ii][iii] = dBlock_d[ii][iii+1];
            }
          }
        }
      }

      for (int d=0; d<10; d++) {
        for (int dd=0; dd<10; dd++) {
          block_d [d][dd] = false;
          dBlock_d [d][dd] = false;
        }
      }
      if (probability <= 1000) {
        probability -= 100;
      }
      if (game_point == 5) {
        PbackSounds.close();
        subMusic.rewind();
        subMusic.loop();
      }
    }
  }
  for (int i=0; i<10; i++) {
    if (block [i][9] == true) {
      game_mode = "ending";
      score();
      PbackSounds.close();
      subMusic.close();
    }
  }
}
