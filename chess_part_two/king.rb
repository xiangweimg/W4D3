require_relative "piece.rb"

class King < Piece
    include Steppable

    def initialize(color, board, pos)
        super
        @symbol = :king
    end

    def to_s
        @color == :black ? "♕" : "♛"
    end

    def move_diffs
        [
            [0, -1],
            [-1, -1],
            [-1, 0],
            [-1, 1],
            [0, 1],
            [1, 1],
            [1, 0],
            [1, -1]
        ]
    end
end