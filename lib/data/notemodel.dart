import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'notemodel.g.dart';
@HiveType(typeId: 0)
class Notemodel extends HiveObject {
  @HiveField(0)
   String Title;
  @HiveField(1)
   String SubTitle;
  @HiveField(2)
  final String Date;
  @HiveField(3)
  int? color;

  Notemodel({
    required this.Title,
    required this.SubTitle,
    required this.Date,
    required this.color,
  });
}
