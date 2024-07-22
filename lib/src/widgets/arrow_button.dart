import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';
import 'package:jumping_game/src/provider/question_manager.dart';
import 'package:provider/provider.dart';

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    super.key,
    required this.game,
  });
  final JumpGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ArrowButton(
              btnType: ButtonType.tl,
              game: game,
            ),
            ArrowButton(
              btnType: ButtonType.tr,
              game: game,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ArrowButton(
              btnType: ButtonType.bl,
              game: game,
            ),
            ArrowButton(
              btnType: ButtonType.br,
              game: game,
            ),
          ],
        ),
      ],
    );
  }
}

class ArrowButton extends StatefulWidget {
  const ArrowButton({
    super.key,
    required this.btnType,
    required this.game,
  });

  final ButtonType btnType;
  final JumpGame game;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  late AssetsAudioPlayer _assetsAudioPlayer;
  final bool _click = false;
  Color _getBackgroundColor(ButtonType btnType) {
    switch (btnType) {
      case ButtonType.tl:
        return Colors.red;
      case ButtonType.tr:
        return Colors.blue;
      case ButtonType.bl:
        return Colors.green;
      case ButtonType.br:
        return Colors.yellow;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    super.initState();
  }

  void playSound(ReactType reactType) {
    String audioName = '';
    switch (reactType) {
      case ReactType.good:
        audioName = 'good';
      case ReactType.bad:
        audioName = 'blip';
      case ReactType.jump:
        audioName = 'jump';
    }
    String url = 'assets/audios/$audioName.mp3';
    _assetsAudioPlayer.open(Audio(url));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionManager>(
      builder: (context, questionManager, child) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(
              side: BorderSide(
            color: Colors.black,
            width: 2,
          )),
          backgroundColor: _getBackgroundColor(widget.btnType),
          minimumSize: const Size(
            80,
            80,
          ),
        ),
        onPressed: () {
          ReactType refresh = questionManager.checkCorrectAnswer(
              widget.btnType, questionManager.count);
          switch (refresh) {
            case ReactType.good:
              playSound(refresh);
            case ReactType.bad:
              playSound(refresh);
            case ReactType.jump:
              playSound(refresh);
              widget.game.player.jump();
          }
        },
        child: Text(
          widget.btnType.toString(),
        ),
      ),
    );
  }
}
