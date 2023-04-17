// 1 Задание
import 'dart:math';

class ForNokNod {
  final int x;
  final int y;

  ForNokNod(this.x, this.y);

  int nod() {
    int c, x1 = x, y1 = y;
    while (x1 != 0 && y1 != 0) {
      x1 = x1 % y1;
      c = x1;
      x1 = y1;
      y1 = c;
    }
    return (x1 + y1);
  }

  int nok() {
    return (x * y ~/ nod());
  }
}

Set<int>? del(int x) {
  Set<int> set = {1};
  int i = 2;
  while (x != 1) {
    x % i == 0 ? {set.add(i), x = x ~/ i} : i++;
  }
  return set;
}
// Конец 1 задания

// 2 Задание
class Transformation {
  int x2;
  Transformation(this.x2);
  void toDec() {
    String s = x2.toString();
    x2 = 0;
    double sum = 0;
    for (int i = 0; i < s.length; i++) {
      sum += (int.parse(s[i])) * pow(2, s.length - 1 - i);
    }
    x2 = sum.toInt();
  }

  void toBin() {
    String s = "";
    while (x2 != 0) {
      s = (x2 % 2).toString() + s;
    }
    x2 = int.parse(s);
  }
}
// Конец 2 задания

// 3 Задание
class ThirdTask {
  ThirdTask();
  List<num> toWords(String s) {
    List<num> listOfNum = [];
    int i = 0;
    while (i < s.length) {
      String subString = "";
      while (i < s.length && s[i] != ' ') {
        subString += s[i];
        i++;
      }
      listOfNum.add(double.parse(subString));
      i++;
    }
    return (listOfNum);
  }
}
// Конец 3 задания

// 4 Задание
class FourthTask {
  List<String> list;
  FourthTask(this.list);
  Map<String, int> countIn() {
    Map<String, int> map = {};
    for (int i = 0; i < list.length; i++) {
      int? y = map[list[i]];
      y == null ? y = 1 : y += 1;
      map[list[i]] = y;
    }
    return map;
  }
}
// Конец 4 задания

// 5 Задание
class FifthTask {
  Set<int> returnCount(List<String> list) {
    Set<int> setToReturn = {};
    for (String s in list) {
      switch (s) {
        case 'one':
          {
            setToReturn.add(1);
            break;
          }
        case 'two':
          {
            setToReturn.add(2);
            break;
          }
        case 'three':
          {
            setToReturn.add(3);
            break;
          }
        case 'four':
          {
            setToReturn.add(4);
            break;
          }
        case 'five':
          {
            setToReturn.add(5);
            break;
          }
        case 'six':
          {
            setToReturn.add(6);
            break;
          }
        case 'seven':
          {
            setToReturn.add(7);
            break;
          }
        case 'eight':
          {
            setToReturn.add(8);
            break;
          }
        case 'nine':
          {
            setToReturn.add(9);
            break;
          }
        case 'zero':
          {
            setToReturn.add(0);
            break;
          }
      }
    }

    return setToReturn;
  }
}
// Конец 5 задания

// 6 Заданиe
class Point {
  int x, y, z;
  Point(this.x, this.y, this.z);
  double distanceTo(Point point) {
    double distance;
    distance = sqrt(
        pow((x - point.x), 2) + pow((y - point.y), 2) + pow((z - point.z), 2));
    return distance;
  }

  double square(Point point1, Point point2, Point point3) {
    double sq, a1, a2, a3, p;
    a1 = point1.distanceTo(point2);
    a2 = point1.distanceTo(point3);
    a3 = point2.distanceTo(point3);
    p = (a1 + a2 + a3) / 2;
    sq = sqrt(p * (p - a1) * (p - a2) * (p - a3));

    return sq;
  }
}
// Конец 6 задания

// 7 Заданиe
extension SqPow on num {
  num pow(num n) {
    num res = 1;
    for (int i = 0; i < n; i++) {
      res *= this;
    }
    return res;
  }

  num sqPow(num p) {
    if (this < 0) {
      throw ArgumentError("Уээээээ давай число больше 0");
    }
    num eps = 0.00001;
    num xPrev = 1;
    num xNext = ((p - 1) * xPrev + this / xPrev.pow(p - 1)) / p;
    while ((xNext - xPrev).abs() > eps) {
      xPrev = xNext;
      xNext = ((p - 1) * xPrev + this / xPrev.pow(p - 1)) / p;
    }
    return xNext;
  }
}
// Конец 7 задания

// 8 Заданиe
class User {
  String email = "";
  User(this.email);
}

class AdminUser extends User with MixForUser {
  AdminUser(String em) : super(em);
  @override
  String toString() => getMailSystem();
}

class GeneralUser extends User {
  GeneralUser(String em) : super(em);
  @override
  String toString() => email;
}

mixin MixForUser on User {
  String getMailSystem() {
    String emailSys = "";
    int i = 0;
    while (email[i] != '@') {
      i++;
    }
    i++;
    for (int j = i; j < email.length; j++) {
      emailSys += email[j];
    }
    return emailSys;
  }
}

class UserManager<T extends User> {
  List<T> listOfUsers = [];
  void newUser(T user) {
    listOfUsers.add(user);
  }

  void deleteUser(T user) {
    for (T us in listOfUsers) {
      us.email == user.email ? listOfUsers.remove(us) : 0;
    }
  }

  void printAll() {
    for (T us in listOfUsers) {
      print(us.toString());
    }
  }
}
// Конец 8 задания


// 9 Заданиe


// Конец 9 задания


// 10 Заданиe


// Конец 10 задания