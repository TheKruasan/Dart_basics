import 'dart_2.dart';

void main() {
  final nod = ForNokNod(12, 30).nod();
  //print(nod); //6
  final nok = ForNokNod(12, 30).nok();
  //print(nok); //60
  const int x = 65;
  //print(del(x)); // {1, 5, 13}

  const x2 = 1111;
  final trans = Transformation(x2);
  trans.toDec();
  // print(trans.x2);

  const s3 = "12 3 7.2 88 92.2";
  final third = ThirdTask();
  // print(third.toWords(s3));

  List<String> list = ['one', 'one', 'two', 'one', 'onew'];
  final fourth = FourthTask(list);
  // print(fourth.countIn());

  list = ['one', 'one', 'one', 'two', 'one', 'onew', 'zero', 'four'];
  final fifth = FifthTask();
  // print(fifth.returnCount(list));

  Point point1 = Point(0, 0, 0);
  Point point2 = Point(0, 1, 0);
  Point point3 = Point(1, 0, 0);
  // print(point1.distanceTo(point2));
  // print((point2.square(point1, point2, point3)).toStringAsFixed(2));
  AdminUser admin = AdminUser("artemrusskin92@gmail.com");
  GeneralUser g1 = GeneralUser("assdad@123123");
  GeneralUser g2 = GeneralUser("emailadress@mirea.ru");
  UserManager um = UserManager()
        ..newUser(g1)
        ..newUser(g2)
        ..newUser(admin)
      // ..printAll()
      ;
  // print(admin.getMailSystem());
  num x7 = 27;
  // print(27.sqPow(3).toStringAsFixed(3));
}
