import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/controller/tile_controller.dart';

class RoundTrackWidget extends ConsumerWidget {
  const RoundTrackWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(tileProvider);
    final round = provider.round.isEven ? 'X' : 'O';
    return Text.rich(
      TextSpan(text: 'Next Turn: ', children: [
        TextSpan(
          text: round,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ]),
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
