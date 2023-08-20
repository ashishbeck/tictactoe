import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/controller/tile_controller.dart';
import 'package:tictactoe/model/tile.dart';

class TileWidget extends ConsumerStatefulWidget {
  const TileWidget({
    super.key,
    required this.tile,
    required this.index,
    required this.size,
  });
  final TileModel tile;
  final int index;
  final Size size;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends ConsumerState<TileWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(tileProvider);
    final tile = provider.tiles[widget.index];
    return GestureDetector(
      onTap: () {
        if (!tile.isEmpty) return;
        provider.toggleTile(widget.index);
      },
      child: Container(
        alignment: widget.tile.alignment,
        child: Container(
          width: widget.size.width,
          height: widget.size.height,
          color: TictactoeColors.white,
          child: Center(
            child: Text(
              tile.isEmpty
                  ? ''
                  : tile.isCross
                      ? 'X'
                      : 'O',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 64),
            ),
          ),
        ),
      ),
    );
  }
}
