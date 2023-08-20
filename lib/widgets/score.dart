import 'package:app_ui/app_ui.dart';
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
    return Container(
      decoration: const BoxDecoration(color: TictactoeColors.black54),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(text: 'X: ', children: [
              TextSpan(
                text: xScore.toString(),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: TictactoeColors.white),
              ),
              // const VerticalDivider(),
              const TextSpan(text: '    O: '),
              TextSpan(
                text: oScore.toString(),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: TictactoeColors.white),
              ),
            ]),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: TictactoeColors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
