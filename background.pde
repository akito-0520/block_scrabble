int game_count = 0, game_point = 0;
boolean Sounds = true;
int time_set = 0;
int photo_x = 0, photo_y = 40, p_time = 1;
void backgrounds() {
  if (game_mode == "initial") {
    background(#81ACF5);
    textAlign(CENTER, CENTER);
    textSize(40);
    time_set++;
    if (time_set <= 30) {
      text("名前を入力してね!", 250, 150);
    }
    if (time_set == 60) {
      time_set = 0;
    }
  }

  if (game_mode == "starting") {
    background(#FF7171);
    frameRate(60);
    fill(0);
    translate(0, 0);
    textSize(30);
    textAlign(CENTER, CENTER);
    if (Smusic == true) {
      SbackSounds.rewind();
      SbackSounds.play();
      Smusic = false;
    }
    if ((pause == false)&&(Pscore == false)) {
      time_set++;
      if (photo_x < -100) {
        p_time = 1;
        photo_y = int(random(-200, 560));
      }
      if (photo_x > 800) {
        p_time = -1;
        photo_y = int(random(40, 560));
      }
      photo_x += p_time*7;
      if (int(random(0, 200)) == 0) {
        soundEffects.rewind();
        soundEffects.play();
      }
      textSize(45);
      rotate(PI/10);
      image(PIblocks [4], photo_x, photo_y);
      rotate(-PI/10);
      text("HG(ハードゲイ)の解放", 250, 200);
      textAlign(CENTER, CENTER);
      textSize(20);
      text(name[0]+"さん", 100, 20);
      text("ランキング:S", 400, 20);
      if (time_set <= 50) {
        textSize(30);
        text("ゲームを始める!!", 250, 400);
        textSize(20);
        text("→Click ENTER", 250, 440);
      }
      if (time_set == 60) {
        time_set = 0;
      }
      textSize(20);
      text("遊び方:E", 450, 565);
    }
    if (pause == true) {
      image(PIblocks[6], 50, 100);
      textSize(40);
      text("遊び方", 150, 130);
      textSize(25);
      text("・矢印キーで移動", 180, 220);
      text("←(左折ﾌｩｰ!!)    (右折ﾌｩｰ!!)→", 250, 250);
      textSize(20);
      text("HGを横に一列揃えると消えるよ!", 250, 300);
      text("列を揃えると下の列にあるRGが消えるよ", 250, 340);
      text("うまくコツを掴んで楽しもう                  ", 250, 360);
      text("どれだけ消せるか友達と勝負しよう!       ", 250, 380);
      image(PIblocks[1], 150, 400);
      image(PIblocks[2], 310, 400);
      textSize(15);
      text("HG", 170, 450);
      text("RG", 330, 450);
      text("閉じる:E", 400, 485);
    }

    if (Pscore == true) {
      image(PIblocks [6], 50, 100);
      textSize(30);
      text("ランキング", 140, 130);
      textSize(20);
      text("閉じる:S", 400, 20);
      text("戦績リセット:Q", 380, 565);
      text("名前", 140, 170);
      text("ポイント", 280, 170);
      text("フゥー!", 390, 170);
      for (int i=1; i<name.length; i++) {
        text(name[i], 140, 170+(30*i));
        text(str(count[i]), 280, 170+(30*i));
        text(str(point[i]), 390, 170+(30*i));
      }
    }
  }

  if (game_mode == "playing") {
    if (Sounds == true) {
      PbackSounds = minim.loadFile("11.mp3");
      PbackSounds.loop();
      Sounds = false;
    }
    image(PIblocks [3], -50, -500);

    if (pause == false) {
      line(rightLine, underLine, leftLine-1, underLine);
      line(rightLine, overLine-1, leftLine-1, overLine-1);
      line(rightLine, leftLine-1, rightLine, overLine-1);
      line(leftLine-1, leftLine-1, leftLine-1, overLine-1);
      image(PIblocks[5], 0, -400);
      textSize(25);
      textAlign(0);
      fill(0);
      text("一時停止:E", 250, -460);
      text(game_count+"ポイント", 20, -460);
      text(game_point+"フォー!", 20, -430);
    }

    if (pause == true) {
      fill(0);
      textAlign(0);
      image(PIblocks[6], 0, -400);
      image(PIblocks[7], 50, -350);
      textSize(25);
      text("再開:E", 250, -460);
      text(game_count+"ポイント", 30, -370);
      text(game_point+"フォー!", 200, -370);
      textSize(35);
      text("停止フォー!", 0, -440);
      text("タイトルに戻る:Z", 10, -65);
      text("や   り   直   す:X", 10, -20);
    }
  }

  if (game_mode == "ending") {
    background(#FA95F8);
    translate(0, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    EbackSounds.play();
    fill(0);
    time_set++;
    if (time_set <= 50) {
      textSize(50);
      text("GAME OVER...", 250, 200);
      textSize(30);
      text("タイトルに戻る", 250, 300);
      textSize(20);
      text("→Click ENTER", 250, 340);
    }
    if (time_set == 60) {
      time_set = 0;
    }
    textSize(30);
    text("今回のポイント "+(game_count-1)+"回", 250, 460);
    text("今回のフォー! "+game_point+"フォー!", 250, 490);
  }
}
