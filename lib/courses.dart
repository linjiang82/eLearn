import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer';

Future<Course> fetchCourses() async {
  final res =
      await http.get('https://gentle-crag-48339.herokuapp.com/api/users');
  log(res.body.toString());
}

class Lesson {
  final String title;
  final String content;
  final String resourceUrl;
  Lesson({this.title, this.content, this.resourceUrl})
      : assert(title != null, 'Title is empty'),
        assert(resourceUrl != null, 'Url is empty'),
        assert(content != null, 'Content is empty');
}

class Course {
  final String name;
  final String description;
  final StringBuffer image;
  final String category;
  final bool published;
  final ObjectId instructor;
  final DateTime created;
  final DateTime updated;
  final List<Lesson> lessons;
  Course(
      {this.name,
      this.description,
      this.image,
      this.category,
      this.published,
      this.instructor,
      this.lessons,
      this.updated,
      this.created})
      : assert(name != null, 'Name is empty'),
        assert(category != null, 'Category is empty'),
        assert(instructor != null, 'Instructor is empty');

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        category: json['category'],
        published: json['published'],
        instructor: json['instructor'],
        created: json['created'],
        updated: json['updated'],
        lessons: json['lessons']);
  }
}
