import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/model/tile.dart';

class TileNotifier extends ChangeNotifier {
  TileNotifier();

  List<TileModel> _tiles = [];
  List<TileModel> get tiles => _tiles;

  List<List<String>> _board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  List<List<String>> get board => _board;

  int _round = 0;
  int get round => _round;

  String? _winner;
  String? get winner => _winner;

  final Map<String, int> _score = {
    'X': 0,
    'O': 0,
  };
  Map<String, int> get score => _score;

  void initTiles() {
    _tiles = List.generate(gridSize * gridSize, (index) {
      final row = (index / gridSize).floor();
      final column = index % gridSize;
      final alignment = Alignment(row - 1, column - 1);
      return TileModel(isEmpty: true, isCross: false, alignment: alignment);
    });
    // notifyListeners();
  }

  void toggleTile(int index) {
    _round++;
    final tile = _tiles[index]
      ..isEmpty = false
      ..isCross = _round.isOdd;
    final alignment = tile.alignment;
    final row = (alignment.x + 1).toInt();
    final col = (alignment.y + 1).toInt();
    _board[row][col] = tile.isCross ? 'X' : 'O';
    checkWin(index, _board[row][col]);
    notifyListeners();
  }

  void resetTiles() {
    initTiles();
    _board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    _winner = null;
    _round = 0;
    notifyListeners();
  }

  void checkWin(int index, String player) {
    if (checkWinLogic(board, player)) {
      _winner = player;
      _score[player] = _score[player]! + 1;
    }
    notifyListeners();
  }

  bool checkWinLogic(List<List<String>> board, String player) {
    // Check rows
    for (var row = 0; row < 3; row++) {
      if (board[row][0] == player &&
          board[row][1] == player &&
          board[row][2] == player) {
        return true;
      }
    }

    // Check columns
    for (var col = 0; col < 3; col++) {
      if (board[0][col] == player &&
          board[1][col] == player &&
          board[2][col] == player) {
        return true;
      }
    }

    // Check diagonals
    if (board[0][0] == player &&
        board[1][1] == player &&
        board[2][2] == player) {
      return true;
    }
    if (board[0][2] == player &&
        board[1][1] == player &&
        board[2][0] == player) {
      return true;
    }

    return false;
  }
}

final tileProvider = ChangeNotifierProvider<TileNotifier>((ref) {
  return TileNotifier();
});
