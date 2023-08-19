import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  final DateTime dueDate;
  final String description;
  final String id;
  final bool status;

  Tasks(
      {required this.title,
      required this.dueDate,
      required this.description,
      required this.id,
      required this.status});

  Tasks copyWith(
      {String? title,
      DateTime? dueDate,
      String? description,
      String? id,
      bool? status}) {
    return Tasks(
        title: title ?? this.title,
        dueDate: dueDate ?? this.dueDate,
        description: description ?? this.description,
        id: id ?? this.id,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props =>
      [title, dueDate, description, id, status];
}
