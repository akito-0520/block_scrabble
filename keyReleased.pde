void keyReleased() {
  if (game_mode == "starting") {
    if (key == 'e') {
      pauseLock = false;
    }

    if (key == 's') {
      PscoreLock = false;
    }
  }
  if (game_mode == "playing") {
    if (key == 'e') {
      pauseLock = false;
    }
    bv = 0;
  }
}
