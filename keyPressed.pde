void keyPressed() {

  if (game_mode == "initial") {
    if (key == ' ') {
      int r = JOptionPane.showConfirmDialog(
        null, panel, "最終確認",
        JOptionPane.YES_NO_OPTION,
        JOptionPane.INFORMATION_MESSAGE
        );
      Canvas canvas = (Canvas) surface.getNative();
      pane = (JLayeredPane) canvas.getParent().getParent();
      if ( r == 0 ) {
        name [0] = field.getText();
        point [0] = 0;
        count [0] = 0;
        pane.remove(field);
        game_mode = "starting";
        names = name [0];
        loop();
      } else if ( r == 1 ) {
      }
    }
  }

  if (game_mode == "starting") {
    if ((keyCode == ENTER)&&(pause == false)) {
      game_mode = "playing";
      SbackSounds.pause();
    }

    if ((key == 'q')&&(Pscore == true)) {
      for (int i=0; i<name.length; i++) {
        Escore [i] = "Null,0,0";
      }
      saveStrings(filename, Escore);
      String Pscore [] = loadStrings(filename);
      for (int i=1; i<Pscore.length; i++) {
        String ten [] = split(Pscore [i], ',');
        name[i] = ten [0];
        point[i] = int(ten [1]);
        count[i] = int(ten [2]);
      }
    }
    if ((key == 'e')&&(pause == false)&&(pauseLock == false)&&(Pscore == false)) {
      pause = true;
      pauseLock = true;
    }

    if ((key == 'e')&&(pause == true)&&(pauseLock == false)&&(Pscore == false)) {
      pause = false;
      pauseLock = true;
    }

    if ((key == 's')&&(Pscore == false)&&(PscoreLock == false)&&(pause == false)) {
      Pscore = true;
      PscoreLock = true;
    }

    if ((key == 's')&&(Pscore == true)&&(PscoreLock == false)&&(pause == false)) {
      Pscore = false;
      PscoreLock = true;
    }
  }

  if (game_mode == "playing") {
    int blX, blY;
    blX = int(bx/40);
    blY = int((-by-41.0)/40);
    if ((keyCode == RIGHT)&&(bx < 400-40)&&(block [blX+1][blY] == false)&&(dBlock [blX+1][blY] == false)&&(block_down == true)) {
      bx += 40;
    }
    if ((keyCode == LEFT)&&(bx > 0)&&(block [blX-1][blY] == false)&&(dBlock [blX-1][blY] == false)&&(block_down == true)) {
      bx -= 40;
    }
    if (key == '¥') {
      game_mode = "ending";
      PbackSounds.close();
    }
    if ((key == 'e')&&(pause == false)&&(pauseLock == false)) {
      pause = true;
      pauseLock = true;
      PbackSounds.pause();
      subEffect [1].rewind();
      subEffect [1].play();
    }
    if ((key == 'e')&&(pause == true)&&(pauseLock == false)) {
      pause = false;
      pauseLock = true;
      PbackSounds.play();
      subEffect [2].rewind();
      subEffect [2].play();
    }
    if ((key == 'z')&&(pause == true)) {
      game_mode = "starting";
      Sounds = true;
      Smusic = true;
      pause = false;
      pauseLock = false;
      by = -400;
      dy = -400;
      block_c = 0;
      for (int i=0; i<10; i++) {
        for (int ii=0; ii<10; ii++) {
          block [i][ii] = false;
          dBlock [i][ii] = false;
        }
      }
      game_count = 0;
      game_point = 0;
    }
    if ((key == 'x')&&(pause == true)) {
      pause = false;
      pauseLock = false;
      by = -400;
      dy = -400;
      block_c = 0;
      game_count = 0;
      game_point = 0;
      for (int i=0; i<10; i++) {
        for (int ii=0; ii<10; ii++) {
          block [i][ii] = false;
          dBlock [i][ii] = false;
        }
      }
      PbackSounds.rewind();
      PbackSounds.play();
    }
  }

  if (game_mode == "ending") {
    if (keyCode == ENTER) {
      game_mode = "starting";
      EbackSounds.pause();
      EbackSounds.rewind();
      Sounds = true;
      Smusic = true;
      for (int i=0; i<10; i++) {
        for (int ii=0; ii<10; ii++) {
          block [i][ii] = false;
          dBlock [i][ii] = false;
        }
      }
      game_count = 0;
      game_point = 0;
      name [0] = names;
    }
  }
}
