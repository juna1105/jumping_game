import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jumping_game/src/provider/question_manager.dart';
import 'package:provider/provider.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionManager>(
      builder: (context, value, child) => Container(
        color: Colors.white,
        child: Column(
          children: [
            const Text('문제'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < value.questionOrder.length; i++)
                    Row(
                      children: [
                        AnswerBox(
                          order: i,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    super.key,
    required this.order,
  });

  final int order;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionManager>(
      builder: (context, questionManager, child) {
        return Animate(
          effects: [
            questionManager.effectOrder[order],
          ],
          child: Container(
            width: 50,
            height: 50,
            color: questionManager.colorOrder[order],
          ),
        );
      },
    );
  }
}
