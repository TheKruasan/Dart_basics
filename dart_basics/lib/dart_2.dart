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
class Integral {
  num n;
  num x1, x2;
  Function(num) f;
  Integral(this.f, this.x1, this.x2, this.n);

  num doIntegral() {
    num sum = 0;
    final num h = (x2 - x1) / n;

    while (x1 < x2) {
      sum += f(x1) * h;
      x1 += h;
    }
    return sum;
  }
}

// Конец 9 задания

// 10 Заданиe
class LinUr {
  LinUr();
  void LinearU(List<List<num>> list1) {
    void swap(List<List<num>> list, int a, int b) {
      num c;
      for (int i = 0; i < list[0].length; i++) {
        c = list[a][i];
        list[a][i] = list[b][i];
        list[b][i] = c;
      }
    }

    list1.sort(((a, b) => b[0].compareTo(a[0])));

    for (int i = 0; i < list1.length - 1; i++) {
      num flag = 0;
      if (list1[i][i] == 0) {
        for (int l = i + 1; l < list1.length; l++);
        int l = i + 1;
        while (list1[l][i] == 0 && l < list1.length) {
          l++;
        }
        list1[l][i] != 0 ? swap(list1, l, i) : flag++;
      }
      if (flag == 0) {
        for (int j = i + 1; j < list1.length; j++) {
          num k;

          k = list1[j][i] / list1[i][i];
          for (int y = 0; y < list1[0].length; y++) {
            list1[j][y] = list1[j][y] - k * list1[i][y];
            num t = list1[j][y];
            String s = t.toStringAsFixed(1);
            t = double.parse(s);
            t == -0 ? t = 0 : 0;
            list1[j][y] = t;
          }
        }
      }
    }
    List<num> list = [];
    for (int i = list1.length - 1; i >= 0; i--) {
      num l = list1.length - i;
      num ans = list1[i][list1.length];
      num delitel;
      int j = list1[i].length - 2;
      int k = 0;
      while (l != 1) {
        l--;
        ans -= list1[i][j] * list[k];
        k++;
        j--;
      }
      delitel = list1[i][j];
      if (delitel == 0) {
        print("No answers");
      }
      ans = ans / delitel;

      num t = ans;
      String s = t.toStringAsFixed(1);
      t = double.parse(s);
      t == -0 ? t = 0 : 0;
      ans = t;

      list.add(ans);
    }
    for (int i = 0; i < list1.length; i++) {
      print(list1[i]);
    }
    print(list);
  }
}
//  [1, 2, 4, 5, 1],
//  [0, 8, 9, 3, 2],
//  [1, 2, 4, 5, 3],
//  [7, 3, 1, 2, 4]



// [7, 3, 1, 2, 4]
// [1, 2, 4, 5, 1],
// [1, 2, 4, 5, 3],
// [0, 8, 9, 3, 2],
// Конец 10 задания