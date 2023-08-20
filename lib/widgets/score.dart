import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/controller/tile_controller.dart';

class ScoreWidget extends ConsumerWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(tileProvider);
    final xScore = provider.score['X'];
    final oScore = provider.score['O'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(text: 'X: ', children: [
            TextSpan(
              text: xScore.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const TextSpan(text: '   O: '),
            TextSpan(
              text: oScore.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ]),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
