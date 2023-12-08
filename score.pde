String name [] = new String [10];
int point [] = new int [10], Apoint [] = new int [10];
int count [] = new int [10];
void score() {
  point [0] = game_point;
  count [0] = game_count-1;

  for (int i=0; i<name.length-1; i++) {
    NArrays [i+1] = name [i];
    PArrays [i+1] = point [i];
    CArrays [i+1] = count [i];
  }
  for (int i=0; i<name.length; i++) {
    name [i] = "";
    point [i] = 0;
    count [i] = 0;
  }

  for (int i=1; i<name.length; i++) {
    count [i] = max(CArrays);
    for (int ii=0; ii<name.length; ii++) {
      if (CArrays [ii] == count [i]) {
        name [i] = NArrays [ii];
        NArrays [ii] = "Null";
        CArrays [ii] = 0;
        point [i] = PArrays [ii];
        break;
      }
    }
  }
  for (int i=0; i < name.length; i++) {
    if (i == 0) {
      Escore [i] = "Null,0,0";
    } else {
      Escore [i] = (name[i]+","+str(point[i])+","+str(count[i]));
    }
  }
  saveStrings(filename, Escore);
  for (int i=0; i<name.length; i++) {
    name[i] = "Null";
    point [i] = 0;
    count [i] = 0;
  }
  String Pscore [] = loadStrings(filename);
  for (int i=0; i<Pscore.length; i++) {
    String ten [] = split(Pscore [i], ',');
    name[i] = ten [0];
    point[i] = int(ten [1]);
    count[i] = int(ten [2]);
  }
}
