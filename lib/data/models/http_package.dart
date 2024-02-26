// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HttpPackage {
  final String name;
  final String latestVersion;
  final String description;
  final String publisher;
  final String repository;

  HttpPackage({
    required this.name,
    required this.latestVersion,
    required this.description,
    required this.publisher,
    required this.repository,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'latestVersion': latestVersion,
      'description': description,
      'publisher': publisher,
      'repository': repository,
    };
  }

  factory HttpPackage.fromMap(Map<String, dynamic> map) {
    return HttpPackage(
      name: map['name'] as String,
      latestVersion: map['latestVersion'] as String,
      description: map['description'] as String,
      publisher: map['publisher'] as String,
      repository: map['repository'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HttpPackage.fromJson(String source) =>
      HttpPackage.fromMap(json.decode(source) as Map<String, dynamic>);
}
