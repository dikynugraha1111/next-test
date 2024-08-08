import 'dart:convert';

class CreateResponse {
  final String? name;
  final String? job;
  final String? id;
  final DateTime? createdAt;

  CreateResponse({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  factory CreateResponse.fromJson(String str) =>
      CreateResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateResponse.fromMap(Map<String, dynamic> json) => CreateResponse(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
      };
}
