import 'package:cloud_firestore/cloud_firestore.dart';

//// Embedded Maps

class Option {
  String value;
  String detail;
  bool correct;

  Option({ this.correct, this.value, this.detail });
  Option.fromMap(Map data) {
    value = data['value'];
    detail = data['detail'] ?? '';
    correct = data['correct'];
  }
}


class Question {
  String text;
  List<Option> options;
  Question({ this.options, this.text });

  Question.fromMap(Map data) {
    text = data['text'] ?? '';
    options = (data['options'] as List ?? []).map((v) => Option.fromMap(v)).toList();
  }
}

///// Database Collections

class Quiz { 
  String id;
  String title;
  String description;
  String video;
  String topic;
  List<Question> questions;

  Quiz({ this.title, this.questions, this.video, this.description, this.id, this.topic });

  factory Quiz.fromMap(Map data) {
    return Quiz(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      topic: data['topic'] ?? '',
      description: data['description'] ?? '',
      video: data['video'] ?? '',
      questions: (data['questions'] as List ?? []).map((v) => Question.fromMap(v)).toList()
    );
  }
  
}


class Topic {
  final String id;
  final String title;
  final  String description;
  final String img;
  final List<Quiz> quizzes;

  Topic({ this.id, this.title, this.description, this.img, this.quizzes });

  factory Topic.fromMap(Map data) {
    return Topic(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      img: data['img'] ?? 'default.png',
      quizzes:  (data['quizzes'] as List ?? []).map((v) => Quiz.fromMap(v)).toList(), //data['quizzes'],
    );
  }

}


class Report {
  String uid;
  int total;
  dynamic topics;

  Report({ this.uid, this.topics, this.total });

  factory Report.fromMap(Map data) {
    return Report(
      uid: data['uid'],
      total: data['total'] ?? 0,
      topics: data['topics'] ?? {},
    );
  }

}

class User {
  final String userID;
  final String fullName;
  final String email;
  final String cellphone;
  final String dni;
  final String gender;
  final String province;
  final String profilePictureURL;
  final String academic;
  final String carrera1;
  final String carrera2;

  User({
    this.userID,
    this.fullName,
    this.email,
    this.cellphone,
    this.dni,
    this.gender,
    this.province,
    this.profilePictureURL,
    this.academic,
    this.carrera1,
    this.carrera2,
  });

  Map<String, Object> toJson() {
    return {
      'userID': userID,
      'fullName': fullName,
      'email': email,
      'phone': cellphone,
      'dni': dni,
      'gender': gender,
      'province': province,
      'profilePictureURL': profilePictureURL,
      'appIdentifier': 'AditumUTPL',
      'academic': academic,
      'carrera1': carrera1,
      'carrera2': carrera2,
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
      userID: doc['userID'],
      fullName: doc['fullName'],
      email: doc['email'],
      cellphone: doc['phone'],
      dni: doc['dni'],
      gender: doc['gender'],
      province: doc['province'],
      profilePictureURL: doc['profilePictureURL'],
      academic: doc['academic'],
      carrera1: doc['carrera1'],
      carrera2: doc['carrera2'],
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}