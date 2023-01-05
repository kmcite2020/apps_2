// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
Future<Box> getBox(GetBoxRef ref, String name) async {
  return Hive.openBox(name);
}

@riverpod
List<Question> getQuestions(GetQuestionsRef ref, database) {
  return [];
}

@riverpod
class Question extends Equatable {
  final String questionName;
  final QuestionType questionType;
  final List<String> incorrectOptions;
  final String correctOption;
  const Question({
    required this.questionName,
    required this.questionType,
    required this.incorrectOptions,
    required this.correctOption,
  });

  @override
  List<Object> get props => [questionName, questionType, incorrectOptions, correctOption];
}

enum QuestionType {
  orbit();

  const QuestionType();
}
