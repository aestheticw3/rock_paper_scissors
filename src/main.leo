program rockpaperscissors.aleo {

    // Players shapes
    struct Game {
        p1s: u8,
        p2s: u8,
        winner: u8
    }

     transition new() -> Game {
        return Game {p1s: 0u8, p2s: 0u8, winner: 0u8};
    }

    function check_for_win(g: Game, p: u8) -> u8 {
            if ((g.p1s == 1u8 && g.p2s == 3u8) ||
            (g.p1s == 2u8 && g.p2s == 1u8) ||
            (g.p1s == 3u8 && g.p2s == 2u8)) {
                return 1u8;
            }
            if ((g.p1s == 3u8 && g.p2s == 1u8) ||
            (g.p1s == 1u8 && g.p2s == 2u8) ||
            (g.p1s == 2u8 && g.p2s == 3u8)) {
                return 2u8;
            }
            return 3u8;
    }

    transition choose_shape (player: u8, shape: u8, game: Game) -> Game {
        assert(player == 1u8 || player == 2u8);
        assert(1u8 <= shape && shape <= 3u8);
        assert(game.p1s == 0u8 || game.p2s == 0u8);

        if (player == 1u8) {
            return Game {p1s: shape, p2s: 0u8, winner: 0u8};
        }

        if (player == 2u8) {
            return Game {p1s: 0u8, p2s: shape, winner: 0u8};
        }

        return game;
    }

    // transition make_move(player: u8, row: u8, col: u8, board: Board) -> (Board, u8) {
    //     // Check that inputs are valid.
    //     assert(player == 1u8 || player == 2u8);
    //     assert(1u8 <= row && row <= 3u8);
    //     assert(1u8 <= col && col <= 3u8);

    //     // Unpack the entries in the board into variables.
    //     let r1c1: u8 = board.r1.c1;
    //     let r1c2: u8 = board.r1.c2;
    //     let r1c3: u8 = board.r1.c3;
    //     let r2c1: u8 = board.r2.c1;
    //     let r2c2: u8 = board.r2.c2;
    //     let r2c3: u8 = board.r2.c3;
    //     let r3c1: u8 = board.r3.c1;
    //     let r3c2: u8 = board.r3.c2;
    //     let r3c3: u8 = board.r3.c3;

    //     // Update the appropriate entry with the given move.
    //     if row == 1u8 && col == 1u8 && r1c1 == 0u8 {
    //         r1c1 = player;
    //     } else if row == 1u8 && col == 2u8 && r1c2 == 0u8 {
    //         r1c2 = player;
    //     } else if row == 1u8 && col == 3u8 && r1c3 == 0u8 {
    //         r1c3 = player;
    //     } else if row == 2u8 && col == 1u8 && r2c1 == 0u8 {
    //         r2c1 = player;
    //     } else if row == 2u8 && col == 2u8 && r2c2 == 0u8 {
    //         r2c2 = player;
    //     } else if row == 2u8 && col == 3u8 && r2c3 == 0u8 {
    //         r2c3 = player;
    //     } else if row == 3u8 && col == 1u8 && r3c1 == 0u8 {
    //         r3c1 = player;
    //     } else if row == 3u8 && col == 2u8 && r3c2 == 0u8 {
    //         r3c2 = player;
    //     } else if row == 3u8 && col == 3u8 && r3c3 == 0u8 {
    //         r3c3 = player;
    //     }

    //     // Construct the updated game board.
    //     let updated: Board = Board {
    //         r1: Row { c1: r1c1, c2: r1c2, c3: r1c3 },
    //         r2: Row { c1: r2c1, c2: r2c2, c3: r2c3 },
    //         r3: Row { c1: r3c1, c2: r2c2, c3: r2c3 },
    //     };

    //     // Check if the game is over.
    //     if check_for_win(updated, 1u8) {
    //         return (updated, 1u8);
    //     } else if check_for_win(updated, 2u8) {
    //         return (updated, 2u8);
    //     } else {
    //         return (updated, 0u8);
    //     }
    // }
}
