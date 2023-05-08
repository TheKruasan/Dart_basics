import 'package:flutter/material.dart';

class Img {
  final String id;
  final String image;
  final String desc;
  Img({
    required this.id,
    required this.desc,
    required this.image,
  });
}

final List<Img> images = [
  Img(
    id: '1234567890',
    image: 'assets/images/2.jpg',
    desc: "first",
  ),
  Img(
    id: '1222322234567890',
    image: 'assets/images/1.png',
    desc: "Dwayne Jonson",
  ),
  Img(
    id: '123432525390',
    image: 'assets/images/3.jpg',
    desc: "third",
  ),
  Img(
    id: '123455665550',
    image: 'assets/images/4.jpg',
    desc: "fourth",
  ),
  Img(
    id: '66666666666666',
    image: 'assets/images/5.jpg',
    desc: "fifth",
  ),
  Img(
    id: '12342323232323',
    image: 'assets/images/6.jpg',
    desc: "sixth",
  ),
  Img(
    id: '11221134567890',
    image: 'assets/images/10.jpg',
    desc: "seventh",
  ),
];
