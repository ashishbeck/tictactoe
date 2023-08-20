import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/controller/tile_controller.dart';
import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/widgets/background.dart';
import 'package:tictactoe/widgets/round.dart';
import 'package:tictactoe/widgets/score.dart';
import 'package:tictactoe/widgets/tile.dart';

class BoardPage extends ConsumerStatefulWidget {
  const BoardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BoardPageState();
}

class _BoardPageState extends ConsumerState<BoardPage> {
  void initTiles() {
    ref.read(tileProvider).initTiles();
  }

  void showRoundEnd(BuildContext context, String player) {
    final dialog = AlertDialog(
      title: const Center(child: Text('Congratulations!')),
      content: Text.rich(
        TextSpan(text: 'Player ', children: [
          TextSpan(
            text: player,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const TextSpan(text: ' is the winner'),
        ]),
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(tileProvider).resetTiles();
              },
              child: const Text('Restart')),
        )
      ],
    );
    Future<void>.delayed(const Duration(milliseconds: 200), () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (contex) => dialog,
      );
    });
  }

  void showRoundDraw(BuildContext context) {
    final dialog = AlertDialog(
      title: const Center(child: Text('Draw!')),
      content: Text(
        'The match is a draw.',
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(tileProvider).resetTiles();
              },
              child: const Text('Restart')),
        )
      ],
    );
    Future<void>.delayed(const Duration(milliseconds: 200), () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (contex) => dialog,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initTiles();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(tileProvider);
    final winner = provider.winner;
    final round = provider.round;
    if (winner != null) showRoundEnd(context, winner);
    print('winner = $winner || round = $round');
    if (winner == null && round == (gridSize * gridSize)) {
      showRoundDraw(context);
    }
    // ref.listen(tileProvider, (previous, next) {
    //   // print(previous?.winner);
    //   // print(next.winner);
    //   if (next.winner != null) {
    //     print('${next.winner} is the winner');
    //   }
    // });
    final size = MediaQuery.of(context).size;
    final width = size.width;
    // final height = size.height;
    const tilesNumber = gridSize * gridSize;
    const tilePad = 0.95;
    return Scaffold(
      backgroundColor: TictactoeColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: width, maxWidth: width),
                child: Stack(
                  children: [
                    BackgroundWidget(
                      size: Size(width, width),
                    ),
                    for (var i = 0; i < tilesNumber; i++)
                      TileWidget(
                        tile: provider.tiles[i],
                        index: i,
                        size: Size(width / 3 * tilePad, width / 3 * tilePad),
                      )
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.85),
              child: RoundTrackWidget(),
            ),
            const Align(
              alignment: Alignment(0, 0.85),
              child: ScoreWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
